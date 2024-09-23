uint64_t sub_23BFCE8CC(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v42;
  unint64_t v43;
  uint64_t (*v44)(unint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unsigned int v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if ((_DWORD)v10)
    v11 = v10 - 1;
  else
    v11 = 0;
  if (v8 <= v11)
    v12 = v11;
  else
    v12 = *(_DWORD *)(v7 + 84);
  v13 = a3[4];
  v14 = a3[5];
  v15 = *(_QWORD *)(v13 - 8);
  v16 = *(unsigned int *)(v15 + 84);
  if ((_DWORD)v16)
    v17 = v16 - 1;
  else
    v17 = 0;
  if (v12 <= v17)
    v18 = v17;
  else
    v18 = v12;
  v19 = *(_QWORD *)(v14 - 8);
  v20 = *(unsigned int *)(v19 + 84);
  if ((_DWORD)v20)
    v21 = v20 - 1;
  else
    v21 = 0;
  if (v18 <= v21)
    v22 = v21;
  else
    v22 = v18;
  v23 = a3[6];
  v24 = *(_QWORD *)(v23 - 8);
  if (v22 <= *(_DWORD *)(v24 + 84))
    v25 = *(_DWORD *)(v24 + 84);
  else
    v25 = v22;
  if (v25 <= 0x7FFFFFFE)
    v26 = 2147483646;
  else
    v26 = v25;
  v27 = *(_QWORD *)(v9 + 64);
  if (!(_DWORD)v10)
    ++v27;
  if ((_DWORD)v16)
    v28 = *(_QWORD *)(v15 + 64);
  else
    v28 = *(_QWORD *)(v15 + 64) + 1;
  v29 = *(_QWORD *)(v19 + 64);
  if (!(_DWORD)v20)
    ++v29;
  if (!a2)
    return 0;
  v51 = v5;
  v30 = *(unsigned __int8 *)(v7 + 80);
  v31 = *(unsigned __int8 *)(v9 + 80);
  v32 = *(unsigned __int8 *)(v15 + 80);
  v52 = v27 + v32;
  v53 = *(_QWORD *)(v7 + 64);
  v33 = *(unsigned __int8 *)(v19 + 80);
  v34 = v28 + v33;
  v35 = *(unsigned __int8 *)(v24 + 80);
  if (v26 < a2)
  {
    if (((((*(_QWORD *)(v24 + 64)
           + ((v29 + v35 + ((v34 + ((v52 + ((v53 + v31 + ((v30 + 320) & ~v30)) & ~v31)) & ~v32)) & ~v33)) & ~v35)
           + 31) & 0xFFFFFFFFFFFFFFF8)
         + 24) & 0xFFFFFFF8) != 0)
      v36 = 2;
    else
      v36 = a2 - v26 + 1;
    if (v36 >= 0x10000)
      v37 = 4;
    else
      v37 = 2;
    if (v36 < 0x100)
      v37 = 1;
    if (v36 >= 2)
      v38 = v37;
    else
      v38 = 0;
    __asm { BR              X16 }
  }
  v39 = a1 & 0xFFFFFFFFFFFFFFF8;
  if (v25 > 0x7FFFFFFE)
  {
    v42 = v29 + v35;
    v43 = (((((v39 + 263) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + v30 + 32) & ~v30;
    if (v8 == v26)
    {
      v44 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48);
      v45 = *(unsigned int *)(v7 + 84);
      v46 = v6;
      return v44(v43, v45, v46);
    }
    v47 = (v43 + v53 + v31) & ~v31;
    if (v11 == v26)
    {
      if (v10 >= 2)
      {
        v48 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v47, v10, v51);
        goto LABEL_66;
      }
      return 0;
    }
    v49 = (v52 + v47) & ~v32;
    if (v17 == v26)
    {
      if (v16 < 2)
        return 0;
      v48 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v15 + 48))(v49, v16, v13);
    }
    else
    {
      v50 = (v34 + v49) & ~v33;
      if (v21 != v26)
      {
        v43 = (v42 + v50) & ~v35;
        v44 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v24 + 48);
        v45 = *(unsigned int *)(v24 + 84);
        v46 = v23;
        return v44(v43, v45, v46);
      }
      if (v20 < 2)
        return 0;
      v48 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v19 + 48))(v50, v20, v14);
    }
LABEL_66:
    if (v48 >= 2)
      return v48 - 1;
    else
      return 0;
  }
  v40 = *(_QWORD *)(v39 + 248);
  if (v40 >= 0xFFFFFFFF)
    LODWORD(v40) = -1;
  if ((v40 + 1) >= 2)
    return v40;
  else
    return 0;
}

void sub_23BFCEC18(unsigned int *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  size_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;

  v5 = 0;
  v6 = *(_QWORD *)(a4[2] - 8);
  v7 = *(_QWORD *)(a4[3] - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (*(_DWORD *)(v6 + 84) <= v9)
    v10 = v9;
  else
    v10 = *(_DWORD *)(v6 + 84);
  v11 = *(_QWORD *)(a4[4] - 8);
  v12 = *(_DWORD *)(v11 + 84);
  if (v12)
    v13 = v12 - 1;
  else
    v13 = 0;
  if (v10 <= v13)
    v10 = v13;
  v14 = *(_QWORD *)(a4[5] - 8);
  v15 = *(_DWORD *)(v14 + 84);
  if (v15)
    v16 = v15 - 1;
  else
    v16 = 0;
  if (v10 <= v16)
    v10 = v16;
  v17 = *(_QWORD *)(a4[6] - 8);
  if (v10 <= *(_DWORD *)(v17 + 84))
    v18 = *(_DWORD *)(v17 + 84);
  else
    v18 = v10;
  if (v18 <= 0x7FFFFFFE)
    v19 = 2147483646;
  else
    v19 = v18;
  v20 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v20;
  if (v12)
    v21 = *(_QWORD *)(v11 + 64);
  else
    v21 = *(_QWORD *)(v11 + 64) + 1;
  v22 = (v21
       + *(unsigned __int8 *)(v14 + 80)
       + ((v20
         + *(unsigned __int8 *)(v11 + 80)
         + ((*(_QWORD *)(v6 + 64)
           + *(unsigned __int8 *)(v7 + 80)
           + ((*(unsigned __int8 *)(v6 + 80) + 320) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v23 = *(_QWORD *)(v14 + 64);
  if (!v15)
    ++v23;
  v24 = ((*(_QWORD *)(v17 + 64)
        + ((v23 + *(unsigned __int8 *)(v17 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))
        + 31) & 0xFFFFFFFFFFFFFFF8)
      + 24;
  if (v19 < a3)
  {
    v25 = a3 - v19;
    if ((_DWORD)v24)
      v26 = 2;
    else
      v26 = v25 + 1;
    if (v26 >= 0x10000)
      v5 = 4;
    else
      v5 = 2;
    if (v26 < 0x100)
      v5 = 1;
    if (v26 < 2)
      v5 = 0;
  }
  if (a2 > v19)
  {
    if ((_DWORD)v24)
    {
      v27 = ~v19 + a2;
      bzero(a1, v24);
      *a1 = v27;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X19 }
}

unint64_t sub_23BFCEE1C@<X0>(unint64_t result@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _OWORD *v26;
  uint64_t (*v27)(unint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  *(_BYTE *)(v11 + v17) = 0;
  if (a2)
  {
    v25 = v11 & 0xFFFFFFFFFFFFFFF8;
    if (result > 0x7FFFFFFE)
    {
      result = (((((v25 + 263) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + v9 + 32) & v15;
      if (v13 == v21)
      {
        v27 = *(uint64_t (**)(unint64_t))(a7 + 56);
      }
      else
      {
        result = (result + v23 + v22) & v30;
        if (v18 == v21)
        {
          if (a3 < 2)
            return result;
          v27 = *(uint64_t (**)(unint64_t))(v16 + 56);
        }
        else
        {
          result = (v24 + result) & v14;
          if (v20 == v21)
          {
            if (v12 < 2)
              return result;
            v27 = *(uint64_t (**)(unint64_t))(a6 + 56);
          }
          else
          {
            result = (a4 + result) & v29;
            if (v19 == v21)
            {
              if (v10 < 2)
                return result;
              v27 = *(uint64_t (**)(unint64_t))(a5 + 56);
            }
            else
            {
              result = (a9 + result) & v28;
              v27 = *(uint64_t (**)(unint64_t))(a8 + 56);
            }
          }
        }
      }
      return v27(result);
    }
    v26 = (_OWORD *)(v25 + 224);
    if (a2 > 0x7FFFFFFE)
    {
      *v26 = 0u;
      *(_OWORD *)(v25 + 240) = 0u;
      *(_DWORD *)v26 = a2 - 0x7FFFFFFF;
    }
    else
    {
      *(_QWORD *)(v25 + 248) = a2;
    }
  }
  return result;
}

void type metadata accessor for FullWidthStageView()
{
  JUMPOUT(0x2426150F0);
}

unint64_t sub_23BFCEFB4()
{
  unint64_t result;

  result = qword_256AE84A0;
  if (!qword_256AE84A0)
  {
    result = MEMORY[0x242615198](&unk_23C007740, &type metadata for FullWidthStageViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE84A0);
  }
  return result;
}

unint64_t sub_23BFCEFFC()
{
  unint64_t result;

  result = qword_256AE84A8;
  if (!qword_256AE84A8)
  {
    result = MEMORY[0x242615198](&unk_23C0076B0, &type metadata for FullWidthStageViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE84A8);
  }
  return result;
}

unint64_t sub_23BFCF044()
{
  unint64_t result;

  result = qword_256AE84B0;
  if (!qword_256AE84B0)
  {
    result = MEMORY[0x242615198](&unk_23C0076D8, &type metadata for FullWidthStageViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE84B0);
  }
  return result;
}

uint64_t sub_23BFCF088()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23BFCF0CC()
{
  sub_23BFCF6D4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFC989C);
}

uint64_t sub_23BFCF0D8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void sub_23BFCF100()
{
  sub_23BFCF6D4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFCAA74);
}

void sub_23BFCF10C()
{
  type metadata accessor for FullWidthStageView();
}

uint64_t sub_23BFCF15C(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = v1
     + ((*(unsigned __int8 *)(*((_QWORD *)a1 - 1) + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)a1 - 1) + 80));
  if (*(_QWORD *)(v7 + 248))
  {
    sub_23BEA0F64(*(_QWORD *)(v7 + 224), *(_QWORD *)(v7 + 232), *(_BYTE *)(v7 + 240));
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v7 + 280))
  {
    sub_23BEA0F64(*(_QWORD *)(v7 + 256), *(_QWORD *)(v7 + 264), *(_BYTE *)(v7 + 272));
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v7 + 312))
  {
    sub_23BEA0F64(*(_QWORD *)(v7 + 288), *(_QWORD *)(v7 + 296), *(_BYTE *)(v7 + 304));
    swift_bridgeObjectRelease();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v7 + a1[29], v5);
  v8 = v7 + a1[30];
  v9 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v8, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v4);
  v10 = v7 + a1[31];
  v11 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v10, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v3);
  v12 = v7 + a1[32];
  v13 = *(_QWORD *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v12, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v2);
  (*(void (**)(uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v7 + a1[33]);
  sub_23BF1E5BC(*(_QWORD *)(v7 + a1[34]), *(_QWORD *)(v7 + a1[34] + 8), *(_BYTE *)(v7 + a1[34] + 16));
  swift_release();
  return swift_deallocObject();
}

void sub_23BFCF308()
{
  type metadata accessor for FullWidthStageView();
}

void sub_23BFCF36C()
{
  sub_23BFCC428();
}

unint64_t sub_23BFCF3D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE84D8;
  if (!qword_256AE84D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84B8);
    v2[0] = sub_23BFCF440();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE84D8);
  }
  return result;
}

unint64_t sub_23BFCF440()
{
  unint64_t result;

  result = qword_256AE84E0;
  if (!qword_256AE84E0)
  {
    result = MEMORY[0x242615198](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_256AE84E0);
  }
  return result;
}

void sub_23BFCF484()
{
  sub_23BFCF6D4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFC70BC);
}

unint64_t sub_23BFCF4A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE84F8;
  if (!qword_256AE84F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84D0);
    v2[0] = sub_23BFC4AF0((unint64_t *)&qword_256AE5970, &qword_256AE5968, (uint64_t (*)(void))sub_23BF059E0);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE84F8);
  }
  return result;
}

unint64_t sub_23BFCF524()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE8500;
  if (!qword_256AE8500)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C0);
    v2[0] = sub_23BFC4AF0(&qword_256AE8508, &qword_256AE84F0, (uint64_t (*)(void))sub_23BFCF5A8);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE8500);
  }
  return result;
}

unint64_t sub_23BFCF5A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE8510;
  if (!qword_256AE8510)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84E8);
    v2[0] = sub_23BF059E0();
    v2[1] = sub_23BEA1F94(&qword_256AE5600, &qword_256AE5608, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE8510);
  }
  return result;
}

unint64_t sub_23BFCF62C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE8518;
  if (!qword_256AE8518)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C8);
    v2[0] = sub_23BFCF4A0();
    v2[1] = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE8518);
  }
  return result;
}

void sub_23BFCF6B0()
{
  sub_23BFCF6D4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFC6580);
}

void sub_23BFCF6BC()
{
  sub_23BFCF6D4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFC7D98);
}

void sub_23BFCF6C8()
{
  sub_23BFCF6D4((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFC8408);
}

void sub_23BFCF6D4(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  a1(v1[12], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11]);
  JUMPOUT(0x23BFCF708);
}

uint64_t sub_23BFCF714(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x646150656C746974 && a2 == 0xEC000000676E6964;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xEF676E6964646150 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x506E6F6974706163 && a2 == 0xEE00676E69646461 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E694C656C746974 && a2 == 0xEE0074696D694C65 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C01EF30 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C01EF50 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x61506D6F74746F62 && a2 == 0xED0000676E696464 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x50676E696461656CLL && a2 == 0xEE00676E69646461 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6964646150706F74 && a2 == 0xEA0000000000676ELL || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023C01F500 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023C01F450 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023C01F470)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_23BFCFC88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v32;
  uint64_t v33;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  _QWORD v69[3];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v41 = *(_QWORD *)(a1 + 48);
  v1 = *(_QWORD *)(a1 + 64);
  sub_23BFF8ADC();
  v69[2] = sub_23BFF862C();
  v70 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84B8);
  v71 = v70;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C8);
  v63 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84D0);
  sub_23BFF862C();
  v64 = sub_23BFF96A0();
  swift_getTupleTypeMetadata();
  v2 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v2);
  v3 = sub_23BFF90AC();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE50D8);
  v4 = sub_23BFF862C();
  sub_23BFF8A4C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8];
  v6 = sub_23BFF862C();
  v69[0] = MEMORY[0x242615198](MEMORY[0x24BDF4700], v3);
  v69[1] = sub_23BEA1F94(&qword_256AE50D0, &qword_256AE50D8, MEMORY[0x24BDF1028]);
  v7 = MEMORY[0x24BDED308];
  v8 = MEMORY[0x242615198](MEMORY[0x24BDED308], v4, v69);
  v48 = v6;
  v49 = sub_23BEA1BB8((unint64_t *)&qword_256AE5188, v5, MEMORY[0x24BDF02F0]);
  v68[0] = v8;
  v68[1] = v49;
  v47 = MEMORY[0x242615198](v7, v6, v68);
  v61 = v6;
  v62 = v47;
  v9 = MEMORY[0x24BDF30F0];
  MEMORY[0x24261512C](255, &v61, MEMORY[0x24BDF30F0], 0);
  v44 = sub_23BFF862C();
  v46 = sub_23BFF96A0();
  v67 = v1;
  v10 = MEMORY[0x24BDF5578];
  v45 = MEMORY[0x242615198](MEMORY[0x24BDF5578], v46, &v67);
  v61 = v46;
  v62 = v45;
  MEMORY[0x24261512C](255, &v61, v9, 0);
  v43 = sub_23BFF8968();
  v61 = sub_23BFF96A0();
  v62 = MEMORY[0x24BDF4638];
  v63 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C0);
  v64 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C8);
  v65 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84D0);
  v60 = v41;
  v59[0] = sub_23BFF96A0();
  v59[1] = MEMORY[0x242615198](v10, v59[0], &v60);
  v66 = MEMORY[0x24261512C](255, v59, v9, 0);
  swift_getTupleTypeMetadata();
  v11 = sub_23BFF9220();
  v12 = MEMORY[0x24BDF5428];
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v11);
  v42 = sub_23BFF90AC();
  v13 = MEMORY[0x24BDF4700];
  v40 = MEMORY[0x242615198](MEMORY[0x24BDF4700], v42);
  v61 = v42;
  v62 = v40;
  MEMORY[0x24261512C](255, &v61, v9, 0);
  v39 = sub_23BFF862C();
  v35 = sub_23BFF862C();
  v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C0);
  v62 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84C8);
  v63 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE84D0);
  v64 = sub_23BFF862C();
  swift_getTupleTypeMetadata();
  v14 = sub_23BFF9220();
  MEMORY[0x242615198](v12, v14);
  sub_23BFF90AC();
  sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE5160);
  sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  sub_23BFF862C();
  swift_getTupleTypeMetadata2();
  v15 = sub_23BFF9220();
  MEMORY[0x242615198](v12, v15);
  v16 = sub_23BFF90AC();
  v17 = MEMORY[0x242615198](v13, v16);
  v61 = v16;
  v62 = v17;
  MEMORY[0x24261512C](255, &v61, MEMORY[0x24BDF30F0], 0);
  v18 = sub_23BFF862C();
  v19 = sub_23BFF862C();
  v36 = sub_23BFF8968();
  v37 = sub_23BFF8968();
  v20 = sub_23BFF8FD4();
  v38 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE78E8);
  v61 = v48;
  v62 = v47;
  v58[0] = swift_getOpaqueTypeConformance2();
  v58[1] = MEMORY[0x24BDECC60];
  v21 = MEMORY[0x24BDECC60];
  v22 = MEMORY[0x24BDED308];
  v23 = MEMORY[0x242615198](MEMORY[0x24BDED308], v44, v58);
  v61 = v46;
  v62 = v45;
  v57[0] = v23;
  v57[1] = swift_getOpaqueTypeConformance2();
  v24 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v43, v57);
  v61 = v42;
  v62 = v40;
  v56[0] = swift_getOpaqueTypeConformance2();
  v56[1] = v49;
  v55[0] = MEMORY[0x242615198](v22, v39, v56);
  v55[1] = v21;
  v25 = v22;
  v26 = MEMORY[0x242615198](v22, v35, v55);
  v61 = v16;
  v62 = v17;
  v54[0] = swift_getOpaqueTypeConformance2();
  v54[1] = v49;
  v53[0] = MEMORY[0x242615198](v25, v18, v54);
  v53[1] = MEMORY[0x24BDECC60];
  v52[0] = v26;
  v52[1] = MEMORY[0x242615198](v25, v19, v53);
  v27 = MEMORY[0x24BDEF3E0];
  v51[0] = v24;
  v51[1] = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v36, v52);
  v50 = MEMORY[0x242615198](v27, v37, v51);
  v28 = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v20, &v50);
  v29 = sub_23BEA1F94(&qword_256AE7918, &qword_256AE78E8, MEMORY[0x24BEE30C8]);
  v61 = v20;
  v62 = v38;
  v63 = v28;
  v64 = v29;
  v30 = MEMORY[0x24261512C](255, &v61, MEMORY[0x24BDF2800], 0);
  v61 = v20;
  v62 = v38;
  v63 = v28;
  v64 = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v61 = v30;
  v62 = OpaqueTypeConformance2;
  MEMORY[0x24261512C](255, &v61, MEMORY[0x24BDF2F10], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE54B8);
  sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE54C0);
  v72 = sub_23BFF862C();
  swift_getTupleTypeMetadata();
  v32 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v32);
  v33 = sub_23BFF90C4();
  return MEMORY[0x242615198](MEMORY[0x24BDF4750], v33);
}

unint64_t sub_23BFD04A8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE61A0);
  v2 = sub_23BFF9850();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23BF59FC0(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_23BF50330(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23BF5131C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t DynamicLayoutProvider.transform(currentLayout:updatingSizeClass:)@<X0>(uint64_t *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;

  v4 = *a1;
  v5 = *((_BYTE *)a1 + 40);
  v6 = a1[6];
  v7 = *a2;
  v8 = qword_23C0078C0[v7];
  result = sub_23BFD06D4((uint64_t)*(&off_250CF0CA8 + v7));
  *(_BYTE *)(a3 + 64) = v7;
  *(_QWORD *)a3 = v4;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = v8;
  *(_BYTE *)(a3 + 40) = v5;
  *(_QWORD *)(a3 + 48) = v6;
  *(_QWORD *)(a3 + 56) = result;
  return result;
}

uint64_t DynamicLayoutProvider.transform(currentLayout:updatingDynamicTypeSize:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(a3 + 64) = *(_BYTE *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v6;
  *(_QWORD *)(a3 + 32) = v3;
  *(_BYTE *)(a3 + 40) = a2;
  *(_QWORD *)(a3 + 48) = v4;
  *(_QWORD *)(a3 + 56) = v5;
  return swift_bridgeObjectRetain();
}

unint64_t sub_23BFD068C@<X0>(uint64_t *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  return DynamicLayoutProvider.transform(currentLayout:updatingSizeClass:)(a1, a2, a3);
}

uint64_t sub_23BFD06A0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(a3 + 64) = *(_BYTE *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v6;
  *(_QWORD *)(a3 + 32) = v3;
  *(_BYTE *)(a3 + 40) = a2;
  *(_QWORD *)(a3 + 48) = v4;
  *(_QWORD *)(a3 + 56) = v5;
  return swift_bridgeObjectRetain();
}

unint64_t sub_23BFD06D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8568);
    v3 = (_QWORD *)sub_23BFF9850();
    for (i = (_QWORD *)(a1 + 56); ; i += 4)
    {
      v5 = *((_BYTE *)i - 24);
      v6 = *(i - 2);
      v7 = *(i - 1);
      v8 = *i;
      result = sub_23BF50394(v5);
      if ((v10 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      v11 = (_QWORD *)(v3[7] + 24 * result);
      *v11 = v6;
      v11[1] = v7;
      v11[2] = v8;
      v12 = v3[2];
      v13 = __OFADD__(v12, 1);
      v14 = v12 + 1;
      if (v13)
        goto LABEL_10;
      v3[2] = v14;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_23BFD07D4()
{
  unint64_t result;

  result = qword_256AE8520;
  if (!qword_256AE8520)
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for DynamicSectionDensity, &type metadata for DynamicSectionDensity);
    atomic_store(result, (unint64_t *)&qword_256AE8520);
  }
  return result;
}

unint64_t sub_23BFD081C()
{
  unint64_t result;

  result = qword_256AE8528;
  if (!qword_256AE8528)
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for DynamicSizeClass, &type metadata for DynamicSizeClass);
    atomic_store(result, (unint64_t *)&qword_256AE8528);
  }
  return result;
}

uint64_t dispatch thunk of CanvasItemMetricsProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of CanvasItemMetricsProtocol.identifierType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of CanvasItemMetricsProtocol.impressionType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of CanvasItemMetricsProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

__n128 sub_23BFD0880@<Q0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, __n128 a12, unint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  __n128 *v33;
  __n128 result;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v23 = *((_QWORD *)a1 + 2);
  v24 = *((_QWORD *)a1 + 3);
  v38 = a1[2];
  v39 = *a1;
  v25 = *((_QWORD *)a1 + 6);
  v36 = *(__int128 *)((char *)a1 + 72);
  v37 = *(__int128 *)((char *)a1 + 56);
  v26 = *((_QWORD *)a1 + 11);
  v27 = *((_QWORD *)a1 + 12);
  *a9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE3728);
  swift_storeEnumTagMultiPayload();
  v29 = (int *)type metadata accessor for StandardCardView(0, a17, a18, v28);
  v30 = (char *)a9 + v29[9];
  *(_OWORD *)v30 = v39;
  *((_QWORD *)v30 + 2) = v23;
  *((_QWORD *)v30 + 3) = v24;
  *((_OWORD *)v30 + 2) = v38;
  *((_QWORD *)v30 + 6) = v25;
  *(_OWORD *)(v30 + 56) = v37;
  *(_OWORD *)(v30 + 72) = v36;
  *((_QWORD *)v30 + 11) = v26;
  *((_QWORD *)v30 + 12) = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a17 - 8) + 32))((char *)a9 + v29[10], a2, a17);
  v31 = (uint64_t *)((char *)a9 + v29[11]);
  *v31 = a3;
  v31[1] = a4;
  v31[2] = a5;
  v31[3] = a6;
  v32 = (uint64_t *)((char *)a9 + v29[12]);
  *v32 = a7;
  v32[1] = a8;
  v32[2] = a10;
  v32[3] = a11;
  v33 = (__n128 *)((char *)a9 + v29[13]);
  result = a12;
  *v33 = a12;
  v33[1].n128_u64[0] = a13;
  v33[1].n128_u64[1] = a14;
  v35 = (uint64_t *)((char *)a9 + v29[14]);
  *v35 = a15;
  v35[1] = a16;
  return result;
}

double static StandardCardViewLayout.default.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  double result;

  if (qword_256AE33C0 != -1)
    swift_once();
  v2 = qword_256AE85A0;
  v3 = unk_256AE8580;
  *(_OWORD *)a1 = xmmword_256AE8570;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = xmmword_256AE8590;
  *(_QWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 56) = unk_256AE85A8;
  *(_OWORD *)(a1 + 72) = unk_256AE85B8;
  result = dbl_256AE85C8[0];
  *(_OWORD *)(a1 + 88) = *(_OWORD *)dbl_256AE85C8;
  return result;
}

double StandardCardViewLayout.artworkAspectRatio.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double StandardCardViewLayout.artworkCornerRadius.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double StandardCardViewLayout.titleEdgePadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t StandardCardViewLayout.titleLineLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t StandardCardViewLayout.subtitleLineLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t StandardCardViewLayout.captionLineLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

__n128 StandardCardViewLayout.contentInsets.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 56);
  v3 = *(_OWORD *)(v1 + 72);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

double StandardCardViewLayout.titleSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double StandardCardViewLayout.subtitleSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

__n128 StandardCardViewLayout.init(artworkAspectRatio:artworkCornerRadius:titleEdgePadding:titleLineLimit:subtitleLineLimit:captionLineLimit:contentInsets:titleSpacing:subtitleSpacing:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>, double a10@<D4>, double a11@<D5>)
{
  __n128 result;
  __int128 v12;

  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(double *)(a5 + 16) = a8;
  *(double *)(a5 + 24) = a9;
  *(_QWORD *)(a5 + 32) = a1;
  *(_QWORD *)(a5 + 40) = a2;
  *(_QWORD *)(a5 + 48) = a3;
  result = *(__n128 *)a4;
  v12 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a5 + 56) = *(_OWORD *)a4;
  *(_OWORD *)(a5 + 72) = v12;
  *(double *)(a5 + 88) = a10;
  *(double *)(a5 + 96) = a11;
  return result;
}

uint64_t sub_23BFD0B24(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23BFD0B60
                                                                     + 4 * a6[a1]))(0xD000000000000012, 0x800000023C01E950);
}

uint64_t sub_23BFD0B60()
{
  uint64_t v0;

  return v0 + 3;
}

uint64_t sub_23BFD0BD4()
{
  return 0x49746E65746E6F63;
}

uint64_t sub_23BFD0BF8()
{
  return 0x617053656C746974;
}

uint64_t sub_23BFD0C18()
{
  return 0x656C746974627573;
}

uint64_t sub_23BFD0C3C()
{
  unsigned __int8 *v0;

  return sub_23BFD0B24(*v0);
}

uint64_t sub_23BFD0C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFD4E2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFD0C68()
{
  sub_23BFD30D8();
  return sub_23BFF9A30();
}

uint64_t sub_23BFD0C90()
{
  sub_23BFD30D8();
  return sub_23BFF9A3C();
}

double sub_23BFD0CB8()
{
  double result;

  xmmword_256AE8570 = xmmword_23C000A00;
  unk_256AE8580 = xmmword_23C007C80;
  *(_QWORD *)&xmmword_256AE8590 = 3;
  result = 0.0;
  *(__int128 *)((char *)&xmmword_256AE8590 + 8) = 0u;
  unk_256AE85A8 = 0u;
  unk_256AE85B8 = 0u;
  unk_256AE85C8 = 0u;
  return result;
}

uint64_t StandardCardViewLayout.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char v32;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE85D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = v1[2];
  v26 = v1[3];
  v27 = v10;
  v11 = v1[4];
  v24 = v1[5];
  v25 = v11;
  v23 = v1[6];
  v12 = v1[7];
  v13 = v1[8];
  v14 = v1[9];
  v15 = v1[10];
  v17 = v1[11];
  v16 = v1[12];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFD30D8();
  sub_23BFF9A18();
  v28 = v8;
  v29 = v9;
  v32 = 0;
  type metadata accessor for CGSize(0);
  sub_23BEA1BB8(&qword_256AE3468, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD848]);
  sub_23BFF9940();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v19 = v26;
  v21 = v15;
  v22 = v14;
  v28 = v27;
  v32 = 1;
  sub_23BEBFC1C();
  sub_23BFF9940();
  v28 = v19;
  v32 = 2;
  sub_23BFF9940();
  LOBYTE(v28) = 3;
  sub_23BFF9934();
  LOBYTE(v28) = 4;
  sub_23BFF9934();
  LOBYTE(v28) = 5;
  sub_23BFF9934();
  v28 = v12;
  v29 = v13;
  v30 = v22;
  v31 = v21;
  v32 = 6;
  sub_23BF3CBE0();
  sub_23BFF9940();
  v28 = v17;
  v32 = 7;
  sub_23BFF9940();
  v28 = v16;
  v32 = 8;
  sub_23BFF9940();
  return (*(uint64_t (**)(char *, _QWORD))(v5 + 8))(v7, 0);
}

uint64_t StandardCardViewLayout.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE85E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFD30D8();
  sub_23BFF9A0C();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    v29 = 0;
    sub_23BEA1BB8(&qword_256AE3478, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD860]);
    sub_23BFF98C8();
    v9 = v25;
    v10 = v26;
    v29 = 1;
    sub_23BEC0384();
    sub_23BFF98C8();
    v11 = v25;
    v29 = 2;
    sub_23BFF98C8();
    v12 = v25;
    LOBYTE(v25) = 3;
    v13 = sub_23BFF98BC();
    LOBYTE(v25) = 4;
    v24 = sub_23BFF98BC();
    LOBYTE(v25) = 5;
    v23 = sub_23BFF98BC();
    v29 = 6;
    sub_23BF3CC68();
    sub_23BFF98C8();
    v14 = v25;
    v15 = v26;
    v16 = v27;
    v17 = v28;
    v29 = 7;
    sub_23BFF98C8();
    v22 = v25;
    v29 = 8;
    sub_23BFF98C8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v19 = v25;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
    a2[3] = v12;
    v20 = v24;
    a2[4] = v13;
    a2[5] = v20;
    a2[6] = v23;
    a2[7] = v14;
    a2[8] = v15;
    a2[9] = v16;
    a2[10] = v17;
    a2[11] = v22;
    a2[12] = v19;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23BFD1388@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return StandardCardViewLayout.init(from:)(a1, a2);
}

uint64_t sub_23BFD139C(_QWORD *a1)
{
  return StandardCardViewLayout.encode(to:)(a1);
}

uint64_t StandardCardViewLayout.hash(into:)()
{
  sub_23BEA0B6C();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99DC();
  sub_23BFF99DC();
  sub_23BFF99DC();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  return sub_23BFF99F4();
}

uint64_t StandardCardViewLayout.hashValue.getter()
{
  sub_23BFF99D0();
  StandardCardViewLayout.hash(into:)();
  return sub_23BFF9A00();
}

uint64_t sub_23BFD150C()
{
  sub_23BFF99D0();
  StandardCardViewLayout.hash(into:)();
  return sub_23BFF9A00();
}

uint64_t sub_23BFD1584()
{
  sub_23BFF99D0();
  StandardCardViewLayout.hash(into:)();
  return sub_23BFF9A00();
}

uint64_t sub_23BFD15F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t OpaqueTypeConformance2;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[2];

  v72 = a2;
  v3 = sub_23BFF8680();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = v3;
  v56 = v3;
  v71 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = *(_QWORD *)(a1 - 8);
  v68 = *(_QWORD *)(v66 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = *(_QWORD *)(a1 + 16);
  v9 = a1;
  v63 = a1;
  v10 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  v11 = sub_23BFF862C();
  v12 = sub_23BFF8614();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED168];
  v64 = *(_QWORD *)(v9 + 24);
  v83[0] = v64;
  v83[1] = MEMORY[0x24BDEEC40];
  v14 = MEMORY[0x24BDED308];
  v15 = MEMORY[0x242615198](MEMORY[0x24BDED308], v10, v83);
  v16 = sub_23BEA1F94(qword_256AE3C30, &qword_256AE3C28, MEMORY[0x24BDEB950]);
  v82[0] = v15;
  v82[1] = v16;
  v17 = MEMORY[0x242615198](v14, v11, v82);
  v18 = sub_23BEA1BB8(&qword_256AE5088, v13, MEMORY[0x24BDED160]);
  v78 = v11;
  v79 = v12;
  v80 = v17;
  v81 = v18;
  MEMORY[0x24261512C](255, &v78, MEMORY[0x24BDF2380], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8690);
  v19 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8698);
  swift_getTupleTypeMetadata3();
  v20 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v20);
  v21 = sub_23BFF90AC();
  v22 = sub_23BFF8968();
  v78 = v11;
  v79 = v12;
  v80 = v17;
  v81 = v18;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v24 = sub_23BEA1F94(&qword_256AE86A0, &qword_256AE8690, MEMORY[0x24BDEDC10]);
  v77[0] = OpaqueTypeConformance2;
  v77[1] = v24;
  v25 = MEMORY[0x242615198](MEMORY[0x24BDED308], v19, v77);
  v26 = MEMORY[0x242615198](MEMORY[0x24BDF4700], v21);
  v76[0] = v25;
  v76[1] = v26;
  v59 = v22;
  v60 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v22, v76);
  v27 = sub_23BFF9040();
  v62 = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v58 = (char *)&v53 - v29;
  v30 = MEMORY[0x242615198](MEMORY[0x24BDF43B0], v27, v28);
  v55 = v30;
  v54 = sub_23BEA1BB8(&qword_256AE3558, (uint64_t (*)(uint64_t))MEMORY[0x24BDED868], MEMORY[0x24BDED858]);
  v78 = v27;
  v79 = v5;
  v80 = v30;
  v81 = v54;
  v31 = MEMORY[0x24261512C](0, &v78, MEMORY[0x24BDF22B8], 0);
  v61 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v53 = (char *)&v53 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v57 = (uint64_t)&v53 - v35;
  v36 = v66;
  v37 = v65;
  v38 = v69;
  v39 = v63;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v66 + 16))(v65, v69, v63, v34);
  v40 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v41 = swift_allocObject();
  v42 = v67;
  v43 = v64;
  *(_QWORD *)(v41 + 16) = v67;
  *(_QWORD *)(v41 + 24) = v43;
  (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v41 + v40, v37, v39);
  v73 = v42;
  v74 = v43;
  v75 = v38;
  v44 = v58;
  sub_23BFF9034();
  v45 = v70;
  sub_23BFF8674();
  v46 = (uint64_t)v53;
  v47 = v56;
  v48 = v55;
  v49 = v54;
  sub_23BFF8CF8();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v45, v47);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v44, v27);
  v78 = v27;
  v79 = v47;
  v80 = v48;
  v81 = v49;
  swift_getOpaqueTypeConformance2();
  v50 = v57;
  sub_23BEA72EC(v46, v31, v57);
  v51 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  v51(v46, v31);
  sub_23BEA5C0C(v50, v31, v72);
  return ((uint64_t (*)(uint64_t, uint64_t))v51)(v50, v31);
}

uint64_t sub_23BFD1BBC@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t OpaqueTypeConformance2;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char **v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[2];
  _QWORD v108[2];

  v95 = a4;
  v96 = a1;
  v87 = (char *)a2;
  v5 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  v6 = sub_23BFF862C();
  v7 = sub_23BFF8614();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED168];
  v90 = a3;
  v108[0] = a3;
  v108[1] = MEMORY[0x24BDEEC40];
  v9 = MEMORY[0x24BDED308];
  v84 = (char **)MEMORY[0x242615198](MEMORY[0x24BDED308], v5, v108);
  v107[0] = v84;
  v107[1] = sub_23BEA1F94(qword_256AE3C30, &qword_256AE3C28, MEMORY[0x24BDEB950]);
  v103 = v6;
  v104 = v7;
  v94 = MEMORY[0x242615198](v9, v6, v107);
  v105 = v94;
  v106 = sub_23BEA1BB8(&qword_256AE5088, v8, MEMORY[0x24BDED160]);
  v98 = v106;
  v10 = MEMORY[0x24261512C](255, &v103, MEMORY[0x24BDF2380], 0);
  v85 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8698);
  swift_getTupleTypeMetadata3();
  v77 = sub_23BFF9220();
  v75 = MEMORY[0x242615198](MEMORY[0x24BDF5428], v77);
  v11 = sub_23BFF90AC();
  v78 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v83 = (uint64_t)&v70 - v15;
  v92 = swift_checkMetadataState();
  v76 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v74 = (char *)&v70 - v16;
  v72 = swift_checkMetadataState();
  v71 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v18 = (char *)&v70 - v17;
  v97 = swift_checkMetadataState();
  v73 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v20 = (char *)&v70 - v19;
  v80 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v70 = (char *)&v70 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8690);
  v86 = v10;
  v23 = sub_23BFF862C();
  v81 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v79 = (char *)&v70 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v82 = (uint64_t)&v70 - v26;
  v27 = sub_23BFF85F0();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v70 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v70 - v32;
  v93 = v11;
  v34 = v96;
  v91 = sub_23BFF8968();
  v89 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v88 = (char *)&v70 - v35;
  sub_23BFCC4C4((uint64_t)v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v30, *MEMORY[0x24BDECEA0], v27);
  LOBYTE(v5) = sub_23BFF85E4();
  v36 = *(void (**)(char *, uint64_t))(v28 + 8);
  v36(v30, v27);
  v36(v33, v27);
  if ((v5 & 1) != 0)
  {
    v38 = (uint64_t)v87;
    v39 = v90;
    type metadata accessor for StandardCardView(0, (uint64_t)v87, v90, v37);
    sub_23BFF8CEC();
    v40 = v72;
    sub_23BFF8D58();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v18, v40);
    v41 = v74;
    sub_23BFF871C();
    v42 = v70;
    v43 = v97;
    v44 = v98;
    v45 = v92;
    v46 = v20;
    v47 = v94;
    sub_23BFF8D1C();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v41, v45);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v46, v43);
    v83 = sub_23BFF919C();
    v84 = &v70;
    MEMORY[0x24BDAC7A8](v83);
    *(&v70 - 4) = (char *)v38;
    *(&v70 - 3) = (char *)v39;
    v48 = v47;
    *(&v70 - 2) = v96;
    v103 = v43;
    v104 = v45;
    v105 = v47;
    v106 = v44;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23BFD4D34();
    v50 = (uint64_t)v79;
    v51 = v86;
    sub_23BFF8ECC();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v42, v51);
    v52 = sub_23BEA1F94(&qword_256AE86A0, &qword_256AE8690, MEMORY[0x24BDEDC10]);
    v99[0] = OpaqueTypeConformance2;
    v99[1] = v52;
    MEMORY[0x242615198](MEMORY[0x24BDED308], v23, v99);
    v53 = v82;
    sub_23BEA72EC(v50, v23, v82);
    v54 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
    v54(v50, v23);
    sub_23BEA5C0C(v53, v23, v50);
    v55 = v93;
    MEMORY[0x242615198](MEMORY[0x24BDF4700], v93);
    v56 = (uint64_t)v88;
    sub_23BEA5C24(v50, v23);
    v54(v50, v23);
    v54(v53, v23);
  }
  else
  {
    v57 = sub_23BFF88A8();
    MEMORY[0x24BDAC7A8](v57);
    v58 = v90;
    *(&v70 - 4) = v87;
    *(&v70 - 3) = (char *)v58;
    *(&v70 - 2) = v34;
    v59 = (uint64_t)v13;
    sub_23BFF90A0();
    v55 = v93;
    MEMORY[0x242615198](MEMORY[0x24BDF4700], v93);
    v60 = v83;
    sub_23BEA72EC((uint64_t)v13, v55, v83);
    v61 = *(void (**)(char *, uint64_t))(v78 + 8);
    v61(v13, v55);
    sub_23BEA5C0C(v60, v55, (uint64_t)v13);
    v45 = v92;
    v103 = v97;
    v104 = v92;
    v48 = v94;
    v105 = v94;
    v106 = v98;
    v62 = swift_getOpaqueTypeConformance2();
    v63 = sub_23BEA1F94(&qword_256AE86A0, &qword_256AE8690, MEMORY[0x24BDEDC10]);
    v102[0] = v62;
    v102[1] = v63;
    MEMORY[0x242615198](MEMORY[0x24BDED308], v23, v102);
    v56 = (uint64_t)v88;
    sub_23BEA5CE8(v59, v23, v55);
    v61((char *)v59, v55);
    v61((char *)v60, v55);
  }
  v103 = v97;
  v104 = v45;
  v105 = v48;
  v106 = v98;
  v64 = swift_getOpaqueTypeConformance2();
  v65 = sub_23BEA1F94(&qword_256AE86A0, &qword_256AE8690, MEMORY[0x24BDEDC10]);
  v101[0] = v64;
  v101[1] = v65;
  v66 = MEMORY[0x242615198](MEMORY[0x24BDED308], v23, v101);
  v67 = MEMORY[0x242615198](MEMORY[0x24BDF4700], v55);
  v100[0] = v66;
  v100[1] = v67;
  v68 = v91;
  MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v91, v100);
  sub_23BEA5C0C(v56, v68, v95);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v89 + 8))(v56, v68);
}

uint64_t sub_23BFD2554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE86B8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23BFF88A8();
  v10 = (_QWORD *)(v3 + *(int *)(a1 + 36));
  v11 = v10[11];
  *(_QWORD *)v8 = v9;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = 0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE86C0);
  sub_23BFD2B18(v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), (uint64_t)&v8[*(int *)(v12 + 44)]);
  v13 = v10[7];
  v14 = v10[8];
  v16 = v10[9];
  v15 = v10[10];
  LOBYTE(v3) = sub_23BFF8B60();
  sub_23BE9F190((uint64_t)v8, a2, &qword_256AE86B8);
  v17 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256AE8698) + 36);
  *(_BYTE *)v17 = v3;
  *(_QWORD *)(v17 + 8) = v16;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = v13;
  *(_QWORD *)(v17 + 32) = v15;
  *(_BYTE *)(v17 + 40) = 0;
  return sub_23BE9F3A0((uint64_t)v8, &qword_256AE86B8);
}

uint64_t sub_23BFD2658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t OpaqueTypeConformance2;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD v63[3];
  uint64_t v64;
  char v65;
  char *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[3];

  v58 = a4;
  v59 = a1;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8698);
  MEMORY[0x24BDAC7A8](v57);
  v56 = (uint64_t)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v55 = (uint64_t)&v45 - v8;
  v9 = sub_23BFF8614();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED168];
  v11 = *(_QWORD *)(v9 - 8);
  v12 = (uint64_t *)v9;
  v46 = v9;
  v54 = v11;
  MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23BFF862C();
  v51 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v45 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  v17 = sub_23BFF862C();
  v52 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v49 = (char *)&v45 - v19;
  v71[0] = a3;
  v71[1] = MEMORY[0x24BDEEC40];
  v20 = MEMORY[0x24BDED308];
  v21 = MEMORY[0x242615198](MEMORY[0x24BDED308], v14, v71, v18);
  v47 = v21;
  v22 = sub_23BEA1F94(qword_256AE3C30, &qword_256AE3C28, MEMORY[0x24BDEB950]);
  v70[0] = v21;
  v70[1] = v22;
  v23 = MEMORY[0x242615198](v20, v17, v70);
  v45 = v23;
  v24 = sub_23BEA1BB8(&qword_256AE5088, v10, MEMORY[0x24BDED160]);
  v66 = (char *)v17;
  v67 = v12;
  v68 = v23;
  v69 = v24;
  v25 = MEMORY[0x24261512C](0, &v66, MEMORY[0x24BDF2380], 0);
  v50 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v48 = (uint64_t)&v45 - v29;
  v31 = type metadata accessor for StandardCardView(0, a2, a3, v30);
  sub_23BFF8CEC();
  v32 = v49;
  sub_23BFF8D58();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v16, v14);
  v33 = v53;
  sub_23BFF871C();
  v34 = (uint64_t *)v46;
  v35 = v45;
  sub_23BFF8D1C();
  (*(void (**)(char *, uint64_t *))(v54 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v32, v17);
  v66 = (char *)v17;
  v67 = v34;
  v68 = v35;
  v69 = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v37 = v48;
  sub_23BEA72EC((uint64_t)v27, v25, v48);
  v38 = v50;
  v39 = *(void (**)(char *, uint64_t))(v50 + 8);
  v39(v27, v25);
  v40 = v55;
  sub_23BFD2554(v31, v55);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v27, v37, v25);
  v64 = 0x4014000000000000;
  v65 = 0;
  v66 = v27;
  v67 = &v64;
  v41 = v40;
  v42 = v40;
  v43 = v56;
  sub_23BE9F190(v41, v56, &qword_256AE8698);
  v68 = v43;
  v63[0] = v25;
  v63[1] = MEMORY[0x24BDF4638];
  v63[2] = v57;
  v60 = OpaqueTypeConformance2;
  v61 = MEMORY[0x24BDF4610];
  v62 = sub_23BFD4D34();
  sub_23BF93EF0((uint64_t *)&v66, 3uLL, (uint64_t)v63);
  sub_23BE9F3A0(v42, &qword_256AE8698);
  v39((char *)v37, v25);
  sub_23BE9F3A0(v43, &qword_256AE8698);
  return ((uint64_t (*)(char *, uint64_t))v39)(v27, v25);
}

uint64_t sub_23BFD2B18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t *v30;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
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
  int *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE v70[12];
  int v71;
  uint64_t v72;
  _BOOL4 v73;
  int v74;
  int *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  __int16 v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;

  v80 = a4;
  v79 = sub_23BFF8890();
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v8 = &v70[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE86C8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v70[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v82 = &v70[-v13];
  v75 = (int *)type metadata accessor for StandardCardView(0, a2, a3, v14);
  v15 = v75[11];
  v76 = a1;
  v16 = (uint64_t *)(a1 + v15);
  v17 = *v16;
  v18 = v16[1];
  v19 = v16[2];
  v20 = v16[3];
  v21 = (_QWORD *)(a1 + v75[9]);
  v22 = v21[4];
  KeyPath = swift_getKeyPath();
  sub_23BEA1DC0(v17, v18, v19, v20);
  LOBYTE(a1) = sub_23BFF8B60();
  sub_23BFF83F8();
  v83 = v17;
  v84 = v18;
  v85 = v19;
  v86 = v20;
  v87 = KeyPath;
  v88 = v22;
  v89 = 0;
  v90 = 256;
  v91 = a1;
  v92 = v24;
  v93 = v25;
  v94 = v26;
  v95 = v27;
  v96 = 0;
  sub_23BFF8884();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE86D0);
  sub_23BF47528(&qword_256AE86D8, &qword_256AE86D0, sub_23BFD4DC0, MEMORY[0x24BDECC60]);
  sub_23BFF8E3C();
  (*(void (**)(_BYTE *, uint64_t))(v78 + 8))(v8, v79);
  sub_23BEBF0A4(v83, v84, v85, v86);
  swift_release();
  v81 = v11;
  sub_23BFD4DE4((uint64_t)v11, (uint64_t)v82);
  v28 = v75;
  v29 = v76;
  v30 = (uint64_t *)(v76 + v75[12]);
  v31 = *v30;
  v32 = v30[1];
  v33 = v30[2];
  v34 = v30[3];
  v77 = v21[5];
  v79 = swift_getKeyPath();
  v35 = v31;
  v36 = v32;
  v78 = v33;
  v37 = v34;
  sub_23BEA1DC0(v31, v32, v33, v34);
  v74 = sub_23BFF8B60();
  sub_23BFF83F8();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = (uint64_t *)(v29 + v28[13]);
  v48 = *v46;
  v47 = v46[1];
  v49 = v46[2];
  v50 = v46[3];
  if (v50)
    v75 = (int *)v21[12];
  else
    v75 = 0;
  v73 = v50 == 0;
  v76 = v21[6];
  v72 = swift_getKeyPath();
  sub_23BEA1DC0(v48, v47, v49, v50);
  v71 = sub_23BFF8B60();
  sub_23BFF83F8();
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v59 = (uint64_t)v81;
  sub_23BE9F190((uint64_t)v82, (uint64_t)v81, &qword_256AE86C8);
  v60 = v59;
  v61 = v80;
  sub_23BE9F190(v60, v80, &qword_256AE86C8);
  v62 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256AE86F0);
  v63 = v61 + v62[12];
  *(_QWORD *)v63 = v35;
  *(_QWORD *)(v63 + 8) = v36;
  v64 = v78;
  *(_QWORD *)(v63 + 16) = v78;
  *(_QWORD *)(v63 + 24) = v37;
  v65 = v77;
  *(_QWORD *)(v63 + 32) = v79;
  *(_QWORD *)(v63 + 40) = v65;
  *(_BYTE *)(v63 + 48) = 0;
  *(_WORD *)(v63 + 49) = 256;
  *(_BYTE *)(v63 + 56) = v74;
  *(_QWORD *)(v63 + 64) = v39;
  *(_QWORD *)(v63 + 72) = v41;
  *(_QWORD *)(v63 + 80) = v43;
  *(_QWORD *)(v63 + 88) = v45;
  *(_BYTE *)(v63 + 96) = 0;
  v66 = v61 + v62[16];
  *(_QWORD *)v66 = v75;
  *(_BYTE *)(v66 + 8) = 0;
  *(_BYTE *)(v66 + 9) = v73;
  v67 = v61 + v62[20];
  *(_QWORD *)v67 = v48;
  *(_QWORD *)(v67 + 8) = v47;
  *(_QWORD *)(v67 + 16) = v49;
  *(_QWORD *)(v67 + 24) = v50;
  v68 = v76;
  *(_QWORD *)(v67 + 32) = v72;
  *(_QWORD *)(v67 + 40) = v68;
  *(_BYTE *)(v67 + 48) = 0;
  *(_WORD *)(v67 + 49) = 256;
  *(_BYTE *)(v67 + 56) = v71;
  *(_QWORD *)(v67 + 64) = v52;
  *(_QWORD *)(v67 + 72) = v54;
  *(_QWORD *)(v67 + 80) = v56;
  *(_QWORD *)(v67 + 88) = v58;
  *(_BYTE *)(v67 + 96) = 0;
  sub_23BEA1DC0(v35, v36, v64, v37);
  swift_retain();
  sub_23BEA1DC0(v48, v47, v49, v50);
  swift_retain();
  sub_23BE9F3A0((uint64_t)v82, &qword_256AE86C8);
  sub_23BEBF0A4(v48, v47, v49, v50);
  swift_release();
  sub_23BEBF0A4(v35, v36, v64, v37);
  swift_release();
  return sub_23BE9F3A0((uint64_t)v81, &qword_256AE86C8);
}

BOOL _s15FitnessCanvasUI22StandardCardViewLayoutV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u8((uint8x8_t)vcltz_s8(vshl_n_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8(*(int8x16_t *)a1, *(int8x16_t *)a1, 8uLL), (float64x2_t)vextq_s8(*(int8x16_t *)a2, *(int8x16_t *)a2, 8uLL)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)(a2 + 16))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 56),
                                                              *(float64x2_t *)(a2 + 56)),
                                                 (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 72), *(float64x2_t *)(a2 + 72))))), 7uLL))) & 1) != 0&& *(double *)(a1 + 88) == *(double *)(a2 + 88)&& *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)&& *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40)&& *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48))
  {
    return *(double *)(a1 + 96) == *(double *)(a2 + 96);
  }
  return result;
}

unint64_t sub_23BFD30D8()
{
  unint64_t result;

  result = qword_256AE85E0;
  if (!qword_256AE85E0)
  {
    result = MEMORY[0x242615198](&unk_23C007B80, &type metadata for StandardCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE85E0);
  }
  return result;
}

unint64_t sub_23BFD3120()
{
  unint64_t result;

  result = qword_256AE85F0[0];
  if (!qword_256AE85F0[0])
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for StandardCardViewLayout, &type metadata for StandardCardViewLayout);
    atomic_store(result, qword_256AE85F0);
  }
  return result;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for StandardCardViewLayout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 104))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StandardCardViewLayout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 104) = v3;
  return result;
}

ValueMetadata *type metadata accessor for StandardCardViewLayout()
{
  return &type metadata for StandardCardViewLayout;
}

uint64_t storeEnumTagSinglePayload for StandardCardViewLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_23BFD3250 + 4 * byte_23C00791E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23BFD3284 + 4 * byte_23C007919[v4]))();
}

uint64_t sub_23BFD3284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFD328C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFD3294);
  return result;
}

uint64_t sub_23BFD32A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFD32A8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23BFD32AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFD32B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StandardCardViewLayout.CodingKeys()
{
  return &type metadata for StandardCardViewLayout.CodingKeys;
}

void sub_23BFD32D0()
{
  unint64_t v0;
  unint64_t v1;

  sub_23BEA9ED8();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_23BFD337C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;

  v6 = sub_23BFF85F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = *(_QWORD *)(v10 + 64) + 7;
  v13 = v11 | *(_DWORD *)(v7 + 80) & 0xF8;
  if (v13 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0
    || ((((((((v12 + (((v8 & 0xFFFFFFFFFFFFFFF8) + v11 + 112) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
         + 39) & 0xFFFFFFFFFFFFFFF8)
       + 39) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
  }
  else
  {
    v17 = *((unsigned __int8 *)a2 + v8);
    if (v17 >= 2)
    {
      if (v8 <= 3)
        v18 = v8;
      else
        v18 = 4;
      __asm { BR              X13 }
    }
    v19 = v8 + 1;
    v20 = ~v11;
    if (v17 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      v21 = 1;
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      v21 = 0;
    }
    *((_BYTE *)a1 + v8) = v21;
    v22 = ((unint64_t)a1 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    v23 = ((unint64_t)a2 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    v24 = *(_OWORD *)v23;
    v25 = *(_OWORD *)(v23 + 32);
    *(_OWORD *)(v22 + 16) = *(_OWORD *)(v23 + 16);
    *(_OWORD *)(v22 + 32) = v25;
    *(_OWORD *)v22 = v24;
    v26 = *(_OWORD *)(v23 + 48);
    v27 = *(_OWORD *)(v23 + 64);
    v28 = *(_OWORD *)(v23 + 80);
    *(_QWORD *)(v22 + 96) = *(_QWORD *)(v23 + 96);
    *(_OWORD *)(v22 + 64) = v27;
    *(_OWORD *)(v22 + 80) = v28;
    *(_OWORD *)(v22 + 48) = v26;
    v29 = (v22 + v11 + 104) & v20;
    v30 = (v23 + v11 + 104) & v20;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v29, v30, v9);
    v31 = (v12 + v29) & 0xFFFFFFFFFFFFFFF8;
    v32 = (v12 + v30) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v32 + 24) < 0xFFFFFFFFuLL)
    {
      v36 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)v31 = *(_OWORD *)v32;
      *(_OWORD *)(v31 + 16) = v36;
    }
    else
    {
      v33 = *(_QWORD *)v32;
      v34 = *(_QWORD *)(v32 + 8);
      v35 = *(_BYTE *)(v32 + 16);
      sub_23BEA0EAC(*(_QWORD *)v32, v34, v35);
      *(_QWORD *)v31 = v33;
      *(_QWORD *)(v31 + 8) = v34;
      *(_BYTE *)(v31 + 16) = v35;
      *(_QWORD *)(v31 + 24) = *(_QWORD *)(v32 + 24);
      swift_bridgeObjectRetain();
    }
    v37 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
    v38 = (v32 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v38 + 24) < 0xFFFFFFFFuLL)
    {
      v42 = *(_OWORD *)(v38 + 16);
      *(_OWORD *)v37 = *(_OWORD *)v38;
      *(_OWORD *)(v37 + 16) = v42;
    }
    else
    {
      v39 = *(_QWORD *)v38;
      v40 = *(_QWORD *)(v38 + 8);
      v41 = *(_BYTE *)(v38 + 16);
      sub_23BEA0EAC(*(_QWORD *)v38, v40, v41);
      *(_QWORD *)v37 = v39;
      *(_QWORD *)(v37 + 8) = v40;
      *(_BYTE *)(v37 + 16) = v41;
      *(_QWORD *)(v37 + 24) = *(_QWORD *)(v38 + 24);
      swift_bridgeObjectRetain();
    }
    v43 = (v37 + 39) & 0xFFFFFFFFFFFFFFF8;
    v44 = (v38 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v44 + 24) < 0xFFFFFFFFuLL)
    {
      v48 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)v43 = *(_OWORD *)v44;
      *(_OWORD *)(v43 + 16) = v48;
    }
    else
    {
      v45 = *(_QWORD *)v44;
      v46 = *(_QWORD *)(v44 + 8);
      v47 = *(_BYTE *)(v44 + 16);
      sub_23BEA0EAC(*(_QWORD *)v44, v46, v47);
      *(_QWORD *)v43 = v45;
      *(_QWORD *)(v43 + 8) = v46;
      *(_BYTE *)(v43 + 16) = v47;
      *(_QWORD *)(v43 + 24) = *(_QWORD *)(v44 + 24);
      swift_bridgeObjectRetain();
    }
    v49 = (_QWORD *)((v44 + 39) & 0xFFFFFFFFFFFFFFF8);
    v50 = v49[1];
    v51 = (_QWORD *)((v43 + 39) & 0xFFFFFFFFFFFFFFF8);
    *v51 = *v49;
    v51[1] = v50;
  }
  swift_retain();
  return a1;
}

uint64_t sub_23BFD36C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v4 = sub_23BFF85F0();
  v5 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(a1 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v7 == 1)
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  else
    swift_release();
  v9 = (a1 + v6 + 8) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v11 = (v9 + *(unsigned __int8 *)(v10 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v11);
  v12 = (*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v12 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_23BEA0F64(*(_QWORD *)v12, *(_QWORD *)(v12 + 8), *(_BYTE *)(v12 + 16));
    swift_bridgeObjectRelease();
  }
  v13 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v13 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_23BEA0F64(*(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_BYTE *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  v14 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_23BEA0F64(*(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_BYTE *)(v14 + 16));
    swift_bridgeObjectRelease();
  }
  return swift_release();
}

_QWORD *sub_23BFD3880(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;

  v6 = sub_23BFF85F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X13 }
  }
  if (v9 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
    v11 = 1;
  }
  else
  {
    *a1 = *a2;
    swift_retain();
    v11 = 0;
  }
  *((_BYTE *)a1 + v8) = v11;
  v12 = ((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFFFF8;
  v13 = ((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_OWORD *)v13;
  v15 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
  *(_OWORD *)(v12 + 32) = v15;
  *(_OWORD *)v12 = v14;
  v16 = *(_OWORD *)(v13 + 48);
  v17 = *(_OWORD *)(v13 + 64);
  v18 = *(_OWORD *)(v13 + 80);
  *(_QWORD *)(v12 + 96) = *(_QWORD *)(v13 + 96);
  *(_OWORD *)(v12 + 64) = v17;
  *(_OWORD *)(v12 + 80) = v18;
  *(_OWORD *)(v12 + 48) = v16;
  v19 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v20 + 104 + v12) & ~v20;
  v22 = (v20 + 104 + v13) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v21, v22);
  v23 = *(_QWORD *)(v19 + 64) + 7;
  v24 = (v23 + v21) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v23 + v22) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v25 + 24) < 0xFFFFFFFFuLL)
  {
    v29 = *(_OWORD *)(v25 + 16);
    *(_OWORD *)v24 = *(_OWORD *)v25;
    *(_OWORD *)(v24 + 16) = v29;
  }
  else
  {
    v26 = *(_QWORD *)v25;
    v27 = *(_QWORD *)(v25 + 8);
    v28 = *(_BYTE *)(v25 + 16);
    sub_23BEA0EAC(*(_QWORD *)v25, v27, v28);
    *(_QWORD *)v24 = v26;
    *(_QWORD *)(v24 + 8) = v27;
    *(_BYTE *)(v24 + 16) = v28;
    *(_QWORD *)(v24 + 24) = *(_QWORD *)(v25 + 24);
    swift_bridgeObjectRetain();
  }
  v30 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v31 + 24) < 0xFFFFFFFFuLL)
  {
    v35 = *(_OWORD *)(v31 + 16);
    *(_OWORD *)v30 = *(_OWORD *)v31;
    *(_OWORD *)(v30 + 16) = v35;
  }
  else
  {
    v32 = *(_QWORD *)v31;
    v33 = *(_QWORD *)(v31 + 8);
    v34 = *(_BYTE *)(v31 + 16);
    sub_23BEA0EAC(*(_QWORD *)v31, v33, v34);
    *(_QWORD *)v30 = v32;
    *(_QWORD *)(v30 + 8) = v33;
    *(_BYTE *)(v30 + 16) = v34;
    *(_QWORD *)(v30 + 24) = *(_QWORD *)(v31 + 24);
    swift_bridgeObjectRetain();
  }
  v36 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
  v37 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v37 + 24) < 0xFFFFFFFFuLL)
  {
    v41 = *(_OWORD *)(v37 + 16);
    *(_OWORD *)v36 = *(_OWORD *)v37;
    *(_OWORD *)(v36 + 16) = v41;
  }
  else
  {
    v38 = *(_QWORD *)v37;
    v39 = *(_QWORD *)(v37 + 8);
    v40 = *(_BYTE *)(v37 + 16);
    sub_23BEA0EAC(*(_QWORD *)v37, v39, v40);
    *(_QWORD *)v36 = v38;
    *(_QWORD *)(v36 + 8) = v39;
    *(_BYTE *)(v36 + 16) = v40;
    *(_QWORD *)(v36 + 24) = *(_QWORD *)(v37 + 24);
    swift_bridgeObjectRetain();
  }
  v42 = (_QWORD *)((v37 + 39) & 0xFFFFFFFFFFFFFFF8);
  v43 = v42[1];
  v44 = (_QWORD *)((v36 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v44 = *v42;
  v44[1] = v43;
  swift_retain();
  return a1;
}

_QWORD *sub_23BFD3B30(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;

  if (a1 != a2)
  {
    v6 = sub_23BFF85F0();
    v7 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v7 + 64) <= 8uLL)
      v8 = 8;
    else
      v8 = *(_QWORD *)(v7 + 64);
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2)
    {
      if (v8 <= 3)
        v10 = v8;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    if (v9 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(a1, v6);
    else
      swift_release();
    v11 = *((unsigned __int8 *)a2 + v8);
    if (v11 >= 2)
    {
      if (v8 <= 3)
        v12 = v8;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      *((_BYTE *)a1 + v8) = 1;
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v8) = 0;
      swift_retain();
    }
  }
  v13 = *(_QWORD *)(*(_QWORD *)(sub_23BFF85F0() - 8) + 64);
  if (v13 <= 8)
    v13 = 8;
  v14 = v13 + 8;
  v15 = (_QWORD *)(((unint64_t)a1 + v14) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)(((unint64_t)a2 + v14) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v15[3] = v16[3];
  v15[4] = v16[4];
  v15[5] = v16[5];
  v15[6] = v16[6];
  v15[7] = v16[7];
  v15[8] = v16[8];
  v15[9] = v16[9];
  v15[10] = v16[10];
  v15[11] = v16[11];
  v15[12] = v16[12];
  v17 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v18 = *(unsigned __int8 *)(v17 + 80);
  v19 = ((unint64_t)v15 + v18 + 104) & ~v18;
  v20 = ((unint64_t)v16 + v18 + 104) & ~v18;
  (*(void (**)(uint64_t, uint64_t))(v17 + 24))(v19, v20);
  v21 = *(_QWORD *)(v17 + 64) + 7;
  v22 = (v21 + v19) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v21 + v20) & 0xFFFFFFFFFFFFFFF8;
  v24 = *(_QWORD *)(v23 + 24);
  if (*(_QWORD *)(v22 + 24) < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v31 = *(_QWORD *)v23;
      v32 = *(_QWORD *)(v23 + 8);
      v33 = *(_BYTE *)(v23 + 16);
      sub_23BEA0EAC(*(_QWORD *)v23, v32, v33);
      *(_QWORD *)v22 = v31;
      *(_QWORD *)(v22 + 8) = v32;
      *(_BYTE *)(v22 + 16) = v33;
      *(_QWORD *)(v22 + 24) = *(_QWORD *)(v23 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
  }
  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v25 = *(_QWORD *)v23;
      v26 = *(_QWORD *)(v23 + 8);
      v27 = *(_BYTE *)(v23 + 16);
      sub_23BEA0EAC(*(_QWORD *)v23, v26, v27);
      v28 = *(_QWORD *)v22;
      v29 = *(_QWORD *)(v22 + 8);
      v30 = *(_BYTE *)(v22 + 16);
      *(_QWORD *)v22 = v25;
      *(_QWORD *)(v22 + 8) = v26;
      *(_BYTE *)(v22 + 16) = v27;
      sub_23BEA0F64(v28, v29, v30);
      *(_QWORD *)(v22 + 24) = *(_QWORD *)(v23 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    sub_23BEA0F64(*(_QWORD *)v22, *(_QWORD *)(v22 + 8), *(_BYTE *)(v22 + 16));
    swift_bridgeObjectRelease();
  }
  v34 = *(_OWORD *)(v23 + 16);
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *(_OWORD *)(v22 + 16) = v34;
LABEL_30:
  v35 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
  v36 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  v37 = *(_QWORD *)(v36 + 24);
  if (*(_QWORD *)(v35 + 24) < 0xFFFFFFFFuLL)
  {
    if (v37 >= 0xFFFFFFFF)
    {
      v44 = *(_QWORD *)v36;
      v45 = *(_QWORD *)(v36 + 8);
      v46 = *(_BYTE *)(v36 + 16);
      sub_23BEA0EAC(*(_QWORD *)v36, v45, v46);
      *(_QWORD *)v35 = v44;
      *(_QWORD *)(v35 + 8) = v45;
      *(_BYTE *)(v35 + 16) = v46;
      *(_QWORD *)(v35 + 24) = *(_QWORD *)(v36 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_37;
    }
  }
  else
  {
    if (v37 >= 0xFFFFFFFF)
    {
      v38 = *(_QWORD *)v36;
      v39 = *(_QWORD *)(v36 + 8);
      v40 = *(_BYTE *)(v36 + 16);
      sub_23BEA0EAC(*(_QWORD *)v36, v39, v40);
      v41 = *(_QWORD *)v35;
      v42 = *(_QWORD *)(v35 + 8);
      v43 = *(_BYTE *)(v35 + 16);
      *(_QWORD *)v35 = v38;
      *(_QWORD *)(v35 + 8) = v39;
      *(_BYTE *)(v35 + 16) = v40;
      sub_23BEA0F64(v41, v42, v43);
      *(_QWORD *)(v35 + 24) = *(_QWORD *)(v36 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    sub_23BEA0F64(*(_QWORD *)v35, *(_QWORD *)(v35 + 8), *(_BYTE *)(v35 + 16));
    swift_bridgeObjectRelease();
  }
  v47 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)v35 = *(_OWORD *)v36;
  *(_OWORD *)(v35 + 16) = v47;
LABEL_37:
  v48 = (v35 + 39) & 0xFFFFFFFFFFFFFFF8;
  v49 = (v36 + 39) & 0xFFFFFFFFFFFFFFF8;
  v50 = *(_QWORD *)(v49 + 24);
  if (*(_QWORD *)(v48 + 24) < 0xFFFFFFFFuLL)
  {
    if (v50 >= 0xFFFFFFFF)
    {
      v57 = *(_QWORD *)v49;
      v58 = *(_QWORD *)(v49 + 8);
      v59 = *(_BYTE *)(v49 + 16);
      sub_23BEA0EAC(*(_QWORD *)v49, v58, v59);
      *(_QWORD *)v48 = v57;
      *(_QWORD *)(v48 + 8) = v58;
      *(_BYTE *)(v48 + 16) = v59;
      *(_QWORD *)(v48 + 24) = *(_QWORD *)(v49 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_44;
    }
LABEL_43:
    v60 = *(_OWORD *)(v49 + 16);
    *(_OWORD *)v48 = *(_OWORD *)v49;
    *(_OWORD *)(v48 + 16) = v60;
    goto LABEL_44;
  }
  if (v50 < 0xFFFFFFFF)
  {
    sub_23BEA0F64(*(_QWORD *)v48, *(_QWORD *)(v48 + 8), *(_BYTE *)(v48 + 16));
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  v51 = *(_QWORD *)v49;
  v52 = *(_QWORD *)(v49 + 8);
  v53 = *(_BYTE *)(v49 + 16);
  sub_23BEA0EAC(*(_QWORD *)v49, v52, v53);
  v54 = *(_QWORD *)v48;
  v55 = *(_QWORD *)(v48 + 8);
  v56 = *(_BYTE *)(v48 + 16);
  *(_QWORD *)v48 = v51;
  *(_QWORD *)(v48 + 8) = v52;
  *(_BYTE *)(v48 + 16) = v53;
  sub_23BEA0F64(v54, v55, v56);
  *(_QWORD *)(v48 + 24) = *(_QWORD *)(v49 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_44:
  v61 = (_QWORD *)((v48 + 39) & 0xFFFFFFFFFFFFFFF8);
  v62 = (_QWORD *)((v49 + 39) & 0xFFFFFFFFFFFFFFF8);
  v63 = v62[1];
  *v61 = *v62;
  v61[1] = v63;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_23BFD406C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  _OWORD *v27;
  _OWORD *v28;
  __int128 v29;
  _OWORD *v30;
  _OWORD *v31;
  __int128 v32;

  v6 = sub_23BFF85F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X13 }
  }
  if (v9 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(a1, a2, v6);
    v11 = 1;
  }
  else
  {
    v11 = 0;
    *a1 = *a2;
  }
  *((_BYTE *)a1 + v8) = v11;
  v12 = ((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFFFF8;
  v13 = ((unint64_t)a2 + v8 + 8) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_OWORD *)v13;
  v15 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
  *(_OWORD *)(v12 + 32) = v15;
  *(_OWORD *)v12 = v14;
  v16 = *(_OWORD *)(v13 + 48);
  v17 = *(_OWORD *)(v13 + 64);
  v18 = *(_OWORD *)(v13 + 80);
  *(_QWORD *)(v12 + 96) = *(_QWORD *)(v13 + 96);
  *(_OWORD *)(v12 + 64) = v17;
  *(_OWORD *)(v12 + 80) = v18;
  *(_OWORD *)(v12 + 48) = v16;
  v19 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v20 + 104 + v12) & ~v20;
  v22 = (v20 + 104 + v13) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(v21, v22);
  v23 = *(_QWORD *)(v19 + 64) + 7;
  v24 = (_OWORD *)((v23 + v21) & 0xFFFFFFFFFFFFFFF8);
  v25 = (_OWORD *)((v23 + v22) & 0xFFFFFFFFFFFFFFF8);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = (_OWORD *)(((unint64_t)v24 + 39) & 0xFFFFFFFFFFFFFFF8);
  v28 = (_OWORD *)(((unint64_t)v25 + 39) & 0xFFFFFFFFFFFFFFF8);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (_OWORD *)(((unint64_t)v27 + 39) & 0xFFFFFFFFFFFFFFF8);
  v31 = (_OWORD *)(((unint64_t)v28 + 39) & 0xFFFFFFFFFFFFFFF8);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  *(_OWORD *)(((unint64_t)v30 + 39) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v31 + 39) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_23BFD424C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;

  if (a1 != a2)
  {
    v6 = sub_23BFF85F0();
    v7 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v7 + 64) <= 8uLL)
      v8 = 8;
    else
      v8 = *(_QWORD *)(v7 + 64);
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2)
    {
      if (v8 <= 3)
        v10 = v8;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    if (v9 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(a1, v6);
    else
      swift_release();
    v11 = *((unsigned __int8 *)a2 + v8);
    if (v11 >= 2)
    {
      if (v8 <= 3)
        v12 = v8;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(a1, a2, v6);
      v13 = 1;
    }
    else
    {
      v13 = 0;
      *a1 = *a2;
    }
    *((_BYTE *)a1 + v8) = v13;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(sub_23BFF85F0() - 8) + 64);
  if (v14 <= 8)
    v14 = 8;
  v15 = v14 + 8;
  v16 = (_QWORD *)(((unint64_t)a1 + v15) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((unint64_t)a2 + v15) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  v16[3] = v17[3];
  v16[4] = v17[4];
  v16[5] = v17[5];
  v16[6] = v17[6];
  v16[7] = v17[7];
  v16[8] = v17[8];
  v16[9] = v17[9];
  v16[10] = v17[10];
  v16[11] = v17[11];
  v16[12] = v17[12];
  v18 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v19 = *(unsigned __int8 *)(v18 + 80);
  v20 = ((unint64_t)v16 + v19 + 104) & ~v19;
  v21 = ((unint64_t)v17 + v19 + 104) & ~v19;
  (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v20, v21);
  v22 = *(_QWORD *)(v18 + 64) + 7;
  v23 = (v22 + v20) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v22 + v21) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v23 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v24 + 24) >= 0xFFFFFFFFuLL)
    {
      v25 = *(_BYTE *)(v24 + 16);
      v26 = *(_QWORD *)v23;
      v27 = *(_QWORD *)(v23 + 8);
      v28 = *(_BYTE *)(v23 + 16);
      *(_OWORD *)v23 = *(_OWORD *)v24;
      *(_BYTE *)(v23 + 16) = v25;
      sub_23BEA0F64(v26, v27, v28);
      *(_QWORD *)(v23 + 24) = *(_QWORD *)(v24 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
    sub_23BEA0F64(*(_QWORD *)v23, *(_QWORD *)(v23 + 8), *(_BYTE *)(v23 + 16));
    swift_bridgeObjectRelease();
  }
  v29 = *(_OWORD *)(v24 + 16);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *(_OWORD *)(v23 + 16) = v29;
LABEL_29:
  v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v30 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v31 + 24) >= 0xFFFFFFFFuLL)
    {
      v32 = *(_BYTE *)(v31 + 16);
      v33 = *(_QWORD *)v30;
      v34 = *(_QWORD *)(v30 + 8);
      v35 = *(_BYTE *)(v30 + 16);
      *(_OWORD *)v30 = *(_OWORD *)v31;
      *(_BYTE *)(v30 + 16) = v32;
      sub_23BEA0F64(v33, v34, v35);
      *(_QWORD *)(v30 + 24) = *(_QWORD *)(v31 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    sub_23BEA0F64(*(_QWORD *)v30, *(_QWORD *)(v30 + 8), *(_BYTE *)(v30 + 16));
    swift_bridgeObjectRelease();
  }
  v36 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v36;
LABEL_34:
  v37 = (v30 + 39) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v31 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v37 + 24) < 0xFFFFFFFFuLL)
  {
LABEL_38:
    v43 = *(_OWORD *)(v38 + 16);
    *(_OWORD *)v37 = *(_OWORD *)v38;
    *(_OWORD *)(v37 + 16) = v43;
    goto LABEL_39;
  }
  if (*(_QWORD *)(v38 + 24) < 0xFFFFFFFFuLL)
  {
    sub_23BEA0F64(*(_QWORD *)v37, *(_QWORD *)(v37 + 8), *(_BYTE *)(v37 + 16));
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  v39 = *(_BYTE *)(v38 + 16);
  v40 = *(_QWORD *)v37;
  v41 = *(_QWORD *)(v37 + 8);
  v42 = *(_BYTE *)(v37 + 16);
  *(_OWORD *)v37 = *(_OWORD *)v38;
  *(_BYTE *)(v37 + 16) = v39;
  sub_23BEA0F64(v40, v41, v42);
  *(_QWORD *)(v37 + 24) = *(_QWORD *)(v38 + 24);
  swift_bridgeObjectRelease();
LABEL_39:
  *(_OWORD *)((v37 + 39) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v38 + 39) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23BFD4680(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;

  v6 = sub_23BFF85F0();
  if (*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(_DWORD *)(v8 + 84);
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v8 + 80);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  if (v10 < a2)
  {
    if (((((((((((v12 + (((v7 & 0xFFFFFFFFFFFFFFF8) + v11 + 112) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
             + 39) & 0xFFFFFFFFFFFFFFF8)
           + 39) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v13 = 2;
    else
      v13 = a2 - v10 + 1;
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
    __asm { BR              X17 }
  }
  v17 = (((a1 + v7 + 8) & 0xFFFFFFFFFFFFFFF8) + v11 + 104) & ~v11;
  if (v9 >= 0x7FFFFFFF)
    return (*(uint64_t (**)(unint64_t))(v8 + 48))(v17);
  v18 = *(_QWORD *)((((((((v12 + v17) & 0xFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFF8);
  if (v18 >= 0xFFFFFFFF)
    LODWORD(v18) = -1;
  return (v18 + 1);
}

void sub_23BFD4834(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v8 = sub_23BFF85F0();
  v9 = 8;
  if (*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) > 8uLL)
    v9 = *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  v10 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v10 + 84) <= 0x7FFFFFFFu)
    v11 = 0x7FFFFFFF;
  else
    v11 = *(_DWORD *)(v10 + 84);
  if (v11 >= a3)
  {
    v14 = 0;
    if (a2 <= v11)
      goto LABEL_19;
  }
  else
  {
    if (((((((((*(_DWORD *)(v10 + 64)
               + 7
               + (((v9 & 0xFFFFFFF8) + *(unsigned __int8 *)(v10 + 80) + 112) & ~*(unsigned __int8 *)(v10 + 80))) & 0xFFFFFFF8)
             + 39) & 0xFFFFFFF8)
           + 39) & 0xFFFFFFF8)
         + 39) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v12 = a3 - v11 + 1;
    else
      v12 = 2;
    if (v12 >= 0x10000)
      v13 = 4;
    else
      v13 = 2;
    if (v12 < 0x100)
      v13 = 1;
    if (v12 >= 2)
      v14 = v13;
    else
      v14 = 0;
    if (a2 <= v11)
LABEL_19:
      __asm { BR              X15 }
  }
  if (((((((((*(_DWORD *)(v10 + 64)
             + 7
             + (((v9 & 0xFFFFFFF8) + *(unsigned __int8 *)(v10 + 80) + 112) & ~*(unsigned __int8 *)(v10 + 80))) & 0xFFFFFFF8)
           + 39) & 0xFFFFFFF8)
         + 39) & 0xFFFFFFF8)
       + 39) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v15 = ~v11 + a2;
    bzero(a1, ((((((((*(_QWORD *)(v10 + 64)+ 7+ (((v9 & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v10 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 39) & 0xFFFFFFFFFFFFFFF8)+ 39) & 0xFFFFFFFFFFFFFFF8)+ 39) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v15;
  }
  __asm { BR              X10 }
}

void sub_23BFD4980()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23BFD4A24);
}

void sub_23BFD4988()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v1 + v2) = 0;
  if (v0)
    JUMPOUT(0x23BFD4990);
  JUMPOUT(0x23BFD4A24);
}

void sub_23BFD49FC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23BFD4A24);
}

void sub_23BFD4A04()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23BFD4A24);
}

uint64_t sub_23BFD4A0C@<X0>(unsigned int a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_WORD *)(v7 + v8) = 0;
  if (!(_DWORD)v6)
    JUMPOUT(0x23BFD4A24);
  if (a1 < 0x7FFFFFFF)
  {
    if ((v6 & 0x80000000) == 0)
      JUMPOUT(0x23BFD4A20);
    JUMPOUT(0x23BFD4A18);
  }
  return (*(uint64_t (**)(unint64_t, uint64_t))(a2 + 56))((((v7 + v3 + 8) & 0xFFFFFFFFFFFFFFF8) + v4 + 104) & v5, v6);
}

uint64_t type metadata accessor for StandardCardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StandardCardView);
}

unint64_t sub_23BFD4A4C()
{
  unint64_t result;

  result = qword_256AE8678;
  if (!qword_256AE8678)
  {
    result = MEMORY[0x242615198](&unk_23C007B58, &type metadata for StandardCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8678);
  }
  return result;
}

unint64_t sub_23BFD4A94()
{
  unint64_t result;

  result = qword_256AE8680;
  if (!qword_256AE8680)
  {
    result = MEMORY[0x242615198](&unk_23C007AC8, &type metadata for StandardCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8680);
  }
  return result;
}

unint64_t sub_23BFD4ADC()
{
  unint64_t result;

  result = qword_256AE8688;
  if (!qword_256AE8688)
  {
    result = MEMORY[0x242615198](&unk_23C007AF0, &type metadata for StandardCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8688);
  }
  return result;
}

uint64_t sub_23BFD4B20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BFD4B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = (int *)type metadata accessor for StandardCardView(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*((_QWORD *)v6 - 1) + 80);
  v8 = (v7 + 32) & ~v7;
  v9 = v4 + v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE3728);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23BFF85F0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v4 + v8, v10);
  }
  else
  {
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v9 + v6[10], v5);
  v11 = v9 + v6[11];
  if (*(_QWORD *)(v11 + 24))
  {
    sub_23BEA0F64(*(_QWORD *)v11, *(_QWORD *)(v11 + 8), *(_BYTE *)(v11 + 16));
    swift_bridgeObjectRelease();
  }
  v12 = v9 + v6[12];
  if (*(_QWORD *)(v12 + 24))
  {
    sub_23BEA0F64(*(_QWORD *)v12, *(_QWORD *)(v12 + 8), *(_BYTE *)(v12 + 16));
    swift_bridgeObjectRelease();
  }
  v13 = v9 + v6[13];
  if (*(_QWORD *)(v13 + 24))
  {
    sub_23BEA0F64(*(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_BYTE *)(v13 + 16));
    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BFD4CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for StandardCardView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  return (*(uint64_t (**)(void))(v4 + *(int *)(v5 + 56) + ((v6 + 32) & ~v6)))();
}

uint64_t sub_23BFD4CE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BFD1BBC(*(char **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23BFD4CF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23BFD2658(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_23BFD4D00@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = type metadata accessor for StandardCardView(0, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1);
  return sub_23BFD2554(v4, a2);
}

unint64_t sub_23BFD4D34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE86A8;
  if (!qword_256AE86A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8698);
    v2[0] = sub_23BEA1F94(&qword_256AE86B0, &qword_256AE86B8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE86A8);
  }
  return result;
}

uint64_t sub_23BFD4DC0()
{
  return sub_23BF47528(&qword_256AE86E0, &qword_256AE86E8, (uint64_t (*)(void))sub_23BF3E174, MEMORY[0x24BDEDB80]);
}

uint64_t sub_23BFD4DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE86C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BFD4E2C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023C01E950 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C01EE60 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C01F520 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E694C656C746974 && a2 == 0xEE0074696D694C65 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023C01EF30 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023C01EF50 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x49746E65746E6F63 && a2 == 0xED0000737465736ELL || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x617053656C746974 && a2 == 0xEC000000676E6963 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xEF676E6963617053)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v5 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_23BFD5230(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  v3 = sub_23BFF862C();
  v4 = sub_23BFF8614();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED168];
  v26[0] = v1;
  v26[1] = MEMORY[0x24BDEEC40];
  v6 = MEMORY[0x24BDED308];
  v25[0] = MEMORY[0x242615198](MEMORY[0x24BDED308], v2, v26);
  v25[1] = sub_23BEA1F94(qword_256AE3C30, &qword_256AE3C28, MEMORY[0x24BDEB950]);
  v7 = MEMORY[0x242615198](v6, v3, v25);
  v8 = sub_23BEA1BB8(&qword_256AE5088, v5, MEMORY[0x24BDED160]);
  v21 = v3;
  v22 = v4;
  v23 = v7;
  v24 = v8;
  MEMORY[0x24261512C](255, &v21, MEMORY[0x24BDF2380], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8690);
  v9 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8698);
  swift_getTupleTypeMetadata3();
  v10 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v10);
  v11 = sub_23BFF90AC();
  v12 = sub_23BFF8968();
  v21 = v3;
  v22 = v4;
  v23 = v7;
  v24 = v8;
  v20[0] = swift_getOpaqueTypeConformance2();
  v20[1] = sub_23BEA1F94(&qword_256AE86A0, &qword_256AE8690, MEMORY[0x24BDEDC10]);
  v19[0] = MEMORY[0x242615198](v6, v9, v20);
  v19[1] = MEMORY[0x242615198](MEMORY[0x24BDF4700], v11);
  MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v12, v19);
  v13 = sub_23BFF9040();
  v14 = sub_23BFF8680();
  v15 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
  v16 = MEMORY[0x242615198](MEMORY[0x24BDF43B0], v13);
  v17 = sub_23BEA1BB8(&qword_256AE3558, v15, MEMORY[0x24BDED858]);
  v21 = v13;
  v22 = v14;
  v23 = v16;
  v24 = v17;
  return swift_getOpaqueTypeConformance2();
}

void CanvasLayout.withSizeClass(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  double v5;
  __int128 v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _OWORD v11[2];

  MEMORY[0x24BDAC7A8](a1);
  v5 = *(double *)v2;
  v6 = *(_OWORD *)(v2 + 24);
  v11[0] = *(_OWORD *)(v2 + 8);
  v11[1] = v6;
  v7 = *(double *)(v2 + 48);
  v8 = *(_QWORD *)(v2 + 56);
  v10 = *(_BYTE *)(v2 + 40);
  (*(void (**)(char *))(v9 + 16))((char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(v11, v10, v8, a2, v5, v7);
}

uint64_t sub_23BFD5588()
{
  return swift_bridgeObjectRetain();
}

void CanvasLayout.withContentMargins(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  _OWORD *v8;
  __int128 v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _OWORD v16[2];

  v5 = *(_QWORD *)(a2 + 24);
  MEMORY[0x24BDAC7A8](a1);
  v7 = *(double *)v3;
  v9 = v8[1];
  v16[0] = *v8;
  v16[1] = v9;
  v10 = *(double *)(v3 + 48);
  v11 = *(_QWORD *)(v3 + 56);
  v13 = v3 + *(int *)(v12 + 68);
  v15 = *(_BYTE *)(v3 + 40);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v5);
  CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(v16, v15, v11, a3, v7, v10);
}

uint64_t sub_23BFD565C()
{
  return swift_bridgeObjectRetain();
}

void CanvasLayout.withSectionDensityFactor(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _OWORD v15[2];

  v6 = *(_QWORD *)(a2 + 24);
  MEMORY[0x24BDAC7A8](a1);
  v8 = *(double *)v3;
  v9 = *(_OWORD *)(v3 + 24);
  v15[0] = *(_OWORD *)(v3 + 8);
  v15[1] = v9;
  v10 = *(double *)(v3 + 48);
  v12 = v3 + *(int *)(v11 + 68);
  v14 = *(_BYTE *)(v3 + 40);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v6);
  CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(v15, v14, a1, a3, v8, v10);
}

uint64_t sub_23BFD5734()
{
  return swift_bridgeObjectRetain();
}

void CanvasLayout.withDynamicTypeSize(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];

  v4 = a1;
  v6 = *(_QWORD *)(a2 + 24);
  MEMORY[0x24BDAC7A8](a1);
  v8 = *(double *)v3;
  v9 = *(_OWORD *)(v3 + 24);
  v14[0] = *(_OWORD *)(v3 + 8);
  v14[1] = v9;
  v10 = *(double *)(v3 + 48);
  v11 = *(_QWORD *)(v3 + 56);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3 + *(int *)(v12 + 68), v6);
  CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(v14, v4, v11, a3, v8, v10);
}

uint64_t sub_23BFD5810()
{
  return swift_bridgeObjectRetain();
}

void CanvasLayout.withCarouselPageControlSpacing(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _OWORD v15[2];

  v6 = *(_QWORD *)(a1 + 24);
  MEMORY[0x24BDAC7A8](a1);
  v8 = *(_OWORD *)(v3 + 24);
  v15[0] = *(_OWORD *)(v3 + 8);
  v15[1] = v8;
  v9 = *(double *)(v3 + 48);
  v10 = *(_QWORD *)(v3 + 56);
  v12 = v3 + *(int *)(v11 + 68);
  v14 = *(_BYTE *)(v3 + 40);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v6);
  CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(v15, v14, v10, a2, a3, v9);
}

uint64_t sub_23BFD58EC()
{
  return swift_bridgeObjectRetain();
}

void CanvasLayout.withIntersectionSpacing(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _OWORD v15[2];

  v6 = *(_QWORD *)(a1 + 24);
  MEMORY[0x24BDAC7A8](a1);
  v8 = *(double *)v3;
  v9 = *(_OWORD *)(v3 + 24);
  v15[0] = *(_OWORD *)(v3 + 8);
  v15[1] = v9;
  v10 = *(_QWORD *)(v3 + 56);
  v12 = v3 + *(int *)(v11 + 68);
  v14 = *(_BYTE *)(v3 + 40);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v6);
  CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(v15, v14, v10, a2, v8, a3);
}

uint64_t sub_23BFD59C4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23BFD59E8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v13 = a1[1];
  *(_OWORD *)a9 = *a1;
  *(_OWORD *)(a9 + 16) = v13;
  v14 = a1[3];
  *(_OWORD *)(a9 + 32) = a1[2];
  *(_OWORD *)(a9 + 48) = v14;
  *(_QWORD *)(a9 + 64) = a2;
  *(_QWORD *)(a9 + 72) = a3;
  *(_QWORD *)(a9 + 80) = a4;
  *(_QWORD *)(a9 + 88) = a5;
  *(_QWORD *)(a9 + 96) = a6;
  *(_QWORD *)(a9 + 104) = a7;
  *(_QWORD *)(a9 + 112) = a8;
  *(_QWORD *)(a9 + 120) = a10;
  v15 = a9 + *(int *)(type metadata accessor for InfoActionCardView(0, a12, a13, a4) + 44);
  v16 = sub_23BFF96A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15, a11, v16);
}

double static InfoActionCardViewLayout.default.getter@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;
  __int128 v4;

  if (qword_256AE33C8 != -1)
    swift_once();
  v2 = unk_256AE8708;
  *a1 = xmmword_256AE86F8;
  a1[1] = v2;
  result = *(double *)&xmmword_256AE8718;
  v4 = unk_256AE8728;
  a1[2] = xmmword_256AE8718;
  a1[3] = v4;
  return result;
}

double InfoActionCardViewLayout.cornerRadius.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double InfoActionCardViewLayout.descriptionButtonSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double InfoActionCardViewLayout.buttonTopBottomPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double InfoActionCardViewLayout.buttonLeadingTrailingPadding.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

__n128 InfoActionCardViewLayout.cardBackgroundColor.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 32);
  v3 = *(_OWORD *)(v1 + 48);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 InfoActionCardViewLayout.init(cornerRadius:descriptionButtonSpacing:buttonTopBottomPadding:buttonLeadingTrailingPadding:cardBackgroundColor:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  __n128 result;
  __int128 v7;

  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  result = *(__n128 *)a1;
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 48) = v7;
  return result;
}

uint64_t sub_23BFD5B0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23BFD5B48 + 4 * byte_23C007C90[a1]))(0x615272656E726F63, 0xEC00000073756964);
}

unint64_t sub_23BFD5B48()
{
  return 0xD000000000000018;
}

unint64_t sub_23BFD5B98()
{
  return 0xD000000000000013;
}

uint64_t sub_23BFD5BB4()
{
  unsigned __int8 *v0;

  return sub_23BFD5B0C(*v0);
}

uint64_t sub_23BFD5BBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFD84E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFD5BE0()
{
  sub_23BFD711C();
  return sub_23BFF9A30();
}

uint64_t sub_23BFD5C08()
{
  sub_23BFD711C();
  return sub_23BFF9A3C();
}

double sub_23BFD5C30()
{
  double result;

  xmmword_256AE86F8 = xmmword_23C007F70;
  unk_256AE8708 = xmmword_23C007F80;
  result = 1.0;
  xmmword_256AE8718 = xmmword_23C007F90;
  unk_256AE8728 = vdupq_n_s64(0x3FBC1C1C1C1C1C1CuLL);
  return result;
}

uint64_t InfoActionCardViewLayout.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8738);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v11 = v1[2];
  v10 = v1[3];
  v12 = v1[4];
  v13 = v1[5];
  v14 = v1[6];
  v15 = v1[7];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFD711C();
  sub_23BFF9A18();
  v18 = v9;
  v22 = 0;
  sub_23BEBFC1C();
  sub_23BFF9940();
  if (!v2)
  {
    v18 = v8;
    v22 = 1;
    sub_23BFF9940();
    v18 = v11;
    v22 = 2;
    sub_23BFF9940();
    v18 = v10;
    v22 = 3;
    sub_23BFF9940();
    v18 = v12;
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = 4;
    sub_23BF3CC24();
    sub_23BFF9940();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t InfoActionCardViewLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8748);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFD711C();
  sub_23BFF9A0C();
  if (!v2)
  {
    v17 = 0;
    sub_23BEC0384();
    sub_23BFF98C8();
    v9 = *(_QWORD *)&v16[0];
    v17 = 1;
    sub_23BFF98C8();
    v10 = *(_QWORD *)&v16[0];
    v17 = 2;
    sub_23BFF98C8();
    v11 = *(_QWORD *)&v16[0];
    v17 = 3;
    sub_23BFF98C8();
    v13 = *(_QWORD *)&v16[0];
    v17 = 4;
    sub_23BF3CCAC();
    sub_23BFF98C8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v14 = v16[0];
    v15 = v16[1];
    *(_QWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v13;
    *(_OWORD *)(a2 + 32) = v14;
    *(_OWORD *)(a2 + 48) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23BFD60CC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InfoActionCardViewLayout.init(from:)(a1, a2);
}

uint64_t sub_23BFD60E0(_QWORD *a1)
{
  return InfoActionCardViewLayout.encode(to:)(a1);
}

uint64_t InfoActionCardViewLayout.hash(into:)()
{
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  sub_23BFF99F4();
  return sub_23BFF99F4();
}

uint64_t InfoActionCardViewLayout.hashValue.getter()
{
  sub_23BFF99D0();
  InfoActionCardViewLayout.hash(into:)();
  return sub_23BFF9A00();
}

uint64_t sub_23BFD61EC()
{
  sub_23BFF99D0();
  InfoActionCardViewLayout.hash(into:)();
  return sub_23BFF9A00();
}

uint64_t sub_23BFD6240()
{
  sub_23BFF99D0();
  InfoActionCardViewLayout.hash(into:)();
  return sub_23BFF9A00();
}

uint64_t sub_23BFD6290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  double *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];

  v44 = a1;
  v56 = a2;
  v55 = sub_23BFF86BC();
  MEMORY[0x24BDAC7A8](v55);
  v54 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_23BFF8F74();
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v49 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE87F0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE87F8);
  v43 = *(_QWORD *)(a1 + 16);
  sub_23BFF96A0();
  sub_23BFF862C();
  sub_23BFF862C();
  sub_23BFF862C();
  swift_getTupleTypeMetadata3();
  v5 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v5);
  v6 = sub_23BFF90AC();
  v42 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v41 - v7;
  v9 = sub_23BFF862C();
  v46 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE5958);
  v12 = sub_23BFF862C();
  v50 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v41 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  v15 = sub_23BFF862C();
  v52 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v45 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v48 = (uint64_t)&v41 - v18;
  v19 = *(_QWORD *)(v44 + 24);
  v57 = v43;
  v58 = v19;
  v20 = v47;
  v59 = v47;
  sub_23BFF889C();
  sub_23BFF90A0();
  sub_23BFF8B60();
  v21 = MEMORY[0x242615198](MEMORY[0x24BDF4700], v6);
  sub_23BFF8EF0();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v6);
  v22 = v20[5];
  v23 = v20[6];
  v24 = v20[7];
  v25 = v20;
  v26 = v49;
  (*(void (**)(char *, _QWORD, uint64_t))(v51 + 104))(v49, *MEMORY[0x24BDF3C28], v53);
  v62[2] = MEMORY[0x242614358](v26, v24, v23, v22, 1.0);
  sub_23BFF8B60();
  v62[0] = v21;
  v62[1] = MEMORY[0x24BDECC60];
  v27 = MEMORY[0x24BDED308];
  v28 = MEMORY[0x242615198](MEMORY[0x24BDED308], v9, v62);
  sub_23BFF8CC8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v9);
  v29 = *(_QWORD *)v25;
  v30 = v54;
  v31 = &v54[*(int *)(v55 + 20)];
  v32 = *MEMORY[0x24BDEEB68];
  v33 = sub_23BFF8854();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v31, v32, v33);
  *v30 = v29;
  v30[1] = v29;
  v34 = sub_23BEA1F94(&qword_256AE5950, &qword_256AE5958, MEMORY[0x24BDF06D0]);
  v61[0] = v28;
  v61[1] = v34;
  v35 = MEMORY[0x242615198](v27, v12, v61);
  sub_23BEA1BB8(&qword_256AE3CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  v36 = (uint64_t)v45;
  sub_23BFF8F44();
  sub_23BEC4004((uint64_t)v30);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v14, v12);
  v37 = sub_23BEA1F94(qword_256AE3C30, &qword_256AE3C28, MEMORY[0x24BDEB950]);
  v60[0] = v35;
  v60[1] = v37;
  MEMORY[0x242615198](v27, v15, v60);
  v38 = v48;
  sub_23BEA72EC(v36, v15, v48);
  v39 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
  v39(v36, v15);
  sub_23BEA5C0C(v38, v15, v56);
  return ((uint64_t (*)(uint64_t, uint64_t))v39)(v38, v15);
}

uint64_t sub_23BFD6858@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
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
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 v45;
  char v46;
  char v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 v52;
  unsigned __int8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[12];
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  _BYTE *v86;
  _BYTE *v87;
  _BYTE *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[3];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _OWORD v105[2];
  uint64_t v106[3];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[2];
  uint64_t v121;
  char v122;
  _BYTE v123[7];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _OWORD v133[9];
  _OWORD v134[9];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;

  v73 = a2;
  v74 = a3;
  v90 = a4;
  v75 = sub_23BFF96A0();
  v5 = sub_23BFF862C();
  v77 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v76 = &v71[-v6];
  v78 = v7;
  v8 = sub_23BFF862C();
  v81 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v80 = &v71[-v9];
  v82 = v10;
  v89 = sub_23BFF862C();
  v85 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v88 = &v71[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v79 = &v71[-v13];
  MEMORY[0x24BDAC7A8](v14);
  v86 = &v71[-v15];
  v87 = (_BYTE *)sub_23BFF8890();
  v16 = *((_QWORD *)v87 - 1);
  MEMORY[0x24BDAC7A8](v87);
  v18 = &v71[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE87F0);
  MEMORY[0x24BDAC7A8](v83);
  v20 = &v71[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v23 = &v71[-v22];
  v24 = a1[8];
  v25 = a1[9];
  v27 = a1[10];
  v26 = a1[11];
  sub_23BEA1DC0(v24, v25, v27, v26);
  v28 = sub_23BFF91CC();
  sub_23BF950C4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v110, 0.0, 1, 0.0, 1, v28, v29, v24, v25, v27, v26);
  sub_23BEBF0A4(v24, v25, v27, v26);
  sub_23BFF8884();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8800);
  sub_23BFD8308();
  sub_23BFF8E3C();
  (*(void (**)(_BYTE *, _BYTE *))(v16 + 8))(v18, v87);
  v134[6] = v116;
  v134[7] = v117;
  v134[8] = v118;
  v134[2] = v112;
  v134[3] = v113;
  v134[5] = v115;
  v134[4] = v114;
  v134[0] = v110;
  v134[1] = v111;
  sub_23BFD832C((uint64_t *)v134);
  v87 = v20;
  v84 = v23;
  sub_23BFD835C((uint64_t)v20, (uint64_t)v23);
  v30 = a1[12];
  v31 = a1[13];
  v32 = a1[14];
  v33 = a1[15];
  sub_23BEA1DC0(v30, v31, v32, v33);
  v34 = sub_23BFF91CC();
  sub_23BF950C4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v133, 0.0, 1, 0.0, 1, v34, v35, v30, v31, v32, v33);
  sub_23BEBF0A4(v30, v31, v32, v33);
  v141 = v133[6];
  v142 = v133[7];
  v143 = v133[8];
  v137 = v133[2];
  v138 = v133[3];
  v140 = v133[5];
  v139 = v133[4];
  v136 = v133[1];
  v135 = v133[0];
  LOBYTE(v30) = sub_23BFF8B78();
  v36 = sub_23BFF8B90();
  sub_23BFF8B90();
  if (sub_23BFF8B90() != v30)
    v36 = sub_23BFF8B90();
  v72 = v36;
  sub_23BFF83F8();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v130 = v141;
  v131 = v142;
  v132 = v143;
  v126 = v137;
  v127 = v138;
  v128 = v139;
  v129 = v140;
  v124 = v135;
  v125 = v136;
  v122 = 0;
  v45 = sub_23BFF8B84();
  v46 = sub_23BFF8B9C();
  sub_23BFF8B90();
  sub_23BFF8B90();
  if (sub_23BFF8B90() != v45)
    sub_23BFF8B90();
  sub_23BFF8B90();
  v47 = sub_23BFF8B90();
  v49 = v76;
  if (v47 != v46)
    sub_23BFF8B90();
  v50 = v74;
  type metadata accessor for InfoActionCardView(0, v73, v74, v48);
  v121 = v50;
  v51 = MEMORY[0x242615198](MEMORY[0x24BDF5578], v75, &v121);
  sub_23BFF8EF0();
  v52 = sub_23BFF8B6C();
  v53 = sub_23BFF8B78();
  sub_23BFF8B90();
  sub_23BFF8B90();
  if (sub_23BFF8B90() != v52)
    sub_23BFF8B90();
  sub_23BFF8B90();
  if (sub_23BFF8B90() != v53)
    sub_23BFF8B90();
  v109[0] = v51;
  v109[1] = MEMORY[0x24BDECC60];
  v54 = MEMORY[0x24BDECC60];
  v55 = MEMORY[0x24BDED308];
  v56 = v78;
  v57 = MEMORY[0x242615198](MEMORY[0x24BDED308], v78, v109);
  v58 = v80;
  sub_23BFF8EF0();
  (*(void (**)(_BYTE *, uint64_t))(v77 + 8))(v49, v56);
  sub_23BFF91C0();
  v108[0] = v57;
  v108[1] = v54;
  v69 = v82;
  v70 = MEMORY[0x242615198](v55, v82, v108);
  v59 = (uint64_t)v79;
  sub_23BFF8EA8();
  (*(void (**)(_BYTE *, uint64_t))(v81 + 8))(v58, v69);
  v107[0] = v70;
  v107[1] = MEMORY[0x24BDEDBB8];
  v60 = v89;
  v61 = MEMORY[0x242615198](v55, v89, v107);
  v62 = v86;
  sub_23BEA72EC(v59, v60, (uint64_t)v86);
  v63 = v85;
  v64 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  v64(v59, v60);
  v65 = (uint64_t)v84;
  v66 = (uint64_t)v87;
  sub_23BFD83A4((uint64_t)v84, (uint64_t)v87);
  v101 = v130;
  v102 = v131;
  v103 = v132;
  v97 = v126;
  v98 = v127;
  v99 = v128;
  v100 = v129;
  v95 = v124;
  v96 = v125;
  LOBYTE(v104) = v72;
  *(_DWORD *)((char *)&v104 + 1) = *(_DWORD *)v123;
  DWORD1(v104) = *(_DWORD *)&v123[3];
  *((_QWORD *)&v104 + 1) = v38;
  *(_QWORD *)&v105[0] = v40;
  *((_QWORD *)&v105[0] + 1) = v42;
  *(_QWORD *)&v105[1] = v44;
  BYTE8(v105[1]) = v122;
  v106[0] = v66;
  v106[1] = (uint64_t)&v95;
  v67 = (uint64_t)v88;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v63 + 16))(v88, v62, v60);
  v106[2] = v67;
  sub_23BFD83EC((uint64_t *)&v135);
  v94[0] = v83;
  v94[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE87F8);
  v94[2] = v60;
  v91 = sub_23BFD841C();
  v92 = sub_23BF47528(&qword_256AE8818, &qword_256AE87F8, sub_23BFD8308, MEMORY[0x24BDECC60]);
  v93 = v61;
  sub_23BF93EF0(v106, 3uLL, (uint64_t)v94);
  v64((uint64_t)v62, v60);
  sub_23BFD832C((uint64_t *)&v135);
  sub_23BFD84A0(v65);
  v64(v67, v60);
  v118 = v103;
  v119 = v104;
  v120[0] = v105[0];
  *(_OWORD *)((char *)v120 + 9) = *(_OWORD *)((char *)v105 + 9);
  v114 = v99;
  v115 = v100;
  v116 = v101;
  v117 = v102;
  v110 = v95;
  v111 = v96;
  v112 = v97;
  v113 = v98;
  sub_23BFD832C((uint64_t *)&v110);
  return sub_23BFD84A0(v66);
}

uint64_t _s15FitnessCanvasUI24InfoActionCardViewLayoutV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), (int32x4_t)vceqq_f64(a1[1], a2[1]))), 0xFuLL))) & 1) != 0)return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[2], a2[2]), (int32x4_t)vceqq_f64(a1[3], a2[3]))), 0xFuLL))) & 1;
  else
    return 0;
}

unint64_t sub_23BFD711C()
{
  unint64_t result;

  result = qword_256AE8740;
  if (!qword_256AE8740)
  {
    result = MEMORY[0x242615198](&unk_23C007ED0, &type metadata for InfoActionCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8740);
  }
  return result;
}

unint64_t sub_23BFD7164()
{
  unint64_t result;

  result = qword_256AE8750[0];
  if (!qword_256AE8750[0])
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for InfoActionCardViewLayout, &type metadata for InfoActionCardViewLayout);
    atomic_store(result, qword_256AE8750);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for InfoActionCardViewLayout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InfoActionCardViewLayout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InfoActionCardViewLayout()
{
  return &type metadata for InfoActionCardViewLayout;
}

uint64_t storeEnumTagSinglePayload for InfoActionCardViewLayout.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23BFD7260 + 4 * byte_23C007C9A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23BFD7294 + 4 * byte_23C007C95[v4]))();
}

uint64_t sub_23BFD7294(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFD729C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFD72A4);
  return result;
}

uint64_t sub_23BFD72B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFD72B8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23BFD72BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFD72C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InfoActionCardViewLayout.CodingKeys()
{
  return &type metadata for InfoActionCardViewLayout.CodingKeys;
}

uint64_t sub_23BFD72E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BFF96A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_23BFD7364(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  int v9;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  size_t __n;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = *(_QWORD *)(v5 + 64);
  if (!*(_DWORD *)(v5 + 84))
    ++v8;
  v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || ((v7 + 128) & ~v7) + v8 > 0x18)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    v13 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v13;
    v14 = *((_OWORD *)a2 + 3);
    a1[2] = *((_OWORD *)a2 + 2);
    a1[3] = v14;
    v15 = ((unint64_t)a1 + 71) & 0xFFFFFFFFFFFFFFF8;
    v16 = ((unint64_t)a2 + 71) & 0xFFFFFFFFFFFFFFF8;
    __n = v8;
    if (*(_QWORD *)(v16 + 24) < 0xFFFFFFFFuLL)
    {
      v20 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v20;
    }
    else
    {
      v17 = *(_QWORD *)v16;
      v18 = *(_QWORD *)(v16 + 8);
      v19 = *(_BYTE *)(v16 + 16);
      sub_23BEA0EAC(*(_QWORD *)v16, v18, v19);
      *(_QWORD *)v15 = v17;
      *(_QWORD *)(v15 + 8) = v18;
      *(_BYTE *)(v15 + 16) = v19;
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
    }
    v21 = ~v7;
    v22 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
    v23 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)(v23 + 24) < 0xFFFFFFFFuLL)
    {
      v27 = *(_OWORD *)(v23 + 16);
      *(_OWORD *)v22 = *(_OWORD *)v23;
      *(_OWORD *)(v22 + 16) = v27;
    }
    else
    {
      v24 = *(_QWORD *)v23;
      v25 = *(_QWORD *)(v23 + 8);
      v26 = *(_BYTE *)(v23 + 16);
      sub_23BEA0EAC(*(_QWORD *)v23, v25, v26);
      *(_QWORD *)v22 = v24;
      *(_QWORD *)(v22 + 8) = v25;
      *(_BYTE *)(v22 + 16) = v26;
      *(_QWORD *)(v22 + 24) = *(_QWORD *)(v23 + 24);
      swift_bridgeObjectRetain();
    }
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))((v23 + v7 + 32) & v21, 1, v4))
    {
      memcpy((void *)((v22 + v7 + 32) & v21), (const void *)((v23 + v7 + 32) & v21), __n);
    }
    else
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))((v22 + v7 + 32) & v21, (v23 + v7 + 32) & v21, v4);
      (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))((v22 + v7 + 32) & v21, 0, 1, v4);
    }
  }
  return v3;
}

uint64_t sub_23BFD7544(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;

  v3 = (a1 + 71) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v3 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_23BEA0F64(*(_QWORD *)v3, *(_QWORD *)(v3 + 8), *(_BYTE *)(v3 + 16));
    swift_bridgeObjectRelease();
  }
  v4 = (v3 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v4 + 24) >= 0xFFFFFFFFuLL)
  {
    sub_23BEA0F64(*(_QWORD *)v4, *(_QWORD *)(v4 + 8), *(_BYTE *)(v4 + 16));
    swift_bridgeObjectRelease();
  }
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(unint64_t, uint64_t))(v6 + 8))(v7, v5);
  return result;
}

_OWORD *sub_23BFD760C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  size_t v24;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = ((unint64_t)a1 + 71) & 0xFFFFFFFFFFFFFFF8;
  v8 = ((unint64_t)a2 + 71) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v8 + 24) < 0xFFFFFFFFuLL)
  {
    v12 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)v7 = *(_OWORD *)v8;
    *(_OWORD *)(v7 + 16) = v12;
  }
  else
  {
    v9 = *(_QWORD *)v8;
    v10 = *(_QWORD *)(v8 + 8);
    v11 = *(_BYTE *)(v8 + 16);
    sub_23BEA0EAC(*(_QWORD *)v8, v10, v11);
    *(_QWORD *)v7 = v9;
    *(_QWORD *)(v7 + 8) = v10;
    *(_BYTE *)(v7 + 16) = v11;
    *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
    swift_bridgeObjectRetain();
  }
  v13 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v14 + 24) < 0xFFFFFFFFuLL)
  {
    v18 = *(_OWORD *)(v14 + 16);
    *(_OWORD *)v13 = *(_OWORD *)v14;
    *(_OWORD *)(v13 + 16) = v18;
  }
  else
  {
    v15 = *(_QWORD *)v14;
    v16 = *(_QWORD *)(v14 + 8);
    v17 = *(_BYTE *)(v14 + 16);
    sub_23BEA0EAC(*(_QWORD *)v14, v16, v17);
    *(_QWORD *)v13 = v15;
    *(_QWORD *)(v13 + 8) = v16;
    *(_BYTE *)(v13 + 16) = v17;
    *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
    swift_bridgeObjectRetain();
  }
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = (void *)((v13 + v21 + 32) & ~v21);
  v23 = (const void *)((v14 + v21 + 32) & ~v21);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v23, 1, v19))
  {
    if (*(_DWORD *)(v20 + 84))
      v24 = *(_QWORD *)(v20 + 64);
    else
      v24 = *(_QWORD *)(v20 + 64) + 1;
    memcpy(v22, v23, v24);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v22, v23, v19);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v22, 0, 1, v19);
  }
  return a1;
}

_QWORD *sub_23BFD7790(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t (*v36)(void *, uint64_t, uint64_t);
  int v37;
  int v38;
  size_t v39;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  v5 = ((unint64_t)a1 + 71) & 0xFFFFFFFFFFFFFFF8;
  v6 = ((unint64_t)a2 + 71) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v6 + 24);
  if (*(_QWORD *)(v5 + 24) < 0xFFFFFFFFuLL)
  {
    if (v7 >= 0xFFFFFFFF)
    {
      v14 = *(_QWORD *)v6;
      v15 = *(_QWORD *)(v6 + 8);
      v16 = *(_BYTE *)(v6 + 16);
      sub_23BEA0EAC(*(_QWORD *)v6, v15, v16);
      *(_QWORD *)v5 = v14;
      *(_QWORD *)(v5 + 8) = v15;
      *(_BYTE *)(v5 + 16) = v16;
      *(_QWORD *)(v5 + 24) = *(_QWORD *)(v6 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v7 >= 0xFFFFFFFF)
    {
      v8 = *(_QWORD *)v6;
      v9 = *(_QWORD *)(v6 + 8);
      v10 = *(_BYTE *)(v6 + 16);
      sub_23BEA0EAC(*(_QWORD *)v6, v9, v10);
      v11 = *(_QWORD *)v5;
      v12 = *(_QWORD *)(v5 + 8);
      v13 = *(_BYTE *)(v5 + 16);
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(v5 + 8) = v9;
      *(_BYTE *)(v5 + 16) = v10;
      sub_23BEA0F64(v11, v12, v13);
      *(_QWORD *)(v5 + 24) = *(_QWORD *)(v6 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_23BEA0F64(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
    swift_bridgeObjectRelease();
  }
  v17 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v5 = *(_OWORD *)v6;
  *(_OWORD *)(v5 + 16) = v17;
LABEL_8:
  v18 = (v5 + 39) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_QWORD *)(v19 + 24);
  if (*(_QWORD *)(v18 + 24) < 0xFFFFFFFFuLL)
  {
    if (v20 >= 0xFFFFFFFF)
    {
      v27 = *(_QWORD *)v19;
      v28 = *(_QWORD *)(v19 + 8);
      v29 = *(_BYTE *)(v19 + 16);
      sub_23BEA0EAC(*(_QWORD *)v19, v28, v29);
      *(_QWORD *)v18 = v27;
      *(_QWORD *)(v18 + 8) = v28;
      *(_BYTE *)(v18 + 16) = v29;
      *(_QWORD *)(v18 + 24) = *(_QWORD *)(v19 + 24);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v20 >= 0xFFFFFFFF)
    {
      v21 = *(_QWORD *)v19;
      v22 = *(_QWORD *)(v19 + 8);
      v23 = *(_BYTE *)(v19 + 16);
      sub_23BEA0EAC(*(_QWORD *)v19, v22, v23);
      v24 = *(_QWORD *)v18;
      v25 = *(_QWORD *)(v18 + 8);
      v26 = *(_BYTE *)(v18 + 16);
      *(_QWORD *)v18 = v21;
      *(_QWORD *)(v18 + 8) = v22;
      *(_BYTE *)(v18 + 16) = v23;
      sub_23BEA0F64(v24, v25, v26);
      *(_QWORD *)(v18 + 24) = *(_QWORD *)(v19 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_23BEA0F64(*(_QWORD *)v18, *(_QWORD *)(v18 + 8), *(_BYTE *)(v18 + 16));
    swift_bridgeObjectRelease();
  }
  v30 = *(_OWORD *)(v19 + 16);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_OWORD *)(v18 + 16) = v30;
LABEL_15:
  v31 = *(_QWORD *)(a3 + 16);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(unsigned __int8 *)(v32 + 80);
  v34 = (void *)((v18 + v33 + 32) & ~v33);
  v35 = (void *)((v19 + v33 + 32) & ~v33);
  v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v32 + 48);
  v37 = v36(v34, 1, v31);
  v38 = v36(v35, 1, v31);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v32 + 16))(v34, v35, v31);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v34, 0, 1, v31);
      return a1;
    }
  }
  else
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v32 + 24))(v34, v35, v31);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v34, v31);
  }
  if (*(_DWORD *)(v32 + 84))
    v39 = *(_QWORD *)(v32 + 64);
  else
    v39 = *(_QWORD *)(v32 + 64) + 1;
  memcpy(v34, v35, v39);
  return a1;
}

_OWORD *sub_23BFD7A78(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  size_t v17;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = (_OWORD *)(((unint64_t)a1 + 71) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_OWORD *)(((unint64_t)a2 + 71) & 0xFFFFFFFFFFFFFFF8);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  v9 = (_OWORD *)(((unint64_t)v6 + 39) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = (void *)(((unint64_t)v9 + v14 + 32) & ~v14);
  v16 = (const void *)(((unint64_t)v10 + v14 + 32) & ~v14);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v16, 1, v12))
  {
    if (*(_DWORD *)(v13 + 84))
      v17 = *(_QWORD *)(v13 + 64);
    else
      v17 = *(_QWORD *)(v13 + 64) + 1;
    memcpy(v15, v16, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v15, v16, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
  }
  return a1;
}

_OWORD *sub_23BFD7B70(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t (*v26)(void *, uint64_t, uint64_t);
  int v27;
  int v28;
  size_t v29;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = ((unint64_t)a1 + 71) & 0xFFFFFFFFFFFFFFF8;
  v8 = ((unint64_t)a2 + 71) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v7 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v8 + 24) >= 0xFFFFFFFFuLL)
    {
      v9 = *(_BYTE *)(v8 + 16);
      v10 = *(_QWORD *)v7;
      v11 = *(_QWORD *)(v7 + 8);
      v12 = *(_BYTE *)(v7 + 16);
      *(_OWORD *)v7 = *(_OWORD *)v8;
      *(_BYTE *)(v7 + 16) = v9;
      sub_23BEA0F64(v10, v11, v12);
      *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_23BEA0F64(*(_QWORD *)v7, *(_QWORD *)(v7 + 8), *(_BYTE *)(v7 + 16));
    swift_bridgeObjectRelease();
  }
  v13 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v8;
  *(_OWORD *)(v7 + 16) = v13;
LABEL_6:
  v14 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)(v14 + 24) >= 0xFFFFFFFFuLL)
  {
    if (*(_QWORD *)(v15 + 24) >= 0xFFFFFFFFuLL)
    {
      v16 = *(_BYTE *)(v15 + 16);
      v17 = *(_QWORD *)v14;
      v18 = *(_QWORD *)(v14 + 8);
      v19 = *(_BYTE *)(v14 + 16);
      *(_OWORD *)v14 = *(_OWORD *)v15;
      *(_BYTE *)(v14 + 16) = v16;
      sub_23BEA0F64(v17, v18, v19);
      *(_QWORD *)(v14 + 24) = *(_QWORD *)(v15 + 24);
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_23BEA0F64(*(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_BYTE *)(v14 + 16));
    swift_bridgeObjectRelease();
  }
  v20 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v20;
LABEL_11:
  v21 = *(_QWORD *)(a3 + 16);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(unsigned __int8 *)(v22 + 80);
  v24 = (void *)((v14 + v23 + 32) & ~v23);
  v25 = (void *)((v15 + v23 + 32) & ~v23);
  v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  v27 = v26(v24, 1, v21);
  v28 = v26(v25, 1, v21);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v24, v25, v21);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v24, 0, 1, v21);
      return a1;
    }
  }
  else
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v24, v25, v21);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v24, v21);
  }
  if (*(_DWORD *)(v22 + 84))
    v29 = *(_QWORD *)(v22 + 64);
  else
    v29 = *(_QWORD *)(v22 + 64) + 1;
  memcpy(v24, v25, v29);
  return a1;
}

uint64_t sub_23BFD7D80(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  int v13;
  unsigned int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  if (v5)
    v8 = *(_QWORD *)(v4 + 64);
  else
    v8 = *(_QWORD *)(v4 + 64) + 1;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_28;
  v11 = v8 + ((v9 + 128) & ~v9);
  v12 = 8 * v11;
  if (v11 <= 3)
  {
    v15 = ((v10 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v15))
    {
      v13 = *(_DWORD *)(a1 + v11);
      if (!v13)
        goto LABEL_28;
      goto LABEL_21;
    }
    if (v15 > 0xFF)
    {
      v13 = *(unsigned __int16 *)(a1 + v11);
      if (!*(_WORD *)(a1 + v11))
        goto LABEL_28;
      goto LABEL_21;
    }
    if (v15 < 2)
    {
LABEL_28:
      v17 = (a1 + 71) & 0xFFFFFFFFFFFFFFF8;
      if (v6 > 0x7FFFFFFE)
      {
        v19 = (*(uint64_t (**)(unint64_t))(v4 + 48))((((v17 + 39) & 0xFFFFFFFFFFFFFFF8) + v9 + 32) & ~v9);
        if (v19 >= 2)
          return v19 - 1;
        else
          return 0;
      }
      else
      {
        v18 = *(_QWORD *)(v17 + 24);
        if (v18 >= 0xFFFFFFFF)
          LODWORD(v18) = -1;
        if ((v18 + 1) >= 2)
          return v18;
        else
          return 0;
      }
    }
  }
  v13 = *(unsigned __int8 *)(a1 + v11);
  if (!*(_BYTE *)(a1 + v11))
    goto LABEL_28;
LABEL_21:
  v16 = (v13 - 1) << v12;
  if (v11 > 3)
    v16 = 0;
  if ((_DWORD)v11)
  {
    if (v11 > 3)
      LODWORD(v11) = 4;
    __asm { BR              X12 }
  }
  return v7 + v16 + 1;
}

void sub_23BFD7F1C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  v12 = ((*(unsigned __int8 *)(v7 + 80) + 128) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + v11;
  v13 = a3 >= v10;
  v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v12 > 3)
    {
      v6 = 1u;
      if (v10 < a2)
        goto LABEL_19;
      goto LABEL_26;
    }
    v15 = ((v14 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v6 = 4u;
      if (v10 < a2)
      {
LABEL_19:
        v16 = ~v10 + a2;
        if (v12 < 4)
        {
          if ((_DWORD)v12)
          {
            v17 = v16 & ~(-1 << (8 * v12));
            bzero(a1, v12);
            if ((_DWORD)v12 == 3)
            {
              *a1 = v17;
              *((_BYTE *)a1 + 2) = BYTE2(v17);
            }
            else if ((_DWORD)v12 == 2)
            {
              *a1 = v17;
            }
            else
            {
              *(_BYTE *)a1 = v17;
            }
          }
        }
        else
        {
          bzero(a1, v12);
          *(_DWORD *)a1 = v16;
        }
        __asm { BR              X10 }
      }
LABEL_26:
      __asm { BR              X15 }
    }
    if (v15 >= 0x100)
      v6 = 2;
    else
      v6 = v15 > 1;
  }
  if (v10 < a2)
    goto LABEL_19;
  goto LABEL_26;
}

void sub_23BFD8198()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_23BFD81A0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_23BFD81C0()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_23BFD81D0()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_23BFD81D8()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t type metadata accessor for InfoActionCardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InfoActionCardView);
}

unint64_t sub_23BFD81F4()
{
  unint64_t result;

  result = qword_256AE87D8;
  if (!qword_256AE87D8)
  {
    result = MEMORY[0x242615198](&unk_23C007EA8, &type metadata for InfoActionCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE87D8);
  }
  return result;
}

unint64_t sub_23BFD823C()
{
  unint64_t result;

  result = qword_256AE87E0;
  if (!qword_256AE87E0)
  {
    result = MEMORY[0x242615198](&unk_23C007E18, &type metadata for InfoActionCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE87E0);
  }
  return result;
}

unint64_t sub_23BFD8284()
{
  unint64_t result;

  result = qword_256AE87E8;
  if (!qword_256AE87E8)
  {
    result = MEMORY[0x242615198](&unk_23C007E40, &type metadata for InfoActionCardViewLayout.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE87E8);
  }
  return result;
}

uint64_t sub_23BFD82C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23BFD82FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BFD6858(*(_QWORD **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23BFD8308()
{
  return sub_23BF47528(&qword_256AE8808, &qword_256AE8800, (uint64_t (*)(void))sub_23BF059E0, MEMORY[0x24BDEDBB8]);
}

uint64_t *sub_23BFD832C(uint64_t *a1)
{
  sub_23BEBF0A4(*a1, a1[1], a1[2], a1[3]);
  return a1;
}

uint64_t sub_23BFD835C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE87F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23BFD83A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE87F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_23BFD83EC(uint64_t *a1)
{
  sub_23BEA1DC0(*a1, a1[1], a1[2], a1[3]);
  return a1;
}

unint64_t sub_23BFD841C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256AE8810;
  if (!qword_256AE8810)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE87F0);
    v2[0] = sub_23BFD8308();
    v2[1] = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256AE8810);
  }
  return result;
}

uint64_t sub_23BFD84A0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE87F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BFD84E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x615272656E726F63 && a2 == 0xEC00000073756964;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023C01F540 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023C01F560 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000023C01F580 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C01F5A0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23BFD86F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE87F0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE87F8);
  sub_23BFF96A0();
  sub_23BFF862C();
  sub_23BFF862C();
  sub_23BFF862C();
  swift_getTupleTypeMetadata3();
  v0 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v0);
  v1 = sub_23BFF90AC();
  v2 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE5958);
  v3 = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3C28);
  v4 = sub_23BFF862C();
  v9[0] = MEMORY[0x242615198](MEMORY[0x24BDF4700], v1);
  v9[1] = MEMORY[0x24BDECC60];
  v5 = MEMORY[0x24BDED308];
  v8[0] = MEMORY[0x242615198](MEMORY[0x24BDED308], v2, v9);
  v8[1] = sub_23BEA1F94(&qword_256AE5950, &qword_256AE5958, MEMORY[0x24BDF06D0]);
  v7[0] = MEMORY[0x242615198](v5, v3, v8);
  v7[1] = sub_23BEA1F94(qword_256AE3C30, &qword_256AE3C28, MEMORY[0x24BDEB950]);
  return MEMORY[0x242615198](v5, v4, v7);
}

void CanvasLayout.init(carouselPageControlSpacing:contentMargins:dynamicTypeSize:intersectionSpacing:sectionDensityFactor:sizeClass:)(_OWORD *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  __int128 v6;

  *(double *)a4 = a5;
  v6 = a1[1];
  *(_OWORD *)(a4 + 8) = *a1;
  *(_OWORD *)(a4 + 24) = v6;
  *(_BYTE *)(a4 + 40) = a2;
  *(double *)(a4 + 48) = a6;
  *(_QWORD *)(a4 + 56) = a3;
  type metadata accessor for CanvasLayout();
}

uint64_t sub_23BFD8920(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v3 + *(int *)(a1 + 68), v2, v1);
}

void type metadata accessor for CanvasLayout()
{
  JUMPOUT(0x2426150F0);
}

double CanvasLayout.carouselPageControlSpacing.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

__n128 CanvasLayout.contentMargins.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 8);
  v3 = *(_OWORD *)(v1 + 24);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t CanvasLayout.dynamicTypeSize.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

double CanvasLayout.intersectionSpacing.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

uint64_t CanvasLayout.sectionDensityFactor.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CanvasLayout.sizeClass.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 68));
}

uint64_t sub_23BFD89A8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001ALL && a2 == 0x800000023C01F5C0 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4D746E65746E6F63 && a2 == 0xEE00736E69677261 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x5463696D616E7964 && a2 == 0xEF657A6953657079 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023C01F5E0 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023C01F600 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x73616C43657A6973 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23BFD8C68(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23BFD8CA4 + 4 * byte_23C007FA0[a1]))(0xD00000000000001ALL, 0x800000023C01F5C0);
}

uint64_t sub_23BFD8CA4()
{
  return 0x4D746E65746E6F63;
}

uint64_t sub_23BFD8CC8()
{
  return 0x5463696D616E7964;
}

unint64_t sub_23BFD8CEC()
{
  return 0xD000000000000013;
}

uint64_t sub_23BFD8D08()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_23BFD8D20()
{
  return 0x73616C43657A6973;
}

uint64_t sub_23BFD8D3C()
{
  unsigned __int8 *v0;

  return sub_23BFD8C68(*v0);
}

uint64_t sub_23BFD8D4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFD89A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFD8D7C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23BFA79F0();
  *a1 = result;
  return result;
}

uint64_t sub_23BFD8DAC(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008180, a1);
  return sub_23BFF9A30();
}

uint64_t sub_23BFD8DE0(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008180, a1);
  return sub_23BFF9A3C();
}

void CanvasLayout.encode(to:)()
{
  type metadata accessor for CanvasLayout.CodingKeys();
}

uint64_t sub_23BFD8E68(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  MEMORY[0x242615198](&unk_23C008180, a1);
  v3 = sub_23BFF994C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v7 = *(_QWORD *)(v2 - 144);
  sub_23BFF9A18();
  *(_QWORD *)(v2 - 112) = *(_QWORD *)v7;
  *(_BYTE *)(v2 - 65) = 0;
  sub_23BEBFC1C();
  v8 = v6;
  v9 = *(_QWORD *)(v2 - 136);
  sub_23BFF9940();
  if (v9)
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = *(_QWORD *)(v2 - 152);
  v12 = *(_OWORD *)(v7 + 24);
  *(_OWORD *)(v2 - 112) = *(_OWORD *)(v7 + 8);
  *(_OWORD *)(v2 - 96) = v12;
  *(_BYTE *)(v2 - 65) = 1;
  sub_23BF3CBE0();
  v13 = v8;
  sub_23BFF9940();
  *(_BYTE *)(v2 - 112) = *(_BYTE *)(v7 + 40);
  *(_BYTE *)(v2 - 65) = 2;
  sub_23BFD90E0();
  sub_23BFF9940();
  *(_QWORD *)(v2 - 112) = *(_QWORD *)(v7 + 48);
  *(_BYTE *)(v2 - 65) = 3;
  sub_23BFF9940();
  *(_QWORD *)(v2 - 112) = *(_QWORD *)(v7 + 56);
  *(_BYTE *)(v2 - 65) = 4;
  v14 = sub_23BFF934C();
  v15 = *(_QWORD *)(v11 + 16);
  v16 = sub_23BF44A98();
  *(_QWORD *)(v2 - 128) = v15;
  *(_QWORD *)(v2 - 120) = v16;
  MEMORY[0x242615198](MEMORY[0x24BEE04C0], v14, v2 - 128);
  sub_23BFF9940();
  *(_BYTE *)(v2 - 112) = 5;
  sub_23BFF9940();
  return (*(uint64_t (**)(char *, _QWORD))(v4 + 8))(v13, 0);
}

void type metadata accessor for CanvasLayout.CodingKeys()
{
  JUMPOUT(0x2426150F0);
}

unint64_t sub_23BFD90E0()
{
  unint64_t result;

  result = qword_256AE8820;
  if (!qword_256AE8820)
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for DynamicTypeSize, &type metadata for DynamicTypeSize);
    atomic_store(result, (unint64_t *)&qword_256AE8820);
  }
  return result;
}

void CanvasLayout.init(from:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[22];

  v8[3] = a3;
  v8[2] = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8[5] = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[16] = v4;
  v8[17] = v5;
  v8[18] = v6;
  v8[19] = v7;
  type metadata accessor for CanvasLayout.CodingKeys();
}

void sub_23BFD91A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x242615198](&unk_23C008180, a1);
  v6 = sub_23BFF98E0();
  *(_QWORD *)(v5 - 176) = v6;
  *(_QWORD *)(v5 - 208) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  *(_QWORD *)(v5 - 200) = v4;
  *(_QWORD *)(v5 - 192) = v3;
  *(_QWORD *)(v5 - 128) = v4;
  *(_QWORD *)(v5 - 120) = v1;
  *(_QWORD *)(v5 - 224) = v1;
  *(_QWORD *)(v5 - 112) = v3;
  *(_QWORD *)(v5 - 104) = v2;
  *(_QWORD *)(v5 - 184) = v2;
  type metadata accessor for CanvasLayout();
}

uint64_t sub_23BFD9220(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v5 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v23 - v6;
  v8 = v2[3];
  *(_QWORD *)(v3 - 160) = v2;
  __swift_project_boxed_opaque_existential_1(v2, v8);
  *(_QWORD *)(v3 - 168) = v1;
  v9 = *(_QWORD *)(v3 - 152);
  sub_23BFF9A0C();
  if (v9)
    return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 160));
  v10 = *(_QWORD *)(v3 - 192);
  *(_QWORD *)(v3 - 248) = v5;
  *(_QWORD *)(v3 - 152) = a1;
  v11 = *(_QWORD *)(v3 - 208);
  *(_BYTE *)(v3 - 65) = 0;
  v12 = sub_23BEC0384();
  v13 = *(_QWORD *)(v3 - 176);
  sub_23BFF98C8();
  *(_QWORD *)(v3 - 256) = v12;
  *(_QWORD *)v7 = *(_QWORD *)(v3 - 128);
  *(_BYTE *)(v3 - 65) = 1;
  sub_23BF3CC68();
  sub_23BFF98C8();
  v14 = *(_OWORD *)(v3 - 112);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v3 - 128);
  *(_OWORD *)(v7 + 24) = v14;
  *(_BYTE *)(v3 - 65) = 2;
  sub_23BFD9540();
  sub_23BFF98C8();
  v7[40] = *(_BYTE *)(v3 - 128);
  *(_BYTE *)(v3 - 65) = 3;
  sub_23BFF98C8();
  *((_QWORD *)v7 + 6) = *(_QWORD *)(v3 - 128);
  v15 = sub_23BFF934C();
  *(_BYTE *)(v3 - 65) = 4;
  v16 = *(_QWORD *)(v10 + 8);
  v17 = sub_23BF44B20();
  *(_QWORD *)(v3 - 144) = v16;
  *(_QWORD *)(v3 - 136) = v17;
  MEMORY[0x242615198](MEMORY[0x24BEE04E0], v15, v3 - 144);
  sub_23BFF98C8();
  *((_QWORD *)v7 + 7) = *(_QWORD *)(v3 - 128);
  *(_BYTE *)(v3 - 128) = 5;
  v19 = *(_QWORD *)(v3 - 224);
  v18 = *(_QWORD *)(v3 - 216);
  sub_23BFF98C8();
  (*(void (**)(_QWORD, uint64_t))(v11 + 8))(*(_QWORD *)(v3 - 168), v13);
  v20 = *(_QWORD *)(v3 - 152);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 240) + 32))(&v7[*(int *)(v20 + 68)], v18, v19);
  v21 = *(_QWORD *)(v3 - 248);
  (*(void (**)(_QWORD, char *, uint64_t))(v21 + 16))(*(_QWORD *)(v3 - 232), v7, v20);
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 160));
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v7, v20);
}

unint64_t sub_23BFD9540()
{
  unint64_t result;

  result = qword_256AE8828[0];
  if (!qword_256AE8828[0])
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for DynamicTypeSize, &type metadata for DynamicTypeSize);
    atomic_store(result, qword_256AE8828);
  }
  return result;
}

void sub_23BFD9584(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  CanvasLayout.init(from:)(a1, *(_QWORD *)(a2 + 24), a3);
}

void sub_23BFD95A4()
{
  CanvasLayout.encode(to:)();
}

uint64_t static CanvasLayout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 8), *(float64x2_t *)(a2 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 24), *(float64x2_t *)(a2 + 24)))), 0xFuLL))) & 1) != 0&& *(unsigned __int8 *)(a1 + 40) == *(unsigned __int8 *)(a2 + 40)&& *(double *)(a1 + 48) == *(double *)(a2 + 48))
  {
    sub_23BF8838C();
    if ((sub_23BFF9358() & 1) != 0)
      type metadata accessor for CanvasLayout();
  }
  return 0;
}

uint64_t sub_23BFD96E4(uint64_t a1, uint64_t a2)
{
  return static CanvasLayout.== infix(_:_:)(a1, a2);
}

uint64_t sub_23BFD96F4()
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

uint64_t *sub_23BFD9794(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 64) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = (unint64_t)a2 + 15;
    v12 = *a2;
    v11 = (unint64_t)a2 + 55;
    *a1 = v12;
    v13 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
    v10 &= 0xFFFFFFFFFFFFFFF8;
    v14 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)v13 = *(_OWORD *)v10;
    *(_OWORD *)(v13 + 16) = v14;
    *(_BYTE *)(v13 + 32) = *(_BYTE *)(v10 + 32);
    v15 = (_QWORD *)(((unint64_t)a1 + 55) & 0xFFFFFFFFFFFFF8);
    *v15 = *(_QWORD *)(v11 & 0xFFFFFFFFFFFFF8);
    v16 = (_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_QWORD *)(((v11 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
    *v16 = *v17;
    v18 = ((unint64_t)v16 + v6 + 8) & ~v6;
    v19 = ((unint64_t)v17 + v6 + 8) & ~v6;
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v20(v18, v19, v4);
  }
  return v3;
}

uint64_t sub_23BFD989C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = (((a1 + 55) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((v3 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

_QWORD *sub_23BFD98EC(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v4 = (unint64_t)a2 + 15;
  v6 = *a2;
  v5 = (unint64_t)a2 + 55;
  *a1 = v6;
  v7 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  v4 &= 0xFFFFFFFFFFFFFFF8;
  v8 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)v7 = *(_OWORD *)v4;
  *(_OWORD *)(v7 + 16) = v8;
  *(_BYTE *)(v7 + 32) = *(_BYTE *)(v4 + 32);
  v9 = (_QWORD *)(((unint64_t)a1 + 55) & 0xFFFFFFFFFFFFF8);
  *v9 = *(_QWORD *)(v5 & 0xFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((v5 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  v12 = *(_QWORD *)(a3 + 24);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = ((unint64_t)v10 + v14 + 8) & ~v14;
  v16 = ((unint64_t)v11 + v14 + 8) & ~v14;
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  swift_bridgeObjectRetain();
  v17(v15, v16, v12);
  return a1;
}

_QWORD *sub_23BFD99A0(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = (unint64_t)a2 + 15;
  v7 = *a2;
  v6 = (unint64_t)a2 + 55;
  *a1 = v7;
  v8 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v8 = *(_QWORD *)v5;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v5 + 8);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v5 + 24);
  *(_BYTE *)(v8 + 32) = *(_BYTE *)(v5 + 32);
  v9 = (_QWORD *)(((unint64_t)a1 + 55) & 0xFFFFFFFFFFFFF8);
  *v9 = *(_QWORD *)(v6 & 0xFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((v6 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 24))(((unint64_t)v10 + *(unsigned __int8 *)(v12 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), ((unint64_t)v11 + *(unsigned __int8 *)(v12 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

_QWORD *sub_23BFD9A70(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = ((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)v4 = *(_OWORD *)v5;
  *(_OWORD *)(v4 + 16) = v6;
  *(_BYTE *)(v4 + 32) = *(_BYTE *)(v5 + 32);
  v7 = (_QWORD *)(((unint64_t)a1 + 55) & 0xFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)a2 + 55) & 0xFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v11 + 32))(((unint64_t)v9 + *(unsigned __int8 *)(v11 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), ((unint64_t)v10 + *(unsigned __int8 *)(v11 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  return a1;
}

_QWORD *sub_23BFD9B04(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = (unint64_t)a2 + 15;
  v7 = *a2;
  v6 = (unint64_t)a2 + 55;
  *a1 = v7;
  v8 = ((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v8 = *(_QWORD *)v5;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v5 + 8);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v5 + 24);
  *(_BYTE *)(v8 + 32) = *(_BYTE *)(v5 + 32);
  v9 = (_QWORD *)(((unint64_t)a1 + 55) & 0xFFFFFFFFFFFFF8);
  *v9 = *(_QWORD *)(v6 & 0xFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((v6 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 40))(((unint64_t)v10 + *(unsigned __int8 *)(v12 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), ((unint64_t)v11 + *(unsigned __int8 *)(v12 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_23BFD9BC4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t *v15;
  unint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 64) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      v15 = (unint64_t *)((((a1 + 15) & 0xFFFFFFFFFFFFFFF8) + 55) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v15 + v7 + 8) & ~v7);
      v16 = *v15;
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23BFD9C98 + 4 * byte_23C007FA6[(v9 - 1)]))();
}

void sub_23BFD9D18(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_23BFD9F1C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23BFD9F68 + 4 * byte_23C007FB9[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23BFD9F9C + 4 * byte_23C007FB4[v4]))();
}

uint64_t sub_23BFD9F9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFD9FA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFD9FACLL);
  return result;
}

uint64_t sub_23BFD9FB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFD9FC0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23BFD9FC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFD9FCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23BFD9FD8()
{
  JUMPOUT(0x242615198);
}

void sub_23BFD9FE8()
{
  JUMPOUT(0x242615198);
}

void sub_23BFD9FF8()
{
  JUMPOUT(0x242615198);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.addReference()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.removeReference()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.registerMissingPlaceholders(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 136) + *(_QWORD *)(a3 + 136));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BF90EBC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.registerPlaceholdersToFetch(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 144) + *(_QWORD *)(a3 + 144));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BFDA108;
  return v9(a1, a2, a3);
}

uint64_t sub_23BFDA108(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.registerResolvedItems(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 152) + *(_QWORD *)(a3 + 152));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BF90EBC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.removeCurrentlyFetchingPlaceholders(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 160) + *(_QWORD *)(a3 + 160));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BF90EBC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.invalidate()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 168) + *(_QWORD *)(a2 + 168));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BF90EBC;
  return v7(a1, a2);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.invalidatePlaceholders(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 176) + *(_QWORD *)(a3 + 176));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23BF90EBC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CanvasItemPlaceholderCaching.transformResolvedItems<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 184)
                                                                                     + *(_QWORD *)(a6 + 184));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23BF90EBC;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23BFDA3CC()
{
  return swift_initClassMetadata2();
}

void sub_23BFDA42C()
{
  swift_allocObject();
  sub_23BFDB074();
}

uint64_t sub_23BFDA450()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23BFDA460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23BFF9538();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23BFF952C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23BFDCD5C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23BFF94FC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23BFDA5A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_23BFDA5BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 + 128);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 128) = v4;
    if (qword_256AE3380 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v5 = sub_23BFF83D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_256B02400);
  swift_retain_n();
  v6 = sub_23BFF83BC();
  v7 = sub_23BFF9694();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint64_t *)(v0 + 16);
    v9 = swift_slowAlloc();
    v16 = v0;
    v17 = swift_slowAlloc();
    v10 = v17;
    *(_DWORD *)v9 = 136446466;
    v11 = sub_23BFDC780();
    *v8 = sub_23BF89B80(v11, v12, &v17);
    sub_23BFF96B8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v9 + 12) = 2048;
    v13 = *(_QWORD *)(v1 + 128);
    swift_release();
    *v8 = v13;
    sub_23BFF96B8();
    swift_release();
    _os_log_impl(&dword_23BE9D000, v6, v7, "%{public}s reference count is now %ld", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    v14 = v10;
    v0 = v16;
    MEMORY[0x242615234](v14, -1, -1);
    MEMORY[0x242615234](v9, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23BFDA7B4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[18];

  if (!v0[16])
  {
    v1 = (_QWORD *)*v0;
    if (qword_256AE3380 != -1)
      swift_once();
    v2 = sub_23BFF83D4();
    __swift_project_value_buffer(v2, (uint64_t)qword_256B02400);
    swift_retain();
    v3 = sub_23BFF83BC();
    v4 = sub_23BFF9694();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v12[0] = v6;
      *(_DWORD *)v5 = 136446210;
      v7 = sub_23BFDC780();
      v12[15] = sub_23BF89B80(v7, v8, v12);
      sub_23BFF96B8();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23BE9D000, v3, v4, "%{public}s cleaning up", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242615234](v6, -1, -1);
      MEMORY[0x242615234](v5, -1, -1);

    }
    else
    {

      swift_release();
    }
    swift_beginAccess();
    v9 = v1[19];
    v10 = v1[20];
    v11 = v1[21];
    v12[0] = v1[13];
    v12[1] = v9;
    v12[2] = v10;
    v12[3] = v11;
    type metadata accessor for CanvasItemPlaceholder();
  }
}

uint64_t sub_23BFDAA78()
{
  _QWORD *v0;
  _QWORD *v1;

  v1[18] = v0;
  v1[19] = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE81B0);
  v1[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23BFDAADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_log_type_t type;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v1 + 128);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (v3)
    return sub_23BFF9820();
  *(_QWORD *)(v1 + 128) = v4;
  if (qword_256AE3380 != -1)
    swift_once();
  v5 = sub_23BFF83D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_256B02400);
  swift_retain_n();
  v6 = sub_23BFF83BC();
  v7 = sub_23BFF9694();
  if (os_log_type_enabled(v6, v7))
  {
    type = v7;
    v8 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v24 = v23;
    *(_DWORD *)v8 = 136446466;
    v9 = sub_23BFDC780();
    *(_QWORD *)(v0 + 128) = sub_23BF89B80(v9, v10, &v24);
    sub_23BFF96B8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v8 + 12) = 2048;
    v11 = *(_QWORD *)(v1 + 128);
    swift_release();
    *(_QWORD *)(v0 + 136) = v11;
    sub_23BFF96B8();
    swift_release();
    _os_log_impl(&dword_23BE9D000, v6, type, "%{public}s reference count is now %ld", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242615234](v23, -1, -1);
    MEMORY[0x242615234](v8, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  if (!*(_QWORD *)(v1 + 128))
  {
    v14 = *(_OWORD **)(v0 + 152);
    v13 = *(_QWORD *)(v0 + 160);
    v15 = sub_23BFF9538();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
    v16 = v14[6];
    v17 = v14[7];
    v18 = v14[8];
    v19 = v14[9];
    v20 = v14[10];
    v21 = v14[11];
    *(_OWORD *)(v0 + 16) = v14[5];
    *(_OWORD *)(v0 + 32) = v16;
    *(_OWORD *)(v0 + 48) = v17;
    *(_OWORD *)(v0 + 64) = v18;
    *(_OWORD *)(v0 + 80) = v19;
    *(_OWORD *)(v0 + 96) = v20;
    *(_OWORD *)(v0 + 112) = v21;
    type metadata accessor for CanvasItemPlaceholderCache();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BFDAE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = v4;
  v5[1] = sub_23BFDAE54;
  return sub_23BFF9544();
}

uint64_t sub_23BFDAE54()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23BFDAEBC()
{
  uint64_t v0;

  sub_23BFDA7B4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BFDAEF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23BFF9538();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23BFF952C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23BFDCD5C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23BFF94FC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23BFDB01C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_23BFDB050()
{
  sub_23BFDB01C();
  return swift_defaultActor_deallocate();
}

void type metadata accessor for CanvasItemPlaceholderCache()
{
  JUMPOUT(0x2426150F0);
}

void sub_23BFDB074()
{
  swift_defaultActor_initialize();
  type metadata accessor for CanvasItemPlaceholder();
}

void sub_23BFDB0C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_23BFF9490();
  if (MEMORY[0x242614850](v3, a1))
  {
    v4 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, a1);
    v5 = sub_23BFDC96C(v3, a1, v4);
  }
  else
  {
    v5 = MEMORY[0x24BEE4B08];
  }
  swift_bridgeObjectRelease();
  v1[14] = v5;
  v6 = sub_23BFF9490();
  if (MEMORY[0x242614850](v6, a1))
  {
    v7 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, a1);
    v8 = sub_23BFDC96C(v6, a1, v7);
  }
  else
  {
    v8 = MEMORY[0x24BEE4B08];
  }
  swift_bridgeObjectRelease();
  v1[15] = v8;
  v1[16] = 0;
  type metadata accessor for CanvasItemDescriptor();
}

uint64_t sub_23BFDB1AC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getTupleTypeMetadata2();
  sub_23BFF9490();
  MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, v0);
  *(_QWORD *)(v1 + 136) = sub_23BFF92F8();
  return v1;
}

uint64_t sub_23BFDB224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_23BF90EBC;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_23BFDB284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];

  v5 = v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE81B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23BFF9538();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v5;
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_retain();
  if (v12 == 1)
  {
    sub_23BFDCD5C((uint64_t)v8);
    v13 = 0;
    v14 = 0;
  }
  else
  {
    sub_23BFF952C();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_23BFF94FC();
      v14 = v15;
      swift_unknownObjectRelease();
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
  }
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = v11;
  if (v14 | v13)
  {
    v18[0] = 0;
    v18[1] = 0;
    v18[2] = v13;
    v18[3] = v14;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_23BFDB454()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23BF90EBC;
  return sub_23BFDAA78();
}

uint64_t sub_23BFDB49C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[10] = a1;
  v2[11] = v1;
  v2[12] = *v1;
  return swift_task_switch();
}

void sub_23BFDB4BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 72) = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(_QWORD *)(v1 + 168);
  swift_bridgeObjectRetain();
  v4 = *(_OWORD *)(v1 + 152);
  *(_QWORD *)(v0 + 16) = v2;
  *(_OWORD *)(v0 + 24) = v4;
  *(_QWORD *)(v0 + 40) = v3;
  type metadata accessor for CanvasItemPlaceholder();
}

uint64_t sub_23BFDB534(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, a1);
  v2 = sub_23BFF95E0();
  MEMORY[0x242615198](MEMORY[0x24BEE1718], v2);
  sub_23BFF95C8();
  swift_endAccess();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23BFDB5AC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[26] = a1;
  v2[27] = v1;
  v2[28] = *v1;
  return swift_task_switch();
}

void sub_23BFDB5CC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)v0[28];
  swift_beginAccess();
  v3 = v1[19];
  v2 = v1[20];
  v4 = v1[21];
  v0[2] = v1[13];
  v0[3] = v3;
  v0[4] = v2;
  v0[5] = v4;
  type metadata accessor for CanvasItemPlaceholder();
}

void sub_23BFDB644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v7 = *(_QWORD *)(v0 + 144);
  v8 = *(_OWORD *)(v0 + 88);
  v9 = *(_OWORD *)(v0 + 112);
  v10 = *(_OWORD *)(v0 + 128);
  v11 = *(_OWORD *)(v0 + 176);
  *v5 = *(_QWORD *)(v0 + 80);
  *(_OWORD *)(v1 + 24) = v8;
  *(_QWORD *)(v1 + 40) = v3;
  *(_OWORD *)(v1 + 48) = v9;
  *(_OWORD *)(v1 + 64) = v10;
  *(_QWORD *)(v1 + 80) = v7;
  *(_QWORD *)(v1 + 88) = v6;
  *(_QWORD *)(v1 + 96) = v4;
  *(_QWORD *)(v1 + 104) = v2;
  *(_OWORD *)(v1 + 112) = v11;
  type metadata accessor for CanvasItemDescriptor();
}

uint64_t sub_23BFDB684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v5 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, v0);
  *v3 = v16;
  v6 = sub_23BFF9310();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x242615198](MEMORY[0x24BEE0310], v6);
  sub_23BFF95EC();
  MEMORY[0x242614910]();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v7 = v4[15];
  swift_bridgeObjectRetain();
  MEMORY[0x242614910](v1, v7, v0, v5);
  swift_beginAccess();
  v8 = v4[14];
  swift_bridgeObjectRetain();
  MEMORY[0x242614910](v1, v8, v0, v5);
  *(_QWORD *)(v2 + 176) = v4[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23BFF95EC();
  sub_23BFF955C();
  swift_bridgeObjectRelease();
  sub_23BFF955C();
  v9 = sub_23BFF955C();
  if ((sub_23BFF9598() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v10 = sub_23BFF9580();
    swift_bridgeObjectRelease();
    v11 = sub_23BFF9580();
    swift_bridgeObjectRelease();
    v12 = sub_23BFF9580();
    swift_bridgeObjectRelease();
    sub_23BF90BEC();
    swift_allocError();
    *(_QWORD *)v13 = v10;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(v13 + 16) = v12;
    *(_BYTE *)(v13 + 24) = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 200) = v9;
    swift_beginAccess();
    v15 = sub_23BFF95E0();
    swift_bridgeObjectRetain();
    MEMORY[0x242615198](MEMORY[0x24BEE1718], v15);
    sub_23BFF95C8();
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t))(v2 + 8))(v9);
  }
}

uint64_t sub_23BFDB988(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[17] = a1;
  v2[18] = v1;
  v2[19] = *v1;
  return swift_task_switch();
}

void sub_23BFDB9A8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)v0[19];
  v2 = v1[19];
  v3 = v1[20];
  v4 = v1[21];
  v0[2] = v1[13];
  v0[3] = v2;
  v0[4] = v3;
  v0[5] = v4;
  type metadata accessor for CanvasItemPlaceholder();
}

void sub_23BFDBA14()
{
  _QWORD *v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = v1[11];
  v15 = v1[10];
  v9 = v1[12];
  v10 = v1[15];
  v17 = v1[14];
  v11 = v1[17];
  v16 = v1[16];
  v12 = v1[18];
  v13 = v1[22];
  v14 = v1[23];
  *(_QWORD *)(v7 - 96) = v14;
  *(_QWORD *)(v7 - 88) = v13;
  *v0 = v15;
  v2[3] = v8;
  v2[4] = v9;
  v2[5] = v3;
  v2[6] = v17;
  v2[7] = v10;
  v2[8] = v16;
  v2[9] = v11;
  v2[10] = v12;
  v2[11] = v4;
  v2[12] = v5;
  v2[13] = v6;
  v2[14] = v13;
  v2[15] = v14;
  type metadata accessor for CanvasItemDescriptor();
}

uint64_t sub_23BFDBA74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
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

  MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, v2);
  *(_QWORD *)(v1 + 128) = v0;
  swift_beginAccess();
  sub_23BFF95E0();
  v5 = sub_23BFF9310();
  swift_bridgeObjectRetain();
  MEMORY[0x242615198](MEMORY[0x24BEE0310], v5);
  sub_23BFF95BC();
  swift_endAccess();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)swift_task_alloc();
  v6[2] = v11;
  v6[3] = v10;
  v6[4] = v9;
  v6[5] = v3;
  v6[6] = v16;
  v6[7] = v15;
  v6[8] = v14;
  v6[9] = v13;
  v6[10] = v12;
  v6[11] = v19;
  v6[12] = v18;
  v6[13] = v17;
  v7 = *(_QWORD *)(v4 - 96);
  v6[14] = *(_QWORD *)(v4 - 88);
  v6[15] = v7;
  swift_beginAccess();
  sub_23BFF934C();
  swift_bridgeObjectRetain();
  sub_23BFF9328();
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23BFDBC00(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[9] = a1;
  v2[10] = v1;
  v2[11] = *v1;
  return swift_task_switch();
}

void sub_23BFDBC20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 88);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 168);
  v3 = *(_OWORD *)(v1 + 152);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 104);
  *(_OWORD *)(v0 + 24) = v3;
  *(_QWORD *)(v0 + 40) = v2;
  type metadata accessor for CanvasItemPlaceholder();
}

uint64_t sub_23BFDBC80(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, a1);
  sub_23BFF95E0();
  sub_23BFF95B0();
  swift_endAccess();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_23BFDBCD4()
{
  swift_beginAccess();
  type metadata accessor for CanvasItemPlaceholder();
}

void sub_23BFDBD38(uint64_t a1)
{
  MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, a1);
  sub_23BFF95E0();
  sub_23BFF95D4();
  swift_endAccess();
  swift_beginAccess();
  type metadata accessor for CanvasItemDescriptor();
}

uint64_t sub_23BFDBDC8()
{
  sub_23BFF934C();
  sub_23BFF9340();
  swift_endAccess();
  swift_beginAccess();
  sub_23BFF95D4();
  return swift_endAccess();
}

void sub_23BFDBE3C()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  type metadata accessor for CanvasItemPlaceholder();
}

void sub_23BFDBF18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemPlaceholder<A>, a1);
  *(_QWORD *)(v26 + 112) = sub_23BFF958C();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v29 - 256) = v27;
  *(_QWORD *)(v29 - 248) = a24;
  *(_QWORD *)(v29 - 240) = a23;
  *(_QWORD *)(v29 - 232) = a9;
  *(_QWORD *)(v29 - 224) = v28;
  *(_QWORD *)(v29 - 216) = a22;
  *(_QWORD *)(v29 - 208) = a20;
  *(_QWORD *)(v29 - 200) = a21;
  *(_QWORD *)(v29 - 192) = a18;
  *(_QWORD *)(v29 - 184) = a26;
  *(_QWORD *)(v29 - 176) = a25;
  *(_QWORD *)(v29 - 168) = a10;
  *(_QWORD *)(v29 - 160) = a13;
  *(_QWORD *)(v29 - 152) = a14;
  type metadata accessor for CanvasItemDescriptor();
}

uint64_t sub_23BFDC00C()
{
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = sub_23BFF9334();
  return swift_bridgeObjectRelease();
}

void sub_23BFDC060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v23 = a8;
  v21 = a6;
  v30 = a3;
  v28 = a2;
  v26 = a1;
  v22 = a16;
  v19 = a9;
  v20 = a15;
  v29 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v27 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v17;
  v32 = a12;
  v24 = v17;
  v25 = v18;
  v33 = a13;
  v34 = v18;
  type metadata accessor for CanvasItemPlaceholder();
}

void sub_23BFDC12C()
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
  uint64_t v9;

  *(_QWORD *)(v8 - 200) = v6;
  *(_QWORD *)(v8 - 192) = v5;
  *(_QWORD *)(v8 - 184) = *(_QWORD *)(v8 - 280);
  *(_QWORD *)(v8 - 176) = v4;
  *(_QWORD *)(v8 - 168) = *(_QWORD *)(v8 - 264);
  *(_OWORD *)(v8 - 160) = *(_OWORD *)(v8 - 304);
  *(_QWORD *)(v8 - 144) = v3;
  *(_QWORD *)(v8 - 136) = v7;
  *(_QWORD *)(v8 - 128) = v0;
  *(_QWORD *)(v8 - 120) = v2;
  v9 = *(_QWORD *)(v8 - 288);
  *(_QWORD *)(v8 - 112) = v1;
  *(_QWORD *)(v8 - 104) = v9;
  *(_QWORD *)(v8 - 96) = *(_QWORD *)(v8 - 272);
  type metadata accessor for CanvasItemDescriptor();
}

BOOL sub_23BFDC184(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t TupleTypeMetadata2;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD, uint64_t, __n128);
  uint64_t v17;
  void (*v18)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[96];

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(_QWORD *)(v2 - 264) = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v6 = &v24[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = &v24[-v9];
  v12 = *(int *)(v11 + 48);
  v13 = v11;
  *(_QWORD *)(v2 - 272) = v11;
  v14 = &v24[v12 - v9];
  v15 = *(_QWORD *)(v1 - 8);
  v16 = *(void (**)(_BYTE *, _QWORD, uint64_t, __n128))(v15 + 16);
  v16(&v24[-v9], *(_QWORD *)(v2 - 240), v1, v8);
  v17 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v2 - 240) = v17;
  v18 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v17 + 16);
  v18(v14, *(_BYTE **)(v2 - 224), a1);
  v19 = &v6[*(int *)(v13 + 48)];
  ((void (*)(_BYTE *, _BYTE *, uint64_t))v16)(v6, v10, v1);
  v18(v19, v14, a1);
  v20 = *(_QWORD *)(v2 - 216);
  v21 = *(_QWORD *)(v2 - 232);
  v22 = *(_QWORD *)(v2 - 256);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v20 + 16))(v21, v6, v22);
  (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v6, v1);
  LOBYTE(v6) = sub_23BFF95A4();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  (*(void (**)(_BYTE *, _QWORD))(*(_QWORD *)(v2 - 264) + 8))(v10, *(_QWORD *)(v2 - 272));
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v2 - 240) + 8))(v19, a1);
  return (v6 & 1) == 0;
}

uint64_t sub_23BFDC318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[10] = a3;
  v4[11] = v3;
  v4[8] = a1;
  v4[9] = a2;
  return swift_task_switch();
}

uint64_t sub_23BFDC334()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 72);
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 136);
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v2(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BFDC3F4()
{
  return sub_23BFDB284((uint64_t)&unk_250CF14C8, (uint64_t)&unk_250CF14F0, (uint64_t)&unk_256AE8B48);
}

uint64_t sub_23BFDC434()
{
  return sub_23BFDB284((uint64_t)&unk_250CF1450, (uint64_t)&unk_250CF1478, (uint64_t)&unk_256AE8B20);
}

uint64_t sub_23BFDC474(uint64_t a1)
{
  _QWORD **v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BF90EBC;
  v5[10] = a1;
  v5[11] = v4;
  v5[12] = *v4;
  return swift_task_switch();
}

uint64_t sub_23BFDC4E0(uint64_t a1)
{
  _QWORD **v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BFDC54C;
  v5[26] = a1;
  v5[27] = v4;
  v5[28] = *v4;
  return swift_task_switch();
}

uint64_t sub_23BFDC54C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_23BFDC5A0(uint64_t a1)
{
  _QWORD **v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BF90EBC;
  v5[17] = a1;
  v5[18] = v4;
  v5[19] = *v4;
  return swift_task_switch();
}

uint64_t sub_23BFDC60C(uint64_t a1)
{
  _QWORD **v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BF90EBC;
  v5[9] = a1;
  v5[10] = v4;
  v5[11] = *v4;
  return swift_task_switch();
}

uint64_t sub_23BFDC678()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

void sub_23BFDC690()
{
  sub_23BFDBCD4();
}

uint64_t sub_23BFDC6AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BFDC6C0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

void sub_23BFDC6D8()
{
  sub_23BFDBE3C();
}

uint64_t sub_23BFDC6F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BFDC708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23BF8EC88;
  v9[10] = a3;
  v9[11] = v8;
  v9[8] = a1;
  v9[9] = a2;
  return swift_task_switch();
}

unint64_t sub_23BFDC780()
{
  sub_23BFF973C();
  swift_bridgeObjectRelease();
  sub_23BFF93D0();
  sub_23BFF9400();
  swift_bridgeObjectRelease();
  sub_23BFF9400();
  return 0xD00000000000001CLL;
}

unint64_t sub_23BFDC818()
{
  return sub_23BFDC780();
}

BOOL sub_23BFDC838()
{
  return (sub_23BFF95A4() & 1) == 0;
}

void sub_23BFDC870(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23BFDC060(a1, a2, *(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_OWORD *)(v2 + 56), *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 104), *(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 120));
}

uint64_t sub_23BFDC8AC(char a1)
{
  return a1 & 1;
}

uint64_t sub_23BFDC8BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BFDC920;
  return v6(a1);
}

uint64_t sub_23BFDC920()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BFDC96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, unint64_t, uint64_t);
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a1;
  v45 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v37 - v9;
  v37 = v10;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v37 - v13;
  if (MEMORY[0x242614844](v12))
  {
    sub_23BFF9730();
    v15 = sub_23BFF9724();
  }
  else
  {
    v15 = MEMORY[0x24BEE4B08];
  }
  v40 = MEMORY[0x242614850](v5, a2);
  if (!v40)
    return v15;
  v16 = 0;
  v43 = v15 + 56;
  v38 = v14;
  v39 = v5;
  while (1)
  {
    v17 = sub_23BFF949C();
    sub_23BFF9484();
    if ((v17 & 1) != 0)
    {
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, v5+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v16, a2);
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
        goto LABEL_20;
    }
    else
    {
      result = sub_23BFF9760();
      if (v37 != 8)
        goto LABEL_23;
      v46 = result;
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, (unint64_t)&v46, a2);
      swift_unknownObjectRelease();
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
      {
LABEL_20:
        __break(1u);
        return v15;
      }
    }
    v21 = v45;
    v41 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v42 = v20;
    v41(v44, v14, a2);
    v22 = sub_23BFF937C();
    v23 = -1 << *(_BYTE *)(v15 + 32);
    v24 = v22 & ~v23;
    v25 = v24 >> 6;
    v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
    v27 = 1 << v24;
    v28 = *(_QWORD *)(v21 + 72);
    if (((1 << v24) & v26) != 0)
    {
      v29 = ~v23;
      do
      {
        v18(v7, *(_QWORD *)(v15 + 48) + v28 * v24, a2);
        v30 = a3;
        v31 = sub_23BFF93AC();
        v32 = *(void (**)(char *, uint64_t))(v45 + 8);
        v32(v7, a2);
        if ((v31 & 1) != 0)
        {
          v32(v44, a2);
          a3 = v30;
          v14 = v38;
          v5 = v39;
          goto LABEL_7;
        }
        v24 = (v24 + 1) & v29;
        v25 = v24 >> 6;
        v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
        v27 = 1 << v24;
        a3 = v30;
      }
      while ((v26 & (1 << v24)) != 0);
      v14 = v38;
      v5 = v39;
    }
    v33 = v44;
    *(_QWORD *)(v43 + 8 * v25) = v27 | v26;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(*(_QWORD *)(v15 + 48) + v28 * v24, v33, a2);
    v35 = *(_QWORD *)(v15 + 16);
    v19 = __OFADD__(v35, 1);
    v36 = v35 + 1;
    if (v19)
      break;
    *(_QWORD *)(v15 + 16) = v36;
LABEL_7:
    v16 = v42;
    if (v42 == v40)
      return v15;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

void sub_23BFDCC74()
{
  type metadata accessor for CanvasItemDescriptor();
}

uint64_t sub_23BFDCCC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v2, v1, a1);
}

uint64_t sub_23BFDCCF4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23BF90EBC;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_23BF90EBC;
  return sub_23BFDAA78();
}

uint64_t sub_23BFDCD5C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE81B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BFDCD9C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BFDCDC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BF90EBC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256AE8B28 + dword_256AE8B28))(a1, v4);
}

uint64_t sub_23BFDCE34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23BF8EC88;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_23BF90EBC;
  v4[3] = v2;
  return swift_task_switch();
}

uint64_t objectdestroyTm_12()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BFDCEE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23BF8EC88;
  v3[2] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v3[3] = v4;
  *v4 = v3;
  v4[1] = sub_23BFDAE54;
  return sub_23BFF9544();
}

uint64_t String.attributedTextStyle(_:)(uint64_t a1)
{
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_23BFF82FC();
  v3 = MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  swift_bridgeObjectRetain();
  return sub_23BFF82D8();
}

uint64_t Optional<A>.attributedTextStyle(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_23BFF82FC();
  v9 = MEMORY[0x24BDAC7A8](v6);
  if (a2)
  {
    (*(void (**)(char *, uint64_t, __n128))(v8 + 16))((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
    swift_bridgeObjectRetain();
    sub_23BFF82D8();
    v10 = sub_23BFF82CC();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a3, 0, 1, v10);
  }
  else
  {
    v12 = sub_23BFF82CC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a3, 1, 1, v12);
  }
}

double sub_23BFDD104@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void sub_23BFDD110()
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for CanvasSectionHeader();
}

void sub_23BFDD294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v28 = sub_23BFF96A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, a24, v28);
  STACK[0x200] = a26;
  STACK[0x208] = a14;
  STACK[0x210] = v27;
  type metadata accessor for ListView();
}

uint64_t sub_23BFDD338(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  uint64_t v21;
  __int128 v22;
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
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  *(_QWORD *)(v1 + a1[53]) = v21;
  *(_BYTE *)(v1 + a1[54]) = v20;
  v7 = v1 + a1[55];
  v8 = sub_23BFF96A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, v31, v8);
  v9 = (_QWORD *)(v1 + a1[60]);
  *v9 = v23;
  v9[1] = v26;
  v10 = (_QWORD *)(v1 + a1[63]);
  *v10 = v27;
  v10[1] = v28;
  v11 = (_QWORD *)(v1 + a1[61]);
  *v11 = v29;
  v11[1] = v30;
  v12 = (_QWORD *)(v1 + a1[62]);
  *v12 = v32;
  v12[1] = v33;
  v13 = (_QWORD *)(v1 + a1[64]);
  *v13 = v34;
  v13[1] = v35;
  v14 = v1 + a1[56];
  *(_OWORD *)v14 = v22;
  *(_QWORD *)(v14 + 16) = v4;
  *(_QWORD *)(v14 + 24) = v5;
  v15 = (_QWORD *)(v1 + a1[57]);
  *v15 = v25;
  v15[1] = v3;
  v15[2] = v24;
  *(_BYTE *)(v1 + a1[58]) = v37;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v1 + a1[59], v41, v2);
  v17 = (_QWORD *)(v1 + a1[66]);
  *v17 = v36;
  v17[1] = v38;
  v18 = (_QWORD *)(v1 + a1[67]);
  *v18 = v39;
  v18[1] = v40;
  v19 = (_QWORD *)(v1 + a1[65]);
  *v19 = v42;
  v19[1] = v43;
  return result;
}

void ListView.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3528);
  type metadata accessor for CanvasSectionHeaderView();
}

void sub_23BFDD504()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23BFF8A4C();
  sub_23BFF862C();
  sub_23BFF8968();
  v5 = sub_23BFF96A0();
  v6 = v1[25];
  v0[69] = v6;
  v0[58] = *(_QWORD *)(v6 + 32);
  v0[59] = v5;
  v0[68] = v1[16];
  v0[57] = swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  v0[56] = sub_23BFF94C0();
  v7 = v1[5];
  v8 = v1[18];
  *(_QWORD *)(v4 - 216) = v7;
  *(_QWORD *)(v4 - 208) = v3;
  v0[64] = v7;
  *(_QWORD *)(v4 - 200) = v3;
  *(_QWORD *)(v4 - 192) = v8;
  *(_QWORD *)(v4 - 184) = v2;
  *(_QWORD *)(v4 - 176) = v2;
  type metadata accessor for ActionCardView();
}

void sub_23BFDD5C0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
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

  v1[49] = a1;
  v8 = MEMORY[0x242615198](&unk_23C005608, a1);
  v1[48] = v8;
  *(_QWORD *)(v6 - 216) = a1;
  *(_QWORD *)(v6 - 208) = v8;
  v1[66] = MEMORY[0x24261512C](255, v6 - 216, MEMORY[0x24BDF3948], 0);
  v1[47] = sub_23BFF8ADC();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088];
  v10 = sub_23BFF862C();
  v11 = sub_23BFF862C();
  v1[46] = v11;
  v12 = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, v9, MEMORY[0x24BDF1078]);
  v1[53] = v12;
  *(_QWORD *)(v6 - 104) = v5;
  *(_QWORD *)(v6 - 96) = v12;
  v13 = MEMORY[0x24BDED308];
  v14 = MEMORY[0x242615198](MEMORY[0x24BDED308], v10, v6 - 104);
  v15 = MEMORY[0x24BDEEC40];
  *(_QWORD *)(v6 - 120) = v14;
  *(_QWORD *)(v6 - 112) = v15;
  v16 = MEMORY[0x242615198](v13, v11, v6 - 120);
  v1[45] = v16;
  *(_QWORD *)(v6 - 216) = v11;
  *(_QWORD *)(v6 - 208) = v16;
  v17 = MEMORY[0x24BDF3100];
  MEMORY[0x24261512C](255, v6 - 216, MEMORY[0x24BDF3100], 0);
  v18 = sub_23BFF862C();
  v1[41] = v18;
  v19 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v6 - 136) = v14;
  *(_QWORD *)(v6 - 128) = v19;
  v20 = MEMORY[0x242615198](v13, v18, v6 - 136);
  v1[40] = v20;
  *(_QWORD *)(v6 - 216) = v18;
  *(_QWORD *)(v6 - 208) = v20;
  MEMORY[0x24261512C](255, v6 - 216, v17, 0);
  v1[38] = sub_23BFF8968();
  v1[42] = sub_23BFF8FD4();
  v1[39] = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3910);
  v1[43] = sub_23BFF8968();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3918);
  v1[44] = sub_23BFF8968();
  v1[28] = sub_23BFF8968();
  v1[67] = v2;
  v21 = v2[8];
  v1[65] = v21;
  v22 = v2[14];
  v23 = v2[20];
  v1[66] = v23;
  v24 = v2[24];
  v1[54] = v22;
  v1[55] = v24;
  *(_QWORD *)(v6 - 216) = v1[64];
  *(_QWORD *)(v6 - 208) = v4;
  *(_QWORD *)(v6 - 200) = v4;
  *(_QWORD *)(v6 - 192) = v21;
  *(_QWORD *)(v6 - 184) = v22;
  *(_QWORD *)(v6 - 176) = v5;
  *(_QWORD *)(v6 - 168) = v3;
  *(_QWORD *)(v6 - 160) = v3;
  *(_QWORD *)(v6 - 152) = v23;
  *(_QWORD *)(v6 - 144) = v24;
  type metadata accessor for FullWidthStageView();
}

void sub_23BFDD7F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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

  v1[37] = a1;
  v8 = MEMORY[0x242615198](&unk_23C0077B8, a1);
  v1[36] = v8;
  *(_QWORD *)(v6 - 216) = a1;
  *(_QWORD *)(v6 - 208) = v8;
  v9 = MEMORY[0x24BDF3948];
  MEMORY[0x24261512C](255, v6 - 216, MEMORY[0x24BDF3948], 0);
  v1[51] = v4;
  v1[52] = v3;
  v11 = type metadata accessor for InfoActionCardView(255, v4, v3, v10);
  v1[35] = v11;
  v12 = MEMORY[0x242615198](&unk_23C007F20, v11);
  v1[34] = v12;
  *(_QWORD *)(v6 - 216) = v11;
  *(_QWORD *)(v6 - 208) = v12;
  MEMORY[0x24261512C](255, v6 - 216, v9, 0);
  v1[33] = sub_23BFF8968();
  v1[12] = sub_23BFF8968();
  v13 = v2;
  v15 = type metadata accessor for LargeBrickView(255, v2, v5, v14);
  v1[32] = v15;
  v16 = MEMORY[0x242615198](&protocol conformance descriptor for LargeBrickView<A>, v15);
  v1[31] = v16;
  *(_QWORD *)(v6 - 216) = v15;
  *(_QWORD *)(v6 - 208) = v16;
  MEMORY[0x24261512C](255, v6 - 216, v9, 0);
  v18 = type metadata accessor for DynamicBrickView(255, v2, v5, v17);
  v1[30] = v18;
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for DynamicBrickView<A>, v18);
  v1[29] = v19;
  *(_QWORD *)(v6 - 216) = v18;
  *(_QWORD *)(v6 - 208) = v19;
  MEMORY[0x24261512C](255, v6 - 216, v9, 0);
  v1[21] = sub_23BFF8968();
  v21 = type metadata accessor for MonogramVerticalStackView(255, v2, v5, v20);
  v1[27] = v21;
  v22 = MEMORY[0x242615198](&unk_23BFFA1F4, v21);
  v1[26] = v22;
  *(_QWORD *)(v6 - 216) = v21;
  *(_QWORD *)(v6 - 208) = v22;
  MEMORY[0x24261512C](255, v6 - 216, v9, 0);
  v1[24] = sub_23BFF8968();
  v1[25] = sub_23BFF8968();
  *v1 = sub_23BFF8968();
  v24 = type metadata accessor for StandardCardView(255, v13, v5, v23);
  v1[23] = v24;
  v25 = MEMORY[0x242615198](&unk_23C007BD0, v24);
  v1[22] = v25;
  *(_QWORD *)(v6 - 216) = v24;
  *(_QWORD *)(v6 - 208) = v25;
  MEMORY[0x24261512C](255, v6 - 216, v9, 0);
  *(_QWORD *)(v6 - 216) = v13;
  *(_QWORD *)(v6 - 208) = v4;
  *(_QWORD *)(v6 - 200) = v5;
  *(_QWORD *)(v6 - 192) = v3;
  type metadata accessor for StandardHorizontalStackView();
}

void sub_23BFDDA34(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v64;
  uint64_t AssociatedConformanceWitness;
  uint64_t v66;

  v1[20] = a1;
  v7 = MEMORY[0x242615198](&unk_23C0008E8, a1);
  v1[19] = v7;
  *(_QWORD *)(v5 - 216) = a1;
  *(_QWORD *)(v5 - 208) = v7;
  MEMORY[0x24261512C](255, v5 - 216, v3, 0);
  v1[3] = sub_23BFF8968();
  v9 = type metadata accessor for StandardVerticalStackView(255, v2, v4, v8);
  v1[18] = v9;
  v10 = MEMORY[0x242615198](&unk_23C0073B8, v9);
  v1[17] = v10;
  *(_QWORD *)(v5 - 216) = v9;
  *(_QWORD *)(v5 - 208) = v10;
  MEMORY[0x24261512C](255, v5 - 216, v3, 0);
  v12 = type metadata accessor for TallCardView(255, v2, v4, v11);
  v1[16] = v12;
  v13 = MEMORY[0x242615198](&unk_23BFFF0E4, v12);
  v1[15] = v13;
  *(_QWORD *)(v5 - 216) = v12;
  *(_QWORD *)(v5 - 208) = v13;
  MEMORY[0x24261512C](255, v5 - 216, v3, 0);
  v1[14] = sub_23BFF8968();
  v1[1] = sub_23BFF8968();
  v1[50] = v4;
  v15 = type metadata accessor for VerticalStackCard(255, v2, v4, v14);
  v16 = MEMORY[0x242615198](&unk_23C0000E0, v15);
  v1[11] = v16;
  *(_QWORD *)(v5 - 216) = v15;
  *(_QWORD *)(v5 - 208) = v16;
  MEMORY[0x24261512C](255, v5 - 216, v3, 0);
  v1[2] = sub_23BFF8968();
  v18 = type metadata accessor for WideBrickView(255, v2, v4, v17);
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for WideBrickView<A>, v18);
  v1[6] = v19;
  *(_QWORD *)(v5 - 216) = v18;
  *(_QWORD *)(v5 - 208) = v19;
  MEMORY[0x24261512C](255, v5 - 216, v3, 0);
  v1[4] = sub_23BFF8968();
  v1[5] = sub_23BFF8968();
  v1[7] = sub_23BFF8968();
  v1[8] = sub_23BFF8FD4();
  v1[9] = sub_23BFF862C();
  v1[10] = sub_23BFF8968();
  v1[13] = sub_23BFF862C();
  v1[47] = sub_23BFF862C();
  *(_QWORD *)(v5 - 216) = v1[49];
  *(_QWORD *)(v5 - 208) = v1[48];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 216) = v1[46];
  *(_QWORD *)(v5 - 208) = v1[45];
  v21 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 216) = v1[41];
  *(_QWORD *)(v5 - 208) = v1[40];
  v22 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 232) = v21;
  *(_QWORD *)(v5 - 224) = v22;
  v23 = MEMORY[0x24BDEF3E0];
  *(_QWORD *)(v5 - 240) = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v1[38], v5 - 232);
  v24 = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v1[42], v5 - 240);
  v25 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v5 - 256) = v24;
  *(_QWORD *)(v5 - 248) = v25;
  v26 = MEMORY[0x24BDED308];
  v27 = MEMORY[0x242615198](MEMORY[0x24BDED308], v1[39], v5 - 256);
  v28 = sub_23BEA1F94(&qword_256AE3920, &qword_256AE3910, MEMORY[0x24BDF43B0]);
  v1[142] = v27;
  v1[143] = v28;
  v29 = MEMORY[0x242615198](v23, v1[43], v1 + 142);
  v30 = sub_23BEA1F94(&qword_256AE3928, &qword_256AE3918, MEMORY[0x24BDF4700]);
  v1[140] = v29;
  v1[141] = v30;
  v31 = MEMORY[0x242615198](v23, v1[44], v1 + 140);
  v1[138] = OpaqueTypeConformance2;
  v1[139] = v31;
  v32 = MEMORY[0x242615198](v23, v1[28], v1 + 138);
  *(_QWORD *)(v5 - 216) = v1[37];
  *(_QWORD *)(v5 - 208) = v1[36];
  v33 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 216) = v1[35];
  *(_QWORD *)(v5 - 208) = v1[34];
  v34 = swift_getOpaqueTypeConformance2();
  v1[136] = v33;
  v1[137] = v34;
  v35 = MEMORY[0x242615198](v23, v1[33], v1 + 136);
  v1[134] = v32;
  v1[135] = v35;
  v36 = MEMORY[0x242615198](v23, v1[12], v1 + 134);
  *(_QWORD *)(v5 - 216) = v1[32];
  *(_QWORD *)(v5 - 208) = v1[31];
  v37 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 216) = v1[30];
  *(_QWORD *)(v5 - 208) = v1[29];
  v38 = swift_getOpaqueTypeConformance2();
  v1[132] = v37;
  v1[133] = v38;
  v39 = MEMORY[0x242615198](v23, v1[21], v1 + 132);
  *(_QWORD *)(v5 - 216) = v1[27];
  *(_QWORD *)(v5 - 208) = v1[26];
  v1[130] = swift_getOpaqueTypeConformance2();
  v1[131] = v38;
  v40 = MEMORY[0x242615198](v23, v1[24], v1 + 130);
  v1[128] = v39;
  v1[129] = v40;
  v41 = MEMORY[0x242615198](v23, v1[25], v1 + 128);
  v1[126] = v36;
  v1[127] = v41;
  v42 = MEMORY[0x242615198](v23, *v1, v1 + 126);
  *(_QWORD *)(v5 - 216) = v1[23];
  *(_QWORD *)(v5 - 208) = v1[22];
  v43 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 216) = v1[20];
  *(_QWORD *)(v5 - 208) = v1[19];
  v44 = swift_getOpaqueTypeConformance2();
  v1[124] = v43;
  v1[125] = v44;
  v45 = MEMORY[0x242615198](v23, v1[3], v1 + 124);
  *(_QWORD *)(v5 - 216) = v1[18];
  *(_QWORD *)(v5 - 208) = v1[17];
  v46 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 216) = v1[16];
  *(_QWORD *)(v5 - 208) = v1[15];
  v47 = swift_getOpaqueTypeConformance2();
  v1[122] = v46;
  v1[123] = v47;
  v48 = MEMORY[0x242615198](v23, v1[14], v1 + 122);
  v1[120] = v45;
  v1[121] = v48;
  v49 = MEMORY[0x242615198](v23, v1[1], v1 + 120);
  v50 = v1[11];
  *(_QWORD *)(v5 - 216) = v15;
  *(_QWORD *)(v5 - 208) = v50;
  v1[118] = swift_getOpaqueTypeConformance2();
  v1[119] = v1[66];
  v51 = MEMORY[0x242615198](v23, v1[2], v1 + 118);
  v52 = v1[6];
  *(_QWORD *)(v5 - 216) = v18;
  *(_QWORD *)(v5 - 208) = v52;
  v53 = swift_getOpaqueTypeConformance2();
  v1[116] = v51;
  v1[117] = v53;
  v54 = MEMORY[0x242615198](v23, v1[4], v1 + 116);
  v1[114] = v49;
  v1[115] = v54;
  v55 = MEMORY[0x242615198](v23, v1[5], v1 + 114);
  v1[112] = v42;
  v1[113] = v55;
  v1[111] = MEMORY[0x242615198](v23, v1[7], v1 + 112);
  v1[109] = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v1[8], v1 + 111);
  v1[110] = v1[53];
  v56 = MEMORY[0x242615198](v26, v1[9], v1 + 109);
  v1[107] = MEMORY[0x24BDF5138];
  v1[108] = v56;
  v57 = MEMORY[0x242615198](v23, v1[10], v1 + 107);
  v58 = MEMORY[0x24BDF0910];
  v1[105] = v57;
  v1[106] = v58;
  v1[103] = MEMORY[0x242615198](v26, v1[13], v1 + 105);
  v1[104] = v58;
  v59 = v1[47];
  v60 = MEMORY[0x242615198](v26, v59, v1 + 103);
  *(_QWORD *)(v5 - 216) = v59;
  *(_QWORD *)(v5 - 208) = v60;
  MEMORY[0x24261512C](255, v5 - 216, MEMORY[0x24BEC6710], 0);
  sub_23BFF8968();
  v61 = v1[67];
  v62 = *(_QWORD *)(v61 + 48);
  v63 = *(_QWORD *)(v61 + 56);
  v1[48] = v63;
  v1[49] = v62;
  v64 = v61;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v66 = *(_QWORD *)(v64 + 152);
  v1[53] = v66;
  *(_QWORD *)(v5 - 216) = v62;
  *(_QWORD *)(v5 - 208) = v63;
  *(_QWORD *)(v5 - 200) = AssociatedConformanceWitness;
  *(_QWORD *)(v5 - 192) = v66;
  type metadata accessor for CanvasContextMenu();
}

uint64_t sub_23BFDE19C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t);
  _BYTE v27[96];

  v8 = sub_23BFF862C();
  v9 = *(_QWORD *)(v1 + 448);
  v10 = MEMORY[0x242615198](MEMORY[0x24BEE12D8], v9);
  v11 = *(_QWORD *)(v1 + 456);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v6 - 216) = v9;
  *(_QWORD *)(v6 - 208) = v11;
  *(_QWORD *)(v6 - 200) = v8;
  *(_QWORD *)(v6 - 192) = v10;
  *(_QWORD *)(v6 - 184) = AssociatedConformanceWitness;
  v13 = sub_23BFF910C();
  *(_QWORD *)(v6 - 216) = v2;
  *(_QWORD *)(v6 - 208) = v3;
  *(_QWORD *)(v1 + 808) = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v1 + 816) = v3;
  v14 = MEMORY[0x242615198](v4, v5, v1 + 808);
  v15 = MEMORY[0x242615198](&unk_23BFFEE18, a1);
  *(_QWORD *)(v1 + 792) = v14;
  *(_QWORD *)(v1 + 800) = v15;
  *(_QWORD *)(v1 + 784) = MEMORY[0x242615198](MEMORY[0x24BDED308], v8, v1 + 792);
  MEMORY[0x242615198](MEMORY[0x24BDF4A08], v13, v1 + 784);
  sub_23BFF8428();
  sub_23BFF862C();
  swift_getTupleTypeMetadata2();
  v16 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v16);
  v17 = sub_23BFF90AC();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = &v27[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v23 = &v27[-v22];
  sub_23BFF88A8();
  v24 = *(_QWORD *)(v1 + 536);
  *(_QWORD *)(v1 + 576) = *(_QWORD *)(v24 + 16);
  *(_QWORD *)(v1 + 584) = *(_QWORD *)(v1 + 408);
  *(_QWORD *)(v1 + 592) = *(_QWORD *)(v24 + 32);
  *(_QWORD *)(v1 + 600) = *(_QWORD *)(v1 + 512);
  *(_QWORD *)(v1 + 608) = *(_QWORD *)(v1 + 392);
  *(_QWORD *)(v1 + 616) = *(_QWORD *)(v1 + 384);
  *(_QWORD *)(v1 + 624) = *(_QWORD *)(v1 + 520);
  *(_OWORD *)(v1 + 632) = *(_OWORD *)(v24 + 72);
  *(_QWORD *)(v1 + 648) = *(_QWORD *)(v24 + 88);
  *(_QWORD *)(v1 + 656) = *(_QWORD *)(v1 + 480);
  *(_QWORD *)(v1 + 664) = *(_QWORD *)(v24 + 104);
  *(_QWORD *)(v1 + 672) = *(_QWORD *)(v1 + 432);
  *(_QWORD *)(v1 + 680) = *(_QWORD *)(v24 + 120);
  *(_QWORD *)(v1 + 688) = *(_QWORD *)(v1 + 544);
  *(_QWORD *)(v1 + 696) = *(_QWORD *)(v1 + 416);
  *(_QWORD *)(v1 + 704) = *(_QWORD *)(v1 + 400);
  *(_QWORD *)(v1 + 712) = *(_QWORD *)(v1 + 424);
  *(_QWORD *)(v1 + 720) = *(_QWORD *)(v1 + 528);
  *(_QWORD *)(v1 + 728) = *(_QWORD *)(v24 + 168);
  *(_QWORD *)(v1 + 736) = *(_QWORD *)(v1 + 488);
  *(_QWORD *)(v1 + 744) = *(_QWORD *)(v24 + 184);
  *(_QWORD *)(v1 + 752) = *(_QWORD *)(v1 + 440);
  *(_QWORD *)(v1 + 760) = *(_QWORD *)(v1 + 552);
  *(_QWORD *)(v1 + 768) = *(_QWORD *)(v1 + 496);
  sub_23BFF90A0();
  MEMORY[0x242615198](MEMORY[0x24BDF4700], v17);
  sub_23BEA72EC((uint64_t)v20, v17, (uint64_t)v23);
  v25 = *(void (**)(_BYTE *, uint64_t))(v18 + 8);
  v25(v20, v17);
  sub_23BEA5C0C((uint64_t)v23, v17, *(_QWORD *)(v1 + 504));
  return ((uint64_t (*)(_BYTE *, uint64_t))v25)(v23, v17);
}

void sub_23BFDE4A4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[184];

  v30[80] = a8;
  v30[66] = a7;
  v30[76] = a6;
  v30[62] = a2;
  v30[63] = a4;
  v30[49] = a1;
  v30[47] = a9;
  v30[78] = a26;
  v30[77] = a25;
  v30[67] = a24;
  v30[54] = a23;
  v30[65] = a22;
  v30[79] = a21;
  v30[75] = a20;
  v30[74] = a17;
  v30[59] = a16;
  v30[73] = a15;
  v30[58] = a14;
  v30[57] = a13;
  v30[72] = a12;
  v30[56] = a11;
  v30[55] = a10;
  v28 = sub_23BFF89D4();
  MEMORY[0x24BDAC7A8](v28);
  v30[46] = (char *)v30 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[70] = *(_QWORD *)(a26 + 32);
  v30[69] = swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  v30[68] = sub_23BFF94C0();
  v30[100] = a5;
  v30[101] = a3;
  v30[102] = a3;
  v30[103] = a19;
  v30[104] = a18;
  v30[105] = a18;
  type metadata accessor for ActionCardView();
}

void sub_23BFDE61C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
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

  v1[52] = a1;
  v8 = MEMORY[0x242615198](&unk_23C005608, a1);
  v1[51] = v8;
  v1[100] = a1;
  v1[101] = v8;
  v1[42] = MEMORY[0x24261512C](255, v1 + 100, MEMORY[0x24BDF3948], 0);
  v1[50] = sub_23BFF8ADC();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088];
  v10 = sub_23BFF862C();
  v11 = sub_23BFF862C();
  v1[48] = v11;
  v12 = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, v9, MEMORY[0x24BDF1078]);
  v1[53] = v12;
  *(_QWORD *)(v6 - 144) = v2;
  *(_QWORD *)(v6 - 136) = v12;
  v13 = v2;
  v14 = MEMORY[0x24BDED308];
  v15 = MEMORY[0x242615198](MEMORY[0x24BDED308], v10, v6 - 144);
  v16 = MEMORY[0x24BDEEC40];
  *(_QWORD *)(v6 - 160) = v15;
  *(_QWORD *)(v6 - 152) = v16;
  v17 = MEMORY[0x242615198](v14, v11, v6 - 160);
  v1[45] = v17;
  v1[100] = v11;
  v1[101] = v17;
  v18 = MEMORY[0x24BDF3100];
  MEMORY[0x24261512C](255, v1 + 100, MEMORY[0x24BDF3100], 0);
  v19 = sub_23BFF862C();
  v1[39] = v19;
  v20 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v6 - 176) = v15;
  *(_QWORD *)(v6 - 168) = v20;
  v21 = MEMORY[0x242615198](v14, v19, v6 - 176);
  v1[38] = v21;
  v1[100] = v19;
  v1[101] = v21;
  MEMORY[0x24261512C](255, v1 + 100, v18, 0);
  v1[36] = sub_23BFF8968();
  v1[40] = sub_23BFF8FD4();
  v1[37] = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3910);
  v1[43] = sub_23BFF8968();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3918);
  v1[44] = sub_23BFF8968();
  v1[28] = sub_23BFF8968();
  v1[100] = v5;
  v1[101] = v3;
  v1[102] = v3;
  v1[103] = v1[80];
  v1[104] = v1[73];
  v1[105] = v13;
  v1[106] = v4;
  v1[107] = v4;
  v1[108] = v1[79];
  v1[109] = v1[77];
  type metadata accessor for FullWidthStageView();
}

void sub_23BFDE860(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  v1[42] = a1;
  v7 = MEMORY[0x242615198](&unk_23C0077B8, a1);
  v1[41] = v7;
  v1[100] = a1;
  v1[101] = v7;
  v8 = MEMORY[0x24BDF3948];
  MEMORY[0x24261512C](255, v1 + 100, MEMORY[0x24BDF3948], 0);
  v1[71] = v3;
  v1[60] = v4;
  v10 = type metadata accessor for InfoActionCardView(255, v3, v4, v9);
  v1[35] = v10;
  v11 = MEMORY[0x242615198](&unk_23C007F20, v10);
  v1[34] = v11;
  v1[100] = v10;
  v1[101] = v11;
  MEMORY[0x24261512C](255, v1 + 100, v8, 0);
  v1[33] = sub_23BFF8968();
  v1[13] = sub_23BFF8968();
  v12 = v2;
  v14 = type metadata accessor for LargeBrickView(255, v5, v2, v13);
  v1[32] = v14;
  v15 = MEMORY[0x242615198](&protocol conformance descriptor for LargeBrickView<A>, v14);
  v1[31] = v15;
  v1[100] = v14;
  v1[101] = v15;
  v16 = v8;
  MEMORY[0x24261512C](255, v1 + 100, v8, 0);
  v17 = v12;
  v19 = type metadata accessor for DynamicBrickView(255, v5, v12, v18);
  v1[30] = v19;
  v20 = MEMORY[0x242615198](&protocol conformance descriptor for DynamicBrickView<A>, v19);
  v1[29] = v20;
  v1[100] = v19;
  v1[101] = v20;
  MEMORY[0x24261512C](255, v1 + 100, v16, 0);
  v1[21] = sub_23BFF8968();
  v22 = type metadata accessor for MonogramVerticalStackView(255, v5, v17, v21);
  v1[27] = v22;
  v23 = MEMORY[0x242615198](&unk_23BFFA1F4, v22);
  v1[26] = v23;
  v1[100] = v22;
  v1[101] = v23;
  MEMORY[0x24261512C](255, v1 + 100, v16, 0);
  v1[24] = sub_23BFF8968();
  v1[25] = sub_23BFF8968();
  v1[1] = sub_23BFF8968();
  v25 = type metadata accessor for StandardCardView(255, v5, v17, v24);
  v1[23] = v25;
  v26 = MEMORY[0x242615198](&unk_23C007BD0, v25);
  v1[22] = v26;
  v1[100] = v25;
  v1[101] = v26;
  MEMORY[0x24261512C](255, v1 + 100, v16, 0);
  v1[100] = v5;
  v1[101] = v3;
  v1[102] = v17;
  v1[103] = v4;
  type metadata accessor for StandardHorizontalStackView();
}

void sub_23BFDEACC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t AssociatedConformanceWitness;

  v1[20] = a1;
  v7 = MEMORY[0x242615198](&unk_23C0008E8, a1);
  v1[19] = v7;
  v1[100] = a1;
  v1[101] = v7;
  MEMORY[0x24261512C](255, v1 + 100, v2, 0);
  v1[4] = sub_23BFF8968();
  v9 = type metadata accessor for StandardVerticalStackView(255, v4, v3, v8);
  v1[18] = v9;
  v10 = MEMORY[0x242615198](&unk_23C0073B8, v9);
  v1[17] = v10;
  v1[100] = v9;
  v1[101] = v10;
  MEMORY[0x24261512C](255, v1 + 100, v2, 0);
  v12 = type metadata accessor for TallCardView(255, v4, v3, v11);
  v13 = MEMORY[0x242615198](&unk_23BFFF0E4, v12);
  v1[16] = v13;
  v1[100] = v12;
  v1[101] = v13;
  MEMORY[0x24261512C](255, v1 + 100, v2, 0);
  v1[15] = sub_23BFF8968();
  v1[2] = sub_23BFF8968();
  v1[64] = v4;
  v1[61] = v3;
  v15 = type metadata accessor for VerticalStackCard(255, v4, v3, v14);
  v16 = MEMORY[0x242615198](&unk_23C0000E0, v15);
  v1[12] = v16;
  v1[100] = v15;
  v1[101] = v16;
  MEMORY[0x24261512C](255, v1 + 100, v2, 0);
  v1[3] = sub_23BFF8968();
  v18 = type metadata accessor for WideBrickView(255, v4, v3, v17);
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for WideBrickView<A>, v18);
  v1[7] = v19;
  v1[100] = v18;
  v1[101] = v19;
  MEMORY[0x24261512C](255, v1 + 100, v2, 0);
  v1[5] = sub_23BFF8968();
  v1[6] = sub_23BFF8968();
  v1[8] = sub_23BFF8968();
  v1[9] = sub_23BFF8FD4();
  v1[10] = sub_23BFF862C();
  v1[11] = sub_23BFF8968();
  v1[14] = sub_23BFF862C();
  v1[50] = sub_23BFF862C();
  v1[100] = v1[52];
  v1[101] = v1[51];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v1[100] = v1[48];
  v1[101] = v1[45];
  v21 = swift_getOpaqueTypeConformance2();
  v1[100] = v1[39];
  v1[101] = v1[38];
  v22 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v5 - 192) = v21;
  *(_QWORD *)(v5 - 184) = v22;
  v23 = MEMORY[0x24BDEF3E0];
  *(_QWORD *)(v5 - 200) = MEMORY[0x242615198]();
  v24 = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v1[40], v5 - 200);
  v25 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v5 - 216) = v24;
  *(_QWORD *)(v5 - 208) = v25;
  v26 = MEMORY[0x24BDED308];
  v27 = MEMORY[0x242615198](MEMORY[0x24BDED308], v1[37], v5 - 216);
  v28 = sub_23BEA1F94(&qword_256AE3920, &qword_256AE3910, MEMORY[0x24BDF43B0]);
  *(_QWORD *)(v5 - 232) = v27;
  *(_QWORD *)(v5 - 224) = v28;
  v29 = MEMORY[0x242615198](v23, v1[43], v5 - 232);
  v30 = sub_23BEA1F94(&qword_256AE3928, &qword_256AE3918, MEMORY[0x24BDF4700]);
  *(_QWORD *)(v5 - 248) = v29;
  *(_QWORD *)(v5 - 240) = v30;
  v31 = MEMORY[0x242615198](v23, v1[44], v5 - 248);
  v1[165] = OpaqueTypeConformance2;
  v1[166] = v31;
  v32 = MEMORY[0x242615198](v23, v1[28], v1 + 165);
  v1[100] = v1[42];
  v1[101] = v1[41];
  v33 = swift_getOpaqueTypeConformance2();
  v1[100] = v1[35];
  v1[101] = v1[34];
  v34 = swift_getOpaqueTypeConformance2();
  v1[163] = v33;
  v1[164] = v34;
  v35 = MEMORY[0x242615198](v23, v1[33], v1 + 163);
  v1[161] = v32;
  v1[162] = v35;
  v36 = MEMORY[0x242615198](v23, v1[13], v1 + 161);
  v1[100] = v1[32];
  v1[101] = v1[31];
  v37 = swift_getOpaqueTypeConformance2();
  v1[100] = v1[30];
  v1[101] = v1[29];
  v38 = swift_getOpaqueTypeConformance2();
  v1[159] = v37;
  v1[160] = v38;
  v39 = MEMORY[0x242615198](v23, v1[21], v1 + 159);
  v1[100] = v1[27];
  v1[101] = v1[26];
  v1[157] = swift_getOpaqueTypeConformance2();
  v1[158] = v38;
  v40 = MEMORY[0x242615198](v23, v1[24], v1 + 157);
  v1[155] = v39;
  v1[156] = v40;
  v41 = MEMORY[0x242615198](v23, v1[25], v1 + 155);
  v1[153] = v36;
  v1[154] = v41;
  v42 = MEMORY[0x242615198](v23, v1[1], v1 + 153);
  v1[100] = v1[23];
  v1[101] = v1[22];
  v43 = swift_getOpaqueTypeConformance2();
  v1[100] = v1[20];
  v1[101] = v1[19];
  v44 = swift_getOpaqueTypeConformance2();
  v1[151] = v43;
  v1[152] = v44;
  v45 = MEMORY[0x242615198](v23, v1[4], v1 + 151);
  v1[100] = v1[18];
  v1[101] = v1[17];
  v46 = swift_getOpaqueTypeConformance2();
  v1[100] = v12;
  v1[101] = v1[16];
  v47 = swift_getOpaqueTypeConformance2();
  v1[149] = v46;
  v1[150] = v47;
  v48 = MEMORY[0x242615198](v23, v1[15], v1 + 149);
  v1[147] = v45;
  v1[148] = v48;
  v49 = MEMORY[0x242615198](v23, v1[2], v1 + 147);
  v1[100] = v15;
  v1[101] = v1[12];
  v1[145] = swift_getOpaqueTypeConformance2();
  v1[146] = v1[79];
  v50 = MEMORY[0x242615198](v23, v1[3], v1 + 145);
  v1[100] = v18;
  v1[101] = v1[7];
  v51 = swift_getOpaqueTypeConformance2();
  v1[143] = v50;
  v1[144] = v51;
  v52 = MEMORY[0x242615198](v23, v1[5], v1 + 143);
  v1[141] = v49;
  v1[142] = v52;
  v53 = MEMORY[0x242615198](v23, v1[6], v1 + 141);
  v1[139] = v42;
  v1[140] = v53;
  v1[138] = MEMORY[0x242615198](v23, v1[8], v1 + 139);
  v1[136] = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v1[9], v1 + 138);
  v1[137] = v1[53];
  v54 = MEMORY[0x242615198](v26, v1[10], v1 + 136);
  v1[134] = MEMORY[0x24BDF5138];
  v1[135] = v54;
  v55 = MEMORY[0x242615198](v23, v1[11], v1 + 134);
  v56 = MEMORY[0x24BDF0910];
  v1[132] = v55;
  v1[133] = v56;
  v1[130] = MEMORY[0x242615198](v26, v1[14], v1 + 132);
  v1[131] = v56;
  v57 = v1[50];
  v58 = MEMORY[0x242615198](v26, v57, v1 + 130);
  v1[100] = v57;
  v1[101] = v58;
  MEMORY[0x24261512C](255, v1 + 100, MEMORY[0x24BEC6710], 0);
  sub_23BFF8968();
  v59 = v1[76];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v1[100] = v59;
  v1[101] = v1[66];
  v1[102] = AssociatedConformanceWitness;
  v1[103] = v1[75];
  type metadata accessor for CanvasContextMenu();
}

void sub_23BFDF244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t AssociatedConformanceWitness;
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

  v15 = sub_23BFF862C();
  v16 = v9[68];
  v17 = MEMORY[0x242615198](MEMORY[0x24BEE12D8], v16);
  v18 = v9[69];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9[100] = v16;
  v9[101] = v18;
  v9[102] = v15;
  v9[103] = v17;
  v9[104] = AssociatedConformanceWitness;
  v20 = sub_23BFF910C();
  v9[100] = v11;
  v9[101] = v10;
  v9[128] = swift_getOpaqueTypeConformance2();
  v9[129] = v10;
  v21 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v13, v9 + 128);
  v22 = MEMORY[0x242615198](&unk_23BFFEE18, a1);
  v9[126] = v21;
  v9[127] = v22;
  v9[125] = MEMORY[0x242615198](MEMORY[0x24BDED308], v15, v9 + 126);
  v23 = MEMORY[0x242615198](MEMORY[0x24BDF4A08], v20, v9 + 125);
  v9[42] = v20;
  v9[37] = v23;
  v24 = sub_23BFF8428();
  v9[39] = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9[38] = (char *)&a9 - v25;
  v9[40] = v26;
  v27 = sub_23BFF862C();
  v9[45] = v27;
  v9[41] = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v9[44] = (char *)&a9 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v9[43] = (char *)&a9 - v30;
  v31 = v9[63];
  v9[100] = v9[62];
  v9[101] = v9[71];
  v9[102] = v31;
  v9[103] = v9[64];
  v9[104] = v9[76];
  v9[105] = v12;
  v9[106] = v9[80];
  v9[107] = v9[55];
  v32 = v9[57];
  v9[108] = v9[56];
  v9[109] = v9[72];
  v9[110] = v32;
  v9[111] = v9[58];
  v9[112] = v9[73];
  v33 = v9[60];
  v9[113] = v9[59];
  v9[114] = v9[74];
  v9[115] = v33;
  v9[116] = v9[61];
  v9[117] = v9[75];
  v9[118] = v9[79];
  v9[119] = v9[65];
  v9[120] = v9[54];
  v9[121] = v9[67];
  v9[122] = v9[77];
  v9[123] = v9[78];
  type metadata accessor for ListView();
}

void sub_23BFDF4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9[48] = a1;
  v14 = *(_QWORD *)(a1 - 8);
  v9[32] = v14;
  v9[31] = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9[36] = (char *)&a9 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3528);
  v9[100] = v11;
  v9[101] = v13;
  v9[102] = v10;
  v9[103] = v12;
  type metadata accessor for CanvasSectionHeaderView();
}

void sub_23BFDF514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t AssociatedConformanceWitness;

  sub_23BFF8A4C();
  v9[52] = a1;
  v9[53] = sub_23BFF862C();
  v13 = sub_23BFF8968();
  v9[35] = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v9[33] = (char *)&a9 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v9[34] = (char *)&a9 - v16;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9[100] = v10;
  v9[101] = v9[72];
  v9[102] = AssociatedConformanceWitness;
  v9[103] = v11;
  type metadata accessor for CanvasSectionHeader();
}

uint64_t sub_23BFDF5E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  unint64_t v25;
  char *v26;
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
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  __int128 v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[96];

  v4 = sub_23BFF96A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v85[-v6];
  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v85[-v10];
  *(_QWORD *)(v1 + 544) = v2;
  v12 = sub_23BFF96A0();
  *(_QWORD *)(v1 + 400) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v1 + 408) = v12;
  MEMORY[0x24BDAC7A8](v12);
  *(_QWORD *)(v1 + 560) = &v85[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v14);
  *(_QWORD *)(v1 + 552) = &v85[-v16];
  v17 = *(_QWORD *)(v1 + 392);
  (*(void (**)(_BYTE *, __n128))(v5 + 16))(v7, v15);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v7, 1, a1) != 1)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v11, v7, a1);
    *(_QWORD *)(v1 + 240) = v11;
    v23 = *(_QWORD *)(v1 + 256);
    v24 = *(int **)(v1 + 384);
    (*(void (**)(_QWORD, uint64_t, int *))(v23 + 16))(*(_QWORD *)(v1 + 288), v17, v24);
    v25 = (*(unsigned __int8 *)(v23 + 80) + 208) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v26 = (char *)swift_allocObject();
    v27 = *(_QWORD *)(v1 + 568);
    *((_QWORD *)v26 + 2) = *(_QWORD *)(v1 + 496);
    *((_QWORD *)v26 + 3) = v27;
    v28 = *(_QWORD *)(v1 + 512);
    *((_QWORD *)v26 + 4) = *(_QWORD *)(v1 + 504);
    *((_QWORD *)v26 + 5) = v28;
    v29 = *(_QWORD *)(v1 + 528);
    *((_QWORD *)v26 + 6) = *(_QWORD *)(v1 + 608);
    *((_QWORD *)v26 + 7) = v29;
    v30 = *(_QWORD *)(v1 + 440);
    *((_QWORD *)v26 + 8) = *(_QWORD *)(v1 + 640);
    *((_QWORD *)v26 + 9) = v30;
    v31 = *(_QWORD *)(v1 + 456);
    v32 = *(_QWORD *)(v1 + 576);
    *((_QWORD *)v26 + 10) = *(_QWORD *)(v1 + 448);
    *((_QWORD *)v26 + 11) = v32;
    v33 = *(_QWORD *)(v1 + 464);
    *((_QWORD *)v26 + 12) = v31;
    *((_QWORD *)v26 + 13) = v33;
    v34 = *(_QWORD *)(v1 + 472);
    v35 = *(_QWORD *)(v1 + 480);
    *((_QWORD *)v26 + 14) = *(_QWORD *)(v1 + 584);
    *((_QWORD *)v26 + 15) = v34;
    *((_QWORD *)v26 + 16) = *(_QWORD *)(v1 + 592);
    *((_QWORD *)v26 + 17) = v35;
    v36 = *(_QWORD *)(v1 + 600);
    *((_QWORD *)v26 + 18) = *(_QWORD *)(v1 + 488);
    *((_QWORD *)v26 + 19) = v36;
    v37 = *(_QWORD *)(v1 + 520);
    *((_QWORD *)v26 + 20) = *(_QWORD *)(v1 + 632);
    *((_QWORD *)v26 + 21) = v37;
    v38 = *(_QWORD *)(v1 + 432);
    v39 = *(_QWORD *)(v1 + 536);
    *((_QWORD *)v26 + 22) = v38;
    *((_QWORD *)v26 + 23) = v39;
    v40 = *(_QWORD *)(v1 + 624);
    *((_QWORD *)v26 + 24) = *(_QWORD *)(v1 + 616);
    *((_QWORD *)v26 + 25) = v40;
    (*(void (**)(char *, _QWORD, int *))(v23 + 32))(&v26[v25], *(_QWORD *)(v1 + 288), v24);
    v41 = *(_QWORD *)(v1 + 392);
    v42 = (uint64_t *)(v41 + v24[64]);
    v43 = *v42;
    v44 = v42[1];
    v45 = (_OWORD *)(v41 + v24[56]);
    v46 = v45[1];
    *(_OWORD *)(v1 + 800) = *v45;
    *(_OWORD *)(v1 + 816) = v46;
    v47 = *(unsigned __int8 *)(v41 + v24[58]);
    v83 = v35;
    v84 = v38;
    sub_23BFF67FC((uint64_t)sub_23BFE7150, (uint64_t)v26, v43, v44, v47, *(_QWORD *)(v1 + 568), *(_QWORD *)(v1 + 264), v31, v35, v38);
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  v18 = *(_QWORD *)(v1 + 544);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 + 280) + 56))(*(_QWORD *)(v1 + 560), 1, 1, v18);
  v19 = sub_23BF0A0F0();
  v20 = MEMORY[0x242615198](&unk_23C0051E8, *(_QWORD *)(v1 + 416));
  v21 = sub_23BEA1BB8((unint64_t *)&qword_256AE5188, (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8], MEMORY[0x24BDF02F0]);
  *(_QWORD *)(v1 + 784) = v20;
  *(_QWORD *)(v1 + 792) = v21;
  v22 = MEMORY[0x242615198](MEMORY[0x24BDED308], *(_QWORD *)(v1 + 424), v1 + 784);
  *(_QWORD *)(v1 + 768) = v19;
  *(_QWORD *)(v1 + 776) = v22;
  MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v18, v1 + 768);
  v48 = *(_QWORD *)(v1 + 432);
  v49 = *(_QWORD *)(v1 + 560);
  sub_23BF3FAD4(v49, *(_QWORD *)(v1 + 552));
  v50 = *(_QWORD *)(v1 + 408);
  v51 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 400) + 8);
  *(_QWORD *)(v1 + 288) = v51;
  v51(v49, v50);
  v52 = sub_23BFF88A8();
  *(_QWORD *)(v1 + 280) = v85;
  MEMORY[0x24BDAC7A8](v52);
  v53 = *(_QWORD *)(v1 + 568);
  *(_QWORD *)&v85[-208] = *(_QWORD *)(v1 + 496);
  *(_QWORD *)&v85[-200] = v53;
  v54 = *(_QWORD *)(v1 + 512);
  *(_QWORD *)&v85[-192] = *(_QWORD *)(v1 + 504);
  *(_QWORD *)&v85[-184] = v54;
  v55 = *(_QWORD *)(v1 + 528);
  *(_QWORD *)&v85[-176] = *(_QWORD *)(v1 + 608);
  *(_QWORD *)&v85[-168] = v55;
  v56 = *(_QWORD *)(v1 + 440);
  *(_QWORD *)&v85[-160] = *(_QWORD *)(v1 + 640);
  *(_QWORD *)&v85[-152] = v56;
  v57 = *(_QWORD *)(v1 + 576);
  *(_QWORD *)&v85[-144] = *(_QWORD *)(v1 + 448);
  *(_QWORD *)&v85[-136] = v57;
  v58 = *(_QWORD *)(v1 + 464);
  *(_QWORD *)&v85[-128] = *(_QWORD *)(v1 + 456);
  *(_QWORD *)&v85[-120] = v58;
  v59 = *(_QWORD *)(v1 + 472);
  *(_QWORD *)&v85[-112] = *(_QWORD *)(v1 + 584);
  *(_QWORD *)&v85[-104] = v59;
  v60 = *(_QWORD *)(v1 + 480);
  *(_QWORD *)&v85[-96] = *(_QWORD *)(v1 + 592);
  *(_QWORD *)&v85[-88] = v60;
  v61 = *(_QWORD *)(v1 + 600);
  *(_QWORD *)&v85[-80] = *(_QWORD *)(v1 + 488);
  *(_QWORD *)&v85[-72] = v61;
  v62 = *(_QWORD *)(v1 + 520);
  *(_QWORD *)&v85[-64] = *(_QWORD *)(v1 + 632);
  *(_QWORD *)&v85[-56] = v62;
  v63 = *(_QWORD *)(v1 + 536);
  *(_QWORD *)&v85[-48] = v48;
  *(_QWORD *)&v85[-40] = v63;
  v64 = *(_QWORD *)(v1 + 624);
  v82 = *(_QWORD *)(v1 + 616);
  v83 = v64;
  v84 = v17;
  sub_23BF0EF38();
  v65 = *(_QWORD *)(v1 + 304);
  sub_23BFF841C();
  v66 = *(_QWORD *)(v1 + 320);
  v67 = MEMORY[0x242615198](MEMORY[0x24BDEB188], v66);
  v68 = *(_QWORD *)(v1 + 352);
  sub_23BFF8EE4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 312) + 8))(v65, v66);
  *(_QWORD *)(v1 + 752) = v67;
  *(_QWORD *)(v1 + 760) = MEMORY[0x24BDECC60];
  v69 = *(_QWORD *)(v1 + 360);
  v70 = MEMORY[0x242615198](MEMORY[0x24BDED308], v69, v1 + 752);
  v71 = *(_QWORD *)(v1 + 344);
  sub_23BEA72EC(v68, v69, v71);
  v72 = *(_QWORD *)(v1 + 328);
  v73 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
  v73(v68, v69);
  v74 = *(_QWORD *)(v1 + 408);
  v75 = *(_QWORD *)(v1 + 560);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v1 + 400) + 16))(v75, *(_QWORD *)(v1 + 552), v74);
  *(_QWORD *)(v1 + 800) = v75;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v68, v71, v69);
  *(_QWORD *)(v1 + 808) = v68;
  *(_QWORD *)(v1 + 736) = v74;
  *(_QWORD *)(v1 + 744) = v69;
  v76 = sub_23BF0A0F0();
  v77 = MEMORY[0x242615198](&unk_23C0051E8, *(_QWORD *)(v1 + 416));
  v78 = sub_23BEA1BB8((unint64_t *)&qword_256AE5188, (uint64_t (*)(uint64_t))MEMORY[0x24BDF02F8], MEMORY[0x24BDF02F0]);
  *(_QWORD *)(v1 + 704) = v77;
  *(_QWORD *)(v1 + 712) = v78;
  v79 = MEMORY[0x242615198](MEMORY[0x24BDED308], *(_QWORD *)(v1 + 424), v1 + 704);
  *(_QWORD *)(v1 + 688) = v76;
  *(_QWORD *)(v1 + 696) = v79;
  *(_QWORD *)(v1 + 680) = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], *(_QWORD *)(v1 + 544), v1 + 688);
  *(_QWORD *)(v1 + 720) = MEMORY[0x242615198](MEMORY[0x24BDF5578], v74, v1 + 680);
  *(_QWORD *)(v1 + 728) = v70;
  sub_23BF93EF0((uint64_t *)(v1 + 800), 2uLL, v1 + 736);
  v73(v71, v69);
  v80 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 288);
  v80(*(_QWORD *)(v1 + 552), v74);
  v73(v68, v69);
  return v80(v75, v74);
}

void sub_23BFDFD30()
{
  sub_23BF140F8((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFDE4A4);
}

uint64_t sub_23BFDFD3C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23BFDFD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23BFF96A0();
  MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for ListView();
}

uint64_t sub_23BFDFF94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(v3 + *(int *)(a1 + 244));
  v10 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v7, *(_QWORD *)(v8 - 312), v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v5);
  v9(v7, 0, 1);
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v7, *(_QWORD *)(v8 - 296));
  sub_23BEA72EC(v6, v1, v4);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 304) + 8);
  v11(v6, v1);
  sub_23BEA5C0C(v4, v1, *(_QWORD *)(v8 - 288));
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v4, v1);
}

void sub_23BFE006C()
{
  type metadata accessor for ListView();
}

void sub_23BFE0198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = *(_QWORD *)(a1 - 8);
  v9[54] = a1;
  v9[55] = v15;
  v9[56] = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9[53] = (char *)&a9 - v16;
  v9[79] = *(_QWORD *)(v10 + 32);
  v9[72] = swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  v9[52] = sub_23BFF94C0();
  v9[139] = v14;
  v9[140] = v13;
  v9[141] = v13;
  v9[142] = v12;
  v9[143] = v11;
  v9[144] = v11;
  type metadata accessor for ActionCardView();
}

void sub_23BFE0244(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
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

  v1[46] = a1;
  v7 = MEMORY[0x242615198](&unk_23C005608, a1);
  v1[45] = v7;
  v1[139] = a1;
  v1[140] = v7;
  v1[40] = MEMORY[0x24261512C](255, v1 + 139, MEMORY[0x24BDF3948], 0);
  v1[70] = sub_23BFF8ADC();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088];
  v9 = sub_23BFF862C();
  v10 = sub_23BFF862C();
  v1[44] = v10;
  v11 = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, v8, MEMORY[0x24BDF1078]);
  v1[51] = v11;
  v1[137] = v3;
  v1[138] = v11;
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x242615198](MEMORY[0x24BDED308], v9, v1 + 137);
  v14 = MEMORY[0x24BDEEC40];
  v1[135] = v13;
  v1[136] = v14;
  v15 = MEMORY[0x242615198](v12, v10, v1 + 135);
  v1[43] = v15;
  v1[139] = v10;
  v1[140] = v15;
  v16 = MEMORY[0x24BDF3100];
  MEMORY[0x24261512C](255, v1 + 139, MEMORY[0x24BDF3100], 0);
  v17 = sub_23BFF862C();
  v1[37] = v17;
  v18 = MEMORY[0x24BDEBEE0];
  v1[133] = v13;
  v1[134] = v18;
  v19 = MEMORY[0x242615198](v12, v17, v1 + 133);
  v1[36] = v19;
  v1[139] = v17;
  v1[140] = v19;
  MEMORY[0x24261512C](255, v1 + 139, v16, 0);
  v1[34] = sub_23BFF8968();
  v1[38] = sub_23BFF8FD4();
  v1[35] = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3910);
  v1[41] = sub_23BFF8968();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3918);
  v1[42] = sub_23BFF8968();
  v1[26] = sub_23BFF8968();
  v1[139] = v5;
  v1[140] = v4;
  v1[141] = v4;
  v1[142] = v1[80];
  v1[143] = v1[77];
  v1[144] = v3;
  v1[145] = v2;
  v1[146] = v2;
  v1[147] = v1[81];
  v1[148] = v1[78];
  type metadata accessor for FullWidthStageView();
}

void sub_23BFE0490(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  v1[40] = a1;
  v7 = MEMORY[0x242615198](&unk_23C0077B8, a1);
  v1[39] = v7;
  v1[139] = a1;
  v1[140] = v7;
  v8 = MEMORY[0x24BDF3948];
  MEMORY[0x24261512C](255, v1 + 139, MEMORY[0x24BDF3948], 0);
  v9 = v4;
  v1[49] = v4;
  v1[50] = v2;
  v11 = type metadata accessor for InfoActionCardView(255, v4, v2, v10);
  v1[33] = v11;
  v12 = MEMORY[0x242615198](&unk_23C007F20, v11);
  v1[32] = v12;
  v1[139] = v11;
  v1[140] = v12;
  MEMORY[0x24261512C](255, v1 + 139, v8, 0);
  v1[31] = sub_23BFF8968();
  v1[12] = sub_23BFF8968();
  v14 = type metadata accessor for LargeBrickView(255, v5, v3, v13);
  v1[30] = v14;
  v15 = MEMORY[0x242615198](&protocol conformance descriptor for LargeBrickView<A>, v14);
  v1[29] = v15;
  v1[139] = v14;
  v1[140] = v15;
  MEMORY[0x24261512C](255, v1 + 139, v8, 0);
  v17 = type metadata accessor for DynamicBrickView(255, v5, v3, v16);
  v1[28] = v17;
  v18 = MEMORY[0x242615198](&protocol conformance descriptor for DynamicBrickView<A>, v17);
  v1[27] = v18;
  v1[139] = v17;
  v1[140] = v18;
  MEMORY[0x24261512C](255, v1 + 139, v8, 0);
  v1[19] = sub_23BFF8968();
  v20 = type metadata accessor for MonogramVerticalStackView(255, v5, v3, v19);
  v1[25] = v20;
  v21 = MEMORY[0x242615198](&unk_23BFFA1F4, v20);
  v1[24] = v21;
  v1[139] = v20;
  v1[140] = v21;
  MEMORY[0x24261512C](255, v1 + 139, v8, 0);
  v1[22] = sub_23BFF8968();
  v1[23] = sub_23BFF8968();
  sub_23BFF8968();
  v23 = type metadata accessor for StandardCardView(255, v5, v3, v22);
  v1[21] = v23;
  v24 = MEMORY[0x242615198](&unk_23C007BD0, v23);
  v1[20] = v24;
  v1[139] = v23;
  v1[140] = v24;
  MEMORY[0x24261512C](255, v1 + 139, v8, 0);
  v1[139] = v5;
  v1[140] = v9;
  v1[141] = v3;
  v1[142] = v2;
  type metadata accessor for StandardHorizontalStackView();
}

void sub_23BFE06EC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t AssociatedConformanceWitness;

  v1[18] = a1;
  v7 = MEMORY[0x242615198](&unk_23C0008E8, a1);
  v1[17] = v7;
  v1[139] = a1;
  v1[140] = v7;
  MEMORY[0x24261512C](255, v1 + 139, v2, 0);
  v1[2] = sub_23BFF8968();
  v9 = type metadata accessor for StandardVerticalStackView(255, v5, v3, v8);
  v1[11] = v9;
  v10 = MEMORY[0x242615198](&unk_23C0073B8, v9);
  v1[16] = v10;
  v1[139] = v9;
  v1[140] = v10;
  MEMORY[0x24261512C](255, v1 + 139, v2, 0);
  v12 = type metadata accessor for TallCardView(255, v5, v3, v11);
  v13 = MEMORY[0x242615198](&unk_23BFFF0E4, v12);
  v1[15] = v13;
  v1[139] = v12;
  v1[140] = v13;
  MEMORY[0x24261512C](255, v1 + 139, v2, 0);
  v1[14] = sub_23BFF8968();
  *v1 = sub_23BFF8968();
  v1[47] = v5;
  v1[48] = v3;
  v15 = type metadata accessor for VerticalStackCard(255, v5, v3, v14);
  v16 = MEMORY[0x242615198](&unk_23C0000E0, v15);
  v1[10] = v16;
  v1[139] = v15;
  v1[140] = v16;
  MEMORY[0x24261512C](255, v1 + 139, v2, 0);
  v1[1] = sub_23BFF8968();
  v18 = type metadata accessor for WideBrickView(255, v5, v3, v17);
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for WideBrickView<A>, v18);
  v1[5] = v19;
  v1[139] = v18;
  v1[140] = v19;
  MEMORY[0x24261512C](255, v1 + 139, v2, 0);
  v1[3] = sub_23BFF8968();
  v1[4] = sub_23BFF8968();
  v20 = v4;
  v1[6] = sub_23BFF8968();
  v1[7] = sub_23BFF8FD4();
  v1[8] = sub_23BFF862C();
  v1[9] = sub_23BFF8968();
  v1[13] = sub_23BFF862C();
  v1[70] = sub_23BFF862C();
  v1[139] = v1[46];
  v1[140] = v1[45];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v1[139] = v1[44];
  v1[140] = v1[43];
  v22 = swift_getOpaqueTypeConformance2();
  v1[139] = v1[37];
  v1[140] = v1[36];
  v23 = swift_getOpaqueTypeConformance2();
  v1[131] = v22;
  v1[132] = v23;
  v24 = MEMORY[0x24BDEF3E0];
  v1[130] = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v1[34], v1 + 131);
  v25 = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v1[38], v1 + 130);
  v26 = MEMORY[0x24BDECC60];
  v1[128] = v25;
  v1[129] = v26;
  v27 = MEMORY[0x242615198](MEMORY[0x24BDED308], v1[35], v1 + 128);
  v28 = sub_23BEA1F94(&qword_256AE3920, &qword_256AE3910, MEMORY[0x24BDF43B0]);
  v1[126] = v27;
  v1[127] = v28;
  v29 = MEMORY[0x242615198](v24, v1[41], v1 + 126);
  v30 = sub_23BEA1F94(&qword_256AE3928, &qword_256AE3918, MEMORY[0x24BDF4700]);
  v1[124] = v29;
  v1[125] = v30;
  v31 = MEMORY[0x242615198](v24, v1[42], v1 + 124);
  v1[122] = OpaqueTypeConformance2;
  v1[123] = v31;
  v32 = MEMORY[0x242615198](v24, v1[26], v1 + 122);
  v1[139] = v1[40];
  v1[140] = v1[39];
  v33 = swift_getOpaqueTypeConformance2();
  v1[139] = v1[33];
  v1[140] = v1[32];
  v34 = swift_getOpaqueTypeConformance2();
  v1[120] = v33;
  v1[121] = v34;
  v35 = MEMORY[0x242615198](v24, v1[31], v1 + 120);
  v1[118] = v32;
  v1[119] = v35;
  v36 = MEMORY[0x242615198](v24, v1[12], v1 + 118);
  v1[139] = v1[30];
  v1[140] = v1[29];
  v37 = swift_getOpaqueTypeConformance2();
  v1[139] = v1[28];
  v1[140] = v1[27];
  v38 = swift_getOpaqueTypeConformance2();
  v1[116] = v37;
  v1[117] = v38;
  v39 = MEMORY[0x242615198](v24, v1[19], v1 + 116);
  v1[139] = v1[25];
  v1[140] = v1[24];
  v1[114] = swift_getOpaqueTypeConformance2();
  v1[115] = v38;
  v40 = MEMORY[0x242615198](v24, v1[22], v1 + 114);
  v1[112] = v39;
  v1[113] = v40;
  v41 = MEMORY[0x242615198](v24, v1[23], v1 + 112);
  v1[110] = v36;
  v1[111] = v41;
  v42 = MEMORY[0x242615198](v24, v20, v1 + 110);
  v1[139] = v1[21];
  v1[140] = v1[20];
  v43 = swift_getOpaqueTypeConformance2();
  v1[139] = v1[18];
  v1[140] = v1[17];
  v44 = swift_getOpaqueTypeConformance2();
  v1[108] = v43;
  v1[109] = v44;
  v45 = MEMORY[0x242615198](v24, v1[2], v1 + 108);
  v1[139] = v1[11];
  v1[140] = v1[16];
  v46 = swift_getOpaqueTypeConformance2();
  v1[139] = v12;
  v1[140] = v1[15];
  v47 = swift_getOpaqueTypeConformance2();
  v1[106] = v46;
  v1[107] = v47;
  v48 = MEMORY[0x242615198](v24, v1[14], v1 + 106);
  v1[104] = v45;
  v1[105] = v48;
  v49 = MEMORY[0x242615198](v24, *v1, v1 + 104);
  v1[139] = v15;
  v1[140] = v1[10];
  v1[102] = swift_getOpaqueTypeConformance2();
  v1[103] = v1[81];
  v50 = MEMORY[0x242615198](v24, v1[1], v1 + 102);
  v1[139] = v18;
  v1[140] = v1[5];
  v51 = swift_getOpaqueTypeConformance2();
  v1[100] = v50;
  v1[101] = v51;
  v52 = MEMORY[0x242615198](v24, v1[3], v1 + 100);
  v1[98] = v49;
  v1[99] = v52;
  v53 = MEMORY[0x242615198](v24, v1[4], v1 + 98);
  v1[96] = v42;
  v1[97] = v53;
  v1[95] = MEMORY[0x242615198](v24, v1[6], v1 + 96);
  v1[93] = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v1[7], v1 + 95);
  v1[94] = v1[51];
  v54 = MEMORY[0x24BDED308];
  v55 = MEMORY[0x242615198](MEMORY[0x24BDED308], v1[8], v1 + 93);
  v1[91] = MEMORY[0x24BDF5138];
  v1[92] = v55;
  v56 = MEMORY[0x242615198](v24, v1[9], v1 + 91);
  v57 = MEMORY[0x24BDF0910];
  v1[89] = v56;
  v1[90] = v57;
  v1[87] = MEMORY[0x242615198](v54, v1[13], v1 + 89);
  v1[88] = v57;
  v58 = v1[70];
  v59 = MEMORY[0x242615198](v54, v58, v1 + 87);
  v1[51] = v59;
  v1[139] = v58;
  v1[140] = v59;
  MEMORY[0x24261512C](255, v1 + 139, MEMORY[0x24BEC6710], 0);
  v1[45] = sub_23BFF8968();
  v60 = v1[73];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v1[139] = v60;
  v1[140] = v1[74];
  v1[141] = AssociatedConformanceWitness;
  v1[142] = v1[76];
  type metadata accessor for CanvasContextMenu();
}

uint64_t sub_23BFE0E7C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
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
  void (*v38)(_BYTE *, uint64_t);
  _BYTE v40[80];

  v1[46] = a1;
  v3 = sub_23BFF862C();
  v1[44] = v3;
  v4 = v1[52];
  v5 = MEMORY[0x242615198](MEMORY[0x24BEE12D8], v4);
  v6 = v1[72];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v1[139] = v4;
  v1[140] = v6;
  v1[141] = v3;
  v1[142] = v5;
  v1[143] = AssociatedConformanceWitness;
  v8 = sub_23BFF910C();
  v1[52] = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v40[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = &v40[-v13];
  v16 = v1[54];
  v15 = v1[55];
  v1[43] = *(_QWORD *)(v1[57] + *(int *)(v16 + 212));
  v17 = v1[53];
  (*(void (**)(uint64_t, __n128))(v15 + 16))(v17, v12);
  v18 = (*(unsigned __int8 *)(v15 + 80) + 208) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v19 = (char *)swift_allocObject();
  v20 = v1[49];
  *((_QWORD *)v19 + 2) = v1[64];
  *((_QWORD *)v19 + 3) = v20;
  v21 = v1[47];
  *((_QWORD *)v19 + 4) = v1[65];
  *((_QWORD *)v19 + 5) = v21;
  v22 = v1[74];
  *((_QWORD *)v19 + 6) = v1[73];
  *((_QWORD *)v19 + 7) = v22;
  v23 = v1[58];
  *((_QWORD *)v19 + 8) = v1[80];
  *((_QWORD *)v19 + 9) = v23;
  v24 = v1[60];
  *((_QWORD *)v19 + 10) = v1[59];
  *((_QWORD *)v19 + 11) = v24;
  v25 = v1[62];
  *((_QWORD *)v19 + 12) = v1[61];
  *((_QWORD *)v19 + 13) = v25;
  v26 = v1[63];
  *((_QWORD *)v19 + 14) = v1[77];
  *((_QWORD *)v19 + 15) = v26;
  v27 = v1[50];
  *((_QWORD *)v19 + 16) = v2;
  *((_QWORD *)v19 + 17) = v27;
  v28 = v1[76];
  *((_QWORD *)v19 + 18) = v1[48];
  *((_QWORD *)v19 + 19) = v28;
  v29 = v1[66];
  *((_QWORD *)v19 + 20) = v1[81];
  *((_QWORD *)v19 + 21) = v29;
  v30 = v1[68];
  *((_QWORD *)v19 + 22) = v1[67];
  *((_QWORD *)v19 + 23) = v30;
  v31 = v1[75];
  *((_QWORD *)v19 + 24) = v1[78];
  *((_QWORD *)v19 + 25) = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(&v19[v18], v17, v16);
  v32 = v1[43];
  swift_bridgeObjectRetain();
  v1[139] = v1[70];
  v33 = v1[51];
  v1[140] = v33;
  v1[85] = swift_getOpaqueTypeConformance2();
  v1[86] = v33;
  v34 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v1[45], v1 + 85);
  v35 = MEMORY[0x242615198](&unk_23BFFEE18, v1[46]);
  v1[83] = v34;
  v1[84] = v35;
  v36 = v1[44];
  v37 = MEMORY[0x242615198](MEMORY[0x24BDED308], v36, v1 + 83);
  sub_23BF49C10(v32, (uint64_t)sub_23BFE7578, (uint64_t)v19, v1[72], v36, v1[71], v37, *(_QWORD *)(v31 + 24), v1[79]);
  v1[82] = v37;
  MEMORY[0x242615198](MEMORY[0x24BDF4A08], v8, v1 + 82);
  sub_23BEA72EC((uint64_t)v10, v8, (uint64_t)v14);
  v38 = *(void (**)(_BYTE *, uint64_t))(v1[52] + 8);
  v38(v10, v8);
  sub_23BEA5C0C((uint64_t)v14, v8, v1[69]);
  return ((uint64_t (*)(_BYTE *, uint64_t))v38)(v14, v8);
}

void sub_23BFE1174(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[54];
  uint64_t AssociatedConformanceWitness;
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

  v43 = a6;
  v41 = a5;
  v40 = a4;
  v39 = a3;
  v33 = a2;
  v34 = a1;
  v32 = a8;
  v45 = a26;
  v42 = a25;
  v48 = a24;
  v47 = a23;
  v44 = a20;
  v51 = a19;
  v49 = a14;
  v46 = a13;
  v55 = a12;
  v53 = a11;
  v56 = a15;
  v52 = a22;
  v50 = a10;
  v54 = a17;
  v28 = sub_23BFF96A0();
  MEMORY[0x24BDAC7A8](v28);
  v30[53] = (char *)v30 - v29;
  v36 = a27;
  v38 = a7;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v57 = a7;
  v37 = a9;
  v58 = a9;
  v59 = AssociatedConformanceWitness;
  v60 = a21;
  v35 = a21;
  type metadata accessor for CanvasContextMenu();
}

void sub_23BFE12C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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

  v9[71] = a1;
  v9[55] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9[52] = (char *)&a9 - v18;
  v9[72] = v12;
  v9[70] = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v9[69] = (char *)&a9 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(v11 - 8);
  v9[67] = v21;
  v9[73] = v11;
  v9[51] = *(_QWORD *)(v21 + 64);
  MEMORY[0x24BDAC7A8](v22);
  v9[68] = (char *)&a9 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[212] = v9[82];
  v9[213] = v16;
  v9[214] = v9[83];
  v9[215] = v9[85];
  v9[216] = v14;
  v9[217] = v17;
  v9[218] = v13;
  v9[219] = v9[96];
  v9[220] = v9[98];
  v9[221] = v9[89];
  v9[222] = v9[92];
  v9[223] = v9[99];
  v9[224] = v12;
  v9[225] = v9[97];
  v9[226] = v11;
  v9[227] = v9[94];
  v9[228] = v9[86];
  v9[229] = v15;
  v9[230] = v9[95];
  v9[231] = v9[90];
  v9[232] = v9[91];
  v9[233] = v9[84];
  v9[234] = v9[87];
  v9[235] = v10;
  type metadata accessor for ListView();
}

void sub_23BFE141C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9[88] = a1;
  v14 = *(_QWORD *)(a1 - 8);
  v9[66] = v14;
  v9[59] = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9[65] = (char *)&a9 - v15;
  v9[212] = v11;
  v9[76] = v12;
  v9[213] = v12;
  v9[214] = v12;
  v9[215] = v10;
  v9[216] = v13;
  v9[217] = v13;
  type metadata accessor for ActionCardView();
}

void sub_23BFE1480(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
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

  v1[60] = a1;
  v7 = MEMORY[0x242615198](&unk_23C005608, a1);
  v1[58] = v7;
  v1[212] = a1;
  v1[213] = v7;
  v1[63] = MEMORY[0x24261512C](255, v1 + 212, MEMORY[0x24BDF3948], 0);
  v1[64] = sub_23BFF8ADC();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088];
  v9 = v4;
  v10 = sub_23BFF862C();
  v11 = sub_23BFF862C();
  v1[57] = v11;
  v12 = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, v8, MEMORY[0x24BDF1078]);
  v1[61] = v12;
  v1[210] = v5;
  v1[211] = v12;
  v13 = MEMORY[0x24BDED308];
  v14 = MEMORY[0x242615198](MEMORY[0x24BDED308], v10, v1 + 210);
  v15 = MEMORY[0x24BDEEC40];
  v1[208] = v14;
  v1[209] = v15;
  v16 = MEMORY[0x242615198](v13, v11, v1 + 208);
  v1[46] = v16;
  v1[212] = v11;
  v1[213] = v16;
  v17 = MEMORY[0x24BDF3100];
  MEMORY[0x24261512C](255, v1 + 212, MEMORY[0x24BDF3100], 0);
  v18 = sub_23BFF862C();
  v1[40] = v18;
  v19 = MEMORY[0x24BDEBEE0];
  v1[206] = v14;
  v1[207] = v19;
  v20 = MEMORY[0x242615198](v13, v18, v1 + 206);
  v1[39] = v20;
  v1[212] = v18;
  v1[213] = v20;
  MEMORY[0x24261512C](255, v1 + 212, v17, 0);
  v1[37] = sub_23BFF8968();
  v1[41] = sub_23BFF8FD4();
  v1[38] = sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3910);
  v1[44] = sub_23BFF8968();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3918);
  v1[45] = sub_23BFF8968();
  v1[29] = sub_23BFF8968();
  v1[212] = v9;
  v21 = v1[76];
  v1[213] = v21;
  v1[214] = v21;
  v1[215] = v1[93];
  v1[216] = v1[72];
  v1[217] = v5;
  v22 = v1[94];
  v1[218] = v22;
  v1[219] = v22;
  v1[220] = v3;
  v1[221] = v2;
  type metadata accessor for FullWidthStageView();
}

void sub_23BFE16D4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  v1[43] = a1;
  v6 = MEMORY[0x242615198](&unk_23C0077B8, a1);
  v1[42] = v6;
  v1[212] = a1;
  v1[213] = v6;
  v7 = MEMORY[0x24BDF3948];
  MEMORY[0x24261512C](255, v1 + 212, MEMORY[0x24BDF3948], 0);
  v8 = v4;
  v10 = type metadata accessor for InfoActionCardView(255, v4, v3, v9);
  v1[36] = v10;
  v11 = MEMORY[0x242615198](&unk_23C007F20, v10);
  v1[35] = v11;
  v1[212] = v10;
  v1[213] = v11;
  MEMORY[0x24261512C](255, v1 + 212, v7, 0);
  v1[34] = sub_23BFF8968();
  v1[14] = sub_23BFF8968();
  v12 = v1[85];
  v13 = v2;
  v15 = type metadata accessor for LargeBrickView(255, v12, v2, v14);
  v1[33] = v15;
  v16 = MEMORY[0x242615198](&protocol conformance descriptor for LargeBrickView<A>, v15);
  v1[32] = v16;
  v1[212] = v15;
  v1[213] = v16;
  v17 = v7;
  MEMORY[0x24261512C](255, v1 + 212, v7, 0);
  v19 = type metadata accessor for DynamicBrickView(255, v12, v13, v18);
  v1[31] = v19;
  v20 = MEMORY[0x242615198](&protocol conformance descriptor for DynamicBrickView<A>, v19);
  v1[30] = v20;
  v1[212] = v19;
  v1[213] = v20;
  MEMORY[0x24261512C](255, v1 + 212, v7, 0);
  v1[22] = sub_23BFF8968();
  v22 = type metadata accessor for MonogramVerticalStackView(255, v12, v13, v21);
  v1[28] = v22;
  v23 = MEMORY[0x242615198](&unk_23BFFA1F4, v22);
  v1[27] = v23;
  v1[212] = v22;
  v1[213] = v23;
  MEMORY[0x24261512C](255, v1 + 212, v17, 0);
  v1[25] = sub_23BFF8968();
  v1[26] = sub_23BFF8968();
  v1[1] = sub_23BFF8968();
  v25 = type metadata accessor for StandardCardView(255, v12, v13, v24);
  v1[24] = v25;
  v26 = MEMORY[0x242615198](&unk_23C007BD0, v25);
  v1[23] = v26;
  v1[212] = v25;
  v1[213] = v26;
  MEMORY[0x24261512C](255, v1 + 212, v17, 0);
  v1[212] = v12;
  v1[213] = v8;
  v1[214] = v13;
  v1[215] = v3;
  type metadata accessor for StandardHorizontalStackView();
}

void sub_23BFE193C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __n128 v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, _QWORD, _QWORD, __n128);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  *(_QWORD *)(v9 + 168) = a1;
  v14 = MEMORY[0x242615198](&unk_23C0008E8, a1);
  *(_QWORD *)(v9 + 160) = v14;
  *(_QWORD *)(v9 + 1696) = a1;
  *(_QWORD *)(v9 + 1704) = v14;
  MEMORY[0x24261512C](255, v9 + 1696, v10, 0);
  *(_QWORD *)(v9 + 48) = sub_23BFF8968();
  v16 = type metadata accessor for StandardVerticalStackView(255, v12, v11, v15);
  *(_QWORD *)(v9 + 152) = v16;
  v17 = MEMORY[0x242615198](&unk_23C0073B8, v16);
  *(_QWORD *)(v9 + 144) = v17;
  *(_QWORD *)(v9 + 1696) = v16;
  *(_QWORD *)(v9 + 1704) = v17;
  MEMORY[0x24261512C](255, v9 + 1696, v10, 0);
  v19 = type metadata accessor for TallCardView(255, v12, v11, v18);
  *(_QWORD *)(v9 + 136) = v19;
  v20 = MEMORY[0x242615198](&unk_23BFFF0E4, v19);
  *(_QWORD *)(v9 + 128) = v20;
  *(_QWORD *)(v9 + 1696) = v19;
  *(_QWORD *)(v9 + 1704) = v20;
  MEMORY[0x24261512C](255, v9 + 1696, v10, 0);
  *(_QWORD *)(v9 + 120) = sub_23BFF8968();
  *(_QWORD *)(v9 + 16) = sub_23BFF8968();
  v22 = type metadata accessor for VerticalStackCard(255, v12, v11, v21);
  v23 = MEMORY[0x242615198](&unk_23C0000E0, v22);
  *(_QWORD *)(v9 + 104) = v23;
  *(_QWORD *)(v9 + 1696) = v22;
  *(_QWORD *)(v9 + 1704) = v23;
  MEMORY[0x24261512C](255, v9 + 1696, v10, 0);
  *(_QWORD *)(v9 + 40) = sub_23BFF8968();
  v25 = type metadata accessor for WideBrickView(255, v12, v11, v24);
  v26 = MEMORY[0x242615198](&protocol conformance descriptor for WideBrickView<A>, v25);
  *(_QWORD *)(v9 + 72) = v26;
  *(_QWORD *)(v9 + 1696) = v25;
  *(_QWORD *)(v9 + 1704) = v26;
  MEMORY[0x24261512C](255, v9 + 1696, v10, 0);
  *(_QWORD *)(v9 + 56) = sub_23BFF8968();
  *(_QWORD *)(v9 + 64) = sub_23BFF8968();
  *(_QWORD *)(v9 + 80) = sub_23BFF8968();
  *(_QWORD *)(v9 + 88) = sub_23BFF8FD4();
  *(_QWORD *)(v9 + 96) = sub_23BFF862C();
  v27 = sub_23BFF8968();
  *(_QWORD *)(v9 + 376) = *(_QWORD *)(v27 - 8);
  *(_QWORD *)(v9 + 512) = v27;
  MEMORY[0x24BDAC7A8](v27);
  *(_QWORD *)(v9 + 496) = (char *)&a9 - v28;
  v29 = sub_23BFF862C();
  *(_QWORD *)(v9 + 392) = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  *(_QWORD *)(v9 + 504) = (char *)&a9 - v30;
  *(_QWORD *)(v9 + 24) = v29;
  v31 = sub_23BFF862C();
  *(_QWORD *)(v9 + 400) = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  *(_QWORD *)(v9 + 384) = (char *)&a9 - v32;
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 480);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 464);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 456);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 368);
  v34 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 320);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 312);
  v35 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1632) = v34;
  *(_QWORD *)(v9 + 1640) = v35;
  v36 = MEMORY[0x24BDEF3E0];
  *(_QWORD *)(v9 + 1624) = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], *(_QWORD *)(v9 + 296), v9 + 1632);
  v37 = MEMORY[0x242615198](MEMORY[0x24BDF3F50], *(_QWORD *)(v9 + 328), v9 + 1624);
  v38 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v9 + 1608) = v37;
  *(_QWORD *)(v9 + 1616) = v38;
  v39 = MEMORY[0x242615198](MEMORY[0x24BDED308], *(_QWORD *)(v9 + 304), v9 + 1608);
  v40 = sub_23BEA1F94(&qword_256AE3920, &qword_256AE3910, MEMORY[0x24BDF43B0]);
  *(_QWORD *)(v9 + 1592) = v39;
  *(_QWORD *)(v9 + 1600) = v40;
  v41 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 352), v9 + 1592);
  v42 = sub_23BEA1F94(&qword_256AE3928, &qword_256AE3918, MEMORY[0x24BDF4700]);
  *(_QWORD *)(v9 + 1576) = v41;
  *(_QWORD *)(v9 + 1584) = v42;
  v43 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 360), v9 + 1576);
  *(_QWORD *)(v9 + 1560) = OpaqueTypeConformance2;
  *(_QWORD *)(v9 + 1568) = v43;
  v44 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 232), v9 + 1560);
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 344);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 336);
  v45 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 288);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 280);
  v46 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1544) = v45;
  *(_QWORD *)(v9 + 1552) = v46;
  v47 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 272), v9 + 1544);
  *(_QWORD *)(v9 + 1528) = v44;
  *(_QWORD *)(v9 + 1536) = v47;
  v48 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 112), v9 + 1528);
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 264);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 256);
  v49 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 248);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 240);
  v50 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1512) = v49;
  *(_QWORD *)(v9 + 1520) = v50;
  v51 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 176), v9 + 1512);
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 224);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 216);
  *(_QWORD *)(v9 + 1496) = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1504) = v50;
  v52 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 200), v9 + 1496);
  *(_QWORD *)(v9 + 1480) = v51;
  *(_QWORD *)(v9 + 1488) = v52;
  v53 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 208), v9 + 1480);
  *(_QWORD *)(v9 + 1464) = v48;
  *(_QWORD *)(v9 + 1472) = v53;
  v54 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 8), v9 + 1464);
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 192);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 184);
  v55 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 168);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 160);
  v56 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1448) = v55;
  *(_QWORD *)(v9 + 1456) = v56;
  v57 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 48), v9 + 1448);
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 152);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 144);
  v58 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1696) = *(_QWORD *)(v9 + 136);
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 128);
  v59 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1432) = v58;
  *(_QWORD *)(v9 + 1440) = v59;
  v60 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 120), v9 + 1432);
  *(_QWORD *)(v9 + 1416) = v57;
  *(_QWORD *)(v9 + 1424) = v60;
  v61 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 16), v9 + 1416);
  *(_QWORD *)(v9 + 1696) = v22;
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 104);
  *(_QWORD *)(v9 + 1400) = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1408) = *(_QWORD *)(v9 + 760);
  v62 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 40), v9 + 1400);
  *(_QWORD *)(v9 + 1696) = v25;
  *(_QWORD *)(v9 + 1704) = *(_QWORD *)(v9 + 72);
  v63 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v9 + 1384) = v62;
  *(_QWORD *)(v9 + 1392) = v63;
  v64 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 56), v9 + 1384);
  *(_QWORD *)(v9 + 1368) = v61;
  *(_QWORD *)(v9 + 1376) = v64;
  v65 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 64), v9 + 1368);
  *(_QWORD *)(v9 + 1352) = v54;
  *(_QWORD *)(v9 + 1360) = v65;
  *(_QWORD *)(v9 + 1344) = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 80), v9 + 1352);
  *(_QWORD *)(v9 + 1328) = MEMORY[0x242615198](MEMORY[0x24BDF3F50], *(_QWORD *)(v9 + 88), v9 + 1344);
  *(_QWORD *)(v9 + 1336) = *(_QWORD *)(v9 + 488);
  v66 = MEMORY[0x24BDED308];
  v67 = MEMORY[0x242615198](MEMORY[0x24BDED308], *(_QWORD *)(v9 + 96), v9 + 1328);
  *(_QWORD *)(v9 + 1312) = MEMORY[0x24BDF5138];
  *(_QWORD *)(v9 + 1320) = v67;
  v68 = MEMORY[0x242615198](v36, *(_QWORD *)(v9 + 512), v9 + 1312);
  *(_QWORD *)(v9 + 312) = v68;
  v69 = MEMORY[0x24BDF0910];
  *(_QWORD *)(v9 + 1296) = v68;
  *(_QWORD *)(v9 + 1304) = v69;
  v70 = MEMORY[0x242615198](v66, v29, v9 + 1296);
  *(_QWORD *)(v9 + 320) = v70;
  *(_QWORD *)(v9 + 1280) = v70;
  *(_QWORD *)(v9 + 1288) = v69;
  v71 = MEMORY[0x242615198](v66, v31, v9 + 1280);
  *(_QWORD *)(v9 + 488) = v71;
  *(_QWORD *)(v9 + 1696) = v31;
  *(_QWORD *)(v9 + 32) = v31;
  *(_QWORD *)(v9 + 1704) = v71;
  MEMORY[0x24261512C](255, v9 + 1696, MEMORY[0x24BEC6710], 0);
  v72 = sub_23BFF8968();
  v73 = *(_QWORD *)(v72 - 8);
  *(_QWORD *)(v9 + 336) = v72;
  *(_QWORD *)(v9 + 352) = v73;
  MEMORY[0x24BDAC7A8](v72);
  *(_QWORD *)(v9 + 480) = (char *)&a9 - v74;
  v75 = sub_23BFF862C();
  v76 = *(_QWORD *)(v75 - 8);
  *(_QWORD *)(v9 + 360) = v75;
  *(_QWORD *)(v9 + 368) = v76;
  MEMORY[0x24BDAC7A8](v75);
  *(_QWORD *)(v9 + 328) = (char *)&a9 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = MEMORY[0x24BDAC7A8](v78);
  *(_QWORD *)(v9 + 344) = (char *)&a9 - v80;
  v81 = *(_QWORD *)(v9 + 528);
  v82 = *(void (**)(uint64_t, _QWORD, _QWORD, __n128))(v81 + 16);
  *(_QWORD *)(v9 + 456) = v82;
  v83 = *(_QWORD *)(v9 + 520);
  v82(v83, *(_QWORD *)(v9 + 648), *(_QWORD *)(v9 + 704), v79);
  v84 = *(_QWORD *)(v9 + 536);
  v85 = *(_QWORD *)(v9 + 584);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v84 + 16))(*(_QWORD *)(v9 + 544), *(_QWORD *)(v9 + 592), v85);
  v86 = *(unsigned __int8 *)(v81 + 80);
  v87 = (v86 + 208) & ~v86;
  v88 = v87 + *(_QWORD *)(v9 + 472);
  *(_QWORD *)(v9 + 304) = v88;
  *(_QWORD *)(v9 + 464) = v87;
  *(_QWORD *)(v9 + 472) = v86 | 7;
  v89 = (v88 + *(unsigned __int8 *)(v84 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
  v90 = (char *)swift_allocObject();
  v91 = *(_QWORD *)(v9 + 656);
  v92 = *(_QWORD *)(v9 + 608);
  *((_QWORD *)v90 + 2) = v91;
  *((_QWORD *)v90 + 3) = v92;
  v93 = *(_QWORD *)(v9 + 664);
  v94 = *(_QWORD *)(v9 + 680);
  *((_QWORD *)v90 + 4) = v93;
  *((_QWORD *)v90 + 5) = v94;
  v95 = *(_QWORD *)(v9 + 632);
  *((_QWORD *)v90 + 6) = *(_QWORD *)(v9 + 640);
  *((_QWORD *)v90 + 7) = v95;
  v96 = *(_QWORD *)(v9 + 768);
  *((_QWORD *)v90 + 8) = *(_QWORD *)(v9 + 744);
  *((_QWORD *)v90 + 9) = v96;
  v97 = *(_QWORD *)(v9 + 712);
  *((_QWORD *)v90 + 10) = *(_QWORD *)(v9 + 784);
  *((_QWORD *)v90 + 11) = v97;
  v98 = *(_QWORD *)(v9 + 792);
  *((_QWORD *)v90 + 12) = *(_QWORD *)(v9 + 736);
  *((_QWORD *)v90 + 13) = v98;
  v99 = *(_QWORD *)(v9 + 576);
  v100 = *(_QWORD *)(v9 + 776);
  *((_QWORD *)v90 + 14) = v99;
  *((_QWORD *)v90 + 15) = v100;
  v101 = v85;
  v102 = *(_QWORD *)(v9 + 752);
  *((_QWORD *)v90 + 16) = v85;
  *((_QWORD *)v90 + 17) = v102;
  v103 = *(_QWORD *)(v9 + 616);
  *((_QWORD *)v90 + 18) = *(_QWORD *)(v9 + 688);
  *((_QWORD *)v90 + 19) = v103;
  v104 = *(_QWORD *)(v9 + 720);
  *((_QWORD *)v90 + 20) = *(_QWORD *)(v9 + 760);
  *((_QWORD *)v90 + 21) = v104;
  v105 = *(_QWORD *)(v9 + 672);
  *((_QWORD *)v90 + 22) = *(_QWORD *)(v9 + 728);
  *((_QWORD *)v90 + 23) = v105;
  v106 = *(_QWORD *)(v9 + 624);
  *((_QWORD *)v90 + 24) = *(_QWORD *)(v9 + 696);
  *((_QWORD *)v90 + 25) = v106;
  v107 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 + 528) + 32);
  *(_QWORD *)(v9 + 528) = v107;
  v108 = v83;
  v109 = *(_QWORD *)(v9 + 704);
  v107(&v90[v87], v108, v109);
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v9 + 536) + 32))(&v90[v89], *(_QWORD *)(v9 + 544), v101);
  v110 = *(_QWORD *)(v9 + 648);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 + 560) + 16))(*(_QWORD *)(v9 + 552), v110 + *(int *)(v109 + 236), v99);
  v111 = (_QWORD *)(v110 + *(int *)(v109 + 240));
  v112 = v110;
  v113 = v111[1];
  *(_QWORD *)(v9 + 544) = *v111;
  v114 = v91;
  *(_QWORD *)(v9 + 1040) = v91;
  v115 = *(_QWORD *)(v9 + 608);
  *(_QWORD *)(v9 + 1048) = v115;
  v116 = v93;
  *(_QWORD *)(v9 + 1056) = v93;
  v117 = *(_QWORD *)(v9 + 680);
  *(_QWORD *)(v9 + 1064) = v117;
  v118 = *(_QWORD *)(v9 + 640);
  *(_QWORD *)(v9 + 1072) = v118;
  v119 = *(_QWORD *)(v9 + 632);
  *(_QWORD *)(v9 + 1080) = v119;
  v120 = *(_QWORD *)(v9 + 744);
  *(_QWORD *)(v9 + 1088) = v120;
  v121 = *(_QWORD *)(v9 + 768);
  *(_QWORD *)(v9 + 1096) = v121;
  v122 = *(_QWORD *)(v9 + 784);
  *(_QWORD *)(v9 + 1104) = v122;
  v123 = *(_QWORD *)(v9 + 712);
  *(_QWORD *)(v9 + 1112) = v123;
  v124 = *(_QWORD *)(v9 + 736);
  *(_QWORD *)(v9 + 1120) = v124;
  v125 = *(_QWORD *)(v9 + 792);
  *(_QWORD *)(v9 + 1128) = v125;
  v126 = v99;
  *(_QWORD *)(v9 + 1136) = v99;
  v127 = *(_QWORD *)(v9 + 776);
  *(_QWORD *)(v9 + 1144) = v127;
  *(_QWORD *)(v9 + 1152) = v101;
  v128 = *(_QWORD *)(v9 + 752);
  *(_QWORD *)(v9 + 1160) = v128;
  v129 = *(_QWORD *)(v9 + 688);
  *(_QWORD *)(v9 + 1168) = v129;
  v130 = *(_QWORD *)(v9 + 616);
  *(_QWORD *)(v9 + 1176) = v130;
  v131 = *(_QWORD *)(v9 + 760);
  *(_QWORD *)(v9 + 1184) = v131;
  v132 = *(_QWORD *)(v9 + 720);
  *(_QWORD *)(v9 + 1192) = v132;
  v133 = *(_QWORD *)(v9 + 728);
  *(_QWORD *)(v9 + 1200) = v133;
  *(_QWORD *)(v9 + 1208) = v105;
  v134 = *(_QWORD *)(v9 + 696);
  *(_QWORD *)(v9 + 1216) = v134;
  v135 = *(_QWORD *)(v9 + 624);
  *(_QWORD *)(v9 + 1224) = v135;
  *(_QWORD *)(v9 + 1232) = v112;
  v136 = *(_QWORD *)(v9 + 600);
  *(_QWORD *)(v9 + 1240) = v136;
  *(_QWORD *)(v9 + 816) = v114;
  *(_QWORD *)(v9 + 824) = v115;
  *(_QWORD *)(v9 + 832) = v116;
  *(_QWORD *)(v9 + 840) = v117;
  *(_QWORD *)(v9 + 848) = v118;
  *(_QWORD *)(v9 + 856) = v119;
  *(_QWORD *)(v9 + 864) = v120;
  *(_QWORD *)(v9 + 872) = v121;
  *(_QWORD *)(v9 + 880) = v122;
  *(_QWORD *)(v9 + 888) = v123;
  *(_QWORD *)(v9 + 896) = v124;
  *(_QWORD *)(v9 + 904) = v125;
  *(_QWORD *)(v9 + 912) = v126;
  *(_QWORD *)(v9 + 920) = v127;
  *(_QWORD *)(v9 + 928) = v101;
  *(_QWORD *)(v9 + 936) = v128;
  *(_QWORD *)(v9 + 944) = v129;
  *(_QWORD *)(v9 + 952) = v130;
  *(_QWORD *)(v9 + 960) = v131;
  *(_QWORD *)(v9 + 968) = v132;
  *(_QWORD *)(v9 + 976) = v133;
  *(_QWORD *)(v9 + 984) = v105;
  *(_QWORD *)(v9 + 992) = v134;
  *(_QWORD *)(v9 + 1000) = v135;
  *(_QWORD *)(v9 + 1008) = v112;
  *(_QWORD *)(v9 + 1016) = v136;
  *(_OWORD *)(v9 + 1712) = 0u;
  *(_OWORD *)(v9 + 1696) = 0u;
  sub_23BEAF590((uint64_t)sub_23BFE79FC, (uint64_t)v90, *(_QWORD *)(v9 + 552), v9 + 1696, *(_QWORD *)(v9 + 544), v113, (uint64_t)sub_23BFE7B50, v9 + 1024, *(_QWORD *)(v9 + 496), (uint64_t)sub_23BFE7B5C, v9 + 800, v101, v126, v117, v120, v115, v135, v134, v129,
    v131,
    v128);
}

void sub_23BFE24D8()
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
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;

  swift_release();
  v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 560) + 8))(v2, v6);
  v8 = *(_QWORD *)(v0 + 520);
  v9 = *(_QWORD *)(v0 + 704);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456))(v8, v4, v9);
  v10 = (*(_QWORD *)(v0 + 304) + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v0 + 560) = v10 + 8;
  v11 = (_QWORD *)swift_allocObject();
  v12 = *(_QWORD *)(v0 + 656);
  v11[2] = v12;
  v11[3] = v1;
  v13 = *(_QWORD *)(v0 + 664);
  v11[4] = v13;
  v11[5] = v5;
  v14 = *(_QWORD *)(v0 + 632);
  v11[6] = *(_QWORD *)(v0 + 640);
  v11[7] = v14;
  v15 = *(_QWORD *)(v0 + 768);
  v11[8] = *(_QWORD *)(v0 + 744);
  v11[9] = v15;
  v16 = *(_QWORD *)(v0 + 712);
  v11[10] = *(_QWORD *)(v0 + 784);
  v11[11] = v16;
  v17 = *(_QWORD *)(v0 + 792);
  v11[12] = *(_QWORD *)(v0 + 736);
  v11[13] = v17;
  v18 = *(_QWORD *)(v0 + 776);
  v11[14] = v7;
  v11[15] = v18;
  v19 = *(_QWORD *)(v0 + 752);
  v11[16] = v3;
  v11[17] = v19;
  v20 = *(_QWORD *)(v0 + 616);
  v11[18] = *(_QWORD *)(v0 + 688);
  v11[19] = v20;
  v21 = *(_QWORD *)(v0 + 720);
  v11[20] = *(_QWORD *)(v0 + 760);
  v11[21] = v21;
  v22 = *(_QWORD *)(v0 + 672);
  v11[22] = *(_QWORD *)(v0 + 728);
  v11[23] = v22;
  v23 = (char *)v11 + *(_QWORD *)(v0 + 464);
  v24 = *(_QWORD *)(v0 + 624);
  v11[24] = *(_QWORD *)(v0 + 696);
  v11[25] = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v0 + 528))(v23, v8, v9);
  *(_QWORD *)((char *)v11 + v10) = *(_QWORD *)(v0 + 600);
  v25 = *(_QWORD *)(v0 + 512);
  v26 = *(_QWORD *)(v0 + 496);
  sub_23BFF8F14();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 376) + 8))(v26, v25);
  v27 = *(_QWORD *)(v0 + 704);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 456))(v8, *(_QWORD *)(v0 + 648), v27);
  v28 = (_QWORD *)swift_allocObject();
  v29 = *(_QWORD *)(v0 + 608);
  v28[2] = v12;
  v28[3] = v29;
  v30 = *(_QWORD *)(v0 + 680);
  v28[4] = v13;
  v28[5] = v30;
  v28[6] = *(_QWORD *)(v0 + 640);
  v28[7] = v14;
  v31 = *(_QWORD *)(v0 + 768);
  v28[8] = *(_QWORD *)(v0 + 744);
  v28[9] = v31;
  v32 = *(_QWORD *)(v0 + 712);
  v28[10] = *(_QWORD *)(v0 + 784);
  v28[11] = v32;
  v33 = *(_QWORD *)(v0 + 792);
  v28[12] = *(_QWORD *)(v0 + 736);
  v28[13] = v33;
  v34 = *(_QWORD *)(v0 + 776);
  v28[14] = *(_QWORD *)(v0 + 576);
  v28[15] = v34;
  v35 = *(_QWORD *)(v0 + 752);
  v28[16] = *(_QWORD *)(v0 + 584);
  v28[17] = v35;
  v28[18] = *(_QWORD *)(v0 + 688);
  v28[19] = v20;
  v36 = *(_QWORD *)(v0 + 720);
  v28[20] = *(_QWORD *)(v0 + 760);
  v28[21] = v36;
  v37 = *(_QWORD *)(v0 + 672);
  v28[22] = *(_QWORD *)(v0 + 728);
  v28[23] = v37;
  v38 = (char *)v28 + *(_QWORD *)(v0 + 464);
  v39 = *(_QWORD *)(v0 + 624);
  v28[24] = *(_QWORD *)(v0 + 696);
  v28[25] = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v0 + 528))(v38, v8, v27);
  v40 = *(_QWORD *)(v0 + 600);
  *(_QWORD *)((char *)v28 + v10) = v40;
  v41 = *(_QWORD *)(v0 + 384);
  v42 = *(_QWORD *)(v0 + 24);
  v43 = *(_QWORD *)(v0 + 504);
  sub_23BFF8D34();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 392) + 8))(v43, v42);
  v50 = v39;
  v44 = v39;
  v45 = *(char **)(v0 + 584);
  v46 = *(_QWORD *)(v0 + 32);
  sub_23BF58654(*(_QWORD *)(v0 + 592), *(_QWORD *)(v0 + 648) + *(int *)(v27 + 220), v40, v46, *(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 784), *(_QWORD *)(v0 + 792), *(_QWORD *)(v0 + 776), v45, *(_QWORD *)(v0 + 488), v37, v50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 400) + 8))(v41, v46);
  v47 = v44;
  v48 = *(void (**)(char *, uint64_t))(v44 + 168);
  v49 = *(_QWORD *)(v0 + 424);
  v48(v45, v47);
  sub_23BF006B4(v49, *(_QWORD *)(v0 + 416));
}

uint64_t sub_23BFE2808()
{
  _QWORD *v0;
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
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);

  swift_retain();
  v0[212] = v1;
  v3 = v0[61];
  v0[213] = v3;
  v0[158] = swift_getOpaqueTypeConformance2();
  v0[159] = v3;
  v4 = v0[42];
  v5 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v4, v0 + 158);
  v6 = v0[41];
  v7 = v0[71];
  v8 = v0[60];
  MEMORY[0x2426142A4](v2, v4, v7, v5);
  (*(void (**)(uint64_t, uint64_t))(v0[55] + 8))(v2, v7);
  (*(void (**)(uint64_t, uint64_t))(v0[44] + 8))(v8, v4);
  v9 = MEMORY[0x242615198](&unk_23BFFEE18, v7);
  v0[156] = v5;
  v0[157] = v9;
  v10 = v0[45];
  MEMORY[0x242615198](MEMORY[0x24BDED308], v10, v0 + 156);
  v11 = v0[43];
  sub_23BEA72EC(v6, v10, v11);
  v12 = *(void (**)(uint64_t, uint64_t))(v0[46] + 8);
  v12(v6, v10);
  sub_23BEA5C0C(v11, v10, v0[56]);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)(v11, v10);
}

void sub_23BFE2940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  __n128 v15;
  uint64_t v16;
  __int128 v17;

  v15 = MEMORY[0x24BDAC7A8](a15);
  *(_OWORD *)(v16 + 136) = v17;
  *(__n128 *)(v16 + 152) = v15;
  type metadata accessor for ListView();
}

uint64_t sub_23BFE2A04(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  v7 = *(void (**)(uint64_t))(v5 + *(int *)(result + 260));
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v1 + 152))(v3, v1);
    v7(v4);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v2);
  }
  return result;
}

void sub_23BFE2A68(uint64_t a1)
{
  uint64_t v1;
  __n128 v2;
  uint64_t v3;
  __int128 v4;

  MEMORY[0x24BDAC7A8](a1);
  v2 = MEMORY[0x24BDAC7A8]((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v3 + 152) = v4;
  *(__n128 *)(v3 + 168) = v2;
  type metadata accessor for ListView();
}

uint64_t sub_23BFE2B48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + *(int *)(a1 + 252)))(v3, v7, 0);
  sub_23BEA72EC(v6, v2, v5);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v2);
  sub_23BEA5C0C(v5, v2, v1);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v5, v2);
}

void sub_23BFE2BCC(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8]((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ListView();
}

uint64_t sub_23BFE2CB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + *(int *)(a1 + 244)))(v3, v7, 0);
  sub_23BEA72EC(v6, v1, v4);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v1);
  sub_23BEA5C0C(v4, v1, v2);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v4, v1);
}

void sub_23BFE2D38()
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for CanvasSectionHeader();
}

uint64_t sub_23BFE2D90()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23BFF96A0();
  if (v1 <= 0x3F)
  {
    result = sub_23BFF96A0();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

_QWORD *sub_23BFE2E84(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  _QWORD *v37;
  int v38;
  int v39;
  unint64_t v40;
  unsigned int v41;
  void *v42;
  char *v43;
  size_t v44;
  char *v45;
  void *v46;
  const void *v47;
  uint64_t v48;
  size_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  const void *v55;
  unsigned int (*v56)(const void *, uint64_t, uint64_t);
  _OWORD *v57;
  _OWORD *v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  __int128 v62;
  unint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t *v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unsigned int v91;
  uint64_t v92;
  size_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  size_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  size_t v107;
  size_t __n;
  uint64_t v109;

  v4 = sub_23BFF82CC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = a3[11];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  if ((_DWORD)v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  v10 = *(unsigned int *)(v5 + 84);
  if (v9 <= v10)
    v11 = *(_DWORD *)(v5 + 84);
  else
    v11 = v9;
  v12 = a3[2];
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  v15 = v14 - 1;
  if (!(_DWORD)v14)
    v15 = 0;
  if (v15 <= v11)
    v16 = v11;
  else
    v16 = v15;
  if ((_DWORD)v8)
    v17 = *(_QWORD *)(v7 + 64);
  else
    v17 = *(_QWORD *)(v7 + 64) + 1;
  v18 = *(_DWORD *)(v7 + 80);
  v19 = *(_QWORD *)(v5 + 64) + v18;
  v20 = *(_DWORD *)(v13 + 80);
  __n = v17;
  v21 = (v17 + v20 + (v19 & ~v18)) & ~v20;
  if ((_DWORD)v14)
    v22 = *(_QWORD *)(v13 + 64);
  else
    v22 = *(_QWORD *)(v13 + 64) + 1;
  v23 = v21 + v22;
  if (v16)
    v24 = v21 + v22;
  else
    v24 = v23 + 1;
  v25 = a3[14];
  v109 = a3[13];
  v26 = *(_QWORD *)(v109 - 8);
  v27 = *(_DWORD *)(v26 + 80);
  if (*(_DWORD *)(v26 + 84))
    v28 = *(_QWORD *)(v26 + 64);
  else
    v28 = *(_QWORD *)(v26 + 64) + 1;
  v29 = *(_QWORD *)(v25 - 8);
  v30 = *(_DWORD *)(v29 + 80);
  v31 = *(_DWORD *)(v7 + 80) | *(_DWORD *)(v5 + 80) | *(_DWORD *)(v13 + 80);
  v32 = v30 | v27 | v31 & 0xF8;
  if (v32 > 7
    || ((*(_DWORD *)(v29 + 80) | *(_DWORD *)(v26 + 80) | v31) & 0x100000) != 0
    || (v33 = v27 + 9,
        ((((((((((((((((*(_QWORD *)(v29 + 64)
                      + 7
                      + ((v30
                        + 25
                        + ((((v28 + 7 + ((v27 + 9 + ((v24 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v27)) & 0xFFFFFFFFFFFFFFF8)
                          + 39) & 0xFFFFFFFFFFFFFFF8)) & ~v30)) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16 > 0x18))
  {
    v36 = *a2;
    *a1 = *a2;
    v37 = (_QWORD *)(v36 + (((v32 | 7) + 16) & ~(unint64_t)(v32 | 7)));
    goto LABEL_65;
  }
  v106 = *(_QWORD *)(v29 + 64) + 7;
  v107 = v24;
  v104 = *(_QWORD *)(v25 - 8);
  v105 = v25;
  v102 = v28 + 7;
  v103 = v30 + 25;
  v100 = v28;
  v101 = ~v27;
  v95 = ~v20;
  v96 = v6;
  v93 = v22;
  v94 = ~v18;
  if (v16)
  {
    if ((_DWORD)v10 == v16)
    {
      v91 = v16;
      v34 = v23;
      v35 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48))(a2, v10, v4);
      v23 = v34;
      v16 = v91;
      v24 = v107;
      if (!v35)
        goto LABEL_44;
    }
    else
    {
      v98 = v23;
      v40 = ((unint64_t)a2 + v19) & ~v18;
      if (v9 == v16)
        v41 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v40, v8, v6);
      else
        v41 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v40 + v17 + v20) & ~v20, v14, v12);
      v24 = v107;
      v23 = v98;
      if (v41 < 2)
      {
LABEL_44:
        v99 = v23;
        v92 = v33;
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, v4);
        v42 = (void *)(((unint64_t)a1 + v19) & v94);
        v43 = (char *)(((unint64_t)a2 + v19) & v94);
        v97 = v12;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v43, 1, v96))
        {
          v44 = __n;
          memcpy(v42, v43, __n);
        }
        else
        {
          (*(void (**)(void *, char *, uint64_t))(v7 + 16))(v42, v43, v96);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v42, 0, 1, v96);
          v44 = __n;
        }
        v45 = &v43[v44];
        v46 = (void *)(((unint64_t)v42 + v44 + v20) & v95);
        v47 = (const void *)((unint64_t)&v45[v20] & v95);
        if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v47, 1, v97))
        {
          memcpy(v46, v47, v93);
        }
        else
        {
          (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v46, v47, v97);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v46, 0, 1, v97);
        }
        v48 = v109;
        v37 = a1;
        v49 = v107;
        v33 = v92;
        v50 = v101;
        if (!v16)
          *((_BYTE *)a1 + v99) = 0;
        goto LABEL_54;
      }
    }
  }
  else
  {
    if (!*((_BYTE *)a2 + v23))
      goto LABEL_44;
    v38 = (*((unsigned __int8 *)a2 + v23) - 1) << (8 * v23);
    if (v23 > 3)
      v38 = 0;
    if ((_DWORD)v23)
    {
      if (v23 <= 3)
        v39 = v23;
      else
        v39 = 4;
      __asm { BR              X11 }
    }
    if (v38 == -1)
      goto LABEL_44;
  }
  v37 = a1;
  memcpy(a1, a2, v24);
  v49 = v107;
  v48 = v109;
  v50 = v101;
LABEL_54:
  v51 = ~v30;
  v52 = ((unint64_t)v37 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  v53 = ((unint64_t)a2 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *(_BYTE *)(v52 + 8) = *(_BYTE *)(v53 + 8);
  v54 = (void *)((v33 + v52) & v50);
  v55 = (const void *)((v33 + v53) & v50);
  v56 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48);
  swift_bridgeObjectRetain();
  if (v56(v55, 1, v48))
  {
    memcpy(v54, v55, v100);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v26 + 16))(v54, v55, v48);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v54, 0, 1, v48);
  }
  v57 = (_OWORD *)(((unint64_t)v54 + v102) & 0xFFFFFFFFFFFFFFF8);
  v58 = (_OWORD *)(((unint64_t)v55 + v102) & 0xFFFFFFFFFFFFFFF8);
  v59 = v58[1];
  *v57 = *v58;
  v57[1] = v59;
  v60 = ((unint64_t)v57 + 39) & 0xFFFFFFFFFFFFFFF8;
  v61 = ((unint64_t)v58 + 39) & 0xFFFFFFFFFFFFFFF8;
  v62 = *(_OWORD *)v61;
  *(_QWORD *)(v60 + 16) = *(_QWORD *)(v61 + 16);
  *(_OWORD *)v60 = v62;
  *(_BYTE *)(v60 + 24) = *(_BYTE *)(v61 + 24);
  v63 = (v103 + v60) & v51;
  v64 = (v103 + v61) & v51;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v104 + 16))(v63, v64, v105);
  v65 = (_QWORD *)((v106 + v63) & 0xFFFFFFFFFFFFFFF8);
  v66 = (_QWORD *)((v106 + v64) & 0xFFFFFFFFFFFFFFF8);
  v67 = v66[1];
  *v65 = *v66;
  v65[1] = v67;
  v68 = (_QWORD *)(((unint64_t)v65 + 23) & 0xFFFFFFFFFFFFFFF8);
  v69 = (_QWORD *)(((unint64_t)v66 + 23) & 0xFFFFFFFFFFFFFFF8);
  v70 = v69[1];
  *v68 = *v69;
  v68[1] = v70;
  v71 = (_QWORD *)(((unint64_t)v68 + 23) & 0xFFFFFFFFFFFFFFF8);
  v72 = (_QWORD *)(((unint64_t)v69 + 23) & 0xFFFFFFFFFFFFFFF8);
  v73 = v72[1];
  *v71 = *v72;
  v71[1] = v73;
  v74 = (_QWORD *)(((unint64_t)v71 + 23) & 0xFFFFFFFFFFFFFFF8);
  v75 = (_QWORD *)(((unint64_t)v72 + 23) & 0xFFFFFFFFFFFFFFF8);
  v76 = v75[1];
  *v74 = *v75;
  v74[1] = v76;
  v77 = (_QWORD *)(((unint64_t)v74 + 23) & 0xFFFFFFFFFFFFFFF8);
  v78 = (_QWORD *)(((unint64_t)v75 + 23) & 0xFFFFFFFFFFFFFFF8);
  v79 = v78[1];
  *v77 = *v78;
  v77[1] = v79;
  v80 = ((unint64_t)v77 + 23) & 0xFFFFFFFFFFFFFFF8;
  v81 = (unint64_t *)(((unint64_t)v78 + 23) & 0xFFFFFFFFFFFFFFF8);
  v82 = *v81;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v82 < 0xFFFFFFFF)
  {
    *(_OWORD *)v80 = *(_OWORD *)v81;
  }
  else
  {
    v83 = v81[1];
    *(_QWORD *)v80 = v82;
    *(_QWORD *)(v80 + 8) = v83;
    swift_retain();
  }
  v84 = (v80 + 23) & 0xFFFFFFFFFFFFFFF8;
  v85 = ((unint64_t)v81 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v85 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v84 = *(_OWORD *)v85;
  }
  else
  {
    v86 = *(_QWORD *)(v85 + 8);
    *(_QWORD *)v84 = *(_QWORD *)v85;
    *(_QWORD *)(v84 + 8) = v86;
    swift_retain();
  }
  v87 = (v84 + 23) & 0xFFFFFFFFFFFFFFF8;
  v88 = (v85 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v88 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v87 = *(_OWORD *)v88;
    return v37;
  }
  v89 = *(_QWORD *)(v88 + 8);
  *(_QWORD *)v87 = *(_QWORD *)v88;
  *(_QWORD *)(v87 + 8) = v89;
LABEL_65:
  swift_retain();
  return v37;
}

uint64_t sub_23BFE355C(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t result;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v4 = sub_23BFF82CC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v43 = a2[11];
  v7 = *(_QWORD *)(v43 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  if ((_DWORD)v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= v6)
    v10 = *(_DWORD *)(v5 + 84);
  else
    v10 = v9;
  v44 = a2[2];
  v11 = *(_QWORD *)(v44 - 8);
  v12 = *(unsigned int *)(v11 + 84);
  v13 = v12 - 1;
  if (!(_DWORD)v12)
    v13 = 0;
  if (v13 <= v10)
    v14 = v10;
  else
    v14 = v13;
  if ((_DWORD)v8)
    v15 = *(_QWORD *)(v7 + 64);
  else
    v15 = *(_QWORD *)(v7 + 64) + 1;
  v16 = *(unsigned __int8 *)(v7 + 80);
  v17 = ~v16;
  v18 = *(_QWORD *)(v5 + 64) + v16;
  v19 = *(unsigned __int8 *)(v11 + 80);
  v20 = (v15 + v19 + (v18 & ~v16)) & ~v19;
  v21 = *(_QWORD *)(v11 + 64);
  if (!(_DWORD)v12)
    ++v21;
  v22 = v21 + v20;
  v42 = v15;
  v41 = v17;
  if (v14)
  {
    if ((_DWORD)v6 == v14)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, v4))
        goto LABEL_39;
    }
    else
    {
      v25 = (v18 + a1) & v17;
      if (v9 == v14)
        v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v25, v8, v43);
      else
        v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))((v25 + v15 + v19) & ~v19, v12, v44);
      if (v26 >= 2)
        goto LABEL_39;
    }
    goto LABEL_35;
  }
  if (!*(_BYTE *)(a1 + v22))
    goto LABEL_35;
  v23 = (*(unsigned __int8 *)(a1 + v22) - 1) << (8 * v22);
  if (v22 > 3)
    v23 = 0;
  if ((_DWORD)v22)
  {
    if (v22 <= 3)
      v24 = v21 + v20;
    else
      v24 = 4;
    __asm { BR              X11 }
  }
  if (v23 == -1)
  {
LABEL_35:
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    v27 = (v18 + a1) & v41;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v27, 1, v43))
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v27, v43);
    v28 = (v27 + v42 + v19) & ~v19;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v28, 1, v44))
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v28, v44);
  }
LABEL_39:
  if (v14)
    v29 = a1;
  else
    v29 = a1 + 1;
  v30 = (v29 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  v31 = a2[13];
  v32 = *(_QWORD *)(v31 - 8);
  v33 = (v30 + *(unsigned __int8 *)(v32 + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v32 + 48))(v33, 1, v31))
    (*(void (**)(unint64_t, uint64_t))(v32 + 8))(v33, v31);
  v34 = v33 + *(_QWORD *)(v32 + 64);
  if (!*(_DWORD *)(v32 + 84))
    ++v34;
  v35 = *(_QWORD *)(a2[14] - 8);
  v36 = (*(unsigned __int8 *)(v35 + 80) + ((((v34 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 25) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  (*(void (**)(unint64_t))(v35 + 8))(v36);
  v37 = (*(_QWORD *)(v35 + 64) + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = swift_release();
  v39 = (_QWORD *)((((((((((v37 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8);
  if (*v39 >= 0xFFFFFFFFuLL)
    result = swift_release();
  v40 = (_QWORD *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  if (*v40 >= 0xFFFFFFFFuLL)
    result = swift_release();
  if (*(_QWORD *)(((unint64_t)v40 + 23) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL)
    return swift_release();
  return result;
}

_BYTE *sub_23BFE3928(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  size_t v22;
  size_t v23;
  int v24;
  int v25;
  unint64_t v26;
  unsigned int v27;
  void *v28;
  const void *v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  _BYTE *v33;
  size_t v34;
  size_t v35;
  size_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const void *v43;
  unsigned int (*v44)(const void *, uint64_t, uint64_t);
  int v45;
  size_t v46;
  size_t v47;
  size_t v48;
  _OWORD *v49;
  _OWORD *v50;
  __int128 v51;
  unint64_t v52;
  unint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  size_t __n;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v5 = sub_23BFF82CC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v89 = *(_QWORD *)(a3 + 88);
  v8 = *(_QWORD *)(v89 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if ((_DWORD)v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v10 <= v7)
    v11 = *(_DWORD *)(v6 + 84);
  else
    v11 = v10;
  v90 = *(_QWORD *)(a3 + 16);
  v91 = a3;
  v12 = *(_QWORD *)(v90 - 8);
  v13 = *(unsigned int *)(v12 + 84);
  v14 = v13 - 1;
  if (!(_DWORD)v13)
    v14 = 0;
  if (v14 <= v11)
    v15 = v11;
  else
    v15 = v14;
  if ((_DWORD)v9)
    v16 = *(_QWORD *)(v8 + 64);
  else
    v16 = *(_QWORD *)(v8 + 64) + 1;
  v17 = *(unsigned __int8 *)(v8 + 80);
  v18 = ~v17;
  v19 = *(_QWORD *)(v6 + 64) + v17;
  v20 = *(unsigned __int8 *)(v12 + 80);
  v21 = (v16 + v20 + (v19 & ~v17)) & ~v20;
  v22 = *(_QWORD *)(v12 + 64);
  if (!(_DWORD)v13)
    ++v22;
  v23 = v21 + v22;
  __n = v22;
  v87 = v18;
  v88 = ~v20;
  if (!v15)
  {
    if (!a2[v23])
      goto LABEL_33;
    v24 = (a2[v23] - 1) << (8 * v23);
    if (v23 > 3)
      v24 = 0;
    if ((_DWORD)v23)
    {
      if (v23 <= 3)
        v25 = v21 + v22;
      else
        v25 = 4;
      __asm { BR              X11 }
    }
    if (v24 == -1)
      goto LABEL_33;
    goto LABEL_42;
  }
  if ((_DWORD)v7 != v15)
  {
    v26 = (unint64_t)&a2[v19] & v18;
    if (v10 == v15)
      v27 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v26, v9, v89);
    else
      v27 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v12 + 48))((v26 + v16 + v20) & ~v20, v13, v90);
    if (v27 < 2)
      goto LABEL_33;
LABEL_42:
    if (v15)
      v34 = v23;
    else
      v34 = v23 + 1;
    v33 = a1;
    memcpy(a1, a2, v34);
    v32 = v91;
    goto LABEL_46;
  }
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
    goto LABEL_42;
LABEL_33:
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
  v28 = (void *)((unint64_t)&a1[v19] & v87);
  v29 = (const void *)((unint64_t)&a2[v19] & v87);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v29, 1, v89))
  {
    memcpy(v28, v29, v16);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v28, v29, v89);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v28, 0, 1, v89);
  }
  v30 = (void *)(((unint64_t)v28 + v16 + v20) & v88);
  v31 = (const void *)(((unint64_t)v29 + v16 + v20) & v88);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v31, 1, v90))
  {
    memcpy(v30, v31, __n);
    v32 = v91;
    v33 = a1;
    if (v15)
      goto LABEL_46;
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v30, v31, v90);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v30, 0, 1, v90);
    v32 = v91;
    v33 = a1;
    if (v15)
      goto LABEL_46;
  }
  v33[v23] = 0;
LABEL_46:
  if (v15)
    v35 = v23;
  else
    v35 = v23 + 1;
  v36 = v35 + 7;
  v37 = (unint64_t)&v33[v36] & 0xFFFFFFFFFFFFFFF8;
  v38 = (unint64_t)&a2[v36] & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v37 = *(_QWORD *)v38;
  *(_BYTE *)(v37 + 8) = *(_BYTE *)(v38 + 8);
  v39 = *(_QWORD *)(v32 + 104);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(unsigned __int8 *)(v40 + 80);
  v42 = (void *)((v41 + 9 + v37) & ~v41);
  v43 = (const void *)((v41 + 9 + v38) & ~v41);
  v44 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48);
  swift_bridgeObjectRetain();
  if (v44(v43, 1, v39))
  {
    v45 = *(_DWORD *)(v40 + 84);
    v46 = *(_QWORD *)(v40 + 64);
    if (v45)
      v47 = v46;
    else
      v47 = v46 + 1;
    memcpy(v42, v43, v47);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v42, v43, v39);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v42, 0, 1, v39);
    v45 = *(_DWORD *)(v40 + 84);
    v46 = *(_QWORD *)(v40 + 64);
  }
  if (v45)
    v48 = v46;
  else
    v48 = v46 + 1;
  v49 = (_OWORD *)(((unint64_t)v42 + v48 + 7) & 0xFFFFFFFFFFFFFFF8);
  v50 = (_OWORD *)(((unint64_t)v43 + v48 + 7) & 0xFFFFFFFFFFFFFFF8);
  v51 = v50[1];
  *v49 = *v50;
  v49[1] = v51;
  v52 = ((unint64_t)v49 + 39) & 0xFFFFFFFFFFFFFFF8;
  v53 = ((unint64_t)v50 + 39) & 0xFFFFFFFFFFFFFFF8;
  v54 = *(_OWORD *)v53;
  *(_QWORD *)(v52 + 16) = *(_QWORD *)(v53 + 16);
  *(_OWORD *)v52 = v54;
  *(_BYTE *)(v52 + 24) = *(_BYTE *)(v53 + 24);
  v55 = *(_QWORD *)(*(_QWORD *)(v32 + 112) - 8);
  v56 = *(unsigned __int8 *)(v55 + 80);
  v57 = (v56 + 25 + v52) & ~v56;
  v58 = (v56 + 25 + v53) & ~v56;
  (*(void (**)(uint64_t, uint64_t))(v55 + 16))(v57, v58);
  v59 = *(_QWORD *)(v55 + 64) + 7;
  v60 = (_QWORD *)((v59 + v57) & 0xFFFFFFFFFFFFFFF8);
  v61 = (_QWORD *)((v59 + v58) & 0xFFFFFFFFFFFFFFF8);
  v62 = v61[1];
  *v60 = *v61;
  v60[1] = v62;
  v63 = (_QWORD *)(((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFFFF8);
  v64 = (_QWORD *)(((unint64_t)v61 + 23) & 0xFFFFFFFFFFFFFFF8);
  v65 = v64[1];
  *v63 = *v64;
  v63[1] = v65;
  v66 = (_QWORD *)(((unint64_t)v63 + 23) & 0xFFFFFFFFFFFFFFF8);
  v67 = (_QWORD *)(((unint64_t)v64 + 23) & 0xFFFFFFFFFFFFFFF8);
  v68 = v67[1];
  *v66 = *v67;
  v66[1] = v68;
  v69 = (_QWORD *)(((unint64_t)v66 + 23) & 0xFFFFFFFFFFFFFFF8);
  v70 = (_QWORD *)(((unint64_t)v67 + 23) & 0xFFFFFFFFFFFFFFF8);
  v71 = v70[1];
  *v69 = *v70;
  v69[1] = v71;
  v72 = (_QWORD *)(((unint64_t)v69 + 23) & 0xFFFFFFFFFFFFFFF8);
  v73 = (_QWORD *)(((unint64_t)v70 + 23) & 0xFFFFFFFFFFFFFFF8);
  v74 = v73[1];
  *v72 = *v73;
  v72[1] = v74;
  v75 = ((unint64_t)v72 + 23) & 0xFFFFFFFFFFFFFFF8;
  v76 = (unint64_t *)(((unint64_t)v73 + 23) & 0xFFFFFFFFFFFFFFF8);
  v77 = *v76;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v77 < 0xFFFFFFFF)
  {
    *(_OWORD *)v75 = *(_OWORD *)v76;
  }
  else
  {
    v78 = v76[1];
    *(_QWORD *)v75 = v77;
    *(_QWORD *)(v75 + 8) = v78;
    swift_retain();
  }
  v79 = (v75 + 23) & 0xFFFFFFFFFFFFFFF8;
  v80 = ((unint64_t)v76 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v80 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v79 = *(_OWORD *)v80;
  }
  else
  {
    v81 = *(_QWORD *)(v80 + 8);
    *(_QWORD *)v79 = *(_QWORD *)v80;
    *(_QWORD *)(v79 + 8) = v81;
    swift_retain();
  }
  v82 = (v79 + 23) & 0xFFFFFFFFFFFFFFF8;
  v83 = (v80 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v83 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v82 = *(_OWORD *)v83;
  }
  else
  {
    v84 = *(_QWORD *)(v83 + 8);
    *(_QWORD *)v82 = *(_QWORD *)v83;
    *(_QWORD *)(v82 + 8) = v84;
    swift_retain();
  }
  return v33;
}

_BYTE *sub_23BFE3EBC(_BYTE *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  uint64_t (*v25)(unsigned __int8 *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;
  int v33;
  const void *v34;
  int v35;
  uint64_t v36;
  size_t v37;
  char v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int v42;
  unint64_t v43;
  unsigned int v44;
  unint64_t v45;
  unsigned int v46;
  int v47;
  int v48;
  unint64_t v49;
  size_t v50;
  const void *v51;
  void *v52;
  void *v53;
  uint64_t (*v54)(void *, uint64_t, uint64_t);
  int v55;
  int v56;
  size_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t (*v61)(void *, uint64_t, uint64_t);
  int v62;
  int v63;
  unsigned int v64;
  size_t v65;
  void *v66;
  const void *v67;
  size_t v68;
  void *v69;
  const void *v70;
  size_t v71;
  size_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t (*v80)(void *, uint64_t, uint64_t);
  int v81;
  int v82;
  size_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  _QWORD *v97;
  _QWORD *v98;
  uint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  uint64_t v102;
  _QWORD *v103;
  _QWORD *v104;
  uint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  uint64_t v108;
  _QWORD *v109;
  unint64_t *v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  _QWORD *v114;
  unint64_t *v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  _QWORD *v119;
  unint64_t *v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v125;
  size_t v126;
  uint64_t v127;
  size_t __n;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unsigned int v134;

  v5 = sub_23BFF82CC();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v130 = *(_QWORD *)(a3 + 88);
  v9 = *(_QWORD *)(v130 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if ((_DWORD)v10)
    v11 = v10 - 1;
  else
    v11 = 0;
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = v11;
  v133 = a3;
  v129 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v129 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  v15 = v14 - 1;
  if (!(_DWORD)v14)
    v15 = 0;
  if (v15 <= v12)
    v16 = v12;
  else
    v16 = v15;
  if ((_DWORD)v10)
    v17 = *(_QWORD *)(v9 + 64);
  else
    v17 = *(_QWORD *)(v9 + 64) + 1;
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = ~v18;
  v20 = *(_QWORD *)(v7 + 64) + v18;
  v21 = *(unsigned __int8 *)(v13 + 80);
  v127 = ~v21;
  __n = v17;
  v22 = (v17 + v21 + (v20 & ~v18)) & ~v21;
  if ((_DWORD)v14)
    v23 = *(_QWORD *)(v13 + 64);
  else
    v23 = *(_QWORD *)(v13 + 64) + 1;
  v24 = v22 + v23;
  v134 = v16;
  v131 = *(_QWORD *)(v7 + 64) + v18;
  v132 = v22 + v23;
  v126 = v23;
  if (!v16)
  {
    v38 = 8 * v24;
    v36 = v133;
    v34 = a2;
    v37 = v24;
    if (a1[v24])
    {
      v39 = (a1[v24] - 1) << v38;
      if (v24 > 3)
        v39 = 0;
      if ((_DWORD)v24)
      {
        if (v24 > 3)
          LODWORD(v24) = 4;
        __asm { BR              X12 }
      }
      if (v39 != -1)
      {
        if (!a2[v24])
          goto LABEL_83;
        v37 = v132;
        if ((a2[v24] - 1) << v38 == -1)
          goto LABEL_83;
        goto LABEL_79;
      }
    }
    if (!a2[v24])
      goto LABEL_62;
    v47 = (a2[v24] - 1) << v38;
    if (v132 > 3)
      v47 = 0;
    if ((_DWORD)v132)
    {
      if (v132 <= 3)
        v48 = v132;
      else
        v48 = 4;
      __asm { BR              X11 }
    }
    v35 = v47 + 1;
    goto LABEL_57;
  }
  if ((_DWORD)v8 == v16)
  {
    v25 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v7 + 48);
    v125 = *(_QWORD *)(v130 - 8);
    v26 = *(_QWORD *)(v5 - 8);
    v27 = *(unsigned __int8 *)(v13 + 80);
    v28 = ~v18;
    v29 = *(_QWORD *)(v129 - 8);
    v30 = a1;
    v31 = a1;
    v32 = v6;
    v33 = ((uint64_t (*)(_BYTE *, uint64_t))v25)(v31, v8);
    v34 = a2;
    v35 = v25(a2, v8, v32);
    v6 = v32;
    a1 = v30;
    v13 = v29;
    v19 = v28;
    v21 = v27;
    v7 = v26;
    v9 = v125;
    v36 = v133;
    if (v33)
    {
      v37 = v132;
      if (!v35)
        goto LABEL_83;
LABEL_79:
      if (v134)
        v65 = v37;
      else
        v65 = v37 + 1;
      memcpy(a1, v34, v65);
      v64 = v134;
      goto LABEL_91;
    }
LABEL_57:
    if (v35)
    {
LABEL_58:
      (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(a1, v6);
      v49 = (unint64_t)&a1[v131] & v19;
      if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v49, 1, v130))
        (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v49, v130);
      v50 = (v49 + __n + v21) & v127;
      v37 = v132;
      if (!(*(unsigned int (**)(size_t, uint64_t, uint64_t))(v13 + 48))(v50, 1, v129))
        (*(void (**)(size_t, uint64_t))(v13 + 8))(v50, v129);
      goto LABEL_79;
    }
LABEL_62:
    (*(void (**)(_BYTE *, const void *, uint64_t))(v7 + 24))(a1, v34, v6);
    v51 = v34;
    v52 = (void *)((unint64_t)&a1[v131] & v19);
    v53 = (void *)(((unint64_t)v51 + v131) & v19);
    v54 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
    v55 = v54(v52, 1, v130);
    v56 = v54(v53, 1, v130);
    if (v55)
    {
      if (!v56)
      {
        (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v52, v53, v130);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v52, 0, 1, v130);
LABEL_69:
        v57 = __n;
        v58 = v129;
LABEL_70:
        v59 = (void *)(((unint64_t)v52 + v57 + v21) & v127);
        v60 = (void *)(((unint64_t)v53 + v57 + v21) & v127);
        v61 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
        v62 = v61(v59, 1, v58);
        v63 = v61(v60, 1, v58);
        if (v62)
        {
          if (!v63)
          {
            (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v59, v60, v58);
            (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v59, 0, 1, v58);
LABEL_76:
            v37 = v132;
            v36 = v133;
            v34 = a2;
            v64 = v134;
            goto LABEL_91;
          }
        }
        else
        {
          if (!v63)
          {
            (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v59, v60, v58);
            goto LABEL_76;
          }
          (*(void (**)(void *, uint64_t))(v13 + 8))(v59, v58);
        }
        memcpy(v59, v60, v126);
        goto LABEL_76;
      }
    }
    else
    {
      if (!v56)
      {
        (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v52, v53, v130);
        goto LABEL_69;
      }
      (*(void (**)(void *, uint64_t))(v9 + 8))(v52, v130);
    }
    v57 = __n;
    memcpy(v52, v53, __n);
    v58 = v129;
    goto LABEL_70;
  }
  v40 = v5;
  v41 = (unint64_t)&a1[v20] & v19;
  if (v11 == v16)
    v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v41, v10, v130);
  else
    v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v41 + __n + v21) & ~v21, v14, v129);
  if (v42 < 2)
  {
    v43 = (unint64_t)&a2[v131] & v19;
    if (v11 == v134)
      v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v43, v10, v130);
    else
      v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v43 + __n + v21) & v127, v14, v129);
    v36 = v133;
    v34 = a2;
    v6 = v40;
    if (v44 >= 2)
      goto LABEL_58;
    goto LABEL_62;
  }
  v45 = (unint64_t)&a2[v131] & v19;
  if (v11 == v134)
    v46 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v45, v10, v130);
  else
    v46 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v45 + __n + v21) & v127, v14, v129);
  v37 = v132;
  v36 = v133;
  v34 = a2;
  v6 = v40;
  if (v46 >= 2)
    goto LABEL_79;
LABEL_83:
  (*(void (**)(_BYTE *, const void *, uint64_t))(v7 + 16))(a1, v34, v6);
  v66 = (void *)((unint64_t)&a1[v131] & v19);
  v67 = (const void *)(((unint64_t)v34 + v131) & v19);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v67, 1, v130))
  {
    v68 = __n;
    memcpy(v66, v67, __n);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v66, v67, v130);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v66, 0, 1, v130);
    v68 = __n;
  }
  v69 = (void *)(((unint64_t)v66 + v68 + v21) & v127);
  v70 = (const void *)(((unint64_t)v67 + v68 + v21) & v127);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v70, 1, v129))
  {
    memcpy(v69, v70, v126);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v69, v70, v129);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v69, 0, 1, v129);
  }
  v34 = a2;
  v64 = v134;
  if (!v134)
    a1[v37] = 0;
LABEL_91:
  if (v64)
    v71 = v37;
  else
    v71 = v37 + 1;
  v72 = v71 + 7;
  v73 = (unint64_t)&a1[v72] & 0xFFFFFFFFFFFFFFF8;
  v74 = ((unint64_t)v34 + v72) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v73 = *(_QWORD *)v74;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v73 + 8) = *(_BYTE *)(v74 + 8);
  v75 = *(_QWORD *)(v36 + 104);
  v76 = *(_QWORD *)(v75 - 8);
  v77 = *(unsigned __int8 *)(v76 + 80);
  v78 = (void *)((v77 + 9 + v73) & ~v77);
  v79 = (void *)((v77 + 9 + v74) & ~v77);
  v80 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v76 + 48);
  v81 = v80(v78, 1, v75);
  v82 = v80(v79, 1, v75);
  if (v81)
  {
    if (!v82)
    {
      (*(void (**)(void *, void *, uint64_t))(v76 + 16))(v78, v79, v75);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v76 + 56))(v78, 0, 1, v75);
      goto LABEL_103;
    }
  }
  else
  {
    if (!v82)
    {
      (*(void (**)(void *, void *, uint64_t))(v76 + 24))(v78, v79, v75);
      goto LABEL_103;
    }
    (*(void (**)(void *, uint64_t))(v76 + 8))(v78, v75);
  }
  if (*(_DWORD *)(v76 + 84))
    v83 = *(_QWORD *)(v76 + 64);
  else
    v83 = *(_QWORD *)(v76 + 64) + 1;
  memcpy(v78, v79, v83);
LABEL_103:
  if (*(_DWORD *)(v76 + 84))
    v84 = *(_QWORD *)(v76 + 64);
  else
    v84 = *(_QWORD *)(v76 + 64) + 1;
  v85 = (_QWORD *)(((unint64_t)v78 + v84 + 7) & 0xFFFFFFFFFFFFFFF8);
  v86 = (_QWORD *)(((unint64_t)v79 + v84 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v85 = *v86;
  v85[1] = v86[1];
  v85[2] = v86[2];
  v85[3] = v86[3];
  v87 = ((unint64_t)v85 + 39) & 0xFFFFFFFFFFFFFFF8;
  v88 = ((unint64_t)v86 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v87 = *(_QWORD *)v88;
  *(_QWORD *)(v87 + 8) = *(_QWORD *)(v88 + 8);
  *(_QWORD *)(v87 + 16) = *(_QWORD *)(v88 + 16);
  *(_BYTE *)(v87 + 24) = *(_BYTE *)(v88 + 24);
  v89 = *(_QWORD *)(*(_QWORD *)(v36 + 112) - 8);
  v90 = *(unsigned __int8 *)(v89 + 80);
  v91 = (v90 + 25 + v87) & ~v90;
  v92 = (v90 + 25 + v88) & ~v90;
  (*(void (**)(uint64_t, uint64_t))(v89 + 24))(v91, v92);
  v93 = *(_QWORD *)(v89 + 64) + 7;
  v94 = (_QWORD *)((v93 + v91) & 0xFFFFFFFFFFFFFFF8);
  v95 = (_QWORD *)((v93 + v92) & 0xFFFFFFFFFFFFFFF8);
  v96 = v95[1];
  *v94 = *v95;
  v94[1] = v96;
  swift_retain();
  swift_release();
  v97 = (_QWORD *)(((unint64_t)v94 + 23) & 0xFFFFFFFFFFFFFFF8);
  v98 = (_QWORD *)(((unint64_t)v95 + 23) & 0xFFFFFFFFFFFFFFF8);
  v99 = v98[1];
  *v97 = *v98;
  v97[1] = v99;
  swift_retain();
  swift_release();
  v100 = (_QWORD *)(((unint64_t)v97 + 23) & 0xFFFFFFFFFFFFFFF8);
  v101 = (_QWORD *)(((unint64_t)v98 + 23) & 0xFFFFFFFFFFFFFFF8);
  v102 = v101[1];
  *v100 = *v101;
  v100[1] = v102;
  swift_retain();
  swift_release();
  v103 = (_QWORD *)(((unint64_t)v100 + 23) & 0xFFFFFFFFFFFFFFF8);
  v104 = (_QWORD *)(((unint64_t)v101 + 23) & 0xFFFFFFFFFFFFFFF8);
  v105 = v104[1];
  *v103 = *v104;
  v103[1] = v105;
  swift_retain();
  swift_release();
  v106 = (_QWORD *)(((unint64_t)v103 + 23) & 0xFFFFFFFFFFFFFFF8);
  v107 = (_QWORD *)(((unint64_t)v104 + 23) & 0xFFFFFFFFFFFFFFF8);
  v108 = v107[1];
  *v106 = *v107;
  v106[1] = v108;
  swift_retain();
  swift_release();
  v109 = (_QWORD *)(((unint64_t)v106 + 23) & 0xFFFFFFFFFFFFFFF8);
  v110 = (unint64_t *)(((unint64_t)v107 + 23) & 0xFFFFFFFFFFFFFFF8);
  v111 = *v110;
  if (*v109 < 0xFFFFFFFFuLL)
  {
    if (v111 >= 0xFFFFFFFF)
    {
      v113 = v110[1];
      *v109 = v111;
      v109[1] = v113;
      swift_retain();
      goto LABEL_113;
    }
  }
  else
  {
    if (v111 >= 0xFFFFFFFF)
    {
      v112 = v110[1];
      *v109 = v111;
      v109[1] = v112;
      swift_retain();
      swift_release();
      goto LABEL_113;
    }
    swift_release();
  }
  *(_OWORD *)v109 = *(_OWORD *)v110;
LABEL_113:
  v114 = (_QWORD *)(((unint64_t)v109 + 23) & 0xFFFFFFFFFFFFFFF8);
  v115 = (unint64_t *)(((unint64_t)v110 + 23) & 0xFFFFFFFFFFFFFFF8);
  v116 = *v115;
  if (*v114 < 0xFFFFFFFFuLL)
  {
    if (v116 >= 0xFFFFFFFF)
    {
      v118 = v115[1];
      *v114 = v116;
      v114[1] = v118;
      swift_retain();
      goto LABEL_120;
    }
  }
  else
  {
    if (v116 >= 0xFFFFFFFF)
    {
      v117 = v115[1];
      *v114 = v116;
      v114[1] = v117;
      swift_retain();
      swift_release();
      goto LABEL_120;
    }
    swift_release();
  }
  *(_OWORD *)v114 = *(_OWORD *)v115;
LABEL_120:
  v119 = (_QWORD *)(((unint64_t)v114 + 23) & 0xFFFFFFFFFFFFFFF8);
  v120 = (unint64_t *)(((unint64_t)v115 + 23) & 0xFFFFFFFFFFFFFFF8);
  v121 = *v120;
  if (*v119 < 0xFFFFFFFFuLL)
  {
    if (v121 >= 0xFFFFFFFF)
    {
      v123 = v120[1];
      *v119 = v121;
      v119[1] = v123;
      swift_retain();
      return a1;
    }
LABEL_126:
    *(_OWORD *)v119 = *(_OWORD *)v120;
    return a1;
  }
  if (v121 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_126;
  }
  v122 = v120[1];
  *v119 = v121;
  v119[1] = v122;
  swift_retain();
  swift_release();
  return a1;
}

_BYTE *sub_23BFE4A0C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  size_t v22;
  size_t v23;
  int v24;
  int v25;
  unint64_t v26;
  unsigned int v27;
  void *v28;
  const void *v29;
  void *v30;
  const void *v31;
  _BYTE *v32;
  uint64_t v33;
  size_t v34;
  size_t v35;
  size_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const void *v43;
  int v44;
  size_t v45;
  size_t v46;
  size_t v47;
  _OWORD *v48;
  _OWORD *v49;
  __int128 v50;
  unint64_t v51;
  unint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD *v59;
  _OWORD *v60;
  _OWORD *v61;
  _OWORD *v62;
  _OWORD *v63;
  _OWORD *v64;
  _OWORD *v65;
  _OWORD *v66;
  _OWORD *v67;
  _OWORD *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  size_t __n;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v5 = sub_23BFF82CC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v83 = *(_QWORD *)(a3 + 88);
  v8 = *(_QWORD *)(v83 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if ((_DWORD)v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v10 <= v7)
    v11 = *(_DWORD *)(v6 + 84);
  else
    v11 = v10;
  v84 = *(_QWORD *)(a3 + 16);
  v85 = a3;
  v12 = *(_QWORD *)(v84 - 8);
  v13 = *(unsigned int *)(v12 + 84);
  v14 = v13 - 1;
  if (!(_DWORD)v13)
    v14 = 0;
  if (v14 <= v11)
    v15 = v11;
  else
    v15 = v14;
  if ((_DWORD)v9)
    v16 = *(_QWORD *)(v8 + 64);
  else
    v16 = *(_QWORD *)(v8 + 64) + 1;
  v17 = *(unsigned __int8 *)(v8 + 80);
  v18 = ~v17;
  v19 = *(_QWORD *)(v6 + 64) + v17;
  v20 = *(unsigned __int8 *)(v12 + 80);
  v21 = (v16 + v20 + (v19 & ~v17)) & ~v20;
  v22 = *(_QWORD *)(v12 + 64);
  if (!(_DWORD)v13)
    ++v22;
  v23 = v21 + v22;
  __n = v22;
  v81 = v18;
  v82 = ~v20;
  if (!v15)
  {
    if (!a2[v23])
      goto LABEL_33;
    v24 = (a2[v23] - 1) << (8 * v23);
    if (v23 > 3)
      v24 = 0;
    if ((_DWORD)v23)
    {
      if (v23 <= 3)
        v25 = v21 + v22;
      else
        v25 = 4;
      __asm { BR              X11 }
    }
    if (v24 == -1)
      goto LABEL_33;
    goto LABEL_42;
  }
  if ((_DWORD)v7 != v15)
  {
    v26 = (unint64_t)&a2[v19] & v18;
    if (v10 == v15)
      v27 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v26, v9, v83);
    else
      v27 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v12 + 48))((v26 + v16 + v20) & ~v20, v13, v84);
    if (v27 < 2)
      goto LABEL_33;
LABEL_42:
    if (v15)
      v34 = v23;
    else
      v34 = v23 + 1;
    v32 = a1;
    memcpy(a1, a2, v34);
    v33 = v85;
    goto LABEL_46;
  }
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
    goto LABEL_42;
LABEL_33:
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
  v28 = (void *)((unint64_t)&a1[v19] & v81);
  v29 = (const void *)((unint64_t)&a2[v19] & v81);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v29, 1, v83))
  {
    memcpy(v28, v29, v16);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v28, v29, v83);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v28, 0, 1, v83);
  }
  v30 = (void *)(((unint64_t)v28 + v16 + v20) & v82);
  v31 = (const void *)(((unint64_t)v29 + v16 + v20) & v82);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v31, 1, v84))
  {
    memcpy(v30, v31, __n);
    v33 = v85;
    v32 = a1;
    if (v15)
      goto LABEL_46;
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v30, v31, v84);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v30, 0, 1, v84);
    v33 = v85;
    v32 = a1;
    if (v15)
      goto LABEL_46;
  }
  v32[v23] = 0;
LABEL_46:
  if (v15)
    v35 = v23;
  else
    v35 = v23 + 1;
  v36 = v35 + 7;
  v37 = (unint64_t)&v32[v36] & 0xFFFFFFFFFFFFFFF8;
  v38 = (unint64_t)&a2[v36] & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v37 = *(_QWORD *)v38;
  *(_BYTE *)(v37 + 8) = *(_BYTE *)(v38 + 8);
  v39 = *(_QWORD *)(v33 + 104);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(unsigned __int8 *)(v40 + 80);
  v42 = (void *)((v41 + 9 + v37) & ~v41);
  v43 = (const void *)((v41 + 9 + v38) & ~v41);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48))(v43, 1, v39))
  {
    v44 = *(_DWORD *)(v40 + 84);
    v45 = *(_QWORD *)(v40 + 64);
    if (v44)
      v46 = v45;
    else
      v46 = v45 + 1;
    memcpy(v42, v43, v46);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 32))(v42, v43, v39);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v42, 0, 1, v39);
    v44 = *(_DWORD *)(v40 + 84);
    v45 = *(_QWORD *)(v40 + 64);
  }
  if (v44)
    v47 = v45;
  else
    v47 = v45 + 1;
  v48 = (_OWORD *)(((unint64_t)v42 + v47 + 7) & 0xFFFFFFFFFFFFFFF8);
  v49 = (_OWORD *)(((unint64_t)v43 + v47 + 7) & 0xFFFFFFFFFFFFFFF8);
  v50 = v49[1];
  *v48 = *v49;
  v48[1] = v50;
  v51 = ((unint64_t)v48 + 39) & 0xFFFFFFFFFFFFFFF8;
  v52 = ((unint64_t)v49 + 39) & 0xFFFFFFFFFFFFFFF8;
  v53 = *(_OWORD *)v52;
  *(_QWORD *)(v51 + 16) = *(_QWORD *)(v52 + 16);
  *(_OWORD *)v51 = v53;
  *(_BYTE *)(v51 + 24) = *(_BYTE *)(v52 + 24);
  v54 = *(_QWORD *)(*(_QWORD *)(v33 + 112) - 8);
  v55 = *(unsigned __int8 *)(v54 + 80);
  v56 = (v55 + 25 + v51) & ~v55;
  v57 = (v55 + 25 + v52) & ~v55;
  (*(void (**)(uint64_t, uint64_t))(v54 + 32))(v56, v57);
  v58 = *(_QWORD *)(v54 + 64) + 7;
  v59 = (_OWORD *)((v58 + v56) & 0xFFFFFFFFFFFFFFF8);
  v60 = (_OWORD *)((v58 + v57) & 0xFFFFFFFFFFFFFFF8);
  *v59 = *v60;
  v61 = (_OWORD *)(((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFF8);
  v62 = (_OWORD *)(((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v61 = *v62;
  v63 = (_OWORD *)(((unint64_t)v61 + 23) & 0xFFFFFFFFFFFFFFF8);
  v64 = (_OWORD *)(((unint64_t)v62 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v63 = *v64;
  v65 = (_OWORD *)(((unint64_t)v63 + 23) & 0xFFFFFFFFFFFFF8);
  v66 = (_OWORD *)(((unint64_t)v64 + 23) & 0xFFFFFFFFFFFFF8);
  *v65 = *v66;
  v67 = (_OWORD *)(((unint64_t)v65 + 23) & 0xFFFFFFFFFFFFF8);
  v68 = (_OWORD *)(((unint64_t)v66 + 23) & 0xFFFFFFFFFFFFF8);
  *v67 = *v68;
  v69 = ((unint64_t)v67 + 23) & 0xFFFFFFFFFFFFFFF8;
  v70 = ((unint64_t)v68 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v70 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v69 = *(_OWORD *)v70;
  }
  else
  {
    v71 = *(_QWORD *)(v70 + 8);
    *(_QWORD *)v69 = *(_QWORD *)v70;
    *(_QWORD *)(v69 + 8) = v71;
  }
  v72 = (v69 + 23) & 0xFFFFFFFFFFFFFFF8;
  v73 = (v70 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v73 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v72 = *(_OWORD *)v73;
  }
  else
  {
    v74 = *(_QWORD *)(v73 + 8);
    *(_QWORD *)v72 = *(_QWORD *)v73;
    *(_QWORD *)(v72 + 8) = v74;
  }
  v75 = (v72 + 23) & 0xFFFFFFFFFFFFFFF8;
  v76 = (uint64_t *)((v73 + 23) & 0xFFFFFFFFFFFFFFF8);
  v77 = *v76;
  if ((unint64_t)*v76 < 0xFFFFFFFF)
  {
    *(_OWORD *)v75 = *(_OWORD *)v76;
  }
  else
  {
    v78 = v76[1];
    *(_QWORD *)v75 = v77;
    *(_QWORD *)(v75 + 8) = v78;
  }
  return v32;
}

_BYTE *sub_23BFE4F44(_BYTE *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  uint64_t (*v25)(unsigned __int8 *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  _BYTE *v31;
  uint64_t v32;
  int v33;
  const void *v34;
  int v35;
  uint64_t v36;
  size_t v37;
  char v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int v42;
  unint64_t v43;
  unsigned int v44;
  unint64_t v45;
  unsigned int v46;
  int v47;
  int v48;
  unint64_t v49;
  size_t v50;
  const void *v51;
  void *v52;
  void *v53;
  uint64_t (*v54)(void *, uint64_t, uint64_t);
  int v55;
  int v56;
  size_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t (*v61)(void *, uint64_t, uint64_t);
  int v62;
  int v63;
  unsigned int v64;
  size_t v65;
  void *v66;
  const void *v67;
  size_t v68;
  void *v69;
  const void *v70;
  size_t v71;
  size_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t (*v80)(void *, uint64_t, uint64_t);
  int v81;
  int v82;
  size_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _OWORD *v94;
  uint64_t v95;
  unint64_t v96;
  _OWORD *v97;
  _OWORD *v98;
  _OWORD *v99;
  _OWORD *v100;
  uint64_t v101;
  __int128 v102;
  _OWORD *v103;
  uint64_t v104;
  _QWORD *v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  unint64_t *v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  _QWORD *v115;
  unint64_t *v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v121;
  size_t v122;
  uint64_t v123;
  size_t __n;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unsigned int v130;

  v5 = sub_23BFF82CC();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v126 = *(_QWORD *)(a3 + 88);
  v9 = *(_QWORD *)(v126 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if ((_DWORD)v10)
    v11 = v10 - 1;
  else
    v11 = 0;
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = v11;
  v129 = a3;
  v125 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v125 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  v15 = v14 - 1;
  if (!(_DWORD)v14)
    v15 = 0;
  if (v15 <= v12)
    v16 = v12;
  else
    v16 = v15;
  if ((_DWORD)v10)
    v17 = *(_QWORD *)(v9 + 64);
  else
    v17 = *(_QWORD *)(v9 + 64) + 1;
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = ~v18;
  v20 = *(_QWORD *)(v7 + 64) + v18;
  v21 = *(unsigned __int8 *)(v13 + 80);
  v123 = ~v21;
  __n = v17;
  v22 = (v17 + v21 + (v20 & ~v18)) & ~v21;
  if ((_DWORD)v14)
    v23 = *(_QWORD *)(v13 + 64);
  else
    v23 = *(_QWORD *)(v13 + 64) + 1;
  v24 = v22 + v23;
  v130 = v16;
  v127 = *(_QWORD *)(v7 + 64) + v18;
  v128 = v22 + v23;
  v122 = v23;
  if (!v16)
  {
    v38 = 8 * v24;
    v36 = v129;
    v34 = a2;
    v37 = v24;
    if (a1[v24])
    {
      v39 = (a1[v24] - 1) << v38;
      if (v24 > 3)
        v39 = 0;
      if ((_DWORD)v24)
      {
        if (v24 > 3)
          LODWORD(v24) = 4;
        __asm { BR              X12 }
      }
      if (v39 != -1)
      {
        if (!a2[v24])
          goto LABEL_83;
        v37 = v128;
        if ((a2[v24] - 1) << v38 == -1)
          goto LABEL_83;
        goto LABEL_79;
      }
    }
    if (!a2[v24])
      goto LABEL_62;
    v47 = (a2[v24] - 1) << v38;
    if (v128 > 3)
      v47 = 0;
    if ((_DWORD)v128)
    {
      if (v128 <= 3)
        v48 = v128;
      else
        v48 = 4;
      __asm { BR              X11 }
    }
    v35 = v47 + 1;
    goto LABEL_57;
  }
  if ((_DWORD)v8 == v16)
  {
    v25 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v7 + 48);
    v121 = *(_QWORD *)(v126 - 8);
    v26 = *(_QWORD *)(v5 - 8);
    v27 = *(unsigned __int8 *)(v13 + 80);
    v28 = ~v18;
    v29 = *(_QWORD *)(v125 - 8);
    v30 = a1;
    v31 = a1;
    v32 = v6;
    v33 = ((uint64_t (*)(_BYTE *, uint64_t))v25)(v31, v8);
    v34 = a2;
    v35 = v25(a2, v8, v32);
    v6 = v32;
    a1 = v30;
    v13 = v29;
    v19 = v28;
    v21 = v27;
    v7 = v26;
    v9 = v121;
    v36 = v129;
    if (v33)
    {
      v37 = v128;
      if (!v35)
        goto LABEL_83;
LABEL_79:
      if (v130)
        v65 = v37;
      else
        v65 = v37 + 1;
      memcpy(a1, v34, v65);
      v64 = v130;
      goto LABEL_91;
    }
LABEL_57:
    if (v35)
    {
LABEL_58:
      (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(a1, v6);
      v49 = (unint64_t)&a1[v127] & v19;
      if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v49, 1, v126))
        (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v49, v126);
      v50 = (v49 + __n + v21) & v123;
      v37 = v128;
      if (!(*(unsigned int (**)(size_t, uint64_t, uint64_t))(v13 + 48))(v50, 1, v125))
        (*(void (**)(size_t, uint64_t))(v13 + 8))(v50, v125);
      goto LABEL_79;
    }
LABEL_62:
    (*(void (**)(_BYTE *, const void *, uint64_t))(v7 + 40))(a1, v34, v6);
    v51 = v34;
    v52 = (void *)((unint64_t)&a1[v127] & v19);
    v53 = (void *)(((unint64_t)v51 + v127) & v19);
    v54 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
    v55 = v54(v52, 1, v126);
    v56 = v54(v53, 1, v126);
    if (v55)
    {
      if (!v56)
      {
        (*(void (**)(void *, void *, uint64_t))(v9 + 32))(v52, v53, v126);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v52, 0, 1, v126);
LABEL_69:
        v57 = __n;
        v58 = v125;
LABEL_70:
        v59 = (void *)(((unint64_t)v52 + v57 + v21) & v123);
        v60 = (void *)(((unint64_t)v53 + v57 + v21) & v123);
        v61 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
        v62 = v61(v59, 1, v58);
        v63 = v61(v60, 1, v58);
        if (v62)
        {
          if (!v63)
          {
            (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v59, v60, v58);
            (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v59, 0, 1, v58);
LABEL_76:
            v37 = v128;
            v36 = v129;
            v34 = a2;
            v64 = v130;
            goto LABEL_91;
          }
        }
        else
        {
          if (!v63)
          {
            (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v59, v60, v58);
            goto LABEL_76;
          }
          (*(void (**)(void *, uint64_t))(v13 + 8))(v59, v58);
        }
        memcpy(v59, v60, v122);
        goto LABEL_76;
      }
    }
    else
    {
      if (!v56)
      {
        (*(void (**)(void *, void *, uint64_t))(v9 + 40))(v52, v53, v126);
        goto LABEL_69;
      }
      (*(void (**)(void *, uint64_t))(v9 + 8))(v52, v126);
    }
    v57 = __n;
    memcpy(v52, v53, __n);
    v58 = v125;
    goto LABEL_70;
  }
  v40 = v5;
  v41 = (unint64_t)&a1[v20] & v19;
  if (v11 == v16)
    v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v41, v10, v126);
  else
    v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v41 + __n + v21) & ~v21, v14, v125);
  if (v42 < 2)
  {
    v43 = (unint64_t)&a2[v127] & v19;
    if (v11 == v130)
      v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v43, v10, v126);
    else
      v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v43 + __n + v21) & v123, v14, v125);
    v36 = v129;
    v34 = a2;
    v6 = v40;
    if (v44 >= 2)
      goto LABEL_58;
    goto LABEL_62;
  }
  v45 = (unint64_t)&a2[v127] & v19;
  if (v11 == v130)
    v46 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v45, v10, v126);
  else
    v46 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v45 + __n + v21) & v123, v14, v125);
  v37 = v128;
  v36 = v129;
  v34 = a2;
  v6 = v40;
  if (v46 >= 2)
    goto LABEL_79;
LABEL_83:
  (*(void (**)(_BYTE *, const void *, uint64_t))(v7 + 32))(a1, v34, v6);
  v66 = (void *)((unint64_t)&a1[v127] & v19);
  v67 = (const void *)(((unint64_t)v34 + v127) & v19);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v67, 1, v126))
  {
    v68 = __n;
    memcpy(v66, v67, __n);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v66, v67, v126);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v66, 0, 1, v126);
    v68 = __n;
  }
  v69 = (void *)(((unint64_t)v66 + v68 + v21) & v123);
  v70 = (const void *)(((unint64_t)v67 + v68 + v21) & v123);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v70, 1, v125))
  {
    memcpy(v69, v70, v122);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v69, v70, v125);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v69, 0, 1, v125);
  }
  v34 = a2;
  v64 = v130;
  if (!v130)
    a1[v37] = 0;
LABEL_91:
  if (v64)
    v71 = v37;
  else
    v71 = v37 + 1;
  v72 = v71 + 7;
  v73 = (unint64_t)&a1[v72] & 0xFFFFFFFFFFFFFFF8;
  v74 = ((unint64_t)v34 + v72) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v73 = *(_QWORD *)v74;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v73 + 8) = *(_BYTE *)(v74 + 8);
  v75 = *(_QWORD *)(v36 + 104);
  v76 = *(_QWORD *)(v75 - 8);
  v77 = *(unsigned __int8 *)(v76 + 80);
  v78 = (void *)((v77 + 9 + v73) & ~v77);
  v79 = (void *)((v77 + 9 + v74) & ~v77);
  v80 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v76 + 48);
  v81 = v80(v78, 1, v75);
  v82 = v80(v79, 1, v75);
  if (v81)
  {
    if (!v82)
    {
      (*(void (**)(void *, void *, uint64_t))(v76 + 32))(v78, v79, v75);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v76 + 56))(v78, 0, 1, v75);
      goto LABEL_103;
    }
  }
  else
  {
    if (!v82)
    {
      (*(void (**)(void *, void *, uint64_t))(v76 + 40))(v78, v79, v75);
      goto LABEL_103;
    }
    (*(void (**)(void *, uint64_t))(v76 + 8))(v78, v75);
  }
  if (*(_DWORD *)(v76 + 84))
    v83 = *(_QWORD *)(v76 + 64);
  else
    v83 = *(_QWORD *)(v76 + 64) + 1;
  memcpy(v78, v79, v83);
LABEL_103:
  if (*(_DWORD *)(v76 + 84))
    v84 = *(_QWORD *)(v76 + 64);
  else
    v84 = *(_QWORD *)(v76 + 64) + 1;
  v85 = (_QWORD *)(((unint64_t)v78 + v84 + 7) & 0xFFFFFFFFFFFFFFF8);
  v86 = (_QWORD *)(((unint64_t)v79 + v84 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v85 = *v86;
  v85[1] = v86[1];
  v85[2] = v86[2];
  v85[3] = v86[3];
  v87 = ((unint64_t)v85 + 39) & 0xFFFFFFFFFFFFFFF8;
  v88 = ((unint64_t)v86 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v87 = *(_QWORD *)v88;
  *(_QWORD *)(v87 + 8) = *(_QWORD *)(v88 + 8);
  *(_QWORD *)(v87 + 16) = *(_QWORD *)(v88 + 16);
  *(_BYTE *)(v87 + 24) = *(_BYTE *)(v88 + 24);
  v89 = *(_QWORD *)(*(_QWORD *)(v36 + 112) - 8);
  v90 = *(unsigned __int8 *)(v89 + 80);
  v91 = (v90 + 25 + v87) & ~v90;
  v92 = (v90 + 25 + v88) & ~v90;
  (*(void (**)(uint64_t, uint64_t))(v89 + 40))(v91, v92);
  v93 = *(_QWORD *)(v89 + 64) + 7;
  v94 = (_OWORD *)((v93 + v91) & 0xFFFFFFFFFFFFFFF8);
  v95 = v93 + v92;
  v96 = (v95 & 0xFFFFFFFFFFFFFFF8) + 23;
  *v94 = *(_OWORD *)(v95 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  v97 = (_OWORD *)(((unint64_t)v94 + 23) & 0xFFFFFFFFFFFFFFF8);
  v96 &= 0xFFFFFFFFFFFFF8uLL;
  *v97 = *(_OWORD *)v96;
  swift_release();
  v98 = (_OWORD *)(((unint64_t)v97 + 23) & 0xFFFFFFFFFFFFFFF8);
  v99 = (_OWORD *)((v96 + 23) & 0xFFFFFFFFFFFFF8);
  *v98 = *v99;
  swift_release();
  v100 = (_OWORD *)(((unint64_t)v98 + 23) & 0xFFFFFFFFFFFFFFF8);
  v101 = ((unint64_t)v99 + 23) & 0xFFFFFFFFFFFFF8;
  v102 = *(_OWORD *)v101;
  v101 += 23;
  *v100 = v102;
  swift_release();
  v103 = (_OWORD *)(((unint64_t)v100 + 23) & 0xFFFFFFFFFFFFFFF8);
  v104 = (v101 & 0xFFFFFFFFFFFFF8) + 23;
  *v103 = *(_OWORD *)(v101 & 0xFFFFFFFFFFFFF8);
  swift_release();
  v105 = (_QWORD *)(((unint64_t)v103 + 23) & 0xFFFFFFFFFFFFFFF8);
  v106 = v104 & 0xFFFFFFFFFFFFFFF8;
  v107 = *(_QWORD *)(v104 & 0xFFFFFFFFFFFFFFF8);
  if (*v105 < 0xFFFFFFFFuLL)
  {
    if (v107 >= 0xFFFFFFFF)
    {
      v109 = *(_QWORD *)(v106 + 8);
      *v105 = v107;
      v105[1] = v109;
      goto LABEL_113;
    }
  }
  else
  {
    if (v107 >= 0xFFFFFFFF)
    {
      v108 = *(_QWORD *)(v106 + 8);
      *v105 = v107;
      v105[1] = v108;
      swift_release();
      goto LABEL_113;
    }
    swift_release();
  }
  *(_OWORD *)v105 = *(_OWORD *)v106;
LABEL_113:
  v110 = (_QWORD *)(((unint64_t)v105 + 23) & 0xFFFFFFFFFFFFFFF8);
  v111 = (unint64_t *)((v106 + 23) & 0xFFFFFFFFFFFFFFF8);
  v112 = *v111;
  if (*v110 < 0xFFFFFFFFuLL)
  {
    if (v112 >= 0xFFFFFFFF)
    {
      v114 = v111[1];
      *v110 = v112;
      v110[1] = v114;
      goto LABEL_120;
    }
  }
  else
  {
    if (v112 >= 0xFFFFFFFF)
    {
      v113 = v111[1];
      *v110 = v112;
      v110[1] = v113;
      swift_release();
      goto LABEL_120;
    }
    swift_release();
  }
  *(_OWORD *)v110 = *(_OWORD *)v111;
LABEL_120:
  v115 = (_QWORD *)(((unint64_t)v110 + 23) & 0xFFFFFFFFFFFFFFF8);
  v116 = (unint64_t *)(((unint64_t)v111 + 23) & 0xFFFFFFFFFFFFFFF8);
  v117 = *v116;
  if (*v115 < 0xFFFFFFFFuLL)
  {
    if (v117 >= 0xFFFFFFFF)
    {
      v119 = v116[1];
      *v115 = v117;
      v115[1] = v119;
      return a1;
    }
LABEL_126:
    *(_OWORD *)v115 = *(_OWORD *)v116;
    return a1;
  }
  if (v117 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_126;
  }
  v118 = v116[1];
  *v115 = v117;
  v115[1] = v118;
  swift_release();
  return a1;
}

uint64_t sub_23BFE5A2C(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t *v41;
  unint64_t v42;
  unsigned int v43;
  unint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v6 = sub_23BFF82CC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = a3[11];
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if ((_DWORD)v11)
    v12 = v11 - 1;
  else
    v12 = 0;
  if (v12 <= v8)
    v13 = *(_DWORD *)(v7 + 84);
  else
    v13 = v12;
  v14 = a3[2];
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int *)(v15 + 84);
  v17 = v16 - 1;
  if (!(_DWORD)v16)
    v17 = 0;
  if (v17 <= v13)
    v18 = v13;
  else
    v18 = v17;
  v19 = v18 == 0;
  if (v18)
    v20 = v18 - 1;
  else
    v20 = 0;
  v21 = a3[13];
  v22 = a3[14];
  v23 = *(_QWORD *)(v21 - 8);
  v24 = *(unsigned int *)(v23 + 84);
  if ((_DWORD)v24)
    v25 = v24 - 1;
  else
    v25 = 0;
  if (v20 <= v25)
    v26 = v25;
  else
    v26 = v20;
  v27 = *(_QWORD *)(v22 - 8);
  v28 = *(unsigned int *)(v27 + 84);
  if (v26 <= v28)
    v29 = *(_DWORD *)(v27 + 84);
  else
    v29 = v26;
  if (v29 <= 0x7FFFFFFF)
    v30 = 0x7FFFFFFF;
  else
    v30 = v29;
  v31 = *(_QWORD *)(v10 + 64);
  if (!(_DWORD)v11)
    ++v31;
  if (!(_DWORD)v16)
    ++v19;
  if ((_DWORD)v24)
    v32 = *(_QWORD *)(v23 + 64);
  else
    v32 = *(_QWORD *)(v23 + 64) + 1;
  if (!a2)
    return 0;
  v51 = a1;
  v33 = *(unsigned __int8 *)(v10 + 80);
  v47 = *(_QWORD *)(v7 + 64) + v33;
  v34 = *(unsigned __int8 *)(v15 + 80);
  v50 = v19 + *(_QWORD *)(v15 + 64) + ((v31 + v34 + (v47 & ~v33)) & ~v34);
  v35 = *(unsigned __int8 *)(v23 + 80);
  v49 = v35 + 9;
  v48 = v32 + 7;
  v36 = *(unsigned __int8 *)(v27 + 80);
  v37 = v36 + 25;
  if (v30 < a2)
  {
    if (((((((((((((((((((*(_QWORD *)(v27 + 64)
                         + ((v37
                           + ((((v48 + ((v49 + ((v50 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~v35)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)) & ~v36)
                         + 7) & 0xFFFFFFFFFFFFFFF8)
                       + 23) & 0xFFFFFFFFFFFFFFF8)
                     + 23) & 0xFFFFFFFFFFFFFFF8)
                   + 23) & 0xFFFFFFFFFFFFFFF8)
                 + 23) & 0xFFFFFFFFFFFFFFF8)
               + 23) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v38 = 2;
    else
      v38 = a2 - v30 + 1;
    if (v38 >= 0x10000)
      LODWORD(v39) = 4;
    else
      LODWORD(v39) = 2;
    if (v38 < 0x100)
      LODWORD(v39) = 1;
    if (v38 >= 2)
      v39 = v39;
    else
      v39 = 0;
    __asm { BR              X23 }
  }
  if (v20 == v30)
  {
    if (v18 < 2)
      return 0;
    if ((_DWORD)v8 == v18)
    {
      v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v51, v8, v6);
    }
    else
    {
      v45 = (v47 + v51) & ~v33;
      if (v12 == v18)
        v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v45, v11, v9);
      else
        v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))((v45 + v31 + v34) & ~v34, v16, v14);
      if (v46 >= 2)
        v43 = v46 - 1;
      else
        v43 = 0;
    }
LABEL_67:
    if (v43 >= 2)
      return v43 - 1;
    else
      return 0;
  }
  v41 = (unint64_t *)((v51 + v50 + 7) & 0xFFFFFFFFFFFFFFF8);
  if ((v29 & 0x80000000) != 0)
  {
    v44 = ((unint64_t)v41 + v49) & ~v35;
    if (v25 != v30)
      return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v27 + 48))((v37 + ((((v48 + v44) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)) & ~v36, v28, v22);
    if (v24 < 2)
      return 0;
    v43 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v23 + 48))(v44, v24, v21);
    goto LABEL_67;
  }
  v42 = *v41;
  if (v42 >= 0xFFFFFFFF)
    LODWORD(v42) = -1;
  return (v42 + 1);
}

void sub_23BFE5E00(_DWORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;

  v6 = 0;
  v7 = *(_QWORD *)(sub_23BFF82CC() - 8);
  v8 = *(_QWORD *)(a4[11] - 8);
  v9 = *(_DWORD *)(v8 + 84);
  if (v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v10 <= *(_DWORD *)(v7 + 84))
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = v10;
  v12 = *(_QWORD *)(a4[2] - 8);
  v13 = *(_DWORD *)(v12 + 84);
  v14 = v13 - 1;
  if (!v13)
    v14 = 0;
  if (v14 <= v11)
    v15 = v11;
  else
    v15 = v14;
  if (v15)
    v16 = v15 - 1;
  else
    v16 = 0;
  v17 = *(_QWORD *)(a4[13] - 8);
  v18 = *(_DWORD *)(v17 + 84);
  if (v18)
    v19 = v18 - 1;
  else
    v19 = 0;
  if (v16 <= v19)
    v20 = v19;
  else
    v20 = v16;
  v21 = *(_QWORD *)(a4[14] - 8);
  if (v20 <= *(_DWORD *)(v21 + 84))
    v22 = *(_DWORD *)(v21 + 84);
  else
    v22 = v20;
  if (v22 <= 0x7FFFFFFF)
    v23 = 0x7FFFFFFF;
  else
    v23 = v22;
  if (v9)
    v24 = *(_QWORD *)(v8 + 64);
  else
    v24 = *(_QWORD *)(v8 + 64) + 1;
  if (v13)
    v25 = *(_QWORD *)(v12 + 64);
  else
    v25 = *(_QWORD *)(v12 + 64) + 1;
  v26 = ((v24
        + *(unsigned __int8 *)(v12 + 80)
        + ((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
      + v25;
  if (v15)
    v27 = v26;
  else
    v27 = v26 + 1;
  v28 = *(_QWORD *)(v17 + 64);
  if (!v18)
    ++v28;
  if (v23 < a3)
  {
    if (((((((((((((((((*(_DWORD *)(v21 + 64)
                       + ((*(unsigned __int8 *)(v21 + 80)
                         + 25
                         + (((((_DWORD)v28
                             + 7
                             + ((*(unsigned __int8 *)(v17 + 80) + 9 + (((_DWORD)v27 + 7) & 0xFFFFFFF8)) & ~*(unsigned __int8 *)(v17 + 80))) & 0xFFFFFFF8)
                           + 39) & 0xFFFFFFF8)) & ~*(unsigned __int8 *)(v21 + 80))
                       + 7) & 0xFFFFFFF8)
                     + 23) & 0xFFFFFFF8)
                   + 23) & 0xFFFFFFF8)
                 + 23) & 0xFFFFFFF8)
               + 23) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v29 = a3 - v23 + 1;
    else
      v29 = 2;
    if (v29 >= 0x10000)
      v30 = 4;
    else
      v30 = 2;
    if (v29 < 0x100)
      v30 = 1;
    if (v29 >= 2)
      v6 = v30;
    else
      v6 = 0;
  }
  if (a2 > v23)
  {
    if (((((((((((((((((*(_DWORD *)(v21 + 64)
                       + ((*(unsigned __int8 *)(v21 + 80)
                         + 25
                         + (((((_DWORD)v28
                             + 7
                             + ((*(unsigned __int8 *)(v17 + 80) + 9 + (((_DWORD)v27 + 7) & 0xFFFFFFF8)) & ~*(unsigned __int8 *)(v17 + 80))) & 0xFFFFFFF8)
                           + 39) & 0xFFFFFFF8)) & ~*(unsigned __int8 *)(v21 + 80))
                       + 7) & 0xFFFFFFF8)
                     + 23) & 0xFFFFFFF8)
                   + 23) & 0xFFFFFFF8)
                 + 23) & 0xFFFFFFF8)
               + 23) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      bzero(a1, ((((((((((((((((*(_QWORD *)(v21 + 64)+ ((*(unsigned __int8 *)(v21 + 80)+ 25+ ((((v28+ 7+ ((*(unsigned __int8 *)(v17 + 80) + 9 + ((v27 + 7) & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 39) & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = ~v23 + a2;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X28 }
}

unint64_t sub_23BFE607C@<X0>(unint64_t result@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, unsigned int a5@<W6>, int a6@<W7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, size_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  _QWORD *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  size_t v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;

  v48[v45] = 0;
  v53 = *(unsigned int *)(v51 - 84);
  if ((_DWORD)v53)
  {
    if (v52 == v49)
    {
      if ((int)v53 + 1 <= a5)
      {
        if ((_DWORD)v53 != -1)
        {
          if ((_DWORD)v36 == a5)
          {
            return (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(result + 56))(v48, (v53 + 1), v36);
          }
          else
          {
            result = (unint64_t)&v48[v64] & v59;
            if (a6 == a5)
            {
              return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(a3 + 56))(result, (v53 + 2), a2);
            }
            else if ((int)v53 + 1 <= v63)
            {
              return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(a4 + 56))((result + v62 + a7) & v58, (v53 + 2), v34);
            }
            else if ((_DWORD)v61)
            {
              if (v61 <= 3)
                v57 = v61;
              else
                v57 = 4;
              bzero((void *)((result + v62 + a7) & v58), v61);
              __asm { BR              X10 }
            }
          }
        }
      }
      else if ((_DWORD)v41)
      {
        if (v41 <= 3)
          v54 = v41;
        else
          v54 = 4;
        bzero(v48, v41);
        __asm { BR              X10 }
      }
    }
    else
    {
      v55 = (_QWORD *)((unint64_t)&v48[v37 + 7] & 0xFFFFFFFFFFFFFFF8);
      if (v35 < 0)
      {
        result = ((unint64_t)v55 + v38) & v44;
        if (v50 == v49)
        {
          if (v39 >= 2)
            return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(v46 + 56))(result, (v53 + 1), v39);
        }
        else
        {
          return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v47 + 56))((v42 + ((((v43 + result) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)) & v60, v53, v40);
        }
      }
      else
      {
        if ((v53 & 0x80000000) != 0)
          v56 = v53 ^ 0x80000000;
        else
          v56 = (v53 - 1);
        *v55 = v56;
      }
    }
  }
  return result;
}

void sub_23BFE61F8()
{
  int v0;
  uint64_t v1;

  *(_WORD *)v1 = v0;
  *(_BYTE *)(v1 + 2) = BYTE2(v0);
}

void sub_23BFE6208()
{
  __int16 v0;
  _WORD *v1;

  *v1 = v0;
}

void sub_23BFE62B0()
{
  char v0;
  _BYTE *v1;

  *v1 = v0;
}

void sub_23BFE62EC()
{
  __int16 v0;
  _WORD *v1;

  *v1 = v0;
}

void sub_23BFE62F4()
{
  int v0;
  uint64_t v1;

  *(_WORD *)v1 = v0;
  *(_BYTE *)(v1 + 2) = BYTE2(v0);
}

void sub_23BFE6304()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void type metadata accessor for ListView()
{
  JUMPOUT(0x2426150F0);
}

void sub_23BFE631C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3528);
  type metadata accessor for CanvasSectionHeaderView();
}

void sub_23BFE63A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23BFF8A4C();
  sub_23BFF862C();
  sub_23BFF8968();
  sub_23BFF96A0();
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  sub_23BFF94C0();
  *(_QWORD *)(v4 - 224) = v0;
  *(_QWORD *)(v4 - 216) = v1;
  *(_QWORD *)(v4 - 208) = v1;
  *(_QWORD *)(v4 - 200) = v2;
  *(_QWORD *)(v4 - 192) = v3;
  *(_QWORD *)(v4 - 184) = v3;
  type metadata accessor for ActionCardView();
}

void sub_23BFE644C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a65;
  uint64_t a67;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v73)(uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v84 = MEMORY[0x242615198](&unk_23C005608, a1);
  *(_QWORD *)(v71 - 224) = a1;
  *(_QWORD *)(v71 - 216) = v84;
  MEMORY[0x24261512C](255, v71 - 224, MEMORY[0x24BDF3948], 0);
  sub_23BFF8ADC();
  v73 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088];
  v74 = sub_23BFF862C();
  v83 = sub_23BFF862C();
  v85 = sub_23BEA1BB8((unint64_t *)&qword_256AE3908, v73, MEMORY[0x24BDF1078]);
  *(_QWORD *)(v71 - 104) = v69;
  *(_QWORD *)(v71 - 96) = v85;
  v75 = MEMORY[0x24BDED308];
  v76 = MEMORY[0x242615198](MEMORY[0x24BDED308], v74, v71 - 104);
  v77 = MEMORY[0x24BDEEC40];
  *(_QWORD *)(v71 - 120) = v76;
  *(_QWORD *)(v71 - 112) = v77;
  v82 = MEMORY[0x242615198](v75, v83, v71 - 120);
  *(_QWORD *)(v71 - 224) = v83;
  *(_QWORD *)(v71 - 216) = v82;
  v78 = MEMORY[0x24BDF3100];
  MEMORY[0x24261512C](255, v71 - 224, MEMORY[0x24BDF3100], 0);
  v81 = sub_23BFF862C();
  v79 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v71 - 136) = v76;
  *(_QWORD *)(v71 - 128) = v79;
  v80 = MEMORY[0x242615198](v75, v81, v71 - 136);
  *(_QWORD *)(v71 - 224) = v81;
  *(_QWORD *)(v71 - 216) = v80;
  MEMORY[0x24261512C](255, v71 - 224, v78, 0);
  sub_23BFF8968();
  sub_23BFF8FD4();
  sub_23BFF862C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3910);
  sub_23BFF8968();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3918);
  sub_23BFF8968();
  sub_23BFF8968();
  *(_QWORD *)(v71 - 224) = v67;
  *(_QWORD *)(v71 - 216) = v68;
  *(_QWORD *)(v71 - 208) = v68;
  *(_QWORD *)(v71 - 200) = a65;
  *(_QWORD *)(v71 - 192) = a49;
  *(_QWORD *)(v71 - 184) = v69;
  *(_QWORD *)(v71 - 176) = v70;
  *(_QWORD *)(v71 - 168) = v70;
  *(_QWORD *)(v71 - 160) = a67;
  *(_QWORD *)(v71 - 152) = a48;
  type metadata accessor for FullWidthStageView();
}

void sub_23BFE666C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  v23 = MEMORY[0x242615198](&unk_23C0077B8, a1);
  *(_QWORD *)(v5 - 224) = a1;
  *(_QWORD *)(v5 - 216) = v23;
  v7 = MEMORY[0x24BDF3948];
  MEMORY[0x24261512C](255, v5 - 224, MEMORY[0x24BDF3948], 0);
  v22 = type metadata accessor for InfoActionCardView(255, v2, v4, v8);
  v21 = MEMORY[0x242615198](&unk_23C007F20, v22);
  *(_QWORD *)(v5 - 224) = v22;
  *(_QWORD *)(v5 - 216) = v21;
  MEMORY[0x24261512C](255, v5 - 224, v7, 0);
  sub_23BFF8968();
  sub_23BFF8968();
  v20 = type metadata accessor for LargeBrickView(255, v1, v3, v9);
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for LargeBrickView<A>, v20);
  *(_QWORD *)(v5 - 224) = v20;
  *(_QWORD *)(v5 - 216) = v19;
  MEMORY[0x24261512C](255, v5 - 224, v7, 0);
  v18 = type metadata accessor for DynamicBrickView(255, v1, v3, v10);
  v17 = MEMORY[0x242615198](&protocol conformance descriptor for DynamicBrickView<A>, v18);
  *(_QWORD *)(v5 - 224) = v18;
  *(_QWORD *)(v5 - 216) = v17;
  MEMORY[0x24261512C](255, v5 - 224, v7, 0);
  sub_23BFF8968();
  v16 = type metadata accessor for MonogramVerticalStackView(255, v1, v3, v11);
  v15 = MEMORY[0x242615198](&unk_23BFFA1F4, v16);
  *(_QWORD *)(v5 - 224) = v16;
  *(_QWORD *)(v5 - 216) = v15;
  MEMORY[0x24261512C](255, v5 - 224, v7, 0);
  sub_23BFF8968();
  sub_23BFF8968();
  sub_23BFF8968();
  v14 = type metadata accessor for StandardCardView(255, v1, v3, v12);
  v13 = MEMORY[0x242615198](&unk_23C007BD0, v14);
  *(_QWORD *)(v5 - 224) = v14;
  *(_QWORD *)(v5 - 216) = v13;
  MEMORY[0x24261512C](255, v5 - 224, v7, 0);
  *(_QWORD *)(v5 - 224) = v1;
  *(_QWORD *)(v5 - 216) = v2;
  *(_QWORD *)(v5 - 208) = v3;
  *(_QWORD *)(v5 - 200) = v4;
  type metadata accessor for StandardHorizontalStackView();
}

void sub_23BFE68A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,unint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t a67;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t OpaqueTypeConformance2;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t AssociatedConformanceWitness;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v137;
  __int128 v138;

  v135 = MEMORY[0x242615198](&unk_23C0008E8, a1);
  *(_QWORD *)(v71 - 224) = a1;
  *(_QWORD *)(v71 - 216) = v135;
  MEMORY[0x24261512C](255, v71 - 224, v69, 0);
  v123 = sub_23BFF8968();
  v74 = type metadata accessor for StandardVerticalStackView(255, v67, v68, v73);
  v134 = MEMORY[0x242615198](&unk_23C0073B8, v74);
  *(_QWORD *)(v71 - 224) = v74;
  *(_QWORD *)(v71 - 216) = v134;
  MEMORY[0x24261512C](255, v71 - 224, v69, 0);
  v76 = type metadata accessor for TallCardView(255, v67, v68, v75);
  v133 = MEMORY[0x242615198](&unk_23BFFF0E4, v76);
  *(_QWORD *)(v71 - 224) = v76;
  *(_QWORD *)(v71 - 216) = v133;
  MEMORY[0x24261512C](255, v71 - 224, v69, 0);
  v132 = sub_23BFF8968();
  v121 = sub_23BFF8968();
  v78 = type metadata accessor for VerticalStackCard(255, v67, v68, v77);
  v131 = MEMORY[0x242615198](&unk_23C0000E0, v78);
  *(_QWORD *)(v71 - 224) = v78;
  *(_QWORD *)(v71 - 216) = v131;
  MEMORY[0x24261512C](255, v71 - 224, v69, 0);
  v122 = sub_23BFF8968();
  v80 = type metadata accessor for WideBrickView(255, v67, v68, v79);
  v126 = MEMORY[0x242615198](&protocol conformance descriptor for WideBrickView<A>, v80);
  *(_QWORD *)(v71 - 224) = v80;
  *(_QWORD *)(v71 - 216) = v126;
  MEMORY[0x24261512C](255, v71 - 224, v69, 0);
  v124 = sub_23BFF8968();
  v125 = sub_23BFF8968();
  v127 = sub_23BFF8968();
  v128 = sub_23BFF8FD4();
  v129 = sub_23BFF862C();
  v130 = sub_23BFF8968();
  v137 = sub_23BFF862C();
  v81 = sub_23BFF862C();
  *(_QWORD *)(v71 - 224) = a56;
  *(_QWORD *)(v71 - 216) = a55;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v71 - 224) = a53;
  *(_QWORD *)(v71 - 216) = a52;
  v83 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v71 - 224) = a45;
  *(_QWORD *)(v71 - 216) = a44;
  v84 = swift_getOpaqueTypeConformance2();
  v138 = *(_OWORD *)(v70 + 32);
  *(_QWORD *)(v71 - 240) = v83;
  *(_QWORD *)(v71 - 232) = v84;
  v85 = MEMORY[0x24BDEF3E0];
  *(_QWORD *)(v71 - 248) = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], a43, v71 - 240);
  v86 = MEMORY[0x242615198](MEMORY[0x24BDF3F50], a47, v71 - 248);
  v87 = MEMORY[0x24BDECC60];
  STACK[0x348] = v86;
  STACK[0x350] = v87;
  v88 = MEMORY[0x242615198](MEMORY[0x24BDED308], a46, &STACK[0x348]);
  v89 = sub_23BEA1F94(&qword_256AE3920, &qword_256AE3910, MEMORY[0x24BDF43B0]);
  STACK[0x338] = v88;
  STACK[0x340] = v89;
  v90 = MEMORY[0x242615198](v85, a50, &STACK[0x338]);
  v91 = sub_23BEA1F94(&qword_256AE3928, &qword_256AE3918, MEMORY[0x24BDF4700]);
  STACK[0x328] = v90;
  STACK[0x330] = v91;
  v92 = MEMORY[0x242615198](v85, a51, &STACK[0x328]);
  STACK[0x318] = OpaqueTypeConformance2;
  STACK[0x320] = v92;
  v93 = MEMORY[0x242615198](v85, a35, &STACK[0x318]);
  *(_QWORD *)(v71 - 224) = a49;
  *(_QWORD *)(v71 - 216) = a48;
  v94 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v71 - 224) = a42;
  *(_QWORD *)(v71 - 216) = a41;
  v95 = swift_getOpaqueTypeConformance2();
  STACK[0x308] = v94;
  STACK[0x310] = v95;
  v96 = MEMORY[0x242615198](v85, a40, &STACK[0x308]);
  STACK[0x2F8] = v93;
  STACK[0x300] = v96;
  v97 = MEMORY[0x242615198](v85, a22, &STACK[0x2F8]);
  *(_QWORD *)(v71 - 224) = a39;
  *(_QWORD *)(v71 - 216) = a38;
  v98 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v71 - 224) = a37;
  *(_QWORD *)(v71 - 216) = a36;
  v99 = swift_getOpaqueTypeConformance2();
  STACK[0x2E8] = v98;
  STACK[0x2F0] = v99;
  v100 = MEMORY[0x242615198](v85, a28, &STACK[0x2E8]);
  *(_QWORD *)(v71 - 224) = a34;
  *(_QWORD *)(v71 - 216) = a33;
  STACK[0x2D8] = swift_getOpaqueTypeConformance2();
  STACK[0x2E0] = v99;
  v101 = MEMORY[0x242615198](v85, a31, &STACK[0x2D8]);
  STACK[0x2C8] = v100;
  STACK[0x2D0] = v101;
  v102 = MEMORY[0x242615198](v85, a32, &STACK[0x2C8]);
  STACK[0x2B8] = v97;
  STACK[0x2C0] = v102;
  v103 = MEMORY[0x242615198](v85, a10, &STACK[0x2B8]);
  *(_QWORD *)(v71 - 224) = a30;
  *(_QWORD *)(v71 - 216) = a29;
  v104 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v71 - 224) = a1;
  *(_QWORD *)(v71 - 216) = v135;
  v105 = swift_getOpaqueTypeConformance2();
  STACK[0x2A8] = v104;
  STACK[0x2B0] = v105;
  v106 = MEMORY[0x242615198](v85, v123, &STACK[0x2A8]);
  *(_QWORD *)(v71 - 224) = v74;
  *(_QWORD *)(v71 - 216) = v134;
  v107 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v71 - 224) = v76;
  *(_QWORD *)(v71 - 216) = v133;
  v108 = swift_getOpaqueTypeConformance2();
  STACK[0x298] = v107;
  STACK[0x2A0] = v108;
  v109 = MEMORY[0x242615198](v85, v132, &STACK[0x298]);
  STACK[0x288] = v106;
  STACK[0x290] = v109;
  v110 = MEMORY[0x242615198](v85, v121, &STACK[0x288]);
  *(_QWORD *)(v71 - 224) = v78;
  *(_QWORD *)(v71 - 216) = v131;
  STACK[0x278] = swift_getOpaqueTypeConformance2();
  STACK[0x280] = a67;
  v111 = MEMORY[0x242615198](v85, v122, &STACK[0x278]);
  *(_QWORD *)(v71 - 224) = v80;
  *(_QWORD *)(v71 - 216) = v126;
  v112 = swift_getOpaqueTypeConformance2();
  STACK[0x268] = v111;
  STACK[0x270] = v112;
  v113 = MEMORY[0x242615198](v85, v124, &STACK[0x268]);
  STACK[0x258] = v110;
  STACK[0x260] = v113;
  v114 = MEMORY[0x242615198](v85, v125, &STACK[0x258]);
  STACK[0x248] = v103;
  STACK[0x250] = v114;
  STACK[0x240] = MEMORY[0x242615198](v85, v127, &STACK[0x248]);
  STACK[0x230] = MEMORY[0x242615198](MEMORY[0x24BDF3F50], v128, &STACK[0x240]);
  STACK[0x238] = a57;
  v115 = MEMORY[0x24BDED308];
  v116 = MEMORY[0x242615198](MEMORY[0x24BDED308], v129, &STACK[0x230]);
  STACK[0x220] = MEMORY[0x24BDF5138];
  STACK[0x228] = v116;
  v117 = MEMORY[0x242615198](v85, v130, &STACK[0x220]);
  v118 = MEMORY[0x24BDF0910];
  STACK[0x210] = v117;
  STACK[0x218] = v118;
  STACK[0x200] = MEMORY[0x242615198](v115, v137, &STACK[0x210]);
  STACK[0x208] = v118;
  v119 = MEMORY[0x242615198](v115, v81, &STACK[0x200]);
  *(_QWORD *)(v71 - 224) = v81;
  *(_QWORD *)(v71 - 216) = v119;
  MEMORY[0x24261512C](255, v71 - 224, MEMORY[0x24BEC6710], 0);
  sub_23BFF8968();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_OWORD *)(v71 - 224) = v138;
  *(_QWORD *)(v71 - 208) = AssociatedConformanceWitness;
  *(_QWORD *)(v71 - 200) = a63;
  type metadata accessor for CanvasContextMenu();
}

uint64_t sub_23BFE6FCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t OpaqueTypeConformance2;
  uint64_t v19;

  v7 = sub_23BFF862C();
  v8 = MEMORY[0x242615198](MEMORY[0x24BEE12D8]);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v5 - 224) = v14;
  *(_QWORD *)(v5 - 216) = v15;
  *(_QWORD *)(v5 - 208) = v7;
  *(_QWORD *)(v5 - 200) = v8;
  *(_QWORD *)(v5 - 192) = AssociatedConformanceWitness;
  v10 = sub_23BFF910C();
  *(_QWORD *)(v5 - 224) = v3;
  *(_QWORD *)(v5 - 216) = v1;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = v1;
  v17[0] = MEMORY[0x242615198](v2, v4, &OpaqueTypeConformance2);
  v17[1] = MEMORY[0x242615198](&unk_23BFFEE18, a1);
  v16 = MEMORY[0x242615198](MEMORY[0x24BDED308], v7, v17);
  MEMORY[0x242615198](MEMORY[0x24BDF4A08], v10, &v16);
  sub_23BFF8428();
  sub_23BFF862C();
  swift_getTupleTypeMetadata2();
  v11 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v11);
  v12 = sub_23BFF90AC();
  return MEMORY[0x242615198](MEMORY[0x24BDF4700], v12);
}

void sub_23BFE7140()
{
  sub_23BF140F8((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFE006C);
}

void sub_23BFE7150()
{
  type metadata accessor for ListView();
}

void sub_23BFE7200()
{
  sub_23BFDFD98();
}

void objectdestroyTm_13()
{
  type metadata accessor for ListView();
}

void sub_23BFE732C()
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for CanvasSectionHeader();
}

uint64_t sub_23BFE7398(uint64_t a1)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 48))(v2, 1, a1))
  {
    v6 = sub_23BFF82CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v2, v6);
    v7 = v2 + *(int *)(a1 + 52);
    v8 = *(_QWORD *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(v7, 1))
      (*(void (**)(uint64_t))(v8 + 8))(v7);
    v9 = v2 + *(int *)(a1 + 56);
    v10 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v4);
  }
  swift_bridgeObjectRelease();
  v11 = v2 + v1[55];
  v12 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v11, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v2 + v1[59]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v2 + v1[65]))
    swift_release();
  if (*(_QWORD *)(v2 + v1[66]))
    swift_release();
  if (*(_QWORD *)(v2 + v1[67]))
    swift_release();
  return swift_deallocObject();
}

void sub_23BFE7578()
{
  type metadata accessor for ListView();
}

#error "23BFE76A0: call analysis failed (funcsize=30)"

void sub_23BFE76C4()
{
  type metadata accessor for ListView();
}

void sub_23BFE7760()
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for CanvasSectionHeader();
}

uint64_t sub_23BFE77E8(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 48))(v3, 1, a1))
  {
    v18 = v7;
    v10 = sub_23BFF82CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v3, v10);
    v11 = v3 + *(int *)(a1 + 52);
    v12 = *(_QWORD *)(v22 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(v11, 1))
      (*(void (**)(uint64_t))(v12 + 8))(v11);
    v13 = v3 + *(int *)(a1 + 56);
    v14 = *(_QWORD *)(v5 - 8);
    v7 = v18;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v13, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v5);
  }
  swift_bridgeObjectRelease();
  v15 = v3 + v2[55];
  v16 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v15, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v4);
  (*(void (**)(uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v3 + v2[59]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v3 + v2[65]))
    swift_release();
  if (*(_QWORD *)(v3 + v2[66]))
    swift_release();
  if (*(_QWORD *)(v3 + v2[67]))
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1 + ((v21 + v20 + v8) & ~v8), v6);
  return swift_deallocObject();
}

void sub_23BFE79FC()
{
  type metadata accessor for ListView();
}

#error "23BFE7B2C: call analysis failed (funcsize=34)"

void sub_23BFE7B50(uint64_t a1)
{
  sub_23BF14A38(a1, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFE2A68);
}

void sub_23BFE7B5C(uint64_t a1)
{
  sub_23BF14A38(a1, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFE2BCC);
}

void sub_23BFE7B6C()
{
  type metadata accessor for ListView();
}

void sub_23BFE7C18()
{
  type metadata accessor for ListView();
}

uint64_t sub_23BFE7CBC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (**v3)();

  v3 = (uint64_t (**)())(v2 + *(int *)(result + 264) + v1);
  if (*v3)
    return (*v3)();
  return result;
}

void objectdestroy_9Tm_1()
{
  type metadata accessor for ListView();
}

void sub_23BFE7D98()
{
  swift_getAssociatedConformanceWitness();
  type metadata accessor for CanvasSectionHeader();
}

uint64_t sub_23BFE7E04(uint64_t a1)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 48))(v2, 1, a1))
  {
    v6 = sub_23BFF82CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v2, v6);
    v7 = v2 + *(int *)(a1 + 52);
    v8 = *(_QWORD *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(v7, 1))
      (*(void (**)(uint64_t))(v8 + 8))(v7);
    v9 = v2 + *(int *)(a1 + 56);
    v10 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v4);
  }
  swift_bridgeObjectRelease();
  v11 = v2 + v1[55];
  v12 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v11, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v2 + v1[59]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v2 + v1[65]))
    swift_release();
  if (*(_QWORD *)(v2 + v1[66]))
    swift_release();
  if (*(_QWORD *)(v2 + v1[67]))
    swift_release();
  return swift_deallocObject();
}

void sub_23BFE7FF0()
{
  type metadata accessor for ListView();
}

void sub_23BFE809C()
{
  type metadata accessor for ListView();
}

uint64_t sub_23BFE8140(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (**v3)();

  v3 = (uint64_t (**)())(v2 + *(int *)(result + 268) + v1);
  if (*v3)
    return (*v3)();
  return result;
}

uint64_t AttributedString.textView()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  __int128 *v7;
  uint64_t v8;
  __int128 v9;
  char v10;
  uint64_t v11;

  v1 = sub_23BFF82A8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = xmmword_23BFFA8F0;
  v10 = 0;
  v11 = MEMORY[0x24BEE4AF8];
  sub_23BFF82B4();
  v7 = &v9;
  v8 = v0;
  sub_23BFE8248((void (*)(char *))sub_23BEBEFD8, (uint64_t)v6);
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
  return v9;
}

uint64_t sub_23BFE8248(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  void (*v24)(char *, _QWORD);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v35;
  void (*v36)(char *);
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char v49[32];
  uint64_t v50;

  v36 = a1;
  v37 = a2;
  v43 = sub_23BFF8290();
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v35 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_23BFF829C();
  v4 = *(_QWORD *)(v45 - 8);
  v5 = MEMORY[0x24BDAC7A8](v45);
  v47 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v35 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8BE8);
  MEMORY[0x24BDAC7A8](v8);
  v42 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23BFF82A8();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4A8];
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8BF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v12;
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v38(v14, v2, v10);
  sub_23BEA1BB8(&qword_256AE8BF8, v11, MEMORY[0x24BDCC4C0]);
  v39 = v14;
  sub_23BFF9424();
  v18 = &v17[*(int *)(v15 + 36)];
  v48 = v4;
  v44 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  while (1)
  {
    v20 = v45;
    v19 = v46;
    v44(v46, v18, v45);
    sub_23BEA1BB8(&qword_256AE8C00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4A8], MEMORY[0x24BDCC4C8]);
    v21 = v47;
    sub_23BFF961C();
    sub_23BEA1BB8(&qword_256AE8C08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC498], MEMORY[0x24BDCC4A0]);
    v22 = sub_23BFF93AC();
    v23 = *(void (**)(char *, uint64_t))(v48 + 8);
    v23(v21, v20);
    v23(v19, v20);
    if ((v22 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v42, 1, 1, v43);
      return sub_23BE9F3A0((uint64_t)v17, &qword_256AE8BF0);
    }
    v24 = (void (*)(char *, _QWORD))sub_23BFF9658();
    v26 = v41;
    v25 = v42;
    v27 = v43;
    (*(void (**)(char *))(v41 + 16))(v42);
    v24(v49, 0);
    v28 = v39;
    v38(v39, (uint64_t)v17, v10);
    sub_23BFF9628();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v25, 0, 1, v27);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v25, 1, v27) == 1)
      return sub_23BE9F3A0((uint64_t)v17, &qword_256AE8BF0);
    v29 = v18;
    v30 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
    v31 = v26;
    v32 = v35;
    v30(v35, v25, v27);
    v33 = v50;
    v36(v32);
    if (v33)
      break;
    v50 = 0;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v27);
    v18 = v29;
  }
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v27);
  return sub_23BE9F3A0((uint64_t)v17, &qword_256AE8BF0);
}

uint64_t sub_23BFE8644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;

  v47 = a3;
  v4 = sub_23BFF832C();
  MEMORY[0x24BDAC7A8](v4);
  v46 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8C10);
  MEMORY[0x24BDAC7A8](v45);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23BFF82CC();
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8C18);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_23BF3FA08();
  sub_23BFF8278();
  swift_release();
  swift_getKeyPath();
  sub_23BF3F748();
  sub_23BFF8338();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v48)
  {
    v13 = *(_QWORD *)a2;
    v14 = *(_QWORD *)(a2 + 8);
    v15 = *(_BYTE *)(a2 + 16);
    sub_23BEA0EAC(*(_QWORD *)a2, v14, v15);
    swift_bridgeObjectRetain();
    sub_23BFF8FE0();
    v16 = sub_23BFF8C80();
    v18 = v17;
    v20 = v19 & 1;
    v21 = sub_23BFF8C38();
    v45 = v22;
    v46 = (char *)v21;
    LODWORD(v44) = v23;
    v47 = v24;
    sub_23BEA0F64(v16, v18, v20);
    swift_bridgeObjectRelease();
    sub_23BEA0F64(v13, v14, v15);
    swift_bridgeObjectRelease();
    v25 = *(_QWORD *)a2;
    v26 = *(_QWORD *)(a2 + 8);
    v27 = *(_BYTE *)(a2 + 16);
    v28 = v45;
    *(_QWORD *)a2 = v46;
    *(_QWORD *)(a2 + 8) = v28;
    v29 = v44;
  }
  else
  {
    v30 = *(_QWORD *)a2;
    v31 = *(_QWORD *)(a2 + 8);
    v32 = *(_BYTE *)(a2 + 16);
    v44 = *(_QWORD *)(a2 + 24);
    sub_23BEA0EAC(v30, v31, v32);
    swift_bridgeObjectRetain();
    sub_23BFF8284();
    sub_23BFE89F4();
    sub_23BFF82E4();
    sub_23BE9F3A0((uint64_t)v7, &qword_256AE8C10);
    sub_23BFF82F0();
    v33 = sub_23BFF8C68();
    v35 = v34;
    v37 = v36 & 1;
    v38 = sub_23BFF8C38();
    v45 = v39;
    v46 = (char *)v38;
    v49 = v40;
    v47 = v41;
    sub_23BEA0F64(v33, v35, v37);
    swift_bridgeObjectRelease();
    sub_23BEA0F64(v30, v31, v32);
    swift_bridgeObjectRelease();
    v25 = *(_QWORD *)a2;
    v26 = *(_QWORD *)(a2 + 8);
    v27 = *(_BYTE *)(a2 + 16);
    v42 = v45;
    *(_QWORD *)a2 = v46;
    *(_QWORD *)(a2 + 8) = v42;
    v29 = v49;
  }
  *(_BYTE *)(a2 + 16) = v29 & 1;
  *(_QWORD *)(a2 + 24) = v47;
  sub_23BEA0F64(v25, v26, v27);
  return swift_bridgeObjectRelease();
}

void sub_23BFE89E4(_QWORD *a1@<X8>)
{
  *a1 = &type metadata for AttributeScopes.CustomAttributes;
}

unint64_t sub_23BFE89F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256AE8C20;
  if (!qword_256AE8C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C10);
    result = MEMORY[0x242615198](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_256AE8C20);
  }
  return result;
}

double sub_23BFE8A40()
{
  double v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE5640);
  sub_23BFF8FF8();
  return v1;
}

uint64_t sub_23BFE8A94()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE5640);
  return sub_23BFF9004();
}

void CanvasContainerView.init(descriptors:layout:artworkViewBuilder:contextMenuViewModifierBuilder:customItemViewBuilder:actionButtonViewBuilder:sectionHeaderSubtitleViewBuilder:onItemAppearedAtIndexPath:onItemDisappearedAtIndexPath:onItemSelectedAtItemIdentifier:)()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFE8BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int128 a25,uint64_t a26)
{
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;

  v29 = (char *)v26 + *(int *)(a1 + 312);
  type metadata accessor for CGSize(0);
  *(_QWORD *)(v28 - 104) = 0;
  *(_QWORD *)(v28 - 96) = 0;
  sub_23BFF8FEC();
  *(_OWORD *)v29 = a25;
  *((_QWORD *)v29 + 2) = a26;
  *v26 = v27;
  type metadata accessor for CanvasLayout();
}

uint64_t sub_23BFE8C30(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t result;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
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

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v4, v3, a1);
  v1[3] = v13;
  v1[4] = v14;
  v1[5] = v16;
  v1[6] = v18;
  v1[7] = v19;
  v1[8] = v21;
  v1[1] = v2;
  v1[2] = v10;
  v1[9] = v11;
  v1[10] = v12;
  v7 = (_QWORD *)((char *)v1 + v5[75]);
  *v7 = v15;
  v7[1] = v17;
  v8 = (_QWORD *)((char *)v1 + v5[76]);
  *v8 = v20;
  v8[1] = v22;
  v9 = (_QWORD *)((char *)v1 + v5[77]);
  *v9 = v23;
  v9[1] = v24;
  return result;
}

void type metadata accessor for CanvasContainerView()
{
  JUMPOUT(0x2426150F0);
}

void sub_23BFE8D00(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[49];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v17[36] = a2;
  v17[19] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v17[27] = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v17[26] = (char *)v17 - v4;
  MEMORY[0x24BDAC7A8](v5);
  v17[25] = (char *)v17 - v6;
  MEMORY[0x24BDAC7A8](v7);
  v17[24] = (char *)v17 - v8;
  MEMORY[0x24BDAC7A8](v9);
  v17[23] = (char *)v17 - v10;
  v17[12] = v11;
  MEMORY[0x24BDAC7A8](v12);
  v17[14] = (char *)v17 - v13;
  v15 = v14[14];
  v19 = v14[15];
  v21 = v15;
  v16 = v14[31];
  v18 = v14[32];
  v20 = v16;
  v22 = v19;
  v23 = v15;
  v24 = v18;
  v25 = v16;
  type metadata accessor for CanvasLayout();
}

void sub_23BFE8E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  _QWORD *v10;
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

  v9[31] = *(_QWORD *)(a1 - 8);
  v9[32] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v9[28] = (char *)&a9 - v11;
  v13 = v10[2];
  v12 = v10[3];
  v14 = v10[5];
  v9[72] = v10[7];
  v15 = v10[9];
  v16 = v10[10];
  v9[77] = v15;
  v9[67] = v16;
  v9[70] = v10[13];
  v17 = v10[16];
  v18 = v10[17];
  v9[71] = v17;
  v19 = v10[18];
  v9[41] = v19;
  v9[42] = v18;
  v20 = v10[20];
  v21 = v10[24];
  v22 = v10[25];
  v9[46] = v22;
  v9[47] = v21;
  v24 = v10[26];
  v23 = v10[27];
  v9[45] = v24;
  v9[43] = v20;
  v9[44] = v23;
  v25 = v10[33];
  v9[48] = v25;
  v9[109] = v13;
  v9[73] = v13;
  v9[110] = v12;
  v9[111] = v14;
  v9[74] = v14;
  v9[112] = v15;
  v9[113] = v16;
  v9[114] = v17;
  v9[115] = v18;
  v9[116] = v19;
  v9[117] = v20;
  v9[118] = v21;
  v9[119] = v22;
  v9[120] = v24;
  v9[121] = v23;
  v9[122] = v25;
  type metadata accessor for CanvasItemDescriptor();
}

void sub_23BFE8F0C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[69] = v2[19];
  v9 = v2[22];
  v1[76] = v2[23];
  v1[61] = v9;
  v10 = v2[30];
  v1[55] = v10;
  v1[57] = a1;
  v11 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemDescriptor<A, B, C, D, E, F>, a1);
  v1[50] = v11;
  v1[109] = v6;
  v1[62] = v4;
  v1[63] = v3;
  v1[110] = v4;
  v1[66] = v5;
  v1[111] = v5;
  v1[112] = v3;
  v1[113] = v7;
  v1[114] = v1[72];
  v1[115] = v1[77];
  v1[116] = v1[67];
  v1[117] = v1[56];
  v1[118] = v1[70];
  v1[119] = v1[75];
  v1[120] = v1[71];
  v1[121] = a1;
  v1[122] = v1[76];
  v1[123] = v1[69];
  v1[124] = v9;
  v1[125] = v1[53];
  v1[126] = v10;
  v1[127] = v1[68];
  v1[128] = v11;
  type metadata accessor for CarouselView();
}

void sub_23BFE8FD4(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1[52] = a1;
  v9 = v2[6];
  v10 = v2[11];
  v11 = v2[12];
  v1[65] = v10;
  v1[64] = v11;
  v12 = v2[21];
  v1[60] = v12;
  v13 = v2[28];
  v14 = v2[29];
  v1[58] = v9;
  v1[59] = v13;
  v1[33] = v2;
  v1[54] = v14;
  v1[109] = v1[73];
  v1[110] = v5;
  v1[111] = v6;
  v1[112] = v4;
  v1[113] = v1[74];
  v1[114] = v9;
  v1[115] = v8;
  v1[116] = v1[77];
  v1[117] = v7;
  v1[118] = v10;
  v1[119] = v11;
  v1[120] = v1[70];
  v1[121] = v1[75];
  v1[122] = v1[71];
  v1[123] = v1[57];
  v1[124] = v1[76];
  v1[125] = v3;
  v1[126] = v12;
  v1[127] = v1[61];
  v1[128] = v13;
  v1[129] = v14;
  v1[130] = v1[55];
  v1[131] = v1[68];
  v1[132] = v1[50];
  type metadata accessor for HorizontalGridView();
}

void sub_23BFE90A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[51] = a1;
  v1[109] = v2;
  v1[110] = v1[62];
  v1[111] = v1[66];
  v1[112] = v1[63];
  v1[113] = v7;
  v1[114] = v1[58];
  v1[115] = v1[72];
  v1[116] = v1[77];
  v1[117] = v5;
  v1[118] = v1[65];
  v1[119] = v1[64];
  v1[120] = v8;
  v1[121] = v4;
  v1[122] = v6;
  v1[123] = v10;
  v1[124] = v1[76];
  v1[125] = v1[69];
  v1[126] = v1[60];
  v1[127] = v9;
  v1[128] = v1[59];
  v11 = v1[55];
  v1[129] = v1[54];
  v1[130] = v11;
  v1[131] = v1[68];
  v1[132] = v3;
  type metadata accessor for VerticalGridView();
}

void sub_23BFE9148(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[39] = a1;
  v1[40] = sub_23BFF8968();
  v1[38] = sub_23BFF8968();
  v1[109] = v1[73];
  v1[110] = v1[62];
  v1[111] = v1[66];
  v1[112] = v1[63];
  v1[113] = v1[74];
  v1[114] = v1[58];
  v1[115] = v1[72];
  v1[116] = v4;
  v1[117] = v1[67];
  v1[118] = v1[65];
  v1[119] = v1[64];
  v1[120] = v1[70];
  v1[121] = v1[75];
  v1[122] = v1[71];
  v1[123] = v1[57];
  v1[124] = v1[76];
  v1[125] = v1[69];
  v6 = v1[59];
  v1[126] = v1[60];
  v1[127] = v1[61];
  v1[128] = v6;
  v1[129] = v5;
  v1[130] = v2;
  v1[131] = v3;
  v1[132] = v1[50];
  type metadata accessor for ListView();
}

void sub_23BFE9230(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[37] = a1;
  v1[109] = v1[73];
  v1[110] = v1[62];
  v1[111] = v5;
  v1[112] = v1[63];
  v1[113] = v1[74];
  v1[114] = v1[58];
  v1[115] = v1[72];
  v1[116] = v1[77];
  v1[117] = v7;
  v1[118] = v8;
  v1[119] = v1[64];
  v1[120] = v6;
  v1[121] = v1[75];
  v1[122] = v10;
  v1[123] = v1[57];
  v1[124] = v1[76];
  v1[125] = v1[69];
  v1[126] = v1[60];
  v1[127] = v1[61];
  v1[128] = v3;
  v1[129] = v1[54];
  v1[130] = v2;
  v1[131] = v9;
  v1[132] = v4;
  type metadata accessor for OrthogonalView();
}

void sub_23BFE92E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v12 = v9[37];
  v13 = sub_23BFF8968();
  v14 = v9[38];
  v15 = sub_23BFF8968();
  v16 = sub_23BFF8968();
  v9[21] = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v9[20] = (char *)&a9 - v18;
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for CarouselView<A, B, C, D, E, F, G, H, I, J, K, L, M>, v9[52], v17);
  v20 = MEMORY[0x242615198](&protocol conformance descriptor for HorizontalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[51]);
  v21 = MEMORY[0x242615198](&protocol conformance descriptor for VerticalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[39]);
  v9[107] = v20;
  v9[108] = v21;
  v22 = MEMORY[0x24BDEF3E0];
  v23 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v9[40], v9 + 107);
  v9[105] = v19;
  v9[106] = v23;
  v24 = MEMORY[0x242615198](v22, v14, v9 + 105);
  v25 = MEMORY[0x242615198](&protocol conformance descriptor for ListView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v12);
  v26 = MEMORY[0x242615198](&protocol conformance descriptor for OrthogonalView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, a1);
  v9[103] = v25;
  v9[104] = v26;
  v27 = MEMORY[0x242615198](v22, v13, v9 + 103);
  v9[101] = v24;
  v9[102] = v27;
  v28 = MEMORY[0x242615198](v22, v15, v9 + 101);
  v9[99] = MEMORY[0x24BDF5138];
  v9[100] = v28;
  v29 = MEMORY[0x242615198](v22, v16, v9 + 99);
  v9[109] = v16;
  v9[110] = v29;
  MEMORY[0x24261512C](255, v9 + 109, MEMORY[0x24BEC6710], 0);
  v30 = sub_23BFF8968();
  v9[11] = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v9[9] = (char *)&a9 - v31;
  v9[22] = v16;
  v9[109] = v16;
  v9[110] = v29;
  v9[97] = swift_getOpaqueTypeConformance2();
  v9[8] = v29;
  v9[98] = v29;
  v32 = MEMORY[0x242615198](v22, v30, v9 + 97);
  v9[57] = v30;
  v9[109] = v30;
  v9[52] = v32;
  v9[110] = v32;
  v33 = MEMORY[0x24261512C](0, v9 + 109, MEMORY[0x24BE351A0], 0);
  v9[13] = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v9[10] = (char *)&a9 - v34;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C28);
  v9[15] = v33;
  v35 = sub_23BFF862C();
  v9[16] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v9[18] = (char *)&a9 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v37);
  v9[17] = (char *)&a9 - v38;
  v39 = v9[56];
  v40 = v9[53];
  v42 = type metadata accessor for CanvasSectionLayout(0, v39, v40, v41);
  v9[37] = v42;
  v9[35] = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v9[34] = (char *)&a9 - v43;
  v9[51] = v35;
  v44 = sub_23BFF8968();
  v9[39] = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v9[30] = (char *)&a9 - v45;
  v9[109] = v9[73];
  v9[110] = v9[66];
  v9[111] = v9[74];
  v9[112] = v9[77];
  v9[113] = v9[67];
  v9[114] = v9[70];
  v9[115] = v39;
  v9[116] = v9[65];
  v9[117] = v9[71];
  v9[118] = v9[42];
  v9[119] = v9[41];
  v9[120] = v9[43];
  v9[121] = v9[47];
  v9[122] = v9[46];
  v9[123] = v9[45];
  v9[124] = v9[44];
  v9[125] = v10;
  v9[126] = v40;
  v9[127] = v9[59];
  v9[128] = v9[48];
  type metadata accessor for CanvasSectionDescriptor();
}

uint64_t sub_23BFE96F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t OpaqueTypeConformance2;
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
  double v31;
  uint64_t v32;
  void (*v33)(uint64_t, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  void (*v55)(char *, uint64_t, uint64_t);
  _QWORD *v56;
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void (*v162)(char *, uint64_t);
  uint64_t v163;
  uint64_t v164;
  uint64_t v166;

  v4 = sub_23BFF96A0();
  *(_QWORD *)(v1 + 232) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v166 - v6;
  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v166 - v10;
  v12 = sub_23BFF96A0();
  *(_QWORD *)(v1 + 400) = v12;
  *(_QWORD *)(v1 + 304) = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v166 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v1 + 320) = (char *)&v166 - v16;
  *(_QWORD *)(v1 + 872) = **(_QWORD **)(v1 + 392);
  v17 = sub_23BFF94C0();
  MEMORY[0x242615198](MEMORY[0x24BEE12E0], v17);
  sub_23BFF9640();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, a1) == 1)
  {
    (*(void (**)(char *, _QWORD))(v5 + 8))(v7, *(_QWORD *)(v1 + 232));
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 + 312) + 56))(v14, 1, 1, v2);
    *(_QWORD *)(v1 + 872) = *(_QWORD *)(v1 + 456);
    v18 = *(_QWORD *)(v1 + 416);
    *(_QWORD *)(v1 + 880) = v18;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v20 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
    *(_QWORD *)(v1 + 760) = OpaqueTypeConformance2;
    *(_QWORD *)(v1 + 768) = v20;
    v21 = *(_QWORD *)(v1 + 408);
    *(_QWORD *)(v1 + 744) = MEMORY[0x242615198](MEMORY[0x24BDED308], v21, v1 + 760);
    *(_QWORD *)(v1 + 752) = MEMORY[0x24BDF5138];
    MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v2, v1 + 744);
    v22 = *(_QWORD *)(v1 + 288);
    v23 = v2;
    v24 = *(_QWORD *)(v1 + 400);
    v25 = *(_QWORD *)(v1 + 320);
  }
  else
  {
    *(_QWORD *)(v1 + 40) = v2;
    *(_QWORD *)(v1 + 48) = v14;
    v26 = *(_QWORD *)(v1 + 600);
    v27 = *(_QWORD *)(v1 + 248);
    v28 = *(_QWORD *)(v1 + 256);
    *(_QWORD *)(v1 + 32) = v8;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v7, a1);
    *(_QWORD *)(v1 + 232) = a1;
    v29 = *(int *)(a1 + 180);
    *(_QWORD *)(v1 + 56) = v11;
    (*(void (**)(_QWORD, char *, _QWORD))(*(_QWORD *)(v1 + 280) + 16))(*(_QWORD *)(v1 + 272), &v11[v29], *(_QWORD *)(v1 + 296));
    if (!swift_getEnumCaseMultiPayload())
    {
      v30 = *(_QWORD *)(v1 + 392) + *(int *)(*(_QWORD *)(v1 + 264) + 296);
      v31 = sub_23BFE8A40();
      if (((*(uint64_t (**)(uint64_t, double))(*(_QWORD *)(v1 + 544) + 56))(v26, v31) & 1) != 0)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v27 + 16))(*(_QWORD *)(v1 + 224), v30, v28);
        v32 = *(_QWORD *)(v1 + 152);
        v33 = *(void (**)(uint64_t, _QWORD))(v32 + 16);
        *(_QWORD *)(v1 + 24) = v33;
        v34 = *(_QWORD *)(v1 + 112);
        v35 = *(_QWORD *)(v1 + 264);
        v33(v34, *(_QWORD *)(v1 + 392));
        v36 = *(unsigned __int8 *)(v32 + 80);
        v37 = (v36 + 272) & ~v36;
        *(_QWORD *)(v1 + 16) = v37 + *(_QWORD *)(v1 + 96);
        *(_QWORD *)(v1 + 96) = v36 | 7;
        v38 = (char *)swift_allocObject();
        v39 = *(_QWORD *)(v1 + 528);
        *((_QWORD *)v38 + 2) = *(_QWORD *)(v1 + 584);
        *((_QWORD *)v38 + 3) = v39;
        v40 = *(_QWORD *)(v1 + 504);
        *((_QWORD *)v38 + 4) = v40;
        v41 = v40;
        v42 = *(_QWORD *)(v1 + 464);
        *((_QWORD *)v38 + 5) = *(_QWORD *)(v1 + 592);
        *((_QWORD *)v38 + 6) = v42;
        v43 = *(_QWORD *)(v1 + 496);
        *((_QWORD *)v38 + 7) = *(_QWORD *)(v1 + 576);
        *((_QWORD *)v38 + 8) = v43;
        v44 = *(_QWORD *)(v1 + 536);
        *((_QWORD *)v38 + 9) = *(_QWORD *)(v1 + 616);
        *((_QWORD *)v38 + 10) = v44;
        v45 = *(_QWORD *)(v1 + 512);
        *((_QWORD *)v38 + 11) = *(_QWORD *)(v1 + 520);
        *((_QWORD *)v38 + 12) = v45;
        *((_QWORD *)v38 + 13) = *(_QWORD *)(v1 + 560);
        *((_QWORD *)v38 + 14) = v26;
        v46 = *(_QWORD *)(v1 + 568);
        *((_QWORD *)v38 + 15) = *(_QWORD *)(v1 + 448);
        *((_QWORD *)v38 + 16) = v46;
        v47 = *(_QWORD *)(v1 + 328);
        *((_QWORD *)v38 + 17) = *(_QWORD *)(v1 + 336);
        *((_QWORD *)v38 + 18) = v47;
        v48 = *(_QWORD *)(v1 + 344);
        *((_QWORD *)v38 + 19) = *(_QWORD *)(v1 + 552);
        *((_QWORD *)v38 + 20) = v48;
        v49 = *(_QWORD *)(v1 + 488);
        *((_QWORD *)v38 + 21) = *(_QWORD *)(v1 + 480);
        *((_QWORD *)v38 + 22) = v49;
        v50 = *(_QWORD *)(v1 + 376);
        *((_QWORD *)v38 + 23) = *(_QWORD *)(v1 + 608);
        *((_QWORD *)v38 + 24) = v50;
        v51 = *(_QWORD *)(v1 + 360);
        *((_QWORD *)v38 + 25) = *(_QWORD *)(v1 + 368);
        *((_QWORD *)v38 + 26) = v51;
        v52 = *(_QWORD *)(v1 + 472);
        *((_QWORD *)v38 + 27) = *(_QWORD *)(v1 + 352);
        *((_QWORD *)v38 + 28) = v52;
        v53 = *(_QWORD *)(v1 + 440);
        *((_QWORD *)v38 + 29) = *(_QWORD *)(v1 + 432);
        *((_QWORD *)v38 + 30) = v53;
        v54 = *(_QWORD *)(v1 + 424);
        *((_QWORD *)v38 + 31) = *(_QWORD *)(v1 + 544);
        *((_QWORD *)v38 + 32) = v54;
        *((_QWORD *)v38 + 33) = *(_QWORD *)(v1 + 384);
        *(_QWORD *)(v1 + 8) = v37;
        v55 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 32);
        *(_QWORD *)(v1 + 152) = v55;
        v55(&v38[v37], v34, v35);
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 24))(*(_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 392), v35);
        v56 = (_QWORD *)swift_allocObject();
        v57 = *(_QWORD *)(v1 + 528);
        v56[2] = *(_QWORD *)(v1 + 584);
        v56[3] = v57;
        v58 = *(_QWORD *)(v1 + 592);
        v56[4] = v41;
        v56[5] = v58;
        v59 = *(_QWORD *)(v1 + 464);
        v60 = *(_QWORD *)(v1 + 576);
        v56[6] = v59;
        v56[7] = v60;
        v61 = *(_QWORD *)(v1 + 496);
        v62 = *(_QWORD *)(v1 + 616);
        v56[8] = v61;
        v56[9] = v62;
        v63 = *(_QWORD *)(v1 + 520);
        v56[10] = *(_QWORD *)(v1 + 536);
        v56[11] = v63;
        v64 = *(_QWORD *)(v1 + 560);
        v56[12] = *(_QWORD *)(v1 + 512);
        v56[13] = v64;
        v65 = *(_QWORD *)(v1 + 448);
        v56[14] = *(_QWORD *)(v1 + 600);
        v56[15] = v65;
        v67 = *(_QWORD *)(v1 + 328);
        v66 = *(_QWORD *)(v1 + 336);
        v56[16] = *(_QWORD *)(v1 + 568);
        v56[17] = v66;
        v68 = *(_QWORD *)(v1 + 552);
        v56[18] = v67;
        v56[19] = v68;
        v69 = *(_QWORD *)(v1 + 480);
        v56[20] = *(_QWORD *)(v1 + 344);
        v56[21] = v69;
        v70 = *(_QWORD *)(v1 + 608);
        v56[22] = *(_QWORD *)(v1 + 488);
        v56[23] = v70;
        v71 = *(_QWORD *)(v1 + 368);
        v56[24] = *(_QWORD *)(v1 + 376);
        v56[25] = v71;
        v72 = *(_QWORD *)(v1 + 352);
        v56[26] = *(_QWORD *)(v1 + 360);
        v56[27] = v72;
        v73 = *(_QWORD *)(v1 + 432);
        v56[28] = *(_QWORD *)(v1 + 472);
        v56[29] = v73;
        v74 = *(_QWORD *)(v1 + 544);
        v56[30] = *(_QWORD *)(v1 + 440);
        v56[31] = v74;
        v75 = (char *)v56 + v37;
        v76 = *(_QWORD *)(v1 + 384);
        v56[32] = *(_QWORD *)(v1 + 424);
        v56[33] = v76;
        v77 = *(_QWORD *)(v1 + 264);
        (*(void (**)(char *, _QWORD, uint64_t))(v1 + 152))(v75, *(_QWORD *)(v1 + 184), v77);
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 24))(*(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 392), v77);
        v78 = (_QWORD *)swift_allocObject();
        v79 = *(_QWORD *)(v1 + 528);
        v78[2] = *(_QWORD *)(v1 + 584);
        v78[3] = v79;
        v80 = *(_QWORD *)(v1 + 592);
        v78[4] = *(_QWORD *)(v1 + 504);
        v78[5] = v80;
        v81 = *(_QWORD *)(v1 + 576);
        v78[6] = v59;
        v78[7] = v81;
        v82 = *(_QWORD *)(v1 + 616);
        v78[8] = v61;
        v78[9] = v82;
        v83 = *(_QWORD *)(v1 + 520);
        v78[10] = *(_QWORD *)(v1 + 536);
        v78[11] = v83;
        v78[12] = *(_QWORD *)(v1 + 512);
        v78[13] = v64;
        v84 = *(_QWORD *)(v1 + 600);
        v85 = *(_QWORD *)(v1 + 448);
        v78[14] = v84;
        v78[15] = v85;
        v78[16] = *(_QWORD *)(v1 + 568);
        v78[17] = v66;
        v78[18] = v67;
        v78[19] = v68;
        v86 = v68;
        v87 = *(_QWORD *)(v1 + 480);
        v78[20] = *(_QWORD *)(v1 + 344);
        v78[21] = v87;
        v88 = *(_QWORD *)(v1 + 608);
        v78[22] = *(_QWORD *)(v1 + 488);
        v78[23] = v88;
        v89 = *(_QWORD *)(v1 + 368);
        v78[24] = *(_QWORD *)(v1 + 376);
        v78[25] = v89;
        v90 = *(_QWORD *)(v1 + 352);
        v78[26] = *(_QWORD *)(v1 + 360);
        v78[27] = v90;
        v91 = *(_QWORD *)(v1 + 432);
        v78[28] = *(_QWORD *)(v1 + 472);
        v78[29] = v91;
        v92 = *(_QWORD *)(v1 + 544);
        v78[30] = *(_QWORD *)(v1 + 440);
        v78[31] = v92;
        v93 = (char *)v78 + *(_QWORD *)(v1 + 8);
        v94 = *(_QWORD *)(v1 + 384);
        v78[32] = *(_QWORD *)(v1 + 424);
        v78[33] = v94;
        (*(void (**)(char *, _QWORD, _QWORD))(v1 + 152))(v93, *(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 264));
        v95 = *(_QWORD *)(v1 + 392);
        v96 = *(_QWORD *)(v95 + 24);
        *(_QWORD *)(v1 + 184) = *(_QWORD *)(v95 + 32);
        *(_QWORD *)(v1 + 192) = v96;
        (*(void (**)(_QWORD))(v1 + 24))(*(_QWORD *)(v1 + 200));
        v97 = (char *)swift_allocObject();
        v98 = *(_QWORD *)(v1 + 528);
        *((_QWORD *)v97 + 2) = *(_QWORD *)(v1 + 584);
        *((_QWORD *)v97 + 3) = v98;
        v99 = *(_QWORD *)(v1 + 592);
        *((_QWORD *)v97 + 4) = *(_QWORD *)(v1 + 504);
        *((_QWORD *)v97 + 5) = v99;
        v100 = *(_QWORD *)(v1 + 576);
        *((_QWORD *)v97 + 6) = v59;
        *((_QWORD *)v97 + 7) = v100;
        v101 = *(_QWORD *)(v1 + 616);
        *((_QWORD *)v97 + 8) = *(_QWORD *)(v1 + 496);
        *((_QWORD *)v97 + 9) = v101;
        v102 = *(_QWORD *)(v1 + 520);
        *((_QWORD *)v97 + 10) = *(_QWORD *)(v1 + 536);
        *((_QWORD *)v97 + 11) = v102;
        v103 = *(_QWORD *)(v1 + 560);
        *((_QWORD *)v97 + 12) = *(_QWORD *)(v1 + 512);
        *((_QWORD *)v97 + 13) = v103;
        v104 = *(_QWORD *)(v1 + 448);
        *((_QWORD *)v97 + 14) = v84;
        *((_QWORD *)v97 + 15) = v104;
        v105 = *(_QWORD *)(v1 + 336);
        *((_QWORD *)v97 + 16) = *(_QWORD *)(v1 + 568);
        *((_QWORD *)v97 + 17) = v105;
        *((_QWORD *)v97 + 18) = *(_QWORD *)(v1 + 328);
        *((_QWORD *)v97 + 19) = v86;
        v106 = *(_QWORD *)(v1 + 480);
        *((_QWORD *)v97 + 20) = *(_QWORD *)(v1 + 344);
        *((_QWORD *)v97 + 21) = v106;
        v107 = *(_QWORD *)(v1 + 608);
        *((_QWORD *)v97 + 22) = *(_QWORD *)(v1 + 488);
        *((_QWORD *)v97 + 23) = v107;
        v108 = *(_QWORD *)(v1 + 368);
        *((_QWORD *)v97 + 24) = *(_QWORD *)(v1 + 376);
        *((_QWORD *)v97 + 25) = v108;
        v109 = *(_QWORD *)(v1 + 352);
        *((_QWORD *)v97 + 26) = *(_QWORD *)(v1 + 360);
        *((_QWORD *)v97 + 27) = v109;
        v110 = *(_QWORD *)(v1 + 432);
        *((_QWORD *)v97 + 28) = *(_QWORD *)(v1 + 472);
        *((_QWORD *)v97 + 29) = v110;
        v111 = *(_QWORD *)(v1 + 544);
        *((_QWORD *)v97 + 30) = *(_QWORD *)(v1 + 440);
        *((_QWORD *)v97 + 31) = v111;
        v112 = *(_QWORD *)(v1 + 8);
        v113 = *(_QWORD *)(v1 + 384);
        *((_QWORD *)v97 + 32) = *(_QWORD *)(v1 + 424);
        *((_QWORD *)v97 + 33) = v113;
        v114 = *(_QWORD *)(v1 + 264);
        (*(void (**)(char *, _QWORD, uint64_t))(v1 + 152))(&v97[v112], *(_QWORD *)(v1 + 200), v114);
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 24))(*(_QWORD *)(v1 + 208), *(_QWORD *)(v1 + 392), v114);
        v115 = (_QWORD *)swift_allocObject();
        v116 = *(_QWORD *)(v1 + 528);
        v115[2] = *(_QWORD *)(v1 + 584);
        v115[3] = v116;
        v117 = *(_QWORD *)(v1 + 592);
        v115[4] = *(_QWORD *)(v1 + 504);
        v115[5] = v117;
        v118 = *(_QWORD *)(v1 + 576);
        v115[6] = v59;
        v115[7] = v118;
        v119 = *(_QWORD *)(v1 + 616);
        v115[8] = *(_QWORD *)(v1 + 496);
        v115[9] = v119;
        v120 = *(_QWORD *)(v1 + 520);
        v115[10] = *(_QWORD *)(v1 + 536);
        v115[11] = v120;
        v115[12] = *(_QWORD *)(v1 + 512);
        v115[13] = v103;
        v115[14] = *(_QWORD *)(v1 + 600);
        v115[15] = v104;
        v121 = *(_QWORD *)(v1 + 568);
        v122 = *(_QWORD *)(v1 + 336);
        v115[16] = v121;
        v115[17] = v122;
        v123 = *(_QWORD *)(v1 + 552);
        v115[18] = *(_QWORD *)(v1 + 328);
        v115[19] = v123;
        v124 = *(_QWORD *)(v1 + 480);
        v125 = *(_QWORD *)(v1 + 488);
        v115[20] = *(_QWORD *)(v1 + 344);
        v115[21] = v124;
        v126 = *(_QWORD *)(v1 + 608);
        v115[22] = v125;
        v115[23] = v126;
        v127 = *(_QWORD *)(v1 + 368);
        v115[24] = *(_QWORD *)(v1 + 376);
        v115[25] = v127;
        v128 = *(_QWORD *)(v1 + 352);
        v115[26] = *(_QWORD *)(v1 + 360);
        v115[27] = v128;
        v130 = *(_QWORD *)(v1 + 424);
        v129 = *(_QWORD *)(v1 + 432);
        v115[28] = *(_QWORD *)(v1 + 472);
        v115[29] = v129;
        v131 = *(_QWORD *)(v1 + 544);
        v115[30] = *(_QWORD *)(v1 + 440);
        v115[31] = v131;
        v132 = (char *)v115 + v112;
        v133 = *(_QWORD *)(v1 + 384);
        v115[32] = v130;
        v115[33] = v133;
        v134 = *(_QWORD *)(v1 + 264);
        (*(void (**)(char *, _QWORD, uint64_t))(v1 + 152))(v132, *(_QWORD *)(v1 + 208), v134);
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 24))(*(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 392), v134);
        v135 = (_QWORD *)swift_allocObject();
        v136 = *(_QWORD *)(v1 + 328);
        v135[17] = *(_QWORD *)(v1 + 336);
        v135[18] = v136;
        v135[20] = *(_QWORD *)(v1 + 344);
        v137 = *(_QWORD *)(v1 + 368);
        v135[24] = *(_QWORD *)(v1 + 376);
        v135[25] = v137;
        v138 = *(_QWORD *)(v1 + 352);
        v135[26] = *(_QWORD *)(v1 + 360);
        v135[27] = v138;
        v135[28] = *(_QWORD *)(v1 + 472);
        v135[30] = *(_QWORD *)(v1 + 440);
        v139 = *(_QWORD *)(v1 + 384);
        v135[32] = v130;
        v135[33] = v139;
        v135[16] = v121;
        v140 = *(_QWORD *)(v1 + 528);
        v135[2] = *(_QWORD *)(v1 + 584);
        v135[3] = v140;
        v141 = *(_QWORD *)(v1 + 592);
        v135[4] = *(_QWORD *)(v1 + 504);
        v135[5] = v141;
        v142 = *(_QWORD *)(v1 + 576);
        v135[6] = *(_QWORD *)(v1 + 464);
        v135[7] = v142;
        v143 = *(_QWORD *)(v1 + 616);
        v135[8] = *(_QWORD *)(v1 + 496);
        v135[9] = v143;
        v144 = *(_QWORD *)(v1 + 520);
        v135[10] = *(_QWORD *)(v1 + 536);
        v135[11] = v144;
        v145 = *(_QWORD *)(v1 + 560);
        v135[12] = *(_QWORD *)(v1 + 512);
        v135[13] = v145;
        v146 = *(_QWORD *)(v1 + 448);
        v135[14] = *(_QWORD *)(v1 + 600);
        v135[15] = v146;
        v135[19] = *(_QWORD *)(v1 + 552);
        v135[21] = *(_QWORD *)(v1 + 480);
        v135[22] = v125;
        v135[23] = *(_QWORD *)(v1 + 608);
        v135[29] = *(_QWORD *)(v1 + 432);
        v147 = (char *)v135 + *(_QWORD *)(v1 + 8);
        v135[31] = *(_QWORD *)(v1 + 544);
        (*(void (**)(char *, _QWORD, _QWORD))(v1 + 152))(v147, *(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 264));
        v148 = *(_QWORD *)(v1 + 392);
        v150 = *(_QWORD *)(v148 + 72);
        v149 = *(_QWORD *)(v148 + 80);
        *(_QWORD *)(v1 + 440) = v150;
        *(_QWORD *)(v1 + 424) = v149;
        *(_QWORD *)(v1 + 472) = MEMORY[0x242615198](&protocol conformance descriptor for CanvasSectionDescriptor<A, B, C, D, E, F, G, H, I>, *(_QWORD *)(v1 + 232));
        sub_23BF29320();
      }
    }
    v151 = *(_QWORD *)(v1 + 456);
    *(_QWORD *)(v1 + 872) = v151;
    v152 = *(_QWORD *)(v1 + 416);
    *(_QWORD *)(v1 + 880) = v152;
    v153 = swift_getOpaqueTypeConformance2();
    v154 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
    *(_QWORD *)(v1 + 688) = v153;
    *(_QWORD *)(v1 + 696) = v154;
    v21 = *(_QWORD *)(v1 + 408);
    v155 = MEMORY[0x242615198](MEMORY[0x24BDED308], v21, v1 + 688);
    v156 = *(_QWORD *)(v1 + 240);
    sub_23BEA5CE8(v155, v21, MEMORY[0x24BDF5158]);
    v24 = *(_QWORD *)(v1 + 400);
    v25 = *(_QWORD *)(v1 + 320);
    v14 = *(char **)(v1 + 48);
    v157 = *(_QWORD *)(v1 + 296);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 32) + 8))(*(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 232));
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 + 280) + 8))(*(_QWORD *)(v1 + 272), v157);
    *(_QWORD *)(v1 + 872) = v151;
    v18 = v152;
    *(_QWORD *)(v1 + 880) = v152;
    v158 = swift_getOpaqueTypeConformance2();
    v159 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
    *(_QWORD *)(v1 + 672) = v158;
    *(_QWORD *)(v1 + 680) = v159;
    *(_QWORD *)(v1 + 656) = MEMORY[0x242615198](MEMORY[0x24BDED308], v21, v1 + 672);
    *(_QWORD *)(v1 + 664) = MEMORY[0x24BDF5138];
    v23 = *(_QWORD *)(v1 + 40);
    MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v23, v1 + 656);
    sub_23BEA5C0C(v156, v23, (uint64_t)v14);
    v160 = *(_QWORD *)(v1 + 312);
    (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v156, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v160 + 56))(v14, 0, 1, v23);
    v22 = *(_QWORD *)(v1 + 288);
  }
  v161 = *(_QWORD *)(v1 + 304);
  sub_23BF3FAD4((uint64_t)v14, v25);
  v162 = *(void (**)(char *, uint64_t))(v161 + 8);
  v162(v14, v24);
  *(_QWORD *)(v1 + 872) = *(_QWORD *)(v1 + 456);
  *(_QWORD *)(v1 + 880) = v18;
  v163 = swift_getOpaqueTypeConformance2();
  v164 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v1 + 728) = v163;
  *(_QWORD *)(v1 + 736) = v164;
  *(_QWORD *)(v1 + 712) = MEMORY[0x242615198](MEMORY[0x24BDED308], v21, v1 + 728);
  *(_QWORD *)(v1 + 720) = MEMORY[0x24BDF5138];
  *(_QWORD *)(v1 + 704) = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v23, v1 + 712);
  MEMORY[0x242615198](MEMORY[0x24BDF5578], v24, v1 + 704);
  sub_23BEA5C0C(v25, v24, v22);
  return ((uint64_t (*)(uint64_t, uint64_t))v162)(v25, v24);
}

void sub_23BFEA594()
{
  uint64_t v0;

  v0 = sub_23BFF83A4();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEA730(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  v5 = *(void (**)(uint64_t))(*(_QWORD *)(v1 + 216) + *(int *)(a1 + 300));
  MEMORY[0x242613710](*(_QWORD *)(v1 + 224), 0);
  v5(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
}

void sub_23BFEA784()
{
  uint64_t v0;

  v0 = sub_23BFF83A4();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEA920(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  v5 = *(void (**)(uint64_t))(*(_QWORD *)(v1 + 216) + *(int *)(a1 + 304));
  MEMORY[0x242613710](*(_QWORD *)(v1 + 224), 0);
  v5(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
}

void CanvasContainerView.body.getter()
{
  type metadata accessor for CanvasItemDescriptor();
}

void sub_23BFEAA4C(uint64_t a1)
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
  uint64_t v12;

  v5 = v2[19];
  v1[33] = v5;
  v6 = v2[22];
  v7 = v2[23];
  v1[31] = v7;
  v9 = v2[31];
  v8 = v2[32];
  v1[18] = v8;
  v10 = v2[30];
  v1[26] = v10;
  v1[39] = v6;
  v1[40] = v9;
  v1[21] = a1;
  v12 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemDescriptor<A, B, C, D, E, F>);
  v1[20] = v12;
  v1[135] = v4;
  v1[136] = v1[30];
  v1[137] = v3;
  v1[138] = v1[41];
  v1[139] = v1[32];
  v1[140] = v1[42];
  v1[141] = v1[38];
  v1[142] = v1[37];
  v1[143] = v1[17];
  v1[144] = v1[29];
  v1[145] = v1[43];
  v1[146] = v1[34];
  v1[147] = a1;
  v1[148] = v7;
  v1[149] = v5;
  v1[150] = v1[39];
  v1[151] = v8;
  v1[152] = v10;
  v1[153] = v9;
  v1[154] = v12;
  type metadata accessor for CarouselView();
}

void sub_23BFEAB14(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1[16] = a1;
  v6 = v2[6];
  v1[22] = v6;
  v7 = v2[11];
  v8 = v2[12];
  v1[36] = v7;
  v9 = v2[21];
  v1[27] = v8;
  v1[28] = v9;
  v11 = v2[28];
  v10 = v2[29];
  v1[24] = v10;
  v1[25] = v11;
  v1[135] = v1[23];
  v12 = v1[29];
  v1[136] = v1[30];
  v1[137] = v1[35];
  v13 = v1[42];
  v1[138] = v1[41];
  v1[139] = v3;
  v1[140] = v6;
  v1[141] = v13;
  v1[142] = v1[38];
  v1[143] = v1[37];
  v1[144] = v7;
  v1[145] = v8;
  v1[146] = v12;
  v1[147] = v1[43];
  v1[148] = v4;
  v1[149] = v1[21];
  v1[150] = v1[31];
  v1[151] = v1[33];
  v1[152] = v9;
  v1[153] = v5;
  v1[154] = v11;
  v1[155] = v10;
  v1[156] = v1[26];
  v1[157] = v1[40];
  v1[158] = v1[20];
  type metadata accessor for HorizontalGridView();
}

void sub_23BFEABD8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
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

  v1[15] = a1;
  v1[135] = v3;
  v1[136] = v7;
  v1[137] = v10;
  v1[138] = v9;
  v1[139] = v1[32];
  v1[140] = v1[22];
  v1[141] = v6;
  v11 = v1[37];
  v1[142] = v1[38];
  v1[143] = v11;
  v1[144] = v1[36];
  v12 = v1[28];
  v1[145] = v1[27];
  v1[146] = v2;
  v1[147] = v4;
  v13 = v1[33];
  v1[148] = v1[34];
  v1[149] = v1[21];
  v1[150] = v1[31];
  v1[151] = v13;
  v1[152] = v12;
  v1[153] = v1[39];
  v1[154] = v1[25];
  v1[155] = v1[24];
  v1[156] = v5;
  v1[157] = v1[40];
  v1[158] = v8;
  type metadata accessor for VerticalGridView();
}

void sub_23BFEAC78(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[4] = a1;
  v1[5] = sub_23BFF8968();
  v1[3] = sub_23BFF8968();
  v8 = v1[22];
  v1[135] = v1[23];
  v1[136] = v1[30];
  v1[137] = v1[35];
  v1[138] = v1[41];
  v1[139] = v5;
  v1[140] = v8;
  v1[141] = v1[42];
  v1[142] = v3;
  v9 = v1[36];
  v1[143] = v1[37];
  v1[144] = v9;
  v1[145] = v4;
  v1[146] = v1[29];
  v1[147] = v1[43];
  v1[148] = v2;
  v1[149] = v1[21];
  v1[150] = v1[31];
  v1[151] = v6;
  v1[152] = v7;
  v1[153] = v1[39];
  v10 = v1[24];
  v1[154] = v1[25];
  v1[155] = v10;
  v1[156] = v1[26];
  v1[157] = v1[40];
  v1[158] = v1[20];
  type metadata accessor for ListView();
}

void sub_23BFEAD4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[2] = a1;
  v1[135] = v8;
  v1[136] = v4;
  v1[137] = v1[35];
  v1[138] = v1[41];
  v1[139] = v1[32];
  v1[140] = v5;
  v1[141] = v1[42];
  v1[142] = v1[38];
  v1[143] = v3;
  v1[144] = v1[36];
  v1[145] = v1[27];
  v1[146] = v6;
  v1[147] = v1[43];
  v1[148] = v1[34];
  v1[149] = v1[21];
  v1[150] = v7;
  v1[151] = v1[33];
  v1[152] = v1[28];
  v1[153] = v1[39];
  v1[154] = v9;
  v1[155] = v10;
  v1[156] = v2;
  v1[157] = v1[40];
  v1[158] = v1[20];
  type metadata accessor for OrthogonalView();
}

uint64_t sub_23BFEADF8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
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
  uint64_t OpaqueTypeConformance2;
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
  void (*v61)(uint64_t, uint64_t);
  _BYTE v63[96];

  v3 = v1[2];
  v4 = sub_23BFF8968();
  v5 = v1[3];
  v6 = sub_23BFF8968();
  v7 = sub_23BFF8968();
  v8 = MEMORY[0x242615198](&protocol conformance descriptor for CarouselView<A, B, C, D, E, F, G, H, I, J, K, L, M>, v1[16]);
  v9 = MEMORY[0x242615198](&protocol conformance descriptor for HorizontalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v1[15]);
  v10 = MEMORY[0x242615198](&protocol conformance descriptor for VerticalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v1[4]);
  v1[133] = v9;
  v1[134] = v10;
  v11 = MEMORY[0x24BDEF3E0];
  v12 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v1[5], v1 + 133);
  v1[131] = v8;
  v1[132] = v12;
  v13 = MEMORY[0x242615198](v11, v5, v1 + 131);
  v14 = MEMORY[0x242615198](&protocol conformance descriptor for ListView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v3);
  v15 = MEMORY[0x242615198](&protocol conformance descriptor for OrthogonalView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, a1);
  v1[129] = v14;
  v1[130] = v15;
  v16 = MEMORY[0x242615198](v11, v4, v1 + 129);
  v1[127] = v13;
  v1[128] = v16;
  v17 = MEMORY[0x242615198](v11, v6, v1 + 127);
  v1[125] = MEMORY[0x24BDF5138];
  v1[126] = v17;
  v18 = MEMORY[0x242615198](v11, v7, v1 + 125);
  v1[135] = v7;
  v1[136] = v18;
  MEMORY[0x24261512C](255, v1 + 135, MEMORY[0x24BEC6710], 0);
  v19 = sub_23BFF8968();
  v1[135] = v7;
  v1[136] = v18;
  v1[123] = swift_getOpaqueTypeConformance2();
  v1[124] = v18;
  v20 = MEMORY[0x242615198](v11, v19, v1 + 123);
  v1[135] = v19;
  v1[136] = v20;
  MEMORY[0x24261512C](255, v1 + 135, MEMORY[0x24BE351A0], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C28);
  v21 = sub_23BFF862C();
  sub_23BFF8968();
  sub_23BFF96A0();
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C30);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C38);
  v23 = sub_23BFF8968();
  v24 = sub_23BEA1F94(&qword_256AE8C40, &qword_256AE8C30, MEMORY[0x24BEE12D8]);
  v25 = MEMORY[0x24BEE0D00];
  v1[135] = v22;
  v1[136] = v25;
  v1[137] = v23;
  v1[138] = v24;
  v1[139] = MEMORY[0x24BEE0D10];
  v26 = sub_23BFF910C();
  v27 = sub_23BFF1354(&qword_256AE8C48, &qword_256AE8C38, MEMORY[0x24BDEBEE0]);
  v1[135] = v19;
  v1[136] = v20;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v29 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  v1[121] = OpaqueTypeConformance2;
  v1[122] = v29;
  v30 = MEMORY[0x242615198](MEMORY[0x24BDED308], v21, v1 + 121);
  v1[119] = v27;
  v1[120] = v30;
  v1[118] = MEMORY[0x242615198](v11, v23, v1 + 119);
  MEMORY[0x242615198](MEMORY[0x24BDF4A08], v26, v1 + 118);
  sub_23BFF8428();
  swift_getTupleTypeMetadata2();
  v31 = sub_23BFF9220();
  v1[2] = v31;
  v1[1] = MEMORY[0x242615198](MEMORY[0x24BDF5428], v31);
  v32 = sub_23BFF90C4();
  v1[16] = *(_QWORD *)(v32 - 8);
  v1[3] = v32;
  MEMORY[0x24BDAC7A8](v32);
  v1[21] = &v63[-v33];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C58);
  v34 = sub_23BFF862C();
  v1[15] = v34;
  v1[20] = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v1[4] = &v63[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v36);
  v1[5] = &v63[-v37];
  sub_23BFF91A8();
  v1[82] = v1[23];
  v1[83] = v1[35];
  v1[84] = v1[41];
  v1[85] = v1[32];
  v1[86] = v1[22];
  v1[87] = v1[42];
  v1[88] = v1[30];
  v1[89] = v1[38];
  v1[90] = v1[37];
  v1[91] = v1[36];
  v1[92] = v1[27];
  v1[93] = v1[29];
  v1[94] = v1[43];
  v38 = v1[17];
  v1[95] = v38;
  v1[96] = v1[34];
  v40 = v1[6];
  v39 = v1[7];
  v1[97] = v40;
  v1[98] = v1[19];
  v1[99] = v1[33];
  v1[100] = v39;
  v1[101] = v1[28];
  v1[102] = v1[39];
  v1[103] = v1[31];
  v42 = v1[10];
  v41 = v1[11];
  v1[104] = v41;
  v1[105] = v42;
  v43 = v1[8];
  v44 = v1[9];
  v1[106] = v44;
  v1[107] = v43;
  v1[108] = v1[25];
  v1[109] = v1[24];
  v1[110] = v1[26];
  v1[111] = v1[40];
  v1[112] = v1[18];
  v46 = v1[12];
  v45 = v1[13];
  v1[113] = v46;
  v1[114] = v45;
  sub_23BFF90B8();
  v47 = v1[35];
  v1[46] = v1[23];
  v1[47] = v47;
  v48 = v1[32];
  v1[48] = v1[41];
  v1[49] = v48;
  v49 = v1[42];
  v1[50] = v1[22];
  v1[51] = v49;
  v50 = v1[38];
  v1[52] = v1[30];
  v1[53] = v50;
  v51 = v1[36];
  v1[54] = v1[37];
  v1[55] = v51;
  v52 = v1[29];
  v1[56] = v1[27];
  v1[57] = v52;
  v1[58] = v1[43];
  v1[59] = v38;
  v1[60] = v1[34];
  v1[61] = v40;
  v53 = v1[33];
  v1[62] = v1[19];
  v1[63] = v53;
  v1[64] = v39;
  v1[65] = v1[28];
  v1[66] = v1[39];
  v1[67] = v1[31];
  v1[68] = v41;
  v1[69] = v42;
  v1[70] = v44;
  v1[71] = v43;
  v1[72] = v1[25];
  v1[73] = v1[24];
  v1[74] = v1[26];
  v1[75] = v1[40];
  v1[76] = v1[18];
  v1[77] = v46;
  v1[78] = v45;
  sub_23BFF91C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8C60);
  v54 = v1[3];
  v55 = MEMORY[0x242615198](MEMORY[0x24BDF4750], v54);
  sub_23BEA1F94(&qword_256AE8C68, &qword_256AE8C60, MEMORY[0x24BDEC6F8]);
  v56 = v1[4];
  v57 = v1[21];
  sub_23BFF8CBC();
  (*(void (**)(uint64_t, uint64_t))(v1[16] + 8))(v57, v54);
  v58 = sub_23BEA1F94(qword_256AE8C70, &qword_256AE8C58, MEMORY[0x24BDEF370]);
  v1[116] = v55;
  v1[117] = v58;
  v59 = v1[15];
  MEMORY[0x242615198](MEMORY[0x24BDED308], v59, v1 + 116);
  v60 = v1[5];
  sub_23BEA72EC(v56, v59, v60);
  v61 = *(void (**)(uint64_t, uint64_t))(v1[20] + 8);
  v61(v56, v59);
  sub_23BEA5C0C(v60, v59, v1[14]);
  return ((uint64_t (*)(uint64_t, uint64_t))v61)(v60, v59);
}

void sub_23BFEB550(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[17];
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v54 = a8;
  v50 = a4;
  v51 = a7;
  v65 = a6;
  v39[7] = a1;
  v39[9] = a9;
  v47 = a13;
  v59 = a12;
  v49 = a30;
  v57 = a31;
  v55 = a32;
  v42 = a33;
  v60 = a22;
  v53 = a23;
  v68 = a15;
  v62 = a14;
  v40 = a34;
  v48 = a29;
  v46 = a28;
  v45 = a27;
  v44 = a26;
  v67 = a24;
  v43 = a25;
  v52 = a20;
  v39[14] = a21;
  v39[13] = a19;
  v39[12] = a18;
  v41 = a16;
  v63 = a17;
  v37 = sub_23BFF89D4();
  MEMORY[0x24BDAC7A8](v37);
  v39[8] = (char *)v39 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39[6] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C30);
  v39[5] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C38);
  v69 = a2;
  v56 = a2;
  v61 = a3;
  v70 = a3;
  v71 = a5;
  v64 = a5;
  v58 = a10;
  v72 = a10;
  v66 = a11;
  v73 = a11;
  v74 = v63;
  v75 = a18;
  v76 = a19;
  v77 = a21;
  v78 = v43;
  v79 = v44;
  v80 = v45;
  v81 = v46;
  v82 = v40;
  type metadata accessor for CanvasItemDescriptor();
}

void sub_23BFEB720(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v1[15] = a1;
  v9 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemDescriptor<A, B, C, D, E, F>);
  v1[16] = v9;
  v1[88] = v5;
  v1[89] = v1[31];
  v1[90] = v3;
  v1[91] = v1[27];
  v1[92] = v7;
  v1[93] = v1[28];
  v1[94] = v4;
  v1[95] = v6;
  v1[96] = v1[18];
  v1[97] = v1[39];
  v1[98] = v1[45];
  v1[99] = v2;
  v1[100] = a1;
  v1[101] = v1[44];
  v10 = v1[30];
  v1[102] = v1[29];
  v1[103] = v10;
  v1[104] = v1[19];
  v1[105] = v1[34];
  v1[106] = v1[32];
  v1[107] = v9;
  type metadata accessor for CarouselView();
}

void sub_23BFEB7C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[11] = a1;
  v1[88] = v1[33];
  v1[89] = v2;
  v1[90] = v1[38];
  v1[91] = v7;
  v1[92] = v1[41];
  v1[93] = v1[42];
  v1[94] = v9;
  v10 = v1[36];
  v1[95] = v1[35];
  v1[96] = v1[43];
  v1[97] = v10;
  v1[98] = v1[24];
  v1[99] = v1[39];
  v1[100] = v4;
  v1[101] = v1[40];
  v1[102] = v1[15];
  v1[103] = v3;
  v1[104] = v1[29];
  v1[105] = v1[37];
  v1[106] = v8;
  v11 = v1[26];
  v1[107] = v1[25];
  v1[108] = v11;
  v1[109] = v6;
  v1[110] = v5;
  v1[111] = v1[16];
  type metadata accessor for HorizontalGridView();
}

void sub_23BFEB86C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1[10] = a1;
  v1[88] = v1[33];
  v1[89] = v1[31];
  v1[90] = v1[38];
  v1[91] = v1[27];
  v1[92] = v1[41];
  v1[93] = v1[42];
  v1[94] = v1[28];
  v1[95] = v4;
  v1[96] = v1[43];
  v1[97] = v7;
  v1[98] = v9;
  v1[99] = v1[39];
  v1[100] = v1[45];
  v1[101] = v1[40];
  v1[102] = v1[15];
  v1[103] = v1[44];
  v1[104] = v5;
  v1[105] = v2;
  v1[106] = v1[30];
  v1[107] = v8;
  v1[108] = v3;
  v1[109] = v1[34];
  v1[110] = v1[32];
  v1[111] = v6;
  type metadata accessor for VerticalGridView();
}

void sub_23BFEB91C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1[3] = a1;
  v1[4] = sub_23BFF8968();
  v1[2] = sub_23BFF8968();
  v1[88] = v3;
  v1[89] = v1[31];
  v5 = v1[39];
  v1[90] = v1[38];
  v6 = v1[28];
  v1[91] = v1[27];
  v7 = v1[40];
  v1[92] = v1[41];
  v1[93] = v1[42];
  v1[94] = v6;
  v1[95] = v1[35];
  v1[96] = v1[43];
  v1[97] = v1[36];
  v8 = v1[25];
  v1[98] = v1[24];
  v1[99] = v5;
  v1[100] = v1[45];
  v1[101] = v7;
  v1[102] = v4;
  v1[103] = v1[44];
  v9 = v1[30];
  v1[104] = v1[29];
  v1[105] = v1[37];
  v1[106] = v9;
  v1[107] = v8;
  v1[108] = v1[26];
  v1[109] = v2;
  v1[110] = v1[32];
  v1[111] = v1[16];
  type metadata accessor for ListView();
}

void sub_23BFEB9F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[1] = a1;
  v1[88] = v1[33];
  v1[89] = v2;
  v1[90] = v1[38];
  v1[91] = v1[27];
  v1[92] = v1[41];
  v1[93] = v1[42];
  v1[94] = v8;
  v1[95] = v1[35];
  v1[96] = v1[43];
  v1[97] = v1[36];
  v1[98] = v6;
  v1[99] = v7;
  v1[100] = v1[45];
  v1[101] = v5;
  v1[102] = v1[15];
  v1[103] = v1[44];
  v1[104] = v10;
  v1[105] = v1[37];
  v1[106] = v9;
  v1[107] = v3;
  v1[108] = v1[26];
  v1[109] = v1[34];
  v1[110] = v4;
  v1[111] = v1[16];
  type metadata accessor for OrthogonalView();
}

void sub_23BFEBAA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v12 = v9[1];
  v13 = sub_23BFF8968();
  v14 = v9[2];
  v15 = sub_23BFF8968();
  v16 = sub_23BFF8968();
  v17 = MEMORY[0x242615198](&protocol conformance descriptor for CarouselView<A, B, C, D, E, F, G, H, I, J, K, L, M>, v9[11]);
  v18 = MEMORY[0x242615198](&protocol conformance descriptor for HorizontalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[10]);
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for VerticalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[3]);
  *(_QWORD *)(v10 - 104) = v18;
  *(_QWORD *)(v10 - 96) = v19;
  v20 = MEMORY[0x24BDEF3E0];
  v21 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v9[4], v10 - 104);
  *(_QWORD *)(v10 - 120) = v17;
  *(_QWORD *)(v10 - 112) = v21;
  v22 = v20;
  v23 = MEMORY[0x242615198](v20, v14, v10 - 120);
  v24 = MEMORY[0x242615198](&protocol conformance descriptor for ListView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v12);
  v25 = MEMORY[0x242615198](&protocol conformance descriptor for OrthogonalView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, a1);
  *(_QWORD *)(v10 - 136) = v24;
  *(_QWORD *)(v10 - 128) = v25;
  v26 = v22;
  v27 = MEMORY[0x242615198](v22, v13, v10 - 136);
  *(_QWORD *)(v10 - 152) = v23;
  *(_QWORD *)(v10 - 144) = v27;
  v28 = MEMORY[0x242615198](v22, v15, v10 - 152);
  *(_QWORD *)(v10 - 168) = MEMORY[0x24BDF5138];
  *(_QWORD *)(v10 - 160) = v28;
  v29 = MEMORY[0x242615198](v22, v16, v10 - 168);
  v9[88] = v16;
  v9[89] = v29;
  MEMORY[0x24261512C](255, v9 + 88, MEMORY[0x24BEC6710], 0);
  v30 = sub_23BFF8968();
  v9[88] = v16;
  v9[89] = v29;
  *(_QWORD *)(v10 - 184) = swift_getOpaqueTypeConformance2();
  *(_QWORD *)(v10 - 176) = v29;
  v31 = MEMORY[0x242615198](v22, v30, v10 - 184);
  v9[88] = v30;
  v9[89] = v31;
  MEMORY[0x24261512C](255, v9 + 88, MEMORY[0x24BE351A0], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C28);
  v32 = sub_23BFF862C();
  v33 = sub_23BFF8968();
  v34 = sub_23BEA1F94(&qword_256AE8C40, &qword_256AE8C30, MEMORY[0x24BEE12D8]);
  v35 = MEMORY[0x24BEE0D00];
  v9[88] = v9[6];
  v9[89] = v35;
  v9[90] = v33;
  v9[91] = v34;
  v9[92] = MEMORY[0x24BEE0D10];
  v36 = sub_23BFF910C();
  v37 = sub_23BFF1354(&qword_256AE8C48, &qword_256AE8C38, MEMORY[0x24BDEBEE0]);
  v9[88] = v30;
  v9[89] = v31;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v39 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v10 - 200) = OpaqueTypeConformance2;
  *(_QWORD *)(v10 - 192) = v39;
  v40 = MEMORY[0x242615198](MEMORY[0x24BDED308], v32, v10 - 200);
  v9[5] = v40;
  *(_QWORD *)(v10 - 216) = v37;
  *(_QWORD *)(v10 - 208) = v40;
  *(_QWORD *)(v10 - 224) = MEMORY[0x242615198](v26, v33, v10 - 216);
  v41 = MEMORY[0x24BDF4A08];
  v9[10] = v36;
  v9[6] = MEMORY[0x242615198](v41, v36, v10 - 224);
  v42 = sub_23BFF8428();
  v9[15] = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  MEMORY[0x24BDAC7A8](v43);
  v9[11] = (char *)&a9 - v44;
  sub_23BFF8968();
  v45 = sub_23BFF96A0();
  v9[16] = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  MEMORY[0x24BDAC7A8](v46);
  v9[88] = v9[33];
  v9[89] = v9[38];
  v9[90] = v9[27];
  v9[91] = v9[41];
  v9[92] = v9[42];
  v9[93] = v9[28];
  v9[94] = v9[31];
  v9[95] = v9[35];
  v9[96] = v9[43];
  v9[97] = v9[36];
  v9[98] = v9[24];
  v9[99] = v9[39];
  v9[100] = v9[45];
  v9[101] = v9[18];
  v9[102] = v9[40];
  v9[103] = v9[12];
  v9[104] = v9[13];
  v9[105] = v9[29];
  v9[106] = v9[14];
  v9[107] = v9[37];
  v9[108] = v9[30];
  v9[109] = v9[44];
  v9[110] = v9[20];
  v9[111] = v9[21];
  v9[112] = v9[22];
  v9[113] = v9[23];
  v9[114] = v9[25];
  v9[115] = v9[26];
  v9[116] = v9[34];
  v9[117] = v9[32];
  v9[118] = v9[19];
  v9[119] = v9[17];
  type metadata accessor for CanvasContainerView();
}

void sub_23BFEBF70(uint64_t a1)
{
  uint64_t v1;

  sub_23BFE8D00(a1, v1);
}

uint64_t sub_23BFEBF80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
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
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t);

  v0[86] = v0[5];
  v0[87] = MEMORY[0x24BDF5138];
  v0[85] = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v2, v0 + 86);
  v0[4] = MEMORY[0x242615198](MEMORY[0x24BDF5578], v7, v0 + 85);
  sub_23BEA72EC(v6, v7, v8);
  v9 = *(void (**)(uint64_t, uint64_t))(v0[16] + 8);
  v0[5] = v9;
  v9(v6, v7);
  v0[3] = sub_23BFF88A8();
  v10 = v0[38];
  v0[48] = v0[33];
  v0[49] = v10;
  v11 = v0[41];
  v0[50] = v3;
  v0[51] = v11;
  v12 = v0[28];
  v0[52] = v0[42];
  v0[53] = v12;
  v13 = v0[35];
  v0[54] = v0[31];
  v0[55] = v13;
  v14 = v0[36];
  v0[56] = v0[43];
  v0[57] = v14;
  v15 = v0[39];
  v0[58] = v0[24];
  v0[59] = v15;
  v16 = v0[18];
  v0[60] = v0[45];
  v0[61] = v16;
  v17 = v0[12];
  v0[62] = v0[40];
  v0[63] = v17;
  v0[64] = v0[13];
  v0[65] = v0[29];
  v0[66] = v0[14];
  v0[67] = v0[37];
  v0[68] = v0[30];
  v0[69] = v0[44];
  v0[70] = v0[20];
  v0[71] = v0[21];
  v0[72] = v0[22];
  v0[73] = v0[23];
  v0[74] = v0[25];
  v0[75] = v0[26];
  v0[76] = v0[34];
  v0[77] = v0[32];
  v0[78] = v0[19];
  v0[79] = v0[17];
  v0[80] = v1;
  sub_23BF0EF38();
  sub_23BFF841C();
  v18 = MEMORY[0x242615198](MEMORY[0x24BDEB188], v5);
  v19 = v0[11];
  sub_23BEA72EC(v4, v5, v19);
  v20 = v0[15];
  v21 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v21(v4, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[16] + 16))(v6, v8, v7);
  v0[88] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v4, v19, v5);
  v0[89] = v4;
  v0[83] = v7;
  v0[84] = v5;
  v0[81] = v0[4];
  v0[82] = v18;
  sub_23BF93EF0(v0 + 88, 2uLL, (uint64_t)(v0 + 83));
  v21(v19, v5);
  v22 = (void (*)(uint64_t, uint64_t))v0[5];
  v22(v8, v7);
  v21(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v22)(v6, v7);
}

void sub_23BFEC220()
{
  sub_23BFF1438((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFEB550);
}

void sub_23BFEC22C()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFEC3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9[18] = a1;
  v14 = *(_QWORD *)(a1 - 8);
  v9[13] = v14;
  v9[6] = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9[17] = (char *)&a9 - v15;
  v9[5] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C30);
  v9[4] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C38);
  v16 = v9[34];
  v9[65] = v9[35];
  v9[66] = v9[40];
  v9[67] = v16;
  v17 = v9[37];
  v9[68] = v9[38];
  v9[69] = v17;
  v9[70] = v9[46];
  v9[71] = v9[16];
  v9[72] = v9[20];
  v9[73] = v9[22];
  v9[74] = v13;
  v9[75] = v12;
  v9[76] = v9[21];
  v9[77] = v10;
  v9[78] = v11;
  type metadata accessor for CanvasItemDescriptor();
}

void sub_23BFEC480(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1[24] = a1;
  v8 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemDescriptor<A, B, C, D, E, F>, a1);
  v1[25] = v8;
  v1[65] = v2;
  v1[66] = v1[43];
  v1[67] = v3;
  v1[68] = v1[26];
  v1[69] = v6;
  v9 = v1[46];
  v1[70] = v1[45];
  v1[71] = v4;
  v1[72] = v5;
  v1[73] = v1[19];
  v1[74] = v1[44];
  v1[75] = v1[27];
  v1[76] = v9;
  v1[77] = a1;
  v1[78] = v1[33];
  v1[79] = v1[41];
  v1[80] = v1[42];
  v1[81] = v1[23];
  v1[82] = v1[47];
  v1[83] = v1[28];
  v1[84] = v8;
  type metadata accessor for CarouselView();
}

void sub_23BFEC52C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1[12] = a1;
  v1[65] = v1[35];
  v1[66] = v4;
  v1[67] = v3;
  v1[68] = v9;
  v1[69] = v1[34];
  v10 = v1[29];
  v1[70] = v1[30];
  v1[71] = v5;
  v1[72] = v8;
  v1[73] = v7;
  v1[74] = v10;
  v11 = v1[32];
  v1[75] = v1[31];
  v1[76] = v1[44];
  v1[77] = v6;
  v1[78] = v2;
  v1[79] = v1[24];
  v1[80] = v1[33];
  v12 = v1[42];
  v1[81] = v1[41];
  v1[82] = v11;
  v1[83] = v12;
  v1[84] = v1[39];
  v1[85] = v1[36];
  v1[86] = v1[47];
  v1[87] = v1[28];
  v1[88] = v1[25];
  type metadata accessor for HorizontalGridView();
}

void sub_23BFEC5D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[11] = a1;
  v1[65] = v1[35];
  v1[66] = v1[43];
  v1[67] = v1[40];
  v1[68] = v1[26];
  v1[69] = v1[34];
  v1[70] = v5;
  v1[71] = v1[45];
  v1[72] = v1[38];
  v1[73] = v1[37];
  v1[74] = v2;
  v1[75] = v6;
  v1[76] = v4;
  v1[77] = v1[27];
  v1[78] = v1[46];
  v1[79] = v1[24];
  v1[80] = v3;
  v1[81] = v10;
  v1[82] = v9;
  v1[83] = v8;
  v1[84] = v1[39];
  v1[85] = v1[36];
  v1[86] = v1[47];
  v1[87] = v7;
  v1[88] = v1[25];
  type metadata accessor for VerticalGridView();
}

void sub_23BFEC67C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1[2] = a1;
  v1[3] = sub_23BFF8968();
  v1[1] = sub_23BFF8968();
  v3 = v1[34];
  v1[65] = v1[35];
  v1[66] = v1[43];
  v1[67] = v1[40];
  v4 = v1[27];
  v1[68] = v1[26];
  v1[69] = v3;
  v5 = v1[29];
  v1[70] = v1[30];
  v6 = v1[46];
  v1[71] = v1[45];
  v7 = v1[37];
  v1[72] = v1[38];
  v1[73] = v7;
  v1[74] = v5;
  v1[75] = v1[31];
  v1[76] = v1[44];
  v1[77] = v4;
  v1[78] = v6;
  v1[79] = v1[24];
  v1[80] = v1[33];
  v1[81] = v1[41];
  v1[82] = v1[32];
  v1[83] = v1[42];
  v1[84] = v2;
  v1[85] = v1[36];
  v1[86] = v1[47];
  v1[87] = v1[28];
  v1[88] = v1[25];
  type metadata accessor for ListView();
}

void sub_23BFEC75C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *v1 = a1;
  v1[65] = v2;
  v1[66] = v1[43];
  v1[67] = v1[40];
  v1[68] = v4;
  v1[69] = v5;
  v1[70] = v1[30];
  v1[71] = v1[45];
  v1[72] = v8;
  v1[73] = v7;
  v1[74] = v3;
  v1[75] = v1[31];
  v1[76] = v1[44];
  v1[77] = v10;
  v1[78] = v9;
  v1[79] = v1[24];
  v1[80] = v1[33];
  v1[81] = v1[41];
  v1[82] = v1[32];
  v1[83] = v1[42];
  v1[84] = v1[39];
  v1[85] = v1[36];
  v1[86] = v1[47];
  v1[87] = v6;
  v1[88] = v1[25];
  type metadata accessor for OrthogonalView();
}

void sub_23BFEC808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v9;
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
  __n128 v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
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

  v11 = *v9;
  v12 = sub_23BFF8968();
  v13 = v9[1];
  v14 = sub_23BFF8968();
  v15 = sub_23BFF8968();
  v16 = MEMORY[0x242615198](&protocol conformance descriptor for CarouselView<A, B, C, D, E, F, G, H, I, J, K, L, M>, v9[12]);
  v17 = MEMORY[0x242615198](&protocol conformance descriptor for HorizontalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[11]);
  v18 = MEMORY[0x242615198](&protocol conformance descriptor for VerticalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[2]);
  v9[63] = v17;
  v9[64] = v18;
  v19 = MEMORY[0x24BDEF3E0];
  v20 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v9[3], v9 + 63);
  v9[61] = v16;
  v9[62] = v20;
  v21 = v19;
  v22 = MEMORY[0x242615198](v19, v13, v9 + 61);
  v23 = MEMORY[0x242615198](&protocol conformance descriptor for ListView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v11);
  v24 = MEMORY[0x242615198](&protocol conformance descriptor for OrthogonalView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, a1);
  v9[59] = v23;
  v9[60] = v24;
  v25 = MEMORY[0x242615198](v21, v12, v9 + 59);
  v9[57] = v22;
  v9[58] = v25;
  v26 = MEMORY[0x242615198](v21, v14, v9 + 57);
  v9[55] = MEMORY[0x24BDF5138];
  v9[56] = v26;
  v27 = MEMORY[0x242615198](v21, v15, v9 + 55);
  v9[65] = v15;
  v9[66] = v27;
  MEMORY[0x24261512C](255, v9 + 65, MEMORY[0x24BEC6710], 0);
  v28 = sub_23BFF8968();
  v9[65] = v15;
  v9[66] = v27;
  v9[53] = swift_getOpaqueTypeConformance2();
  v9[54] = v27;
  v9[3] = v28;
  v29 = MEMORY[0x242615198](v21, v28, v9 + 53);
  v9[2] = v29;
  v9[65] = v28;
  v9[66] = v29;
  MEMORY[0x24261512C](255, v9 + 65, MEMORY[0x24BE351A0], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C28);
  v9[1] = sub_23BFF862C();
  v30 = sub_23BFF8968();
  v9[4] = v30;
  v31 = sub_23BEA1F94(&qword_256AE8C40, &qword_256AE8C30, MEMORY[0x24BEE12D8]);
  v32 = MEMORY[0x24BEE0D00];
  v9[65] = v9[5];
  v9[66] = v32;
  v9[67] = v30;
  v9[68] = v31;
  v9[69] = MEMORY[0x24BEE0D10];
  v33 = sub_23BFF910C();
  v9[12] = v33;
  v9[24] = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v9[5] = (uint64_t)&a9 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = MEMORY[0x24BDAC7A8](v35);
  v9[11] = (uint64_t)&a9 - v37;
  v9[25] = *(_QWORD *)v9[9];
  v38 = v9[13];
  (*(void (**)(uint64_t, __n128))(v38 + 16))(v9[17], v36);
  v9[9] = (*(unsigned __int8 *)(v38 + 80) + 272) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v39 = (char *)swift_allocObject();
  *((_QWORD *)v39 + 4) = v9[26];
  v40 = v9[45];
  *((_QWORD *)v39 + 6) = v9[30];
  *((_QWORD *)v39 + 7) = v40;
  *((_QWORD *)v39 + 8) = v9[43];
  *((_QWORD *)v39 + 12) = v9[31];
  *((_QWORD *)v39 + 14) = v9[27];
  v41 = v9[41];
  v42 = v9[42];
  *((_QWORD *)v39 + 21) = v9[32];
  *((_QWORD *)v39 + 22) = v42;
  v43 = v9[34];
  *((_QWORD *)v39 + 23) = v9[33];
  v45 = v9[35];
  v44 = v9[36];
  v46 = v9[28];
  v47 = v9[19];
  *((_QWORD *)v39 + 18) = v9[20];
  *((_QWORD *)v39 + 19) = v41;
  *((_QWORD *)v39 + 20) = v9[22];
  v48 = v9[40];
  *((_QWORD *)v39 + 28) = v9[39];
  *((_QWORD *)v39 + 29) = v44;
  *((_QWORD *)v39 + 30) = v9[47];
  *((_QWORD *)v39 + 31) = v46;
  *((_QWORD *)v39 + 2) = v45;
  *((_QWORD *)v39 + 3) = v48;
  *((_QWORD *)v39 + 5) = v43;
  v49 = v9[37];
  *((_QWORD *)v39 + 9) = v9[38];
  *((_QWORD *)v39 + 10) = v49;
  *((_QWORD *)v39 + 11) = v9[29];
  v50 = v9[44];
  *((_QWORD *)v39 + 13) = v50;
  v51 = v9[46];
  *((_QWORD *)v39 + 15) = v47;
  *((_QWORD *)v39 + 16) = v51;
  v53 = v9[16];
  v52 = v9[17];
  *((_QWORD *)v39 + 17) = v53;
  v55 = v9[7];
  v54 = v9[8];
  *((_QWORD *)v39 + 24) = v54;
  *((_QWORD *)v39 + 25) = v55;
  v56 = v9[14];
  *((_QWORD *)v39 + 26) = v9[21];
  *((_QWORD *)v39 + 27) = v56;
  v57 = v9[15];
  *((_QWORD *)v39 + 32) = v9[23];
  *((_QWORD *)v39 + 33) = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v9[13] + 32))(&v39[v9[9]], v52, v9[18]);
  swift_bridgeObjectRetain();
  v9[65] = v45;
  v9[66] = v48;
  v9[67] = v43;
  v9[68] = v9[38];
  v9[69] = v9[37];
  v9[70] = v50;
  v9[71] = v47;
  v9[72] = v9[29];
  v9[73] = v9[46];
  v9[74] = v53;
  v9[75] = v9[20];
  v9[76] = v9[22];
  v9[77] = v54;
  v9[78] = v55;
  v9[79] = v9[21];
  v9[80] = v9[14];
  v9[81] = v9[47];
  v9[82] = v9[23];
  v9[83] = v9[39];
  v9[84] = v9[15];
  type metadata accessor for CanvasSectionDescriptor();
}

uint64_t sub_23BFECC54(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t OpaqueTypeConformance2;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);

  v4 = sub_23BFF1354(&qword_256AE8C48, &qword_256AE8C38, MEMORY[0x24BDEBEE0]);
  v1[65] = v1[3];
  v1[66] = v1[2];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v6 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  v1[51] = OpaqueTypeConformance2;
  v1[52] = v6;
  v7 = MEMORY[0x242615198](MEMORY[0x24BDED308], v1[1], v1 + 51);
  v1[49] = v4;
  v1[50] = v7;
  v8 = v1[4];
  v9 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v8, v1 + 49);
  v10 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasSectionDescriptor<A, B, C, D, E, F, G, H, I>, a1);
  v11 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasSectionDescriptor<A, B, C, D, E, F, G, H, I>, a1);
  v12 = v1[5];
  sub_23BF49C10(v1[25], (uint64_t)sub_23BFF14BC, v2, MEMORY[0x24BEE0D00], v8, a1, v9, v10, v11);
  v1[48] = v9;
  v13 = v1[12];
  MEMORY[0x242615198](MEMORY[0x24BDF4A08], v13, v1 + 48);
  v14 = v1[11];
  sub_23BEA72EC(v12, v13, v14);
  v15 = *(void (**)(uint64_t, uint64_t))(v1[24] + 8);
  v15(v12, v13);
  sub_23BEA5C0C(v14, v13, v1[10]);
  return ((uint64_t (*)(uint64_t, uint64_t))v15)(v14, v13);
}

void sub_23BFECDE0()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFECF8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
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

  v9[46] = a1;
  v9[10] = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9[33] = (char *)&a9 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v9[32] = (char *)&a9 - v15;
  MEMORY[0x24BDAC7A8](v16);
  v9[31] = (char *)&a9 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v9[29] = (char *)&a9 - v19;
  MEMORY[0x24BDAC7A8](v20);
  v9[28] = (char *)&a9 - v21;
  v9[2] = v22;
  MEMORY[0x24BDAC7A8](v23);
  v9[3] = (char *)&a9 - v24;
  v9[101] = v9[67];
  v9[102] = v10;
  v9[103] = v11;
  v9[104] = v12;
  type metadata accessor for CanvasLayout();
}

void sub_23BFED088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9[35] = *(_QWORD *)(a1 - 8);
  v9[36] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v9[34] = (char *)&a9 - v15;
  v9[101] = v9[76];
  v9[102] = v9[75];
  v9[78] = v13;
  v9[103] = v13;
  v9[104] = v12;
  v9[105] = v9[77];
  v9[58] = v14;
  v9[106] = v14;
  v9[107] = v9[51];
  v9[108] = v9[52];
  v9[109] = v10;
  v9[110] = v9[48];
  v9[111] = v9[53];
  v9[112] = v9[54];
  v9[113] = v9[55];
  v9[114] = v11;
  type metadata accessor for CanvasItemDescriptor();
}

void sub_23BFED12C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1[43] = a1;
  v8 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemDescriptor<A, B, C, D, E, F>, a1);
  v1[40] = v8;
  v1[101] = v6;
  v1[102] = v1[72];
  v1[103] = v5;
  v1[104] = v1[70];
  v1[105] = v3;
  v1[106] = v1[61];
  v1[107] = v1[71];
  v1[108] = v4;
  v1[109] = v1[67];
  v1[110] = v1[73];
  v1[111] = v1[74];
  v1[112] = v2;
  v1[113] = a1;
  v1[114] = v1[65];
  v1[115] = v1[69];
  v1[116] = v1[63];
  v1[117] = v1[50];
  v1[118] = v1[56];
  v1[119] = v1[66];
  v1[120] = v8;
  type metadata accessor for CarouselView();
}

void sub_23BFED1D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[42] = a1;
  v1[101] = v1[76];
  v1[102] = v3;
  v1[103] = v1[75];
  v1[104] = v8;
  v1[105] = v1[78];
  v1[106] = v1[68];
  v1[107] = v2;
  v1[108] = v9;
  v1[109] = v1[77];
  v10 = v1[63];
  v1[110] = v1[64];
  v1[111] = v1[62];
  v1[112] = v6;
  v1[113] = v1[74];
  v1[114] = v1[58];
  v1[115] = v1[43];
  v1[116] = v7;
  v1[117] = v1[69];
  v1[118] = v1[57];
  v1[119] = v10;
  v11 = v1[59];
  v1[120] = v1[60];
  v1[121] = v11;
  v1[122] = v4;
  v1[123] = v5;
  v1[124] = v1[40];
  type metadata accessor for HorizontalGridView();
}

void sub_23BFED280(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[41] = a1;
  v1[101] = v1[76];
  v1[102] = v1[72];
  v1[103] = v1[75];
  v1[104] = v1[70];
  v1[105] = v1[78];
  v1[106] = v4;
  v1[107] = v1[61];
  v1[108] = v1[71];
  v1[109] = v1[77];
  v1[110] = v9;
  v1[111] = v3;
  v1[112] = v1[73];
  v1[113] = v2;
  v10 = v1[59];
  v1[114] = v1[58];
  v1[115] = v1[43];
  v1[116] = v1[65];
  v1[117] = v1[69];
  v1[118] = v7;
  v1[119] = v8;
  v1[120] = v6;
  v1[121] = v10;
  v1[122] = v1[56];
  v1[123] = v1[66];
  v1[124] = v5;
  type metadata accessor for VerticalGridView();
}

void sub_23BFED32C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[37] = a1;
  v1[38] = sub_23BFF8968();
  v1[27] = sub_23BFF8968();
  v1[101] = v1[76];
  v1[102] = v1[72];
  v1[103] = v1[75];
  v1[104] = v1[70];
  v1[105] = v1[78];
  v1[106] = v1[68];
  v1[107] = v3;
  v1[108] = v1[71];
  v1[109] = v1[77];
  v1[110] = v1[64];
  v1[111] = v1[62];
  v1[112] = v1[73];
  v1[113] = v1[74];
  v1[114] = v1[58];
  v1[115] = v1[43];
  v1[116] = v1[65];
  v1[117] = v2;
  v1[118] = v1[57];
  v1[119] = v6;
  v1[120] = v1[60];
  v1[121] = v4;
  v1[122] = v5;
  v1[123] = v1[66];
  v1[124] = v1[40];
  type metadata accessor for ListView();
}

void sub_23BFED410(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[26] = a1;
  v1[101] = v1[76];
  v1[102] = v1[72];
  v1[103] = v1[75];
  v1[104] = v1[70];
  v1[105] = v1[78];
  v1[106] = v1[68];
  v1[107] = v1[61];
  v1[108] = v4;
  v1[109] = v10;
  v1[110] = v7;
  v1[111] = v1[62];
  v1[112] = v2;
  v1[113] = v1[74];
  v1[114] = v5;
  v1[115] = v1[43];
  v1[116] = v1[65];
  v1[117] = v1[69];
  v1[118] = v1[57];
  v1[119] = v1[63];
  v1[120] = v9;
  v1[121] = v1[59];
  v1[122] = v8;
  v1[123] = v3;
  v1[124] = v6;
  type metadata accessor for OrthogonalView();
}

void sub_23BFED4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v12 = v9[26];
  v13 = sub_23BFF8968();
  v14 = v9[27];
  v15 = sub_23BFF8968();
  v16 = sub_23BFF8968();
  v9[14] = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v9[30] = (char *)&a9 - v18;
  v19 = MEMORY[0x242615198](&protocol conformance descriptor for CarouselView<A, B, C, D, E, F, G, H, I, J, K, L, M>, v9[42], v17);
  v20 = MEMORY[0x242615198](&protocol conformance descriptor for HorizontalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[41]);
  v21 = MEMORY[0x242615198](&protocol conformance descriptor for VerticalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v9[37]);
  v9[99] = v20;
  v9[100] = v21;
  v22 = MEMORY[0x24BDEF3E0];
  v23 = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v9[38], v9 + 99);
  v9[97] = v19;
  v9[98] = v23;
  v24 = MEMORY[0x242615198](v22, v14, v9 + 97);
  v25 = MEMORY[0x242615198](&protocol conformance descriptor for ListView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, v12);
  v26 = MEMORY[0x242615198](&protocol conformance descriptor for OrthogonalView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, a1);
  v9[95] = v25;
  v9[96] = v26;
  v27 = MEMORY[0x242615198](v22, v13, v9 + 95);
  v9[93] = v24;
  v9[94] = v27;
  v28 = MEMORY[0x242615198](v22, v15, v9 + 93);
  v9[91] = MEMORY[0x24BDF5138];
  v9[92] = v28;
  v29 = MEMORY[0x242615198](v22, v16, v9 + 91);
  v9[101] = v16;
  v9[102] = v29;
  MEMORY[0x24261512C](255, v9 + 101, MEMORY[0x24BEC6710], 0);
  v30 = sub_23BFF8968();
  v9[7] = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v9[5] = (char *)&a9 - v31;
  v9[15] = v16;
  v9[101] = v16;
  v9[102] = v29;
  v9[89] = swift_getOpaqueTypeConformance2();
  v9[4] = v29;
  v9[90] = v29;
  v32 = MEMORY[0x242615198](v22, v30, v9 + 89);
  v9[22] = v32;
  v9[23] = v30;
  v9[101] = v30;
  v9[102] = v32;
  v33 = MEMORY[0x24261512C](0, v9 + 101, MEMORY[0x24BE351A0], 0);
  v9[8] = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v9[6] = (char *)&a9 - v34;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C28);
  v9[9] = v33;
  v35 = sub_23BFF862C();
  v9[11] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v9[13] = (char *)&a9 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v37);
  v9[12] = (char *)&a9 - v38;
  v39 = v9[67];
  v40 = v9[50];
  v42 = type metadata accessor for CanvasSectionLayout(0, v39, v40, v41);
  MEMORY[0x24BDAC7A8](v42);
  MEMORY[0x24BDAC7A8](v43);
  v9[16] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C38);
  v9[19] = v35;
  v44 = sub_23BFF8968();
  v9[20] = *(_QWORD *)(v44 - 8);
  v9[21] = v44;
  MEMORY[0x24BDAC7A8](v44);
  v9[17] = (char *)&a9 - v45;
  v9[101] = v9[76];
  v9[102] = v9[75];
  v9[103] = v9[78];
  v9[104] = v9[71];
  v9[105] = v9[77];
  v9[106] = v9[73];
  v9[107] = v39;
  v9[108] = v9[64];
  v9[109] = v10;
  v9[110] = v9[51];
  v9[111] = v9[52];
  v9[112] = v9[47];
  v9[113] = v9[48];
  v9[114] = v9[53];
  v9[115] = v9[54];
  v9[116] = v9[55];
  v9[117] = v9[56];
  v9[118] = v40;
  v9[119] = v9[60];
  v9[120] = v9[45];
  type metadata accessor for CanvasSectionDescriptor();
}

uint64_t sub_23BFED8F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  double v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;

  v8 = *(_QWORD *)(v1 + 312) + *(int *)(a1 + 180);
  *(_QWORD *)(v1 + 144) = v5;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v9(v3, v8, v4);
  *(_QWORD *)(v1 + 200) = v3;
  *(_QWORD *)(v1 + 208) = v4;
  if (swift_getEnumCaseMultiPayload()
    || (v9(v2, *(_QWORD *)(v1 + 200), *(_QWORD *)(v1 + 208)),
        v10 = sub_23BFE8A40(),
        ((*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(v1 + 528) + 56))(*(_QWORD *)(v1 + 592), v10) & 1) == 0))
  {
    v22 = *(_QWORD *)(v1 + 368);
    v23 = *(_QWORD *)(v1 + 392);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 + 280) + 16))(*(_QWORD *)(v1 + 272), v23 + *(int *)(v22 + 296), *(_QWORD *)(v1 + 288));
    v24 = *(_QWORD *)(v1 + 80);
    v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
    *(_QWORD *)(v1 + 336) = v25;
    *(_QWORD *)(v1 + 8) = a1;
    v26 = *(_QWORD *)(v1 + 24);
    v25(v26, v23, v22);
    v27 = *(unsigned __int8 *)(v24 + 80);
    v28 = (v27 + 272) & ~v27;
    v29 = v28 + *(_QWORD *)(v1 + 16);
    *(_QWORD *)(v1 + 216) = v29;
    v30 = v28;
    *(_QWORD *)(v1 + 344) = v28;
    v31 = v27 | 7;
    v32 = (v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)(v1 + 320) = v32;
    *(_QWORD *)(v1 + 296) = v31;
    *(_QWORD *)(v1 + 304) = v32 + 8;
    v33 = (char *)swift_allocObject();
    v34 = *(_QWORD *)(v1 + 608);
    v35 = *(_QWORD *)(v1 + 600);
    *((_QWORD *)v33 + 2) = v34;
    *((_QWORD *)v33 + 3) = v35;
    v36 = *(_QWORD *)(v1 + 624);
    *((_QWORD *)v33 + 4) = *(_QWORD *)(v1 + 560);
    *((_QWORD *)v33 + 5) = v36;
    v37 = *(_QWORD *)(v1 + 488);
    *((_QWORD *)v33 + 6) = *(_QWORD *)(v1 + 544);
    *((_QWORD *)v33 + 7) = v37;
    v38 = *(_QWORD *)(v1 + 568);
    *((_QWORD *)v33 + 8) = *(_QWORD *)(v1 + 576);
    *((_QWORD *)v33 + 9) = v38;
    v39 = *(_QWORD *)(v1 + 512);
    *((_QWORD *)v33 + 10) = *(_QWORD *)(v1 + 616);
    *((_QWORD *)v33 + 11) = v39;
    v40 = *(_QWORD *)(v1 + 584);
    *((_QWORD *)v33 + 12) = *(_QWORD *)(v1 + 496);
    *((_QWORD *)v33 + 13) = v40;
    v41 = *(_QWORD *)(v1 + 536);
    *((_QWORD *)v33 + 14) = *(_QWORD *)(v1 + 592);
    *((_QWORD *)v33 + 15) = v41;
    v42 = *(_QWORD *)(v1 + 408);
    *((_QWORD *)v33 + 16) = *(_QWORD *)(v1 + 464);
    *((_QWORD *)v33 + 17) = v42;
    v43 = *(_QWORD *)(v1 + 552);
    *((_QWORD *)v33 + 18) = *(_QWORD *)(v1 + 416);
    *((_QWORD *)v33 + 19) = v43;
    v44 = *(_QWORD *)(v1 + 456);
    *((_QWORD *)v33 + 20) = *(_QWORD *)(v1 + 376);
    *((_QWORD *)v33 + 21) = v44;
    v45 = v44;
    v46 = *(_QWORD *)(v1 + 520);
    *((_QWORD *)v33 + 22) = *(_QWORD *)(v1 + 504);
    *((_QWORD *)v33 + 23) = v46;
    v47 = *(_QWORD *)(v1 + 424);
    *((_QWORD *)v33 + 24) = *(_QWORD *)(v1 + 384);
    *((_QWORD *)v33 + 25) = v47;
    v48 = *(_QWORD *)(v1 + 440);
    *((_QWORD *)v33 + 26) = *(_QWORD *)(v1 + 432);
    *((_QWORD *)v33 + 27) = v48;
    v49 = *(_QWORD *)(v1 + 472);
    *((_QWORD *)v33 + 28) = *(_QWORD *)(v1 + 480);
    *((_QWORD *)v33 + 29) = v49;
    v50 = *(_QWORD *)(v1 + 528);
    *((_QWORD *)v33 + 30) = *(_QWORD *)(v1 + 448);
    *((_QWORD *)v33 + 31) = v50;
    v51 = *(_QWORD *)(v1 + 360);
    *((_QWORD *)v33 + 32) = *(_QWORD *)(v1 + 400);
    *((_QWORD *)v33 + 33) = v51;
    v52 = v34;
    v53 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 32);
    *(_QWORD *)(v1 + 328) = v53;
    v53(&v33[v30], v26, v22);
    *(_QWORD *)&v33[*(_QWORD *)(v1 + 320)] = *(_QWORD *)(v1 + 352);
    v54 = *(_QWORD *)(v1 + 392);
    v55 = v22;
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 336))(*(_QWORD *)(v1 + 224), v54, v22);
    v56 = (_QWORD *)swift_allocObject();
    v57 = v35;
    v58 = v56;
    v56[2] = v52;
    v56[3] = v57;
    v59 = *(_QWORD *)(v1 + 560);
    v60 = *(_QWORD *)(v1 + 624);
    v56[4] = v59;
    v56[5] = v60;
    v56[6] = *(_QWORD *)(v1 + 544);
    v56[7] = v37;
    v61 = *(_QWORD *)(v1 + 568);
    v56[8] = *(_QWORD *)(v1 + 576);
    v56[9] = v61;
    v62 = *(_QWORD *)(v1 + 512);
    v56[10] = *(_QWORD *)(v1 + 616);
    v56[11] = v62;
    v63 = *(_QWORD *)(v1 + 584);
    v56[12] = *(_QWORD *)(v1 + 496);
    v56[13] = v63;
    v64 = *(_QWORD *)(v1 + 536);
    v56[14] = *(_QWORD *)(v1 + 592);
    v56[15] = v64;
    v65 = *(_QWORD *)(v1 + 408);
    v56[16] = *(_QWORD *)(v1 + 464);
    v56[17] = v65;
    v66 = *(_QWORD *)(v1 + 552);
    v56[18] = *(_QWORD *)(v1 + 416);
    v56[19] = v66;
    v67 = *(_QWORD *)(v1 + 384);
    v56[20] = *(_QWORD *)(v1 + 376);
    v56[21] = v45;
    v68 = *(_QWORD *)(v1 + 520);
    v56[22] = *(_QWORD *)(v1 + 504);
    v56[23] = v68;
    v69 = *(_QWORD *)(v1 + 424);
    v56[24] = v67;
    v56[25] = v69;
    v70 = *(_QWORD *)(v1 + 440);
    v56[26] = *(_QWORD *)(v1 + 432);
    v56[27] = v70;
    v71 = *(_QWORD *)(v1 + 472);
    v56[28] = *(_QWORD *)(v1 + 480);
    v56[29] = v71;
    v72 = *(_QWORD *)(v1 + 528);
    v56[30] = *(_QWORD *)(v1 + 448);
    v56[31] = v72;
    v73 = (char *)v56 + *(_QWORD *)(v1 + 344);
    v74 = *(_QWORD *)(v1 + 360);
    v58[32] = *(_QWORD *)(v1 + 400);
    v58[33] = v74;
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 328))(v73, *(_QWORD *)(v1 + 224), v55);
    *(_QWORD *)((char *)v58 + *(_QWORD *)(v1 + 320)) = *(_QWORD *)(v1 + 352);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 336))(*(_QWORD *)(v1 + 232), v54, v55);
    v75 = (_QWORD *)swift_allocObject();
    v76 = *(_QWORD *)(v1 + 600);
    v75[2] = *(_QWORD *)(v1 + 608);
    v75[3] = v76;
    v77 = *(_QWORD *)(v1 + 624);
    v75[4] = v59;
    v75[5] = v77;
    v78 = *(_QWORD *)(v1 + 488);
    v75[6] = *(_QWORD *)(v1 + 544);
    v75[7] = v78;
    v79 = *(_QWORD *)(v1 + 568);
    v75[8] = *(_QWORD *)(v1 + 576);
    v75[9] = v79;
    v75[10] = *(_QWORD *)(v1 + 616);
    v75[11] = v62;
    v80 = *(_QWORD *)(v1 + 496);
    v81 = *(_QWORD *)(v1 + 584);
    v75[12] = v80;
    v75[13] = v81;
    v82 = *(_QWORD *)(v1 + 536);
    v75[14] = *(_QWORD *)(v1 + 592);
    v75[15] = v82;
    v83 = *(_QWORD *)(v1 + 408);
    v75[16] = *(_QWORD *)(v1 + 464);
    v75[17] = v83;
    v84 = *(_QWORD *)(v1 + 552);
    v75[18] = *(_QWORD *)(v1 + 416);
    v75[19] = v84;
    v85 = *(_QWORD *)(v1 + 456);
    v75[20] = *(_QWORD *)(v1 + 376);
    v75[21] = v85;
    v75[22] = *(_QWORD *)(v1 + 504);
    v75[23] = v68;
    v86 = *(_QWORD *)(v1 + 424);
    v75[24] = v67;
    v75[25] = v86;
    v87 = *(_QWORD *)(v1 + 440);
    v88 = *(_QWORD *)(v1 + 448);
    v75[26] = *(_QWORD *)(v1 + 432);
    v75[27] = v87;
    v89 = *(_QWORD *)(v1 + 472);
    v75[28] = *(_QWORD *)(v1 + 480);
    v75[29] = v89;
    v90 = *(_QWORD *)(v1 + 528);
    v75[30] = v88;
    v75[31] = v90;
    v91 = (char *)v75 + *(_QWORD *)(v1 + 344);
    v92 = *(_QWORD *)(v1 + 360);
    v93 = *(_QWORD *)(v1 + 368);
    v75[32] = *(_QWORD *)(v1 + 400);
    v75[33] = v92;
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 328))(v91, *(_QWORD *)(v1 + 232), v93);
    v94 = *(_QWORD *)(v1 + 392);
    v95 = *(_QWORD *)(v94 + 24);
    *(_QWORD *)(v1 + 224) = *(_QWORD *)(v94 + 32);
    *(_QWORD *)(v1 + 232) = v95;
    (*(void (**)(_QWORD))(v1 + 336))(*(_QWORD *)(v1 + 248));
    v96 = (_QWORD *)swift_allocObject();
    v97 = *(_QWORD *)(v1 + 608);
    v98 = *(_QWORD *)(v1 + 600);
    v96[2] = v97;
    v96[3] = v98;
    v99 = *(_QWORD *)(v1 + 624);
    v96[4] = *(_QWORD *)(v1 + 560);
    v96[5] = v99;
    v100 = *(_QWORD *)(v1 + 488);
    v96[6] = *(_QWORD *)(v1 + 544);
    v96[7] = v100;
    v101 = *(_QWORD *)(v1 + 568);
    v96[8] = *(_QWORD *)(v1 + 576);
    v96[9] = v101;
    v102 = *(_QWORD *)(v1 + 512);
    v96[10] = *(_QWORD *)(v1 + 616);
    v96[11] = v102;
    v103 = *(_QWORD *)(v1 + 584);
    v96[12] = v80;
    v96[13] = v103;
    v104 = *(_QWORD *)(v1 + 536);
    v96[14] = *(_QWORD *)(v1 + 592);
    v96[15] = v104;
    v105 = *(_QWORD *)(v1 + 456);
    v106 = *(_QWORD *)(v1 + 408);
    v96[16] = *(_QWORD *)(v1 + 464);
    v96[17] = v106;
    v107 = *(_QWORD *)(v1 + 552);
    v96[18] = *(_QWORD *)(v1 + 416);
    v96[19] = v107;
    v96[20] = *(_QWORD *)(v1 + 376);
    v96[21] = v105;
    v108 = *(_QWORD *)(v1 + 520);
    v96[22] = *(_QWORD *)(v1 + 504);
    v96[23] = v108;
    v109 = *(_QWORD *)(v1 + 424);
    v96[24] = *(_QWORD *)(v1 + 384);
    v96[25] = v109;
    v110 = *(_QWORD *)(v1 + 440);
    v96[26] = *(_QWORD *)(v1 + 432);
    v96[27] = v110;
    v96[28] = *(_QWORD *)(v1 + 480);
    v96[29] = v89;
    v111 = *(_QWORD *)(v1 + 528);
    v96[30] = v88;
    v96[31] = v111;
    v112 = (char *)v96 + *(_QWORD *)(v1 + 344);
    v113 = *(_QWORD *)(v1 + 360);
    v114 = *(_QWORD *)(v1 + 368);
    v96[32] = *(_QWORD *)(v1 + 400);
    v96[33] = v113;
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 328))(v112, *(_QWORD *)(v1 + 248), v114);
    *(_QWORD *)((char *)v96 + *(_QWORD *)(v1 + 320)) = *(_QWORD *)(v1 + 352);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 336))(*(_QWORD *)(v1 + 256), *(_QWORD *)(v1 + 392), v114);
    v115 = (_QWORD *)swift_allocObject();
    v115[2] = v97;
    v115[3] = v98;
    v116 = *(_QWORD *)(v1 + 624);
    v115[4] = *(_QWORD *)(v1 + 560);
    v115[5] = v116;
    v117 = *(_QWORD *)(v1 + 488);
    v115[6] = *(_QWORD *)(v1 + 544);
    v115[7] = v117;
    v118 = *(_QWORD *)(v1 + 568);
    v115[8] = *(_QWORD *)(v1 + 576);
    v115[9] = v118;
    v119 = *(_QWORD *)(v1 + 512);
    v115[10] = *(_QWORD *)(v1 + 616);
    v115[11] = v119;
    v120 = *(_QWORD *)(v1 + 584);
    v115[12] = *(_QWORD *)(v1 + 496);
    v115[13] = v120;
    v121 = *(_QWORD *)(v1 + 536);
    v115[14] = *(_QWORD *)(v1 + 592);
    v115[15] = v121;
    v122 = *(_QWORD *)(v1 + 464);
    v123 = *(_QWORD *)(v1 + 408);
    v115[16] = v122;
    v115[17] = v123;
    v124 = *(_QWORD *)(v1 + 552);
    v115[18] = *(_QWORD *)(v1 + 416);
    v115[19] = v124;
    v115[20] = *(_QWORD *)(v1 + 376);
    v115[21] = v105;
    v125 = *(_QWORD *)(v1 + 520);
    v115[22] = *(_QWORD *)(v1 + 504);
    v115[23] = v125;
    v126 = *(_QWORD *)(v1 + 424);
    v115[24] = *(_QWORD *)(v1 + 384);
    v115[25] = v126;
    v127 = *(_QWORD *)(v1 + 440);
    v115[26] = *(_QWORD *)(v1 + 432);
    v115[27] = v127;
    v128 = *(_QWORD *)(v1 + 472);
    v115[28] = *(_QWORD *)(v1 + 480);
    v115[29] = v128;
    v115[30] = *(_QWORD *)(v1 + 448);
    v115[31] = v111;
    v129 = (char *)v115 + *(_QWORD *)(v1 + 344);
    v130 = *(_QWORD *)(v1 + 360);
    v131 = *(_QWORD *)(v1 + 368);
    v115[32] = *(_QWORD *)(v1 + 400);
    v115[33] = v130;
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 328))(v129, *(_QWORD *)(v1 + 256), v131);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v1 + 336))(*(_QWORD *)(v1 + 264), *(_QWORD *)(v1 + 392), v131);
    v132 = (_QWORD *)swift_allocObject();
    v133 = *(_QWORD *)(v1 + 416);
    v132[17] = *(_QWORD *)(v1 + 408);
    v132[18] = v133;
    v132[20] = *(_QWORD *)(v1 + 376);
    v134 = *(_QWORD *)(v1 + 424);
    v132[24] = *(_QWORD *)(v1 + 384);
    v132[25] = v134;
    v135 = *(_QWORD *)(v1 + 440);
    v132[26] = *(_QWORD *)(v1 + 432);
    v132[27] = v135;
    v132[28] = *(_QWORD *)(v1 + 480);
    v132[30] = *(_QWORD *)(v1 + 448);
    v132[32] = *(_QWORD *)(v1 + 400);
    v132[33] = v130;
    v132[16] = v122;
    v136 = *(_QWORD *)(v1 + 600);
    v132[2] = *(_QWORD *)(v1 + 608);
    v132[3] = v136;
    v137 = *(_QWORD *)(v1 + 624);
    v132[4] = *(_QWORD *)(v1 + 560);
    v132[5] = v137;
    v138 = *(_QWORD *)(v1 + 488);
    v132[6] = *(_QWORD *)(v1 + 544);
    v132[7] = v138;
    v139 = *(_QWORD *)(v1 + 568);
    v132[8] = *(_QWORD *)(v1 + 576);
    v132[9] = v139;
    v141 = *(_QWORD *)(v1 + 504);
    v140 = *(_QWORD *)(v1 + 512);
    v132[10] = *(_QWORD *)(v1 + 616);
    v132[11] = v140;
    v142 = *(_QWORD *)(v1 + 584);
    v132[12] = *(_QWORD *)(v1 + 496);
    v132[13] = v142;
    v143 = *(_QWORD *)(v1 + 536);
    v132[14] = *(_QWORD *)(v1 + 592);
    v132[15] = v143;
    v132[19] = *(_QWORD *)(v1 + 552);
    v132[21] = *(_QWORD *)(v1 + 456);
    v132[22] = v141;
    v132[23] = v125;
    v132[29] = *(_QWORD *)(v1 + 472);
    v144 = (char *)v132 + *(_QWORD *)(v1 + 344);
    v132[31] = *(_QWORD *)(v1 + 528);
    (*(void (**)(char *, _QWORD, _QWORD))(v1 + 328))(v144, *(_QWORD *)(v1 + 264), *(_QWORD *)(v1 + 368));
    *(_QWORD *)((char *)v132 + *(_QWORD *)(v1 + 320)) = *(_QWORD *)(v1 + 352);
    v145 = *(_QWORD *)(v1 + 392);
    v146 = *(_QWORD *)(v145 + 72);
    *(_QWORD *)(v1 + 440) = *(_QWORD *)(v145 + 80);
    *(_QWORD *)(v1 + 448) = v146;
    *(_QWORD *)(v1 + 480) = MEMORY[0x242615198](&protocol conformance descriptor for CanvasSectionDescriptor<A, B, C, D, E, F, G, H, I>, *(_QWORD *)(v1 + 8));
    sub_23BF29320();
  }
  v11 = sub_23BFF8F8C();
  sub_23BFE8A40();
  sub_23BFF91C0();
  sub_23BFF84D0();
  v12 = *(_QWORD *)(v6 - 152);
  v13 = *(_BYTE *)(v6 - 144);
  v14 = *(_QWORD *)(v6 - 136);
  v15 = *(_BYTE *)(v6 - 128);
  *(_QWORD *)(v1 + 808) = v11;
  *(_QWORD *)(v1 + 816) = v12;
  *(_BYTE *)(v1 + 824) = v13;
  *(_QWORD *)(v1 + 832) = v14;
  *(_BYTE *)(v1 + 840) = v15;
  *(_OWORD *)(v1 + 848) = *(_OWORD *)(v6 - 120);
  sub_23BFF1354(&qword_256AE8C48, &qword_256AE8C38, MEMORY[0x24BDEBEE0]);
  v17 = *(_QWORD *)(v1 + 176);
  v16 = *(_QWORD *)(v1 + 184);
  *(_QWORD *)(v1 + 648) = v16;
  *(_QWORD *)(v1 + 656) = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v1 + 632) = OpaqueTypeConformance2;
  *(_QWORD *)(v1 + 640) = v19;
  v20 = *(_QWORD *)(v1 + 152);
  MEMORY[0x242615198](MEMORY[0x24BDED308], v20, v1 + 632);
  v21 = *(_QWORD *)(v1 + 136);
  sub_23BEA5C24(v1 + 808, *(_QWORD *)(v1 + 128));
  swift_release();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 144) + 8))(*(_QWORD *)(v1 + 200), *(_QWORD *)(v1 + 208));
  v147 = sub_23BFF1354(&qword_256AE8C48, &qword_256AE8C38, MEMORY[0x24BDEBEE0]);
  *(_QWORD *)(v1 + 808) = v16;
  *(_QWORD *)(v1 + 816) = v17;
  v148 = swift_getOpaqueTypeConformance2();
  v149 = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  *(_QWORD *)(v1 + 680) = v148;
  *(_QWORD *)(v1 + 688) = v149;
  v150 = MEMORY[0x242615198](MEMORY[0x24BDED308], v20, v1 + 680);
  *(_QWORD *)(v1 + 664) = v147;
  *(_QWORD *)(v1 + 672) = v150;
  v151 = *(_QWORD *)(v1 + 168);
  MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v151, v1 + 664);
  sub_23BEA5C0C(v21, v151, *(_QWORD *)(v1 + 192));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 160) + 8))(v21, v151);
}

void sub_23BFEE538()
{
  uint64_t v0;

  v0 = sub_23BFF83A4();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEE6C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  v5 = *(void (**)(uint64_t))(v1[28] + *(int *)(a1 + 300));
  MEMORY[0x242613710](v1[29], v1[30]);
  v5(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
}

void sub_23BFEE718()
{
  uint64_t v0;

  v0 = sub_23BFF83A4();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEE8A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  v5 = *(void (**)(uint64_t))(v1[28] + *(int *)(a1 + 304));
  MEMORY[0x242613710](v1[29], v1[30]);
  v5(v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
}

void sub_23BFEE8F8()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEEA3C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  char *v12;
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
  uint64_t result;
  void (**v27)();
  _BYTE v28[96];

  v7 = *(_QWORD *)(a1 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = &v28[-v9];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, __n128))(v7 + 16))(&v28[-v9], v1[28], a1, v8);
  v11 = (*(unsigned __int8 *)(v7 + 80) + 272) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v12 = (char *)swift_allocObject();
  v13 = v1[14];
  *((_QWORD *)v12 + 2) = v1[12];
  *((_QWORD *)v12 + 3) = v13;
  v14 = v1[18];
  *((_QWORD *)v12 + 4) = v1[16];
  *((_QWORD *)v12 + 5) = v14;
  v15 = v1[22];
  *((_QWORD *)v12 + 6) = v1[20];
  *((_QWORD *)v12 + 7) = v15;
  v16 = v1[1];
  *((_QWORD *)v12 + 8) = v1[24];
  *((_QWORD *)v12 + 9) = v16;
  v17 = v1[3];
  *((_QWORD *)v12 + 10) = v1[2];
  *((_QWORD *)v12 + 11) = v17;
  v18 = v1[5];
  *((_QWORD *)v12 + 12) = v1[4];
  *((_QWORD *)v12 + 13) = v18;
  v19 = v1[7];
  *((_QWORD *)v12 + 14) = v1[6];
  *((_QWORD *)v12 + 15) = v19;
  v20 = v1[9];
  *((_QWORD *)v12 + 16) = v1[8];
  *((_QWORD *)v12 + 17) = v20;
  v21 = v1[11];
  *((_QWORD *)v12 + 18) = v1[10];
  *((_QWORD *)v12 + 19) = v21;
  v22 = v1[15];
  *((_QWORD *)v12 + 20) = v1[13];
  *((_QWORD *)v12 + 21) = v22;
  v23 = v1[19];
  *((_QWORD *)v12 + 22) = v1[17];
  *((_QWORD *)v12 + 23) = v23;
  v24 = v1[23];
  *((_QWORD *)v12 + 24) = v1[21];
  *((_QWORD *)v12 + 25) = v24;
  v25 = v1[26];
  *((_QWORD *)v12 + 26) = v1[25];
  *((_QWORD *)v12 + 27) = v25;
  *((_QWORD *)v12 + 28) = v1[27];
  *((_QWORD *)v12 + 29) = v4;
  *((_QWORD *)v12 + 30) = v1[30];
  *((_QWORD *)v12 + 31) = v5;
  *((_QWORD *)v12 + 32) = v2;
  *((_QWORD *)v12 + 33) = v3;
  result = (*(uint64_t (**)(char *, _BYTE *, uint64_t))(v7 + 32))(&v12[v11], v10, a1);
  v27 = (void (**)())v1[29];
  *v27 = sub_23BFF0D48;
  v27[1] = (void (*)())v12;
  return result;
}

void sub_23BFEEB98()
{
  sub_23BFEE8F8();
}

uint64_t sub_23BFEEC14()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23BFEEC88(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[16];
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v75 = a8;
  v73 = a7;
  v70 = a3;
  v71 = a6;
  v62 = a2;
  v63 = a5;
  v66 = a4;
  v52 = a1;
  v44 = a9;
  v64 = a35;
  v65 = a34;
  v79 = a33;
  v78 = a32;
  v77 = a31;
  v50 = a30;
  v49 = a29;
  v46 = a28;
  v76 = a27;
  v74 = a26;
  v72 = a25;
  v48 = a24;
  v47 = a23;
  v80 = a22;
  v69 = a21;
  v68 = a20;
  v67 = a19;
  v61 = a18;
  v60 = a17;
  v59 = a16;
  v58 = a15;
  v57 = a14;
  v56 = a13;
  v55 = a12;
  v54 = a11;
  v53 = a10;
  v35 = sub_23BFF8980();
  v42 = *(_QWORD *)(v35 - 8);
  v43 = v35;
  MEMORY[0x24BDAC7A8](v35);
  v41 = &v38[-((v36 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v39 = sub_23BFF8500();
  v45 = *(_QWORD *)(v39 - 8);
  v40 = *(_QWORD *)(v45 + 64);
  MEMORY[0x24BDAC7A8](v39);
  v51 = &v38[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v81 = v70;
  v82 = v66;
  v83 = v63;
  v84 = v71;
  v85 = v73;
  v86 = v75;
  v87 = a10;
  v88 = a11;
  v89 = a12;
  v90 = a13;
  v91 = a14;
  v92 = a15;
  v93 = a16;
  v94 = a17;
  v95 = a18;
  v96 = v67;
  v97 = v68;
  v98 = v69;
  v99 = v80;
  v100 = v47;
  v101 = v48;
  v102 = v72;
  v103 = v74;
  v104 = v76;
  v105 = v46;
  v106 = v49;
  v107 = v50;
  v108 = v77;
  v109 = v78;
  v110 = v79;
  v111 = v65;
  v112 = v64;
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEEEE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  void (*v12)(_BYTE *, _QWORD, uint64_t);
  uint64_t v13;
  void (*v14)(_QWORD, _QWORD, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
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
  char *v36;
  void (*v37)(char *, uint64_t, _QWORD);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
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
  char *v61;
  uint64_t v62;
  _BYTE v64[96];

  v8 = *(_QWORD *)(a1 - 8);
  *v1 = a1;
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v11 = &v64[-v10];
  v1[1] = &v64[-v10];
  v1[3] = sub_23BFF8F8C();
  v12 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v8 + 16);
  v1[10] = v12;
  v12(v11, v1[32], a1);
  v13 = v1[15];
  v14 = *(void (**)(_QWORD, _QWORD, uint64_t))(v13 + 16);
  v1[9] = v14;
  v15 = v1[2];
  v14(v1[21], v1[22], v15);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 272) & ~v16;
  v18 = *(unsigned __int8 *)(v13 + 80);
  v19 = (v9 + v18 + v17) & ~v18;
  v1[7] += v19;
  v1[8] = v17;
  v1[5] = v19;
  v1[6] = v16 | v18 | 7;
  v20 = (_QWORD *)swift_allocObject();
  v21 = v1[36];
  v20[2] = v1[40];
  v20[3] = v21;
  v22 = v1[41];
  v20[4] = v1[33];
  v20[5] = v22;
  v23 = v1[45];
  v20[6] = v1[43];
  v20[7] = v23;
  v24 = v1[24];
  v20[8] = v1[23];
  v20[9] = v24;
  v25 = v1[26];
  v20[10] = v1[25];
  v20[11] = v25;
  v26 = v1[28];
  v20[12] = v1[27];
  v20[13] = v26;
  v27 = v1[30];
  v20[14] = v1[29];
  v20[15] = v27;
  v28 = v1[37];
  v20[16] = v1[31];
  v20[17] = v28;
  v29 = v1[39];
  v20[18] = v1[38];
  v20[19] = v29;
  v20[20] = v1[50];
  v20[21] = v3;
  v30 = v1[42];
  v20[22] = v4;
  v20[23] = v30;
  v31 = v1[46];
  v20[24] = v1[44];
  v20[25] = v31;
  v32 = v1[16];
  v20[26] = v32;
  v20[27] = v5;
  v33 = v1[47];
  v20[28] = v2;
  v20[29] = v33;
  v34 = v1[49];
  v20[30] = v1[48];
  v20[31] = v34;
  v35 = v1[34];
  v20[32] = v1[35];
  v20[33] = v35;
  v36 = (char *)v20 + v17;
  v37 = *(void (**)(char *, uint64_t, _QWORD))(v8 + 32);
  v1[4] = v37;
  v38 = *v1;
  v39 = v1[1];
  v37(v36, v39, *v1);
  v40 = (char *)v20 + v19;
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v1[15] + 32);
  v42 = v1[21];
  v41(v40, v42, v15);
  v1[56] = v1[3];
  v1[57] = sub_23BFF0F10;
  v1[59] = 0;
  v1[60] = 0;
  v1[58] = v20;
  v43 = v1[11];
  sub_23BFF8A34();
  v44 = v1[22];
  sub_23BFF84F4();
  (*(void (**)(uint64_t, _QWORD))(v1[12] + 8))(v43, v1[13]);
  sub_23BFF0F14(v6 - 128, (uint64_t)(v1 + 51));
  ((void (*)(uint64_t, _QWORD, uint64_t))v1[10])(v39, v1[32], v38);
  ((void (*)(uint64_t, uint64_t, uint64_t))v1[9])(v42, v44, v15);
  v45 = (char *)swift_allocObject();
  v46 = v1[36];
  *((_QWORD *)v45 + 2) = v1[40];
  *((_QWORD *)v45 + 3) = v46;
  v47 = v1[41];
  *((_QWORD *)v45 + 4) = v1[33];
  *((_QWORD *)v45 + 5) = v47;
  v48 = v1[45];
  *((_QWORD *)v45 + 6) = v1[43];
  *((_QWORD *)v45 + 7) = v48;
  v49 = v1[24];
  *((_QWORD *)v45 + 8) = v1[23];
  *((_QWORD *)v45 + 9) = v49;
  v50 = v1[26];
  *((_QWORD *)v45 + 10) = v1[25];
  *((_QWORD *)v45 + 11) = v50;
  v51 = v1[28];
  *((_QWORD *)v45 + 12) = v1[27];
  *((_QWORD *)v45 + 13) = v51;
  v52 = v1[30];
  *((_QWORD *)v45 + 14) = v1[29];
  *((_QWORD *)v45 + 15) = v52;
  v53 = v1[37];
  *((_QWORD *)v45 + 16) = v1[31];
  *((_QWORD *)v45 + 17) = v53;
  v54 = v1[39];
  *((_QWORD *)v45 + 18) = v1[38];
  *((_QWORD *)v45 + 19) = v54;
  v55 = v1[17];
  *((_QWORD *)v45 + 20) = v1[50];
  *((_QWORD *)v45 + 21) = v55;
  v56 = v1[42];
  *((_QWORD *)v45 + 22) = v1[18];
  *((_QWORD *)v45 + 23) = v56;
  v57 = v1[46];
  *((_QWORD *)v45 + 24) = v1[44];
  *((_QWORD *)v45 + 25) = v57;
  v58 = v1[19];
  *((_QWORD *)v45 + 26) = v32;
  *((_QWORD *)v45 + 27) = v58;
  v59 = v1[47];
  *((_QWORD *)v45 + 28) = v1[20];
  *((_QWORD *)v45 + 29) = v59;
  v60 = v1[49];
  *((_QWORD *)v45 + 30) = v1[48];
  *((_QWORD *)v45 + 31) = v60;
  v61 = &v45[v1[8]];
  v62 = v1[34];
  *((_QWORD *)v45 + 32) = v1[35];
  *((_QWORD *)v45 + 33) = v62;
  ((void (*)(char *, uint64_t, uint64_t))v1[4])(v61, v39, v38);
  v41(&v45[v1[5]], v42, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE37E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8CF8);
  sub_23BFF1354((unint64_t *)&qword_256AE37E8, &qword_256AE37E0, MEMORY[0x24BDF0910]);
  sub_23BFF13B0();
  sub_23BFF8F2C();
  swift_release();
  swift_release();
  sub_23BEAA6B8(v1[57]);
  return sub_23BEAA6B8(v1[59]);
}

void sub_23BFEF2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19, __int128 a20,uint64_t a21,uint64_t a22)
{
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[40];
  _BYTE v68[16];

  v42 = a8;
  v46 = a1;
  v45 = a22;
  v44 = a21;
  v43 = a20;
  v41 = a19;
  v40 = a18;
  v39 = a17;
  v38 = a16;
  v37 = a15;
  v36 = a14;
  v35 = a13;
  v34 = a12;
  v33 = a11;
  v32 = a10;
  v31 = a9;
  v27 = sub_23BFF8980();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v31 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BFF8A34();
  sub_23BFF84F4();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  sub_23BFF0F14((uint64_t)v67, (uint64_t)v68);
  v47 = a3;
  v48 = a4;
  v49 = a5;
  v50 = a6;
  v51 = a7;
  v52 = v42;
  v53 = v31;
  v54 = v32;
  v55 = v33;
  v56 = v34;
  v57 = v35;
  v58 = v36;
  v59 = v37;
  v60 = v38;
  v61 = v39;
  v62 = v40;
  v63 = v41;
  v64 = v43;
  v65 = v44;
  v66 = v45;
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFEF4A0()
{
  return sub_23BFE8A94();
}

uint64_t sub_23BFEF4D8()
{
  return swift_allocateGenericValueMetadata();
}

void sub_23BFEF4E0()
{
  type metadata accessor for CanvasLayout();
}

uint64_t *sub_23BFEF594(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  __int128 v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void (*v55)(unint64_t, unint64_t, uint64_t);

  v3 = *(_QWORD *)(a3 + 112);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = v5;
  v7 = v5 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v8 = ((v6 + 64) & ~v6) + *(_QWORD *)(v4 + 64) + 7;
  v9 = v5 & 0x100000;
  v10 = *a2;
  *a1 = *a2;
  if (v6 > 7
    || v9 != 0
    || ((((((((v8 + (v7 & (v6 + 88))) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 24 > 0x18)
  {
    v13 = (uint64_t *)(v10 + (v7 & (v6 + 16)));
  }
  else
  {
    v13 = a1;
    v14 = ~v6;
    v15 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    v16 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (_QWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
    v19 = (_QWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = (_QWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
    v22 = (_QWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = (_QWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
    v25 = (_QWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = (_QWORD *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
    v28 = (_QWORD *)(((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = (_QWORD *)(v7 & ((unint64_t)v28 + 23));
    v31 = (_QWORD *)(v7 & ((unint64_t)v27 + 23));
    *v31 = *v30;
    v32 = ((unint64_t)v31 + 15) & 0xFFFFFFFFFFFFFFF8;
    v33 = ((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF8;
    v34 = *(_OWORD *)(v33 + 16);
    *(_OWORD *)v32 = *(_OWORD *)v33;
    *(_OWORD *)(v32 + 16) = v34;
    *(_BYTE *)(v32 + 32) = *(_BYTE *)(v33 + 32);
    v35 = (_QWORD *)(((unint64_t)v31 + 55) & 0xFFFFFFFFFFFFF8);
    v36 = (_QWORD *)(((unint64_t)v30 + 55) & 0xFFFFFFFFFFFFF8);
    *v35 = *v36;
    v37 = (_QWORD *)(((unint64_t)v35 + 15) & 0xFFFFFFFFFFFFFFF8);
    v38 = (_QWORD *)(((unint64_t)v36 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v37 = *v38;
    v39 = v6 + 8;
    v40 = ((unint64_t)v37 + v39) & v14;
    v41 = ((unint64_t)v38 + v39) & v14;
    v55 = *(void (**)(unint64_t, unint64_t, uint64_t))(v4 + 16);
    v42 = v3;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v55(v40, v41, v42);
    v43 = (_QWORD *)(((unint64_t)v31 + v8) & 0xFFFFFFFFFFFFFFF8);
    v44 = (_QWORD *)(((unint64_t)v30 + v8) & 0xFFFFFFFFFFFFFFF8);
    v45 = v44[1];
    *v43 = *v44;
    v43[1] = v45;
    v46 = (_QWORD *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFFFF8);
    v47 = (_QWORD *)(((unint64_t)v44 + 23) & 0xFFFFFFFFFFFFFFF8);
    v48 = v47[1];
    *v46 = *v47;
    v46[1] = v48;
    v49 = (_QWORD *)(((unint64_t)v46 + 23) & 0xFFFFFFFFFFFFFFF8);
    v50 = (_QWORD *)(((unint64_t)v47 + 23) & 0xFFFFFFFFFFFFFFF8);
    v51 = v50[1];
    *v49 = *v50;
    v49[1] = v51;
    v52 = ((unint64_t)v49 + 23) & 0xFFFFFFFFFFFFFFF8;
    v53 = ((unint64_t)v50 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_OWORD *)v52 = *(_OWORD *)v53;
    *(_QWORD *)(v52 + 16) = *(_QWORD *)(v53 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v13;
}

uint64_t sub_23BFEF838(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1 + 15;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v4 = *(_QWORD *)(a2 + 112);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))((v6+ (((((((((((((((v3 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ (v6 | 7)+ 16) & ~(v6 | 7))+ 55) & 0xFFFFFFFFFFFFFFF8)+ 15) & 0xFFFFFFFFFFFFFFF8)+ 8) & ~v6, v4);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_23BFEF958(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  __int128 v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v47;

  v4 = *a2;
  v3 = (unint64_t)a2 + 15;
  *a1 = v4;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFFF8) + 8);
  *v5 = *(_QWORD *)(v3 & 0xFFFFFFFFFFFFFFF8);
  v5[1] = v6;
  v7 = (_QWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((v3 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_QWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v47 = *(_QWORD *)(a3 + 112);
  v19 = *(_QWORD *)(v47 - 8);
  v20 = *(_DWORD *)(v19 + 80);
  v21 = *(_DWORD *)(v19 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v22 = (_QWORD *)(((unint64_t)v17 + v20 + 16) & v21);
  v23 = (_QWORD *)(((unint64_t)v16 + v20 + 16) & v21);
  *v23 = *v22;
  v24 = ((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  v26 = *(_OWORD *)(v25 + 16);
  *(_OWORD *)v24 = *(_OWORD *)v25;
  *(_OWORD *)(v24 + 16) = v26;
  *(_BYTE *)(v24 + 32) = *(_BYTE *)(v25 + 32);
  v27 = (_QWORD *)(((unint64_t)v23 + 55) & 0xFFFFFFFFFFFFF8);
  v28 = (_QWORD *)(((unint64_t)v22 + 55) & 0xFFFFFFFFFFFFF8);
  *v27 = *v28;
  v29 = (_QWORD *)(((unint64_t)v27 + 15) & 0xFFFFFFFFFFFFFFF8);
  v30 = (_QWORD *)(((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v29 = *v30;
  v31 = ((unint64_t)v29 + v20 + 8) & ~v20;
  v32 = ((unint64_t)v30 + v20 + 8) & ~v20;
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v33(v31, v32, v47);
  v34 = *(_QWORD *)(v19 + 64) + ((v20 + 64) & ~v20) + 7;
  v35 = (_QWORD *)(((unint64_t)v23 + v34) & 0xFFFFFFFFFFFFFFF8);
  v36 = (_QWORD *)(((unint64_t)v22 + v34) & 0xFFFFFFFFFFFFFFF8);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  v38 = (_QWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  v39 = (_QWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  v40 = v39[1];
  *v38 = *v39;
  v38[1] = v40;
  v41 = (_QWORD *)(((unint64_t)v38 + 23) & 0xFFFFFFFFFFFFFFF8);
  v42 = (_QWORD *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  v43 = v42[1];
  *v41 = *v42;
  v41[1] = v43;
  v44 = ((unint64_t)v41 + 23) & 0xFFFFFFFFFFFFFFF8;
  v45 = ((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)v44 = *(_OWORD *)v45;
  *(_QWORD *)(v44 + 16) = *(_QWORD *)(v45 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_23BFEFB98(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;

  v5 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFFF8) + 8);
  *v6 = *(_QWORD *)(v5 & 0xFFFFFFFFFFFFFFF8);
  v6[1] = v7;
  swift_retain();
  swift_release();
  v8 = (_QWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  v9 = (_QWORD *)(((v5 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  v11 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  v17 = (_QWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  v20 = *(_QWORD *)(a3 + 112);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_DWORD *)(v21 + 80);
  v23 = *(_DWORD *)(v21 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v24 = (_QWORD *)(((unint64_t)v18 + v22 + 16) & v23);
  v25 = (_QWORD *)(((unint64_t)v17 + v22 + 16) & v23);
  *v25 = *v24;
  v26 = ((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  v27 = ((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v26 = *(_QWORD *)v27;
  *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
  *(_QWORD *)(v26 + 16) = *(_QWORD *)(v27 + 16);
  *(_QWORD *)(v26 + 24) = *(_QWORD *)(v27 + 24);
  *(_BYTE *)(v26 + 32) = *(_BYTE *)(v27 + 32);
  v28 = (_QWORD *)(((unint64_t)v25 + 55) & 0xFFFFFFFFFFFFF8);
  v29 = (_QWORD *)(((unint64_t)v24 + 55) & 0xFFFFFFFFFFFFF8);
  *v28 = *v29;
  v30 = (_QWORD *)(((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8);
  v31 = (_QWORD *)(((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v30 = *v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v21 + 24))(((unint64_t)v30 + v22 + 8) & ~v22, ((unint64_t)v31 + v22 + 8) & ~v22, v20);
  v32 = *(_QWORD *)(v21 + 64) + ((v22 + 64) & ~v22) + 7;
  v33 = (_QWORD *)(((unint64_t)v25 + v32) & 0xFFFFFFFFFFFFFFF8);
  v34 = (_QWORD *)(((unint64_t)v24 + v32) & 0xFFFFFFFFFFFFFFF8);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  swift_retain();
  swift_release();
  v36 = (_QWORD *)(((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8);
  v37 = (_QWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  swift_retain();
  swift_release();
  v39 = (_QWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  v40 = (_QWORD *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
  v41 = v40[1];
  *v39 = *v40;
  v39[1] = v41;
  swift_retain();
  swift_release();
  v42 = (_QWORD *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  v43 = (_QWORD *)(((unint64_t)v40 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v42 = *v43;
  v42[1] = v43[1];
  v42[2] = v43[2];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_23BFEFE44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  _OWORD *v6;
  _OWORD *v7;
  _OWORD *v8;
  _OWORD *v9;
  _OWORD *v10;
  _OWORD *v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  _OWORD *v29;
  _OWORD *v30;
  _OWORD *v31;
  _OWORD *v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  unint64_t v36;

  *a1 = *a2;
  v4 = (_OWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = (_OWORD *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFF8);
  v7 = (_OWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = (_OWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  v9 = (_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v8 = *v9;
  v10 = (_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFF8);
  *v10 = *v11;
  v12 = (_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  v14 = *(_QWORD *)(*(_QWORD *)(a3 + 112) - 8);
  v15 = *(_DWORD *)(v14 + 80);
  v16 = *(_DWORD *)(v14 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v17 = (_QWORD *)(((unint64_t)v13 + v15 + 16) & v16);
  v18 = (_QWORD *)(((unint64_t)v12 + v15 + 16) & v16);
  *v18 = *v17;
  v19 = ((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8;
  v20 = ((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v21;
  *(_BYTE *)(v19 + 32) = *(_BYTE *)(v20 + 32);
  v22 = (_QWORD *)(((unint64_t)v18 + 55) & 0xFFFFFFFFFFFFF8);
  v23 = (_QWORD *)(((unint64_t)v17 + 55) & 0xFFFFFFFFFFFFF8);
  *v22 = *v23;
  v24 = (_QWORD *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
  v25 = (_QWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v24 = *v25;
  (*(void (**)(unint64_t, unint64_t))(v14 + 32))(((unint64_t)v24 + v15 + 8) & ~v15, ((unint64_t)v25 + v15 + 8) & ~v15);
  v26 = *(_QWORD *)(v14 + 64) + ((v15 + 64) & ~v15) + 7;
  v27 = (_OWORD *)(((unint64_t)v18 + v26) & 0xFFFFFFFFFFFFFFF8);
  v28 = (_OWORD *)(((unint64_t)v17 + v26) & 0xFFFFFFFFFFFFFFF8);
  *v27 = *v28;
  v29 = (_OWORD *)(((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8);
  v30 = (_OWORD *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v29 = *v30;
  v31 = (_OWORD *)(((unint64_t)v29 + 23) & 0xFFFFFFFFFFFFF8);
  v32 = (_OWORD *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFF8);
  *v31 = *v32;
  v33 = ((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  v34 = *(_QWORD *)(v33 + 16);
  v35 = *(_OWORD *)v33;
  v36 = ((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)v36 = v35;
  *(_QWORD *)(v36 + 16) = v34;
  return a1;
}

_QWORD *sub_23BFEFFCC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  _OWORD *v8;
  _OWORD *v9;
  _OWORD *v10;
  _OWORD *v11;
  _OWORD *v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _OWORD *v28;
  unint64_t v29;
  unint64_t v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  __int128 v34;
  _QWORD *v35;

  v5 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = (_OWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *v6 = *(_OWORD *)v5;
  swift_release();
  v7 = (_OWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v5 + 23) & 0xFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_release();
  v9 = (_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  *v9 = *v10;
  swift_release();
  v11 = (_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFF8);
  *v11 = *v12;
  swift_release();
  v13 = (_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_release();
  v15 = *(_QWORD *)(a3 + 112);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = *(_DWORD *)(v16 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v19 = (_QWORD *)(((unint64_t)v14 + v17 + 16) & v18);
  v20 = (_QWORD *)(((unint64_t)v13 + v17 + 16) & v18);
  *v20 = *v19;
  v21 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v22 = ((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
  *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
  *(_QWORD *)(v21 + 24) = *(_QWORD *)(v22 + 24);
  *(_BYTE *)(v21 + 32) = *(_BYTE *)(v22 + 32);
  v23 = (_QWORD *)(((unint64_t)v20 + 55) & 0xFFFFFFFFFFFFF8);
  v24 = (_QWORD *)(((unint64_t)v19 + 55) & 0xFFFFFFFFFFFFF8);
  *v23 = *v24;
  v25 = (_QWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  v26 = (_QWORD *)(((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v25 = *v26;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 40))(((unint64_t)v25 + v17 + 8) & ~v17, ((unint64_t)v26 + v17 + 8) & ~v17, v15);
  v27 = *(_QWORD *)(v16 + 64) + ((v17 + 64) & ~v17) + 7;
  v28 = (_OWORD *)(((unint64_t)v20 + v27) & 0xFFFFFFFFFFFFFFF8);
  v29 = (unint64_t)v19 + v27;
  v30 = (v29 & 0xFFFFFFFFFFFFFFF8) + 23;
  *v28 = *(_OWORD *)(v29 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  v31 = (_OWORD *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8);
  v30 &= 0xFFFFFFFFFFFFF8uLL;
  *v31 = *(_OWORD *)v30;
  swift_release();
  v32 = (_OWORD *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
  v33 = (v30 + 23) & 0xFFFFFFFFFFFFF8;
  v34 = *(_OWORD *)v33;
  v33 += 23;
  *v32 = v34;
  swift_release();
  v35 = (_QWORD *)(((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v35 = *(_QWORD *)(v33 & 0xFFFFFFFFFFFFFFF8);
  v35[1] = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFFF8) + 8);
  v35[2] = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFFF8) + 16);
  swift_release();
  return a1;
}

uint64_t sub_23BFF01FC(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 112) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (v5 >= 0)
    v6 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = v7 | 7;
  if (v6 >= a2)
  {
    if (v6 == 0x7FFFFFFF)
    {
      v13 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))((v7
                                                                    + (((((((((((((((((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8)
                                                                                  + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                                + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                              + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                            + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                          + v8
                                                                          + 16) & ~v8)
                                                                        + 15) & 0xFFFFFFFFFFFFFFF8)
                                                                      + 55) & 0xFFFFFFFFFFFFFFF8)
                                                                    + 8) & ~v7);
    }
  }
  else
  {
    if (((((((((((*(_QWORD *)(v4 + 64) + ((v7 + 64) & ~v7) + ((v7 + 88) & ~v8) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 24) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_23BFF02B8 + 4 * byte_23C0084C0[v11]))();
  }
}

void sub_23BFF0388(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 112) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (v7 >= 0)
    v9 = 0x7FFFFFFF;
  else
    v9 = v8;
  v10 = *(unsigned __int8 *)(v6 + 80);
  if (v9 >= a3)
  {
    v14 = 0;
    if (a2 <= v9)
      goto LABEL_20;
  }
  else
  {
    v11 = a3 - v9;
    if (((((((((*(_DWORD *)(v6 + 64)
               + (((_DWORD)v10 + 88) & ~(v10 | 7))
               + (((_DWORD)v10 + 64) & ~(_DWORD)v10)
               + 7) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFE8)
      v12 = v11 + 1;
    else
      v12 = 2;
    if (v12 >= 0x10000)
      v13 = 4;
    else
      v13 = 2;
    if (v12 < 0x100)
      v13 = 1;
    if (v12 >= 2)
      v14 = v13;
    else
      v14 = 0;
    if (a2 <= v9)
LABEL_20:
      __asm { BR              X16 }
  }
  if (((((((((*(_DWORD *)(v6 + 64)
             + (((_DWORD)v10 + 88) & ~(v10 | 7))
             + (((_DWORD)v10 + 64) & ~(_DWORD)v10)
             + 7) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFE8)
  {
    v15 = ~v9 + a2;
    bzero(a1, ((((((((*(_QWORD *)(v6 + 64) + ((v10 + 88) & ~(v10 | 7)) + ((v10 + 64) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 24);
    *a1 = v15;
  }
  __asm { BR              X10 }
}

void sub_23BFF04C4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23BFF0578);
}

void sub_23BFF04CC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23BFF04D4);
  JUMPOUT(0x23BFF0578);
}

void sub_23BFF0554()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23BFF0578);
}

void sub_23BFF055C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23BFF0578);
}

uint64_t sub_23BFF0564@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_WORD *)(v8 + v9) = 0;
  if (!a1)
    JUMPOUT(0x23BFF0578);
  if (v6 == 0x7FFFFFFF)
  {
    if ((a1 & 0x80000000) == 0)
      JUMPOUT(0x23BFF0574);
    JUMPOUT(0x23BFF0570);
  }
  return (*(uint64_t (**)(unint64_t))(v3 + 56))((v4
                                                                + ((((((((((((((((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                            + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                          + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                        + 23) & 0xFFFFFFFFFFFFFFF8)
                                                                      + v5
                                                                      + 16) & v7)
                                                                    + 15) & 0xFFFFFFFFFFFFFFF8)
                                                                  + 55) & 0xFFFFFFFFFFFFFFF8)
                                                                + 8) & a2);
}

void sub_23BFF0590()
{
  type metadata accessor for CanvasItemDescriptor();
}

void sub_23BFF0670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,unint64_t a32)
{
  unint64_t v32;
  uint64_t v33;

  v33 = MEMORY[0x242615198](&protocol conformance descriptor for CanvasItemDescriptor<A, B, C, D, E, F>, a1);
  STACK[0x200] = v32;
  STACK[0x208] = a14;
  STACK[0x210] = a32;
  STACK[0x218] = a21;
  STACK[0x220] = a25;
  STACK[0x228] = a26;
  STACK[0x230] = v33;
  type metadata accessor for CarouselView();
}

void sub_23BFF0700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, unint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25,unint64_t a26,uint64_t a27,unint64_t a28,unint64_t a29,uint64_t a30,uint64_t a31,unint64_t a32,uint64_t a33,unint64_t a34,uint64_t a35,uint64_t a36,unint64_t a37,uint64_t a38,unint64_t a39)
{
  unint64_t v39;

  STACK[0x200] = a39;
  STACK[0x208] = a28;
  STACK[0x210] = a29;
  STACK[0x218] = v39;
  STACK[0x220] = a37;
  STACK[0x228] = a32;
  STACK[0x230] = a18;
  STACK[0x238] = a20;
  STACK[0x240] = a25;
  STACK[0x248] = a26;
  STACK[0x250] = a34;
  type metadata accessor for HorizontalGridView();
}

void sub_23BFF0790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unint64_t a28,unint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unint64_t a34,uint64_t a35,uint64_t a36,unint64_t a37,uint64_t a38,unint64_t a39)
{
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  STACK[0x200] = a39;
  STACK[0x208] = a28;
  STACK[0x210] = a29;
  STACK[0x218] = a14;
  STACK[0x220] = a37;
  STACK[0x228] = v42;
  STACK[0x230] = v41;
  STACK[0x238] = a20;
  STACK[0x240] = v39;
  STACK[0x248] = v40;
  STACK[0x250] = a34;
  type metadata accessor for VerticalGridView();
}

void sub_23BFF0818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,unint64_t a32,uint64_t a33,unint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unint64_t a39)
{
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;

  sub_23BFF8968();
  sub_23BFF8968();
  STACK[0x200] = a39;
  STACK[0x208] = v40;
  STACK[0x210] = v39;
  STACK[0x218] = v43;
  STACK[0x220] = v41;
  STACK[0x228] = a32;
  STACK[0x230] = a18;
  STACK[0x238] = v42;
  STACK[0x240] = a25;
  STACK[0x248] = a26;
  STACK[0x250] = a34;
  type metadata accessor for ListView();
}

void sub_23BFF08D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unint64_t a28,unint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unint64_t a37,uint64_t a38,unint64_t a39)
{
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;

  STACK[0x200] = a39;
  STACK[0x208] = a28;
  STACK[0x210] = a29;
  STACK[0x218] = v45;
  STACK[0x220] = a37;
  STACK[0x228] = v39;
  STACK[0x230] = v41;
  STACK[0x238] = v44;
  STACK[0x240] = v42;
  STACK[0x248] = v43;
  STACK[0x250] = v40;
  type metadata accessor for OrthogonalView();
}

uint64_t sub_23BFF0964(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = sub_23BFF8968();
  v3 = sub_23BFF8968();
  v4 = sub_23BFF8968();
  v5 = MEMORY[0x242615198](&protocol conformance descriptor for CarouselView<A, B, C, D, E, F, G, H, I, J, K, L, M>);
  v34[0] = MEMORY[0x242615198](&protocol conformance descriptor for HorizontalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>);
  v34[1] = MEMORY[0x242615198](&protocol conformance descriptor for VerticalGridView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>);
  v6 = MEMORY[0x24BDEF3E0];
  v33[0] = v5;
  v33[1] = MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v24, v34);
  v7 = MEMORY[0x242615198](v6, v23, v33);
  v32[0] = MEMORY[0x242615198](&protocol conformance descriptor for ListView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>);
  v32[1] = MEMORY[0x242615198](&protocol conformance descriptor for OrthogonalView<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>, a1);
  v31[0] = v7;
  v31[1] = MEMORY[0x242615198](v6, v2, v32);
  v8 = MEMORY[0x242615198](v6, v3, v31);
  v30[0] = MEMORY[0x24BDF5138];
  v30[1] = v8;
  v9 = MEMORY[0x242615198](v6, v4, v30);
  v35 = v4;
  v36 = v9;
  MEMORY[0x24261512C](255, &v35, MEMORY[0x24BEC6710], 0);
  v10 = sub_23BFF8968();
  v35 = v4;
  v36 = v9;
  v29[0] = swift_getOpaqueTypeConformance2();
  v29[1] = v9;
  v11 = MEMORY[0x242615198](v6, v10, v29);
  v35 = v10;
  v36 = v11;
  MEMORY[0x24261512C](255, &v35, MEMORY[0x24BE351A0], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C28);
  v12 = sub_23BFF862C();
  sub_23BFF8968();
  sub_23BFF96A0();
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C30);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C38);
  v14 = sub_23BFF8968();
  v15 = sub_23BEA1F94(&qword_256AE8C40, &qword_256AE8C30, MEMORY[0x24BEE12D8]);
  v35 = v13;
  v36 = MEMORY[0x24BEE0D00];
  v37 = v14;
  v38 = v15;
  v39 = MEMORY[0x24BEE0D10];
  v16 = sub_23BFF910C();
  v17 = sub_23BFF1354(&qword_256AE8C48, &qword_256AE8C38, MEMORY[0x24BDEBEE0]);
  v35 = v10;
  v36 = v11;
  v28[0] = swift_getOpaqueTypeConformance2();
  v28[1] = sub_23BEA1F94(&qword_256AE8C50, &qword_256AE8C28, MEMORY[0x24BDF1028]);
  v18 = MEMORY[0x24BDED308];
  v27[0] = v17;
  v27[1] = MEMORY[0x242615198](MEMORY[0x24BDED308], v12, v28);
  v26 = MEMORY[0x242615198](v6, v14, v27);
  MEMORY[0x242615198](MEMORY[0x24BDF4A08], v16, &v26);
  sub_23BFF8428();
  swift_getTupleTypeMetadata2();
  v19 = sub_23BFF9220();
  MEMORY[0x242615198](MEMORY[0x24BDF5428], v19);
  v20 = sub_23BFF90C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8C58);
  v21 = sub_23BFF862C();
  v25[0] = MEMORY[0x242615198](MEMORY[0x24BDF4750], v20);
  v25[1] = sub_23BEA1F94(qword_256AE8C70, &qword_256AE8C58, MEMORY[0x24BDEF370]);
  return MEMORY[0x242615198](v18, v21, v25);
}

void sub_23BFF0D48()
{
  type metadata accessor for CanvasContainerView();
}

#error "23BFF0EE8: call analysis failed (funcsize=40)"

uint64_t sub_23BFF0F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void objectdestroy_3Tm_0()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFF1008()
{
  sub_23BFF8500();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for CanvasLayout();
}

uint64_t sub_23BFF10BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4 + *(int *)(a1 + 68), v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2 + v6, v3);
  return swift_deallocObject();
}

void sub_23BFF1154()
{
  type metadata accessor for CanvasContainerView();
}

#error "23BFF1330: call analysis failed (funcsize=50)"

uint64_t sub_23BFF1354(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = MEMORY[0x24BDF3E20];
    v7[1] = a3;
    result = MEMORY[0x242615198](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23BFF13B0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256AE8D00;
  if (!qword_256AE8D00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE8CF8);
    v2 = sub_23BEA1BB8((unint64_t *)&qword_256AE6DB0, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD830]);
    result = MEMORY[0x242615198](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256AE8D00);
  }
  return result;
}

void sub_23BFF142C()
{
  sub_23BFF1438((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23BFEC22C);
}

void sub_23BFF1438(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;

  v2 = *(_OWORD *)(v1 + 232);
  v3 = *(_OWORD *)(v1 + 248);
  a1(*(_QWORD *)(v1 + 272), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 152),
    *(_QWORD *)(v1 + 160),
    *(_QWORD *)(v1 + 168),
    *(_QWORD *)(v1 + 176),
    *(_QWORD *)(v1 + 184),
    *(_QWORD *)(v1 + 192),
    *(_QWORD *)(v1 + 200),
    *(_QWORD *)(v1 + 208),
    *(_QWORD *)(v1 + 216),
    *(_QWORD *)(v1 + 224),
    v2,
    *((_QWORD *)&v2 + 1),
    v3,
    *((_QWORD *)&v3 + 1),
    *(_QWORD *)(v1 + 264));
  JUMPOUT(0x23BFF14ACLL);
}

void sub_23BFF14BC()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFF15C8()
{
  sub_23BFECDE0();
}

void sub_23BFF1694()
{
  sub_23BFF16B0();
}

void sub_23BFF16A4()
{
  sub_23BFF16B0();
}

void sub_23BFF16B0()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF17B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, unint64_t, _QWORD);

  v2 = *(_QWORD *)(a1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 272) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return v6(v5, v1 + v3, *(_QWORD *)(v1 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8)));
}

void sub_23BFF18A0()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF1914(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 272) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v2 + v6 + 8))(v3, v1, v4, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

void objectdestroy_12Tm_0()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFF1A1C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for CanvasLayout();
}

uint64_t sub_23BFF1AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v2 + *(int *)(a1 + 68), v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23BFF1B34()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF1BA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 272) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v2 + v6 + 56))(v3, v1, v4, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

void sub_23BFF1C0C()
{
  sub_23BFF1C28();
}

void sub_23BFF1C1C()
{
  sub_23BFF1C28();
}

void sub_23BFF1C28()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF1D2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v5(v4, v1 + ((v2 + 272) & ~v2));
}

void sub_23BFF1DF0()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFF1ECC()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF1F84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)())(v2 + *(int *)(a1 + 308) + v1))();
}

void sub_23BFF1FC0()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF2034(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v2 + ((v5 + 272) & ~v5) + 8))(v3, v1, v4, 0);
}

void sub_23BFF2080()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF20E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return (*(uint64_t (**)(uint64_t))(v2 + ((v3 + 272) & ~v3) + 40))(v1);
}

void objectdestroyTm_14()
{
  type metadata accessor for CanvasContainerView();
}

void sub_23BFF21C8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for CanvasLayout();
}

uint64_t sub_23BFF2250(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v2 + *(int *)(a1 + 68), v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23BFF22D4()
{
  type metadata accessor for CanvasContainerView();
}

uint64_t sub_23BFF2348(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v2 + ((v5 + 272) & ~v5) + 56))(v3, v1, v4, 0);
}

BOOL static VerticalStackHorizontalAlignment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23BFF23A8()
{
  sub_23BFF270C();
  return sub_23BFF9A30();
}

uint64_t sub_23BFF23D0()
{
  sub_23BFF270C();
  return sub_23BFF9A3C();
}

uint64_t sub_23BFF23F8()
{
  _BYTE *v0;

  if (*v0)
    return 0x7265746E6563;
  else
    return 0x676E696461656CLL;
}

uint64_t sub_23BFF2430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFF2EC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFF2454()
{
  sub_23BFF26C8();
  return sub_23BFF9A30();
}

uint64_t sub_23BFF247C()
{
  sub_23BFF26C8();
  return sub_23BFF9A3C();
}

uint64_t sub_23BFF24A4()
{
  sub_23BFF2750();
  return sub_23BFF9A30();
}

uint64_t sub_23BFF24CC()
{
  sub_23BFF2750();
  return sub_23BFF9A3C();
}

uint64_t VerticalStackHorizontalAlignment.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8D08);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8D10);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8D18);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFF26C8();
  sub_23BFF9A18();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23BFF270C();
    sub_23BFF98EC();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23BFF2750();
    sub_23BFF98EC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23BFF26C8()
{
  unint64_t result;

  result = qword_256AE8D20;
  if (!qword_256AE8D20)
  {
    result = MEMORY[0x242615198](&unk_23C0088DC, &type metadata for VerticalStackHorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D20);
  }
  return result;
}

unint64_t sub_23BFF270C()
{
  unint64_t result;

  result = qword_256AE8D28;
  if (!qword_256AE8D28)
  {
    result = MEMORY[0x242615198](&unk_23C00888C, &type metadata for VerticalStackHorizontalAlignment.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D28);
  }
  return result;
}

unint64_t sub_23BFF2750()
{
  unint64_t result;

  result = qword_256AE8D30;
  if (!qword_256AE8D30)
  {
    result = MEMORY[0x242615198](&unk_23C00883C, &type metadata for VerticalStackHorizontalAlignment.LeadingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D30);
  }
  return result;
}

uint64_t VerticalStackHorizontalAlignment.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8D38);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8D40);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8D48);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFF26C8();
  v11 = v33;
  sub_23BFF9A0C();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23BFF98D4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23BFF9784();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256AE3978);
    *v21 = &type metadata for VerticalStackHorizontalAlignment;
    sub_23BFF9874();
    sub_23BFF9778();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23BFF270C();
    sub_23BFF9868();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23BFF2750();
    v22 = v6;
    sub_23BFF9868();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_23BFF2AEC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return VerticalStackHorizontalAlignment.init(from:)(a1, a2);
}

uint64_t sub_23BFF2B00(_QWORD *a1)
{
  return VerticalStackHorizontalAlignment.encode(to:)(a1);
}

uint64_t VerticalStackHorizontalAlignment.hash(into:)()
{
  return sub_23BFF99DC();
}

uint64_t VerticalStackHorizontalAlignment.hashValue.getter()
{
  sub_23BFF99D0();
  sub_23BFF99DC();
  return sub_23BFF9A00();
}

unint64_t sub_23BFF2B84()
{
  unint64_t result;

  result = qword_256AE8D50;
  if (!qword_256AE8D50)
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for VerticalStackHorizontalAlignment, &type metadata for VerticalStackHorizontalAlignment);
    atomic_store(result, (unint64_t *)&qword_256AE8D50);
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalStackHorizontalAlignment()
{
  return &type metadata for VerticalStackHorizontalAlignment;
}

uint64_t _s15FitnessCanvasUI32VerticalStackHorizontalAlignmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BFF2C28 + 4 * byte_23C0085A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BFF2C5C + 4 * byte_23C0085A0[v4]))();
}

uint64_t sub_23BFF2C5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF2C64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFF2C6CLL);
  return result;
}

uint64_t sub_23BFF2C78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFF2C80);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BFF2C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF2C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VerticalStackHorizontalAlignment.CodingKeys()
{
  return &type metadata for VerticalStackHorizontalAlignment.CodingKeys;
}

ValueMetadata *type metadata accessor for VerticalStackHorizontalAlignment.LeadingCodingKeys()
{
  return &type metadata for VerticalStackHorizontalAlignment.LeadingCodingKeys;
}

ValueMetadata *type metadata accessor for VerticalStackHorizontalAlignment.CenterCodingKeys()
{
  return &type metadata for VerticalStackHorizontalAlignment.CenterCodingKeys;
}

unint64_t sub_23BFF2CCC()
{
  unint64_t result;

  result = qword_256AE8D58;
  if (!qword_256AE8D58)
  {
    result = MEMORY[0x242615198](&unk_23C008814, &type metadata for VerticalStackHorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D58);
  }
  return result;
}

unint64_t sub_23BFF2D14()
{
  unint64_t result;

  result = qword_256AE8D60;
  if (!qword_256AE8D60)
  {
    result = MEMORY[0x242615198](&unk_23C008734, &type metadata for VerticalStackHorizontalAlignment.LeadingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D60);
  }
  return result;
}

unint64_t sub_23BFF2D5C()
{
  unint64_t result;

  result = qword_256AE8D68;
  if (!qword_256AE8D68)
  {
    result = MEMORY[0x242615198](&unk_23C00875C, &type metadata for VerticalStackHorizontalAlignment.LeadingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D68);
  }
  return result;
}

unint64_t sub_23BFF2DA4()
{
  unint64_t result;

  result = qword_256AE8D70;
  if (!qword_256AE8D70)
  {
    result = MEMORY[0x242615198](&unk_23C0086E4, &type metadata for VerticalStackHorizontalAlignment.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D70);
  }
  return result;
}

unint64_t sub_23BFF2DEC()
{
  unint64_t result;

  result = qword_256AE8D78;
  if (!qword_256AE8D78)
  {
    result = MEMORY[0x242615198](&unk_23C00870C, &type metadata for VerticalStackHorizontalAlignment.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D78);
  }
  return result;
}

unint64_t sub_23BFF2E34()
{
  unint64_t result;

  result = qword_256AE8D80;
  if (!qword_256AE8D80)
  {
    result = MEMORY[0x242615198](&unk_23C008784, &type metadata for VerticalStackHorizontalAlignment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8D80);
  }
  return result;
}

unint64_t sub_23BFF2E7C()
{
  unint64_t result;

  result = qword_256AE8D88[0];
  if (!qword_256AE8D88[0])
  {
    result = MEMORY[0x242615198](&unk_23C0087AC, &type metadata for VerticalStackHorizontalAlignment.CodingKeys);
    atomic_store(result, qword_256AE8D88);
  }
  return result;
}

uint64_t sub_23BFF2EC0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x676E696461656CLL && a2 == 0xE700000000000000;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746E6563 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

BOOL static CanvasHorizontalGridLayout.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  char v33;
  char *v34;
  BOOL v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  double v38;
  char *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = a2;
  v46 = *(_QWORD *)(a3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v44 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v45 = (char *)&v43 - v7;
  v43 = v8;
  v10 = type metadata accessor for CanvasHorizontalGridLayout(0, v9, v8, v8);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v43 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v19 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v21 = (char *)&v43 - v20;
  v22 = (double *)((char *)&v43 + *(int *)(v19 + 48) - v20);
  v47 = v11;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v23((char *)&v43 - v20, a1, v10);
  v23((char *)v22, v48, v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23(v14, (uint64_t)v21, v10);
    v24 = *(int *)(swift_getTupleTypeMetadata2() + 48);
    v25 = &v14[v24];
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = *(_QWORD *)v14;
      v27 = *(_QWORD *)v22;
      v28 = (char *)v22 + v24;
      v30 = v45;
      v29 = v46;
      v31 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      v31(v45, v25, a3);
      v32 = v44;
      v31(v44, v28, a3);
      if (v26 == v27)
      {
        v33 = sub_23BFF93AC();
        v34 = v32;
        v35 = v33;
        v36 = *(void (**)(char *, uint64_t))(v29 + 8);
        v36(v34, a3);
        v36(v30, a3);
LABEL_17:
        v18 = v47;
        TupleTypeMetadata2 = v10;
        goto LABEL_18;
      }
      v40 = v32;
      v41 = *(void (**)(char *, uint64_t))(v29 + 8);
      v41(v40, a3);
      v41(v30, a3);
LABEL_16:
      v35 = 0;
      goto LABEL_17;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(&v14[v24], a3);
  }
  else
  {
    v23(v16, (uint64_t)v21, v10);
    v37 = *((_QWORD *)v16 + 1);
    v38 = *((double *)v16 + 2);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (*(_QWORD *)v16 == *(_QWORD *)v22)
      {
        v35 = v38 == v22[2] && v37 == *((_QWORD *)v22 + 1);
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  v35 = 0;
LABEL_18:
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, TupleTypeMetadata2);
  return v35;
}

uint64_t type metadata accessor for CanvasHorizontalGridLayout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CanvasHorizontalGridLayout);
}

uint64_t CanvasHorizontalGridLayout.rowCount.getter(uint64_t a1)
{
  __n128 v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;

  v2 = MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v5 + 16))(v4, v2);
  if (swift_getEnumCaseMultiPayload() != 1)
    return *((_QWORD *)v4 + 1);
  v6 = *(_QWORD *)v4;
  v7 = *(_QWORD *)(a1 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(&v4[*(int *)(TupleTypeMetadata2 + 48)], v7);
  return v6;
}

uint64_t sub_23BFF3388(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D6F74737563 && a2 == 0xE600000000000000;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x46797469736E6564 && a2 == 0xED0000726F746361)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23BFF3494(char a1)
{
  if ((a1 & 1) != 0)
    return 0x46797469736E6564;
  else
    return 0x6D6F74737563;
}

uint64_t sub_23BFF34D4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6F436E6D756C6F63 && a2 == 0xEB00000000746E75;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E756F43776F72 && a2 == 0xE800000000000000 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E6963617073 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23BFF3640(char a1)
{
  if (!a1)
    return 0x6F436E6D756C6F63;
  if (a1 == 1)
    return 0x746E756F43776F72;
  return 0x676E6963617073;
}

uint64_t sub_23BFF36A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E756F43776F72 && a2 == 0xE800000000000000;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x46797469736E6564 && a2 == 0xED0000726F746361)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23BFF37B4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x46797469736E6564;
  else
    return 0x746E756F43776F72;
}

uint64_t sub_23BFF37F8()
{
  char *v0;

  return sub_23BFF3494(*v0);
}

uint64_t sub_23BFF3808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFF3388(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFF3834(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008D30, a1);
  return sub_23BFF9A30();
}

uint64_t sub_23BFF3868(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008D30, a1);
  return sub_23BFF9A3C();
}

uint64_t sub_23BFF389C()
{
  char *v0;

  return sub_23BFF3640(*v0);
}

uint64_t sub_23BFF38A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFF34D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFF38D4(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008D80, a1);
  return sub_23BFF9A30();
}

uint64_t sub_23BFF3908(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008D80, a1);
  return sub_23BFF9A3C();
}

uint64_t sub_23BFF393C()
{
  char *v0;

  return sub_23BFF37B4(*v0);
}

uint64_t sub_23BFF394C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFF36A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFF3978(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008DD0, a1);
  return sub_23BFF9A30();
}

uint64_t sub_23BFF39AC(uint64_t a1)
{
  MEMORY[0x242615198](&unk_23C008DD0, a1);
  return sub_23BFF9A3C();
}

uint64_t CanvasHorizontalGridLayout.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t TupleTypeMetadata2;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char v56;
  uint64_t v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = type metadata accessor for CanvasHorizontalGridLayout.DensityFactorCodingKeys(255, v6, v7, a4);
  v45 = MEMORY[0x242615198](&unk_23C008DD0, v8);
  v46 = v8;
  v49 = sub_23BFF994C();
  v39 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v55 = (char *)&v38 - v9;
  v44 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for CanvasHorizontalGridLayout.CustomCodingKeys(255, v6, v7, v12);
  v41 = MEMORY[0x242615198](&unk_23C008D80, v13);
  v42 = v13;
  v47 = sub_23BFF994C();
  v40 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v43 = (char *)&v38 - v14;
  v15 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = v6;
  v38 = v7;
  v20 = type metadata accessor for CanvasHorizontalGridLayout.CodingKeys(255, v6, v7, v19);
  MEMORY[0x242615198](&unk_23C008D30, v20);
  v21 = sub_23BFF994C();
  v51 = *(_QWORD *)(v21 - 8);
  v52 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v38 - v22;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFF9A18();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v54, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = v50;
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    v26 = v44;
    v27 = v48;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v48, &v18[*(int *)(TupleTypeMetadata2 + 48)], v24);
    v63 = 1;
    v28 = v52;
    sub_23BFF98EC();
    v62 = 0;
    v29 = v49;
    v30 = v53;
    sub_23BFF9934();
    if (!v30)
    {
      v61 = 1;
      sub_23BFF9940();
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v55, v29);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v23, v28);
  }
  else
  {
    v32 = v40;
    v33 = *((_QWORD *)v18 + 2);
    v60 = 0;
    v34 = v43;
    v35 = v52;
    sub_23BFF98EC();
    v59 = 0;
    v36 = v47;
    v37 = v53;
    sub_23BFF9934();
    if (!v37)
    {
      v58 = 1;
      sub_23BFF9934();
      v57 = v33;
      v56 = 2;
      sub_23BEBFC1C();
      sub_23BFF9940();
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v23, v35);
  }
}

uint64_t type metadata accessor for CanvasHorizontalGridLayout.DensityFactorCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CanvasHorizontalGridLayout.DensityFactorCodingKeys);
}

uint64_t type metadata accessor for CanvasHorizontalGridLayout.CustomCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CanvasHorizontalGridLayout.CustomCodingKeys);
}

uint64_t type metadata accessor for CanvasHorizontalGridLayout.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CanvasHorizontalGridLayout.CodingKeys);
}

uint64_t CanvasHorizontalGridLayout.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t *, uint64_t);
  char *v56;
  __int128 v57;
  uint64_t *v58;
  uint64_t v59;
  char *v60;
  uint64_t *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  char *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  char v84;

  v62 = a5;
  v8 = type metadata accessor for CanvasHorizontalGridLayout.DensityFactorCodingKeys(255, a2, a3, a4);
  v71 = MEMORY[0x242615198](&unk_23C008DD0, v8);
  v72 = v8;
  v68 = sub_23BFF98E0();
  v66 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v74 = (char *)&v57 - v9;
  v11 = type metadata accessor for CanvasHorizontalGridLayout.CustomCodingKeys(255, a2, a3, v10);
  v69 = MEMORY[0x242615198](&unk_23C008D80, v11);
  v70 = v11;
  v67 = sub_23BFF98E0();
  v65 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v73 = (char *)&v57 - v12;
  v14 = type metadata accessor for CanvasHorizontalGridLayout.CodingKeys(255, a2, a3, v13);
  MEMORY[0x242615198](&unk_23C008D30, v14);
  v77 = sub_23BFF98E0();
  v75 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v16 = (char *)&v57 - v15;
  v64 = a2;
  v63 = a3;
  v76 = type metadata accessor for CanvasHorizontalGridLayout(0, a2, a3, v17);
  v18 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v20 = (uint64_t *)((char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v21);
  v23 = (uint64_t *)((char *)&v57 - v22);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v57 - v25;
  v27 = a1[3];
  v78 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v27);
  v28 = v79;
  sub_23BFF9A0C();
  if (!v28)
  {
    v61 = v20;
    v58 = v23;
    v59 = v18;
    v60 = v26;
    v30 = v76;
    v29 = v77;
    v79 = v16;
    *(_QWORD *)&v80 = sub_23BFF98D4();
    v31 = sub_23BFF94C0();
    MEMORY[0x242615198](MEMORY[0x24BEE12C8], v31);
    *(_QWORD *)&v82 = sub_23BFF96DC();
    *((_QWORD *)&v82 + 1) = v32;
    *(_QWORD *)&v83 = v33;
    *((_QWORD *)&v83 + 1) = v34;
    v35 = sub_23BFF96D0();
    MEMORY[0x242615198](MEMORY[0x24BEE2190], v35);
    sub_23BFF9634();
    v36 = v80;
    v37 = v29;
    if (v80 == 2 || (v57 = v82, v80 = v82, v81 = v83, (sub_23BFF964C() & 1) == 0))
    {
      v41 = sub_23BFF9784();
      swift_allocError();
      v43 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256AE3978);
      *v43 = v30;
      v44 = v79;
      sub_23BFF9874();
      sub_23BFF9778();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v43, *MEMORY[0x24BEE26D0], v41);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v44, v37);
    }
    else
    {
      if ((v36 & 1) != 0)
      {
        LOBYTE(v80) = 1;
        v45 = v74;
        sub_23BFF9868();
        LOBYTE(v80) = 0;
        v46 = v68;
        v47 = sub_23BFF98BC();
        swift_getTupleTypeMetadata2();
        v48 = v61;
        *v61 = v47;
        LOBYTE(v80) = 1;
        sub_23BFF98C8();
        (*(void (**)(char *, uint64_t))(v66 + 8))(v45, v46);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v37);
        v54 = v30;
        swift_storeEnumTagMultiPayload();
        v55 = *(void (**)(char *, uint64_t *, uint64_t))(v59 + 32);
        v56 = v60;
        v55(v60, v48, v30);
      }
      else
      {
        LOBYTE(v80) = 0;
        v38 = v73;
        sub_23BFF9868();
        LOBYTE(v80) = 0;
        v39 = v67;
        v40 = sub_23BFF98BC();
        LOBYTE(v80) = 1;
        v50 = sub_23BFF98BC();
        v84 = 2;
        sub_23BEC0384();
        sub_23BFF98C8();
        v51 = v75;
        (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v39);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v51 + 8))(v79, v37);
        v52 = v80;
        v53 = v58;
        *v58 = v40;
        v53[1] = v50;
        v53[2] = v52;
        v54 = v30;
        swift_storeEnumTagMultiPayload();
        v55 = *(void (**)(char *, uint64_t *, uint64_t))(v59 + 32);
        v56 = v60;
        v55(v60, v53, v30);
      }
      v55(v62, (uint64_t *)v56, v54);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
}

uint64_t sub_23BFF4568@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, char *a4@<X8>)
{
  return CanvasHorizontalGridLayout.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3, a4);
}

uint64_t sub_23BFF4584(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return CanvasHorizontalGridLayout.encode(to:)(a1, a2, a3, a4);
}

uint64_t CanvasHorizontalGridLayout.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t TupleTypeMetadata2;
  uint64_t v14;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v11, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, &v9[*(int *)(TupleTypeMetadata2 + 48)], v3);
    sub_23BFF99DC();
    sub_23BFF99DC();
    sub_23BFF9388();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    sub_23BFF99DC();
    sub_23BFF99DC();
    sub_23BFF99DC();
    return sub_23BFF99F4();
  }
}

uint64_t CanvasHorizontalGridLayout.hashValue.getter(uint64_t a1)
{
  _BYTE v3[72];

  sub_23BFF99D0();
  CanvasHorizontalGridLayout.hash(into:)((uint64_t)v3, a1);
  return sub_23BFF9A00();
}

uint64_t sub_23BFF4748(uint64_t a1, uint64_t a2)
{
  _BYTE v4[72];

  sub_23BFF99D0();
  CanvasHorizontalGridLayout.hash(into:)((uint64_t)v4, a2);
  return sub_23BFF9A00();
}

void sub_23BFF4788()
{
  JUMPOUT(0x242615198);
}

BOOL sub_23BFF4798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static CanvasHorizontalGridLayout.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16));
}

uint64_t sub_23BFF47A4()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  v2[4] = &unk_23C008A60;
  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_23BFF4830(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v11;
  unsigned int v12;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = v5;
  if (((v6 + 8) & (unint64_t)~v6) + *(_QWORD *)(v4 + 64) <= 0x18)
    v7 = 24;
  else
    v7 = ((v5 + 8) & ~(unint64_t)v5) + *(_QWORD *)(v4 + 64);
  v8 = v5 & 0x100000;
  if (v6 > 7 || v8 != 0 || v7 + 1 > 0x18)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v12 = *((unsigned __int8 *)a2 + v7);
    if (v12 >= 2)
      v12 = *(_DWORD *)a2 + 2;
    if (v12 == 1)
    {
      *a1 = *a2;
      (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v6 + 8) & ~v6, ((unint64_t)a2 + v6 + 8) & ~v6);
      *((_BYTE *)v3 + v7) = 1;
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
      *((_BYTE *)a1 + v7) = 0;
    }
  }
  return v3;
}

uint64_t sub_23BFF4920(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = ((v3 + 8) & ~v3) + *(_QWORD *)(v2 + 64);
  if (v4 <= 0x18)
    v4 = 24;
  v5 = *(unsigned __int8 *)(result + v4);
  if (v5 < 2)
  {
    if (v5 == 1)
      return (*(uint64_t (**)(uint64_t))(v2 + 8))((result + v3 + 8) & ~v3);
  }
  else
  {
    if (v4 <= 3)
      v6 = v4;
    else
      v6 = 4;
    return ((uint64_t (*)(void))((char *)&loc_23BFF4978 + 4 * byte_23C008930[v6]))();
  }
  return result;
}

_QWORD *sub_23BFF49DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  if (((v5 + 8) & (unint64_t)~v5) + *(_QWORD *)(v4 + 64) <= 0x18)
    v6 = 24;
  else
    v6 = ((v5 + 8) & ~v5) + *(_QWORD *)(v4 + 64);
  v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X14 }
  }
  if (v7 == 1)
  {
    *a1 = *a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 8) & ~v5, ((unint64_t)a2 + v5 + 8) & ~v5);
    v9 = 1;
  }
  else
  {
    v9 = 0;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
  }
  *((_BYTE *)a1 + v6) = v9;
  return a1;
}

_QWORD *sub_23BFF4AE8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  char v14;
  __int128 v15;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(unsigned __int8 *)(v6 + 80);
    if (((v7 + 8) & (unint64_t)~v7) + *(_QWORD *)(v6 + 64) <= 0x18)
      v8 = 24;
    else
      v8 = ((v7 + 8) & ~v7) + *(_QWORD *)(v6 + 64);
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2)
    {
      if (v8 <= 3)
        v10 = v8;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    v11 = ~v7;
    if (v9 == 1)
      (*(void (**)(unint64_t, _QWORD))(v6 + 8))(((unint64_t)a1 + v7 + 8) & v11, *(_QWORD *)(a3 + 16));
    v12 = *((unsigned __int8 *)a2 + v8);
    if (v12 >= 2)
    {
      if (v8 <= 3)
        v13 = v8;
      else
        v13 = 4;
      __asm { BR              X12 }
    }
    if (v12 == 1)
    {
      *a1 = *a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(((unint64_t)a1 + v7 + 8) & v11, ((unint64_t)a2 + v7 + 8) & v11, v5);
      v14 = 1;
    }
    else
    {
      v14 = 0;
      v15 = *(_OWORD *)a2;
      a1[2] = a2[2];
      *(_OWORD *)a1 = v15;
    }
    *((_BYTE *)a1 + v8) = v14;
  }
  return a1;
}

_QWORD *sub_23BFF4CAC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  if (((v5 + 8) & (unint64_t)~v5) + *(_QWORD *)(v4 + 64) <= 0x18)
    v6 = 24;
  else
    v6 = ((v5 + 8) & ~v5) + *(_QWORD *)(v4 + 64);
  v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X14 }
  }
  if (v7 == 1)
  {
    *a1 = *a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + v5 + 8) & ~v5, ((unint64_t)a2 + v5 + 8) & ~v5);
    v9 = 1;
  }
  else
  {
    v9 = 0;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
  }
  *((_BYTE *)a1 + v6) = v9;
  return a1;
}

_QWORD *sub_23BFF4DB8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  char v14;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(unsigned __int8 *)(v6 + 80);
    if (((v7 + 8) & (unint64_t)~v7) + *(_QWORD *)(v6 + 64) <= 0x18)
      v8 = 24;
    else
      v8 = ((v7 + 8) & ~v7) + *(_QWORD *)(v6 + 64);
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2)
    {
      if (v8 <= 3)
        v10 = v8;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    v11 = ~v7;
    if (v9 == 1)
      (*(void (**)(unint64_t, _QWORD))(v6 + 8))(((unint64_t)a1 + v7 + 8) & v11, *(_QWORD *)(a3 + 16));
    v12 = *((unsigned __int8 *)a2 + v8);
    if (v12 >= 2)
    {
      if (v8 <= 3)
        v13 = v8;
      else
        v13 = 4;
      __asm { BR              X12 }
    }
    if (v12 == 1)
    {
      *a1 = *a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))(((unint64_t)a1 + v7 + 8) & v11, ((unint64_t)a2 + v7 + 8) & v11, v5);
      v14 = 1;
    }
    else
    {
      v14 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
    }
    *((_BYTE *)a1 + v8) = v14;
  }
  return a1;
}

uint64_t sub_23BFF4F7C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 24;
  if (((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x18)
    v3 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
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
  return ((uint64_t (*)(void))((char *)&loc_23BFF5050 + 4 * byte_23C008953[(v4 - 1)]))();
}

void sub_23BFF509C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x18)
    v5 = 24;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
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

uint64_t sub_23BFF5254(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 24;
  if (((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x18)
    v2 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_23BFF52AC + 4 * byte_23C008961[v3]))();
}

void sub_23BFF52F4(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v4 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    if (v4 <= 0x18)
      v5 = 24;
    else
      v5 = ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
         + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
    v6 = a2 - 2;
    if (v5 < 4)
    {
      v7 = v6 >> (8 * v5);
      v8 = v6 & ~(-1 << (8 * v5));
      a1[v5] = v7 + 2;
      bzero(a1, v5);
      if ((_DWORD)v5 == 3)
      {
        *(_WORD *)a1 = v8;
        a1[2] = BYTE2(v8);
      }
      else if ((_DWORD)v5 == 2)
      {
        *(_WORD *)a1 = v8;
      }
      else
      {
        *a1 = v8;
      }
    }
    else
    {
      a1[v5] = 2;
      bzero(a1, v5);
      *(_DWORD *)a1 = v6;
    }
  }
  else
  {
    if (v4 <= 0x18)
      v4 = 24;
    a1[v4] = a2;
  }
}

uint64_t sub_23BFF53DC(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23BFF5428 + 4 * byte_23C00896B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23BFF545C + 4 * byte_23C008966[v4]))();
}

uint64_t sub_23BFF545C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF5464(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFF546CLL);
  return result;
}

uint64_t sub_23BFF5478(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFF5480);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23BFF5484(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF548C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF5498(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BFF54E4 + 4 * byte_23C008975[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BFF5518 + 4 * byte_23C008970[v4]))();
}

uint64_t sub_23BFF5518(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF5520(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFF5528);
  return result;
}

uint64_t sub_23BFF5534(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFF553CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BFF5540(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF5548(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23BFF5554()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF5564()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF5574()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF5584()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF5594()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF55A4()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF55B4()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF55C4()
{
  JUMPOUT(0x242615198);
}

void sub_23BFF55D4()
{
  JUMPOUT(0x242615198);
}

BOOL static Overlay.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23BFF55FC()
{
  sub_23BFF594C();
  return sub_23BFF9A30();
}

uint64_t sub_23BFF5624()
{
  sub_23BFF594C();
  return sub_23BFF9A3C();
}

uint64_t sub_23BFF564C()
{
  _BYTE *v0;

  if (*v0)
    return 1920298082;
  else
    return 1701736302;
}

uint64_t sub_23BFF5670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23BFF6100(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23BFF5694()
{
  sub_23BFF5908();
  return sub_23BFF9A30();
}

uint64_t sub_23BFF56BC()
{
  sub_23BFF5908();
  return sub_23BFF9A3C();
}

uint64_t sub_23BFF56E4()
{
  sub_23BFF5990();
  return sub_23BFF9A30();
}

uint64_t sub_23BFF570C()
{
  sub_23BFF5990();
  return sub_23BFF9A3C();
}

uint64_t Overlay.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8F90);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8F98);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8FA0);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFF5908();
  sub_23BFF9A18();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_23BFF594C();
    sub_23BFF98EC();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_23BFF5990();
    sub_23BFF98EC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_23BFF5908()
{
  unint64_t result;

  result = qword_256AE8FA8;
  if (!qword_256AE8FA8)
  {
    result = MEMORY[0x242615198](&unk_23C00911C, &type metadata for Overlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FA8);
  }
  return result;
}

unint64_t sub_23BFF594C()
{
  unint64_t result;

  result = qword_256AE8FB0;
  if (!qword_256AE8FB0)
  {
    result = MEMORY[0x242615198](&unk_23C0090CC, &type metadata for Overlay.BlurCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FB0);
  }
  return result;
}

unint64_t sub_23BFF5990()
{
  unint64_t result;

  result = qword_256AE8FB8;
  if (!qword_256AE8FB8)
  {
    result = MEMORY[0x242615198](&unk_23C00907C, &type metadata for Overlay.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FB8);
  }
  return result;
}

uint64_t Overlay.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8FC0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8FC8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE8FD0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23BFF5908();
  v11 = v33;
  sub_23BFF9A0C();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_23BFF98D4();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_23BFF9784();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256AE3978);
    *v21 = &type metadata for Overlay;
    sub_23BFF9874();
    sub_23BFF9778();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_23BFF594C();
    sub_23BFF9868();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_23BFF5990();
    v22 = v6;
    sub_23BFF9868();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_23BFF5D2C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return Overlay.init(from:)(a1, a2);
}

uint64_t sub_23BFF5D40(_QWORD *a1)
{
  return Overlay.encode(to:)(a1);
}

uint64_t Overlay.hash(into:)()
{
  return sub_23BFF99DC();
}

uint64_t Overlay.hashValue.getter()
{
  sub_23BFF99D0();
  sub_23BFF99DC();
  return sub_23BFF9A00();
}

unint64_t sub_23BFF5DC4()
{
  unint64_t result;

  result = qword_256AE8FD8;
  if (!qword_256AE8FD8)
  {
    result = MEMORY[0x242615198](&protocol conformance descriptor for Overlay, &type metadata for Overlay);
    atomic_store(result, (unint64_t *)&qword_256AE8FD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Overlay()
{
  return &type metadata for Overlay;
}

uint64_t _s15FitnessCanvasUI7OverlayOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23BFF5E68 + 4 * byte_23C008E25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23BFF5E9C + 4 * byte_23C008E20[v4]))();
}

uint64_t sub_23BFF5E9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF5EA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23BFF5EACLL);
  return result;
}

uint64_t sub_23BFF5EB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23BFF5EC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23BFF5EC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23BFF5ECC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Overlay.CodingKeys()
{
  return &type metadata for Overlay.CodingKeys;
}

ValueMetadata *type metadata accessor for Overlay.NoneCodingKeys()
{
  return &type metadata for Overlay.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for Overlay.BlurCodingKeys()
{
  return &type metadata for Overlay.BlurCodingKeys;
}

unint64_t sub_23BFF5F0C()
{
  unint64_t result;

  result = qword_256AE8FE0;
  if (!qword_256AE8FE0)
  {
    result = MEMORY[0x242615198](&unk_23C009054, &type metadata for Overlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FE0);
  }
  return result;
}

unint64_t sub_23BFF5F54()
{
  unint64_t result;

  result = qword_256AE8FE8;
  if (!qword_256AE8FE8)
  {
    result = MEMORY[0x242615198](&unk_23C008F74, &type metadata for Overlay.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FE8);
  }
  return result;
}

unint64_t sub_23BFF5F9C()
{
  unint64_t result;

  result = qword_256AE8FF0;
  if (!qword_256AE8FF0)
  {
    result = MEMORY[0x242615198](&unk_23C008F9C, &type metadata for Overlay.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FF0);
  }
  return result;
}

unint64_t sub_23BFF5FE4()
{
  unint64_t result;

  result = qword_256AE8FF8;
  if (!qword_256AE8FF8)
  {
    result = MEMORY[0x242615198](&unk_23C008F24, &type metadata for Overlay.BlurCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE8FF8);
  }
  return result;
}

unint64_t sub_23BFF602C()
{
  unint64_t result;

  result = qword_256AE9000;
  if (!qword_256AE9000)
  {
    result = MEMORY[0x242615198](&unk_23C008F4C, &type metadata for Overlay.BlurCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE9000);
  }
  return result;
}

unint64_t sub_23BFF6074()
{
  unint64_t result;

  result = qword_256AE9008;
  if (!qword_256AE9008)
  {
    result = MEMORY[0x242615198](&unk_23C008FC4, &type metadata for Overlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE9008);
  }
  return result;
}

unint64_t sub_23BFF60BC()
{
  unint64_t result;

  result = qword_256AE9010;
  if (!qword_256AE9010)
  {
    result = MEMORY[0x242615198](&unk_23C008FEC, &type metadata for Overlay.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256AE9010);
  }
  return result;
}

uint64_t sub_23BFF6100(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v2 || (sub_23BFF9964() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1920298082 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23BFF9964();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

id sub_23BFF62C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PageControlView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PageControlView.Coordinator()
{
  return objc_opt_self();
}

uint64_t destroy for PageControlView()
{
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for PageControlView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PageControlView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for PageControlView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for PageControlView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PageControlView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PageControlView()
{
  return &type metadata for PageControlView;
}

uint64_t sub_23BFF64F8()
{
  return MEMORY[0x24BDF5560];
}

id sub_23BFF6504()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  void *v4;

  v1 = *v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7D0]), sel_init);
  objc_msgSend(v2, sel_setNumberOfPages_, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256AE9050);
  sub_23BFF8AC4();
  objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v4, sel_updateCurrentPageWithSender_, 4096);

  return v2;
}

id sub_23BFF65A4(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v5;

  objc_msgSend(a1, sel_setNumberOfPages_, *v1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE9048);
  MEMORY[0x24261446C](&v5, v3);
  return objc_msgSend(a1, sel_setCurrentPage_, v5);
}

id sub_23BFF6624@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  id result;
  objc_super v11;

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = (objc_class *)type metadata accessor for PageControlView.Coordinator();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR____TtCV15FitnessCanvasUI15PageControlView11Coordinator_control];
  *(_QWORD *)v9 = v4;
  *((_QWORD *)v9 + 1) = v3;
  *((_QWORD *)v9 + 2) = v5;
  *((_QWORD *)v9 + 3) = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  swift_retain();
  swift_retain();
  result = objc_msgSendSuper2(&v11, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_23BFF66B0()
{
  return sub_23BFF88D8();
}

uint64_t sub_23BFF66F0()
{
  sub_23BFF67B8();
  return sub_23BFF8938();
}

uint64_t sub_23BFF6740()
{
  sub_23BFF67B8();
  return sub_23BFF88E4();
}

void sub_23BFF6790()
{
  sub_23BFF67B8();
  sub_23BFF892C();
  __break(1u);
}

unint64_t sub_23BFF67B8()
{
  unint64_t result;

  result = qword_256AE9058;
  if (!qword_256AE9058)
  {
    result = MEMORY[0x242615198](&unk_23C0091D8, &type metadata for PageControlView);
    atomic_store(result, (unint64_t *)&qword_256AE9058);
  }
  return result;
}

void sub_23BFF67FC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W5>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v26 = a5;
  v19 = a4;
  v18 = a3;
  v22 = a2;
  v20 = a1;
  v28 = a7;
  v11 = sub_23BFF96A0();
  MEMORY[0x24BDAC7A8](v11);
  v21 = (char *)v15 - v12;
  v13 = sub_23BFF96A0();
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v15 - v14;
  v16 = sub_23BFF82A8();
  v15[1] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v27 = a6;
  v29 = a6;
  v24 = a8;
  v30 = a8;
  v25 = a9;
  v31 = a9;
  v23 = a10;
  v32 = a10;
  type metadata accessor for CanvasSectionHeaderView();
}

uint64_t sub_23BFF6974(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[96];

  *(_QWORD *)(v4 - 480) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v4 - 488) = &v40[-v6];
  sub_23BFF8A4C();
  v7 = sub_23BFF862C();
  *(_QWORD *)(v4 - 472) = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  *(_QWORD *)(v4 - 440) = &v40[-v9];
  *(_QWORD *)(v4 - 328) = v3;
  v10 = *(_QWORD *)(v3 + 24);
  v11 = sub_23BFF96A0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v40[-v13];
  *(_QWORD *)(v4 - 368) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE3528);
  v15 = sub_23BFF8968();
  *(_QWORD *)(v4 - 344) = v15;
  *(_QWORD *)(v4 - 352) = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v4 - 360) = &v40[-v16];
  if ((sub_23BFF8260() & 1) == 0
    || ((*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v14, v2 + *(int *)(*(_QWORD *)(v4 - 328) + 52), v11), v17 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v14, 1, v10), (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11), v17 != 1))
  {
    *(_OWORD *)(v4 - 304) = xmmword_23BFFA8F0;
    *(_BYTE *)(v4 - 288) = 0;
    *(_QWORD *)(v4 - 280) = MEMORY[0x24BEE4AF8];
    v25 = sub_23BFF82B4();
    MEMORY[0x24BDAC7A8](v25);
    v38 = v4 - 304;
    v39 = v2;
    sub_23BFE8248((void (*)(char *))sub_23BEBEFD8, (uint64_t)v37);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 504) + 8))(v1, *(_QWORD *)(v4 - 496));
    *(_QWORD *)(v4 - 496) = *(_QWORD *)(v4 - 304);
    v26 = *(_QWORD *)(v4 - 296);
    *(_DWORD *)(v4 - 504) = *(unsigned __int8 *)(v4 - 288);
    v27 = *(_QWORD *)(v4 - 280);
    v28 = *(_QWORD *)(v4 - 328);
    v29 = *(_QWORD *)(v4 - 400);
    sub_23BEAA814(*(void (**)(char *))(v4 - 456), *(_QWORD *)(v4 - 448), v2 + *(int *)(v28 + 52), v29, v10, *(_QWORD *)(v4 - 464));
    sub_23BEAA814(*(void (**)(char *))(v4 - 432), *(_QWORD *)(v4 - 416), v2 + *(int *)(v28 + 56), *(_QWORD *)(v4 - 376), *(_QWORD *)(v28 + 16), *(_QWORD *)(v4 - 424));
    v38 = *(_QWORD *)(v4 - 408);
    v30 = *(_QWORD *)(v4 - 392);
    v37[0] = v29;
    v37[1] = v30;
    sub_23BF91F00(*(_DWORD *)(v4 - 380), *(_QWORD *)(v4 - 496), v26, *(_DWORD *)(v4 - 504), v27, *(_QWORD *)(v4 - 488), 5.0);
  }
  sub_23BFF91C0();
  sub_23BFF84D0();
  v18 = *(_QWORD *)(v4 - 168);
  v19 = *(_BYTE *)(v4 - 160);
  v20 = *(_QWORD *)(v4 - 152);
  v21 = *(_BYTE *)(v4 - 144);
  *(_QWORD *)(v4 - 304) = 0;
  *(_BYTE *)(v4 - 296) = 1;
  *(_QWORD *)(v4 - 288) = v18;
  *(_BYTE *)(v4 - 280) = v19;
  *(_QWORD *)(v4 - 272) = v20;
  *(_BYTE *)(v4 - 264) = v21;
  *(_OWORD *)(v4 - 256) = *(_OWORD *)(v4 - 136);
  sub_23BF0A0F0();
  v22 = MEMORY[0x242615198](&unk_23C0051E8, a1);
  v23 = sub_23BFF6F68();
  *(_QWORD *)(v4 - 320) = v22;
  *(_QWORD *)(v4 - 312) = v23;
  MEMORY[0x242615198](MEMORY[0x24BDED308], v7, v4 - 320);
  v24 = *(_QWORD *)(v4 - 360);
  sub_23BEA5C24(v4 - 304, *(_QWORD *)(v4 - 368));
  v31 = sub_23BF0A0F0();
  v32 = MEMORY[0x242615198](&unk_23C0051E8, a1);
  v33 = sub_23BFF6F68();
  *(_QWORD *)(v4 - 216) = v32;
  *(_QWORD *)(v4 - 208) = v33;
  v34 = MEMORY[0x242615198](MEMORY[0x24BDED308], v7, v4 - 216);
  *(_QWORD *)(v4 - 232) = v31;
  *(_QWORD *)(v4 - 224) = v34;
  v35 = *(_QWORD *)(v4 - 344);
  MEMORY[0x242615198](MEMORY[0x24BDEF3E0], v35, v4 - 232);
  sub_23BEA5C0C(v24, v35, *(_QWORD *)(v4 - 336));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 352) + 8))(v24, v35);
}

unint64_t sub_23BFF6F68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256AE5188;
  if (!qword_256AE5188)
  {
    v1 = sub_23BFF8A4C();
    result = MEMORY[0x242615198](MEMORY[0x24BDF02F0], v1);
    atomic_store(result, (unint64_t *)&qword_256AE5188);
  }
  return result;
}

uint64_t sub_23BFF6FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __n128 v17;
  _QWORD v19[10];

  v19[0] = a6;
  v19[1] = a7;
  v13 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23BFF8464();
  v17 = MEMORY[0x24BDAC7A8](v16);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16))(v15, v7, a3, v17);
  sub_23BFF8470();
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  v19[7] = v19[0];
  v19[8] = a1;
  v19[9] = a2;
  MEMORY[0x242615198](MEMORY[0x24BDEB998], v16);
  return sub_23BFF8578();
}

uint64_t View.containerAspectRatio(_:contentMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  return View.containerAspectRatio(_:contentMode:)(a1 & 1, a2, a3, a4, a5, 1.0);
}

uint64_t View.containerAspectRatio(_:contentMode:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v6;
  char v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[4];
  uint64_t v17;
  double v18;
  double v19;
  char v20;

  v12 = a1 & 1;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  *(double *)(v13 + 32) = a5;
  *(double *)(v13 + 40) = a6;
  *(_BYTE *)(v13 + 48) = v12;
  v16[2] = a2;
  v16[3] = a3;
  v17 = v6;
  v18 = a5;
  v19 = a6;
  v20 = v12;
  v14 = sub_23BFF81D0();
  sub_23BFF6FB0((uint64_t)sub_23BFF7238, (uint64_t)v16, (uint64_t)&type metadata for ContainerAspectRatioLayout, a2, v14, a3, a4);
  return swift_release();
}

uint64_t sub_23BFF71A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BEA72EC(v8, v9, (uint64_t)v7);
  sub_23BEA5C0C((uint64_t)v7, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_23BFF7238@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BFF71A8(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_23BFF7244(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE9060);
  sub_23BFF72D8(&qword_256AE9068, MEMORY[0x24BDEB998]);
  v2 = sub_23BFF856C();
  v4[0] = sub_23BFF72D8(&qword_256AE9070, MEMORY[0x24BDEB9A8]);
  v4[1] = v1;
  return MEMORY[0x242615198](MEMORY[0x24BDEC550], v2, v4);
}

uint64_t sub_23BFF72D8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256AE9060);
    result = MEMORY[0x242615198](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ContainerAspectRatioLayout(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ContainerAspectRatioLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerAspectRatioLayout()
{
  return &type metadata for ContainerAspectRatioLayout;
}

uint64_t sub_23BFF73C8(uint64_t result, char a2, uint64_t a3, char a4, char a5, double a6, double a7)
{
  double v7;
  double v8;

  if ((a2 & 1) != 0)
  {
    if ((a4 & 1) == 0)
    {
      v8 = a6 / a7 * *(double *)&a3;
LABEL_12:
      *(double *)&result = v8;
    }
  }
  else if ((a4 & 1) == 0)
  {
    v7 = a6 / a7;
    if ((a5 & 1) == 0)
    {
      if (*(double *)&result / *(double *)&a3 >= v7)
        return result;
      goto LABEL_11;
    }
    if (*(double *)&result / *(double *)&a3 >= v7)
    {
LABEL_11:
      v8 = v7 * *(double *)&a3;
      goto LABEL_12;
    }
  }
  return result;
}

uint64_t sub_23BFF7454(uint64_t a1, char a2, uint64_t a3, char a4, char *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11, uint64_t a12, char a13)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  char *v38;
  uint64_t v39;
  void (*v40)(uint64_t *, _QWORD);
  char *v41;
  void (*v42)(char *, uint64_t, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54[4];
  char v55;
  CGRect v56;
  CGRect v57;

  v52 = a5;
  v53 = a3;
  v49 = a1;
  LODWORD(v51) = a13 & 1;
  v21 = sub_23BFF8530();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v50 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE42B0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23BFF85A8();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v46 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE42D0);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v46 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v54[0]) = a2 & 1;
  v55 = a4 & 1;
  v34 = sub_23BFF73C8(v49, a2 & 1, v53, a4 & 1, (char)v51, a10, a11);
  v48 = v35;
  v49 = v34;
  v46 = v37;
  v47 = v36;
  v53 = v28;
  v51 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v51(v30, v52, v27);
  sub_23BED3738(&qword_256AE42C8, MEMORY[0x24BDEC798]);
  v52 = v30;
  sub_23BFF9424();
  v38 = &v33[*(int *)(v31 + 36)];
  sub_23BED3738(&qword_256AE42D8, MEMORY[0x24BDEC7A0]);
  v39 = *(_QWORD *)v38;
  sub_23BFF961C();
  if (v39 == v54[0])
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v26, 1, 1, v21);
  }
  else
  {
    v46 &= 1u;
    v47 &= 1u;
    while (1)
    {
      v40 = (void (*)(uint64_t *, _QWORD))sub_23BFF9658();
      (*(void (**)(char *))(v22 + 16))(v26);
      v40(v54, 0);
      v41 = v52;
      v51(v52, v33, v27);
      sub_23BFF9628();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v41, v27);
      v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
      v42(v26, 0, 1, v21);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v26, 1, v21) == 1)
        break;
      v43 = v50;
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v50, v26, v21);
      v56.origin.x = a6;
      v56.origin.y = a7;
      v56.size.width = a8;
      v56.size.height = a9;
      CGRectGetMidX(v56);
      v57.origin.x = a6;
      v57.origin.y = a7;
      v57.size.width = a8;
      v57.size.height = a9;
      CGRectGetMidY(v57);
      sub_23BFF925C();
      LOBYTE(v54[0]) = v47;
      v55 = v46;
      sub_23BFF8524();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v43, v21);
      v44 = *(_QWORD *)v38;
      sub_23BFF961C();
      if (v44 == v54[0])
      {
        v42(v26, 1, 1, v21);
        return sub_23BFF7918((uint64_t)v33);
      }
    }
  }
  return sub_23BFF7918((uint64_t)v33);
}

uint64_t sub_23BFF7814(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;

  v7 = sub_23BFF73C8(a1, a2 & 1, a3, a4 & 1, *(_BYTE *)(v5 + 16), *(double *)v5, *(double *)(v5 + 8));
  return sub_23BFF7F58(v7, v8 & 1, v10, v9 & 1, a5);
}

uint64_t sub_23BFF78A8(uint64_t a1, char a2, uint64_t a3, char a4, char *a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  uint64_t v10;

  return sub_23BFF7454(a1, a2 & 1, a3, a4 & 1, a5, a7, a8, a9, a10, *(double *)v10, *(double *)(v10 + 8), a6, *(_BYTE *)(v10 + 16));
}

unint64_t sub_23BFF78D4()
{
  unint64_t result;

  result = qword_256AE9078;
  if (!qword_256AE9078)
  {
    result = MEMORY[0x242615198](&unk_23C00928C, &type metadata for ContainerAspectRatioLayout);
    atomic_store(result, (unint64_t *)&qword_256AE9078);
  }
  return result;
}

uint64_t sub_23BFF7918(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256AE42D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BFF7958@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  void (*v12)(__n128);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - v10;
  v12(v9);
  sub_23BEA72EC((uint64_t)v7, a2, (uint64_t)v11);
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, a2);
  sub_23BEA5C0C((uint64_t)v11, a2, a3);
  return ((uint64_t (*)(char *, uint64_t))v13)(v11, a2);
}

uint64_t sub_23BFF7A30(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23BFF7AC0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23BFF7A4C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23BFF7C1C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23BFF7A68(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23BFF7D78(a1, a2, a3, (_QWORD *)*v3, &qword_256AE9098, (uint64_t (*)(_QWORD))MEMORY[0x24BDEC280]);
  *v3 = result;
  return result;
}

uint64_t sub_23BFF7A94(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23BFF7D78(a1, a2, a3, (_QWORD *)*v3, &qword_256AE9090, (uint64_t (*)(_QWORD))MEMORY[0x24BDF4D58]);
  *v3 = result;
  return result;
}

uint64_t sub_23BFF7AC0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256AE42E0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23BFF985C();
  __break(1u);
  return result;
}

uint64_t sub_23BFF7C1C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256AE9080);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23BFF985C();
  __break(1u);
  return result;
}

uint64_t sub_23BFF7D78(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23BFF985C();
  __break(1u);
  return result;
}

uint64_t sub_23BFF7F58(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  float64x2_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  char v16;
  void (*v17)(char *, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float64x2_t *v27;
  float64x2_t v28;
  float64x2_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float64x2_t v34;
  char v35;
  char v36[32];
  uint64_t v37;

  v33 = a1;
  *(_QWORD *)&v34.f64[0] = a3;
  v8 = sub_23BFF8530();
  v32 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BFF85A8();
  sub_23BED3738(&qword_256AE42D8, MEMORY[0x24BDEC7A0]);
  v11 = sub_23BFF9610();
  v13 = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v14 = v11;
    v37 = MEMORY[0x24BEE4AF8];
    sub_23BFF7A4C(0, v11 & ~(v11 >> 63), 0);
    result = sub_23BFF9604();
    if (v14 < 0)
    {
      __break(1u);
      return result;
    }
    v16 = a2 & 1;
    HIDWORD(v30) = a4 & 1;
    v31 = a5;
    do
    {
      v17 = (void (*)(char *, _QWORD))sub_23BFF9658();
      v18 = v32;
      (*(void (**)(char *))(v32 + 16))(v10);
      v17(v36, 0);
      v36[0] = v16;
      v35 = BYTE4(v30);
      sub_23BFF8518();
      v20 = v19;
      v22 = v21;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
      v13 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23BFF7A4C(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v37;
      }
      v24 = *(_QWORD *)(v13 + 16);
      v23 = *(_QWORD *)(v13 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_23BFF7A4C(v23 > 1, v24 + 1, 1);
        v13 = v37;
      }
      *(_QWORD *)(v13 + 16) = v24 + 1;
      v25 = v13 + 16 * v24;
      *(_QWORD *)(v25 + 32) = v20;
      *(_QWORD *)(v25 + 40) = v22;
      sub_23BFF9628();
      --v14;
    }
    while (v14);
  }
  v26 = *(_QWORD *)(v13 + 16);
  if (v26)
  {
    v27 = (float64x2_t *)(v13 + 32);
    v28 = 0uLL;
    do
    {
      v29 = *v27++;
      v28 = (float64x2_t)vbslq_s8((int8x16_t)vcgeq_f64(v29, v28), (int8x16_t)v29, (int8x16_t)v28);
      --v26;
    }
    while (v26);
    v34 = v28;
  }
  else
  {
    v12.f64[0] = 0.0;
    v34 = v12;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23BFF81C0()
{
  return swift_deallocObject();
}

unint64_t sub_23BFF81D0()
{
  unint64_t result;

  result = qword_256AE9088;
  if (!qword_256AE9088)
  {
    result = MEMORY[0x242615198](&unk_23C0092DC, &type metadata for ContainerAspectRatioLayout);
    atomic_store(result, (unint64_t *)&qword_256AE9088);
  }
  return result;
}

uint64_t sub_23BFF8214@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23BFF7958(*(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_23BFF8224()
{
  return MEMORY[0x24BDCBC18]();
}

uint64_t sub_23BFF8230()
{
  return MEMORY[0x24BDCBC20]();
}

uint64_t sub_23BFF823C()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_23BFF8248()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_23BFF8254()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_23BFF8260()
{
  return MEMORY[0x24BE37970]();
}

uint64_t sub_23BFF826C()
{
  return MEMORY[0x24BDCC3F8]();
}

uint64_t sub_23BFF8278()
{
  return MEMORY[0x24BDCC470]();
}

uint64_t sub_23BFF8284()
{
  return MEMORY[0x24BDCC478]();
}

uint64_t sub_23BFF8290()
{
  return MEMORY[0x24BDCC480]();
}

uint64_t sub_23BFF829C()
{
  return MEMORY[0x24BDCC498]();
}

uint64_t sub_23BFF82A8()
{
  return MEMORY[0x24BDCC4A8]();
}

uint64_t sub_23BFF82B4()
{
  return MEMORY[0x24BDCC4E0]();
}

uint64_t sub_23BFF82C0()
{
  return MEMORY[0x24BDCC5A0]();
}

uint64_t sub_23BFF82CC()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23BFF82D8()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_23BFF82E4()
{
  return MEMORY[0x24BDCC610]();
}

uint64_t sub_23BFF82F0()
{
  return MEMORY[0x24BDCC620]();
}

uint64_t sub_23BFF82FC()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23BFF8308()
{
  return MEMORY[0x24BDCC948]();
}

uint64_t sub_23BFF8314()
{
  return MEMORY[0x24BDCC950]();
}

uint64_t sub_23BFF8320()
{
  return MEMORY[0x24BDCC958]();
}

uint64_t sub_23BFF832C()
{
  return MEMORY[0x24BDCC9A8]();
}

uint64_t sub_23BFF8338()
{
  return MEMORY[0x24BDCD4E8]();
}

uint64_t sub_23BFF8344()
{
  return MEMORY[0x24BDCD5B0]();
}

uint64_t sub_23BFF8350()
{
  return MEMORY[0x24BDCD5B8]();
}

uint64_t sub_23BFF835C()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23BFF8368()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23BFF8374()
{
  return MEMORY[0x24BEBBE78]();
}

uint64_t sub_23BFF8380()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_23BFF838C()
{
  return MEMORY[0x24BEBBEA0]();
}

uint64_t sub_23BFF8398()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_23BFF83A4()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_23BFF83B0()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23BFF83BC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23BFF83C8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23BFF83D4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23BFF83E0()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_23BFF83EC()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_23BFF83F8()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23BFF8404()
{
  return MEMORY[0x24BDEB150]();
}

uint64_t sub_23BFF8410()
{
  return MEMORY[0x24BDEB158]();
}

uint64_t sub_23BFF841C()
{
  return MEMORY[0x24BDEB170]();
}

uint64_t sub_23BFF8428()
{
  return MEMORY[0x24BDEB178]();
}

uint64_t sub_23BFF8434()
{
  return MEMORY[0x24BDEB210]();
}

uint64_t sub_23BFF8440()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_23BFF844C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23BFF8458()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_23BFF8464()
{
  return MEMORY[0x24BDEB978]();
}

uint64_t sub_23BFF8470()
{
  return MEMORY[0x24BDEB990]();
}

uint64_t sub_23BFF847C()
{
  return MEMORY[0x24BDEBC98]();
}

uint64_t sub_23BFF8488()
{
  return MEMORY[0x24BDEBCA0]();
}

uint64_t sub_23BFF8494()
{
  return MEMORY[0x24BDEBCA8]();
}

uint64_t sub_23BFF84A0()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23BFF84AC()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23BFF84B8()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23BFF84C4()
{
  return MEMORY[0x24BDEBE18]();
}

uint64_t sub_23BFF84D0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23BFF84DC()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23BFF84E8()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_23BFF84F4()
{
  return MEMORY[0x24BDEC140]();
}

uint64_t sub_23BFF8500()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_23BFF850C()
{
  return MEMORY[0x24BDEC158]();
}

uint64_t sub_23BFF8518()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_23BFF8524()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_23BFF8530()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_23BFF853C()
{
  return MEMORY[0x24BDEC290]();
}

uint64_t sub_23BFF8548()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_23BFF8554()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_23BFF8560()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_23BFF856C()
{
  return MEMORY[0x24BDEC530]();
}

uint64_t sub_23BFF8578()
{
  return MEMORY[0x24BDEC548]();
}

uint64_t sub_23BFF8584()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_23BFF8590()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_23BFF859C()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_23BFF85A8()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_23BFF85B4()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_23BFF85C0()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_23BFF85CC()
{
  return MEMORY[0x24BDECA88]();
}

uint64_t sub_23BFF85D8()
{
  return MEMORY[0x24BDECA98]();
}

uint64_t sub_23BFF85E4()
{
  return MEMORY[0x24BDECEE8]();
}

uint64_t sub_23BFF85F0()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23BFF85FC()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_23BFF8608()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_23BFF8614()
{
  return MEMORY[0x24BDED168]();
}

uint64_t sub_23BFF8620()
{
  return MEMORY[0x24BDED290]();
}

uint64_t sub_23BFF862C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23BFF8638()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_23BFF8644()
{
  return MEMORY[0x24BDED338]();
}

uint64_t sub_23BFF8650()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_23BFF865C()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_23BFF8668()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_23BFF8674()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_23BFF8680()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_23BFF868C()
{
  return MEMORY[0x24BDED910]();
}

uint64_t sub_23BFF8698()
{
  return MEMORY[0x24BDED918]();
}

uint64_t sub_23BFF86A4()
{
  return MEMORY[0x24BDED928]();
}

uint64_t sub_23BFF86B0()
{
  return MEMORY[0x24BDED930]();
}

uint64_t sub_23BFF86BC()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23BFF86C8()
{
  return MEMORY[0x24BDED9E8]();
}

uint64_t sub_23BFF86D4()
{
  return MEMORY[0x24BDED9F0]();
}

uint64_t sub_23BFF86E0()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_23BFF86EC()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23BFF86F8()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_23BFF8704()
{
  return MEMORY[0x24BDEDC78]();
}

uint64_t sub_23BFF8710()
{
  return MEMORY[0x24BDEDCA8]();
}

uint64_t sub_23BFF871C()
{
  return MEMORY[0x24BDEDDE8]();
}

uint64_t sub_23BFF8728()
{
  return MEMORY[0x24BDEDFE8]();
}

uint64_t sub_23BFF8734()
{
  return MEMORY[0x24BDEDFF0]();
}

uint64_t sub_23BFF8740()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_23BFF874C()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_23BFF8758()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_23BFF8764()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_23BFF8770()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23BFF877C()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23BFF8788()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23BFF8794()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23BFF87A0()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_23BFF87AC()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_23BFF87B8()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23BFF87C4()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23BFF87D0()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_23BFF87DC()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_23BFF87E8()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23BFF87F4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23BFF8800()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23BFF880C()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_23BFF8818()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_23BFF8824()
{
  return MEMORY[0x24BDEE6F8]();
}

uint64_t sub_23BFF8830()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_23BFF883C()
{
  return MEMORY[0x24BDEE728]();
}

uint64_t sub_23BFF8848()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23BFF8854()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23BFF8860()
{
  return MEMORY[0x24BDEEC70]();
}

uint64_t sub_23BFF886C()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_23BFF8878()
{
  return MEMORY[0x24BDEED60]();
}

uint64_t sub_23BFF8884()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_23BFF8890()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_23BFF889C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23BFF88A8()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23BFF88B4()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_23BFF88C0()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_23BFF88CC()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_23BFF88D8()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_23BFF88E4()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_23BFF88F0()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_23BFF88FC()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_23BFF8908()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_23BFF8914()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_23BFF8920()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_23BFF892C()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_23BFF8938()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_23BFF8944()
{
  return MEMORY[0x24BDEF358]();
}

uint64_t sub_23BFF8950()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_23BFF895C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23BFF8968()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_23BFF8974()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_23BFF8980()
{
  return MEMORY[0x24BDEF560]();
}

uint64_t sub_23BFF898C()
{
  return MEMORY[0x24BDEF5C8]();
}

uint64_t sub_23BFF8998()
{
  return MEMORY[0x24BDEF5D8]();
}

uint64_t sub_23BFF89A4()
{
  return MEMORY[0x24BDEF600]();
}

uint64_t sub_23BFF89B0()
{
  return MEMORY[0x24BDEF608]();
}

uint64_t sub_23BFF89BC()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_23BFF89C8()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_23BFF89D4()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_23BFF89E0()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_23BFF89EC()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_23BFF89F8()
{
  return MEMORY[0x24BDEFBD0]();
}

uint64_t sub_23BFF8A04()
{
  return MEMORY[0x24BDEFBE8]();
}

uint64_t sub_23BFF8A10()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23BFF8A1C()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23BFF8A28()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_23BFF8A34()
{
  return MEMORY[0x24BDF0148]();
}

uint64_t sub_23BFF8A40()
{
  return MEMORY[0x24BDF02E8]();
}

uint64_t sub_23BFF8A4C()
{
  return MEMORY[0x24BDF02F8]();
}

uint64_t sub_23BFF8A58()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_23BFF8A64()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_23BFF8A70()
{
  return MEMORY[0x24BDF06B8]();
}

uint64_t sub_23BFF8A7C()
{
  return MEMORY[0x24BDF08C8]();
}

uint64_t sub_23BFF8A88()
{
  return MEMORY[0x24BDF08D0]();
}

uint64_t sub_23BFF8A94()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_23BFF8AA0()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_23BFF8AAC()
{
  return MEMORY[0x24BDF0AC0]();
}

uint64_t sub_23BFF8AB8()
{
  return MEMORY[0x24BDF0AC8]();
}

uint64_t sub_23BFF8AC4()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_23BFF8AD0()
{
  return MEMORY[0x24BDF0CB8]();
}

uint64_t sub_23BFF8ADC()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23BFF8AE8()
{
  return MEMORY[0x24BDF10D8]();
}

uint64_t sub_23BFF8AF4()
{
  return MEMORY[0x24BDF10E0]();
}

uint64_t sub_23BFF8B00()
{
  return MEMORY[0x24BDF10E8]();
}

uint64_t sub_23BFF8B0C()
{
  return MEMORY[0x24BDF10F8]();
}

uint64_t sub_23BFF8B18()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23BFF8B24()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_23BFF8B30()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_23BFF8B3C()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_23BFF8B48()
{
  return MEMORY[0x24BDF1478]();
}

uint64_t sub_23BFF8B54()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_23BFF8B60()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23BFF8B6C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23BFF8B78()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23BFF8B84()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_23BFF8B90()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23BFF8B9C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_23BFF8BA8()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_23BFF8BB4()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_23BFF8BC0()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_23BFF8BCC()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_23BFF8BD8()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_23BFF8BE4()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23BFF8BF0()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23BFF8BFC()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_23BFF8C08()
{
  return MEMORY[0x24BDF1990]();
}

uint64_t sub_23BFF8C14()
{
  return MEMORY[0x24BDF1998]();
}

uint64_t sub_23BFF8C20()
{
  return MEMORY[0x24BDF1CE0]();
}

uint64_t sub_23BFF8C2C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23BFF8C38()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_23BFF8C44()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_23BFF8C50()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_23BFF8C5C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23BFF8C68()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_23BFF8C74()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23BFF8C80()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_23BFF8C8C()
{
  return MEMORY[0x24BE35198]();
}

uint64_t sub_23BFF8C98()
{
  return MEMORY[0x24BEC6708]();
}

uint64_t sub_23BFF8CA4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23BFF8CB0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23BFF8CBC()
{
  return MEMORY[0x24BDF20D8]();
}

uint64_t sub_23BFF8CC8()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_23BFF8CD4()
{
  return MEMORY[0x24BDF2100]();
}

uint64_t sub_23BFF8CE0()
{
  return MEMORY[0x24BDF2298]();
}

uint64_t sub_23BFF8CEC()
{
  return MEMORY[0x24BDF22A0]();
}

uint64_t sub_23BFF8CF8()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_23BFF8D04()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_23BFF8D10()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_23BFF8D1C()
{
  return MEMORY[0x24BDF2378]();
}

uint64_t sub_23BFF8D28()
{
  return MEMORY[0x24BDF2398]();
}

uint64_t sub_23BFF8D34()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_23BFF8D40()
{
  return MEMORY[0x24BDF2410]();
}

uint64_t sub_23BFF8D4C()
{
  return MEMORY[0x24BDF24A8]();
}

uint64_t sub_23BFF8D58()
{
  return MEMORY[0x24BDF24B8]();
}

uint64_t sub_23BFF8D64()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23BFF8D70()
{
  return MEMORY[0x24BDF2650]();
}

uint64_t sub_23BFF8D7C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23BFF8D88()
{
  return MEMORY[0x24BDF26E0]();
}

uint64_t sub_23BFF8D94()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_23BFF8DA0()
{
  return MEMORY[0x24BDF2858]();
}

uint64_t sub_23BFF8DAC()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_23BFF8DB8()
{
  return MEMORY[0x24BDF29F0]();
}

uint64_t sub_23BFF8DC4()
{
  return MEMORY[0x24BDF2A58]();
}

uint64_t sub_23BFF8DD0()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_23BFF8DDC()
{
  return MEMORY[0x24BDF2CD8]();
}

uint64_t sub_23BFF8DE8()
{
  return MEMORY[0x24BDF2D30]();
}

uint64_t sub_23BFF8DF4()
{
  return MEMORY[0x24BDF2D50]();
}

uint64_t sub_23BFF8E00()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_23BFF8E0C()
{
  return MEMORY[0x24BDF2E50]();
}

uint64_t sub_23BFF8E18()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_23BFF8E24()
{
  return MEMORY[0x24BDF2FD8]();
}

uint64_t sub_23BFF8E30()
{
  return MEMORY[0x24BDF2FF8]();
}

uint64_t sub_23BFF8E3C()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_23BFF8E48()
{
  return MEMORY[0x24BDF30E8]();
}

uint64_t sub_23BFF8E54()
{
  return MEMORY[0x24BDF30F8]();
}

uint64_t sub_23BFF8E60()
{
  return MEMORY[0x24BDF3108]();
}

uint64_t sub_23BFF8E6C()
{
  return MEMORY[0x24BDF3118]();
}

uint64_t sub_23BFF8E78()
{
  return MEMORY[0x24BDF3130]();
}

uint64_t sub_23BFF8E84()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_23BFF8E90()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_23BFF8E9C()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_23BFF8EA8()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_23BFF8EB4()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_23BFF8EC0()
{
  return MEMORY[0x24BDF3678]();
}

uint64_t sub_23BFF8ECC()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_23BFF8ED8()
{
  return MEMORY[0x24BDF37D0]();
}

uint64_t sub_23BFF8EE4()
{
  return MEMORY[0x24BDF37D8]();
}

uint64_t sub_23BFF8EF0()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_23BFF8EFC()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_23BFF8F08()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23BFF8F14()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_23BFF8F20()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23BFF8F2C()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23BFF8F38()
{
  return MEMORY[0x24BDF3940]();
}

uint64_t sub_23BFF8F44()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_23BFF8F50()
{
  return MEMORY[0x24BDF39B0]();
}

uint64_t sub_23BFF8F5C()
{
  return MEMORY[0x24BDF39B8]();
}

uint64_t sub_23BFF8F68()
{
  return MEMORY[0x24BDF3A40]();
}

uint64_t sub_23BFF8F74()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23BFF8F80()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23BFF8F8C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23BFF8F98()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23BFF8FA4()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_23BFF8FB0()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23BFF8FBC()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23BFF8FC8()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_23BFF8FD4()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_23BFF8FE0()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23BFF8FEC()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23BFF8FF8()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23BFF9004()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23BFF9010()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_23BFF901C()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_23BFF9028()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_23BFF9034()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23BFF9040()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_23BFF904C()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_23BFF9058()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_23BFF9064()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_23BFF9070()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_23BFF907C()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_23BFF9088()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_23BFF9094()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_23BFF90A0()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_23BFF90AC()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_23BFF90B8()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_23BFF90C4()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_23BFF90D0()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_23BFF90DC()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_23BFF90E8()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_23BFF90F4()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_23BFF9100()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23BFF910C()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_23BFF9118()
{
  return MEMORY[0x24BDF4A50]();
}

uint64_t sub_23BFF9124()
{
  return MEMORY[0x24BDF4A58]();
}

uint64_t sub_23BFF9130()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_23BFF913C()
{
  return MEMORY[0x24BDF4AE0]();
}

uint64_t sub_23BFF9148()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_23BFF9154()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_23BFF9160()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_23BFF916C()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_23BFF9178()
{
  return MEMORY[0x24BDF4E30]();
}

uint64_t sub_23BFF9184()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_23BFF9190()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_23BFF919C()
{
  return MEMORY[0x24BDF4ED0]();
}

uint64_t sub_23BFF91A8()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_23BFF91B4()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_23BFF91C0()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23BFF91CC()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23BFF91D8()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_23BFF91E4()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_23BFF91F0()
{
  return MEMORY[0x24BDF5180]();
}

uint64_t sub_23BFF91FC()
{
  return MEMORY[0x24BDF5188]();
}

uint64_t sub_23BFF9208()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_23BFF9214()
{
  return MEMORY[0x24BDF51F0]();
}

uint64_t sub_23BFF9220()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_23BFF922C()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_23BFF9238()
{
  return MEMORY[0x24BDF5458]();
}

uint64_t sub_23BFF9244()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_23BFF9250()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_23BFF925C()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_23BFF9268()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_23BFF9274()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_23BFF9280()
{
  return MEMORY[0x24BE5D228]();
}

uint64_t sub_23BFF928C()
{
  return MEMORY[0x24BE5D230]();
}

uint64_t sub_23BFF9298()
{
  return MEMORY[0x24BE5D2D8]();
}

uint64_t sub_23BFF92A4()
{
  return MEMORY[0x24BE5D2F8]();
}

uint64_t sub_23BFF92B0()
{
  return MEMORY[0x24BE5D308]();
}

uint64_t sub_23BFF92BC()
{
  return MEMORY[0x24BE5D330]();
}

uint64_t sub_23BFF92C8()
{
  return MEMORY[0x24BE5D770]();
}

uint64_t sub_23BFF92D4()
{
  return MEMORY[0x24BE5D778]();
}

uint64_t sub_23BFF92E0()
{
  return MEMORY[0x24BE5D790]();
}

uint64_t sub_23BFF92EC()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_23BFF92F8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23BFF9304()
{
  return MEMORY[0x24BEE02B8]();
}

uint64_t sub_23BFF9310()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_23BFF931C()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_23BFF9328()
{
  return MEMORY[0x24BEE0380]();
}

uint64_t sub_23BFF9334()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_23BFF9340()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_23BFF934C()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23BFF9358()
{
  return MEMORY[0x24BEE0490]();
}

uint64_t sub_23BFF9364()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_23BFF9370()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_23BFF937C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23BFF9388()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23BFF9394()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_23BFF93A0()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23BFF93AC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23BFF93B8()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23BFF93C4()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23BFF93D0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23BFF93DC()
{
  return MEMORY[0x24BE37C28]();
}

uint64_t sub_23BFF93E8()
{
  return MEMORY[0x24BE37C30]();
}

uint64_t sub_23BFF93F4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23BFF9400()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23BFF940C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23BFF9418()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23BFF9424()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23BFF9430()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_23BFF943C()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_23BFF9448()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_23BFF9454()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_23BFF9460()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23BFF946C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23BFF9478()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23BFF9484()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_23BFF9490()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23BFF949C()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_23BFF94A8()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23BFF94B4()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_23BFF94C0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23BFF94CC()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_23BFF94D8()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_23BFF94E4()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_23BFF94F0()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_23BFF94FC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23BFF9508()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23BFF9514()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23BFF9520()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23BFF952C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23BFF9538()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23BFF9544()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_23BFF9550()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23BFF955C()
{
  return MEMORY[0x24BEE15A8]();
}

uint64_t sub_23BFF9568()
{
  return MEMORY[0x24BEE15B0]();
}

uint64_t sub_23BFF9574()
{
  return MEMORY[0x24BEE15C0]();
}

uint64_t sub_23BFF9580()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t sub_23BFF958C()
{
  return MEMORY[0x24BEE1640]();
}

uint64_t sub_23BFF9598()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_23BFF95A4()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_23BFF95B0()
{
  return MEMORY[0x24BEE16B0]();
}

uint64_t sub_23BFF95BC()
{
  return MEMORY[0x24BEE16B8]();
}

uint64_t sub_23BFF95C8()
{
  return MEMORY[0x24BEE16C0]();
}

uint64_t sub_23BFF95D4()
{
  return MEMORY[0x24BEE16D0]();
}

uint64_t sub_23BFF95E0()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_23BFF95EC()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_23BFF95F8()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_23BFF9604()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23BFF9610()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23BFF961C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23BFF9628()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23BFF9634()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_23BFF9640()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_23BFF964C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23BFF9658()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23BFF9664()
{
  return MEMORY[0x24BEE1B50]();
}

uint64_t sub_23BFF9670()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23BFF967C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23BFF9688()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23BFF9694()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23BFF96A0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23BFF96AC()
{
  return MEMORY[0x24BEE1C80]();
}

uint64_t sub_23BFF96B8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23BFF96C4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23BFF96D0()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23BFF96DC()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_23BFF96E8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23BFF96F4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23BFF9700()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23BFF970C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23BFF9718()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23BFF9724()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23BFF9730()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23BFF973C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23BFF9748()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23BFF9754()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_23BFF9760()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_23BFF976C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23BFF9778()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23BFF9784()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23BFF9790()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23BFF979C()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_23BFF97A8()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23BFF97B4()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23BFF97C0()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23BFF97CC()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23BFF97D8()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23BFF97E4()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23BFF97F0()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23BFF97FC()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23BFF9808()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_23BFF9814()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23BFF9820()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23BFF982C()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_23BFF9838()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23BFF9844()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23BFF9850()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23BFF985C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23BFF9868()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23BFF9874()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23BFF9880()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_23BFF988C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23BFF9898()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23BFF98A4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23BFF98B0()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23BFF98BC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23BFF98C8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23BFF98D4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23BFF98E0()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23BFF98EC()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23BFF98F8()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_23BFF9904()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23BFF9910()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23BFF991C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23BFF9928()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23BFF9934()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23BFF9940()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23BFF994C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23BFF9958()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23BFF9964()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23BFF9970()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23BFF997C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23BFF9988()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23BFF9994()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23BFF99A0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23BFF99AC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23BFF99B8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23BFF99C4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23BFF99D0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23BFF99DC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23BFF99E8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23BFF99F4()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23BFF9A00()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23BFF9A0C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23BFF9A18()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23BFF9A24()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_23BFF9A30()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23BFF9A3C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23BFF9A48()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_23BFF9A54()
{
  return MEMORY[0x24BEE4A98]();
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D30]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


void *sub_2409A33C0()
{
  return &unk_2409C6450;
}

uint64_t sub_2409A33CC()
{
  return 10;
}

void *sub_2409A33D4()
{
  return &unk_2409C6454;
}

uint64_t sub_2409A33E0()
{
  return 13;
}

void *sub_2409A33E8()
{
  return &unk_2409C6458;
}

uint64_t sub_2409A33F4()
{
  return 12;
}

void *sub_2409A33FC()
{
  return &unk_2409C645C;
}

uint64_t sub_2409A3408()
{
  return 0;
}

void *sub_2409A3410()
{
  return &unk_2409C6460;
}

uint64_t sub_2409A341C()
{
  return 65533;
}

void *sub_2409A3424()
{
  return &unk_2409C6464;
}

uint64_t sub_2409A3430()
{
  return 8;
}

void *sub_2409A3438()
{
  return &unk_2409C6468;
}

uint64_t sub_2409A3444()
{
  return 11;
}

void *sub_2409A344C()
{
  return &unk_2409C646C;
}

uint64_t sub_2409A3458()
{
  return 14;
}

void *sub_2409A3460()
{
  return &unk_2409C6470;
}

uint64_t sub_2409A346C()
{
  return 31;
}

void *sub_2409A3474()
{
  return &unk_2409C6474;
}

uint64_t sub_2409A3480()
{
  return 127;
}

void *sub_2409A3488()
{
  return &unk_2409C6478;
}

uint64_t sub_2409A3494()
{
  return 1114111;
}

uint64_t sub_2409A349C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t);
  void (*v12)(char *, _QWORD, uint64_t);
  void (*v13)(char *, uint64_t);
  char v14;
  uint64_t v16;

  v0 = sub_2409C61C8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v16 - v5;
  v7 = sub_2409C61F8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2409C6204();
  sub_2409C61EC();
  v11 = *(void (**)(char *, uint64_t))(v8 + 8);
  v11(v10, v7);
  v12 = *(void (**)(char *, _QWORD, uint64_t))(v1 + 104);
  v12(v4, *MEMORY[0x24BEE46F0], v0);
  LOBYTE(v8) = sub_2409C61BC();
  v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v4, v0);
  v13(v6, v0);
  if ((v8 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    sub_2409C6204();
    sub_2409C61EC();
    v11(v10, v7);
    v12(v4, *MEMORY[0x24BEE46E8], v0);
    v14 = sub_2409C61BC();
    v13(v4, v0);
    v13(v6, v0);
  }
  return v14 & 1;
}

uint64_t sub_2409A3644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v0 = sub_2409C61C8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  v7 = sub_2409C61F8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2409C6204();
  sub_2409C61EC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEE46E0], v0);
  v11 = sub_2409C61BC();
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v4, v0);
  v12(v6, v0);
  return v11 & 1;
}

uint64_t sub_2409A377C(unsigned int a1)
{
  return sub_2409A349C() & 1 | (a1 > 0x7F) | (a1 == 95);
}

uint64_t sub_2409A37B8(unsigned int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  char v14;
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v2 = sub_2409C61C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - v7;
  v9 = sub_2409C61F8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2409A349C();
  v14 = 1;
  if ((v13 & 1) == 0 && a1 <= 0x7F && a1 != 95)
  {
    sub_2409C6204();
    sub_2409C61EC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEE46E0], v2);
    v15 = sub_2409C61BC();
    v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v6, v2);
    v16(v8, v2);
    v14 = v15 | (a1 == 45);
  }
  return v14 & 1;
}

BOOL sub_2409A3918(int a1)
{
  return a1 == 10;
}

uint64_t sub_2409A3924(unsigned int a1)
{
  _BOOL4 v2;

  v2 = a1 == 127 || a1 - 14 < 0x12;
  if (a1 == 11)
    v2 = 1;
  return a1 < 9 || v2;
}

uint64_t sub_2409A394C()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v1 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 272);
  result = v1();
  if ((result & 0x100000000) == 0)
  {
    v3 = result;
    do
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
      if ((result & 1) != 0 || v3 == 41)
        break;
      v5 = sub_2409A87B0();
      v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 256))(v5);
      if (*(_QWORD *)(v6 + 16))
      {
        v7 = *(_DWORD *)(v6 + 32);
        swift_bridgeObjectRelease();
        v4 = sub_2409A8498(v3, v7);
        if ((v4 & 1) != 0)
          v4 = sub_2409A9BCC();
      }
      else
      {
        v4 = swift_bridgeObjectRelease();
      }
      result = ((uint64_t (*)(uint64_t))v1)(v4);
      v3 = result;
    }
    while ((result & 0x100000000) == 0);
  }
  return result;
}

uint64_t sub_2409A39E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t result;
  uint64_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v2 = v1;
  v4 = sub_2409A9AF0();
  v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 272);
  v6 = v5(v4);
  if ((v6 & 0x100000000) == 0)
  {
    LODWORD(v7) = v6;
    while (1)
    {
      v9 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 240);
      if ((v9() & 1) != 0 || (_DWORD)v7 == 41)
        goto LABEL_14;
      swift_getKeyPath();
      v10 = sub_2409A8468();
      swift_release();
      if ((v10 & 1) != 0)
        break;
      if (v7 <= 0x28 && ((1 << v7) & 0x18400000000) != 0)
        goto LABEL_19;
      swift_getKeyPath();
      v11 = sub_2409A8468();
      swift_release();
      if ((v11 & 1) != 0)
        goto LABEL_19;
      if ((_DWORD)v7 == 92)
      {
        v12 = sub_2409A87B0();
        v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 256))(v12);
        if (!*(_QWORD *)(v13 + 16))
        {
          swift_bridgeObjectRelease();
LABEL_19:
          swift_bridgeObjectRelease();
          result = sub_2409A394C();
          v17 = (int64x2_t)xmmword_2409C6480;
          v16 = 1;
          goto LABEL_20;
        }
        v14 = *(_DWORD *)(v13 + 32);
        swift_bridgeObjectRelease();
        if (!sub_2409A8498(92, v14))
          goto LABEL_19;
        sub_2409A9BCC();
      }
      sub_2409C6210();
      sub_2409C5DCC();
      v8 = swift_bridgeObjectRelease();
      v7 = v5(v8);
      if ((v7 & 0x100000000) != 0)
        goto LABEL_14;
    }
    sub_2409A9AF0();
    v18 = sub_2409A87B0();
    v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 256))(v18);
    if (*(_QWORD *)(v19 + 16))
    {
      v20 = *(_DWORD *)(v19 + 32);
      v21 = swift_bridgeObjectRelease();
      if (v20 == 41)
      {
LABEL_23:
        result = v5(v21);
        v16 = 0;
        v17 = vdupq_n_s64(0x5000000000000000uLL);
        v17.i64[0] = 0xE000000000000000;
        goto LABEL_20;
      }
    }
    else
    {
      v21 = swift_bridgeObjectRelease();
    }
    v21 = ((uint64_t (*)(uint64_t))v9)(v21);
    if ((v21 & 1) == 0)
      goto LABEL_19;
    goto LABEL_23;
  }
LABEL_14:
  result = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 240))();
  v16 = 0;
  v17 = vdupq_n_s64(0x5000000000000000uLL);
  v17.i64[0] = 0xE000000000000000;
LABEL_20:
  *(_QWORD *)a1 = v16;
  *(int64x2_t *)(a1 + 8) = v17;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t sub_2409A3C38()
{
  return sub_2409C6204();
}

uint64_t sub_2409A3C40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2409C61E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2409A3C6C@<X0>(unsigned int *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_2409A3924(*a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_2409A3C98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t result;
  int v16;

  v3 = sub_2409AA260();
  v5 = v4;
  v6 = sub_2409A87B0();
  v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 256);
  v8 = v7(v6);
  if (sub_2409C5D30() == 7107189 && v9 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      if (*(_QWORD *)(v8 + 16))
      {
LABEL_12:
        v16 = *(_DWORD *)(v8 + 32);
        result = swift_bridgeObjectRelease();
        if (v16 == 40)
        {
          result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 272))(result);
          goto LABEL_14;
        }
LABEL_16:
        *(_QWORD *)a1 = v3;
        *(_QWORD *)(a1 + 8) = v5;
        *(_OWORD *)(a1 + 16) = 0u;
        *(_OWORD *)(a1 + 32) = 0u;
        return result;
      }
LABEL_15:
      result = swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_15;
  if (*(_DWORD *)(v8 + 32) != 40)
    goto LABEL_12;
  v11 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 272))(v11);
  sub_2409A9AF0();
  v12 = sub_2409A87B0();
  v13 = v7(v12);
  if (*(_QWORD *)(v13 + 16))
  {
    v14 = *(_DWORD *)(v13 + 32);
    result = swift_bridgeObjectRelease();
    if (v14 != 34 && v14 != 39)
      goto LABEL_18;
LABEL_14:
    *(_QWORD *)a1 = v3;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = 0x1000000000000000;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    return result;
  }
  swift_bridgeObjectRelease();
LABEL_18:
  swift_bridgeObjectRelease();
  return sub_2409A39E4(a1);
}

uint64_t sub_2409A3E2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
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
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unsigned __int8 v21;

  result = sub_2409AA358((char *)&v21);
  if (!v2)
  {
    v7 = result;
    v8 = v5;
    v9 = v6;
    v10 = v21;
    v11 = sub_2409A8D88();
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 264))(v11);
    v13 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 216);
    v14 = v13(v12);
    v15 = sub_2409A8584(v14);
    v16 = swift_bridgeObjectRelease();
    if (v15)
    {
      result = sub_2409AA260();
      *a1 = v7;
      a1[1] = v8;
      a1[2] = v10 | 0x9000000000000000;
      a1[3] = v9;
      a1[4] = result;
      a1[5] = v17;
      return result;
    }
    v18 = v13(v16);
    if (*(_QWORD *)(v18 + 16))
    {
      v19 = *(_DWORD *)(v18 + 32);
      result = swift_bridgeObjectRelease();
      if (v19 == 37)
      {
        result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 272))(result);
        v20 = v10 | 0x8000000000000000;
LABEL_9:
        *a1 = v7;
        a1[1] = v8;
        a1[2] = v20;
        a1[3] = v9;
        a1[4] = 0;
        a1[5] = 0;
        return result;
      }
    }
    else
    {
      result = swift_bridgeObjectRelease();
    }
    v20 = v10 | 0x7000000000000000;
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_2409A3F28@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v6)(void);
  uint64_t (*v7)(void);
  char v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;

  v3 = v2;
  v6 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 240);
  v7 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 272);
  v8 = v6();
  result = v7();
  if ((result & 0x100000000) != 0 || (v8 & 1) != 0 || (_DWORD)result == a1)
  {
LABEL_22:
    *a2 = 0;
    a2[1] = 0xE000000000000000;
    v20 = 0x4000000000000000;
    goto LABEL_23;
  }
  v10 = result;
  while (!sub_2409A3918(v10))
  {
    if (v10 != 92)
      goto LABEL_11;
    v11 = sub_2409A87B0();
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 256))(v11);
    if ((v6() & 1) != 0)
      goto LABEL_12;
    if (*(_QWORD *)(v12 + 16))
    {
      v13 = *(_DWORD *)(v12 + 32);
      swift_bridgeObjectRelease();
      v14 = sub_2409A3918(v13);
      if ((v14 & 1) != 0)
      {
        v15 = v7();
        goto LABEL_13;
      }
    }
    else
    {
      v14 = swift_bridgeObjectRelease();
    }
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 216))(v14);
    if (!*(_QWORD *)(v17 + 16))
      goto LABEL_12;
    v18 = *(_DWORD *)(v17 + 32);
    swift_bridgeObjectRelease();
    v15 = sub_2409A8498(92, v18);
    if ((v15 & 1) != 0)
    {
      sub_2409A9BCC();
LABEL_11:
      sub_2409C6210();
      sub_2409C5DCC();
LABEL_12:
      v15 = swift_bridgeObjectRelease();
    }
LABEL_13:
    v16 = ((uint64_t (*)(uint64_t))v6)(v15);
    result = v7();
    if ((result & 0x100000000) == 0 && (v16 & 1) == 0)
    {
      v10 = result;
      if ((_DWORD)result != a1)
        continue;
    }
    goto LABEL_22;
  }
  v19 = swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 280))(v19);
  *a2 = 0;
  a2[1] = 0;
  v20 = 0xA000000000000000;
LABEL_23:
  a2[2] = v20;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A40D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  unint64_t v4;
  int v5;
  uint64_t v6;
  _BYTE v7[40];

  result = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 240))();
  if ((result & 1) != 0)
  {
    *(_OWORD *)a1 = xmmword_2409C6490;
    v4 = 0xA000000000000000;
  }
  else
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 272))();
    if ((result & 0x100000000) == 0)
    {
      v5 = result;
      v6 = sub_2409A8D88();
      (*(void (**)(uint64_t))(*(_QWORD *)v1 + 264))(v6);
      sub_2409A4E0C(v5, (uint64_t)v7);
      sub_2409A5124(v1, a1);
      return sub_2409A41A0((uint64_t)v7);
    }
    *a1 = 0;
    a1[1] = 0;
    v4 = 0x1FFFFFFFELL;
  }
  a1[2] = v4;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  return result;
}

uint64_t sub_2409A41A0(uint64_t a1)
{
  destroy for AnyTokenProducer(a1);
  return a1;
}

uint64_t dispatch thunk of Tokenizable.tokens.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2409A41F4()
{
  return 0;
}

uint64_t sub_2409A4214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t result;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];

  v2 = a1;
  v3 = *(_QWORD *)(v1 + 8);
  LOBYTE(a1) = *(_BYTE *)(v1 + 16);
  if (*(_BYTE *)(v1 + 17) != 1)
    goto LABEL_6;
  *(_BYTE *)(v1 + 17) = 0;
  if ((a1 & 1) != 0)
    goto LABEL_17;
  a1 = *(uint64_t **)v1;
  if (v3 < *(_QWORD *)(*(_QWORD *)v1 + 16))
  {
    v4 = v3;
    if ((v3 & 0x8000000000000000) == 0)
    {
LABEL_12:
      v10 = &a1[6 * v4];
      v6 = v10[4];
      v9 = v10[5];
      v5 = v10[6];
      v4 = v10[7];
      v7 = v10[8];
      v8 = v10[9];
      sub_2409A4D64(v6, v9, v5);
      goto LABEL_14;
    }
    __break(1u);
LABEL_6:
    if ((a1 & 1) != 0)
    {
      v4 = 0;
      *(_QWORD *)(v1 + 8) = 0;
      *(_BYTE *)(v1 + 16) = 0;
      a1 = *(uint64_t **)v1;
      if (*(uint64_t *)(*(_QWORD *)v1 + 16) <= 0)
      {
        v5 = 0xA000000000000000;
        v6 = 21;
        v7 = 0;
        v8 = 0;
        v9 = 0;
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    a1 = *(uint64_t **)v1;
    if (v3 < *(_QWORD *)(*(_QWORD *)v1 + 16))
    {
      v4 = v3 + 1;
      *(_QWORD *)(v1 + 8) = v3 + 1;
      *(_BYTE *)(v1 + 16) = 0;
      if (v3 + 1 < a1[2])
      {
        if (v3 > -2)
          goto LABEL_12;
        while (1)
        {
LABEL_17:
          sub_2409C603C();
          __break(1u);
        }
      }
    }
  }
  v4 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v5 = 0xA000000000000000;
  v6 = 21;
LABEL_14:
  v17[0] = v6;
  v17[1] = v9;
  v17[2] = v5;
  v17[3] = v4;
  v17[4] = v7;
  v17[5] = v8;
  v12 = xmmword_2409C6490;
  v13 = 0xA000000000000000;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  result = static Token.== infix(_:_:)(v17, &v12);
  if ((result & 1) != 0)
  {
    result = sub_2409A442C(v6, v9, v5);
    v6 = 0;
    v9 = 0;
    v4 = 0;
    v7 = 0;
    v8 = 0;
    v5 = 0x1FFFFFFFELL;
  }
  *v2 = v6;
  v2[1] = v9;
  v2[2] = v5;
  v2[3] = v4;
  v2[4] = v7;
  v2[5] = v8;
  return result;
}

uint64_t sub_2409A442C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t result;

  v3 = a3 >> 60;
  if ((a3 >> 60) <= 9)
  {
    if (((1 << v3) & 0x1BF) != 0)
      return swift_bridgeObjectRelease();
    if ((_DWORD)v3 == 9)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_2409A4494()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 17) = 1;
}

uint64_t sub_2409A44A0()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_2409A44C8()
{
  unint64_t result;

  result = qword_257073000;
  if (!qword_257073000)
  {
    result = MEMORY[0x242685B78](&unk_2409C6540, &type metadata for TokenSequence.Iterator);
    atomic_store(result, (unint64_t *)&qword_257073000);
  }
  return result;
}

void sub_2409A450C(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *(_QWORD *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
}

uint64_t sub_2409A4520()
{
  return 0;
}

uint64_t sub_2409A4528()
{
  return 2;
}

uint64_t sub_2409A4530()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = sub_2409A4730(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2409A4564(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD **v3;

  return sub_2409A4AA4(a1, a2, a3, *v3);
}

uint64_t sub_2409A456C()
{
  return sub_2409C5E68();
}

ValueMetadata *type metadata accessor for TokenSequence()
{
  return &type metadata for TokenSequence;
}

uint64_t destroy for TokenSequence.Iterator()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s33LinkPresentationStyleSheetParsing13TokenSequenceV8IteratorVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TokenSequence.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TokenSequence.Iterator(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenSequence.Iterator(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 18))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenSequence.Iterator(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenSequence.Iterator()
{
  return &type metadata for TokenSequence.Iterator;
}

uint64_t sub_2409A4730(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BOOL v35;
  uint64_t result;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  __int128 v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[7];

  v1 = *(_QWORD *)(a1 + 16);
  v42 = a1 + 32;
  swift_bridgeObjectRetain();
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v43 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v5 = (uint64_t *)(MEMORY[0x24BEE4AF8] + 32);
  v6 = 1;
  v41 = v1;
  while (1)
  {
    v7 = v2;
    if (v2 >= v1)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0xA000000000000000;
      v13 = 21;
    }
    else
    {
      if ((v6 & 1) != 0)
      {
        if (v2)
          goto LABEL_37;
      }
      else if (v4 >= v2 || v2 < 0)
      {
        goto LABEL_37;
      }
      v14 = (uint64_t *)(v42 + 48 * v2);
      v15 = *v14;
      v16 = v14[1];
      v18 = v14[2];
      v17 = v14[3];
      v19 = v14[4];
      v20 = v14[5];
      sub_2409A4D64(*v14, v16, v18);
      v11 = v20;
      v10 = v19;
      v9 = v17;
      v12 = v18;
      v8 = v16;
      v13 = v15;
    }
    v21 = v13;
    v49[0] = v13;
    v49[1] = v8;
    v22 = v8;
    v23 = v12;
    v49[2] = v12;
    v49[3] = v9;
    v24 = v9;
    v25 = v10;
    v49[4] = v10;
    v49[5] = v11;
    v26 = v11;
    v44 = xmmword_2409C6490;
    v45 = 0xA000000000000000;
    v47 = 0;
    v48 = 0;
    v46 = 0;
    if ((static Token.== infix(_:_:)(v49, &v44) & 1) != 0)
      break;
    if (!v3)
    {
      v27 = v43[3];
      if ((uint64_t)((v27 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_35;
      v28 = v27 & 0xFFFFFFFFFFFFFFFELL;
      if (v28 <= 1)
        v29 = 1;
      else
        v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073008);
      v30 = (_QWORD *)swift_allocObject();
      v31 = (uint64_t)(_swift_stdlib_malloc_size(v30) - 32) / 48;
      v30[2] = v29;
      v30[3] = 2 * v31;
      v32 = (unint64_t)(v30 + 4);
      v33 = v43[3] >> 1;
      if (v43[2])
      {
        if (v30 != v43 || v32 >= (unint64_t)&v43[6 * v33 + 4])
        {
          v40 = v31;
          memmove(v30 + 4, v43 + 4, 48 * v33);
          v32 = (unint64_t)(v30 + 4);
          v31 = v40;
        }
        v43[2] = 0;
      }
      v5 = (uint64_t *)(v32 + 48 * v33);
      v3 = (v31 & 0x7FFFFFFFFFFFFFFFLL) - v33;
      swift_release();
      v43 = v30;
      v1 = v41;
    }
    v35 = __OFSUB__(v3--, 1);
    if (v35)
    {
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    v6 = 0;
    *v5 = v21;
    v5[1] = v22;
    v5[2] = v23;
    v5[3] = v24;
    v5[4] = v25;
    v5[5] = v26;
    v5 += 6;
    if (v7 >= v1)
      v2 = v7;
    else
      v2 = v7 + 1;
    v4 = v7;
  }
  sub_2409A442C(v21, v22, v23);
  swift_bridgeObjectRelease();
  result = (uint64_t)v43;
  v37 = v43[3];
  if (v37 < 2)
    return result;
  v38 = v37 >> 1;
  v35 = __OFSUB__(v38, v3);
  v39 = v38 - v3;
  if (!v35)
  {
    v43[2] = v39;
    return result;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  result = sub_2409C603C();
  __break(1u);
  return result;
}

uint64_t sub_2409A4AA4(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD *a4)
{
  BOOL v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (!a2)
  {
    v13 = 0;
    a3 = 0;
    v5 = 1;
LABEL_28:
    *(_QWORD *)a1 = a4;
    *(_QWORD *)(a1 + 8) = v13;
    *(_BYTE *)(a1 + 16) = v5;
    *(_BYTE *)(a1 + 17) = 0;
    return a3;
  }
  v5 = a3 == 0;
  if (!a3)
  {
    v13 = 0;
    goto LABEL_28;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v25 = a3;
    v26 = a4;
    v24 = a4[2];
    if (v24)
    {
      v8 = a4[4];
      v7 = a4[5];
      v10 = a4[6];
      v9 = a4[7];
      v11 = a4[8];
      v12 = a4[9];
      sub_2409A4D64(v8, v7, v10);
    }
    else
    {
      v7 = 0;
      v9 = 0;
      v11 = 0;
      v12 = 0;
      v8 = 21;
      v10 = 0xA000000000000000;
    }
    v32 = v8;
    v33 = v7;
    v34 = v10;
    v35 = v9;
    v36 = v11;
    v37 = v12;
    v27 = xmmword_2409C6490;
    v28 = 0xA000000000000000;
    v30 = 0;
    v31 = 0;
    v29 = 0;
    if ((static Token.== infix(_:_:)(&v32, &v27) & 1) != 0)
    {
      v13 = 0;
      v14 = 0;
LABEL_26:
      sub_2409A442C(v8, v7, v10);
      v5 = 0;
      a3 = v14;
    }
    else
    {
      *a2 = v8;
      a2[1] = v7;
      a2[2] = v10;
      a2[3] = v9;
      a2[4] = v11;
      a2[5] = v12;
      a3 = v25;
      if (v25 != 1)
      {
        v15 = 0;
        a4 = v26;
        v23 = a1;
        v16 = a2 + 11;
        v14 = 1;
        while (1)
        {
          v17 = a4[2];
          if (v15 >= v17)
            v13 = v15;
          else
            v13 = v15 + 1;
          if (v13 >= v24)
          {
            v7 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v10 = 0xA000000000000000;
            v8 = 21;
          }
          else
          {
            if ((uint64_t)v15 >= v13)
              goto LABEL_31;
            if (v13 >= v17)
            {
              __break(1u);
              goto LABEL_30;
            }
            v18 = &v26[6 * v13 + 4];
            v8 = *v18;
            v7 = v18[1];
            v10 = v18[2];
            v19 = v18[3];
            v20 = v18[4];
            v21 = v18[5];
            sub_2409A4D64(*v18, v7, v10);
          }
          v32 = v8;
          v33 = v7;
          v34 = v10;
          v35 = v19;
          v36 = v20;
          v37 = v21;
          v27 = xmmword_2409C6490;
          v28 = 0xA000000000000000;
          v30 = 0;
          v31 = 0;
          v29 = 0;
          if ((static Token.== infix(_:_:)(&v32, &v27) & 1) != 0)
          {
            a1 = v23;
            goto LABEL_26;
          }
          ++v14;
          *(v16 - 5) = v8;
          *(v16 - 4) = v7;
          *(v16 - 3) = v10;
          *(v16 - 2) = v19;
          *(v16 - 1) = v20;
          *v16 = v21;
          v16 += 6;
          v15 = v13;
          a3 = v25;
          a4 = v26;
          if (v25 == v14)
          {
            v5 = 0;
            a1 = v23;
            goto LABEL_28;
          }
        }
      }
      v13 = 0;
      v5 = 0;
    }
    a4 = v26;
    goto LABEL_28;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  result = sub_2409C603C();
  __break(1u);
  return result;
}

uint64_t sub_2409A4D64(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t result;

  v3 = a3 >> 60;
  if ((a3 >> 60) <= 9)
  {
    if (((1 << v3) & 0x1BF) != 0)
      return swift_bridgeObjectRetain();
    if ((_DWORD)v3 == 9)
    {
      swift_bridgeObjectRetain();
      return swift_bridgeObjectRetain();
    }
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242685B60]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double sub_2409A4E0C@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  char v4;
  double result;
  ValueMetadata *v6;
  char **v7;
  char v8;
  char v9;

  swift_getKeyPath();
  v4 = sub_2409A8468();
  swift_release();
  if ((v4 & 1) != 0)
  {
    v6 = &type metadata for TokenProducers.Whitespace;
    v7 = &off_2510BBC08;
LABEL_3:
    *(_QWORD *)(a2 + 24) = v6;
    *(_QWORD *)(a2 + 32) = v7;
  }
  else
  {
    switch(a1)
    {
      case '"':
        v6 = &type metadata for TokenProducers.QuotationMark;
        v7 = (char **)&off_2510BBD28;
        goto LABEL_3;
      case '#':
        v6 = &type metadata for TokenProducers.NumberSign;
        v7 = (char **)&off_2510BBBD8;
        goto LABEL_3;
      case '$':
        v6 = &type metadata for TokenProducers.DollarSign;
        v7 = (char **)&off_2510BBBA8;
        goto LABEL_3;
      case '\'':
        v6 = &type metadata for TokenProducers.Apostrophe;
        v7 = (char **)&off_2510BBB78;
        goto LABEL_3;
      case '(':
        v6 = &type metadata for TokenProducers.LeftParenthesis;
        v7 = (char **)&off_2510BBD88;
        goto LABEL_3;
      case ')':
        v6 = &type metadata for TokenProducers.RightParenthesis;
        v7 = (char **)&off_2510BBE18;
        goto LABEL_3;
      case '*':
        v6 = &type metadata for TokenProducers.Asterisk;
        v7 = (char **)&off_2510BBFF8;
        goto LABEL_3;
      case '+':
        v6 = &type metadata for TokenProducers.PlusSign;
        v7 = (char **)&off_2510BC058;
        goto LABEL_3;
      case ',':
        v6 = &type metadata for TokenProducers.Comma;
        v7 = (char **)&off_2510BBF38;
        goto LABEL_3;
      case '-':
        v6 = &type metadata for TokenProducers.HyphenMinus;
        v7 = (char **)&off_2510BBC38;
        goto LABEL_3;
      case '.':
        v6 = &type metadata for TokenProducers.FullStop;
        v7 = (char **)&off_2510BC028;
        goto LABEL_3;
      case '/':
        v6 = &type metadata for TokenProducers.Solidus;
        v7 = (char **)&off_2510BBFC8;
        goto LABEL_3;
      case ':':
        v6 = &type metadata for TokenProducers.Colon;
        v7 = (char **)&off_2510BBF08;
        goto LABEL_3;
      case ';':
        v6 = &type metadata for TokenProducers.Semicolon;
        v7 = (char **)&off_2510BC088;
        goto LABEL_3;
      case '<':
        v6 = &type metadata for TokenProducers.LessThanSign;
        v7 = (char **)&off_2510BBCC8;
        goto LABEL_3;
      case '@':
        v6 = &type metadata for TokenProducers.CommercialAt;
        v7 = (char **)&off_2510BBC68;
        goto LABEL_3;
      case 'U':
      case 'u':
        v6 = &type metadata for TokenProducers.LatinLetterU;
        v7 = (char **)&off_2510BBC98;
        goto LABEL_3;
      case '[':
        v6 = &type metadata for TokenProducers.LeftSquareBracket;
        v7 = (char **)&off_2510BBE48;
        goto LABEL_3;
      case '\\':
        v6 = &type metadata for TokenProducers.ReverseSolidus;
        v7 = (char **)&off_2510BBD58;
        goto LABEL_3;
      case ']':
        v6 = &type metadata for TokenProducers.RightSquareBracket;
        v7 = (char **)&off_2510BBEA8;
        goto LABEL_3;
      case '^':
        v6 = &type metadata for TokenProducers.CircumflexAccent;
        v7 = (char **)&off_2510BBDB8;
        goto LABEL_3;
      case '{':
        v6 = &type metadata for TokenProducers.LeftCurlyBracket;
        v7 = (char **)&off_2510BBDE8;
        goto LABEL_3;
      case '|':
        v6 = &type metadata for TokenProducers.VerticalLine;
        v7 = (char **)&off_2510BBCF8;
        goto LABEL_3;
      case '}':
        v6 = &type metadata for TokenProducers.RightCurlyBracket;
        v7 = (char **)&off_2510BBE78;
        goto LABEL_3;
      case '~':
        v6 = &type metadata for TokenProducers.Tilde;
        v7 = (char **)&off_2510BBF98;
        goto LABEL_3;
      default:
        swift_getKeyPath();
        v8 = sub_2409A8468();
        swift_release();
        if ((v8 & 1) != 0)
        {
          v6 = &type metadata for TokenProducers.Digit;
          v7 = (char **)&off_2510BBF68;
          goto LABEL_3;
        }
        swift_getKeyPath();
        v9 = sub_2409A8468();
        swift_release();
        if ((v9 & 1) != 0)
        {
          v6 = &type metadata for TokenProducers.Name;
          v7 = (char **)&off_2510BBED8;
          goto LABEL_3;
        }
        *(_QWORD *)(a2 + 32) = 0;
        result = 0.0;
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;
        break;
    }
  }
  return result;
}

uint64_t sub_2409A5124@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = v2;
  sub_2409A51D8(v3, (uint64_t)v9);
  v6 = v10;
  if (v10)
  {
    v7 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 8))(a1, v6, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    result = sub_2409A5220((uint64_t)v9);
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0x1FFFFFFFELL;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
  }
  return result;
}

uint64_t sub_2409A51D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2409A5220(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2409A52A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for Token(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnyTokenProducer(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    return __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t initializeWithCopy for AnyTokenProducer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    v4 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v3;
    *(_QWORD *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for AnyTokenProducer(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = *((_QWORD *)a2 + 3);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 24) = v4;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    v5 = *a2;
    v6 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnyTokenProducer(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyTokenProducer(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyTokenProducer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyTokenProducer()
{
  return &type metadata for AnyTokenProducer;
}

uint64_t sub_2409A5658@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2409A3644();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2409A5684@<X0>(unsigned int *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_2409A37B8(*a1);
  *a2 = result & 1;
  return result;
}

ValueMetadata *type metadata accessor for TokenProducers.Whitespace()
{
  return &type metadata for TokenProducers.Whitespace;
}

ValueMetadata *type metadata accessor for TokenProducers.QuotationMark()
{
  return &type metadata for TokenProducers.QuotationMark;
}

ValueMetadata *type metadata accessor for TokenProducers.NumberSign()
{
  return &type metadata for TokenProducers.NumberSign;
}

ValueMetadata *type metadata accessor for TokenProducers.DollarSign()
{
  return &type metadata for TokenProducers.DollarSign;
}

ValueMetadata *type metadata accessor for TokenProducers.Apostrophe()
{
  return &type metadata for TokenProducers.Apostrophe;
}

ValueMetadata *type metadata accessor for TokenProducers.LeftParenthesis()
{
  return &type metadata for TokenProducers.LeftParenthesis;
}

ValueMetadata *type metadata accessor for TokenProducers.RightParenthesis()
{
  return &type metadata for TokenProducers.RightParenthesis;
}

ValueMetadata *type metadata accessor for TokenProducers.Asterisk()
{
  return &type metadata for TokenProducers.Asterisk;
}

ValueMetadata *type metadata accessor for TokenProducers.PlusSign()
{
  return &type metadata for TokenProducers.PlusSign;
}

ValueMetadata *type metadata accessor for TokenProducers.Comma()
{
  return &type metadata for TokenProducers.Comma;
}

ValueMetadata *type metadata accessor for TokenProducers.HyphenMinus()
{
  return &type metadata for TokenProducers.HyphenMinus;
}

ValueMetadata *type metadata accessor for TokenProducers.FullStop()
{
  return &type metadata for TokenProducers.FullStop;
}

ValueMetadata *type metadata accessor for TokenProducers.Solidus()
{
  return &type metadata for TokenProducers.Solidus;
}

ValueMetadata *type metadata accessor for TokenProducers.Colon()
{
  return &type metadata for TokenProducers.Colon;
}

ValueMetadata *type metadata accessor for TokenProducers.Semicolon()
{
  return &type metadata for TokenProducers.Semicolon;
}

ValueMetadata *type metadata accessor for TokenProducers.LessThanSign()
{
  return &type metadata for TokenProducers.LessThanSign;
}

ValueMetadata *type metadata accessor for TokenProducers.CommercialAt()
{
  return &type metadata for TokenProducers.CommercialAt;
}

ValueMetadata *type metadata accessor for TokenProducers.LeftSquareBracket()
{
  return &type metadata for TokenProducers.LeftSquareBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.ReverseSolidus()
{
  return &type metadata for TokenProducers.ReverseSolidus;
}

ValueMetadata *type metadata accessor for TokenProducers.RightSquareBracket()
{
  return &type metadata for TokenProducers.RightSquareBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.CircumflexAccent()
{
  return &type metadata for TokenProducers.CircumflexAccent;
}

ValueMetadata *type metadata accessor for TokenProducers.LeftCurlyBracket()
{
  return &type metadata for TokenProducers.LeftCurlyBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.RightCurlyBracket()
{
  return &type metadata for TokenProducers.RightCurlyBracket;
}

ValueMetadata *type metadata accessor for TokenProducers.LatinLetterU()
{
  return &type metadata for TokenProducers.LatinLetterU;
}

ValueMetadata *type metadata accessor for TokenProducers.VerticalLine()
{
  return &type metadata for TokenProducers.VerticalLine;
}

ValueMetadata *type metadata accessor for TokenProducers.Tilde()
{
  return &type metadata for TokenProducers.Tilde;
}

ValueMetadata *type metadata accessor for TokenProducers.Digit()
{
  return &type metadata for TokenProducers.Digit;
}

ValueMetadata *type metadata accessor for TokenProducers.Name()
{
  return &type metadata for TokenProducers.Name;
}

double sub_2409A5870@<D0>(uint64_t a1@<X8>)
{
  double result;

  sub_2409A9AF0();
  *(_QWORD *)&result = 9;
  *(_OWORD *)a1 = xmmword_2409C6AD0;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

double sub_2409A58BC@<D0>(_OWORD *a1@<X8>)
{
  return sub_2409A5A80(34, a1);
}

uint64_t sub_2409A58D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v3 = *(uint64_t (**)(void))(*(_QWORD *)a1 + 216);
  v4 = *(_QWORD *)(((uint64_t (*)(uint64_t))v3)(a1) + 16);
  v5 = swift_bridgeObjectRelease();
  if (!v4)
  {
LABEL_4:
    v8 = ((uint64_t (*)(uint64_t))v3)(v5);
    v9 = sub_2409A84C8(v8);
    swift_bridgeObjectRelease();
    if (!v9)
    {
      v13 = 0;
      v14 = 0x6000000000000000;
      result = 35;
      goto LABEL_7;
    }
LABEL_5:
    v10 = v3();
    v11 = sub_2409A8584(v10);
    swift_bridgeObjectRelease();
    result = sub_2409AA260();
    v14 = !v11 | 0x3000000000000000;
LABEL_7:
    *a2 = result;
    a2[1] = v13;
    a2[2] = v14;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
    return result;
  }
  v6 = ((uint64_t (*)(uint64_t))v3)(v5);
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = *(_DWORD *)(v6 + 32);
    swift_bridgeObjectRelease();
    v5 = sub_2409A37B8(v7);
    if ((v5 & 1) != 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2409A59A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2409A58D4(a1, a2);
}

uint64_t sub_2409A59C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v5 = *(_DWORD *)(v4 + 32);
  result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    v7 = 0x6000000000000000;
    v8 = 36;
    goto LABEL_6;
  }
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(result);
  v7 = 0xA000000000000000;
  v8 = 6;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A5A44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2409A59C8(a1, a2);
}

double sub_2409A5A68@<D0>(_OWORD *a1@<X8>)
{
  return sub_2409A5A80(39, a1);
}

double sub_2409A5A80@<D0>(int a1@<W3>, _OWORD *a2@<X8>)
{
  __int128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;

  sub_2409A3F28(a1, v5);
  v3 = v5[1];
  *a2 = v5[0];
  a2[1] = v3;
  result = *(double *)&v6;
  a2[2] = v6;
  return result;
}

double sub_2409A5AD4@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 17;
  *(_OWORD *)a1 = xmmword_2409C6AE0;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

double sub_2409A5AF0@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 18;
  *(_OWORD *)a1 = xmmword_2409C6AF0;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_2409A5B0C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v5 = *(_DWORD *)(v4 + 32);
  result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    v7 = 0x6000000000000000;
    v8 = 42;
    goto LABEL_6;
  }
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(result);
  v7 = 0xA000000000000000;
  v8 = 7;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A5B88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2409A5B0C(a1, a2);
}

double sub_2409A5BAC@<D0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  return sub_2409A5F44(a1, a2, (__n128)xmmword_2409C6B00);
}

double sub_2409A5BC8@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 14;
  *(_OWORD *)a1 = xmmword_2409C6B10;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_2409A5BE4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  unint64_t v16;
  _OWORD v17[3];

  v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216);
  if (*(_QWORD *)(v5(a1) + 16))
  {
    swift_bridgeObjectRelease();
    v6 = sub_2409A3644();
    if ((v6 & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)a1 + 280))();
      result = sub_2409A3E2C((uint64_t *)v17);
      if (v2)
      {
        result = MEMORY[0x242685B0C](v2);
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0x1FFFFFFFELL;
        a2[3] = 0;
        a2[4] = 0;
        a2[5] = 0;
        return result;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v6 = swift_bridgeObjectRelease();
  }
  v8 = v5(v6);
  v9 = sub_2409A8584(v8);
  v10 = swift_bridgeObjectRelease();
  if (v9)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 280))(v10);
    result = sub_2409A3C98((uint64_t)v17);
LABEL_8:
    v11 = v17[1];
    *(_OWORD *)a2 = v17[0];
    *((_OWORD *)a2 + 1) = v11;
    *((_OWORD *)a2 + 2) = v17[2];
    return result;
  }
  v12 = v5(v10);
  v13 = sub_2409A5D38(15917, 0xE200000000000000, v12);
  result = swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
  {
    v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272);
    v15 = v14(result);
    result = v14(v15);
    *(_OWORD *)a2 = xmmword_2409C6B30;
    v16 = 0xA000000000000000;
  }
  else
  {
    *(_OWORD *)a2 = xmmword_2409C6B20;
    v16 = 0x6000000000000000;
  }
  a2[2] = v16;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A5D38(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if ((a2 & 0x2000000000000000) != 0)
    v5 = HIBYTE(a2) & 0xF;
  else
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  v6 = *(_QWORD *)(a3 + 16);
  if (v6)
  {
    if (v5)
    {
      v8 = *(_DWORD *)(a3 + 32);
      v15 = a1 & 0x1000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9 = 0;
      v10 = 0;
      v11 = v6 - 1;
      while (1)
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          if (v8 != sub_2409C5FA0())
            goto LABEL_22;
        }
        else
        {
          if ((a2 & 0x2000000000000000) == 0 && !v15)
            sub_2409C5FDC();
          if (v8 != sub_2409C5FE8())
          {
LABEL_22:
            swift_bridgeObjectRelease();
            goto LABEL_30;
          }
        }
        v10 += v12;
        if (v11 == v9)
          break;
        v8 = *(_DWORD *)(a3 + 4 * v9++ + 36);
        if (v10 >= v5)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          swift_bridgeObjectRelease();
          return 1;
        }
      }
      swift_bridgeObjectRelease();
      if (v10 >= v5)
        goto LABEL_17;
      if ((a2 & 0x1000000000000000) == 0)
      {
        v14 = v15;
        if ((a2 & 0x2000000000000000) == 0)
        {
LABEL_26:
          if (!v14)
            sub_2409C5FDC();
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
  else if (v5)
  {
    swift_bridgeObjectRetain();
    if ((a2 & 0x1000000000000000) == 0)
    {
      if ((a2 & 0x2000000000000000) == 0)
      {
        v14 = a1 & 0x1000000000000000;
        goto LABEL_26;
      }
LABEL_28:
      sub_2409C5FE8();
LABEL_30:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_29:
    sub_2409C5FA0();
    goto LABEL_30;
  }
  return 1;
}

uint64_t sub_2409A5F30@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2409A5BE4(a1, a2);
}

double sub_2409A5F44@<D0>(uint64_t a1@<X0>, __n128 *a2@<X8>, __n128 a3@<Q0>)
{
  uint64_t v3;
  double result;
  __n128 v7;
  _OWORD v9[2];
  __n128 v10;

  if (!*(_QWORD *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1) + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  if ((sub_2409A3644() & 1) == 0)
  {
LABEL_6:
    result = a3.n128_f64[0];
    *a2 = a3;
    a2[1].n128_u64[0] = 0x6000000000000000;
    a2[1].n128_u64[1] = 0;
    a2[2].n128_u64[0] = 0;
    a2[2].n128_u64[1] = 0;
    return result;
  }
  (*(void (**)(void))(*(_QWORD *)a1 + 280))();
  sub_2409A3E2C((uint64_t *)v9);
  if (v3)
  {
    MEMORY[0x242685B0C](v3);
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0x1FFFFFFFELL;
    a2[1].n128_u64[1] = 0;
    a2[2].n128_u64[0] = 0;
    a2[2].n128_u64[1] = 0;
  }
  else
  {
    v7 = (__n128)v9[1];
    *a2 = (__n128)v9[0];
    a2[1] = v7;
    result = v10.n128_f64[0];
    a2[2] = v10;
  }
  return result;
}

double sub_2409A6010@<D0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  return sub_2409A5F44(a1, a2, (__n128)xmmword_2409C6B40);
}

uint64_t sub_2409A602C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  char v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v5 = *(_DWORD *)(v4 + 32);
  result = swift_bridgeObjectRelease();
  if (v5 != 42)
  {
LABEL_10:
    *(_OWORD *)a2 = xmmword_2409C6B50;
    a2[2] = 0x6000000000000000;
    a2[3] = 0;
    a2[4] = 0;
    a2[5] = 0;
    return result;
  }
  v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 256);
  v8 = v7(2);
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return sub_2409A40D0(a2);
  }
  v9 = sub_2409A5D38(12074, 0xE200000000000000, v8);
  v10 = swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    v11 = *(void (**)(uint64_t))(*(_QWORD *)a1 + 272);
    do
    {
      v11(v10);
      v12 = v7(2);
      if (!*(_QWORD *)(v12 + 16))
        goto LABEL_11;
      v13 = sub_2409A5D38(12074, 0xE200000000000000, v12);
      v10 = swift_bridgeObjectRelease();
    }
    while ((v13 & 1) == 0);
  }
  v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272);
  v15 = v14(v10);
  v14(v15);
  return sub_2409A40D0(a2);
}

uint64_t sub_2409A6154@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2409A602C(a1, a2);
}

double sub_2409A6168@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 12;
  *(_OWORD *)a1 = xmmword_2409C6B60;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

double sub_2409A6184@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 13;
  *(_OWORD *)a1 = xmmword_2409C6B70;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_2409A61A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  v5 = sub_2409A5D38(2960673, 0xE300000000000000, v4);
  result = swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272);
    v8 = v7(result);
    v9 = v7(v8);
    result = v7(v9);
    v10 = 0xA000000000000000;
    v11 = 10;
  }
  else
  {
    v10 = 0x6000000000000000;
    v11 = 60;
  }
  *a2 = v11;
  a2[1] = 0;
  a2[2] = v10;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A6240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  BOOL v4;
  uint64_t result;
  uint64_t v6;
  int64x2_t v7;

  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  v4 = sub_2409A8584(v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    result = sub_2409AA260();
    v7 = vdupq_n_s64(0x2000000000000000uLL);
    v7.i64[0] = v6;
  }
  else
  {
    v7 = (int64x2_t)xmmword_2409C6B80;
    result = 64;
  }
  *(_QWORD *)a2 = result;
  *(int64x2_t *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

double sub_2409A62CC@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 15;
  *(_OWORD *)a1 = xmmword_2409C6B90;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

double sub_2409A62E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  int v5;
  __int128 v6;
  double result;
  _OWORD v8[2];
  __int128 v9;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  if (*(_QWORD *)(v4 + 16))
  {
    v5 = *(_DWORD *)(v4 + 32);
    swift_bridgeObjectRelease();
    if (sub_2409A8498(92, v5))
    {
      (*(void (**)(void))(*(_QWORD *)a1 + 280))();
      sub_2409A3C98((uint64_t)v8);
      v6 = v8[1];
      *(_OWORD *)a2 = v8[0];
      *(_OWORD *)(a2 + 16) = v6;
      result = *(double *)&v9;
      *(_OWORD *)(a2 + 32) = v9;
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&result = 92;
  *(_OWORD *)a2 = xmmword_2409C6BA0;
  *(_QWORD *)(a2 + 16) = 0x6000000000000000;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

double sub_2409A6388@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2409A62E8(a1, a2);
}

double sub_2409A63AC@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 16;
  *(_OWORD *)a1 = xmmword_2409C6BB0;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_2409A63C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v5 = *(_DWORD *)(v4 + 32);
  result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    v7 = 0x6000000000000000;
    v8 = 94;
    goto LABEL_6;
  }
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(result);
  v7 = 0xA000000000000000;
  v8 = 5;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A6444@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2409A63C8(a1, a2);
}

double sub_2409A6468@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 19;
  *(_OWORD *)a1 = xmmword_2409C6BC0;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

double sub_2409A6484@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 20;
  *(_OWORD *)a1 = xmmword_2409C6BD0;
  *(_QWORD *)(a1 + 16) = 0xA000000000000000;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_2409A64A0@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];

  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 280))(a1);
  result = sub_2409A3E2C((uint64_t *)v8);
  if (v2)
  {
    result = MEMORY[0x242685B0C](v2);
    v5 = xmmword_2409C6BE0;
    v6 = 0uLL;
    v7 = 0uLL;
  }
  else
  {
    v6 = v8[0];
    v5 = v8[1];
    v7 = v8[2];
  }
  *a2 = v6;
  a2[1] = v5;
  a2[2] = v7;
  return result;
}

uint64_t sub_2409A6520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  _OWORD v20[3];

  v5 = sub_2409C61F8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216);
  v11 = *(_QWORD *)(v10(v7) + 16);
  v12 = swift_bridgeObjectRelease();
  if (v11 < 2)
    goto LABEL_11;
  v13 = v10(v12);
  if (!*(_QWORD *)(v13 + 16))
  {
    v12 = swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v14 = *(_DWORD *)(v13 + 32);
  v12 = swift_bridgeObjectRelease();
  if (v14 != 43)
  {
LABEL_11:
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 280))(v12);
    result = sub_2409A3C98((uint64_t)v20);
    v19 = v20[1];
    *(_OWORD *)a2 = v20[0];
    *(_OWORD *)(a2 + 16) = v19;
    *(_OWORD *)(a2 + 32) = v20[2];
    return result;
  }
  result = v10(v12);
  if (*(_QWORD *)(result + 16) < 2uLL)
  {
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_2409C6204();
  v16 = sub_2409C61D4();
  v17 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  if ((v16 & 1) != 0)
    goto LABEL_8;
  result = v10(v17);
  if (*(_QWORD *)(result + 16) < 2uLL)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v18 = *(_DWORD *)(result + 36);
  v12 = swift_bridgeObjectRelease();
  if (v18 != 63)
    goto LABEL_11;
LABEL_8:
  result = sub_2409AA9B0();
  if (!v2)
  {
    *(_OWORD *)a2 = xmmword_2409C6BF0;
    *(_QWORD *)(a2 + 16) = 0xA000000000000000;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 40) = 0;
  }
  return result;
}

uint64_t sub_2409A66B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2409A6520(a1, a2);
}

double sub_2409A66C4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;

  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 280))(a1);
  sub_2409A3C98((uint64_t)v5);
  v3 = v5[1];
  *a2 = v5[0];
  a2[1] = v3;
  result = *(double *)&v6;
  a2[2] = v6;
  return result;
}

uint64_t sub_2409A6720@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216);
  v5 = v4(a1);
  if (!*(_QWORD *)(v5 + 16))
  {
    v7 = swift_bridgeObjectRelease();
LABEL_5:
    v11 = v4(v7);
    if (*(_QWORD *)(v11 + 16))
    {
      v12 = *(_DWORD *)(v11 + 32);
      result = swift_bridgeObjectRelease();
      if (v12 == 124)
      {
        result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(result);
        v9 = 0xA000000000000000;
        v10 = 8;
        goto LABEL_10;
      }
    }
    else
    {
      result = swift_bridgeObjectRelease();
    }
    v9 = 0x6000000000000000;
    v10 = 124;
    goto LABEL_10;
  }
  v6 = *(_DWORD *)(v5 + 32);
  v7 = swift_bridgeObjectRelease();
  if (v6 != 61)
    goto LABEL_5;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(v7);
  v9 = 0xA000000000000000;
  v10 = 4;
LABEL_10:
  *a2 = v10;
  a2[1] = 0;
  a2[2] = v9;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A67D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2409A6720(a1, a2);
}

uint64_t sub_2409A67F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  v5 = *(_DWORD *)(v4 + 32);
  result = swift_bridgeObjectRelease();
  if (v5 != 61)
  {
LABEL_5:
    v7 = 0x6000000000000000;
    v8 = 126;
    goto LABEL_6;
  }
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(result);
  v7 = 0xA000000000000000;
  v8 = 3;
LABEL_6:
  *a2 = v8;
  a2[1] = 0;
  a2[2] = v7;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
  return result;
}

uint64_t sub_2409A6874@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2409A67F8(a1, a2);
}

uint64_t Token.Number.hash(into:)()
{
  return sub_2409C618C();
}

BOOL static Token.Number.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2409A68E0()
{
  return sub_2409C618C();
}

BOOL sub_2409A690C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s33LinkPresentationStyleSheetParsing5TokenO6NumberO9hashValueSivg_0()
{
  sub_2409C6180();
  sub_2409C618C();
  return sub_2409C6198();
}

uint64_t sub_2409A696C()
{
  sub_2409C6180();
  sub_2409C618C();
  return sub_2409C6198();
}

void _s33LinkPresentationStyleSheetParsing5TokenO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2409A6A08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (v3 >> 60)
  {
    v14 = v2;
    v15 = v1;
    v11 = v0;
    swift_bridgeObjectRetain();
    sub_2409A4D64(v11, v4, v3);
    sub_2409A442C(v15, v14, v5);
    sub_2409A442C(v11, v4, v3);
    v6 = 0;
  }
  else
  {
    if (v1 == v0 && v2 == v4)
    {
      v6 = 1;
      v7 = v1;
      v8 = v2;
    }
    else
    {
      v9 = v0;
      v7 = v1;
      v8 = v2;
      v10 = sub_2409C6144();
      v0 = v9;
      v6 = v10;
    }
    v13 = v0;
    sub_2409A4D64(v0, v4, v3);
    sub_2409A4D64(v7, v8, v5);
    sub_2409A442C(v7, v8, v5);
    sub_2409A442C(v13, v4, v3);
  }
  return v6 & 1;
}

unint64_t sub_2409A7C4C()
{
  unint64_t result;

  result = qword_257073018;
  if (!qword_257073018)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for Token.Number, &type metadata for Token.Number);
    atomic_store(result, (unint64_t *)&qword_257073018);
  }
  return result;
}

unint64_t sub_2409A7C94()
{
  unint64_t result;

  result = qword_257073020;
  if (!qword_257073020)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for Token.HashType, &type metadata for Token.HashType);
    atomic_store(result, (unint64_t *)&qword_257073020);
  }
  return result;
}

uint64_t destroy for Token(uint64_t a1)
{
  return sub_2409A442C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t *initializeWithCopy for Token(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  sub_2409A4D64(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for Token(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  sub_2409A4D64(*a2, v4, v5);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  sub_2409A442C(v9, v10, v11);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Token(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int128 v6;

  v3 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = a2[2];
  sub_2409A442C(v3, v5, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Token(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for Token(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 2 * -a2;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 40) = 0;
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2409A7ED8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16) >> 60;
  if (v1 <= 9)
    return v1;
  else
    return (*(_DWORD *)a1 + 10);
}

uint64_t sub_2409A7EF4(uint64_t result)
{
  *(_QWORD *)(result + 16) &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_2409A7F04(uint64_t result, uint64_t a2)
{
  if (a2 < 0xA)
  {
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 1 | (a2 << 60);
  }
  else
  {
    *(_QWORD *)result = (a2 - 10);
    *(_OWORD *)(result + 8) = xmmword_2409C6480;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Token()
{
  return &type metadata for Token;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2409A7F64(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2409A7F6C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Token.Number()
{
  return &type metadata for Token.Number;
}

uint64_t _s9BaseColorV28ColorComponentRepresentationOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s33LinkPresentationStyleSheetParsing5TokenO8HashTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409A8064 + 4 * byte_2409C6C10[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2409A8098 + 4 * byte_2409C6C0B[v4]))();
}

uint64_t sub_2409A8098(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409A80A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409A80A8);
  return result;
}

uint64_t sub_2409A80B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409A80BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2409A80C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409A80C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Token.HashType()
{
  return &type metadata for Token.HashType;
}

uint64_t Tokenizer.tokens.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t result;

  v2 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 120);
  result = v2();
  if (!result)
  {
    result = sub_2409A814C();
    if (!v1)
    {
      result = ((uint64_t (*)(uint64_t))v2)(result);
      if (!result)
        __break(1u);
    }
  }
  return result;
}

uint64_t sub_2409A814C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_2409A40D0(&v15);
  v2 = (char *)MEMORY[0x24BEE4AF8];
  if (v1)
    return swift_bridgeObjectRelease();
  while (1)
  {
    v4 = v17;
    if (v17 >> 1 == 0xFFFFFFFF)
      break;
    v5 = v15;
    v6 = v16;
    v7 = v18;
    v8 = v19;
    v9 = v20;
    sub_2409A4D64(v15, v16, v17);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_2409A833C(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v10 = v2;
    v11 = *((_QWORD *)v2 + 2);
    v12 = v10;
    v13 = *((_QWORD *)v10 + 3);
    if (v11 >= v13 >> 1)
      v12 = sub_2409A833C((char *)(v13 > 1), v11 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v11 + 1;
    v14 = &v12[48 * v11];
    v2 = v12;
    *((_QWORD *)v14 + 4) = v5;
    *((_QWORD *)v14 + 5) = v6;
    *((_QWORD *)v14 + 6) = v4;
    *((_QWORD *)v14 + 7) = v7;
    *((_QWORD *)v14 + 8) = v8;
    *((_QWORD *)v14 + 9) = v9;
    if (v4 >> 60 == 10 && v5 == 21 && !v6 && v4 == 0xA000000000000000 && !(v8 | v7 | v9))
      break;
    sub_2409A8454(v5, v6, v4);
    sub_2409A40D0(&v15);
  }
  return (*(uint64_t (**)(char *))(*(_QWORD *)v0 + 128))(v2);
}

uint64_t sub_2409A82E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t result;

  v2 = *(uint64_t (**)(void))(**(_QWORD **)v0 + 120);
  result = v2();
  if (!result)
  {
    result = sub_2409A814C();
    if (!v1)
    {
      result = ((uint64_t (*)(uint64_t))v2)(result);
      if (!result)
        __break(1u);
    }
  }
  return result;
}

char *sub_2409A833C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073008);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2409A8454(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF)
    return sub_2409A442C(a1, a2, a3);
  return a1;
}

uint64_t sub_2409A8468()
{
  unsigned __int8 v1;

  swift_getAtKeyPath();
  return v1;
}

BOOL sub_2409A8498(int a1, int a2)
{
  return a1 == 92 && !sub_2409A3918(a2);
}

BOOL sub_2409A84C8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16) >= 2uLL && *(_DWORD *)(a1 + 32) == 92 && !sub_2409A3918(*(_DWORD *)(a1 + 36));
}

BOOL sub_2409A8508(unsigned int a1, unsigned int a2, int a3)
{
  if (a1 != 45)
  {
    if ((sub_2409A37B8(a1) & 1) == 0)
    {
      a3 = a2;
      if (a1 != 92)
        return 0;
      return !sub_2409A3918(a3);
    }
    return 1;
  }
  if ((sub_2409A37B8(a2) & 1) != 0)
    return 1;
  if (a2 == 92)
    return !sub_2409A3918(a3);
  return 0;
}

BOOL sub_2409A8584(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16) >= 3uLL && sub_2409A8508(*(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40));
}

uint64_t sub_2409A85A8()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2409A85DC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2409A8620())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2409A8660()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2409A866C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2409A86A0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 64) = a1;
  return swift_bridgeObjectRelease();
}

BOOL sub_2409A86E4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  if (!v2)
    return 1;
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
    return 0;
  return 4 * v2 == *(_QWORD *)(v0 + 48) >> 14;
}

uint64_t Tokenizer.__allocating_init(source:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 64) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a1;
  *(_QWORD *)(result + 32) = a2;
  *(_BYTE *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_BYTE *)(result + 56) = 1;
  return result;
}

uint64_t Tokenizer.init(source:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  *(_BYTE *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_BYTE *)(v2 + 56) = 1;
  return v2;
}

uint64_t sub_2409A87B0()
{
  return 1;
}

uint64_t sub_2409A87B8(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23[3];

  if (result < 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  v2 = result;
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  if ((*(_BYTE *)(v1 + 56) & 1) != 0)
  {
    v5 = 15;
  }
  else
  {
    v6 = *(_QWORD *)(v1 + 48);
    v7 = v3 & 0xFFFFFFFFFFFFLL;
    if ((v4 & 0x2000000000000000) != 0)
      v7 = HIBYTE(v4) & 0xF;
    if (v6 >> 14 == 4 * v7)
      return MEMORY[0x24BEE4AF8];
    v5 = sub_2409A896C(v6, *(unsigned __int8 *)(v1 + 40) ^ 1u, v3, v4);
    v3 = *(_QWORD *)(v1 + 24);
    v4 = *(_QWORD *)(v1 + 32);
  }
  v8 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v8 = v3;
  v9 = 7;
  if (((v4 >> 60) & ((v3 & 0x800000000000000) == 0)) != 0)
    v9 = 11;
  v10 = sub_2409A8B64(v5, v9 | (v8 << 16), v3, v4);
  if (v10 >= v2)
    v11 = v2;
  else
    v11 = v10;
  result = sub_2409A896C(v5, v11, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
  if (v11 < 1)
    return MEMORY[0x24BEE4AF8];
  if ((unint64_t)result >> 14 < v5 >> 14)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  v12 = sub_2409C5D78();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  swift_bridgeObjectRelease();
  v19 = sub_2409A93BC(v12, v14, v16, v18);
  if (!v19)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v20 = v19;
  v21 = sub_2409A9A38(v19, 0);
  v22 = sub_2409A95CC(v23, (uint64_t)(v21 + 4), v20, v12, v14, v16, v18);
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  if (v22 == v20)
  {
    swift_bridgeObjectRelease();
    return (uint64_t)v21;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_2409A896C(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  result = sub_2409A9024(a1, a3, a4);
  if (a2 < 0)
  {
    v14 = 0;
    while (1)
    {
      if (result < 0x10000)
        goto LABEL_38;
      if ((a4 & 0x1000000000000000) == 0)
        break;
      result = sub_2409C5D60();
LABEL_20:
      if (--v14 <= a2)
        return result;
    }
    v15 = result >> 16;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v21 = a3;
      v22 = a4 & 0xFFFFFFFFFFFFFFLL;
      if ((*((_BYTE *)&v21 + v15 - 1) & 0xC0) == 0x80)
      {
        v17 = 0;
        do
          v19 = *((_BYTE *)&v21 + v15 + v17-- - 2) & 0xC0;
        while (v19 == 128);
        goto LABEL_33;
      }
    }
    else
    {
      v16 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a3 & 0x1000000000000000) == 0)
        v16 = sub_2409C5FDC();
      if ((*(_BYTE *)(v15 + v16 - 1) & 0xC0) == 0x80)
      {
        v17 = 0;
        do
          v18 = *(_BYTE *)(v16 + v15 - 2 + v17--) & 0xC0;
        while (v18 == 128);
LABEL_33:
        v20 = 1 - v17;
LABEL_35:
        result = ((v15 - v20) << 16) | 5;
        goto LABEL_20;
      }
    }
    v20 = 1;
    goto LABEL_35;
  }
  if (a2)
  {
    if ((a4 & 0x2000000000000000) != 0)
      v8 = HIBYTE(a4) & 0xF;
    else
      v8 = a3 & 0xFFFFFFFFFFFFLL;
    while (1)
    {
      v9 = result >> 16;
      if (result >> 16 >= v8)
        break;
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_2409C5D54();
        if (!--a2)
          return result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          v21 = a3;
          v22 = a4 & 0xFFFFFFFFFFFFFFLL;
          v11 = *((unsigned __int8 *)&v21 + v9);
        }
        else
        {
          v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            v10 = sub_2409C5FDC();
          v11 = *(unsigned __int8 *)(v10 + v9);
        }
        v12 = (char)v11;
        v13 = __clz(v11 ^ 0xFF) - 24;
        if (v12 >= 0)
          LOBYTE(v13) = 1;
        result = ((v9 + v13) << 16) | 5;
        if (!--a2)
          return result;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
  }
  return result;
}

unint64_t sub_2409A8B64(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v7 = sub_2409A9024(a1, a3, a4);
  result = sub_2409A9024(a2, a3, a4);
  v9 = result >> 14;
  if (v7 >> 14 >= result >> 14)
  {
    if (v9 >= v7 >> 14)
      return 0;
    v11 = 0;
    while (1)
    {
      if (__OFSUB__(v11--, 1))
        goto LABEL_37;
      if ((a4 & 0x1000000000000000) == 0)
        break;
      result = sub_2409C5D60();
      v7 = result;
LABEL_18:
      if (v9 >= v7 >> 14)
        return v11;
    }
    v17 = v7 >> 16;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v22 = a3;
      v23 = a4 & 0xFFFFFFFFFFFFFFLL;
      if ((*((_BYTE *)&v22 + v17 - 1) & 0xC0) == 0x80)
      {
        v18 = 0;
        do
          v20 = *((_BYTE *)&v22 + v17 + v18-- - 2) & 0xC0;
        while (v20 == 128);
        goto LABEL_31;
      }
    }
    else
    {
      result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a3 & 0x1000000000000000) == 0)
        result = sub_2409C5FDC();
      if ((*(_BYTE *)(v17 + result - 1) & 0xC0) == 0x80)
      {
        v18 = 0;
        do
          v19 = *(_BYTE *)(result + v17 - 2 + v18--) & 0xC0;
        while (v19 == 128);
LABEL_31:
        v21 = 1 - v18;
LABEL_33:
        v7 = (v7 - (v21 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
        goto LABEL_18;
      }
    }
    v21 = 1;
    goto LABEL_33;
  }
  for (i = 0; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    if ((a4 & 0x1000000000000000) != 0)
    {
      result = sub_2409C5D54();
      v7 = result;
    }
    else
    {
      v12 = v7 >> 16;
      if ((a4 & 0x2000000000000000) != 0)
      {
        v22 = a3;
        v23 = a4 & 0xFFFFFFFFFFFFFFLL;
        v13 = *((unsigned __int8 *)&v22 + v12);
      }
      else
      {
        result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if ((a3 & 0x1000000000000000) == 0)
          result = sub_2409C5FDC();
        v13 = *(unsigned __int8 *)(result + v12);
      }
      v14 = (char)v13;
      v15 = __clz(v13 ^ 0xFF) - 24;
      if (v14 >= 0)
        LOBYTE(v15) = 1;
      v7 = ((v12 + v15) << 16) | 5;
    }
    if (v9 <= v7 >> 14)
      return v11;
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2409A8D88()
{
  return 3;
}

uint64_t sub_2409A8D90(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  if (result < 1)
  {
    __break(1u);
  }
  else
  {
    v2 = (*(uint64_t (**)(void))(*v1 + 256))();
    swift_beginAccess();
    v1[8] = v2;
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2409A8DEC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  uint64_t v18;

  if (*(_BYTE *)(v0 + 40) == 1)
  {
    if ((*(_BYTE *)(v0 + 56) & 1) == 0)
    {
      v1 = *(_QWORD *)(v0 + 48);
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)(v0 + 56) & 1) == 0)
  {
    v3 = *(_QWORD *)(v0 + 24);
    v2 = *(_QWORD *)(v0 + 32);
    v4 = sub_2409A92B4(*(_QWORD *)(v0 + 48), v3, v2);
    if ((v2 & 0x1000000000000000) != 0)
    {
      v1 = sub_2409C5D54();
    }
    else
    {
      v5 = v4 >> 16;
      if ((v2 & 0x2000000000000000) != 0)
      {
        v17 = v3;
        v18 = v2 & 0xFFFFFFFFFFFFFFLL;
        v7 = *((unsigned __int8 *)&v17 + v5);
      }
      else
      {
        if ((v3 & 0x1000000000000000) != 0)
          v6 = (v2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        else
          v6 = sub_2409C5FDC();
        v7 = *(unsigned __int8 *)(v6 + v5);
      }
      v8 = (char)v7;
      v9 = __clz(v7 ^ 0xFF) - 24;
      if (v8 >= 0)
        LOBYTE(v9) = 1;
      v1 = ((v5 + v9) << 16) | 5;
    }
    goto LABEL_15;
  }
  v1 = 15;
LABEL_15:
  *(_QWORD *)(v0 + 48) = v1;
  *(_BYTE *)(v0 + 56) = 0;
LABEL_16:
  v10 = 0;
  *(_BYTE *)(v0 + 40) = 0;
  v12 = *(_QWORD *)(v0 + 24);
  v11 = *(_QWORD *)(v0 + 32);
  if ((v11 & 0x2000000000000000) != 0)
    v13 = HIBYTE(v11) & 0xF;
  else
    v13 = v12 & 0xFFFFFFFFFFFFLL;
  v14 = 4 * v13;
  v15 = v1 >> 14;
  if (v1 >> 14 < 4 * v13)
  {
    sub_2409A92B4(v1, v12, v11);
    if ((v11 & 0x1000000000000000) != 0)
    {
      v10 = sub_2409C5FA0();
    }
    else
    {
      if ((v11 & 0x2000000000000000) != 0)
      {
        v17 = v12;
        v18 = v11 & 0xFFFFFFFFFFFFFFLL;
        swift_bridgeObjectRetain();
      }
      else
      {
        if ((v12 & 0x1000000000000000) == 0)
          sub_2409C5FDC();
        swift_bridgeObjectRetain();
      }
      v10 = sub_2409C5FE8();
      swift_bridgeObjectRelease();
    }
  }
  LOBYTE(v17) = v15 >= v14;
  return v10 | ((unint64_t)(v15 >= v14) << 32);
}

void sub_2409A8FB8()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 40) = 1;
}

uint64_t Tokenizer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Tokenizer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_2409A9024(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_2409A90C0(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_2409A912C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_2409A90C0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_2409A923C(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_2409A912C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v7 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL))
          goto LABEL_14;
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_2409C5FDC();
        v5 = v12;
        if (v12 == v10)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          v7 = v5 - 1;
          v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      v7 = v5;
      return v7 << 16;
    }
    v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v9 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v9)
      return sub_2409C5F94();
  }
  return result;
}

uint64_t sub_2409A923C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_2409C5E20();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2426855A8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_2409A92B4(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_2409A9350(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_2409A912C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_2409A9350(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_2409A923C(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_2409A93BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v7 = sub_2409A9024(a1, a3, a4);
  result = sub_2409A9024(a2, a3, a4);
  v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (i = 0; ; ++i)
    {
      v11 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_2409C5D54();
        v7 = result;
      }
      else
      {
        v12 = v7 >> 16;
        if ((a4 & 0x2000000000000000) != 0)
        {
          v22 = a3;
          v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            result = sub_2409C5FDC();
          v13 = *(unsigned __int8 *)(result + v12);
        }
        v14 = (char)v13;
        v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0)
          LOBYTE(v15) = 1;
        v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14)
        return v11;
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        result = sub_2409C5D60();
        v7 = result;
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          v22 = a3;
          v23 = a4 & 0xFFFFFFFFFFFFFFLL;
          if ((*((_BYTE *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            v20 = 0;
            do
              v21 = *((_BYTE *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            v19 = 1 - v20;
          }
          else
          {
            v19 = 1;
          }
        }
        else
        {
          result = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a3 & 0x1000000000000000) == 0)
            result = sub_2409C5FDC();
          v17 = 0;
          do
            v18 = *(_BYTE *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          v19 = -v17;
        }
        v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14)
        return v11;
    }
    goto LABEL_36;
  }
  return 0;
}

uint64_t sub_2409A95CC(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  unint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;

  if (!a2)
  {
    v11 = 0;
    v13 = a4;
    goto LABEL_60;
  }
  if (!a3)
  {
    v13 = a4;
    v11 = 0;
    goto LABEL_60;
  }
  v9 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v9) = 1;
  if ((a7 & 0x2000000000000000) != 0)
    v10 = HIBYTE(a7) & 0xF;
  else
    v10 = a6 & 0xFFFFFFFFFFFFLL;
  if (a3 < 0)
    goto LABEL_65;
  v52 = a1;
  v53 = a5;
  v11 = 0;
  v12 = a5 >> 14;
  v13 = a4;
  v14 = 4 << v9;
  v15 = a4 >> 14;
  v56 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v57 = a7 & 0xFFFFFFFFFFFFFFLL;
  v51 = a4;
  v54 = a4 >> 14;
  v55 = v10;
  do
  {
    v19 = v13 >> 14;
    if (v13 >> 14 == v12)
      goto LABEL_59;
    v20 = v13 & 0xC;
    v21 = (v13 & 1) == 0 || v20 == v14;
    v22 = v21;
    if (!v21)
    {
      if (v19 >= v15)
      {
        v23 = v13;
        if (v19 < v12)
          goto LABEL_28;
      }
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
      JUMPOUT(0x2409A9A18);
    }
    v23 = v13;
    if (v20 == v14)
    {
      v41 = a2;
      v42 = a3;
      v23 = sub_2409A923C(v13, a6, a7);
      v15 = v54;
      v10 = v55;
      a2 = v41;
      a3 = v42;
      v19 = v23 >> 14;
      if (v23 >> 14 < v54)
        goto LABEL_62;
    }
    else if (v19 < v15)
    {
      goto LABEL_62;
    }
    if (v19 >= v12)
      goto LABEL_62;
    if ((v23 & 1) == 0)
    {
      v24 = a2;
      v25 = a3;
      v26 = sub_2409A912C(v23, a6, a7);
      v15 = v54;
      v10 = v55;
      a2 = v24;
      a3 = v25;
      v23 = v26 & 0xFFFFFFFFFFFFFFF2 | 1;
    }
LABEL_28:
    if ((a7 & 0x1000000000000000) != 0)
    {
      v33 = a2;
      v34 = a3;
      v35 = sub_2409C5FA0();
      v15 = v54;
      v10 = v55;
      a2 = v33;
      a3 = v34;
      v29 = v35;
      if ((v22 & 1) == 0)
        goto LABEL_42;
    }
    else
    {
      v27 = v23 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v58 = a6;
        v59 = v57;
        v29 = *((unsigned __int8 *)&v58 + v27);
        if (*((char *)&v58 + v27) < 0)
          __asm { BR              X9 }
      }
      else
      {
        v28 = v56;
        if ((a6 & 0x1000000000000000) == 0)
        {
          v50 = a2;
          v43 = a3;
          v28 = sub_2409C5FDC();
          v15 = v54;
          v10 = v55;
          a2 = v50;
          a3 = v43;
        }
        v29 = *(unsigned __int8 *)(v28 + v27);
        if (*(char *)(v28 + v27) < 0)
          __asm { BR              X9 }
      }
      if ((v22 & 1) == 0)
      {
LABEL_42:
        if (v10 <= v13 >> 16)
          goto LABEL_63;
        goto LABEL_43;
      }
    }
    if (v20 == v14)
    {
      v44 = a2;
      v45 = a3;
      v46 = sub_2409A923C(v13, a6, a7);
      v15 = v54;
      v10 = v55;
      a2 = v44;
      a3 = v45;
      v13 = v46;
      if (v55 <= v46 >> 16)
        goto LABEL_64;
    }
    else if (v10 <= v13 >> 16)
    {
      goto LABEL_64;
    }
    if ((v13 & 1) == 0)
    {
      v30 = a2;
      v31 = a3;
      v32 = sub_2409A912C(v13, a6, a7);
      v15 = v54;
      v10 = v55;
      a2 = v30;
      a3 = v31;
      v13 = v13 & 0xC | v32 & 0xFFFFFFFFFFFFFFF3 | 1;
    }
LABEL_43:
    if ((a7 & 0x1000000000000000) != 0)
    {
      v16 = a2;
      v17 = a3;
      v18 = sub_2409C5D54();
      v15 = v54;
      v10 = v55;
      a2 = v16;
      a3 = v17;
      v13 = v18;
    }
    else
    {
      v36 = v13 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v58 = a6;
        v59 = v57;
        v38 = *((unsigned __int8 *)&v58 + v36);
      }
      else
      {
        v37 = v56;
        if ((a6 & 0x1000000000000000) == 0)
        {
          v47 = a2;
          v48 = a3;
          v37 = sub_2409C5FDC();
          v15 = v54;
          v10 = v55;
          a2 = v47;
          a3 = v48;
        }
        v38 = *(unsigned __int8 *)(v37 + v36);
      }
      v39 = (char)v38;
      v40 = __clz(v38 ^ 0xFF) - 24;
      if (v39 >= 0)
        LOBYTE(v40) = 1;
      v13 = ((v36 + v40) << 16) | 5;
    }
    *(_DWORD *)(a2 + 4 * v11++) = v29;
  }
  while (a3 != v11);
  v11 = a3;
LABEL_59:
  a1 = v52;
  a5 = v53;
  a4 = v51;
LABEL_60:
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a7;
  a1[4] = v13;
  return v11;
}

_QWORD *sub_2409A9A38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073028);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 29;
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 2);
  return v4;
}

uint64_t type metadata accessor for Tokenizer()
{
  return objc_opt_self();
}

uint64_t method lookup function for Tokenizer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Tokenizer.__allocating_init(source:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

void sub_2409A9AE0()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_2409A9AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t result;
  uint64_t (*v9)(void);
  char v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  v2 = sub_2409C61F8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 240);
  result = v7(v4);
  if ((result & 1) == 0)
  {
    v9 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 272);
    do
    {
      result = v9();
      if ((result & 0x100000000) != 0)
        break;
      sub_2409C6204();
      v10 = sub_2409C61E0();
      v11 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      if ((v10 & 1) == 0)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 280))(v11);
      result = v7(v11);
    }
    while ((result & 1) == 0);
  }
  return result;
}

uint64_t sub_2409A9BCC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
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
  uint64_t (*v13)(uint64_t);
  uint64_t result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 *v44;
  unsigned __int8 *v45;
  char v46;
  uint64_t v47;
  unsigned __int8 *v48;
  int v49;
  unsigned __int8 v50;
  unsigned int v51;
  uint64_t v52;
  unsigned __int8 *v53;
  int v54;
  unsigned __int8 v55;
  uint64_t *v56;
  int v57;
  unsigned __int8 v58;
  BOOL v59;
  char v60;
  char v61;
  char *v62;
  char v63;
  void (*v64)(uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t (*v68)(char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;

  v1 = v0;
  v2 = sub_2409C61C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v67 = (char *)&v65 - v7;
  v8 = sub_2409C61F8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(uint64_t (**)(uint64_t))(*v0 + 272);
  result = v13(v10);
  if ((result & 0x100000000) != 0)
    goto LABEL_95;
  v15 = result;
  sub_2409C6204();
  v16 = sub_2409C61D4();
  v68 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  v17 = v68(v12, v8);
  v18 = *v1;
  if ((v16 & 1) == 0)
  {
    v38 = v15;
    if (((*(uint64_t (**)(uint64_t))(v18 + 240))(v17) & 1) == 0)
      return v38;
    return *(unsigned int *)sub_2409A3410();
  }
  v65 = v6;
  v66 = v3;
  v19 = v2;
  v20 = *(uint64_t (**)(uint64_t))(v18 + 256);
  v21 = 5;
  v22 = v20(5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073028);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_2409C6E80;
  *(_DWORD *)(v23 + 32) = v15;
  v70 = v23;
  v24 = swift_bridgeObjectRetain();
  sub_2409AAA20(v24);
  v25 = v70;
  if (*(_QWORD *)(v22 + 16) < 5uLL)
    v21 = *(_QWORD *)(v22 + 16);
  if (v21)
  {
    if (*(_QWORD *)(v70 + 16) < 2uLL)
      goto LABEL_91;
    sub_2409C6204();
    v26 = sub_2409C61D4();
    v27 = v68(v12, v8);
    if ((v26 & 1) != 0)
    {
      v13(v27);
      if (v21 != 1)
      {
        if (*(_QWORD *)(v25 + 16) < 3uLL)
          goto LABEL_91;
        sub_2409C6204();
        v28 = sub_2409C61D4();
        v29 = v68(v12, v8);
        if ((v28 & 1) != 0)
        {
          v13(v29);
          if (v21 != 2)
          {
            if (*(_QWORD *)(v25 + 16) < 4uLL)
              goto LABEL_91;
            sub_2409C6204();
            v30 = sub_2409C61D4();
            v31 = v68(v12, v8);
            if ((v30 & 1) != 0)
            {
              v13(v31);
              if (v21 != 3)
              {
                if (*(_QWORD *)(v25 + 16) < 5uLL)
                  goto LABEL_91;
                sub_2409C6204();
                v32 = sub_2409C61D4();
                v33 = v68(v12, v8);
                if ((v32 & 1) != 0)
                {
                  v13(v33);
                  if (v21 != 4)
                  {
                    if (*(_QWORD *)(v25 + 16) >= 6uLL)
                    {
                      sub_2409C6204();
                      v34 = sub_2409C61D4();
                      v35 = v68(v12, v8);
                      if ((v34 & 1) != 0)
                        v13(v35);
                      goto LABEL_21;
                    }
LABEL_91:
                    __break(1u);
                    goto LABEL_92;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_21:
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v20(1) + 16))
  {
    swift_bridgeObjectRelease();
    sub_2409C6204();
    v36 = sub_2409C61E0();
    v37 = v68(v12, v8);
    v21 = v66;
    if ((v36 & 1) != 0)
      v13(v37);
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = v66;
  }
  v70 = 0;
  v71 = 0xE000000000000000;
  v69 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073038);
  sub_2409AB52C();
  result = sub_2409C5D6C();
  v40 = v70;
  v39 = v71;
  v41 = HIBYTE(v71) & 0xF;
  v42 = v70 & 0xFFFFFFFFFFFFLL;
  if ((v71 & 0x2000000000000000) != 0)
    v43 = HIBYTE(v71) & 0xF;
  else
    v43 = v70 & 0xFFFFFFFFFFFFLL;
  v22 = (uint64_t)v65;
  if (!v43)
  {
    swift_bridgeObjectRelease();
    goto LABEL_84;
  }
  if ((v71 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v38 = sub_2409AABF8(v40, v39, 16);
    swift_bridgeObjectRelease_n();
    if ((v38 & 0x100000000) == 0)
      goto LABEL_73;
    goto LABEL_84;
  }
  if ((v71 & 0x2000000000000000) == 0)
  {
    if ((v70 & 0x1000000000000000) != 0)
    {
      v44 = (unsigned __int8 *)((v71 & 0xFFFFFFFFFFFFFFFLL) + 32);
LABEL_35:
      v45 = sub_2409AACDC(v44, v42, 16);
      LOBYTE(v69) = BYTE4(v45) & 1;
      v46 = BYTE4(v45) & 1;
      LODWORD(v38) = (_DWORD)v45;
      goto LABEL_72;
    }
LABEL_92:
    v44 = (unsigned __int8 *)sub_2409C5FDC();
    goto LABEL_35;
  }
  v71 &= 0xFFFFFFFFFFFFFFuLL;
  if (v70 == 43)
  {
    if (v41)
    {
      v52 = v41 - 1;
      if (v52)
      {
        LODWORD(v38) = 0;
        v53 = (unsigned __int8 *)&v70 + 1;
        while (1)
        {
          v54 = *v53;
          v55 = v54 - 48;
          if ((v54 - 48) >= 0xA)
          {
            if ((v54 - 65) < 6)
            {
              v55 = v54 - 55;
            }
            else
            {
              if ((v54 - 97) > 5)
                goto LABEL_71;
              v55 = v54 - 87;
            }
          }
          if (v38 >> 28)
            break;
          LODWORD(v38) = 16 * v38 + v55;
          ++v53;
          if (!--v52)
          {
LABEL_70:
            v46 = 0;
            goto LABEL_72;
          }
        }
      }
      goto LABEL_71;
    }
  }
  else
  {
    if (v70 != 45)
    {
      if (v41)
      {
        LODWORD(v38) = 0;
        v56 = &v70;
        while (1)
        {
          v57 = *(unsigned __int8 *)v56;
          v58 = v57 - 48;
          if ((v57 - 48) >= 0xA)
          {
            if ((v57 - 65) < 6)
            {
              v58 = v57 - 55;
            }
            else
            {
              if ((v57 - 97) > 5)
                goto LABEL_71;
              v58 = v57 - 87;
            }
          }
          if (v38 >> 28)
            break;
          LODWORD(v38) = 16 * v38 + v58;
          v56 = (uint64_t *)((char *)v56 + 1);
          if (!--v41)
            goto LABEL_70;
        }
      }
      goto LABEL_71;
    }
    if (v41)
    {
      v47 = v41 - 1;
      if (v47)
      {
        LODWORD(v38) = 0;
        v48 = (unsigned __int8 *)&v70 + 1;
        while (1)
        {
          v49 = *v48;
          v50 = v49 - 48;
          if ((v49 - 48) >= 0xA)
          {
            if ((v49 - 65) < 6)
            {
              v50 = v49 - 55;
            }
            else
            {
              if ((v49 - 97) > 5)
                break;
              v50 = v49 - 87;
            }
          }
          if (v38 >> 28)
            break;
          v51 = 16 * v38;
          LODWORD(v38) = 16 * v38 - v50;
          if (v51 < v50)
            break;
          ++v48;
          if (!--v47)
            goto LABEL_70;
        }
      }
LABEL_71:
      LODWORD(v38) = 0;
      v46 = 1;
LABEL_72:
      swift_bridgeObjectRelease();
      if ((v46 & 1) == 0)
      {
LABEL_73:
        v59 = WORD1(v38) > 0x10u || v38 >> 11 == 27;
        v60 = v59;
        if (v59)
          v38 = 0;
        else
          v38 = v38;
LABEL_85:
        LOBYTE(v70) = v60;
        v61 = v60;
        swift_bridgeObjectRelease();
        if ((v61 & 1) == 0 && *(_DWORD *)sub_2409A33FC() != (_DWORD)v38)
        {
          sub_2409C6204();
          v62 = v67;
          sub_2409C61EC();
          v68(v12, v8);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v22, *MEMORY[0x24BEE4700], v19);
          v63 = sub_2409C61BC();
          v64 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
          v64(v22, v19);
          v64((uint64_t)v62, v19);
          if ((v63 & 1) == 0 && *(_DWORD *)sub_2409A3488() >= v38)
            return v38;
        }
        return *(unsigned int *)sub_2409A3410();
      }
LABEL_84:
      v38 = 0;
      v60 = 1;
      goto LABEL_85;
    }
    __break(1u);
  }
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_2409AA260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v1 = v0;
  v2 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 272);
  v3 = v2();
  if ((v3 & 0x100000000) != 0)
    return 0;
  LODWORD(v4) = v3;
  while (1)
  {
    v6 = sub_2409A8D88();
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 264))(v6);
    if ((sub_2409A37B8(v4) & 1) != 0)
      goto LABEL_3;
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 216))();
    if (!*(_QWORD *)(v7 + 16))
      break;
    v8 = *(_DWORD *)(v7 + 32);
    swift_bridgeObjectRelease();
    v9 = sub_2409A8498(v4, v8);
    if ((v9 & 1) == 0)
      goto LABEL_9;
    sub_2409A9BCC();
LABEL_3:
    sub_2409C6210();
    sub_2409C5DCC();
    v5 = swift_bridgeObjectRelease();
    v4 = ((uint64_t (*)(uint64_t))v2)(v5);
    if ((v4 & 0x100000000) != 0)
      return 0;
  }
  v9 = swift_bridgeObjectRelease();
LABEL_9:
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 280))(v9);
  return 0;
}

uint64_t sub_2409AA358(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t (*v28)(void);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(void);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unsigned __int8 *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v2 = v1;
  v44 = 0;
  v45 = 0xE000000000000000;
  v4 = sub_2409A8D88();
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 264))(v4);
  v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 216);
  v7 = v6(v5);
  if (*(_QWORD *)(v7 + 16))
  {
    v8 = *(_DWORD *)(v7 + 32);
    v9 = swift_bridgeObjectRelease();
    if (v8 == 43)
    {
LABEL_7:
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 272))(v9) & 0x100000000) == 0)
      {
        sub_2409C6210();
        sub_2409C5DCC();
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v9 = swift_bridgeObjectRelease();
  }
  v10 = v6(v9);
  if (!*(_QWORD *)(v10 + 16))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v11 = *(_DWORD *)(v10 + 32);
  v9 = swift_bridgeObjectRelease();
  if (v11 == 45)
    goto LABEL_7;
LABEL_10:
  v12 = sub_2409A87B0();
  v13 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 256);
  if (*(_QWORD *)(v13(v12) + 16) && (sub_2409A3644() & 1) != 0)
  {
    v14 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 272);
    do
    {
      if ((v14() & 0x100000000) == 0)
      {
        sub_2409C6210();
        sub_2409C5DCC();
        swift_bridgeObjectRelease();
      }
      v15 = sub_2409A87B0();
      v16 = v13(v15);
      swift_bridgeObjectRelease();
    }
    while (*(_QWORD *)(v16 + 16) && (sub_2409A3644() & 1) != 0);
  }
  v17 = v13(2);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v17 + 16) >= 2uLL && *(_DWORD *)(v17 + 32) == 46 && (sub_2409A3644() & 1) != 0)
  {
    v18 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 272);
    v19 = v18();
    if ((v19 & 0x100000000) == 0)
    {
      sub_2409C6210();
      sub_2409C5DCC();
      v19 = swift_bridgeObjectRelease();
    }
    if ((((uint64_t (*)(uint64_t))v18)(v19) & 0x100000000) == 0)
    {
      sub_2409C6210();
      sub_2409C5DCC();
      swift_bridgeObjectRelease();
    }
    v20 = sub_2409A87B0();
    v21 = v13(v20);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v21 + 16) && (sub_2409A3644() & 1) != 0)
    {
      v22 = 1;
      while (1)
      {
        if ((v18() & 0x100000000) == 0)
        {
          sub_2409C6210();
          sub_2409C5DCC();
          swift_bridgeObjectRelease();
        }
        v23 = sub_2409A87B0();
        v24 = v13(v23);
        swift_bridgeObjectRelease();
        if (!*(_QWORD *)(v24 + 16))
          break;
        if ((sub_2409A3644() & 1) == 0)
          goto LABEL_33;
      }
      v22 = 1;
    }
    else
    {
      v22 = 1;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_33:
  v25 = v13(3);
  v26 = swift_bridgeObjectRelease();
  v27 = *(_QWORD *)(v25 + 16);
  if (v27)
  {
    if ((*(_DWORD *)(v25 + 32) | 0x20) == 0x65)
    {
      if (v27 < 3)
        goto LABEL_54;
      if (*(_DWORD *)(v25 + 36) != 43)
        goto LABEL_54;
      v26 = sub_2409A3644();
      if ((v26 & 1) == 0)
        goto LABEL_54;
      v28 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 272);
      if ((v28() & 0x100000000) == 0)
      {
        sub_2409C6210();
        sub_2409C5DCC();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      if (v27 < 2)
        goto LABEL_54;
      v26 = sub_2409A3644();
      if ((v26 & 1) == 0)
        goto LABEL_54;
      v28 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 272);
    }
    v29 = v28();
    if ((v29 & 0x100000000) == 0)
    {
      sub_2409C6210();
      sub_2409C5DCC();
      v29 = swift_bridgeObjectRelease();
    }
    if ((((uint64_t (*)(uint64_t))v28)(v29) & 0x100000000) == 0)
    {
      sub_2409C6210();
      sub_2409C5DCC();
      swift_bridgeObjectRelease();
    }
    v30 = sub_2409A87B0();
    v31 = v13(v30);
    v26 = swift_bridgeObjectRelease();
    if (*(_QWORD *)(v31 + 16))
    {
      v26 = sub_2409A3644();
      if ((v26 & 1) != 0)
      {
        v32 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 272);
        v22 = 1;
        while (1)
        {
          if ((v32() & 0x100000000) == 0)
          {
            sub_2409C6210();
            sub_2409C5DCC();
            swift_bridgeObjectRelease();
          }
          v33 = sub_2409A87B0();
          v34 = v13(v33);
          v26 = swift_bridgeObjectRelease();
          if (!*(_QWORD *)(v34 + 16))
            break;
          v26 = sub_2409A3644();
          if ((v26 & 1) == 0)
            goto LABEL_54;
        }
      }
    }
    v22 = 1;
  }
LABEL_54:
  v35 = v44;
  v36 = v45;
  v46 = 0;
  MEMORY[0x24BDAC7A8](v26);
  if (v45 & 0x2000000000000000 | v44 & 0x1000000000000000)
  {
    v41 = v44;
    v42 = v45 & 0xFFFFFFFFFFFFFFLL;
    if (((1 << v44) & 0x100003E01) != 0)
    {
      swift_bridgeObjectRetain();
LABEL_59:
      swift_bridgeObjectRelease();
LABEL_60:
      sub_2409AB4E8();
      swift_allocError();
      *(_QWORD *)v37 = v35;
      *(_QWORD *)(v37 + 8) = v36;
      *(_QWORD *)(v37 + 16) = 0xD000000000000021;
      *(_QWORD *)(v37 + 24) = 0x80000002409CC1B0;
      *(_BYTE *)(v37 + 32) = 1;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v35;
    }
    swift_bridgeObjectRetain();
    v39 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
    if (!v39)
      goto LABEL_59;
    v40 = *v39;
    swift_bridgeObjectRelease();
    if (v40)
      goto LABEL_60;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2409C5F88();
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
      goto LABEL_60;
  }
  swift_bridgeObjectRelease();
  *a1 = v22;
  return v35;
}

uint64_t sub_2409AA9B0()
{
  uint64_t v0;

  sub_2409AB4E8();
  swift_allocError();
  *(_QWORD *)v0 = sub_2409AAA0C;
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_BYTE *)(v0 + 32) = 2;
  return swift_willThrow();
}

const char *sub_2409AAA0C()
{
  return "consumeUnicodeRange()";
}

uint64_t sub_2409AAA20(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = (uint64_t)sub_2409AAB00((char *)result, v11, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (uint64_t)memcpy((void *)(v3 + 4 * v7 + 32), (const void *)(v6 + 32), 4 * v2);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v8 = *(_QWORD *)(v3 + 16);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *(_QWORD *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_2409AAB00(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073028);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2409AABF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_2409C5E38();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_2409AAF5C();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_2409C5FDC();
  }
LABEL_7:
  v11 = sub_2409AACDC(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_2409AACDC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2409AAF5C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2409C5E44();
  v4 = sub_2409AAFD8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2409AAFD8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_2409AB11C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_2409AB208(v9, 0);
      v12 = sub_2409AB26C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x242685530](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x242685530);
LABEL_9:
      sub_2409C5FDC();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x242685530]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_2409AB11C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_2409A923C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_2409A923C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_2409C5E08();
  }
  __break(1u);
  return result;
}

_QWORD *sub_2409AB208(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073048);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_2409AB26C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_2409A923C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_2409C5E14();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_2409C5FDC();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_2409A923C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_2409C5DF0();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

_BYTE *sub_2409AB47C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unint64_t sub_2409AB4E8()
{
  unint64_t result;

  result = qword_257073030;
  if (!qword_257073030)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheetError, &type metadata for StyleSheetError);
    atomic_store(result, (unint64_t *)&qword_257073030);
  }
  return result;
}

unint64_t sub_2409AB52C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257073040;
  if (!qword_257073040)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257073038);
    result = MEMORY[0x242685B78](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257073040);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242685B6C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2409AB5BC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v48;
  uint64_t v49;
  __int128 v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _BYTE v56[48];

  v3 = *a1;
  v2 = a1[1];
  v5 = a1[2];
  v4 = a1[3];
  v45 = a1[4];
  v46 = a1[5];
  v48 = a1[6];
  v6 = a1[8];
  v7 = a1[10];
  v43 = a1[9];
  v44 = a1[7];
  v8 = a1[11];
  v9 = a1[12];
  v10 = a1[13];
  v11 = *((_BYTE *)a1 + 112);
  nullsub_1(a1);
  if ((v11 & 1) != 0)
  {
    v39 = v9;
    v40 = v8;
    v41 = v7;
    v42 = v6;
    *(_QWORD *)&v50 = v3;
    *((_QWORD *)&v50 + 1) = v2;
    v51 = v5;
    v52 = v4;
    v53 = v45;
    v54 = v46;
    sub_2409C4808(&v50);
    v13 = v12;
    v15 = v14;
    *(_QWORD *)&v50 = v48;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073050);
    v17 = sub_2409AB7C8();
    v23 = sub_2409C4838((uint64_t)&v50, v16, v17, v18, v19, v20, v21, v22);
    v25 = v24;
    sub_2409AB814(v49, (uint64_t)v56);
    if (v43 >> 1 == 0xFFFFFFFF)
    {
      result = sub_2409AB850((uint64_t)v56);
      v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      *(_QWORD *)&v50 = v44;
      *((_QWORD *)&v50 + 1) = v42;
      v51 = v43;
      v52 = v41;
      v53 = v40;
      v54 = v39;
      v55 = v10;
      sub_2409A4D64(v44, v42, v43);
      swift_bridgeObjectRetain();
      v27 = sub_2409AB884((uint64_t *)&v50);
      result = sub_2409AB850((uint64_t)v56);
    }
    *(_QWORD *)a2 = v13;
    *(_QWORD *)(a2 + 8) = v15;
    *(_QWORD *)(a2 + 16) = v23;
    *(_QWORD *)(a2 + 24) = v25;
    *(_QWORD *)(a2 + 32) = v27;
    *(_BYTE *)(a2 + 40) = 1;
  }
  else
  {
    *(_QWORD *)&v50 = v3;
    v28 = v4;
    sub_2409A4D64(v2, v5, v4);
    swift_bridgeObjectRetain();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073050);
    v30 = sub_2409AB7C8();
    v36 = sub_2409C4838((uint64_t)&v50, v29, v30, v31, v32, v33, v34, v35);
    v38 = v37;
    *(_QWORD *)&v50 = v2;
    *((_QWORD *)&v50 + 1) = v5;
    v51 = v28;
    v52 = v45;
    v53 = v46;
    v54 = v48;
    v55 = v44;
    result = (uint64_t)sub_2409AB884((uint64_t *)&v50);
    *(_QWORD *)a2 = v36;
    *(_QWORD *)(a2 + 8) = v38;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 16) = result;
    *(_BYTE *)(a2 + 40) = 0;
  }
  return result;
}

unint64_t sub_2409AB7C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257073058;
  if (!qword_257073058)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257073050);
    result = MEMORY[0x242685B78](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257073058);
  }
  return result;
}

uint64_t sub_2409AB814(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AnyDeclarationParser(a2, a1);
  return a2;
}

uint64_t sub_2409AB850(uint64_t a1)
{
  destroy for AnyDeclarationParser();
  return a1;
}

_QWORD *sub_2409AB884(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  unsigned __int8 v20;
  unint64_t v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  _BYTE v26[16];
  uint64_t v27;
  _OWORD v28[2];
  unsigned __int8 v29;
  _OWORD v30[3];
  uint64_t v31;
  char v32;
  _QWORD v33[2];
  __int16 v34;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[6];
  swift_bridgeObjectRetain();
  sub_2409A442C(v2, v3, v4);
  swift_bridgeObjectRelease();
  v27 = v1;
  v6 = sub_2409ABCD8((void (*)(uint64_t *__return_ptr, _QWORD *))sub_2409ABCC0, (uint64_t)v26, v5);
  swift_bridgeObjectRelease();
  nullsub_1(v6);
  v7 = sub_2409A44A0();
  v9 = v8;
  v11 = v10;
  swift_bridgeObjectRelease();
  v33[0] = v7;
  v33[1] = v9;
  v34 = v11 & 0x101;
  v12 = sub_2409C1EC4((uint64_t)v33);
  nullsub_1(v12);
  v13 = v12[2];
  if (v13)
  {
    swift_bridgeObjectRetain();
    v14 = v12 + 11;
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v17 = *((_QWORD *)v14 - 1);
      v18 = *v14;
      v19 = *(_OWORD *)(v14 - 40);
      v30[0] = *(_OWORD *)(v14 - 56);
      v30[1] = v19;
      v30[2] = *(_OWORD *)(v14 - 24);
      v31 = v17;
      v32 = v18;
      sub_2409ABF38((uint64_t)v30, (uint64_t)v28);
      v20 = v29;
      if (v29 != 255)
      {
        v24 = v28[1];
        v25 = v28[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v15 = sub_2409AC1F8(0, v15[2] + 1, 1, v15);
        v22 = v15[2];
        v21 = v15[3];
        if (v22 >= v21 >> 1)
          v15 = sub_2409AC1F8((_QWORD *)(v21 > 1), v22 + 1, 1, v15);
        v15[2] = v22 + 1;
        v16 = &v15[5 * v22];
        *((_OWORD *)v16 + 2) = v25;
        *((_OWORD *)v16 + 3) = v24;
        *((_BYTE *)v16 + 64) = v20;
      }
      v14 += 64;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t *sub_2409ABA88@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[2];
  uint64_t *v23;
  uint64_t v24;

  v5 = *result;
  v4 = result[1];
  v6 = result[2];
  v7 = result[3];
  v9 = result[4];
  v8 = result[5];
  v10 = (v6 >> 58) & 3;
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == 1)
    {
      v11 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v23 = a3;
      v13 = result[6];
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073008);
      v14 = swift_allocObject();
      v22[1] = v22;
      *(_OWORD *)(v14 + 16) = xmmword_2409C6E80;
      *(_QWORD *)(v14 + 32) = v5;
      *(_QWORD *)(v14 + 40) = v4;
      *(_QWORD *)(v14 + 48) = v6 & 0xF3FFFFFFFFFFFFFFLL;
      *(_QWORD *)(v14 + 56) = v7;
      *(_QWORD *)(v14 + 64) = v9;
      *(_QWORD *)(v14 + 72) = v8;
      MEMORY[0x24BDAC7A8](v14);
      v21[2] = a2;
      sub_2409A4D64(v5, v4, v15);
      swift_bridgeObjectRetain();
      v16 = sub_2409ABCD8((void (*)(uint64_t *__return_ptr, _QWORD *))sub_2409AC780, (uint64_t)v21, v13);
      swift_bridgeObjectRelease();
      v24 = v14;
      sub_2409AC314(v16);
      v17 = v24;
      swift_bridgeObjectRetain();
      v11 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v11 = (uint64_t)sub_2409A833C(0, *(_QWORD *)(v17 + 16) + 1, 1, (char *)v17);
      v19 = *(_QWORD *)(v11 + 16);
      v18 = *(_QWORD *)(v11 + 24);
      if (v19 >= v18 >> 1)
        v11 = (uint64_t)sub_2409A833C((char *)(v18 > 1), v19 + 1, 1, (char *)v11);
      *(_QWORD *)(v11 + 16) = v19 + 1;
      v20 = v11 + 48 * v19;
      *(_OWORD *)(v20 + 32) = xmmword_2409C6AF0;
      *(_QWORD *)(v20 + 48) = 0xA000000000000000;
      *(_QWORD *)(v20 + 56) = 0;
      *(_QWORD *)(v20 + 64) = 0;
      *(_QWORD *)(v20 + 72) = 0;
      result = (uint64_t *)swift_bridgeObjectRelease();
      a3 = v23;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073008);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_2409C6E80;
    *(_QWORD *)(v11 + 32) = v5;
    *(_QWORD *)(v11 + 40) = v4;
    *(_QWORD *)(v11 + 48) = v6;
    *(_QWORD *)(v11 + 56) = v7;
    *(_QWORD *)(v11 + 64) = v9;
    *(_QWORD *)(v11 + 72) = v8;
    result = (uint64_t *)sub_2409A4D64(v5, v4, v6);
  }
  *a3 = v11;
  return result;
}

uint64_t *sub_2409ABCC0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_2409ABA88(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_2409ABCD8(void (*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD v30[7];
  uint64_t v31;

  v3 = *(_QWORD *)(a3 + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v5 = (uint64_t *)(a3 + 40);
  v6 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v27 = v3;
    v28 = v6;
    v7 = *(v5 - 1);
    v8 = *v5;
    v10 = v5[1];
    v9 = v5[2];
    v11 = v5[3];
    v6 = (char *)v5[4];
    v12 = v5[5];
    v30[0] = v7;
    v30[1] = v8;
    v30[2] = v10;
    v30[3] = v9;
    v30[4] = v11;
    v30[5] = v6;
    v30[6] = v12;
    sub_2409AC6D0(v7, v8, v10);
    a1(&v31, v30);
    if (v29)
    {
      sub_2409AC728(v7, v8, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
    sub_2409AC728(v7, v8, v10);
    v13 = v31;
    v14 = *(_QWORD *)(v31 + 16);
    v6 = v28;
    v15 = *((_QWORD *)v28 + 2);
    v16 = v15 + v14;
    if (__OFADD__(v15, v14))
      break;
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v16 <= *((_QWORD *)v28 + 3) >> 1)
    {
      if (*(_QWORD *)(v13 + 16))
        goto LABEL_15;
    }
    else
    {
      if (v15 <= v16)
        v18 = v15 + v14;
      else
        v18 = v15;
      v6 = sub_2409A833C(isUniquelyReferenced_nonNull_native, v18, 1, v28);
      if (*(_QWORD *)(v13 + 16))
      {
LABEL_15:
        v19 = *((_QWORD *)v6 + 2);
        if ((*((_QWORD *)v6 + 3) >> 1) - v19 < v14)
          goto LABEL_30;
        v20 = (unint64_t)&v6[48 * v19 + 32];
        if (v13 + 32 < v20 + 48 * v14 && v20 < v13 + 32 + 48 * v14)
          goto LABEL_32;
        swift_arrayInitWithCopy();
        if (v14)
        {
          v22 = *((_QWORD *)v6 + 2);
          v23 = __OFADD__(v22, v14);
          v24 = v22 + v14;
          if (v23)
            goto LABEL_31;
          *((_QWORD *)v6 + 2) = v24;
        }
        goto LABEL_4;
      }
    }
    if (v14)
      goto LABEL_29;
LABEL_4:
    v5 += 7;
    swift_bridgeObjectRelease();
    v3 = v27 - 1;
    if (v27 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409ABF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t result;
  char v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  _QWORD v36[2];
  _OWORD v37[2];
  char v38;
  _OWORD v39[3];
  uint64_t v40;

  v40 = sub_2409C5CC4();
  v5 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 16);
  v39[0] = *(_OWORD *)a1;
  v39[1] = v9;
  v39[2] = *(_OWORD *)(a1 + 32);
  sub_2409C4808(v39);
  v11 = v10;
  v13 = v12;
  *(_QWORD *)&v39[0] = v8;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073050);
  v15 = sub_2409AB7C8();
  v21 = sub_2409C4838((uint64_t)v39, v14, v15, v16, v17, v18, v19, v20);
  v23 = v22;
  sub_2409AC794(v11, v13, (uint64_t)v39);
  v36[0] = v21;
  v36[1] = v23;
  sub_2409AC658();
  sub_2409ACCC4((uint64_t)v36, MEMORY[0x24BEE0D00], (uint64_t)v37);
  if (v2)
  {
    v24 = sub_2409C5838();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v24, v40);
    MEMORY[0x242685B18](v2);
    MEMORY[0x242685B18](v2);
    v25 = sub_2409C5CAC();
    v26 = sub_2409C5EE0();
    if (os_log_type_enabled(v25, v26))
    {
      v34 = v7;
      v35 = v5;
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412290;
      MEMORY[0x242685B18](v2);
      v29 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v37[0] = v29;
      sub_2409C5F40();
      *v28 = v29;
      v30 = v28;
      v7 = v34;
      v5 = v35;
      MEMORY[0x242685B0C](v2);
      MEMORY[0x242685B0C](v2);
      _os_log_impl(&dword_2409A2000, v25, v26, "%@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073070);
      swift_arrayDestroy();
      MEMORY[0x242685BD8](v30, -1, -1);
      MEMORY[0x242685BD8](v27, -1, -1);

    }
    else
    {

      MEMORY[0x242685B0C](v2);
      MEMORY[0x242685B0C](v2);
    }
    MEMORY[0x242685B0C](v2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v40);
    result = sub_2409AC69C((uint64_t)v39);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    v32 = -1;
  }
  else
  {
    result = sub_2409AC69C((uint64_t)v39);
    v32 = v38;
    v33 = v37[1];
    *(_OWORD *)a2 = v37[0];
    *(_OWORD *)(a2 + 16) = v33;
  }
  *(_BYTE *)(a2 + 32) = v32;
  return result;
}

_QWORD *sub_2409AC1F8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073060);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2409AC564(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2409AC314(uint64_t a1)
{
  char **v1;
  unint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_2409A833C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[48 * v9 + 32];
  if (a1 + 32 < v10 + 48 * v8 && v10 < a1 + 32 + 48 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409AC470(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409AC564(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2409C6054();
  __break(1u);
  return result;
}

unint64_t sub_2409AC658()
{
  unint64_t result;

  result = qword_257073068;
  if (!qword_257073068)
  {
    result = MEMORY[0x242685B78](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257073068);
  }
  return result;
}

uint64_t sub_2409AC69C(uint64_t a1)
{
  destroy for AnyDeclarationParser();
  return a1;
}

uint64_t sub_2409AC6D0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = (a3 >> 58) & 3;
  if ((_DWORD)v3 == 2 || (_DWORD)v3 == 1)
  {
    sub_2409A4D64(result, a2, a3 & 0xF3FFFFFFFFFFFFFFLL);
    return swift_bridgeObjectRetain();
  }
  else if (!(_DWORD)v3)
  {
    return sub_2409A4D64(result, a2, a3);
  }
  return result;
}

uint64_t sub_2409AC728(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = (a3 >> 58) & 3;
  if ((_DWORD)v3 == 2 || (_DWORD)v3 == 1)
  {
    sub_2409A442C(result, a2, a3 & 0xF3FFFFFFFFFFFFFFLL);
    return swift_bridgeObjectRelease();
  }
  else if (!(_DWORD)v3)
  {
    return sub_2409A442C(result, a2, a3);
  }
  return result;
}

uint64_t sub_2409AC780()
{
  return sub_2409ABCC0();
}

uint64_t sub_2409AC794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4;
  uint64_t v7;
  ValueMetadata *v8;
  _UNKNOWN **v9;
  ValueMetadata *v11;
  _UNKNOWN **v12;
  __int128 v13;
  ValueMetadata *v14;
  _UNKNOWN **v15;

  v4 = a1 == 0x726F6C6F63 && a2 == 0xE500000000000000;
  if (v4 || (sub_2409C6144() & 1) != 0)
  {
    v7 = swift_bridgeObjectRelease();
    v8 = &type metadata for DeclarationParsers.Color;
    v9 = &protocol witness table for DeclarationParsers.Color;
LABEL_7:
    v14 = v8;
    v15 = v9;
    nullsub_1(v7);
    return sub_2409ACCAC(&v13, a3);
  }
  if (a1 == 0xD000000000000010 && a2 == 0x80000002409CC2A0 || (sub_2409C6144() & 1) != 0)
  {
    v7 = swift_bridgeObjectRelease();
    v8 = &type metadata for DeclarationParsers.BackgroundColor;
    v9 = &protocol witness table for DeclarationParsers.BackgroundColor;
    goto LABEL_7;
  }
  if (a1 == 0x696C612D74786574 && a2 == 0xEA00000000006E67 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.TextAlign;
    v12 = &protocol witness table for DeclarationParsers.TextAlign;
  }
  else if (a1 == 0x7A69732D746E6F66 && a2 == 0xE900000000000065 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.FontSize;
    v12 = &protocol witness table for DeclarationParsers.FontSize;
  }
  else if (a1 == 0x6965772D746E6F66 && a2 == 0xEB00000000746867 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.FontWeight;
    v12 = &protocol witness table for DeclarationParsers.FontWeight;
  }
  else if (a1 == 0x7974732D746E6F66 && a2 == 0xEA0000000000656CLL || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.FontStyle;
    v12 = &protocol witness table for DeclarationParsers.FontStyle;
  }
  else if (a1 == 0x7261762D746E6F66 && a2 == 0xEC000000746E6169 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.FontVariant;
    v12 = &protocol witness table for DeclarationParsers.FontVariant;
  }
  else if (a1 == 0x6D61662D746E6F66 && a2 == 0xEB00000000796C69 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.FontFamily;
    v12 = &protocol witness table for DeclarationParsers.FontFamily;
  }
  else if (a1 == 1953394534 && a2 == 0xE400000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.Font;
    v12 = &protocol witness table for DeclarationParsers.Font;
  }
  else
  {
    if ((a1 != 0xD000000000000010 || a2 != 0x80000002409CC2C0) && (sub_2409C6144() & 1) == 0)
    {
      v14 = &type metadata for DeclarationParsers.Default;
      v15 = &off_2510BC2D8;
      *(_QWORD *)&v13 = a1;
      *((_QWORD *)&v13 + 1) = a2;
      return sub_2409ACCAC(&v13, a3);
    }
    swift_bridgeObjectRelease();
    v11 = &type metadata for DeclarationParsers.BackgroundImage;
    v12 = &protocol witness table for DeclarationParsers.BackgroundImage;
  }
  v14 = v11;
  v15 = v12;
  return sub_2409ACCAC(&v13, a3);
}

uint64_t sub_2409ACCAC(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2409ACCC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, _QWORD, unint64_t, uint64_t, uint64_t);
  unint64_t v16;
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v18[2] = a3;
  v6 = sub_2409C5CA0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2409ACDF8(v3, (uint64_t)v20);
  v11 = v21;
  v10 = v22;
  v18[1] = __swift_project_boxed_opaque_existential_1(v20, v21);
  sub_2409C5C94();
  v12 = sub_2409C5F58();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19[0] = v12;
  v19[1] = v14;
  v15 = *(void (**)(_QWORD *, _QWORD, unint64_t, uint64_t, uint64_t))(v10 + 8);
  v16 = sub_2409AC658();
  v15(v19, MEMORY[0x24BEE0D00], v16, v11, v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
}

uint64_t sub_2409ACDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2409ACE3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2409ACCC4(a1, a2, a3);
}

uint64_t sub_2409ACE50(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2409ACE80@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;

  swift_bridgeObjectRetain();
  result = sub_2409C5E38();
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = result;
  *(_QWORD *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 32) = 0;
  return result;
}

uint64_t sub_2409ACF04@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2409ACE80(*v1, v1[1], a1);
}

uint64_t DeclarationParsers.TextAlign.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned __int8 v8;

  sub_2409AD1FC();
  sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.TextAlign, a2, (uint64_t)&type metadata for StyleSheet.TextAlign, (uint64_t)&v8);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  if (!v3)
  {
    *(_QWORD *)a3 = v8;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_BYTE *)(a3 + 32) = 3;
  }
  return result;
}

uint64_t sub_2409ACFC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v5 = v4;
  v30 = a1;
  v26 = a4;
  v25 = sub_2409C5EEC();
  v8 = *(_QWORD *)(v25 - 8);
  v9 = MEMORY[0x24BDAC7A8](v25);
  v11 = (char *)&v25 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v27 = v5;
  v15(v13, v5, a2);
  v28 = sub_2409C5E38();
  v29 = v16;
  sub_2409C5E80();
  v17 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, a3) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v26, v11, a3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v25);
  v15(v13, v27, a2);
  v18 = sub_2409C5E38();
  v20 = v19;
  v28 = 0;
  v29 = 0xE000000000000000;
  sub_2409C5FAC();
  swift_bridgeObjectRelease();
  v28 = 0xD000000000000010;
  v29 = 0x80000002409CC450;
  sub_2409C6234();
  sub_2409C5DCC();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  v21 = v28;
  v22 = v29;
  sub_2409AB4E8();
  swift_allocError();
  *(_QWORD *)v23 = v18;
  *(_QWORD *)(v23 + 8) = v20;
  *(_QWORD *)(v23 + 16) = v21;
  *(_QWORD *)(v23 + 24) = v22;
  *(_BYTE *)(v23 + 32) = 0;
  return swift_willThrow();
}

unint64_t sub_2409AD1FC()
{
  unint64_t result;

  result = qword_257073078;
  if (!qword_257073078)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.TextAlign, &type metadata for StyleSheet.TextAlign);
    atomic_store(result, (unint64_t *)&qword_257073078);
  }
  return result;
}

uint64_t sub_2409AD240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.TextAlign.parse<A>(input:)(a1, a2, a3);
}

double sub_2409AD254(unint64_t *a1, uint64_t a2, unint64_t a3)
{
  double v3;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  _BYTE *v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  double v36;

  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
LABEL_18:
    v18 = 0xD000000000000039;
    v33 = a2;
    v34 = a3;
    swift_bridgeObjectRetain();
    v19 = sub_2409C5E38();
    v21 = v20;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v22 = v19;
    v23 = "Could not parse size value: input does not have any unit.";
    goto LABEL_19;
  }
  v8 = 4 * v6;
  v9 = 15;
  while (sub_2409C5E2C() == 46 && v10 == 0xE100000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    v9 = sub_2409C5DA8();
    if (v8 == v9 >> 14)
      goto LABEL_18;
  }
  v11 = sub_2409C5CF4();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    goto LABEL_6;
  v12 = sub_2409C5E44();
  v36 = 0.0;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x2426854E8](v13);
  v16 = v15;
  if ((v15 & 0x1000000000000000) != 0 || !(v15 & 0x2000000000000000 | v14 & 0x1000000000000000))
  {
    sub_2409C5F88();
    goto LABEL_17;
  }
  MEMORY[0x24BDAC7A8](v14);
  if ((v16 & 0x2000000000000000) != 0)
  {
    v33 = v17;
    v34 = v16 & 0xFFFFFFFFFFFFFFLL;
    if (v17 <= 0x20u && ((0x100003E01uLL >> v17) & 1) != 0)
    {
      v26 = 0;
    }
    else
    {
      v25 = (_BYTE *)_swift_stdlib_strtod_clocale();
      if (v25)
        v26 = *v25 == 0;
      else
        v26 = 0;
    }
    v35 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((v17 & 0x1000000000000000) != 0)
    {
      ((void (*)(uint64_t *__return_ptr, uint64_t))sub_2409AB47C)(&v33, (v16 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      v32 = sub_2409C5FDC();
      ((void (*)(uint64_t *__return_ptr, uint64_t))sub_2409AB47C)(&v33, v32);
    }
    v35 = v33;
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v35)
  {
    v3 = v36;
    *a1 = sub_2409AD978(v9, a2, a3);
    a1[1] = v27;
    a1[2] = v28;
    a1[3] = v29;
    return v3;
  }
  v33 = a2;
  v34 = a3;
  swift_bridgeObjectRetain();
  v30 = sub_2409C5E38();
  v21 = v31;
  sub_2409AB4E8();
  swift_allocError();
  *(_QWORD *)v22 = v30;
  v18 = 0xD00000000000003ELL;
  v23 = "Could not parse size value: could not convert input to Double.";
LABEL_19:
  *(_QWORD *)(v22 + 8) = v21;
  *(_QWORD *)(v22 + 16) = v18;
  *(_QWORD *)(v22 + 24) = (unint64_t)(v23 - 32) | 0x8000000000000000;
  *(_BYTE *)(v22 + 32) = 0;
  swift_willThrow();
  return v3;
}

double sub_2409AD61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedTypeWitness;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v23 = a1;
  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v24 = a2;
  sub_2409C5EBC();
  if ((v26 & 1) != 0)
  {
    v10 = 0xD000000000000039;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v24, a3);
    v11 = sub_2409C5E38();
    v13 = v12;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v14 = v11;
    v15 = "Could not parse size value: input does not have any unit.";
LABEL_6:
    *(_QWORD *)(v14 + 8) = v13;
    *(_QWORD *)(v14 + 16) = v10;
    *(_QWORD *)(v14 + 24) = (unint64_t)(v15 - 32) | 0x8000000000000000;
    *(_BYTE *)(v14 + 32) = 0;
    swift_willThrow();
    return v3;
  }
  v21 = v25;
  v22 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570730C0);
  sub_2409B00E4(&qword_2570730C8, &qword_2570730C0, MEMORY[0x24BEE2C68]);
  sub_2409C5ED4();
  swift_getAssociatedConformanceWitness();
  v16 = sub_2409C5EB0();
  if ((v17 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v8, v24, a3);
    v18 = sub_2409C5E38();
    v13 = v19;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v14 = v18;
    v10 = 0xD00000000000003ELL;
    v15 = "Could not parse size value: could not convert input to Double.";
    goto LABEL_6;
  }
  v3 = *(double *)&v16;
  v25 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570730D0);
  sub_2409B00E4(&qword_2570730D8, &qword_2570730D0, MEMORY[0x24BEE2C50]);
  sub_2409C5ED4();
  return v3;
}

uint64_t sub_2409AD900(_QWORD *a1)
{
  char v2;
  char v3;

  if (*a1 == 46 && a1[1] == 0xE100000000000000)
  {
    v3 = 0;
  }
  else
  {
    v2 = sub_2409C6144();
    v3 = 0;
    if ((v2 & 1) == 0)
      v3 = sub_2409C5CF4() ^ 1;
  }
  return v3 & 1;
}

unint64_t sub_2409AD978(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_2409C5E44();
  __break(1u);
  return result;
}

uint64_t sub_2409AD9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  double v14;
  double v15;
  uint64_t result;
  char v17;
  _BYTE v18[14];
  char v19;
  unsigned __int8 v20;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v18[-v12];
  sub_2409ADBC4();
  sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.Font.Size.Absolute, a2, (uint64_t)&type metadata for StyleSheet.Font.Size.Absolute, (uint64_t)&v20);
  if (v3)
  {
    MEMORY[0x242685B0C](v3);
    v14 = sub_2409AD61C((uint64_t)v11, a1, a2);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v13, v11, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    sub_2409ADC08();
    sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.Font.Size.Unit, AssociatedTypeWitness, (uint64_t)&type metadata for StyleSheet.Font.Size.Unit, (uint64_t)&v19);
    result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, AssociatedTypeWitness);
    v17 = v19;
  }
  else
  {
    *(_QWORD *)&v15 = v20;
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    v14 = v15;
    v17 = 0x80;
  }
  *(double *)a3 = v14;
  *(_BYTE *)(a3 + 8) = v17;
  return result;
}

unint64_t sub_2409ADBC4()
{
  unint64_t result;

  result = qword_257073080;
  if (!qword_257073080)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Absolute, &type metadata for StyleSheet.Font.Size.Absolute);
    atomic_store(result, (unint64_t *)&qword_257073080);
  }
  return result;
}

unint64_t sub_2409ADC08()
{
  unint64_t result;

  result = qword_257073088;
  if (!qword_257073088)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Unit, &type metadata for StyleSheet.Font.Size.Unit);
    atomic_store(result, (unint64_t *)&qword_257073088);
  }
  return result;
}

uint64_t DeclarationParsers.FontSize.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;

  result = sub_2409AD9C4(a1, a2, (uint64_t)&v13);
  if (!v3)
  {
    v11 = v13;
    v12 = v14;
    v10 = 13;
    v9 = 3;
    v8 = 2;
    result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v11, &v10, &v9, &v8, 0, (uint64_t)&v13);
    v6 = v14;
    v7 = v15;
    *(_QWORD *)a3 = v13;
    *(_QWORD *)(a3 + 8) = v6;
    *(_QWORD *)(a3 + 16) = v7;
    *(_QWORD *)(a3 + 24) = 0;
    *(_BYTE *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_2409ADCE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontSize.parse<A>(input:)(a1, a2, a3);
}

uint64_t sub_2409ADCF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2409ADE84(a1, a2, (void (*)(void))sub_2409ADD1C, (uint64_t)&type metadata for StyleSheet.Font.Weight, a3);
}

unint64_t sub_2409ADD1C()
{
  unint64_t result;

  result = qword_257073090;
  if (!qword_257073090)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Weight, &type metadata for StyleSheet.Font.Weight);
    atomic_store(result, (unint64_t *)&qword_257073090);
  }
  return result;
}

uint64_t DeclarationParsers.FontWeight.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  sub_2409ADD1C();
  sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.Font.Weight, a2, (uint64_t)&type metadata for StyleSheet.Font.Weight, (uint64_t)&v12);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  if (!v3)
  {
    v10 = 0;
    v11 = -4;
    v17 = v12;
    v16 = 3;
    v15 = 2;
    result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v10, &v17, &v16, &v15, 0, (uint64_t)&v12);
    v8 = v13;
    v9 = v14;
    *(_QWORD *)a3 = v12;
    *(_QWORD *)(a3 + 8) = v8;
    *(_QWORD *)(a3 + 16) = v9;
    *(_QWORD *)(a3 + 24) = 0;
    *(_BYTE *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_2409ADE4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontWeight.parse<A>(input:)(a1, a2, a3);
}

uint64_t sub_2409ADE60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2409ADE84(a1, a2, (void (*)(void))sub_2409ADF08, (uint64_t)&type metadata for StyleSheet.Font.Style, a3);
}

uint64_t sub_2409ADE84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  a3();
  sub_2409ACFC0(a4, a2, a4, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
}

unint64_t sub_2409ADF08()
{
  unint64_t result;

  result = qword_257073098;
  if (!qword_257073098)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Style, &type metadata for StyleSheet.Font.Style);
    atomic_store(result, (unint64_t *)&qword_257073098);
  }
  return result;
}

uint64_t DeclarationParsers.FontStyle.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  sub_2409ADF08();
  sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.Font.Style, a2, (uint64_t)&type metadata for StyleSheet.Font.Style, (uint64_t)&v12);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  if (!v3)
  {
    v10 = 0;
    v11 = -4;
    v17 = 13;
    v16 = v12;
    v15 = 2;
    result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v10, &v17, &v16, &v15, 0, (uint64_t)&v12);
    v8 = v13;
    v9 = v14;
    *(_QWORD *)a3 = v12;
    *(_QWORD *)(a3 + 8) = v8;
    *(_QWORD *)(a3 + 16) = v9;
    *(_QWORD *)(a3 + 24) = 0;
    *(_BYTE *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_2409AE038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontStyle.parse<A>(input:)(a1, a2, a3);
}

uint64_t sub_2409AE04C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_2409AE0D0();
  sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.Font.Variant, a2, (uint64_t)&type metadata for StyleSheet.Font.Variant, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
}

unint64_t sub_2409AE0D0()
{
  unint64_t result;

  result = qword_2570730A0;
  if (!qword_2570730A0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Variant, &type metadata for StyleSheet.Font.Variant);
    atomic_store(result, (unint64_t *)&qword_2570730A0);
  }
  return result;
}

uint64_t DeclarationParsers.FontVariant.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  sub_2409AE0D0();
  sub_2409ACFC0((uint64_t)&type metadata for StyleSheet.Font.Variant, a2, (uint64_t)&type metadata for StyleSheet.Font.Variant, (uint64_t)&v12);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  if (!v3)
  {
    v10 = 0;
    v11 = -4;
    v17 = 13;
    v16 = 3;
    v15 = v12;
    result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v10, &v17, &v16, &v15, 0, (uint64_t)&v12);
    v8 = v13;
    v9 = v14;
    *(_QWORD *)a3 = v12;
    *(_QWORD *)(a3 + 8) = v8;
    *(_QWORD *)(a3 + 16) = v9;
    *(_QWORD *)(a3 + 24) = 0;
    *(_BYTE *)(a3 + 32) = 4;
  }
  return result;
}

uint64_t sub_2409AE200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.FontVariant.parse<A>(input:)(a1, a2, a3);
}

char *sub_2409AE214()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v2 = (char *)&v18 - v1;
  v22 = 0;
  v23 = 0xE000000000000000;
  sub_2409C5E50();
  swift_getAssociatedConformanceWitness();
  sub_2409C5F34();
  v3 = v21;
  if (!v21)
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
  v4 = v20;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v6 = 1;
    while (1)
    {
      if (v4 == 34 && v3 == 0xE100000000000000 || (sub_2409C6144() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v6 ^= 1u;
        goto LABEL_13;
      }
      if ((v6 & 1) != 0)
      {
        if ((sub_2409C5CDC() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v6 = 1;
          goto LABEL_13;
        }
        if (v4 == 44 && v3 == 0xE100000000000000 || (sub_2409C6144() & 1) != 0)
          break;
      }
      MEMORY[0x24268556C](v4, v3);
      swift_bridgeObjectRelease();
LABEL_13:
      sub_2409C5F34();
      v4 = v20;
      v3 = v21;
      if (!v21)
        goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    v7 = v22;
    v8 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v5 = sub_2409AF9C8(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    v10 = *((_QWORD *)v5 + 2);
    v9 = *((_QWORD *)v5 + 3);
    if (v10 >= v9 >> 1)
      v5 = sub_2409AF9C8((char *)(v9 > 1), v10 + 1, 1, v5);
    *((_QWORD *)v5 + 2) = v10 + 1;
    v11 = &v5[16 * v10];
    *((_QWORD *)v11 + 4) = v7;
    *((_QWORD *)v11 + 5) = v8;
    v22 = 0;
    v23 = 0xE000000000000000;
    sub_2409C5F34();
    v4 = v20;
    v3 = v21;
  }
  while (v21);
LABEL_24:
  (*(void (**)(char *, uint64_t))(v19 + 8))(v2, AssociatedTypeWitness);
  v12 = v22;
  v13 = v23;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_2409AF9C8(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
  v15 = *((_QWORD *)v5 + 2);
  v14 = *((_QWORD *)v5 + 3);
  if (v15 >= v14 >> 1)
    v5 = sub_2409AF9C8((char *)(v14 > 1), v15 + 1, 1, v5);
  *((_QWORD *)v5 + 2) = v15 + 1;
  v16 = &v5[16 * v15];
  *((_QWORD *)v16 + 4) = v12;
  *((_QWORD *)v16 + 5) = v13;
  return v5;
}

uint64_t DeclarationParsers.FontFamily.parse<A>(input:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  result = (uint64_t)sub_2409AE214();
  if (!v1)
  {
    v9 = 0;
    v10 = -4;
    v8 = 13;
    v7 = 3;
    v6 = 2;
    result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v9, &v8, &v7, &v6, result, (uint64_t)&v11);
    v4 = v12;
    v5 = v13;
    *(_QWORD *)a1 = v11;
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = 0;
    *(_BYTE *)(a1 + 32) = 4;
  }
  return result;
}

uint64_t sub_2409AE5A8@<X0>(uint64_t a1@<X8>)
{
  return DeclarationParsers.FontFamily.parse<A>(input:)(a1);
}

uint64_t sub_2409AE5BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2409C5CDC();
  *a1 = result & 1;
  return result;
}

uint64_t DeclarationParsers.Font.parse<A>(input:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char v42;
  BOOL v43;
  char v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  char v105;
  char v106;
  unint64_t v107;
  char v108;
  char v109;
  char v110;
  char v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  char v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  char v123;
  char v124;
  double v125;
  char v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;

  v2 = v1;
  v4 = sub_2409C5E38();
  v6 = v5;
  swift_bridgeObjectRetain();
  v127 = sub_2409C5E38();
  v128 = v7;
  sub_2409B00A0();
  sub_2409C5E80();
  v8 = LOBYTE(v125);
  if (LOBYTE(v125) == 6)
  {
    swift_bridgeObjectRetain();
    v9 = sub_2409C5E38();
    v11 = v10;
    v127 = 0;
    v128 = 0xE000000000000000;
    sub_2409C5FAC();
    swift_bridgeObjectRelease();
    sub_2409AB4E8();
    v2 = swift_allocError();
    *(_QWORD *)v12 = v9;
    *(_QWORD *)(v12 + 8) = v11;
    *(_QWORD *)(v12 + 16) = 0xD000000000000026;
    *(_QWORD *)(v12 + 24) = 0x80000002409CC420;
    *(_BYTE *)(v12 + 32) = 0;
    swift_willThrow();
  }
  if (!v2)
  {
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 8) = 0x8000000000000000;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_BYTE *)(a1 + 32) = 4;
    return result;
  }
  v103 = a1;
  MEMORY[0x242685B0C](v2);
  swift_bridgeObjectRetain();
  v112 = v4;
  v13 = sub_2409AD978(0xFuLL, v4, v6);
  v15 = v14;
  result = swift_bridgeObjectRelease();
  v17 = v13 >> 14;
  v115 = v15 >> 14;
  if (v15 >> 14 < v13 >> 14)
  {
LABEL_109:
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
    return result;
  }
  v18 = sub_2409C5F28();
  v20 = v19;
  swift_getKeyPath();
  v21 = v20 >> 14;
  if (v20 >> 14 == v18 >> 14)
  {
    swift_bridgeObjectRelease();
    swift_release();
    v22 = 13;
    v23 = 3;
    v24 = 2;
    v25 = v4;
    goto LABEL_55;
  }
  v120 = v13;
  v108 = 0;
  v110 = 13;
  v104 = 2;
  v106 = 3;
  v118 = 1;
  v113 = v6;
  do
  {
    sub_2409C5F1C();
    v26 = sub_2409C5CDC();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      v27 = sub_2409C5EF8();
      if (v21 == v27 >> 14)
        break;
      v28 = v27;
      while (1)
      {
        sub_2409C5F1C();
        v29 = sub_2409C5CDC();
        swift_bridgeObjectRelease();
        if ((v29 & 1) != 0)
          break;
        v28 = sub_2409C5EF8();
        if (v21 == v28 >> 14)
        {
          v6 = v113;
          goto LABEL_38;
        }
      }
      v18 = v28;
      v6 = v113;
    }
    swift_bridgeObjectRelease();
    result = swift_release();
    if (v17 > v18 >> 14)
    {
      __break(1u);
LABEL_108:
      __break(1u);
      goto LABEL_109;
    }
    v32 = sub_2409C5F28();
    v34 = v33;
    v35 = v31;
    if (v33 == 0x6C616D726F6ELL && v31 == 0xE600000000000000 && !(v32 >> 16) && v30 >> 16 == 6
      || (sub_2409C612C() & 1) != 0)
    {
      v36 = sub_2409C5EF8();
      result = swift_bridgeObjectRelease();
      v108 = 1;
      goto LABEL_35;
    }
    if (v106 == 3)
    {
      v129 = v34;
      v130 = v35;
      sub_2409AFAC8();
      swift_bridgeObjectRetain_n();
      v127 = sub_2409C5E38();
      v128 = v37;
      sub_2409ADF08();
      sub_2409C5E80();
      if (LOBYTE(v125) != 3)
      {
        swift_bridgeObjectRelease();
        v106 = LOBYTE(v125);
        goto LABEL_34;
      }
      v129 = v34;
      v130 = v35;
      swift_bridgeObjectRetain();
      sub_2409C5E38();
      v127 = 0;
      v128 = 0xE000000000000000;
      sub_2409C5FAC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (v104 != 2)
      goto LABEL_29;
    v129 = v34;
    v130 = v35;
    sub_2409AFAC8();
    swift_bridgeObjectRetain_n();
    v127 = sub_2409C5E38();
    v128 = v38;
    sub_2409AE0D0();
    sub_2409C5E80();
    if (LOBYTE(v125) == 2)
    {
      v129 = v34;
      v130 = v35;
      swift_bridgeObjectRetain();
      sub_2409C5E38();
      v127 = 0;
      v128 = 0xE000000000000000;
      sub_2409C5FAC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_29:
      v22 = v110;
      if (v110 != 13)
      {
        swift_bridgeObjectRelease();
        v42 = v108;
        v36 = v120;
        v25 = v112;
        goto LABEL_43;
      }
      v129 = v34;
      v130 = v35;
      sub_2409AFAC8();
      swift_bridgeObjectRetain_n();
      v127 = sub_2409C5E38();
      v128 = v39;
      sub_2409ADD1C();
      sub_2409C5E80();
      v110 = LOBYTE(v125);
      if (LOBYTE(v125) == 13)
      {
        v129 = v34;
        v130 = v35;
        swift_bridgeObjectRetain();
        sub_2409C5E38();
        v127 = 0;
        v128 = 0xE000000000000000;
        sub_2409C5FAC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        v42 = v108;
        v36 = v120;
        v25 = v112;
LABEL_40:
        if ((v42 & 1) != 0)
          v22 = 0;
        else
          v22 = 13;
        goto LABEL_43;
      }
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    v104 = LOBYTE(v125);
LABEL_34:
    v36 = sub_2409C5EF8();
    result = swift_bridgeObjectRelease();
LABEL_35:
    if (v118 == 3)
      goto LABEL_39;
    v17 = v36 >> 14;
    if (v115 < v36 >> 14)
      goto LABEL_108;
    ++v118;
    v120 = v36;
    v18 = sub_2409C5F28();
    v41 = v40;
    swift_getKeyPath();
    v21 = v41 >> 14;
  }
  while (v41 >> 14 != v18 >> 14);
LABEL_38:
  swift_bridgeObjectRelease();
  swift_release();
  v36 = v120;
LABEL_39:
  v42 = v108;
  v22 = v110;
  v25 = v112;
  if (v110 == 13)
    goto LABEL_40;
LABEL_43:
  v43 = (v42 & 1) == 0;
  if ((v42 & 1) != 0)
    v23 = 0;
  else
    v23 = 3;
  if (v43)
    v44 = 2;
  else
    v44 = 0;
  if (v106 != 3)
    v23 = v106;
  if (v104 == 2)
    v24 = v44;
  else
    v24 = v104;
  v13 = v36;
LABEL_55:
  v109 = v24;
  v111 = v22;
  v116 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v45 = sub_2409AD978(v13, v25, v6);
  v47 = v46;
  v114 = v6;
  result = swift_bridgeObjectRelease();
  v117 = v47 >> 14;
  if (v47 >> 14 < v45 >> 14)
    goto LABEL_110;
  v48 = sub_2409C5F28();
  v50 = v49 >> 14;
  v119 = v47;
  if (v49 >> 14 == v48 >> 14)
  {
    v51 = 0;
    v121 = 1;
    goto LABEL_72;
  }
  v51 = v48;
  if (sub_2409C5F1C() == 47 && v52 == 0xE100000000000000)
  {
LABEL_60:
    swift_bridgeObjectRelease();
    v121 = 0;
  }
  else
  {
    v53 = sub_2409C6144();
    swift_bridgeObjectRelease();
    v121 = 0;
    if ((v53 & 1) == 0)
    {
      v54 = sub_2409C5EF8();
      if (v50 != v54 >> 14)
      {
        v55 = v54;
        while (sub_2409C5F1C() != 47 || v56 != 0xE100000000000000)
        {
          v57 = sub_2409C6144();
          swift_bridgeObjectRelease();
          if ((v57 & 1) != 0)
            goto LABEL_70;
          v55 = sub_2409C5EF8();
          if (v50 == v55 >> 14)
          {
            v55 = 0;
LABEL_70:
            v121 = v57 ^ 1;
            v51 = v55;
            goto LABEL_71;
          }
        }
        v51 = v55;
        v47 = v119;
        goto LABEL_60;
      }
      v51 = 0;
      v121 = 1;
    }
LABEL_71:
    v47 = v119;
  }
LABEL_72:
  swift_bridgeObjectRelease();
  v58 = sub_2409C5F28();
  v60 = v59 >> 14;
  if (v59 >> 14 == v58 >> 14)
  {
    result = swift_bridgeObjectRelease();
    v61 = v47;
    v62 = v47;
LABEL_78:
    v64 = v117;
  }
  else
  {
    v61 = v58;
    while (1)
    {
      sub_2409C5F1C();
      v63 = sub_2409C5CDC();
      swift_bridgeObjectRelease();
      if ((v63 & 1) != 0)
        break;
      v61 = sub_2409C5EF8();
      if (v60 == v61 >> 14)
      {
        result = swift_bridgeObjectRelease();
        v62 = v119;
        v61 = v119;
        goto LABEL_78;
      }
    }
    result = swift_bridgeObjectRelease();
    v64 = v61 >> 14;
    v62 = v119;
  }
  if ((v121 & 1) != 0)
    v65 = v62;
  else
    v65 = v51;
  if (v64 >= v65 >> 14)
    v66 = v65;
  else
    v66 = v61;
  if (v45 >> 14 > v66 >> 14)
    goto LABEL_111;
  sub_2409C5F28();
  v129 = v67;
  v130 = v68;
  sub_2409AFAC8();
  swift_bridgeObjectRetain();
  v69 = sub_2409C5E38();
  v71 = v70;
  swift_bridgeObjectRetain();
  v127 = sub_2409C5E38();
  v128 = v72;
  sub_2409ADBC4();
  sub_2409C5E80();
  *(_QWORD *)&v73 = LOBYTE(v125);
  if (LOBYTE(v125) != 7)
  {
    v79 = 0;
    v80 = v114;
    goto LABEL_91;
  }
  swift_bridgeObjectRetain();
  v74 = sub_2409C5E38();
  v76 = v75;
  v127 = 0;
  v128 = 0xE000000000000000;
  sub_2409C5FAC();
  swift_bridgeObjectRelease();
  sub_2409AB4E8();
  v77 = swift_allocError();
  *(_QWORD *)v78 = v74;
  *(_QWORD *)(v78 + 8) = v76;
  *(_QWORD *)(v78 + 16) = 0xD000000000000028;
  *(_QWORD *)(v78 + 24) = 0x80000002409CC3F0;
  *(_BYTE *)(v78 + 32) = 0;
  swift_willThrow();
  v79 = v77;
  v80 = v114;
  if (!v77)
  {
LABEL_91:
    swift_bridgeObjectRelease();
    v81 = 0x80;
    goto LABEL_92;
  }
  MEMORY[0x242685B0C](v77);
  v79 = 0;
  v94 = sub_2409AD254((unint64_t *)&v127, v69, v71);
  swift_bridgeObjectRelease();
  v95 = v128;
  v97 = v129;
  v96 = v130;
  v107 = v127;
  swift_bridgeObjectRetain();
  v127 = sub_2409C5E38();
  v128 = v98;
  sub_2409ADC08();
  sub_2409C5E80();
  v105 = LOBYTE(v125);
  if (LOBYTE(v125) == 4)
  {
    v127 = v107;
    v128 = v95;
    v129 = v97;
    v130 = v96;
    swift_bridgeObjectRetain();
    v99 = sub_2409C5E38();
    v101 = v100;
    v127 = 0;
    v128 = 0xE000000000000000;
    sub_2409C5FAC();
    swift_bridgeObjectRelease();
    sub_2409AB4E8();
    v79 = swift_allocError();
    *(_QWORD *)v102 = v99;
    *(_QWORD *)(v102 + 8) = v101;
    *(_QWORD *)(v102 + 16) = 0xD000000000000024;
    *(_QWORD *)(v102 + 24) = 0x80000002409CC340;
    *(_BYTE *)(v102 + 32) = 0;
    swift_willThrow();
  }
  v80 = v114;
  if (!v79)
  {
    swift_bridgeObjectRelease();
    v73 = v94;
    v81 = v105;
LABEL_92:
    v82 = sub_2409C5EF8();
    swift_bridgeObjectRelease();
    if (v79)
      goto LABEL_102;
    v83 = v81;
    swift_bridgeObjectRelease();
    if ((v121 & 1) != 0)
      v84 = v82;
    else
      v84 = v61;
    v85 = sub_2409AD978(v84, v112, v80);
    v87 = v86;
    result = swift_bridgeObjectRelease();
    if (v87 >> 14 >= v85 >> 14)
    {
      v127 = sub_2409C5F28();
      v128 = v88;
      v129 = v89;
      v130 = v90;
      swift_bridgeObjectRetain();
      sub_2409C5E38();
      v91 = sub_2409AFB0C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v125 = v73;
      v126 = v83;
      v124 = v111;
      v123 = v116;
      v122 = v109;
      result = StyleSheet.Font.Specified.init(size:weight:style:variant:family:)((uint64_t)&v125, &v124, &v123, &v122, (uint64_t)v91, (uint64_t)&v127);
      v92 = v128;
      v93 = v129;
      *(_QWORD *)v103 = v127;
      *(_QWORD *)(v103 + 8) = v92;
      *(_QWORD *)(v103 + 16) = v93;
      *(_QWORD *)(v103 + 24) = 0;
      *(_BYTE *)(v103 + 32) = 4;
      return result;
    }
    goto LABEL_112;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_102:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2409AF548@<X0>(uint64_t a1@<X8>)
{
  return DeclarationParsers.Font.parse<A>(input:)(a1);
}

uint64_t DeclarationParsers.Color.parse<A>(input:)@<X0>(int8x8_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  int8x8_t v4;
  int8x8_t v5;
  unsigned int v6;

  result = sub_2409B023C(&v5);
  if (!v1)
  {
    v4 = (int8x8_t)v6;
    *a1 = v5;
    a1[1] = v4;
    a1[2] = 0;
    a1[3] = 0;
    a1[4].i8[0] = 1;
  }
  return result;
}

uint64_t sub_2409AF5A8@<X0>(int8x8_t *a1@<X8>)
{
  return DeclarationParsers.Color.parse<A>(input:)(a1);
}

uint64_t DeclarationParsers.BackgroundColor.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  int8x8_t v9;
  unint64_t v10;

  v9 = (int8x8_t)0x726170736E617274;
  v10 = 0xEB00000000746E65;
  sub_2409AC658();
  if ((sub_2409C5F7C() & 1) != 0)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    *(_OWORD *)a3 = xmmword_2409C6EA0;
  }
  else
  {
    result = sub_2409B023C(&v9);
    if (v3)
      return result;
    v8 = v10;
    *(int8x8_t *)a3 = v9;
    *(_QWORD *)(a3 + 8) = v8;
  }
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_BYTE *)(a3 + 32) = 2;
  return result;
}

uint64_t sub_2409AF6A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DeclarationParsers.BackgroundColor.parse<A>(input:)(a1, a2, a3);
}

uint64_t DeclarationParsers.BackgroundImage.parse<A>(input:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v29 = *(_QWORD *)(a3 + 8);
  v30 = *(_QWORD *)(v29 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - v12;
  v31 = 1701736302;
  v32 = 0xE400000000000000;
  sub_2409AC658();
  if ((sub_2409C5F7C() & 1) != 0)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
LABEL_6:
    *(_BYTE *)(a4 + 32) = 5;
    return result;
  }
  v26 = v11;
  v27 = v13;
  v28 = v8;
  if ((sub_2409C5F64() & 1) != 0 && (sub_2409C5F70() & 1) != 0)
  {
    sub_2409C5D9C();
    v15 = v26;
    sub_2409C5EC8();
    sub_2409C5D9C();
    swift_getAssociatedConformanceWitness();
    v16 = v27;
    sub_2409C5D00();
    v17 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v15, v16, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    v18 = sub_2409C5E38();
    v20 = v19;
    result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v16, AssociatedTypeWitness);
    *(_QWORD *)a4 = v18;
    *(_QWORD *)(a4 + 8) = v20;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
    goto LABEL_6;
  }
  v21 = sub_2409C5E38();
  v23 = v22;
  sub_2409AB4E8();
  swift_allocError();
  *(_QWORD *)v24 = v21;
  *(_QWORD *)(v24 + 8) = v23;
  *(_QWORD *)(v24 + 16) = 0xD000000000000058;
  *(_QWORD *)(v24 + 24) = 0x80000002409CC2E0;
  *(_BYTE *)(v24 + 32) = 0;
  return swift_willThrow();
}

uint64_t sub_2409AF9B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return DeclarationParsers.BackgroundImage.parse<A>(input:)(a1, a2, a3, a4);
}

char *sub_2409AF9C8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570730B8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_2409AFAC8()
{
  unint64_t result;

  result = qword_2570730A8;
  if (!qword_2570730A8)
  {
    result = MEMORY[0x242685B78](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_2570730A8);
  }
  return result;
}

char *sub_2409AFB0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;

  v0 = sub_2409C5DD8();
  if (!v1)
  {
    v4 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
  v2 = v0;
  v3 = v1;
  v4 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = 1;
    while (1)
    {
      if (v2 == 34 && v3 == 0xE100000000000000 || (sub_2409C6144() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 ^= 1u;
        goto LABEL_13;
      }
      if ((v5 & 1) != 0)
      {
        if ((sub_2409C5CDC() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v5 = 1;
          goto LABEL_13;
        }
        if (v2 == 44 && v3 == 0xE100000000000000 || (sub_2409C6144() & 1) != 0)
          break;
      }
      MEMORY[0x24268556C](v2, v3);
      swift_bridgeObjectRelease();
LABEL_13:
      v2 = sub_2409C5DD8();
      v3 = v6;
      if (!v6)
        goto LABEL_24;
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v4 = sub_2409AF9C8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
    v8 = *((_QWORD *)v4 + 2);
    v7 = *((_QWORD *)v4 + 3);
    if (v8 >= v7 >> 1)
      v4 = sub_2409AF9C8((char *)(v7 > 1), v8 + 1, 1, v4);
    *((_QWORD *)v4 + 2) = v8 + 1;
    v9 = &v4[16 * v8];
    *((_QWORD *)v9 + 4) = 0;
    *((_QWORD *)v9 + 5) = 0xE000000000000000;
    v2 = sub_2409C5DD8();
    v3 = v10;
  }
  while (v10);
LABEL_24:
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_2409AF9C8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
  v12 = *((_QWORD *)v4 + 2);
  v11 = *((_QWORD *)v4 + 3);
  if (v12 >= v11 >> 1)
    v4 = sub_2409AF9C8((char *)(v11 > 1), v12 + 1, 1, v4);
  *((_QWORD *)v4 + 2) = v12 + 1;
  v13 = &v4[16 * v12];
  *((_QWORD *)v13 + 4) = 0;
  *((_QWORD *)v13 + 5) = 0xE000000000000000;
  return v4;
}

uint64_t dispatch thunk of DeclarationParser.parse<A>(input:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t initializeWithCopy for AnyDeclarationParser(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnyDeclarationParser(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t assignWithTake for AnyDeclarationParser(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyDeclarationParser(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyDeclarationParser(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyDeclarationParser()
{
  return &type metadata for AnyDeclarationParser;
}

ValueMetadata *type metadata accessor for DeclarationParsers()
{
  return &type metadata for DeclarationParsers;
}

_QWORD *initializeBufferWithCopyOfBuffer for DeclarationParsers.Default(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DeclarationParsers.Default()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for DeclarationParsers.Default(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for DeclarationParsers.Default(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeclarationParsers.Default(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeclarationParsers.Default(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeclarationParsers.Default()
{
  return &type metadata for DeclarationParsers.Default;
}

ValueMetadata *type metadata accessor for DeclarationParsers.TextAlign()
{
  return &type metadata for DeclarationParsers.TextAlign;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontSize()
{
  return &type metadata for DeclarationParsers.FontSize;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontWeight()
{
  return &type metadata for DeclarationParsers.FontWeight;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontStyle()
{
  return &type metadata for DeclarationParsers.FontStyle;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontVariant()
{
  return &type metadata for DeclarationParsers.FontVariant;
}

ValueMetadata *type metadata accessor for DeclarationParsers.FontFamily()
{
  return &type metadata for DeclarationParsers.FontFamily;
}

ValueMetadata *type metadata accessor for DeclarationParsers.Font()
{
  return &type metadata for DeclarationParsers.Font;
}

ValueMetadata *type metadata accessor for DeclarationParsers.Color()
{
  return &type metadata for DeclarationParsers.Color;
}

ValueMetadata *type metadata accessor for DeclarationParsers.BackgroundColor()
{
  return &type metadata for DeclarationParsers.BackgroundColor;
}

ValueMetadata *type metadata accessor for DeclarationParsers.BackgroundImage()
{
  return &type metadata for DeclarationParsers.BackgroundImage;
}

unint64_t sub_2409B00A0()
{
  unint64_t result;

  result = qword_2570730B0;
  if (!qword_2570730B0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.System, &type metadata for StyleSheet.Font.System);
    atomic_store(result, (unint64_t *)&qword_2570730B0);
  }
  return result;
}

uint64_t sub_2409B00E4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242685B78](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2409B0128(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v10;

  v2 = v1[2];
  if (v2 >> 60 != 10)
    goto LABEL_24;
  v3 = v1[5];
  v4 = *v1;
  v5 = v1[3] | v1[4] | v1[1];
  v6 = 0xA000000000000000;
  if (v3)
    v7 = 0;
  else
    v7 = v2 == 0xA000000000000000;
  if (!v7 || v4 != 15 || v5 != 0)
  {
    if (!v3 && v2 == 0xA000000000000000 && v4 == 17 && !v5)
    {
      v10 = 18;
      goto LABEL_25;
    }
    if (!v3 && v2 == 0xA000000000000000 && v4 == 19 && !v5)
    {
      v10 = 20;
      goto LABEL_25;
    }
LABEL_24:
    v10 = 0;
    v6 = 0x1FFFFFFFELL;
    goto LABEL_25;
  }
  v10 = 16;
LABEL_25:
  *a1 = v10;
  a1[1] = 0;
  a1[2] = v6;
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
}

BOOL sub_2409B01C4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2409B01D4()
{
  return sub_2409C618C();
}

uint64_t sub_2409B01F8()
{
  sub_2409C6180();
  sub_2409C618C();
  return sub_2409C6198();
}

uint64_t sub_2409B023C@<X0>(int8x8_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  __int32 v10;
  int8x8_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  int8x8_t *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;

  v3 = sub_2409C5E38();
  v5 = v4;
  if (qword_2570737E0 != -1)
    swift_once();
  v6 = qword_2570737E8;
  if (*(_QWORD *)(qword_2570737E8 + 16))
  {
    swift_bridgeObjectRetain();
    v7 = sub_2409B0D30(v3, v5);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(v6 + 56) + 12 * v7;
      v10 = *(_DWORD *)(v9 + 8);
      v11 = *(int8x8_t *)v9;
      result = swift_bridgeObjectRelease_n();
      *a1 = v11;
      a1[1].i32[0] = v10;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  if (sub_2409C5D9C() >= 4)
  {
    swift_bridgeObjectRetain();
    v13 = sub_2409B080C(v3, v5);
    if (v14)
    {
      if (v13 == 35 && v14 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_25:
        swift_bridgeObjectRetain();
        v43 = sub_2409B1234(1uLL, v3, v5);
        v45 = v44;
        v47 = v46;
        v49 = v48;
        swift_bridgeObjectRelease();
        if ((v45 ^ v43) < 0x4000)
        {
LABEL_28:
          v52 = 0xD00000000000002ELL;
          sub_2409AFAC8();
          swift_bridgeObjectRetain();
          v53 = sub_2409C5E38();
          v55 = v54;
          sub_2409AB4E8();
          swift_allocError();
          *(_QWORD *)v56 = v53;
          v57 = "Could not parse hex color: invalid hex number.";
LABEL_29:
          *(_QWORD *)(v56 + 8) = v55;
          *(_QWORD *)(v56 + 16) = v52;
          *(_QWORD *)(v56 + 24) = (unint64_t)(v57 - 32) | 0x8000000000000000;
          *(_BYTE *)(v56 + 32) = 0;
          swift_willThrow();
          goto LABEL_37;
        }
        v50 = sub_2409B1164(v43, v45, v47, v49, 16);
        if ((v50 & 0x10000000000) != 0)
        {
          swift_bridgeObjectRetain();
          v51 = sub_2409B1074(v43, v45, v47, v49, 16);
          swift_bridgeObjectRelease();
          if ((v51 & 0x100000000) != 0)
            goto LABEL_28;
        }
        else
        {
          LODWORD(v51) = v50;
          if ((v50 & 0x100000000) != 0)
            goto LABEL_28;
        }
        if (sub_2409C5F10() == 6)
        {
          StyleSheet.Color.init(value:)(v51, a1);
          goto LABEL_37;
        }
        if (sub_2409C5F10() != 3)
        {
          sub_2409AFAC8();
          swift_bridgeObjectRetain();
          v58 = sub_2409C5E38();
          v55 = v59;
          sub_2409AB4E8();
          swift_allocError();
          *(_QWORD *)v56 = v58;
          v52 = 0xD00000000000003BLL;
          v57 = "Could not parse hex color: hex color must be 3 or 6 digits.";
          goto LABEL_29;
        }
        v64 = ((unsigned __int16)(v51 & 0xF00) >> 4) & 0xFFFFFFF0 | (v51 >> 8) & 0xF;
        LODWORD(v65) = v51 & 0xF0 | ((v51 & 0xF0) >> 4);
        LODWORD(v62) = v51 & 0xF | (16 * (v51 & 0xF));
        v63 = a1;
LABEL_36:
        StyleSheet.Color.init(red:green:blue:)(v64, v65, v62, v63);
        goto LABEL_37;
      }
      v16 = sub_2409C6144();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_25;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_2409C5D30();
  v17 = sub_2409B084C();
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    v39 = sub_2409C5E38();
    v41 = v40;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v42 = v39;
    *(_QWORD *)(v42 + 8) = v41;
    *(_QWORD *)(v42 + 16) = 0xD000000000000032;
    *(_QWORD *)(v42 + 24) = 0x80000002409CC490;
    *(_BYTE *)(v42 + 32) = 0;
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v18 = sub_2409B1234(4uLL, v3, v5);
  v20 = v19;
  result = swift_bridgeObjectRelease();
  v21 = v20 >> 14;
  if (v20 >> 14 < v18 >> 14)
  {
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v22 = sub_2409C5F28();
  v26 = sub_2409B12D0(v22, v23, v24, v25, 44, 2);
  if (v1)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v28 = v26;
  v67 = v27;
  result = swift_bridgeObjectRelease();
  if (v21 < v28 >> 14)
    goto LABEL_40;
  v29 = sub_2409C5F28();
  v33 = sub_2409B12D0(v29, v30, v31, v32, 44, v67 & 1);
  v66 = v34;
  result = swift_bridgeObjectRelease();
  if (v21 >= v33 >> 14)
  {
    v35 = sub_2409C5F28();
    sub_2409B12D0(v35, v36, v37, v38, 41, v66 & 1);
    v61 = v60;
    swift_bridgeObjectRelease();
    v62 = HIDWORD(v61);
    v63 = a1;
    v64 = HIDWORD(v67);
    v65 = HIDWORD(v66);
    goto LABEL_36;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2409B080C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
    return sub_2409C5E2C();
  else
    return 0;
}

uint64_t sub_2409B084C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_2409C5DD8();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_2409C5DD8();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_2409C6144();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_2409C5DD8();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_2409C5DD8();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_2409B09B0()
{
  uint64_t inited;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2570730E8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2409C70A0;
  *(_QWORD *)(inited + 32) = 0x6E6F6F72616DLL;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0x800000u, (int8x8_t *)(inited + 48));
  *(_QWORD *)(inited + 64) = 6579570;
  *(_QWORD *)(inited + 72) = 0xE300000000000000;
  StyleSheet.Color.init(value:)(0xFF0000u, (int8x8_t *)(inited + 80));
  *(_QWORD *)(inited + 96) = 0x65676E61726FLL;
  *(_QWORD *)(inited + 104) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0xFFA500u, (int8x8_t *)(inited + 112));
  *(_QWORD *)(inited + 128) = 0x776F6C6C6579;
  *(_QWORD *)(inited + 136) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0xFFFF00u, (int8x8_t *)(inited + 144));
  *(_QWORD *)(inited + 160) = 0x6576696C6FLL;
  *(_QWORD *)(inited + 168) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0x808000u, (int8x8_t *)(inited + 176));
  *(_QWORD *)(inited + 192) = 0x656C70727570;
  *(_QWORD *)(inited + 200) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0x800080u, (int8x8_t *)(inited + 208));
  *(_QWORD *)(inited + 224) = 0x61697368637566;
  *(_QWORD *)(inited + 232) = 0xE700000000000000;
  StyleSheet.Color.init(value:)(0xFF00FFu, (int8x8_t *)(inited + 240));
  *(_QWORD *)(inited + 256) = 0x6574696877;
  *(_QWORD *)(inited + 264) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0xFFFFFFu, (int8x8_t *)(inited + 272));
  *(_QWORD *)(inited + 288) = 1701669228;
  *(_QWORD *)(inited + 296) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0xFF00u, (int8x8_t *)(inited + 304));
  *(_QWORD *)(inited + 320) = 0x6E65657267;
  *(_QWORD *)(inited + 328) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0x8000u, (int8x8_t *)(inited + 336));
  *(_QWORD *)(inited + 352) = 2037801326;
  *(_QWORD *)(inited + 360) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0x80u, (int8x8_t *)(inited + 368));
  *(_QWORD *)(inited + 384) = 1702194274;
  *(_QWORD *)(inited + 392) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0xFFu, (int8x8_t *)(inited + 400));
  *(_QWORD *)(inited + 416) = 1818322292;
  *(_QWORD *)(inited + 424) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0x8080u, (int8x8_t *)(inited + 432));
  *(_QWORD *)(inited + 448) = 1635086689;
  *(_QWORD *)(inited + 456) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0xFFFFu, (int8x8_t *)(inited + 464));
  *(_QWORD *)(inited + 480) = 0x6B63616C62;
  *(_QWORD *)(inited + 488) = 0xE500000000000000;
  StyleSheet.Color.init(value:)(0, (int8x8_t *)(inited + 496));
  *(_QWORD *)(inited + 512) = 0x7265766C6973;
  *(_QWORD *)(inited + 520) = 0xE600000000000000;
  StyleSheet.Color.init(value:)(0xC0C0C0u, (int8x8_t *)(inited + 528));
  *(_QWORD *)(inited + 544) = 2036429415;
  *(_QWORD *)(inited + 552) = 0xE400000000000000;
  StyleSheet.Color.init(value:)(0x808080u, (int8x8_t *)(inited + 560));
  result = sub_2409B0C08(inited);
  qword_2570737E8 = result;
  return result;
}

unint64_t sub_2409B0C08(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570730F0);
  v2 = (_QWORD *)sub_2409C6048();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 56);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 3);
    v6 = *((_QWORD *)v4 - 2);
    v7 = *((_QWORD *)v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2409B0D30(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = v2[7] + 12 * result;
    *(_QWORD *)v12 = v7;
    *(_DWORD *)(v12 + 8) = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 8;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_2409B0D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2409C6180();
  sub_2409C5D90();
  v4 = sub_2409C6198();
  return sub_2409B0EB8(a1, a2, v4);
}

unint64_t sub_2409B0D98()
{
  unint64_t result;

  result = qword_2570730E0;
  if (!qword_2570730E0)
  {
    result = MEMORY[0x242685B78](&unk_2409C70BC, &_s9BaseColorV28ColorComponentRepresentationON);
    atomic_store(result, (unint64_t *)&qword_2570730E0);
  }
  return result;
}

ValueMetadata *_s9BaseColorVMa()
{
  return &_s9BaseColorVN;
}

uint64_t _s9BaseColorV28ColorComponentRepresentationOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409B0E38 + 4 * byte_2409C70B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2409B0E6C + 4 * byte_2409C70B0[v4]))();
}

uint64_t sub_2409B0E6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409B0E74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409B0E7CLL);
  return result;
}

uint64_t sub_2409B0E88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409B0E90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2409B0E94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409B0E9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s9BaseColorV28ColorComponentRepresentationOMa()
{
  return &_s9BaseColorV28ColorComponentRepresentationON;
}

unint64_t sub_2409B0EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2409C6144() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2409C6144() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2409B0F98(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_2409A92B4(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_2409C5FA0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_2409C5FDC();
      v5 = sub_2409C5FE8();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t sub_2409B1074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_2409AFAC8();
  swift_bridgeObjectRetain();
  v7 = sub_2409C5E38();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_2409AAF5C();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_2409C5FDC();
  }
LABEL_7:
  v13 = sub_2409AACDC(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

uint64_t sub_2409B1164(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  _QWORD v13[2];
  unsigned __int8 v14;

  if ((a4 & 0x1000000000000000) != 0)
  {
    LODWORD(result) = 0;
    v14 = 0;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v13[0] = a3;
    v13[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v13;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_2409C5FDC();
  }
  result = sub_2409B2670((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v14 = BYTE4(result) & 1;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  return result;
}

unint64_t sub_2409B1234(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_2409C5DB4();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_2409C5E44();
  }
  __break(1u);
  return result;
}

uint64_t sub_2409B12D0(_BOOL8 a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  _BOOL8 v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  char v28;
  unint64_t v29;
  int v30;
  __int16 v31;
  char v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 *v44;
  unint64_t v45;
  _BYTE *v46;
  BOOL v47;
  _BYTE *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  BOOL v93;
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
  void (*v107)(_BOOL8 *__return_ptr, uint64_t);
  uint64_t v108;
  BOOL v109;
  _BYTE *v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  char v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  char v124;
  unint64_t v125;
  unint64_t v126;
  char v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  BOOL v136;
  char v137;
  uint64_t v138;
  char v139;
  double v140;
  uint64_t v141;
  _QWORD v142[4];
  uint64_t v143;
  double *v144;
  uint64_t v145;
  unint64_t v146;
  _QWORD *v147;
  uint64_t *v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  _QWORD *v156;
  uint64_t v157;
  BOOL v158;
  _BOOL8 v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;

  if (a2 >> 14 < (unint64_t)a1 >> 14)
  {
    __break(1u);
LABEL_83:
    swift_bridgeObjectRelease();
    goto LABEL_84;
  }
  v9 = a1;
  LODWORD(v153) = a6;
  v155 = a2 >> 14;
  v156 = (_QWORD *)a2;
  v152 = a5;
  v157 = a3;
  v11 = sub_2409C5F28();
  v13 = v12 >> 14;
  v14 = v11 >> 14;
  if (v11 >> 14 == v12 >> 14)
    goto LABEL_9;
  v8 = v11;
  v154 = a4;
  v151 = v7;
  sub_2409C5F1C();
  v15 = sub_2409C5CDC();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v16 = sub_2409C5EF8();
  if (v13 == v16 >> 14)
  {
LABEL_8:
    a4 = v154;
LABEL_9:
    v6 = v156;
    v19 = v157;
LABEL_10:
    swift_bridgeObjectRelease();
LABEL_11:
    v159 = v9;
    v160 = (uint64_t)v6;
    v161 = v19;
    v162 = a4;
    sub_2409AFAC8();
    swift_bridgeObjectRetain();
    v20 = sub_2409C5E38();
    v22 = v21;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v23 = v20;
    *(_QWORD *)(v23 + 8) = v22;
    v24 = "Could not parse color component: current element is at end or not a digit.";
    v25 = 0xD00000000000004ALL;
    goto LABEL_12;
  }
  v17 = v16;
  while (1)
  {
    sub_2409C5F1C();
    v18 = sub_2409C5CDC();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
      break;
    v17 = sub_2409C5EF8();
    if (v13 == v17 >> 14)
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  v14 = v17 >> 14;
  v8 = v17;
LABEL_16:
  v6 = v156;
  v19 = v157;
  a4 = v154;
  if (v14 == v155)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  if (sub_2409C5F1C() == 45 && v27 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = sub_2409C6144();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v28 & 1) == 0)
    {
      v30 = 0;
      goto LABEL_24;
    }
  }
  v29 = sub_2409C5EF8();
  if (v155 == v29 >> 14)
    goto LABEL_11;
  v8 = v29;
  v30 = 1;
LABEL_24:
  swift_bridgeObjectRetain();
  sub_2409C5F1C();
  v31 = sub_2409C5CD0();
  swift_bridgeObjectRelease();
  if ((v31 & 0x100) != 0)
    goto LABEL_10;
  swift_bridgeObjectRetain();
  sub_2409C5F1C();
  v32 = sub_2409C5CF4();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
    goto LABEL_11;
  v149 = v30;
  if (v155 == v8 >> 14)
    goto LABEL_86;
  v33 = 0.0;
  v34 = 0x406FE00000000000;
  while (1)
  {
    if ((swift_bridgeObjectRetain(), v36 = sub_2409C5F1C(), v37 = v35, v36 == 2573) && v35 == 0xE200000000000000
      || (sub_2409C6144() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((sub_2409C5CE8() & 1) == 0)
        goto LABEL_66;
      result = sub_2409B0F98(v36, v37);
      if ((result & 0x100000000) != 0)
        goto LABEL_189;
      if ((result & 0xFFFFFF80) != 0)
      {
LABEL_66:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19 = v157;
LABEL_67:
        v54 = v8 >> 14;
        a4 = v154;
        v34 = v155;
        if (v8 >> 14 == v155)
          goto LABEL_86;
        goto LABEL_88;
      }
      result = sub_2409B0F98(v36, v37);
      if ((result & 0x100000000) != 0)
        goto LABEL_190;
      v38 = result;
      swift_bridgeObjectRelease();
      if ((v38 & 0xFFFFFF00) != 0)
      {
        __break(1u);
LABEL_179:
        __break(1u);
LABEL_180:
        sub_2409C5F88();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v6 = v156;
        v19 = v157;
        goto LABEL_136;
      }
    }
    swift_bridgeObjectRetain();
    v19 = v157;
    sub_2409C5F1C();
    v39 = sub_2409C5CF4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      v6 = v156;
      goto LABEL_67;
    }
    v40 = sub_2409C5F1C();
    v42 = v41;
    v163 = 0.0;
    MEMORY[0x24BDAC7A8](v40);
    v144 = &v163;
    if ((v42 & 0x1000000000000000) != 0 || !(v42 & 0x2000000000000000 | v43 & 0x1000000000000000))
    {
      sub_2409C5F88();
      result = swift_bridgeObjectRelease();
      v6 = v156;
    }
    else
    {
      if ((v42 & 0x2000000000000000) != 0)
      {
        v159 = v43;
        v160 = v42 & 0xFFFFFFFFFFFFFFLL;
        if (v43 <= 0x20u && ((0x100003E01uLL >> v43) & 1) != 0)
        {
          v47 = 0;
          v6 = v156;
        }
        else
        {
          v48 = (_BYTE *)_swift_stdlib_strtod_clocale();
          v6 = v156;
          if (v48)
            v47 = *v48 == 0;
          else
            v47 = 0;
        }
      }
      else
      {
        if ((v43 & 0x1000000000000000) != 0)
          v44 = (unsigned __int8 *)((v42 & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v44 = (unsigned __int8 *)sub_2409C5FDC();
        v6 = v156;
        v45 = *v44;
        v47 = (v45 >= 0x21 || ((0x100003E01uLL >> v45) & 1) == 0)
           && (v46 = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0
           && *v46 == 0;
      }
      v158 = v47;
      result = swift_bridgeObjectRelease();
      v19 = v157;
    }
    if (!v158)
    {
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      __break(1u);
LABEL_194:
      __break(1u);
LABEL_195:
      __break(1u);
      return result;
    }
    v33 = v33 * 10.0 + v163;
    v8 = sub_2409C5EF8();
    v49 = v8 >> 14;
    if (v33 >= 255.0)
      break;
    if (v49 == v155)
      goto LABEL_67;
  }
  v34 = v155;
  if (v155 < v49)
  {
    __break(1u);
LABEL_182:
    __break(1u);
    goto LABEL_183;
  }
  a4 = v154;
  v50 = sub_2409C5F28();
  v150 = v52;
  v53 = v52 >> 14;
  if (v52 >> 14 == v50 >> 14)
  {
    v8 = (unint64_t)v6;
    goto LABEL_85;
  }
  v55 = v50;
  v56 = v51;
  v8 = v50;
  do
  {
    v34 = v55;
    v57 = v56;
    v59 = sub_2409C5F1C();
    v60 = v58;
    if ((v59 != 2573 || v58 != 0xE200000000000000) && (sub_2409C6144() & 1) == 0)
    {
      if ((sub_2409C5CE8() & 1) == 0)
        goto LABEL_83;
      result = sub_2409B0F98(v59, v60);
      if ((result & 0x100000000) != 0)
        goto LABEL_194;
      if ((result & 0xFFFFFF80) != 0)
        goto LABEL_83;
      result = sub_2409B0F98(v59, v60);
      if ((result & 0x100000000) != 0)
        goto LABEL_195;
      if ((result & 0xFFFFFF00) != 0)
        goto LABEL_179;
    }
    v61 = sub_2409C5CF4();
    swift_bridgeObjectRelease();
    if ((v61 & 1) == 0)
      goto LABEL_84;
    v55 = v34;
    v62 = sub_2409C5EF8();
    v56 = v57;
    v8 = v62;
  }
  while (v53 != v62 >> 14);
  v8 = (unint64_t)v6;
LABEL_84:
  a4 = v154;
  v34 = v155;
  v19 = v157;
LABEL_85:
  swift_bridgeObjectRelease();
  v54 = v8 >> 14;
  if (v8 >> 14 == v34)
  {
LABEL_86:
    v159 = v9;
    v160 = (uint64_t)v6;
    v161 = v19;
    v162 = a4;
    sub_2409AFAC8();
    swift_bridgeObjectRetain();
    v63 = sub_2409C5E38();
    v65 = v64;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v23 = v63;
    *(_QWORD *)(v23 + 8) = v65;
    *(_QWORD *)(v23 + 16) = 0xD000000000000039;
    *(_QWORD *)(v23 + 24) = 0x80000002409CC6D0;
    goto LABEL_13;
  }
  v33 = 255.0;
LABEL_88:
  if ((v153 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    if (sub_2409C5F1C() == 46 && v67 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v77 = sub_2409C6144();
      swift_bridgeObjectRelease();
      if ((v77 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        if (sub_2409C5F1C() != 37 || v78 != 0xE100000000000000)
        {
          v84 = sub_2409C6144();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if ((v84 & 1) == 0)
            goto LABEL_89;
LABEL_104:
          v159 = v9;
          v160 = (uint64_t)v6;
          v161 = v19;
          v162 = a4;
          sub_2409AFAC8();
          swift_bridgeObjectRetain();
          v79 = sub_2409C5E38();
          v81 = v80;
          sub_2409AB4E8();
          swift_allocError();
          *(_QWORD *)v23 = v79;
          *(_QWORD *)(v23 + 8) = v81;
          v24 = "Could not parse color component: number components must be whole numbers.";
          v25 = 0xD000000000000049;
          goto LABEL_12;
        }
        swift_bridgeObjectRelease_n();
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_104;
  }
LABEL_89:
  if (sub_2409C5F1C() == 46 && v66 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v68 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v68 & 1) == 0)
      goto LABEL_139;
  }
  if (v34 < v54)
    goto LABEL_182;
  v69 = sub_2409C5F28();
  v70 = (uint64_t *)v69;
  v72 = v71;
  v6 = v73;
  v75 = v74;
  v76 = v71 >> 14;
  if (v69 >> 14 != v71 >> 14)
  {
    v146 = v69 >> 14;
    if (sub_2409C5F1C() == 37 && v82 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      goto LABEL_123;
    }
    v150 = v72;
    v83 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v83 & 1) != 0)
      goto LABEL_123;
    v85 = (unint64_t)sub_2409C5EF8() >> 14;
    if (v85 == v76)
    {
LABEL_118:
      v85 = v76;
    }
    else
    {
      v147 = v6;
      v148 = v70;
      while (1)
      {
        swift_bridgeObjectRetain();
        v86 = sub_2409C5F1C();
        v87 = v75;
        v88 = v86;
        v90 = v89;
        v91 = v87;
        swift_bridgeObjectRelease();
        if (v88 == 37 && v90 == 0xE100000000000000)
          break;
        v92 = sub_2409C6144();
        swift_bridgeObjectRelease();
        if ((v92 & 1) != 0)
          goto LABEL_120;
        v75 = v91;
        v6 = v147;
        v85 = (unint64_t)sub_2409C5EF8() >> 14;
        if (v85 == v76)
          goto LABEL_118;
      }
      swift_bridgeObjectRelease();
LABEL_120:
      v6 = v147;
    }
    v93 = v85 >= v146;
    v34 = v155;
    if (v93)
      goto LABEL_123;
LABEL_183:
    __break(1u);
    goto LABEL_184;
  }
LABEL_123:
  v94 = sub_2409C5F28();
  v96 = v95;
  v98 = v97;
  v100 = v99;
  swift_bridgeObjectRelease();
  v150 = sub_2409C5F10();
  v163 = 0.0;
  MEMORY[0x24BDAC7A8](v150);
  v144 = &v163;
  swift_bridgeObjectRetain();
  v101 = MEMORY[0x2426854E8](v94, v96, v98, v100);
  if ((v102 & 0x1000000000000000) != 0 || !(v102 & 0x2000000000000000 | v101 & 0x1000000000000000))
    goto LABEL_180;
  MEMORY[0x24BDAC7A8](v101);
  v6 = v142;
  v142[2] = v105;
  v142[3] = &v143;
  v19 = v157;
  if ((v104 & 0x2000000000000000) != 0)
  {
    v159 = v103;
    v160 = v104 & 0xFFFFFFFFFFFFFFLL;
    if (v103 < 0x21u && ((0x100003E01uLL >> v103) & 1) != 0)
    {
      v109 = 0;
      v6 = v156;
    }
    else
    {
      v110 = (_BYTE *)_swift_stdlib_strtod_clocale();
      v6 = v156;
      if (v110)
        v109 = *v110 == 0;
      else
        v109 = 0;
    }
    goto LABEL_135;
  }
  v148 = &v145;
  if ((v103 & 0x1000000000000000) == 0)
    goto LABEL_185;
  v106 = (v104 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v107 = (void (*)(_BOOL8 *__return_ptr, uint64_t))sub_2409B2A94;
LABEL_128:
  v108 = v151;
  v107(&v159, v106);
  v151 = v108;
  v109 = v159;
  v6 = v156;
  while (1)
  {
LABEL_135:
    v158 = v109;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_136:
    if (!v158)
    {
      a4 = v154;
LABEL_145:
      v159 = v9;
      v160 = (uint64_t)v6;
      v161 = v19;
      v162 = a4;
      sub_2409AFAC8();
      swift_bridgeObjectRetain();
      v113 = sub_2409C5E38();
      v115 = v114;
      sub_2409AB4E8();
      swift_allocError();
      *(_QWORD *)v116 = v113;
      *(_QWORD *)(v116 + 8) = v115;
      *(_QWORD *)(v116 + 16) = 0xD000000000000043;
      *(_QWORD *)(v116 + 24) = 0x80000002409CC630;
      *(_BYTE *)(v116 + 32) = 0;
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
    a4 = v154;
    if (v150 < 1)
      goto LABEL_145;
    v111 = v163;
    v8 = sub_2409C5F04();
    swift_bridgeObjectRelease();
    v33 = v33 + v111;
LABEL_139:
    if (v153 != 2 && (v153 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      if (sub_2409C5F1C() == 37 && v112 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_147;
      }
      v117 = sub_2409C6144();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v117 & 1) != 0)
        goto LABEL_147;
      v159 = v9;
      v160 = (uint64_t)v6;
      v161 = v19;
      v162 = a4;
      sub_2409AFAC8();
      swift_bridgeObjectRetain();
      v133 = sub_2409C5E38();
      v135 = v134;
      sub_2409AB4E8();
      swift_allocError();
      *(_QWORD *)v23 = v133;
      *(_QWORD *)(v23 + 8) = v135;
      v24 = "Could not parse color component: unit is percentage but no percent sign.";
      v25 = 0xD000000000000048;
LABEL_12:
      *(_QWORD *)(v23 + 16) = v25;
      *(_QWORD *)(v23 + 24) = (unint64_t)(v24 - 32) | 0x8000000000000000;
LABEL_13:
      *(_BYTE *)(v23 + 32) = 0;
      return swift_willThrow();
    }
LABEL_147:
    if (sub_2409C5F1C() == 37 && v118 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v119 = sub_2409C6144();
      swift_bridgeObjectRelease();
      if ((v119 & 1) == 0)
      {
        v153 = 1;
        goto LABEL_156;
      }
    }
    v33 = v33 / 100.0 * 255.0 <= 255.0 ? v33 / 100.0 * 255.0 : 255.0;
    v8 = sub_2409C5EF8();
    v153 = 0;
LABEL_156:
    if (v34 >= v8 >> 14)
      break;
LABEL_184:
    __break(1u);
LABEL_185:
    v106 = sub_2409C5FDC();
    v107 = (void (*)(_BOOL8 *__return_ptr, uint64_t))v6[2];
    if (v106)
    {
      v19 = v157;
      v34 = v155;
      goto LABEL_128;
    }
    v141 = v151;
    ((void (*)(_BOOL8 *__return_ptr))v107)(&v159);
    v151 = v141;
    v109 = v159;
    v6 = v156;
    v19 = v157;
    v34 = v155;
  }
  v120 = sub_2409C5F28();
  v122 = v121 >> 14;
  v123 = v120 >> 14;
  if (v120 >> 14 == v121 >> 14)
    goto LABEL_163;
  sub_2409C5F1C();
  v124 = sub_2409C5CDC();
  swift_bridgeObjectRelease();
  if ((v124 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_168;
  }
  v125 = sub_2409C5EF8();
  if (v122 == v125 >> 14)
  {
LABEL_163:
    swift_bridgeObjectRelease();
    v128 = v154;
    v129 = v157;
    goto LABEL_164;
  }
  v126 = v125;
  while (1)
  {
    sub_2409C5F1C();
    v127 = sub_2409C5CDC();
    swift_bridgeObjectRelease();
    if ((v127 & 1) == 0)
      break;
    v126 = sub_2409C5EF8();
    if (v122 == v126 >> 14)
      goto LABEL_163;
  }
  swift_bridgeObjectRelease();
  v123 = v126 >> 14;
LABEL_168:
  v136 = v123 == v155;
  v128 = v154;
  v129 = v157;
  v137 = v149;
  if (v136)
    goto LABEL_164;
  swift_bridgeObjectRetain();
  if (sub_2409C5F1C() == v152 && v138 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_173;
  }
  v139 = sub_2409C6144();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v139 & 1) == 0)
  {
LABEL_164:
    v159 = v9;
    v160 = (uint64_t)v156;
    v161 = v129;
    v162 = v128;
    sub_2409AFAC8();
    swift_bridgeObjectRetain();
    v130 = sub_2409C5E38();
    v132 = v131;
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v23 = v130;
    *(_QWORD *)(v23 + 8) = v132;
    v24 = "Could not parse color component: expected character to be terminator.";
    v25 = 0xD000000000000045;
    goto LABEL_12;
  }
LABEL_173:
  result = sub_2409C5EF8();
  if ((v137 & 1) != 0)
    return result;
  v140 = round(v33);
  if ((~*(_QWORD *)&v140 & 0x7FF0000000000000) == 0)
    goto LABEL_191;
  if (v140 <= -1.0)
    goto LABEL_192;
  if (v140 >= 4294967300.0)
    goto LABEL_193;
  return result;
}

uint64_t sub_2409B2670(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  unsigned int v29;
  unsigned __int8 v30;
  unint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_2409A923C(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_104;
  result = sub_2409C5E08();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_2409A923C(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_2409A923C(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_100;
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  result = sub_2409C5E08();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v34 = a6 + 55;
        }
        else
        {
          v33 = 97;
          v34 = 65;
        }
        if (a6 <= 10)
          v35 = a6 + 48;
        else
          v35 = 58;
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                v30 = 1;
                if (v38 < 0x61 || v38 >= v33)
                  return v29 | ((unint64_t)v30 << 32);
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            v40 = v24 * (unint64_t)a6;
            if ((v40 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_96;
            v41 = v38 + v39;
            v24 = v40 + v41;
            if (__CFADD__((_DWORD)v40, v41))
              goto LABEL_96;
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          v30 = 0;
          v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 87;
      if (a6 > 10)
      {
        v43 = a6 + 55;
      }
      else
      {
        v42 = 97;
        v43 = 65;
      }
      if (a6 <= 10)
        v44 = a6 + 48;
      else
        v44 = 58;
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              v30 = 1;
              if (v45 < 0x61 || v45 >= v42)
                return v29 | ((unint64_t)v30 << 32);
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          v47 = v24 * (unint64_t)a6;
          if ((v47 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_96;
          v48 = v45 + v46;
          v24 = v47 + v48;
          if (__CFADD__((_DWORD)v47, v48))
            goto LABEL_96;
          ++v19;
          if (!--result)
            goto LABEL_94;
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    v29 = 0;
    v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 87;
      if (a6 > 10)
      {
        v22 = a6 + 55;
      }
      else
      {
        v21 = 97;
        v22 = 65;
      }
      if (a6 <= 10)
        v23 = a6 + 48;
      else
        v23 = 58;
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              v30 = 1;
              if (v27 < 0x61 || v27 >= v21)
                return v29 | ((unint64_t)v30 << 32);
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v31 = v24 * (unint64_t)a6;
          if ((v31 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_96;
          v32 = v27 + v28;
          v24 = v31 - v32;
          if (v31 < v32)
            goto LABEL_96;
          ++v25;
          if (!--v26)
            goto LABEL_94;
        }
      }
LABEL_95:
      v29 = 0;
      v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

_BYTE *sub_2409B2A94@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_2409AB47C(a1, a2);
}

uint64_t StyleSheet.Color.debugDescription.getter()
{
  sub_2409C6138();
  sub_2409C5DCC();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  sub_2409C6138();
  sub_2409C5DCC();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  sub_2409C6138();
  sub_2409C5DCC();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  return 677537650;
}

uint64_t StyleSheet.Font.Size.debugDescription.getter()
{
  uint64_t v0;

  if (*(char *)(v0 + 8) < 0)
    return StyleSheet.Font.Size.Absolute.rawValue.getter();
  sub_2409C5EA4();
  StyleSheet.Font.Size.Unit.rawValue.getter();
  sub_2409C5DCC();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t StyleSheet.Font.Specified.debugDescription.getter()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t inited;
  _QWORD *v7;
  ValueMetadata *v8;
  unint64_t v9;
  _QWORD *v10;
  ValueMetadata *v11;
  unint64_t v12;
  _QWORD *v13;
  ValueMetadata *v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(unsigned __int8 *)(v0 + 9);
  v3 = *(unsigned __int8 *)(v0 + 10);
  v4 = *(unsigned __int8 *)(v0 + 11);
  v5 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570730F8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2409C7150;
  v7 = (_QWORD *)(inited + 32);
  if (v2 == 13)
  {
    v8 = 0;
    v9 = 0;
    *v7 = 0;
    *(_QWORD *)(inited + 40) = 0;
    *(_QWORD *)(inited + 48) = 0;
  }
  else
  {
    v9 = sub_2409ADD1C();
    *(_BYTE *)v7 = v2;
    v8 = &type metadata for StyleSheet.Font.Weight;
  }
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = v9;
  *(_QWORD *)(inited + 72) = 0x746867696577;
  *(_QWORD *)(inited + 80) = 0xE600000000000000;
  v10 = (_QWORD *)(inited + 88);
  if (v3 == 3)
  {
    v11 = 0;
    v12 = 0;
    *v10 = 0;
    *(_QWORD *)(inited + 96) = 0;
    *(_QWORD *)(inited + 104) = 0;
  }
  else
  {
    v12 = sub_2409ADF08();
    *(_BYTE *)v10 = v3;
    v11 = &type metadata for StyleSheet.Font.Style;
  }
  *(_QWORD *)(inited + 112) = v11;
  *(_QWORD *)(inited + 120) = v12;
  *(_QWORD *)(inited + 128) = 0x656C797473;
  *(_QWORD *)(inited + 136) = 0xE500000000000000;
  v13 = (_QWORD *)(inited + 144);
  if (v4 == 2)
  {
    v14 = 0;
    v15 = 0;
    *v13 = 0;
    *(_QWORD *)(inited + 152) = 0;
    *(_QWORD *)(inited + 160) = 0;
  }
  else
  {
    v15 = sub_2409AE0D0();
    *(_BYTE *)v13 = v4 & 1;
    v14 = &type metadata for StyleSheet.Font.Variant;
  }
  *(_QWORD *)(inited + 168) = v14;
  *(_QWORD *)(inited + 176) = v15;
  *(_QWORD *)(inited + 184) = 0x746E6169726176;
  *(_QWORD *)(inited + 192) = 0xE700000000000000;
  v16 = sub_2409B2FA0(inited);
  swift_bridgeObjectRelease();
  if (v1 <= 0xFB)
  {
    sub_2409C5DCC();
    sub_2409C6024();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v16 = sub_2409AF9C8(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
    v18 = *((_QWORD *)v16 + 2);
    v17 = *((_QWORD *)v16 + 3);
    if (v18 >= v17 >> 1)
      v16 = sub_2409AF9C8((char *)(v17 > 1), v18 + 1, 1, v16);
    *((_QWORD *)v16 + 2) = v18 + 1;
    v19 = &v16[16 * v18];
    *((_QWORD *)v19 + 4) = 0;
    *((_QWORD *)v19 + 5) = 0xE000000000000000;
  }
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
    sub_2409B3AD8((unint64_t *)&qword_257073108, &qword_257073100);
    sub_2409C5D0C();
    sub_2409C5DCC();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v16 = sub_2409AF9C8(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
    v21 = *((_QWORD *)v16 + 2);
    v20 = *((_QWORD *)v16 + 3);
    if (v21 >= v20 >> 1)
      v16 = sub_2409AF9C8((char *)(v20 > 1), v21 + 1, 1, v16);
    *((_QWORD *)v16 + 2) = v21 + 1;
    v22 = &v16[16 * v21];
    *((_QWORD *)v22 + 4) = 0x203A796C696D6166;
    *((_QWORD *)v22 + 5) = 0xE800000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
  sub_2409B3AD8((unint64_t *)&qword_257073108, &qword_257073100);
  v23 = sub_2409C5D0C();
  swift_bridgeObjectRelease();
  return v23;
}

char *sub_2409B2FA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  char *v6;
  __int128 v8;
  uint64_t AssociatedTypeWitness;
  _QWORD v10[4];

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)MEMORY[0x24BEE4AF8];
  v2 = swift_bridgeObjectRetain() + 80;
  v3 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    sub_2409B3CC8(v2 - 48, (uint64_t)&v8);
    if (AssociatedTypeWitness)
    {
      sub_2409ACCAC(&v8, (uint64_t)v10);
      sub_2409C5DCC();
      sub_2409C5DCC();
      __swift_project_boxed_opaque_existential_1(v10, v10[3]);
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v8);
      sub_2409C5E74();
      sub_2409C6024();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_2409AF9C8(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v5 = *((_QWORD *)v3 + 2);
      v4 = *((_QWORD *)v3 + 3);
      if (v5 >= v4 >> 1)
        v3 = sub_2409AF9C8((char *)(v4 > 1), v5 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v5 + 1;
      v6 = &v3[16 * v5];
      *((_QWORD *)v6 + 4) = 0;
      *((_QWORD *)v6 + 5) = 0xE000000000000000;
    }
    else
    {
      sub_2409B3D10((uint64_t)&v8);
    }
    v2 += 56;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t StyleSheet.Font.debugDescription.getter()
{
  uint64_t v0;

  if ((*(_QWORD *)(v0 + 8) & 0x8000000000000000) != 0)
    return StyleSheet.Font.System.rawValue.getter();
  sub_2409C6024();
  return 0;
}

uint64_t sub_2409B3214()
{
  uint64_t v0;

  if ((*(_QWORD *)(v0 + 8) & 0x8000000000000000) != 0)
    return StyleSheet.Font.System.rawValue.getter();
  sub_2409C6024();
  return 0;
}

void StyleSheet.Rule.Declaration.debugDescription.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_2409B32E0()
{
  sub_2409C5FAC();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  sub_2409C5DCC();
  sub_2409C5DCC();
  sub_2409C5DCC();
  return 0x3A64696C61766E69;
}

uint64_t StyleSheet.Rule.debugDescription.getter()
{
  uint64_t *v0;
  uint64_t v2;

  if ((v0[5] & 1) != 0)
    return 0x656C75722040;
  v2 = *v0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073110);
  sub_2409B3A00(&qword_257073118, &qword_257073110, sub_2409B39DC, MEMORY[0x24BEE2B38]);
  sub_2409C5D0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2409C5DCC();
  sub_2409C5DCC();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  return v2;
}

void sub_2409B3660(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  StyleSheet.Rule.Declaration.debugDescription.getter();
  *a1 = v2;
  a1[1] = v3;
}

BOOL sub_2409B36A0(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = a1[1];
  v2 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  return v2 != 0;
}

uint64_t sub_2409B36C0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  sub_2409C5DCC();
  result = sub_2409C5DCC();
  *a1 = 2105376;
  a1[1] = 0xE300000000000000;
  return result;
}

uint64_t StyleSheet.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  sub_2409B37DC(v0);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
  sub_2409B3AD8((unint64_t *)&qword_257073108, &qword_257073100);
  v1 = sub_2409C5D0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2409C5DCC();
  return v1;
}

uint64_t sub_2409B37DC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_2409B3B18(0, v1, 0);
    v2 = v16;
    v4 = a1 + 40;
    do
    {
      if ((*(_BYTE *)(v4 + 32) & 1) != 0)
      {
        v5 = 0xE600000000000000;
        v6 = 0x656C75722040;
      }
      else
      {
        v14 = *(_QWORD *)(v4 + 16);
        v15 = *(_QWORD *)(v4 + 24);
        v8 = *(_QWORD *)v4;
        v7 = *(_QWORD *)(v4 + 8);
        v9 = *(_QWORD *)(v4 - 8);
        sub_2409B3B34(v9, *(_QWORD *)v4, v7, v14, v15, 0);
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_257073110);
        sub_2409B3A00(&qword_257073118, &qword_257073110, sub_2409B39DC, MEMORY[0x24BEE2B38]);
        sub_2409C5D0C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2409C5DCC();
        sub_2409C5DCC();
        swift_bridgeObjectRelease();
        sub_2409C5DCC();
        sub_2409B3B7C(v9, v8, v7, v14, v15, 0);
        v6 = v9;
        v5 = v8;
      }
      v11 = *(_QWORD *)(v16 + 16);
      v10 = *(_QWORD *)(v16 + 24);
      if (v11 >= v10 >> 1)
        sub_2409B3B18((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v16 + 16) = v11 + 1;
      v12 = v16 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v6;
      *(_QWORD *)(v12 + 40) = v5;
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2409B39DC()
{
  return sub_2409B3A00(&qword_257073120, &qword_257073128, (uint64_t (*)(void))sub_2409B3A64, MEMORY[0x24BEE2FF0]);
}

uint64_t sub_2409B3A00(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x242685B78](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2409B3A64()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257073130;
  if (!qword_257073130)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257073138);
    v2 = sub_2409B3AD8(&qword_257073140, &qword_257073148);
    result = MEMORY[0x242685B78](MEMORY[0x24BEE2B38], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257073130);
  }
  return result;
}

uint64_t sub_2409B3AD8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242685B78](MEMORY[0x24BEE12B0], v4);
    atomic_store(result, a1);
  }
  return result;
}

char *sub_2409B3B18(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2409B3BC8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_2409B3B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) != 0)
    swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2409B3B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  swift_bridgeObjectRelease();
  if ((a6 & 1) != 0)
    swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_2409B3BC8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570730B8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_2409B3CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2409B3D10(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t StyleSheet.rules.getter()
{
  return swift_bridgeObjectRetain();
}

LinkPresentationStyleSheetParsing::StyleSheet __swiftcall StyleSheet.init(rules:)(LinkPresentationStyleSheetParsing::StyleSheet rules)
{
  LinkPresentationStyleSheetParsing::StyleSheet *v1;

  v1->rules._rawValue = rules.rules._rawValue;
  return rules;
}

void static StyleSheet.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  sub_2409B3DA8(*a1, *a2);
}

void sub_2409B3DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  char v25;
  __int128 v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  char v34;
  __int128 v35;
  char v36;
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
  char v48;
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
  __int128 v78;
  __int128 v79;
  char v80;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16) || !v2 || a1 == a2)
    return;
  v3 = 0;
  v68 = a2 + 32;
  v69 = a1 + 32;
  v66 = *(_QWORD *)(a1 + 16);
  while (1)
  {
    v4 = v69 + 48 * v3;
    v6 = *(_QWORD *)v4;
    v5 = *(_QWORD *)(v4 + 8);
    v7 = *(_QWORD *)(v4 + 16);
    v8 = *(_QWORD *)(v4 + 24);
    v9 = *(_BYTE *)(v4 + 40);
    v10 = v68 + 48 * v3;
    v12 = *(_QWORD *)v10;
    v11 = *(_QWORD *)(v10 + 8);
    v13 = *(_QWORD *)(v10 + 24);
    v76 = *(_QWORD *)(v4 + 32);
    v77 = *(_QWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 32);
    v15 = *(_BYTE *)(v10 + 40);
    v75 = v5;
    if ((v9 & 1) == 0)
      break;
    if ((v15 & 1) == 0)
      goto LABEL_46;
    if (v6 != v12 || v5 != v11)
    {
      v17 = *(_QWORD *)(v4 + 8);
      if ((sub_2409C6144() & 1) == 0)
      {
        v49 = v12;
        v50 = v11;
        v74 = v12;
        v51 = v7;
        v52 = v11;
        v53 = v77;
        sub_2409B3B34(v49, v50, v77, v13, v14, 1);
        v54 = v8;
        v55 = v8;
        v56 = v13;
        v57 = v76;
        sub_2409B3B34(v6, v17, v51, v55, v76, 1);
        v58 = v6;
        v59 = v17;
        v60 = v51;
        v61 = v54;
        goto LABEL_58;
      }
    }
    if (v7 != v77 || v8 != v13)
    {
      v19 = v8;
      if ((sub_2409C6144() & 1) == 0)
      {
        v62 = v12;
        v63 = v11;
        v74 = v12;
        v64 = v7;
        v52 = v11;
        v53 = v77;
        sub_2409B3B34(v62, v63, v77, v13, v14, 1);
        v65 = v8;
        v56 = v13;
        v57 = v76;
        sub_2409B3B34(v6, v75, v64, v65, v76, 1);
        v58 = v6;
        v59 = v75;
        v60 = v64;
        v61 = v19;
LABEL_58:
        sub_2409B3B7C(v58, v59, v60, v61, v57, 1);
        v43 = v74;
        v44 = v52;
        v45 = v53;
        v46 = v56;
        v47 = v14;
LABEL_52:
        v48 = 1;
LABEL_53:
        sub_2409B3B7C(v43, v44, v45, v46, v47, v48);
        return;
      }
    }
    v20 = *(_QWORD *)(v76 + 16);
    if (v20 != *(_QWORD *)(v14 + 16))
    {
      sub_2409B3B34(v12, v11, v77, v13, v14, 1);
      sub_2409B3B34(v6, v75, v7, v8, v76, 1);
      v72 = v11;
      v73 = v13;
      sub_2409B3B34(v12, v11, v77, v13, v14, 1);
      v21 = v6;
      v70 = v8;
      sub_2409B3B34(v6, v75, v7, v8, v76, 1);
LABEL_51:
      sub_2409B3B7C(v21, v75, v7, v70, v76, 1);
      sub_2409B3B7C(v12, v72, v77, v73, v14, 1);
      sub_2409B3B7C(v12, v72, v77, v73, v14, 1);
      v43 = v21;
      v44 = v75;
      v45 = v7;
      v46 = v70;
      v47 = v76;
      goto LABEL_52;
    }
    if (v20)
    {
      sub_2409B3B34(v12, v11, v77, v13, v14, 1);
      sub_2409B3B34(v6, v75, v7, v8, v76, 1);
      if (v76 != v14)
      {
        v72 = v11;
        v73 = v13;
        sub_2409B3B34(v12, v11, v77, v13, v14, 1);
        v21 = v6;
        v70 = v8;
        sub_2409B3B34(v6, v75, v7, v8, v76, 1);
        v22 = 0;
        v23 = v14 + 64;
        v24 = (_BYTE *)(v76 + 64);
        while (1)
        {
          v25 = *v24;
          v26 = *((_OWORD *)v24 - 1);
          v78 = *((_OWORD *)v24 - 2);
          v79 = v26;
          v80 = v25;
          if (v22 >= *(_QWORD *)(v14 + 16))
            break;
          _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0((uint64_t)&v78);
          if ((v27 & 1) == 0)
            goto LABEL_51;
          ++v22;
          v23 += 40;
          v24 += 40;
          if (v20 == v22)
          {
            sub_2409B3B7C(v21, v75, v7, v70, v76, 1);
            sub_2409B3B7C(v12, v72, v77, v13, v14, 1);
            sub_2409B3B7C(v12, v72, v77, v13, v14, 1);
            sub_2409B3B7C(v21, v75, v7, v70, v76, 1);
            v2 = v66;
            goto LABEL_8;
          }
        }
        __break(1u);
        goto LABEL_60;
      }
      sub_2409B3B7C(v6, v75, v7, v8, v76, 1);
      v37 = v12;
      v38 = v11;
      v39 = v77;
      v40 = v13;
      v41 = v14;
    }
    else
    {
      sub_2409B3B34(v12, v11, v77, v13, v14, 1);
      sub_2409B3B34(v6, v75, v7, v8, v76, 1);
      sub_2409B3B7C(v6, v75, v7, v8, v76, 1);
      v37 = v12;
      v38 = v11;
      v39 = v77;
      v40 = v13;
      v41 = v14;
    }
    sub_2409B3B7C(v37, v38, v39, v40, v41, 1);
LABEL_8:
    if (++v3 == v2)
      return;
  }
  if ((v15 & 1) != 0)
  {
LABEL_46:
    v42 = *(_QWORD *)(v4 + 8);
    sub_2409B3B34(v12, v11, v77, v13, v14, v9 ^ 1);
    sub_2409B3B34(v6, v42, v7, v8, v76, v9);
    sub_2409B3B7C(v6, v42, v7, v8, v76, v9);
    v43 = v12;
    v44 = v11;
    v45 = v77;
    v46 = v13;
    v47 = v14;
    v48 = v9 ^ 1;
    goto LABEL_53;
  }
  if (v6 != v12 || v5 != v11)
  {
    v29 = *(_QWORD *)(v4 + 8);
    if ((sub_2409C6144() & 1) == 0)
    {
      sub_2409B3B34(v12, v11, v77, v13, v14, 0);
      sub_2409B3B34(v6, v29, v7, v8, v76, 0);
      sub_2409B3B7C(v6, v29, v7, v8, v76, 0);
      v43 = v12;
      v44 = v11;
      v45 = v77;
      v46 = v13;
      v47 = v14;
LABEL_49:
      v48 = 0;
      goto LABEL_53;
    }
  }
  v30 = *(_QWORD *)(v7 + 16);
  v71 = v8;
  v67 = v6;
  if (v30 != *(_QWORD *)(v77 + 16))
  {
    sub_2409B3B34(v12, v11, v77, v13, v14, 0);
    sub_2409B3B34(v6, v75, v7, v8, v76, 0);
    sub_2409B3B34(v12, v11, v77, v13, v14, 0);
    sub_2409B3B34(v6, v75, v7, v8, v76, 0);
LABEL_48:
    sub_2409B3B7C(v67, v75, v7, v71, v76, 0);
    sub_2409B3B7C(v12, v11, v77, v13, v14, 0);
    sub_2409B3B7C(v12, v11, v77, v13, v14, 0);
    v43 = v67;
    v44 = v75;
    v45 = v7;
    v46 = v71;
    v47 = v76;
    goto LABEL_49;
  }
  if (!v30)
  {
    sub_2409B3B34(v12, v11, v77, v13, v14, 0);
    sub_2409B3B34(v6, v75, v7, v8, v76, 0);
    sub_2409B3B34(v12, v11, v77, v13, v14, 0);
    sub_2409B3B34(v6, v75, v7, v8, v76, 0);
LABEL_7:
    sub_2409B3B7C(v67, v75, v7, v71, v76, 0);
    sub_2409B3B7C(v12, v11, v77, v13, v14, 0);
    sub_2409B3B7C(v12, v11, v77, v13, v14, 0);
    sub_2409B3B7C(v67, v75, v7, v71, v76, 0);
    v2 = v66;
    goto LABEL_8;
  }
  sub_2409B3B34(v12, v11, v77, v13, v14, 0);
  sub_2409B3B34(v6, v75, v7, v8, v76, 0);
  sub_2409B3B34(v12, v11, v77, v13, v14, 0);
  sub_2409B3B34(v6, v75, v7, v8, v76, 0);
  if (v7 == v77)
    goto LABEL_7;
  v31 = 0;
  v32 = v77 + 64;
  v33 = (_BYTE *)(v7 + 64);
  while (1)
  {
    v34 = *v33;
    v35 = *((_OWORD *)v33 - 1);
    v78 = *((_OWORD *)v33 - 2);
    v79 = v35;
    v80 = v34;
    if (v31 >= *(_QWORD *)(v77 + 16))
      break;
    _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0((uint64_t)&v78);
    if ((v36 & 1) == 0)
      goto LABEL_48;
    ++v31;
    v32 += 40;
    v33 += 40;
    if (v30 == v31)
      goto LABEL_7;
  }
LABEL_60:
  __break(1u);
}

uint64_t sub_2409B47E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char v6;
  __int128 v7;
  char v8;
  BOOL v10;
  _OWORD v12[2];
  char v13;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v8 = 1;
    }
    else
    {
      v3 = v2 - 1;
      v4 = a2 + 64;
      v5 = (_BYTE *)(a1 + 64);
      do
      {
        v6 = *v5;
        v7 = *((_OWORD *)v5 - 1);
        v12[0] = *((_OWORD *)v5 - 2);
        v12[1] = v7;
        v13 = v6;
        _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0((uint64_t)v12);
        v10 = v3-- != 0;
        if ((v8 & 1) == 0)
          break;
        v4 += 40;
        v5 += 40;
      }
      while (v10);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_2409B4890(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_2409C6144(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_2409C6144() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_2409B4958()
{
  return sub_2409C618C();
}

uint64_t sub_2409B4980()
{
  return 0x73656C7572;
}

uint64_t sub_2409B4994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x73656C7572 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2409C6144();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_2409B4A20(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2409B4A2C()
{
  sub_2409B4BA4();
  return sub_2409C621C();
}

uint64_t sub_2409B4A54()
{
  sub_2409B4BA4();
  return sub_2409C6228();
}

uint64_t StyleSheet.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073158);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409B4BA4();
  sub_2409C61B0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073160);
  sub_2409B3A00(&qword_257073168, &qword_257073160, (uint64_t (*)(void))sub_2409B4BE8, MEMORY[0x24BEE12A0]);
  sub_2409C6114();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2409B4BA4()
{
  unint64_t result;

  result = qword_257073C70;
  if (!qword_257073C70)
  {
    result = MEMORY[0x242685B78](&unk_2409C93B4, &type metadata for StyleSheet.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073C70);
  }
  return result;
}

unint64_t sub_2409B4BE8()
{
  unint64_t result;

  result = qword_257073170;
  if (!qword_257073170)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Rule, &type metadata for StyleSheet.Rule);
    atomic_store(result, (unint64_t *)&qword_257073170);
  }
  return result;
}

uint64_t StyleSheet.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073178);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409B4BA4();
  sub_2409C61A4();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073160);
    sub_2409B3A00(&qword_257073180, &qword_257073160, (uint64_t (*)(void))sub_2409B4D74, MEMORY[0x24BEE12D0]);
    sub_2409C60B4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_2409B4D74()
{
  unint64_t result;

  result = qword_257073188;
  if (!qword_257073188)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Rule, &type metadata for StyleSheet.Rule);
    atomic_store(result, (unint64_t *)&qword_257073188);
  }
  return result;
}

uint64_t sub_2409B4DB8()
{
  return swift_bridgeObjectRetain();
}

void sub_2409B4DC0(uint64_t *a1, uint64_t *a2)
{
  sub_2409B3DA8(*a1, *a2);
}

uint64_t sub_2409B4DCC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return StyleSheet.init(from:)(a1, a2);
}

uint64_t sub_2409B4DE0(_QWORD *a1)
{
  return StyleSheet.encode(to:)(a1);
}

BOOL static StyleSheet.Color.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t sub_2409B4E28(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x7265746E6563;
    else
      v3 = 0x7468676972;
    if (v2 == 1)
      v4 = 0xE600000000000000;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x7265746E6563;
      else
        v6 = 0x7468676972;
      if (v5 == 1)
        v7 = 0xE600000000000000;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1952867692;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1952867692)
  {
LABEL_21:
    v8 = sub_2409C6144();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_2409B4F20(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2409B4F70(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2409B500C + 4 * byte_2409C7296[a2]))(1852793705);
}

uint64_t sub_2409B500C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1852793705 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_2409C6144();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2409B50F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = StyleSheet.Font.Weight.rawValue.getter();
  v2 = v1;
  if (v0 == StyleSheet.Font.Weight.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2409C6144();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2409B518C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x63696C617469;
    else
      v3 = 0x657571696C626FLL;
    if (v2 == 1)
      v4 = 0xE600000000000000;
    else
      v4 = 0xE700000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x63696C617469;
      else
        v6 = 0x657571696C626FLL;
      if (v5 == 1)
        v7 = 0xE600000000000000;
      else
        v7 = 0xE700000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x6C616D726F6ELL;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x6C616D726F6ELL)
  {
LABEL_21:
    v8 = sub_2409C6144();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2409B5294(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x61632D6C6C616D73;
  else
    v3 = 0x6C616D726F6ELL;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xEA00000000007370;
  if ((a2 & 1) != 0)
    v5 = 0x61632D6C6C616D73;
  else
    v5 = 0x6C616D726F6ELL;
  if ((a2 & 1) != 0)
    v6 = 0xEA00000000007370;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2409C6144();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_2409B5338(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2409B5370(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2409B53B4 + 4 * byte_2409C72A0[a2]))(30832);
}

uint64_t sub_2409B53B4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 30832 && v1 == 0xE200000000000000)
    v2 = 1;
  else
    v2 = sub_2409C6144();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2409B5438(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2409B5488(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2409B5524 + 4 * byte_2409C72AB[a2]))(0x6C6C616D732D78);
}

uint64_t sub_2409B5524(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6C6C616D732D78 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_2409C6144();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2409B561C()
{
  return 12383;
}

uint64_t sub_2409B562C()
{
  sub_2409BB8B8();
  return sub_2409C621C();
}

uint64_t sub_2409B5654()
{
  sub_2409BB8B8();
  return sub_2409C6228();
}

uint64_t sub_2409B567C()
{
  sub_2409BB764();
  return sub_2409C621C();
}

uint64_t sub_2409B56A4()
{
  sub_2409BB764();
  return sub_2409C6228();
}

uint64_t sub_2409B56CC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2409B56FC + 4 * byte_2409C72B2[*v0]))(0x64696C61766E69, 0xE700000000000000);
}

uint64_t sub_2409B56FC()
{
  return 0x726F6C6F63;
}

uint64_t sub_2409B5710()
{
  return 0x756F72676B636162;
}

uint64_t sub_2409B5774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BEE44(a1, a2);
  *a3 = result;
  return result;
}

void sub_2409B5798(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2409B57A4()
{
  sub_2409BB720();
  return sub_2409C621C();
}

uint64_t sub_2409B57CC()
{
  sub_2409BB720();
  return sub_2409C6228();
}

uint64_t sub_2409B57F4()
{
  sub_2409BB940();
  return sub_2409C621C();
}

uint64_t sub_2409B581C()
{
  sub_2409BB940();
  return sub_2409C6228();
}

uint64_t sub_2409B5844()
{
  sub_2409BB7A8();
  return sub_2409C621C();
}

uint64_t sub_2409B586C()
{
  sub_2409BB7A8();
  return sub_2409C6228();
}

uint64_t sub_2409B5894()
{
  _BYTE *v0;

  if (*v0)
    return 0x65756C6176;
  else
    return 0x79747265706F7270;
}

uint64_t sub_2409B58CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF0F8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2409B58F0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2409B58FC()
{
  sub_2409BB984();
  return sub_2409C621C();
}

uint64_t sub_2409B5924()
{
  sub_2409BB984();
  return sub_2409C6228();
}

uint64_t sub_2409B594C()
{
  sub_2409BB830();
  return sub_2409C621C();
}

uint64_t sub_2409B5974()
{
  sub_2409BB830();
  return sub_2409C6228();
}

void StyleSheet.Rule.Declaration.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  _QWORD v13[2];
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073190);
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v23 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073198);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v21 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731A0);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v18 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731A8);
  v16 = *(_QWORD *)(v8 - 8);
  v17 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v15 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731B0);
  v13[1] = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731B8);
  MEMORY[0x24BDAC7A8](v10);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731C0);
  v30 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v11 = *v1;
  v28 = v1[1];
  v29 = v11;
  v27 = v1[2];
  v13[0] = v1[3];
  v12 = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BB720();
  sub_2409C61B0();
  __asm { BR              X9 }
}

uint64_t sub_2409B5C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v4 - 112) = 0;
  sub_2409BB984();
  v5 = *(_QWORD *)(v4 - 72);
  sub_2409C60D8();
  *(_BYTE *)(v4 - 112) = 0;
  v6 = *(_QWORD *)(v4 - 120);
  sub_2409C60FC();
  if (!v6)
  {
    *(_BYTE *)(v4 - 112) = 1;
    sub_2409C60FC();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 128) + 8))(v1, v5);
}

uint64_t StyleSheet.Rule.Declaration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  _QWORD v26[4];
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;

  v36 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731E0);
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731E8);
  v35 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v40 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731F0);
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570731F8);
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v39 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073200);
  v28 = *(_QWORD *)(v10 - 8);
  v29 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v37 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073208);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073210);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_2409BB720();
  v19 = v45;
  sub_2409C61A4();
  if (!v19)
  {
    v26[1] = v13;
    v26[2] = v12;
    v26[3] = 0;
    v45 = v15;
    v27 = v17;
    v20 = sub_2409C60CC();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X9 }
    v21 = sub_2409C5FD0();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073218);
    *v23 = &type metadata for StyleSheet.Rule.Declaration;
    v24 = v27;
    sub_2409C6078();
    sub_2409C5FC4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v24, v14);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
}

void sub_2409B6338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v1 - 112) = 1;
  sub_2409BB940();
  v2 = *(_QWORD *)(v1 - 176);
  v3 = *(_QWORD *)(v1 - 264);
  sub_2409C606C();
  v4 = *(_QWORD *)(v1 - 72);
  if (v3)
  {
    swift_bridgeObjectRelease();
    JUMPOUT(0x2409B6308);
  }
  sub_2409BBA50();
  v5 = *(_QWORD *)(v1 - 240);
  sub_2409C60B4();
  *(_QWORD *)(v1 - 264) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 248) + 8))(v2, v5);
  swift_bridgeObjectRelease();
  (*(void (**)(_QWORD, uint64_t))(v4 + 8))(*(_QWORD *)(v1 - 256), v0);
  JUMPOUT(0x2409B6970);
}

void sub_2409B63A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v1 - 112) = 2;
  sub_2409BB8B8();
  v2 = *(_QWORD *)(v1 - 160);
  v3 = *(_QWORD *)(v1 - 256);
  v4 = *(_QWORD *)(v1 - 264);
  sub_2409C606C();
  if (!v4)
  {
    sub_2409BBA50();
    v5 = *(_QWORD *)(v1 - 224);
    sub_2409C6090();
    *(_QWORD *)(v1 - 264) = 0;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 232) + 8))(v2, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 72) + 8))(v3, v0);
    JUMPOUT(0x2409B6970);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x2409B6308);
}

void sub_2409B64E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 - 112) = 4;
  sub_2409BB7A8();
  v3 = *(_QWORD *)(v2 - 256);
  v4 = *(_QWORD *)(v2 - 264);
  sub_2409C606C();
  if (!v4)
  {
    sub_2409BB9C8();
    v5 = *(_QWORD *)(v2 - 216);
    sub_2409C60B4();
    *(_QWORD *)(v2 - 264) = 0;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 192) + 8))(v1, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 72) + 8))(v3, v0);
    JUMPOUT(0x2409B6970);
  }
  swift_bridgeObjectRelease();
  JUMPOUT(0x2409B658CLL);
}

void sub_2409B6594()
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
  uint64_t v10;

  v6 = v4;
  *(_QWORD *)(v5 - 160) = v0;
  *(_BYTE *)(v5 - 112) = 5;
  sub_2409BB764();
  v7 = *(_QWORD *)(v5 - 256);
  v8 = v2;
  v9 = *(_QWORD *)(v5 - 264);
  sub_2409C606C();
  v10 = *(_QWORD *)(v5 - 72);
  if (v9)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v7, v8);
    JUMPOUT(0x2409B6310);
  }
  *(_QWORD *)(v5 - 152) = v8;
  sub_2409C6084();
  *(_QWORD *)(v5 - 264) = 0;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 72) + 8))(v7, *(_QWORD *)(v5 - 152));
  JUMPOUT(0x2409B6978);
}

uint64_t sub_2409B6998@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return StyleSheet.Rule.Declaration.init(from:)(a1, a2);
}

void sub_2409B69AC(_QWORD *a1)
{
  StyleSheet.Rule.Declaration.encode(to:)(a1);
}

uint64_t sub_2409B69C4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6564756C657270;
  if (*v0 != 1)
    v1 = 0x746172616C636564;
  if (*v0)
    return v1;
  else
    return 0x696669746E656469;
}

uint64_t sub_2409B6A2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF1E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_2409B6A50(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2409B6A5C()
{
  sub_2409BBE64();
  return sub_2409C621C();
}

uint64_t sub_2409B6A84()
{
  sub_2409BBE64();
  return sub_2409C6228();
}

uint64_t sub_2409B6AAC()
{
  _BYTE *v0;

  if (*v0)
    return 0x726F7779654B7461;
  else
    return 0x656966696C617571;
}

uint64_t sub_2409B6AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF358(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2409B6B08()
{
  sub_2409BBE20();
  return sub_2409C621C();
}

uint64_t sub_2409B6B30()
{
  sub_2409BBE20();
  return sub_2409C6228();
}

uint64_t sub_2409B6B58()
{
  _BYTE *v0;

  if (*v0)
    return 0x746172616C636564;
  else
    return 0x726F7463656C6573;
}

uint64_t sub_2409B6B9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF460(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2409B6BC0()
{
  sub_2409BBEEC();
  return sub_2409C621C();
}

uint64_t sub_2409B6BE8()
{
  sub_2409BBEEC();
  return sub_2409C6228();
}

uint64_t StyleSheet.Rule.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073238);
  v20 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v23 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073240);
  v4 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v21 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073248);
  v29 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v26 = v1[1];
  v27 = v8;
  v19 = v1[2];
  v9 = v1[4];
  v10 = *((_BYTE *)v1 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BBE20();
  sub_2409C61B0();
  if ((v10 & 1) != 0)
  {
    v22 = v9;
    v11 = v20;
    LOBYTE(v31) = 1;
    sub_2409BBE64();
    v12 = v23;
    v13 = v25;
    sub_2409C60D8();
    LOBYTE(v31) = 0;
    v14 = v24;
    v15 = v28;
    sub_2409C60FC();
    if (!v15)
    {
      LOBYTE(v31) = 1;
      sub_2409C60FC();
      v31 = v22;
      v16 = 2;
LABEL_6:
      v30 = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073148);
      sub_2409B3A00(&qword_257073250, &qword_257073148, (uint64_t (*)(void))sub_2409BBEA8, MEMORY[0x24BEE12A0]);
      sub_2409C6114();
    }
  }
  else
  {
    v11 = v4;
    LOBYTE(v31) = 0;
    sub_2409BBEEC();
    v12 = v21;
    v13 = v25;
    sub_2409C60D8();
    LOBYTE(v31) = 0;
    v14 = v22;
    v17 = v28;
    sub_2409C60FC();
    if (!v17)
    {
      v31 = v19;
      v16 = 1;
      goto LABEL_6;
    }
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v12, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v7, v13);
}

uint64_t StyleSheet.Rule.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
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
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  _QWORD *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;

  v46 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073260);
  v47 = *(_QWORD *)(v3 - 8);
  v48 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v49 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073268);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073270);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_2409BBE20();
  v14 = v51;
  sub_2409C61A4();
  if (!v14)
  {
    v44 = v6;
    v45 = v5;
    v15 = v49;
    v51 = v10;
    v16 = sub_2409C60CC();
    if (*(_QWORD *)(v16 + 16) == 1)
    {
      v17 = v9;
      v18 = *(_BYTE *)(v16 + 32);
      if ((v18 & 1) != 0)
      {
        v45 = v16;
        LOBYTE(v53) = 1;
        sub_2409BBE64();
        sub_2409C606C();
        LOBYTE(v53) = 0;
        v29 = v48;
        v30 = sub_2409C609C();
        v32 = v31;
        v43 = v30;
        LOBYTE(v53) = 1;
        v33 = sub_2409C609C();
        v35 = v34;
        v44 = v33;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257073148);
        v52 = 2;
        v36 = v29;
        sub_2409B3A00(&qword_257073278, &qword_257073148, (uint64_t (*)(void))sub_2409BBF30, MEMORY[0x24BEE12D0]);
        sub_2409C60B4();
        v37 = v51;
        v38 = v36;
        v39 = v32;
        (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v38);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v17);
        v40 = v53;
        v41 = v44;
LABEL_10:
        v42 = v46;
        *v46 = v43;
        v42[1] = v39;
        v42[2] = v41;
        v42[3] = v35;
        v42[4] = v40;
        *((_BYTE *)v42 + 40) = v18;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
      }
      LOBYTE(v53) = 0;
      sub_2409BBEEC();
      v23 = v8;
      sub_2409C606C();
      LOBYTE(v53) = 0;
      v24 = v45;
      v25 = sub_2409C609C();
      v27 = v26;
      v43 = v25;
      v49 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073148);
      v52 = 1;
      sub_2409B3A00(&qword_257073278, &qword_257073148, (uint64_t (*)(void))sub_2409BBF30, MEMORY[0x24BEE12D0]);
      v28 = v49;
      sub_2409C60B4();
      if (!v28)
      {
        v39 = v27;
        (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v24);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v17);
        v35 = 0;
        v40 = 0;
        v41 = v53;
        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v9);
    }
    else
    {
      v19 = sub_2409C5FD0();
      swift_allocError();
      v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073218);
      *v21 = &type metadata for StyleSheet.Rule;
      sub_2409C6078();
      sub_2409C5FC4();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v9);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
}

uint64_t sub_2409B74C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return StyleSheet.Rule.init(from:)(a1, a2);
}

uint64_t sub_2409B74D4(_QWORD *a1)
{
  return StyleSheet.Rule.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StyleSheet.init(css:)(Swift::String css)
{
  uint64_t *v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  LinkPresentationStyleSheetParsing::StyleSheet result;
  uint64_t v9[5];
  uint64_t v10;

  object = css._object;
  countAndFlagsBits = css._countAndFlagsBits;
  v5 = v1;
  v6 = type metadata accessor for Tokenizer();
  v10 = Tokenizer.__allocating_init(source:)(countAndFlagsBits, (uint64_t)object);
  swift_retain();
  TokenParser.init<A>(using:)((uint64_t)&v10, v6, (uint64_t)&protocol witness table for Tokenizer, v9);
  v7 = TokenParser.parse()();
  sub_2409AB850((uint64_t)v9);
  result.rules._rawValue = (void *)swift_release();
  if (!v2)
    *v5 = v7;
  return result;
}

uint64_t StyleSheet.Color.red.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t StyleSheet.Color.green.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t StyleSheet.Color.blue.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8);
}

uint64_t StyleSheet.Color.init(red:green:blue:)@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, _DWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

int8x8_t StyleSheet.Color.init(value:)@<D0>(unsigned int a1@<W0>, int8x8_t *a2@<X8>)
{
  int8x8_t result;

  result = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a1), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
  *a2 = result;
  a2[1].i32[0] = a1;
  return result;
}

uint64_t sub_2409B75E4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6E65657267;
  if (*v0 != 1)
    v1 = 1702194274;
  if (*v0)
    return v1;
  else
    return 6579570;
}

uint64_t sub_2409B762C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF568(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2409B7650()
{
  sub_2409BBF74();
  return sub_2409C621C();
}

uint64_t sub_2409B7678()
{
  sub_2409BBF74();
  return sub_2409C6228();
}

uint64_t StyleSheet.Color.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _DWORD v9[7];
  char v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073288);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[6] = *(_DWORD *)(v1 + 4);
  v9[3] = *(_DWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BBF74();
  sub_2409C61B0();
  v12 = 0;
  sub_2409C6120();
  if (!v2)
  {
    v11 = 1;
    sub_2409C6120();
    v10 = 2;
    sub_2409C6120();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t StyleSheet.Color.init(from:)@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v11;
  int v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073290);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BBF74();
  sub_2409C61A4();
  if (!v2)
  {
    v16 = 0;
    v9 = sub_2409C60C0();
    v15 = 1;
    v11 = sub_2409C60C0();
    v14 = 2;
    v12 = sub_2409C60C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

BOOL sub_2409B7968(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t sub_2409B7998@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return StyleSheet.Color.init(from:)(a1, a2);
}

uint64_t sub_2409B79AC(_QWORD *a1)
{
  return StyleSheet.Color.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet::TextAlign_optional __swiftcall StyleSheet.TextAlign.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (LinkPresentationStyleSheetParsing::StyleSheet::TextAlign_optional)sub_2409B9918(v1);
}

uint64_t StyleSheet.TextAlign.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7265746E6563;
  if (*v0 != 1)
    v1 = 0x7468676972;
  if (*v0)
    return v1;
  else
    return 1952867692;
}

uint64_t sub_2409B7A18()
{
  sub_2409C6180();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

void sub_2409B7AA8(char a1)
{
  sub_2409C6180();
  __asm { BR              X10 }
}

uint64_t sub_2409B7AF8()
{
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

uint64_t sub_2409B7BA0()
{
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2409B7C0C()
{
  sub_2409C6180();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

void sub_2409B7C98(uint64_t a1, char a2)
{
  sub_2409C6180();
  __asm { BR              X10 }
}

uint64_t sub_2409B7CE4()
{
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

void sub_2409B7D8C(uint64_t a1, char a2)
{
  sub_2409C6180();
  __asm { BR              X10 }
}

uint64_t sub_2409B7DD8()
{
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

LinkPresentationStyleSheetParsing::StyleSheet::TextAlign_optional sub_2409B7E80(Swift::String *a1)
{
  return StyleSheet.TextAlign.init(rawValue:)(*a1);
}

void sub_2409B7E8C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xE600000000000000;
  v5 = 0x7265746E6563;
  if (v2 != 1)
  {
    v5 = 0x7468676972;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1952867692;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2409B7EDC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2409B4E28(*a1, *a2);
}

uint64_t sub_2409B7EE8()
{
  sub_2409AD1FC();
  return sub_2409C5E98();
}

uint64_t sub_2409B7F44()
{
  sub_2409AD1FC();
  return sub_2409C5E8C();
}

void StyleSheet.Font.Specified.size.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

void StyleSheet.Font.Specified.weight.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 9);
}

void StyleSheet.Font.Specified.style.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 10);
}

void StyleSheet.Font.Specified.variant.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 11);
}

uint64_t StyleSheet.Font.Specified.family.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StyleSheet.Font.Specified.init(size:weight:style:variant:family:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6;
  char v7;
  char v8;
  char v9;

  v6 = *(_BYTE *)(result + 8);
  v7 = *a2;
  v8 = *a3;
  v9 = *a4;
  *(_QWORD *)a6 = *(_QWORD *)result;
  *(_BYTE *)(a6 + 8) = v6;
  *(_BYTE *)(a6 + 9) = v7;
  *(_BYTE *)(a6 + 10) = v8;
  *(_BYTE *)(a6 + 11) = v9;
  *(_QWORD *)(a6 + 16) = a5;
  return result;
}

BOOL sub_2409B8004(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2409B8018()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2409B8040 + 4 * byte_2409C72D7[*v0]))(1702521203, 0xE400000000000000);
}

uint64_t sub_2409B8040()
{
  return 0x746867696577;
}

uint64_t sub_2409B8054()
{
  return 0x656C797473;
}

uint64_t sub_2409B8068()
{
  return 0x746E6169726176;
}

uint64_t sub_2409B8080()
{
  return 0x796C696D6166;
}

uint64_t sub_2409B8094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF694(a1, a2);
  *a3 = result;
  return result;
}

void sub_2409B80B8(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2409B80C4()
{
  sub_2409BBFB8();
  return sub_2409C621C();
}

uint64_t sub_2409B80EC()
{
  sub_2409BBFB8();
  return sub_2409C6228();
}

uint64_t StyleSheet.Font.Specified.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  char v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073298);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *((_BYTE *)v1 + 8);
  v22 = *((unsigned __int8 *)v1 + 9);
  v9 = *((unsigned __int8 *)v1 + 10);
  v17 = *((unsigned __int8 *)v1 + 11);
  v18 = v9;
  v16 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BBFB8();
  sub_2409C61B0();
  v20 = v7;
  v21 = v8;
  v23 = 0;
  sub_2409BBFFC();
  v10 = v19;
  sub_2409C60F0();
  if (!v10)
  {
    v11 = v17;
    v12 = v18;
    v13 = v16;
    LOBYTE(v20) = v22;
    v23 = 1;
    sub_2409BC040();
    sub_2409C60F0();
    LOBYTE(v20) = v12;
    v23 = 2;
    sub_2409BC084();
    sub_2409C60F0();
    LOBYTE(v20) = v11;
    v23 = 3;
    sub_2409BC0C8();
    sub_2409C60F0();
    v20 = v13;
    v23 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
    sub_2409BC21C(&qword_2570732C0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_2409C60F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t StyleSheet.Font.Specified.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570732C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BBFB8();
  sub_2409C61A4();
  if (!v2)
  {
    v18 = 0;
    sub_2409BC10C();
    sub_2409C6090();
    v9 = v15;
    v10 = v16;
    v18 = 1;
    sub_2409BC150();
    sub_2409C6090();
    v14 = v9;
    LODWORD(v9) = v15;
    v18 = 2;
    sub_2409BC194();
    sub_2409C6090();
    v17 = v9;
    LOBYTE(v9) = v15;
    v18 = 3;
    sub_2409BC1D8();
    sub_2409C6090();
    HIDWORD(v13) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
    v18 = 4;
    sub_2409BC21C(&qword_2570732F0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_2409C6090();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v12 = v15;
    *(_QWORD *)a2 = v14;
    *(_BYTE *)(a2 + 8) = v10;
    *(_BYTE *)(a2 + 9) = v17;
    *(_BYTE *)(a2 + 10) = v9;
    *(_BYTE *)(a2 + 11) = BYTE4(v13);
    *(_QWORD *)(a2 + 16) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2409B85F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return StyleSheet.Font.Specified.init(from:)(a1, a2);
}

uint64_t sub_2409B8608(_QWORD *a1)
{
  return StyleSheet.Font.Specified.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Weight_optional __swiftcall StyleSheet.Font.Weight.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  LinkPresentationStyleSheetParsing::StyleSheet::Font::Weight_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2409C6060();
  result.value = swift_bridgeObjectRelease();
  v5 = 13;
  if (v3 < 0xD)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Weight.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2409B86A0 + 4 * byte_2409C72DC[*v0]))(0x6C616D726F6ELL, 0xE600000000000000);
}

uint64_t sub_2409B86A0()
{
  return 1684828002;
}

uint64_t sub_2409B86B0()
{
  return 0x7265646C6F62;
}

uint64_t sub_2409B86C0()
{
  return 0x7265746867696CLL;
}

uint64_t sub_2409B86D8()
{
  return 3158065;
}

uint64_t sub_2409B86E8()
{
  return 3158066;
}

uint64_t sub_2409B876C()
{
  sub_2409C6180();
  StyleSheet.Font.Weight.rawValue.getter();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

uint64_t sub_2409B87D0()
{
  StyleSheet.Font.Weight.rawValue.getter();
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2409B8820()
{
  sub_2409C6180();
  StyleSheet.Font.Weight.rawValue.getter();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Weight_optional sub_2409B8880(Swift::String *a1)
{
  return StyleSheet.Font.Weight.init(rawValue:)(*a1);
}

uint64_t sub_2409B888C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = StyleSheet.Font.Weight.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2409B88B0()
{
  return sub_2409B50F8();
}

uint64_t sub_2409B88BC()
{
  sub_2409ADD1C();
  return sub_2409C5E98();
}

uint64_t sub_2409B8918()
{
  sub_2409ADD1C();
  return sub_2409C5E8C();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Unit_optional __swiftcall StyleSheet.Font.Size.Unit.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Unit_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2409C6060();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Size.Unit.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2409B89E0 + 4 * byte_2409C72E9[*v0]))(37, 0xE100000000000000);
}

uint64_t sub_2409B89E0()
{
  return 30832;
}

uint64_t sub_2409B89EC()
{
  return 28005;
}

uint64_t sub_2409B89F8()
{
  return 30821;
}

void sub_2409B8A04()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2409C6180();
  __asm { BR              X9 }
}

uint64_t sub_2409B8A44()
{
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

void sub_2409B8A90()
{
  __asm { BR              X10 }
}

uint64_t sub_2409B8AC0()
{
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

void sub_2409B8AF8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2409C6180();
  __asm { BR              X9 }
}

uint64_t sub_2409B8B34()
{
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Unit_optional sub_2409B8B80(Swift::String *a1)
{
  return StyleSheet.Font.Size.Unit.init(rawValue:)(*a1);
}

uint64_t sub_2409B8B8C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2409B8BB0 + 4 * byte_2409C72F9[*v0]))();
}

void sub_2409B8BB0(_QWORD *a1@<X8>)
{
  *a1 = 30832;
  a1[1] = 0xE200000000000000;
}

void sub_2409B8BC0(_QWORD *a1@<X8>)
{
  *a1 = 28005;
  a1[1] = 0xE200000000000000;
}

void sub_2409B8BD0(_QWORD *a1@<X8>)
{
  *a1 = 30821;
  a1[1] = 0xE200000000000000;
}

void sub_2409B8BE0(char *a1)
{
  sub_2409B5338(*a1);
}

uint64_t sub_2409B8BEC()
{
  sub_2409ADC08();
  return sub_2409C5E98();
}

uint64_t sub_2409B8C48()
{
  sub_2409ADC08();
  return sub_2409C5E8C();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Absolute_optional __swiftcall StyleSheet.Font.Size.Absolute.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Absolute_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2409C6060();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Size.Absolute.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2409B8D1C + 4 * byte_2409C72FD[*v0]))(0x6C6C616D732D7878, 0xE800000000000000);
}

uint64_t sub_2409B8D1C()
{
  return 0x6C6C616D732D78;
}

uint64_t sub_2409B8D34()
{
  return 0x6C6C616D73;
}

uint64_t sub_2409B8D48()
{
  return 0x6D756964656DLL;
}

uint64_t sub_2409B8D5C()
{
  return 0x656772616CLL;
}

uint64_t sub_2409B8D70()
{
  return 0x656772616C2D78;
}

uint64_t sub_2409B8D88()
{
  return 0x656772616C2D7878;
}

void sub_2409B8D9C()
{
  char *v0;

  sub_2409B7C98(0, *v0);
}

void sub_2409B8DA8()
{
  __asm { BR              X10 }
}

uint64_t sub_2409B8DE4()
{
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

void sub_2409B8E78(uint64_t a1)
{
  char *v1;

  sub_2409B7C98(a1, *v1);
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Size::Absolute_optional sub_2409B8E80(Swift::String *a1)
{
  return StyleSheet.Font.Size.Absolute.init(rawValue:)(*a1);
}

uint64_t sub_2409B8E8C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2409B8EBC + 4 * byte_2409C730B[*v0]))();
}

void sub_2409B8EBC(_QWORD *a1@<X8>)
{
  *a1 = 0x6C6C616D732D78;
  a1[1] = 0xE700000000000000;
}

void sub_2409B8ED8(_QWORD *a1@<X8>)
{
  *a1 = 0x6C6C616D73;
  a1[1] = 0xE500000000000000;
}

void sub_2409B8EF0(_QWORD *a1@<X8>)
{
  *a1 = 0x6D756964656DLL;
  a1[1] = 0xE600000000000000;
}

void sub_2409B8F08(_QWORD *a1@<X8>)
{
  *a1 = 0x656772616CLL;
  a1[1] = 0xE500000000000000;
}

void sub_2409B8F20(_QWORD *a1@<X8>)
{
  *a1 = 0x656772616C2D78;
  a1[1] = 0xE700000000000000;
}

void sub_2409B8F3C(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x656772616C2D7878;
  a1[1] = v1;
}

void sub_2409B8F54(char *a1)
{
  sub_2409B5438(*a1);
}

uint64_t sub_2409B8F60()
{
  sub_2409ADBC4();
  return sub_2409C5E98();
}

uint64_t sub_2409B8FBC()
{
  sub_2409ADBC4();
  return sub_2409C5E8C();
}

void static StyleSheet.Font.Size.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v4;
  int v5;
  double v6;
  int v7;

  v4 = *(double *)a1;
  v5 = *(char *)(a1 + 8);
  v6 = *(double *)a2;
  v7 = *(char *)(a2 + 8);
  if (v5 < 0)
  {
    if (v7 < 0)
      sub_2409B5438(SLOBYTE(v4));
  }
  else if ((v7 & 0x80000000) == 0 && v4 == v6)
  {
    sub_2409B5338(v5);
  }
}

uint64_t sub_2409B9054()
{
  sub_2409BC2C0();
  return sub_2409C621C();
}

uint64_t sub_2409B907C()
{
  sub_2409BC2C0();
  return sub_2409C6228();
}

uint64_t sub_2409B90A4()
{
  _BYTE *v0;

  if (*v0)
    return 0x6574756C6F736261;
  else
    return 0x6569666963657073;
}

uint64_t sub_2409B90E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF888(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2409B9108()
{
  sub_2409BC27C();
  return sub_2409C621C();
}

uint64_t sub_2409B9130()
{
  sub_2409BC27C();
  return sub_2409C6228();
}

uint64_t sub_2409B9158()
{
  _BYTE *v0;

  if (*v0)
    return 1953066613;
  else
    return 0x65756C6176;
}

uint64_t sub_2409B9188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BF984(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2409B91AC()
{
  sub_2409BC348();
  return sub_2409C621C();
}

uint64_t sub_2409B91D4()
{
  sub_2409BC348();
  return sub_2409C6228();
}

uint64_t StyleSheet.Font.Size.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570732F8);
  v21 = *(_QWORD *)(v3 - 8);
  v22 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v20 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073300);
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073308);
  v8 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  v12 = *((char *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BC27C();
  sub_2409C61B0();
  if (v12 < 0)
  {
    v32 = 1;
    sub_2409BC2C0();
    v17 = v20;
    v18 = v26;
    sub_2409C60D8();
    v31 = v11;
    sub_2409BC304();
    v19 = v22;
    sub_2409C6114();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  }
  else
  {
    v30 = 0;
    sub_2409BC348();
    v13 = v26;
    sub_2409C60D8();
    v29 = 0;
    v15 = v24;
    v14 = v25;
    sub_2409C6108();
    if (!v14)
    {
      v28 = v12;
      v27 = 1;
      sub_2409BC38C();
      sub_2409C6114();
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v13);
  }
}

uint64_t StyleSheet.Font.Size.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  unsigned __int8 v43;
  char v44;

  v33 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073320);
  v4 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  v35 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073328);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073330);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_2409BC27C();
  v15 = v38;
  sub_2409C61A4();
  if (v15)
    goto LABEL_7;
  v16 = v36;
  v38 = v11;
  v17 = sub_2409C60CC();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v20 = sub_2409C5FD0();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073218);
    *v22 = &type metadata for StyleSheet.Font.Size;
    sub_2409C6078();
    sub_2409C5FC4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v10);
LABEL_7:
    v24 = (uint64_t)v37;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  if ((*(_BYTE *)(v17 + 32) & 1) != 0)
  {
    v18 = v38;
    v44 = 1;
    sub_2409BC2C0();
    v19 = v16;
    sub_2409C606C();
    sub_2409BC3D0();
    v26 = v34;
    sub_2409C60B4();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v10);
    v27 = v43;
    v28 = 0x80;
  }
  else
  {
    v23 = v38;
    v42 = 0;
    sub_2409BC348();
    sub_2409C606C();
    v41 = 0;
    sub_2409C60A8();
    v30 = v29;
    v39 = 1;
    sub_2409BC414();
    sub_2409C60B4();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v10);
    v28 = v40;
    v27 = v30;
  }
  v24 = (uint64_t)v37;
  v31 = v33;
  *v33 = v27;
  *((_BYTE *)v31 + 8) = v28;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

void sub_2409B9898(uint64_t a1, uint64_t a2)
{
  double v4;
  int v5;
  double v6;
  int v7;

  v4 = *(double *)a1;
  v5 = *(char *)(a1 + 8);
  v6 = *(double *)a2;
  v7 = *(char *)(a2 + 8);
  if (v5 < 0)
  {
    if (v7 < 0)
      sub_2409B5438(SLOBYTE(v4));
  }
  else if ((v7 & 0x80000000) == 0 && v4 == v6)
  {
    sub_2409B5338(v5);
  }
}

uint64_t sub_2409B98E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return StyleSheet.Font.Size.init(from:)(a1, a2);
}

uint64_t sub_2409B98F8(_QWORD *a1)
{
  return StyleSheet.Font.Size.encode(to:)(a1);
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Style_optional __swiftcall StyleSheet.Font.Style.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (LinkPresentationStyleSheetParsing::StyleSheet::Font::Style_optional)sub_2409B9918(v1);
}

uint64_t sub_2409B9918@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2409C6060();
  result = swift_bridgeObjectRelease();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t StyleSheet.Font.Style.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x63696C617469;
  if (*v0 != 1)
    v1 = 0x657571696C626FLL;
  if (*v0)
    return v1;
  else
    return 0x6C616D726F6ELL;
}

uint64_t sub_2409B99C0()
{
  sub_2409C6180();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

uint64_t sub_2409B9A58()
{
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2409B9ACC()
{
  sub_2409C6180();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Style_optional sub_2409B9B60(Swift::String *a1)
{
  return StyleSheet.Font.Style.init(rawValue:)(*a1);
}

void sub_2409B9B6C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 0xE600000000000000;
  v5 = 0x63696C617469;
  if (v2 != 1)
  {
    v5 = 0x657571696C626FLL;
    v4 = 0xE700000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6C616D726F6ELL;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2409B9BC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2409B518C(*a1, *a2);
}

uint64_t sub_2409B9BD0()
{
  sub_2409ADF08();
  return sub_2409C5E98();
}

uint64_t sub_2409B9C2C()
{
  sub_2409ADF08();
  return sub_2409C5E8C();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Variant_optional __swiftcall StyleSheet.Font.Variant.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  LinkPresentationStyleSheetParsing::StyleSheet::Font::Variant_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2409C6060();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.Variant.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x61632D6C6C616D73;
  else
    return 0x6C616D726F6ELL;
}

uint64_t sub_2409B9D14()
{
  sub_2409C6180();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

uint64_t sub_2409B9D94()
{
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2409B9DF0()
{
  sub_2409C6180();
  sub_2409C5D90();
  swift_bridgeObjectRelease();
  return sub_2409C6198();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::Variant_optional sub_2409B9E6C(Swift::String *a1)
{
  return StyleSheet.Font.Variant.init(rawValue:)(*a1);
}

void sub_2409B9E78(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6C616D726F6ELL;
  if (*v1)
    v2 = 0x61632D6C6C616D73;
  v3 = 0xE600000000000000;
  if (*v1)
    v3 = 0xEA00000000007370;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2409B9EB8(char *a1, char *a2)
{
  return sub_2409B5294(*a1, *a2);
}

uint64_t sub_2409B9EC4()
{
  sub_2409AE0D0();
  return sub_2409C5E98();
}

uint64_t sub_2409B9F20()
{
  sub_2409AE0D0();
  return sub_2409C5E8C();
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::System_optional __swiftcall StyleSheet.Font.System.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  LinkPresentationStyleSheetParsing::StyleSheet::Font::System_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2409C6060();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t StyleSheet.Font.System.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2409B9FF4 + 4 * byte_2409C7312[*v0]))(0x6E6F6974706163, 0xE700000000000000);
}

uint64_t sub_2409B9FF4()
{
  return 1852793705;
}

uint64_t sub_2409BA004()
{
  return 1970169197;
}

uint64_t sub_2409BA014()
{
  return 0x2D6567617373656DLL;
}

uint64_t sub_2409BA034()
{
  return 0x61632D6C6C616D73;
}

uint64_t sub_2409BA058()
{
  return 0x622D737574617473;
}

void sub_2409BA074()
{
  char *v0;

  sub_2409B7AA8(*v0);
}

void sub_2409BA07C()
{
  __asm { BR              X10 }
}

uint64_t sub_2409BA0B8()
{
  sub_2409C5D90();
  return swift_bridgeObjectRelease();
}

void sub_2409BA14C(uint64_t a1)
{
  char *v1;

  sub_2409B7D8C(a1, *v1);
}

LinkPresentationStyleSheetParsing::StyleSheet::Font::System_optional sub_2409BA154(Swift::String *a1)
{
  return StyleSheet.Font.System.init(rawValue:)(*a1);
}

uint64_t sub_2409BA160()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2409BA190 + 4 * byte_2409C731E[*v0]))();
}

void sub_2409BA190(_QWORD *a1@<X8>)
{
  *a1 = 1852793705;
  a1[1] = 0xE400000000000000;
}

void sub_2409BA1A4(_QWORD *a1@<X8>)
{
  *a1 = 1970169197;
  a1[1] = 0xE400000000000000;
}

void sub_2409BA1B8(_QWORD *a1@<X8>)
{
  *a1 = 0x2D6567617373656DLL;
  a1[1] = 0xEB00000000786F62;
}

void sub_2409BA1DC(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "small-caption");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_2409BA204(_QWORD *a1@<X8>)
{
  *a1 = 0x622D737574617473;
  a1[1] = 0xEA00000000007261;
}

void sub_2409BA224(char *a1)
{
  sub_2409B4F20(*a1);
}

uint64_t sub_2409BA230()
{
  sub_2409B00A0();
  return sub_2409C5E98();
}

uint64_t sub_2409BA28C()
{
  sub_2409B00A0();
  return sub_2409C5E8C();
}

uint64_t sub_2409BA2D8()
{
  _BYTE *v0;

  if (*v0)
    return 0x6D6574737973;
  else
    return 0x6569666963657073;
}

uint64_t sub_2409BA314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2409BFA5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2409BA338()
{
  sub_2409BC458();
  return sub_2409C621C();
}

uint64_t sub_2409BA360()
{
  sub_2409BC458();
  return sub_2409C6228();
}

uint64_t sub_2409BA388()
{
  sub_2409BC524();
  return sub_2409C621C();
}

uint64_t sub_2409BA3B0()
{
  sub_2409BC524();
  return sub_2409C6228();
}

uint64_t sub_2409BA3D8()
{
  sub_2409C6180();
  sub_2409C618C();
  return sub_2409C6198();
}

uint64_t sub_2409BA418()
{
  sub_2409C6180();
  sub_2409C618C();
  return sub_2409C6198();
}

uint64_t sub_2409BA454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2409C6144();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2409BA4D0()
{
  sub_2409BC49C();
  return sub_2409C621C();
}

uint64_t sub_2409BA4F8()
{
  sub_2409BC49C();
  return sub_2409C6228();
}

uint64_t StyleSheet.Font.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
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
  __int16 v25;
  char v26;
  char v27;
  uint64_t v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073348);
  v17 = *(_QWORD *)(v3 - 8);
  v18 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073350);
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073358);
  v22 = *(_QWORD *)(v9 - 8);
  v23 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[1];
  v21 = *v1;
  v19 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2409BC458();
  sub_2409C61B0();
  if (v12 < 0)
  {
    LOBYTE(v24) = 1;
    sub_2409BC49C();
    v15 = v23;
    sub_2409C60D8();
    LOBYTE(v24) = v21;
    sub_2409BC4E0();
    v16 = v18;
    sub_2409C6114();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v11, v15);
  }
  else
  {
    LOBYTE(v24) = 0;
    sub_2409BC524();
    v13 = v23;
    sub_2409C60D8();
    v24 = v21;
    v25 = v12;
    v26 = BYTE2(v12);
    v27 = BYTE3(v12);
    v28 = v19;
    sub_2409BC568();
    sub_2409C6114();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v11, v13);
  }
}

uint64_t StyleSheet.Font.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;

  v29 = a2;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073370);
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073378);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257073380);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_2409BC458();
  v13 = v37;
  sub_2409C61A4();
  if (!v13)
  {
    v27 = v4;
    v28 = v5;
    v14 = v31;
    v15 = v32;
    v37 = v9;
    v16 = sub_2409C60CC();
    if (*(_QWORD *)(v16 + 16) == 1)
    {
      v17 = v11;
      if ((*(_BYTE *)(v16 + 32) & 1) != 0)
      {
        LOBYTE(v34) = 1;
        sub_2409BC49C();
        sub_2409C606C();
        sub_2409BC5AC();
        sub_2409C60B4();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v8);
        v18 = 0;
        v19 = v34;
        v20 = 0x8000000000000000;
      }
      else
      {
        LOBYTE(v34) = 0;
        sub_2409BC524();
        sub_2409C606C();
        sub_2409BC5F0();
        v25 = v27;
        sub_2409C60B4();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v25);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v8);
        v19 = v34;
        v20 = v35;
        v18 = v36;
      }
      v26 = v29;
      *v29 = v19;
      v26[1] = v20;
      v26[2] = v18;
    }
    else
    {
      v21 = sub_2409C5FD0();
      swift_allocError();
      v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073218);
      *v23 = &type metadata for StyleSheet.Font;
      sub_2409C6078();
      sub_2409C5FC4();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v8);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

uint64_t sub_2409BAB78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return StyleSheet.Font.init(from:)(a1, a2);
}

uint64_t sub_2409BAB8C(_QWORD *a1)
{
  return StyleSheet.Font.encode(to:)(a1);
}

BOOL _s33LinkPresentationStyleSheetParsing0cD0V4FontO9SpecifiedV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  _QWORD *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  _QWORD *v13;
  double v14;
  double v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  _BOOL8 result;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;

  v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 9);
  v6 = *(unsigned __int8 *)(a1 + 10);
  v7 = *(unsigned __int8 *)(a1 + 11);
  v8 = *(_QWORD **)(a1 + 16);
  v9 = *(unsigned __int8 *)(a2 + 8);
  v10 = *(unsigned __int8 *)(a2 + 9);
  v11 = *(unsigned __int8 *)(a2 + 10);
  v12 = *(unsigned __int8 *)(a2 + 11);
  v13 = *(_QWORD **)(a2 + 16);
  if (v4 <= 0xFB)
  {
    if (v9 > 0xFB)
      return 0;
    v14 = *(double *)a1;
    v15 = *(double *)a2;
    if ((v4 & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0)
        return 0;
      sub_2409B5438(SLOBYTE(v14));
      if ((v21 & 1) == 0)
        return 0;
    }
    else
    {
      if ((v9 & 0x80) != 0)
        return 0;
      if (v14 != v15)
        return 0;
      sub_2409B5338(v4);
      if ((v16 & 1) == 0)
        return 0;
    }
  }
  else if (v9 <= 0xFB)
  {
    return 0;
  }
  if (v5 == 13)
  {
    if (v10 != 13)
      return 0;
  }
  else
  {
    if (v10 == 13)
      return 0;
    v17 = StyleSheet.Font.Weight.rawValue.getter();
    v19 = v18;
    if (v17 == StyleSheet.Font.Weight.rawValue.getter() && v19 == v20)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v22 = sub_2409C6144();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v22 & 1) == 0)
        return result;
    }
  }
  if (v6 == 3)
  {
    if (v11 != 3)
      return 0;
  }
  else
  {
    if (v11 == 3)
      return 0;
    v24 = 0xE600000000000000;
    v25 = 0x63696C617469;
    if (v6 != 1)
    {
      v25 = 0x657571696C626FLL;
      v24 = 0xE700000000000000;
    }
    if (v6)
      v26 = v25;
    else
      v26 = 0x6C616D726F6ELL;
    if (v6)
      v27 = v24;
    else
      v27 = 0xE600000000000000;
    v28 = 0xE600000000000000;
    v29 = 0x63696C617469;
    if (v11 != 1)
    {
      v29 = 0x657571696C626FLL;
      v28 = 0xE700000000000000;
    }
    if (v11)
      v30 = v29;
    else
      v30 = 0x6C616D726F6ELL;
    if (v11)
      v31 = v28;
    else
      v31 = 0xE600000000000000;
    if (v26 == v30 && v27 == v31)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v32 = sub_2409C6144();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v32 & 1) == 0)
        return result;
    }
  }
  if (v7 == 2)
  {
    if (v12 != 2)
      return 0;
  }
  else
  {
    if (v12 == 2)
      return 0;
    if ((v7 & 1) != 0)
      v33 = 0x61632D6C6C616D73;
    else
      v33 = 0x6C616D726F6ELL;
    if ((v7 & 1) != 0)
      v34 = 0xEA00000000007370;
    else
      v34 = 0xE600000000000000;
    if ((v12 & 1) != 0)
      v35 = 0x61632D6C6C616D73;
    else
      v35 = 0x6C616D726F6ELL;
    if ((v12 & 1) != 0)
      v36 = 0xEA00000000007370;
    else
      v36 = 0xE600000000000000;
    if (v33 == v35 && v34 == v36)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v37 = sub_2409C6144();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v37 & 1) == 0)
        return result;
    }
  }
  if (v8)
    return v13 && (sub_2409B4890(v8, v13) & 1) != 0;
  return !v13;
}

BOOL _s33LinkPresentationStyleSheetParsing0cD0V4FontO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v10;
  __int16 v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  char v17;
  char v18;
  uint64_t v19;

  v3 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v6 = *a2;
  v5 = a2[1];
  if (v2 < 0)
  {
    if (v5 < 0)
    {
      sub_2409B4F20(*a1);
      v7 = v8;
      sub_2409BCC3C(v3, v2);
      sub_2409BCC3C(v6, v5);
      return v7;
    }
LABEL_7:
    sub_2409BCBC8(v6, v5);
    sub_2409BCC3C(v3, v2);
    sub_2409BCC3C(v6, v5);
    return 0;
  }
  if (v5 < 0)
  {
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  v14 = a2[2];
  v15 = v3;
  v16 = v2;
  v17 = BYTE2(v2);
  v18 = BYTE3(v2);
  v19 = v4;
  v10 = v6;
  v11 = v5;
  v12 = BYTE2(v5);
  v13 = BYTE3(v5);
  sub_2409BCBC8(v6, v5);
  sub_2409BCBC8(v3, v2);
  sub_2409BCBC8(v3, v2);
  sub_2409BCBC8(v6, v5);
  v7 = _s33LinkPresentationStyleSheetParsing0cD0V4FontO9SpecifiedV2eeoiySbAG_AGtFZ_0((uint64_t)&v15, (uint64_t)&v10);
  sub_2409BCC3C(v3, v2);
  sub_2409BCC3C(v6, v5);
  sub_2409BCC3C(v6, v5);
  sub_2409BCC3C(v3, v2);
  return v7;
}

void _s33LinkPresentationStyleSheetParsing0cD0V4RuleO11DeclarationO2eeoiySbAG_AGtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_2409BB09C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  BOOL v17;

  if (v9)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2409BCB78(v2, v3, v1, v0, v9);
    sub_2409BCBEC(v4, v5, v7, v6, v8);
    v10 = v2;
    v11 = v3;
    v12 = v1;
    v13 = v0;
    v14 = v9;
LABEL_3:
    sub_2409BCBEC(v10, v11, v12, v13, v14);
    v15 = 0;
    return v15 & 1;
  }
  v17 = v4 == v2 && v5 == v3;
  if (!v17 && (sub_2409C6144() & 1) == 0)
  {
    sub_2409BCB78(v2, v3, v1, v0, 0);
    sub_2409BCB78(v4, v5, v7, v6, 0);
    sub_2409BCBEC(v4, v5, v7, v6, 0);
    v10 = v2;
    v11 = v3;
    v12 = v1;
    v13 = v0;
    v14 = 0;
    goto LABEL_3;
  }
  if (v7 == v1 && v6 == v0)
    v15 = 1;
  else
    v15 = sub_2409C6144();
  sub_2409BCB78(v2, v3, v1, v0, 0);
  sub_2409BCB78(v4, v5, v7, v6, 0);
  sub_2409BCBEC(v4, v5, v7, v6, 0);
  sub_2409BCBEC(v2, v3, v1, v0, 0);
  return v15 & 1;
}

unint64_t sub_2409BB720()
{
  unint64_t result;

  result = qword_257073C78;
  if (!qword_257073C78)
  {
    result = MEMORY[0x242685B78](&unk_2409C9364, &type metadata for StyleSheet.Rule.Declaration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073C78);
  }
  return result;
}

unint64_t sub_2409BB764()
{
  unint64_t result;

  result = qword_257073C80;
  if (!qword_257073C80)
  {
    result = MEMORY[0x242685B78](&unk_2409C9314, &type metadata for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073C80);
  }
  return result;
}

unint64_t sub_2409BB7A8()
{
  unint64_t result;

  result = qword_257073C88;
  if (!qword_257073C88)
  {
    result = MEMORY[0x242685B78](&unk_2409C92C4, &type metadata for StyleSheet.Rule.Declaration.FontCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073C88);
  }
  return result;
}

unint64_t sub_2409BB7EC()
{
  unint64_t result;

  result = qword_2570731C8;
  if (!qword_2570731C8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font, &type metadata for StyleSheet.Font);
    atomic_store(result, (unint64_t *)&qword_2570731C8);
  }
  return result;
}

unint64_t sub_2409BB830()
{
  unint64_t result;

  result = qword_257073C90;
  if (!qword_257073C90)
  {
    result = MEMORY[0x242685B78](&unk_2409C9274, &type metadata for StyleSheet.Rule.Declaration.TextAlignCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073C90);
  }
  return result;
}

unint64_t sub_2409BB874()
{
  unint64_t result;

  result = qword_2570731D0;
  if (!qword_2570731D0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.TextAlign, &type metadata for StyleSheet.TextAlign);
    atomic_store(result, (unint64_t *)&qword_2570731D0);
  }
  return result;
}

unint64_t sub_2409BB8B8()
{
  unint64_t result;

  result = qword_257073C98;
  if (!qword_257073C98)
  {
    result = MEMORY[0x242685B78](&unk_2409C9224, &type metadata for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073C98);
  }
  return result;
}

unint64_t sub_2409BB8FC()
{
  unint64_t result;

  result = qword_2570731D8;
  if (!qword_2570731D8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Color, &type metadata for StyleSheet.Color);
    atomic_store(result, (unint64_t *)&qword_2570731D8);
  }
  return result;
}

unint64_t sub_2409BB940()
{
  unint64_t result;

  result = qword_257073CA0;
  if (!qword_257073CA0)
  {
    result = MEMORY[0x242685B78](&unk_2409C91D4, &type metadata for StyleSheet.Rule.Declaration.ColorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CA0);
  }
  return result;
}

unint64_t sub_2409BB984()
{
  unint64_t result;

  result = qword_257073CA8;
  if (!qword_257073CA8)
  {
    result = MEMORY[0x242685B78](&unk_2409C9184, &type metadata for StyleSheet.Rule.Declaration.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CA8);
  }
  return result;
}

unint64_t sub_2409BB9C8()
{
  unint64_t result;

  result = qword_257073220;
  if (!qword_257073220)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font, &type metadata for StyleSheet.Font);
    atomic_store(result, (unint64_t *)&qword_257073220);
  }
  return result;
}

unint64_t sub_2409BBA0C()
{
  unint64_t result;

  result = qword_257073228;
  if (!qword_257073228)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.TextAlign, &type metadata for StyleSheet.TextAlign);
    atomic_store(result, (unint64_t *)&qword_257073228);
  }
  return result;
}

unint64_t sub_2409BBA50()
{
  unint64_t result;

  result = qword_257073230;
  if (!qword_257073230)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Color, &type metadata for StyleSheet.Color);
    atomic_store(result, (unint64_t *)&qword_257073230);
  }
  return result;
}

uint64_t _s33LinkPresentationStyleSheetParsing0cD0V4RuleO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_BYTE *)(a1 + 40);
  v9 = *(_QWORD *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a2 + 32);
  v13 = *(_BYTE *)(a2 + 40);
  v37 = v8;
  if ((v7 & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 40) & 1) == 0)
    {
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)a1;
      if (v2 == v9 && v3 == v8
        || (v29 = *(_QWORD *)a2, v30 = *(_QWORD *)(a2 + 8), v31 = sub_2409C6144(), v9 = v29, v8 = v30, (v31 & 1) != 0))
      {
        v24 = v9;
        sub_2409B3B34(v9, v8, v10, v11, v12, 0);
        sub_2409B3B34(v28, v3, v5, v4, v27, 0);
        v32 = sub_2409B47E8(v5, v10);
        v23 = v27;
        v25 = v4;
        v26 = v32;
        v7 = 0;
        v2 = v28;
        v13 = 0;
        goto LABEL_22;
      }
      v33 = v30;
      v24 = v29;
      sub_2409B3B34(v29, v33, v10, v11, v12, 0);
      sub_2409B3B34(v28, v3, v5, v4, v27, 0);
      v23 = v27;
      v7 = 0;
      v2 = v28;
      v13 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v36 = *(_QWORD *)a2;
    sub_2409B3B34(v9, v8, v10, v11, v12, v13);
    sub_2409B3B34(v2, v3, v5, v4, v6, v7);
    v23 = v6;
    v24 = v36;
LABEL_12:
    v25 = v4;
    v26 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)(a2 + 40) & 1) == 0)
    goto LABEL_11;
  v35 = *(_QWORD *)(a1 + 32);
  if (v2 == v9 && v3 == v8
    || (v14 = *(_QWORD *)a2, v15 = *(_QWORD *)(a2 + 8), v16 = sub_2409C6144(), v9 = v14, v8 = v15, (v16 & 1) != 0))
  {
    v17 = v5;
    if (v5 == v10 && v4 == v11 || (v18 = v9, v19 = v8, v20 = sub_2409C6144(), v9 = v18, v8 = v19, (v20 & 1) != 0))
    {
      v7 = 1;
      v21 = v9;
      sub_2409B3B34(v9, v8, v10, v11, v12, 1);
      sub_2409B3B34(v2, v3, v17, v4, v35, 1);
      v22 = sub_2409B47E8(v35, v12);
      v23 = v35;
      v24 = v21;
      v25 = v4;
      v26 = v22;
    }
    else
    {
      v7 = 1;
      sub_2409B3B34(v18, v8, v10, v11, v12, 1);
      sub_2409B3B34(v2, v3, v17, v4, v35, 1);
      v23 = v35;
      v24 = v18;
      v25 = v4;
      v26 = 0;
    }
    v5 = v17;
  }
  else
  {
    v7 = 1;
    sub_2409B3B34(v14, v8, v10, v11, v12, 1);
    sub_2409B3B34(v2, v3, v5, v4, v35, 1);
    v23 = v35;
    v25 = v4;
    v26 = 0;
    v24 = v14;
  }
  v13 = 1;
LABEL_22:
  sub_2409B3B7C(v2, v3, v5, v25, v23, v7);
  sub_2409B3B7C(v24, v37, v10, v11, v12, v13);
  return v26 & 1;
}

unint64_t sub_2409BBE20()
{
  unint64_t result;

  result = qword_257073CB0;
  if (!qword_257073CB0)
  {
    result = MEMORY[0x242685B78](&unk_2409C9134, &type metadata for StyleSheet.Rule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CB0);
  }
  return result;
}

unint64_t sub_2409BBE64()
{
  unint64_t result;

  result = qword_257073CB8;
  if (!qword_257073CB8)
  {
    result = MEMORY[0x242685B78](&unk_2409C90E4, &type metadata for StyleSheet.Rule.AtKeywordCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CB8);
  }
  return result;
}

unint64_t sub_2409BBEA8()
{
  unint64_t result;

  result = qword_257073258;
  if (!qword_257073258)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Rule.Declaration, &type metadata for StyleSheet.Rule.Declaration);
    atomic_store(result, (unint64_t *)&qword_257073258);
  }
  return result;
}

unint64_t sub_2409BBEEC()
{
  unint64_t result;

  result = qword_257073CC0;
  if (!qword_257073CC0)
  {
    result = MEMORY[0x242685B78](&unk_2409C9094, &type metadata for StyleSheet.Rule.QualifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CC0);
  }
  return result;
}

unint64_t sub_2409BBF30()
{
  unint64_t result;

  result = qword_257073280;
  if (!qword_257073280)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Rule.Declaration, &type metadata for StyleSheet.Rule.Declaration);
    atomic_store(result, (unint64_t *)&qword_257073280);
  }
  return result;
}

unint64_t sub_2409BBF74()
{
  unint64_t result;

  result = qword_257073CC8;
  if (!qword_257073CC8)
  {
    result = MEMORY[0x242685B78](&unk_2409C9044, &type metadata for StyleSheet.Color.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CC8);
  }
  return result;
}

unint64_t sub_2409BBFB8()
{
  unint64_t result;

  result = qword_257073CD0;
  if (!qword_257073CD0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8FF4, &type metadata for StyleSheet.Font.Specified.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CD0);
  }
  return result;
}

unint64_t sub_2409BBFFC()
{
  unint64_t result;

  result = qword_2570732A0;
  if (!qword_2570732A0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size, &type metadata for StyleSheet.Font.Size);
    atomic_store(result, (unint64_t *)&qword_2570732A0);
  }
  return result;
}

unint64_t sub_2409BC040()
{
  unint64_t result;

  result = qword_2570732A8;
  if (!qword_2570732A8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Weight, &type metadata for StyleSheet.Font.Weight);
    atomic_store(result, (unint64_t *)&qword_2570732A8);
  }
  return result;
}

unint64_t sub_2409BC084()
{
  unint64_t result;

  result = qword_2570732B0;
  if (!qword_2570732B0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Style, &type metadata for StyleSheet.Font.Style);
    atomic_store(result, (unint64_t *)&qword_2570732B0);
  }
  return result;
}

unint64_t sub_2409BC0C8()
{
  unint64_t result;

  result = qword_2570732B8;
  if (!qword_2570732B8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Variant, &type metadata for StyleSheet.Font.Variant);
    atomic_store(result, (unint64_t *)&qword_2570732B8);
  }
  return result;
}

unint64_t sub_2409BC10C()
{
  unint64_t result;

  result = qword_2570732D0;
  if (!qword_2570732D0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size, &type metadata for StyleSheet.Font.Size);
    atomic_store(result, (unint64_t *)&qword_2570732D0);
  }
  return result;
}

unint64_t sub_2409BC150()
{
  unint64_t result;

  result = qword_2570732D8;
  if (!qword_2570732D8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Weight, &type metadata for StyleSheet.Font.Weight);
    atomic_store(result, (unint64_t *)&qword_2570732D8);
  }
  return result;
}

unint64_t sub_2409BC194()
{
  unint64_t result;

  result = qword_2570732E0;
  if (!qword_2570732E0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Style, &type metadata for StyleSheet.Font.Style);
    atomic_store(result, (unint64_t *)&qword_2570732E0);
  }
  return result;
}

unint64_t sub_2409BC1D8()
{
  unint64_t result;

  result = qword_2570732E8;
  if (!qword_2570732E8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Variant, &type metadata for StyleSheet.Font.Variant);
    atomic_store(result, (unint64_t *)&qword_2570732E8);
  }
  return result;
}

uint64_t sub_2409BC21C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257073100);
    v8 = a2;
    result = MEMORY[0x242685B78](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2409BC27C()
{
  unint64_t result;

  result = qword_257073CD8;
  if (!qword_257073CD8)
  {
    result = MEMORY[0x242685B78](&unk_2409C8FA4, &type metadata for StyleSheet.Font.Size.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CD8);
  }
  return result;
}

unint64_t sub_2409BC2C0()
{
  unint64_t result;

  result = qword_257073CE0;
  if (!qword_257073CE0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8F54, &type metadata for StyleSheet.Font.Size.AbsoluteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CE0);
  }
  return result;
}

unint64_t sub_2409BC304()
{
  unint64_t result;

  result = qword_257073310;
  if (!qword_257073310)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Absolute, &type metadata for StyleSheet.Font.Size.Absolute);
    atomic_store(result, (unint64_t *)&qword_257073310);
  }
  return result;
}

unint64_t sub_2409BC348()
{
  unint64_t result;

  result = qword_257073CE8;
  if (!qword_257073CE8)
  {
    result = MEMORY[0x242685B78](&unk_2409C8F04, &type metadata for StyleSheet.Font.Size.SpecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CE8);
  }
  return result;
}

unint64_t sub_2409BC38C()
{
  unint64_t result;

  result = qword_257073318;
  if (!qword_257073318)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Unit, &type metadata for StyleSheet.Font.Size.Unit);
    atomic_store(result, (unint64_t *)&qword_257073318);
  }
  return result;
}

unint64_t sub_2409BC3D0()
{
  unint64_t result;

  result = qword_257073338;
  if (!qword_257073338)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Absolute, &type metadata for StyleSheet.Font.Size.Absolute);
    atomic_store(result, (unint64_t *)&qword_257073338);
  }
  return result;
}

unint64_t sub_2409BC414()
{
  unint64_t result;

  result = qword_257073340;
  if (!qword_257073340)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Unit, &type metadata for StyleSheet.Font.Size.Unit);
    atomic_store(result, (unint64_t *)&qword_257073340);
  }
  return result;
}

unint64_t sub_2409BC458()
{
  unint64_t result;

  result = qword_257073CF0;
  if (!qword_257073CF0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8EB4, &type metadata for StyleSheet.Font.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CF0);
  }
  return result;
}

unint64_t sub_2409BC49C()
{
  unint64_t result;

  result = qword_257073CF8;
  if (!qword_257073CF8)
  {
    result = MEMORY[0x242685B78](&unk_2409C8E64, &type metadata for StyleSheet.Font.SystemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257073CF8);
  }
  return result;
}

unint64_t sub_2409BC4E0()
{
  unint64_t result;

  result = qword_257073360;
  if (!qword_257073360)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.System, &type metadata for StyleSheet.Font.System);
    atomic_store(result, (unint64_t *)&qword_257073360);
  }
  return result;
}

unint64_t sub_2409BC524()
{
  unint64_t result;

  result = qword_257073D00[0];
  if (!qword_257073D00[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8E14, &type metadata for StyleSheet.Font.SpecifiedCodingKeys);
    atomic_store(result, qword_257073D00);
  }
  return result;
}

unint64_t sub_2409BC568()
{
  unint64_t result;

  result = qword_257073368;
  if (!qword_257073368)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Specified, &type metadata for StyleSheet.Font.Specified);
    atomic_store(result, (unint64_t *)&qword_257073368);
  }
  return result;
}

unint64_t sub_2409BC5AC()
{
  unint64_t result;

  result = qword_257073388;
  if (!qword_257073388)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.System, &type metadata for StyleSheet.Font.System);
    atomic_store(result, (unint64_t *)&qword_257073388);
  }
  return result;
}

unint64_t sub_2409BC5F0()
{
  unint64_t result;

  result = qword_257073390;
  if (!qword_257073390)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Specified, &type metadata for StyleSheet.Font.Specified);
    atomic_store(result, (unint64_t *)&qword_257073390);
  }
  return result;
}

unint64_t sub_2409BC634(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_2409BC668();
  a1[2] = sub_2409BC6AC();
  result = sub_2409BC6F0();
  a1[3] = result;
  return result;
}

unint64_t sub_2409BC668()
{
  unint64_t result;

  result = qword_257073398;
  if (!qword_257073398)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet, &type metadata for StyleSheet);
    atomic_store(result, (unint64_t *)&qword_257073398);
  }
  return result;
}

unint64_t sub_2409BC6AC()
{
  unint64_t result;

  result = qword_2570733A0;
  if (!qword_2570733A0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet, &type metadata for StyleSheet);
    atomic_store(result, (unint64_t *)&qword_2570733A0);
  }
  return result;
}

unint64_t sub_2409BC6F0()
{
  unint64_t result;

  result = qword_2570733A8;
  if (!qword_2570733A8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet, &type metadata for StyleSheet);
    atomic_store(result, (unint64_t *)&qword_2570733A8);
  }
  return result;
}

unint64_t sub_2409BC738()
{
  unint64_t result;

  result = qword_2570733B0;
  if (!qword_2570733B0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.TextAlign, &type metadata for StyleSheet.TextAlign);
    atomic_store(result, (unint64_t *)&qword_2570733B0);
  }
  return result;
}

unint64_t sub_2409BC780()
{
  unint64_t result;

  result = qword_2570733B8;
  if (!qword_2570733B8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Weight, &type metadata for StyleSheet.Font.Weight);
    atomic_store(result, (unint64_t *)&qword_2570733B8);
  }
  return result;
}

unint64_t sub_2409BC7C8()
{
  unint64_t result;

  result = qword_2570733C0;
  if (!qword_2570733C0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Unit, &type metadata for StyleSheet.Font.Size.Unit);
    atomic_store(result, (unint64_t *)&qword_2570733C0);
  }
  return result;
}

unint64_t sub_2409BC810()
{
  unint64_t result;

  result = qword_2570733C8;
  if (!qword_2570733C8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Size.Absolute, &type metadata for StyleSheet.Font.Size.Absolute);
    atomic_store(result, (unint64_t *)&qword_2570733C8);
  }
  return result;
}

unint64_t sub_2409BC858()
{
  unint64_t result;

  result = qword_2570733D0;
  if (!qword_2570733D0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Style, &type metadata for StyleSheet.Font.Style);
    atomic_store(result, (unint64_t *)&qword_2570733D0);
  }
  return result;
}

unint64_t sub_2409BC8A0()
{
  unint64_t result;

  result = qword_2570733D8;
  if (!qword_2570733D8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.Variant, &type metadata for StyleSheet.Font.Variant);
    atomic_store(result, (unint64_t *)&qword_2570733D8);
  }
  return result;
}

unint64_t sub_2409BC8E8()
{
  unint64_t result;

  result = qword_2570733E0;
  if (!qword_2570733E0)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for StyleSheet.Font.System, &type metadata for StyleSheet.Font.System);
    atomic_store(result, (unint64_t *)&qword_2570733E0);
  }
  return result;
}

uint64_t dispatch thunk of StyleSheetProtocol.rules.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

ValueMetadata *type metadata accessor for StyleSheet()
{
  return &type metadata for StyleSheet;
}

uint64_t destroy for StyleSheet.Rule(uint64_t a1)
{
  return sub_2409B3B7C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for StyleSheet.Rule(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_2409B3B34(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for StyleSheet.Rule(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_2409B3B34(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_2409B3B7C(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StyleSheet.Rule(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = v4;
  sub_2409B3B7C(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Rule(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Rule(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_2409BCB54(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_2409BCB5C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule()
{
  return &type metadata for StyleSheet.Rule;
}

uint64_t sub_2409BCB78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 5)
    return swift_bridgeObjectRetain();
  if (a5 != 4)
  {
    if (a5)
      return result;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return sub_2409BCBC8(result, a2);
}

uint64_t sub_2409BCBC8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for StyleSheet.Rule.Declaration(uint64_t a1)
{
  return sub_2409BCBEC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_2409BCBEC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 5)
    return swift_bridgeObjectRelease();
  if (a5 != 4)
  {
    if (a5)
      return result;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return sub_2409BCC3C(result, a2);
}

uint64_t sub_2409BCC3C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for StyleSheet.Rule.Declaration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_2409BCB78(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for StyleSheet.Rule.Declaration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_2409BCB78(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_2409BCBEC(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StyleSheet.Rule.Declaration(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_2409BCBEC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Rule.Declaration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Rule.Declaration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_2409BCE08(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_2409BCE10(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration()
{
  return &type metadata for StyleSheet.Rule.Declaration;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Color(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Color(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Color()
{
  return &type metadata for StyleSheet.Color;
}

ValueMetadata *type metadata accessor for StyleSheet.TextAlign()
{
  return &type metadata for StyleSheet.TextAlign;
}

uint64_t destroy for StyleSheet.Font(uint64_t *a1)
{
  return sub_2409BCC3C(*a1, a1[1]);
}

uint64_t *_s33LinkPresentationStyleSheetParsing10StyleSheetV4FontOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_2409BCBC8(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *assignWithCopy for StyleSheet.Font(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_2409BCBC8(*a2, v4);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_2409BCC3C(v6, v7);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for StyleSheet.Font(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_2409BCC3C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font(uint64_t a1, int a2)
{
  unsigned int v2;
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  HIDWORD(v3) = *(_DWORD *)(a1 + 12);
  LODWORD(v3) = HIDWORD(v3);
  v2 = v3 >> 31;
  if (v2 > 0x80000000)
    v4 = ~v2;
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font(uint64_t result, int a2, int a3)
{
  unint64_t v3;

  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      HIDWORD(v3) = -a2;
      LODWORD(v3) = -a2;
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(v3 >> 1) << 32;
      *(_QWORD *)(result + 16) = 0;
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2409BD050(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) >> 63;
}

uint64_t sub_2409BD05C(uint64_t result)
{
  *(_QWORD *)(result + 8) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_2409BD06C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2 << 31;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font()
{
  return &type metadata for StyleSheet.Font;
}

uint64_t destroy for StyleSheet.Font.Specified()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO9SpecifiedVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StyleSheet.Font.Specified(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9);
  *(_BYTE *)(a1 + 10) = *((_BYTE *)a2 + 10);
  *(_BYTE *)(a1 + 11) = *((_BYTE *)a2 + 11);
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for StyleSheet.Font.Specified(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Specified(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Specified(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Specified()
{
  return &type metadata for StyleSheet.Font.Specified;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Weight(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Weight(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_2409BD30C + 4 * byte_2409C732F[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_2409BD340 + 4 * byte_2409C732A[v4]))();
}

uint64_t sub_2409BD340(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD348(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BD350);
  return result;
}

uint64_t sub_2409BD35C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BD364);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_2409BD368(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD370(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Weight()
{
  return &type metadata for StyleSheet.Font.Weight;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Size(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3F && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 63);
  v3 = ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x3E | (*(unsigned __int8 *)(a1 + 8) >> 7)) ^ 0x3F;
  if (v3 >= 0x3E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Size(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3E)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 63;
    if (a3 >= 0x3F)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x3F)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 4 * (((-a2 >> 1) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_2409BD448(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_2409BD454(uint64_t result)
{
  *(_BYTE *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_2409BD464(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 3 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size()
{
  return &type metadata for StyleSheet.Font.Size;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Size.Unit(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Size.Unit(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2409BD564 + 4 * byte_2409C7339[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2409BD598 + 4 * byte_2409C7334[v4]))();
}

uint64_t sub_2409BD598(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD5A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BD5A8);
  return result;
}

uint64_t sub_2409BD5B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BD5BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2409BD5C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD5C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.Unit()
{
  return &type metadata for StyleSheet.Font.Size.Unit;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Size.Absolute(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Size.Absolute(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_2409BD6C0 + 4 * byte_2409C7343[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2409BD6F4 + 4 * byte_2409C733E[v4]))();
}

uint64_t sub_2409BD6F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD6FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BD704);
  return result;
}

uint64_t sub_2409BD710(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BD718);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2409BD71C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD724(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.Absolute()
{
  return &type metadata for StyleSheet.Font.Size.Absolute;
}

_BYTE *sub_2409BD740(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Style()
{
  return &type metadata for StyleSheet.Font.Style;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Variant()
{
  return &type metadata for StyleSheet.Font.Variant;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.System()
{
  return &type metadata for StyleSheet.Font.System;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.CodingKeys()
{
  return &type metadata for StyleSheet.Font.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.SpecifiedCodingKeys()
{
  return &type metadata for StyleSheet.Font.SpecifiedCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.SystemCodingKeys()
{
  return &type metadata for StyleSheet.Font.SystemCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.CodingKeys()
{
  return &type metadata for StyleSheet.Font.Size.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.SpecifiedCodingKeys()
{
  return &type metadata for StyleSheet.Font.Size.SpecifiedCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Size.AbsoluteCodingKeys()
{
  return &type metadata for StyleSheet.Font.Size.AbsoluteCodingKeys;
}

uint64_t getEnumTagSinglePayload for StyleSheet.Font.Specified.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheet.Font.Specified.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409BD8CC + 4 * byte_2409C734D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2409BD900 + 4 * byte_2409C7348[v4]))();
}

uint64_t sub_2409BD900(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD908(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BD910);
  return result;
}

uint64_t sub_2409BD91C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BD924);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2409BD928(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BD930(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Font.Specified.CodingKeys()
{
  return &type metadata for StyleSheet.Font.Specified.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Color.CodingKeys()
{
  return &type metadata for StyleSheet.Color.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.CodingKeys()
{
  return &type metadata for StyleSheet.Rule.CodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.QualifiedCodingKeys()
{
  return &type metadata for StyleSheet.Rule.QualifiedCodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV9TextAlignOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV9TextAlignOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409BDA58 + 4 * byte_2409C7357[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2409BDA8C + 4 * byte_2409C7352[v4]))();
}

uint64_t sub_2409BDA8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BDA94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BDA9CLL);
  return result;
}

uint64_t sub_2409BDAA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BDAB0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2409BDAB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BDABC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.AtKeywordCodingKeys()
{
  return &type metadata for StyleSheet.Rule.AtKeywordCodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO6SystemOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO6SystemOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409BDBB4 + 4 * byte_2409C7361[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2409BDBE8 + 4 * byte_2409C735C[v4]))();
}

uint64_t sub_2409BDBE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BDBF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BDBF8);
  return result;
}

uint64_t sub_2409BDC04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BDC0CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2409BDC10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BDC18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.CodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.CodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO7VariantOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409BDC80 + 4 * byte_2409C736B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2409BDCB4 + 4 * byte_2409C7366[v4]))();
}

uint64_t sub_2409BDCB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BDCBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409BDCC4);
  return result;
}

uint64_t sub_2409BDCD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409BDCD8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2409BDCDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409BDCE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.InvalidCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.InvalidCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.ColorCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.ColorCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.TextAlignCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.TextAlignCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.FontCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.FontCodingKeys;
}

ValueMetadata *type metadata accessor for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys()
{
  return &type metadata for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO19SpecifiedCodingKeysOwet_0(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s33LinkPresentationStyleSheetParsing10StyleSheetV4FontO19SpecifiedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2409BDDE0 + 4 * byte_2409C7370[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2409BDE00 + 4 * byte_2409C7375[v4]))();
}

_BYTE *sub_2409BDDE0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2409BDE00(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2409BDE08(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2409BDE10(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2409BDE18(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2409BDE20(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheet.CodingKeys()
{
  return &type metadata for StyleSheet.CodingKeys;
}

unint64_t sub_2409BDE40()
{
  unint64_t result;

  result = qword_257075A90[0];
  if (!qword_257075A90[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C80FC, &type metadata for StyleSheet.CodingKeys);
    atomic_store(result, qword_257075A90);
  }
  return result;
}

unint64_t sub_2409BDE88()
{
  unint64_t result;

  result = qword_257075CA0[0];
  if (!qword_257075CA0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C81B4, &type metadata for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys);
    atomic_store(result, qword_257075CA0);
  }
  return result;
}

unint64_t sub_2409BDED0()
{
  unint64_t result;

  result = qword_257075EB0[0];
  if (!qword_257075EB0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C826C, &type metadata for StyleSheet.Rule.Declaration.FontCodingKeys);
    atomic_store(result, qword_257075EB0);
  }
  return result;
}

unint64_t sub_2409BDF18()
{
  unint64_t result;

  result = qword_2570760C0[0];
  if (!qword_2570760C0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8324, &type metadata for StyleSheet.Rule.Declaration.TextAlignCodingKeys);
    atomic_store(result, qword_2570760C0);
  }
  return result;
}

unint64_t sub_2409BDF60()
{
  unint64_t result;

  result = qword_2570762D0[0];
  if (!qword_2570762D0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C83DC, &type metadata for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys);
    atomic_store(result, qword_2570762D0);
  }
  return result;
}

unint64_t sub_2409BDFA8()
{
  unint64_t result;

  result = qword_2570764E0[0];
  if (!qword_2570764E0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8494, &type metadata for StyleSheet.Rule.Declaration.ColorCodingKeys);
    atomic_store(result, qword_2570764E0);
  }
  return result;
}

unint64_t sub_2409BDFF0()
{
  unint64_t result;

  result = qword_2570766F0[0];
  if (!qword_2570766F0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C854C, &type metadata for StyleSheet.Rule.Declaration.InvalidCodingKeys);
    atomic_store(result, qword_2570766F0);
  }
  return result;
}

unint64_t sub_2409BE038()
{
  unint64_t result;

  result = qword_257076900[0];
  if (!qword_257076900[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8604, &type metadata for StyleSheet.Rule.Declaration.CodingKeys);
    atomic_store(result, qword_257076900);
  }
  return result;
}

unint64_t sub_2409BE080()
{
  unint64_t result;

  result = qword_257076B10[0];
  if (!qword_257076B10[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C86BC, &type metadata for StyleSheet.Rule.AtKeywordCodingKeys);
    atomic_store(result, qword_257076B10);
  }
  return result;
}

unint64_t sub_2409BE0C8()
{
  unint64_t result;

  result = qword_257076D20[0];
  if (!qword_257076D20[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8774, &type metadata for StyleSheet.Rule.QualifiedCodingKeys);
    atomic_store(result, qword_257076D20);
  }
  return result;
}

unint64_t sub_2409BE110()
{
  unint64_t result;

  result = qword_257076F30[0];
  if (!qword_257076F30[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C882C, &type metadata for StyleSheet.Rule.CodingKeys);
    atomic_store(result, qword_257076F30);
  }
  return result;
}

unint64_t sub_2409BE158()
{
  unint64_t result;

  result = qword_257077140[0];
  if (!qword_257077140[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C88E4, &type metadata for StyleSheet.Color.CodingKeys);
    atomic_store(result, qword_257077140);
  }
  return result;
}

unint64_t sub_2409BE1A0()
{
  unint64_t result;

  result = qword_257077350[0];
  if (!qword_257077350[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C899C, &type metadata for StyleSheet.Font.Specified.CodingKeys);
    atomic_store(result, qword_257077350);
  }
  return result;
}

unint64_t sub_2409BE1E8()
{
  unint64_t result;

  result = qword_257077560[0];
  if (!qword_257077560[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8A54, &type metadata for StyleSheet.Font.Size.AbsoluteCodingKeys);
    atomic_store(result, qword_257077560);
  }
  return result;
}

unint64_t sub_2409BE230()
{
  unint64_t result;

  result = qword_257077770[0];
  if (!qword_257077770[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8B0C, &type metadata for StyleSheet.Font.Size.SpecifiedCodingKeys);
    atomic_store(result, qword_257077770);
  }
  return result;
}

unint64_t sub_2409BE278()
{
  unint64_t result;

  result = qword_257077980[0];
  if (!qword_257077980[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8BC4, &type metadata for StyleSheet.Font.Size.CodingKeys);
    atomic_store(result, qword_257077980);
  }
  return result;
}

unint64_t sub_2409BE2C0()
{
  unint64_t result;

  result = qword_257077B90[0];
  if (!qword_257077B90[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8C7C, &type metadata for StyleSheet.Font.SystemCodingKeys);
    atomic_store(result, qword_257077B90);
  }
  return result;
}

unint64_t sub_2409BE308()
{
  unint64_t result;

  result = qword_257077DA0[0];
  if (!qword_257077DA0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8D34, &type metadata for StyleSheet.Font.SpecifiedCodingKeys);
    atomic_store(result, qword_257077DA0);
  }
  return result;
}

unint64_t sub_2409BE350()
{
  unint64_t result;

  result = qword_257077FB0[0];
  if (!qword_257077FB0[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8DEC, &type metadata for StyleSheet.Font.CodingKeys);
    atomic_store(result, qword_257077FB0);
  }
  return result;
}

unint64_t sub_2409BE398()
{
  unint64_t result;

  result = qword_2570780C0;
  if (!qword_2570780C0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8CA4, &type metadata for StyleSheet.Font.SpecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570780C0);
  }
  return result;
}

unint64_t sub_2409BE3E0()
{
  unint64_t result;

  result = qword_2570780C8[0];
  if (!qword_2570780C8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8CCC, &type metadata for StyleSheet.Font.SpecifiedCodingKeys);
    atomic_store(result, qword_2570780C8);
  }
  return result;
}

unint64_t sub_2409BE428()
{
  unint64_t result;

  result = qword_257078150;
  if (!qword_257078150)
  {
    result = MEMORY[0x242685B78](&unk_2409C8BEC, &type metadata for StyleSheet.Font.SystemCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078150);
  }
  return result;
}

unint64_t sub_2409BE470()
{
  unint64_t result;

  result = qword_257078158[0];
  if (!qword_257078158[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8C14, &type metadata for StyleSheet.Font.SystemCodingKeys);
    atomic_store(result, qword_257078158);
  }
  return result;
}

unint64_t sub_2409BE4B8()
{
  unint64_t result;

  result = qword_2570781E0;
  if (!qword_2570781E0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8D5C, &type metadata for StyleSheet.Font.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570781E0);
  }
  return result;
}

unint64_t sub_2409BE500()
{
  unint64_t result;

  result = qword_2570781E8[0];
  if (!qword_2570781E8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8D84, &type metadata for StyleSheet.Font.CodingKeys);
    atomic_store(result, qword_2570781E8);
  }
  return result;
}

unint64_t sub_2409BE548()
{
  unint64_t result;

  result = qword_257078270;
  if (!qword_257078270)
  {
    result = MEMORY[0x242685B78](&unk_2409C8A7C, &type metadata for StyleSheet.Font.Size.SpecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078270);
  }
  return result;
}

unint64_t sub_2409BE590()
{
  unint64_t result;

  result = qword_257078278;
  if (!qword_257078278)
  {
    result = MEMORY[0x242685B78](&unk_2409C8AA4, &type metadata for StyleSheet.Font.Size.SpecifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078278);
  }
  return result;
}

unint64_t sub_2409BE5D8()
{
  unint64_t result;

  result = qword_257078300;
  if (!qword_257078300)
  {
    result = MEMORY[0x242685B78](&unk_2409C89C4, &type metadata for StyleSheet.Font.Size.AbsoluteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078300);
  }
  return result;
}

unint64_t sub_2409BE620()
{
  unint64_t result;

  result = qword_257078308[0];
  if (!qword_257078308[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C89EC, &type metadata for StyleSheet.Font.Size.AbsoluteCodingKeys);
    atomic_store(result, qword_257078308);
  }
  return result;
}

unint64_t sub_2409BE668()
{
  unint64_t result;

  result = qword_257078390;
  if (!qword_257078390)
  {
    result = MEMORY[0x242685B78](&unk_2409C8B34, &type metadata for StyleSheet.Font.Size.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078390);
  }
  return result;
}

unint64_t sub_2409BE6B0()
{
  unint64_t result;

  result = qword_257078398[0];
  if (!qword_257078398[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8B5C, &type metadata for StyleSheet.Font.Size.CodingKeys);
    atomic_store(result, qword_257078398);
  }
  return result;
}

unint64_t sub_2409BE6F8()
{
  unint64_t result;

  result = qword_257078420;
  if (!qword_257078420)
  {
    result = MEMORY[0x242685B78](&unk_2409C890C, &type metadata for StyleSheet.Font.Specified.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078420);
  }
  return result;
}

unint64_t sub_2409BE740()
{
  unint64_t result;

  result = qword_257078428[0];
  if (!qword_257078428[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8934, &type metadata for StyleSheet.Font.Specified.CodingKeys);
    atomic_store(result, qword_257078428);
  }
  return result;
}

unint64_t sub_2409BE788()
{
  unint64_t result;

  result = qword_2570784B0;
  if (!qword_2570784B0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8854, &type metadata for StyleSheet.Color.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570784B0);
  }
  return result;
}

unint64_t sub_2409BE7D0()
{
  unint64_t result;

  result = qword_2570784B8[0];
  if (!qword_2570784B8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C887C, &type metadata for StyleSheet.Color.CodingKeys);
    atomic_store(result, qword_2570784B8);
  }
  return result;
}

unint64_t sub_2409BE818()
{
  unint64_t result;

  result = qword_257078540;
  if (!qword_257078540)
  {
    result = MEMORY[0x242685B78](&unk_2409C86E4, &type metadata for StyleSheet.Rule.QualifiedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078540);
  }
  return result;
}

unint64_t sub_2409BE860()
{
  unint64_t result;

  result = qword_257078548[0];
  if (!qword_257078548[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C870C, &type metadata for StyleSheet.Rule.QualifiedCodingKeys);
    atomic_store(result, qword_257078548);
  }
  return result;
}

unint64_t sub_2409BE8A8()
{
  unint64_t result;

  result = qword_2570785D0;
  if (!qword_2570785D0)
  {
    result = MEMORY[0x242685B78](&unk_2409C862C, &type metadata for StyleSheet.Rule.AtKeywordCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570785D0);
  }
  return result;
}

unint64_t sub_2409BE8F0()
{
  unint64_t result;

  result = qword_2570785D8[0];
  if (!qword_2570785D8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8654, &type metadata for StyleSheet.Rule.AtKeywordCodingKeys);
    atomic_store(result, qword_2570785D8);
  }
  return result;
}

unint64_t sub_2409BE938()
{
  unint64_t result;

  result = qword_257078660;
  if (!qword_257078660)
  {
    result = MEMORY[0x242685B78](&unk_2409C879C, &type metadata for StyleSheet.Rule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078660);
  }
  return result;
}

unint64_t sub_2409BE980()
{
  unint64_t result;

  result = qword_257078668[0];
  if (!qword_257078668[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C87C4, &type metadata for StyleSheet.Rule.CodingKeys);
    atomic_store(result, qword_257078668);
  }
  return result;
}

unint64_t sub_2409BE9C8()
{
  unint64_t result;

  result = qword_2570786F0;
  if (!qword_2570786F0)
  {
    result = MEMORY[0x242685B78](&unk_2409C84BC, &type metadata for StyleSheet.Rule.Declaration.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570786F0);
  }
  return result;
}

unint64_t sub_2409BEA10()
{
  unint64_t result;

  result = qword_2570786F8[0];
  if (!qword_2570786F8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C84E4, &type metadata for StyleSheet.Rule.Declaration.InvalidCodingKeys);
    atomic_store(result, qword_2570786F8);
  }
  return result;
}

unint64_t sub_2409BEA58()
{
  unint64_t result;

  result = qword_257078780;
  if (!qword_257078780)
  {
    result = MEMORY[0x242685B78](&unk_2409C8404, &type metadata for StyleSheet.Rule.Declaration.ColorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078780);
  }
  return result;
}

unint64_t sub_2409BEAA0()
{
  unint64_t result;

  result = qword_257078788[0];
  if (!qword_257078788[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C842C, &type metadata for StyleSheet.Rule.Declaration.ColorCodingKeys);
    atomic_store(result, qword_257078788);
  }
  return result;
}

unint64_t sub_2409BEAE8()
{
  unint64_t result;

  result = qword_257078810;
  if (!qword_257078810)
  {
    result = MEMORY[0x242685B78](&unk_2409C834C, &type metadata for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078810);
  }
  return result;
}

unint64_t sub_2409BEB30()
{
  unint64_t result;

  result = qword_257078818[0];
  if (!qword_257078818[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8374, &type metadata for StyleSheet.Rule.Declaration.BackgroundColorCodingKeys);
    atomic_store(result, qword_257078818);
  }
  return result;
}

unint64_t sub_2409BEB78()
{
  unint64_t result;

  result = qword_2570788A0;
  if (!qword_2570788A0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8294, &type metadata for StyleSheet.Rule.Declaration.TextAlignCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570788A0);
  }
  return result;
}

unint64_t sub_2409BEBC0()
{
  unint64_t result;

  result = qword_2570788A8[0];
  if (!qword_2570788A8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C82BC, &type metadata for StyleSheet.Rule.Declaration.TextAlignCodingKeys);
    atomic_store(result, qword_2570788A8);
  }
  return result;
}

unint64_t sub_2409BEC08()
{
  unint64_t result;

  result = qword_257078930;
  if (!qword_257078930)
  {
    result = MEMORY[0x242685B78](&unk_2409C81DC, &type metadata for StyleSheet.Rule.Declaration.FontCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078930);
  }
  return result;
}

unint64_t sub_2409BEC50()
{
  unint64_t result;

  result = qword_257078938[0];
  if (!qword_257078938[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8204, &type metadata for StyleSheet.Rule.Declaration.FontCodingKeys);
    atomic_store(result, qword_257078938);
  }
  return result;
}

unint64_t sub_2409BEC98()
{
  unint64_t result;

  result = qword_2570789C0;
  if (!qword_2570789C0)
  {
    result = MEMORY[0x242685B78](&unk_2409C8124, &type metadata for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570789C0);
  }
  return result;
}

unint64_t sub_2409BECE0()
{
  unint64_t result;

  result = qword_2570789C8[0];
  if (!qword_2570789C8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C814C, &type metadata for StyleSheet.Rule.Declaration.BackgroundImageCodingKeys);
    atomic_store(result, qword_2570789C8);
  }
  return result;
}

unint64_t sub_2409BED28()
{
  unint64_t result;

  result = qword_257078A50;
  if (!qword_257078A50)
  {
    result = MEMORY[0x242685B78](&unk_2409C8574, &type metadata for StyleSheet.Rule.Declaration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078A50);
  }
  return result;
}

unint64_t sub_2409BED70()
{
  unint64_t result;

  result = qword_257078A58[0];
  if (!qword_257078A58[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C859C, &type metadata for StyleSheet.Rule.Declaration.CodingKeys);
    atomic_store(result, qword_257078A58);
  }
  return result;
}

unint64_t sub_2409BEDB8()
{
  unint64_t result;

  result = qword_257078AE0;
  if (!qword_257078AE0)
  {
    result = MEMORY[0x242685B78](&unk_2409C806C, &type metadata for StyleSheet.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257078AE0);
  }
  return result;
}

unint64_t sub_2409BEE00()
{
  unint64_t result;

  result = qword_257078AE8[0];
  if (!qword_257078AE8[0])
  {
    result = MEMORY[0x242685B78](&unk_2409C8094, &type metadata for StyleSheet.CodingKeys);
    atomic_store(result, qword_257078AE8);
  }
  return result;
}

uint64_t sub_2409BEE44(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x64696C61766E69 && a2 == 0xE700000000000000;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6C6F63 && a2 == 0xE500000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x67696C4174786574 && a2 == 0xE90000000000006ELL || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1953394534 && a2 == 0xE400000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEF6567616D49646ELL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2409BF0F8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x79747265706F7270 && a2 == 0xE800000000000000;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2409BF1E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6564756C657270 && a2 == 0xE700000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746172616C636564 && a2 == 0xEC000000736E6F69)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2409BF358(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656966696C617571 && a2 == 0xE900000000000064;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7779654B7461 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2409BF460(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x726F7463656C6573 && a2 == 0xE800000000000000;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746172616C636564 && a2 == 0xEC000000736E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2409BF568(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2409BF694(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1702521203 && a2 == 0xE400000000000000;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746867696577 && a2 == 0xE600000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E6169726176 && a2 == 0xE700000000000000 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x796C696D6166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_2409BF888(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6569666963657073 && a2 == 0xE900000000000064;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574756C6F736261 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2409BF984(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2409BFA5C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6569666963657073 && a2 == 0xE900000000000064;
  if (v2 || (sub_2409C6144() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6574737973 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2409C6144();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2409BFB60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_2409A4D64(v2, v3, v4);
}

uint64_t sub_2409BFB7C()
{
  return swift_bridgeObjectRetain();
}

__n128 sub_2409BFB84@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  __n128 result;

  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v3;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a3 + 32) = result;
  *(_QWORD *)(a3 + 48) = a2;
  return result;
}

uint64_t sub_2409BFB9C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

__n128 sub_2409BFBA4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  __int128 v4;
  __n128 result;

  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v4;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a4 + 32) = result;
  *(_QWORD *)(a4 + 48) = a2;
  *(_BYTE *)(a4 + 56) = a3;
  return result;
}

ValueMetadata *_s4NodeOMa()
{
  return &_s4NodeON;
}

uint64_t *_s4NodeO5BlockVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  sub_2409A4D64(*a2, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *_s4NodeO5BlockVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  sub_2409A4D64(*a2, v5, v6);
  v10 = *a1;
  v11 = a1[1];
  v12 = a1[2];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  sub_2409A442C(v10, v11, v12);
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s4NodeO5BlockVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_2409A442C(v4, v5, v6);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s4NodeO5BlockVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 2 * -a2;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 40) = 0;
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s4NodeO5BlockVMa()
{
  return &_s4NodeO5BlockVN;
}

uint64_t _s4NodeO14ComponentValueOwxx(uint64_t a1)
{
  return sub_2409AC728(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t *_s4NodeO14ComponentValueOwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  sub_2409AC6D0(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  return a1;
}

uint64_t *_s4NodeO14ComponentValueOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  sub_2409AC6D0(*a2, v4, v5);
  v10 = *a1;
  v11 = a1[1];
  v12 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  sub_2409AC728(v10, v11, v12);
  return a1;
}

uint64_t _s4NodeO14ComponentValueOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;

  v3 = *(_QWORD *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v3;
  sub_2409AC728(v4, v6, v5);
  return a1;
}

uint64_t _s4NodeO14ComponentValueOwet_0(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

double _s4NodeO14ComponentValueOwst(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 2 * -a2;
      result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      return result;
    }
    *(_BYTE *)(a1 + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2409BFFE4(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 16) >> 58) & 3;
}

uint64_t sub_2409BFFF0(uint64_t result)
{
  *(_QWORD *)(result + 16) &= 0xF3FFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_2409C0000(uint64_t result, char a2)
{
  *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0xF000000000000001 | ((unint64_t)(a2 & 3) << 58);
  return result;
}

ValueMetadata *_s4NodeO14ComponentValueOMa()
{
  return &_s4NodeO14ComponentValueON;
}

uint64_t sub_2409C0028(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if ((a15 & 1) != 0)
  {
    sub_2409A4D64(a1, a2, a3);
    swift_bridgeObjectRetain();
    return sub_2409C0128(a8, a9, a10);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2409A4D64(a2, a3, a4);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2409C0128(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF)
  {
    sub_2409A4D64(result, a2, a3);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s4NodeO4RuleOwxx(uint64_t a1)
{
  return sub_2409C01A4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_BYTE *)(a1 + 112));
}

uint64_t sub_2409C01A4(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if ((a15 & 1) != 0)
  {
    sub_2409A442C(a1, a2, a3);
    swift_bridgeObjectRelease();
    return sub_2409C02A4(a8, a9, a10);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2409A442C(a2, a3, a4);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2409C02A4(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF)
  {
    sub_2409A442C(result, a2, a3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s4NodeO4RuleOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_BYTE *)(a2 + 112);
  sub_2409C0028(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_BYTE *)(a1 + 112) = v18;
  return a1;
}

uint64_t _s4NodeO4RuleOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v26 = *(_QWORD *)(a2 + 72);
  v27 = *(_QWORD *)(a2 + 80);
  v28 = *(_QWORD *)(a2 + 88);
  v29 = *(_QWORD *)(a2 + 96);
  v30 = *(_QWORD *)(a2 + 104);
  v31 = *(_BYTE *)(a2 + 112);
  sub_2409C0028(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 96);
  v23 = *(_QWORD *)(a1 + 104);
  v24 = *(_BYTE *)(a1 + 112);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v26;
  *(_QWORD *)(a1 + 80) = v27;
  *(_QWORD *)(a1 + 88) = v28;
  *(_QWORD *)(a1 + 96) = v29;
  *(_QWORD *)(a1 + 104) = v30;
  *(_BYTE *)(a1 + 112) = v31;
  sub_2409C01A4(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((unint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, v23, v24);
  return a1;
}

__n128 __swift_memcpy113_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_BYTE *)(a1 + 112) = *((_BYTE *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t _s4NodeO4RuleOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = *(_BYTE *)(a2 + 112);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 104);
  v16 = *(_BYTE *)(a1 + 112);
  v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v17;
  v18 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v18;
  v19 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v19;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 112) = v3;
  sub_2409C01A4(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((unint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, v15, v16);
  return a1;
}

uint64_t _s4NodeO4RuleOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 113))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 112);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s4NodeO4RuleOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 112) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 113) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 113) = 0;
    if (a2)
      *(_BYTE *)(result + 112) = -(char)a2;
  }
  return result;
}

uint64_t sub_2409C0638(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 112);
}

uint64_t sub_2409C0640(uint64_t result, char a2)
{
  *(_BYTE *)(result + 112) = a2 & 1;
  return result;
}

ValueMetadata *_s4NodeO4RuleOMa()
{
  return &_s4NodeO4RuleON;
}

uint64_t _s4NodeO5BlockVwxx_0(uint64_t a1)
{
  sub_2409A442C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return swift_bridgeObjectRelease();
}

uint64_t _s4NodeO11DeclarationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  sub_2409A4D64(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s4NodeO11DeclarationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  sub_2409A4D64(*(_QWORD *)a2, v5, v6);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  sub_2409A442C(v10, v11, v12);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s4NodeO11DeclarationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_2409A442C(v4, v5, v6);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t _s4NodeO11DeclarationVwet(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t _s4NodeO11DeclarationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 2 * -a2;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 40) = 0;
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s4NodeO11DeclarationVMa()
{
  return &_s4NodeO11DeclarationVN;
}

uint64_t sub_2409C08FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      break;
    case 2:
    case 3:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for StyleSheetError(uint64_t a1)
{
  return sub_2409C097C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_2409C097C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      break;
    case 2:
    case 3:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for StyleSheetError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_2409C08FC(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for StyleSheetError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_2409C08FC(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_2409C097C(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for StyleSheetError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_2409C097C(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for StyleSheetError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StyleSheetError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_2409C0B90(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_2409C0BA8(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StyleSheetError()
{
  return &type metadata for StyleSheetError;
}

_QWORD *sub_2409C0BD4(uint64_t a1, char a2)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unsigned __int8 v14;
  uint64_t v15;
  unsigned __int8 v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unsigned __int8 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  char v31;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  unsigned __int8 v64;

  sub_2409A4214((uint64_t *)&v57);
  v3 = v58;
  if ((unint64_t)v58 >> 1 != 0xFFFFFFFF)
  {
    v6 = 0;
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v7 = *((_QWORD *)&v59 + 1);
    v8 = v59;
    v9 = *((_QWORD *)&v58 + 1);
    v10 = *((_QWORD *)&v57 + 1);
    while (1)
    {
      v11 = v57;
      if (v3 >> 60 == 2)
        break;
      if (v3 >> 60 == 10)
      {
        v12 = v9 | v10 | v8;
        if (!v7 && v3 == 0xA000000000000000 && (_QWORD)v57 == 9 && !v12)
          goto LABEL_7;
        if (!v7 && v3 == 0xA000000000000000 && (_QWORD)v57 == 10 && !v12
          || !v7 && v3 == 0xA000000000000000 && (_QWORD)v57 == 11 && !v12)
        {
          if ((a2 & 1) == 0)
          {
            v13 = v4;
            sub_2409A4494();
            sub_2409C17E4(a1, (uint64_t)&v57);
            v14 = v64;
            if (v64 == 255)
            {
              v4 = v13;
            }
            else
            {
              v54 = v58;
              v56 = v57;
              v50 = v60;
              v52 = v59;
              v46 = v62;
              v48 = v61;
              v44 = v63;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v13 = sub_2409C3C94(0, v13[2] + 1, 1, v13);
              v29 = v13[2];
              v28 = v13[3];
              if (v29 >= v28 >> 1)
                v13 = sub_2409C3C94((_QWORD *)(v28 > 1), v29 + 1, 1, v13);
              v13[2] = v29 + 1;
              v30 = &v13[15 * v29];
              *((_OWORD *)v30 + 2) = v56;
              *((_OWORD *)v30 + 3) = v54;
              *((_OWORD *)v30 + 4) = v52;
              *((_OWORD *)v30 + 5) = v50;
              *((_OWORD *)v30 + 6) = v48;
              *((_OWORD *)v30 + 7) = v46;
              *((_OWORD *)v30 + 8) = v44;
              v31 = v14 & 1;
              v4 = v13;
              *((_BYTE *)v30 + 144) = v31;
            }
          }
          goto LABEL_7;
        }
      }
      v55 = v6;
      v15 = v57;
      sub_2409A4494();
      sub_2409C17E4(a1, (uint64_t)&v57);
      v16 = v64;
      if (v64 != 255)
      {
        v51 = v58;
        v53 = v57;
        v47 = v60;
        v49 = v59;
        v42 = v62;
        v45 = v61;
        v40 = v63;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_2409C3C94(0, v4[2] + 1, 1, v4);
        v18 = v4[2];
        v17 = v4[3];
        v19 = v4;
        if (v18 >= v17 >> 1)
          v19 = sub_2409C3C94((_QWORD *)(v17 > 1), v18 + 1, 1, v4);
        v19[2] = v18 + 1;
        v4 = v19;
        v20 = &v19[15 * v18];
        *((_OWORD *)v20 + 2) = v53;
        *((_OWORD *)v20 + 3) = v51;
        *((_OWORD *)v20 + 4) = v49;
        *((_OWORD *)v20 + 5) = v47;
        *((_OWORD *)v20 + 6) = v45;
        *((_OWORD *)v20 + 7) = v42;
        *((_OWORD *)v20 + 8) = v40;
        v21 = v16 & 1;
LABEL_36:
        *((_BYTE *)v20 + 144) = v21;
        sub_2409A8454(v15, v10, v3);
        goto LABEL_6;
      }
      sub_2409A8454(v15, v10, v3);
LABEL_6:
      v6 = v55;
LABEL_7:
      sub_2409A4214((uint64_t *)&v57);
      v10 = *((_QWORD *)&v57 + 1);
      v9 = *((_QWORD *)&v58 + 1);
      v3 = v58;
      v7 = *((_QWORD *)&v59 + 1);
      v8 = v59;
      if ((unint64_t)v58 >> 1 == 0xFFFFFFFF)
        return v4;
    }
    sub_2409A4494();
    sub_2409C1098(a1, (uint64_t)&v57);
    v55 = 0;
    v15 = v11;
    v22 = v57;
    v23 = v58;
    v24 = v59;
    v43 = v60;
    v39 = v61;
    v41 = *((_QWORD *)&v60 + 1);
    v37 = v62;
    v38 = *((_QWORD *)&v61 + 1);
    v35 = v63;
    v36 = *((_QWORD *)&v62 + 1);
    v34 = *((_QWORD *)&v63 + 1);
    v33 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v4 = sub_2409C3C94(0, v4[2] + 1, 1, v4);
    v26 = v4[2];
    v25 = v4[3];
    v27 = v4;
    if (v26 >= v25 >> 1)
      v27 = sub_2409C3C94((_QWORD *)(v25 > 1), v26 + 1, 1, v4);
    v27[2] = v26 + 1;
    v4 = v27;
    v20 = &v27[15 * v26];
    *((_OWORD *)v20 + 2) = v22;
    *((_OWORD *)v20 + 3) = v23;
    *((_OWORD *)v20 + 4) = v24;
    v20[10] = v43;
    v20[11] = v41;
    v20[12] = v39;
    v20[13] = v38;
    v20[14] = v37;
    v20[15] = v36;
    v20[16] = v35;
    v20[17] = v34;
    v21 = v33;
    goto LABEL_36;
  }
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

uint64_t sub_2409C1098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  unsigned __int128 v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  unsigned __int128 v61;
  unint64_t v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  _BYTE v66[32];
  uint64_t v67;
  __int128 v68;
  unint64_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;

  sub_2409A4214((uint64_t *)&v65);
  if (*(_QWORD *)v66 >> 1 == 0xFFFFFFFFLL)
  {
    sub_2409AB4E8();
    swift_allocError();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_BYTE *)(v4 + 32) = 4;
    return swift_willThrow();
  }
  else
  {
    v6 = v65;
    v7 = *(_QWORD *)&v66[8];
    v51 = *(_QWORD *)&v66[16];
    v52 = *(_QWORD *)v66;
    v53 = *(_QWORD *)&v66[24];
    result = sub_2409A4214((uint64_t *)&v65);
    v8 = *(_QWORD *)v66;
    v50 = v7;
    v49 = a2;
    if (*(_QWORD *)v66 >> 1 == 0xFFFFFFFFLL)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_38:
      *(_OWORD *)v49 = v6;
      *(_QWORD *)(v49 + 16) = v52;
      *(_QWORD *)(v49 + 24) = v50;
      *(_QWORD *)(v49 + 32) = v51;
      *(_QWORD *)(v49 + 40) = v53;
      *(_QWORD *)(v49 + 48) = v9;
      *(_QWORD *)(v49 + 56) = 0;
      *(_QWORD *)(v49 + 64) = 0;
      *(_QWORD *)(v49 + 72) = 0x1FFFFFFFELL;
      *(_OWORD *)(v49 + 80) = 0u;
      *(_OWORD *)(v49 + 96) = 0u;
      *(_BYTE *)(v49 + 112) = 1;
    }
    else
    {
      v10 = *(_QWORD *)&v66[16];
      v11 = *(_QWORD *)&v66[24];
      v12 = *(_QWORD *)&v66[8];
      v13 = *((_QWORD *)&v65 + 1);
      sub_2409C3DB4();
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = a1;
      v56 = a1;
      while (1)
      {
        v15 = v65;
        *((_QWORD *)&v65 + 1) = v13;
        *(_QWORD *)v66 = v8;
        *(_QWORD *)&v66[8] = v12;
        *(_QWORD *)&v66[16] = v10;
        *(_QWORD *)&v66[24] = v11;
        v68 = xmmword_2409C6B70;
        v69 = 0xA000000000000000;
        v71 = 0;
        v70 = 0uLL;
        if ((sub_2409C5D18() & 1) != 0)
        {
          result = sub_2409A8454(v15, v13, v8);
          goto LABEL_38;
        }
        if (v8 >> 60 == 10 && v15 == 19 && !v13 && v8 == 0xA000000000000000 && !(v10 | v12 | v11))
          break;
        v72 = v15;
        sub_2409A4494();
        sub_2409A4214((uint64_t *)&v65);
        v16 = *(_QWORD *)v66;
        if (*(_QWORD *)v66 >> 1 == 0xFFFFFFFFLL)
        {
          sub_2409AB4E8();
          swift_allocError();
          *(_OWORD *)v34 = 0u;
          *(_OWORD *)(v34 + 16) = 0u;
          *(_BYTE *)(v34 + 32) = 4;
          swift_willThrow();
          sub_2409A8454(v6, *((uint64_t *)&v6 + 1), v52);
          v35 = v72;
          v36 = v13;
          v37 = v8;
LABEL_43:
          sub_2409A8454(v35, v36, v37);
          return swift_bridgeObjectRelease();
        }
        v17 = v65;
        v18 = *(_QWORD *)&v66[24];
        v57 = v13;
        v60 = v65;
        if (*(_QWORD *)v66 >> 60 == 1)
        {
          v68 = v65;
          v69 = *(_QWORD *)v66;
          v70 = *(_OWORD *)&v66[8];
          v71 = *(_QWORD *)&v66[24];
          v61 = xmmword_2409C6AF0;
          v62 = 0xA000000000000000;
          v64 = 0;
          v63 = 0uLL;
          sub_2409C3674(v14, (uint64_t *)&v68, (uint64_t *)&v61, (uint64_t)&v65);
          sub_2409A8454(v60, *((uint64_t *)&v60 + 1), v16);
          v58 = *(_OWORD *)&v66[8];
          v60 = v65;
          v18 = *(_QWORD *)&v66[24];
          v20 = v67;
          v16 = *(_QWORD *)v66 | 0x800000000000000;
        }
        else if (*(_QWORD *)v66 >> 60 == 10)
        {
          v19 = *(_QWORD *)&v66[8] | *((_QWORD *)&v65 + 1) | *(_QWORD *)&v66[16];
          if (!*(_QWORD *)&v66[24] && *(_QWORD *)v66 == 0xA000000000000000 && (_QWORD)v65 == 15 && !v19
            || !*(_QWORD *)&v66[24] && *(_QWORD *)v66 == 0xA000000000000000 && (_QWORD)v65 == 17 && !v19
            || (v20 = 0, v58 = *(_OWORD *)&v66[8], !*(_QWORD *)&v66[24])
            && *(_QWORD *)v66 == 0xA000000000000000
            && (_QWORD)v65 == 19
            && (v17 = v65, !v19))
          {
            v55 = v65;
            v61 = v17;
            v62 = 0xA000000000000000;
            v63 = *(_OWORD *)&v66[8];
            v64 = 0;
            v59 = *(_QWORD *)&v66[8];
            v21 = *(_QWORD *)&v66[16];
            sub_2409B0128((uint64_t *)&v68);
            v22 = v69;
            if (v69 >> 1 == 0xFFFFFFFF)
            {
              sub_2409AB4E8();
              swift_allocError();
              *(_QWORD *)v40 = sub_2409C3B04;
              *(_QWORD *)(v40 + 8) = 0;
              *(_QWORD *)(v40 + 16) = 0;
              *(_QWORD *)(v40 + 24) = 0;
              *(_BYTE *)(v40 + 32) = 3;
              swift_willThrow();
              sub_2409A8454(v55, *((uint64_t *)&v55 + 1), 0xA000000000000000);
              sub_2409A8454(v6, *((uint64_t *)&v6 + 1), v52);
              v35 = v72;
              v36 = v13;
              v37 = v8;
              goto LABEL_43;
            }
            v54 = v9;
            v24 = *((_QWORD *)&v70 + 1);
            v23 = v71;
            v25 = v70;
            v26 = *((_QWORD *)&v68 + 1);
            v27 = v68;
            v68 = v60;
            v69 = 0xA000000000000000;
            *(_QWORD *)&v70 = v59;
            *((_QWORD *)&v70 + 1) = v21;
            v71 = 0;
            v61 = __PAIR128__(v26, v27);
            v62 = v22;
            *(_QWORD *)&v63 = v25;
            *((_QWORD *)&v63 + 1) = v24;
            v64 = v23;
            sub_2409C3674(v56, (uint64_t *)&v68, (uint64_t *)&v61, (uint64_t)&v65);
            v9 = v54;
            sub_2409A8454(v27, v26, v22);
            sub_2409A8454(v55, *((uint64_t *)&v55 + 1), 0xA000000000000000);
            v58 = *(_OWORD *)&v66[8];
            v60 = v65;
            v18 = *(_QWORD *)&v66[24];
            v20 = v67;
            v16 = *(_QWORD *)v66 | 0x400000000000000;
          }
        }
        else
        {
          v58 = *(_OWORD *)&v66[8];
          v20 = 0;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = sub_2409C3B6C(0, v9[2] + 1, 1, v9);
        v29 = v9[2];
        v28 = v9[3];
        v31 = v58;
        v30 = v60;
        if (v29 >= v28 >> 1)
        {
          v33 = sub_2409C3B6C((_QWORD *)(v28 > 1), v29 + 1, 1, v9);
          v31 = v58;
          v30 = v60;
          v9 = v33;
        }
        v9[2] = v29 + 1;
        v32 = &v9[7 * v29];
        *((_OWORD *)v32 + 2) = v30;
        v32[6] = v16;
        *(_OWORD *)(v32 + 7) = v31;
        v32[9] = v18;
        v32[10] = v20;
        sub_2409A8454(v72, v57, v8);
        v14 = v56;
        result = sub_2409A4214((uint64_t *)&v65);
        v13 = *((_QWORD *)&v65 + 1);
        v12 = *(_QWORD *)&v66[8];
        v8 = *(_QWORD *)v66;
        v10 = *(_QWORD *)&v66[16];
        v11 = *(_QWORD *)&v66[24];
        if (*(_QWORD *)v66 >> 1 == 0xFFFFFFFFLL)
          goto LABEL_38;
      }
      v61 = xmmword_2409C6BC0;
      v62 = 0xA000000000000000;
      *(_QWORD *)&v63 = v12;
      *((_QWORD *)&v63 + 1) = v10;
      v64 = v11;
      sub_2409B0128((uint64_t *)&v68);
      v38 = v69;
      if (v69 >> 1 == 0xFFFFFFFF)
      {
        sub_2409AB4E8();
        swift_allocError();
        *(_QWORD *)v39 = sub_2409C3B04;
        *(_QWORD *)(v39 + 8) = 0;
        *(_QWORD *)(v39 + 16) = 0;
        *(_QWORD *)(v39 + 24) = 0;
        *(_BYTE *)(v39 + 32) = 3;
        swift_willThrow();
        v36 = v6 >> 64;
        v35 = v6;
        v37 = v52;
        goto LABEL_43;
      }
      v42 = *((_QWORD *)&v70 + 1);
      v41 = v71;
      v43 = v70;
      v44 = v68;
      v68 = xmmword_2409C6BC0;
      v69 = 0xA000000000000000;
      *(_QWORD *)&v70 = v12;
      *((_QWORD *)&v70 + 1) = v10;
      v71 = v11;
      v61 = v44;
      v62 = v38;
      *(_QWORD *)&v63 = v43;
      *((_QWORD *)&v63 + 1) = v42;
      v64 = v41;
      sub_2409C3674(v56, (uint64_t *)&v68, (uint64_t *)&v61, (uint64_t)&v65);
      result = sub_2409A8454(v44, *((uint64_t *)&v44 + 1), v38);
      v45 = v67;
      v46 = v65;
      v47 = *(_OWORD *)v66;
      v48 = *(_OWORD *)&v66[16];
      *(_OWORD *)v49 = v6;
      *(_QWORD *)(v49 + 16) = v52;
      *(_QWORD *)(v49 + 24) = v50;
      *(_QWORD *)(v49 + 32) = v51;
      *(_QWORD *)(v49 + 40) = v53;
      *(_QWORD *)(v49 + 48) = v9;
      *(_OWORD *)(v49 + 56) = v46;
      *(_OWORD *)(v49 + 72) = v47;
      *(_OWORD *)(v49 + 88) = v48;
      *(_QWORD *)(v49 + 104) = v45;
      *(_BYTE *)(v49 + 112) = 1;
    }
  }
  return result;
}

double sub_2409C17E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  BOOL v17;
  unint64_t v19;
  unsigned __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  unint64_t v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  double result;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  unsigned __int128 v72;
  unint64_t v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  unint64_t v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  _BYTE v81[32];
  uint64_t v82;

  v58 = a2;
  v57 = sub_2409C5CC4();
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v55 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = a1;
  sub_2409A4214((uint64_t *)&v80);
  v4 = *(_QWORD *)v81;
  if (*(_QWORD *)v81 >> 1 == 0xFFFFFFFFLL)
  {
LABEL_2:
    swift_bridgeObjectRelease();
    v5 = sub_2409C5838();
    v6 = v56;
    v7 = v55;
    v8 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v55, v5, v57);
    v9 = sub_2409C5CAC();
    v10 = sub_2409C5EE0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2409A2000, v9, v10, "Reached unexpected EOF while consuming qualified rule", v11, 2u);
      MEMORY[0x242685BD8](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v7, v8);
  }
  else
  {
    v12 = *(_QWORD *)&v81[16];
    v69 = *(_QWORD *)&v81[24];
    v13 = *(_QWORD *)&v81[8];
    v14 = *((_QWORD *)&v80 + 1);
    v60 = &v74;
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v59 = xmmword_2409C6AF0;
    while (1)
    {
      if (v4 >> 60 == 10)
      {
        v16 = (_QWORD)v80 == 19 && v14 == 0;
        v17 = v16 && v4 == 0xA000000000000000;
        if (v17 && (v12 | v13 | v69) == 0)
          break;
      }
      v68 = v80;
      sub_2409A4494();
      sub_2409A4214((uint64_t *)&v80);
      v19 = *(_QWORD *)v81;
      if (*(_QWORD *)v81 >> 1 == 0xFFFFFFFFLL)
      {
        v39 = v68;
        v40 = v14;
        v41 = v4;
LABEL_46:
        sub_2409A8454(v39, v40, v41);
        goto LABEL_47;
      }
      v65 = v14;
      v20 = v80;
      v21 = *(_QWORD *)&v81[24];
      v64 = v12;
      v66 = v13;
      v71 = v80;
      if (*(_QWORD *)v81 >> 60 == 1)
      {
        v76 = v80;
        v77 = *(_QWORD *)v81;
        v78 = *(_OWORD *)&v81[8];
        v79 = *(_QWORD *)&v81[24];
        v72 = v59;
        v73 = 0xA000000000000000;
        v32 = v60;
        *((_QWORD *)v60 + 1) = 0;
        *((_QWORD *)v32 + 2) = 0;
        *(_QWORD *)v32 = 0;
        sub_2409C3674(v70, (uint64_t *)&v76, (uint64_t *)&v72, (uint64_t)&v80);
        sub_2409A8454(v71, *((uint64_t *)&v71 + 1), v19);
        v71 = v80;
        v67 = *(_OWORD *)&v81[8];
        v21 = *(_QWORD *)&v81[24];
        v25 = v82;
        v19 = *(_QWORD *)v81 | 0x800000000000000;
      }
      else if (*(_QWORD *)v81 >> 60 == 10)
      {
        v22 = *((_QWORD *)&v80 + 1);
        v23 = *(_OWORD *)&v81[8];
        v24 = *(_QWORD *)&v81[8] | *((_QWORD *)&v80 + 1) | *(_QWORD *)&v81[16];
        if (!*(_QWORD *)&v81[24] && *(_QWORD *)v81 == 0xA000000000000000 && (_QWORD)v80 == 15 && !v24
          || !*(_QWORD *)&v81[24] && *(_QWORD *)v81 == 0xA000000000000000 && (_QWORD)v80 == 17 && !v24
          || (v25 = 0, v67 = *(_OWORD *)&v81[8], !*(_QWORD *)&v81[24])
          && *(_QWORD *)v81 == 0xA000000000000000
          && (_QWORD)v80 == 19
          && (v20 = v71, !v24))
        {
          *(_QWORD *)&v67 = v80;
          v72 = v20;
          v73 = 0xA000000000000000;
          v74 = *(_OWORD *)&v81[8];
          v75 = 0;
          sub_2409B0128((uint64_t *)&v76);
          v26 = v77;
          if (v77 >> 1 == 0xFFFFFFFF)
          {
            sub_2409A8454(v67, v22, 0xA000000000000000);
            v39 = v68;
            v40 = v65;
            v41 = v4;
            goto LABEL_46;
          }
          v63 = v15;
          v62 = v22;
          v28 = *((_QWORD *)&v78 + 1);
          v27 = v79;
          v61 = v23;
          v29 = v78;
          v30 = *((_QWORD *)&v76 + 1);
          v31 = v76;
          v76 = v71;
          v77 = 0xA000000000000000;
          v78 = v23;
          v79 = 0;
          v72 = __PAIR128__(v30, v31);
          v73 = v26;
          *(_QWORD *)&v74 = v29;
          *((_QWORD *)&v74 + 1) = v28;
          v75 = v27;
          sub_2409C3674(v70, (uint64_t *)&v76, (uint64_t *)&v72, (uint64_t)&v80);
          v15 = v63;
          sub_2409A8454(v31, v30, v26);
          sub_2409A8454(v67, v62, 0xA000000000000000);
          v71 = v80;
          v67 = *(_OWORD *)&v81[8];
          v21 = *(_QWORD *)&v81[24];
          v25 = v82;
          v19 = *(_QWORD *)v81 | 0x400000000000000;
        }
      }
      else
      {
        v67 = *(_OWORD *)&v81[8];
        v25 = 0;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v15 = sub_2409C3B6C(0, v15[2] + 1, 1, v15);
      v34 = v15[2];
      v33 = v15[3];
      v35 = v71;
      v36 = v67;
      if (v34 >= v33 >> 1)
      {
        v38 = sub_2409C3B6C((_QWORD *)(v33 > 1), v34 + 1, 1, v15);
        v36 = v67;
        v35 = v71;
        v15 = v38;
      }
      v15[2] = v34 + 1;
      v37 = &v15[7 * v34];
      *((_OWORD *)v37 + 2) = v35;
      v37[6] = v19;
      *(_OWORD *)(v37 + 7) = v36;
      v37[9] = v21;
      v37[10] = v25;
      sub_2409A8454(v68, v65, v4);
      sub_2409A4214((uint64_t *)&v80);
      v14 = *((_QWORD *)&v80 + 1);
      v13 = *(_QWORD *)&v81[8];
      v4 = *(_QWORD *)v81;
      v12 = *(_QWORD *)&v81[16];
      v69 = *(_QWORD *)&v81[24];
      if (*(_QWORD *)v81 >> 1 == 0xFFFFFFFFLL)
        goto LABEL_2;
    }
    v71 = xmmword_2409C6BC0;
    v72 = xmmword_2409C6BC0;
    v73 = 0xA000000000000000;
    *(_QWORD *)&v74 = v13;
    *((_QWORD *)&v74 + 1) = v12;
    v75 = v69;
    sub_2409B0128((uint64_t *)&v76);
    v42 = v77;
    if (v77 >> 1 != 0xFFFFFFFF)
    {
      v43 = v13;
      v45 = *((_QWORD *)&v78 + 1);
      v44 = v79;
      v46 = v78;
      v47 = v76;
      v76 = v71;
      v77 = 0xA000000000000000;
      *(_QWORD *)&v78 = v43;
      *((_QWORD *)&v78 + 1) = v12;
      v79 = v69;
      v72 = v47;
      v73 = v42;
      *(_QWORD *)&v74 = v46;
      *((_QWORD *)&v74 + 1) = v45;
      v75 = v44;
      sub_2409C3674(v70, (uint64_t *)&v76, (uint64_t *)&v72, (uint64_t)&v80);
      sub_2409A8454(v47, *((uint64_t *)&v47 + 1), v42);
      v48 = v82;
      v49 = v80;
      v50 = *(_OWORD *)v81;
      v51 = *(_OWORD *)&v81[16];
      v52 = v58;
      *(_QWORD *)v58 = v15;
      *(_OWORD *)(v52 + 8) = v49;
      *(_OWORD *)(v52 + 24) = v50;
      *(_OWORD *)(v52 + 40) = v51;
      *(_QWORD *)(v52 + 56) = v48;
      result = 0.0;
      *(_OWORD *)(v52 + 64) = 0u;
      *(_OWORD *)(v52 + 80) = 0u;
      *(_OWORD *)(v52 + 96) = 0u;
      *(_BYTE *)(v52 + 112) = 0;
      return result;
    }
LABEL_47:
    swift_bridgeObjectRelease();
  }
  result = 0.0;
  v54 = v58;
  *(_OWORD *)(v58 + 80) = 0u;
  *(_OWORD *)(v54 + 96) = 0u;
  *(_OWORD *)(v54 + 48) = 0u;
  *(_OWORD *)(v54 + 64) = 0u;
  *(_OWORD *)(v54 + 16) = 0u;
  *(_OWORD *)(v54 + 32) = 0u;
  *(_OWORD *)v54 = 0u;
  *(_BYTE *)(v54 + 112) = -1;
  return result;
}

_QWORD *sub_2409C1EC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __int128 v5;
  unint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  __int128 v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int16 v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  __int128 v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  _QWORD *v85;
  uint64_t v86;
  __int128 v87;
  char *v88;
  _BYTE v89[24];
  __int128 v90;
  char *v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;

  v92 = sub_2409C5CC4();
  v2 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v4 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = a1;
  sub_2409A4214((uint64_t *)&v102);
  v6 = v103;
  if ((unint64_t)v103 >> 1 == 0xFFFFFFFF)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v91 = v4;
  v96 = v2;
  v83 = 0;
  v8 = *((_QWORD *)&v104 + 1);
  v9 = v104;
  v10 = *((_QWORD *)&v103 + 1);
  v11 = *((_QWORD *)&v102 + 1);
  v88 = (char *)&v102 + 8;
  *(_QWORD *)&v5 = 136315138;
  v87 = v5;
  v86 = MEMORY[0x24BEE4AD8] + 8;
  v101 = xmmword_2409C6AD0;
  v82 = xmmword_2409C6E80;
  v84 = xmmword_2409C6B70;
  v85 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v12 = v92;
  while (1)
  {
    v13 = v102;
    v14 = v6 >> 60;
    if (v6 >> 60 == 10)
    {
      v27 = v10 | v11 | v9;
      if (!v8 && v6 == 0xA000000000000000 && (_QWORD)v102 == 9 && v27 == 0)
        goto LABEL_26;
      if (!v8 && v6 == 0xA000000000000000 && (_QWORD)v102 == 13 && !v27)
        goto LABEL_26;
LABEL_8:
      v15 = sub_2409C5838();
      v16 = v91;
      (*(void (**)(char *, uint64_t, uint64_t))(v96 + 16))(v91, v15, v12);
      sub_2409A4D64(v13, v11, v6);
      sub_2409A4D64(v13, v11, v6);
      v17 = v8;
      v18 = sub_2409C5CAC();
      v19 = sub_2409C5EE0();
      *(_QWORD *)&v93 = v18;
      LODWORD(v90) = v19;
      v20 = os_log_type_enabled(v18, v19);
      v99 = v17;
      v98 = v9;
      v95 = v10;
      v100 = v11;
      v97 = v13;
      if (v20)
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_QWORD *)&v89[8] = swift_slowAlloc();
        *(_QWORD *)&v114 = *(_QWORD *)&v89[8];
        *(_DWORD *)v21 = v87;
        *(_QWORD *)v89 = v21 + 4;
        *(_QWORD *)&v102 = v13;
        *((_QWORD *)&v102 + 1) = v11;
        *(_QWORD *)&v103 = v6;
        *((_QWORD *)&v103 + 1) = v10;
        *(_QWORD *)&v104 = v9;
        *((_QWORD *)&v104 + 1) = v17;
        sub_2409A4D64(v13, v11, v6);
        v22 = sub_2409C5D24();
        *(_QWORD *)&v102 = sub_2409C3F04(v22, v23, (uint64_t *)&v114);
        sub_2409C5F40();
        swift_bridgeObjectRelease();
        sub_2409A8454(v13, v11, v6);
        v24 = v6;
        sub_2409A8454(v13, v11, v6);
        v25 = (void *)v93;
        _os_log_impl(&dword_2409A2000, (os_log_t)v93, (os_log_type_t)v90, "Could not parse token while consuming list of declarations: current token %s not of valid type.", v21, 0xCu);
        v26 = *(_QWORD *)&v89[8];
        swift_arrayDestroy();
        MEMORY[0x242685BD8](v26, -1, -1);
        MEMORY[0x242685BD8](v21, -1, -1);

        (*(void (**)(char *, uint64_t))(v96 + 8))(v91, v92);
      }
      else
      {
        sub_2409A8454(v13, v11, v6);
        v24 = v6;
        sub_2409A8454(v13, v11, v6);

        (*(void (**)(char *, uint64_t))(v96 + 8))(v16, v12);
      }
      v29 = v24;
      do
      {
        sub_2409A4214((uint64_t *)&v102);
        v30 = v103;
        if ((unint64_t)v103 >> 1 == 0xFFFFFFFF)
          break;
        v31 = *((_QWORD *)&v102 + 1);
        v32 = v102;
        v114 = v101;
        *(_QWORD *)&v115 = 0xA000000000000000;
        sub_2409C3DB4();
        v116 = 0;
        v117 = 0;
        *((_QWORD *)&v115 + 1) = 0;
        v33 = sub_2409C5D18();
        sub_2409A8454(v32, v31, v30);
      }
      while ((v33 & 1) == 0);
      sub_2409A8454(v97, v100, v29);
      v12 = v92;
      goto LABEL_26;
    }
    if ((_DWORD)v14)
      break;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073008);
    v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = v82;
    *(_QWORD *)(v49 + 32) = v13;
    *(_QWORD *)(v49 + 40) = v11;
    *(_QWORD *)(v49 + 48) = v6;
    *(_QWORD *)(v49 + 56) = v10;
    *(_QWORD *)(v49 + 64) = v9;
    *(_QWORD *)(v49 + 72) = v8;
    v50 = v49;
    v97 = v13;
    v95 = v10;
    v98 = v9;
    v99 = v8;
    sub_2409A4D64(v13, v11, v6);
    sub_2409A4214((uint64_t *)&v102);
    v51 = v103;
    *(_QWORD *)&v93 = v50;
    if ((unint64_t)v103 >> 1 != 0xFFFFFFFF)
    {
      v53 = *((_QWORD *)&v104 + 1);
      v52 = v104;
      v54 = *((_QWORD *)&v103 + 1);
      v55 = *((_QWORD *)&v102 + 1);
      *(_QWORD *)&v90 = sub_2409C3DB4();
      v100 = v11;
      while (1)
      {
        v56 = v102;
        *((_QWORD *)&v102 + 1) = v55;
        *(_QWORD *)&v103 = v51;
        *((_QWORD *)&v103 + 1) = v54;
        *(_QWORD *)&v104 = v52;
        *((_QWORD *)&v104 + 1) = v53;
        v114 = v84;
        v115 = 0xA000000000000000;
        v116 = 0;
        v117 = 0;
        if ((sub_2409C5D18() & 1) != 0)
          break;
        v57 = (char *)v93;
        v59 = *(_QWORD *)(v93 + 16);
        v58 = *(_QWORD *)(v93 + 24);
        if (v59 >= v58 >> 1)
          v57 = sub_2409A833C((char *)(v58 > 1), v59 + 1, 1, (char *)v93);
        *((_QWORD *)v57 + 2) = v59 + 1;
        *(_QWORD *)&v93 = v57;
        v60 = &v57[48 * v59];
        *((_QWORD *)v60 + 4) = v56;
        *((_QWORD *)v60 + 5) = v55;
        *((_QWORD *)v60 + 6) = v51;
        *((_QWORD *)v60 + 7) = v54;
        *((_QWORD *)v60 + 8) = v52;
        *((_QWORD *)v60 + 9) = v53;
        sub_2409A4214((uint64_t *)&v102);
        v55 = *((_QWORD *)&v102 + 1);
        v54 = *((_QWORD *)&v103 + 1);
        v51 = v103;
        v53 = *((_QWORD *)&v104 + 1);
        v52 = v104;
        v11 = v100;
        if ((unint64_t)v103 >> 1 == 0xFFFFFFFF)
          goto LABEL_46;
      }
      sub_2409A8454(v56, v55, v51);
    }
LABEL_46:
    nullsub_1(v93);
    v61 = sub_2409A44A0();
    v63 = v62;
    v65 = v64;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v114 = v61;
    *((_QWORD *)&v114 + 1) = v63;
    LOWORD(v115) = v65 & 0x101;
    v66 = v83;
    sub_2409C2B78(&v114, &v102);
    if (v66)
    {
      sub_2409A8454(v97, v11, v6);
      MEMORY[0x242685B0C](v66);
      swift_bridgeObjectRelease();
      v83 = 0;
      goto LABEL_48;
    }
    swift_bridgeObjectRelease();
    v83 = 0;
    if ((unint64_t)v103 >> 1 == 0xFFFFFFFF)
    {
      v46 = v97;
      v47 = v11;
      v48 = v6;
    }
    else
    {
      v93 = v103;
      v100 = v11;
      *(_OWORD *)&v89[8] = v102;
      v90 = v104;
      v67 = v105;
      v68 = v106;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v85 = sub_2409C3DF8(0, v85[2] + 1, 1, v85);
      v71 = v85[2];
      v70 = v85[3];
      v72 = v93;
      if (v71 >= v70 >> 1)
      {
        v75 = sub_2409C3DF8((_QWORD *)(v70 > 1), v71 + 1, 1, v85);
        v72 = v93;
        v85 = v75;
      }
      v73 = v85;
      v85[2] = v71 + 1;
      v74 = &v73[8 * v71];
      *((_OWORD *)v74 + 2) = *(_OWORD *)&v89[8];
      *((_OWORD *)v74 + 3) = v72;
      *((_OWORD *)v74 + 4) = v90;
      v74[10] = v67;
      *((_BYTE *)v74 + 88) = v68 & 1;
      v46 = v97;
      v47 = v100;
      v48 = v6;
    }
LABEL_37:
    sub_2409A8454(v46, v47, v48);
LABEL_48:
    v12 = v92;
LABEL_26:
    sub_2409A4214((uint64_t *)&v102);
    v11 = *((_QWORD *)&v102 + 1);
    v10 = *((_QWORD *)&v103 + 1);
    v6 = v103;
    v8 = *((_QWORD *)&v104 + 1);
    v9 = v104;
    if ((unint64_t)v103 >> 1 == 0xFFFFFFFF)
      return v85;
  }
  if ((_DWORD)v14 != 2)
    goto LABEL_8;
  v99 = v8;
  v34 = v83;
  sub_2409C1098(v94, (uint64_t)&v102);
  v83 = v34;
  if (v34)
  {
    MEMORY[0x242685B0C](v83);
    goto LABEL_59;
  }
  v35 = v102;
  *(_OWORD *)v89 = v103;
  *(_QWORD *)&v93 = *((_QWORD *)&v104 + 1);
  *(_QWORD *)&v90 = v104;
  v81 = v106;
  v36 = v108;
  v80 = v107;
  v79 = v109;
  v78 = v110;
  v37 = v112;
  v77 = v111;
  if (v113 == 1)
  {
    v97 = v13;
    v100 = v11;
    v98 = v9;
    swift_bridgeObjectRelease();
    v114 = v35;
    v115 = *(_OWORD *)v89;
    v38 = MEMORY[0x24BEE4AF8];
    v116 = v90;
    v117 = v93;
    if (v36 >> 1 != 0xFFFFFFFF)
    {
      swift_bridgeObjectRetain();
      sub_2409C02A4(v81, v80, v36);
      v38 = v37;
    }
    sub_2409BFBA4((uint64_t)&v114, v38, 0, (uint64_t)&v102);
    v39 = *((_QWORD *)&v102 + 1);
    *(_QWORD *)&v93 = v102;
    v40 = v103;
    v41 = v104;
    *(_QWORD *)&v90 = v105;
    *(_DWORD *)&v89[8] = v106;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v85 = sub_2409C3DF8(0, v85[2] + 1, 1, v85);
    v43 = v85[2];
    v42 = v85[3];
    if (v43 >= v42 >> 1)
      v85 = sub_2409C3DF8((_QWORD *)(v42 > 1), v43 + 1, 1, v85);
    v44 = v85;
    v85[2] = v43 + 1;
    v45 = &v44[8 * v43];
    v45[4] = v93;
    v45[5] = v39;
    *((_OWORD *)v45 + 3) = v40;
    *((_OWORD *)v45 + 4) = v41;
    v45[10] = v90;
    *((_BYTE *)v45 + 88) = v89[8];
    v46 = v97;
    v47 = v100;
    v48 = v6;
    goto LABEL_37;
  }
  sub_2409C01A4(v102, *((uint64_t *)&v102 + 1), *(unint64_t *)v89, *(unint64_t *)&v89[8], v90, v93, v105, v81, v80, v108, v79, v78, v77, v112, 0);
LABEL_59:
  result = (_QWORD *)sub_2409C603C();
  __break(1u);
  return result;
}

void sub_2409C2B78(NSObject *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  uint8_t *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  __int128 v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint8_t *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[32];
  uint64_t v56;
  char v57;
  __int128 v58;
  uint8_t *v59;
  uint64_t v60;
  __int128 v61;
  NSObject *v62;

  v5 = sub_2409C5CC4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2409A4214((uint64_t *)&v54);
  if (*(_QWORD *)v55 >> 1 == 0xFFFFFFFFLL)
  {
    sub_2409AB4E8();
    swift_allocError();
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_BYTE *)(v9 + 32) = 4;
    swift_willThrow();
    return;
  }
  v49 = *(uint8_t **)v55;
  v50 = v5;
  v51 = v8;
  v52 = v6;
  v44 = a2;
  v45 = v2;
  v46 = v54;
  v47 = *(_QWORD *)&v55[8];
  v48 = *(_OWORD *)&v55[16];
  sub_2409A4494();
  v53 = xmmword_2409C6AD0;
  v62 = a1;
  do
  {
    sub_2409A4214((uint64_t *)&v54);
    v10 = *(_QWORD *)v55;
    if (*(_QWORD *)v55 >> 1 == 0xFFFFFFFFLL)
      break;
    v11 = v54;
    v58 = v53;
    v59 = (uint8_t *)0xA000000000000000;
    v61 = 0uLL;
    v60 = 0;
    v12 = static Token.== infix(_:_:)(&v54, &v58);
    sub_2409A8454(v11, *((uint64_t *)&v11 + 1), v10);
  }
  while ((v12 & 1) != 0);
  sub_2409A4214((uint64_t *)&v54);
  v13 = v54;
  v14 = *(_OWORD *)v55;
  v15 = *(_OWORD *)&v55[16];
  if (*(_QWORD *)v55 >> 1 == 0xFFFFFFFFLL)
  {
    sub_2409A8454(v54, *((uint64_t *)&v54 + 1), *(unint64_t *)v55);
    sub_2409A8454(12, 0, 0xA000000000000000);
    sub_2409A8454(v46, *((uint64_t *)&v46 + 1), (unint64_t)v49);
    v16 = v50;
LABEL_13:
    v24 = sub_2409C5838();
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v51, v24, v16);
    sub_2409C44E0(v13, *((uint64_t *)&v13 + 1), v14);
    v25 = sub_2409C5CAC();
    v26 = sub_2409C5EE0();
    v62 = v25;
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_QWORD *)&v53 = swift_slowAlloc();
      *(_QWORD *)&v58 = v53;
      v49 = v27;
      *(_DWORD *)v27 = 136315138;
      *((_QWORD *)&v48 + 1) = v27 + 4;
      v54 = v13;
      *(_OWORD *)v55 = v14;
      *(_OWORD *)&v55[16] = v15;
      sub_2409C44E0(v13, *((uint64_t *)&v13 + 1), v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2570733F0);
      v28 = sub_2409C5D24();
      *(_QWORD *)&v54 = sub_2409C3F04(v28, v29, (uint64_t *)&v58);
      sub_2409C5F40();
      swift_bridgeObjectRelease();
      sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v14);
      sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v14);
      v30 = v62;
      v31 = v49;
      _os_log_impl(&dword_2409A2000, v62, v26, "Could not consume declaration: current token %s not a colon.", v49, 0xCu);
      v32 = v53;
      swift_arrayDestroy();
      MEMORY[0x242685BD8](v32, -1, -1);
      MEMORY[0x242685BD8](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v50);
    }
    else
    {
      sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v14);
      sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v14);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v16);
    }
    v33 = v44;
    *v44 = 0;
    v33[1] = 0;
    v33[2] = 0x1FFFFFFFELL;
    *(_OWORD *)(v33 + 3) = 0u;
    *(_OWORD *)(v33 + 5) = 0u;
    *((_BYTE *)v33 + 56) = 0;
    return;
  }
  v58 = xmmword_2409C6B60;
  v59 = (uint8_t *)0xA000000000000000;
  v60 = 0;
  v61 = 0uLL;
  sub_2409A4D64(v54, *((uint64_t *)&v54 + 1), *(unint64_t *)v55);
  sub_2409A4D64(v13, *((uint64_t *)&v13 + 1), v14);
  sub_2409C3DB4();
  v17 = sub_2409C5D18();
  sub_2409A442C(v54, *((uint64_t *)&v54 + 1), *(unint64_t *)v55);
  sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v14);
  v16 = v50;
  if ((v17 & 1) == 0)
  {
    sub_2409A8454(v46, *((uint64_t *)&v46 + 1), (unint64_t)v49);
    goto LABEL_13;
  }
  sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v14);
  sub_2409A4214((uint64_t *)&v54);
  v18 = *(_QWORD *)v55;
  if (*(_QWORD *)v55 >> 1 == 0xFFFFFFFFLL)
  {
    v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v34 = *(_QWORD *)&v55[24];
    v35 = *(_OWORD *)&v55[8];
    v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v36 = *((_QWORD *)&v54 + 1);
    do
    {
      v53 = v35;
      v37 = v54;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v19 = sub_2409C3B6C(0, v19[2] + 1, 1, v19);
      v39 = v19[2];
      v38 = v19[3];
      v40 = v53;
      if (v39 >= v38 >> 1)
      {
        v42 = sub_2409C3B6C((_QWORD *)(v38 > 1), v39 + 1, 1, v19);
        v40 = v53;
        v19 = v42;
      }
      v19[2] = v39 + 1;
      v41 = &v19[7 * v39];
      v41[4] = v37;
      v41[5] = v36;
      v41[6] = v18;
      v41[9] = v34;
      v41[10] = 0;
      *(_OWORD *)(v41 + 7) = v40;
      sub_2409A4214((uint64_t *)&v54);
      v36 = *((_QWORD *)&v54 + 1);
      v18 = *(_QWORD *)v55;
      v35 = *(_OWORD *)&v55[8];
      v34 = *(_QWORD *)&v55[24];
    }
    while (*(_QWORD *)v55 >> 1 != 0xFFFFFFFFLL);
  }
  v58 = v46;
  v59 = v49;
  v60 = v47;
  v61 = v48;
  sub_2409BFBA4((uint64_t)&v58, (uint64_t)v19, 0, (uint64_t)&v54);
  v20 = v56;
  v21 = v57;
  v22 = *(_OWORD *)v55;
  v23 = v44;
  *(_OWORD *)v44 = v54;
  *((_OWORD *)v23 + 1) = v22;
  *((_OWORD *)v23 + 2) = *(_OWORD *)&v55[16];
  v23[6] = v20;
  *((_BYTE *)v23 + 56) = v21;
}

uint64_t sub_2409C3280@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a3;
  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v19 = *a2;
  v20 = v5;
  v21 = v6;
  v22 = v7;
  v23 = v8;
  v24 = v9;
  sub_2409B0128(&v25);
  v10 = v27;
  if (v27 >> 1 == 0xFFFFFFFF)
  {
    sub_2409AB4E8();
    swift_allocError();
    *(_QWORD *)v11 = sub_2409C3B04;
    *(_QWORD *)(v11 + 8) = 0;
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = 0;
    *(_BYTE *)(v11 + 32) = 3;
    return swift_willThrow();
  }
  else
  {
    v14 = v29;
    v13 = v30;
    v15 = v28;
    v16 = a1;
    v18 = v25;
    v17 = v26;
    v25 = v4;
    v26 = v5;
    v27 = v6;
    v28 = v7;
    v29 = v8;
    v30 = v9;
    v19 = v18;
    v20 = v17;
    v21 = v10;
    v22 = v15;
    v23 = v14;
    v24 = v13;
    sub_2409C3674(v16, &v25, &v19, v31);
    return sub_2409A8454(v18, v17, v10);
  }
}

uint64_t sub_2409C33B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  unint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  unint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  result = sub_2409A4214((uint64_t *)&v27);
  v5 = v28;
  if (v28 >> 1 == 0xFFFFFFFF)
  {
    sub_2409AB4E8();
    swift_allocError();
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_BYTE *)(v6 + 32) = 4;
    return swift_willThrow();
  }
  v7 = v27;
  v8 = v29;
  v9 = v30;
  if (v28 >> 60 == 1)
  {
    v23 = v27;
    v24 = v28;
    v25 = v29;
    v26 = v30;
    v19 = xmmword_2409C6AF0;
    v20 = 0xA000000000000000;
    v21 = 0uLL;
    v22 = 0;
    sub_2409C3674(a1, (uint64_t *)&v23, (uint64_t *)&v19, (uint64_t)&v27);
    result = sub_2409A8454(v7, *((uint64_t *)&v7 + 1), v5);
    v12 = v30;
    v13 = v31;
    v14 = v28 | 0x800000000000000;
  }
  else
  {
    if (v28 >> 60 != 10
      || ((v10 = v29 | *((_QWORD *)&v27 + 1) | *((_QWORD *)&v29 + 1), v30)
       || v28 != 0xA000000000000000
       || (_QWORD)v27 != 15
       || v10)
      && (v30 || v28 != 0xA000000000000000 || (_QWORD)v27 != 17 || v10)
      && (v30 || v28 != 0xA000000000000000 || (_QWORD)v27 != 19 || v10))
    {
      *(_QWORD *)a2 = v27;
      *(_QWORD *)(a2 + 8) = *((_QWORD *)&v7 + 1);
      *(_QWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 24) = v8;
      *(_QWORD *)(a2 + 40) = v9;
      *(_QWORD *)(a2 + 48) = 0;
      return result;
    }
    v19 = v27;
    v20 = v28;
    v21 = v29;
    v22 = v30;
    v32 = *((_QWORD *)&v29 + 1);
    sub_2409B0128((uint64_t *)&v23);
    if (v24 >> 1 == 0xFFFFFFFF)
    {
      sub_2409AB4E8();
      swift_allocError();
      *(_QWORD *)v11 = sub_2409C3B04;
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)(v11 + 24) = 0;
      *(_BYTE *)(v11 + 32) = 3;
      swift_willThrow();
      return sub_2409A8454(v7, *((uint64_t *)&v7 + 1), 0xA000000000000000);
    }
    v18 = v26;
    v17 = v25;
    v16 = v23;
    v23 = v7;
    v24 = 0xA000000000000000;
    *(_QWORD *)&v25 = v8;
    *((_QWORD *)&v25 + 1) = v32;
    v26 = 0;
    v19 = v16;
    v20 = *((_QWORD *)&v8 + 1);
    v21 = v17;
    v22 = v18;
    sub_2409C3674(a1, (uint64_t *)&v23, (uint64_t *)&v19, (uint64_t)&v27);
    sub_2409A8454(v16, *((uint64_t *)&v16 + 1), *((unint64_t *)&v8 + 1));
    result = sub_2409A8454(v7, *((uint64_t *)&v7 + 1), 0xA000000000000000);
    v12 = v30;
    v13 = v31;
    v14 = v28 | 0x400000000000000;
  }
  v15 = v29;
  *(_OWORD *)a2 = v27;
  *(_QWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 24) = v15;
  *(_QWORD *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v13;
  return result;
}

double sub_2409C3674@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  _QWORD *v27;
  _QWORD *v28;
  double result;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  unint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  unint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  unint64_t v57;
  __int128 v58;
  uint64_t v59;

  v7 = *a2;
  v6 = a2[1];
  v8 = a2[2];
  v9 = a2[3];
  v38 = a2[5];
  v39 = a2[4];
  v45 = a3[1];
  v46 = *a3;
  v43 = a3[3];
  v44 = a3[2];
  v10 = a3[5];
  v42 = a3[4];
  sub_2409A4214((uint64_t *)&v51);
  v11 = v52;
  if (v52 >> 1 != 0xFFFFFFFF)
  {
    sub_2409C3DB4();
    v40 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v33 = v7;
    v34 = a4;
    v36 = v8;
    v37 = v6;
    v35 = v9;
    while (1)
    {
      v13 = v51;
      v52 = v11;
      *(_QWORD *)&v56 = v46;
      *((_QWORD *)&v56 + 1) = v45;
      v57 = v44;
      *(_QWORD *)&v58 = v43;
      *((_QWORD *)&v58 + 1) = v42;
      v59 = v10;
      v14 = sub_2409C5D18();
      sub_2409A8454(v13, *((uint64_t *)&v13 + 1), v11);
      if ((v14 & 1) != 0)
      {
LABEL_34:
        v7 = v33;
        a4 = v34;
        v8 = v36;
        v6 = v37;
        v9 = v35;
        goto LABEL_35;
      }
      sub_2409A4494();
      sub_2409A4214((uint64_t *)&v51);
      v15 = v52;
      if (v52 >> 1 == 0xFFFFFFFF)
        goto LABEL_6;
      v16 = v54;
      v41 = v51;
      if (v52 >> 60 != 10)
      {
        v7 = v33;
        a4 = v34;
        if (v52 >> 60 == 1)
        {
          v56 = v51;
          v57 = v52;
          v58 = v53;
          v59 = v54;
          v47 = xmmword_2409C6AF0;
          v48 = 0xA000000000000000;
          v50 = 0;
          v49 = 0uLL;
          sub_2409C3674(&v51, a1, &v56, &v47);
          sub_2409A8454(v41, *((uint64_t *)&v41 + 1), v15);
          v41 = v51;
          v32 = v53;
          v16 = v54;
          v21 = v55;
          v15 = v52 | 0x800000000000000;
        }
        else
        {
          v32 = v53;
          v21 = 0;
        }
        goto LABEL_28;
      }
      v17 = *((_QWORD *)&v51 + 1);
      v18 = v51;
      v19 = v53;
      v20 = v53 | *((_QWORD *)&v51 + 1) | *((_QWORD *)&v53 + 1);
      if (!v54 && v52 == 0xA000000000000000 && (_QWORD)v51 == 15 && !v20
        || !v54 && v52 == 0xA000000000000000 && (_QWORD)v51 == 17 && !v20
        || !v54 && v52 == 0xA000000000000000 && (_QWORD)v51 == 19 && !v20)
      {
        v47 = v51;
        v48 = 0xA000000000000000;
        v49 = v53;
        v50 = 0;
        sub_2409B0128((uint64_t *)&v56);
        v12 = v57;
        if (v57 >> 1 != 0xFFFFFFFF)
        {
          v22 = v59;
          v31 = v58;
          v30 = v56;
          v56 = v41;
          v57 = 0xA000000000000000;
          v58 = v19;
          v59 = 0;
          v47 = v30;
          v48 = v12;
          v49 = v31;
          v50 = v22;
          sub_2409C3674(&v51, a1, &v56, &v47);
          sub_2409A8454(v30, *((uint64_t *)&v30 + 1), v12);
          sub_2409A8454(v18, v17, 0xA000000000000000);
          v41 = v51;
          v32 = v53;
          v16 = v54;
          v21 = v55;
          v15 = v52 | 0x400000000000000;
          goto LABEL_27;
        }
        sub_2409A8454(v18, v17, 0xA000000000000000);
LABEL_6:
        sub_2409A4214((uint64_t *)&v51);
        v11 = v52;
        if (v52 >> 1 == 0xFFFFFFFF)
          goto LABEL_34;
      }
      else
      {
        v32 = v53;
        v21 = 0;
LABEL_27:
        v7 = v33;
        a4 = v34;
LABEL_28:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v40 = sub_2409C3B6C(0, v40[2] + 1, 1, v40);
        v24 = v40[2];
        v23 = v40[3];
        v25 = v41;
        v26 = v32;
        if (v24 >= v23 >> 1)
        {
          v28 = sub_2409C3B6C((_QWORD *)(v23 > 1), v24 + 1, 1, v40);
          v26 = v32;
          v25 = v41;
          v40 = v28;
        }
        v40[2] = v24 + 1;
        v27 = &v40[7 * v24];
        *((_OWORD *)v27 + 2) = v25;
        v27[6] = v15;
        *(_OWORD *)(v27 + 7) = v26;
        v27[9] = v16;
        v27[10] = v21;
        sub_2409A4214((uint64_t *)&v51);
        v11 = v52;
        v8 = v36;
        v6 = v37;
        v9 = v35;
        if (v52 >> 1 == 0xFFFFFFFF)
          goto LABEL_35;
      }
    }
  }
  v40 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_35:
  *(_QWORD *)&v51 = v7;
  *((_QWORD *)&v51 + 1) = v6;
  v52 = v8;
  *(_QWORD *)&v53 = v9;
  *((_QWORD *)&v53 + 1) = v39;
  v54 = v38;
  sub_2409A4D64(v7, v6, v8);
  *(_QWORD *)&result = sub_2409BFB84((uint64_t)&v51, (uint64_t)v40, a4).n128_u64[0];
  return result;
}

unint64_t sub_2409C3B04()
{
  return 0xD00000000000003DLL;
}

double sub_2409C3B20@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[3];

  v3 = a2[1];
  v10[0] = *a2;
  v10[1] = v3;
  v10[2] = a2[2];
  v5 = xmmword_2409C6AF0;
  v6 = 0xA000000000000000;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  return sub_2409C3674(a1, (uint64_t *)v10, (uint64_t *)&v5, a3);
}

_QWORD *sub_2409C3B6C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073400);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4])
          memmove(v12, a4 + 4, 56 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2409C44F4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2409C3C94(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257073408);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 120);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[15 * v8 + 4])
          memmove(v12, a4 + 4, 120 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2409C45E8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2409C3DB4()
{
  unint64_t result;

  result = qword_2570733E8;
  if (!qword_2570733E8)
  {
    result = MEMORY[0x242685B78](&protocol conformance descriptor for Token, &type metadata for Token);
    atomic_store(result, (unint64_t *)&qword_2570733E8);
  }
  return result;
}

_QWORD *sub_2409C3DF8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2570733F8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 31;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2409C46DC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2409C3F04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2409C3FD4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2409C47CC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2409C47CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2409C3FD4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2409C5F4C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2409C418C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2409C5FDC();
  if (!v8)
  {
    sub_2409C6030();
    __break(1u);
LABEL_17:
    result = sub_2409C6054();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2409C418C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2409C4220(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2409C4394(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2409C4394(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2409C4220(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2409AB208(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2409C5FB8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2409C6030();
      __break(1u);
LABEL_10:
      v2 = sub_2409C5DE4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2409C6054();
    __break(1u);
LABEL_14:
    result = sub_2409C6030();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_2409C4394(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073048);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409C44E0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 1 != 0xFFFFFFFF)
    return sub_2409A4D64(a1, a2, a3);
  return a1;
}

uint64_t sub_2409C44F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409C45E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 120 * a1 + 32;
    v6 = a3 + 120 * v4;
    if (v5 >= v6 || v5 + 120 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409C46DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2409C6054();
  __break(1u);
  return result;
}

uint64_t sub_2409C47CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2409C4808(_OWORD *a1)
{
  __int128 v1;
  _OWORD v2[3];

  v1 = a1[1];
  v2[0] = *a1;
  v2[1] = v1;
  v2[2] = a1[2];
  sub_2409C4F40((uint64_t)v2);
}

uint64_t sub_2409C4838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD v10[6];

  v10[2] = sub_2409C48F0;
  v10[3] = 0;
  v10[4] = sub_2409C4A34((void (*)(char *, char *))sub_2409C5768, (uint64_t)v10, a2, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], a3, MEMORY[0x24BEE40A8], a8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
  sub_2409C571C();
  v8 = sub_2409C5D0C();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_2409C48F0(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  _OWORD v3[3];
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(_OWORD *)(a1 + 16);
  v3[0] = *(_OWORD *)a1;
  v3[1] = v2;
  v3[2] = *(_OWORD *)(a1 + 32);
  v4 = v1;
  sub_2409C5448((uint64_t *)v3);
}

uint64_t sub_2409C4928(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  sub_2409B3B18(0, v2, 0);
  v3 = v16;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = (_QWORD *)(a1 + 80);
    do
    {
      v5 = *v4;
      v6 = *((_OWORD *)v4 - 2);
      v14[0] = *((_OWORD *)v4 - 3);
      v14[1] = v6;
      v14[2] = *((_OWORD *)v4 - 1);
      v15 = v5;
      v7 = sub_2409C5448(v14);
      v9 = v8;
      v16 = v3;
      v11 = *(_QWORD *)(v3 + 16);
      v10 = *(_QWORD *)(v3 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_2409B3B18((char *)(v10 > 1), v11 + 1, 1);
        v3 = v16;
      }
      *(_QWORD *)(v3 + 16) = v11 + 1;
      v12 = v3 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v4 += 7;
      --v2;
    }
    while (v2);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2409C4A34(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v31;
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
  v10 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_2409C5EEC();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_2409C5E5C();
  v57 = sub_2409C600C();
  v53 = sub_2409C6018();
  sub_2409C5FF4();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_2409C5E50();
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
      sub_2409C5F34();
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
      sub_2409C6000();
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
  sub_2409C5F34();
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
      sub_2409C6000();
      sub_2409C5F34();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

void sub_2409C4F40(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2409C4F80()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  return v0;
}

void sub_2409C509C()
{
  JUMPOUT(0x2409C507CLL);
}

void sub_2409C5448(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
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
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = *a1;
  v1 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v6 = a1[4];
  v5 = a1[5];
  v7 = (v3 >> 58) & 3;
  if (!(_DWORD)v7)
  {
    v25 = *a1;
    v26 = v1;
    v27 = v3;
    v28 = v4;
    v29 = v6;
    v30 = v5;
    sub_2409C4F40((uint64_t)&v25);
    return;
  }
  if ((_DWORD)v7 != 1)
  {
    v25 = *a1;
    v26 = v1;
    v27 = v3 & 0xF3FFFFFFFFFFFFFFLL;
    v28 = v4;
    v29 = v6;
    v30 = v5;
    sub_2409C4F40((uint64_t)&v25);
    v11 = v10;
    v13 = v12;
    v14 = swift_bridgeObjectRetain();
    v25 = sub_2409C4928(v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
    sub_2409C571C();
    sub_2409C5D0C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v25 = v11;
    v26 = v13;
    swift_bridgeObjectRetain();
    sub_2409C5DCC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2409C5DCC();
LABEL_8:
    swift_bridgeObjectRelease();
    return;
  }
  v8 = v3 & 0xF3FFFFFFFFFFFFFFLL;
  sub_2409B0128(&v25);
  v9 = v27;
  if (v27 >> 1 != 0xFFFFFFFF)
  {
    v22 = v29;
    v23 = v30;
    v15 = v25;
    v20 = v26;
    v21 = v28;
    v25 = v2;
    v26 = v1;
    v27 = v8;
    v28 = v4;
    v29 = v6;
    v30 = v5;
    sub_2409C4F40((uint64_t)&v25);
    v24 = v16;
    v18 = v17;
    v19 = swift_bridgeObjectRetain();
    v25 = sub_2409C4928(v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073100);
    sub_2409C571C();
    sub_2409C5D0C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v25 = v15;
    v26 = v20;
    v27 = v9;
    v28 = v21;
    v29 = v22;
    v30 = v23;
    sub_2409C4F40((uint64_t)&v25);
    sub_2409A8454(v15, v20, v9);
    v25 = v24;
    v26 = v18;
    swift_bridgeObjectRetain();
    sub_2409C5DCC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2409C5DCC();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
}

uint64_t sub_2409C5704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

ValueMetadata *type metadata accessor for AnySerializer()
{
  return &type metadata for AnySerializer;
}

unint64_t sub_2409C571C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257073108;
  if (!qword_257073108)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257073100);
    result = MEMORY[0x242685B78](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_257073108);
  }
  return result;
}

uint64_t sub_2409C5768@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2409C57A0()
{
  uint64_t v0;

  v0 = sub_2409C5CC4();
  __swift_allocate_value_buffer(v0, qword_257078BF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_257078BF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257073418);
  sub_2409C5D24();
  return sub_2409C5CB8();
}

uint64_t sub_2409C5838()
{
  uint64_t v0;

  if (qword_257078BF0 != -1)
    swift_once();
  v0 = sub_2409C5CC4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_257078BF8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2409C5898@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257078BF0 != -1)
    swift_once();
  v2 = sub_2409C5CC4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257078BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t TokenParser.init<A>(using:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t *boxed_opaque_existential_0;

  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a4);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(boxed_opaque_existential_0, a1, a2);
}

uint64_t TokenParser.parse()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;
  _QWORD *v10;
  int64_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  _OWORD v28[7];
  char v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char v33;
  _BYTE v34[40];
  _QWORD v35[2];
  __int16 v36;
  uint64_t v37;

  v2 = v0[3];
  v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (!v1)
  {
    nullsub_1(v4);
    v5 = sub_2409A44A0();
    v7 = v6;
    v9 = v8;
    swift_bridgeObjectRelease();
    v35[0] = v5;
    v35[1] = v7;
    v36 = v9 & 0x101;
    v10 = sub_2409C0BD4((uint64_t)v35, 1);
    sub_2409AB814((uint64_t)v0, (uint64_t)v34);
    v11 = v10[2];
    v3 = MEMORY[0x24BEE4AF8];
    if (v11)
    {
      v37 = MEMORY[0x24BEE4AF8];
      sub_2409C5B14(0, v11, 0);
      v3 = v37;
      v12 = v10 + 10;
      do
      {
        v13 = *((_OWORD *)v12 - 2);
        v28[0] = *((_OWORD *)v12 - 3);
        v28[1] = v13;
        v14 = *(_OWORD *)v12;
        v28[2] = *((_OWORD *)v12 - 1);
        v28[3] = v14;
        v15 = *((_OWORD *)v12 + 2);
        v16 = *((_OWORD *)v12 + 3);
        v28[4] = *((_OWORD *)v12 + 1);
        v28[5] = v15;
        v17 = *((_BYTE *)v12 + 64);
        v28[6] = v16;
        v29 = v17;
        sub_2409AB5BC((uint64_t *)v28, (uint64_t)&v30);
        v18 = v30;
        v19 = v31;
        v20 = v32;
        v21 = v33;
        v37 = v3;
        v23 = *(_QWORD *)(v3 + 16);
        v22 = *(_QWORD *)(v3 + 24);
        if (v23 >= v22 >> 1)
        {
          v26 = v31;
          v27 = v30;
          sub_2409C5B14((char *)(v22 > 1), v23 + 1, 1);
          v19 = v26;
          v18 = v27;
          v3 = v37;
        }
        *(_QWORD *)(v3 + 16) = v23 + 1;
        v24 = v3 + 48 * v23;
        *(_OWORD *)(v24 + 32) = v18;
        *(_OWORD *)(v24 + 48) = v19;
        *(_QWORD *)(v24 + 64) = v20;
        *(_BYTE *)(v24 + 72) = v21;
        v12 += 15;
        --v11;
      }
      while (v11);
    }
    swift_bridgeObjectRelease();
    sub_2409AB850((uint64_t)v34);
    swift_bridgeObjectRelease();
  }
  return v3;
}

char *sub_2409C5B14(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2409C5B40(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

ValueMetadata *type metadata accessor for TokenParser()
{
  return &type metadata for TokenParser;
}

char *sub_2409C5B40(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257073410);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2409C5C94()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_2409C5CA0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2409C5CAC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2409C5CB8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2409C5CC4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2409C5CD0()
{
  return MEMORY[0x24BEE0678]();
}

uint64_t sub_2409C5CDC()
{
  return MEMORY[0x24BEE06A0]();
}

uint64_t sub_2409C5CE8()
{
  return MEMORY[0x24BEE06C8]();
}

uint64_t sub_2409C5CF4()
{
  return MEMORY[0x24BEE06F8]();
}

uint64_t sub_2409C5D00()
{
  return MEMORY[0x24BEE07A8]();
}

uint64_t sub_2409C5D0C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2409C5D18()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2409C5D24()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2409C5D30()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2409C5D3C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2409C5D48()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_2409C5D54()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_2409C5D60()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_2409C5D6C()
{
  return MEMORY[0x24BEE0A98]();
}

uint64_t sub_2409C5D78()
{
  return MEMORY[0x24BEE0AC0]();
}

uint64_t sub_2409C5D84()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2409C5D90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2409C5D9C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2409C5DA8()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2409C5DB4()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2409C5DC0()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_2409C5DCC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2409C5DD8()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_2409C5DE4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2409C5DF0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2409C5DFC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2409C5E08()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2409C5E14()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2409C5E20()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2409C5E2C()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2409C5E38()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2409C5E44()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2409C5E50()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2409C5E5C()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_2409C5E68()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2409C5E74()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2409C5E80()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_2409C5E8C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2409C5E98()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2409C5EA4()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_2409C5EB0()
{
  return MEMORY[0x24BEE1468]();
}

uint64_t sub_2409C5EBC()
{
  return MEMORY[0x24BEE1938]();
}

uint64_t sub_2409C5EC8()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t sub_2409C5ED4()
{
  return MEMORY[0x24BEE19E8]();
}

uint64_t sub_2409C5EE0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2409C5EEC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2409C5EF8()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_2409C5F04()
{
  return MEMORY[0x24BEE1DC0]();
}

uint64_t sub_2409C5F10()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_2409C5F1C()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_2409C5F28()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_2409C5F34()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2409C5F40()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2409C5F4C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2409C5F58()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2409C5F64()
{
  return MEMORY[0x24BEE1FB0]();
}

uint64_t sub_2409C5F70()
{
  return MEMORY[0x24BEE1FB8]();
}

uint64_t sub_2409C5F7C()
{
  return MEMORY[0x24BEE1FC8]();
}

uint64_t sub_2409C5F88()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2409C5F94()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_2409C5FA0()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_2409C5FAC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2409C5FB8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2409C5FC4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2409C5FD0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2409C5FDC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2409C5FE8()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_2409C5FF4()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2409C6000()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2409C600C()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2409C6018()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2409C6024()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2409C6030()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2409C603C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2409C6048()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2409C6054()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2409C6060()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2409C606C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2409C6078()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2409C6084()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2409C6090()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2409C609C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2409C60A8()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2409C60B4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2409C60C0()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_2409C60CC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2409C60D8()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2409C60E4()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2409C60F0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2409C60FC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2409C6108()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2409C6114()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2409C6120()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_2409C612C()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_2409C6138()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2409C6144()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2409C6150()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2409C615C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2409C6168()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2409C6174()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2409C6180()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2409C618C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2409C6198()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2409C61A4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2409C61B0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2409C61BC()
{
  return MEMORY[0x24BEE46F8]();
}

uint64_t sub_2409C61C8()
{
  return MEMORY[0x24BEE4708]();
}

uint64_t sub_2409C61D4()
{
  return MEMORY[0x24BEE4760]();
}

uint64_t sub_2409C61E0()
{
  return MEMORY[0x24BEE4788]();
}

uint64_t sub_2409C61EC()
{
  return MEMORY[0x24BEE4798]();
}

uint64_t sub_2409C61F8()
{
  return MEMORY[0x24BEE47D0]();
}

uint64_t sub_2409C6204()
{
  return MEMORY[0x24BEE47E0]();
}

uint64_t sub_2409C6210()
{
  return MEMORY[0x24BEE47F0]();
}

uint64_t sub_2409C621C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2409C6228()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2409C6234()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}


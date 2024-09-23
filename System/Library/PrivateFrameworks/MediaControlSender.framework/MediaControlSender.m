void sub_218EBC010(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  int v9;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  int32x4_t v25;
  uint64_t v26;
  int32x4_t v27;
  int v28;
  int32x4_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  _BYTE v38[12];
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8) ^ (1543459711 * ((-2 - ((a1 | 0xAE03BA1B) + (~(_DWORD)a1 | 0x51FC45E4))) ^ 0x1D7E4620));
  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = (v1 + 48);
  v5 = (char *)*(&off_24DA380E0 + (v1 ^ 0x98)) - 8;
  v6 = *(_QWORD *)&v5[8 * v1] - 8;
  v26 = v3 - 0x749080D34EC4FB6CLL;
  v20 = v6;
  v21 = v3 - 0x749080D34EC4FB50;
  v24 = v3 - 0x749080D34EC4FB54;
  v30 = v3 - 0x749080D34EC4FB68;
  v32 = ((unint64_t)v38 ^ (v4 - 0x408103C090020B60))
      + ((2 * (_QWORD)v38) & 0x7EFDF87EDFFBE9F0)
      + 0x7E9393EDFEAA3F56;
  v37 = v3 - 0x4FB0CEC404CDA76ALL;
  v19 = v3 - 0x749080D34EC4FB4CLL;
  v8[1] = v2;
  v8[3] = v2 + 0x592515193B69AF09;
  v18 = v3 - 0x749080D34EC4FB78;
  v17 = v3 - 0x749080D34EC4FB77;
  v16 = v3 - 0x749080D34EC4FB76;
  v15 = v3 - 0x749080D34EC4FB75;
  v14 = v3 - 0x749080D34EC4FB70;
  v13 = v3 - 0x749080D34EC4FB74;
  v12 = v3 - 0x749080D34EC4FB73;
  v11 = v3 - 0x749080D34EC4FB72;
  v10 = v3 - 0x749080D34EC4FB71;
  v22 = (char *)&v8[0xFD0CC8D4014BF4D3] + 2;
  v8[2] = v3 - 0x749080D3294C00D5;
  v35 = v1 ^ 0x1B9;
  v34 = v1 ^ 0xA5;
  v29 = vdupq_n_s32(0x6747457Fu);
  v28 = (v1 ^ 0x158) - 368;
  v27 = vdupq_n_s32(0xCE8E8ACC);
  v9 = v1 ^ 0x72;
  v31 = &v39;
  v23 = 0x1799B95FF5A05B56;
  v36 = v1;
  v25 = vdupq_n_s32(0xE7474566);
  v33 = v3 - 0x749080D34EC4FBB0;
  v7 = *(_DWORD *)(v3 - 0x749080D34EC4FB6CLL) & 0x3F;
  *(_BYTE *)(v3 - 0x749080D34EC4FBB0 + (v7 ^ 0x38)) = 20;
  __asm { BR              X8 }
}

uint64_t sub_218EBC404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  int v43;
  int v44;
  uint64_t v45;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 + 8 * ((1831 * (v43 == ((3 * (v44 ^ 0x329)) ^ 0x14F) - 28)) ^ v44))
                                                                                                - 4))(148, a2, a3, a4, a5, a6, a43);
}

uint64_t sub_218EBC450()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * (int)((((v1 + 181096919) & 0xF534AD3F ^ 0x318) * ((v0 ^ 7u) > 7)) ^ v1))
                            - ((346 * (v1 ^ 0x116u)) ^ 0x2B8)))();
}

uint64_t sub_218EBC4AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unsigned int v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(a11 + v11 + (((v13 - 680) | 0xE2u) ^ (unint64_t)(v14 + 162))) = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((1729 * ((v12 & 0x38) == 8)) ^ v13)) - 8))();
}

void sub_218EBC4F8()
{
  JUMPOUT(0x218EBC4C0);
}

uint64_t sub_218EBC504()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * ((((v2 - 195) ^ 0x1D1) * (v1 != v0)) ^ v2))
                                          - ((v2 - 147) ^ 0x57)))(148);
}

uint64_t sub_218EBC548@<X0>(char a1@<W0>, int a2@<W1>, uint64_t a3@<X6>, int a4@<W8>)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  *(_BYTE *)(a3 + v4 + v6) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((unint64_t)(v4 + 1 + v6) < 0x40) * a2) ^ (a4 + 195)))
                            - (a4 ^ v5) * v7
                            + 79))();
}

uint64_t sub_218EBC584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,char a45,__int16 a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  uint64_t (*v67)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  BOOL v75;
  BOOL v78;
  unint64_t v79;

  v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((((v63 + 55) | 0x341u) ^ 0xFFFFFFFFFFFFFC27) + *(_QWORD *)(v64 + 8 * v63));
  v68 = &a63 + a27 - 0x1799B95FF5A05B46;
  v79 = a26 + a27;
  v69 = *(unsigned int *)(a58 - 0x24DFB20F49F753FELL);
  v70 = *(unsigned int *)(a58 - 0x24DFB20F49F753FALL);
  v71 = *(_DWORD *)(a58 - 0x24DFB20F49F753F6);
  v72 = *(_DWORD *)(a58 - 0x24DFB20F49F753F2);
  v73 = *(unsigned __int8 *)(a58 - 0x24DFB20F49F753E6) ^ 0xC8;
  if (v73 == 2)
  {
    v78 = a7 < v79 && (unint64_t)v68 < a7 + 64;
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v64
                                                                 + 8
                                                                 * ((1156
                                                                   * ((v78 ^ (a47 + 3 * a45 + 1)) & 1)) ^ ((int)a3 + 359)))
                                                     - 8))(v69, v70);
  }
  else if (v73 == 1)
  {
    v75 = a7 < v79 && (unint64_t)v68 < a7 + 64;
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v64
                                                                 + 8
                                                                 * ((37 * ((v75 ^ a3) & 1)) ^ ((int)a3 + 88)))
                                                     - (a3 + 88)
                                                     + 123))(v69, v70);
  }
  else
  {
    *(_DWORD *)(a58 - 0x24DFB20F49F753FELL) = 2 * (*(_DWORD *)(a58 - 0x24DFB20F49F753FELL) ^ v65)
                                            + v65
                                            - (v66 & (4 * (*(_DWORD *)(a58 - 0x24DFB20F49F753FELL) ^ v65)));
    *(_DWORD *)(a58 - 0x24DFB20F49F753FALL) = (*(_DWORD *)(a58 - 0x24DFB20F49F753FALL) ^ v65)
                                            + (v70 ^ v65)
                                            + v65
                                            - (v66 & (2 * ((*(_DWORD *)(a58 - 0x24DFB20F49F753FALL) ^ v65) + (v70 ^ v65))));
    *(_DWORD *)(a58 - 0x24DFB20F49F753F6) = (*(_DWORD *)(a58 - 0x24DFB20F49F753F6) ^ v65)
                                            + (v71 ^ v65)
                                            + v65
                                            - (v66 & (2 * ((*(_DWORD *)(a58 - 0x24DFB20F49F753F6) ^ v65) + (v71 ^ v65))));
    *(_DWORD *)(a58 - 0x24DFB20F49F753F2) = (*(_DWORD *)(a58 - 0x24DFB20F49F753F2) ^ v65)
                                            + (v72 ^ v65)
                                            + v65
                                            - (v66 & (2 * ((*(_DWORD *)(a58 - 0x24DFB20F49F753F2) ^ v65) + (v72 ^ v65))));
    return v67(v69, v70, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43);
  }
}

uint64_t sub_218EBE140(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,_DWORD *a28)
{
  uint64_t v28;
  unsigned int v29;

  v29 = *a28 - ((2 * *a28 + 931605802) & (((a3 + 795) | 8) ^ 0x9001555E)) + 1673806237;
  return ((uint64_t (*)(void))(*(_QWORD *)(v28
                                        + 8
                                        * ((2024
                                          * (((2 * v29) & 0xEFDB6FDA ^ 0x80014610) + (v29 ^ 0xBFED1CE5) - 50332801 == 1961735020)) ^ (a3 + 964)))
                            - 8))();
}

uint64_t sub_218EBE1E0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((23
                                * (v1 + v0 + ((v2 - 1775456143) ^ 0x1E3EFBACu) < ((v2 - 1775456143) & 0x69D34DFAu) - 434)) ^ v2)))();
}

uint64_t sub_218EBE254(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((98 * (v2 < ((((a2 - 426) | 0x421) - 1030) ^ 0xB))) ^ a2)))();
}

uint64_t sub_218EBE28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;

  *(int8x8_t *)(v7 - 7 + (v10 + v9 + v11 - v12)) = veor_s8(*(int8x8_t *)(a7- 7+ (v10 + v9 + v11 - v12)), (int8x8_t)0x9494949494949494);
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((238 * (v12 - (v8 & 0xFFFFFFF8) == -8)) ^ v13))
                            - (v13 - 643)
                            + 418))();
}

void sub_218EBE2EC()
{
  JUMPOUT(0x218EBE2BCLL);
}

uint64_t sub_218EBE2F8(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((((v3 - 260466867) & 0xF86672F ^ 0x56) * (v2 == a2)) ^ v3))
                            - ((v3 - 1606593987) & 0x5FC2AC3F)
                            + 39))();
}

uint64_t sub_218EBE350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int8x16_t v15;
  uint64_t v16;
  uint64_t v17;
  int8x16_t v18;

  v14 = v10 + v9 + v11;
  v15.i64[0] = 0x9494949494949494;
  v15.i64[1] = 0x9494949494949494;
  v16 = a7 + v14;
  v17 = v7 + v14;
  v18 = veorq_s8(*(int8x16_t *)(v16 - 31), v15);
  *(int8x16_t *)(v17 - 15) = veorq_s8(*(int8x16_t *)(v16 - 15), v15);
  *(int8x16_t *)(v17 - 31) = v18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13
                                        + 8
                                        * ((((v8 & 0xFFFFFFE0) == 32) * ((481 * (v12 ^ 0x29)) ^ 0x3D5)) ^ (v12 + 438)))
                            - 4))();
}

void sub_218EBE3C0()
{
  JUMPOUT(0x218EBE37CLL);
}

uint64_t sub_218EBE3CC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((v2 ^ 0x21A ^ ((v2 - 921) | 2) ^ 0x1FC) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_218EBE3FC(uint64_t a1, int a2)
{
  char v2;
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD))(v3 + 8 * ((641 * ((v2 & 0x18) == 29 * (a2 ^ 0x1FD) - 1073)) ^ a2)))(a2 ^ 0x1F3u);
}

uint64_t sub_218EBE43C@<X0>(int a1@<W0>, uint64_t a2@<X6>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(v3 + (v4 - 1961735021)) = *(_BYTE *)(a2 + (v4 - 1961735021)) ^ 0x94;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((22 * (v4 - 1 != a3)) ^ (a1 + 923))) - 12))();
}

void cp2g1b9ro()
{
  int v0[8];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 291625862 - 1334103649 * (v0 ^ 0x68A8C8AE);
  sub_218EF7A24(v0);
  __asm { BR              X9 }
}

uint64_t sub_218EBE564()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (48 * (v0 == 0) + 391)) - 8))();
}

uint64_t sub_218EBE5AC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  BOOL v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v1 - 415)))(40, 2217100586) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((847 * ((v1 ^ v3) & 1)) ^ v1)) - 8))();
}

uint64_t sub_218EBE5F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;

  v7 = (v5 + v6);
  v8 = a1 + 0x6D2DE21DA2E3804ELL;
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0x6018B445646BA20BLL;
  *(_QWORD *)(a1 + 32) = 0;
  v15 = (v5 + 276) ^ (1332649919
                    * (((&v12 | 0x4D6FF0BF) - &v12 + (&v12 & 0xB2900F40)) ^ 0x701C744D));
  v12 = a1 + 0x75136DB457459EB2;
  v14 = v2;
  (*(void (**)(uint64_t *))(v4 + 8 * (v5 ^ 0x1A9)))(&v12);
  v9 = v13;
  v10 = v8 ^ v7 ^ 0x6D2DE21D2783F0BDLL;
  if (v13 != v3)
    v10 = 0;
  *v1 = v10;
  return (v9 - 280600939);
}

void sub_218EBE710(uint64_t a1)
{
  int v1;
  unint64_t v2;

  v1 = *(_DWORD *)(a1 + 16) - 1449114341 * ((a1 - 2002704184 - 2 * (a1 & 0x88A128C8)) ^ 0x47FFD123);
  v2 = ((unint64_t)(*(_DWORD *)(*(_QWORD *)a1 - 0x1BD3A2918E8AF0F9) + 22) >> 3) & 0x3F;
  *(_BYTE *)(*(_QWORD *)a1 - 0x1BD3A2918E8AF0F1 + v2) = 0x80;
  __asm { BR              X14 }
}

uint64_t sub_218EBE848()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((v1 != (v0 ^ 0x3D3) - 816) * (((v0 + 1284024971) & 0xB37757CB) + 324)) ^ v0)))();
}

uint64_t sub_218EBE888()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((31 * (((v1 + 103) ^ 0x3F9u) - v0 < ((v1 + 187) | 8u) - 1058)) ^ v1)))();
}

uint64_t sub_218EBE8C4()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((v0 < ((v1 + 188825440) & 0xF4BEBFF1 ^ 0x300))
                                          * ((26 * (v1 ^ 0x3E7)) ^ 0x3D0)) ^ v1))
                            - 8))();
}

uint64_t sub_218EBE918@<X0>(_OWORD *a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;

  *a1 = 0u;
  a1[1] = 0u;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((v1 & 0xFFFFFFE0) == 32) * ((v2 - 1564534571) & 0x5D40E39F ^ 0x91)) | (v2 - 121)))
                            - 12))();
}

void sub_218EBE96C()
{
  JUMPOUT(0x218EBE94CLL);
}

uint64_t sub_218EBE978()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((57 * (v0 != ((v1 - 366771589) & 0x15DC7EC7) - 711)) | v1)) - 4))();
}

uint64_t sub_218EBE9B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  *a1 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v1 == 1) * (79 * ((v2 - 19) ^ 0x178) - 466)) ^ (v2 - 19))) - 4))();
}

uint64_t sub_218EBE9F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(a1 + v3) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v3 + 1 == v1) * v4) ^ v2)) - 4))();
}

uint64_t sub_218EBEA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t *), uint64_t a13, uint64_t a14, unsigned int a15)
{
  void (*v15)(uint64_t *);
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;

  v20 = 515566439 * ((((2 * &a13) | 0x79419D0E) - &a13 - 1017171591) ^ 0x5074C920);
  a13 = v19;
  LODWORD(a14) = 1502915589 - v20;
  HIDWORD(a14) = (v18 + 87) ^ v20;
  v15(&a13);
  a15 = 1580882533
      * (((&a13 | 0x50F7FE9F) - &a13 + (&a13 & 0xAF080160)) ^ 0xC96F4D5F)
      + 2088559452
      + v18
      + 68;
  a13 = v19;
  a14 = v17 + 0x60AE5240038903C6;
  v21 = a12(&a13);
  *(_QWORD *)(v17 - 0x1BD3A2918E8AF0F1) = 0;
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * ((627 * ((((v18 + 57) | 0xB4) + 87) & 1)) ^ ((v18 - 711) | 0xB4))))(v21);
}

uint64_t sub_218EBEB50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  unsigned __int8 v5;

  *(_QWORD *)(a1 + v1 + 24) = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v5 ^ (v1 == 48)) & 1) * v2) ^ v4)))();
}

uint64_t sub_218EBEB80()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((((v2 - 1549902634) & 0x5C61A6BE) - 276) ^ (v2 + 620)) * (v1 == v0)) ^ v2)))();
}

uint64_t sub_218EBEBBC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((((v1 - 1074) | 0x428) ^ 0x432) & v0) == 0) * ((v1 ^ 0x714) - 524)) ^ v1))
                            - 8))();
}

uint64_t sub_218EBEBF8@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  *(_QWORD *)(a1 + v2) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((((v3 - 808) & v1) - 8 != v2) * (10 * ((v3 - 13) ^ 0x301) - 129)) ^ (v3 - 13)))
                            - 4))();
}

uint64_t sub_218EBEC44@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a1 + v4) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v3 != v4) * v1) ^ v2)) - 4))();
}

uint64_t sub_218EBEC6C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((41 * (v2 ^ 0xA7) + 13 * (v2 ^ 0xE6) - 873) * (v1 != v0)) ^ v2)))();
}

uint64_t sub_218EBECB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  *(_BYTE *)(a1 + v2) = 0;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 + 1 != v1) * (((v3 - 553) | 0x10A) ^ 0x172)) ^ (v3 - 886))))();
}

uint64_t sub_218EBECE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t *), uint64_t a13, uint64_t a14, int a15)
{
  uint64_t (*v15)(uint64_t *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  int v20;
  uint64_t v21;
  _BYTE *v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t (*v31)(uint64_t *);

  v22 = *(_BYTE **)(v16 + 8);
  v23 = 515566439 * ((2 * (&a13 & 0x378AB438) - &a13 - 931836992) ^ 0xA4A14C67);
  a13 = v21;
  LODWORD(a14) = 1502915587 - v23;
  HIDWORD(a14) = (v20 + 19) ^ v23;
  v31 = v15;
  v15(&a13);
  v24 = *v19;
  v25 = 846572393 * (((&a13 | 0x34EDD252) - (&a13 & 0x34EDD252)) ^ 0x28E861B);
  a14 = v18 + 0x265D240CF2C72933;
  LODWORD(a13) = (v24 - ((2 * v24 - 2079786964) & 0xB5C059F6) - 1662736111) ^ v25;
  HIDWORD(a13) = v20 - 1736225715 + v25;
  sub_218EFB844((uint64_t)&a13);
  v26 = *(_DWORD *)(v18 - 0x1BD3A2918E8AF0F5)
      - ((2 * *(_DWORD *)(v18 - 0x1BD3A2918E8AF0F5) - 2079786964) & 0xB5C059F6)
      - 1662736111;
  v27 = 846572393 * (((&a13 | 0x445D2066) - (&a13 & 0x445D2066)) ^ 0x723E742F);
  a14 = v18 + 0x265D240CF2C72937;
  LODWORD(a13) = v26 ^ v27;
  HIDWORD(a13) = v20 - 1736225715 + v27;
  sub_218EFB844((uint64_t)&a13);
  a15 = 1580882533 * ((1292394866 - (&a13 | 0x4D086172) + (&a13 | 0xB2F79E8D)) ^ 0x2B6F2D4D)
      + 2088559452
      + v20;
  a13 = v21;
  a14 = v18 + 0x60AE5240038903C6;
  a12(&a13);
  v28 = 515566439 * ((&a13 & 0x1F5758B | ~(&a13 | 0x1F5758B)) ^ 0x92DE8DD3);
  a13 = v18 - 0x1BD3A2918E8AF109;
  LODWORD(a14) = 1502915577 - v28;
  HIDWORD(a14) = (v20 + 19) ^ v28;
  v29 = v31(&a13);
  *v22 = *(_BYTE *)(v18 - 0x1BD3A2918E8AF109);
  v22[1] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF108);
  v22[2] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF107);
  v22[3] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF106);
  v22[4] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF105);
  v22[5] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF104);
  v22[6] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF103);
  v22[7] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF102);
  v22[8] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF101);
  v22[9] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF100);
  v22[10] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF0FFLL);
  v22[11] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF0FELL);
  v22[12] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF0FDLL);
  v22[13] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF0FCLL);
  v22[14] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF0FBLL);
  v22[15] = *(_BYTE *)(v18 - 0x1BD3A2918E8AF0FALL);
  *(_OWORD *)(v18 - 0x1BD3A2918E8AF109) = 0u;
  *v19 = 1039893482;
  *(_DWORD *)(v18 - 0x1BD3A2918E8AF0F5) = 1039893482;
  *(_OWORD *)(v18 - 0x1BD3A2918E8AF0F1) = 0u;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * ((1996 * (((v20 + 287) ^ 0x43ALL) == 64)) ^ v20))
                                          - 4))(v29);
}

uint64_t sub_218EBF134@<X0>(uint64_t a1@<X8>, __n128 a2@<Q0>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  *(__n128 *)(v5 + v2 + 24) = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((((a1 ^ 0x43A) + v2 == 64) * v3) ^ v6)) - 4))();
}

void zxcm2Qme0x(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X9 }
}

uint64_t sub_218EBF214(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;
  int v4;

  if (a1)
    v3 = a2 == 0;
  else
    v3 = 0;
  v4 = !v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((27 * v4) ^ 0x1AFu)) - 8))();
}

uint64_t sub_218EBF244(uint64_t a1)
{
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((137 * (a1 != 0)) ^ 0x250u)) - 4))();
}

uint64_t sub_218EBF2A4(uint64_t a1, int a2)
{
  _DWORD *v2;
  _DWORD *v4;
  _BOOL4 v5;
  BOOL v6;
  int v7;

  if (a2 == 25)
  {
    v5 = *(unsigned __int8 *)(a1 + 8) == 45;
    __asm { BR              X8 }
  }
  if (a2 == 40)
  {
    *v2 = 20;
    v4 = v2 + 1;
    if (a1)
      v6 = v4 == 0;
    else
      v6 = 1;
    v7 = !v6;
    __asm { BR              X9 }
  }
  return 4294925273;
}

void sub_218EBFBFC(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  _BOOL4 v8;

  v1 = 1543459711
     * (((a1 ^ 0x747A70AB | 0xDC01F2B5) - (a1 ^ 0x747A70AB) + ((a1 ^ 0x747A70AB) & 0x23FE0D4A)) ^ 0xE4F981DA);
  v2 = *(_DWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F9);
  v5 = *(_DWORD *)(a1 + 16) ^ v1;
  *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F9) = v4 + 8 * v5 - 326031296;
  v6 = v2 ^ v1;
  v7 = v4 + 8 * v5 + 1800039873;
  v8 = v7 < v4 + 2126071169;
  if ((v4 + 2126071169) < 0xBCB4C96B != v7 < 0xBCB4C96B)
    v8 = (v4 + 2126071169) < 0xBCB4C96B;
  *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F5) += ((v5 - 40753912) >> 29) + v8;
  __asm { BR              X10 }
}

uint64_t sub_218EBFDB4@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = v2 + 530769862 > ((a1 + 1229045409) & 0xB6BE42F6 ^ 0x2210C049) && 571523838 - v1 > (v2 + 530769862);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (int)(((2 * (((((a1 - 95) & 0xF6) + 79) ^ v5) & 1)) & 0xF7 | (8 * (((((a1 + 1229045409) & 0xB6BE42F6) + 591) ^ v5) & 1))) ^ (a1 + 1229045409) & 0xB6BE42F6))
                            - 12))();
}

uint64_t sub_218EBFE3C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((7
                                          * ((unint64_t)(2039316388 - v0) - 2039316324 >= (unint64_t)(v1 - 999) - 340)) ^ v1))
                            - (((v1 - 1210) | 0x160u) ^ 0x1EDLL)))();
}

uint64_t sub_218EBFEA4()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1019
                                          * (v4 - 0x1BD3A2918E8AF110 - v2 + v0 + 31 < (unint64_t)((v1 - 48) ^ 0xE5u)
                                                                                      - 340)) ^ v1))
                            - 12))();
}

uint64_t sub_218EBFEF4@<X0>(int8x8_t *a1@<X8>)
{
  uint64_t v1;
  int v2;
  int8x8_t *v3;
  uint64_t v4;

  *a1 = veor_s8(*v3, (int8x8_t)0x9494949494949494);
  return ((uint64_t (*)(int8x8_t *, int8x8_t *))(*(_QWORD *)(v4
                                                                     + 8
                                                                     * ((749 * ((v1 & 0xFFFFFFFFFFFFFFF8) == 8)) ^ v2))
                                                         - ((v2 + 89) ^ 0x21ELL)))(&a1[1], &v3[1]);
}

void sub_218EBFF44()
{
  JUMPOUT(0x218EBFF14);
}

uint64_t sub_218EBFF4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * ((1625 * ((v11 ^ 0x287 ^ v12) + v13 < ((v11 + 1725126877) & 0x992CA6FB ^ 0xFFFFFDFB))) ^ v11)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, v15, a10, a11);
}

uint64_t sub_218EBFFA4()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((v0 ^ 0x1B9) + 143) * (v1 != 40753912)) ^ v0)) - 8))();
}

uint64_t sub_218EBFFE8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;

  *(_BYTE *)(a1 + (v4 - 1740225932)) = (((v1 + 23) & 0x5F) + 56) ^ *(_BYTE *)(v5
                                                                                          + (v4 - 1740225932));
  v7 = v3 < v2;
  if (v7 == v4 + 455770203 < v2)
    v7 = v4 + 455770203 < v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((491 * v7) ^ v1)) - 8))();
}

uint64_t sub_218EC005C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((2 * (a3 ^ 0x2BC) + 1408) * (v4 == v3)) ^ a3))
                            - ((a3 ^ 0x2BCu)
                             + 174)
                            + 336))();
}

uint64_t sub_218EC0090@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(a1 + v2 + v1) = *(_BYTE *)(v5 + v2 + v1) ^ 0x94;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((32 * (v2 + 1 == v3)) | ((v2 + 1 == v3) << 6)) ^ (v4 + 850)))
                            - 12))();
}

uint64_t sub_218EC00D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t (*a16)(int *), void (*a17)(int *), void (*a18)(int *), uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,int a25,int a26,int a27,int *a28,int *a29,unsigned int a30,unsigned int a31)
{
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;

  v37 = 1477295531 * ((&a27 & 0xD665C5E7 | ~(&a27 | 0xD665C5E7)) ^ 0x1E910F4B);
  a28 = v36;
  a27 = (v33 + 446) ^ v37;
  LODWORD(a29) = v37 + 884429994;
  a17(&a27);
  v38 = 1449114341 * (((&a27 | 0x5B094D3) + (~&a27 | 0xFA4F6B2C)) ^ 0xCAEE6D39);
  a30 = v38 - 2043182176;
  a31 = v38 ^ 0x893B2A7A;
  a27 = v33 - v38 + 35;
  a28 = &a23;
  a29 = v36;
  a18(&a27);
  *(_DWORD *)(v34 - 0x1BD3A2918E8AF109) += a23;
  *(_DWORD *)(v34 - 0x1BD3A2918E8AF105) += a24;
  *(_DWORD *)(v34 - 0x1BD3A2918E8AF101) += a25;
  *(_DWORD *)(v34 - 0x1BD3A2918E8AF0FDLL) += a26;
  a27 = v33
      + 1334103649 * (((&a27 | 0xFA15199F) - (&a27 & 0xFA15199F)) ^ 0x92BDD131)
      + 2097345074;
  a28 = (int *)(v34 - 0x134A6E0A0FAD2C16);
  a29 = v36;
  v39 = a16(&a27);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v31
                                                      + 8
                                                      * ((1625
                                                        * (((v33 + 262) ^ 0xFD9226AA) + v35 - v32 < ((v33 + 1725127139) & 0x992CA6FB ^ 0xFFFFFDFB))) ^ (v33 + 262)))
                                          - 8))(v39);
}

uint64_t sub_218EC0300@<X0>(int a1@<W8>, __n128 a2@<Q0>, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __n128 v5;

  v5.n128_u64[0] = 0x9494949494949494;
  v5.n128_u64[1] = 0x9494949494949494;
  return (*(uint64_t (**)(__n128, __n128))(v4
                                                   + 8
                                                   * ((910
                                                     * (a3 - v3 + ((a1 - 60) ^ 0xE42C5D6E71750EF0) < (unint64_t)((a1 - 471) | 0x189u) - 477)) ^ (a1 - 60))))(a2, v5);
}

uint64_t sub_218EC0450()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;

  *(_BYTE *)(v6 + v1 + v3 + 24) = *(_BYTE *)(v4 + v1 + v3) ^ v8;
  return (*(uint64_t (**)(void))(v5 + 8 * (((((v0 + 78) ^ (v1 + 1 == v2 + 64)) & 1) * v7) ^ v0)))();
}

uint64_t sub_218EC0490@<X0>(uint64_t a1@<X8>, int8x16_t a2@<Q1>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  *(int8x16_t *)(v7 + a1 + 24) = veorq_s8(*(int8x16_t *)(v3 + a1), a2);
  return (*(uint64_t (**)(void))(v4 + 8 * (((a1 != 48) * (((v2 + v6) & v5) - 553)) ^ v2)))();
}

uint64_t sub_218EC04C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int *a11, _DWORD *a12, _DWORD *a13, _DWORD *a14, uint64_t a15, uint64_t (*a16)(int *), void (*a17)(int *), void (*a18)(int *), uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,int a24,int a25,int a26,int a27,int a28,int *a29,int *a30,unsigned int a31,unsigned int a32)
{
  uint64_t v32;
  int v33;
  _DWORD *v34;
  int *v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;

  v36 = 1477295531 * ((&a28 + 1893283138 - 2 * (&a28 & 0x70D93542)) ^ 0x47D20011);
  a29 = v35;
  a28 = (v33 + 223) ^ v36;
  LODWORD(a30) = v36 + 884429994;
  a17(&a28);
  v37 = 1449114341
      * (((&a28 | 0x9034E641) - &a28 + (&a28 & 0x6FCB19B8)) ^ 0x5F6A1FAA);
  a29 = &a24;
  a30 = v35;
  a31 = v37 - 2043182176;
  a32 = v37 ^ 0x893B2A7A;
  a28 = v33 - v37 - 188;
  a18(&a28);
  *v34 += a24;
  *a14 += a25;
  *a13 += a26;
  *a12 += a27;
  a29 = a11;
  a30 = v35;
  a28 = 1334103649 * ((&a28 - 1956947643 - 2 * (&a28 & 0x8B5B5945)) ^ 0xE3F391EB)
      + 2097344851
      + v33;
  v38 = a16(&a28);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v32
                                                      + 8
                                                      * ((((a23 - 40754040) > 0xFFFFFFBF)
                                                        * (7 * (v33 ^ 0x272) - 422)) ^ v33))
                                          - 8))(v38);
}

void sub_218EC06A8()
{
  JUMPOUT(0x218EC03ECLL);
}

uint64_t sub_218EC06CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v20;
  uint64_t v21;

  return ((uint64_t (*)(void))(*(_QWORD *)(v21 + 8 * ((1270 * (v20 + 1407095276 != (a20 ^ 0x564C6C01))) ^ a20)) - 8))();
}

uint64_t sub_218EC0714@<X0>(unsigned int a1@<W8>, uint64_t a2)
{
  unsigned int v2;
  int v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;

  v6 = v3 - 119;
  v7 = v2 < a1;
  *(_BYTE *)(a2 - 0x1BD3A2918E8AF0F1) = *v4 ^ 0x94;
  if (v7 == a1 > 0x564C6CE5)
    v7 = v2 > 0x564C6CE5;
  return ((uint64_t (*)(BOOL))(*(_QWORD *)(v5 + 8 * ((482 * v7) ^ v6)) - 8))(v2 > 0x564C6CE5);
}

void sub_218EC07A0()
{
  JUMPOUT(0x218EC0750);
}

void sub_218EC07E4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  _BOOL4 v8;

  v1 = 1334103649 * (((a1 | 0x400D215D) - a1 + (a1 & 0xBFF2DEA2)) ^ 0x28A5E9F3);
  v2 = *(_DWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F9);
  v5 = *(_DWORD *)(a1 + 24) ^ v1;
  *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F9) = v4 + 8 * v5 + 1671404544;
  v6 = v2 - v1;
  v7 = v4 + 8 * v5 + 607275381;
  v8 = v7 < v4 - 1064129163;
  if ((v4 - 1064129163) < 0xFE8E315F != v7 < 0xFE8E315F)
    v8 = (v4 - 1064129163) < 0xFE8E315F;
  *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F5) += ((v5 - 327945344) >> 29) + v8;
  __asm { BR              X11 }
}

uint64_t sub_218EC0984()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = (v2 + 656999777) > 0x3AB511E0
    && ((v0 + 1097720765) & 0xBE921B77 ^ 0x3AB51343) - v1 > v2 + 656999777;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((109 * v5) ^ v0)) - 8))();
}

uint64_t sub_218EC09F8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((v0 - 189) ^ 0x200) - 626) * (v1 != 327945344)) ^ (v0 - 189)))
                            - 4))();
}

uint64_t sub_218EC0A40@<X0>(uint64_t a1@<X8>)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  _BOOL4 v9;

  *(_BYTE *)(a1 + (v4 - 382675362)) = *(_BYTE *)(v5 + (v4 - 382675362)) ^ 0x94;
  v7 = v4 - 22619771;
  v9 = v7 > v2 && v7 < v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((254 * v9) ^ v1)) - 4))();
}

uint64_t sub_218EC0AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8 * (((((v11 + 703) ^ v12) + v13 < 0xFFFFFFC0) * ((v11 + 592) ^ 0x35F)) ^ v11)))(a1, a2, a3, a4, a5, a6, a7, a8, v15, a10, a11);
}

uint64_t sub_218EC0ADC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((721
                                          * ((unint64_t)(v1 + 466 - v0 + 726890966) - 726891722 >= (unint64_t)((v1 + 430) | 0x60u) - 872)) ^ v1))
                            - 4))();
}

uint64_t sub_218EC0B3C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v4 - v2 + v0 + ((440 * (v1 ^ 0x336u)) ^ 0xE42C5D6E71750C7FLL) < 8)
                                * ((v1 - 1950212056) & 0x743DDFB7 ^ 0x365)) ^ v1)))();
}

uint64_t sub_218EC0BA4@<X0>(int8x8_t *a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  int8x8_t *v3;
  uint64_t v4;

  *a1 = veor_s8(*v3, (int8x8_t)0x9494949494949494);
  return ((uint64_t (*)(int8x8_t *, int8x8_t *))(*(_QWORD *)(v4
                                                                     + 8
                                                                     * (((4 * ((v1 & 0xFFFFFFFFFFFFFFF8) == 8)) | (8 * ((v1 & 0xFFFFFFFFFFFFFFF8) == 8))) ^ v2))
                                                         - ((v2 - 434) ^ 0x16ELL)))(&a1[1], &v3[1]);
}

void sub_218EC0BF4()
{
  JUMPOUT(0x218EC0BC8);
}

uint64_t sub_218EC0BFC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (252 * (v1 == v0))))
                            - (v2 ^ 0x212u)
                            - ((v2 - 580939248) & 0x22A06FFD)
                            + 1756))();
}

uint64_t sub_218EC0C48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(a1 + v2 + v1) = *(_BYTE *)(v5 + v2 + v1) ^ 0x94;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((880 * (v2 + 1 != v3)) ^ (v4 - 466))) - 4))();
}

uint64_t sub_218EC0C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void (*a16)(_DWORD **), void (*a17)(_DWORD **), uint64_t (*a18)(_DWORD **), uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,int a25,int a26,_DWORD *a27,int *a28,_DWORD *a29,unsigned int a30,unsigned int a31)
{
  uint64_t v31;
  int v32;
  _DWORD *v33;
  int v34;
  uint64_t v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;

  v37 = 961505453 * ((((2 * &a27) | 0xDF547B1A) - &a27 + 274055795) ^ 0x4D51F32B);
  a27 = v33;
  LODWORD(a28) = v37 ^ 0x242ADF64;
  HIDWORD(a28) = v37 + v34 + 256;
  a17(&a27);
  a28 = v33;
  a29 = (_DWORD *)(v35 - 0x5BB4A5E4E854F7DLL);
  LODWORD(a27) = (v34 - 1488871596) ^ (961505453 * (&a27 ^ 0xA2FBCEA6));
  a16(&a27);
  v38 = 1449114341 * ((&a27 & 0xA993976E | ~(&a27 | 0xA993976E)) ^ 0x9932917A);
  LODWORD(a27) = v34 - v38 - 497;
  a28 = &a23;
  a29 = v33;
  a30 = v38 - 2043182176;
  a31 = v38 ^ 0x893B2A7A;
  v39 = a18(&a27);
  *(_DWORD *)(v35 - 0x1BD3A2918E8AF109) += a23;
  *(_DWORD *)(v35 - 0x1BD3A2918E8AF105) += a24;
  *(_DWORD *)(v35 - 0x1BD3A2918E8AF101) += a25;
  *(_DWORD *)(v35 - 0x1BD3A2918E8AF0FDLL) += a26;
  return (*(uint64_t (**)(uint64_t))(v31
                                            + 8
                                            * ((((((v34 ^ 0x26A) + 703) ^ 0xEC73F099) + v36 - v32 < 0xFFFFFFC0)
                                              * (((v34 ^ 0x26A) + 592) ^ 0x35F)) ^ v34 ^ 0x26A)))(v39);
}

uint64_t sub_218EC0E74@<X0>(int a1@<W8>, __n128 a2@<Q0>, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __n128 v5;

  v5.n128_u64[0] = 0x9494949494949494;
  v5.n128_u64[1] = 0x9494949494949494;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, __n128, __n128))(*(_QWORD *)(v4
                                                                                        + 8
                                                                                        * ((960
                                                                                          * (a3
                                                                                           - v3
                                                                                           + ((a1 - 648) ^ 0xE42C5D6E71750FEDLL) < ((107 * ((a1 - 648) ^ 0xE0u)) ^ 0xC6uLL))) ^ (a1 - 648)))
                                                                            - 4))(148, 283, 1012, a2, v5);
}

uint64_t sub_218EC0FE0(char a1, unint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v11 + v4 + v8 + 24) = *(_BYTE *)(v9 + v4 + v8) ^ a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((((v3 + v6) & v7 ^ a2) + v4 != v5 + 64) * a3) ^ v3)) - 4))();
}

uint64_t sub_218EC1024@<X0>(uint64_t a1@<X8>, int8x16_t a2@<Q1>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  unint64_t v8;

  *(int8x16_t *)(v5 + a1 + 24) = veorq_s8(*(int8x16_t *)(v3 + a1), a2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((((v6 ^ (2 * v2) ^ v8) + a1 != 64) * v7) ^ v2)) - 4))();
}

uint64_t sub_218EC105C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, _DWORD *a14, uint64_t a15, void (*a16)(_DWORD **), void (*a17)(_DWORD **), uint64_t (*a18)(_DWORD **), uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,int a24,int a25,int a26,int a27,_DWORD *a28,int *a29,_DWORD *a30,unsigned int a31,unsigned int a32)
{
  uint64_t v32;
  _DWORD *v33;
  int v34;
  _DWORD *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;

  v36 = 2 * &a28;
  v37 = 961505453 * (((v36 | 0x76CA6E36) - &a28 - 996488987) ^ 0x999EF9BD);
  LODWORD(a29) = v37 ^ 0x242ADF64;
  HIDWORD(a29) = v37 + v34 + 854;
  a28 = v35;
  a17(&a28);
  LODWORD(a28) = (v34 - 1488870998) ^ (961505453 * (((v36 | 0xC6D52E2A) - &a28 + 479553771) ^ 0x419159B3));
  a29 = v35;
  a30 = a14;
  a16(&a28);
  v38 = 1449114341 * (((&a28 | 0xCC00C810) - (&a28 & 0xCC00C810)) ^ 0x35E31FB);
  a31 = v38 - 2043182176;
  a32 = v38 ^ 0x893B2A7A;
  a29 = &a24;
  a30 = v35;
  LODWORD(a28) = v34 - v38 + 101;
  v39 = a18(&a28);
  *v33 += a24;
  *a13 += a25;
  *a12 += a26;
  *a11 += a27;
  return (*(uint64_t (**)(uint64_t))(v32
                                            + 8
                                            * ((624
                                              * (a23 - 327945472 < ((2 * (((v34 + 423) | 0x118) ^ 0x3A8)) ^ 0xFFFFFF22))) ^ v34)))(v39);
}

void sub_218EC1240()
{
  JUMPOUT(0x218EC0F74);
}

uint64_t sub_218EC1280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v20;
  uint64_t v21;

  return (*(uint64_t (**)(void))(v21 + 8 * (a20 ^ (2 * (v20 - 1093109897 + ((a20 - 409) | 0x130) == -765163673)))))();
}

void Mib5yocT()
{
  int v0[18];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 291625862
        - 1334103649
        * (((v0 | 0xAD7F6D24) - v0 + (v0 & 0x528092D8)) ^ 0xC5D7A58A);
  sub_218EF7A24(v0);
  __asm { BR              X10 }
}

uint64_t sub_218EC1484()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((761 * (v2 != 0)) ^ v0)) - 8))();
}

uint64_t sub_218EC14B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v9;

  v5 = *(_QWORD *)((v2 ^ 0x6D2DE21DA2E3804ELL) - 0x6D2DE21DA2E38036);
  if (v1)
    v6 = v5 == 0x6018B445646BA20BLL;
  else
    v6 = 1;
  v9 = v6 || v4 == 0 || v3 == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((9 * v9) ^ 0x491)) - 12))();
}

uint64_t sub_218EC1538()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((((unsigned __int16)v0 + 14863) & 0x46BB) - 724) ^ ((v0 - 776) | 0x100))
                                          * (v2 == 0)) ^ v0))
                            - 4))();
}

uint64_t sub_218EC1578()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((v0 - 1592767533) & 0x5EEFB159) - 338) * (LODWORD(STACK[0x230]) != 3)) ^ v0))
                            - ((v0 - 739) | 0x10u)
                            + 336))();
}

uint64_t sub_218EC15C4()
{
  _BYTE *v0;

  *v0 = -1;
  return 4294925205;
}

uint64_t sub_218EC1F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  int v33;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * ((645 * (v33 == ((251 * (a9 ^ 0xFF) - 958722840) & 0x3924F17E) + 280600595)) ^ a9)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_218EC1FAC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  BOOL v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * (v1 - 729)))(164, 1043326649) == 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v3 ^ (v1 + 34)) & 1) * ((v1 - 26000114) & 0x18CBC5F ^ 0x5A8)) ^ v1)))();
}

uint64_t sub_218EC2018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,char a35)
{
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v42;

  *(_DWORD *)a1 = 1498173510;
  *(_BYTE *)(a1 + 4) = a35 ^ 0x43;
  *(_WORD *)(a1 + 5) = 769;
  *(_BYTE *)(a1 + 7) = 0;
  *(_DWORD *)(a1 + 8) = -1744830464;
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(v36 + 13);
  *(_WORD *)(a1 + 13) = 6799;
  *(_BYTE *)(a1 + 15) = -100;
  v40 = 1503905621 * ((v39 + 512381294 - 2 * ((v39 - 168) & 0x1E8A5216)) ^ 0x43F23CC2);
  *(_DWORD *)(v39 - 164) = v35 - v40 - 302;
  *(_WORD *)(v39 - 168) = v40 + 29076;
  *(_QWORD *)(v39 - 152) = a1 + 0xC7936AAE040491CLL;
  v42 = (*(uint64_t (**)(uint64_t))(v38 + 8 * (v35 ^ 0x4E9)))(v39 - 168);
  *(_WORD *)(a1 + 16) = 256;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v37
                                                      + 8
                                                      * ((39
                                                        * (((a1 - (_QWORD)&STACK[0x260]) & 0xFFFFFFFFFFFFFFE0) == ((v35 + 5) ^ 0x4E4))) ^ v35))
                                          - 12))(v42);
}

uint64_t sub_218EC2150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  *(_BYTE *)(v3 + v0 - 1079658745) = *(_BYTE *)(v2 + v0 - 1079658745)
                                   - ((2 * *(_BYTE *)(v2 + v0 - 1079658745)) & 0x28)
                                   - 108;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((28 * (v0 - 1 != 3 * (v4 ^ 0x461) + v1)) ^ v4)) - 12))();
}

uint64_t sub_218EC21A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  uint64_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;

  v5 = v1 + 127 - a1;
  v6 = vrev64q_s8(*(int8x16_t *)(v5 - 15));
  v7 = vextq_s8(v6, v6, 8uLL);
  v8 = vrev64q_s8(*(int8x16_t *)(v5 - 31));
  v9 = vextq_s8(v8, v8, 8uLL);
  v10 = v2 + 127 - a1;
  v11.i64[0] = 0x2828282828282828;
  v11.i64[1] = 0x2828282828282828;
  v12.i64[0] = 0x9494949494949494;
  v12.i64[1] = 0x9494949494949494;
  v13 = vrev64q_s8(vaddq_s8(vsubq_s8(v7, vandq_s8(vaddq_s8(v7, v7), v11)), v12));
  *(int8x16_t *)(v10 - 15) = vextq_s8(v13, v13, 8uLL);
  v14 = vrev64q_s8(vaddq_s8(vsubq_s8(v9, vandq_s8(vaddq_s8(v9, v9), v11)), v12));
  *(int8x16_t *)(v10 - 31) = vextq_s8(v14, v14, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((59 * (a1 == 96)) ^ v3)) - ((v3 - 1104) ^ 3)))();
}

uint64_t sub_218EC223C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a68;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  _BOOL4 v73;
  int v74;
  uint64_t v75;

  v72 = STACK[0x230];
  v73 = LODWORD(STACK[0x230]) == a30;
  v74 = 1449114341 * ((v71 + 912807947 - 2 * ((v71 - 168) & 0x366858B3)) ^ 0xF936A158);
  *(_QWORD *)(v71 - 160) = v69;
  *(_QWORD *)(v71 - 152) = a68;
  *(_QWORD *)(v71 - 168) = a35;
  *(_DWORD *)(v71 - 144) = ((2 * v72) & 0x7BFE7BA6)
                         + (v72 ^ 0xBDFF3EDD ^ (v68 + v70 - 15) ^ (v68 - 254))
                         + 1924529085
                         + v74;
  *(_DWORD *)(v71 - 140) = (v70 + 81) ^ v74;
  v75 = ((uint64_t (*)(uint64_t))((char *)*(&off_24DA380E0 + v70 + 142) - 8))(v71 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(STACK[0x218] + 8 * (v70 ^ (1001 * v73))) - 4))(v75);
}

uint64_t sub_218EC2330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void (*a33)(uint64_t),uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  int v44;
  unsigned int v45;
  int v46;
  uint64_t v47;

  v45 = (v44 + 2125307420) & 0xDA320C7A;
  v46 = v44 + 1491053214;
  a33(a31);
  STACK[0x208] = (unint64_t)&STACK[0xE18];
  v47 = ((uint64_t (*)(uint64_t, unint64_t *, uint64_t))a33)(a32, &STACK[0xE18], 16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(STACK[0x218] + 8 * (int)(((v45 ^ 0x27B) * (a44 != -16)) ^ v46))
                                          - 4))(v47);
}

void sub_218EC2410()
{
  uint64_t v0;

  STACK[0x200] = v0 + 0x1BD3A2918E8AFD29;
  JUMPOUT(0x218EC2498);
}

uint64_t sub_218EC2514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;

  LODWORD(STACK[0x228]) = v27 - v24;
  v29 = v27 - v24 - 307;
  v30 = 839339309 * ((v28 - 168) ^ 0xBCE11861);
  *(_QWORD *)(v28 - 160) = a24;
  *(_QWORD *)(v28 - 152) = v26;
  *(_QWORD *)(v28 - 136) = v25;
  *(_DWORD *)(v28 - 168) = v30 + v27 - 68;
  *(_DWORD *)(v28 - 144) = v30 ^ 0x789518A0;
  ((void (*)(uint64_t))(*(_QWORD *)(a1 + 8 * (v27 - 242)) - 4))(v28 - 168);
  return (*(uint64_t (**)(_UNKNOWN **))(STACK[0x218]
                                                + 8
                                                * (((*(_DWORD *)(v28 - 164) == 280600939) * (v29 ^ 0x58DFAEDF)) ^ v27)))(&off_24DA380E0);
}

uint64_t sub_218EC25D4()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1 + 8 * ((759 * (LODWORD(STACK[0x238]) == ((v0 + v2 - 330) ^ 0x5456CD54))) ^ v2)))();
}

uint64_t sub_218EC260C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;

  *(_DWORD *)(v18 - 168) = v17
                         + 1449114341 * (((v18 - 168) & 0x22A60FE5 | ~((v18 - 168) | 0x22A60FE5)) ^ 0x120709F1)
                         + 500;
  *(_QWORD *)(v18 - 152) = v14;
  *(_QWORD *)(v18 - 144) = a14;
  *(_QWORD *)(v18 - 160) = v15 + 12;
  ((void (*)(uint64_t))(*(_QWORD *)(a1 + 8 * (v17 ^ 0x1E8)) - 8))(v18 - 168);
  return (*(uint64_t (**)(_UNKNOWN **))(STACK[0x218]
                                                + 8 * ((1348 * (*(_DWORD *)(v18 - 136) == (v16 ^ 0x48660BCD))) ^ v17)))(&off_24DA380E0);
}

uint64_t sub_218EC26C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = v14 + (LODWORD(STACK[0x23C]) - 1523647529);
  *(_DWORD *)(v16 - 136) = (v15 + 63) ^ (846572393 * ((v16 - 168) ^ 0x36635449));
  *(_QWORD *)(v16 - 152) = v13;
  *(_QWORD *)(v16 - 144) = a13;
  *(_QWORD *)(v16 - 168) = v17;
  *(_QWORD *)(v16 - 160) = &STACK[0x309E6C8145C33E6B];
  ((void (*)(uint64_t))(*(_QWORD *)(a1 + 8 * (v15 - 180)) - 8))(v16 - 168);
  return (*(uint64_t (**)(_UNKNOWN **))(STACK[0x218]
                                                + 8
                                                * ((1419 * (*(_DWORD *)(v16 - 132) == LODWORD(STACK[0x228]) - 1210452590)) ^ v15)))(&off_24DA380E0);
}

uint64_t sub_218EC2790(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t (*v3)(void);
  int v4;
  int v5;

  v5 = (v4 + 9543862) | 0x584E08A6;
  STACK[0x220] = *(_QWORD *)(a1 + 8 * (v2 + v5 + 131)) - 4;
  STACK[0x228] = *(_QWORD *)(a1 + 8 * (v5 ^ (v1 - 3)));
  return v3();
}

uint64_t sub_218EC2800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  int v40;
  uint64_t v41;
  int v42;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41
                                                                                 + 8
                                                                                 * (((v42 == ((v40 + v39 + 57) ^ 0x10B9A13B))
                                                                                   * (((v40 + v39 + 57) | 0xAC) ^ 0x44B)) | (v40 + v39 + 41)))
                                                                     - 4))(a1, a2, a3, a39);
}

uint64_t sub_218EC2858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v63;
  uint64_t v64;
  int v65;
  unsigned int v67;
  uint64_t (*v68)(uint64_t);
  int v69;
  uint64_t v70;
  unint64_t v71;

  v65 = v64 - 168;
  *(_QWORD *)(v64 - 168) = a21;
  *(_DWORD *)(v64 - 160) = (v63 - 483687964) ^ (1334103649
                                              * ((((v64 - 168) | 0x86A7AF9E) - ((v64 - 168) & 0x86A7AF9E)) ^ 0xEE0F6730));
  sub_218EF78D0((uint64_t *)(v64 - 168));
  v67 = 1332649919 * (((v65 | 0xC8F54A0E) - v65 + (v65 & 0x370AB5F0)) ^ 0xF586CEFC);
  *(_QWORD *)(v64 - 160) = *(_QWORD *)(a1 + 8 * (v63 ^ 0x1D8));
  *(_DWORD *)(v64 - 168) = v67 + 247636025;
  *(_QWORD *)(v64 - 144) = a21;
  *(_DWORD *)(v64 - 152) = v63 + 411 + v67;
  v68 = (uint64_t (*)(uint64_t))STACK[0x228];
  ((void (*)(uint64_t))STACK[0x228])(v64 - 168);
  v69 = 1332649919 * (((v65 | 0x7F92D08F) - (v65 & 0x7F92D08F)) ^ 0x42E1547D);
  *(_DWORD *)(v64 - 152) = v63 + 411 + v69;
  *(_QWORD *)(v64 - 160) = a22;
  *(_QWORD *)(v64 - 144) = a21;
  *(_DWORD *)(v64 - 168) = v69 + 247636010;
  v70 = v68(v64 - 168);
  v71 = STACK[0x218];
  STACK[0x208] = a21 - 0x1BD3A2918E8AF105;
  STACK[0x200] = a63 - 0x1BD3A2918E8AF105;
  *(_DWORD *)(a63 - 0x1BD3A2918E8AF109) = *(_DWORD *)(a21 - 0x1BD3A2918E8AF109);
  *(_DWORD *)STACK[0x200] = *(_DWORD *)STACK[0x208];
  *(_DWORD *)(a63 - 0x1BD3A2918E8AF101) = *(_DWORD *)(a21 - 0x1BD3A2918E8AF101);
  *(_DWORD *)(a63 - 0x1BD3A2918E8AF0FDLL) = *(_DWORD *)(a21 - 0x1BD3A2918E8AF0FDLL);
  *(_DWORD *)(a63 - 0x1BD3A2918E8AF0F9) = *(_DWORD *)(a21 - 0x1BD3A2918E8AF0F9);
  *(_DWORD *)(a63 - 0x1BD3A2918E8AF0F5) = *(_DWORD *)(a21 - 0x1BD3A2918E8AF0F5);
  return (*(uint64_t (**)(uint64_t))(v71
                                            + 8
                                            * ((532
                                              * (((a63 - a21 < ((127 * (v63 ^ 0x1E0u)) ^ 0x16DuLL)) ^ (127 * (v63 ^ 0xE0))) & 1)) ^ (127 * (v63 ^ 0x1E0)))))(v70);
}

uint64_t sub_218EC2B14@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)(v4 + a1 + 24) = *(_OWORD *)(v3 + a1 + 24);
  return (*(uint64_t (**)(void))(v5 + 8 * (((a1 != 48) * v2) ^ v1)))();
}

uint64_t sub_218EC2B48()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_BYTE *)(v7 + v0 + v4 + 24) = *(_BYTE *)(v6 + v0 + v4 + 24);
  return (*(uint64_t (**)(void))(v8 + 8 * ((((v5 ^ v3 ^ v9) + v0 == v1 + 64) * v2) ^ v5)))();
}

uint64_t sub_218EC2B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,_BYTE *a42)
{
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  uint64_t v48;

  *a42 = v43 + v44 - 87 - 13;
  v46 = 1332649919 * (((~(v45 - 168) & 0x8B6B85C) - (~(v45 - 168) | 0x8B6B85D)) ^ 0x35C53CAF);
  *(_QWORD *)(v45 - 160) = a42;
  *(_QWORD *)(v45 - 144) = v42;
  *(_DWORD *)(v45 - 168) = v46 + 247635977;
  *(_DWORD *)(v45 - 152) = v46 + v44 + 411;
  ((void (*)(uint64_t))STACK[0x228])(v45 - 168);
  v47 = STACK[0x210] + 16 * (int)v43 + 236148720;
  *(_QWORD *)(v45 - 168) = v42;
  *(_QWORD *)(v45 - 160) = v47;
  *(_DWORD *)(v45 - 152) = v44
                         + 1449114341 * ((((2 * (v45 - 168)) | 0x7C7AA89C) - (v45 - 168) + 1103276978) ^ 0x7163ADA5)
                         + 583;
  v48 = ((uint64_t (*)(uint64_t))STACK[0x220])(v45 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(STACK[0x218]
                                                      + 8
                                                      * (((((v44 - 718210022) & 0x2ACF037F) + 1003) * (v43 == 253676169)) ^ v44))
                                          - 4))(v48);
}

void sub_218EC2CAC()
{
  JUMPOUT(0x218EC2A84);
}

uint64_t sub_218EC2CC0()
{
  int v0;
  uint64_t v1;
  __n128 v2;
  __n128 v3;

  v2.n128_u64[0] = 0x2828282828282828;
  v2.n128_u64[1] = 0x2828282828282828;
  v3.n128_u64[0] = 0x9494949494949494;
  v3.n128_u64[1] = 0x9494949494949494;
  return ((uint64_t (*)(__n128, __n128))(*(_QWORD *)(v1
                                                             + 8
                                                             * ((27
                                                               * ((((v0 ^ 0x3A6) - 521) | 0x440)
                                                                - 1257
                                                                + 19 * (v0 ^ 0x181u) > 0x7FFFFFEE)) ^ v0 ^ 0x3A6))
                                                 - 12))(v2, v3);
}

uint64_t sub_218EC2F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v62;
  int v63;
  uint64_t v64;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v64
                                                     + 8
                                                     * (((((v62 ^ 0x47E) * v63) ^ 0x336)
                                                       * ((unint64_t)(a43 - a62 - 112) < 0x10)) ^ v62)))(a1, 2267886621);
}

uint64_t sub_218EC2FD4@<X0>(char a1@<W1>, uint64_t a2@<X3>, char a3@<W4>, uint64_t a4@<X5>, int a5@<W7>, uint64_t a6@<X8>)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  *(_BYTE *)(a2 + v7 + a4) = *(_BYTE *)(a6 + v7 + a4)
                           - ((*(_BYTE *)(a6 + v7 + a4) << (((v6 + a1) & a3) - 97)) & v10)
                           - 108;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((v7 + 1 != v8 + 16) * a5) ^ v6)) - 8))();
}

#error "218EC374C: call analysis failed (funcsize=380)"

void sub_218EC3750()
{
  JUMPOUT(0x218EC3218);
}

uint64_t sub_218EC3774(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,_QWORD *a44,_QWORD *a45,_QWORD *a46,_QWORD *a47,_QWORD *a48,_QWORD *a49,_QWORD *a50,_QWORD *a51,_QWORD *a52,_QWORD *a53,_QWORD *a54,_QWORD *a55,_QWORD *a56,_QWORD *a57,_QWORD *a58,_QWORD *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t (*a66)(void);
  unsigned __int8 v66;
  uint64_t v67;
  unsigned __int8 v68;
  unsigned __int8 v69;
  unsigned __int8 v70;
  unsigned __int8 v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  char v83;
  char v84;
  char v85;

  v73 = *(_BYTE *)(*a59 + (*(unsigned __int8 *)(v67 - 16) ^ a7));
  *(_BYTE *)(v67 - 16) = v73 + (~(2 * v73) | 0xD7) - 107;
  *(_BYTE *)(v67 - 12) = *(_BYTE *)(*a58 + v68) - (v72 & (2 * *(_BYTE *)(*a58 + v68))) - 108;
  *(_BYTE *)(v67 - 8) = *(_BYTE *)(*a57 + a1) - (v72 & (2 * *(_BYTE *)(*a57 + a1))) - 108;
  *(_BYTE *)(v67 - 4) = *(_BYTE *)(*a56 + v69) - (v72 & (2 * *(_BYTE *)(*a56 + v69))) - 108;
  v74 = *(_BYTE *)(*a55 + (v70 ^ a7));
  *(_BYTE *)(v67 - 3) = v74 - (v72 & (2 * v74)) - 108;
  v75 = *(_BYTE *)(*a54 + (*(unsigned __int8 *)(v67 - 11) ^ a7));
  *(_BYTE *)(v67 - 7) = v75 - (v72 & (2 * v75)) - 108;
  v76 = *(_BYTE *)(*a53 + (*(unsigned __int8 *)(v67 - 15) ^ a7));
  *(_BYTE *)(v67 - 11) = v76 - (v72 & (2 * v76)) - 108;
  v77 = *(_BYTE *)(*a52 + (v71 ^ a7));
  *(_BYTE *)(v67 - 15) = v77 - (v72 & (2 * v77)) - 108;
  v78 = *(unsigned __int8 *)(v67 - 14);
  v79 = *(_BYTE *)(*a51 + (v66 ^ a7));
  *(_BYTE *)(v67 - 14) = v79 - (v72 & (2 * v79)) - 108;
  *(_BYTE *)(v67 - 6) = *(_BYTE *)(*a50 + (v78 ^ a7)) + (~(2 * *(_BYTE *)(*a50 + (v78 ^ a7))) | 0xD7) - 107;
  v80 = *(unsigned __int8 *)(v67 - 10);
  v81 = *(_BYTE *)(*a49 + (*(unsigned __int8 *)(v67 - 2) ^ a7));
  *(_BYTE *)(v67 - 10) = v81 - (v72 & (2 * v81)) - 108;
  *(_BYTE *)(v67 - 2) = *(_BYTE *)(*a48 + (v80 ^ a7)) - (v72 & (2 * *(_BYTE *)(*a48 + (v80 ^ a7)))) - 108;
  v82 = *(unsigned __int8 *)(v67 - 13);
  v83 = *(_BYTE *)(*a47 + (*(unsigned __int8 *)(v67 - 9) ^ a7));
  *(_BYTE *)(v67 - 13) = v83 - (v72 & (2 * v83)) - 108;
  v84 = *(_BYTE *)(*a46 + (*(unsigned __int8 *)(v67 - 5) ^ a7));
  *(_BYTE *)(v67 - 9) = v84 - (v72 & (2 * v84)) - 108;
  v85 = *(_BYTE *)(*a45 + (*(unsigned __int8 *)(v67 - 1) ^ a7));
  *(_BYTE *)(v67 - 5) = v85 - (v72 & (2 * v85)) - 108;
  *(_BYTE *)(v67 - 1) = *(_BYTE *)(*a44 + (v82 ^ a7)) - (v72 & (2 * *(_BYTE *)(*a44 + (v82 ^ a7)))) - 108;
  return a66();
}

uint64_t sub_218EC39B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41,int a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a68;
  uint64_t v68;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v68
                                                     + 8
                                                     * ((((a42 & 0x983509DD) + 901257801 > 0x35B81BC5) * a40) ^ 0x1D7)))(250301704, a68);
}

uint64_t sub_218EC3A4C@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, unsigned int a4@<W4>, int a5@<W5>, int a6@<W7>, int a7@<W8>)
{
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v13 = (v7 + a6) | v10;
  *(_BYTE *)(a2 + a7 + v11 + v13) ^= *(_BYTE *)(v9 + a7 + v11 + v13);
  return (*(uint64_t (**)(void))(v12 + 8 * (((a7 + 1 < ((v13 + a1) & a4) + v8) * ((v13 + a1) ^ a5)) ^ (a3 + v13 + 448))))();
}

void sub_218EC3AA8()
{
  JUMPOUT(0x218EC2F20);
}

uint64_t sub_218EC3ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a67;
  uint64_t v67;

  return ((uint64_t (*)(_UNKNOWN **, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 + 8920) - 12))(&off_24DA380E0, 2803914097, 362717450, a39, a67);
}

void sub_218EC3B84(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  v8 = ((v7 - a2 - 75) ^ v5) + v6;
  *(_BYTE *)(a5 + v8) ^= *(_BYTE *)(a4 + v8) ^ 0xDD;
  JUMPOUT(0x218EC3B3CLL);
}

uint64_t sub_218EC3BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  int v50;
  int v51;
  uint64_t v52;
  int v53;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 + 8 * ((v50 + v51) ^ (1111 * (v53 == 280600939)))) - ((v50 + 88310920) & 0xA1DCD3DF ^ (v50 + 71531031) & 0xA2DCDBE7 ^ 0x3A3)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_218EC3C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a69;
  uint64_t a71;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  unsigned int v76;
  uint64_t (*v77)(uint64_t);
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  _DWORD *v82;

  v73 = (v71 + 1009);
  v74 = v72 - 168;
  *(_DWORD *)(v72 - 160) = (v71 - 483687646) ^ (1334103649
                                              * ((v72 + 347743592 - 2 * ((v72 - 168) & 0x14BA2610)) ^ 0x7C12EEBE));
  *(_QWORD *)(v72 - 168) = a69;
  sub_218EF78D0((uint64_t *)(v72 - 168));
  v75 = v71 + 729;
  v76 = 1332649919 * ((v74 & 0x82C0CDE3 | ~(v74 | 0x82C0CDE3)) ^ 0x404CB6EE);
  *(_DWORD *)(v72 - 168) = v76 + 247636025;
  *(_QWORD *)(v72 - 160) = *(&off_24DA380E0 + v71 + 28);
  *(_QWORD *)(v72 - 144) = a69;
  *(_DWORD *)(v72 - 152) = v71 + 729 + v76;
  v77 = (uint64_t (*)(uint64_t))STACK[0x228];
  ((void (*)(uint64_t))STACK[0x228])(v72 - 168);
  v78 = 1332649919 * ((((2 * v74) | 0xD655631C) - v74 + 349523570) ^ 0xD659357C);
  *(_QWORD *)(v72 - 144) = a69;
  *(_DWORD *)(v72 - 168) = v78 + 247636010;
  *(_QWORD *)(v72 - 160) = a71;
  *(_DWORD *)(v72 - 152) = v75 + v78;
  v79 = v77(v72 - 168);
  v80 = STACK[0x218];
  v81 = STACK[0x200];
  v82 = (_DWORD *)(STACK[0x200] - 0x1BD3A2918E8AF109);
  STACK[0x210] = a69 - 0x1BD3A2918E8AF105;
  *v82 = *(_DWORD *)(a69 - 0x1BD3A2918E8AF109);
  *(_DWORD *)(v81 - 0x1BD3A2918E8AF105) = *(_DWORD *)STACK[0x210];
  *(_DWORD *)(v81 - 0x1BD3A2918E8AF101) = *(_DWORD *)(a69 - 0x1BD3A2918E8AF101);
  *(_DWORD *)(v81 - 0x1BD3A2918E8AF0FDLL) = *(_DWORD *)(a69 - 0x1BD3A2918E8AF0FDLL);
  *(_DWORD *)(v81 - 0x1BD3A2918E8AF0F9) = *(_DWORD *)(a69 - 0x1BD3A2918E8AF0F9);
  *(_DWORD *)(v81 - 0x1BD3A2918E8AF0F5) = *(_DWORD *)(a69 - 0x1BD3A2918E8AF0F5);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v80
                                                      + 8
                                                      * (int)((((v73 + 45) ^ 0x4B4) * (v81 - a69 < v73 - 1158)) ^ v73))
                                          - 8))(v79);
}

uint64_t sub_218EC3ED8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + v1 + v7 + 24) = *(_BYTE *)(v5 + v1 + v7 + 24);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((2 * (((v1 + 1 == v2 + 64) ^ (v0 + v3)) & 1)) & 0xDF | (32 * (((v1 + 1 == v2 + 64) ^ (v0 + v3)) & 1))) ^ v0))
                            - 8))();
}

uint64_t sub_218EC3F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  *(_OWORD *)(v6 + a1 + 24) = *(_OWORD *)(v5 + a1 + 24);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((a1 == 48) * v2) ^ v7)) - ((15 * (v7 ^ v3)) ^ v4)))();
}

uint64_t sub_218EC3F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  int v56;
  uint64_t v57;

  STACK[0x230] = v52 ^ 0x150u;
  v55 = (_BYTE *)STACK[0x208];
  *v55 = v51 + 40;
  v56 = 1332649919 * ((((v54 - 168) | 0x7E3BCFD3) + (~(v54 - 168) | 0x81C4302C)) ^ 0x43484B20);
  *(_DWORD *)(v54 - 168) = v56 + 247635977;
  *(_QWORD *)(v54 - 160) = v55;
  *(_DWORD *)(v54 - 152) = v56 + v52 + 729;
  *(_QWORD *)(v54 - 144) = v53;
  ((void (*)(uint64_t))STACK[0x228])(v54 - 168);
  *(_DWORD *)(v54 - 152) = v52
                         + 1449114341
                         * ((((v54 - 168) ^ 0x1B82D0E5) - 1925301004 - 2 * (((v54 - 168) ^ 0x1B82D0E5) & 0x8D3E3CF4)) ^ 0x59E215FA)
                         + 901;
  *(_QWORD *)(v54 - 168) = v53;
  *(_QWORD *)(v54 - 160) = a51 + 16 * (int)v51 - 1076120960;
  v57 = ((uint64_t (*)(uint64_t))STACK[0x220])(v54 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(STACK[0x218]
                                                      + 8
                                                      * ((((STACK[0x230] ^ 0x1F4) + v51 == 1677870305) * (v52 ^ 0xB3)) ^ v52))
                                          - 12))(v57);
}

void sub_218EC4094()
{
  JUMPOUT(0x218EC3E38);
}

uint64_t sub_218EC40A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a71;
  int v71;
  int v72;
  unint64_t v73;
  unint64_t v74;

  v72 = v71 & 0x405C75EF;
  v73 = ((unint64_t)&STACK[0x258] ^ 0x577BAEEC97D7FF5FLL)
      - 0x471008C00342C95FLL
      + ((2 * (_QWORD)&STACK[0x258]) & 0xAEF75DD92FAFFEB0);
  v74 = STACK[0x218];
  LOBYTE(STACK[0x2EF]) = (v73 ^ 0xBA) * (v73 + 17);
  *((_BYTE *)&a71 + ((v72 - 123) | 0x74) + 2) = ((v73 | 1) ^ 0xBA) * (v73 + 18);
  return ((uint64_t (*)(void))(*(_QWORD *)(v74 + 8 * v72) - 12))();
}

void sub_218EC5438()
{
  JUMPOUT(0x218EC53F4);
}

uint64_t sub_218EC5444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39)
{
  int v39;
  int v40;

  STACK[0x258] = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((420 * (v40 == (v39 ^ a39) - 1210452283)) ^ v39)) - 8))();
}

void sub_218EC54A0()
{
  int v0;
  uint64_t v1;
  _BYTE *v2;
  _BYTE *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  int v9;

  v7 = v2[4];
  v8 = v2[5];
  v9 = 1334103649 * ((2 * ((v6 - 168) & 0x660EADF8) - (v6 - 168) - 1712238078) ^ 0xF1599AAC);
  *(_BYTE *)(v6 - 151) = 31 * v2[6] - 97 * ((2 * ((v6 + 88) & 0xF8) - (v6 + 88) + 2) ^ 0xAC) - 107;
  *(_DWORD *)(v6 - 132) = v4 - v9 - ((2 * v4 - 561201878) & 0x8CBBED7E) - 1247521452;
  *(_DWORD *)(v6 - 168) = v9 + v0 + 280;
  *(_BYTE *)(v6 - 136) = (v8 ^ 0x7E) - 97 * ((2 * ((v6 + 88) & 0xF8) - (v6 + 88) + 2) ^ 0xAC) + ((2 * v8) & 0xFC) - 2;
  *(_QWORD *)(v6 - 144) = v5;
  *(_BYTE *)(v6 - 152) = ((v0 - 106) & 0xB7) - 97 * ((2 * ((v6 + 88) & 0xF8) - (v6 + 88) + 2) ^ 0xAC) + 43 * v7 - 104;
  *(_QWORD *)(v6 - 160) = v1;
  sub_218EF1764((_DWORD *)(v6 - 168));
  *v3 = -1;
  JUMPOUT(0x218EC1918);
}

uint64_t sub_218EC5594(uint64_t result)
{
  unsigned int v1;
  BOOL v2;
  int v3;
  int v5;

  v1 = (*(_BYTE *)(result + 8) - 65 * (((result | 0xAD) - (result & 0xAD)) ^ 0x5F)) - 120;
  v2 = v1 > 8;
  v3 = (1 << v1) & 0x105;
  if (v2 || v3 == 0)
    v5 = 280558042;
  else
    v5 = 280600939;
  *(_DWORD *)result = v5;
  return result;
}

void sub_218EC5604(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v4;

  if (*(_QWORD *)(a1 + 16))
    v2 = *(_QWORD *)(a1 + 8) == 0x36B12D3B49E267F1;
  else
    v2 = 1;
  v4 = !v2 && *(_QWORD *)(a1 + 32) != 0x252C3BDA7CBE997ALL;
  v1 = *(_DWORD *)a1 - 839339309 * ((a1 & 0x8DBCAA5A | ~(a1 | 0x8DBCAA5A)) ^ 0xCEA24DC4);
  __asm { BR              X11 }
}

uint64_t sub_218EC56DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned __int8 *v3;
  _DWORD *v4;
  int v5;

  v4 = (_DWORD *)(a1 - 0x36B12D3B49E267F1);
  *v4 = 210331622;
  v5 = *v3;
  *v4 = 210331623;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((884 * (v5 == 68)) ^ v2)) - 8))();
}

uint64_t sub_218EC5734()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  _DWORD *v4;
  int v5;

  v5 = *(unsigned __int8 *)(v3 + 1);
  *v4 = v2 + 2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((591 * (v5 == 72)) ^ v1)) - 8))();
}

uint64_t sub_218EC5760()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  _DWORD *v4;
  int v5;

  v5 = *(unsigned __int8 *)(v3 + 2);
  *v4 = v2 + 3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((660 * (v5 == 70)) ^ v1)) - (v1 ^ 0x1E5u) + 219))();
}

uint64_t sub_218EC57A0()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  _DWORD *v5;
  int v6;

  v6 = *(unsigned __int8 *)(v4 + 3);
  *v5 = v1 + 4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (int)(((((v6 == 87) ^ (v2 + 36)) & 1) * v3) ^ v2))
                            - (v2 ^ v3)
                            + 254))();
}

uint64_t sub_218EC57E4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  int v7;
  uint64_t result;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;

  v7 = v1 + 1098962622;
  v13 = a1;
  v11 = (v1 + 1098962622) ^ (1477295531
                           * (((&v11 | 0xDC053DAB) - (&v11 & 0xDC053DAB)) ^ 0xEB0E08F8));
  sub_218EFBA84((uint64_t)&v11);
  *(_DWORD *)(v5 - 0x252C3BDA7CBE997ALL) = v12;
  *v6 += 4;
  v11 = v7 ^ (1477295531 * ((&v11 & 0x82330690 | ~(&v11 | 0x82330690)) ^ 0x4AC7CC3C));
  v13 = v4 + 8;
  result = sub_218EFBA84((uint64_t)&v11);
  v9 = v12;
  *v6 += 4;
  if (v9 == 2128826217)
    v10 = 280600939;
  else
    v10 = v3 + 5;
  *(_DWORD *)(v2 + 4) = v10;
  return result;
}

uint64_t sub_218EC5910(uint64_t a1)
{
  int v1;

  v1 = 1543459711
     * (((a1 ^ 0xAE4A7A93 | 0x39F030C0) - (a1 ^ 0xAE4A7A93) + ((a1 ^ 0xAE4A7A93) & 0xC60FCF3F)) ^ 0xDB384997);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DA380E0 + ((*(_DWORD *)(a1 + 8) + v1) ^ 0x4B6))
                              + ((291 * (((*(_BYTE *)a1 ^ v1) - 122) < 4u)) ^ (*(_DWORD *)(a1 + 8) + v1))
                              - 1)
                            - 4))();
}

uint64_t sub_218EC59A4@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  char v2;
  uint64_t v3;

  *(_DWORD *)(result + 4) = *(_DWORD *)(*(_QWORD *)(v3 + 8 * (a2 - 849)) + 4 * v2 - 8);
  return result;
}

uint64_t sub_218EC59BC(uint64_t result)
{
  *(_DWORD *)(result + 4) = 280558042;
  return result;
}

void sub_218EC59CC(uint64_t a1)
{
  int v1;

  v1 = 1503905621 * (((a1 | 0x1AC82D91) - (a1 & 0x1AC82D91)) ^ 0x47B04345);
  __asm { BR              X11 }
}

uint64_t sub_218EC5AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * (((*(_QWORD *)(v4 + 16) == 0) * (((v3 - 2105153806) & 0x7D7A17EF) - 940)) | v3))
                            - ((98 * (v3 ^ 0x504u)) ^ 0x31CLL)))();
}

uint64_t sub_218EC5B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * ((74
                                          * (*(unsigned __int8 *)(v4 + 5) != (((v3 + 63) ^ (-9 * (v3 ^ 0x12))) ^ 0xA0))) | v3))
                            - 8))();
}

uint64_t sub_218EC5B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  char v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * ((21
                                          * (*(unsigned __int8 *)(*(_QWORD *)(v5 + 64) + 1) != ((v3 ^ 7) + (v3 ^ 0x4D) * v4 + 59))) ^ v3))
                            - 8))();
}

uint64_t sub_218EC5BA0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(a3
                                                               + 8
                                                               * (((a4 == (((v5 + 760) | 0xAE) ^ v4))
                                                                 * ((v5 + 786) ^ 0x153)) ^ v5))
                                                   - 12))(a1, 280600939);
}

void sub_218EC763C(uint64_t a1)
{
  int v1;

  v1 = 1580882533 * (a1 ^ 0x9998B3C0);
  __asm { BR              X8 }
}

uint64_t sub_218EC76E4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((*(_QWORD *)(v0 + 40) == 0) | v2 ^ 0xF2))
                            - (((v2 ^ 0xF2) + 937853555) & 0xC8197DFA)
                            - (((v2 ^ 0xF2) + 850051773) & 0xCD553C7D ^ 0xFFFFFFFFFFFFFE21)))();
}

uint64_t sub_218EC7748()
{
  uint64_t v0;
  _QWORD *v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(_QWORD, _QWORD))(*(_QWORD *)(v3
                                                             + 8
                                                             * ((1243
                                                               * (*(unsigned __int8 *)(v0 + 5) == (v2 - 124))) ^ v2))
                                                 - 12))(*v1, v1[4]);
}

uint64_t sub_218EC778C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v40;
  int v41;
  uint64_t v42;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 + 8 * (((*(_BYTE *)(*(_QWORD *)(v40 + 64) + 1) == 111) * (((v41 - 124) | 0x142) + 903)) ^ v41)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40);
}

uint64_t sub_218EC77C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = *(_BYTE *)(v2 + 12);
  *(_BYTE *)(v6 - 140) = ((v3 ^ 0x36) + 2 * (v3 ^ 0xC9) + 40) ^ (45
                                                               * ((((2 * (v6 + 112)) | 0x50) - (v6 + 112) + 88) ^ 0xC9));
  *(_DWORD *)(v6 - 144) = (v4 + 312884408) ^ (839339309
                                            * ((((2 * (v6 - 144)) | 0x45646350) - (v6 - 144) + 1565380184) ^ 0x1E5329C9));
  *(_BYTE *)(v6 - 139) = 45 * ((((2 * (v6 + 112)) | 0x50) - (v6 + 112) + 88) ^ 0xC9) + v7 + 126;
  sub_218EF95D8(v6 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5
                                                               + 8
                                                               * (((*(_DWORD *)(v6 - 136) == 280600939)
                                                                 * (((v4 + 171) | 0x282) ^ 0x342)) ^ v4))
                                                   - 12))(a1, a2);
}

uint64_t sub_218EC78AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,_BYTE *a48)
{
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;

  a48[128] = v49[12];
  a48[129] = v49[4];
  a48[131] = v49[13];
  v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8 * (v51 - 914)))(142, 2932825243);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8 * (((v52 == 0) * ((v51 - 586) ^ 0x164)) | v51)))(a47, a46);
}

uint64_t sub_218EC7928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;

  *(_DWORD *)v55 = 1498173510;
  *(_BYTE *)(v55 + 4) = a53;
  *(_WORD *)(v55 + 5) = 513;
  *(_BYTE *)(v55 + 7) = 0;
  *(_DWORD *)(v55 + 8) = -2113929216;
  *(_BYTE *)(v55 + 12) = 2;
  *(_BYTE *)(v55 + 13) = *(_BYTE *)(v54 + 14);
  v60 = 1503905621 * ((~(v59 - 144) & 0x91318861 | (v59 - 144) & 0x6ECE779E) ^ 0xCC49E6B5);
  *(_WORD *)(v59 - 144) = v60 + 29076;
  *(_DWORD *)(v59 - 140) = v57 - v60 + 465;
  *(_QWORD *)(v56 + 2992) = v55 + 0xC7936AAE040491ALL;
  v69 = v55;
  (*(void (**)(uint64_t))(v53 + 8 * (v57 ^ 0x1D6)))(v59 - 144);
  *(_WORD *)(v69 + 14) = 256;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 + 8 * ((216 * (v69 - a48 + ((v57 + 88) ^ 0xFFFFFFFFFFFFFE32) < 0x20)) ^ v57)) - 12))(v69, v61, v62, v63, v64, v65, v66, v67, a9);
}

uint64_t sub_218EC7A44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  *(_BYTE *)(a1 + v1 - 1076846946) = *(_BYTE *)(v2 + v1 - 1076846946);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((880 * (v1 - 1 == ((v5 - 102031801) & 0x614E03F) + v3)) ^ v5))
                            - 12))();
}

uint64_t sub_218EC7A98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v5 = ((v3 - 289) ^ 0x40) - v1;
  v6 = *(_OWORD *)(v2 + v5 - 15);
  v7 = *(_OWORD *)(v2 + v5 - 31);
  v8 = a1 + v5;
  *(_OWORD *)(v8 - 15) = v6;
  *(_OWORD *)(v8 - 31) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((936 * (v1 == 96)) ^ v3)) - 12))();
}

uint64_t sub_218EC7AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8 * ((1339 * (v10 == ((5 * (v8 ^ 0x1D) - 52895482) & 0x3271FFF) + v9)) ^ v8)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_218EC7B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  uint64_t v44;
  int v45;
  void (*v46)(char *, unint64_t *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v46 = (void (*)(char *, unint64_t *, uint64_t))((char *)*(&off_24DA380E0 + v45 - 287) - 12);
  ((void (*)(_QWORD))v46)(*(&off_24DA380E0 + v45 - 413));
  v46((char *)*(&off_24DA380E0 + v45 - 366) - 8, &STACK[0xC68], 16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 + 8 * ((((((v45 - 271925234) ^ (a17 == -14)) & 1) == 0) * (3 * (v45 ^ 0x1B4) + 966)) ^ (v45 - 379))) - 4))(a17, v47, v48, v49, v50, v51, v52, v53, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           &STACK[0xBD8],
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_218EC7CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  uint64_t v48;
  int v49;
  uint64_t v50;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 + 8 * ((852 * (v48 != -48)) ^ v49)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_218EC7D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;

  v22 = v18 - 117;
  v23 = 839339309 * ((((2 * (v21 - 144)) | 0x2BBC4D10) - (v21 - 144) + 1780603256) ^ 0x293F3EE9);
  v17[376] = v19 + 0x252C3BDA7CBE99AALL;
  v17[373] = &STACK[0x36B12D3B49E2696D];
  *(_DWORD *)(v21 - 120) = v23 ^ 0x789518A0;
  *(_DWORD *)(v21 - 144) = v23 + v18 - 117 + 209;
  v17[374] = (char *)*(&off_24DA380E0 + v18 - 142) - 8;
  ((void (*)(uint64_t))((char *)*(&off_24DA380E0 + v18 - 82) - 4))(v21 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20
                                                      + 8 * ((1217 * (*(_DWORD *)(v21 - 140) == 280600939)) ^ v22))
                                          - (((v22 ^ 0x9Fu) - 107) ^ 0x3BLL)))(a17);
}

uint64_t sub_218EC7E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57)
{
  int v57;
  int v58;
  uint64_t v59;

  return ((uint64_t (*)(void))(*(_QWORD *)(v59 + 8 * ((1029 * (a57 == (v58 ^ 0x95) - 117 + v57)) ^ v58)) - 12))();
}

uint64_t sub_218EC7E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  _QWORD *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v53[374] = a53;
  v53[375] = &STACK[0x44F291D5AE4BD361];
  v53[373] = v56 + 12;
  *(_DWORD *)(v57 - 144) = v54 + 1449114341 * ((v57 - 144) ^ 0xCF5EF9EB) + 777;
  ((void (*)(uint64_t))((char *)*(&off_24DA380E0 + (v54 ^ 0x97)) - 8))(v57 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55
                                                      + 8
                                                      * ((1307 * (*(_DWORD *)(v57 - 112) == ((v54 + 117) ^ 0x10B9A1C1))) ^ v54))
                                          - 4))(a17);
}

uint64_t sub_218EC7F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56)
{
  _QWORD *v56;
  int v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v56[374] = a53;
  *(_DWORD *)(v61 - 112) = (v58 + 340) ^ (846572393
                                        * ((((2 * (v61 - 144)) | 0x31E8F3D2) - (v61 - 144) - 418675177) ^ 0x2E972DA0));
  v56[372] = v59 + (a56 - 1523647529);
  v56[373] = &STACK[0x309E6C8145C33CBB];
  v56[375] = &STACK[0x671084A6E1D342EC];
  ((void (*)(uint64_t))((char *)*(&off_24DA380E0 + (int)(v58 ^ 0xA3)) - 8))(v61 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v60
                                                      + 8
                                                      * (int)((643
                                                             * (*(_DWORD *)(v61 - 108) == ((85 * (v58 ^ 0x37)) ^ v57))) ^ v58))
                                          - (v58 ^ 0x31)))(a17);
}

uint64_t sub_218EC801C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,int a57,int a58)
{
  uint64_t v58;
  int v59;

  return ((uint64_t (*)(void))(*(_QWORD *)(v58
                                        + 8
                                        * ((1003
                                          * (a57 + a58 + a56 == ((v59 - 568426572) ^ 0xDE1E7F59 ^ (v59 - 568426572) & 0x21E180FE ^ 0x9BB89322))) ^ v59))
                            - 12))();
}

uint64_t sub_218EC8084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,unint64_t a50)
{
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  int v58;
  void (*v59)(uint64_t);
  int v60;
  uint64_t v61;

  v55 = v52 + 0x1BD3A2918E8AFBF1;
  v56 = v51 + 113;
  *(_QWORD *)(v50 + 2976) = v52 + 0x1BD3A2918E8AFBF1;
  *(_DWORD *)(v54 - 136) = (v51 - 483687723) ^ (1334103649
                                              * ((2 * ((v54 - 144) & 0x10CEBEF0) - (v54 - 144) + 1865498895) ^ 0x79989A1));
  sub_218EF78D0((uint64_t *)(v54 - 144));
  v57 = v51 + 652;
  v58 = 1332649919 * ((((2 * (v54 - 144)) | 0x9438286A) - (v54 - 144) - 1243354165) ^ 0x776F90C7);
  STACK[0xD38] = (unint64_t)*(&off_24DA380E0 + (v51 ^ 0x33u));
  *(_DWORD *)(v54 - 128) = v51 + 652 + v58;
  *(_DWORD *)(v54 - 144) = v58 + 247636025;
  STACK[0xD48] = v55;
  v59 = (void (*)(uint64_t))*(&off_24DA380E0 + v51 - 237);
  v59(v54 - 144);
  v60 = 1332649919 * ((v54 - 144) ^ 0x3D7384F2);
  STACK[0xD38] = a50;
  STACK[0xD48] = v55;
  *(_DWORD *)(v54 - 144) = v60 + 247636010;
  *(_DWORD *)(v54 - 128) = v57 + v60;
  v61 = ((uint64_t (*)(uint64_t))v59)(v54 - 144);
  STACK[0xCD0] = STACK[0xC78];
  LODWORD(STACK[0xCD8]) = STACK[0xC80];
  STACK[0xCDC] = STACK[0xC84];
  LODWORD(STACK[0xCE4]) = STACK[0xC8C];
  *(_OWORD *)&STACK[0xCE8] = *(_OWORD *)&STACK[0xC90];
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v53
                                                      + 8
                                                      * ((54 * ((11 * ((v56 - 14) ^ 0x43) + 1) & 1)) ^ (v56 - 14)))
                                          - 12))(v61);
}

void sub_218EC827C()
{
  JUMPOUT(0x218EC823CLL);
}

uint64_t sub_218EC8284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void (*a44)(uint64_t),unint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;

  LOBYTE(STACK[0xC68]) = v53 + v55 + 46 - 101;
  v57 = 1332649919 * ((2 * ((v56 - 144) & 0xB843438) - (v56 - 144) - 193213497) ^ 0xC9084F35);
  *(_DWORD *)(v56 - 144) = v57 + 247635977;
  *(_DWORD *)(v56 - 128) = v57 + v55 + 652;
  *(_QWORD *)(v52 + 3000) = a45;
  *(_QWORD *)(v52 + 2984) = a52;
  a44(v56 - 144);
  *(_DWORD *)(v56 - 128) = v55
                         + 1449114341
                         * ((283967426 - ((v56 - 144) | 0x10ECFFC2) + ((v56 - 144) | 0xEF13003D)) ^ 0x204DF9D6)
                         + 824;
  STACK[0xD30] = a45;
  STACK[0xD38] = a25 + 16 * (int)v53 + 2104138672;
  v58 = ((uint64_t (*)(uint64_t))((char *)*(&off_24DA380E0 + (v55 ^ 0x68)) - 4))(v56 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v54 + 8 * ((((v55 + 113) ^ 0xAD) * (v53 == 1210668621)) ^ v55))
                                          - 8))(v58);
}

void sub_218EC83D8()
{
  JUMPOUT(0x218EC820CLL);
}

uint64_t sub_218EC83E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int8x16_t *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_BYTE *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,int8x16_t *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a65;
  unsigned __int8 a68;
  unsigned __int8 a69;
  uint64_t a70;
  uint64_t a71;
  uint64_t a72;
  uint64_t a73;
  uint64_t a74;
  uint64_t v74;
  int v75;
  int8x16_t v76;
  int8x16_t v77;
  unsigned int v78;
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
  uint64_t *v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BOOL8 v113;
  _BYTE *v114;
  _BYTE *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE *v122;
  _BYTE *v123;
  _BYTE *v124;
  _BYTE *v125;
  _BYTE *v126;
  _BYTE *v127;
  _BYTE *v128;
  _BYTE *v129;
  _BYTE *v130;
  _BYTE *v131;
  _BYTE *v132;
  _BYTE *v133;
  _BYTE *v134;
  _BYTE *v135;

  HIDWORD(v121) = a50 ^ 0x1F6;
  v76.i64[0] = 0xBABABABABABABABALL;
  v76.i64[1] = 0xBABABABABABABABALL;
  v77.i64[0] = 0xDDDDDDDDDDDDDDDDLL;
  v77.i64[1] = 0xDDDDDDDDDDDDDDDDLL;
  *a16 = veorq_s8(vaddq_s8(vsubq_s8(*a16, vandq_s8(vaddq_s8(*a16, *a16), v76)), v77), *a51);
  HIDWORD(a9) = v75 ^ 0x1B2;
  v110 = *(_QWORD *)(v74 + 8 * a50) - 12;
  v113 = a69 != 175;
  HIDWORD(a21) = a68 ^ 0xAE;
  v78 = a69 ^ 0xAE;
  v112 = 2 % v78;
  v122 = (_BYTE *)(a10 - 0x30F49DD7C2BBF811);
  v123 = (_BYTE *)(a10 - 0x30F49DD7C2BBF80DLL);
  v79 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF80DLL);
  v124 = (_BYTE *)(a10 - 0x30F49DD7C2BBF809);
  v125 = (_BYTE *)(a10 - 0x30F49DD7C2BBF805);
  v80 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF809);
  v81 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF805);
  v126 = (_BYTE *)(a10 - 0x30F49DD7C2BBF810);
  v127 = (_BYTE *)(a10 - 0x30F49DD7C2BBF80CLL);
  v82 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF810);
  v83 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF80CLL);
  v133 = (_BYTE *)(a10 - 0x30F49DD7C2BBF808);
  v134 = (_BYTE *)(a10 - 0x30F49DD7C2BBF804);
  v84 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF808);
  v85 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF804);
  v111 = 3 % v78;
  v114 = (_BYTE *)(a10 - 0x30F49DD7C2BBF80FLL);
  v115 = (_BYTE *)(a10 - 0x30F49DD7C2BBF80ELL);
  v86 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF80FLL);
  v128 = (_BYTE *)(a10 - 0x30F49DD7C2BBF807);
  v129 = (_BYTE *)(a10 - 0x30F49DD7C2BBF80BLL);
  v87 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF807);
  v88 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF80BLL);
  v135 = (_BYTE *)(a10 - 0x30F49DD7C2BBF803);
  v89 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF803);
  v130 = (_BYTE *)(a10 - 0x30F49DD7C2BBF802);
  v131 = (_BYTE *)(a10 - 0x30F49DD7C2BBF806);
  v90 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF802);
  v91 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF806);
  v132 = (_BYTE *)(a10 - 0x30F49DD7C2BBF80ALL);
  v92 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF80ALL);
  v93 = *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF80ELL);
  LODWORD(v121) = -1073741824;
  v94 = *(unsigned __int8 *)(a70 + *(unsigned __int8 *)(a10 - 0x30F49DD7C2BBF811));
  *v122 = v94;
  v95 = *(unsigned __int8 *)(a74 + v79);
  *v123 = v95;
  v119 = *(unsigned __int8 *)(STACK[0x218] + v80);
  *v124 = v119;
  v120 = *(unsigned __int8 *)(STACK[0x238] + v81);
  *v125 = v120;
  v96 = *(unsigned __int8 *)(STACK[0x200] + v83);
  *v126 = v96;
  v97 = *(unsigned __int8 *)(STACK[0x220] + v84);
  *v127 = v97;
  v118 = *(unsigned __int8 *)(STACK[0x240] + v85);
  *v133 = v118;
  v117 = *(unsigned __int8 *)(a71 + v82);
  *v134 = v117;
  v98 = *(unsigned __int8 *)(STACK[0x228] + v87);
  *v114 = v98;
  v99 = *(unsigned __int8 *)(a72 + v86);
  *v128 = v99;
  v100 = *(unsigned __int8 *)(STACK[0x248] + v89);
  *v129 = v100;
  v101 = *(unsigned __int8 *)(STACK[0x208] + v88);
  *v135 = v101;
  v116 = *(unsigned __int8 *)(STACK[0x230] + v91);
  *v130 = v116;
  v102 = *(unsigned __int8 *)(STACK[0x210] + v92);
  *v131 = v102;
  v103 = *(unsigned __int8 *)(a73 + v93);
  *v132 = v103;
  v104 = *(unsigned __int8 *)(STACK[0x250] + v90);
  *v115 = v104;
  v105 = &a65 + 16 * (unint64_t)(0u % HIDWORD(a21));
  v106 = v105 + 147;
  LODWORD(v96) = *(_DWORD *)(v105[148] + 4 * v96) ^ *(_DWORD *)(v105[147] + 4 * v94) ^ *(_DWORD *)(v105[149] + 4 * v98) ^ *(_DWORD *)(v105[150] + 4 * v104);
  *v115 = BYTE3(v96);
  *v114 = BYTE2(v96);
  LODWORD(v98) = v96 >> (((a50 ^ 0xF6) - 38) ^ 0xB8);
  *v126 = v98;
  *v122 = v96;
  LODWORD(v95) = *(_DWORD *)(v106[4 * v113 + 1] + 4 * v97) ^ *(_DWORD *)(v106[4 * v113] + 4 * v95) ^ *(_DWORD *)(v106[4 * v113 + 2] + 4 * v100) ^ *(_DWORD *)(v106[4 * v113 + 3] + 4 * v103);
  *v132 = BYTE3(v95);
  *v129 = BYTE2(v95);
  *v127 = BYTE1(v95);
  *v123 = v95;
  LODWORD(v99) = *(_DWORD *)(v106[4 * v112 + 1] + 4 * v118) ^ *(_DWORD *)(v106[4 * v112] + 4 * v119) ^ *(_DWORD *)(v106[4 * v112 + 2] + 4 * v99) ^ *(_DWORD *)(v106[4 * v112 + 3] + 4 * v102);
  *v131 = BYTE3(v99);
  HIDWORD(a28) = WORD1(v99);
  *v128 = BYTE2(v99);
  *v133 = BYTE1(v99);
  *v124 = v99;
  LODWORD(v81) = *(_DWORD *)(v106[4 * v111 + 1] + 4 * v117) ^ *(_DWORD *)(v106[4 * v111] + 4 * v120) ^ *(_DWORD *)(v106[4 * v111 + 2] + 4 * v101) ^ *(_DWORD *)(v106[4 * v111 + 3] + 4 * v116);
  *v130 = BYTE3(v81);
  *v135 = BYTE2(v81);
  *v134 = BYTE1(v81);
  *v125 = v81;
  *v122 = *a25 ^ v96;
  *v126 = a25[1] ^ v98;
  *v114 = a25[2] ^ BYTE2(v96);
  LOBYTE(v105) = a25[3] ^ BYTE3(v96);
  *v115 = (_BYTE)v105;
  *v123 = a25[4] ^ v95;
  LOBYTE(v94) = a25[5] ^ BYTE1(v95);
  *v127 = v94;
  LOBYTE(v103) = a25[6] ^ BYTE2(v95);
  *v129 = v103;
  v107 = a25[7] ^ BYTE3(v95);
  *v132 = a25[7] ^ BYTE3(v95);
  *v124 = a25[8] ^ v99;
  *v133 = a25[9] ^ BYTE1(v99);
  *v128 = a25[10] ^ BYTE2(v99);
  LOBYTE(v89) = a25[11] ^ BYTE3(v99);
  *v131 = v89;
  *v125 = a25[12] ^ v81;
  *v134 = a25[13] ^ BYTE1(v81);
  *v135 = a25[14] ^ BYTE2(v81);
  v108 = (a25[15] ^ BYTE3(v81));
  *v130 = a25[15] ^ BYTE3(v81);
  return ((uint64_t (*)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, int8x16_t *, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, _BOOL8, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 + 8 * (a50 ^ 0x1F6)) - 12))(&a73, v107, v108, v94, v105, v107, v103, v89, a9, a10, &a73, a12, a13, a14, v110, a16, a17, &a65, v111,
           v112,
           a21,
           v113,
           a10 - 0x30F49DD7C2BBF80FLL,
           a10 - 0x30F49DD7C2BBF80ELL,
           a25,
           v116,
           v101,
           a28,
           v117,
           BYTE3(v99),
           WORD1(v81),
           BYTE3(v81),
           v121,
           a10 - 0x30F49DD7C2BBF811,
           a10 - 0x30F49DD7C2BBF80DLL,
           a10 - 0x30F49DD7C2BBF809,
           a10 - 0x30F49DD7C2BBF805,
           a10 - 0x30F49DD7C2BBF810,
           a10 - 0x30F49DD7C2BBF80CLL,
           a10 - 0x30F49DD7C2BBF807,
           a10 - 0x30F49DD7C2BBF80BLL,
           0,
           a10 - 0x30F49DD7C2BBF802,
           a10 - 0x30F49DD7C2BBF806,
           a10 - 0x30F49DD7C2BBF80ALL);
}

void sub_218EC8E80()
{
  JUMPOUT(0x218EC89DCLL);
}

uint64_t sub_218EC8EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t (*a15)(void), uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,_BYTE *a23,_BYTE *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,_BYTE *a34,_BYTE *a35,_BYTE *a36,_BYTE *a37,_BYTE *a38,_BYTE *a39,_BYTE *a40,_BYTE *a41,uint64_t a42,_BYTE *a43,_BYTE *a44,_BYTE *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,_BYTE *a51,_BYTE *a52,_BYTE *a53)
{
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

  *a34 = *(_BYTE *)(STACK[0xAD8] + v57);
  *a35 = *(_BYTE *)(STACK[0xB18] + v61);
  *a36 = *(_BYTE *)(STACK[0xB58] + v62);
  *a37 = *(_BYTE *)(STACK[0xB98] + v58);
  *a38 = *(_BYTE *)(STACK[0xB28] + a4);
  *a39 = *(_BYTE *)(STACK[0xB68] + v56);
  *a51 = *(_BYTE *)(STACK[0xBA8] + v55);
  *a52 = *(_BYTE *)(STACK[0xAE8] + v60);
  *a23 = *(_BYTE *)(STACK[0xB78] + v59);
  *a40 = *(_BYTE *)(STACK[0xAF8] + v53);
  *a41 = *(_BYTE *)(STACK[0xBB8] + v54);
  *a53 = *(_BYTE *)(STACK[0xB38] + a7);
  *a43 = *(_BYTE *)(STACK[0xB88] + a8);
  *a44 = *(_BYTE *)(STACK[0xB48] + a6);
  *a45 = *(_BYTE *)(STACK[0xB08] + a5);
  *a24 = *(_BYTE *)(STACK[0xBC8] + a3);
  return a15();
}

uint64_t sub_218EC8FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  int v20;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * ((994 * (a16 - 16 != ((40 * a10) ^ 0x19D26878))) ^ (v20 - 369))) - 12))(a19, a2, a3, a4, a5, a6, a7, a13);
}

uint64_t sub_218EC9010()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(v1 + 8 * ((119 * (v2 != ((53 * (v0 ^ 0xBB)) ^ 0x2E3 ^ (v3 - 350)))) ^ v0)))();
}

uint64_t sub_218EC904C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  int v57;
  uint64_t v58;
  unint64_t v59;

  v59 = ((unint64_t)&a57 ^ 0xFF37EEBD4EA59ADDLL)
      + 0x4BDF3F72F97FF023
      + ((2 * (_QWORD)&a57) & 0xFE6FDD7A9D4B35B0);
  *(_BYTE *)(a1 + 141) = (v59 ^ 0xBA) * (v59 + 17);
  *(_BYTE *)(a1 + ((v57 - 797) | 0x15u) + 15) = ((v59 | 1) ^ 0xBA) * (v59 + 18);
  return (*(uint64_t (**)(void))(v58 + 8 * v57))();
}

void sub_218EC90F8()
{
  JUMPOUT(0x218EC90B4);
}

uint64_t sub_218EC9104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,_DWORD *a46,_QWORD *a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,_BYTE *a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _BYTE *v62;

  *a47 = a1;
  *a46 = 142;
  *a54 = 1;
  *(_BYTE *)(a48 + 1) = 113;
  v60 = bswap32(*(_DWORD *)(a49 + 8));
  v61 = ((unint64_t)&a58 ^ 0x7FCFD49F6DFCFFF6)
      - 0x1586041D49608B28
      + ((2 * (_QWORD)&a58) & 0xFF9FA93EDBF9FFE0);
  v62 = (_BYTE *)(v60 + a49 + 11);
  *v62 = (v61 + ((v58 - 99) | 0x40)) * ((v61 + 50) ^ 0xBA);
  *(v62 - 1) = ((v61 + 51) ^ 0xBA) * (v61 + 68);
  return ((uint64_t (*)(void))(*(_QWORD *)(v59
                                        + 8
                                        * (((2 * (((v60 + 12) & 0x1FFFFFFFELL) == 2)) | (8
                                                                                       * (((v60 + 12) & 0x1FFFFFFFELL) == 2))) ^ v58))
                            - 4))();
}

void sub_218EC9200()
{
  JUMPOUT(0x218EC91B4);
}

uint64_t sub_218EC920C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  _BOOL4 v51;

  v51 = v50 == v47;
  ((void (*)(void))*(&off_24DA380E0 + (v48 ^ 0x4A)))();
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v49 + 8 * ((((v48 + 198) ^ 0x7D) * v51) ^ v48)) - 12))(a47, a46);
}

void sub_218EC9264(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  int v11;
  _BYTE *v12;

  v8 = v2[4];
  v9 = v2[5];
  v10 = 31 * v2[6];
  v11 = 1334103649 * ((((v7 - 144) | 0xC999ABBA) - (v7 - 144) + ((v7 - 144) & 0x36665440)) ^ 0xA1316314);
  *(_DWORD *)(v7 - 144) = v11 + v5 + 301;
  *(_QWORD *)(v3 + 3000) = a2;
  *(_BYTE *)(v7 - 112) = ~(97 * ((((v7 + 112) | 0xBA) - (v7 + 112) + ((v7 + 112) & 0x40)) ^ 0x14))
                       + ((9 * (v5 ^ 0x73) - 51) ^ v9)
                       + ((2 * v9) & 0xFB);
  *(_BYTE *)(v7 - 128) = -97 * ((((v7 + 112) | 0xBA) - (v7 + 112) + ((v7 + 112) & 0x40)) ^ 0x14) + 43 * v8 + 62;
  *(_QWORD *)(v3 + 2984) = a1;
  *(_DWORD *)(v7 - 108) = v6 - v11 - ((2 * v6 - 561201878) & 0x8CBBED7E) - 1247521452;
  *(_BYTE *)(v7 - 127) = v10 - 97 * ((((v7 + 112) | 0xBA) - (v7 + 112) + ((v7 + 112) & 0x40)) ^ 0x14) - 107;
  sub_218EF1764((_DWORD *)(v7 - 144));
  *v12 = -1;
  *(_DWORD *)(v4 + 24) = v6;
}

void sub_218EC9400(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40) ^ (846572393 * ((-1350598799 - (a1 | 0xAF7F7F71) + (a1 | 0x5080808E)) ^ 0x66E3D4C7));
  __asm { BR              X15 }
}

uint64_t sub_218EC9574(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v3
                                                               + 8 * (a2 ^ (1017 * (v2 != 0x8FDDAC6A))))
                                                   - 4))(a1, 2087789598);
}

uint64_t sub_218EC95CC(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  *(_BYTE *)(*(_QWORD *)(v12 - 216) + (a2 - 2087789598)) = *(_BYTE *)(v6 + ((a2 - 2087789598) & 0xFLL)) ^ *(_BYTE *)(v3 + (a2 - 2087789598)) ^ *(_BYTE *)(v5 + ((a2 - 2087789598) & 0xFLL)) ^ *(_BYTE *)(((v7 - 279) | 0x377u) + ((a2 - 2087789598) & 0xFLL) + v4 - 894) ^ (23 * ((a2 - 30) & 0xF));
  v13 = v8 > v10;
  v14 = a2 + 1604693746;
  v15 = (a2 + 1);
  v16 = v13 ^ (v14 < v2);
  v17 = v14 < v9;
  if (!v16)
    v13 = v17;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v11 + 8 * (((v13 << 8) | (v13 << 10)) ^ v7)) - 8))(a1, v15);
}

uint64_t sub_218EC9670()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((2 * v1) & 0xBFBFBC76 ^ 0x1FBB1854)
                                           + (v1 ^ 0x50027251)
                                           + (v0 ^ 0x76FF41D0) != 1457462843)
                                          * (v0 + 87)) ^ v0))
                            - 4))();
}

uint64_t sub_218EC96D4(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((a2 + v4 + 538976709) > 7)
                                          * ((((v2 ^ 0xFE) - 229) | 0x190) + 363)) ^ v2 ^ 0xFE))
                            - 8))();
}

uint64_t sub_218EC9730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 + 8 * (int)((((((v5 - 457) | 0x4A4) ^ 0xFFFFFFD0) + ((v5 - 154901484) & 0x93B9EDF)) * (v6 < 0xFFFFFFF0)) ^ v5))
                                                                                       - 12))(a1, a2, a3, a4, a5, a4);
}

uint64_t sub_218EC9780(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL4 v27;

  v18 = (a7 + a2 + v17 + 16);
  v19 = a12 - 0x3D03F1BDD9137986 + v18;
  v20 = (v12 ^ 0x4BB) & v18;
  v21 = v15 - v19;
  v22 = (v20 | v14) - v19;
  v23 = (v20 | v13) - v19;
  v27 = a5 - (a12 - 0x3D03F1BDD9137986) - 0x45C47169C9B6733BLL >= ((v12 - 2066834887) & 0x7B3165DF ^ 0x4DDuLL)
     && (unint64_t)(v21 + v20) > 0xF
     && v22 > 0xF
     && (unint64_t)(v23 + 1) > 0xF;
  return (*(uint64_t (**)(void))(v16 + 8 * ((91 * v27) ^ v12)))();
}

uint64_t sub_218EC9838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                         + 8
                                                                                         * (v4 ^ 0x69A ^ (105 * (v5 < 0x10))))
                                                                             - (((v4 ^ 0x5FCu) + 158) ^ 0x1E2)))(a1, a2, a3, a4, 0);
}

uint64_t sub_218EC9878(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  int8x16_t v61;
  uint64_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16x4_t v66;
  int8x16x4_t v67;

  *(_DWORD *)(v60 - 224) = a4 + 10;
  *(_DWORD *)(v60 - 220) = a4 + 11;
  v66.val[1].i64[0] = ((_BYTE)a4 + 2) & 0xF;
  v66.val[1].i64[1] = ((_BYTE)a4 + 1) & 0xF;
  v66.val[2].i64[0] = a4 & 0xF;
  v66.val[2].i64[1] = ((_BYTE)a4 - 1) & 0xF;
  v66.val[3].i64[0] = ((_BYTE)a4 + 14) & 0xF;
  v66.val[3].i64[1] = ((_BYTE)a4 + 13) & 0xF;
  v61.i64[0] = 0x1717171717171717;
  v61.i64[1] = 0x1717171717171717;
  v62 = (a4 + v58);
  v66.val[0].i64[0] = ((_BYTE)a4 + (_BYTE)v58) & 0xF;
  v66.val[0].i64[1] = ((_BYTE)a4 + 3) & 0xF;
  v63.i64[0] = vqtbl4q_s8(v66, (int8x16_t)xmmword_218F1D020).u64[0];
  v67.val[0].i64[1] = *(_DWORD *)(v60 - 220) & 0xF;
  v67.val[1].i64[1] = ((_BYTE)a4 + 9) & 0xF;
  v67.val[2].i64[1] = ((_BYTE)a4 + 7) & 0xF;
  v67.val[3].i64[1] = ((_BYTE)a4 + 5) & 0xF;
  v67.val[0].i64[0] = ((_BYTE)a4 + 12) & 0xF;
  v67.val[1].i64[0] = *(_DWORD *)(v60 - 224) & 0xF;
  v67.val[2].i64[0] = ((_BYTE)a4 + 8) & 0xF;
  v67.val[3].i64[0] = ((_BYTE)a4 + 6) & 0xF;
  v63.i64[1] = vqtbl4q_s8(v67, (int8x16_t)xmmword_218F1D020).u64[0];
  v64 = vrev64q_s8(vmulq_s8(v63, v61));
  *(int8x16_t *)(*(_QWORD *)(v60 - 216) - 15 + v62) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v57 + (v62 & 0xF) - 15), *(int8x16_t *)(v54 - 15 + v62)), veorq_s8(*(int8x16_t *)(v56 + (v62 & 0xF) - 15), *(int8x16_t *)((v62 & 0xF) + v55 - 14))), vextq_s8(v64, v64, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a54
                                        + 8 * ((819 * ((((a6 - 16) | 0x208) ^ 0x3CE) == (v59 & 0xFFFFFFF0))) ^ a6))
                            - 8))();
}

uint64_t sub_218EC99EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  int v12;
  uint64_t v13;

  return (*(uint64_t (**)(uint64_t))(v13
                                            + 8
                                            * ((2043
                                              * (((v12 == a5) ^ (25 * ((v11 + 33) & 0x7F ^ 0x74))) & 1)) ^ v11)))(a11);
}

uint64_t sub_218EC9A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                                                  + 8 * (((v6 - 214) * ((v5 & 8) == 0)) ^ v6))
                                                                                      - ((164 * (v6 ^ 0x111u)) ^ 0x140)))(a1, a2, a3, a4, a5, (a4 - a5));
}

uint64_t sub_218EC9A7C(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  int v62;
  unsigned int v63;
  int8x16x4_t v65;

  v62 = a3 + a2 + v61;
  v63 = v62 + v58 - a5;
  v65.val[0].i32[0] = v63 & ((41 * (a7 ^ 0x14F)) ^ 0x110);
  v65.val[0].i64[0] = v65.val[0].u32[0];
  v65.val[0].i64[1] = ((_BYTE)v62 - (_BYTE)a5 + 3) & 0xF;
  v65.val[1].i64[0] = ((_BYTE)v62 - (_BYTE)a5 + 2) & 0xF;
  v65.val[1].i64[1] = ((_BYTE)v62 - (_BYTE)a5 + 1) & 0xF;
  v65.val[2].i64[0] = ((_BYTE)v62 - (_BYTE)a5) & 0xF;
  v65.val[2].i64[1] = ((_BYTE)v62 - (_BYTE)a5 - 1) & 0xF;
  v65.val[3].i64[0] = ((_BYTE)v62 - (_BYTE)a5 + 14) & 0xF;
  v65.val[3].i64[1] = ((_BYTE)v62 - (_BYTE)a5 + 13) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v60 - 216) - 7 + v63) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v57 + v65.val[0].i64[0] - 7), *(int8x8_t *)(v54 - 7 + v63)), veor_s8(*(int8x8_t *)(v56 + v65.val[0].i64[0] - 7), *(int8x8_t *)(v65.val[0].i64[0] + v55 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v65, (int8x16_t)xmmword_218F1D030), (int8x8_t)0x1717171717171717)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a54
                                                     + 8
                                                     * (((8 * (a5 - (v59 & 0xFFFFFFF8) == -8)) | (16
                                                                                                * (a5
                                                                                                 - (v59 & 0xFFFFFFF8) == -8))) ^ a7))
                                         - 12))((__n128)xmmword_218F1D030);
}

void sub_218EC9BA4()
{
  JUMPOUT(0x218EC9AD8);
}

uint64_t sub_218EC9BAC@<X0>(int a1@<W0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v6 + 8 * (a1 ^ (49 * (v5 != a2))))
                                          - ((((a1 + 390156000) & 0xE8BEB37F) + 326) ^ (a1 - 2065368146) & 0x7B1B07FF)))(a5);
}

uint64_t sub_218EC9C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = ((a8 + 537212722) & 0xDFFAC77F ^ (v13 + 247)) + a6;
  *(_BYTE *)(*(_QWORD *)(v15 - 216) + v16) = *(_BYTE *)(v11 + (v16 & 0xF)) ^ *(_BYTE *)(v8 + v16) ^ *(_BYTE *)(v10 + (v16 & 0xF)) ^ *(_BYTE *)((v16 & 0xF) + v9 + 1) ^ (23 * (v16 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((a8 - 942) ^ ((a6 - 1 != v12) << 6))) - 8))();
}

uint64_t sub_218EC9C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *(_QWORD *)(a1 + 32);
  *(int8x16_t *)(v47 - 192) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(a1 + 16) - 0x30823A6E1240529DLL), (int8x16_t)xmmword_218F1D040);
  *(int8x16_t *)(v47 - 208) = veorq_s8(*(int8x16_t *)(v48 - 0x27D1BA72F3F81394), (int8x16_t)xmmword_218F1D050);
  HIDWORD(a13) = v45 << ((a7 ^ 0x5A) - 36);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 + 8 * (int)(a7 ^ (1989 * (v47 != 192)))) - ((a7 - 590) ^ 0x135)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45);
}

uint64_t sub_218EC9D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  uint64_t v14;

  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * (int)(((((v12 + 1599042778) & 0xA0B08B7F) + 950)
                                               * (v13 + 0x740E954ABE63F9DCLL == a12 + 0x370AA38CE5508056)) ^ v12))
                            - 4))();
}

uint64_t sub_218EC9D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v49;

  *(_BYTE *)(v47 - 128) = *(_BYTE *)(v47 - 192);
  *(_QWORD *)(v47 - 127) = *(_QWORD *)(v47 - 191);
  *(_DWORD *)(v47 - 119) = *(_DWORD *)(v47 - 183);
  *(_WORD *)(v47 - 115) = *(_WORD *)(v47 - 179);
  *(_BYTE *)(v47 - 113) = *(_BYTE *)(v47 - 177);
  v49 = a12 != 0x3D03F1BDD9137986 && v47 != 0x80;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 + 8 * (int)((217 * v49) ^ (v45 + 1853290714) & 0x9189077F)) - ((((v45 + 1853290714) & 0x9189077F) - 590) ^ 0x355) + 608))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45);
}

uint64_t sub_218EC9E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  BOOL v50;

  v48 = (HIDWORD(a13) & 0xFBEDD67A) + (v45 ^ 0xFDF6EB3D);
  v50 = (((_BYTE)v48 + 3) & 0xF) != 0 || v48 == -34149571;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 + 8 * ((((v50 ^ (5 * (v46 ^ 0x59))) & 1) * (287 * (v46 ^ 0x266) - 216)) ^ v46)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45);
}

uint64_t sub_218EC9ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  int v61;
  uint64_t v62;
  char *v63;
  char v64;
  int v65;
  char *v66;
  uint64_t v67;
  unsigned __int8 v68;
  unint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  char *v76;
  unsigned int v77;
  char v78;
  BOOL v79;
  int v80;
  unsigned __int8 v81;
  unint64_t v82;
  int v83;
  char v84;
  int v85;
  char v86;
  unsigned int v87;
  unsigned int v88;
  char v89;
  unsigned __int8 v90;
  int v91;
  int v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  int v97;
  int v98;
  char *v99;
  int v100;
  int v101;
  int v102;
  char v103;
  int v104;
  char *v105;
  char *v106;
  unsigned int v107;
  int v108;
  char *v109;
  char v110;
  char *v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned __int8 v118;
  int v119;
  char v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  int v125;
  char v126;
  unsigned __int8 v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  int v132;
  int v133;
  unsigned int v134;
  int v135;
  unsigned int v136;
  int v137;
  unsigned int v138;
  char v139;
  char v140;
  unsigned int v141;
  int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  int v149;
  int v150;
  int v151;
  char v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  int v157;
  unsigned int v158;
  char v159;
  char v160;
  unsigned int v161;
  unsigned int v162;
  int v163;
  int v164;
  unsigned int v165;
  char v166;
  char v167;
  int v168;
  unsigned int v169;
  unsigned int v170;
  int v171;
  unsigned int v172;
  int v173;
  int v174;
  char v175;
  unsigned __int8 v176;
  unsigned int v177;
  unsigned int v178;
  int v179;
  int v180;
  unsigned int v181;
  int v182;
  int v183;
  int v184;
  char v185;
  char v186;
  unsigned int v187;
  int v188;
  int v189;
  unsigned int v190;
  int v191;
  int v192;
  unsigned int v193;
  char v194;
  unsigned int v195;
  int v196;
  unsigned int v197;
  unsigned int v198;
  int v199;
  int v200;
  int v201;
  char v202;
  int v203;
  unsigned int v204;
  int v205;
  int v206;
  int v207;
  uint64_t v208;
  int v209;
  char *v210;
  int v211;
  unsigned int v212;
  uint64_t v213;
  int v214;
  unsigned __int8 v215;
  unint64_t v216;
  char *v217;
  int v218;
  unsigned int v219;
  unsigned int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  uint64_t v225;
  unsigned int v226;
  int v227;
  int v228;
  unsigned int v229;
  int v230;
  unsigned int v231;
  int v232;
  uint64_t v233;
  unsigned __int8 *v234;
  unsigned __int8 *v235;
  unsigned int v236;
  uint64_t v237;
  int v238;
  uint64_t v239;
  int v240;
  unsigned int v241;
  int v242;
  unsigned int v243;
  int v244;
  unsigned int v245;
  unsigned int v246;
  unsigned int v247;
  char *v248;
  uint64_t v249;
  int v250;
  uint64_t v251;
  char *v252;
  unsigned int v253;
  int v254;
  unsigned int v255;
  int v256;
  unsigned int v257;
  int v258;
  unsigned int v259;
  int v260;
  int v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int v264;
  unsigned int v265;
  int v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  unsigned int v270;
  unsigned int v271;
  unsigned int v272;
  int v273;
  int v274;
  unsigned int v275;
  int v276;
  int v277;
  unsigned int v278;
  unsigned int v279;
  unsigned int v280;
  unsigned int v281;
  int v282;
  unsigned int v283;
  unsigned int v284;
  unsigned int v285;
  int v286;
  unsigned int v287;
  unsigned int v288;
  unsigned int v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  int v293;
  unsigned int v294;
  unsigned int v295;
  int v296;
  unsigned int v297;
  unsigned int v298;
  int v299;
  int v300;
  unsigned int v301;
  unsigned int v302;
  unsigned int v303;
  int v304;
  int v305;
  unsigned int v306;
  unsigned int v307;
  int v308;
  int v309;
  unsigned int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned int v313;
  unsigned int v314;
  int v315;
  unsigned int v316;
  unsigned int v317;
  unsigned int v318;
  int v319;
  unsigned int v320;
  int v321;
  int v322;
  unsigned int v323;
  int v324;
  unsigned int v325;
  int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  int v330;
  int v331;
  unsigned int v332;
  int v333;
  unsigned int v334;
  unsigned int v335;
  int v336;
  unsigned int v337;
  unsigned int v338;
  int v339;
  unsigned int v340;
  unsigned int v341;
  unsigned int v342;
  unsigned int v343;
  int v344;
  int v345;
  int v346;
  int v347;
  int v348;
  unsigned int v349;
  unsigned int v350;
  unsigned int v351;
  unsigned int v352;
  int v353;
  unsigned int v354;
  int v355;
  unsigned int v356;
  unsigned int v357;
  int v358;
  int v359;
  int v360;
  int v361;
  unsigned int v362;
  unsigned int v363;
  unsigned int v364;
  unsigned int v365;
  int v366;
  unsigned int v367;
  unsigned int v368;
  int v369;
  int v370;
  unsigned int v371;
  unsigned int v372;
  unsigned int v373;
  int v374;
  int v375;
  unsigned int v376;
  unsigned int v377;
  int v378;
  unsigned int v379;
  int v380;
  unsigned int v381;
  int v382;
  unint64_t v383;
  int v384;
  int v385;
  unsigned int v386;
  unsigned int v387;
  int v388;
  unsigned int v389;
  unsigned int v390;
  int v391;
  unsigned int v392;
  int v393;
  unsigned int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  int v398;
  int v399;
  unsigned int v400;
  unsigned int v401;
  unsigned int v402;
  unsigned int v403;
  int v404;
  unsigned int v405;
  unsigned int v406;
  unsigned int v407;
  unsigned int v408;
  int v409;
  unsigned int v410;
  unsigned int v411;
  int v412;
  int v413;
  unsigned int v414;
  int v415;
  unsigned int v416;
  unsigned int v417;
  unsigned int v418;
  int v419;
  unsigned int v420;
  unsigned int v421;
  unsigned int v422;
  unsigned int v423;
  int v424;
  unsigned int v425;
  unsigned int v426;
  unsigned int v427;
  unsigned int v428;
  int v429;
  int v430;
  unsigned int v431;
  unsigned int v432;
  unsigned int v433;
  int v434;
  unsigned int v435;
  unsigned int v436;
  int v437;
  int v438;
  int v439;
  int v440;
  unsigned int v441;
  unsigned int v442;
  int v443;
  int v444;
  unsigned int v445;
  unsigned int v446;
  int v447;
  unsigned int v448;
  unsigned int v449;
  unsigned int v450;
  unsigned int v451;
  int v452;
  unsigned int v453;
  unsigned int v454;
  int v455;
  unsigned int v456;
  unsigned int v457;
  int v458;
  int v459;
  int v460;
  unsigned int v461;
  unsigned int v462;
  unsigned int v463;
  unsigned int v464;
  char *v465;
  int v466;
  int v467;
  char *v468;
  int v469;
  unsigned int v470;
  uint64_t v471;
  int v472;
  _BYTE *v473;
  int v474;
  int v475;
  int v476;
  int v477;
  char *v478;
  int v479;
  int v480;
  int v481;
  int v482;
  int v483;
  int v484;
  int v485;
  unsigned int v486;
  uint64_t v487;
  char *v488;
  unsigned int v489;
  uint64_t v490;
  char *v491;
  uint64_t v492;
  uint64_t v493;
  unsigned int v494;
  unsigned int v495;
  unsigned int v496;
  int v497;
  unsigned int v498;
  unsigned int v499;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  char *v518;
  uint64_t v519;
  char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  unsigned int v539;
  unsigned int v540;
  int v541;
  uint64_t v542;
  unsigned int v543;
  unsigned int v544;
  char v545;
  int v546;
  int v547;
  int v548;
  int v549;
  unsigned int v550;
  unsigned int v551;
  unsigned int v552;
  unsigned int v553;
  unsigned int v554;
  int v555;
  unsigned int v556;
  char v557;
  unsigned int v558;
  unsigned __int8 v559;
  uint64_t v560;

  v59 = (uint64_t)*(&off_24DA380E0 + v56 - 415);
  v60 = v56 - 113;
  *(_DWORD *)(v58 - 220) = v56 + 655;
  v61 = v56;
  v62 = v59 - 8;
  v63 = (char *)*(&off_24DA380E0 + v61 - 525) - 8;
  LOBYTE(v59) = (*(_BYTE *)(v58 - 207) ^ 0xB6) + v63[*(unsigned __int8 *)(v58 - 207) ^ 0xCCLL] - 43;
  v64 = v59 & (v60 ^ 0xDD);
  v65 = (v59 ^ 0x65) << v64;
  v66 = (char *)*(&off_24DA380E0 + v61 - 458) - 12;
  v67 = (uint64_t)*(&off_24DA380E0 + v61 - 563);
  LODWORD(v59) = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 201) ^ 0x26));
  HIDWORD(v69) = v59 ^ 2;
  LODWORD(v69) = (v59 ^ 0xFFFFFFEF) << 24;
  v68 = v69 >> 26;
  v70 = *(unsigned __int8 *)(v62 + (*(unsigned __int8 *)(v58 - 200) ^ 0x60)) - 67;
  *(_DWORD *)(v58 - 224) = v70;
  v71 = *(unsigned __int8 *)(v58 - 199);
  *(_QWORD *)(v58 - 240) = v57;
  LODWORD(v71) = (v71 ^ 0xFFFFFFCF) + v63[v71 ^ 0xB5] - 43;
  *(_DWORD *)(v58 - 256) = v71;
  v72 = ((v70 ^ 0xA5) << 24) | ((v71 ^ 0xD7) << 16);
  HIDWORD(v69) = v66[*(unsigned __int8 *)(v58 - 198) ^ 0x21];
  LODWORD(v69) = (HIDWORD(v69) ^ 0x12) << 24;
  LOBYTE(v71) = (v69 >> 25) ^ 0x75;
  v73 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 197) ^ 0x66));
  HIDWORD(v69) = v73 ^ 2;
  LODWORD(v69) = (v73 ^ 0xFFFFFFEF) << 24;
  v74 = (v69 >> 26) | (v71 << 8);
  v75 = (v74 | v72) - ((2 * (v74 | v72)) & 0x4671C8BA) - 1556552611;
  v76 = (char *)*(&off_24DA380E0 + (v61 ^ 0x29B)) - 12;
  LOBYTE(v71) = v76[v68 ^ 0xC5] + 6;
  v559 = (-112 * v71) ^ v71;
  if ((v75 ^ 0xF0F54E00) >= 0xE88F79C0)
    v77 = (v75 ^ 0xF0F54E31) - 2 * (((v75 ^ 0xF0F54E31) + 393250368) & 0x495D8417 ^ v75 & 6) + 1624115793;
  else
    v77 = v75 ^ 0xB9A8CA20;
  if ((v75 ^ 0xF0F54E00) >= 0xE88F79C0)
    v78 = -47;
  else
    v78 = 17;
  v557 = v78;
  v79 = v77 == 1230865425;
  v80 = (v65 << (v64 ^ 0x10)) - 1889752832 - ((2 * (v65 << (v64 ^ 0x10))) & 0xB800D4);
  HIDWORD(v82) = v66[*(unsigned __int8 *)(v58 - 206) ^ 0x82];
  LODWORD(v82) = (HIDWORD(v82) ^ 0x12) << 24;
  v81 = v82 >> 25;
  v83 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 205) ^ 0xE8));
  HIDWORD(v82) = v83 ^ 2;
  LODWORD(v82) = (v83 ^ 0xFFFFFFEF) << 24;
  v84 = v82 >> 26;
  HIDWORD(v82) = v66[*(unsigned __int8 *)(v58 - 202) ^ 0x2FLL];
  LODWORD(v82) = (HIDWORD(v82) ^ 0x12) << 24;
  v85 = v82 >> 25;
  v86 = *(_BYTE *)(v62 + (*(unsigned __int8 *)(v58 - 208) ^ 0x98));
  LOBYTE(v83) = *(_BYTE *)(v62 + (*(unsigned __int8 *)(v58 - 204) ^ 0x21));
  v87 = v80 + 106;
  v88 = (v80 + 106) ^ 0x8F5CA900 | ((v81 ^ 0x1D) << 8);
  v89 = (*(_BYTE *)(v58 - 203) ^ 0xC3) + v63[*(unsigned __int8 *)(v58 - 203) ^ 0xB9];
  HIDWORD(v82) = v66[*(unsigned __int8 *)(v58 - 194) ^ 0xECLL];
  LODWORD(v82) = (HIDWORD(v82) ^ 0x12) << 24;
  v90 = v82 >> 25;
  LOBYTE(v80) = (*(_BYTE *)(v58 - 195) ^ 0xDF) + v63[*(unsigned __int8 *)(v58 - 195) ^ 0xA5];
  v91 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v58 - 193) ^ 0x48));
  HIDWORD(v82) = v91 ^ 2;
  LODWORD(v82) = (v91 ^ 0xFFFFFFEF) << 24;
  v92 = v90 ^ 0x4D5144;
  v93 = (*(_BYTE *)(v62 + (*(unsigned __int8 *)(v58 - 196) ^ 0x6DLL)) - 67) ^ 0x53u;
  v94 = (char *)*(&off_24DA380E0 + v61 - 497) - 4;
  v95 = (v80 - 43) ^ 0xDDu;
  v96 = (char *)*(&off_24DA380E0 + (v61 ^ 0x203)) - 12;
  v97 = *(_DWORD *)&v96[4 * v95] ^ *(_DWORD *)&v94[4 * v93];
  v98 = v92 - ((2 * v92) & 0xC2);
  LODWORD(v93) = v92 ^ 0x82;
  v99 = (char *)*(&off_24DA380E0 + v61 - 403) - 4;
  LODWORD(v95) = v97 ^ (v98 + 932987745) ^ *(_DWORD *)&v99[4 * v93];
  v100 = v76[(v82 >> 26) ^ 0xB9] + 6;
  v101 = ((-112 * v100) ^ v100) - ((2 * ((-112 * v100) ^ v100)) & 0xB4) + 1877217114;
  v102 = BYTE2(v95) ^ 0x16;
  v103 = v76[(v87 ^ v84 ^ 0xC5)] + 6;
  v104 = ((BYTE1(v88) ^ 0x61) - 2 * (((v88 >> 8) ^ 0x6C4061) & 0x77 ^ (v88 >> 8) & 0x16) + 932987745) ^ *(_DWORD *)&v94[4 * ((v86 - 67) ^ 0x92)] ^ *(_DWORD *)&v96[4 * (HIWORD(v87) ^ 0x8F5B)] ^ *(_DWORD *)&v99[4 * (BYTE1(v88) ^ 0xE3)] ^ ((-112 * v103) ^ v103);
  *(_DWORD *)(v58 - 232) = v55;
  v105 = (char *)*(&off_24DA380E0 + v61 - 554) - 12;
  v106 = (char *)*(&off_24DA380E0 + (v61 ^ 0x2B3)) - 4;
  v107 = (v102 + 1056490011 + ((2 * v102 + 3974) & 0x14AE ^ 0xFFCD7FFF)) ^ *(_DWORD *)&v105[4 * (BYTE2(v95) ^ 0xED)] ^ (*(_DWORD *)&v106[4 * (BYTE1(v95) ^ 0xFA)] + 1964548262);
  LODWORD(v538) = v101 ^ v95;
  v108 = v101 ^ v95 ^ 0xF0B0C7DE;
  *(_DWORD *)(v58 - 248) = v61;
  v109 = (char *)*(&off_24DA380E0 + v61 - 443) - 12;
  LOBYTE(v87) = v109[BYTE3(v95) ^ 0x98];
  v110 = 107 * v87 - ((22 * v87 + 8) & 0x10) + 60;
  v111 = (char *)*(&off_24DA380E0 + (v61 ^ 0x2BB)) - 8;
  LODWORD(v534) = v104 ^ 0x5F2327A9;
  v112 = *(_DWORD *)&v111[4 * (v108 ^ 0x2E)] ^ v102 ^ v104 ^ 0x5F2327A9 ^ (v107
                                                                                          - ((2 * v107) & 0x91364566)
                                                                                          + 1218126515) ^ ((2 * (v110 ^ 8) * (v110 ^ 8) - ((4 * (v110 ^ 8) * (v110 ^ 8)) & 0x10) + 8) ^ v110);
  LOWORD(v102) = (v85 ^ 0xDF) - ((2 * (v85 ^ 0xFFDF)) & 0x112) - 14455;
  v113 = *(_DWORD *)&v94[4 * ((v83 - 67) ^ 0xAD)] ^ *(_DWORD *)&v96[4
                                                                                   * ((v89 - 43) ^ 0x48)] ^ ((v102 & 0x6DFF ^ 0x16DED7AD) + 932987745 + ((2 * (v102 & 0x6DFF ^ 0x16DED7AD)) & 0x82C2 ^ 0xD2C7FBFF) + 1) ^ *(_DWORD *)&v99[4 * (v102 & 0xE8 ^ ((v85 ^ 0xFFFFFFDF) & 0x17 | 0x60))] ^ v559;
  v114 = (v113 ^ 0xB487BDDD) + 1;
  v115 = ((v113 ^ 0xD0F4F52E) + 1685276916) ^ v113;
  v116 = v115 ^ 0xE718127A ^ ((v113 ^ 0xB487BDDD) - ((2 * v114) & 0xA73F5F4E) + 1402974120);
  v117 = (v115 ^ 0x4B784222)
       + 1685276915
       + (v113 ^ 0x92F36F5B ^ ((((v115 ^ 0x4B784222) + v116 + 1) ^ v114)
                             - ((2 * (((v115 ^ 0x4B784222) + v116 + 1) ^ v114)) & 0xB3165AF2)
                             - 645190279));
  v552 = v117;
  v118 = v557;
  if (!v79)
    v118 = v75 ^ 0x20;
  v119 = *(_DWORD *)&v99[4 * (BYTE1(v75) ^ 0xCC)];
  v120 = v76[v118 ^ 0x67] + 6;
  v554 = v117 ^ 0xD8F41941 ^ v112;
  LODWORD(v533) = *(_DWORD *)&v96[4 * (*(_DWORD *)(v58 - 256) ^ 0x5D)] ^ *(_DWORD *)&v94[4 * (*(_DWORD *)(v58 - 224) ^ 0xB2)] ^ ((v119 ^ 0x379C4361) + (BYTE1(v75) | 0x16DE9200) - 2 * ((v119 ^ 0x169C0261) & (BYTE1(v75) | 0x16DE9200))) ^ ((-112 * v120) ^ v120);
  HIDWORD(v532) = v554 ^ 0x285F7DA;
  v121 = v554 ^ 0x285F7DA ^ v533;
  v122 = v108 - ((2 * v108) & 0xCD975B3E) + 1724624287;
  LODWORD(v532) = v121 ^ 0x39E88A36;
  v123 = v121 ^ 0x39E88A36 ^ v122;
  v124 = BYTE2(v123) ^ 0x2C;
  v125 = (*(_DWORD *)&v106[4 * (BYTE1(v123) ^ 0xF3)] + 1964548262) ^ *(_DWORD *)&v105[4 * (BYTE2(v123) ^ 0xD7)] ^ (v124 - ((2 * v124 + 3583878) & 0x3294AE) + 1056490010);
  v126 = 107 * v109[HIBYTE(v123) ^ 0x7DLL];
  v127 = (v126 ^ 0x80) - 2 * ((v126 + 52) & 0x4D ^ v126 & 1);
  HIDWORD(v531) = v123;
  v128 = v127 ^ 0x12 ^ (2 * (v127 ^ 0x4C) * (v127 ^ 0x4C)
                                       - ((4 * (v127 ^ 0x4C) * (v127 ^ 0x4C)) & 0x99)
                                       + 76) ^ *(_DWORD *)&v111[4
                                                              * (v121 ^ 0x36 ^ (v108 - ((2 * v108) & 0x3E) - 97) ^ 0x47)] ^ v124 ^ (v125 - ((2 * v125) & 0x91364566) + 1218126515);
  v129 = v128 ^ v117 ^ 0xD8F41941;
  v558 = v129;
  v130 = (v129 ^ 0xC411F2FB) - ((2 * (v129 ^ 0xC411F2FB)) & 0xCD975B3E) + 1724624287;
  v131 = v130 ^ v122;
  v132 = *(_DWORD *)&v106[4
                        * (((unsigned __int16)(((v129 ^ 0xF2FB)
                                                               - ((2 * (v129 ^ 0xF2FB)) & 0x5B3E)
                                                               - 21089) ^ (v108 - ((2 * v108) & 0x5B3E) - 21089)) >> 8) ^ 0xF0)];
  v133 = v132 - ((2 * v132 + 707871052) & 0x3BDC5A3A) - 1828270653;
  v134 = ((v133 & 0x78A1C70B ^ 0x3820400A | 0x5FECB282) - (v133 & 0x78A1C70B ^ 0x3820400A | 0xA0134D7D) - 1609347715) ^ 0x7B38B780;
  HIDWORD(v533) = v112;
  v135 = v112 ^ 0x1A168BC1 ^ v128;
  v136 = (((2 * v134) | 0xBE01DBC2) - v134 + 553587231) ^ 0xC6BA80FD;
  if (!v559)
    v136 = v133;
  v137 = ((v131 ^ 0x9448C221) >> 16) ^ 0x42;
  v138 = (v136 ^ 0x1DEE2D1D | v133 & 0x875E38F4 ^ 0x54E2814) ^ *(_DWORD *)&v105[4
                                                                              * (((v131 ^ 0x9448C221) >> 16) ^ 0xB9)] ^ (v137 - ((2 * v137 + 3583878) & 0x3294AE) + 1056490010);
  v139 = v109[HIBYTE(v131) ^ 0x93];
  v140 = 107 * v139 - ((-42 * v139 + 104) & 0xA2) + 5;
  v540 = v131;
  LODWORD(v531) = v135;
  v141 = ((2 * (v140 ^ 0x51) * (v140 ^ 0x51) - ((4 * (v140 ^ 0x51) * (v140 ^ 0x51)) & 0xA0) - 47) ^ v140) ^ *(_DWORD *)&v111[4 * (v131 ^ 0xF)] ^ v135 ^ v137 ^ (v138 - ((2 * v138) & 0x91364566) + 1218126515);
  v142 = (2 * (v131 & 0x20)) ^ 0x40 | v131 & 0x20;
  v143 = v121 ^ 0xCF851F8 ^ v130;
  v556 = v141;
  v546 = v141 ^ v129;
  v144 = v141 ^ v129 ^ 0xC448E1D3;
  HIDWORD(v530) = v143;
  v145 = v144 ^ (v143 - ((2 * v143) & 0x2168EA82) - 1867221695);
  v79 = ((v145 ^ 0xECCBB0E0) & (v142 - 32)) == 0;
  v146 = v142 + 507222952;
  v147 = v142 ^ 0x1E3B9BE8;
  if (v79)
    v147 = v146;
  v148 = ((v145 ^ 0xECCBB0F1) - 507222984 + v147) ^ (v131 ^ 0x9448C221) & 0xFFFFFFDF;
  v149 = ((v148 ^ 0xBE36D886) >> 16);
  v150 = (v149 ^ 0x42) - 1935976509 + (v149 ^ 0x42) - 2 * (((v149 ^ 0x42) - 1935976509) & (v149 ^ 0x42));
  v151 = (*(_DWORD *)&v106[4
                         * (((unsigned __int16)(((v145 ^ 0xB0F1) + 25656 + v147) ^ (v131 ^ 0xC221) & 0xFFDF) >> 8) ^ 0xEA)]
        + 1964548262) ^ *(_DWORD *)&v105[4 * (v149 ^ 0xB9)] ^ (v150 - ((2 * v150) & 0x32D4AE) - 1302500777);
  v152 = 107 * v109[HIBYTE(v148) ^ 0xB9];
  v153 = v141 ^ *(_DWORD *)&v111[4 * (v148 ^ 0xA8)] ^ (v151 - ((2 * v151) & 0x91364566) + 1218126515);
  LOBYTE(v150) = v152 - 2 * ((v152 + 52) & 0x5F ^ v152 & 2) - 111;
  v549 = v153 ^ v150 ^ 0x12 ^ (2 * (v150 ^ 0x5D) * (v150 ^ 0x5D)
                                                               - ((4 * (v150 ^ 0x5D) * (v150 ^ 0x5D)) & 0xBB)
                                                               + 93);
  HIDWORD(v529) = ((v549 ^ 0xA38372C2) - ((2 * (v549 ^ 0xA38372C2)) & 0x2168EA82) - 1867221695) ^ v144;
  v154 = HIDWORD(v529) ^ 0xEF36D886;
  LODWORD(v530) = v145;
  v155 = HIDWORD(v529) ^ 0xEF36D886 ^ v145;
  v156 = v155 ^ v148 ^ 0xBE36D886;
  v157 = *(_DWORD *)&v105[4 * (BYTE2(v156) ^ 0xC)];
  v158 = v157 & 0xBFFFFFFF ^ (((BYTE2(v156) ^ 0xF7) - 1935976509) ^ BYTE2(v156) ^ 0xF7 | v157 & 0x40000000) ^ 0xB25D6A57 ^ (*(_DWORD *)&v106[4 * (((BYTE1(v156) ^ 0xAA) - ((2 * ((v156 >> 8) ^ 0x1BB5AA)) & 0x1F0) + 248) ^ 0xCA)] + 1964548262);
  v159 = v109[HIBYTE(v156) ^ 0x1CLL];
  v160 = (~(-42 * v159 + 104) | 0x1D) + 107 * v159 + 38;
  v161 = ((2 * (v160 ^ 0x71) * (v160 ^ 0x71) - ((4 * (v160 ^ 0x71) * (v160 ^ 0x71)) & 0xE0) - 15) ^ v160) ^ *(_DWORD *)&v111[4 * ((v155 ^ v148 ^ 0x86) ^ 0x78)] ^ v549 ^ 0xA38372C2 ^ (v158 - ((2 * v158) & 0x91364566) + 1218126515);
  v162 = v161 ^ (v154 - ((2 * v154) & 0xF1E6AFA) - 2020657795) ^ 0xB51C49B3;
  v548 = v161 ^ (v154 - ((2 * v154) & 0xF1E6AFA) - 2020657795);
  v543 = v155;
  HIDWORD(v537) = v155 ^ 0x4CB5AA56 ^ v162;
  v163 = ((HIDWORD(v537) ^ v156 ^ 0x2F8372D0) >> (v153 & 0x10 ^ 0x10) >> (v153 & 0x10));
  v164 = v163 ^ 0x42;
  v165 = (*(_DWORD *)&v106[4 * (((unsigned __int16)(WORD2(v537) ^ v156) >> 8) ^ 0x40)] + 1964548262) ^ *(_DWORD *)&v105[4 * (v163 ^ 0xB9)] ^ ((v163 ^ 0x42) + 1056490011 + ((2 * (v163 ^ 0x42) + 3974) & 0x14AE ^ 0xFFCD7FFF));
  v166 = 107 * v109[((HIDWORD(v537) ^ v156) >> 24) ^ 0x28];
  v167 = v166 - 2 * ((v166 + 52) & 0x77 ^ v166 & 3) + 40;
  LODWORD(v529) = v161;
  v168 = ((2 * (v167 ^ 0x74) * (v167 ^ 0x74) - ((4 * (v167 ^ 0x74) * (v167 ^ 0x74)) & 0xE8) - 12) ^ v167) ^ *(_DWORD *)&v111[4 * ((BYTE4(v537) ^ v156) ^ 0xFE)] ^ v161 ^ v164 ^ (v165 + 1218126515 + (~(2 * v165) | 0x6EC9BA99) + 1);
  v169 = v162
       - 2 * (v162 & 0x29A88C9E ^ (v161 ^ (v154 - ((2 * v154) & 0xFA) + 125)) & 8);
  v170 = v168 ^ v155 ^ 0x978372D0;
  HIDWORD(v528) = HIDWORD(v537) ^ v156 ^ 0x5CC9E181;
  v171 = v170 ^ HIDWORD(v528);
  v172 = v170 ^ HIDWORD(v528) ^ 0xF24F9931;
  v173 = BYTE2(v172) ^ 0xC4;
  v174 = (*(_DWORD *)&v106[4 * (BYTE1(v172) ^ 0x4A)] + 1964548262) ^ *(_DWORD *)&v105[4 * (BYTE2(v172) ^ 0x3F)] ^ (v173 - ((2 * v173 + 3583878) & 0x3294AE) + 1056490010);
  v175 = v109[((v170 ^ HIDWORD(v528)) >> 24) ^ 0x14];
  v176 = 107 * v175 - ((104 - 42 * v175) & 0xD2) + 29;
  v177 = v176 ^ 0x12 ^ (2 * (v176 ^ 0x69) * (v176 ^ 0x69)
                                       - ((4 * (v176 ^ 0x69) * (v176 ^ 0x69)) & 0xD0)
                                       - 23) ^ *(_DWORD *)&v111[4 * ((v170 ^ BYTE4(v528)) ^ 0xAF)] ^ v173 ^ (v174 - ((2 * v174) & 0x91364566) + 1218126515);
  v178 = ((v168 ^ v155 ^ 0xFDFFFFFF) + 1362548871) ^ ((v168 ^ v155 ^ 0xACC92779) + 1);
  HIDWORD(v527) = (v168 ^ v155 ^ 0x33E867D ^ (v178 - ((2 * v178) & 0xA010BDF6) + 1342725883)) + 1362548870;
  v179 = v177 - ((2 * v177) & 0x5351192C) + 698911894;
  v180 = v179 ^ (v169 + 698911894);
  v181 = v180 ^ ((v168 ^ v155 ^ 0x5336D886) - 1204365177 + ((2 * v170) & 0x706DB10C ^ 0xFF96EFF3));
  v182 = ((v181 ^ 0x90ED6669 ^ v171) >> 16);
  v183 = *(_DWORD *)&v105[4 * (v182 ^ 0xF3)];
  v182 ^= 8u;
  v184 = (*(_DWORD *)&v106[4 * (((unsigned __int16)(v181 ^ 0x6669 ^ v171) >> 8) ^ 0xA1)] + 1964548262) ^ v183 ^ (v182 - ((2 * v182 + 3583878) & 0x3294AE) + 1056490010);
  v185 = v109[((v181 ^ 0x90ED6669 ^ v171) >> 24) ^ 0xD5];
  v186 = 107 * v185 - ((104 - 42 * v185) & 0xC8) - 104;
  LODWORD(v527) = v181 ^ 0x90ED6669 ^ v171;
  v187 = ((2 * (v186 ^ 0x64) * (v186 ^ 0x64) - ((4 * (v186 ^ 0x64) * (v186 ^ 0x64)) & 0xC8) + 100) ^ v186) ^ *(_DWORD *)&v111[4 * (v181 ^ 0x69 ^ v171 ^ 0x6D)] ^ v182 ^ (v184 - ((2 * v184) & 0x91364566) + 1218126515);
  v188 = v168 ^ 0x3145EAFF ^ (v169 + 698911894);
  LODWORD(v528) = v168 ^ 0x3145EAFF;
  v555 = v179 ^ v168 ^ 0x3145EAFF;
  v189 = v187 ^ v188 ^ 0x74F348AA;
  *(_DWORD *)(v58 - 256) = v187 ^ v188;
  v190 = v189 ^ v172;
  v191 = ((v190 ^ 0x8643E89C) >> 16);
  v192 = v191 ^ 0x42;
  v193 = (*(_DWORD *)&v106[4 * (BYTE1(v190) ^ 0xDA)] + 1964548262) ^ *(_DWORD *)&v105[4 * (v191 ^ 0xB9)] ^ (v192 + 1056490011 + ((2 * v192 + 3974) & 0x14AE ^ 0xFFCD7FFF));
  v194 = v109[HIBYTE(v190) ^ 0x81];
  LOBYTE(v161) = 107 * v194 - ((104 - 42 * v194) & 0xB4) - 114;
  HIDWORD(v526) = v555 ^ 0x12 ^ v187;
  v195 = ((2 * (v161 ^ 0x5A) * (v161 ^ 0x5A) - ((4 * (v161 ^ 0x5A) * (v161 ^ 0x5A)) & 0xB4) + 90) ^ v161) ^ *(_DWORD *)&v111[4 * (v190 ^ 0xB2)] ^ HIDWORD(v526) ^ v192 ^ (v193 - ((2 * v193) & 0x91364566) + 1218126515);
  LODWORD(v526) = v189 ^ v181 ^ 0x90ED6669;
  v196 = v195 ^ v187 ^ v188;
  v197 = v195;
  v551 = v195;
  v198 = v196 ^ v526 ^ 0xA7C9B52F ^ v190 ^ 0x8643E89C;
  v199 = BYTE2(v198) ^ 0xFB;
  v200 = (*(_DWORD *)&v106[4 * (((unsigned __int16)(v198 ^ 0x9BFE) >> 8) ^ 0x26)] + 1964548262) ^ *(_DWORD *)&v105[4 * BYTE2(v198)] ^ (v199 - ((2 * v199 + 3583878) & 0x3294AE) + 1056490010);
  v201 = *(_DWORD *)&v111[4 * (v198 ^ 0x69)];
  *(_DWORD *)(v58 - 224) = v198;
  v202 = v109[HIBYTE(v198) ^ 0x1FLL];
  LOBYTE(v198) = (((2 * (107 * v202 - ((86 * v202 + 104) & 0x62) - 27)) ^ 0x62)
                * ((107 * v202 - ((86 * v202 + 104) & 0x62) - 27) ^ 0x31)) ^ (107 * v202
                                                                            - ((86 * v202 + 104) & 0x62)
                                                                            - 27);
  v553 = ((((v198 ^ 0x5C) + (v198 ^ 0xB1) + 1) ^ 0xFC) + (v198 ^ 0xB1)) ^ v201 ^ v199 ^ (v200 - ((2 * v200) & 0x91364566) + 1218126515);
  HIDWORD(v525) = v558 ^ 0xC89FE9A1;
  LODWORD(v537) = -1694064528
                - ((v188 ^ 0xD1305B3F)
                 + (v558 ^ 0xC89FE9A1))
                - ((1281335304 - 2 * ((v188 ^ 0xD1305B3F) + (v558 ^ 0xC89FE9A1))) & 0x69ADA0D8);
  HIDWORD(v536) = (v190 ^ 0x187AC8E7)
                + (v537 ^ 0xB4D6D06C)
                - (v556 ^ 0xDF26B822)
                - ((2 * ((v190 ^ 0x187AC8E7) + (v537 ^ 0xB4D6D06C) - (v556 ^ 0xDF26B822))) & 0x12990318)
                - 1991474804;
  HIDWORD(v524) = v197 ^ 0x1441DE2E;
  LODWORD(v525) = v556 ^ 0xDF26B822;
  v539 = (HIDWORD(v536) ^ 0x894C818C) - (v197 ^ 0x1441DE2E) - 1259669714;
  LODWORD(v523) = v549 ^ 0xCDA1119F;
  HIDWORD(v523) = v148 ^ 0xA08A177;
  LODWORD(v524) = v196 ^ v526 ^ 0xA7C9B52F ^ 0x3BE73813;
  v203 = (v552 ^ 0xF77128B0) + (v148 ^ 0xA08A177) + (v549 ^ 0xCDA1119F) + (v181 ^ 0x15213B6A) + v539 + v524 + 1365418918;
  LODWORD(v536) = v203 - ((2 * v203) & 0x598C84BC) + 751190622;
  HIDWORD(v521) = v196 ^ 0x775B5338;
  LODWORD(v522) = v540 ^ 0x43262AD5;
  LODWORD(v521) = v180 ^ 0x4FD35DCF;
  HIDWORD(v535) = (v536 ^ 0x2CC6425E)
                + (v543 ^ 0x9B3F3A56)
                - ((2 * ((v536 ^ 0x2CC6425E) + (v543 ^ 0x9B3F3A56))) & 0x3110CAD6)
                - 1735891605;
  v550 = (v543 ^ 0x9B3F3A56) - ((2 * (v543 ^ 0x9B3F3A56)) & 0x3110CAD6) - 1735891605;
  v204 = (v540 ^ 0x43262AD5)
       + (v548 ^ 0x4C8E417)
       - (v180 ^ 0x4FD35DCF)
       - (v196 ^ 0x775B5338)
       - 1113406941
       + (HIDWORD(v535) ^ 0x9888656B);
  LODWORD(v535) = v204 - ((2 * v204) & 0xA3CFA202) + 1374146817;
  v205 = (v538 ^ 0xF3A2669E) + (v554 ^ 0xB081F5BE) - (v171 ^ 0x94E7E521) + 810508149 + (v535 ^ 0x51E7D101);
  HIDWORD(v534) = v205 - ((2 * v205) & 0x323F7292) + 421509449;
  v206 = (HIDWORD(v534) ^ 0x191FB949) - ((2 * (HIDWORD(v534) ^ 0x191FB949) + 202424920) & 0x249060D0) + 2018546068;
  HIDWORD(a34) = v546 ^ 0xE70FBD2;
  v207 = (v206 ^ 0x12483068) + (v546 ^ 0xE70FBD2) - (v156 ^ 0x48A846C3);
  v547 = v207 - ((2 * v207) & 0x5AA9CB6E);
  v208 = *(_QWORD *)(v58 - 240);
  v209 = *(_DWORD *)(v58 - 248);
  v210 = (char *)*(&off_24DA380E0 + v209 - 535) - 8;
  v211 = ((*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78577) ^ 0xBA)
        + 1727828315
        + ((2
          * (((*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78577) ^ 0xBA) + 122) & 0x61 ^ (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78577) ^ 0xBA | 0x7FFFFFFE))) ^ 0x2004403)) ^ *(_DWORD *)&v210[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78577) ^ 0x4ALL)];
  v212 = v211 - ((2 * v211) & 0xAE4358F8);
  v213 = (uint64_t)*(&off_24DA380E0 + v209 - 478);
  v214 = *(unsigned __int8 *)(v213 + (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78575) ^ 0x58));
  HIDWORD(v216) = v214 ^ 0x1A;
  LODWORD(v216) = (v214 ^ 0x60) << 24;
  v215 = v216 >> 29;
  v217 = (char *)*(&off_24DA380E0 + v209 - 425) - 4;
  v218 = (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78572)
        - ((2 * *(unsigned __int8 *)(v208 - 0x226B0BD6D1B78572)) & 0x7C)
        + 1106878014) ^ *(_DWORD *)&v217[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78572) ^ 0x84)];
  v219 = ((*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856BLL) ^ 0xF7)
        + 1727828315
        + ((2 * (*(_BYTE *)(v208 - 0x226B0BD6D1B7856BLL) ^ 0xF7) - 12) & 0xC0 ^ 0xFDFFBBFF)) ^ *(_DWORD *)&v210[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856BLL) ^ 7)] ^ *(_DWORD *)&v217[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856ALL) ^ 0x38)] ^ (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856ALL) - ((2 * *(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856ALL)) & 0x7C) + 1106878014);
  v220 = v218 - ((2 * v218) & 0xAE4358F8);
  v221 = *(unsigned __int8 *)(v213 + (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78569) ^ 0x71));
  HIDWORD(v216) = v221 ^ 0x1A;
  LODWORD(v216) = (v221 ^ 0x60) << 24;
  LOBYTE(v218) = v216 >> 29;
  v222 = *(unsigned __int8 *)(v213 + (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78571) ^ 0xBDLL));
  v223 = v219 - 685659012 + (~(2 * v219) | 0x51BCA707);
  HIDWORD(v216) = v222 ^ 0x1A;
  LODWORD(v216) = (v222 ^ 0x60) << 24;
  LOBYTE(v196) = v216 >> 29;
  v224 = (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856ELL)
        - ((2 * *(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856ELL)) & 0x7C)
        + 1106878014) ^ *(_DWORD *)&v217[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856ELL) ^ 0x64)];
  v225 = (uint64_t)*(&off_24DA380E0 + (v209 ^ 0x210));
  v226 = *(_DWORD *)(v225 + 4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78570) ^ 0x6CLL)) ^ *(_DWORD *)&v210[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856FLL) ^ 0x36)] ^ ((*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856FLL) ^ 0xC6) + 1727828315 + ((2 * (*(_BYTE *)(v208 - 0x226B0BD6D1B7856FLL) ^ 0xC6) - 12) & 0xC0 ^ 0xFDFFBBFF));
  v519 = v213;
  v227 = *(unsigned __int8 *)(v213 + (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856DLL) ^ 0xF3));
  HIDWORD(v216) = v227 ^ 0x1A;
  LODWORD(v216) = (v227 ^ 0x60) << 24;
  v544 = ((v226 ^ 0x8908343 ^ (v224 - ((2 * v224) & 0xAE4358F8) - 685659012))
        + ((v216 >> 29) ^ 0x80)
        - 2
        * ((v226 ^ 0x8908343 ^ (v224 - ((2 * v224) & 0xAE4358F8) - 685659012)) & ((v216 >> 29) ^ 0x80))) ^ 0xCEC6B093;
  v518 = (char *)*(&off_24DA380E0 + *(_DWORD *)(v58 - 248) - 425) - 4;
  v228 = *(_DWORD *)(v225 + 4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78578) ^ 0x7DLL)) ^ (v212 - 685659012) ^ v215 ^ 0x80 ^ *(_DWORD *)&v217[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78576) ^ 0xDALL)] ^ (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78576) - ((2 * *(unsigned __int8 *)(v208 - 0x226B0BD6D1B78576)) & 0x7C) + 1106878014) ^ 0x12606D30;
  v520 = v210;
  v229 = *(_DWORD *)(v225 + 4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78574) ^ 0x3FLL)) ^ *(_DWORD *)&v210[4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78573) ^ 0xBBLL)] ^ ((*(unsigned __int8 *)(v208 - 0x226B0BD6D1B78573) ^ 0x4B) + 1727828315 + ((2 * (*(_BYTE *)(v208 - 0x226B0BD6D1B78573) ^ 0x4B) - 12) & 0xC0 ^ 0xFDFFBBFF)) ^ v196 ^ (v220 - 685659012) ^ 0xCEED92B2;
  v517 = v225;
  v230 = (v223 + 1) ^ *(_DWORD *)(v225 + 4 * (*(unsigned __int8 *)(v208 - 0x226B0BD6D1B7856CLL) ^ 0x11)) ^ v218 ^ 0x80 ^ 0x643F2C50;
  v231 = ((((HIDWORD(v536) ^ 0x894C818C) - (v197 ^ 0x1441DE2E) + 672510991) ^ HIDWORD(v537)) & 0xE4A32FDE ^ 0x80E34C91)
       - ((2
         * ((((HIDWORD(v536) ^ 0x894C818C) - (v197 ^ 0x1441DE2E) + 672510991) ^ HIDWORD(v537)) & 0xE4A32FDE ^ 0x80E34C91)) & 0x49C05C00)
       - 1259323872;
  HIDWORD(v516) = *(_DWORD *)(v58 - 232) + 34149571;
  LODWORD(v516) = (v539 + 1932180705) ^ 0xECF3D8ED;
  LODWORD(v515) = v231 ^ 0xB4317FB9;
  HIDWORD(v515) = v231 ^ 0xB4317FB8;
  HIDWORD(v514) = v231 ^ 0x9EEE67DA;
  LODWORD(v514) = v555 ^ 0x22875218;
  HIDWORD(v513) = v555 ^ 0x40656474;
  LODWORD(v513) = v206 ^ 0x3C3341C5;
  HIDWORD(v512) = v206 ^ 0x287E5FF8;
  LODWORD(v512) = v206 ^ v189;
  LODWORD(v511) = v553 ^ *(_DWORD *)(v58 - 256);
  HIDWORD(v511) = v553 ^ v551;
  HIDWORD(v510) = v553 ^ v551 ^ v526 ^ 0xA7C9B52F;
  LODWORD(v509) = (v206 ^ 0x7BE0E41B) + 1;
  HIDWORD(v509) = (v555 ^ 0x30E5085C) + 1;
  v232 = *(_DWORD *)(v58 - 220);
  HIDWORD(v508) = v232 ^ 0x4F4;
  LODWORD(v508) = v232 ^ 0x4EB;
  HIDWORD(v507) = v232 ^ 0x4B2;
  LODWORD(v507) = v232 ^ 0x405;
  HIDWORD(v506) = HIDWORD(v535) ^ v550;
  LODWORD(v510) = v547 - 1386945097;
  LODWORD(v506) = ((v156 ^ 0x48A846C3) - 2 * ((v156 ^ 0x48A846C3) & 0x2D54E5BF ^ v156 & 8) - 1386945097) ^ (v547 - 1386945097);
  HIDWORD(v505) = v535 ^ ((v548 ^ 0x4C8E417) - ((2 * (v548 ^ 0x4C8E417)) & 0xA3CFA202) + 1374146817);
  LODWORD(v505) = v537 ^ ((v188 ^ 0xD1305B3F) - ((2 * (v188 ^ 0xD1305B3F)) & 0x69ADA0D8) - 1260990356);
  HIDWORD(v504) = HIDWORD(v534) ^ ((v171 ^ 0x94E7E521) - 2 * ((v171 ^ 0x94E7E521) & 0x191FB94D ^ v171 & 4) + 421509449);
  LODWORD(v504) = v536 ^ ((v181 ^ 0x15213B6A) + 751190622 + (~(2 * (v181 ^ 0x15213B6A)) | 0xA6737B43) + 1);
  HIDWORD(v503) = HIDWORD(v536) ^ v190 ^ 0x187AC8E7;
  LODWORD(v503) = v232 ^ 0x45D;
  HIDWORD(v502) = v232 ^ 0x4FD;
  LODWORD(v502) = v232 ^ 0x487;
  HIDWORD(v501) = v232 & 0x3AC4A29E;
  LODWORD(v501) = v232 ^ 0x4A8;
  HIDWORD(v538) = 0;
  v233 = v232 ^ 0x5FCu;
  *(_QWORD *)(v58 - 232) = 4;
  v234 = *(unsigned __int8 **)(v58 - 216);
  LODWORD(v213) = *(_DWORD *)(v225 + 4 * (v234[4] ^ 0x70));
  v560 = v232 ^ 0x4C8u;
  v235 = v234;
  v236 = ((v234[v560] ^ 0xA4) + 1727828315 + ((2 * (v234[v560] ^ 0xA4) - 12) & 0xC0 ^ 0xFDFFBBFF)) ^ *(_DWORD *)&v210[4 * (v234[v560] ^ 0x54)];
  *(_QWORD *)(v58 - 248) = 6;
  *(_QWORD *)(v58 - 240) = 13;
  v237 = v234[6];
  LODWORD(v208) = v237 ^ 0xB8;
  LODWORD(v237) = *(_DWORD *)&v518[4 * (v237 ^ 0x35)];
  HIDWORD(v216) = ((v234[13] ^ 0x88) + 1727828315 + ((2 * (v234[13] ^ 0x88) - 12) & 0xC0 ^ 0xFDFFBBFF)) ^ *(_DWORD *)&v210[4 * (v234[13] ^ 0x78)];
  LODWORD(v216) = HIDWORD(v216);
  LODWORD(v210) = (v235[14] + 1106878014 - ((2 * v235[14]) & 0x7C)) ^ *(_DWORD *)&v518[4 * (v235[14] ^ 0x20)];
  *(_QWORD *)(v58 - 256) = 7;
  LODWORD(v216) = (v216 >> 2) ^ __ROR4__((_DWORD)v210, 2) ^ 0x50AF8AA9;
  HIDWORD(v216) = v216;
  LODWORD(v234) = v216 >> 30;
  LODWORD(v210) = *(unsigned __int8 *)(v519 + (v235[7] ^ 0xBCLL));
  HIDWORD(v216) = v210 ^ 0x1A;
  LODWORD(v216) = (v210 ^ 0x60) << 24;
  v238 = v237 ^ v213 ^ (v208 + 1106878014 - ((2 * v208) & 0x7C)) ^ (v216 >> 29) ^ (v236
                                                                                                  - 685659012
                                                                                                  - ((2 * v236) & 0xAE4358F8));
  LODWORD(v237) = (_DWORD)v234 - 685659012 - ((2 * (_DWORD)v234) & 0xAE4358F8);
  LODWORD(v213) = ((v235[1] ^ 0x4B) + 1727828315 + ((2 * (v235[1] ^ 0x4B) - 12) & 0xC0 ^ 0xFDFFBBFF)) ^ *(_DWORD *)&v520[4 * (v235[1] ^ 0xBBLL)];
  LODWORD(v208) = *(unsigned __int8 *)(v519 + (v235[15] ^ 0xB4));
  HIDWORD(v216) = v208 ^ 0x1A;
  LODWORD(v216) = (v208 ^ 0x60) << 24;
  LOBYTE(v208) = v216 >> 29;
  LODWORD(v234) = *(unsigned __int8 *)(v519 + (v235[11] ^ 0xBCLL));
  HIDWORD(v216) = v234 ^ 0x1A;
  LODWORD(v216) = (v234 ^ 0x60) << 24;
  LODWORD(v208) = v237 ^ *(_DWORD *)(v225 + 4 * (v235[12] ^ 0x64)) ^ v208;
  v239 = v235[10];
  LODWORD(v234) = (v216 >> 29) - 685659012 - ((2 * (v216 >> 29)) & 0xF8);
  LODWORD(v225) = *(unsigned __int8 *)(v519 + (v235[3] ^ 0x8FLL));
  HIDWORD(v216) = v225 ^ 0x1A;
  LODWORD(v216) = (v225 ^ 0x60) << 24;
  v240 = (v213 - 685659012 - ((2 * v213) & 0xAE4358F8)) ^ *(_DWORD *)(v517 + 4 * (*v235 ^ 0x63)) ^ *(_DWORD *)&v518[4 * (v235[2] ^ 0x17)] ^ (v216 >> 29) ^ 0x80 ^ (v235[2] + 1106878014 - ((2 * v235[2]) & 0x7C));
  v241 = v240 - ((2 * v240) & 0xD624698E) + 1796355271;
  v242 = *(_DWORD *)&v518[4 * (v239 ^ 0x84)] ^ *(_DWORD *)(v517 + 4 * (v235[8] ^ 0xADLL)) ^ (v239
                                                                                           + 1106878014
                                                                                           - ((2 * v239) & 0x7C)) ^ *(_DWORD *)&v520[4 * (v235[9] ^ 0xA1)] ^ ((v235[9] ^ 0x51) + 1727828315 + ((2 * (v235[9] ^ 0x51) - 12) & 0xC0 ^ 0xFDFFBBFF)) ^ v234;
  v243 = v229 ^ v552 ^ 0xF77128B0 ^ (v238 - ((2 * v238) & 0x3DB8AFF6) - 1629726725);
  v244 = v242 - ((2 * v242) & 0xA8F01D2) + 88572137;
  v245 = v230 ^ v538 ^ (v208 - ((2 * v208) & 0x209D523A) - 1873893091);
  v246 = v544 ^ v533 ^ v244;
  v247 = v228 ^ v534 ^ v241;
  v248 = (char *)*(&off_24DA380E0 + (v232 ^ 0x4F4)) - 4;
  LODWORD(v213) = *(_DWORD *)&v248[4 * (HIBYTE(v247) ^ 0x99)] ^ 0x5ED975BB;
  v249 = (uint64_t)*(&off_24DA380E0 + (v232 ^ 0x4B2));
  LODWORD(v225) = *(_DWORD *)(v249 + 4 * (v245 ^ 0xA5u));
  v250 = -929595906 - (v213 & 0x812EC8CC) + ((v213 >> 1) & 0x53B76667);
  v251 = (uint64_t)*(&off_24DA380E0 + (v232 ^ 0x405));
  v252 = (char *)*(&off_24DA380E0 + (v232 ^ 0x4EB)) - 8;
  LODWORD(v208) = v213 ^ *(_DWORD *)&v252[4 * (BYTE2(v243) ^ 0xC1)];
  v253 = v225 - ((2 * v225 + 283460282) & 0xB286BC60) - 508166259;
  LODWORD(v208) = v208 ^ v250 ^ (v253 >> 1) ^ (v253 >> 4) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v246) ^ 0x93u))
                                                           + (BYTE1(v246) ^ 0xE3)
                                                           + 1359125172) ^ 0x29359AFB;
  v254 = v208 - ((2 * v208) & 0xB286BC60);
  v256 = (BYTE1(v245) ^ 0xD9) + 1359125172 + *(_DWORD *)(v251 + 4 * (BYTE1(v245) ^ 0xA9u));
  LODWORD(v208) = *(_DWORD *)(v249 + 4 * (v247 ^ 1u));
  v257 = v208 - ((2 * v208 + 283460282) & 0xA8F075A8) - 588587983;
  LODWORD(v208) = ((v257 >> 3) ^ 0xA8F075A)
                + (v257 ^ 0x54783AD4)
                - 2 * (((v257 >> 3) ^ 0xA8F075A) & (v257 ^ 0x14783AD4));
  v258 = (v208 >> 1) + 1417165524 - (v208 & 0xA8F075A8);
  if ((v243 & 4) != 0)
    v260 = 4;
  else
    v260 = -4;
  v261 = *(_DWORD *)(v249 + 4 * ((v260 + (v243 ^ 0xDE)) ^ 0x89u));
  v262 = v261 - ((2 * v261 + 283460282) & 0xA9B696BE) + 1565387964;
  v259 = *(_DWORD *)&v248[4 * (HIBYTE(v246) ^ 0xA4)] ^ 0x5ED975BB;
  v263 = *(_DWORD *)&v252[4 * (BYTE2(v245) ^ 0x91)] ^ v259 ^ ((BYTE1(v247) ^ 0x35)
                                                            + 1359125172
                                                            + *(_DWORD *)(v251 + 4 * (BYTE1(v247) ^ 0x45u))) ^ (-929595906 - (v259 & 0x812EC8CC) + ((v259 >> 1) & 0x53B76667)) ^ (v262 >> 1) ^ (v262 >> 4) ^ 0x6720111A;
  v264 = (v263 - ((2 * v263) & 0xA9B696BE) - 723825825) ^ v262;
  v265 = *(_DWORD *)&v248[4 * (HIBYTE(v245) ^ 0x1A)] ^ 0x5ED975BB;
  v266 = *(_DWORD *)(v249 + 4 * (v246 ^ 0x8Bu));
  v267 = v266 - ((2 * v266 + 283460282) & 0xCA9BD9DA) - 306147766;
  v268 = v253 ^ HIDWORD(v533) ^ (v254 + 1497587248);
  v255 = *(_DWORD *)&v248[4 * (HIBYTE(v243) ^ 0x2B)] ^ 0x5ED975BB;
  v269 = *(_DWORD *)&v252[4 * (BYTE2(v246) ^ 0x8E)] ^ HIDWORD(v532) ^ v255 ^ (-929595906
                                                                            - (v255 & 0x812EC8CC)
                                                                            + ((v255 >> 1) & 0x53B76667)) ^ v257 ^ v256 ^ v258;
  v270 = *(_DWORD *)&v252[4 * (BYTE2(v247) ^ 0xFA)] ^ HIDWORD(v531) ^ ((BYTE1(v243) ^ 0xE)
                                                                     + 1359125172
                                                                     + *(_DWORD *)(v251 + 4 * (BYTE1(v243) ^ 0x7Eu))) ^ v265 ^ v267 ^ (-929595906 - (v265 & 0x812EC8CC) + ((v265 >> 1) & 0x53B76667)) ^ (((v267 >> 4) ^ (v267 >> 1) ^ 0x34F228B8) + 1699605741 - 2 * (((v267 >> 4) ^ (v267 >> 1) ^ 0x34F228B8) & 0x654DECEF ^ ((v267 >> 4) ^ (v267 >> 1)) & 2));
  v271 = (v264 + 1724624287 - ((2 * v264) & 0xCD975B3E)) ^ v532;
  v272 = *(_DWORD *)&v248[4 * (HIBYTE(v268) ^ 0x34)] ^ 0x5ED975BB;
  v273 = ((unsigned __int16)((v264 - 21089 - ((2 * v264) & 0x5B3E)) ^ v532) >> 8);
  v541 = *(_DWORD *)(v251 + 4 * (v273 ^ 0xC3u)) + (v273 ^ 0xB3) + 1359125172;
  v274 = *(_DWORD *)(v249 + 4 * (v270 ^ 0x44u));
  v275 = v274 - ((2 * v274 + 283460282) & 0x501BE662) + 813733006;
  v276 = *(_DWORD *)&v248[4 * ((v269 ^ 0x61ADE6E7) >> 24)];
  v277 = *(_DWORD *)(v249 + 4 * (v268 ^ 0x47u));
  v278 = v277 - ((2 * v277 + 283460282) & 0x814D6DC6) - 921085888;
  v279 = v276 ^ (-929595906 - ((v276 ^ 0x5ED975BB) & 0x812EC8CC) + (((v276 ^ 0x5ED975BBu) >> 1) & 0x53B76667)) ^ *(_DWORD *)&v252[4 * (BYTE2(v271) ^ 0xA0)] ^ (v278 >> 1) ^ (v278 >> 4) ^ (*(_DWORD *)(v251 + 4 * (((unsigned __int16)(v270 ^ 0xB3C9) >> 8) ^ 0x70u)) + ((unsigned __int16)(v270 ^ 0xB3C9) >> 8) + 1359125172) ^ 0x7A8045A4;
  v280 = v279 - ((2 * v279) & 0x814D6DC6);
  v281 = *(_DWORD *)&v248[4 * (HIBYTE(v271) ^ 0x88)] ^ 0x5ED975BB;
  v282 = *(_DWORD *)(v249 + 4 * (v269 ^ 0x6Au));
  v283 = v282 - ((2 * v282 + 283460282) & 0x8ECC1CA6) - 807882832;
  v284 = *(_DWORD *)&v252[4 * ((v270 ^ 0xDCA0B3C9) >> 16)] ^ v281 ^ ((BYTE1(v268) ^ 0xED)
                                                                                    + 1359125172
                                                                                    + *(_DWORD *)(v251
                                                                                                + 4
                                                                                                * (BYTE1(v268) ^ 0x9Du))) ^ (-929595906 - (v281 & 0x812EC8CC) + ((v281 >> 1) & 0x53B76667)) ^ (v283 >> 1) ^ (v283 >> 4) ^ 0x27C567CC;
  v285 = *(_DWORD *)&v248[4 * (HIBYTE(v270) ^ 0x88)] ^ 0x5ED975BB;
  v286 = *(_DWORD *)(v249 + 4 * (v271 ^ 0x44u));
  v287 = v286 - ((2 * v286 + 283460282) & 0x64A99760) - 1161335539;
  v288 = v285 ^ (((unsigned __int16)(v269 ^ 0xE6E7) >> 8)
               + 1359125172
               + *(_DWORD *)(v251 + 4 * (((unsigned __int16)(v269 ^ 0xE6E7) >> 8) ^ 0x70u))) ^ (-929595906 - (v285 & 0x812EC8CC) + ((v285 >> 1) & 0x53B76667)) ^ *(_DWORD *)&v252[4 * (BYTE2(v268) ^ 0xB6)] ^ (v287 >> 1) ^ (v287 >> 4);
  v289 = v278 ^ HIDWORD(v525) ^ (v280 + 1084667619);
  v290 = *(_DWORD *)&v252[4 * (BYTE2(v269) ^ 0x32)] ^ v531 ^ v272 ^ v275 ^ (-929595906
                                                                          - (v272 & 0x812EC8CC)
                                                                          + ((v272 >> 1) & 0x53B76667)) ^ v541 ^ (((v275 >> 4) ^ (v275 >> 1) ^ 0x5E8626AB) - ((2 * ((v275 >> 4) ^ (v275 >> 1) ^ 0x5E8626AB)) & 0x501BE662) - 1475480783);
  v291 = v283 ^ HIDWORD(v530) ^ (v284 - ((2 * v284) & 0x8ECC1CA6) + 1197870675);
  v292 = v287 ^ v522 ^ ((v288 ^ 0x1A0F2963) + 844417968 - 2 * ((v288 ^ 0x1A0F2963) & 0x3254CBB4 ^ v288 & 4));
  v293 = *(_DWORD *)(v249
                   + 4
                   * ((v287 ^ v522 ^ ((v288 ^ 0x63) - 80 - 2 * ((v288 ^ 0x63) & 0xB4 ^ v288 & 4))) ^ 0xD9u));
  v294 = v293 - ((2 * v293 + 283460282) & 0x1A64C098) - 1784348247;
  v295 = *(_DWORD *)&v248[4 * (HIBYTE(v290) ^ 0x29)] ^ 0x5ED975BB;
  v296 = v525 ^ v295 ^ (v295 >> 1) & 0x53B76667 ^ *(_DWORD *)&v252[4 * (BYTE2(v289) ^ 8)];
  v297 = *(_DWORD *)&v248[4 * (HIBYTE(v289) ^ 0x6A)] ^ 0x5ED975BB;
  v298 = v296 ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v291) ^ 0xDAu)) + (BYTE1(v291) ^ 0xAA) + 1359125172) ^ v294 ^ 0x23259C3C ^ (((v294 >> 4) ^ (v294 >> 1) ^ 0x64A1622) + 221405260 - 2 * (((v294 >> 4) ^ (v294 >> 1) ^ 0x64A1622) & 0xD32605D ^ ((v294 >> 4) ^ (v294 >> 1)) & 0x11));
  v299 = ((unsigned __int16)(v287 ^ v522 ^ ((v288 ^ 0x2963)
                                                           - 13392
                                                           - 2 * ((v288 ^ 0x2963) & 0xCBB4 ^ v288 & 4))) >> 8);
  v300 = *(_DWORD *)(v249 + 4 * (v290 ^ 0xABu));
  v301 = v300 - ((2 * v300 + 283460282) & 0x1A9F45FC) + 365053019;
  v302 = *(_DWORD *)&v252[4 * (BYTE2(v291) ^ 0xF8)] ^ HIDWORD(a34) ^ v297 ^ v301 ^ (-929595906
                                                                                  - (v297 & 0x812EC8CC)
                                                                                  + ((v297 >> 1) & 0x53B76667)) ^ (((v301 >> 4) ^ (v301 >> 1) ^ 0x4E732B50) - ((2 * ((v301 >> 4) ^ (v301 >> 1) ^ 0x4E732B50)) & 0x1A9F45FC) - 1924160770) ^ (*(_DWORD *)(v251 + 4 * (v299 ^ 0xEAu)) + (v299 ^ 0x9A) + 1359125172);
  v303 = *(_DWORD *)&v248[4 * (HIBYTE(v291) ^ 0x29)] ^ 0x5ED975BB;
  v304 = *(_DWORD *)(v249 + 4 * (v289 ^ 0x56u));
  v305 = (BYTE1(v290) ^ 0xAA) + 1359125172 + *(_DWORD *)(v251 + 4 * (BYTE1(v290) ^ 0xDAu));
  v306 = v304 - ((2 * v304 + 283460282) & 0xFD1AFF42) - 2030034690;
  v307 = *(_DWORD *)&v248[4 * (HIBYTE(v292) ^ 0x25)] ^ 0x5ED975BB;
  v308 = (v307 >> 1) & 0x53B76667 ^ ((BYTE1(v289) ^ 0xAB) + 1359125172 + *(_DWORD *)(v251 + 4 * (BYTE1(v289) ^ 0xDBu)));
  v309 = *(_DWORD *)(v249 + 4 * (v291 ^ 0xABu));
  v310 = v309 - ((2 * v309 + 283460282) & 0x6A651DBE) - 1113247684;
  v311 = *(_DWORD *)&v252[4 * (BYTE2(v290) ^ 0xF8)] ^ v307 ^ (v308 - 929595906 - ((2 * v308) & 0x912EFBFC)) ^ (v310 >> 1) ^ (v310 >> 4) ^ 0x19CA6F82;
  v312 = *(_DWORD *)&v252[4 * (BYTE2(v292) ^ 0xA0)] ^ v530 ^ v303 ^ v305 ^ (-929595906
                                                                          - (v303 & 0x812EC8CC)
                                                                          + ((v303 >> 1) & 0x53B76667)) ^ v306 ^ (((v306 >> 4) ^ (v306 >> 1) ^ 0x70AE682A) - ((2 * ((v306 >> 4) ^ (v306 >> 1) ^ 0x70AE682A)) & 0xFD1AFF42) - 24281183);
  v313 = v310 ^ HIDWORD(v523) ^ (v311 - ((2 * v311) & 0x6A651DBE) + 892505823);
  v314 = *(_DWORD *)&v248[4 * (HIBYTE(v298) ^ 0x4B)] ^ 0x5ED975BB;
  v315 = *(_DWORD *)(v249 + 4 * (v313 ^ 0xDCu));
  v316 = v315 - ((2 * v315 + 283460282) & 0xAE8EC43C) + 1606026107;
  v317 = *(_DWORD *)&v252[4 * (BYTE2(v302) ^ 0x89)] ^ v523 ^ v314 ^ (-929595906
                                                                   - (v314 & 0x812EC8CC)
                                                                   + ((v314 >> 1) & 0x53B76667)) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v312) ^ 0x6Au))
                                                                                                  + (BYTE1(v312) ^ 0x1A)
                                                                                                  + 1359125172) ^ v316 ^ (((v316 >> 4) ^ (v316 >> 1) ^ 0x66D7C72E) - 2 * (((v316 >> 4) ^ (v316 >> 1) ^ 0x66D7C72E) & 0x5747621F ^ ((v316 >> 4) ^ (v316 >> 1)) & 1) - 683187682);
  v318 = *(_DWORD *)&v248[4 * (HIBYTE(v302) ^ 0x21)] ^ 0x5ED975BB;
  v319 = *(_DWORD *)(v251 + 4 * (BYTE1(v313) ^ 0x7Bu));
  v320 = ((v313 >> 7) & 0x30 ^ 0x10) + (BYTE1(v313) ^ 0xB03AF713);
  v321 = (v320 ^ (v319 - 1597529188)) + 2 * (v320 & (v319 + 549954460));
  v322 = *(_DWORD *)(v249 + 4 * (v298 ^ 0x74u));
  v323 = ((v322 - 2005753507) >> 4) ^ ((v322 - 2005753507) >> 1);
  v324 = v323 + v322 - 2005753507 - 2 * (v323 & (v322 + 141730141));
  v325 = *(_DWORD *)&v248[4 * (HIBYTE(v312) ^ 0xA0)] ^ 0x5ED975BB;
  v326 = *(_DWORD *)(v249 + 4 * (v302 ^ 0x9Cu));
  v327 = v326 - ((2 * v326 + 283460282) & 0xAFEE31E0) - 529941939;
  v328 = HIDWORD(v506) ^ v325 ^ ((BYTE1(v298) ^ 0x3F) + 1359125172 + *(_DWORD *)(v251 + 4 * (BYTE1(v298) ^ 0x4Fu))) ^ *(_DWORD *)&v252[4 * (BYTE2(v313) ^ 0xF0)] ^ (-929595906 - (v325 & 0x812EC8CC) + ((v325 >> 1) & 0x53B76667)) ^ (v327 >> 1) ^ (v327 >> 4);
  v329 = *(_DWORD *)&v248[4 * (HIBYTE(v313) ^ 0x46)] ^ 0x5ED975BB;
  v330 = *(_DWORD *)(v249 + 4 * (v312 ^ 0x5Au));
  v331 = v506 ^ *(_DWORD *)&v252[4 * (BYTE2(v298) ^ 0x34)] ^ ((BYTE1(v302) ^ 0xAD)
                                                            + 1359125172
                                                            + *(_DWORD *)(v251 + 4 * (BYTE1(v302) ^ 0xDDu))) ^ v329 ^ (-929595906 - (v329 & 0x812EC8CC) + ((v329 >> 1) & 0x53B76667));
  v332 = v330 - ((2 * v330 + 283460282) & 0xF7EB0CB4) + 73934775;
  v333 = v331 ^ (v332 >> 1) ^ (v332 >> 4) ^ 0x3A459B48;
  v334 = (v333 - ((2 * v333) & 0xF7EB0CB4) + 2079688282) ^ v332;
  v335 = *(_DWORD *)&v252[4 * (BYTE2(v312) ^ 0x33)] ^ HIDWORD(v529) ^ v318 ^ (-929595906
                                                                            - (v318 & 0x812EC8CC)
                                                                            + ((v318 >> 1) & 0x53B76667)) ^ v324 ^ v321;
  v336 = v327 ^ HIDWORD(v535) ^ ((v328 ^ 0x2E84FDF7) + 1475811568 - 2 * ((v328 ^ 0x2E84FDF7) & 0x57F718F8 ^ v328 & 8));
  v337 = (v334 - 1386945097 - ((2 * v334) & 0x5AA9CB6E)) ^ v510;
  v338 = *(_DWORD *)&v248[4 * (HIBYTE(v317) ^ 0xB3)] ^ 0x5ED975BB;
  v339 = *(_DWORD *)(v249 + 4 * (v337 ^ 0xB8u));
  v340 = v339 - ((2 * v339 + 283460282) & 0x7E16DC60) + 1199443853;
  v341 = *(_DWORD *)&v252[4 * (BYTE2(v335) ^ 0xB0)] ^ v338 ^ (-929595906
                                                            - (v338 & 0x812EC8CC)
                                                            + ((v338 >> 1) & 0x53B76667)) ^ (v340 >> 1) ^ (v340 >> 4) ^ (*(_DWORD *)(v251 + 4 * (((unsigned __int16)(v336 ^ 0x87CB) >> 8) ^ 0x70u)) + ((unsigned __int16)(v336 ^ 0x87CB) >> 8) + 1359125172) ^ 0x547501FB;
  v342 = v341 - ((2 * v341) & 0x7E16DC60);
  LOWORD(v312) = v335;
  v343 = *(_DWORD *)&v248[4 * (HIBYTE(v335) ^ 0x54)] ^ 0x5ED975BB;
  v344 = *(_DWORD *)(v251 + 4 * (BYTE1(v337) ^ 0xEEu));
  v345 = (BYTE1(v337) ^ 0x9E) - 1338312936;
  v346 = v345 & (v344 + 549954460);
  v347 = v345 ^ (v344 - 1597529188);
  v348 = *(_DWORD *)(v249 + 4 * (v317 ^ 0x26u));
  v349 = v348 - ((2 * v348 + 283460282) & 0xEAE9DB76) + 2112327448;
  v350 = HIDWORD(v505) ^ v343 ^ (-929595906 - (v343 & 0x812EC8CC) + ((v343 >> 1) & 0x53B76667)) ^ *(_DWORD *)&v252[4 * (BYTE2(v336) ^ 0xCC)] ^ v349 ^ (v347 + 2 * v346);
  v351 = *(_DWORD *)&v248[4 * ((v336 ^ 0xEA5387CB) >> 24)] ^ 0x5ED975BB;
  v352 = v350 ^ (((v349 >> 4) ^ (v349 >> 1) ^ 0x75ED3806)
               - ((2 * ((v349 >> 4) ^ (v349 >> 1) ^ 0x75ED3806)) & 0xEAE9DB76)
               - 176886341);
  v545 = v312;
  v353 = *(_DWORD *)(v249 + 4 * (v312 ^ 0x8Au));
  v354 = v353 - ((2 * v353 + 283460282) & 0xBCD74116) + 1725841896;
  v355 = (((v354 >> 4) ^ (v354 >> 1) ^ 0x62D36A4D)
        - 2 * (((v354 >> 4) ^ (v354 >> 1) ^ 0x62D36A4D) & 0x5E6BA09B ^ ((v354 >> 4) ^ (v354 >> 1)) & 0x10)
        - 563371893) ^ v354;
  v356 = v351 ^ ((BYTE1(v317) ^ 0xBB) + 1359125172 + *(_DWORD *)(v251 + 4 * (BYTE1(v317) ^ 0xCBu))) ^ (-929595906 - (v351 & 0x812EC8CC) + ((v351 >> 1) & 0x53B76667)) ^ *(_DWORD *)&v252[4 * (BYTE2(v337) ^ 0xD3)] ^ (v355 + 1932180705 - ((2 * v355) & 0xE65579C2));
  v357 = *(_DWORD *)&v248[4 * (HIBYTE(v337) ^ 0xA1)] ^ 0x5ED975BB;
  v358 = *(_DWORD *)(v249 + 4 * (v336 ^ 0x46u));
  v359 = v358 - ((2 * v358 + 283460282) & 0x7093E810);
  v360 = v340 ^ v529 ^ (v342 - 1089769936);
  v361 = v359 + 1086100837;
  v362 = ((v359 + 1086100837) >> 4) ^ ((v359 + 1086100837) >> 1) ^ 0x57A06544;
  v363 = v362 - ((2 * v362) & 0x7093E810);
  v364 = v352 + 1374146817 - ((2 * v352) & 0xA3CFA202);
  v365 = v357 ^ *(_DWORD *)&v252[4 * (BYTE2(v317) ^ 0x59)] ^ ((BYTE1(v312) ^ 0x68)
                                                            + 1359125172
                                                            + *(_DWORD *)(v251 + 4 * (BYTE1(v312) ^ 0x18u))) ^ v361 ^ (-929595906 - (v357 & 0x812EC8CC) + ((v357 >> 1) & 0x53B76667)) ^ (v363 - 1203112952);
  v366 = (v516 ^ v356) & 0xDEF93B4E ^ 0xBC9BD21A ^ (((v516 ^ v356) & 0x3A5A1490)
                                                  - ((2 * (v516 ^ v356)) & 0xB00820)
                                                  - 2066102758);
  v367 = (v366 | 0x961F59C) - (v366 | 0xF69E0A63) - 157414813;
  v368 = v365 - ((2 * v365) & 0xE69526A2);
  v369 = ((HIDWORD(v514) ^ v367) + HIDWORD(v515)) ^ ((v367 ^ 0x2ADF1863) + 1);
  v370 = ((v356 ^ HIDWORD(v537)) & 0x1B5CD021 ^ 0x2100021)
       + v515
       + (v367 ^ 0xE8160F46 ^ (v369 - ((2 * v369) & 0x7A6DD1B4) + 1027008730));
  v371 = v370 - ((2 * v370) & 0x28EF7E94) + 343392074;
  v372 = *(_DWORD *)&v248[4 * ((v360 ^ 0xEABC14C9) >> 24)] ^ 0x5ED975BB;
  v373 = (v368 + 1934267217) ^ HIDWORD(v528);
  v374 = *(_DWORD *)(v249 + 4 * (v373 ^ 0x2Du));
  v375 = v374 - ((2 * v374 + 283460282) & 0x46602DBA);
  v376 = v364 ^ v535;
  v377 = *(_DWORD *)&v252[4 * (((v364 ^ v535) >> 16) ^ 0x2C)] ^ v372 ^ (-929595906 - (v372 & 0x812EC8CC) + ((v372 >> 1) & 0x53B76667)) ^ ((v375 - 1415399366) >> 1) ^ ((v375 - 1415399366) >> 4) ^ 0x13AB0A03 ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v371) ^ 0xDAu)) + (BYTE1(v371) ^ 0xAA) + 1359125172);
  v378 = (v377 - ((2 * v377) & 0x46602DBA) + 590354141) ^ (v375 - 1415399366);
  v379 = *(_DWORD *)&v248[4 * (HIBYTE(v376) ^ 0x20)] ^ 0x5ED975BB;
  v380 = *(_DWORD *)(v249 + 4 * (v360 ^ 0x44u));
  v381 = v380 - ((2 * v380 + 15024826) & 0x4174528) + 176047089;
  v382 = *(_DWORD *)&v252[4 * (BYTE2(v373) ^ 0xCE)];
  HIDWORD(v383) = v382 ^ 0x8977DFE;
  LODWORD(v383) = v382 ^ 0xC0000000;
  v384 = v505 ^ v379 ^ (-929595906 - (v379 & 0x812EC8CC) + ((v379 >> 1) & 0x53B76667)) ^ v381 ^ *(_DWORD *)&v252[4 * (BYTE2(v371) ^ 0x37)] ^ (((v381 >> 4) ^ (v381 >> 1) ^ 0x49256B63) - ((2 * ((v381 >> 4) ^ (v381 >> 1) ^ 0x49256B63)) & 0x4174528) - 2113166700) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v373) ^ 2u)) + (BYTE1(v373) ^ 0x72) + 1359125172);
  v385 = *(_DWORD *)(v249 + 4 * (v376 ^ 0xFu));
  v386 = v385 - ((2 * v385 + 283460282) & 0x148A9414) - 1833440409;
  v387 = *(_DWORD *)&v248[4 * (HIBYTE(v373) ^ 0xF2)] ^ 0x5ED975BB;
  v388 = *(_DWORD *)(v249 + 4 * (v371 ^ 0xE5u));
  v389 = v388 - ((2 * v388 + 283460282) & 0x46DADC80) + 736104349;
  v390 = HIDWORD(v504) ^ v387 ^ *(_DWORD *)&v252[4 * (BYTE2(v360) ^ 0x23)] ^ (-929595906
                                                                            - (v387 & 0x812EC8CC)
                                                                            + ((v387 >> 1) & 0x53B76667)) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v376) ^ 0x77u)) + (BYTE1(v376) ^ 7) + 1359125172) ^ v389 ^ (((v389 >> 4) ^ (v389 >> 1) ^ 0x5B8061C4) - ((2 * ((v389 >> 4) ^ (v389 >> 1) ^ 0x5B8061C4)) & 0x46DADC80) - 1553109440);
  v391 = v384 - 1260990356 - ((2 * v384) & 0x69ADA0D8);
  v392 = *(_DWORD *)&v248[4 * (HIBYTE(v371) ^ 0x23)] ^ 0x5ED975BB;
  v393 = v392 ^ HIDWORD(v527) ^ (((unsigned __int16)(v360 ^ 0x14C9) >> 8)
                               + 1359125172
                               + *(_DWORD *)(v251
                                           + 4 * (((unsigned __int16)(v360 ^ 0x14C9) >> 8) ^ 0x70u)));
  v394 = (v378 + 698911894 - ((2 * v378) & 0x5351192C)) ^ v528;
  v395 = (v390 + 421509449 - ((2 * v390) & 0x323F7292)) ^ HIDWORD(v534);
  v396 = v393 ^ (v392 >> 1) & 0x53B76667 ^ (((v383 >> 28) ^ 0xBEF43C6F) << 28) ^ (((v383 >> 28) ^ 0xBEF43C6F) >> 4) ^ v386 ^ (((v386 >> 4) ^ (v386 >> 1) ^ 0x586F1A5) - ((2 * ((v386 >> 4) ^ (v386 >> 1) ^ 0x586F1A5)) & 0x148A9414) + 172313098);
  v397 = *(_DWORD *)&v248[4 * (HIBYTE(v394) ^ 6)] ^ 0x5ED975BB;
  v398 = *(_DWORD *)(v249 + 4 * (v395 ^ 0x8Du));
  v399 = v398 - ((2 * v398 + 283460282) & 0xD03A4E9E);
  v400 = v391 ^ v537;
  v401 = *(_DWORD *)&v252[4 * (((v391 ^ v537) >> 16) ^ 0x90)] ^ v397 ^ (-929595906 - (v397 & 0x812EC8CC) + ((v397 >> 1) & 0x53B76667)) ^ ((v399 - 259012436) >> 4) ^ ((v399 - 259012436) >> 1) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v396) ^ 0x41u)) + (BYTE1(v396) ^ 0x31) + 1359125172) ^ 0xD93DA011;
  v402 = (v401 - ((2 * v401) & 0xD03A4E9E) + 1746741071) ^ (v399 - 259012436);
  v403 = *(_DWORD *)&v248[4 * (HIBYTE(v400) ^ 0xB4)] ^ 0x5ED975BB;
  v404 = *(_DWORD *)(v249 + 4 * (v394 ^ 0x12u));
  v405 = v404 - ((2 * v404 + 283460282) & 0xA3EC5522) - 630666258;
  v406 = v403 ^ *(_DWORD *)&v252[4 * (BYTE2(v396) ^ 0x21)] ^ (-929595906
                                                            - (v403 & 0x812EC8CC)
                                                            + ((v403 >> 1) & 0x53B76667)) ^ (v405 >> 1) ^ (v405 >> 4) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v395) ^ 6u)) + (BYTE1(v395) ^ 0x76) + 1359125172);
  v407 = *(_DWORD *)&v248[4 * (HIBYTE(v396) ^ 0xFC)] ^ 0x5ED975BB;
  v408 = v405 ^ v521 ^ ((v406 ^ 0x2DE477E1) + 1375087249 - 2 * ((v406 ^ 0x2DE477E1) & 0x51F62A9F ^ v406 & 0xE));
  v409 = *(_DWORD *)(v249 + 4 * (v400 ^ 0xABu));
  v410 = v409 - ((2 * v409 + 283460282) & 0xFEE55CB6) + 132468664;
  v411 = *(_DWORD *)&v248[4 * (HIBYTE(v395) ^ 0x75)] ^ 0x5ED975BB;
  v412 = v504 ^ v407 ^ (-929595906 - (v407 & 0x812EC8CC) + ((v407 >> 1) & 0x53B76667)) ^ v410 ^ *(_DWORD *)&v252[4 * (BYTE2(v395) ^ 0xE0)] ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v394) ^ 0xCEu)) + (BYTE1(v394) ^ 0xBE) + 1359125172) ^ (((v410 >> 4) ^ (v410 >> 1) ^ 0x384E7DC8) + 2138222171 - 2 * (((v410 >> 4) ^ (v410 >> 1) ^ 0x384E7DC8) & 0x7F72AE5F ^ ((v410 >> 4) ^ (v410 >> 1)) & 4));
  v413 = *(_DWORD *)(v249 + 4 * (v396 ^ 0xEBu));
  v414 = v413 - ((2 * v413 + 283460282) & 0xF856F6DC) - 2070012725;
  v415 = *(_DWORD *)&v252[4 * (BYTE2(v394) ^ 0x96)] ^ v527 ^ v411 ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v400) ^ 0x4Du))
                                                                   + (BYTE1(v400) ^ 0x3D)
                                                                   + 1359125172) ^ v414 ^ (-929595906
                                                                                         - (v411 & 0x812EC8CC)
                                                                                         + ((v411 >> 1) & 0x53B76667)) ^ (((v414 >> 4) ^ (v414 >> 1) ^ 0x71D70A01) - ((2 * ((v414 >> 4) ^ (v414 >> 1) ^ 0x71D70A01)) & 0xF856F6DC) - 64259218);
  v416 = (HIDWORD(v513) ^ ((((v514 ^ v402) + (v402 ^ 0x12625A44) + 1) ^ HIDWORD(v509))
                         - ((2 * (((v514 ^ v402) + (v402 ^ 0x12625A44) + 1) ^ HIDWORD(v509))) & 0x1EFF27AE)
                         - 1887464489))
       + (v402 ^ 0x12625A44);
  v417 = (v412 + 751190622 - ((2 * v412) & 0x598C84BC)) ^ v536;
  v418 = *(_DWORD *)&v248[4 * (HIBYTE(v416) ^ 0x1E)] ^ 0x5ED975BB;
  v419 = *(_DWORD *)(v249 + 4 * (v415 ^ 0x6Eu));
  v420 = v419 - ((2 * v419 + 283460282) & 0x1DF34E94) - 1754511193;
  v421 = *(_DWORD *)&v252[4 * (BYTE2(v408) ^ 0x73)] ^ v418 ^ (-929595906
                                                            - (v418 & 0x812EC8CC)
                                                            + ((v418 >> 1) & 0x53B76667)) ^ (v420 >> 1) ^ (v420 >> 4) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v417) ^ 0x2Du)) + (BYTE1(v417) ^ 0x5D) + 1359125172) ^ 0x79349D1;
  v422 = v421 - ((2 * v421) & 0x1DF34E94);
  v423 = *(_DWORD *)&v248[4 * (HIBYTE(v408) ^ 0xF0)] ^ 0x5ED975BB;
  v424 = *(_DWORD *)(v249
                   + 4
                   * (((BYTE4(v513) ^ ((((v514 ^ v402) + (v402 ^ 0x44) + 1) ^ BYTE4(v509))
                                                      - ((2 * (((v514 ^ v402) + (v402 ^ 0x44) + 1) ^ BYTE4(v509))) & 0xAE)
                                                      - 41))
                                      + (v402 ^ 0x44)) ^ 0x1Au));
  v425 = v424 - ((2 * v424 + 283460282) & 0xC20B0E24) - 378001297;
  v426 = *(_DWORD *)&v252[4 * (BYTE2(v417) ^ 0x81)] ^ v423 ^ (-929595906
                                                            - (v423 & 0x812EC8CC)
                                                            + ((v423 >> 1) & 0x53B76667)) ^ (v425 >> 1) ^ (v425 >> 4) ^ (*(_DWORD *)(v251 + 4 * (((unsigned __int16)(v415 ^ 0xE1E3) >> 8) ^ 0x70u)) + ((unsigned __int16)(v415 ^ 0xE1E3) >> 8) + 1359125172) ^ 0x36929BF8;
  v427 = (v426 - ((2 * v426) & 0xC20B0E24) + 1627752210) ^ v425;
  v428 = *(_DWORD *)&v248[4 * (HIBYTE(v417) ^ 0xB6)] ^ 0x5ED975BB;
  v429 = *(_DWORD *)(v251 + 4 * (BYTE1(v416) ^ 0x4Eu)) + (BYTE1(v416) ^ 0x3E) + 1359125172;
  v430 = *(_DWORD *)(v249 + 4 * (v408 ^ 0x49u));
  v431 = v430 - ((2 * v430 + 283460282) & 0x4AA259EE) - 1379676588;
  v432 = *(_DWORD *)&v248[4 * ((v415 ^ 0x201BE1E3u) >> 24)] ^ 0x5ED975BB;
  v433 = v432 ^ (-929595906 - (v432 & 0x812EC8CC) + ((v432 >> 1) & 0x53B76667)) ^ (*(_DWORD *)(v251
                                                                                             + 4
                                                                                             * (BYTE1(v408) ^ 0x4Bu))
                                                                                 + (BYTE1(v408) ^ 0xB03AF723)
                                                                                 - 1597529188
                                                                                 + (~(v408 >> 7) & 0x30)) ^ *(_DWORD *)&v252[4 * (BYTE2(v416) ^ 4)];
  v434 = *(_DWORD *)(v249 + 4 * (v417 ^ 0xECu));
  v435 = v434 - ((2 * v434 + 283460282) & 0x6336E5FA) - 1173482406;
  v436 = *(_DWORD *)&v252[4 * (BYTE2(v415) ^ 0x84)] ^ v526 ^ v428 ^ (-929595906
                                                                   - (v428 & 0x812EC8CC)
                                                                   + ((v428 >> 1) & 0x53B76667)) ^ (((((v431 >> 4) ^ (v431 >> 1) ^ 0x10FD84B4) + 626076919 - 2 * (((v431 >> 4) ^ (v431 >> 1) ^ 0x10FD84B4) & 0x25512CFF ^ ((v431 >> 4) ^ (v431 >> 1)) & 8)) ^ v431) & 0x4D878F3D | ((v431 >> 4) ^ (v431 >> 1) ^ 0x10FD84B4) & 0x327870C2 ^ v431 & 0xB27870C2) ^ v429;
  v437 = HIDWORD(v503) ^ (v435 >> 4) ^ (v435 >> 1) ^ (v433 - 1991474804 - ((2 * v433) & 0x12990318));
  v438 = v513 ^ (v427 - 1402911716 - ((2 * v427) & 0x58C28838));
  v439 = ((v437 ^ 0x1BD40E51) + 832271101 - 2 * ((v437 ^ 0x1BD40E51) & 0x319B72FF ^ v437 & 2)) ^ v435;
  v440 = (HIDWORD(v512) ^ ((((v427 ^ 0xEBB2E1C2) + v438 + 1) ^ v509)
                         - 1402911716
                         - ((2 * (((v427 ^ 0xEBB2E1C2) + v438 + 1) ^ v509)) & 0x58C28838)))
       + (v427 ^ 0xEBB2E1C2);
  v441 = (v439 - 1991474804 - ((2 * v439) & 0x12990318)) ^ HIDWORD(v536);
  v442 = v512 ^ (v440 - ((2 * v440) & 0x5D57090E) - 1364491129);
  v443 = v420 ^ HIDWORD(v526) ^ (v422 + 251242314) ^ 0x1A9E1FD7 ^ -(v420 ^ HIDWORD(v526) ^ (v422 + 251242314) ^ 0x1A9E1FD7) ^ ((v420 ^ HIDWORD(v526) ^ (v422 + 251242314) ^ 0x7F64160) - 493379255);
  v444 = v443 - ((2 * v443 + 86983312) & 0xD9A9B76) - 379261181;
  v445 = (v442 ^ 0x929C2D) >> (v545 & 8) >> (v545 & 8 ^ 8);
  v446 = *(_DWORD *)&v248[4 * ((v444 ^ 0x52CD4D36u) >> 24)] ^ 0x5ED975BB;
  v447 = *(_DWORD *)(v249 + 4 * (((v439 - 116 - ((2 * v439) & 0x18)) ^ BYTE4(v536)) ^ 0x56u));
  v448 = v447 - ((2 * v447 + 283460282) & 0xA53C6A12) - 619653530;
  v449 = *(_DWORD *)&v252[4 * (BYTE2(v442) ^ 0xD)] ^ v446 ^ (-929595906
                                                           - (v446 & 0x812EC8CC)
                                                           + ((v446 >> 1) & 0x53B76667)) ^ (v448 >> 1) ^ (v448 >> 4) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v436) ^ 0xC0u)) + (BYTE1(v436) ^ 0xB0) + 1359125172) ^ 0x2C66F9D4;
  v450 = v448 ^ HIDWORD(v524) ^ (v449 - ((2 * v449) & 0xA53C6A12) + 1386099977);
  v451 = *(_DWORD *)&v248[4 * (HIBYTE(v442) ^ 0x54)] ^ 0x5ED975BB;
  v452 = *(_DWORD *)(v249 + 4 * (v444 ^ 0x36u));
  v453 = v452 - ((2 * v452 + 283460282) & 0x6C6047D2) - 1096628922;
  v454 = *(_DWORD *)&v248[4 * (HIBYTE(v436) ^ 0x74)] ^ 0x5ED975BB;
  v455 = *(_DWORD *)(v249 + 4 * (v442 ^ 0xA0u));
  v456 = v455 - ((2 * v455 + 283460282) & 0xF7E2A638) - 2073824135;
  v457 = *(_DWORD *)&v252[4 * (BYTE2(v441) ^ 0xF7)] ^ v524 ^ v454 ^ (-929595906
                                                                   - (v454 & 0x812EC8CC)
                                                                   + ((v454 >> 1) & 0x53B76667)) ^ v456 ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v444) ^ 0x3Du)) + (BYTE1(v444) ^ 0x4D) + 1359125172) ^ (((v456 >> 4) ^ (v456 >> 1) ^ 0x7247BCBF) - 68070627 + ~((2 * ((v456 >> 4) ^ (v456 >> 1) ^ 0x7247BCBF)) & 0xF7E2A638));
  v458 = *(_DWORD *)&v248[4 * (HIBYTE(v441) ^ 0x6C)];
  v459 = *(_DWORD *)&v252[4 * (BYTE2(v444) ^ 0xCD ^ -(BYTE2(v444) ^ 0xCD) ^ ((BYTE2(v444) ^ 0xFFFFFFAD) + 160)) + 636];
  v460 = *(_DWORD *)(v249 + 4 * (v436 ^ 1u));
  v461 = v460 - ((2 * v460 + 283460282) & 0xB16D04B6) + 1630086072;
  v462 = *(_DWORD *)&v252[4 * (BYTE2(v436) ^ 0xD8)] ^ HIDWORD(v521) ^ v451 ^ v453 ^ (-929595906
                                                                                   - (v451 & 0x812EC8CC)
                                                                                   + ((v451 >> 1) & 0x53B76667)) ^ (((v453 >> 4) ^ (v453 >> 1) ^ 0x187B13CA) - ((2 * ((v453 >> 4) ^ (v453 >> 1) ^ 0x187B13CA)) & 0x6C6047D2) + 909124585) ^ (*(_DWORD *)(v251 + 4 * (BYTE1(v441) ^ 0x22u)) + (BYTE1(v441) ^ 0x52) + 1359125172);
  v463 = v458 ^ 0x5ED975BB ^ (-929595906
                            - ((v458 ^ 0x5ED975BB) & 0x812EC8CC)
                            + (((v458 ^ 0x5ED975BBu) >> 1) & 0x53B76667)) ^ v459 ^ (v461 >> 1) ^ (v461 >> 4) ^ (*(_DWORD *)(v251 + 4 * (v445 ^ 0x70u)) + v445 + 1359125172);
  v464 = v461 ^ *(_DWORD *)(v58 - 224) ^ ((v463 ^ 0x61D02908)
                                        - 2 * ((v463 ^ 0x61D02908) & 0x58B6827B ^ v463 & 0x20)
                                        - 659127717);
  v465 = (char *)*(&off_24DA380E0 + (int)v503) - 8;
  v466 = *(_DWORD *)&v465[4 * (HIBYTE(v450) ^ 0xE)];
  HIDWORD(v383) = v466 ^ 9;
  LODWORD(v383) = v466 ^ 0x71C19420;
  v467 = v383 >> 5;
  v468 = (char *)*(&off_24DA380E0 + SHIDWORD(v502)) - 4;
  v469 = *(_DWORD *)&v468[4 * (BYTE1(v457) ^ 0xA0)];
  HIDWORD(v383) = v469 ^ 0x2992B;
  LODWORD(v383) = v469 ^ 0xB0B00000;
  v470 = v383 >> 20;
  v471 = (uint64_t)*(&off_24DA380E0 + (int)v502);
  v472 = *(_DWORD *)(v471 + 4 * (v464 ^ 0xBFu));
  v473 = *(_BYTE **)(v58 - 216);
  HIDWORD(v383) = v472 ^ 0x541;
  LODWORD(v383) = v472 ^ 0x90C7B000;
  HIDWORD(v542) = *(_DWORD *)&v465[4 * (HIBYTE(v462) ^ 0x7E)];
  v474 = *(_DWORD *)&v465[4 * (HIBYTE(v457) ^ 0x33)];
  v475 = *(_DWORD *)&v465[4 * (HIBYTE(v464) ^ 8)];
  v476 = BYTE2(v462) ^ 0xCC;
  v477 = *(_DWORD *)(v58 - 220);
  v478 = (char *)*(&off_24DA380E0 + v477 - 1046) - 12;
  v479 = *(_DWORD *)&v478[4 * (BYTE2(v462) ^ 0x52)];
  v480 = BYTE2(v457);
  LODWORD(v542) = *(_DWORD *)&v478[4 * (BYTE2(v457) ^ 0x61)];
  v481 = BYTE2(v464);
  HIDWORD(a55) = *(_DWORD *)&v478[4 * (BYTE2(v464) ^ 0x86)];
  LODWORD(v478) = *(_DWORD *)&v478[4 * (BYTE2(v450) ^ 0x7E)];
  v482 = *(_DWORD *)&v468[4 * (BYTE1(v464) ^ 0x98)];
  v483 = *(_DWORD *)&v468[4 * (BYTE1(v450) ^ 0xC9)];
  v484 = *(_DWORD *)&v468[4 * (BYTE1(v462) ^ 0x9C)];
  LODWORD(v468) = *(_DWORD *)(v471 + 4 * (v450 ^ 0xD6u));
  LODWORD(v465) = *(_DWORD *)(v471 + 4 * (v462 ^ 0x46u));
  v485 = *(_DWORD *)(v471 + 4 * (v457 ^ 0xACu));
  v486 = v467 ^ HIDWORD(v511) ^ v479 ^ v470 ^ (v383 >> 12) ^ (v470 >> 3) & 0xED2CCE5 ^ (4 * (v383 >> 12)) ^ (v476 + 862432487 - ((2 * v476 + 26519002) & 0x110A3F4));
  v487 = (v467 ^ BYTE4(v511) ^ v479 ^ v470 ^ (v383 >> 12) ^ (v470 >> 3) & 0xE5 ^ (4 * (v383 >> 12)) ^ (v476 - 25 - ((2 * v476 - 38) & 0xF4)) ^ v476) ^ 8;
  v488 = (char *)*(&off_24DA380E0 + HIDWORD(v501)) - 4;
  v473[3] = (-124 - 29 * v488[v487]) ^ 0xFD;
  HIDWORD(v383) = v475 ^ 9;
  LODWORD(v383) = v475 ^ 0x71C19420;
  LODWORD(v487) = (v383 >> 5) + 849172986 - ((2 * (v383 >> 5)) & 0x653AB3F4);
  HIDWORD(v383) = v484 ^ 0x2992B;
  LODWORD(v383) = v484 ^ 0xB0B00000;
  v489 = v383 >> 20;
  HIDWORD(v383) = v485 ^ 0x541;
  LODWORD(v383) = v485 ^ 0x90C7B000;
  v490 = HIDWORD(v510) ^ *(_DWORD *)(v58 - 224) ^ BYTE2(v450) ^ 0xE0 ^ ((BYTE2(v450) ^ 0xE0) + 13259501) ^ v489 ^ v478 ^ (v383 >> 12) ^ v487 ^ (v489 >> 3) & 0xED2CCE5 ^ (4 * (v383 >> 12));
  v491 = (char *)*(&off_24DA380E0 + v477 - 1228) - 12;
  v473[12] = (v491[BYTE3(v490) ^ 0x15] - 120) ^ 0x5E;
  v492 = (uint64_t)*(&off_24DA380E0 + v477 - 1124);
  v473[1] = *(_BYTE *)(v492 + (BYTE2(v486) ^ 0xF5)) ^ 0xCB;
  v493 = (uint64_t)*(&off_24DA380E0 + (int)v501);
  LODWORD(v487) = ((v490 >> 8) ^ 0x60) + ((v490 >> 8) ^ 0x21) + 1;
  v473[14] = *(_BYTE *)(v493 + (BYTE1(v490) ^ 0xF8)) ^ (v487 - ((2 * v487) & 0x4A) + 37) ^ 0xEF;
  HIDWORD(v383) = v474 ^ 9;
  LODWORD(v383) = v474 ^ 0x71C19420;
  LODWORD(v487) = v383 >> 5;
  HIDWORD(v383) = v483 ^ 0x2992B;
  LODWORD(v383) = v483 ^ 0xB0B00000;
  v494 = v383 >> 20;
  HIDWORD(v383) = v465 ^ 0x541;
  LODWORD(v383) = v465 ^ 0x90C7B000;
  LODWORD(v465) = HIDWORD(a55) ^ HIDWORD(v510) ^ v494 ^ (v383 >> 12) ^ (v494 >> 3) & 0xED2CCE5 ^ v487 ^ (4 * (v383 >> 12)) ^ ((v481 ^ 0x18) + 862432487 - ((2 * (v481 ^ 0x18) + 26519002) & 0x110A3F4));
  v473[8] = (v491[(v465 >> 24) ^ 0x31] - 120) ^ 0xB1;
  v473[9] = *(_BYTE *)(v492 + (BYTE2(v465) ^ 0xDFLL)) ^ 0x30;
  HIDWORD(v383) = HIDWORD(v542) ^ 9;
  LODWORD(v383) = HIDWORD(v542) ^ 0x71C19420;
  LODWORD(v487) = (v383 >> 5) + 849172986 - ((2 * (v383 >> 5)) & 0x653AB3F4);
  HIDWORD(v383) = v482 ^ 0x2992B;
  LODWORD(v383) = v482 ^ 0xB0B00000;
  v495 = v383 >> 20;
  HIDWORD(v383) = v468 ^ 0x541;
  LODWORD(v383) = v468 ^ 0x90C7B000;
  v496 = v511 ^ v542 ^ v495 ^ v487 ^ (v383 >> 12) ^ (v495 >> 3) & 0xED2CCE5 ^ (4 * (v383 >> 12)) ^ (13259756 - v480);
  v473[11] = (-124 - 29 * v488[v465 ^ v481 ^ 0x18u ^ 0x86]) ^ 8;
  v473[v560] = *(_BYTE *)(v492 + (((v496 ^ v480 ^ 0x8EEBC546) >> 16) ^ 0x65)) ^ 0x77;
  v473[15] = (-124 - 29 * v488[v490 ^ 0xACLL]) ^ 0x99;
  *v473 = (v491[HIBYTE(v486) ^ 0x89] - 120) ^ 0x87;
  v497 = ((v486 >> 8) ^ 0x85) + ((v486 >> 8) ^ 0xC4) + 1;
  v473[2] = (v497 - ((2 * v497) & 0x4A) + 37) ^ 0x56 ^ *(_BYTE *)(v493 + (BYTE1(v486) ^ 0x1DLL));
  v498 = (((v496 ^ v480 ^ 0x8EEBC546) >> 8) ^ 0x1A) + (((v496 ^ v480 ^ 0x8EEBC546) >> 8) ^ 0x5B) + 1;
  v473[*(_QWORD *)(v58 - 248)] = (v498 - ((2 * v498) & 0x4A) + 37) ^ 0xB7 ^ *(_BYTE *)(v493
                                                                                     + (((unsigned __int16)(v496 ^ v480 ^ 0xC546) >> 8) ^ 0x82));
  v473[*(_QWORD *)(v58 - 256)] = (-124 - 29 * v488[(v496 ^ v480) ^ 0x2FLL]) ^ 0x4C;
  v499 = ((v465 >> 8) ^ 0xEB) + ((v465 >> 8) ^ 0xAA);
  v473[10] = (v499 + 1 - ((2 * (v499 + 1)) & 0x4A) + 37) ^ 0x93 ^ *(_BYTE *)(v493 + (BYTE1(v465) ^ 0x73));
  v473[*(_QWORD *)(v58 - 232)] = (v491[HIBYTE(v496) ^ 0x6DLL] - 120) ^ 0xC7;
  v473[*(_QWORD *)(v58 - 240)] = *(_BYTE *)(v492 + (BYTE2(v490) ^ 0xC4)) ^ 0x90;
  HIDWORD(v522) = v552 ^ 0xF77128B0;
  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a54 + 8 * ((13 * (HIDWORD(v516) > 0x10)) ^ (*(_DWORD *)(v58 - 220) - 617))) - 12))((2 * v498) & 0x4A, 74, 0, 4294967267, v490, 196, v488, v492, a9, a10, a11, a12, a13, v501, v502, v503, v504, v505, v506,
           v507,
           v508,
           v509,
           v510,
           v511,
           v512,
           v513,
           v514,
           v515,
           v516,
           v517,
           v518,
           v519,
           v520,
           a34,
           v521,
           v522,
           v523,
           v524,
           v525,
           v526,
           v527,
           v528,
           v529,
           v530,
           v531,
           v532,
           v533,
           v534,
           v535,
           v536,
           v537,
           v538,
           v233,
           a54,
           a55,
           v542,
           3,
           8,
           9,
           12);
}

void sub_218ECEA48()
{
  JUMPOUT(0x218ECBD74);
}

uint64_t sub_218ECEA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55)
{
  uint64_t v55;

  return ((uint64_t (*)(void))(*(_QWORD *)(v55
                                        + 8
                                        * ((1007
                                          * (((2 * (a11 - ((a55 + 184689419) & a15) + 1423697048)) & 0x67F55DA6 ^ 0x3000424)
                                           + ((a55 + 924) ^ 0x367BB800 ^ (a11 - ((a55 + 184689419) & a15) + 1423697048))
                                           + 1601033150 != 325616273)) ^ a55))
                            - 12))();
}

uint64_t sub_218ECEB3C@<X0>(int a1@<W1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((44 * (a1 + v2 + 1275416877 < ((a2 + 995) ^ 0x7CCu) - 720)) ^ (a2 + 995)))
                            - 4))();
}

uint64_t sub_218ECEBB4(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2015
                                          * (((a1 + 23) ^ (a4
                                                                          + (((a1 - 696) | 0x289) ^ (a3 + 649)) < 0xFFFFFFF0)) & 1)) ^ a1))
                            - 12))();
}

uint64_t sub_218ECEC14(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _BOOL4 v31;
  int v34;

  v19 = a2 + v16 + ((v12 + 548) ^ (a3 + 1205));
  v20 = v19 + a12 - 0x3D03F1BDD9137986 + 1;
  v21 = v19 & (v12 ^ 0x2A6);
  v22 = v21 - v19;
  v23 = v13 + v22;
  ++v21;
  v24 = v13 + v21;
  v25 = v14 + v22;
  v26 = v14 + v21;
  v27 = v15 + v22;
  v28 = v15 + v21;
  v29 = *(_QWORD *)(v18 - 216);
  v31 = v29 < v24 && v23 < v20;
  if (v29 < v26 && v25 < v20)
    v31 = 1;
  v34 = v29 < v28 && v27 < v20 || v31;
  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * ((113 * v34) ^ v12)) - 12))();
}

uint64_t sub_218ECECB8()
{
  int v0;
  unsigned int v1;
  uint64_t v2;
  int v3;
  _BOOL4 v4;

  v3 = v0 ^ 0x6E5;
  v4 = v1 >= ((v3 - 1052) ^ 0x4FD ^ ((v3 - 1052) | 0x82) ^ 0x46Fu);
  return (*(uint64_t (**)(void))(v2 + 8 * (((8 * v4) | (16 * v4)) ^ v3)))();
}

uint64_t sub_218ECED00(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int8x16_t v15;
  uint64_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16x4_t v20;
  int8x16x4_t v21;

  v20.val[1].i64[0] = ((_BYTE)v9 + 12) & 0xF;
  v20.val[1].i64[1] = ((_BYTE)v9 + 11) & 0xF;
  v20.val[2].i64[0] = ((_BYTE)v9 + 10) & 0xF;
  v20.val[2].i64[1] = ((_BYTE)v9 + 9) & 0xF;
  v20.val[3].i64[0] = ((_BYTE)v9 + 8) & 0xF;
  v20.val[3].i64[1] = ((_BYTE)v9 + 7) & 0xF;
  v14 = v11 + a2 + a3;
  v15.i64[0] = 0x505050505050505;
  v15.i64[1] = 0x505050505050505;
  v16 = v14 & ((a6 + 127) - 290);
  v20.val[0].i64[0] = v16;
  v20.val[0].i64[1] = ((_BYTE)v9 + 13) & 0xF;
  v17.i64[0] = vqtbl4q_s8(v20, (int8x16_t)xmmword_218F1D020).u64[0];
  v21.val[0].i64[1] = ((_BYTE)v9 + 5) & 0xF;
  v21.val[1].i64[1] = (v9 + 3) & 0xF;
  v21.val[2].i64[1] = (v9 + 1) & 0xF;
  v21.val[3].i64[1] = ((_BYTE)v9 - 1) & 0xF;
  v21.val[0].i64[0] = ((_BYTE)v9 + 6) & 0xF;
  v21.val[1].i64[0] = ((_BYTE)v9 + 4) & 0xF;
  v21.val[2].i64[0] = (v9 + 2) & 0xF;
  v21.val[3].i64[0] = v9 & 0xF;
  v17.i64[1] = vqtbl4q_s8(v21, (int8x16_t)xmmword_218F1D020).u64[0];
  v18 = vrev64q_s8(vmulq_s8(v17, v15));
  *(int8x16_t *)(*(_QWORD *)(v13 - 216) - 15 + v14) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v6 + v16 - 15), *(int8x16_t *)(*(_QWORD *)(v13 - 216) - 15 + v14)), veorq_s8(*(int8x16_t *)(v7 + v16 - 15), *(int8x16_t *)(v8 + v16 - 15))), vextq_s8(v18, v18, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((529 * ((v10 & 0xFFFFFFF0) == 16)) ^ a6)) - 12))();
}

void sub_218ECEE50()
{
  JUMPOUT(0x218ECEDD4);
}

uint64_t sub_218ECEE5C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a7 ^ 0x15B) * (v7 != a4)) ^ a7))
                            - ((a7 - 297903170) & 0x11C1A7DD)
                            + 1217))();
}

uint64_t sub_218ECEE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  char v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((249 * ((((v7 & 8) == 0) ^ ((a7 ^ 0x45) + 77)) & 1)) ^ a7 ^ 0x245))
                            - 8))();
}

uint64_t sub_218ECEED8(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  int v58;
  char v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  char v65;
  uint64_t v66;
  int8x16x4_t v68;

  *(_DWORD *)(v61 - 224) = v58;
  *(_DWORD *)(v61 - 220) = v62;
  v63 = *(_QWORD *)(v61 - 216) - 7;
  *(_DWORD *)(v61 - 232) = v58 & 0xFFFFFFF8;
  v64 = -8 - a4;
  v65 = v59 + v60 + a2;
  v66 = (v60 + a2 + a3 + v64 + 8);
  v68.val[0].i64[0] = ((_BYTE)v60 + (_BYTE)a2 + (_BYTE)a3 + (_BYTE)v64 + 8) & 0xF;
  v68.val[0].i64[1] = (v57 + (_BYTE)v64 + ((a5 - 89) ^ 0xF9) + 8) & 0xF;
  v68.val[1].i64[0] = (v65 + 12 + (_BYTE)v64 + 8) & 0xF;
  v68.val[1].i64[1] = (v65 + 11 + (_BYTE)v64 + 8) & 0xF;
  v68.val[2].i64[0] = (v65 + 10 + (_BYTE)v64 + 8) & 0xF;
  v68.val[2].i64[1] = (v65 + 9 + (_BYTE)v64 + 8) & 0xF;
  v68.val[3].i64[0] = (v65 + 8 + (_BYTE)v64 + 8) & 0xF;
  v68.val[3].i64[1] = (v65 + 7 + (_BYTE)v64 + 8) & 0xF;
  *(int8x8_t *)(v63 + v66) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v54 + (v66 & 0xF) - 7), *(int8x8_t *)(v63 + v66)), veor_s8(*(int8x8_t *)(v55 + (v66 & 0xF) - 7), *(int8x8_t *)(v56 + (v66 & 0xF) - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v68, (int8x16_t)xmmword_218F1D030), (int8x8_t)0x505050505050505)));
  return (*(uint64_t (**)(__n128))(a54 + 8 * ((41 * (-(v58 & 0xFFFFFFF8) != v64)) ^ (a5 - 580))))((__n128)xmmword_218F1D030);
}

void sub_218ECF038()
{
  JUMPOUT(0x218ECEF48);
}

uint64_t sub_218ECF040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W8>)
{
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5
                                                                                         + 8
                                                                                         * (((a5 + 975)
                                                                                           * (*(_DWORD *)(v6 - 224) == *(_DWORD *)(v6 - 232))) ^ a5))
                                                                             - (a5 ^ 0x7B9u)
                                                                             + 1221))(a1, a2, a3, a4, (a5 + 345));
}

uint64_t sub_218ECF07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = (a6 - 325616274);
  *(_BYTE *)(*(_QWORD *)(v11 - 216) + v12) ^= *(_BYTE *)(v7 + (v12 & 0xF)) ^ *(_BYTE *)(v8 + (v12 & 0xF)) ^ *(_BYTE *)(v9 + (v12 & 0xF)) ^ (5 * (v12 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((234 * (a6 - 1 != v6)) ^ (a5 - 924))) - 12))();
}

void sub_218ECF0E0()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1455463226)
    v1 = 280600939;
  else
    v1 = 280558915;
  *(_DWORD *)(v2 + 44) = v1;
}

void sub_218ECF144(uint64_t a1)
{
  int v1;
  unint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) + 1332649919 * ((((2 * a1) | 0x40041268) - a1 - 537004340) ^ 0x1D718DC6);
  v2 = ((unint64_t)(*(_DWORD *)(*(_QWORD *)a1 - 0x1BD3A2918E8AF0F9) + 22) >> 3) & 0x3F;
  *(_BYTE *)(*(_QWORD *)a1 - 0x1BD3A2918E8AF0F1 + v2) = 0x80;
  __asm { BR              X14 }
}

uint64_t sub_218ECF27C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1400 * (((v0 == 0) ^ (((v1 + 9) ^ 0x61) + 1)) & 1)) ^ v1))
                            - 4))();
}

uint64_t sub_218ECF2B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  *a1 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v1 != 1) * ((v2 - 9) ^ 0x1C9)) ^ (v2 - 9))) - 4))();
}

uint64_t sub_218ECF2F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(a1 + v3) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v3 + 1 != v1) * v4) ^ v2)) - 4))();
}

uint64_t sub_218ECF314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void (*a13)(_DWORD **), uint64_t (*a14)(_DWORD **), _DWORD *a15, int a16, int a17, int a18, int a19, _DWORD *a20,int *a21,_DWORD *a22,unsigned int a23,unsigned int a24)
{
  uint64_t v24;
  uint64_t v25;
  int v26;
  void (*v27)(_DWORD **);
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;

  v28 = 961505453 * (((&a20 | 0xB5E3555C) - (&a20 & 0xB5E3555C)) ^ 0x17189BFA);
  a20 = a15;
  LODWORD(a21) = v28 ^ 0x242ADF64;
  HIDWORD(a21) = v28 + v26 + 968;
  v27(&a20);
  LODWORD(a20) = (v26 - 1488870884) ^ (961505453
                                     * (((&a20 | 0x55366059) - (&a20 & 0x55366059)) ^ 0xF7CDAEFF));
  a21 = a15;
  a22 = (_DWORD *)(v25 - 0x5BB4A5E4E854F7DLL);
  a13(&a20);
  v29 = 1449114341 * ((((2 * &a20) | 0x648779C4) - &a20 - 843300066) ^ 0xFD1D4509);
  a23 = v29 - 2043182176;
  a24 = v29 ^ 0x893B2A7A;
  LODWORD(a20) = v26 - v29 + 215;
  a21 = &a16;
  a22 = a15;
  v30 = a14(&a20);
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF109) += a16;
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF105) += a17;
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF101) += a18;
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF0FDLL) += a19;
  *(_QWORD *)(v25 - 0x1BD3A2918E8AF0F1) = 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v24 + 8 * v26) - (((v26 - 140) | 0x440u) ^ 0x450)))(v30);
}

uint64_t sub_218ECF528()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1586 * (v0 != ((2 * ((v1 - 1764654254) & 0x692E7E87 ^ 0x6A9)) ^ 0x46B))) ^ v1))
                            - 4))();
}

uint64_t sub_218ECF574()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((((v1 + 1696499504) & 0x9AE1775A ^ 0x325) - v0 < 8) * (v1 - 1133)) ^ v1)))();
}

uint64_t sub_218ECF5B8()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1005 * (v0 >= v1 - 373 + v1 - 918 - 995)) ^ (v1 - 665))) - 8))();
}

uint64_t sub_218ECF5F0@<X0>(_OWORD *a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;

  *a1 = 0u;
  a1[1] = 0u;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((26 * ((v2 ^ 0x7EEu) - 1244 == (v1 & 0xFFFFFFE0))) ^ (v2 - 526)))
                            - 8))();
}

uint64_t sub_218ECF63C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (471 * (v1 == v0))))
                            - 2 * (((v2 - 1252) | 0x444) ^ 0x4ABu)
                            + 486))();
}

uint64_t sub_218ECF678()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((v1 ^ 0xE8) - 21) ^ 0x595) * ((v0 & 0x18) == 0)) ^ v1))
                            - ((3 * (v1 ^ 0xE8u)) ^ 0x31ALL)))();
}

uint64_t sub_218ECF6B4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + v1 + v5 - 0x1BD3A2918E8AF0F0) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((914 * (v2 - (v0 & 0xFFFFFFF8) == -8)) ^ v3))
                            - (v3 + 444)
                            + 677))();
}

uint64_t sub_218ECF70C()
{
  uint64_t v0;
  int v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *v3 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v4 == 0) * v1) ^ v2)) - v0 + 677))();
}

uint64_t sub_218ECF738()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v1 | (2 * (v2 != v0)))) - ((v1 + 2005742031) & 0x8872CFDF) + 1112))();
}

uint64_t sub_218ECF774@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  *(_BYTE *)(a1 + v2) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((84 * (v2 + 1 != v1)) ^ (v3 - 605)))
                            - ((v3 - 1629719699) & 0x61238DDC)
                            + 1104))();
}

uint64_t sub_218ECF7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void (*a13)(_DWORD **), void (*a14)(_DWORD **), _DWORD *a15, int a16, int a17, int a18, int a19, _DWORD *a20,int *a21,_DWORD *a22,unsigned int a23,unsigned int a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int *v29;
  void (*v30)(_DWORD **);
  uint64_t v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;

  v31 = *(_QWORD *)(v24 + 16);
  v32 = ((&a20 & 0x86A338E9 | ~(&a20 | 0x86A338E9)) ^ 0xDBA709B0) * v28;
  a20 = a15;
  LODWORD(a21) = v32 ^ 0x242ADF62;
  HIDWORD(a21) = v27 + 20 + v32;
  v30(&a20);
  v33 = *v29;
  v34 = (2 * *v29 - 2079786964) & 0x938094C4;
  v35 = 1543459711 * (&a20 ^ 0x4C8203C4);
  a21 = (int *)(v26 + 0x1EC4AF3EFBE33A6BLL);
  LODWORD(a20) = v33 - v35 + 197445240 - v34;
  HIDWORD(a20) = v27 + 266059439 + v35;
  sub_218EFBAD0((uint64_t)&a20);
  v36 = *(_DWORD *)(v26 - 0x1BD3A2918E8AF0F5);
  v37 = 1543459711
      * (((&a20 | 0xEE57A8CE) - &a20 + (&a20 & 0x11A85730)) ^ 0xA2D5AB0A);
  a21 = (int *)(v26 + 0x1EC4AF3EFBE33A6FLL);
  LODWORD(a20) = v36 - v37 + 197445240 - ((2 * v36 - 2079786964) & 0x938094C4);
  HIDWORD(a20) = v27 + 266059439 + v37;
  sub_218EFBAD0((uint64_t)&a20);
  LODWORD(a20) = (v27 - 1488871832) ^ (961505453
                                     * (((&a20 | 0x7D71E40A) - (&a20 & 0x7D71E40A)) ^ 0xDF8A2AAC));
  a21 = a15;
  a22 = (_DWORD *)(v26 - 0x5BB4A5E4E854F7DLL);
  a13(&a20);
  v38 = 1449114341
      * (((&a20 | 0x636E9FB8) - &a20 + (&a20 & 0x9C916040)) ^ 0xAC306653);
  LODWORD(a20) = v27 - v38 - 733;
  a23 = v38 - 2043182176;
  a24 = v38 ^ 0x893B2A7A;
  a21 = &a16;
  a22 = a15;
  a14(&a20);
  *(_DWORD *)(v26 - 0x1BD3A2918E8AF109) += a16;
  *(_DWORD *)(v26 - 0x1BD3A2918E8AF105) += a17;
  *(_DWORD *)(v26 - 0x1BD3A2918E8AF101) += a18;
  *(_DWORD *)(v26 - 0x1BD3A2918E8AF0FDLL) += a19;
  v39 = 961505453 * (((&a20 | 0x9DE29B73) + (~&a20 | 0x621D648C)) ^ 0x3F1955D4);
  a20 = (_DWORD *)(v26 - 0x1BD3A2918E8AF109);
  LODWORD(a21) = v39 ^ 0x242ADF58;
  HIDWORD(a21) = v27 + 20 + v39;
  v40 = ((uint64_t (*)(_DWORD **))v30)(&a20);
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6CDLL) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF109)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF109)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6CCLL) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF108)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF108)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6CBLL) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF107)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF107)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6CALL) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF106)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF106)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C9) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF105)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF105)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C8) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF104)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF104)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C7) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF103)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF103)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C6) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF102)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF102)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C5) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF101)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF101)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C4) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF100)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF100)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C3) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FFLL)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FFLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C2) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FELL)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FELL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C1) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FDLL)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FDLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6C0) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FCLL)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FCLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6BFLL) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FBLL)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FBLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v31 - 0x12706C5BEBCFC6BELL) = *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FALL)
                                         - ((2 * *(_BYTE *)(v26 - 0x1BD3A2918E8AF0FALL)) & 0x28)
                                         - 108;
  *(_OWORD *)(v26 - 0x1BD3A2918E8AF109) = 0u;
  *v29 = 1039893482;
  *(_DWORD *)(v26 - 0x1BD3A2918E8AF0F5) = 1039893482;
  *(_OWORD *)(v26 - 0x1BD3A2918E8AF0F1) = 0u;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v25 + 8 * ((52 * ((v27 ^ 0x74E) == 834)) ^ v27)) - 4))(v40);
}

uint64_t sub_218ECFE4C@<X0>(uint64_t a1@<X8>, __n128 a2@<Q0>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  *(__n128 *)(v6 + v2 + 24) = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v2 + a1 == 834) * v3) ^ v5)) - 4))();
}

void sub_218ECFEB4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  _BOOL4 v7;

  v1 = 1332649919 * (((a1 | 0x520DF19C) - a1 + (a1 & 0xADF20E63)) ^ 0x6F7E756E);
  v2 = *(_DWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_DWORD *)a1 - v1;
  v5 = *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F9);
  *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F9) = v5 + 8 * v4 - 1981087688;
  v6 = v5 + 8 * v4 + 470741071;
  v7 = v6 < v5 - 1843138537;
  if ((v5 - 1843138537) < 0xD01F7401 != v6 < 0xD01F7401)
    v7 = (v5 - 1843138537) < 0xD01F7401;
  *(_DWORD *)(v3 - 0x1BD3A2918E8AF0F5) += ((v4 - 247635961) >> 29) + v7;
  __asm { BR              X9 }
}

uint64_t sub_218ED0040()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = (v2 - 430692659) <= 0xF516C6C5 || (((v0 - 55) | 1) ^ 0xF516C30F) - v1 <= v2 - 430692659;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((v5 * ((v0 + 1168667160) & 0xBA578BFF ^ 0x229)) ^ v0)) - 12))();
}

uint64_t sub_218ED00C0()
{
  int v0;
  int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = ((v1 + 66410358) & 0xFC0AA7FE ^ 0xFFFFFFFF998DDF74) + (1718756406 - v0) < 8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((4 * v3) | (16 * v3) | v1)) - 4))();
}

uint64_t sub_218ED012C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17
                                        + 8
                                        * ((v16 - 777) ^ (118
                                                        * ((unint64_t)(a15
                                                                            - 0x1BD3A2918E8AF293
                                                                            - v18
                                                                            + v15
                                                                            + 418) > 7))))
                            - (((151 * ((v16 - 777) ^ 0x105) + 121) | 0x12u) ^ 0x372)))();
}

uint64_t sub_218ED0198@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _QWORD *v4;

  *a1 = *v4;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((v1 & 0xFFFFFFFFFFFFFFF8) == 8) * ((v2 - 94985141) & 0x5A959C1 ^ 0x7D4)) ^ v2)))();
}

uint64_t sub_218ED01EC(int a1, uint64_t a2)
{
  int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  *v4 = *v3;
  return (*(uint64_t (**)(void))(v5 + 8 * (((a2 == 0) * a1) ^ v2)))();
}

uint64_t sub_218ED0210()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((v2 - 208) | 0x34E) ^ 0x3FF) * (v0 == v1)) | v2))
                            - (v2 + 638)
                            + 882))();
}

uint64_t sub_218ED0244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(a1 + v2 + v1) = *(_BYTE *)(v6 + v2 + v1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((26 * (v2 + 1 != v3)) | (v4 - 509))) - 12))();
}

uint64_t sub_218ED027C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t (*a13)(uint64_t *), void (*a14)(uint64_t *), uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19)
{
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;

  v24 = 515566439 * ((&a17 & 0x9FF2E3E6 | ~(&a17 | 0x9FF2E3E6)) ^ 0xCD91BBE);
  a17 = v21;
  LODWORD(a18) = 1502915589 - v24;
  HIDWORD(a18) = (v22 - 96) ^ v24;
  a14(&a17);
  a19 = v22
      + 1580882533 * ((&a17 + 581766272 - 2 * (&a17 & 0x22AD0C80)) ^ 0xBB35BF40)
      + 2088559337;
  a17 = v21;
  a18 = a15 + 0x60AE5240038903C6;
  v25 = a13(&a17);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8
                                            * ((890
                                              * (v23 - v20 - 247636025 < ((v22 + 362103581) & 0xEA6ABBFD ^ 0xFFFFFCDA ^ (9 * ((v22 - 568) ^ 0x16D))))) ^ (v22 - 568))))(v25);
}

uint64_t sub_218ED03C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 + 8 * ((v8 - 97) | 0x80 | (4 * (v10 - 0x1BD3A2918E8AF293 - v11 + (unint64_t)((v8 - 97) | 0x80u) < 0x10)))) - (((v8 - 97) | 0x80) ^ 4u) + 410))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_218ED0478()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((206 * (v1 + v0 == 247636560)) ^ v0)) - 4))();
}

uint64_t sub_218ED04BC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v9;

  *(_BYTE *)(a1 + (v5 - 1489368210)) = *(_BYTE *)(v7 + (v5 - 1489368210));
  v9 = v5 - 782503053 <= v2 || v5 - 782503053 >= v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((v9 * v4) ^ v1)) - (v1 + 295) + 890))();
}

uint64_t sub_218ED0508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8 * (v18 | (4 * ((unint64_t)(v19 - 0x1BD3A2918E8AF293 - v16 + a9 - ((a16 + 1) << 6)) < 0x10)))) - (v18 ^ 4u) + 410))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_218ED056C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + v1 - 527533303 + 24) = *(_BYTE *)(v4 + v1 - 527533303);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((579 * (v1 + 1 == v5 + 64)) ^ v0)) - (v0 ^ 0xE0u) + 314))();
}

uint64_t sub_218ED05B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)(v3 + a1 + 24) = *(_OWORD *)(v4 + a1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((583 * (a1 == 48)) ^ v2))
                            - ((v2 + 528026165) & 0xE086F56E ^ 0x14ALL)))();
}

uint64_t sub_218ED0604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t (*a13)(uint64_t *), void (*a14)(uint64_t *), uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19)
{
  uint64_t v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;

  v22 = 515566439 * ((((2 * &a17) | 0x23644F9A) - &a17 + 1850595379) ^ 0xFD66206A);
  a17 = a11;
  LODWORD(a18) = 1502915589 - v22;
  HIDWORD(a18) = (v20 + 472) ^ v22;
  a14(&a17);
  a17 = a11;
  a18 = a10;
  a19 = 1580882533 * (((&a17 | 0x99EA66D2) - (&a17 & 0x99EA66D2)) ^ 0x72D512)
      + 2088559337
      + v20
      + 568;
  v23 = a13(&a17);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8
                                            * (((35 * (v20 ^ 0x155) - 468)
                                              * ((v21 - 247636089) < 0xFFFFFFC0)) ^ v20)))(v23);
}

uint64_t sub_218ED0718()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8
                                             * ((431 * (v0 + 1782493362 != ((v2 - 89) ^ 0x13E) + 2030128429)) ^ v2))
                            - (((v2 - 89) | 0x13Eu) ^ 0x37ALL)))();
}

uint64_t sub_218ED076C@<X0>(unsigned int a1@<W8>)
{
  unsigned int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  _BOOL4 v7;

  v6 = v2 - 229;
  v7 = v1 < a1;
  *(_BYTE *)(v4 - 0x1BD3A2918E8AF0F1) = *v5;
  if (v7 == a1 > 0x790150AC)
    v7 = v1 > 0x790150AC;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((484 * v7) ^ v6)) - 4))();
}

void sub_218ED07EC()
{
  JUMPOUT(0x218ED07A0);
}

uint64_t sub_218ED0830(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;

  v1 = 1449114341 * ((2 * (a1 & 0x598F067E) - a1 + 644938113) ^ 0xE92E006A);
  v2 = *(_DWORD *)(a1 + 12) ^ v1;
  v3 = (*(_DWORD *)(a1 + 8) ^ v1) - 1403449154;
  v4 = v3 + (*(_DWORD *)(*(_QWORD *)a1 - 0x24DFB20F49F75402) ^ 0xBAB04DB8);
  v5 = v4 - ((2 * v4) & 0x75609B70) - 1162850888;
  *(_DWORD *)(*(_QWORD *)a1 - 0x24DFB20F49F75402) = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DA380E0 + (v2 ^ 0xC1)) + ((173 * ((v5 ^ 0xBAB04DB8) < v3)) ^ v2) - 1)
                            - 4))();
}

void sub_218ED08FC(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x24DFB20F49F75406) = (*(_DWORD *)(a1 - 0x24DFB20F49F75406) ^ 0x41DB5F8B)
                                         + 1104895883
                                         - ((2 * (*(_DWORD *)(a1 - 0x24DFB20F49F75406) ^ 0x41DB5F8B) + 2) & 0x83B6BF16)
                                         + 1;
}

void sub_218ED0944(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 16) != 0x6018B445646BA20BLL && *(_QWORD *)(a1 + 48) != 0 && *(_QWORD *)(a1 + 32) != 0;
  v1 = *(_DWORD *)(a1 + 24) ^ (1332649919 * (a1 ^ 0x3D7384F2));
  __asm { BR              X12 }
}

uint64_t sub_218ED0A08()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v5;

  if (*(_QWORD *)(v2 + 8))
    v4 = *(_DWORD *)v2 + v1 == 1530779410;
  else
    v4 = 1;
  v5 = v4;
  return (*(uint64_t (**)(void))(v3 + 8 * ((1011 * (((v0 - 4) ^ v5) & 1)) ^ v0)))();
}

uint64_t sub_218ED0A4C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((1104 * (*(_BYTE *)(v0 - 0x6018B445646BA20ALL) == 115)) ^ (v1 - 261)))
                            - (((v1 - 257) | 0x101u) ^ 0x165)))();
}

uint64_t sub_218ED0A9C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((*(_BYTE *)(v2 + 5) == ((v0 - 1233814125) & 0x71 ^ 0x63))
                                          * ((v0 + 1072) ^ 0x41A)) ^ v0))
                            - 4))();
}

uint64_t sub_218ED0AEC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((30
                                          * (*(unsigned __int8 *)(v2 + 12) > (v0 + (v0 ^ 0x11) - 40))) ^ v0))
                            - 12))();
}

uint64_t sub_218ED0B28()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((*(unsigned __int8 *)(v2 + 6) == (((v0 + 84) & 0x6F) - 96))
                                          * ((v0 - 577) ^ 0x34)) ^ v0))
                            - 8))();
}

uint64_t sub_218ED0B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, uint64_t a17, uint64_t a18, int a19, unsigned int a20,uint64_t a21)
{
  unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v30;

  v26 = (uint64_t)&v21[56 * *v21 + 0x73DCADE8D2E91DC6];
  v30 = bswap32(*(_DWORD *)(v23 + 32));
  v27 = 1477295531 * (((&a15 | 0xB4E6FDDB) - (&a15 & 0xB4E6FDDB)) ^ 0x83EDC888);
  a17 = v23 + 56;
  a18 = v26;
  a15 = v23 + 56;
  a19 = v27 + v24 + 1104;
  a20 = v27
      + ((2 * v30) & 0xFEF3FFE0)
      + 1066349488
      + (((((v24 + 1954945953) & 0x8B79E69F) - 1036) ^ ((v24 - 60) | 0x141)) & v30 ^ 0xFF79FFFB);
  a21 = v23 + 16;
  v28 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v25 + 8 * (v24 ^ 7)) - 4))(&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22 + 8 * ((372 * (a16 == 280600939)) ^ v24)) - 4))(v28);
}

uint64_t sub_218ED0C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, int a14, int a15, uint64_t a16, int a17, int a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,unsigned int a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;

  v28 = 1503905621 * ((~&a17 & 0x76FE942D | &a17 & 0x89016BD2) ^ 0x2B86FAF9);
  a24 = ((a14 ^ 0xBAFE6FAE) + 1469576824 + (a11 & 0x75FCDF5C)) ^ v28;
  a20 = v26 + 36;
  a21 = v26;
  a18 = a15 - v28 - 320;
  a19 = (85 * ((~&a17 & 0x2D | &a17 & 0xD2) ^ 0xF9)) ^ 0x47;
  a22 = a12;
  a23 = v24;
  v29 = (*(uint64_t (**)(int *))(v27 + 8 * (a15 ^ 0x22F)))(&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v25
                                                      + 8
                                                      * (int)(((a17 == 280600939)
                                                             * ((a15 + 2052204368) & 0x85ADD773 ^ 0x71E)) ^ a15))
                                          - 8))(v29);
}

uint64_t sub_218ED0DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, int a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v18 = (*(uint64_t (**)(_QWORD, uint64_t))(v17 + 8 * (a14 - 645)))(a13 - *(unsigned __int8 *)(v15 + 14), 2403785118);
  *v16 = v18;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14
                                                                                          + 8
                                                                                          * (((v18 == 0)
                                                                                            * ((a14 - 617) ^ 0x5C)) ^ (a14 - 617)))
                                                                              - (a14 - 316)
                                                                              + 349))(v18, v19, v20, v21, v22);
}

uint64_t sub_218ED0E04()
{
  int v0;
  uint64_t v1;
  int v2;
  _DWORD *v3;
  unsigned int v4;

  *v3 = v0;
  v4 = v0 + (((v2 ^ 0x218) + 407202234) & 0xE7BA979F) - ((((v2 ^ 0x218) - 203) ^ 0x16518E5A) & (2 * v0)) - 1960262633;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((28
                                          * (((2 * v4) & 0xFDFD1EFC ^ 0x14510E38) + (v4 ^ 0xF5D648E3) - 481951744 == 1648660350)) ^ v2 ^ 0x218))
                            - 8))();
}

uint64_t sub_218ED0EBC()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((2 * ((v3 + v0) > 1)) | (4 * ((v3 + v0) > 1))) ^ (v1 - 46)))
                            - 4))();
}

uint64_t sub_218ED1250(char a1, char a2, char a3)
{
  uint64_t v3;
  char v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;

  v8 = (v5 - 75) | 0x45;
  v9 = a1 + a2 + a3;
  *(_BYTE *)(v3 + v7 - 1) = ((v9 + 88) ^ 0xBA) * (v9 + 105);
  *(_BYTE *)(v3 + v7 - 2) = ((v4 + ((2 * v8) ^ 0x97)) ^ 0xBA) * (v9 + 106);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8 * (((2 * ((v3 & 0xFFFFFFFE) != 2)) | (8 * ((v3 & 0xFFFFFFFE) != 2))) ^ v8))
                            - 12))();
}

void sub_218ED12F4()
{
  JUMPOUT(0x218ED12A8);
}

uint64_t sub_218ED1300(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v3 != v2) * (((a2 - 76) | 0x124) ^ 0x5B)) ^ a2)) - 4))();
}

uint64_t sub_218ED1338()
{
  int v0;
  uint64_t v1;
  char v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = v1 - 1;
  *(_BYTE *)(v5 + v6) = ((v2 + 88) ^ 0xBA) * (v2 + 105);
  return (*(uint64_t (**)(void))(v4 + 8 * (((v6 == ((v3 + 45) ^ 0x161)) * v0) ^ v3)))();
}

void sub_218ED137C(int a1@<W8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 40) = a1;
}

void sub_218ED13BC(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_218ED141C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 192))(200, 2354554103) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((523 * v3) ^ v1)) - 4))();
}

uint64_t sub_218ED1468(uint64_t a1)
{
  _QWORD *v1;
  unsigned int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v7;
  unsigned int v8;
  int v9;

  v7 = (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 8 * (v5 - 1487345658)))(a1, 0);
  v8 = ((2 * v7) & 0xFFD4E7DA) + (v7 ^ 0xFFEA73ED);
  if (v8 == -1412099)
  {
    v3 += 7;
    goto LABEL_7;
  }
  if (v8 == -1412103)
  {
LABEL_7:
    (*(void (**)(uint64_t))(v4 + 8 * (v5 - 1487345617)))(a1);
    v9 = v3;
    return v9 ^ v2;
  }
  if (v8 != -1412115)
  {
    v3 += 6;
    goto LABEL_7;
  }
  *v1 = a1;
  v9 = -2129511652;
  return v9 ^ v2;
}

void U4HBs()
{
  int v0[12];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 291625862
        - 1334103649
        * ((-1357713663 - (v0 ^ 0x9C4B1B06 | 0xAF12EF01) + (v0 ^ 0x9C4B1B06 | 0x50ED10FE)) ^ 0xA40EC356);
  sub_218EF7A24(v0);
  __asm { BR              X8 }
}

uint64_t sub_218ED1604()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * ((86 * ((v0 ^ 0x6D2DE21DA2E3804ELL) != 0x6D2DE21DA2E3804ELL)) ^ 0x3A5u))
                            - 12))();
}

uint64_t sub_218ED1678@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v8;

  v5 = *(_QWORD *)(a1 - 0x6D2DE21DA2E38036);
  if (v3)
    v6 = v5 == 0x6018B445646BA20BLL;
  else
    v6 = 1;
  v8 = !v6 && v2 != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((v8 * ((v1 ^ 0x97) + 669)) ^ v1)) - 4))();
}

uint64_t sub_218ED16D0()
{
  int v0;
  unsigned int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  BOOL v6;
  int v7;

  if (v3)
    v6 = v4 == (v1 ^ (v2 + 1292)) + 1364153326;
  else
    v6 = 1;
  v7 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((v7 * v0) ^ v1)) - ((v1 + 139) ^ 0x9DLL)))();
}

uint64_t sub_218ED1714@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = *(unsigned __int8 *)(a1 - 0x6018B445646BA20ALL) == 115;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((2 * v3) | (32 * v3)) ^ v1))
                            - ((v1 - 1363350331) & 0xAEB0AEB3 ^ 0xAEB0AC16)))();
}

uint64_t sub_218ED1774()
{
  uint64_t *v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (*(uint64_t (**)(void))(v3 + 8 * (v1 & 0x11A)))();
  *v0 = v4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2
                                                                                          + 8
                                                                                          * ((783 * (v4 != 0)) ^ v1))
                                                                              - ((((v1 - 1506761865) | 0x8800802)
                                                                                - 2930813769) ^ ((v1 - 81) | 0x85))))(v4, v5, v6, v7, v8);
}

uint64_t sub_218ED1824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, int a12, unsigned int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int16 a18, unsigned int a19)
{
  _BYTE *v19;
  int v20;
  _DWORD *v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v34;

  v26 = v20;
  v34 = v20 + 138;
  *v21 = a10;
  v27 = *v22;
  *(_DWORD *)(v27 + 3) = 16908633;
  *(_BYTE *)(v27 + 2) = 76;
  *(_WORD *)v27 = 20550;
  *(_BYTE *)(v27 + 7) = 0;
  *(_DWORD *)(v27 + 8) = bswap32(v23 + 44);
  *(_BYTE *)(v27 + 12) = *v19;
  *(_BYTE *)(v27 + 13) = 0;
  *(_BYTE *)(v27 + 14) = BYTE4(a9);
  *(_BYTE *)(v27 + 15) = 0;
  a18 = 6497 - 32699 * ((unsigned __int16)&a17 ^ 0xD68D);
  a17 = v27 + 0x3DFA1ACB8D1A27CELL;
  a19 = (v20 + 514) ^ (1663139771 * (&a17 ^ 0x78E9D68D));
  ((void (*)(uint64_t *))(*(_QWORD *)(v25 + 8 * (v20 - 59)) - 8))(&a17);
  *(_DWORD *)(v27 + 32) = bswap32(a13);
  v28 = v23 + v34 - ((v23 << (v26 + 52)) & 0x346891E2) - 1707849830;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v24 + 8 * ((553 * (((2 * v28) & 0xBB5FC3C6 ^ 0x304881C2) + (v28 ^ 0x479BA912) + 1652522878 != 1076846945)) ^ v26)) - 12))(v34, v29, v30, v31, v32, 1364153326, 2930812688, a13, a9);
}

uint64_t sub_218ED198C(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1366 * (v2 + v1 + ((a1 + 1005051412) & 0xC41821D4 ^ 0x22501F5D) > 7)) ^ a1))
                            - (((a1 + 1050297) | 0xAEA0A402) ^ 0xAEB0AC1ELL)))();
}

uint64_t sub_218ED1A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (((((a6 + a7 + v7 + 962 + 640) | 0x118) ^ 0x38F)
                                          * ((unint64_t)(v8 - v10 - 56) < 0x20)) ^ v7))
                            - 12))();
}

uint64_t sub_218ED1A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  unsigned int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (int)(((a6 + ((v8 + 1960600610) & 0x8B239D47) + a7 + 91) * (v7 > 0x1F)) ^ v8))
                            - 12))();
}

uint64_t sub_218ED1A98@<X0>(int a1@<W5>, char a2@<W6>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v10 = v5 + v4 + v6;
  v11 = v8 + v10;
  v12 = *(_OWORD *)(v11 - 31);
  v13 = a3 + v10;
  *(_OWORD *)(v13 - 15) = *(_OWORD *)(v11 - 15);
  *(_OWORD *)(v13 - 31) = v12;
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((49 * ((((v3 & 0xFFFFFFE0) == 32) ^ (5 * (v7 ^ (a2 - 23)))) & 1)) ^ (a1 + v7 + 863))))();
}

void sub_218ED1AFC()
{
  JUMPOUT(0x218ED1AACLL);
}

uint64_t sub_218ED1B08(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)(((((a2 + 249007976) & 0xF1286DFB) + ((a2 - 288) ^ 0xFFFFFD14)) * (v2 == v3)) ^ a2)))();
}

uint64_t sub_218ED1B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((1018 * ((((((v8 + 612402693) | 0x8A302412) - a7) ^ 0x51A) & v7) == 0)) ^ v8))
                            - 4))();
}

uint64_t sub_218ED1B90@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(a2 - 7 + (v4 + v3 + v5 - v6)) = *(_QWORD *)(v7 - 7 + (v4 + v3 + v5 - v6));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((485
                                          * ((((((a1 ^ 0x1E5) - 1263) & v2) - v6 == 8) ^ ((a1 ^ 0xE5) + 6)) & 1)) ^ a1 ^ 0x1E5))
                            - 8))();
}

void sub_218ED1C0C()
{
  JUMPOUT(0x218ED1BD8);
}

uint64_t sub_218ED1C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (v8 ^ (410 * (v7 != v9))))
                            + a4
                            - ((v8 + 682) ^ (a7 + 2133))))();
}

uint64_t sub_218ED1C48@<X0>(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(a3 + (v4 ^ (a2 + 2133)) + v3 - 1076847833) = *(_BYTE *)(v5
                                                                                 + (v4 ^ (a2 + 2133))
                                                                                 + v3
                                                                                 - 1076847833);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((4 * (v3 - 1 == v6)) | (8 * (v3 - 1 == v6)) | (a1 + v4 + 193)))
                            - 12))();
}

uint64_t sub_218ED1C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, unsigned __int8 *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 *a19, uint64_t a20,unsigned __int8 *a21,uint64_t a22)
{
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unsigned int v28;
  unsigned __int8 *v29;
  unsigned int v30;
  uint64_t v31;
  int v33;

  v33 = 2 * a8;
  v27 = &a17;
  v28 = 1663139771 * ((-2 - ((~(_DWORD)v27 | 0x96CE46FB) + (v27 | 0x6931B904))) ^ 0xEE279076);
  a18 = v26;
  a19 = a14;
  HIDWORD(a20) = v28 + v23 - 209;
  LODWORD(a17) = (a8 ^ 0xF7FF57A9) + ((2 * a8) & 0xEFFEAF52) + 964541151 + v28;
  LOBYTE(a20) = (-69 * ((-2 - ((~(_BYTE)v27 | 0xFB) + (v27 | 4))) ^ 0x76)) ^ 0x43;
  a21 = (unsigned __int8 *)(v26 + 56);
  a22 = v26 + 0x459D8194EE4C0605;
  ((void (*)(uint64_t *))(*(_QWORD *)(v25 + 8 * (v23 ^ 0x301)) - 12))(&a17);
  v29 = &a14[56 * *a14];
  v30 = 846572393 * (((&a17 | 0xFFEEDA60) - (&a17 & 0xFFEEDA60)) ^ 0xC98D8E29);
  a20 = v26 + 0x45C47169C9B67373;
  a21 = v29 + 0x27D1BA72F3F8139CLL;
  a19 = (unsigned __int8 *)(v26 + 0x30823A6E124052ADLL);
  LODWORD(a18) = (((v23 - 308) ^ 0xFB6F7DA2) & v33) - v30 + (((v23 - 10) ^ 0xFFFFFC9D) & a13 ^ 0xFDB7BFFE) + 854420872;
  LODWORD(a22) = (v23 + 342) ^ v30;
  a17 = v26 + 0x3D03F1BDD91379BELL;
  v31 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v25 + 8 * (v23 - 695)) - 4))(&a17);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * ((254 * (HIDWORD(a22) != v24)) ^ v23)))(v31);
}

uint64_t sub_218ED1EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int a12)
{
  _QWORD *v12;
  uint64_t v13;

  return (*(uint64_t (**)(_QWORD))(v13
                                           + 8
                                           * (int)((((a12 - 882178979) & 0x3494FA7F ^ ((a12 ^ 0xAEB0AF7F) + 1364153932))
                                                  * (a10 == 0)) ^ a12)))(*v12);
}

uint64_t sub_218ED1F04()
{
  int v0;
  int v1;
  _DWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;

  (*(void (**)(void))(v4 + 8 * (v0 ^ (v1 + 1301))))();
  *v3 = 0;
  *v2 = 0;
  return (v5 - 280600939);
}

void sub_218ED2208(uint64_t a1)
{
  int v1;
  int v2;
  _BOOL4 v4;

  v1 = 1503905621 * ((a1 - 2 * (a1 & 0xE4DE87AC) - 455178324) ^ 0xB9A6E978);
  v2 = *(_DWORD *)(a1 + 4) + v1;
  v4 = *(_QWORD *)(a1 + 16) == 0xC7936AAE040490CLL || (unsigned __int16)(*(_WORD *)a1 - v1) == 28948;
  __asm { BR              X8 }
}

uint64_t sub_218ED22E8()
{
  int v0;
  unsigned int v1;
  unsigned int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((199
                                          * ((((v1 | ((v1 < v2) << 16)) == 28948) ^ (119 * (v0 ^ 0x6E))) & 1)) ^ v0))
                            - ((v0 - 350084528) & 0x14DDDF75 ^ 0x33DLL)))();
}

#error "218ED2708: call analysis failed (funcsize=160)"

uint64_t sub_218ED270C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a72;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _DWORD *v76;
  unsigned int *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t);

  STACK[0x258] = 0x9B4884BE02403461;
  v76 = *(_DWORD **)(v74 + 8 * (v72 ^ 0x35A));
  STACK[0x208] = (unint64_t)v76;
  LODWORD(STACK[0x254]) = *v76;
  v77 = *(unsigned int **)(v74 + 8 * (int)(v72 & 0x8DE57C1D));
  STACK[0x210] = (unint64_t)v77;
  v78 = *v77;
  *(_DWORD *)(v75 - 144) = ((v72 - 338387987) ^ 0x7E) - a72;
  *(_DWORD *)(v75 - 160) = a72 + v72 - 502674350;
  *(_DWORD *)(v75 - 156) = -(int)a72;
  v79 = (_QWORD *)(v75 - 168);
  v79[2] = v78 - a72;
  *v79 = a72;
  *(_DWORD *)(v75 - 136) = v72 - 338387987 - a72;
  *(_DWORD *)(v75 - 132) = a72 + v72 - 338387987 + 208;
  v80 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v74 + 8 * (v72 ^ 0x3F3)) - 8))(v75 - 168);
  v81 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v73 + 8 * *(int *)(v75 - 140)) - 4);
  STACK[0x248] = *(_QWORD *)(v74 + 8 * (v72 - 651));
  return v81(v80);
}

uint64_t sub_218ED27E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14)
{
  unsigned int *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  int v20;

  v18 = (v15 - 791) | 0x164;
  STACK[0x220] = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8 * a13))(a14, 2965982036);
  v19 = (*(uint64_t (**)(void))(v17 + 8 * (v15 - 814)))();
  *v14 = v19;
  v20 = (((v18 - 179213199) & 0xAAE927B) - 614808473) ^ v19 ^ ((v19 >> 30) - 614808473 - 4 * (v19 >> 31) + 107);
  v14[1] = ((1812433253 * v20) ^ 0x79C0CF6B) + ((-670100790 * v20) & 0xF3819ED6) - 2042679146;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * v18) - 8))();
}

void sub_218ED28E8()
{
  JUMPOUT(0x218ED287CLL);
}

uint64_t sub_218ED2900(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  int v5;
  int v6;
  char v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  _BYTE *v13;
  unsigned int v14;
  unint64_t v15;

  v13 = (_BYTE *)(a3 + v11 - 726819627 + ((v5 + v12) & a5));
  v14 = -2111575393
      * ((v13 ^ *(_DWORD *)(*(_QWORD *)STACK[0x230]
                                        + ((((a5 + v5 + v12 + 522) | 0x10) + 1108281991) & *(_DWORD *)STACK[0x228]))) & 0x7FFFFFFF);
  v15 = -2111575393 * (v14 ^ HIWORD(v14));
  LODWORD(v15) = *(unsigned __int8 *)(*(_QWORD *)(v10 + 8 * (v5 ^ 0x124)) + (v15 >> 24) - 12) ^ (((v6 ^ a4) >> (v7 - 24))
                                                                                                 - ((2 * ((v6 ^ a4) >> (v7 - 24))) & 0x76)
                                                                                                 - 69) ^ *(unsigned __int8 *)(*(_QWORD *)(v10 + 8 * (v5 ^ 0x17C)) + (v15 >> 24) + 2 - 12) ^ *(unsigned __int8 *)(*(_QWORD *)(v10 + 8 * (v5 - 280)) + (v15 >> 24) + 2 - 8) ^ v15 ^ (3 * (v15 >> 24)) ^ 0xFFFFFFBB;
  *v13 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((824 * (v11 - (v15 != 0) != v8)) ^ v5)) - 12))();
}

void sub_218ED3968()
{
  JUMPOUT(0x218ED26CCLL);
}

void sub_218ED3970()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = v0;
}

void sub_218ED39B8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24) ^ (1332649919 * ((-2 - ((a1 | 0x858DAAF) + (~(_DWORD)a1 | 0xF7A72550))) ^ 0xCAD4A1A2));
  __asm { BR              X10 }
}

uint64_t sub_218ED3A6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * (v2 ^ 0x2D3)))(264, 4288951842) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1641 * v3) ^ v2)) - (((v2 - 75) | 0x2Au) ^ 0x2AELL)))();
}

uint64_t sub_218ED3AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  int v11;
  unint64_t v12;

  *(_QWORD *)a1 = 28416;
  memset((void *)(a1 + 8), 148, 32);
  *(_QWORD *)(a1 + 40) = 2492765332;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  memset((void *)(a1 + 64), 148, 32);
  v12 = ((unint64_t)&a10 ^ 0x5F5D7DBFF7CD9EFBLL)
      - 0x10411A277840090
      + ((2 * (_QWORD)&a10) & 0xBEBAFB7FEF9B3DF0);
  *(_QWORD *)(a1 + 96) = 2492765332;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_WORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 131) = 0;
  *(_BYTE *)(a1 + 259) = (v12 + (((v11 + 88) | 0xC9) ^ 0x6D)) * ((v12 - 107) ^ 0xBA);
  *(_BYTE *)(a1 + 258) = ((v12 - 106) ^ 0xBA) * (v12 - 89);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * v11) - 12))();
}

void sub_218ED3BC4()
{
  JUMPOUT(0x218ED3B7CLL);
}

uint64_t sub_218ED3BD0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 0x75136DB457459E9ALL) = result + 0x6018B445646BA20BLL;
  *(_DWORD *)(v1 + 8) = 280600939;
  return result;
}

uint64_t sub_218ED3C1C(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v4;

  if (*(_QWORD *)(a1 + 32))
    v2 = *(_QWORD *)(a1 + 16) == 0x4D6564C19868E87BLL;
  else
    v2 = 1;
  v4 = v2 || *(_QWORD *)(a1 + 8) == 0x252C3BDA7CBE997ALL;
  v1 = *(_DWORD *)a1 - 1477295531 * ((2 * (a1 & 0x814D3C0) - a1 + 2011900991) ^ 0x40E0196C);
  return (*((uint64_t (**)(void))*(&off_24DA380E0 + (v1 ^ 0x276))
          + ((v4 * (((v1 - 438490828) & 0x1A22D6D7) - 701)) ^ v1)
          - 1))();
}

uint64_t sub_218ED3CD4(uint64_t result)
{
  *(_DWORD *)(result + 24) = 280558039;
  return result;
}

uint64_t sub_218ED3CE4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) = 469769540;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9062) = v2;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9052) = v2 + 256;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += (v4 - 12) ^ 0x3C5;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9042) = v2 + 512;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9032) = v2 + 768;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9022) = v2 + 1024;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9012) = v2 + 1280;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE9002) = v2 + 1536;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8FF2) = v2 + 1792;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8FE2) = v2 + 2048;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8FD2) = v2 + 2304;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8FC2) = v2 + 2560;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8FB2) = v2 + 2816;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8FA2) = v2 + 3072;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8F92) = v2 + 3328;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8F82) = v2 + 3584;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_QWORD *)(v3 - 0x252C3BDA7CBE8F72) = v2 + 3840;
  *(_DWORD *)(a2 - 0x4D6564C19868E87BLL) += 256;
  *(_DWORD *)(result + 24) = 280600939;
  return result;
}

void sub_218ED3F58(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  if (*(_QWORD *)(a1 + 8))
    v2 = *(_QWORD *)a1 == 0;
  else
    v2 = 1;
  v3 = !v2;
  v1 = *(_DWORD *)(a1 + 28) ^ (1449114341 * (a1 ^ 0xCF5EF9EB));
  __asm { BR              X9 }
}

uint64_t sub_218ED3FF8@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;

  v8 = *(_QWORD *)(result + 16);
  if (*(_BYTE *)(v8 + 131) == 1)
  {
    v5 = 1477295531 * ((2 * ((v4 - 144) & 0x7CDC2998) - (v4 - 144) - 2094803354) ^ 0xB428E335);
    *(_QWORD *)(v4 - 128) = &STACK[0x24DFB20F49F750F2];
    *(_DWORD *)(v4 - 140) = v5 + 699665782;
    *(_DWORD *)(v4 - 136) = 209736471 - v5 + v3;
    sub_218EF3DC4(v4 - 144);
    v6 = 11 * ((v3 + 556) ^ 0x2FA);
    v7 = (((v6 - 1250) | 0x308) ^ 0x8BBA2AC)
       + ((v6 - 1158087975) & 0x450700BF)
       + 2001051156
       + ((2 * v9) & 0x7A ^ 0x70)
       + (v9 & 0x3F ^ 0x7FFEBF45u) < 0xFFFFFFC0;
    __asm { BR              X8 }
  }
  if (!*(_BYTE *)(v8 + 131))
    __asm { BR              X8 }
  return result;
}

void sub_218ED6E6C(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  _BYTE v9[35];
  _BYTE v10[210];
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = 1449114341 * ((-2 - ((~(_DWORD)a1 | 0x4FE6400B) + (a1 | 0xB019BFF4))) ^ 0x80B8B9E0);
  v3 = *(_DWORD *)a1 + v2;
  v4 = *(_DWORD *)(a1 + 24);
  v8 = 1449114341 * ((-2 - ((~a1 | 0xED1DBDA74FE6400BLL) + (a1 | 0x12E24258B019BFF4))) ^ 0x90E6A90880B8B9E0);
  v5 = v4 - v2;
  ((void (*)(char *, _BYTE *, uint64_t))((char *)*(&off_24DA380E0 + (v3 ^ 0x1EE)) - 12))((char *)*(&off_24DA380E0 + (int)(v3 & 0x8176307E)) - 8, v9, 35);
  v11 = 0x45911BA50E9B02CBLL;
  v12 = 0x7FB18A65A5EFE382;
  v13 = -763524002;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_BYTE *)(v6 + 0 % (v5 ^ 0x863783E0));
  LOBYTE(v6) = *(_BYTE *)(v6 + 1 % (v5 ^ 0x863783E0));
  v10[0] = v7 - ((2 * v7) & 0xBB) + 93;
  v10[v3 + 30 - 412] = v6 - ((2 * v6) & 0xBB) + 93;
  __asm { BR              X15 }
}

uint64_t sub_218ED7028@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__int16 a23,char a24)
{
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;

  v28 = (unsigned __int16)(v27 - 17112 + ((v24 + 25048) & 0x9DAB)) % 0xD2u;
  v29 = *(&a24 + (v27 + v25 + 142) % 0xD2u);
  v30 = *(&a24 + (v27 + v25 + 98) % 0xD2u);
  HIDWORD(v32) = v29 ^ 0x1D;
  LODWORD(v32) = (v29 ^ 0x40) << 24;
  v31 = v32 >> 29;
  HIDWORD(v32) = v30 ^ 5;
  LODWORD(v32) = (v30 ^ 0x58) << 24;
  v33 = v32 >> 27;
  v34 = *(&a24 + (v27 + v25) % 0xD2u);
  HIDWORD(v32) = ~v34;
  LODWORD(v32) = (v34 ^ 0x5C) << 24;
  v35 = ((v31 + (~(2 * v31) | 0x45) + 94) ^ *(&a24 + v28)) + v33 - (v32 >> 25);
  *(&a24 + v28) = v35 - ((2 * v35) & 0xBB) + 93;
  return (*(uint64_t (**)(void))(a1 + 8 * (((2 * (v27 + 1 == v26 + 840)) | (32 * (v27 + 1 == v26 + 840))) ^ v24)))();
}

uint64_t sub_218ED7154@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,unsigned __int8 a41,char a42,unsigned __int8 a43,char a44,char a45,unsigned __int8 a46,char a47,unsigned __int8 a48,__int16 a49,unsigned __int8 a50,unsigned __int8 a51,char a52,unsigned __int8 a53,char a54,char a55,char a56,unsigned __int8 a57,__int16 a58,__int16 a59,unsigned __int8 a60,__int16 a61,unsigned __int8 a62,__int16 a63)
{
  unsigned __int8 a64;
  unsigned __int8 a65;
  unsigned __int8 a66;
  unsigned __int8 a67;
  unsigned __int8 a68;
  unsigned __int8 a69;
  char a70;
  unsigned __int8 a71;
  unsigned __int8 a72;
  unsigned __int8 a73;
  unsigned __int8 a74;
  char a75;
  unsigned __int8 a76;
  unsigned __int8 a77;
  unsigned __int8 a78;
  unsigned __int8 a79;
  unsigned __int8 a80;
  unsigned __int8 a81;
  unsigned __int8 a82;
  int v82;
  unsigned int v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  unsigned int v91;
  unsigned int v92;
  int v93;
  int v94;
  char v95;
  unsigned int v96;
  char v97;
  unsigned __int8 v98;
  unsigned int v99;
  char v100;
  int v101;
  char v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  uint64_t v110;
  unsigned int v111;
  char v112;
  uint64_t v113;
  char v114;
  int v115;
  int v116;
  int v117;
  int v118;
  unsigned int v119;
  int v120;
  unsigned int v121;
  int v122;
  uint64_t v123;
  int v124;
  unsigned int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  unsigned int v131;
  int v132;
  unsigned int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  unsigned __int16 v139;
  int v140;
  int v141;
  int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  int v151;
  unsigned int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  unsigned int v159;
  int v160;
  uint64_t v161;
  char v162;
  unsigned int v163;
  int v164;
  unsigned int v165;
  int v166;
  int v167;
  int v168;
  uint64_t v169;
  int v170;
  unsigned int v171;
  unsigned int v172;
  int v173;
  int v174;
  int v175;
  unsigned int v176;
  unsigned int v177;
  int v178;
  int v179;
  int v180;
  unsigned int v181;
  int v182;
  int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  int v187;
  unsigned int v188;
  unsigned int v189;
  int v190;
  int v191;
  unsigned int v192;
  int v193;
  uint64_t v194;
  unsigned int v195;
  int v196;
  unsigned int v197;
  int v198;
  int v199;
  unsigned int v200;
  int v201;
  int v202;
  uint64_t v203;
  unsigned int v204;
  char v205;
  uint64_t v206;
  char v207;
  char v208;
  char v209;
  char v210;
  uint64_t v211;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unsigned int v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  unsigned int v222;
  int v223;
  uint64_t v224;
  uint64_t v225;
  unsigned int v226;

  v89 = BYTE5(a35) ^ 0x5D;
  HIDWORD(a3) = v82 + 926;
  v90 = *(_QWORD *)(v84 + 8 * (v82 - 195)) - 12;
  v91 = *(unsigned __int8 *)(v90
                           + ((a80 ^ 0x5D)
                                             - 21
                                             * ((((unsigned __int16)(135 * (a80 ^ 0x5D)) >> 8)
                                                                + ((((a80 ^ 0x5D)
                                                                                    - ((unsigned __int16)(135 * (a80 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ (v82 + 60);
  BYTE3(a20) = (((v82 - 98) ^ (((171 * v89) >> 9) & 0x23 | BYTE2(a31) & v83) ^ 0xE3) & (*(_BYTE *)(v90 + (unsigned __int16)(((v91 >> 4) | (16 * v91)) - 21 * ((3121 * ((v91 >> 4) | (16 * v91))) >> 16))) ^ 0x5D))
             - ((2
               * (((v82 - 98) ^ (((171 * v89) >> 9) & 0x23 | BYTE2(a31) & v83) ^ 0xE3) & (*(_BYTE *)(v90 + (unsigned __int16)(((v91 >> 4) | (16 * v91)) - 21 * ((3121 * ((v91 >> 4) | (16 * v91))) >> 16))) ^ 0x5D))
               + 40) & 0x4E)
             + 59;
  v92 = ((205 * v89) >> 10) * ((205 * v89) >> 10);
  BYTE6(a23) = 2 * v92 - ((4 * v92) & 0xBB) + 93;
  BYTE1(a23) = -97;
  LOBYTE(v92) = *((_BYTE *)&a18 + ((a78 ^ 0x5D) - 35 * ((235 * (a78 ^ 0x5Du)) >> 13)) + 7) ^ 0x27;
  a55 ^= v92 * v92 * (a73 ^ 0x5D);
  v93 = (*(unsigned __int8 *)(v90
                            + ((a79 ^ 0x5D)
                                              - 21
                                              * ((((unsigned __int16)(135 * (a79 ^ 0x5D)) >> 8)
                                                                 + ((((a79 ^ 0x5D)
                                                                                     - ((unsigned __int16)(135 * (a79 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) >> 1) & 0x10;
  v94 = -80 - (v93 | ~(2 * v93) & 0x22 | 0x40);
  *(_BYTE *)(v88 - 113) = v94;
  v95 = (*(_BYTE *)(v88 - 100) ^ 0x5D) - ((2 * (*(_BYTE *)(v88 - 100) ^ 0x5D) + 32) & 0xBA) - 19;
  *(_BYTE *)(v88 - 100) = v95;
  *(_BYTE *)(v88 - 103) = (*(_BYTE *)(v88 - 103) ^ 0x5D) - ((2 * (*(_BYTE *)(v88 - 103) ^ 0x5D) + 22) & 0xBB) - 24;
  v96 = (BYTE3(a27) ^ 0x5D)
      - ((HIBYTE(a21) ^ 0x27) & ((BYTE1(a22) ^ 0x27u) / 3) & ((BYTE5(a24) ^ 0x5D) & (*(unsigned __int8 *)(v88 - 101) ^ 0x22) | *(_BYTE *)(v88 - 101) & 0x38 ^ 0x18) | (*(unsigned __int8 *)(v90 + ((BYTE6(a27) ^ 0x5D) - 21 * ((((unsigned __int16)(135 * (BYTE6(a27) ^ 0x5D)) >> 8) + ((((BYTE6(a27) ^ 0x5D) - ((unsigned __int16)(135 * (BYTE6(a27) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D) & (HIBYTE(a21) ^ 0xFFFFFFD8));
  BYTE3(a27) = v96 - ((2 * v96) & 0xBB) + 93;
  v97 = *(_BYTE *)(v88 - 104);
  v221 = *((unsigned __int8 *)&a18
         + ((BYTE5(a31) ^ 0x5D) - 35 * ((235 * (BYTE5(a31) ^ 0x5Du)) >> 13))
         + 7);
  v98 = (BYTE5(a21) ^ 0x27) & (v95 ^ 0x5D) | v95 & 0x36 ^ 0x22;
  BYTE3(a20) = v98 / 5u - (((205 * v98) >> 9) & 0x4E) + 39;
  v99 = (((BYTE1(a22) >> 1) & 0x5E ^ 0x32) - (BYTE1(a22) & 0x88) - 60) ^ 0xFFFFFFC4;
  v100 = BYTE1(a25);
  v101 = (*((unsigned __int8 *)&a18
          + ((BYTE1(a25) ^ 0x5D) - 35 * ((235 * (BYTE1(a25) ^ 0x5Du)) >> 13))
          + 7) ^ 0x27)
       + v99 * v99 * v99;
  v102 = (BYTE3(a22) ^ 0x27) & (v97 ^ 0x5D | 0x50) | (v97 ^ 0x5D) & 0x50;
  BYTE4(a23) = (BYTE4(a23) ^ 0x5D) - v102 * v102 - ((2 * ((BYTE4(a23) ^ 0x5D) - v102 * v102)) & 0xBB) + 93;
  v103 = *((unsigned __int8 *)&a18
         + ((BYTE2(a27) ^ 0x5D) - 35 * ((235 * (BYTE2(a27) ^ 0x5Du)) >> 13))
         + 7) ^ 0xFFFFFFD8;
  v104 = v103 - ((2 * v103 - 70) & 0xFFFFFFE4);
  HIDWORD(a16) = v101 - 90;
  v105 = ((v101 - 90) ^ 0x76BFD3FF) + 2 * (v101 - 90) - 1992283135;
  v106 = *(unsigned __int8 *)(v88 - 116 + (a69 ^ 0x5Du) % 0x14);
  v107 = *(unsigned __int8 *)(v90
                            + ((BYTE4(a30) ^ 0x5D)
                                              - 21
                                              * ((((unsigned __int16)(135 * (BYTE4(a30) ^ 0x5D)) >> 8)
                                                                 + ((((BYTE4(a30) ^ 0x5D)
                                                                                     - ((unsigned __int16)(135 * (BYTE4(a30) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4)));
  *(_BYTE *)(v88 - 97) = v107;
  v108 = (BYTE4(a27) ^ 0x5D) + ((205 * (*(unsigned __int8 *)(v90 + v105 % 0x15) ^ 0x5Du)) >> 10);
  BYTE4(a27) = v108 - ((2 * v108) & 0xBB) + 93;
  v226 = v104 + 79;
  LODWORD(a18) = (v104 + 79) ^ 0xF2;
  v109 = a18 - 520809177 - ((2 * a18) & 0x4E);
  v110 = v105 % 0x14;
  v111 = ((((BYTE4(a19) ^ 0x18) & (BYTE1(a21) ^ 1) & ((v104 + 79) ^ 0x10) | (BYTE4(a19) ^ 1) & ~*(unsigned __int8 *)(v88 - 104)) & 0x19 | (*(unsigned __int8 *)(v88 - 116 + v110) >> 1) & 0x66) ^ 0xFFFFFFC0)
       + (v107 ^ 0x5D);
  *(_BYTE *)(v88 - 97) = v111 - ((2 * v111) & 0xBB) + 93;
  v112 = *((_BYTE *)&a18 + ((a69 ^ 0x5D) - 35 * ((235 * (a69 ^ 0x5Du)) >> 13)) + 7) ^ 0x27;
  v113 = v90;
  LOBYTE(v111) = *(_BYTE *)(v90
                          + ((a73 ^ 0x5D)
                                            - 21
                                            * ((((unsigned __int16)(135 * (a73 ^ 0x5D)) >> 8)
                                                               + ((((a73 ^ 0x5D)
                                                                                   - ((unsigned __int16)(135 * (a73 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4)));
  v114 = *(_BYTE *)(v90
                  + ((a39 ^ 0x5D)
                                    - 21
                                    * ((((unsigned __int16)(135 * (a39 ^ 0x5D)) >> 8)
                                                       + ((((a39 ^ 0x5D)
                                                                           - ((unsigned __int16)(135
                                                                                               * (a39 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4)));
  *(_BYTE *)(v88 - 101) ^= v112 * v112 * v112;
  LOBYTE(v101) = v83
               - (*(_BYTE *)(v88
                           - 116
                           + (unsigned __int16)(((a18 + 5415 - ((2 * a18) & 0x4E)) ^ 0x1527)
                                              - 20
                                              * ((((unsigned __int16)(a18 + 5415 - ((2 * a18) & 0x4E)) ^ 0x1527) & 0x7FFu)
                                               / 0x14))) ^ 0x5D);
  LOBYTE(v96) = (v101 | BYTE3(a36) ^ 0xA2) & (*(_BYTE *)(v88 - 114) ^ 0x5D) | v101 & (BYTE3(a36) ^ 0xA2);
  LOBYTE(v96) = (v96 - ((2 * v96) & 0xD6) + 107) ^ 0x6B;
  v222 = (((v106 & 0xFFFFFFB3 ^ 0x55) << (((v97 ^ 0xFD) + 2) & 7)) ^ ((v106 & 0xB3 ^ 0x55) >> (((v97 ^ 2) - 1) & 7))) & (v94 ^ 0x5D) | (v221 ^ 0x26) & (v94 ^ 0xFFFFFFA2);
  BYTE1(a25) = (3
              * ((((BYTE2(a32) ^ 0x5D) << (((v111 ^ 2) + 1) & 7)) ^ ((BYTE2(a32) ^ 0x5D) >> (v111 & 7 ^ v87)))
               - 3 * (v114 ^ 0x5D))) ^ v100;
  BYTE3(a19) ^= (171 * (a77 ^ 0x5Du)) >> 9;
  LOBYTE(a19) = (a19 ^ 0x27) + v96 * v96 * v96 - ((2 * ((a19 ^ 0x27) + v96 * v96 * v96)) & 0x4E) + 39;
  *(_BYTE *)(v88 - 97) ^= (43691
                         * (*(_BYTE *)(v90
                                     + ((BYTE6(a34) ^ 0x5D)
                                                       - 21
                                                       * ((((unsigned __int16)(135 * (BYTE6(a34) ^ 0x5D)) >> 8)
                                                                          + ((((BYTE6(a34) ^ 0x5D)
                                                                                              - ((unsigned __int16)(135 * (BYTE6(a34) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) & 0x1B ^ 0xF9)
                         * (*((unsigned __int8 *)&a18
                            + ((BYTE3(a28) ^ 0x5D) - 35 * ((235 * (BYTE3(a28) ^ 0x5Du)) >> 13))
                            + 7) ^ 0x27u)) >> 17;
  v115 = ((v83 << (((HIBYTE(a23) ^ 2) + 1) & 7)) ^ (v83 >> (HIBYTE(a23) & 7 ^ v87))) + (a43 ^ 0x5D);
  a43 = v115 - ((2 * v115) & 0xBB) + 93;
  LOBYTE(v115) = *((_BYTE *)&a18 + ((BYTE6(a24) ^ 0x5D) - 35 * ((235 * (BYTE6(a24) ^ 0x5Du)) >> 13))
                                 + 7);
  LOBYTE(v115) = ((v115 ^ BYTE6(a23) ^ 0x85 | a70 ^ 0x5D) & 0xC0 | (v115 ^ BYTE6(a23) ^ 0x85) & (a70 ^ 0x5D))
               + (BYTE3(a20) ^ 0x27);
  BYTE3(a20) = v115 - ((2 * v115) & 0x4E) + 39;
  BYTE6(a27) = (BYTE6(a27) ^ 0x5D) + (v85 | ~(2 * (BYTE6(a27) ^ 0x5D) - 6)) - 37;
  v116 = (BYTE5(a21) ^ 0x27 | a41 ^ 0x5D) & (*(unsigned __int8 *)(v88 - 101) ^ 0x5D) | (BYTE5(a21) ^ 0x27) & (a41 ^ 0x5D);
  v117 = *(unsigned __int8 *)(v88 - 116 + (BYTE5(a28) ^ 0x5Du) % 0x14) ^ 0x5D;
  v118 = *(unsigned __int8 *)(v88 - 115);
  v119 = (v116 | v117) & (v118 ^ 0x5D) | v116 & v117;
  LOBYTE(v117) = 2 * ~*((_BYTE *)&a18 + ((a73 ^ 0x5D) - 35 * ((235 * (a73 ^ 0x5Du)) >> 13)) + 7);
  v120 = (v119 << (-(v117 & (*(_BYTE *)(v88 - 116) ^ 2) | ~*(_BYTE *)(v88 - 116) & 4) & 6)) ^ (v119 >> (v117 & (*(_BYTE *)(v88 - 116) & 6 ^ 2) | ~*(_BYTE *)(v88 - 116) & 4));
  BYTE6(a38) = v120 - ((2 * v120) & 0xBB) + 93;
  v121 = ((*(unsigned __int8 *)(v90
                              + ((BYTE1(a33) ^ 0x5D)
                                                - 21
                                                * ((((unsigned __int16)(135 * (BYTE1(a33) ^ 0x5D)) >> 8)
                                                                   + ((((BYTE1(a33) ^ 0x5D)
                                                                                       - ((unsigned __int16)(135 * (BYTE1(a33) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D)
        + (a66 ^ 0x5Du)) >> 1;
  v218 = (v121 | ((39324 * (a50 ^ 0x5Du)) >> 16)) & (a19 ^ 0x27) | v121 & ((39324 * (a50 ^ 0x5Du)) >> 16);
  v122 = ((unsigned __int16)(a18 + 5415 - ((2 * a18) & 0x4E)) ^ 0x1527) & 0x7FF;
  v123 = (unsigned __int16)(((a18 + 5415 - ((2 * a18) & 0x4E)) ^ 0x1527) - 35 * ((unsigned __int16)v122 / 0x23u));
  v219 = v123;
  v124 = *(unsigned __int8 *)(v88 - 116 + v110);
  v125 = ((BYTE3(a27) ^ 0x5Du) >> ((BYTE5(a21) + 1) & 7)) ^ ((BYTE3(a27) ^ 0x5D) << (~BYTE5(a21) & 7));
  LOBYTE(v106) = (*(_BYTE *)(v88 - 110) & 0xA5 | *(_BYTE *)(v88 - 104) & 0x5A) ^ 0x5D;
  LOBYTE(v120) = (*((_BYTE *)&a18 + v123 + 7) & 0x97 ^ 0xF | v124 ^ 0x55)
               - ((v125 | v106) & 0xE3 | v125 & v106)
               + (HIBYTE(a20) ^ 0x27);
  v126 = *(unsigned __int8 *)(v90
                            + ((BYTE6(a31) ^ 0x5D)
                                              - 21
                                              * ((((unsigned __int16)(135 * (BYTE6(a31) ^ 0x5D)) >> 8)
                                                                 + ((((BYTE6(a31) ^ 0x5D)
                                                                                     - ((unsigned __int16)(135 * (BYTE6(a31) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4)));
  HIBYTE(a20) = v120 - ((2 * v120) & 0x4E) + 39;
  v127 = v124 | v118;
  v128 = v118 & 4;
  v129 = (-34 - v218);
  v130 = ~v127 & 0x4C | v128;
  *(_BYTE *)(v88 - 102) ^= *((_BYTE *)&a18 + (-34 - v218 - 35 * ((235 * v129) >> 13)) + 7) ^ 0x27;
  LOBYTE(v127) = *(_BYTE *)(v88 - 116 + (a76 ^ 0x5Du) % 0x14) ^ 0x5D;
  v131 = *(unsigned __int8 *)(v90
                            + (v127
                                              - 21
                                              * ((((unsigned __int16)(135 * v127) >> 8)
                                                                 + (((v127
                                                                                     - ((unsigned __int16)(135 * v127) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D;
  v132 = (v131 << ((2
                  * (*((_BYTE *)&a18
                     + ((BYTE2(a37) ^ 0x5D) - 35 * ((235 * (BYTE2(a37) ^ 0x5Du)) >> 13))
                     + 7) ^ 0x27)) & 6)) ^ (v131 >> ((-2
                                                    * (*((_BYTE *)&a18
                                                       + ((BYTE2(a37) ^ 0x5D)
                                                                         - 35 * ((235 * (BYTE2(a37) ^ 0x5Du)) >> 13))
                                                       + 7) ^ 0x27)) & 6));
  v133 = (205
        * ((*(_BYTE *)(v88 - 116 + (a81 ^ 0x5Du) % 0x14) & 0x83 | *(_BYTE *)(v88 - 116 + (a62 ^ 0x5Du) % 0x14) & 0x7C) ^ 0x5Du)) >> 10;
  LOBYTE(v132) = ((v133 | v132) & 0x25 | v133 & v132) + (BYTE5(a25) ^ 0x5D);
  BYTE5(a25) = v132 - ((2 * v132) & 0xBB) + 93;
  LOBYTE(v132) = (*(_BYTE *)(v90
                           + ((HIBYTE(a28) ^ 0x5D)
                                             - 21
                                             * ((((unsigned __int16)(135 * (HIBYTE(a28) ^ 0x5D)) >> 8)
                                                                + ((((HIBYTE(a28) ^ 0x5D)
                                                                                    - ((unsigned __int16)(135 * (HIBYTE(a28) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D)
               + 92;
  HIBYTE(a19) = v226 ^ 0xD5 ^ (0x8Cu >> ((v132 * v132) & 7)) ^ (140 << (-(char)(v132 * v132) & 7));
  HIBYTE(a29) = ((205
                * (*(unsigned __int8 *)(v88 - 110) ^ 0x5D | *(unsigned __int8 *)(v88 - 116 + (BYTE5(a33) ^ 0x5Du) % 0x14) ^ 0x5Du)) >> 10) ^ 0xA2;
  LOBYTE(v132) = (*(_BYTE *)(v88 - 103) ^ 0x5D) + (*(_BYTE *)(v88 - 116 + (BYTE3(a28) ^ 0x5Du) % 0x14) ^ 0x5D);
  *(_BYTE *)(v88 - 103) = v132 - ((2 * v132) & 0xBB) + 93;
  v134 = BYTE4(a23) ^ 0x5D;
  *(_BYTE *)(v88 - 106) = ((*((_BYTE *)&a18 + v123 + 7) ^ 0x27 | v134) & (-34 - v218) | (*((_BYTE *)&a18 + v123 + 7) ^ 0x27u) & v134)
                        / 0xF
                        - (((137
                           * ((*((unsigned __int8 *)&a18 + v123 + 7) ^ 0x27 | v134) & (222 - v218) | (*((unsigned __int8 *)&a18 + v123 + 7) ^ 0x27) & v134)) >> 10) & 0x3A)
                        + 93;
  a73 = *(_BYTE *)(v88 - 104);
  v135 = (*(unsigned __int8 *)(v90
                             + (v134
                                               - 21
                                               * ((((unsigned __int16)(135 * v134) >> 8)
                                                                  + (((v134
                                                                                      - ((unsigned __int16)(135 * v134) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D) & (BYTE2(a22) ^ 0x27) | (BYTE2(a22) ^ 0xD8) & (a73 ^ 0x5D);
  HIDWORD(a13) = v130 & ((2 * v126) ^ 8) ^ 0x4C;
  v136 = *((unsigned __int8 *)&a18 + (BYTE4(a13) - 35 * ((59 * HIDWORD(a13)) >> 11)) + 7) ^ 0x27;
  v137 = ((v135 | v136) & 0x2A | v135 & v136) * ((v135 | v136) & 0x2A | v135 & v136);
  HIDWORD(v220) = ((2 * v137) & 0xFFFFF9FF) + (v137 ^ 0xFAFEFCFF);
  v138 = 796552591 - HIDWORD(v220) - ((1979579062 - 2 * HIDWORD(v220)) & 0x68F6E068);
  LOWORD(v136) = *(unsigned __int8 *)(v90
                                    + (unsigned __int16)(((a18 + 5415 - ((2 * a18) & 0x4E)) ^ 0x1527)
                                                       - 21
                                                       * ((((34329 * v122) >> 16)
                                                         + ((unsigned __int16)((((a18 + 5415 - ((2 * a18) & 0x4E)) ^ 0x1527)
                                                                              - ((34329 * v122) >> 16)) & 0xFFFE) >> 1)) >> 4)));
  BYTE4(a20) ^= v136 ^ 0x5D;
  LOBYTE(v130) = (*((_BYTE *)&a18 + ((a68 ^ 0x5D) - 35 * ((235 * (a68 ^ 0x5Du)) >> 13)) + 7) ^ 0x27)
               - 38;
  LOBYTE(v129) = (v130 | (-34 - v218)) & (BYTE2(a21) ^ 0x27) | v129 & v130;
  BYTE4(a8) = v129 * v129 + 92;
  LODWORD(v123) = (2 * v138) & 0x17E ^ 0x68;
  LODWORD(v110) = v138 ^ 0x34;
  LOWORD(v125) = (v136 ^ 0xA2) & 0x79;
  LOBYTE(v138) = ((v138 ^ 0x34) + ((BYTE5(a21) ^ 0x27) & a18)) & (v136 ^ 0xA2 | 0x79);
  LOWORD(v130) = v138 | (unsigned __int16)v125;
  BYTE1(a29) ^= (((v138 | v125) ^ 0xA6) & ((a18 + 39 - ((2 * a18) & 0x4E)) ^ 0x27) | ((-17
                                                                                     - (a18
                                                                                      + 39
                                                                                      - ((2 * a18) & 0x4E))) | ~(_BYTE)v138) & 4)
              + (*((_BYTE *)&a18 + ((BYTE3(a34) ^ 0x5D) - 35 * ((235 * (BYTE3(a34) ^ 0x5Du)) >> 13))
                                 + 7) ^ 0x27);
  BYTE5(a38) ^= 0xDDu;
  v139 = (v136 ^ 0x5D) - ((2 * (v136 ^ 0x5D)) & 0x4A) - 26331;
  v140 = (BYTE1(a20) ^ 0x27) & (v109 & 0xA3 ^ 0x7F) | v109 & v83 ^ 4;
  v141 = (a53 ^ 0x5D) - ((2 * (a53 ^ 0x5D)) & 0x1E0) + 1403820272;
  v142 = (v140 | v141 ^ 0xF0) & (a21 ^ 0x27);
  v141 ^= 0x53AC98F0u;
  v143 = *((unsigned __int8 *)&a18 + v105 % 0x23 + 7) ^ 0x27;
  v144 = (v139 ^ 0x9925u) / 3 - v143 - (v142 | v140 & v141);
  LOWORD(v105) = v130 ^ (((v109 >> 1) & 0x65 ^ 1) - ((a18 + 5415 - ((2 * a18) & 0x4E)) & 0x48) - 15946);
  LODWORD(a18) = (v144 - ((2 * v144) & 0x6FC63CA4) - 1209852334) ^ 0x52;
  LOBYTE(v141) = ((v144 - ((2 * v144) & 0xA4) + 82) ^ 0x52 | ((a53 ^ 0x5D) - ((2 * (a53 ^ 0x5D)) & 0xE0) - 16) ^ 0xF0) & (BYTE2(a21) ^ 0x27) | ((v144 - ((2 * v144) & 0xA4) + 82) ^ 0x52) & v141;
  v145 = (((BYTE2(a21) ^ 0x27) & 0xE4 | (v139 & 0xFC ^ 0x24) & 0xE4) & v141 | v143 & 0x1B | v141 & 0xC4 | (BYTE2(a21) ^ 0x27) & 0xC4 | (v139 & 0xFC ^ 0x24) & 0xC4)
       + HIDWORD(a16);
  LOBYTE(a23) = BYTE4(a26) ^ a23 ^ 0x5D;
  BYTE4(a36) ^= (v110 - ((2 * v110) & 0xBB) + 93) ^ 0xD8;
  LODWORD(v220) = v145;
  BYTE5(a22) = *(_BYTE *)(v88 - 116 + (BYTE4(a38) ^ 0x5Du) % 0x14) ^ 0x7A ^ ((v226 & 0xE4 ^ 0xD)
                                                                           + ((((BYTE2(a21) ^ 0x27) & 0xE4 | (v139 & 0xFC ^ 0x24) & 0xE4) & v141 | v143 & 0x1B | v141 & 0xC4 | (BYTE2(a21) ^ 0x27) & 0xC4 | (v139 & 0xFC ^ 0x24) & 0xC4)
                                                                                             + BYTE4(a16))
                                                                           / 3u);
  LOBYTE(v143) = *((_BYTE *)&a18 + ((BYTE4(a34) ^ 0x5D) - 35 * ((235 * (BYTE4(a34) ^ 0x5Du)) >> 13))
                                 + 7) & 0x1B;
  LOBYTE(a26) = (v143 ^ 0x47) + ((2 * ((v143 ^ 0x47 | 0xFD) ^ v143)) ^ 0x8B) + 94;
  BYTE4(a16) = v222 - 15;
  v223 = (v222 - 15);
  LOBYTE(v143) = (*((_BYTE *)&a18 + ((unsigned __int16)v105 ^ 0xC1FDu) % 0x23 + 7) ^ 0x27) & (BYTE1(a23) ^ 0xD8) | (*(_BYTE *)(v90 + (BYTE4(a16) - 21 * ((((unsigned __int16)(135 * v223) >> 8) + (((BYTE4(a16) - ((unsigned __int16)(135 * v223) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D) & (BYTE1(a23) ^ 0x27);
  v146 = (v143 ^ 0x53F7F7FF) + 2 * v143 + 1;
  v147 = (BYTE1(a21) ^ 0x27) + ((v146 * v146 * v146) >> 1);
  BYTE1(a21) = v147 - ((2 * v147) & 0x4E) + 39;
  LOBYTE(v147) = (*(_BYTE *)(v90
                           + ((BYTE6(a34) ^ 0x5D)
                                             - 21
                                             * ((((unsigned __int16)(135 * (BYTE6(a34) ^ 0x5D)) >> 8)
                                                                + ((((BYTE6(a34) ^ 0x5D)
                                                                                    - ((unsigned __int16)(135 * (BYTE6(a34) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0xA2)
               + (BYTE4(a19) ^ 0x27)
               + 1;
  BYTE4(a19) = v147 - ((2 * v147) & 0x4E) + 39;
  LODWORD(v123) = ((-113 - BYTE4(v220) - ((-74 - 2 * BYTE4(v220)) & 0x68)) ^ 0x1FAD9F8B)
                - 531472319
                + v123;
  v215 = v123 % 0x23;
  BYTE1(a21) ^= ((BYTE3(a25) ^ 0x5D) & (v105 ^ 2) | (*(_BYTE *)(v88 - 116 + (BYTE5(a30) ^ 0x5Du) % 0x14) ^ 0x5D) & (v105 ^ 0xFD))
              * (((BYTE3(a28) ^ 0x5D) & (*(_BYTE *)(v88 - 109) ^ 0xA2) | (*((_BYTE *)&a18
                                                                          + ((a71 ^ 0x5D)
                                                                                            - 35
                                                                                            * ((235 * (a71 ^ 0x5Du)) >> 13))
                                                                          + 7) ^ 0x27) & (*(_BYTE *)(v88 - 109) ^ 0x5D)) & (BYTE4(v220) - 92) | (*((_BYTE *)&a18 + v215 + 7) ^ 0x27) & v110);
  LOBYTE(v129) = ((*(_BYTE *)(v88 - 116 + (HIBYTE(a34) ^ 0x5Du) % 0x14) ^ 0x5D) & (*(_BYTE *)(v88 - 102) ^ 0xA2) | (*(_BYTE *)(v88 - 102) ^ 0x7C) & 0x96) & (BYTE2(a20) ^ 0xD8) | (BYTE1(a24) ^ 0x5D) & (BYTE2(a20) ^ 0x27);
  v148 = BYTE5(a24) ^ 0x5D;
  LOBYTE(v147) = *((_BYTE *)&a18 + ((BYTE6(a26) ^ 0x5D) - 35 * ((235 * (BYTE6(a26) ^ 0x5Du)) >> 13))
                                 + 7);
  v149 = ((*((unsigned __int8 *)&a18 + v219 + 7) ^ 0x27) << (((v148 << ((v147 + 1) & 7)) ^ (v148 >> (~(_BYTE)v147 & 7))) & 7)) ^ ((*((unsigned __int8 *)&a18 + v219 + 7) ^ 0x27u) >> (-((v148 << ((v147 + 1) & 7)) ^ (v148 >> (~(_BYTE)v147 & 7))) & 7));
  LOBYTE(v129) = ((v149 | v129) & (a23 ^ 0x27) | v149 & v129) + (BYTE5(a21) ^ 0x27);
  BYTE5(a21) = v129 - ((2 * v129) & 0x4E) + 39;
  LOBYTE(v129) = *(_BYTE *)(v88 - 116 + (BYTE1(a28) ^ 0x5Du) % 0x14) ^ 0x84;
  LOBYTE(v129) = v129
               - 21
               * ((((unsigned __int16)(135 * v129) >> 8)
                                  + (((v129 - ((unsigned __int16)(135 * v129) >> 8)) & 0xFE) >> 1)) >> 4);
  LOBYTE(v149) = (BYTE5(a19) ^ 0x27) & (v110 | v109 ^ 0x27) | v110 & (v109 ^ 0x27);
  LOBYTE(v129) = (*(_BYTE *)(v88 - 101) ^ 0x5D)
               - ((v149 | *(_BYTE *)(v90 + v129) ^ 0x5D) & BYTE4(a8) | v149 & (*(_BYTE *)(v90 + v129) ^ 0x5D));
  *(_BYTE *)(v88 - 101) = v129 - ((2 * v129) & 0xBB) + 93;
  LODWORD(v217) = v145 - ((2 * v145) & 0x1E4) + 1197797874;
  LOBYTE(v149) = (v145 - ((2 * v145) & 0xE4) - 14) & 0x2D ^ 0x72;
  LOBYTE(v142) = *(_BYTE *)(v88
                          - 116
                          + ((unsigned __int16)(v145 - ((2 * v145) & 0x1E4) - 3598) ^ 0xF1F2u) % 0x14) ^ 0x5D;
  LOBYTE(v148) = *((_BYTE *)&a18 + ((BYTE3(a30) ^ 0x5D) - 35 * ((235 * (BYTE3(a30) ^ 0x5Du)) >> 13))
                                 + 7) ^ 0x27;
  LOBYTE(v148) = (v148 | v142) & (*(_BYTE *)(v88 - 115) ^ 0x5D) | v148 & v142;
  LOBYTE(v149) = (((43691 * v122) >> 17) - (a26 ^ 0x5D | v145)) ^ BYTE4(a8) ^ ((v148 | v149) & (BYTE6(a22) ^ 0x27) | v148 & v149);
  v150 = *(unsigned __int8 *)(v88 - 116 + (a53 ^ 0x5Du) % 0x14) ^ 0x5D | *(unsigned __int8 *)(v90
                                                                                            + ((a77 ^ 0x5D) - 21 * ((((unsigned __int16)(135 * (a77 ^ 0x5D)) >> 8) + ((((a77 ^ 0x5D) - ((unsigned __int16)(135 * (a77 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D;
  LOBYTE(v145) = *(_BYTE *)(v88 - 116 + (BYTE4(a29) ^ 0x5Du) % 0x14) & 7 ^ v87;
  v151 = (v150 >> (-(char)v145 & 7)) ^ (v150 << v145);
  v152 = (13108
        * (((*(_BYTE *)(v90
                      + ((BYTE1(a28) ^ 0x5D)
                                        - 21
                                        * ((((unsigned __int16)(135 * (BYTE1(a28) ^ 0x5D)) >> 8)
                                                           + ((((BYTE1(a28) ^ 0x5D)
                                                                               - ((unsigned __int16)(135 * (BYTE1(a28) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) & 0xEE | BYTE3(a27) & 0x11) ^ 0x5D)
         + ((*((_BYTE *)&a18 + ((a41 ^ 0x5D) - 35 * ((235 * (a41 ^ 0x5Du)) >> 13)) + 7) ^ 0x27) & (HIBYTE(a20) ^ 0xD8) | (*(_BYTE *)(v88 - 116 + v149 % 0x14u) ^ 0x5D) & (HIBYTE(a20) ^ 0x27u)))) >> 16;
  v153 = *(unsigned __int8 *)(v88 - 116 + (BYTE6(a23) ^ 0x5Du) % 0x14) ^ 0x5D;
  LODWORD(v213) = ((v153 | v152) & (*(unsigned __int8 *)(v88 - 100) ^ 0x5D) | v153 & v152) + v151 + HIDWORD(a13);
  v154 = *(unsigned __int8 *)(v88 - 116 + (BYTE5(a35) ^ 0x5Du) % 0x14) ^ 0x5D;
  v214 = ((unsigned __int16)v217 ^ 0xF1F2u) % 0x23;
  v155 = (v154 * v154 * v154 * v154) | *((unsigned __int8 *)&a18 + v214 + 7) ^ 0x27;
  LOBYTE(v154) = *((_BYTE *)&a18 + (BYTE4(a16) - 35 * ((235 * v223) >> 13)) + 7) ^ 0x27;
  v156 = *(unsigned __int8 *)(v88 - 116 + (a82 ^ 0x5Du) % 0x14);
  LODWORD(v225) = v155;
  HIDWORD(v213) = v155;
  v157 = *((unsigned __int8 *)&a18
         + (v155 - 35 * ((235 * v155) >> 13))
         + 7);
  v158 = *(unsigned __int8 *)(v88 - 106);
  v159 = (((((*(unsigned __int8 *)(v113
                                 + ((BYTE1(a39) ^ 0x5D)
                                                   - 21
                                                   * ((((unsigned __int16)(135 * (BYTE1(a39) ^ 0x5D)) >> 8)
                                                                      + ((((BYTE1(a39) ^ 0x5D)
                                                                                          - ((unsigned __int16)(135 * (BYTE1(a39) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D) << (~(_BYTE)v157 & 7)) ^ ((*(_BYTE *)(v113 + ((BYTE1(a39) ^ 0x5D) - 21 * ((((unsigned __int16)(135 * (BYTE1(a39) ^ 0x5D)) >> 8) + ((((BYTE1(a39) ^ 0x5D) - ((unsigned __int16)(135 * (BYTE1(a39) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D) >> ((v157 + 1) & 7))) & (v158 ^ 2) | ((v157 ^ 0x27 | v156 ^ 0x5D) & (*(unsigned __int8 *)(v88 - 109) ^ 0xFFFFFFFD) | (v157 ^ 7) & (v156 ^ 0xFFFFFFFD)) & (v158 ^ 0xFFFFFFFD)) & 0x47 | (2 * *(unsigned __int8 *)(v113 + (v154 - 21 * ((((unsigned __int16)(135 * v154) >> 8) + (((v154 - ((unsigned __int16)(135 * v154) >> 8)) & 0xFE) >> 1)) >> 4)))) & 0xFFB8) ^ 0xFFFFFFB8;
  v160 = v159 - ((2 * v159) & 0x64) + 50;
  v216 = (unsigned __int16)((v217 ^ 0xF1F2)
                          - 21
                          * ((unsigned __int16)(((34329 * ((unsigned __int16)v217 ^ 0xF1F2u)) >> 16)
                                              + ((unsigned __int16)(((v217 ^ 0xF1F2)
                                                                   - ((34329 * ((unsigned __int16)v217 ^ 0xF1F2u)) >> 16)) & 0xFFFE) >> 1)) >> 4));
  v161 = v123 % 0x14;
  LOBYTE(v159) = (((*(_BYTE *)(v90
                             + ((a73 ^ 0x5D)
                                               - 21
                                               * ((((unsigned __int16)(135 * (a73 ^ 0x5D)) >> 8)
                                                                  + ((((a73 ^ 0x5D)
                                                                                      - ((unsigned __int16)(135 * (a73 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) & 0x60 | (2 * *(_BYTE *)(v88 - 116 + v161)) & 0x9F) ^ 0xDA) & (((*(_BYTE *)(v88 - 116 + (BYTE3(a26) ^ 0x5Du) % 0x14) & 0x91 | *(_BYTE *)(v90 + v216) & 0x6E) ^ 0x5D) & (*(_BYTE *)(v88 - 116) ^ 0xA2) | (BYTE3(a26) ^ 0x5D) & (*(_BYTE *)(v88 - 116) ^ 0x5D)))
               + (BYTE1(a19) ^ 0x27);
  LOBYTE(v158) = *((_BYTE *)&a18
                 + ((a25 ^ 0x5D) - 35 * ((235 * (a25 ^ 0x5Du)) >> 13))
                 + 7);
  BYTE1(a19) = v159 + (~(2 * v159) | 0xB1) + 40;
  LOBYTE(v159) = (BYTE5(a20) ^ 0x27)
               - (((*((_BYTE *)&a18
                    + ((BYTE6(a35) ^ 0x5D) - 35 * ((235 * (BYTE6(a35) ^ 0x5Du)) >> 13))
                    + 7) ^ v160) & 0xDD ^ 0x15) & (*((_BYTE *)&a18 + v215 + 7) ^ v87) | BYTE3(a35) & 0x22);
  BYTE5(a20) = v159 - ((2 * v159) & 0x4E) + 39;
  LOBYTE(v153) = *(_BYTE *)(v88 - 116 + (a48 ^ 0x5Du) % 0x14);
  *(_BYTE *)(v88 - 99) = (v85 | ~(2 * (*(_BYTE *)(v88 - 99) ^ 0x5D) + 68)) + (*(_BYTE *)(v88 - 99) ^ 0x5D);
  v162 = (v160 ^ 0x32) - ((2 * (v160 ^ 0x32)) & 0x32) - 103;
  LOBYTE(v159) = *(_BYTE *)(v90
                          + ((BYTE3(a25) ^ 0x5D)
                                            - 21
                                            * ((((unsigned __int16)(135 * (BYTE3(a25) ^ 0x5D)) >> 8)
                                                               + ((((BYTE3(a25) ^ 0x5D)
                                                                                   - ((unsigned __int16)(135 * (BYTE3(a25) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D;
  LOBYTE(v159) = (v159 | *(_BYTE *)(v88 - 116 + v161) ^ 0x5D) & (v162 ^ 0x99) | v159 & (*(_BYTE *)(v88 - 116 + v161) ^ 0x5D);
  BYTE1(a26) ^= 2
              * ((v159 | ((171 * (BYTE4(a29) ^ 0x5Du)) >> 9)) & (BYTE1(a20) ^ 0x27) | v159 & ((171 * (BYTE4(a29) ^ 0x5Du)) >> 9));
  HIDWORD(a8) = a18;
  v224 = a18 % 0x14u;
  v163 = (~(BYTE4(a24) & *(_BYTE *)(v88 - 116 + v224)) & 0x50 | (BYTE4(a24) & 0xD0 ^ 0x50) & (*(unsigned __int8 *)(v88 - 116 + v224) ^ 0x50) | (2 * *(unsigned __int8 *)(v88 - 116 + (BYTE1(a28) ^ 0x5Du) % 0x14)) & 0x2Eu) >> 1;
  *(_BYTE *)(v88 - 103) = (v163 ^ 0x15) - 2 * ((v163 ^ 0x15) & 0xDF ^ v163 & 2) + 93;
  LOBYTE(a23) = (BYTE3(a37) | 0xF6) + (a23 ^ 0x27) + 1 + (~(2 * ((BYTE3(a37) | 0xF6) + (a23 ^ 0x27) + 1)) | 0xB1) + 40;
  HIDWORD(a13) = v110;
  v164 = (BYTE3(a22) ^ 0x27)
       - (((a37 >> 1) & 0x6E ^ 0x2F) & (*(unsigned __int8 *)(v88 - 108) ^ 0xFFFFFFA2) | (*(unsigned __int8 *)(v88 - 108) ^ 0x5D) & v110);
  BYTE3(a22) = v164 - ((2 * v164) & 0x4E) + 39;
  v165 = (v213 ^ 0xDFFBDF7E) + ((2 * v213) & 0xFC) + 537141378;
  v166 = *(unsigned __int8 *)(v90 + v165 % 0x15) ^ 0x5D;
  v167 = (v166 | a18) & (BYTE6(a21) ^ 0x27) | v166 & a18;
  v168 = (v167 - ((2 * v167) & 0xE0) + 1762447216) ^ 0x70;
  v169 = v123 % 0x15;
  v170 = (*(unsigned __int8 *)(v90 + v169) ^ 0x5D) + 208;
  v171 = (v168 * v168 * v168) & ((v170 | a72 ^ 0xFFFFFFA2) & 0xBD | v170 & (a72 ^ 0xFFFFFFA2));
  BYTE5(a21) = (BYTE5(a21) ^ 0x27) + (a71 ^ 0x5D) - ((2 * ((BYTE5(a21) ^ 0x27) + (a71 ^ 0x5D))) & 0x4E) + 39;
  LOBYTE(v105) = (a67 ^ 0x5D)
               - 21
               * ((((unsigned __int16)(135 * (a67 ^ 0x5D)) >> 8)
                                  + ((((a67 ^ 0x5D) - ((unsigned __int16)(135 * (a67 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4);
  v172 = v171 - ((2 * v171) & 0xFFFFFFBA) + 93;
  *(_BYTE *)(v88 - 101) = v172;
  LOBYTE(v171) = BYTE4(a16)
               + 99
               * (*(_BYTE *)(v88 - 116 + (HIBYTE(a24) ^ 0x5Du) % 0x14) ^ 0x5D)
               * ((*(_BYTE *)(v113 + v105) ^ 0x7F | *((_BYTE *)&a18 + v165 % 0x23 + 7) ^ 1) & 0xD1 | (*(_BYTE *)(v113 + v105) ^ 0x5D) & (*((_BYTE *)&a18 + v165 % 0x23 + 7) ^ 0x27))
               * (*(_BYTE *)(v113
                           + ((BYTE4(a26) ^ 0x5D)
                                             - 21
                                             * ((((unsigned __int16)(135 * (BYTE4(a26) ^ 0x5D)) >> 8)
                                                                + ((((BYTE4(a26) ^ 0x5D)
                                                                                    - ((unsigned __int16)(135 * (BYTE4(a26) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) & 0xFE ^ v83);
  LOBYTE(v157) = 43
               - ((((v158 ^ 0x27) * (v158 ^ 0x27)) & (*(_BYTE *)(v88 - 114) ^ 0x5D))
                + v218)
               - ((v153 ^ 0x6F ^ v160) & (*(_BYTE *)(v88 - 114) ^ 0xA2));
  v173 = *((_BYTE *)&a18 + v214 + 7) & 0xF5 | *((_BYTE *)&a18 + v215 + 7) & 0xA;
  v174 = (v171 ^ 0x5FEB55FF) + 2 * v171;
  v175 = *(_BYTE *)(v88 - 116 + (v225 - 20 * ((205 * HIDWORD(v213)) >> 12))) & 0xAE ^ 0x5D;
  v176 = (v175 - ((2 * v175) & 0x18) + 124) ^ 0xFFFFFF9C;
  v177 = (BYTE1(a21) ^ 0x27)
       - ((v176 * v176 * v176) & (v172 ^ 0xFFFFFFA2) | (v172 ^ 0x5D) & (v171 / 0xFu));
  LODWORD(v215) = *(unsigned __int8 *)(v90
                                     + ((BYTE3(a23) ^ 0x5D)
                                                       - 21
                                                       * ((((unsigned __int16)(135 * (BYTE3(a23) ^ 0x5D)) >> 8)
                                                                          + ((((BYTE3(a23) ^ 0x5D)
                                                                                              - ((unsigned __int16)(135 * (BYTE3(a23) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4)));
  BYTE1(a21) = v177 - ((2 * v177) & 0x4E) + 39;
  LOBYTE(v165) = *(_BYTE *)(v88 - 116 + v165 % 0x14) ^ 0x5D;
  LOBYTE(v158) = v165
               - 21
               * ((((unsigned __int16)(135 * v165) >> 8)
                                  + (((v165 - ((unsigned __int16)(135 * v165) >> 8)) & 0xFE) >> 1)) >> 4);
  v178 = v213 + (*(unsigned __int8 *)(v88 - 116 + (a60 ^ 0x5Du) % 0x14) ^ 0xFFFFFFA2);
  LOBYTE(v177) = *(_BYTE *)(v90
                          + ((HIBYTE(a31) ^ 0x5D)
                                            - 21
                                            * ((((unsigned __int16)(135 * (HIBYTE(a31) ^ 0x5D)) >> 8)
                                                               + ((((HIBYTE(a31) ^ 0x5D)
                                                                                   - ((unsigned __int16)(135 * (HIBYTE(a31) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D;
  LOBYTE(v177) = (v177 | a65 ^ 0x5D) & v157 | v177 & (a65 ^ 0x5D);
  LOBYTE(v177) = (*(_BYTE *)(v88 - 100) ^ 0x5D)
               - ((v177 & 0xFA | 1 | v162 ^ 0x99) & (*(_BYTE *)(v88 - 114) ^ 0x5D) | (v177 & 0xFA | 1) & (v162 ^ 0x99));
  v179 = *(unsigned __int8 *)(v90 + v158);
  *(_BYTE *)(v88 - 100) = v177 - ((2 * v177) & 0xBB) + 93;
  v180 = *(unsigned __int8 *)(v90
                            + ((a57 ^ 0x5D)
                                              - 21
                                              * ((((unsigned __int16)(135 * (a57 ^ 0x5D)) >> 8)
                                                                 + ((((a57 ^ 0x5D)
                                                                                     - ((unsigned __int16)(135 * (a57 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D;
  v181 = (v180 | BYTE3(a36) ^ 0x5D) & 0x8D | v180 & (BYTE3(a36) ^ 0x5D);
  LOBYTE(v157) = *(_BYTE *)(v88 - 116 + (HIBYTE(a26) ^ 0x5Du) % 0x14) ^ 0x5D;
  LOBYTE(v158) = *(_BYTE *)(v90
                          + ((a64 ^ 0x5D)
                                            - 21
                                            * ((((unsigned __int16)(135 * (a64 ^ 0x5D)) >> 8)
                                                               + ((((a64 ^ 0x5D)
                                                                                   - ((unsigned __int16)(135 * (a64 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D;
  LOBYTE(v157) = (v158 | v157) & 6 | v157 & v158 & 7;
  v182 = (v181 >> (-(char)v157 & 7)) ^ (v181 << v157);
  v183 = v178 + ((171 * (v179 ^ 0x5Du)) >> 9);
  LOBYTE(v182) = (*(_BYTE *)(v90
                           + (unsigned __int16)(v182
                                              - 21
                                              * ((unsigned __int16)(((34329 * v182) >> 16)
                                                                  + ((unsigned __int16)((v182
                                                                                       - ((34329 * v182) >> 16)) & 0xFFFE) >> 1)) >> 4))) ^ 0xA2)
               + (*(_BYTE *)(v88 - 113) ^ 0x5D)
               + 1;
  *(_BYTE *)(v88 - 113) = v182 - ((2 * v182) & 0xBB) + 93;
  HIDWORD(a16) = v173 ^ 0x27;
  v184 = (v173 ^ 0xFBBFF7CA) + 71305235 + ((2 * (v173 ^ 0x27)) & 0x1DA);
  v185 = 205 * (*(unsigned __int8 *)(v88 - 116 + (HIBYTE(a30) ^ 0x5Du) % 0x14) ^ 0x5D);
  v186 = ((*(unsigned __int8 *)(v88 - 104) ^ 0x5Du) >> ((v185 >> 10) & 7)) ^ ((*(unsigned __int8 *)(v88 - 104) ^ 0x5D) << (-(char)(v185 >> 10) & 7)) ^ ((*((unsigned __int8 *)&a18 + v184 % 0x23 + 7) ^ 0xFFFFFFD8) / 5);
  HIBYTE(a23) = v186 + (v85 | ~(2 * v186)) + 94;
  a75 = (a75 ^ 0x5D) + (BYTE5(a23) ^ 0x5D) + (v85 | ~(2 * ((a75 ^ 0x5D) + (BYTE5(a23) ^ 0x5D)))) + 94;
  v187 = *((_BYTE *)&a18 + v214 + 7) & 0x5D ^ 0xA7;
  v188 = (a62 ^ 0x5D) + ((52429 * v187 * v187) >> 18);
  a62 = v188 + (v85 | ~(2 * v188)) + 94;
  v189 = (0x8Bu >> ((v174 + 1) & 7)) ^ (139 << ((7 - v174) & 7));
  v190 = *(unsigned __int8 *)(v88 - 116 + v161) ^ 0x5D;
  LOBYTE(v157) = v190 | v189;
  v191 = v190 & v189;
  v192 = (*(unsigned __int8 *)(v113 + v216) ^ 0xB767EFEA)
       + ((2 * (*(unsigned __int8 *)(v113 + v216) ^ 0x55555555)) & 0x16E)
       + 73;
  HIDWORD(v217) = v157 & 0xC | v191 | (*(unsigned __int8 *)(v88 - 116 + v224) ^ 0x5D) & (*(unsigned __int8 *)(v88 - 115) ^ 0xFFFFFFA2) | (v192 * v192 * v192) & (*(unsigned __int8 *)(v88 - 115) ^ 0x5D);
  BYTE3(a20) = (BYTE4(v217) & (BYTE1(a36) & 0xE3 ^ 0x51 | 0x2C) | (BYTE1(a36) & 0xE3 ^ 0x51) & 0x30u) / 3
             + (BYTE3(a20) ^ 0x27)
             - ((2
               * ((BYTE4(v217) & (BYTE1(a36) & 0xE3 ^ 0x51 | 0x2C) | (BYTE1(a36) & 0xE3 ^ 0x51) & 0x30u) / 3
                + (BYTE3(a20) ^ 0x27))) & 0x4E)
             + 39;
  v193 = (a46 ^ 0x5D)
       - ((((BYTE5(a27) ^ 0x4D) & (HIBYTE(a19) ^ 0x25) | (HIBYTE(a19) ^ 0x48) & a18) & (v217 ^ 0x60) | (v184 / 3) & (v217 ^ 0x1F)) & ((a65 >> 1) & 0x20 ^ 0x7F) | 0x12);
  a46 = v193 - ((2 * v193) & 0xBB) + 93;
  BYTE4(a22) = -123;
  LOBYTE(v183) = v183 + 1;
  v194 = (v183
                         - 21
                         * ((((unsigned __int16)(135 * v183) >> 8)
                                            + (((v183
                                                                - ((unsigned __int16)(135 * v183) >> 8)) & 0xFE) >> 1)) >> 4));
  LOBYTE(v192) = *((_BYTE *)&a18 + ((a51 ^ 0x5D) - 35 * ((235 * (a51 ^ 0x5Du)) >> 13)) + 7) ^ ((BYTE5(a28) ^ 0x5D) * (BYTE5(a28) ^ 0x5D)) ^ 0x27;
  v195 = ((*(_BYTE *)(v90 + v194) & 0xA0 | *(_BYTE *)(v88 - 116 + (HIBYTE(a38) ^ 0x5Du) % 0x14) & 0x5Eu) >> 1) ^ 0x2E;
  LOBYTE(v195) = ((v192 | v195) & (*(_BYTE *)(v88 - 99) ^ 0x5D) | v192 & v195) + (*(_BYTE *)(v88 - 101) ^ 0x5D);
  *(_BYTE *)(v88 - 101) = v195 - ((2 * v195) & 0xBB) + 93;
  BYTE1(a35) = *(_BYTE *)(v90 + v169);
  LOBYTE(v192) = *((_BYTE *)&a18 + ((BYTE3(a25) ^ 0x5D) - 35 * ((235 * (BYTE3(a25) ^ 0x5Du)) >> 13))
                                 + 7);
  LOBYTE(v192) = (v192 ^ 0xD8) + 2 * (v192 ^ 0x27) + 1;
  v196 = *((unsigned __int8 *)&a18 + (v174 - 1609258495) % 0x23u + 7);
  v197 = ((v196 ^ 0x27u) >> ((v192 * v192 * v192) & 7)) ^ ((v196 ^ 0x27) << (-(char)(v192 * v192 * v192) & 7));
  LOBYTE(v197) = (*(_BYTE *)(v88 - 109) ^ 0x5D) - v197 * v197;
  LOBYTE(v192) = (a77 ^ 0x5D)
               - 21
               * ((((unsigned __int16)(135 * (a77 ^ 0x5D)) >> 8)
                                  + ((((a77 ^ 0x5D) - ((unsigned __int16)(135 * (a77 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4);
  LOBYTE(v157) = v197 - ((2 * v197) & 0xBA) + 93;
  v198 = *(unsigned __int8 *)(v88 - 116 + v224);
  *(_BYTE *)(v88 - 109) = v157;
  LOBYTE(v172) = (a72 ^ 0xA2)
               + (HIBYTE(a19) ^ 0x27)
               + (*(_BYTE *)(v113 + v192) ^ 0x5D)
               * (*(_BYTE *)(v113 + v192) ^ 0x5D)
               * (*(_BYTE *)(v113 + v192) ^ 0x5D);
  LODWORD(a14) = *(_DWORD *)(v86 + 28) ^ a14;
  HIDWORD(v225) = (3 * (v215 ^ 0x5D) + (~(6 * (v215 ^ 0x5D)) | 0x1B) - 13) ^ v226;
  v199 = v220 + (v198 ^ 0xFFFFFFA2);
  HIBYTE(a19) = v172 + 1 - ((2 * (v172 + 1)) & 0x4E) + 39;
  *(_BYTE *)(v88 - 100) = (((2
                           * *((_BYTE *)&a18
                             + ((a36 ^ 0x5D) - 35 * ((235 * (a36 ^ 0x5Du)) >> 13))
                             + 7)) & 0x84 ^ 0x15)
                         - 121) ^ 0xC5;
  v200 = *(unsigned __int8 *)(v90
                            + (a18
                                              - 21
                                              * ((((unsigned __int16)(135 * WORD2(a8)) >> 8)
                                                                 + (((a18
                                                                                     - ((unsigned __int16)(135 * WORD2(a8)) >> 8)) & 0xFE) >> 1)) >> 4)));
  LOBYTE(v157) = (*(_BYTE *)(v88 - 116 + (a74 ^ 0x5Du) % 0x14) ^ 0xA2)
               + (v157 ^ 0x5D)
               + (((2
                  * *(_BYTE *)(v113
                             + ((BYTE2(a33) ^ 0x5D)
                                               - 21
                                               * ((((unsigned __int16)(135 * (BYTE2(a33) ^ 0x5D)) >> 8)
                                                                  + ((((BYTE2(a33) ^ 0x5D)
                                                                                      - ((unsigned __int16)(135 * (BYTE2(a33) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4)))) ^ 0xBA) & (BYTE2(a21) ^ 0xD8) | (*(_BYTE *)(v113 + ((*(_BYTE *)(v113 + v194) ^ 0x5D) - 21 * ((((unsigned __int16)(135 * (*(_BYTE *)(v113 + v194) ^ 0x5D)) >> 8) + ((((*(_BYTE *)(v113 + v194) ^ 0x5D) - ((unsigned __int16)(135 * (*(_BYTE *)(v113 + v194) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D) & (BYTE2(a21) ^ 0x27))
               + 1;
  *(_BYTE *)(v88 - 109) = v157 - ((2 * v157) & 0xBB) + 93;
  v201 = v225 ^ (v200 >> 1);
  *(_BYTE *)(v88 - 110) = *(_BYTE *)(v88 - 116 + (BYTE1(a38) ^ 0x5Du) % 0x14);
  v202 = *((unsigned __int8 *)&a18
         + (v183 - 35 * ((235 * v183) >> 13))
         + 7);
  v203 = v201 ^ 0x2Eu;
  v204 = 205
       * ((v202 & 0x56 ^ 6) & (BYTE2(a27) ^ 0x54) | (-25
                                                   * (*(unsigned __int8 *)(v90
                                                                         + ((BYTE3(a30) ^ 0x5D)
                                                                                           - 21
                                                                                           * ((((unsigned __int16)(135 * (BYTE3(a30) ^ 0x5D)) >> 8) + ((((BYTE3(a30) ^ 0x5D) - ((unsigned __int16)(135 * (BYTE3(a30) ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) ^ 0x5D)) & 0xA9 | (BYTE2(a27) ^ 0xFFFFFFFD | v202 ^ 6) & 0x16);
  v205 = (*(_BYTE *)(v90
                   + ((a73 ^ 0x5D)
                                     - 21
                                     * ((((unsigned __int16)(135 * (a73 ^ 0x5D)) >> 8)
                                                        + ((((a73 ^ 0x5D)
                                                                            - ((unsigned __int16)(135 * (a73 ^ 0x5D)) >> 8)) & 0xFE) >> 1)) >> 4))) & 0x2E | a38 & 0xD1) ^ 0x5D;
  v206 = (v199 + 1) % 0x14u;
  v207 = (*(_BYTE *)(v88 - 116 + v206) ^ 0x5D) * (*(_BYTE *)(v88 - 116 + v206) ^ 0x5D);
  v208 = (*(_BYTE *)(v88 - 116 + v184 % 0x14) ^ ((*((_BYTE *)&a18
                                                  + ((BYTE1(a32) ^ 0x5D)
                                                                    - 35 * ((235 * (BYTE1(a32) ^ 0x5Du)) >> 13))
                                                  + 7) ^ 0x27)
                                               + (*((_BYTE *)&a18
                                                  + ((BYTE1(a25) ^ 0x5D)
                                                                    - 35 * ((235 * (BYTE1(a25) ^ 0x5Du)) >> 13))
                                                  + 7) ^ 0x27)) ^ 0x5D) & ((v207 | v205) & 0x1B | v207 & v205);
  *(_BYTE *)(v88 - 104) = v208 - ((2 * v208) & 0xBB) + 93;
  v209 = *(_BYTE *)(v90
                  + (v203
                                    - 21
                                    * ((((unsigned __int16)(135 * v203) >> 8)
                                                       + (((v203
                                                                           - ((unsigned __int16)(135
                                                                                               * v203) >> 8)) & 0xFE) >> 1)) >> 4)));
  v210 = ((2 * (v209 ^ 0x41)) & 0xC7) + (v209 ^ 0xBE);
  v211 = *(unsigned __int8 *)(v88 - 107) ^ 0xFFFFFFA2;
  LOBYTE(a22) = (2 * (*(_BYTE *)(v88 - 116 + v206) ^ 0xDD) * (HIBYTE(a23) ^ 0xDD)
               - (((BYTE4(v225) << ((v210 + 5) & 7)) ^ (BYTE4(v225) >> ((3 - v210) & 7))) & (-55 - BYTE4(v220)))) ^ a22;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8 * ((763 * (a14 != 0x893B2A6A)) ^ v82)))(v204 >> 10, (v199 + 1), (v82 + 233), v203, v211, a14, v86, (49 * (v204 >> 10)) >> 10, a2, a3, v213, v214, v215, v216, a8, v217, v160 ^ 0x32u, v220, v86,
           a13,
           a14,
           v224,
           a16,
           v225,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_218ED9F34@<X0>(uint64_t a1@<X8>, uint64_t a2, int a3, int a4)
{
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((71 * (v4 >= ((((a4 - 1127) | 0x127) + 681) ^ 0x420u))) ^ a4))
                            - 8))();
}

uint64_t sub_218ED9F74@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  unsigned int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((29 * (v2 >= ((a1 - 22) ^ 0x432u))) ^ a1)) - 4))();
}

uint64_t sub_218ED9FAC@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  _OWORD *v3;
  __int128 v4;

  *(_QWORD *)&v4 = 0xE1E1E1E1E1E1E1E1;
  *((_QWORD *)&v4 + 1) = 0xE1E1E1E1E1E1E1E1;
  *v3 = v4;
  v3[1] = v4;
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((38 * ((((a1 ^ 0x56Du) - 94) ^ 0x101) == (v2 & 0xFFFFFFE0))) ^ ((a1 ^ 0x56D) + 713))))();
}

uint64_t sub_218ED9FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(a1 + 8 * ((((v3 + 775) ^ 0x1B0) * (v1 != v2)) ^ v3)))();
}

uint64_t sub_218EDA028@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  char v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((a1 - 756) * ((v2 & 0x18) == 0)) ^ a1))
                            - ((a1 - 1017) | 0x150u)
                            + 379))();
}

uint64_t sub_218EDA05C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  *(_QWORD *)(v3 + v1) = 0xE1E1E1E1E1E1E1E1;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a1
                                                      + 8
                                                      * (((v1 - (v2 & 0xFFFFFFF8) == -8) * ((v4 - 782) ^ 0x1EE)) ^ v4))
                                          - 8))(v3 + v1 + 8);
}

uint64_t sub_218EDA09C@<X0>(double *a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, uint64_t a4@<X8>, double a5@<D0>)
{
  int v5;

  *a1 = a5;
  return ((uint64_t (*)(double *))(*(_QWORD *)(a4 + 8 * (((a3 == 0) * a2) ^ v5)) - 8))(a1 + 1);
}

uint64_t sub_218EDA0C0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD))(a2 + 8 * ((((v2 + 281) ^ (v2 + 257)) * (a1 == v3)) ^ v2)))((v2 + 118));
}

uint64_t sub_218EDA0EC@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 + v2) = -31;
  return (*(uint64_t (**)(void))(a2 + 8 * ((683 * (((a1 ^ 0x375 ^ (v2 + 1 == v3)) & 1) == 0)) ^ (a1 - 94))))();
}

uint64_t sub_218EDA12C@<X0>(char a1@<W1>, int a2@<W2>, char a3@<W3>, int a4@<W5>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, char a14, __int16 a15, char a16, uint64_t a17, uint64_t a18, int a19, char a20,uint64_t a21,uint64_t a22,int a23,char a24,uint64_t a25,char a26)
{
  char v26;
  unsigned int v27;
  _BYTE *v28;
  char v29;
  int v30;
  char v31;
  _BYTE *v32;
  int v33;
  _BYTE *v34;

  v33 = (a2 - 260) | 0x80;
  *v28 += a16;
  if (a4 == v30 + 1)
    v34 = v28;
  else
    v34 = v28 + 1;
  *v34 += v26;
  v28[2 % v27] += a14;
  v28[(v33 - 387) % v27] += 92;
  v28[4 % v27] += a20;
  v28[5 % v27] += v31;
  v28[6 % v27] += v29;
  v28[7 % v27] += a3;
  v28[8 % v27] += a26;
  v28[9 % v27] += a24;
  v28[0xA % v27] += a1;
  v28[0 % v27] = (v28[0 % v27] + ((v33 - 96) ^ 0xD9 ^ (2 * v28[0 % v27]) & 0xBB) + 94) ^ *v32;
  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * (v33 ^ 0x38C)) - 12))();
}

uint64_t sub_218EDA300@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  unsigned int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  *(_BYTE *)(v23 + ((int)a1 - 569676317) % v22) = (*(_BYTE *)(v23 + ((int)a1 - 569676317) % v22)
                                                 + (~(2 * *(_BYTE *)(v23 + ((int)a1 - 569676317) % v22)) | 0xB1)
                                                 + 40) ^ *(&a22 + a1 - 569676317);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2
                                                      + 8
                                                      * (((32 * (a1 + 1 != v25 + 35)) | ((a1 + 1 != v25 + 35) << 7)) ^ v24))
                                          - 12))(1578322881);
}

uint64_t sub_218EDA374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int16 a24,char a25)
{
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  int v28;

  *(_BYTE *)(v27 + ((int)a1 - 1578322881) % v26) = (v28
                                                  - 77
                                                  + *(_BYTE *)(v27 + ((int)a1 - 1578322881) % v26)
                                                  - ((2 * *(_BYTE *)(v27 + ((int)a1 - 1578322881) % v26)) & 0xBB)
                                                  - 124) ^ *(&a25 + a1 - 1578322881);
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((1034 * (a1 + 1 == v25 + 210)) ^ v28)) - 12))();
}

uint64_t sub_218EDA3E8@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  v7 = *(unsigned __int8 *)(v4 + (v1 + v6 + 543) % v3);
  v8 = *(unsigned __int8 *)(v4 + (v1 + v6 + 513) % v3);
  v9 = *(unsigned __int8 *)(v4 + ((((v2 - 1182) | 0x144) ^ v1) + v6) % v3);
  *(_BYTE *)(v4 + (v1 + v6 + 550) % v3) ^= ((v7 >> 7) | (2 * v7)) ^ ((v8 >> 2) | ((_BYTE)v8 << 6)) ^ ((v9 >> 3) | (32 * v9));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v2 ^ (4 * (v6 + 1 != v5 + 256)))) - 8))();
}

void sub_218EDA4C0(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_218EDA4FC(uint64_t a1)
{
  uint64_t v1;
  int v3;
  unsigned int v4;

  v3 = (*(uint64_t (**)(void))(v1 + 1624))();
  if (v3 == 16)
    v4 = -42029;
  else
    v4 = -42030;
  (*(void (**)(uint64_t))(v1 + 440))(a1);
  if (v3)
    return v4;
  else
    return 0;
}

void sub_218EDA554(uint64_t a1)
{
  int v1;
  int v2;
  _BOOL4 v4;

  v1 = 1663139771 * ((-2 - ((~(_DWORD)a1 | 0xA7149875) + (a1 | 0x58EB678A))) ^ 0xDFFD4EF8);
  v2 = *(_DWORD *)(a1 + 16) + v1;
  v4 = (*(_BYTE *)(a1 + 32) - v1) == 102 && *(_QWORD *)(a1 + 8) != 0x6541918724FB410FLL;
  __asm { BR              X9 }
}

uint64_t sub_218EDA648@<X0>(int a1@<W8>, uint64_t a2, __int16 a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27,char a28,char a29,char a30,char a31,char a32,char a33,char a34,char a35,char a36,__int128 a37,__int128 a38,uint64_t a39,unint64_t *a40,char *a41,__int128 *a42,unint64_t *a43)
{
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 *v47;
  int v48;
  int v49;
  unsigned int v50;
  unsigned __int8 *v51;
  uint64_t v52;

  v47 = *(unsigned __int8 **)(v43 + 24);
  v48 = v46 - 128;
  LODWORD(a41) = v44 - (((v46 - 128) & 0xD2A493DF | ~((v46 - 128) | 0xD2A493DF)) ^ 0x55B2BAAD) * a1 - 1603587774;
  a40 = &STACK[0x1BD3A2918E8AF115];
  sub_218EF996C(v46 - 128);
  v49 = 846572393 * ((v46 - 128) ^ 0x36635449);
  a41 = &a4;
  a40 = &STACK[0x1BD3A2918E8AF115];
  LODWORD(a42) = v44 - 656339567 + v49;
  HIDWORD(a42) = v49 + 1852334399;
  sub_218EFB8FC(v46 - 128);
  v50 = 846572393 * ((((v48 | 0x87B71D92) ^ 0xFFFFFFFE) - (~v48 | 0x7848E26D)) ^ 0x4E2BB624);
  a41 = &a5;
  LODWORD(a42) = v44 - 656339567 + v50;
  HIDWORD(a42) = v50 + 1852334399;
  a40 = &STACK[0x1BD3A2918E8AF115];
  sub_218EFB8FC(v46 - 128);
  v51 = &v47[56 * *v47];
  a36 = v51[43] ^ 0x94;
  a35 = v51[42] ^ 0x94;
  a34 = v51[41] ^ 0x94;
  a33 = v51[40] ^ 0x94;
  a32 = v51[39] ^ 0x94;
  a31 = v51[38] ^ 0x94;
  a30 = v51[37] ^ 0x94;
  a29 = v51[36] ^ 0x94;
  a28 = v51[35] ^ 0x94;
  a27 = v51[34] ^ 0x94;
  a26 = v51[33] ^ 0x94;
  a25 = v51[32] ^ 0x94;
  a24 = v51[31] ^ 0x94;
  a23 = v51[30] ^ 0x94;
  a22 = v51[29] ^ 0x94;
  a21 = v51[28] ^ 0x94;
  a20 = v51[27] ^ 0x94;
  a19 = v51[26] ^ 0x94;
  a18 = v51[25] ^ 0x94;
  a17 = v51[24] ^ 0x94;
  a40 = (unint64_t *)&a17;
  a43 = &STACK[0x1BD3A2918E8AF115];
  LODWORD(a41) = v44 - 839339309 * ((588045026 - (v48 | 0x230CDAE2) + (v48 | 0xDCF3251D)) ^ 0x60123D7C) + 476;
  a42 = &a37;
  v52 = ((uint64_t (*)(uint64_t))*(&off_24DA380E0 + v44 - 46))(v46 - 128);
  HIBYTE(a39) = BYTE3(a38);
  *(_DWORD *)((char *)&a39 + 3) = *(_DWORD *)((char *)&a37 + 15);
  *(_DWORD *)((char *)&a38 + 15) = *(_DWORD *)((char *)&a37 + 11);
  *(_QWORD *)((char *)&a38 + 7) = *(_QWORD *)((char *)&a37 + 3);
  BYTE6(a38) = BYTE2(a37);
  WORD2(a38) = a37;
  return (*(uint64_t (**)(uint64_t))(v45 + 8 * v44))(v52);
}

void sub_218EDA968()
{
  JUMPOUT(0x218EDA92CLL);
}

void sub_218EDA970()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 36) = 280558916;
}

void sub_218EDA9F4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = qword_25501BC28 - qword_255031C70 - (_QWORD)&v2;
  qword_255031C70 = 700188763 * v0 + 0x376B296DA0A1932FLL;
  qword_25501BC28 = 700188763 * (v0 ^ 0x376B296DA0A1932FLL);
  *(_DWORD *)*(&off_24DA380E0
             + ((91 * (qword_255031C70 ^ 0x2F ^ qword_25501BC28)) ^ byte_218F1CF20[byte_218F17F80[(91 * (qword_255031C70 ^ 0x2F ^ qword_25501BC28))] ^ 0xE6])
             - 130) = 280600939;
  v1 = ((uint64_t (*)(uint64_t, uint64_t))*(&off_24DA380E0
                                                  + ((91 * ((qword_25501BC28 + qword_255031C70) ^ 0x2F)) ^ byte_218F1CE20[byte_218F17E80[(91 * ((qword_25501BC28 + qword_255031C70) ^ 0x2F))] ^ 0xFB])
                                                  - 166))(512, 1509315540);
  *(_QWORD *)((char *)*(&off_24DA380E0
                      + ((91 * ((qword_25501BC28 + qword_255031C70) ^ 0x2F)) ^ byte_218F15090[byte_218F11590[(91 * ((qword_25501BC28 + qword_255031C70) ^ 0x2F))] ^ 0x59])
                      - 62)
            - 4) = v1;
  __asm { BR              X8 }
}

void sub_218EDAB9C()
{
  int v0;
  int *v1;

  *v1 = v0 | 0x15;
}

void sub_218EE2970(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  if (*(_QWORD *)(a1 + 24))
    v2 = *(_QWORD *)(a1 + 32) == 0;
  else
    v2 = 1;
  v3 = !v2;
  v1 = *(_DWORD *)(a1 + 4) + 1503905621 * ((((2 * a1) | 0x6D7B0760) - a1 - 918389680) ^ 0x6BC5ED64);
  __asm { BR              X11 }
}

uint64_t sub_218EE2A40()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  if (*(_QWORD *)(v2 + 16))
    v4 = (*(_DWORD *)(v2 + 48) ^ v1) == ((v0 + 755824797) & 0xD2F307A5) + 311846022;
  else
    v4 = 1;
  v5 = !v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((722 * v5) ^ v0)) - 8))();
}

uint64_t sub_218EE2A94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  int v12;
  uint64_t v13;

  v8 = *(_QWORD *)(v1 + 40) + 56 * **(unsigned __int8 **)(v1 + 40) + 24;
  v9 = 846572393 * ((v7 - 128 - 2 * ((v7 - 128) & 0xAAD93C81) - 1428603775) ^ 0x9CBA68C8);
  *(_DWORD *)(v7 - 104) = v9 ^ 0x3AD8BB9B;
  *(_QWORD *)(v7 - 120) = &STACK[0x749080D34EC4FBB8];
  *(_QWORD *)(v7 - 112) = v8;
  *(_WORD *)(v7 - 128) = 30955 - -21655 * ((v7 - 128 - 2 * ((v7 - 128) & 0x3C81) + 15489) ^ 0x68C8);
  *(_DWORD *)(v7 - 124) = v9 + v3 - 331;
  ((void (*)(uint64_t))(*(_QWORD *)(v0 + 8 * (v3 ^ 0x184)) - 8))(v7 - 128);
  v10 = 1503905621 * ((v7 - 128) ^ 0x5D786ED4);
  *(_QWORD *)(v7 - 120) = v5;
  *(_QWORD *)(v7 - 112) = &STACK[0x749080D34EC4FBB8];
  *(_DWORD *)(v7 - 128) = v3 - 142 - v10;
  *(_DWORD *)(v7 - 104) = v10 ^ 0x45545602;
  v11 = (void (*)(uint64_t))((char *)*(&off_24DA380E0 + v3 - 280) - 12);
  v11(v7 - 128);
  v12 = 1503905621 * ((((v7 - 128) | 0xF41AE9AF) - ((v7 - 128) & 0xF41AE9AF)) ^ 0xA962877B);
  *(_DWORD *)(v7 - 128) = v3 - 142 - v12;
  *(_DWORD *)(v7 - 104) = (v6 + 851308472) ^ v12;
  *(_QWORD *)(v7 - 120) = v4;
  *(_QWORD *)(v7 - 112) = &STACK[0x749080D34EC4FBB8];
  v11(v7 - 128);
  *(_QWORD *)(v7 - 112) = &STACK[0x749080D34EC4FBB8];
  *(_DWORD *)(v7 - 120) = v3 - 1477295531 * ((v7 - 128) ^ 0x370B3553) - 395;
  *(_QWORD *)(v7 - 128) = v7 - 148;
  v13 = ((uint64_t (*)(uint64_t))*(&off_24DA380E0 + v3 - 318))(v7 - 128);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * v3) - 8))(v13);
}

void sub_218EE2C9C()
{
  JUMPOUT(0x218EE2C48);
}

void sub_218EE2CA4()
{
  int v0;
  _DWORD *v1;
  unsigned int v2;

  v2 = (v0 >> 4) ^ 0xC | v0 ^ 0xFFFFFFC9;
  *v1 = -42084 * (v2 & 1 | ((v2 & 4) != 0) | (((v2 | ((v2 & 0xFC) >> 2)) & 2) != 0)) + 280600939;
}

void sub_218EE2D18(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v6;

  v1 = 1663139771 * ((-2 - ((a1 | 0xF08AF2C8) + (~(_DWORD)a1 | 0xF750D37))) ^ 0x779CDBBA);
  v2 = *(_DWORD *)(a1 + 28) - v1;
  if (*(_QWORD *)(a1 + 8))
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  v6 = v3 || *(_QWORD *)(a1 + 40) == 0x459D8194EE4C05E1 || *(_DWORD *)a1 - v1 == 830280328;
  __asm { BR              X8 }
}

uint64_t sub_218EE2E10(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  void (*v13)(uint64_t);
  unsigned int v14;

  v8 = (_QWORD *)(v7 - 128);
  v9 = *(_QWORD *)(a1 + 16) + 56 * **(unsigned __int8 **)(a1 + 16) + 24;
  v10 = v7 - 128;
  v11 = 846572393 * ((~(v7 - 128) & 0xB77F9F7D | (v7 - 128) & 0x48806082) ^ 0x811CCB34);
  *(_DWORD *)(v7 - 104) = v11 ^ 0x3AD8BB9B;
  *(_DWORD *)(v7 - 124) = v11 + v2 - 663;
  v8[1] = &STACK[0x749080D34EC4FA7C];
  v8[2] = v9;
  *(_WORD *)(v7 - 128) = 30955 - -21655 * ((~(v7 - 128) & 0x9F7D | (v7 - 128) & 0x6082) ^ 0xCB34);
  ((void (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v2 & 0x3AC0E125)) - 8))(v7 - 128);
  v12 = 1503905621 * (((v10 | 0xCDDABD29) + (~v10 | 0x322542D6)) ^ 0x90A2D3FC);
  *(_QWORD *)(v7 - 120) = v6;
  *(_QWORD *)(v7 - 112) = &STACK[0x749080D34EC4FA7C];
  *(_DWORD *)(v7 - 128) = v2 - 474 - v12;
  *(_DWORD *)(v7 - 104) = v12 ^ 0x45545602;
  v13 = (void (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v2 ^ 0x264u)) - 12);
  v13(v7 - 128);
  v14 = 1503905621 * ((((2 * v10) | 0xF4DFE14C) - v10 + 93327194) ^ 0xA7179E72);
  *(_QWORD *)(v7 - 120) = v4;
  *(_QWORD *)(v7 - 112) = &STACK[0x749080D34EC4FA7C];
  *(_DWORD *)(v7 - 128) = v2 - 474 - v14;
  *(_DWORD *)(v7 - 104) = (v5 + 113 * (v2 ^ 0x2EA) + 332873904) ^ v14;
  v13(v7 - 128);
  *(_QWORD *)(v7 - 112) = &STACK[0x749080D34EC4FA7C];
  *v8 = v1;
  *(_DWORD *)(v7 - 120) = (v2 - 705) ^ (1543459711 * ((v7 - 128) ^ 0x4C8203C4));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v2 - 684)) - 4))(v7 - 128);
}

void sub_218EE3024(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  char v5;
  _QWORD v6[2];
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8) + 839339309 * ((((2 * a1) | 0x3D43021A) - a1 - 513900813) ^ 0xA240996C);
  v2 = *(_QWORD *)(a1 + 24);
  v6[1] = &v5;
  v3 = *(_QWORD *)a1;
  v6[0] = v2;
  v7 = v1 + 1449114341 * (((~v6 & 0xE619AF90) - (~v6 | 0xE619AF91)) ^ 0x2947567A) + 371;
  ((void (*)(_QWORD *))((char *)*(&off_24DA380E0 + v1 - 541) - 4))(v6);
  v4 = (void (*)(void))((char *)*(&off_24DA380E0 + (int)(v1 & 0xD71D98D9)) - 12);
  v4();
  v4();
  __asm { BR              X10 }
}

uint64_t sub_218EE3294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,int a40,int a41,int a42)
{
  int v42;

  a41 = 210331622;
  a42 = 1523647529;
  a40 = 878540627;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 + 8 * ((v42 + 415) ^ (703 * (&a9 != (uint64_t *)-368)))) - 139 * ((v42 + 415) ^ 0x1C6u) + 687))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_218EE4070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v36;
  uint64_t v37;
  int v38;
  _QWORD *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;

  v41 = 839339309 * ((((v40 - 144) | 0xC5A37750) - ((v40 - 144) & 0xC5A37750)) ^ 0x79426F31);
  v39[397] = a11;
  v39[398] = v36;
  *(_DWORD *)(v40 - 120) = v41 ^ 0x789518A0;
  *(_DWORD *)(v40 - 144) = v41 + v38 - 189;
  v39[400] = a13;
  v42 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v37 + 8 * (v38 ^ 0x19B)) - 4))(v40 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a36
                                                      + 8 * ((1499 * (*(_DWORD *)(v40 - 140) == 280600939)) ^ v38))
                                          - ((v38 + 244) ^ 0x2BFLL)))(v42);
}

uint64_t sub_218EE412C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40)
{
  int v40;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((1257 * (a40 == v40 + 210331183)) ^ v40)) - 8))();
}

uint64_t sub_218EE4168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v36;
  uint64_t v37;
  int v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;

  v39[399] = a10;
  v39[398] = a13;
  v39[397] = v36 + 12;
  *(_DWORD *)(v40 - 144) = v38 + 1449114341 * ((v40 - 144) ^ 0xCF5EF9EB) + 379;
  v41 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v37 + 8 * (v38 - 289)) - 8))(v40 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a36
                                                      + 8
                                                      * ((1496
                                                        * (*(_DWORD *)(v40 - 112) == 139 * (v38 ^ 0x1C6) + 280600244)) ^ v38))
                                          - 8))(v41);
}

uint64_t sub_218EE41FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41)
{
  uint64_t v41;
  uint64_t v42;
  int v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;

  v44[398] = a13;
  v44[396] = v41 + (a41 - 1523647529);
  v44[399] = a9;
  *(_DWORD *)(v45 - 112) = (v43 - 58) ^ (846572393
                                       * ((2 * ((v45 - 144) & 0x653DE880) - (v45 - 144) - 1698556039) ^ 0xACA14330));
  v44[397] = &STACK[0x309E6C8145C33C6B];
  v46 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v42 + 8 * (v43 ^ 0x155)) - 8))(v45 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a36
                                                      + 8
                                                      * (((*(_DWORD *)(v45 - 108) == 280600939)
                                                        * ((v43 - 1252984516) & 0x4AAF07B7 ^ 0x72E)) ^ v43))
                                          - 8))(v46);
}

uint64_t sub_218EE42EC()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t sub_218EE4334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24)
{
  int v24;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((a24 + 147) ^ (143 * (v24 == 280600939))))
                            - (a24 ^ 0x6EAu)
                            + 1113))();
}

uint64_t sub_218EE4370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void (*a25)(uint64_t),uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;

  *(_DWORD *)(v38 - 136) = (v36 - 483688598) ^ (1334103649
                                              * (((v38 - 144) & 0x724A5D3 | ~((v38 - 144) | 0x724A5D3)) ^ 0x90739282));
  v37[396] = a12;
  sub_218EF78D0((uint64_t *)(v38 - 144));
  v39 = 1332649919 * ((v38 + 1301850112 - 2 * ((v38 - 144) & 0x4D98A890)) ^ 0x70EB2C62);
  v37[397] = *(&off_24DA380E0 + v36 - 1058);
  v37[399] = a12;
  *(_DWORD *)(v38 - 128) = v36 - 223 + v39;
  *(_DWORD *)(v38 - 144) = v39 + 247636025;
  a25(v38 - 144);
  v40 = 1332649919 * ((((v38 - 144) | 0x1EEB68D2) - (v38 - 144) + ((v38 - 144) & 0xE1149728)) ^ 0x2398EC20);
  v37[397] = a19;
  v37[399] = a12;
  *(_DWORD *)(v38 - 144) = v40 + 247635981;
  *(_DWORD *)(v38 - 128) = v36 - 223 + v40;
  v41 = ((uint64_t (*)(uint64_t))a25)(v38 - 144);
  v37[368] = v37[357];
  LODWORD(STACK[0xC88]) = STACK[0xC30];
  STACK[0xC8C] = STACK[0xC34];
  LODWORD(STACK[0xC94]) = STACK[0xC3C];
  *(_OWORD *)&STACK[0xC98] = *(_OWORD *)&STACK[0xC40];
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a36 + 8 * (v36 - 463)) - 12))(v41);
}

uint64_t sub_218EE4530@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  *(_OWORD *)(v4 + v2 + 2968) = *(_OWORD *)(v4 + v2 + 2880);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v2 == 48) * a2) ^ v3)) - 12))();
}

uint64_t sub_218EE4560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unint64_t a22,uint64_t (*a23)(uint64_t),uint64_t a24,void (*a25)(uint64_t),uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v36;
  unint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;

  LOBYTE(STACK[0xC18]) = v40 - 75;
  v43 = 1332649919 * ((v36 - (v38 | v36) + (v38 | 0x4F3F7CC7)) ^ 0x724CF835);
  *(_DWORD *)(v42 - 144) = v43 + 247635977;
  *(_DWORD *)(v42 - 128) = v43 + v41 - 223;
  STACK[0xD78] = v37;
  STACK[0xD68] = a22;
  a25(v42 - 144);
  STACK[0xD68] = a35 + (v41 ^ v39) + 16 * (int)v40 + 491886786;
  STACK[0xD60] = v37;
  *(_DWORD *)(v42 - 128) = v41 + 1449114341 * (((~v38 & 0xDFC60370) - (~v38 | 0xDFC60371)) ^ 0x1098FA9A) - 51;
  v44 = a23(v42 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a36
                                                      + 8
                                                      * (((((v41 - 2118626539) & 0x7E47A9DF) - 140) * (v40 == 1042998867)) ^ v41))
                                          - 8))(v44);
}

void sub_218EE4688()
{
  JUMPOUT(0x218EE44CCLL);
}

uint64_t sub_218EE4690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _BYTE *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  int v24;
  uint64_t v25;

  *a18 = *(_BYTE *)(v25 - 160);
  a18[1] = *(_BYTE *)(v25 - 159);
  a18[2] = *(_BYTE *)(v25 - 158);
  a18[3] = *(_BYTE *)(v25 - 157);
  a18[4] = *(_BYTE *)(v25 - 156);
  a18[5] = *(_BYTE *)(v25 - 155);
  a18[6] = *(_BYTE *)(v25 - 154);
  a18[7] = *(_BYTE *)(v25 - 153);
  a18[8] = *(_BYTE *)(v25 - 152);
  a18[9] = *(_BYTE *)(v25 - 151);
  a18[10] = *(_BYTE *)(v25 - 150);
  a18[11] = *(_BYTE *)(v25 - 149);
  a18[12] = *(_BYTE *)(v25 - 148);
  a18[13] = *(_BYTE *)(v25 - 147);
  a18[14] = *(_BYTE *)(v25 - 146);
  a18[15] = *(_BYTE *)(v25 - 145);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 + 8 * ((v24 ^ 0x3E5) - 198)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_218EE4790@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,__int16 a50,unsigned __int8 a51,unsigned __int8 a52)
{
  int v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
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
  int v72;
  unsigned __int8 v73;
  unsigned __int8 v74;
  unsigned __int8 v75;
  uint64_t v76;
  unsigned __int8 v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  unint64_t v86;
  uint64_t v88;
  uint64_t v89;

  v54 = (2 * a1) ^ 0x478;
  v55 = a52 ^ 0xAE;
  v89 = 2 % v55;
  v56 = *(unsigned __int8 *)(v53 - 12);
  v57 = *(unsigned __int8 *)(v53 - 8);
  v58 = *(unsigned __int8 *)(v53 - 4);
  v59 = *(unsigned __int8 *)(v53 - 3);
  v60 = *(unsigned __int8 *)(v53 - 7);
  v61 = *(unsigned __int8 *)(v53 - 11);
  v62 = *(unsigned __int8 *)(v53 - 15);
  v88 = 3 % v55;
  v63 = *(unsigned __int8 *)(v53 - 14);
  v64 = *(unsigned __int8 *)(v53 - 6);
  v65 = *(unsigned __int8 *)(v53 - 10);
  v66 = *(unsigned __int8 *)(v53 - 2);
  v67 = *(unsigned __int8 *)(v53 - 13);
  v68 = *(unsigned __int8 *)(v53 - 9);
  v69 = *(unsigned __int8 *)(v53 - 5);
  v70 = *(unsigned __int8 *)(v53 - 1);
  v71 = (v52 + 126);
  v72 = v71 - (((498715611 << (((v54 - 17) | 0xB2) + 78)) + 1220969888) & 0xF85223C0);
  v73 = *(_BYTE *)(a28 + (v72 ^ (v52 - 2))) ^ *(_BYTE *)(*(a20 - 15) + *(unsigned __int8 *)(v53 - 16));
  *(_BYTE *)(v53 - 16) = v73;
  v74 = *(_BYTE *)(a28 + (v72 ^ (v52 - 6))) ^ *(_BYTE *)(*(a20 - 11) + v56);
  *(_BYTE *)(v53 - 12) = v74;
  v75 = *(_BYTE *)(a28 + (v72 ^ (v52 - 10))) ^ *(_BYTE *)(*(a20 - 7) + v57);
  *(_BYTE *)(v53 - 8) = v75;
  v76 = *(unsigned __int8 *)(a28 + (v72 ^ (v52 - 14))) ^ *(unsigned __int8 *)(*(a20 - 3) + v58);
  *(_BYTE *)(v53 - 4) = *(_BYTE *)(a28 + (v72 ^ (v52 - 14))) ^ *(_BYTE *)(*(a20 - 3) + v58);
  LOBYTE(v57) = *(_BYTE *)(a28 + (v72 ^ (v52 - 15))) ^ *(_BYTE *)(*(a20 - 2) + v60);
  *(_BYTE *)(v53 - 3) = v57;
  LOBYTE(v60) = *(_BYTE *)(a28 + (v72 ^ (v52 - 11))) ^ *(_BYTE *)(*(a20 - 6) + v61);
  *(_BYTE *)(v53 - 7) = v60;
  LOBYTE(v62) = *(_BYTE *)(a28 + (v72 ^ (v52 - 7))) ^ *(_BYTE *)(*(a20 - 10) + v62);
  *(_BYTE *)(v53 - 11) = v62;
  v77 = *(_BYTE *)(a28 + (v72 ^ (v52 - 3))) ^ *(_BYTE *)(*(a20 - 14) + v59);
  *(_BYTE *)(v53 - 15) = v77;
  LOBYTE(v64) = *(_BYTE *)(a28 + (v72 ^ v52)) ^ *(_BYTE *)(*(a20 - 13) + v64);
  *(_BYTE *)(v53 - 14) = v64;
  v72 &= 0xFFFFFFF0;
  LOBYTE(v58) = *(_BYTE *)(a28 + (v72 ^ (v52 - 5))) ^ *(_BYTE *)(*(a20 - 5) + v63);
  *(_BYTE *)(v53 - 6) = v58;
  LOBYTE(v59) = *(_BYTE *)(a28 + (v72 ^ (v52 - 9))) ^ *(_BYTE *)(*(a20 - 9) + v66);
  *(_BYTE *)(v53 - 10) = v59;
  LOBYTE(v61) = *(_BYTE *)(a28 + (v72 ^ (v52 - 1))) ^ *(_BYTE *)(*(a20 - 1) + v65);
  *(_BYTE *)(v53 - 2) = v61;
  LOBYTE(v66) = *(_BYTE *)(a28 + (v72 ^ (v52 - 12))) ^ *(_BYTE *)(*(a20 - 12) + v68);
  *(_BYTE *)(v53 - 13) = v66;
  LOBYTE(v65) = *(_BYTE *)(a28 + (v72 ^ (v52 - 8))) ^ *(_BYTE *)(*(a20 - 8) + v69);
  *(_BYTE *)(v53 - 9) = v65;
  LOBYTE(v68) = *(_BYTE *)(a28 + (v72 ^ (v52 - 4))) ^ *(_BYTE *)(*(a20 - 4) + v70);
  *(_BYTE *)(v53 - 5) = v68;
  LOBYTE(v67) = *(_BYTE *)(a28 + (v72 ^ v52)) ^ *(_BYTE *)(*a20 + v67);
  *(_BYTE *)(v53 - 1) = v67;
  v78 = (_QWORD *)(a25 + ((unint64_t)(8 % (a51 ^ 0xAEu)) << 7));
  v79 = v78 + 147;
  v80 = *(_DWORD *)(v78[148] + 4 * v77) ^ *(_DWORD *)(v78[147] + 4 * v73) ^ (*(_DWORD *)(v78[149] + 4 * v64) ^ *(_DWORD *)(v78[150] + 4 * v66));
  *(_DWORD *)(v53 - 16) = v80;
  v81 = &v78[4 * (a52 != (v54 - 103)) + 147];
  *(_DWORD *)(v53 - 12) = *(_DWORD *)(v81[1] + 4 * v62) ^ *(_DWORD *)(*v81 + 4 * v74) ^ *(_DWORD *)(v81[2] + 4 * v59) ^ *(_DWORD *)(v81[3] + 4 * v65);
  v82 = &v79[4 * v89];
  v83 = *v82;
  v84 = v82[1];
  *(_DWORD *)(v53 - 8) = *(_DWORD *)(v84 + 4 * v60) ^ *(_DWORD *)(*v82 + 4 * v75) ^ *(_DWORD *)(v82[2] + 4 * v58) ^ *(_DWORD *)(v82[3] + 4 * v68);
  v85 = &v79[4 * v88];
  v86 = *(_DWORD *)(v85[1] + 4 * v57) ^ *(_DWORD *)(*v85 + 4 * v76) ^ (*(_DWORD *)(v85[2] + 4 * v61) ^ *(_DWORD *)(v85[3] + 4 * v67));
  *(_DWORD *)(v53 - 4) = v86;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))(a29 + 8 * v54))(498715603, a29, v83, v71, v86 >> 24, v76, v80, v84, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22);
}

void sub_218EE4B94()
{
  JUMPOUT(0x218EE484CLL);
}

uint64_t sub_218EE4BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t (*a30)(void))
{
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;

  *(_BYTE *)(v33 - 16) = *(_BYTE *)(STACK[0xA88] + *(unsigned __int8 *)(v33 - 16));
  *(_BYTE *)(v33 - 12) = *(_BYTE *)(STACK[0xAC8] + v30);
  *(_BYTE *)(v33 - 8) = *(_BYTE *)(STACK[0xB08] + v31);
  *(_BYTE *)(v33 - 4) = *(_BYTE *)(STACK[0xB48] + v35);
  *(_BYTE *)(v33 - 3) = *(_BYTE *)(STACK[0xB58] + BYTE1(v31));
  *(_BYTE *)(v33 - 7) = *(_BYTE *)(STACK[0xB18] + BYTE1(v30));
  *(_BYTE *)(v33 - 11) = *(_BYTE *)(STACK[0xAD8] + *(unsigned __int8 *)(v33 - 15));
  *(_BYTE *)(v33 - 15) = *(_BYTE *)(STACK[0xA98] + BYTE1(v35));
  v36 = *(unsigned __int8 *)(v33 - 14);
  *(_BYTE *)(v33 - 14) = *(_BYTE *)(STACK[0xAA8] + BYTE2(v31));
  *(_BYTE *)(v33 - 6) = *(_BYTE *)(STACK[0xB28] + v36);
  *(_BYTE *)(v33 - 10) = *(_BYTE *)(STACK[0xAE8] + BYTE2(v35));
  *(_BYTE *)(v33 - 2) = *(_BYTE *)(STACK[0xB68] + BYTE2(v30));
  v37 = *(unsigned __int8 *)(v33 - 13);
  *(_BYTE *)(v33 - 13) = *(_BYTE *)(STACK[0xAB8] + v32);
  *(_BYTE *)(v33 - 9) = *(_BYTE *)(STACK[0xAF8] + v34);
  *(_BYTE *)(v33 - 5) = *(_BYTE *)(STACK[0xB38] + a5);
  *(_BYTE *)(v33 - 1) = *(_BYTE *)(STACK[0xB78] + v37);
  return a30();
}

uint64_t sub_218EE4CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24)
{
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((a24 ^ 0x2B7) + 483) ^ (a24 + 44))) - 8))();
}

uint64_t sub_218EE4D38(int a1, uint64_t a2, int a3, int a4)
{
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v9 = 5 * (v5 ^ a3);
  *(_BYTE *)(v7 + (v9 ^ a4) + v6) ^= *(_BYTE *)(v8 + (v9 ^ a4) + v6);
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((v6 + 1 < v4) * ((v9 ^ a1) + 483)) ^ (v9 + 44))) - 8))();
}

void sub_218EE4D88()
{
  JUMPOUT(0x218EE46D4);
}

uint64_t sub_218EE4DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2
                                                      + 8
                                                      * (((a24 ^ 0x1FD) + ((a24 - 2111230404) & 0x7DD6CF1F) - 855) | (a24 - 494)))
                                          - 12))(a31);
}

uint64_t sub_218EE4E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  int v8;

  *(_BYTE *)(a1 + v8 - 1877881839) ^= *(_BYTE *)(*(_QWORD *)(v7 + 8 * (v6 + 167)) + v8 - 1877881839 - 4);
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (((((139 * (v6 ^ 0x16)) ^ v4) + ((139 * (v6 ^ 0x16) + a3) & v3) - 855)
                                          * (v8 + 139 * (v6 ^ 0x16u) - 694 < v5)) | (139 * (v6 ^ 0x16) - 494)))
                            - 12))();
}

uint64_t sub_218EE4E7C()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void (*v10)(uint64_t);

  v3 = v2 - 144;
  *(_DWORD *)(v2 - 136) = (v0 - 483688323) ^ (1334103649
                                            * ((2 * ((v2 - 144) & 0x133CA4D8) - (v2 - 144) + 1824742183) ^ 0x46B9389));
  v1[396] = v7;
  sub_218EF78D0((uint64_t *)(v2 - 144));
  v4 = 1332649919 * ((((2 * v3) | 0x7CF87A0A) - v3 + 1099154171) ^ 0x830FB9F7);
  v1[397] = v2 - 160;
  v1[399] = v7;
  *(_DWORD *)(v2 - 144) = v4 + 247635977;
  *(_DWORD *)(v2 - 128) = v0 + 52 + v4;
  v10(v2 - 144);
  v5 = 1332649919 * ((2 * (v3 & 0x3FE9B5D8) - v3 - 1072281052) ^ 0xFD65CED6);
  v1[399] = v7;
  *(_DWORD *)(v2 - 128) = v0 + 52 + v5;
  *(_DWORD *)(v2 - 144) = v5 + 247635977;
  v1[397] = v8;
  v10(v2 - 144);
  v1[397] = v8 + 4;
  v1[396] = v7;
  *(_DWORD *)(v2 - 128) = v0 + 1449114341 * (((v2 - 144) & 0x79D2A721 | ~((v2 - 144) | 0x79D2A721)) ^ 0x4973A135) + 224;
  return v9(v2 - 144);
}

void IPaI1oem5iL()
{
  int v0[4];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 291625862
        - 1334103649 * ((1855394389 - (v0 | 0x6E971255) + (v0 | 0x9168EDAA)) ^ 0xF9C02504);
  sub_218EF7A24(v0);
  __asm { BR              X10 }
}

uint64_t sub_218EE50E8@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1789 * (v2 != 0)) ^ a1)) - 12))();
}

uint64_t sub_218EE5110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  int v6;
  unsigned int v7;

  v2 = v0 ^ 0x6D2DE21DA2E3804ELL;
  v5 = *(_QWORD *)(v2 - 0x6D2DE21DA2E38036);
  v7 = 730 - 1477295531 * ((((2 * &v5) | 0x8BFA33D6) - &v5 - 1174215147) ^ 0x72F62CB8);
  sub_218EF1614((uint64_t)&v5);
  v3 = v6;
  (*(void (**)(uint64_t))(v1 + 440))(v2 - 0x6D2DE21DA2E3804ELL);
  return (v3 - 280600939);
}

void sub_218EE51E0(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 - 846572393 * ((2 * (a1 & 0x71D830D) - (_DWORD)a1 - 119374606) ^ 0xCE8128BB);
  __asm { BR              X8 }
}

uint64_t sub_218EE52B0()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BOOL4 v6;

  v4 = *(_BYTE **)(*(_QWORD *)(v0 + 8 * (int)(v2 - 540)) - 4);
  *(_BYTE *)(v3 - 103) = *v4 - 34;
  *(_BYTE *)(v3 - 102) = v4[1] - 34;
  *(_BYTE *)(v3 - 101) = (v2 ^ 0x6C) - 79 + v4[2] - 28;
  *(_BYTE *)(v3 - 100) = v4[3] - 34;
  *(_BYTE *)(v3 - 99) = v4[4] - 34;
  *(_BYTE *)(v3 - 98) = v4[5] - 34;
  *(_BYTE *)(v3 - 97) = v4[6] - 34;
  *(_BYTE *)(v3 - 96) = v4[7] - 34;
  *(_BYTE *)(v3 - 95) = v4[8] - 34;
  *(_BYTE *)(v3 - 94) = v4[9] - 34;
  *(_BYTE *)(v3 - 93) = v4[10] - 34;
  *(_BYTE *)(v3 - 92) = v4[11] - 34;
  *(_BYTE *)(v3 - 91) = v4[12] - 34;
  *(_BYTE *)(v3 - 90) = v4[13] - 34;
  *(_BYTE *)(v3 - 89) = v4[14] - 34;
  v5 = (*(uint64_t (**)(void))(v0 + 8 * (v2 ^ 0x264)))();
  v6 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 8 * (int)(v2 - 467)))(0, v3 - 103, v5) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((108 * v6) ^ v2)) - 4))();
}

uint64_t sub_218EE53C4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8 * (v2 ^ 0x3E1)))(a1, 0);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * (((v4 != 0) * (((v2 - 976) | 0x1C1) ^ (v2 + 544))) ^ v2))
                                                                                       - 4))(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_218EE5414()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (*(uint64_t (**)(void))(v1 + 8 * (v0 & 0x44E0D02B)))();
  v4 = (*(uint64_t (**)(void))(v1 + 8 * (v0 & 0x6FB096D3)))();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2
                                                                                          + 8
                                                                                          * (((v3 == v4)
                                                                                            * (((v0 - 487) | 0xE0) + 1111)) ^ v0))
                                                                              - (((v0 + 479) | 0x30u) ^ 0x3F6)))(v4, v5, v6, v7, v8);
}

uint64_t sub_218EE5480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19, char a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  a17 = 0u;
  a18 = 0u;
  a19 = 0;
  a20 = 0;
  v24 = v22();
  v25 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, uint64_t))(v20 + 8 * (v23 - 142)))(a13, &a17, 41, v24);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t))(*(_QWORD *)(v21 + 8 * ((((_DWORD)v25 == 0) * (((v23 ^ 0x31E) - 814) ^ 0x1C3)) ^ v23)) - 12))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, (char *)&a17 + 9, a13);
}

uint64_t sub_218EE54FC@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  int v4;
  BOOL v5;

  v5 = *(_BYTE *)((a1 | ((unint64_t)(a1 < v2) << 32)) + v1 - 637309900) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((8 * (((v4 + 125) ^ v5) & 1)) & 0xDF | (32 * (((v4 + 125) ^ v5) & 1))) ^ v4))
                            - 12))();
}

uint64_t sub_218EE5550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  _DWORD *v24;

  v23 = ((2 * (v18 - 637309900)) & 0x17BDB6EE) + ((v18 - 637309900) ^ 0xBDEDB77);
  v24 = *(_DWORD **)(v20 + 8 * (v19 - 554));
  if (v23 == 199154576)
    return ((uint64_t (*)(void))(*(_QWORD *)(v22 + 8 * ((813 * (a18 == 45)) ^ (v21 - 537)))
                              - (v21 - 554)
                              + 23))();
  if (v23 != 199154591)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *))(*(_QWORD *)(v22
                                                                                             + 8
                                                                                             * ((827
                                                                                               * (((2 * (v21 ^ 0x3B4)
                                                                                                  + 1347534277) ^ (v21 - 94)) == 1347492909)) ^ (v21 - 94)))
                                                                                 - 12))(a1, a2, a3, a4, v24);
  *v24 = -374485624;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8 * ((333 * (((v21 + 37) & 1) == 0)) ^ (v21 - 433))))(1048, 148539964);
}

uint64_t sub_218EE59DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  void (*v8)();

  *v6 = a5;
  v8();
  result = ((uint64_t (*)())v8)();
  *(_QWORD *)(v5 + 8) = *v6;
  return result;
}

void OowSGu()
{
  int v0[14];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 291625862 - 1334103649 * (((v0 | 0x7B868571) + (~v0 | 0x84797A8E)) ^ 0x132E4DDE);
  sub_218EF7A24(v0);
  __asm { BR              X9 }
}

uint64_t sub_218EE5B00()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((2033 * (v1 != 0)) ^ 0x397)) - 12))();
}

uint64_t sub_218EE5B40@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v8 = *(_QWORD *)((v7 ^ 0x6D2DE21DA2E3804ELL) - 0x6D2DE21DA2E38036);
  v9 = 1332649919 * ((((2 * &v11) | 0x64D43DEA) - &v11 - 845815541) ^ 0xF199A07);
  v14 = (v1 - 566) ^ v9;
  v12 = v5;
  v13 = v8;
  v17 = v4;
  v15 = v3;
  v11 = (v6 ^ 0x5FFFFF53) + ((2 * v6) & 0xBFFFFEA6) - v9 + v2 + 713133922;
  (*(void (**)(unsigned int *))(a1 + 8 * (v1 ^ 0x3D3u)))(&v11);
  return (v16 - 280600939);
}

void sub_218EE5C44(_QWORD *a1)
{
  BOOL v1;
  int v3;

  if (a1[1])
    v1 = a1[3] == 0x44F291D5AE4BD1E9;
  else
    v1 = 1;
  v3 = !v1 && a1[2] != 0x252C3BDA7CBE997ALL;
  __asm { BR              X10 }
}

uint64_t sub_218EE5D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;

  v17 = (_DWORD *)(v11 - 0x44F291D5AE4BD1E9);
  *(_DWORD *)(v11 - 0x44F291D5AE4BD1E9) = 1523647529;
  a10 = v13;
  LODWORD(a9) = (v14 + 1098962019) ^ (1477295531
                                    * ((&a9 - 391716457 - 2 * (&a9 & 0xE8A6E197)) ^ 0xDFADD4C4));
  sub_218EFBA84((uint64_t)&a9);
  *(_DWORD *)(v12 - 0x252C3BDA7CBE9976) = HIDWORD(a9);
  *v17 += 4;
  LODWORD(a9) = (v14 + 1098962019) ^ (1477295531
                                    * ((&a9 & 0xD1DE1906 | ~(&a9 | 0xD1DE1906)) ^ 0x192AD3AA));
  a10 = v13 + 4;
  sub_218EFBA84((uint64_t)&a9);
  v18 = HIDWORD(a9);
  *v17 += 4;
  v19 = 1334103649
      * (((&a9 | 0xE9E817F3) - &a9 + (&a9 & 0x1617E808)) ^ 0x8140DF5D);
  a9 = v12 + 0x30BF25318253C9BALL;
  HIDWORD(a10) = v19 ^ v18 ^ 0x1615E787;
  a11 = v14 - v19 - 151;
  v20 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v16 + 8 * (v14 - 823)) - 12))(&a9);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((1956 * ((_DWORD)a10 == 280600939)) ^ v14)) - 4))(v20);
}

uint64_t sub_218EE5E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, unsigned int a12)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  v17 = 846572393 * (((&a9 | 0x7D0BA1F1) - (&a9 & 0x7D0BA1F1)) ^ 0x4B68F5B8);
  a11 = v16;
  a10 = (v12 - 436) ^ v17;
  a12 = v17 + 2146642983;
  v18 = ((uint64_t (*)(int *))(*(_QWORD *)(v14 + 8 * (v12 - 755)) - 4))(&a9);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13 + 8 * ((1904 * (a9 == v15)) ^ v12)) - 4))(v18);
}

void sub_218EE5F2C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  _DWORD *v3;

  *(_BYTE *)(v1 - 0x252C3BDA7CBE9972) = v2[8];
  ++*v3;
  *(_BYTE *)(v1 - 0x252C3BDA7CBE9971) = v2[9];
  ++*v3;
  *(_BYTE *)(v1 - 0x252C3BDA7CBE9970) = v2[10];
  ++*v3;
  *(_BYTE *)(v1 - 0x252C3BDA7CBE996FLL) = v2[11];
  ++*v3;
  *(_DWORD *)(v0 + 32) = 280600939;
}

void sub_218EE6004(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_DWORD *)a1
     + 1580882533 * ((2 * ((a1 ^ 0xBE3334B4) & 0x10D77B48) - (a1 ^ 0xBE3334B4) + 1864926391) ^ 0x488303C3);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = ((unint64_t)(*(_DWORD *)(v2 - 0x1BD3A2918E8AF0F9) + 22) >> 3) & 0x3F;
  *(_BYTE *)(v2 - 0x1BD3A2918E8AF0F1 + v3) = 0x80;
  __asm { BR              X14 }
}

uint64_t sub_218EE6160()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((769 * (v0 != ((3 * (v1 ^ 0x40)) ^ 0xFFFFFE0E) + (v1 ^ 0x329))) ^ v1))
                            - 8))();
}

uint64_t sub_218EE619C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((127 * (((((v1 - 1850515006) & 0x6E4C9FCF) + 161) ^ 0x45Bu) - v0 < 8)) ^ v1))
                            - 4))();
}

uint64_t sub_218EE61E8()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((((v1 - 169) | 8) - 162) ^ 0x334) * (v0 > 0x1F)) ^ v1)) - 8))();
}

uint64_t sub_218EE621C@<X0>(_OWORD *a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;

  *a1 = 0u;
  a1[1] = 0u;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((103 * (((v2 - 699) ^ 0x130) == (v1 & 0xFFFFFFE0))) ^ (v2 - 278)))
                            - 8))();
}

uint64_t sub_218EE6268()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((v1 - 345) ^ 0x36D) - 872) * (v0 == 0)) ^ v1)) - 8))();
}

uint64_t sub_218EE6294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(int *), uint64_t a13, uint64_t a14, uint64_t (*a15)(int *), int a16, int a17, int a18, int a19, int a20,int *a21,int *a22,unsigned int a23,int a24)
{
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int *v28;
  void (*v29)(int *);
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;

  v30 = 1477295531 * ((-675871305 - (&a20 | 0xD7B705B7) + (&a20 | 0x2848FA48)) ^ 0x1F43CF1B);
  LODWORD(a22) = v30 + 884429994;
  a21 = v28;
  a20 = (v26 + 555) ^ v30;
  v29(&a20);
  v31 = 1449114341 * (&a20 ^ 0xCF5EF9EB);
  a21 = &a16;
  a22 = v28;
  a20 = v26 - v31 + 144;
  a23 = v31 - 2043182176;
  a24 = v31 ^ v27;
  a12(&a20);
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF109) += a16;
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF105) += a17;
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF101) += a18;
  *(_DWORD *)(v25 - 0x1BD3A2918E8AF0FDLL) += a19;
  a20 = 1334103649 * ((2 * (&a20 & 0x608DBA78) - &a20 - 1619901051) ^ 0xF7DA8D2B)
      + 2097344414
      + v26
      + 769;
  a21 = (int *)(v25 - 0x134A6E0A0FAD2C16);
  a22 = v28;
  v32 = a15(&a20);
  *(_QWORD *)(v25 - 0x1BD3A2918E8AF0F1) = 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v24 + 8 * ((511 * (((v26 + 385) | 0x180) == 960)) ^ v26))
                                          - 8))(v32);
}

uint64_t sub_218EE6488@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + a1 + 24) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((511 * (a1 + 8 == v4 - 952)) ^ v2)) - 8))();
}

uint64_t sub_218EE64BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  *a1 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((464 * (((v2 + 202476669) & 0xF3EE70EF ^ 0xEELL) != v1)) ^ (v2 - 304)))
                            - 8))();
}

uint64_t sub_218EE6510()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (94 * (v1 != v0))))
                            - ((v2 + 2059595198) & 0x853D13FF)
                            - ((v2 + 2059595198) ^ 0xFFFFFFFF853D13F4)))();
}

uint64_t sub_218EE655C()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((46 * ((((v1 + 147924225) & 0xF72EDBFB ^ 0x3D3) & v0) == 0)) ^ v1)))();
}

uint64_t sub_218EE659C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + v1 + v5 - 0x1BD3A2918E8AF0F0) = 0;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 - (v0 & 0xFFFFFFF8) == -8) * ((v3 - 73) ^ 0x266)) ^ v3)))();
}

uint64_t sub_218EE65F0()
{
  int v0;
  int v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *v2 = 0;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 == 0) * v0) ^ v1)))();
}

uint64_t sub_218EE6614()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 - 972374785) & 0x39F543EB ^ 0x269) * (v2 == v0)) ^ v1)))();
}

uint64_t sub_218EE6654@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  *(_BYTE *)(a1 + v2) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v2 + 1 == v1) * (v3 + 595)) ^ (v3 - 270))) - 12))();
}

uint64_t sub_218EE6684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(int *), uint64_t a13, uint64_t a14, void (*a15)(int *), int a16, int a17, int a18, int a19, int a20,int a21,int *a22,int *a23,unsigned int a24,unsigned int a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  int v29;
  int *v30;
  void (*v31)(int *);
  uint64_t v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;

  v32 = *(_QWORD *)(v25 + 8);
  v33 = 1477295531 * (((&a20 | 0xB5685356) - (&a20 & 0xB5685356)) ^ 0x82636605);
  LODWORD(a23) = v33 + 884429992;
  a22 = v30;
  a20 = (v29 - 214) ^ v33;
  v31(&a20);
  v34 = *v28;
  v35 = (2 * *v28 + 67696684) & 0x195251EE;
  v36 = 961505453 * (((&a20 | 0x7B38EBE2) - (&a20 & 0x7B38EBE2)) ^ 0xD9C32544);
  a22 = (int *)(v27 - 0x111836703796F466);
  a20 = v34 - v36 - 827480819 - v35;
  a21 = (v29 - 2110089318) ^ v36;
  sub_218EF973C((uint64_t)&a20);
  v37 = *(_DWORD *)(v27 - 0x1BD3A2918E8AF0F5);
  v38 = 961505453 * ((1153326306 - (&a20 | 0x44BE5CE2) + (&a20 | 0xBB41A31D)) ^ 0x19BA6DBB);
  a22 = (int *)(v27 - 0x111836703796F462);
  a20 = v37 - v38 - 827480819 - ((2 * v37 + 67696684) & 0x195251EE);
  a21 = (v29 - 2110089318) ^ v38;
  sub_218EF973C((uint64_t)&a20);
  v39 = 1449114341 * (&a20 ^ 0xCF5EF9EB);
  a20 = v29 - v39 - 625;
  a22 = &a16;
  a23 = v30;
  a24 = v39 - 2043182176;
  a25 = v39 ^ 0x893B2A7A;
  a12(&a20);
  *(_DWORD *)(v27 - 0x1BD3A2918E8AF109) += a16;
  *(_DWORD *)(v27 - 0x1BD3A2918E8AF105) += a17;
  *(_DWORD *)(v27 - 0x1BD3A2918E8AF101) += a18;
  *(_DWORD *)(v27 - 0x1BD3A2918E8AF0FDLL) += a19;
  a20 = v29
      + 2097344414
      + 1334103649
      * ((((&a20 | 0xA0EF3358) ^ 0xFFFFFFFE) - (~&a20 | 0x5F10CCA7)) ^ 0x37B80409);
  a22 = (int *)(v27 - 0x134A6E0A0FAD2C16);
  a23 = v30;
  a15(&a20);
  v40 = 1477295531 * ((&a20 & 0x216D408A | ~(&a20 | 0x216D408A)) ^ 0xE9998A26);
  a22 = (int *)(v27 - 0x1BD3A2918E8AF109);
  a20 = (v29 - 214) ^ v40;
  LODWORD(a23) = v40 + 884429982;
  v31(&a20);
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2D2) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF109)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF109)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2D1) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF108)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF108)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2D0) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF107)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF107)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CFLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF106)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF106)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CELL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF105)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF105)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CDLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF104)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF104)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CCLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF103)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF103)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CBLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF102)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF102)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CALL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF101)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF101)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C9) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF100)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF100)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C8) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FFLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FFLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C7) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FELL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FELL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C6) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FDLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FDLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C5) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FCLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FCLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C4) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FBLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FBLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C3) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FALL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FALL)) & 0x28)
                                         - 108;
  v41 = 1477295531
      * ((-1373494553 - (&a20 | 0xAE2222E7) + (&a20 | 0x51DDDD18)) ^ 0x66D6E84B);
  LODWORD(a23) = v41 + 884429982;
  a20 = (v29 - 214) ^ v41;
  a22 = (int *)(v27 - 0x1BD3A2918E8AF109);
  v31(&a20);
  a20 = v29
      + 2097344414
      + 1334103649 * ((1448615256 - (&a20 | 0x56581D58) + (&a20 | 0xA9A7E2A7)) ^ 0xC10F2A09);
  a22 = (int *)(v27 - 0x134A6E0A0FAD2C16);
  a23 = v30;
  a15(&a20);
  v42 = 1477295531 * ((&a20 + 517197333 - 2 * (&a20 & 0x1ED3CE15)) ^ 0x29D8FB46);
  LODWORD(a23) = v42 + 884429982;
  a20 = (v29 - 214) ^ v42;
  a22 = (int *)(v27 - 0x1BD3A2918E8AF109);
  v43 = ((uint64_t (*)(int *))v31)(&a20);
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CELL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF109)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF109)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CDLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF108)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF108)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CCLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF107)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF107)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CBLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF106)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF106)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2CALL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF105)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF105)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C9) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF104)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF104)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C8) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF103)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF103)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C7) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF102)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF102)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C6) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF101)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF101)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C5) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF100)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF100)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C4) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FFLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FFLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C3) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FELL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FELL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C2) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FDLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FDLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C1) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FCLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FCLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2C0) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FBLL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FBLL)) & 0x28)
                                         - 108;
  *(_BYTE *)(v32 - 0x2A6D1E16B628F2BFLL) = *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FALL)
                                         - ((2 * *(_BYTE *)(v27 - 0x1BD3A2918E8AF0FALL)) & 0x28)
                                         - 108;
  *(_OWORD *)(v27 - 0x1BD3A2918E8AF109) = 0u;
  *v28 = 1039893482;
  *(_DWORD *)(v27 - 0x1BD3A2918E8AF0F5) = 1039893482;
  *(_OWORD *)(v27 - 0x1BD3A2918E8AF0F1) = 0u;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26 + 8 * ((1777 * (v29 == 960)) ^ v29)) - 4))(v43);
}

uint64_t sub_218EE71BC@<X0>(__n128 *a1@<X8>, __n128 a2@<Q0>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  *a1 = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v3 == 0) * v2) ^ v5)) - 4))();
}

void sub_218EE721C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) ^ (846572393 * (((a1 | 0xD0317A82) - (a1 & 0xD0317A82)) ^ 0xE6522ECB));
  __asm { BR              X10 }
}

uint64_t sub_218EE72E0()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1500 * (*(_DWORD *)(v1 + 16) - v0 == 2146642983)) ^ v2)) - 4))();
}

uint64_t sub_218EE7314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, int a12, unsigned int a13)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  a11 = (127 * (((&a11 | 0x2F) - &a11 + (&a11 & 0xD0)) ^ 0xEB)) ^ (((2 * *(_BYTE *)(v14 - 0x55EB610BFF126321)) & 0xF3 ^ 0x50) + (*(_BYTE *)(v14 - 0x55EB610BFF126321) ^ 0x57)) ^ 0x80;
  a13 = v13
      - 1543459711
      * (((&a11 | 0x2552692F) - &a11 + (&a11 & 0xDAAD96D0)) ^ 0x69D06AEB)
      + 635;
  v16 = sub_218EC5910((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((793 * (a12 == 280600939)) ^ v13)) - 4))(v16);
}

uint64_t sub_218EE73CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int a12, char a13)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  unsigned int v18;
  uint64_t v19;

  v17 = *(_BYTE *)(v14 - 0x55EB610BFF126322);
  v18 = 1332649919
      * (((&a11 | 0x8C1CB010) - &a11 + (&a11 & 0x73E34FEC)) ^ 0xB16F34E2);
  a12 = v18 - 1480479247 + v13;
  a13 = (v17 ^ 0xD1) - v18 + ((2 * v17) ^ 0x5C) - 8;
  v19 = sub_218EC5594((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((1350 * (a11 == v16)) ^ v13)) - 4))(v19);
}

uint64_t sub_218EE747C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, char a12, int a13)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  unsigned int v18;
  uint64_t v19;

  v17 = *(_BYTE *)(v14 - 0x55EB610BFF126323);
  v18 = 1663139771
      * (((&a11 | 0x2FCE4042) - &a11 + (&a11 & 0xD031BFBC)) ^ 0x572796CF);
  a13 = v18 - 714275840 + v13;
  a12 = v18 + (v17 ^ 0xB1) + ((2 * (v17 & 0x1F)) ^ 0x1C) - 10;
  v19 = sub_218EF7944((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((a11 == v16) | (4 * (a11 == v16)) | v13)) - 4))(v19);
}

uint64_t sub_218EE7528()
{
  _DWORD *v0;
  int v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  char v5;
  unsigned int v6;

  v5 = ((*(_BYTE *)(v2 - 0x55EB610BFF126324) ^ 0x45) + ((2 * *(_BYTE *)(v2 - 0x55EB610BFF126324)) & 0xD6 ^ 0x54) + 56) ^ (101 * ((~&v4 & 0xEB | &v4 & 0x14) ^ 0x2B));
  v6 = (v1 + 1074710771) ^ (1580882533
                          * ((~&v4 & 0x7552A4EB | &v4 & 0x8AAD5B14) ^ 0xECCA172B));
  result = sub_218EFBA34((uint64_t)&v4);
  *v0 = v4;
  return result;
}

void sub_218EE75FC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4)
     - 846572393 * (((a1 ^ 0xC1044548) & 0xD1264D4C | (a1 ^ 0x26D8B290) & 0x2ED9B2B3) ^ 0xD1BFA391);
  __asm { BR              X9 }
}

uint64_t sub_218EE76F8@<X0>(_WORD *a1@<X0>, __int16 a2@<W8>)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((98 * ((unsigned __int16)(*a1 + a2) != 30935)) ^ v2)))();
}

uint64_t sub_218EE7734()
{
  __int16 v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2
                                                                                 + 8
                                                                                 * ((((((unsigned __int16)(v0 - 31000) < 0xFFBFu) ^ ((v1 ^ 0x45) - 106)) & 1)
                                                                                   * (v1 ^ 0x5E4)) ^ v1 ^ 0x745))
                                                                     - 8))(209736482, 172918990, 3561275939, 733691356);
}

uint64_t sub_218EE7830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  int v49;
  uint64_t v50;
  unsigned int v51;
  int v52;
  int v53;
  uint64_t v54;
  _BOOL4 v55;
  uint64_t v57;

  v51 = (v49 + 2119943317) & 0x81A43B7B;
  v57 = (v49 + 2119943317);
  *(_QWORD *)(a10 - 0x749080D34EC4FB44) = 0x9494949494949494;
  memset((void *)(a10 - 0x749080D34EC4FB3CLL), 148, 48);
  *(_QWORD *)(a10 - 0x749080D34EC4FB4CLL) = 0x9494949494949494;
  v52 = (v51 ^ 0x2E8) - 31897 + ((2 * v51) ^ 0x7C2) + v48;
  v53 = (unsigned __int16)v52 + 840624800 - ((2 * v52) & 0x1D508) - 28;
  v54 = (2 * v53) & 0x643F7FFA ^ 0x64355508u;
  v55 = (_DWORD)v54 + (v53 ^ 0x49E55579) - 1346667041 != a4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 + 8 * (int)((2 * v55) | (4 * v55) | v51)) - 8))(v54, a2, a3, a4, a5, a10, a7, a8, a9, a10, a11, a12, a13, a14, v57, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_218EE82F4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (int)((1593
                                               * ((((a1 + v8 + a7) < 8) ^ (v7 + 77)) & 1)) ^ v7))
                            - (v7 ^ 0x33ALL)))();
}

uint64_t sub_218EE8350()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((2018 * (v0 >= ((v1 + 876684283) & 0xCBBED8F7) - 53)) ^ v1)) - 8))();
}

uint64_t sub_218EE8394(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  char *v56;

  v53 = v50 + ((v51 + 547) ^ (a3 - 456));
  v54 = *(_OWORD *)(a8 + v53 - 15);
  v55 = *(_OWORD *)(a8 + v53 - 31);
  v56 = &a49 + v53;
  *(_OWORD *)(v56 - 15) = v54;
  *(_OWORD *)(v56 - 31) = v55;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v52 + 8 * ((28 * ((v49 & 0xFFFFFFE0) == 32)) ^ (v51 + 973)))
                                          - 4))(v50);
}

void sub_218EE83F0()
{
  JUMPOUT(0x218EE83A8);
}

uint64_t sub_218EE83FC(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (a2 ^ (1849 * (v2 != v3)))) - ((a2 + 186) ^ 0x33ALL)))();
}

uint64_t sub_218EE8440()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ ((16 * ((v0 & 0x18) != 0)) | (((v0 & 0x18) != 0) << 6))))
                            - ((v1 + 1331048616) & 0xB0A9CDEF)
                            + 450))();
}

uint64_t sub_218EE8484(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,__int128 a48)
{
  int v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;

  *(_QWORD *)((char *)&a48 + (v49 + a3 - v51) + 1) = *(_QWORD *)(a8 - 7 + (v49 + a3 - v51));
  return ((uint64_t (*)(void))(*(_QWORD *)(v52 + 8 * ((37 * (((v50 + 174) ^ 0x270) + v51 == (v48 & 0xFFFFFFF8))) | v50))
                            - 12))();
}

uint64_t sub_218EE84D8(uint64_t a1, int a2, int a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)(a1 + (a2 - v5)) = *(_QWORD *)(v6 + (a2 - v5));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a3 + v5 == v7) * a4) | v4)) - 12))();
}

uint64_t sub_218EE8504(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                                 + 8
                                                                                 * (int)((((((v3 - 1156667624) ^ 0xBB0EA9C5)
                                                                                          + 389) ^ (v3 - 1156667624) & 0x44F156FF)
                                                                                        * (v2 != v4)) ^ v3))
                                                                     - 8))(a1, a2, 3561275939, 733691356);
}

uint64_t sub_218EE8558(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (v6 ^ (1087
                                               * ((((v4 + 840624800 + v5 - 28) << (v6 + 113)) & (v6 ^ 0x643F7F6A) ^ 0x64355508)
                                                + ((v4 + 840624800 + v5 - 28) ^ 0x49E55579)
                                                - 1346667041 != a4))))
                            - 4))();
}

uint64_t sub_218EE85D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((v9 + 215) ^ (198 * ((v8 + v7 + a7) > 7))))
                            - ((7 * ((v9 + 215) ^ 0x1C6u)) ^ 0x463)))();
}

uint64_t sub_218EE8628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (((((v8 - 1968988076) & 0x755C5BDF) - 142)
                                * ((unint64_t)(a8 - a6 + 0x749080D34EC4FB4CLL) > 0x1F)) ^ v8)))();
}

uint64_t sub_218EE8678()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((118
                                          * (((v1 - 106) ^ (v0 < ((v1 + 275012216) & 0xEF9BA175) - 53)) & 1)) ^ (v1 - 177)))
                            - 8))();
}

uint64_t sub_218EE86DC@<X0>(int a1@<W2>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v7 = (v4 + a1);
  v8 = *(_OWORD *)(a2 + v7 - 15);
  v9 = *(_OWORD *)(a2 + v7 - 31);
  v10 = a3 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6 + 8 * ((808 * (((v5 - 84) | 0x508) - 1257 == (v3 & 0xFFFFFFE0))) ^ (v5 + 71))))();
}

uint64_t sub_218EE873C(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  int v49;
  int v50;
  uint64_t v51;

  *(&a49 + (v49 + a3)) = *(_BYTE *)(a8 + (v49 + a3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v51 + 8
                                              * ((355 * ((((v50 + 59) ^ (v49 - 1 == a4)) & 1) == 0)) ^ (v50 + 547)))
                            - 8))();
}

uint64_t sub_218EE8784()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((((((v2 - 713285904) & 0x2A83DF0F) - 692) ^ 0x41) * (v0 == v1)) ^ v2))
                            - 8))();
}

uint64_t sub_218EE87C8()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((v1 - 508) ^ 0x112) * ((v0 & 0x18) != 0)) ^ v1))
                            - (v1 - 622)
                            + 143))();
}

uint64_t sub_218EE8800@<X0>(int a1@<W2>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(a3 - 7 + (v4 + a1 - v5)) = *(_QWORD *)(a2 - 7 + (v4 + a1 - v5));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((486
                                          * (((47 * (v6 ^ 0x108)) ^ 0x3E2) + v5 - 769 != (((47 * (v6 ^ 0x108)) ^ 0xFFFFFF13) & v3))) ^ (47 * (v6 ^ 0x108))))
                            - 12))();
}

uint64_t sub_218EE8868(int a1)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + (v1 - v2)) = *(_QWORD *)(v4 + (v1 - v2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v6 + v2 - 769 != v5) * a1) ^ v3)) - 12))();
}

uint64_t sub_218EE8898()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(((((v2 - 958262570) ^ 0xC6E21544) - 22) * (v0 == v1)) ^ v2))
                            - ((v2 - 958262570) & 0x391DEA75 ^ 0x59)))();
}

uint64_t sub_218EE88E4@<X0>(int a1@<W2>, int a2@<W3>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a4 + (v4 + a1)) = *(_BYTE *)(a3 + (v4 + a1));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((11 * (((((v5 + 117) | 0x80) - 59) ^ (v4 - 1 == a2)) & 1)) ^ ((v5 - 139) | 0x80)))
                            - 4))();
}

uint64_t sub_218EE8930@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;
  uint64_t v43;
  int v44;
  int8x16_t v45;

  v45.i64[0] = 0x3636363636363636;
  v45.i64[1] = 0x3636363636363636;
  *(int8x16_t *)(&a42 + v42) = veorq_s8(*(int8x16_t *)(&a42 + v42), v45);
  v45.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v45.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  *(int8x16_t *)(a1 + v42) = veorq_s8(*(int8x16_t *)(a1 + v42), v45);
  return (*(uint64_t (**)(void))(v43 + 8 * ((149 * (v42 == 48)) ^ (v44 - 30))))();
}

void sub_218EE8978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  int v12;
  uint64_t v13;
  int v14;

  v14 = 1477295531 * ((v13 + 1269088780 - 2 * ((v13 - 120) & 0x4BA4C284)) ^ 0x7CAFF7D7);
  *(_DWORD *)(v13 - 116) = v14 - 287616546 + a12 - (((a12 << (((v12 + 43) | 0x2D) + 84)) + 172918990) & 0x53681AEE);
  *(_DWORD *)(v13 - 112) = 209736482 - v14 + v12;
  *(_QWORD *)(v13 - 104) = a6 - 0x4FB0CEC404CDA76ALL;
  sub_218EF3DC4(v13 - 120);
  JUMPOUT(0x218EE8A50);
}

uint64_t sub_218EE8B14()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v0 - 481452997 < v3 - 1586391497;
  if (v3 < ((v1 - 1014574296) & 0x3C792FDF ^ 0x53628516u) != (v0 - 481452997) < 0xF4D41CF7)
    v4 = v3 < ((v1 - 1014574296) & 0x3C792FDF ^ 0x53628516u);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((27 * !v4) ^ v1)) - 8))();
}

uint64_t sub_218EE8B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t (*a14)(uint64_t), uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;

  v24 = 1449114341 * ((((v22 - 120) | 0xE338ED17) - ((v22 - 120) & 0xE338ED17)) ^ 0x2C6614FC);
  *(_QWORD *)(v22 - 120) = a21;
  *(_DWORD *)(v22 - 112) = (v23 + 4483202) ^ v24;
  *(_DWORD *)(v22 - 108) = (v21 + 29) ^ v24;
  v25 = sub_218ED0830(v22 - 120);
  return a14(v25);
}

uint64_t sub_218EE8C40()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;

  v5 = v3 + 136355842;
  if ((v3 + 136355842) <= 0x40)
    v5 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v4
                                                               + 8
                                                               * (((-v1 - 136355842 - v2 + v5 >= (v0 - 388))
                                                                 * (v0 + 443)) ^ v0))
                                                   - 12))(2292232352, 294027452);
}

uint64_t sub_218EE8CC4(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;

  v7 = v3 + v2;
  v8 = v7 + ((v1 + 428) ^ 0x180) + 136355139;
  if (v8 <= 0x40)
    v8 = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * ((127 * (-136355842 - v7 < v5 + v8)) ^ (v1 + 428))))(a1, 294027452);
}

uint64_t sub_218EE8D20@<X0>(int a1@<W0>, _OWORD *a2@<X7>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)(v6 + a3 + a1 + ((v4 - 1306124550) & 0x4DD9E1BFu)) = *a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((452 * (((v3 + 1) & 0x1FFFFFFF0) == 16)) ^ v4)) - 4))();
}

void sub_218EE8D88()
{
  JUMPOUT(0x218EE8D60);
}

uint64_t sub_218EE8D94@<X0>(unsigned int a1@<W3>, int a2@<W4>, int a3@<W5>, int a4@<W6>, uint64_t a5@<X7>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  _BOOL4 v25;
  unsigned int v26;
  int v27;
  _BOOL4 v28;

  v25 = v24 < v21;
  *(_BYTE *)(a19 - 0x24DFB20F49F75446 + (a6 + a4)) = *(_BYTE *)(a5 + (a2 + v19 + 85));
  v26 = a3 + v19 + 1;
  v27 = v25 ^ (v26 < a1);
  v28 = v26 < v20;
  if (!v27)
    v25 = v28;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * ((771 * v25) ^ (3 * (v22 ^ 0x391)))) - 8))();
}

void sub_218EE8E20()
{
  JUMPOUT(0x218EE8DC8);
}

uint64_t sub_218EE8E30@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((((a1 - 2100481492) & 0x7D32CEFF ^ 0x2BB) * (v1 == v2)) ^ a1))
                            - ((a1 + 235200210) & 0xF1FB1FDF ^ 0x49)))();
}

void sub_218EE8E90()
{
  JUMPOUT(0x218EE8EB0);
}

uint64_t sub_218EE907C(int a1, uint64_t a2, int a3, double a4, int8x16_t a5, int32x4_t a6, int8x16_t a7)
{
  int32x4_t *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint8x16_t v19;
  uint16x8_t v20;
  int8x16_t v21;
  uint16x8_t v22;
  int8x16_t v23;
  uint8x16_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  uint8x16_t v31;
  int8x16_t v34;
  int8x16_t v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  char *v44;
  unsigned int v45;
  int v46;
  int8x16x4_t v48;

  v48 = vld4q_s8(v18);
  v19 = (uint8x16_t)veorq_s8(v48.val[0], a5);
  v20 = vmovl_high_u8(v19);
  v21 = (int8x16_t)vmovl_high_u16(v20);
  v22 = vmovl_u8(*(uint8x8_t *)v19.i8);
  v23 = (int8x16_t)vmovl_high_u16(v22);
  v24 = (uint8x16_t)veorq_s8(v48.val[1], a5);
  v25 = vmovl_u8(*(uint8x8_t *)v24.i8);
  v26 = vmovl_high_u8(v24);
  v27 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v25.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v22.i8));
  v28 = vorrq_s8((int8x16_t)vshll_high_n_u16(v25, 8uLL), v23);
  v29 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v26.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v20.i8));
  v30 = vorrq_s8((int8x16_t)vshll_high_n_u16(v26, 8uLL), v21);
  v31 = (uint8x16_t)veorq_s8(v48.val[2], a5);
  _Q21 = (int8x16_t)vmovl_high_u8(v31);
  _Q20 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v31.i8);
  v34 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL);
  __asm { SHLL2           V20.4S, V20.8H, #0x10 }
  v39 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
  __asm { SHLL2           V21.4S, V21.8H, #0x10 }
  v48.val[0] = veorq_s8(v48.val[3], a5);
  v48.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v48.val[0].i8);
  v48.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v48.val[0]);
  v48.val[2] = vorrq_s8(vorrq_s8(v27, v34), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v48.val[1].i8), 0x18uLL));
  v48.val[1] = vorrq_s8(vorrq_s8(v28, _Q20), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v48.val[1]), 0x18uLL));
  v48.val[3] = vorrq_s8(vorrq_s8(v29, v39), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v48.val[0].i8), 0x18uLL));
  v48.val[0] = vorrq_s8(vorrq_s8(v30, _Q21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v48.val[0]), 0x18uLL));
  v7[2] = vaddq_s32(vsubq_s32((int32x4_t)v48.val[3], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v48.val[3], (int32x4_t)v48.val[3]), a7)), a6);
  v7[3] = vaddq_s32(vsubq_s32((int32x4_t)v48.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v48.val[0], (int32x4_t)v48.val[0]), a7)), a6);
  *v7 = vaddq_s32(vsubq_s32((int32x4_t)v48.val[2], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v48.val[2], (int32x4_t)v48.val[2]), a7)), a6);
  v7[1] = vaddq_s32(vsubq_s32((int32x4_t)v48.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v48.val[1], (int32x4_t)v48.val[1]), a7)), a6);
  v40 = v9;
  v41 = v10;
  v42 = v8 - 148;
  v43 = (a3 ^ v14)
      - 840376084
      + ((a1 ^ v17) & (v10 ^ (v14 + ((v8 - 334) ^ 0x4E8) - 1213)) | (a1 ^ v14) & (v40 ^ v14))
      + *((_DWORD *)*(&off_24DA380E0 + (int)((v8 - 334) & 0xB61B292A)) + v15 + 1430380004)
      + (v7->i32[(*((_BYTE *)*(&off_24DA380E0 + ((v8 - 334) ^ 0xCB)) + v15 + 1430379996) - 113)] ^ v12);
  v44 = (char *)*(&off_24DA380E0 + v8 - 295) - 4;
  v45 = (v43 + v14 - (v11 & (2 * v43))) ^ v14;
  v46 = ((v45 << (v44[v15 + 1430380004] - 80)) | (v45 >> (80 - v44[v15 + 1430380004]))) + (a1 ^ v14);
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8
                                                                             * ((1064 * (v16 == 1430379989)) ^ v42))
                                                           - 8))(v46 + v14 - (v11 & (2 * v46)), a2, v41);
}

uint64_t sub_218EE9340@<X0>(int a1@<W0>, uint64_t a2@<X3>, int a3@<W6>, int a4@<W7>, int a5@<W8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;

  v18 = (a1 ^ v12) & (v14 ^ 0x604 ^ (v12 - 393) ^ a3) | (a5 ^ v12) & (a3 ^ v16);
  v19 = *(_DWORD *)(v6 + 4 * (*(_BYTE *)(v17 + v7 + v13) - 113)) ^ v10;
  v20 = (a4 ^ v12)
      + v8
      + v18
      + *(_DWORD *)(v5 + 4 * (v7 + v13))
      + v19
      + v12
      - (v9 & (2 * ((a4 ^ v12) + v8 + v18 + *(_DWORD *)(v5 + 4 * (v7 + v13)) + v19)));
  v21 = (((v20 ^ v12) << (*(_BYTE *)(a2 + v7 + v13) - 80)) | ((v20 ^ v12) >> (80 - *(_BYTE *)(a2 + v7 + v13))))
      + (a1 ^ v12);
  return (*(uint64_t (**)(_QWORD))(v11 + 8 * ((118 * (v7 + 1 == v15 + 32)) ^ v14)))(v12 + v21 - (v9 & (2 * v21)));
}

uint64_t sub_218EE9414(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  int v22;

  v20 = (v9 ^ v16)
      + v7
      + *(_DWORD *)(v5 + 4 * (v10 + v17))
      + (((a1 ^ a5) + v16 - (v13 & (2 * (a1 ^ a5)))) ^ v11)
      + (*(_DWORD *)(v6 + 4 * ((v8 ^ v12) + *(_BYTE *)(v19 + v10 + v17) + 24)) ^ v14);
  v21 = (v20 + v16 - (v13 & (2 * v20))) ^ v16;
  v22 = ((v21 << (*(_BYTE *)(a4 + v10 + v17) - 80)) | (v21 >> (80 - *(_BYTE *)(a4 + v10 + v17)))) + (a1 ^ v16);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v15 + 8 * ((75 * (v10 + 1 != v18 + 48)) ^ v8)) - 8))(v22 + v16 - (v13 & (2 * v22)));
}

uint64_t sub_218EE94E0@<X0>(int a1@<W0>, int a2@<W2>, uint64_t a3@<X3>, int a4@<W6>, int a5@<W8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;

  v19 = a1 ^ v13;
  v20 = ((v19 | a5 ^ v17) + v13 - (((v19 | a5 ^ v17) << ((v15 + 0x80) & 0x5D ^ 0x54)) & v10)) ^ a4;
  v21 = *(_DWORD *)(v6 + 4 * (*(_BYTE *)(v18 + v7 + v14) - 113)) ^ v11;
  v22 = (a2 ^ v13)
      + v8
      + *(_DWORD *)(v5 + 4 * (v7 + v14))
      + v20
      + v21
      + v13
      - (v10 & (2 * ((a2 ^ v13) + v8 + *(_DWORD *)(v5 + 4 * (v7 + v14)) + v20 + v21)));
  v23 = (((v22 ^ v13) << (*(_BYTE *)(a3 + v7 + v14) - 80)) | ((v22 ^ v13) >> (80 - *(_BYTE *)(a3 + v7 + v14)))) + v19;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v12 + 8 * (((v7 + 1 != v16 + 64) * v9) ^ v15)) - 8))(v23 + v13 - (v10 & (2 * v23)));
}

void sub_218EE95C4()
{
  JUMPOUT(0x218EE9C3CLL);
}

uint64_t sub_218EE9658@<X0>(int a1@<W1>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;

  v8 = (unsigned __int8 *)(v7 + a3 + v6);
  v9 = ((*v8 ^ a2) << (a1 ^ 0xA1)) | ((v8[1] ^ a2) << 16) | ((v8[2] ^ a2) << 8);
  *(_DWORD *)(v3 + a3 + v6) = (v9 | v8[3] ^ a2) + v4 - 2 * ((v9 | v8[3] ^ a2) & 0x6747457F ^ (v8[3] ^ a2) & 0x19);
  return (*(uint64_t (**)(void))(v5 + 8 * ((994 * ((unint64_t)(a3 + 4 + v6) > 0x3F)) ^ a1)))();
}

uint64_t sub_218EE96F0(int8x16_t a1, int8x16_t a2, int32x4_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int32x4_t *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  int v27;
  uint8x16_t v28;
  uint16x8_t v29;
  uint16x8_t v30;
  uint8x16_t v31;
  uint8x16_t v40;
  uint16x8_t v41;
  uint16x8_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  __int32 *v47;
  int v48;
  int v49;
  int v50;
  unint64_t v51;
  int8x16x4_t v53;

  v53 = vld4q_s8(v26);
  v27 = (a20 - 375560166) & 0x166294DF;
  v28 = (uint8x16_t)veorq_s8(v53.val[0], a2);
  v29 = vmovl_u8(*(uint8x8_t *)v28.i8);
  v30 = vmovl_high_u8(v28);
  v31 = (uint8x16_t)veorq_s8(v53.val[1], a2);
  _Q21 = vmovl_u8(*(uint8x8_t *)v31.i8);
  _Q20 = vmovl_high_u8(v31);
  __asm
  {
    SHLL2           V22.4S, V20.8H, #0x10
    SHLL2           V23.4S, V21.8H, #0x10
  }
  v40 = (uint8x16_t)veorq_s8(v53.val[2], a2);
  v41 = vmovl_high_u8(v40);
  v42 = vmovl_u8(*(uint8x8_t *)v40.i8);
  v53.val[0] = veorq_s8(v53.val[3], a2);
  v53.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v53.val[0]);
  v53.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v53.val[1]);
  v53.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v53.val[1].i8);
  v53.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v53.val[0].i8);
  v53.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v53.val[0]);
  v53.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v53.val[0].i8);
  v43 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v42.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v29.i8), 0x18uLL)), v53.val[0]);
  v44 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v42, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v29), 0x18uLL)), v53.val[3]);
  v45 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v41.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v30.i8), 0x18uLL)), v53.val[1]);
  v46 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q22, (int8x16_t)vshll_high_n_u16(v41, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v30), 0x18uLL)), v53.val[2]);
  v53.val[0] = veorq_s8(vandq_s8((int8x16_t)v43, a1), (int8x16_t)(*(_OWORD *)v53.val & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
  v53.val[3] = veorq_s8(vandq_s8((int8x16_t)v44, a1), (int8x16_t)(*(_OWORD *)&v53.val[3] & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
  v53.val[1] = veorq_s8(vandq_s8((int8x16_t)v45, a1), (int8x16_t)(*(_OWORD *)&v53.val[1] & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
  v53.val[2] = veorq_s8(vandq_s8((int8x16_t)v46, a1), (int8x16_t)(*(_OWORD *)&v53.val[2] & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
  v20[2] = vaddq_s32(vsubq_s32(v45, vaddq_s32((int32x4_t)v53.val[1], (int32x4_t)v53.val[1])), a3);
  v20[3] = vaddq_s32(vsubq_s32(v46, vaddq_s32((int32x4_t)v53.val[2], (int32x4_t)v53.val[2])), a3);
  *v20 = vaddq_s32(vsubq_s32(v43, vaddq_s32((int32x4_t)v53.val[0], (int32x4_t)v53.val[0])), a3);
  v20[1] = vaddq_s32(vsubq_s32(v44, vaddq_s32((int32x4_t)v53.val[3], (int32x4_t)v53.val[3])), a3);
  v47 = &v20[4].i32[v25 + v24];
  v48 = *(v47 - 8) ^ *(v47 - 3);
  v49 = v48 + v22 - ((v21 + (v27 ^ 0x359) - 780) & (2 * v48));
  v50 = *(v47 - 16) ^ *(v47 - 14);
  HIDWORD(v51) = v50 ^ 0x67474566 ^ v49;
  LODWORD(v51) = v50 ^ ~v49;
  *v47 = (v51 >> 31) + v22 - (v21 & (2 * (v51 >> 31)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * ((263 * (v25 + 17 == v25 + 80)) ^ (v27 + 438))) - 12))();
}

uint64_t sub_218EE98C4@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  int v19;

  HIDWORD(v18) = a3 ^ v10;
  LODWORD(v18) = a3 ^ v15;
  v19 = ((a1 ^ v17) & (v7 ^ v12) | (a1 ^ v12) & (v6 ^ v12))
      + (v18 >> 27)
      + ((23 * (v14 ^ 0x301)) ^ (v12 + 233) ^ v4)
      + (*(_DWORD *)(v5 + 4 * (a4 + v13)) ^ v9);
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v11 + 8 * ((29 * (a4 + 1 == v16 + 20)) ^ v14))
                                                           - 12))(a3, a2, v19 - ((2 * v19 + 889516850) & v8) + 186589114);
}

uint64_t sub_218EE999C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((94 * (a7 + 1 != v8 + 40)) ^ a4)) - 8))();
}

uint64_t sub_218EE9A50@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;

  v17 = v6;
  HIDWORD(v18) = a3 ^ v11;
  LODWORD(v18) = a3 ^ v15;
  v19 = ((v17 ^ v13 | a1 ^ v13) & ((a4 + 18) ^ (v13 + 251) ^ a5) | (v17 ^ v13) & (a1 ^ v13))
      + (v8 ^ v13)
      + (v18 >> 27)
      + (*(_DWORD *)(v5 + 4 * (v7 + v14)) ^ v10);
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v12 + 8 * ((22 * (v7 + 1 == v16 + 60)) ^ a4))
                                                           - 8))(v17, a2, v19 - ((2 * v19 + 506952120) & v9) + 1069048573);
}

uint64_t sub_218EE9B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((786 * (a5 + 1 == v7 + 80)) ^ v5)) - 8))();
}

void sub_218EE9BD4(int a1@<W7>, char a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  int v11;
  int v12;

  *a11 = (*a11 ^ v12) + (a1 ^ v12) + v12 - ((((*a11 ^ v12) + (a1 ^ v12)) << (((a2 - 32) & 0xFD) - 84)) & v11);
  JUMPOUT(0x218EE9C34);
}

uint64_t sub_218EE9CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,unsigned int a25,unsigned int a26)
{
  uint64_t v26;
  int v27;
  unsigned int v28;
  _BOOL4 v29;

  if (v28 < a25 != (a15 - 711502142) < 0xE71DD73E)
    v29 = (a15 - 711502142) < 0xE71DD73E;
  else
    v29 = (int)a15 - 711502142 > a26;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 + 8 * ((2038 * !v29) ^ (v27 + 890))) - (a23 ^ 7)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

void sub_218EE9D74()
{
  JUMPOUT(0x218EE8F90);
}

uint64_t sub_218EE9D98@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W6>, uint64_t a4@<X7>, int a5@<W8>)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v7 + (a1 + a5 + 403)) = *(_BYTE *)(a2 + a4 - 294027452);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((808 * (a3 + a5 + 1 < 23 * ((37 * (v5 ^ 0x2B4)) ^ 0x194u) - 5)) ^ (37 * (v5 ^ 0x2B4))))
                            - 12))();
}

void sub_218EE9E08()
{
  JUMPOUT(0x218EE9DC8);
}

uint64_t sub_218EE9E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49)
{
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  _BOOL4 v53;

  v52 = *(_DWORD *)(&a37 + ((v50 - 1590403578) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a13 + (v50 - 1590403578)) = (HIBYTE(v52) ^ 0xB0)
                                                     - 2
                                                     * ((HIBYTE(v52) ^ 0xB0) & 0x16 ^ HIBYTE(v52) & ((5 * (v49 ^ 0xFD)) ^ 0x57))
                                                     - 108;
  *(_BYTE *)(a13 + (v50 - 1590403576)) = (BYTE1(v52) ^ 0xA6) - ((2 * (BYTE1(v52) ^ 0xA6)) & 0x28) - 108;
  *(_BYTE *)(a13 + (v50 - 1590403575)) = v52 ^ 0xB5;
  *(_BYTE *)(a13 + (v50 - 1590403577)) = (BYTE2(v52) ^ 0x9C)
                                                     + ~(2 * ((BYTE2(v52) ^ 0x9C) & 0x16 ^ BYTE2(v52) & 2))
                                                     - 107;
  if ((v50 + 348368959) < 0x738F5235 != (a49 + 257091786) < 0x738F5235)
    v53 = (a49 + 257091786) < 0x738F5235;
  else
    v53 = v50 + 348368959 < (a49 + 257091786);
  return ((uint64_t (*)(void))(*(_QWORD *)(v51 + 8 * ((928 * !v53) ^ v49)) - 12))();
}

uint64_t sub_218EE9F38(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 1334103649 * ((2 * (a1 & 0x94E3C831) - a1 + 1797011406) ^ 0x3B4FF60);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DA380E0 + v1 - 500)
                              + ((431 * (*(_QWORD *)a1 != 0x55EB610BFF126328)) ^ v1)
                              - 1)
                            - 12))();
}

uint64_t sub_218EE9FD8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  char v6;
  int v7;
  char v8;

  v3 = *(_DWORD *)(result + 12) ^ v2;
  v4 = (HIBYTE(v3) ^ 0x68) - ((2 * (HIBYTE(v3) ^ 0x68)) & 0x18A) + 69;
  v5 = (HIWORD(v3) ^ 0xFFFFFFF6) - ((2 * (HIWORD(v3) ^ 0xFFFFFFF6)) & 0xFFFFFF8A) + 69;
  v6 = ((v3 & 0xF ^ 0xF9) + ((2 * v3) | 0xEC) - 117) ^ 0x26;
  *(_BYTE *)(a2 - 0x55EB610BFF126328) = (((2 * v6) | 0x1C) - v6 - 14) ^ 0xF0;
  *(_BYTE *)(a2 - 0x55EB610BFF126327) = ((v3 & 0xF0) >> 4) ^ 0xA1;
  v7 = ((v3 >> 8) ^ 0x18) - ((v3 >> 7) & 0x1FFFF8A) + 69;
  v8 = (((2 * (v7 & 0xF ^ 5)) | 0xEC) - (v7 & 0xF ^ 5) - 118) ^ 0x26;
  *(_BYTE *)(a2 - 0x55EB610BFF126326) = (((2 * v8) | 0x1C) - v8 - 14) ^ 0xF0;
  *(_BYTE *)(a2 - 0x55EB610BFF126325) = (v7 >> 4) ^ 0xAA;
  LOBYTE(v7) = (((2 * (v5 & 0xF ^ 5)) | 0xEC) - (v5 & 0xF ^ 5) - 118) ^ 0x26;
  *(_BYTE *)(a2 - 0x55EB610BFF126324) = (((2 * v7) | 0x1C) - v7 - 14) ^ 0xF0;
  *(_BYTE *)(a2 - 0x55EB610BFF126323) = (v5 >> 4) ^ 0xAA;
  LOBYTE(v7) = (((2 * (v4 & 0xF ^ 5)) | 0xEC) - (v4 & 0xF ^ 5) - 118) ^ 0x26;
  *(_BYTE *)(a2 - 0x55EB610BFF126322) = (((2 * v7) | 0x1C) - v7 - 14) ^ 0xF0;
  *(_BYTE *)(a2 - 0x55EB610BFF126321) = (v4 >> 4) ^ 0xAA;
  *(_DWORD *)(result + 8) = 280600939;
  return result;
}

uint64_t sub_218EEA1BC(uint64_t result)
{
  *(_DWORD *)(result + 8) = 280558039;
  return result;
}

void sub_218EEA1CC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) - 1477295531 * (((a1 | 0x17F008B6) - a1 + (a1 & 0xE80FF749)) ^ 0x20FB3DE5);
  __asm { BR              X16 }
}

uint64_t sub_218EEA2F8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((v0 - 427) ^ 0x131)
                                          * (((v1 << ((v0 - 11) | 0x40)) & 0xFF9A25BE ^ 0x3D822510)
                                           + (v1 ^ 0x610C6457)
                                           - 1116012738 != 1028133405)) ^ (v0 - 1005)))
                            - 12))();
}

uint64_t sub_218EEA374(int a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1815
                                * (((a1 + v3 - 2144146143 < 13 * (a3 ^ 0x30Eu) - 187) ^ (43 * (a3 ^ 5) + 1)) & 1)) ^ a3)))();
}

uint64_t sub_218EEA3D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8 * (int)((((a4 ^ 0xFFFFFD16) + a4 + 1001) * (a6 >> 4 == 134009134)) ^ a4))
                            - 12))();
}

uint64_t sub_218EEA410(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v21;
  unint64_t v22;
  int v24;

  v11 = a4 ^ 0x2B8;
  v12 = (((a4 ^ 0x2B8) + 328) | 0x3Cu) + 173;
  v13 = (a1 + v8 + a2);
  v14 = v13 + v4;
  v15 = v13 + v10;
  v16 = (a1 + v8) & 0xF;
  v17 = v16 + v6 - v15;
  v18 = (v16 | v7) - v15;
  v19 = (v16 | v5) - v15;
  v21 = (unint64_t)(v14 - v15) > 0xF && v17 >= (v12 ^ 0x4BCuLL) && (unint64_t)(v18 + 2) > 0xF;
  v22 = v19 + 1;
  v24 = v21 && v22 > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((241 * v24) ^ v11)) - 4))();
}

uint64_t sub_218EEA494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((2041 * (v8 < ((2 * a8) ^ 0x62Cu) - 450)) ^ a8))
                            - ((a8 - 178) ^ 0x341)))();
}

uint64_t sub_218EEA4D0(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  *(_DWORD *)(v11 - 204) = v8 + 9;
  v17.val[1].i64[0] = v8 & 0xF;
  v17.val[1].i64[1] = ((_BYTE)v8 - 1) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)v8 + 14) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)v8 + 13) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)v8 + 12) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)v8 + 11) & 0xF;
  v12 = STACK[0x278];
  v13.i64[0] = 0x8F8F8F8F8F8F8F8FLL;
  v13.i64[1] = 0x8F8F8F8F8F8F8F8FLL;
  v17.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v10 + (_BYTE)a2) & 0xF;
  v17.val[0].i64[1] = ((_BYTE)v8 + 1) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_218F1D020).u64[0];
  v18.val[0].i64[1] = *(_DWORD *)(v11 - 204) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)v8 + 7) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)v8 + 5) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v8 + 3) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)v8 + 10) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)v8 + 8) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)v8 + 6) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v8 + 4) & 0xF;
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_218F1D020).u64[0];
  v15 = vrev64q_s8(vmulq_s8(v14, v13));
  *(int8x16_t *)(*(_QWORD *)(v11 - 200) - 15 + (a1 + v10 + a2)) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v6 + v17.val[0].i64[0] - 15), *(int8x16_t *)(v4 - 15 + (a1 + v10 + a2))), veorq_s8(*(int8x16_t *)(v17.val[0].i64[0] + v7 - 13), *(int8x16_t *)(v17.val[0].i64[0] + v5 - 14))), vextq_s8(v15, v15, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12
                                        + 8
                                        * ((((v9 & 0xFFFFFFF0) == 16) * (((a4 - 1151134995) & 0x449CEBFF) + 507)) ^ a4))
                            - 12))();
}

void sub_218EEA644()
{
  JUMPOUT(0x218EEA5CCLL);
}

uint64_t sub_218EEA650()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (v0 ^ (89 * (v1 != 0x1EC17688)))) - 12))(1947537492);
}

uint64_t sub_218EEA69C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  v12 = v7 > 0xACBE721B;
  v13 = 3 * (v5 ^ 0x1F4);
  *(_BYTE *)(v11 + (v13 ^ 0x8BEAEC4D) + a1) = *(_BYTE *)(v3
                                                       + ((((3 * (v5 ^ 0xF4)) ^ 0x4D) + (_BYTE)a1) & 0xF)) ^ *(_BYTE *)(v1 + (v13 ^ 0x8BEAEC4D) + a1) ^ *(_BYTE *)(((((3 * (v5 ^ 0xF4)) ^ 0x4D) + (_BYTE)a1) & 0xF) + v4 + 2) ^ *(_BYTE *)((((v13 ^ 0x8BEAEC4D) + a1) & 0xFLL) + v2 + 1) ^ (-113 * (((v13 ^ 0x4D) + a1) & 0xF));
  v14 = a1 - 550732399;
  v15 = (a1 + 1);
  v16 = v12 ^ (v14 < v6);
  v17 = v14 < v8;
  if (!v16)
    v12 = v17;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10 + 8 * ((v12 * v9) ^ v5)) - 12))(v15);
}

uint64_t sub_218EEA740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * ((1454 * (((v7 == v9) ^ (75 * (a7 ^ 0xBC))) & 1)) ^ a7))
                            - 12))();
}

uint64_t sub_218EEA77C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8
                                   * ((((((a7 ^ 0x26B) - 716) & v7) == 0) * (46 * (a7 ^ 0xA5) - 727)) ^ a7 ^ 0x26B)))();
}

uint64_t sub_218EEA7BC(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  char v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  int8x16x4_t v20;

  *(_DWORD *)(v16 - 208) = v11 & 0xFFFFFFF8;
  *(_DWORD *)(v16 - 204) = v11;
  v17 = v12 + a1 + v13;
  v18 = (a1 + v13 + a2 - v14);
  v20.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v13 + (_BYTE)a2 - (_BYTE)v14) & 0xF;
  v20.val[0].i64[1] = (v17 + 1 - (_BYTE)v14) & 0xF;
  v20.val[1].i64[0] = (v10 - (_BYTE)v14) & 0xF;
  v20.val[1].i64[1] = (v17 + 15 - (_BYTE)v14) & 0xF;
  v20.val[2].i64[0] = (v17 + 14 - (_BYTE)v14) & 0xF;
  v20.val[2].i64[1] = (v17 + 13 - (_BYTE)v14) & 0xF;
  v20.val[3].i64[0] = (v17 + 12 - (_BYTE)v14) & 0xF;
  v20.val[3].i64[1] = (v10 - (_BYTE)v14 + (((a6 - 65) | 0xB3) ^ 4)) & 0xF;
  *(int8x8_t *)(v15 - 7 + v18) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v8 + (v18 & 0xF) - 7), *(int8x8_t *)(v6 - 7 + v18)), veor_s8(*(int8x8_t *)((v18 & 0xF) + v9 - 5), *(int8x8_t *)((v18 & 0xF) + v7 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v20, (int8x16_t)xmmword_218F1D030), (int8x8_t)0x8F8F8F8F8F8F8F8FLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(STACK[0x278]
                                                     + 8 * ((1941 * (-(v11 & 0xFFFFFFF8) == -8 - v14)) ^ a6))
                                         - 4))((__n128)xmmword_218F1D030);
}

void sub_218EEA908()
{
  JUMPOUT(0x218EEA818);
}

uint64_t sub_218EEA910()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((((3 * (v0 ^ 0x1F4) + 629533467) & 0xDA7A15AF) - 1072)
                                               * (*(_DWORD *)(v2 - 204) != *(_DWORD *)(v2 - 208))) ^ v0))
                            - 12))();
}

uint64_t sub_218EEA960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)(v13 + (a5 - 1028133406)) = *(_BYTE *)(v9 + ((a5 - 1028133406) & 0xFLL)) ^ *(_BYTE *)(v7 + (a5 - 1028133406)) ^ *(_BYTE *)((((_BYTE)a5 - 30) & 0xF) + v10 + 2) ^ *(_BYTE *)((((_BYTE)a5 - 30) & 0xF) + v8 + 1) ^ (-113 * ((a5 - 30) & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((14 * (a5 - 1 != (a7 ^ 0x74D ^ v11))) ^ (a7 - 506))) - 4))();
}

uint64_t sub_218EEA9D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *(_QWORD *)(v4 + 24);
  *(int8x16_t *)(v7 - 192) = veorq_s8(*(int8x16_t *)*(_QWORD *)(v4 + 40), (int8x16_t)xmmword_218F1D060);
  *(int8x16_t *)(v7 - 176) = veorq_s8(*(int8x16_t *)(v8 - 0x73DCADE8D2E91DBELL), (int8x16_t)xmmword_218F1D070);
  return (*(uint64_t (**)(void))(v5 + 8 * (a4 ^ (25 * (v7 - 192 == v6)))))();
}

uint64_t sub_218EEAA3C()
{
  int v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(v3 - 160) = *v2;
  *(_BYTE *)(v3 - 159) = v2[1];
  *(_BYTE *)(v3 - 158) = v2[2];
  *(_BYTE *)(v3 - 157) = v2[3];
  *(_BYTE *)(v3 - 156) = v2[4];
  *(_BYTE *)(v3 - 155) = v2[5];
  *(_BYTE *)(v3 - 154) = v2[6];
  *(_BYTE *)(v3 - 153) = v2[7];
  *(_BYTE *)(v3 - 152) = v2[8];
  *(_BYTE *)(v3 - 151) = v2[9];
  *(_BYTE *)(v3 - 150) = v2[10];
  *(_BYTE *)(v3 - 149) = v2[11];
  *(_BYTE *)(v3 - 148) = v2[12];
  *(_BYTE *)(v3 - 147) = v2[13];
  *(_BYTE *)(v3 - 146) = v2[14];
  v4 = (v0 - 545);
  *(_BYTE *)(v3 - 145) = v2[15];
  if (v2)
    v5 = v3 == 160;
  else
    v5 = 1;
  v6 = v5;
  v7 = *(_QWORD *)(v1 + 8 * ((v6 * (5 * (v0 ^ 0x463) - 690)) ^ v0));
  STACK[0x270] = v4;
  LODWORD(STACK[0x26C]) = -42900;
  return ((uint64_t (*)(void))(v7 - v4 + 708))();
}

uint64_t sub_218EEAB04()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  int v6;
  uint64_t (*v7)(void);

  v4 = (v0 - 545);
  if (v2)
    v5 = v3 == 192;
  else
    v5 = 1;
  v6 = v5;
  v7 = (uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v6 * (5 * (v0 ^ 0x463) - 690)) ^ v0)) - v4 + 708);
  LODWORD(STACK[0x26C]) = -42900;
  STACK[0x270] = v4;
  return v7();
}

uint64_t sub_218EEAB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28)
{
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  unint64_t v33;
  _BOOL4 v35;
  uint64_t (*v36)(void);

  v31 = a28 - ((2 * a28 + 32348330) & 0x1A44067E) + 1310248852;
  v32 = ((2 * v31) & 0x7FFEFBAA ^ v28 ^ 0x1A4406C7) + (v31 ^ 0x32DD7EEA);
  v33 = (v29 + 251666728) & 0xF0FFDEDD;
  v35 = (((_BYTE)v32 + (v29 ^ 0x7C) + 81) & 0xF) == 0 && v32 != -1073775147;
  STACK[0x270] = v33;
  v36 = (uint64_t (*)(void))(*(_QWORD *)(v30 + 8 * (int)((v35 * (v33 + 829)) ^ v29)) - 12);
  LODWORD(STACK[0x26C]) = -42899;
  return v36();
}

#error "218EF0A8C: call analysis failed (funcsize=5672)"

void sub_218EF0A90()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 208) = LODWORD(STACK[0x280]) ^ 0x47E39D51;
  *(_DWORD *)(v0 - 216) = LODWORD(STACK[0x284]) ^ 0xBB70C197;
  *(_DWORD *)(v0 - 220) = LODWORD(STACK[0x288]) ^ 0xDC959CC;
  *(_DWORD *)(v0 - 212) = LODWORD(STACK[0x290]) ^ 0x83250FCE;
  JUMPOUT(0x218EEEA8CLL);
}

uint64_t sub_218EF0AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,uint64_t a28,int a29)
{
  uint64_t v29;
  int v30;

  v30 = a29 - ((2 * a27) & 0xCBE78674) + (((STACK[0x270] - 680) | 0x21B) ^ (STACK[0x270] - 1494578460));
  return ((uint64_t (*)(void))(*(_QWORD *)(v29
                                        + 8
                                        * (int)((459
                                               * (((2 * v30) & 0x7D2BFEE ^ 0x3C28664) + (v30 ^ 0xE61A9CCD) - 44046945 != 21579158)) ^ STACK[0x270]))
                            - 12))();
}

uint64_t sub_218EF0BAC(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((v1 - 487806289) & 0x1D1357BD ^ 0x4D7)
                                          * ((a1 + v2 - 65626103) < 8)) ^ v1))
                            - ((v1 + 5) ^ 0x24CLL)))();
}

uint64_t sub_218EF0C40(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((a4 ^ 0x4C8) * ((a2 + a7 - 16) > 0xFFFFFFEF)) ^ a4))
                            - ((a4 + 616) ^ 0x4A4)))();
}

uint64_t sub_218EF0C7C(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BOOL4 v23;
  int v26;

  v10 = a4 ^ 0x2D0;
  v11 = 598 * (a4 ^ 0x246);
  v12 = (a1 + v7 + a2);
  v13 = v12 + v9 + 1;
  v14 = (v11 ^ 0x4A3) & v12;
  v15 = v5 + v14 - v12;
  v16 = v5 + v14 + 1;
  v17 = v14 + 1 - v12;
  v18 = v6 + v17;
  v14 += 2;
  v19 = v6 + v14;
  v20 = v4 + v17;
  v21 = v4 + v14;
  v23 = v16 > v9 && v15 < v13;
  if (v19 > v9 && v18 < v13)
    v23 = 1;
  v26 = v21 > v9 && v20 < v13 || v23;
  return (*(uint64_t (**)(void))(v8 + 8 * ((1075 * (v26 ^ 1)) ^ v10)))();
}

uint64_t sub_218EF0D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v8
                                                                      + 8
                                                                      * (((v7 >= (((a7 ^ 7) - 1610331303) & 0x5FFBB797u)
                                                                               - 884)
                                                                        * ((((a7 ^ 7) - 78) | 0x292) ^ 0x37C)) ^ a7 ^ 7)))(a1, a2, a3, 0);
}

uint64_t sub_218EF0D68(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  int8x16_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  v17.val[1].i64[0] = ((_BYTE)a3 + 6) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)a3 + 5) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)a3 + 4) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)a3 + 3) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)a3 + 2) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)a3 + 1) & 0xF;
  v11 = STACK[0x278];
  v12.i64[0] = 0x2121212121212121;
  v12.i64[1] = 0x2121212121212121;
  v13 = (a3 + v5);
  v17.val[0].i64[0] = ((_BYTE)a3 + (_BYTE)v5) & 0xF;
  v17.val[0].i64[1] = ((_BYTE)a3 + 7) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_218F1D020).u64[0];
  v18.val[0].i64[1] = ((_BYTE)a3 - 1) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)a3 + 13) & 0xF;
  v18.val[2].i64[1] = (a3 + 11) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)a3 + 9) & 0xF;
  v18.val[0].i64[0] = a3 & 0xF;
  v18.val[1].i64[0] = ((_BYTE)a3 + 14) & 0xF;
  v18.val[2].i64[0] = (a3 + 12) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)a3 + 10) & 0xF;
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_218F1D020).u64[0];
  v15 = vrev64q_s8(vmulq_s8(v14, v12));
  *(int8x16_t *)(*(_QWORD *)(v10 - 200) - 15 + v13) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v7 + (v13 & 0xF) - 15), *(int8x16_t *)(*(_QWORD *)(v10 - 200) - 15 + v13)), veorq_s8(*(int8x16_t *)(v8 + (v13 & 0xF) + 1 - 15), *(int8x16_t *)(v6 + (v13 & 0xF) + 1 - 15))), vextq_s8(v15, v15, 8uLL));
  return (*(uint64_t (**)(void))(v11 + 8 * ((50 * (((a5 - 527) | 0x204) - 700 == (v9 & 0xFFFFFFF0))) ^ a5)))();
}

uint64_t sub_218EF0ECC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((21 * (a7 ^ 0x2CB) + 1491) * (v7 != a4)) ^ a7))
                            - ((a7 - 1655890911) & 0x62B2E5BE ^ 0x4A0)))();
}

uint64_t sub_218EF0F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  char v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9 + 8 * (((((a8 ^ 0x43F) - 296) ^ 0x383) * ((v8 & 8) == 0)) ^ a8)))();
}

uint64_t sub_218EF0F4C(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  unsigned int v17;
  int8x16x4_t v19;

  *(_DWORD *)(v14 - 208) = v10;
  *(_DWORD *)(v14 - 204) = v15;
  *(_DWORD *)(v14 - 212) = v10 & 0xFFFFFFF8;
  v16 = v11 + a1 + v12 - a4;
  v17 = a1 + v12 + a2 - a4;
  *(_DWORD *)(v14 - 216) = a7 - 320;
  v19.val[0].i64[0] = v17 & 0xF;
  v19.val[0].i64[1] = (v16 - 120) & 0xF;
  v19.val[1].i64[0] = (v16 - 121) & 0xF;
  v19.val[1].i64[1] = (v16 - 122) & 0xF;
  v19.val[2].i64[0] = (v16 - 123) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)a1 + (_BYTE)v12 + (_BYTE)a7 + v11 - (_BYTE)a4) & 0xF;
  v19.val[3].i64[0] = (v16 - 125) & 0xF;
  v19.val[3].i64[1] = (v16 - 126) & 0xF;
  *(int8x8_t *)(v13 - 7 + v17) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v8 + v19.val[0].i64[0] - 7), *(int8x8_t *)(v13 - 7 + v17)), veor_s8(*(int8x8_t *)(v9 + v19.val[0].i64[0] + 1 - 7), *(int8x8_t *)(v7 + v19.val[0].i64[0] + 1 - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v19, (int8x16_t)xmmword_218F1D030), (int8x8_t)0x2121212121212121)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(STACK[0x278]
                                                     + 8 * ((1870 * (a4 - (v10 & 0xFFFFFFF8) == -8)) ^ a7))
                                         - 12))((__n128)xmmword_218F1D030);
}

void sub_218EF1088()
{
  JUMPOUT(0x218EF0FB8);
}

uint64_t sub_218EF1090()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (*(_DWORD *)(v1 - 216) ^ (455
                                                                  * (*(_DWORD *)(v1 - 208) == *(_DWORD *)(v1 - 212)))))
                            - 13 * (((*(_DWORD *)(v1 - 216) - 540) | 0x484) ^ 0x4F0u)
                            + 1188))();
}

uint64_t sub_218EF10DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = (a6 + v7);
  *(_BYTE *)(v12 + v13) ^= *(_BYTE *)(v9 + (v13 & 0xF)) ^ *(_BYTE *)(v10 + (v13 & 0xF) + 1) ^ *(_BYTE *)(v8 + (v13 & 0xF) + 1) ^ (v13 & 0xF | (32 * (v13 & 0xF)));
  return (*(uint64_t (**)(void))(v11 + 8 * ((103 * (a6 - 1 == v6)) ^ (a5 - 257))))();
}

void sub_218EF1134()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 647314198)
    v1 = 280600939;
  else
    v1 = 280558915;
  *(_DWORD *)(v2 + 8) = v1;
}

void sub_218EF1198(uint64_t a1)
{
  int v1;
  _BOOL4 v2;

  v1 = *(_DWORD *)(a1 + 16) ^ (1543459711 * ((-1684224306 - (a1 | 0x9B9CC6CE) + (a1 | 0x64633931)) ^ 0x28E13AF5));
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 8) + 1) == 111;
  __asm { BR              X10 }
}

uint64_t sub_218EF1260()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0x119)))(16, 962668376) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((747 * v3) ^ v0)) - 12))();
}

uint64_t sub_218EF12A8(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  int v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t result;
  _BYTE *v8;
  unsigned __int8 v9;
  unint64_t *v10;
  __int16 v11;
  unsigned int v12;

  v6 = *(_QWORD **)v1;
  v10 = &STACK[0x3DFA1ACB8D1A274A];
  v11 = 6485 - 32699 * ((2 * ((unsigned __int16)&v10 & 0xB8D0) - (unsigned __int16)&v10 + 18216) ^ 0x91A5);
  v12 = (v3 + 462) ^ (1663139771
                    * ((2 * (&v10 & 0x675DB8D0) - &v10 + 413288232) ^ 0x604B91A5));
  result = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(v4 + 8 * (v3 ^ 0x193)) - 8))(&v10);
  v2[130] = v9 % 0xAu - ((2 * (v9 % 0xAu)) & 0x1A) + 93;
  *(_DWORD *)(a1 + 3) = 16843609;
  *(_BYTE *)(a1 + 2) = 76;
  *(_WORD *)a1 = 20550;
  *(_BYTE *)(a1 + 7) = 0;
  *(_DWORD *)(a1 + 8) = 0x4000000;
  *(_WORD *)(a1 + 12) = 2;
  *(_BYTE *)(a1 + 14) = v2[130] & 3 ^ 1;
  *(_BYTE *)(a1 + 15) = -69;
  v2[1] = 112;
  v2[131] = 0;
  *v6 = a1;
  v8 = *(_BYTE **)(v1 + 24);
  **(_DWORD **)(v1 + 40) = 16;
  *v8 = 1;
  *(_DWORD *)(v1 + 56) = 280600939;
  return result;
}

void sub_218EF1418(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v3 = *(_QWORD *)(a1 + 16) != 0x31C5923AD179C032 && *(_QWORD *)a1 != 0x252C3BDA7CBE997ALL;
  v1 = *(_DWORD *)(a1 + 12) ^ (1663139771 * ((-2 - ((a1 | 0xF0401EDF) + (~(_DWORD)a1 | 0xFBFE120))) ^ 0x775637AD));
  __asm { BR              X11 }
}

uint64_t sub_218EF14CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  *(_DWORD *)(v1 - 0x31C5923AD179C032) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((*(unsigned __int8 *)(v3 - 0x252C3BDA7CBE9969) == 175) * (v2 ^ 0xA0)) ^ v2))
                            - 4))();
}

uint64_t sub_218EF1520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  unsigned __int16 v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(unsigned __int8 *)(v3 - 0x252C3BDA7CBE9972);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = (_QWORD *)(v3 - 0x252C3BDA7CBE9962);
  *v6 = v5;
  v6[1] = v5 + ((unint64_t)(v4 % 0x90u) << 8);
  return (*(uint64_t (**)(void))(a2 + 8 * (v2 ^ 0x77)))();
}

void sub_218EF15EC()
{
  JUMPOUT(0x218EF1578);
}

uint64_t sub_218EF15F8(uint64_t result)
{
  _DWORD *v1;

  *v1 = 36864;
  *(_DWORD *)(result + 8) = 280600939;
  return result;
}

void sub_218EF1614(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 12) + 1477295531 * (((a1 | 0x4B40B967) - a1 + (a1 & 0xB4BF4698)) ^ 0x7C4B8C34);
  __asm { BR              X10 }
}

void sub_218EF16D0()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 8) = 280558916;
}

void sub_218EF1764(_DWORD *a1)
{
  unsigned int v1;
  uint64_t v2;

  v1 = *a1 - 1334103649 * ((-2 - ((~(_DWORD)a1 | 0x5EEAECA9) + (a1 | 0xA1151356))) ^ 0x36422407);
  v2 = *((_QWORD *)*(&off_24DA380E0 + (int)(v1 - 445))
       + (int)((7
              * (((uint64_t (*)(uint64_t, uint64_t))*(&off_24DA380E0 + (int)(v1 ^ 0x268)))(12, 205473644) != 0)) | v1)
       - 1)
     - 8;
  __asm { BR              X8 }
}

uint64_t sub_218EF182C(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  char v5;
  char v6;
  _DWORD *v7;
  _QWORD *v8;

  v4 = *(_DWORD *)(v1 + 36) + v3;
  v5 = *(_BYTE *)(v1 + 17) + v3;
  v6 = *(_BYTE *)(v1 + 32);
  v7 = *(_DWORD **)(v1 + 24);
  v8 = *(_QWORD **)(v1 + 8);
  *(_BYTE *)(result + 4) = -125 * (*(_BYTE *)(v1 + 16) + v3) + 70;
  *(_BYTE *)(result + 5) = v3 + v6 - 124;
  *(_BYTE *)(result + 6) = 54 - 33 * v5;
  *(_BYTE *)(result + 7) = v4 ^ 0xBF;
  *(_DWORD *)(result + 8) = 0;
  *v8 = result;
  *v7 = v2;
  return result;
}

uint64_t sub_218EF18A4(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 515566439 * ((((2 * (a1 ^ 0xE5C15AB6)) | 0x9F90E754) - (a1 ^ 0xE5C15AB6) + 808946774) ^ 0x46DD2EBB);
  v2 = *(_DWORD *)(a1 + 12) ^ v1;
  return (*((uint64_t (**)(void))*(&off_24DA380E0 + v2 - 619)
          + ((((*(_DWORD *)(a1 + 8) + v1 - 1502915574) < 7)
            * ((((v2 + 250) ^ 0x1C) + 99) ^ ((v2 + 250) | 0x40))) ^ v2)
          - 1))();
}

uint64_t sub_218EF1948@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((13 * (v2 ^ 0x467) - 605) * (v1 > 0x1E)) ^ v2))
                            - ((v2 + 1956203367) & 0x8B66B35E ^ 0x31ALL)))();
}

uint64_t sub_218EF19A0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  char *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  int8x16x4_t v7;
  int8x16x4_t v8;
  int8x16x4_t v9;

  v4 = v2;
  v7 = vld4q_s8(v4);
  v5 = &v2[(a1 - 388371363) & 0x172613FE ^ 0x33ALL];
  v8.val[0] = v7.val[3];
  v8.val[1] = v7.val[2];
  v9 = vld4q_s8(v5);
  v8.val[2] = v7.val[1];
  v8.val[3] = v7.val[0];
  v7.val[0] = v9.val[3];
  v7.val[1] = v9.val[2];
  v7.val[2] = v9.val[1];
  v7.val[3] = v9.val[0];
  vst4q_s8(v4, v8);
  vst4q_s8(v5, v7);
  return (*(uint64_t (**)(void))(a2 + 8 * ((119 * ((v3 & 0x1FFFFFFE0) == 32)) ^ (a1 - 492))))();
}

void sub_218EF1A28()
{
  JUMPOUT(0x218EF19D4);
}

uint64_t sub_218EF1A34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(a1 + 8 * ((((42 * (v3 ^ 0x369)) ^ 0x409) * (v2 != v1)) ^ v3)))();
}

uint64_t sub_218EF1A64@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((55 * ((v1 & 0x18) == (((v2 ^ 0x722) - 582) | 0x121u) - 819)) ^ v2 ^ 0x722u))
                            - 4))();
}

uint64_t sub_218EF1AB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *v5;
  int8x8x4_t v7;
  int8x8x4_t v8;

  v5 = (char *)(v1 + 4 * v2);
  v7 = vld4_s8(v5);
  v8.val[0] = v7.val[3];
  v8.val[1] = v7.val[2];
  v8.val[2] = v7.val[1];
  v8.val[3] = v7.val[0];
  vst4_s8(v5, v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (int)((60
                                               * ((((((v4 + 1918776396) & 0x8DA1CB8F) - 782) | 0x320) ^ 0x329) + v2 != ((((v4 + 1918776396) & 0x8DA1CB8F) + 0x1FFFFFCE9) & v3))) ^ (v4 + 1918776396) & 0x8DA1CB8F))
                            - 8))();
}

uint64_t sub_218EF1B40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)(((((v2 - 797) | 0x400) + ((v2 + 477476894) & 0xE38A47DE) - 1735) * (v1 == v3)) ^ v2)))();
}

uint64_t sub_218EF1B84@<X0>(uint64_t a1@<X8>)
{
  int v1;
  char *v2;
  int v3;
  int v4;
  char v5;
  char v6;

  v4 = (v3 - 924) | 0x312;
  v5 = *v2;
  *v2 = v2[3];
  v2[3] = v5;
  v6 = v2[1];
  v2[1] = v2[2];
  v2[2] = v6;
  return (*(uint64_t (**)(void))(a1 + 8 * ((1918 * (((v4 ^ (v1 == 1502915574)) & 1) == 0)) ^ v4)))();
}

void sub_218EF1BE4()
{
  JUMPOUT(0x218EF1BA0);
}

uint64_t sub_218EF1BEC(_DWORD *a1)
{
  unsigned int v1;
  int v2;

  v1 = 1477295531 * ((((2 * (_DWORD)a1) | 0x91D7A040) - (_DWORD)a1 + 924069856) ^ 0xFFE0E573);
  v2 = *a1 ^ v1;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DA380E0 + v2 - 615)
                              + (((a1[4] - v1 - 884429979 < 7) * (((v2 - 410) | 0x41) - 394)) ^ v2)
                              - 1)
                            - ((v2 - 410) ^ 0x97u)
                            + 275))();
}

uint64_t sub_218EF1C94@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((188 * (((v1 < 0x1F) ^ (((v2 - 116) ^ 0xB9) + 1)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_218EF1CD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  int v3;
  char *v4;
  char *v5;
  int8x16x4_t v7;
  int8x16x4_t v8;
  int8x16x4_t v9;

  v4 = v2;
  v7 = vld4q_s8(v4);
  v5 = &v2[(v3 - 620) ^ 0xEELL];
  v8.val[0] = v7.val[3];
  v8.val[1] = v7.val[2];
  v9 = vld4q_s8(v5);
  v8.val[2] = v7.val[1];
  v8.val[3] = v7.val[0];
  v7.val[0] = v9.val[3];
  v7.val[1] = v9.val[2];
  v7.val[2] = v9.val[1];
  v7.val[3] = v9.val[0];
  vst4q_s8(v4, v8);
  vst4q_s8(v5, v7);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((30 * ((v1 & 0x1FFFFFFE0) == 32)) ^ (v3 - 268))) - 4))();
}

void sub_218EF1D4C()
{
  JUMPOUT(0x218EF1CF0);
}

uint64_t sub_218EF1D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((4 * (((v1 == v2) ^ ((v3 + 90) ^ (v3 + 113))) & 1)) & 0xBF | ((((v1 == v2) ^ (v3 + 346) ^ (v3 - 1163387791)) & 1) << 6)) ^ v3))
                            - 12))();
}

uint64_t sub_218EF1D94@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((((v2 & 0x4557E3F7) + 652) ^ 0xEE) * ((v1 & 0x18) == 0)) ^ v2 & 0x4557E3F7))
                            - (((v2 & 0x4557E3F7) + 827826858) & 0xCEA85DFF ^ 0x1CDLL)))();
}

uint64_t sub_218EF1DF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *v5;
  int8x8x4_t v7;
  int8x8x4_t v8;

  v5 = (char *)(v2 + 4 * v3);
  v7 = vld4_s8(v5);
  v8.val[0] = v7.val[3];
  v8.val[1] = v7.val[2];
  v8.val[2] = v7.val[1];
  v8.val[3] = v7.val[0];
  vst4_s8(v5, v8);
  return (*(uint64_t (**)(void))(a1 + 8 * (((v3 - (v1 & 0x1FFFFFFF8) == -8) * ((v4 - 118) ^ 0x329)) | v4)))();
}

uint64_t sub_218EF1E44@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  char *v4;
  int8x8x4_t v6;
  int8x8x4_t v7;

  v6 = vld4_s8(v4);
  v7.val[0] = v6.val[3];
  v7.val[1] = v6.val[2];
  v7.val[2] = v6.val[1];
  v7.val[3] = v6.val[0];
  vst4_s8(v4, v7);
  return (*(uint64_t (**)(void))(a1 + 8 * (((v2 == 0) * v1) | v3)))();
}

uint64_t sub_218EF1E78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((((v2 - 685) | 0x141) + 1528) * (v1 == v3)) ^ v2)) - 4))();
}

uint64_t sub_218EF1EA8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  char *v2;
  int v3;
  char v4;
  char v5;

  v4 = *v2;
  *v2 = v2[3];
  v2[3] = v4;
  v5 = v2[1];
  v2[1] = v2[2];
  v2[2] = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (int)((367 * (v1 != 884429979)) ^ (v3 + 1541850942) & 0xA41937AE))
                            - ((((v3 + 1541850942) & 0xA41937AE) + 338) | 0x11A)
                            + 782))();
}

void sub_218EF1F1C()
{
  JUMPOUT(0x218EF1ED0);
}

void sub_218EF1F24(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v1 = 1663139771 * ((2 * (a1 & 0x1595FB68) - a1 + 1785332887) ^ 0x1283D21A);
  v2 = *(_DWORD *)(a1 + 12) ^ v1;
  v3 = (unsigned __int16)(*(_WORD *)(a1 + 8) + v1);
  v5 = *(_QWORD *)a1 == 0x3DFA1ACB8D1A27BELL || v3 == 6481;
  __asm { BR              X8 }
}

void sub_218EF2000()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 16) = v0;
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_218EF2C6C()
{
  return 4294925273;
}

uint64_t sub_218EF2C78@<X0>(uint64_t a1@<X8>)
{
  (*(void (**)(void))(a1 + 440))();
  return 0;
}

void sub_218EF2C8C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) ^ (1663139771 * (((a1 | 0x41583596) - (a1 & 0x41583596)) ^ 0x39B1E31B));
  __asm { BR              X10 }
}

uint64_t sub_218EF2D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;

  v13 = ((unint64_t)&a10 ^ 0xBFDB535EF83FFFDDLL)
      + 0x4FF7FEF5F7FF2623
      + ((2 * (_QWORD)&a10) & 0x7FB6A6BDF07FFFB0);
  *(_BYTE *)(v10 + 263) = (v13 ^ 0xBA) * (v13 + 17);
  *(_BYTE *)(v10 - 69 + ((v11 - 727795802) & 0x2B6145FB)) = ((v13 | 1) ^ 0xBA) * (v13 + 18);
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * v11) - 8))();
}

void sub_218EF2E14()
{
  JUMPOUT(0x218EF2DD0);
}

uint64_t sub_218EF2E20()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0);
}

void sub_218EF2E40(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v5;

  if (*(_QWORD *)a1)
    v2 = *(_QWORD *)(a1 + 32) == 0x309E6C8145C33AEFLL;
  else
    v2 = 1;
  v5 = !v2 && *(_QWORD *)(a1 + 8) != 0x5303038D626F0C43 && *(_QWORD *)(a1 + 16) != 0x252C3BDA7CBE997ALL;
  v1 = *(_DWORD *)(a1 + 28) - 961505453 * ((2 * (a1 & 0x4822944) - a1 + 2071844539) ^ 0xD986181D);
  __asm { BR              X14 }
}

uint64_t sub_218EF2F04()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  *(_DWORD *)(v1 - 0x5303038D626F0C43) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8 * ((820 * (*(unsigned __int8 *)(v3 - 0x252C3BDA7CBE9969) == 175)) ^ v2))
                            - 4))();
}

uint64_t sub_218EF2F54()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((11
                                          * ((*(unsigned __int8 *)(v1 - 0x309E6C8145C33AE9) ^ 0xAE) != ((17 * (v2 ^ 0xB4)) ^ 0x73))) ^ v2))
                            - 4))();
}

uint64_t sub_218EF2FB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1
                                                             + 8
                                                             * (((((*(unsigned __int8 *)(v2 - 0x309E6C8145C33AE8) == v4) ^ (((v3 - 105) | 0xE0) + 1)) & 1)
                                                               * ((284 * (((v3 - 873) | 0xE0) ^ 0x1E8)) ^ 0x76C)) ^ ((v3 - 873) | 0xE0))))(a1, 1898078583, ((v3 - 873) | 0xE0) ^ 0x598u);
}

uint64_t sub_218EF3074(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3
                              + 8 * (((a3 + 1) ^ (a2 + 245 * (a3 ^ 0x470u) - 489 == v4)) & 1 | a3)))();
}

uint64_t sub_218EF30AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  int v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v4
                                                             + 8
                                                             * (((((v5 == 0) ^ (a4 + 1)) & 1)
                                                               * ((284 * (a4 ^ 0x1E8)) ^ 0x76C)) ^ a4)))(a1, a2, a4 ^ 0x598u);
}

uint64_t sub_218EF30F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;

  v13 = 70 * (a5 ^ 0x23Fu);
  v14 = (_QWORD *)(v11 + ((a2 + v13) << 7) - 0x389131ABE8);
  *v14 = v5 + ((*v10 * (v12 - 51) % v9) << 10);
  *v7 += 1024;
  v14[1] = v5 + ((*v10 * (v12 - 50) % v9) << v13);
  *v7 += 1024;
  v14[2] = v5 + ((*v10 * (v12 - 49) % v9) << 10);
  *v7 += 1024;
  v14[3] = v5 + ((*v10 * (v12 - 48) % v9) << 10);
  *v7 += 1024;
  return (*(uint64_t (**)(uint64_t))(v6 + 8 * (int)((978 * (v8 != 1)) ^ v13)))(a1);
}

uint64_t sub_218EF320C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

void sub_218EF3218(uint64_t a1)
{
  int v1;

  v1 = 515566439 * (((a1 | 0xB7040A71) - a1 + (a1 & 0x48FBF58E)) ^ 0xDBD00DD6);
  __asm { BR              X12 }
}

uint64_t sub_218EF32EC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((28 * (*(_QWORD *)(v1 + 24) == 0)) ^ (v0 - 200299848) & 0xBF057E3u))
                            - (((((v0 - 200299848) & 0xBF057E3) - 1516758275) & 0x1A67E266u)
                             + 23)
                            + 565))();
}

uint64_t sub_218EF334C()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;

  v4 = *(_DWORD **)(v1 + 56);
  **(_QWORD **)(v1 + 16) = 0;
  *v4 = 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((424 * (*(unsigned __int8 *)(v3 + 5) == ((v0 - 23) ^ 0x27))) ^ v0)))();
}

uint64_t sub_218EF3394()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((220
                                * (*(unsigned __int8 *)(*(_QWORD *)(v1 + 8) + 1) == (((v0 - 55) | 0x20) ^ ((_BYTE)v0 + 31) & 0xA7 ^ 0x50))) ^ v0)))();
}

uint64_t sub_218EF33EC@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unsigned int a6, uint64_t a7, char a8, int a9)
{
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  a4 = -69 * (((&a4 | 0xC) - (&a4 | 0xF3) - 13) ^ 0x81) - 42;
  a7 = v13;
  a6 = v14
     - 1663139771 * (((&a4 | 0x7AFCC00C) - (&a4 | 0x85033FF3) - 2063384589) ^ 0x2151681)
     - 119;
  a5 = v12 + 0x6541918724FB411BLL;
  a8 = (v9 ^ 0x91)
     - 69 * (((&a4 | 0xC) - (&a4 | 0xF3) - 13) ^ 0x81)
     + ((2 * v9) & 0xDF ^ v10)
     + 116;
  v15 = ((uint64_t (*)(char *))(*(_QWORD *)(a1 + 8 * (v14 - 431)) - 12))(&a4);
  return (*(uint64_t (**)(uint64_t))(v11
                                            + 8
                                            * (((a9 != ((25 * (v14 ^ 0x212)) ^ 0x10B9A34D)) * (((v14 + 164) | 4) ^ 0x295)) ^ v14)))(v15);
}

void sub_218EF34E4()
{
  int v0;
  uint64_t v1;
  _BYTE *v2;

  *v2 = -1;
  *(_DWORD *)(v1 + 48) = v0;
}

uint64_t sub_218EF368C(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = 961505453 * (a1 ^ 0xA2FBCEA6);
  v2 = *(_DWORD *)(a1 + 12) - v1;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24DA380E0 + (int)(v2 ^ 0x4C3))
                              + (int)((162 * ((*(_DWORD *)(a1 + 8) ^ v1) - 606789461 > 6)) ^ v2)
                              - 1)
                            - ((((v2 - 368) | 0x65) - 214) ^ ((v2 - 1135) | 0x28A))))();
}

uint64_t sub_218EF3720@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v2 - 632) * (v1 > 0x1E)) ^ v2))
                            - ((v2 + 1534802976) & 0xA484C5FD ^ 0x4A1)))();
}

uint64_t sub_218EF3768@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  int v3;
  uint64_t v4;
  int v5;
  char *v6;
  char *v7;
  int8x16x4_t v9;
  int8x16x4_t v10;
  int8x16x4_t v11;

  v4 = (v3 + 1408881268) & 0xAC062BE9;
  v5 = v3 - 453;
  v6 = v2;
  v9 = vld4q_s8(v6);
  v7 = v2 + 64;
  v10.val[0] = v9.val[3];
  v10.val[1] = v9.val[2];
  v11 = vld4q_s8(v7);
  v10.val[2] = v9.val[1];
  v10.val[3] = v9.val[0];
  v9.val[0] = v11.val[3];
  v9.val[1] = v11.val[2];
  v9.val[2] = v11.val[1];
  v9.val[3] = v11.val[0];
  vst4q_s8(v6, v10);
  vst4q_s8(v7, v9);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((63 * ((v4 ^ 0xC9) == (v1 & 0x1FFFFFFE0))) ^ v5)) - 4))();
}

uint64_t sub_218EF3800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((((v1 == v2) ^ v3) & 1 | (4
                                                                                    * (((v1 == v2) ^ v3) & 1))) ^ v3))
                            - ((v3 - 104) | 0x20Au)
                            + 643))();
}

uint64_t sub_218EF3834@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v2 ^ (382 * ((v1 & 0x18) == 0)))) - 8))();
}

uint64_t sub_218EF3880@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *v5;
  int8x8x4_t v7;
  int8x8x4_t v8;

  v5 = (char *)(v2 + 4 * v3);
  v7 = vld4_s8(v5);
  v8.val[0] = v7.val[3];
  v8.val[1] = v7.val[2];
  v8.val[2] = v7.val[1];
  v8.val[3] = v7.val[0];
  vst4_s8(v5, v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((88 * (v3 - (v1 & 0x1FFFFFFF8) == -8)) ^ v4))
                            - ((v4 - 993) | 0x21u)
                            + 221))();
}

void sub_218EF38E0()
{
  JUMPOUT(0x218EF38A8);
}

uint64_t sub_218EF38E8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v1 ^ (796 * (v2 != v3))))
                            - ((v1 + 636) ^ (v1 + 949124880) & 0xC76D8476 ^ 0x71DLL)))();
}

uint64_t sub_218EF3930@<X0>(uint64_t a1@<X8>)
{
  int v1;
  char *v2;
  int v3;
  char v4;
  char v5;

  v4 = *v2;
  *v2 = v2[3];
  v2[3] = v4;
  v5 = v2[1];
  v2[1] = v2[2];
  v2[2] = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((2029 * (v1 == 606789461)) ^ v3))
                            - ((v3 + 267) ^ 0x474)))();
}

uint64_t sub_218EF3990(uint64_t result)
{
  int v1;
  unsigned __int8 v2;
  int v3;

  v1 = 132283120;
  v2 = ((2 * (result ^ 0x86)) | 0xD8) - (result ^ 0x86) - 108;
  switch(*(_BYTE *)(result + 12) + (v2 ^ 0x18) + (v2 << 6))
  {
    case '^':
      v3 = 0x4000000;
      goto LABEL_6;
    case '_':
      v3 = -2113929216;
      goto LABEL_6;
      v3 = -1744830464;
      goto LABEL_6;
    case 'a':
      v3 = 335544320;
LABEL_6:
      if (*(_DWORD *)(*(_QWORD *)result + 8) == v3)
        v1 = 132325201;
      else
        v1 = 132283120;
      break;
    default:
      break;
  }
  *(_DWORD *)(result + 8) = v1;
  return result;
}

void sub_218EF3A28(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  BOOL v4;
  int v5;

  v1 = 961505453 * (((a1 | 0xA1859FC4) - (a1 & 0xA1859FC4)) ^ 0x37E5162);
  v2 = *(_DWORD *)(a1 + 4) + v1;
  v3 = (v1 ^ *(_BYTE *)(a1 + 8)) ^ 0xEB;
  if (*(_QWORD *)(a1 + 24))
    v4 = v3 == 3;
  else
    v4 = 0;
  v5 = v4;
  __asm { BR              X8 }
}

uint64_t sub_218EF3AF0(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned __int8 *v7;
  _BYTE v9[6];
  _BYTE v10[20];
  unint64_t *v11;
  _BYTE *v12;
  uint64_t v13;
  unint64_t *v14;

  v4 = *(unsigned __int8 **)(a1 + 16);
  v11 = &STACK[0x1BD3A2918E8AF00D];
  LODWORD(v12) = v1
               - 1663139771
               * (((&v11 ^ 0x6446D1A4 | 0x4E161F13)
                 - (&v11 ^ 0x6446D1A4)
                 + ((&v11 ^ 0x6446D1A4) & 0xB1E9E0EC)) ^ 0x52B9183A)
               - 1603588155;
  sub_218EF996C((uint64_t)&v11);
  v5 = 846572393 * (((&v11 | 0xCF47FFB3) - (&v11 & 0xCF47FFB3)) ^ 0xF924ABFA);
  HIDWORD(v13) = v5 + 1852334399;
  LODWORD(v13) = v1 - 656339948 + v5;
  v11 = &STACK[0x1BD3A2918E8AF00D];
  v12 = &v9[1];
  sub_218EFB8FC((uint64_t)&v11);
  v6 = 846572393 * (((&v11 | 0x62A89791) + (~&v11 | 0x9D57686E)) ^ 0x54CBC3D9);
  HIDWORD(v13) = v6 + 1852334399;
  LODWORD(v13) = v1 - 656339948 + v6;
  v11 = &STACK[0x1BD3A2918E8AF00D];
  v12 = v9;
  sub_218EFB8FC((uint64_t)&v11);
  v7 = &v4[56 * *v4];
  v10[19] = v7[43] ^ 0x94;
  v10[18] = v7[42] ^ 0x94;
  v10[17] = v7[41] ^ 0x94;
  v10[16] = v7[40] ^ 0x94;
  v10[15] = v7[39] ^ 0x94;
  v10[14] = v7[38] ^ 0x94;
  v10[13] = v7[37] ^ 0x94;
  v10[12] = v7[36] ^ 0x94;
  v10[11] = v7[35] ^ 0x94;
  v10[10] = v7[34] ^ 0x94;
  v10[9] = v7[33] ^ 0x94;
  v10[8] = v7[32] ^ 0x94;
  v10[7] = v7[31] ^ 0x94;
  v10[6] = v7[30] ^ 0x94;
  v10[5] = v7[29] ^ 0x94;
  v10[4] = v7[28] ^ 0x94;
  v10[3] = v7[27] ^ 0x94;
  v10[2] = v7[26] ^ 0x94;
  v10[1] = v7[25] ^ 0x94;
  v10[0] = v7[24] ^ 0x94;
  v14 = &STACK[0x1BD3A2918E8AF00D];
  v11 = (unint64_t *)v10;
  v13 = v2;
  LODWORD(v12) = v1
               - 839339309 * ((&v11 - 1508852607 - 2 * (&v11 & 0xA610BC81)) ^ 0x1AF1A4E0)
               + 95;
  return (*(uint64_t (**)(unint64_t **))(v3 + 8 * (v1 ^ 0x2F5)))(&v11);
}

uint64_t sub_218EF3DC4(uint64_t result)
{
  uint64_t v1;
  __int16 v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 16);
  v2 = *(_DWORD *)(result + 4) - -16981 * (((result | 0xBB57) - (result & 0xBB57)) ^ 0x8E04);
  *(_DWORD *)(v1 - 0x24DFB20F49F753E6) = v2 & 0x1FF ^ 0xC57990BF;
  *(_QWORD *)(v1 - 0x24DFB20F49F75406) = 0xBAB04DB841DB5F8BLL;
  *(_DWORD *)(v1 - 0x24DFB20F49F753EALL) = 1681680747;
  v3 = v2 ^ 0x77;
  if (v3 == 1)
  {
    v4 = 1681680763;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x24DFB20F49F753EELL) = 1934510033;
    v4 = 1681680767;
LABEL_5:
    *(_QWORD *)(v1 - 0x24DFB20F49F753FELL) = 0x5F510DA8D7D98520;
    *(_QWORD *)(v1 - 0x24DFB20F49F753F6) = 0xA0AEF25728267ADFLL;
    *(_DWORD *)(v1 - 0x24DFB20F49F753EALL) = v4;
  }
  *(_DWORD *)result = 267291297;
  return result;
}

void sub_218EF3F04(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;

  v1 = 1503905621 * (((a1 | 0x8A342AF4) - (a1 & 0x8A342AF4)) ^ 0xD74C4420);
  v2 = *(_DWORD *)a1 + v1;
  if (*(_QWORD *)(a1 + 8))
    v3 = (*(_DWORD *)(a1 + 24) ^ v1) == 1163154910;
  else
    v3 = 1;
  v4 = !v3;
  __asm { BR              X8 }
}

uint64_t sub_218EF3FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v20;

  v18 = *(_QWORD *)(a1 + 16);
  LODWORD(v20) = ((v16 ^ 0x531) - 914) | 0x6C;
  HIDWORD(v20) = v17;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * (int)(((v17 + 1062450659 + ((2 * (*(_DWORD *)(v18 - 0x749080D34EC4FB6CLL) & 0x3F)) ^ 0x70) + (*(_DWORD *)(v18 - 0x749080D34EC4FB6CLL) & 0x3F ^ 0x7B57F3C7u) < (((v16 ^ 0x531) + 1962654664) & 0x8B0441BD) - 489) * (v20 ^ 0x89)) ^ v16 ^ 0x531)) - 12))(((v16 ^ 0x531) + 1962654664) & 0x8B0441BD, (2 * (*(_DWORD *)(v18 - 0x749080D34EC4FB6CLL) & 0x3F)) ^ 0x70u, a3, a4, a5, a6, a7, a8, v20, a10, v18, a12, a13, a14, a15);
}

uint64_t sub_218EF4084(int a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;

  v6 = v5 - 2069361662;
  if (v6 <= 0x40)
    v6 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((a1 - 104) ^ 0x159) * (v4 - v3 - a2 + v6 < 0xF)) ^ a1)) - 4))();
}

uint64_t sub_218EF4100(int a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v9 = a1 + 688;
  v10 = a2 + v6;
  v11 = v10 + v8;
  if ((v10 + v8) <= 0x40)
    v11 = a4;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((37 * (((((v9 + 692638058) & 0xD6B72B7D) + 515) ^ (v7 - 836)) - v10 < a5 + v11)) ^ v9)))();
}

uint64_t sub_218EF415C(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((22
                                          * (a7
                                           - 0x749080D34EC4FBB0
                                           - v7
                                           + (unint64_t)(v9 + a2 + (a3 ^ 0x264) + 3 * (a3 ^ 0x32Fu) - 610) < 0x10)) ^ a3))
                            - 12))();
}

uint64_t sub_218EF41BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int8x16_t *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;

  v8.i64[0] = 0x2828282828282828;
  v8.i64[1] = 0x2828282828282828;
  v9.i64[0] = 0x9595959595959595;
  v9.i64[1] = 0x9595959595959595;
  *(int8x16_t *)(v7 + (((v4 + 562) + 4294966445) & (v6 + a2))) = vaddq_s8(vaddq_s8(*v2, v9), vmvnq_s8(vandq_s8(vaddq_s8(*v2, *v2), v8)));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8 * ((712 * (((v5 + a1 - 1112) & 0x1FFFFFFF0) == 16)) ^ v4))
                                          - 4))(4294966445);
}

void sub_218EF4230()
{
  JUMPOUT(0x218EF41ECLL);
}

uint64_t sub_218EF423C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((((a4 - 849) | 0xC) ^ 0x73A) * (v5 == v6)) ^ a4))
                            - ((a4 - 786) | 0x101u)
                            + 309))();
}

uint64_t sub_218EF427C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int32x4_t a25,int32x4_t a26,int32x4_t a27,int32x4_t a28,int a29)
{
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t (*v32)(__n128, __n128, __n128, __n128, __n128);
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  uint8x16_t v42;
  uint16x8_t v43;
  int8x16_t v44;
  uint16x8_t v45;
  int8x16_t v46;
  uint8x16_t v47;
  uint16x8_t v48;
  uint16x8_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  uint8x16_t v54;
  int8x16_t v57;
  int8x16_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int v67;
  uint64_t v68;
  uint8x16_t v69;
  uint16x8_t v70;
  uint16x8_t v71;
  uint8x16_t v72;
  uint8x16_t v77;
  uint16x8_t v78;
  uint16x8_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  __int32 v84;
  unsigned int v85;
  unint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t);
  _DWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int8x16x4_t v97;
  int8x16x4_t v98;

  v32 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128))(v29 + 8 * v30);
  v94 = a7 - 0x749080D34EC4FB50;
  v88 = (_DWORD *)(a7 - 0x749080D34EC4FB58);
  HIDWORD(v93) = HIDWORD(a9) - 470216326;
  LODWORD(v93) = v30 + 692938571;
  v33.n128_u64[0] = 0x9494949494949494;
  v33.n128_u64[1] = 0x9494949494949494;
  v34 = (__n128)vdupq_n_s32(0x6747457Fu);
  v35 = (__n128)vdupq_n_s32(0xE7474566);
  LODWORD(a9) = 23 * (HIDWORD(a23) ^ 0x119);
  HIDWORD(a18) = a9 ^ 0x294D67A5;
  v36.n128_u64[0] = 0x2828282828282828;
  v36.n128_u64[1] = 0x2828282828282828;
  v37 = (__n128)vdupq_n_s32(0xCE8E8ACC);
  v91 = a7 - 0x749080D34EC4FB64;
  v92 = a7 - 0x749080D34EC4FB68;
  v89 = a7 - 0x749080D34EC4FB5CLL;
  v90 = a7 - 0x749080D34EC4FB60;
  v38 = *(_DWORD *)(a7 - 0x749080D34EC4FB64);
  LODWORD(v96) = *(_DWORD *)(a7 - 0x749080D34EC4FB68);
  HIDWORD(v96) = v38;
  v39 = *(_DWORD *)(a7 - 0x749080D34EC4FB60);
  v40 = *(_DWORD *)(a7 - 0x749080D34EC4FB5CLL);
  v41 = *(unsigned __int8 *)(a7 - 0x749080D34EC4FB50) ^ 0xC8;
  if (v41 == 2)
  {
    v95 = *(_QWORD *)(v29 + 8 * v30);
    v98 = vld4q_s8(v31);
    v67 = (HIDWORD(a23) - 266) | 0x104;
    v68 = *v88;
    HIDWORD(a12) = *v88;
    v69 = (uint8x16_t)veorq_s8(v98.val[0], (int8x16_t)v33);
    v70 = vmovl_u8(*(uint8x8_t *)v69.i8);
    v71 = vmovl_high_u8(v69);
    v72 = (uint8x16_t)veorq_s8(v98.val[1], (int8x16_t)v33);
    _Q22 = vmovl_u8(*(uint8x8_t *)v72.i8);
    _Q21 = vmovl_high_u8(v72);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v77 = (uint8x16_t)veorq_s8(v98.val[2], (int8x16_t)v33);
    v78 = vmovl_high_u8(v77);
    v79 = vmovl_u8(*(uint8x8_t *)v77.i8);
    v98.val[0] = veorq_s8(v98.val[3], (int8x16_t)v33);
    v98.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v98.val[0]);
    v98.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[1]);
    v98.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[1].i8);
    v98.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v98.val[0].i8);
    v98.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[0]);
    v98.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[0].i8);
    v80 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v79.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v70.i8), 0x18uLL)), v98.val[0]);
    v81 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v79, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v70), 0x18uLL)), v98.val[3]);
    v82 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v78.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v71.i8), 0x18uLL)), v98.val[1]);
    v83 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v78, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v71), 0x18uLL)), v98.val[2]);
    v98.val[0] = veorq_s8(vandq_s8((int8x16_t)v80, (int8x16_t)v34), (int8x16_t)(*(_OWORD *)v98.val & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
    v98.val[3] = veorq_s8(vandq_s8((int8x16_t)v81, (int8x16_t)v34), (int8x16_t)(*(_OWORD *)&v98.val[3] & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
    v98.val[1] = veorq_s8(vandq_s8((int8x16_t)v82, (int8x16_t)v34), (int8x16_t)(*(_OWORD *)&v98.val[1] & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
    v98.val[2] = veorq_s8(vandq_s8((int8x16_t)v83, (int8x16_t)v34), (int8x16_t)(*(_OWORD *)&v98.val[2] & __PAIR128__(0xFFFFFF19FFFFFF19, 0xFFFFFF19FFFFFF19)));
    a27 = vaddq_s32(vsubq_s32(v82, vaddq_s32((int32x4_t)v98.val[1], (int32x4_t)v98.val[1])), (int32x4_t)v35);
    a28 = vaddq_s32(vsubq_s32(v83, vaddq_s32((int32x4_t)v98.val[2], (int32x4_t)v98.val[2])), (int32x4_t)v35);
    a25 = vaddq_s32(vsubq_s32(v80, vaddq_s32((int32x4_t)v98.val[0], (int32x4_t)v98.val[0])), (int32x4_t)v35);
    a26 = vaddq_s32(vsubq_s32(v81, vaddq_s32((int32x4_t)v98.val[3], (int32x4_t)v98.val[3])), (int32x4_t)v35);
    v84 = a27.i32[0] ^ *((_DWORD *)&a25 + ((v67 + 2062847665) & 0x850B7147) - 248);
    v85 = v84 - 414759578 - ((2 * v84) & 0xCE8E8ACC);
    HIDWORD(v86) = a25.i32[0] ^ a25.i32[2] ^ 0x67474566 ^ v85;
    LODWORD(v86) = a25.i32[0] ^ a25.i32[2] ^ ~v85;
    a29 = (v86 >> 31) - 414759578 - ((2 * (v86 >> 31)) & 0xCE8E8ACC);
    v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 + 8 * (v67 ^ 0x36)) - 4);
    return v87(v68, -1065672462, 1065672462, 1065672478, 3880207718, v87, 3454591212, 2963056161, a9, a8, a11, a12, v88, v89, v90, v91, v92, a18, v93,
             v94,
             __PAIR64__(v40, v39),
             v95,
             a23,
             v96);
  }
  else if (v41 == 1)
  {
    v97 = vld4q_s8(v31);
    v42 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v33);
    v43 = vmovl_high_u8(v42);
    v44 = (int8x16_t)vmovl_high_u16(v43);
    v45 = vmovl_u8(*(uint8x8_t *)v42.i8);
    v46 = (int8x16_t)vmovl_high_u16(v45);
    v47 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v33);
    v48 = vmovl_u8(*(uint8x8_t *)v47.i8);
    v49 = vmovl_high_u8(v47);
    v50 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v48.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v45.i8));
    v51 = vorrq_s8((int8x16_t)vshll_high_n_u16(v48, 8uLL), v46);
    v52 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v49.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v43.i8));
    v53 = vorrq_s8((int8x16_t)vshll_high_n_u16(v49, 8uLL), v44);
    v54 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v33);
    _Q22 = (int8x16_t)vmovl_high_u8(v54);
    _Q21 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v54.i8);
    v57 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }
    v62 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL);
    __asm { SHLL2           V22.4S, V22.8H, #0x10 }
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v33);
    v97.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v97.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v63 = (int32x4_t)vorrq_s8(vorrq_s8(v50, v57), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8), 0x18uLL));
    v97.val[1] = vorrq_s8(vorrq_s8(v51, _Q21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v97.val[1]), 0x18uLL));
    v64 = (int32x4_t)vorrq_s8(vorrq_s8(v52, v62), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8), 0x18uLL));
    v65 = (int32x4_t)vorrq_s8(vorrq_s8(v53, _Q22), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v97.val[0]), 0x18uLL));
    a27 = vaddq_s32(vsubq_s32(v64, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v64, v64), (int8x16_t)v37)), (int32x4_t)v35);
    a28 = vaddq_s32(vsubq_s32(v65, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v65, v65), (int8x16_t)v37)), (int32x4_t)v35);
    a25 = vaddq_s32(vsubq_s32(v63, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v63, v63), (int8x16_t)v37)), (int32x4_t)v35);
    a26 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v97.val[1], (int32x4_t)v97.val[1]), (int8x16_t)v37)), (int32x4_t)v35);
    return ((uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t))(*(_QWORD *)(v29 + 8 * (HIDWORD(a23) + 222)) - 8))(*(&off_24DA380E0 + ((HIDWORD(a23) + 222) ^ 0x1F0)), -1065672462, (HIDWORD(a23) + 788662763) & 0xD0FDF7EB, 1065672478, 3880207718, 793, 3454591212, 2963056161, a9, a8, a11, a12, v88, v89, v90, v91, v92, a18, v93,
             v94,
             __PAIR64__(v40, v39),
             v32,
             a23,
             v96);
  }
  else
  {
    *(_DWORD *)(a7 - 0x749080D34EC4FB68) = 2 * (*(_DWORD *)(a7 - 0x749080D34EC4FB68) ^ 0xB09CA621)
                                           - 1331911135
                                           - ((4 * (*(_DWORD *)(a7 - 0x749080D34EC4FB68) ^ 0xB09CA621)) & 0x61394C42);
    *(_DWORD *)(a7 - 0x749080D34EC4FB64) = 2 * (v38 ^ 0xB09CA621)
                                           - 1331911135
                                           - ((4 * (v38 ^ 0xB09CA621)) & 0x61394C42);
    *(_DWORD *)(a7 - 0x749080D34EC4FB60) = 2 * (v39 ^ 0xB09CA621)
                                           - 1331911135
                                           - ((4 * (v39 ^ 0xB09CA621)) & 0x61394C42);
    *(_DWORD *)(a7 - 0x749080D34EC4FB5CLL) = 2 * (v40 ^ 0xB09CA621)
                                           - 1331911135
                                           - ((4 * (v40 ^ 0xB09CA621)) & 0x61394C42);
    return v32(v33, v34, v35, v36, v37);
  }
}

uint64_t sub_218EF4E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, unsigned int a19, unsigned int a20,unsigned int a21)
{
  uint64_t v21;
  int v22;
  _BOOL4 v23;

  if (a21 < a20 != a10 - 875257880 < a19)
    v23 = a10 - 875257880 < a19;
  else
    v23 = a10 - 875257880 > a21;
  return ((uint64_t (*)(void))(*(_QWORD *)(v21 + 8 * ((50 * v23) ^ (v22 + 767))) - (((v22 - 198) | 0x190u) ^ 0x1D0)))();
}

uint64_t sub_218EF4F1C()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((1523
                                * ((((v1 - 14) ^ (v3 + v2 + 63 < ((v1 - 202) ^ (v3 + 242)) + v2)) & 1) == 0)) ^ v1)))();
}

uint64_t sub_218EF4F6C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  _BOOL4 v14;

  v14 = a11 - 0x749080D34EC4FBB0 - v11 - (unint64_t)(a1 + ((v13 - 1760806939) & 0x68F3C75Eu) - 274) < (unint64_t)((v13 - 204) | 0x10u) - 258;
  return (*(uint64_t (**)(void))(v12 + 8 * (((2 * v14) | (16 * v14)) ^ v13)))();
}

uint64_t sub_218EF4FE0@<X0>(char a1@<W2>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int v9;

  *(_BYTE *)(v6 + v4) = *(_BYTE *)(v2 + (v5 + v9))
                      - (a1 & (2 * *(_BYTE *)(v2 + (v5 + v9))))
                      - 108;
  return (*(uint64_t (**)(void))(v3 + 8 * (((v4 + 1 == ((a2 - 254) ^ v7)) * v8) ^ (a2 - 131))))();
}

uint64_t sub_218EF5028(int8x16_t a1, double a2, double a3, int8x16_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int8x16_t *v8;
  int v9;
  int v10;
  int8x16_t v11;

  v11 = *(int8x16_t *)(v4 + v7 + (v6 ^ v9 ^ (v10 - 12)));
  *v8 = vaddq_s8(vsubq_s8(v11, vandq_s8(vaddq_s8(v11, v11), a4)), a1);
  return (*(uint64_t (**)(void))(v5 + 8 * ((v6 - 85) ^ 0x1E9)))();
}

uint64_t sub_218EF5084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  uint64_t v10;
  int v11;
  unsigned int v12;
  int v13;
  _BOOL4 v14;

  v12 = v11 + 454893953 + ((a9 - 43) | 1);
  v13 = ((a10 + 859935782) < 0x7895EA04) ^ (v12 < 0x7895EA04);
  v14 = v12 < a10 + 859935782;
  if (v13)
    v14 = (a10 + 859935782) < 0x7895EA04;
  return (*(uint64_t (**)(void))(v10 + 8 * ((v14 * ((a9 + 21) ^ 0x505)) ^ a9)))();
}

uint64_t sub_218EF510C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v13 = v9 < v6;
  *(_BYTE *)(a4 - 0x749080D34EC4FBB0 + (v11 - 995537903)) = *(_BYTE *)(v4 + (v10 + v12))
                                                                          + ((2
                                                                            * *(_BYTE *)(v4 + (v10 + v12))) & 0x28 ^ ((v8 ^ 0xC1) - 19))
                                                                          - 107;
  v14 = v7 + v10 + 212;
  v15 = v13 ^ (v14 < v6);
  v16 = v14 < v9;
  if (!v15)
    v13 = v16;
  return (*(uint64_t (**)(uint64_t))(v5 + 8 * ((46 * !v13) ^ v8)))(3299429393);
}

void sub_218EF519C()
{
  JUMPOUT(0x218EF5134);
}

uint64_t sub_218EF51A8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  v4 = 1449114341 * ((((2 * (v3 - 112)) | 0x65BC19DA) - (v3 - 112) - 853413101) ^ 0xFD80F506);
  *(_QWORD *)(v3 - 112) = a1;
  *(_DWORD *)(v3 - 104) = v4 ^ (v2 + 240294244);
  *(_DWORD *)(v3 - 100) = (v1 - 160) ^ v4;
  return sub_218ED0830(v3 - 112);
}

void sub_218EF52CC(uint64_t a1)
{
  int v1;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8) + 1477295531 * ((1461229368 - (a1 | 0x57189738) + (a1 | 0xA8E768C7)) ^ 0x9FEC5D94);
  __asm { BR              X8 }
}

uint64_t sub_218EF5664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,_DWORD *a31)
{
  int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;

  v34 = (((v31 - 1721810221) & 0x66A0BD3D) + 35) ^ *a31 & 0x3F;
  *(_BYTE *)(v32 + v34) = 20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v33 + 8 * (((v34 > 0x37) * (v31 + 460)) | v31)) - 8))();
}

uint64_t sub_218EF56C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v45;
  int v46;
  uint64_t v47;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 + 8 * (((((3 * ((v45 + 1105) ^ 0x452) - 2052808768) & 0x7A5B637F) - 635) * (v46 != 63)) ^ (v45 + 1105)))
                                                                                                - 12))(148, a2, a3, 432, a5, 804, a45);
}

uint64_t sub_218EF572C()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((219 * ((v0 ^ 7u) > 7)) ^ v1)) - 4))();
}

uint64_t sub_218EF5760()
{
  int v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + v1 + v3) = v6;
  return (*(uint64_t (**)(void))(v5 + 8 * ((390 * (((v0 - 1032911118) & 0x3D90F7DF ^ 0x35DLL) == (v2 & 0x38))) ^ v0)))();
}

uint64_t sub_218EF57BC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((((145 * (v2 ^ 0x356)) ^ 0x7D7) * (v1 == v0)) ^ v2)) - 4))();
}

uint64_t sub_218EF57FC@<X0>(char a1@<W0>, char a2@<W3>, int a3@<W5>, int a4@<W8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + v4 + v5) = a1;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((((unint64_t)(v4 + 1 + v5) < 0x40) ^ (7 * (a4 ^ a2))) & 1)
                                * a3) ^ a4)))();
}

uint64_t sub_218EF5838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,unsigned int a51,uint64_t a52,uint64_t a53,char a54)
{
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t (*v58)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v60;
  uint64_t v61;
  _DWORD *v62;
  int v63;
  _DWORD *v64;
  int v65;
  int v66;
  BOOL v68;
  _BOOL4 v71;
  uint64_t v72;

  v58 = (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 + 8 * (v54 - 17)) - 8);
  v60 = &a54 + a53;
  v72 = a53 + 320;
  v61 = *(unsigned int *)(a49 - 0x24DFB20F49F753FALL);
  v62 = (_DWORD *)(a49 - 0x24DFB20F49F753F6);
  v63 = *(_DWORD *)(a49 - 0x24DFB20F49F753F6);
  v64 = (_DWORD *)(a49 - 0x24DFB20F49F753F2);
  v65 = *(_DWORD *)(a49 - 0x24DFB20F49F753F2);
  v66 = *(unsigned __int8 *)(a49 - 0x24DFB20F49F753E6) ^ 0xC8;
  if (v66 == 2)
  {
    v71 = a39 < a43 + a53 && (unint64_t)v60 < a39 + 64;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55 + 8 * (int)((a5 + 681) ^ (85 * v71)))
                                            - (HIDWORD(a40) ^ a51 ^ 0x1D8)))(v61);
  }
  else if (v66 == 1)
  {
    v68 = a39 < a43 + a53 && (unint64_t)v60 < a39 + 64;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55
                                                        + 8
                                                        * (int)((((v68 ^ (a5 + 22)) & 1) * (a5 + 58)) | (a5 + 155)))
                                            - 8))(v61);
  }
  else
  {
    *(_DWORD *)(a49 - 0x24DFB20F49F753FELL) = 2 * (*(_DWORD *)(a49 - 0x24DFB20F49F753FELL) ^ v56)
                                            + v56
                                            - (v57 & (4 * (*(_DWORD *)(a49 - 0x24DFB20F49F753FELL) ^ v56)));
    *(_DWORD *)(a49 - 0x24DFB20F49F753FALL) = (*(_DWORD *)(a49 - 0x24DFB20F49F753FALL) ^ v56)
                                            + (v61 ^ v56)
                                            + v56
                                            - (v57 & (2 * ((*(_DWORD *)(a49 - 0x24DFB20F49F753FALL) ^ v56) + (v61 ^ v56))));
    *v62 = (*v62 ^ v56) + (v63 ^ v56) + v56 - (v57 & (2 * ((*v62 ^ v56) + (v63 ^ v56))));
    *v64 = (*v64 ^ v56) + (v65 ^ v56) + v56 - (v57 & (2 * ((*v64 ^ v56) + (v65 ^ v56))));
    HIDWORD(a44) = a40 - 1908811289;
    return v58(v61, v64, a3, v72 - 320, a5, 186, v62, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44);
  }
}

uint64_t sub_218EF6E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,unsigned int a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51)
{
  uint64_t v51;
  _BOOL4 v52;

  if (a45 < 0xF2764352 != (a51 - 1011158965) < 0xF2764352)
    v52 = (a51 - 1011158965) < 0xF2764352;
  else
    v52 = a51 - 1011158965 > a45;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 8 * ((1921 * !v52) ^ ((int)a5 + 870))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

void sub_218EF6EF8()
{
  JUMPOUT(0x218EF6138);
}

uint64_t sub_218EF6F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40)
{
  int v40;
  int v41;
  uint64_t v42;
  _BOOL4 v43;

  v43 = v40 + 5864929 < (a40 - 891787331);
  if ((a40 - 891787331) < 0x2F14D128 != v40 + 5864929 < ((37 * (((v41 - 235) | 5) ^ 0x1F)) ^ 0x2F14D05Au))
    v43 = (a40 - 891787331) < 0x2F14D128;
  return ((uint64_t (*)(void))(*(_QWORD *)(v42 + 8 * ((473 * v43) ^ v41)) - 12))();
}

uint64_t sub_218EF6FAC@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W2>, unsigned int a4@<W3>, int a5@<W4>, uint64_t a6@<X6>, unsigned int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  _BOOL4 v53;
  unsigned int v54;
  int v55;
  _BOOL4 v56;

  v53 = a7 < a1;
  *(_BYTE *)(a48 - 0x24DFB20F49F75446 + (v48 + v51)) = *(_BYTE *)(a6 + (a3 + v49 + 13));
  v54 = v49 + 1 + a2;
  v55 = v53 ^ (v54 < a1);
  v56 = v54 < a7;
  if (!v55)
    v53 = v56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v52 + 8 * ((v53 * a5) ^ ((v50 - 338) | 0xDB)))
                            - (((v50 - 338) | 0xDB) ^ a4 ^ 0x19)))();
}

void sub_218EF7030()
{
  JUMPOUT(0x218EF6FD0);
}

uint64_t sub_218EF7038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t (*a32)(uint64_t),uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;

  v51 = 1449114341 * ((((v50 - 136) | 0x5EBA4540) - ((v50 - 136) & 0x5EBA4540)) ^ 0x91E4BCAB);
  *(_QWORD *)(v50 - 136) = a49;
  *(_DWORD *)(v50 - 128) = (a6 - 278231593) ^ v51;
  *(_DWORD *)(v50 - 124) = (v49 + 93) ^ v51;
  v52 = sub_218ED0830(v50 - 136);
  return a32(v52);
}

uint64_t sub_218EF70A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unsigned __int8 *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  uint64_t v39;
  int v40;

  v40 = *a30 ^ 0xC8;
  if (v40 == 2)
    return (*(uint64_t (**)(uint64_t))(v39
                                              + 8 * ((55 * (*a25 != (((a5 + 365) | 9) ^ 0x643C68E0))) ^ (a5 + 374))))(a39);
  if (v40 == 1)
    return (*(uint64_t (**)(uint64_t))(v39 + 8 * ((938 * (*a25 != ((a5 + 374) ^ 0x643C68E0))) ^ (a5 + 374))))(a39);
  *(_BYTE *)(a39 + 91) = ((((6 * (a5 ^ 0x23)) ^ 0x38) + a11) ^ a6) * (a11 - 115);
  return ((uint64_t (*)(void))(*(_QWORD *)(v39 + 8 * ((a5 + 575) ^ 0xD0)) - 8))();
}

uint64_t sub_218EF73F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  return a26(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43);
}

void sub_218EF743C(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v5;

  if (*(_QWORD *)a1)
    v2 = *(_QWORD *)(a1 + 8) == 0x309E6C8145C33AEFLL;
  else
    v2 = 1;
  v5 = !v2 && *(_QWORD *)(a1 + 24) != 0x671084A6E1D34178 && *(_QWORD *)(a1 + 16) != 0x252C3BDA7CBE997ALL;
  v1 = *(_DWORD *)(a1 + 32) ^ (846572393 * ((-2 - ((a1 | 0x78304FE) + (~(_DWORD)a1 | 0xF87CFB01))) ^ 0xCE1FAF48));
  __asm { BR              X10 }
}

uint64_t sub_218EF7544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13, unint64_t *a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_DWORD *)(v15 - 0x671084A6E1D34178) = 878540627;
  a13 = (v19 - 242) ^ (1663139771
                     * ((2 * (&a11 & 0x14DFB8C0) - &a11 - 350206146) ^ 0x93C991B3));
  a14 = &STACK[0x31C5923AD179C036];
  a15 = v16;
  a11 = v17;
  sub_218EF1418((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * ((624 * (a12 == 280600939)) | v19))
                                                                                       - (v19 - 54)
                                                                                       + 335))(v20, v21, v22, v23, v24, v25);
}

uint64_t sub_218EF7608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, int a15, unsigned int a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  *v20 += a10;
  a17 = v22;
  a16 = v23 + 961505453 * (((&a12 | 0x35171987) - (&a12 & 0x35171987)) ^ 0x97ECD721) + 164;
  a13 = &STACK[0x5303038D626F0C4B];
  a14 = v18;
  a12 = v17 + a10;
  v24 = ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v21 + 8 * (v23 - 313)) - 8))(&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * (((a15 != ((v23 + 54) ^ 0x10B9A0E2)) * (3 * (v23 ^ 0x1D0) - 175)) ^ v23))
                                          - 4))(v24);
}

uint64_t sub_218EF76E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;

  *v11 += a10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((1504 * (*(unsigned __int8 *)(v12 - 0x309E6C8145C33AEBLL) == 175)) ^ v13))
                            - 4))();
}

uint64_t sub_218EF7730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int a11, uint64_t a12, unint64_t *a13, int a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  a12 = v17;
  a13 = &STACK[0x4D6564C19868E887];
  a15 = v16 + v15;
  a11 = v21 + 1477295531 * (((~&a11 & 0x221D7EC) - (~&a11 | 0x221D7ED)) ^ 0x352AE2BE) + 316;
  v22 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v19 + 8 * (v21 - 323)) - 12))(&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((619 * (a14 == v20)) ^ v21)) - 4))(v22);
}

void sub_218EF77CC()
{
  uint64_t v0;
  _DWORD *v1;
  int v2;

  *v1 += v2 - 469769540;
  *(_DWORD *)(v0 + 36) = 280600939;
}

uint64_t sub_218EF7830(uint64_t result)
{
  unint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  _BOOL4 v6;
  int v7;

  v1 = 839339309 * ((((2 * result) | 0x371762288C93D502) - result + 0x64744EEBB9B6157FLL) ^ 0xF084E263FAA8F2E0);
  v2 = *(_DWORD *)(result + 36) - 839339309 * ((((2 * result) | 0x8C93D502) - result - 1179249281) ^ 0xFAA8F2E0);
  v3 = *(_QWORD *)result - v1;
  v4 = *(_QWORD *)(result + 16) + v1;
  v5 = v3 == v4;
  v6 = v3 > v4;
  v7 = v5;
  if (((*(_DWORD *)(result + 12)
       + 839339309 * ((((2 * (_DWORD)result) | 0x8C93D502) - (_DWORD)result - 1179249281) ^ 0xFAA8F2E0)) & 1) == 0)
    v6 = v7;
  if (v6)
    v2 = *(_DWORD *)(result + 32) + 839339309 * ((((2 * result) | 0x8C93D502) - result - 1179249281) ^ 0xFAA8F2E0);
  *(_DWORD *)(result + 28) = v2 ^ (*(_DWORD *)(result + 24)
                                 + 839339309 * ((((2 * result) | 0x8C93D502) - result - 1179249281) ^ 0xFAA8F2E0));
  return result;
}

uint64_t *sub_218EF78D0(uint64_t *result)
{
  uint64_t v1;

  v1 = *result;
  *(_QWORD *)(v1 - 0x1BD3A2918E8AF109) = 0xFBDC740BB9F3DCDCLL;
  *(_QWORD *)(v1 - 0x1BD3A2918E8AF101) = 0x5190721660F77F86;
  *(_QWORD *)(v1 - 0x1BD3A2918E8AF0F9) = 0x3DFB83EA3DFB83EALL;
  return result;
}

uint64_t sub_218EF7944(uint64_t result)
{
  int v1;

  if ((*(_BYTE *)(result + 4) - -69 * (result ^ 0x8D) - 21) >= 3u)
    v1 = 280558042;
  else
    v1 = 280600939;
  *(_DWORD *)result = v1;
  return result;
}

uint64_t sub_218EF7980(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;

  v1 = 1543459711
     * (((result | 0x9CC54C17173290E0) - (result | 0x633AB3E8E8CD6F1FLL) + 0x633AB3E8E8CD6F1FLL) ^ 0x4F77E4B15BB09324);
  v2 = *(_QWORD *)(result + 24) + v1;
  v3 = *(_QWORD *)result - v1;
  v4 = v3 == v2;
  v5 = v3 > v2;
  v6 = v4;
  if (((*(_DWORD *)(result + 40) ^ (1543459711
                                   * (((result | 0x173290E0)
                                     - (result | 0xE8CD6F1F)
                                     - 389189857) ^ 0x5BB09324))) & 1) == 0)
    v5 = v6;
  v4 = !v5;
  v7 = 8;
  if (!v4)
    v7 = 16;
  *(_DWORD *)(result + 12) = *(_DWORD *)(result + 36) ^ (1543459711
                                                       * (((result | 0x173290E0) - (result | 0xE8CD6F1F) - 389189857) ^ 0x5BB09324)) ^ *(_DWORD *)(result + v7) ^ (1543459711 * (((result | 0x173290E0) - (result | 0xE8CD6F1F) - 389189857) ^ 0x5BB09324));
  return result;
}

uint64_t sub_218EF7A24(int *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;

  v2 = a1[1] + 1334103649 * (((a1 | 0x53AEBA34) - (a1 & 0x53AEBA34)) ^ 0x3B06729A);
  result = ((uint64_t (*)(char *, char *))*(&off_24DA380E0 + (int)(v2 - 291625795)))((char *)*(&off_24DA380E0 + (int)(v2 ^ 0x1161DBB9)) - 8, (char *)*(&off_24DA380E0 + (int)(v2 ^ 0x1161DB33)) - 8);
  v4 = *(_DWORD *)*(&off_24DA380E0 + (int)(v2 ^ 0x1161DBAF));
  if ((_DWORD)result)
    v4 = 280558633;
  *a1 = v4;
  return result;
}

uint64_t sub_218EF7AE4(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  int v3;
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  uint64_t result;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  unsigned int v89;
  int v90;
  uint64_t v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_DWORD **)(a1 + 16);
  v92 = (*v2 ^ 0xFDFD9FF5) + 525302240 + ((2 * *v2) & 0xFBFB3FEA);
  v93 = (v2[1] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[1]) & 0xFBFB3FEA);
  v94 = (v2[2] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[2]) & 0xFBFB3FEA);
  v95 = (v2[3] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[3]) & 0xFBFB3FEA);
  v96 = (v2[4] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[4]) & 0xFBFB3FEA);
  v97 = (v2[5] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[5]) & 0xFBFB3FEA);
  v98 = (v2[6] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[6]) & 0xFBFB3FEA);
  v99 = (v2[7] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[7]) & 0xFBFB3FEA);
  v100 = (v2[8] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[8]) & 0xFBFB3FEA);
  v101 = (v2[9] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[9]) & 0xFBFB3FEA);
  v102 = (v2[10] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[10]) & 0xFBFB3FEA);
  v103 = (v2[11] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[11]) & 0xFBFB3FEA);
  v104 = (v2[12] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[12]) & 0xFBFB3FEA);
  v105 = (v2[13] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[13]) & 0xFBFB3FEA);
  v106 = (v2[14] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[14]) & 0xFBFB3FEA);
  v107 = (v2[15] ^ 0xFDFD9FF5) + 525302240 + ((2 * v2[15]) & 0xFBFB3FEA);
  v91 = v1;
  v3 = *(_DWORD *)(v1 - 0x88934877EDDC4EFLL);
  v4 = *(_DWORD *)(v1 - 0x88934877EDDC4EBLL);
  v5 = *(_DWORD *)(v1 - 0x88934877EDDC4E7);
  HIDWORD(v6) = *(_DWORD *)(v1 - 0x88934877EDDC4F3) + v92 - 1172469085 + (v4 & v3 | v5 & ~v3);
  LODWORD(v6) = HIDWORD(v6);
  v7 = (v6 >> 25) + v3 - ((2 * ((v6 >> 25) + v3)) & 0x2D0B731E) + 377862543;
  HIDWORD(v6) = v5 + v93 - 881156735 + (v3 & (v7 ^ 0x1685B98F) | v4 & ~(v7 ^ 0x1685B98F));
  LODWORD(v6) = HIDWORD(v6);
  v8 = (v6 >> 20) + (v7 ^ 0x1685B98F) - ((2 * ((v6 >> 20) + (v7 ^ 0x1685B98F))) & 0x3CD8B6C) + 31901110;
  HIDWORD(v6) = v4 + v94 + 114513670 + ((v8 ^ 0x1E6C5B6) & (v7 ^ (v3 - ((2 * v3) & 0x2D0B731E) + 377862543)) ^ v3);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 15) + (v8 ^ 0x1E6C5B6) - ((2 * ((v6 >> 15) + (v8 ^ 0x1E6C5B6))) & 0x307DDAA0) + 406777168;
  v9 = v1 ^ 0x183EED50;
  HIDWORD(v6) = v3
              + v95
              - 1536117479
              + ((((v1 ^ 0x183EED50) & (v7 ^ 0x17637C39 ^ v8))
                + 377862543
                + (~(2 * ((v1 ^ 0x183EED50) & (v7 ^ 0x17637C39 ^ v8))) | 0xD2F48CE1)
                + 1) ^ v7);
  LODWORD(v6) = HIDWORD(v6);
  v10 = (v6 >> 10) + (v1 ^ 0x183EED50) - ((2 * ((v6 >> 10) + (v1 ^ 0x183EED50))) & 0xED9A16EA) - 154334347;
  HIDWORD(v6) = v96
              + (v7 ^ 0x1685B98F)
              - 668011046
              + ((((v10 ^ 0xF6CD0B75) & (v8 ^ 0x19D828E6 ^ v1))
                - ((2 * ((v10 ^ 0xF6CD0B75) & (v8 ^ 0x19D828E6 ^ v1))) & 0x3CD8B6C)
                + 31901110) ^ v8);
  LODWORD(v6) = HIDWORD(v6);
  v11 = (v6 >> 25) + (v10 ^ 0xF6CD0B75) - ((2 * ((v6 >> 25) + (v10 ^ 0xF6CD0B75))) & 0x72027258) - 1191102164;
  HIDWORD(v6) = v97
              + (v8 ^ 0x1E6C5B6)
              + 708488277
              + ((((v11 ^ 0xB901392C) & (v1 ^ 0xEEF3E625 ^ v10))
                - ((2 * ((v11 ^ 0xB901392C) & (v1 ^ 0xEEF3E625 ^ v10))) & 0x307DDAA0)
                + 406777168) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 20) + (v11 ^ 0xB901392C) - ((2 * ((v6 >> 20) + (v11 ^ 0xB901392C))) & 0x329A1016) + 424478731;
  v12 = v1 ^ 0x194D080B;
  HIDWORD(v6) = v98
              + v9
              - 1964823490
              + ((((v1 ^ 0x194D080B) & (v10 ^ 0x4FCC3259 ^ v11))
                - ((2 * ((v1 ^ 0x194D080B) & (v10 ^ 0x4FCC3259 ^ v11))) & 0xED9A16EA)
                - 154334347) ^ v10);
  LODWORD(v6) = HIDWORD(v6);
  v13 = (v6 >> 15) + (v1 ^ 0x194D080B) - ((2 * ((v6 >> 15) + (v1 ^ 0x194D080B))) & 0x92702E2E) + 1228412695;
  HIDWORD(v6) = v99
              + (v10 ^ 0xF6CD0B75)
              - 537298132
              + ((((v13 ^ 0x49381717) & (v11 ^ 0xA04C3127 ^ v1))
                - ((2 * ((v13 ^ 0x49381717) & (v11 ^ 0xA04C3127 ^ v1))) & 0x72027258)
                - 1191102164) ^ v11);
  LODWORD(v6) = HIDWORD(v6);
  v14 = (v6 >> 10) + (v13 ^ 0x49381717) - ((2 * ((v6 >> 10) + (v13 ^ 0x49381717))) & 0xB13660BA) - 660918179;
  HIDWORD(v6) = v100
              + (v11 ^ 0xB901392C)
              + 1278443267
              + ((((v14 ^ 0xD89B305D) & (v1 ^ 0x50751F1C ^ v13))
                - ((2 * ((v14 ^ 0xD89B305D) & (v1 ^ 0x50751F1C ^ v13))) & 0x329A1016)
                + 424478731) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 25) + (v14 ^ 0xD89B305D) - ((2 * ((v6 >> 25) + (v14 ^ 0xD89B305D))) & 0x8F0E154E) + 1200032423;
  v15 = v1 ^ 0x47870AA7;
  HIDWORD(v6) = v101
              + v12
              + 1844960730
              + ((((v1 ^ 0x47870AA7) & (v13 ^ 0x91A3274A ^ v14))
                - ((2 * ((v1 ^ 0x47870AA7) & (v13 ^ 0x91A3274A ^ v14))) & 0x92702E2E)
                + 1228412695) ^ v13);
  LODWORD(v6) = HIDWORD(v6);
  v16 = (v6 >> 20) + (v1 ^ 0x47870AA7) - ((2 * ((v6 >> 20) + (v1 ^ 0x47870AA7))) & 0xD049E694) + 1747252042;
  v17 = v16 ^ 0x6824F34A;
  HIDWORD(v6) = v102
              + (v13 ^ 0x49381717)
              - 491634212
              + ((((v16 ^ 0x6824F34A) & (v14 ^ 0x9F1C3AFA ^ v1))
                - ((2 * ((v16 ^ 0x6824F34A) & (v14 ^ 0x9F1C3AFA ^ v1))) & 0xB13660BA)
                - 660918179) ^ v14);
  LODWORD(v6) = HIDWORD(v6);
  v18 = (v6 >> 15) + (v16 ^ 0x6824F34A) - ((2 * ((v6 >> 15) + (v16 ^ 0x6824F34A))) & 0x28534EC2) - 1809209503;
  v19 = v18 ^ 0x9429A761;
  HIDWORD(v6) = v103
              + (v14 ^ 0xD89B305D)
              + 1812970985
              + ((((v18 ^ 0x9429A761) & (v1 ^ 0x2FA3F9ED ^ v16))
                - ((2 * ((v18 ^ 0x9429A761) & (v1 ^ 0x2FA3F9ED ^ v16))) & 0x8F0E154E)
                + 1200032423) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 10) + (v18 ^ 0x9429A761) - ((2 * ((v6 >> 10) + (v18 ^ 0x9429A761))) & 0xA72B3A58) + 1402314028;
  v20 = v1 ^ 0x53959D2C;
  HIDWORD(v6) = v104
              + v15
              + 1313011533
              + ((((v1 ^ 0x53959D2C) & (v16 ^ 0xFC0D542B ^ v18))
                - ((2 * ((v1 ^ 0x53959D2C) & (v16 ^ 0xFC0D542B ^ v18))) & 0xD049E694)
                + 1747252042) ^ v16);
  LODWORD(v6) = HIDWORD(v6);
  v21 = (v6 >> 25) + (v1 ^ 0x53959D2C) - ((2 * ((v6 >> 25) + (v1 ^ 0x53959D2C))) & 0xF02B5510) - 132797816;
  HIDWORD(v6) = v105
              + v17
              - 531933250
              + ((((v21 ^ 0xF815AA88) & (v18 ^ 0xC7BC3A4D ^ v1))
                - ((2 * ((v21 ^ 0xF815AA88) & (v18 ^ 0xC7BC3A4D ^ v1))) & 0x28534EC2)
                - 1809209503) ^ v18);
  LODWORD(v6) = HIDWORD(v6);
  v22 = (v6 >> 20) + (v21 ^ 0xF815AA88) - ((2 * ((v6 >> 20) + (v21 ^ 0xF815AA88))) & 0xB3CFE4AC) - 639110570;
  v23 = v22 ^ 0xD9E7F256;
  HIDWORD(v6) = v106
              + v19
              - 1993594439
              + ((((v22 ^ 0xD9E7F256) & (v1 ^ 0xAB8037A4 ^ v21))
                - ((2 * ((v22 ^ 0xD9E7F256) & (v1 ^ 0xAB8037A4 ^ v21))) & 0xA72B3A58)
                + 1402314028) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 15) + (v22 ^ 0xD9E7F256) - ((2 * ((v6 >> 15) + (v22 ^ 0xD9E7F256))) & 0x4296884E) - 1588902873;
  v24 = v1 ^ 0xA14B4427;
  HIDWORD(v6) = v107
              + v20
              + 744943180
              + ((((v1 ^ 0xA14B4427) & (v21 ^ 0x21F258DE ^ v22))
                - ((2 * ((v1 ^ 0xA14B4427) & (v21 ^ 0x21F258DE ^ v22))) & 0xF02B5510)
                - 132797816) ^ v21);
  LODWORD(v6) = HIDWORD(v6);
  v25 = (v6 >> 10) + (v1 ^ 0xA14B4427) - ((2 * ((v6 >> 10) + (v1 ^ 0xA14B4427))) & 0xE230492C) + 1897407638;
  HIDWORD(v6) = v93
              + (v21 ^ 0xF815AA88)
              - 657388659
              + ((((v1 ^ 0xD05360B1 ^ v25) & v23) - ((2 * ((v1 ^ 0xD05360B1 ^ v25) & v23)) & 0x4296884E) - 1588902873) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = v25 ^ 0x71182496;
  LODWORD(v1) = (v6 >> 27) + (v25 ^ 0x71182496) - ((2 * ((v6 >> 27) + (v25 ^ 0x71182496))) & 0xB7CCE386) - 605654589;
  HIDWORD(v6) = v98
              + v23
              - 1561093781
              + ((((v25 ^ 0xAAFE5555 ^ v1) & v24) - ((2 * ((v25 ^ 0xAAFE5555 ^ v1) & v24)) & 0xE230492C) + 1897407638) ^ v25);
  LODWORD(v6) = HIDWORD(v6);
  v26 = v1 ^ 0xDBE671C3;
  v27 = (v6 >> 23) + (v1 ^ 0xDBE671C3) - ((2 * ((v6 >> 23) + (v1 ^ 0xDBE671C3))) & 0x8FD77318) - 940852852;
  HIDWORD(v6) = v103
              + v24
              + 152125564
              + ((((v1 ^ 0x1C0DC84F ^ v27) & v2)
                - ((2 * ((v1 ^ 0x1C0DC84F ^ v27) & v2)) & 0xB7CCE386)
                - 605654589) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v28 = v27 ^ 0xC7EBB98C;
  LODWORD(v1) = (v6 >> 18) + (v27 ^ 0xC7EBB98C) - ((2 * ((v6 >> 18) + (v27 ^ 0xC7EBB98C))) & 0x463AF1D2) + 589134057;
  HIDWORD(v6) = v92
              + (_DWORD)v2
              - 865489451
              + ((((v27 ^ 0xE4F6C165 ^ v1) & v26) - ((2 * ((v27 ^ 0xE4F6C165 ^ v1) & v26)) & 0x8FD77318) - 940852852) ^ v27);
  LODWORD(v6) = HIDWORD(v6);
  v29 = v1 ^ 0x231D78E9;
  LODWORD(v2) = (v6 >> 12) + (v1 ^ 0x231D78E9) - ((2 * ((v6 >> 12) + (v1 ^ 0x231D78E9))) & 0xA024A000) + 1343377408;
  HIDWORD(v6) = v97
              + v26
              - 1193150840
              + ((((v1 ^ 0x730F28E9 ^ v2) & v28)
                - ((2 * ((v1 ^ 0x730F28E9 ^ v2) & v28)) & 0x463AF1D2)
                + 589134057) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v30 = v2 ^ 0x50125000;
  LODWORD(v1) = (v6 >> 27)
              + (v2 ^ 0x50125000)
              - ((2 * ((v6 >> 27) + (v2 ^ 0x50125000))) & 0x1BCD6FAA)
              + 233224149;
  HIDWORD(v6) = v102
              + v28
              - 453576066
              + ((((v2 ^ 0x5DF4E7D5 ^ v1) & v29)
                - ((2 * ((v2 ^ 0x5DF4E7D5 ^ v1) & v29)) & 0xA024A000)
                + 1343377408) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v31 = v1 ^ 0xDE6B7D5;
  LODWORD(v2) = (v6 >> 23) + (v1 ^ 0xDE6B7D5) - ((2 * ((v6 >> 23) + (v1 ^ 0xDE6B7D5))) & 0x6CD66E70) - 1234487496;
  HIDWORD(v6) = v107
              + v29
              - 1152070484
              + ((((v1 ^ 0xBB8D80ED ^ v2) & v30)
                - ((2 * ((v1 ^ 0xBB8D80ED ^ v2) & v30)) & 0x1BCD6FAA)
                + 233224149) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v32 = v2 ^ 0xB66B3738;
  LODWORD(v1) = (v6 >> 18)
              + (v2 ^ 0xB66B3738)
              - ((2 * ((v6 >> 18) + (v2 ^ 0xB66B3738))) & 0x24EA0824)
              + 309658642;
  HIDWORD(v6) = v96
              + v30
              - 897129997
              + ((((v2 ^ 0xA41E332A ^ v1) & v31)
                - ((2 * ((v2 ^ 0xA41E332A ^ v1) & v31)) & 0x6CD66E70)
                - 1234487496) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v33 = v1 ^ 0x12750412;
  LODWORD(v2) = (v6 >> 12) + (v1 ^ 0x12750412) - ((2 * ((v6 >> 12) + (v1 ^ 0x12750412))) & 0x140763C8) - 1979469340;
  HIDWORD(v6) = v101
              + v31
              + 76854289
              + ((((v1 ^ 0x9876B5F6 ^ v2) & v32)
                - ((2 * ((v1 ^ 0x9876B5F6 ^ v2) & v32)) & 0x24EA0824)
                + 309658642) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v34 = v2 ^ 0x8A03B1E4;
  LODWORD(v1) = (v6 >> 27)
              + (v2 ^ 0x8A03B1E4)
              - ((2 * ((v6 >> 27) + (v2 ^ 0x8A03B1E4))) & 0xB0C7B084)
              + 1482938434;
  HIDWORD(v6) = v106
              + v32
              - 1511395839
              + ((((v2 ^ 0xD26069A6 ^ v1) & v33)
                - ((2 * ((v2 ^ 0xD26069A6 ^ v1) & v33)) & 0x140763C8)
                - 1979469340) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v35 = v1 ^ 0x5863D842;
  LODWORD(v2) = (v6 >> 23) + (v1 ^ 0x5863D842) - ((2 * ((v6 >> 23) + (v1 ^ 0x5863D842))) & 0x23A878F6) - 1848361861;
  HIDWORD(v6) = v95
              + v33
              - 678956110
              + ((((v1 ^ 0xC9B7E439 ^ v2) & v34)
                + 1482938434
                + (~(2 * ((v1 ^ 0xC9B7E439 ^ v2) & v34)) | 0x4F384F7B)
                + 1) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v36 = v2 ^ 0x91D43C7B;
  LODWORD(v1) = (v6 >> 18)
              + (v2 ^ 0x91D43C7B)
              - ((2 * ((v6 >> 18) + (v2 ^ 0x91D43C7B))) & 0x1C055638)
              - 1912427748;
  HIDWORD(v6) = v100
              + v34
              + 671939352
              + ((((v2 ^ 0x1FD69767 ^ v1) & v35)
                - ((2 * ((v2 ^ 0x1FD69767 ^ v1) & v35)) & 0x23A878F6)
                - 1848361861) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = (v6 >> 12) + (v1 ^ 0x8E02AB1C) - ((2 * ((v6 >> 12) + (v1 ^ 0x8E02AB1C))) & 0xB9655D76) + 1555214011;
  HIDWORD(v6) = v105
              + v35
              - 1936273616
              + ((((v1 ^ 0xD2B005A7 ^ v2) & v36)
                - ((2 * ((v1 ^ 0xD2B005A7 ^ v2) & v36)) & 0x1C055638)
                - 1912427748) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v37 = (v6 >> 27)
      + (v2 ^ 0x5CB2AEBB)
      - ((2 * ((v6 >> 27) + (v2 ^ 0x5CB2AEBB))) & 0x732549AC)
      + 965911766;
  HIDWORD(v6) = v94
              + v36
              - 542995933
              + ((((v2 ^ 0x65200A6D ^ v37) & (v1 ^ 0x8E02AB1C))
                - ((2 * ((v2 ^ 0x65200A6D ^ v37) & (v1 ^ 0x8E02AB1C))) & 0xB9655D76)
                + 1555214011) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v38 = (v6 >> 23) + (v37 ^ 0x3992A4D6) - ((2 * ((v6 >> 23) + (v37 ^ 0x3992A4D6))) & 0x8C1FC7CE) + 1175446503;
  HIDWORD(v6) = v99
              + (v1 ^ 0x8E02AB1C)
              + 1243736324
              + ((((v37 ^ 0x7F9D4731 ^ v38) & (v2 ^ 0x5CB2AEBB))
                - ((2 * ((v37 ^ 0x7F9D4731 ^ v38) & (v2 ^ 0x5CB2AEBB))) & 0x732549AC)
                + 965911766) ^ v37);
  LODWORD(v6) = HIDWORD(v6);
  v39 = v38 ^ 0x460FE3E7;
  v40 = (v6 >> 18) + (v38 ^ 0x460FE3E7) + 1673360991 - ((2 * ((v6 >> 18) + (v38 ^ 0x460FE3E7))) & 0xC77AECBE);
  HIDWORD(v6) = v104
              + (v2 ^ 0x5CB2AEBB)
              + 1876767413
              + ((((v38 ^ 0x25B295B8 ^ v40) & (v37 ^ 0x3992A4D6))
                - ((2 * ((v38 ^ 0x25B295B8 ^ v40) & (v37 ^ 0x3992A4D6))) & 0x8C1FC7CE)
                + 1175446503) ^ v38);
  LODWORD(v6) = HIDWORD(v6);
  v41 = 4 * (v37 & 0xF ^ 6u);
  v42 = *(unsigned int *)((char *)&v92 + v41);
  v43 = (v6 >> 12) + (v40 ^ 0x63BD765F) - ((2 * ((v6 >> 12) + (v40 ^ 0x63BD765F))) & 0xE5BB066E) + 1927119671;
  v44 = 4 * (v43 & 0xF ^ 7u);
  *(unsigned int *)((char *)&v92 + v41) = *(unsigned int *)((char *)&v92 + v44);
  v45 = 4 * ((-17 - (_BYTE)v40) & 0xF);
  *(unsigned int *)((char *)&v92 + v44) = *(unsigned int *)((char *)&v92 + v45);
  v46 = 4 * (v38 & 0xF ^ 7u);
  *(unsigned int *)((char *)&v92 + v45) = *(unsigned int *)((char *)&v92 + v46);
  v47 = 4 * ((v37 >> 4) ^ 0xDu);
  *(unsigned int *)((char *)&v92 + v46) = *(unsigned int *)((char *)&v92 + v47);
  v48 = 4 * ((v43 >> 4) ^ 3u);
  *(unsigned int *)((char *)&v92 + v47) = *(unsigned int *)((char *)&v92 + v48);
  v49 = 4 * ((v40 >> 4) ^ 5u);
  *(unsigned int *)((char *)&v92 + v48) = *(unsigned int *)((char *)&v92 + v49);
  v50 = 4 * ((v38 >> 4) ^ 0xEu);
  *(unsigned int *)((char *)&v92 + v49) = *(unsigned int *)((char *)&v92 + v50);
  *(unsigned int *)((char *)&v92 + v50) = v42;
  HIDWORD(v6) = v97
              + (v37 ^ 0x3992A4D6)
              - 491970707
              + (((v40 ^ 0x1160F568 ^ v43) - ((2 * (v40 ^ 0x1160F568 ^ v43)) & 0x8C1FC7CE) + 1175446503) ^ v38);
  LODWORD(v6) = HIDWORD(v6);
  v51 = (v6 >> 28) + (v43 ^ 0x72DD8337) - ((2 * ((v6 >> 28) + (v43 ^ 0x72DD8337))) & 0x9FA615E) + 83701935;
  v52 = v101;
  HIDWORD(v6) = v100
              + v39
              + 1780800684
              + (((v43 ^ 0x7620B398 ^ v51) - ((2 * (v43 ^ 0x7620B398 ^ v51)) & 0xC77AECBE) + 1673360991) ^ v40);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v49) = v51 ^ 0x4FD30AF;
  LODWORD(v50) = (v6 >> 21) + (v51 ^ 0x4FD30AF) - ((2 * ((v6 >> 21) + (v51 ^ 0x4FD30AF))) & 0xA476AEC6) - 767862941;
  HIDWORD(v6) = v103
              + (v40 ^ 0x63BD765F)
              + 1347438413
              + (((v51 ^ 0xD6C667CC ^ v50) - ((2 * (v51 ^ 0xD6C667CC ^ v50)) & 0xE5BB066E) + 1927119671) ^ v43);
  LODWORD(v6) = HIDWORD(v6);
  v53 = v50 ^ 0xD23B5763;
  v54 = (v6 >> 16) + (v50 ^ 0xD23B5763) - ((2 * ((v6 >> 16) + (v50 ^ 0xD23B5763))) & 0x9CEB4A4A) + 1316332837;
  HIDWORD(v6) = v106
              + (v43 ^ 0x72DD8337)
              - 526901705
              + (((v54 ^ v50 ^ 0x9C4EF246) - 2 * ((v54 ^ v50 ^ 0x9C4EF246) & 0x4FD30BF ^ (v54 ^ v50) & 0x10) + 83701935) ^ v51);
  LODWORD(v6) = HIDWORD(v6);
  v55 = v54 ^ 0x4E75A525;
  v56 = (v6 >> 9) + (v54 ^ 0x4E75A525) - ((2 * ((v6 >> 9) + (v54 ^ 0x4E75A525))) & 0xF1C37130) + 2028058776;
  HIDWORD(v6) = v93
              + v49
              - 2022584209
              + (((v54 ^ 0x36941DBD ^ v56) - ((2 * (v54 ^ 0x36941DBD ^ v56)) & 0xA476AEC6) - 767862941) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 28) + (v56 ^ 0x78E1B898) - ((2 * ((v6 >> 28) + (v56 ^ 0x78E1B898))) & 0xEE58C586) + 1999397571;
  HIDWORD(v6) = v96
              + v53
              + 781301204
              + (((v56 ^ 0xFCDDA5B ^ v50) - ((2 * (v56 ^ 0xFCDDA5B ^ v50)) & 0x9CEB4A4A) + 1316332837) ^ v54);
  LODWORD(v6) = HIDWORD(v6);
  v57 = v50 ^ 0x772C62C3;
  v58 = (v6 >> 21) + (v50 ^ 0x772C62C3) - ((2 * ((v6 >> 21) + (v50 ^ 0x772C62C3))) & 0x60B0C002) + 811098113;
  HIDWORD(v6) = v99
              + v55
              - 647089781
              + (((v50 ^ 0x477402C2 ^ v58) - ((2 * (v50 ^ 0x477402C2 ^ v58)) & 0xF1C37130) + 2028058776) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  v59 = v58 ^ 0x30586001;
  v60 = (v6 >> 16) + (v58 ^ 0x30586001) - ((2 * ((v6 >> 16) + (v58 ^ 0x30586001))) & 0xC26BF4A0) + 1630927440;
  HIDWORD(v6) = v102
              + (v56 ^ 0x78E1B898)
              - 1586322789
              + (((v58 ^ 0x516D9A51 ^ v60) - ((2 * (v58 ^ 0x516D9A51 ^ v60)) & 0xEE58C586) + 1999397571) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 9) + (v60 ^ 0x6135FA50) - ((2 * ((v6 >> 9) + (v60 ^ 0x6135FA50))) & 0xCF20F0C0) - 409962400;
  HIDWORD(v6) = v105
              + v57
              + 189687025
              + (((v50 ^ v60 ^ 0x86A58230) - ((2 * (v50 ^ v60)) & 0x60B0C002) + 811098113) ^ v58);
  LODWORD(v6) = HIDWORD(v6);
  v61 = v50 ^ 0xE7907860;
  v62 = (v6 >> 28) + (v50 ^ 0xE7907860) - ((2 * ((v6 >> 28) + (v50 ^ 0xE7907860))) & 0x63633918) + 833723532;
  HIDWORD(v6) = v92
              + v59
              - 850129371
              + (((v50 ^ 0xD621E4EC ^ v62) - ((2 * (v50 ^ 0xD621E4EC ^ v62)) & 0xC26BF4A0) + 1630927440) ^ v60);
  LODWORD(v6) = HIDWORD(v6);
  v63 = v62 ^ 0x31B19C8C;
  v64 = (v6 >> 21) + (v62 ^ 0x31B19C8C) - ((2 * ((v6 >> 21) + (v62 ^ 0x31B19C8C))) & 0x1C0981BA) + 235192541;
  result = v94;
  HIDWORD(v6) = v95
              + (v60 ^ 0x6135FA50)
              - 1214114128
              + (((v62 ^ 0x3FB55C51 ^ v64) - ((2 * (v62 ^ 0x3FB55C51 ^ v64)) & 0xCF20F0C0) - 409962400) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 16) + (v64 ^ 0xE04C0DD) - ((2 * ((v6 >> 16) + (v64 ^ 0xE04C0DD))) & 0xB3EA90D6) - 638236565;
  HIDWORD(v6) = v98
              + v61
              - 415562960
              + (((v64 ^ 0xD7F188B6 ^ v50) - ((2 * (v64 ^ 0xD7F188B6 ^ v50)) & 0x63633918) + 833723532) ^ v62);
  LODWORD(v6) = HIDWORD(v6);
  v66 = v50 ^ 0xD9F5486B;
  v67 = (v6 >> 9) + (v50 ^ 0xD9F5486B) - ((2 * ((v6 >> 9) + (v50 ^ 0xD9F5486B))) & 0xA7FED8DA) - 738235283;
  HIDWORD(v6) = v101
              + v63
              - 1131956636
              + (((v50 ^ 0xA0A2406 ^ v67) - ((2 * (v50 ^ 0xA0A2406 ^ v67)) & 0x1C0981BA) + 235192541) ^ v64);
  LODWORD(v6) = HIDWORD(v6);
  v68 = (v6 >> 28) + (v67 ^ 0xD3FF6C6D) - ((2 * ((v6 >> 28) + (v67 ^ 0xD3FF6C6D))) & 0x3DB7B56A) + 517724853;
  HIDWORD(v6) = v104
              + (v64 ^ 0xE04C0DD)
              - 913407984
              + (((v67 ^ 0xCD24B6D8 ^ v68) - ((2 * (v67 ^ 0xCD24B6D8 ^ v68)) & 0xB3EA90D6) - 638236565) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v49) = v68 ^ 0x1EDBDAB5;
  LODWORD(v50) = (v6 >> 21) + (v68 ^ 0x1EDBDAB5) - ((2 * ((v6 >> 21) + (v68 ^ 0x1EDBDAB5))) & 0xE76C53A8) + 1941318100;
  HIDWORD(v6) = v107
              + v66
              + 39150371
              + (((v50 ^ v68 ^ 0x6D6DF361) - 2 * ((v50 ^ v68 ^ 0x6D6DF361) & 0x53FF6C6F ^ (v50 ^ v68) & 2) - 738235283) ^ v67);
  LODWORD(v6) = HIDWORD(v6);
  v69 = v50 ^ 0x73B629D4;
  v70 = (v6 >> 16) + (v50 ^ 0x73B629D4) - ((2 * ((v6 >> 16) + (v50 ^ 0x73B629D4))) & 0x119F8668) - 1999649996;
  HIDWORD(v6) = v94
              + (v67 ^ 0xD3FF6C6D)
              - 1486930800
              + (((v70 ^ v50 ^ 0xFB79EAE0) - 2 * ((v70 ^ v50 ^ 0xFB79EAE0) & 0x1EDBDAB7 ^ (v70 ^ v50) & 2) + 517724853) ^ v68);
  LODWORD(v6) = HIDWORD(v6);
  v71 = (v6 >> 9) + (v70 ^ 0x88CFC334) - ((2 * ((v6 >> 9) + (v70 ^ 0x88CFC334))) & 0xA9E9FBB2) + 1425341913;
  v72 = v71 ^ 0x54F4FDD9;
  HIDWORD(v6) = v92
              + v49
              - 690222993
              + (((v72 | v50 ^ 0x8C49D62B) - ((2 * (v72 | v50 ^ 0x8C49D62B)) & 0x119F8668) - 1999649996) ^ v70);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 26) + v72 - ((2 * ((v6 >> 26) + v72)) & 0x3CA95EB8) - 1638617252;
  v73 = v50 ^ 0x9E54AF5C;
  HIDWORD(v6) = v99
              + v69
              + 635299266
              + (((v50 ^ 0x9E54AF5C | v70 ^ 0x77303CCB)
                - ((2 * (v50 ^ 0x9E54AF5C | v70 ^ 0x77303CCB)) & 0xA9E9FBB2)
                + 1425341913) ^ v71);
  LODWORD(v6) = HIDWORD(v6);
  v74 = (v6 >> 22) + (v50 ^ 0x9E54AF5C) - ((2 * ((v6 >> 22) + (v50 ^ 0x9E54AF5C))) & 0xD21195A2) - 385299759;
  v75 = v74 ^ 0xE908CAD1;
  HIDWORD(v6) = v106
              + (v70 ^ 0x88CFC334)
              - 1907947054
              + (((v75 | v71 ^ 0xAB0B0226) - ((2 * (v75 | v71 ^ 0xAB0B0226)) & 0x3CA95EB8) - 1638617252) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v49) = (v6 >> 17) + v75 - ((2 * ((v6 >> 17) + v75)) & 0x5F004162) + 796926129;
  v76 = v49 ^ 0x2F8020B1;
  HIDWORD(v6) = v97
              + v72
              - 549026204
              + (((v76 | v50 ^ 0x61AB50A3) - ((2 * (v76 | v50 ^ 0x61AB50A3)) & 0xD21195A2) - 385299759) ^ v74);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 11) + v76 - ((2 * ((v6 >> 11) + v76)) & 0xD7913D86) + 1808309955;
  v77 = v50 ^ 0x6BC89EC3;
  HIDWORD(v6) = v104
              + v73
              + 1208893422
              + (((v77 | v74 ^ 0x16F7352E) - ((2 * (v77 | v74 ^ 0x16F7352E)) & 0x5F004162) + 796926129) ^ v49);
  LODWORD(v6) = HIDWORD(v6);
  v78 = (v6 >> 26) + v77 - ((2 * ((v6 >> 26) + v77)) & 0xEFC748F4) - 136076166;
  v79 = v78 ^ 0xF7E3A47A;
  HIDWORD(v6) = v95
              + v75
              + 1908388541
              + (((v78 ^ 0xF7E3A47A | v49 ^ 0xD07FDF4E)
                - ((2 * (v78 ^ 0xF7E3A47A | v49 ^ 0xD07FDF4E)) & 0xD7913D86)
                + 1808309955) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v49) = (v6 >> 22) + (v78 ^ 0xF7E3A47A) - ((2 * ((v6 >> 22) + (v78 ^ 0xF7E3A47A))) & 0xBF77F226) + 1606154515;
  v80 = v49 ^ 0x5FBBF913;
  HIDWORD(v6) = v102
              + v76
              - 492643672
              + (((v80 | v50 ^ 0x9437613C) - ((2 * (v80 | v50 ^ 0x9437613C)) & 0xEFC748F4) - 136076166) ^ v78);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 17) + v80 - ((2 * ((v6 >> 17) + v80)) & 0x5281E65C) + 692122414;
  v81 = v50 ^ 0x2940F32E;
  HIDWORD(v6) = v93
              + v77
              + 1748452348
              + (((v81 | v78 ^ 0x81C5B85) - ((2 * (v81 | v78 ^ 0x81C5B85)) & 0xBF77F226) + 1606154515) ^ v49);
  LODWORD(v6) = HIDWORD(v6);
  v82 = (v6 >> 11) + v81 - ((2 * ((v6 >> 11) + v81)) & 0x48784610) - 1539562744;
  v83 = v82 ^ 0xA43C2308;
  HIDWORD(v6) = v100
              + v79
              + 1381721210
              + (((v83 | v49 ^ 0xA04406EC) - ((2 * (v83 | v49 ^ 0xA04406EC)) & 0x5281E65C) + 692122414) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v49) = (v6 >> 26) + v83 - ((2 * ((v6 >> 26) + v83)) & 0xB2273B7E) + 1494457791;
  v84 = v49 ^ 0x59139DBF;
  HIDWORD(v6) = v107
              + v80
              - 522203893
              + (((v84 | v50 ^ 0xD6BF0CD1) - ((2 * (v84 | v50 ^ 0xD6BF0CD1)) & 0x48784610) - 1539562744) ^ v82);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 22) + v84 - ((2 * ((v6 >> 22) + v84)) & 0xCC68C15A) - 432774995;
  v85 = v50 ^ 0xE63460AD;
  HIDWORD(v6) = v98
              + v81
              - 2051790529
              + (((v50 ^ 0xE63460AD | v82 ^ 0x5BC3DCF7)
                - ((2 * (v50 ^ 0xE63460AD | v82 ^ 0x5BC3DCF7)) & 0xB2273B7E)
                + 1494457791) ^ v49);
  LODWORD(v6) = HIDWORD(v6);
  v86 = (v6 >> 17) + (v50 ^ 0xE63460AD) - ((2 * ((v6 >> 17) + (v50 ^ 0xE63460AD))) & 0xB729392) - 2051454519;
  v87 = v86 ^ 0x85B949C9;
  HIDWORD(v6) = v105
              + v83
              + 817559500
              + (((v86 ^ 0x85B949C9 | v49 ^ 0xA6EC6240)
                - ((2 * (v86 ^ 0x85B949C9 | v49 ^ 0xA6EC6240)) & 0xCC68C15A)
                - 432774995) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  v88 = (v6 >> 11) + (v86 ^ 0x85B949C9) - ((2 * ((v6 >> 11) + (v86 ^ 0x85B949C9))) & 0xD3943950) - 372630360;
  v89 = v88 ^ 0xE9CA1CA8;
  HIDWORD(v6) = v96
              + (v49 ^ 0x59139DBF)
              - 637115219
              + (((v89 | v50 ^ 0x19CB9F52) - ((2 * (v89 | v50 ^ 0x19CB9F52)) & 0xB729392) - 2051454519) ^ v86);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v50) = (v6 >> 26) + v89 - ((2 * ((v6 >> 26) + v89)) & 0xDB11F3FC) + 1837693438;
  HIDWORD(v6) = v103
              + v85
              - 1611802528
              + (((v50 ^ 0x6D88F9FE | v86 ^ 0x7A46B636)
                - ((2 * (v50 ^ 0x6D88F9FE | v86 ^ 0x7A46B636)) & 0xD3943950)
                - 372630360) ^ v88);
  LODWORD(v6) = HIDWORD(v6);
  *(_DWORD *)(v91 - 0x88934877EDDC4F3) += v50 ^ 0x6D88F9FE;
  v90 = ((2 * ((v6 >> 22) + (v50 ^ 0x6D88F9FE))) & 0x3DACBF9E)
      + (((v6 >> 22) + (v50 ^ 0x6D88F9FE)) ^ 0x1ED65FCF)
      - 517365711;
  HIDWORD(v6) = result
              + v87
              + 227195110
              + (((v90 | v88 ^ 0x1635E357) - ((2 * (v90 | v88 ^ 0x1635E357)) & 0xDB11F3FC) + 1837693438) ^ v50);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v49) = v90 + (v6 >> 17);
  HIDWORD(v6) = v52 + (v88 ^ 0xE9CA1CA8) - 835077700 + ((v49 | v50 ^ 0x92770601) ^ v90);
  LODWORD(v6) = HIDWORD(v6);
  *(_DWORD *)(v91 - 0x88934877EDDC4EFLL) += v49 + (v6 >> 11);
  *(_DWORD *)(v91 - 0x88934877EDDC4EBLL) += v49;
  *(_DWORD *)(v91 - 0x88934877EDDC4E7) += v90;
  return result;
}

uint64_t sub_218EF95D8(uint64_t result)
{
  char v1;
  int v3;

  v1 = 45 * ((2 * ((result ^ 0xB2) & 0x3A) - (result ^ 0xB2) - 59) ^ 0x16);
  if ((*(_BYTE *)(result + 5) - v1) == 128 && (*(_BYTE *)(result + 4) ^ v1) == 42)
    v3 = 280600939;
  else
    v3 = 280558852;
  *(_DWORD *)(result + 8) = v3;
  return result;
}

_BYTE *sub_218EF9648(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_218EF96D8 + 4 * byte_218F11697[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t sub_218EF973C(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)result + 961505453 * ((((2 * result) | 0x7046420C) - result + 1205657338) ^ 0x1AD8EFA0);
  v2 = *(_QWORD *)(result + 8);
  *(_BYTE *)(v2 - 0xABB6C2156F3FC53) = HIBYTE(v1) ^ 0xC;
  *(_BYTE *)(v2 - 0xABB6C2156F3FC52) = BYTE2(v1) ^ 0xA9;
  *(_BYTE *)(v2 - 0xABB6C2156F3FC51) = BYTE1(v1) ^ 0x28;
  *(_BYTE *)(v2 - 0xABB6C2156F3FC50) = v1 ^ 0xF7;
  return result;
}

uint64_t sub_218EF97E8(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;

  v1 = 1332649919
     * ((-2 - ((~result | 0x65DABDB016F764E7) + (result | 0x9A25424FE9089B18))) ^ 0xDF274D0B2B84E015);
  v2 = *(_DWORD *)(result + 16) - v1;
  v3 = *(_DWORD *)result + v1;
  v4 = *(_QWORD *)(result + 8) - v1;
  v5 = *(_DWORD *)(result + 40) ^ v1;
  v6 = *(_QWORD *)(result + 32) + v1;
  v7 = (uint64_t)v4 < (uint64_t)v6;
  v8 = v4 < v6;
  if (((*(_DWORD *)(result + 20) + (_DWORD)v1) & 1) != 0)
    v9 = v7;
  else
    v9 = v8;
  if (v9)
    v10 = v5;
  else
    v10 = v3;
  *(_DWORD *)(result + 24) = v10 ^ v2;
  return result;
}

uint64_t *sub_218EF9890(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 8);
  v4 = (1334103649 * (((&v3 | 0x64926D11) - (&v3 & 0x64926D11)) ^ 0xC3AA5BF)) ^ ((*(_DWORD *)a1 ^ (1543459711 * ((((2 * a1) | 0xC9E17AA8) - a1 + 453984940) ^ 0xA872BE90))) + 1038180572);
  v3 = v1;
  return sub_218EF78D0(&v3);
}

uint64_t *sub_218EF996C(uint64_t a1)
{
  int v1;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8)
     + 1663139771 * ((-2 - ((a1 | 0x4E71650B) + (~(_DWORD)a1 | 0xB18E9AF4))) ^ 0xC9674C79)
     + 1119900074;
  v3 = *(_QWORD *)a1;
  v4 = (1334103649 * ((-617097594 - (&v3 | 0xDB37D686) + (&v3 | 0x24C82979)) ^ 0x4C60E1D7)) ^ v1;
  return sub_218EF78D0(&v3);
}

uint64_t *sub_218EF9A58(uint64_t a1)
{
  int v1;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)a1 + 961505453 * ((((2 * a1) | 0x2E76B836) - a1 + 1757717477) ^ 0x35C092BD) + 337131026;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = (1334103649 * (((&v3 | 0x3E54581C) - (&v3 & 0x3E54581C)) ^ 0x56FC90B2)) ^ v1;
  return sub_218EF78D0(&v3);
}

uint64_t sub_218EF9B30(_QWORD *a1)
{
  uint64_t v1;
  _DWORD *v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  unsigned int v54;
  int v55;
  int v56;
  int v57;
  unsigned int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  uint64_t result;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  unsigned int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  unsigned int v88;
  int v89;
  uint64_t v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v2 = (_DWORD *)*a1;
  v1 = a1[1];
  v91 = (*(_DWORD *)*a1 ^ 0x7E9F7EE8) - 739252424 + ((2 * *(_DWORD *)*a1) & 0xFD3EFDD0);
  v92 = (v2[1] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[1]) & 0xFD3EFDD0);
  v93 = (v2[2] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[2]) & 0xFD3EFDD0);
  v94 = (v2[3] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[3]) & 0xFD3EFDD0);
  v95 = (v2[4] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[4]) & 0xFD3EFDD0);
  v96 = (v2[5] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[5]) & 0xFD3EFDD0);
  v97 = (v2[6] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[6]) & 0xFD3EFDD0);
  v98 = (v2[7] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[7]) & 0xFD3EFDD0);
  v99 = (v2[8] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[8]) & 0xFD3EFDD0);
  v100 = (v2[9] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[9]) & 0xFD3EFDD0);
  v101 = (v2[10] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[10]) & 0xFD3EFDD0);
  v102 = (v2[11] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[11]) & 0xFD3EFDD0);
  v103 = (v2[12] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[12]) & 0xFD3EFDD0);
  v104 = (v2[13] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[13]) & 0xFD3EFDD0);
  v105 = (v2[14] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[14]) & 0xFD3EFDD0);
  v106 = (v2[15] ^ 0x7E9F7EE8) - 739252424 + ((2 * v2[15]) & 0xFD3EFDD0);
  v90 = v1;
  v3 = *(_DWORD *)(v1 - 0x7C81F4D19213F4CBLL);
  v4 = *(_DWORD *)(v1 - 0x7C81F4D19213F4C7);
  v5 = *(_DWORD *)(v1 - 0x7C81F4D19213F4C3);
  v6 = v91;
  HIDWORD(v7) = *(_DWORD *)(v1 - 0x7C81F4D19213F4CFLL) + v91 - 2066006440 + (v4 & v3 | v5 & ~v3);
  LODWORD(v7) = HIDWORD(v7);
  v8 = (v7 >> 25) + v3 - ((2 * ((v7 >> 25) + v3)) & 0x1EB8185E) - 1889792977;
  HIDWORD(v7) = v5 + v92 - 1774694090 + (v3 & (v8 ^ 0x8F5C0C2F) | v4 & ~(v8 ^ 0x8F5C0C2F));
  LODWORD(v7) = HIDWORD(v7);
  v9 = (v7 >> 20) + (v8 ^ 0x8F5C0C2F) - ((2 * ((v7 >> 20) + (v8 ^ 0x8F5C0C2F))) & 0xF7D9F1CA) + 2079127781;
  HIDWORD(v7) = v4 + v93 - 779023685 + ((v9 ^ 0x7BECF8E5) & (v8 ^ (v3 - ((2 * v3) & 0x1EB8185E) - 1889792977)) ^ v3);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v1) = (v7 >> 15) + (v9 ^ 0x7BECF8E5) - ((2 * ((v7 >> 15) + (v9 ^ 0x7BECF8E5))) & 0xE834285E) + 1947866159;
  v10 = v1 ^ 0x741A142F;
  HIDWORD(v7) = v3
              + v94
              + 1865312462
              + ((((v1 ^ 0x741A142F) & (v8 ^ 0xF4B0F4CA ^ v9))
                - ((2 * ((v1 ^ 0x741A142F) & (v8 ^ 0xF4B0F4CA ^ v9))) & 0x1EB8185E)
                - 1889792977) ^ v8);
  LODWORD(v7) = HIDWORD(v7);
  v11 = (v7 >> 10) + (v1 ^ 0x741A142F) - ((2 * ((v7 >> 10) + (v1 ^ 0x741A142F))) & 0x582D9450) + 739691048;
  HIDWORD(v7) = v95
              + (v8 ^ 0x8F5C0C2F)
              - 1561548401
              + ((((v11 ^ 0x2C16CA28) & (v9 ^ 0xFF6ECCA ^ v1))
                - ((2 * ((v11 ^ 0x2C16CA28) & (v9 ^ 0xFF6ECCA ^ v1))) & 0xF7D9F1CA)
                + 2079127781) ^ v9);
  LODWORD(v7) = HIDWORD(v7);
  v12 = (v7 >> 25) + (v11 ^ 0x2C16CA28) - ((2 * ((v7 >> 25) + (v11 ^ 0x2C16CA28))) & 0xB494F9E8) + 1514831092;
  HIDWORD(v7) = v96
              + (v9 ^ 0x7BECF8E5)
              - 185049078
              + ((((v12 ^ 0x5A4A7CF4) & (v1 ^ 0x580CDE07 ^ v11))
                + 1947866159
                + (~(2 * ((v12 ^ 0x5A4A7CF4) & (v1 ^ 0x580CDE07 ^ v11))) | 0x17CBD7A1)
                + 1) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v1) = (v7 >> 20) + (v12 ^ 0x5A4A7CF4) - ((2 * ((v7 >> 20) + (v12 ^ 0x5A4A7CF4))) & 0x7EE074F4) + 1064319610;
  v13 = v1 ^ 0x3F703A7A;
  HIDWORD(v7) = v97
              + v10
              + 1436606451
              + ((((v1 ^ 0x3F703A7A) & (v11 ^ 0x765CB6DC ^ v12))
                - ((2 * ((v1 ^ 0x3F703A7A) & (v11 ^ 0x765CB6DC ^ v12))) & 0x582D9450)
                + 739691048) ^ v11);
  LODWORD(v7) = HIDWORD(v7);
  v14 = (v7 >> 15) + (v1 ^ 0x3F703A7A) - ((2 * ((v7 >> 15) + (v1 ^ 0x3F703A7A))) & 0x5D6F78EA) + 783793269;
  HIDWORD(v7) = v98
              + (v11 ^ 0x2C16CA28)
              - 1430835487
              + ((((v14 ^ 0x2EB7BC75) & (v12 ^ 0x653A468E ^ v1))
                - ((2 * ((v14 ^ 0x2EB7BC75) & (v12 ^ 0x653A468E ^ v1))) & 0xB494F9E8)
                + 1514831092) ^ v12);
  LODWORD(v7) = HIDWORD(v7);
  v15 = (v7 >> 10) + (v14 ^ 0x2EB7BC75) - ((2 * ((v7 >> 10) + (v14 ^ 0x2EB7BC75))) & 0x2BEAB3DE) - 1779082769;
  HIDWORD(v7) = v99
              + (v12 ^ 0x5A4A7CF4)
              + 384905912
              + ((((v15 ^ 0x95F559EF) & (v1 ^ 0x11C7860F ^ v14))
                - ((2 * ((v15 ^ 0x95F559EF) & (v1 ^ 0x11C7860F ^ v14))) & 0x7EE074F4)
                + 1064319610) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v1) = (v7 >> 25) + (v15 ^ 0x95F559EF) - ((2 * ((v7 >> 25) + (v15 ^ 0x95F559EF))) & 0xA533DEC0) + 1385820000;
  v16 = v1 ^ 0x5299EF60;
  HIDWORD(v7) = v100
              + v13
              + 951423375
              + ((((v1 ^ 0x5299EF60) & (v14 ^ 0xBB42E59A ^ v15))
                - ((2 * ((v1 ^ 0x5299EF60) & (v14 ^ 0xBB42E59A ^ v15))) & 0x5D6F78EA)
                + 783793269) ^ v14);
  LODWORD(v7) = HIDWORD(v7);
  v17 = (v7 >> 20) + (v1 ^ 0x5299EF60) - ((2 * ((v7 >> 20) + (v1 ^ 0x5299EF60))) & 0xD95709B6) + 1823179995;
  v18 = v17 ^ 0x6CAB84DB;
  HIDWORD(v7) = v101
              + (v14 ^ 0x2EB7BC75)
              - 1385171567
              + ((((v17 ^ 0x6CAB84DB) & (v15 ^ 0xC76CB68F ^ v1))
                - ((2 * ((v17 ^ 0x6CAB84DB) & (v15 ^ 0xC76CB68F ^ v1))) & 0x2BEAB3DE)
                - 1779082769) ^ v15);
  LODWORD(v7) = HIDWORD(v7);
  v19 = (v7 >> 15) + (v17 ^ 0x6CAB84DB) - ((2 * ((v7 >> 15) + (v17 ^ 0x6CAB84DB))) & 0x27E03518) - 1812981108;
  v20 = v19 ^ 0x93F01A8C;
  HIDWORD(v7) = v102
              + (v15 ^ 0x95F559EF)
              + 919433630
              + ((((v19 ^ 0x93F01A8C) & (v1 ^ 0x3E326BBB ^ v17))
                - ((2 * ((v19 ^ 0x93F01A8C) & (v1 ^ 0x3E326BBB ^ v17))) & 0xA533DEC0)
                + 1385820000) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v1) = (v7 >> 10) + (v19 ^ 0x93F01A8C) - ((2 * ((v7 >> 10) + (v19 ^ 0x93F01A8C))) & 0x9CEA1D64) - 831189326;
  v21 = v1 ^ 0xCE750EB2;
  HIDWORD(v7) = v103
              + v16
              + 419474178
              + ((((v1 ^ 0xCE750EB2) & (v17 ^ 0xFF5B9E57 ^ v19))
                - ((2 * ((v1 ^ 0xCE750EB2) & (v17 ^ 0xFF5B9E57 ^ v19))) & 0xD95709B6)
                + 1823179995) ^ v17);
  LODWORD(v7) = HIDWORD(v7);
  v22 = (v7 >> 25) + (v1 ^ 0xCE750EB2) - ((2 * ((v7 >> 25) + (v1 ^ 0xCE750EB2))) & 0x6B42FE86) - 1247707325;
  HIDWORD(v7) = v104
              + v18
              - 1425470605
              + ((((v22 ^ 0xB5A17F43) & (v19 ^ 0x5D85143E ^ v1))
                - ((2 * ((v22 ^ 0xB5A17F43) & (v19 ^ 0x5D85143E ^ v1))) & 0x27E03518)
                - 1812981108) ^ v19);
  LODWORD(v7) = HIDWORD(v7);
  v23 = (v7 >> 20) + (v22 ^ 0xB5A17F43) - ((2 * ((v7 >> 20) + (v22 ^ 0xB5A17F43))) & 0xA96F9164) - 726153038;
  v24 = v23 ^ 0xD4B7C8B2;
  HIDWORD(v7) = v105
              + v20
              + 1407835502
              + ((((v23 ^ 0xD4B7C8B2) & (v1 ^ 0x7BD471F1 ^ v22))
                - ((2 * ((v23 ^ 0xD4B7C8B2) & (v1 ^ 0x7BD471F1 ^ v22))) & 0x9CEA1D64)
                - 831189326) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v1) = (v7 >> 15) + (v23 ^ 0xD4B7C8B2) - ((2 * ((v7 >> 15) + (v23 ^ 0xD4B7C8B2))) & 0xBF0D8716) + 1602667403;
  v25 = v1 ^ 0x5F86C38B;
  HIDWORD(v7) = v106
              + v21
              - 148594175
              + ((((v1 ^ 0x5F86C38B) & (v22 ^ 0x6116B7F1 ^ v23))
                - ((2 * ((v1 ^ 0x5F86C38B) & (v22 ^ 0x6116B7F1 ^ v23))) & 0x6B42FE86)
                - 1247707325) ^ v22);
  LODWORD(v7) = HIDWORD(v7);
  v26 = (v7 >> 10) + (v1 ^ 0x5F86C38B) - ((2 * ((v7 >> 10) + (v1 ^ 0x5F86C38B))) & 0xA1FEAB8E) - 788572729;
  HIDWORD(v7) = v92
              + (v22 ^ 0xB5A17F43)
              - 1550926014
              + ((((v1 ^ 0x8F79964C ^ v26) & v24) - ((2 * ((v1 ^ 0x8F79964C ^ v26) & v24)) & 0xBF0D8716) + 1602667403) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v2) = v26 ^ 0xD0FF55C7;
  LODWORD(v1) = (v7 >> 27) + (v26 ^ 0xD0FF55C7) - ((2 * ((v7 >> 27) + (v26 ^ 0xD0FF55C7))) & 0x7ECCA728) + 1063670676;
  HIDWORD(v7) = v97
              + v24
              + 1840336160
              + ((((v26 ^ 0xEF990653 ^ v1) & v25) - 788572729 + (~(2 * ((v26 ^ 0xEF990653 ^ v1) & v25)) | 0x5E015471) + 1) ^ v26);
  LODWORD(v7) = HIDWORD(v7);
  v27 = v1 ^ 0x3F665394;
  v28 = (v7 >> 23) + (v1 ^ 0x3F665394) - ((2 * ((v7 >> 23) + (v1 ^ 0x3F665394))) & 0xE7C26FF2) - 203343879;
  HIDWORD(v7) = v102
              + v25
              - 741411791
              + ((((v1 ^ 0xCC87646D ^ v28) & v2)
                - ((2 * ((v1 ^ 0xCC87646D ^ v28) & v2)) & 0x7ECCA728)
                + 1063670676) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  v29 = v28 ^ 0xF3E137F9;
  LODWORD(v1) = (v7 >> 18) + (v28 ^ 0xF3E137F9) - ((2 * ((v7 >> 18) + (v28 ^ 0xF3E137F9))) & 0x4FD6617C) - 1477758786;
  HIDWORD(v7) = v91
              + (_DWORD)v2
              - 1759026806
              + ((((v28 ^ 0x540A0747 ^ v1) & v27) - ((2 * ((v28 ^ 0x540A0747 ^ v1) & v27)) & 0xE7C26FF2) - 203343879) ^ v28);
  LODWORD(v7) = HIDWORD(v7);
  v30 = v1 ^ 0xA7EB30BE;
  LODWORD(v2) = (v7 >> 12) + (v1 ^ 0xA7EB30BE) - ((2 * ((v7 >> 12) + (v1 ^ 0xA7EB30BE))) & 0x2ACF4AC) + 22444630;
  HIDWORD(v7) = v96
              + v27
              - 2086688195
              + ((((v1 ^ 0xA6BD4AE8 ^ v2) & v29)
                - ((2 * ((v1 ^ 0xA6BD4AE8 ^ v2) & v29)) & 0x4FD6617C)
                - 1477758786) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  v31 = v2 ^ 0x1567A56;
  LODWORD(v1) = (v7 >> 27)
              + (v2 ^ 0x1567A56)
              - ((2 * ((v7 >> 27) + (v2 ^ 0x1567A56))) & 0xCD1F04E)
              + 107542567;
  HIDWORD(v7) = v101
              + v29
              - 1347113421
              + ((((v2 ^ 0x73E8271 ^ v1) & v30)
                - ((2 * ((v2 ^ 0x73E8271 ^ v1) & v30)) & 0x2ACF4AC)
                + 22444630) ^ v2);
  LODWORD(v7) = HIDWORD(v7);
  v32 = v1 ^ 0x668F827;
  LODWORD(v2) = (v7 >> 23) + (v1 ^ 0x668F827) - ((2 * ((v7 >> 23) + (v1 ^ 0x668F827))) & 0x89C0CEBE) + 1155557215;
  HIDWORD(v7) = v106
              + v30
              - 2045607839
              + ((((v1 ^ 0x42889F78 ^ v2) & v31)
                - ((2 * ((v1 ^ 0x42889F78 ^ v2) & v31)) & 0xCD1F04E)
                + 107542567) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  v33 = v2 ^ 0x44E0675F;
  LODWORD(v1) = (v7 >> 18)
              + (v2 ^ 0x44E0675F)
              - ((2 * ((v7 >> 18) + (v2 ^ 0x44E0675F))) & 0x744F38F0)
              - 1171809160;
  HIDWORD(v7) = v95
              + v31
              - 1790667352
              + ((((v2 ^ 0xFEC7FB27 ^ v1) & v32)
                - ((2 * ((v2 ^ 0xFEC7FB27 ^ v1) & v32)) & 0x89C0CEBE)
                + 1155557215) ^ v2);
  LODWORD(v7) = HIDWORD(v7);
  v34 = v1 ^ 0xBA279C78;
  LODWORD(v2) = (v7 >> 12) + (v1 ^ 0xBA279C78) - ((2 * ((v7 >> 12) + (v1 ^ 0xBA279C78))) & 0xB3E0E1C6) + 1508929763;
  HIDWORD(v7) = v100
              + v32
              - 816683066
              + ((((v1 ^ 0xE3D7EC9B ^ v2) & v33)
                - ((2 * ((v1 ^ 0xE3D7EC9B ^ v2) & v33)) & 0x744F38F0)
                - 1171809160) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  v35 = v2 ^ 0x59F070E3;
  LODWORD(v1) = (v7 >> 27)
              + (v2 ^ 0x59F070E3)
              - ((2 * ((v7 >> 27) + (v2 ^ 0x59F070E3))) & 0xDE849322)
              + 1866615185;
  HIDWORD(v7) = v105
              + v33
              + 1890034102
              + ((((v2 ^ 0x36B23972 ^ v1) & v34)
                - ((2 * ((v2 ^ 0x36B23972 ^ v1) & v34)) & 0xB3E0E1C6)
                + 1508929763) ^ v2);
  LODWORD(v7) = HIDWORD(v7);
  v36 = v1 ^ 0x6F424991;
  LODWORD(v2) = (v7 >> 23) + (v1 ^ 0x6F424991) - ((2 * ((v7 >> 23) + (v1 ^ 0x6F424991))) & 0x3D823D7E) + 515972799;
  HIDWORD(v7) = v94
              + v34
              - 1572493465
              + ((((v1 ^ 0x7183572E ^ v2) & v35)
                - ((2 * ((v1 ^ 0x7183572E ^ v2) & v35)) & 0xDE849322)
                + 1866615185) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  v37 = v2 ^ 0x1EC11EBF;
  LODWORD(v1) = (v7 >> 18)
              + (v2 ^ 0x1EC11EBF)
              - ((2 * ((v7 >> 18) + (v2 ^ 0x1EC11EBF))) & 0xF39B2A0E)
              + 2043516167;
  HIDWORD(v7) = v99
              + v35
              - 221598003
              + ((((v2 ^ 0x670C8BB8 ^ v1) & v36)
                - ((2 * ((v2 ^ 0x670C8BB8 ^ v1) & v36)) & 0x3D823D7E)
                + 515972799) ^ v2);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v2) = (v7 >> 12) + (v1 ^ 0x79CD9507) - ((2 * ((v7 >> 12) + (v1 ^ 0x79CD9507))) & 0x62A866A4) + 827601746;
  HIDWORD(v7) = v104
              + v36
              + 1465156325
              + ((((v1 ^ 0x4899A655 ^ v2) & v37)
                - ((2 * ((v1 ^ 0x4899A655 ^ v2) & v37)) & 0xF39B2A0E)
                + 2043516167) ^ v1);
  LODWORD(v7) = HIDWORD(v7);
  v38 = (v7 >> 27)
      + (v2 ^ 0x31543352)
      - 421563057
      - ((2 * ((v7 >> 27) + (v2 ^ 0x31543352))) & 0xCDBEEA9E);
  HIDWORD(v7) = v93
              + v37
              - 1436533288
              + ((((v2 ^ 0xD78B461D ^ v38) & (v1 ^ 0x79CD9507))
                - ((2 * ((v2 ^ 0xD78B461D ^ v38) & (v1 ^ 0x79CD9507))) & 0x62A866A4)
                + 827601746) ^ v2);
  LODWORD(v7) = HIDWORD(v7);
  v39 = (v7 >> 23) + (v38 ^ 0xE6DF754F) - ((2 * ((v7 >> 23) + (v38 ^ 0xE6DF754F))) & 0x5B333938) - 1382441828;
  HIDWORD(v7) = v98
              + (v1 ^ 0x79CD9507)
              + 350198969
              + ((((v38 ^ 0x4B46E9D3 ^ v39) & (v2 ^ 0x31543352))
                - ((2 * ((v38 ^ 0x4B46E9D3 ^ v39) & (v2 ^ 0x31543352))) & 0xCDBEEA9E)
                - 421563057) ^ v38);
  LODWORD(v7) = HIDWORD(v7);
  v40 = (v7 >> 18) + (v39 ^ 0xAD999C9C) - ((2 * ((v7 >> 18) + (v39 ^ 0xAD999C9C))) & 0xFF52DA) - 2139117203;
  HIDWORD(v7) = v103
              + (v2 ^ 0x31543352)
              + 983230058
              + ((((v39 ^ 0x2DE635F1 ^ v40) & (v38 ^ 0xE6DF754F))
                - ((2 * ((v39 ^ 0x2DE635F1 ^ v40) & (v38 ^ 0xE6DF754F))) & 0x5B333938)
                - 1382441828) ^ v39);
  LODWORD(v7) = HIDWORD(v7);
  v41 = (v7 >> 12) + (v40 ^ 0x807FA96D) - ((2 * ((v7 >> 12) + (v40 ^ 0x807FA96D))) & 0x9E3E170E) - 820049017;
  v42 = 4 * (~v38 & 0xF);
  v91 = *(unsigned int *)((char *)&v91 + v42);
  *(unsigned int *)((char *)&v91 + v42) = v6;
  LODWORD(v42) = v92;
  v43 = 4 * (v41 & 0xF ^ 7u);
  v92 = *(unsigned int *)((char *)&v91 + v43);
  *(unsigned int *)((char *)&v91 + v43) = v42;
  LODWORD(v42) = v93;
  v44 = 4 * (v40 & 0xF ^ 0xDu);
  v93 = *(unsigned int *)((char *)&v91 + v44);
  *(unsigned int *)((char *)&v91 + v44) = v42;
  LODWORD(v42) = v94;
  v45 = 4 * (v39 & 0xF ^ 0xCu);
  v94 = *(unsigned int *)((char *)&v91 + v45);
  *(unsigned int *)((char *)&v91 + v45) = v42;
  LODWORD(v42) = v95;
  v46 = 4 * ((v38 >> 4) ^ 4u);
  v95 = *(unsigned int *)((char *)&v91 + v46);
  *(unsigned int *)((char *)&v91 + v46) = v42;
  LODWORD(v42) = v96;
  v47 = 4 * ((v41 >> 4) ^ 8u);
  v96 = *(unsigned int *)((char *)&v91 + v47);
  *(unsigned int *)((char *)&v91 + v47) = v42;
  LODWORD(v42) = v97;
  v48 = 4 * ((v40 >> 4) ^ 6u);
  v97 = *(unsigned int *)((char *)&v91 + v48);
  *(unsigned int *)((char *)&v91 + v48) = v42;
  LODWORD(v42) = v98;
  v49 = 4 * ((v39 >> 4) ^ 9u);
  v98 = *(unsigned int *)((char *)&v91 + v49);
  *(unsigned int *)((char *)&v91 + v49) = v42;
  HIDWORD(v7) = v96
              + (v38 ^ 0xE6DF754F)
              - 1385508062
              + (((v40 ^ 0x4F60A2EA ^ v41) - ((2 * (v40 ^ 0x4F60A2EA ^ v41)) & 0x5B333938) - 1382441828) ^ v39);
  LODWORD(v7) = HIDWORD(v7);
  v50 = (v7 >> 28) + (v41 ^ 0xCF1F0B87) - ((2 * ((v7 >> 28) + (v41 ^ 0xCF1F0B87))) & 0x4C2AA8D0) + 638932072;
  v51 = v100;
  HIDWORD(v7) = v99
              + (v39 ^ 0xAD999C9C)
              + 887263329
              + (((v41 ^ 0xE90A5FEF ^ v50) - ((2 * (v41 ^ 0xE90A5FEF ^ v50)) & 0xFF52DA) - 2139117203) ^ v40);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 21) + (v50 ^ 0x26155468) - ((2 * ((v7 >> 21) + (v50 ^ 0x26155468))) & 0x9847E902) + 1277424769;
  HIDWORD(v7) = v102
              + (v40 ^ 0x807FA96D)
              + 453901058
              + (((v42 ^ v50 ^ 0x6A36A0E9) - 820049017 - 2
                                                       * ((v42 ^ v50 ^ 0x6A36A0E9) & 0x4F1F0B97 ^ (v42 ^ v50) & 0x10)) ^ v41);
  LODWORD(v7) = HIDWORD(v7);
  v52 = v42 ^ 0x4C23F481;
  v53 = (v7 >> 16) + (v42 ^ 0x4C23F481) - ((2 * ((v7 >> 16) + (v42 ^ 0x4C23F481))) & 0x23B2E34A) - 1848020571;
  HIDWORD(v7) = v105
              + (v41 ^ 0xCF1F0B87)
              - 1420439060
              + (((v42 ^ 0xDDFA8524 ^ v53) - ((2 * (v42 ^ 0xDDFA8524 ^ v53)) & 0x4C2AA8D0) + 638932072) ^ v50);
  LODWORD(v7) = HIDWORD(v7);
  v54 = v53 ^ 0x91D971A5;
  v55 = (v7 >> 9) + (v53 ^ 0x91D971A5) - ((2 * ((v7 >> 9) + (v53 ^ 0x91D971A5))) & 0x382A89C8) - 1676327708;
  HIDWORD(v7) = v92
              + (v50 ^ 0x26155468)
              + 1378845732
              + (((v55 ^ v53 ^ 0xDCC3541) - 2 * ((v55 ^ v53 ^ 0xDCC3541) & 0x4C23F49B ^ (v55 ^ v53) & 0x1A) + 1277424769) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v49) = v55 ^ 0x9C1544E4;
  LODWORD(v42) = (v7 >> 28) + (v55 ^ 0x9C1544E4) - ((2 * ((v7 >> 28) + (v55 ^ 0x9C1544E4))) & 0xC33EE12) + 102364937;
  HIDWORD(v7) = v95
              + v52
              - 112236151
              + (((v55 ^ 0x9A0CB3ED ^ v42) - ((2 * (v55 ^ 0x9A0CB3ED ^ v42)) & 0x23B2E34A) - 1848020571) ^ v53);
  LODWORD(v7) = HIDWORD(v7);
  v56 = v42 ^ 0x619F709;
  v57 = (v7 >> 21) + (v42 ^ 0x619F709) - ((2 * ((v7 >> 21) + (v42 ^ 0x619F709))) & 0x47466140) - 1549586272;
  HIDWORD(v7) = v98
              + v54
              - 1540627136
              + (((v42 ^ 0xA5BAC7A9 ^ v57) - ((2 * (v42 ^ 0xA5BAC7A9 ^ v57)) & 0x382A89C8) - 1676327708) ^ v55);
  LODWORD(v7) = HIDWORD(v7);
  v58 = v57 ^ 0xA3A330A0;
  v59 = (v7 >> 16) + (v57 ^ 0xA3A330A0) - ((2 * ((v7 >> 16) + (v57 ^ 0xA3A330A0))) & 0xFA06609C) - 50122674;
  HIDWORD(v7) = v101
              + v49
              + 1815107152
              + (((v57 ^ 0x5EA000EE ^ v59) - ((2 * (v57 ^ 0x5EA000EE ^ v59)) & 0xC33EE12) + 102364937) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 9) + (v59 ^ 0xFD03304E) - ((2 * ((v7 >> 9) + (v59 ^ 0xFD03304E))) & 0x9B4F8800) + 1302840320;
  HIDWORD(v7) = v104
              + v56
              - 703850330
              + (((v59 ^ 0xB0A4F44E ^ v42) - ((2 * (v59 ^ 0xB0A4F44E ^ v42)) & 0x47466140) - 1549586272) ^ v57);
  LODWORD(v7) = HIDWORD(v7);
  v60 = v42 ^ 0x4DA7C400;
  v61 = (v7 >> 28) + (v42 ^ 0x4DA7C400) - ((2 * ((v7 >> 28) + (v42 ^ 0x4DA7C400))) & 0xE26E9EF4) + 1899450234;
  HIDWORD(v7) = v91
              + v58
              - 1743666726
              + (((v42 ^ 0x3C908B7A ^ v61) - ((2 * (v42 ^ 0x3C908B7A ^ v61)) & 0xFA06609C) - 50122674) ^ v59);
  LODWORD(v7) = HIDWORD(v7);
  v62 = v61 ^ 0x71374F7A;
  v63 = (v7 >> 21) + (v61 ^ 0x71374F7A) - ((2 * ((v7 >> 21) + (v61 ^ 0x71374F7A))) & 0x672C79CA) + 865484005;
  result = v93;
  HIDWORD(v7) = v94
              + (v59 ^ 0xFD03304E)
              - 2107651483
              + (((v61 ^ 0x42A1739F ^ v63) - ((2 * (v61 ^ 0x42A1739F ^ v63)) & 0x9B4F8800) + 1302840320) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 16) + (v63 ^ 0x33963CE5) - ((2 * ((v7 >> 16) + (v63 ^ 0x33963CE5))) & 0xFD26816A) + 2123579573;
  HIDWORD(v7) = v97
              + v60
              - 1309100315
              + (((v42 ^ v63 ^ 0x4D057C50) - 2 * ((v42 ^ v63 ^ 0x4D057C50) & 0x71374F7F ^ (v42 ^ v63) & 5) + 1899450234) ^ v61);
  LODWORD(v7) = HIDWORD(v7);
  v65 = v42 ^ 0x7E9340B5;
  LODWORD(v49) = (v7 >> 9) + (v42 ^ 0x7E9340B5) - ((2 * ((v7 >> 9) + (v42 ^ 0x7E9340B5))) & 0xA53CEE7E) - 761366721;
  HIDWORD(v7) = v100
              + v62
              - 2025493991
              + (((v42 ^ 0xAC0D378A ^ v49) - ((2 * (v42 ^ 0xAC0D378A ^ v49)) & 0x672C79CA) + 865484005) ^ v63);
  LODWORD(v7) = HIDWORD(v7);
  v66 = v49 ^ 0xD29E773F;
  v67 = (v7 >> 28) + (v49 ^ 0xD29E773F) - ((2 * ((v7 >> 28) + (v49 ^ 0xD29E773F))) & 0x44AD4C74) + 576103994;
  HIDWORD(v7) = v103
              + (v63 ^ 0x33963CE5)
              - 1806945339
              + (((v49 ^ 0xF0C8D105 ^ v67) - ((2 * (v49 ^ 0xF0C8D105 ^ v67)) & 0xFD26816A) + 2123579573) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 21) + (v67 ^ 0x2256A63A) - ((2 * ((v7 >> 21) + (v67 ^ 0x2256A63A))) & 0x569C3BD4) - 1420943894;
  HIDWORD(v7) = v106
              + v65
              - 854386984
              + (((v67 ^ 0x8918BBD0 ^ v42) - ((2 * (v67 ^ 0x8918BBD0 ^ v42)) & 0xA53CEE7E) - 761366721) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  v68 = v42 ^ 0xAB4E1DEA;
  LODWORD(v49) = (v7 >> 16) + (v42 ^ 0xAB4E1DEA) - ((2 * ((v7 >> 16) + (v42 ^ 0xAB4E1DEA))) & 0x9D5CC3F8) + 1320051196;
  HIDWORD(v7) = v93
              + v66
              + 1914499141
              + (((v42 ^ 0xE5E07C16 ^ v49) - ((2 * (v42 ^ 0xE5E07C16 ^ v49)) & 0x44AD4C74) + 576103994) ^ v67);
  LODWORD(v7) = HIDWORD(v7);
  v69 = v49 ^ 0x4EAE61FC;
  v70 = (v7 >> 9) + (v49 ^ 0x4EAE61FC) - ((2 * ((v7 >> 9) + (v49 ^ 0x4EAE61FC))) & 0xC11E249A) + 1619989069;
  v71 = v70 ^ 0x608F124D;
  HIDWORD(v7) = v91
              + (v67 ^ 0x2256A63A)
              - 1583760348
              + (((v71 | v42 ^ 0x54B1E215) - ((2 * (v71 | v42 ^ 0x54B1E215)) & 0x9D5CC3F8) + 1320051196) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 26) + v71 - ((2 * ((v7 >> 26) + v71)) & 0xF18BCE70) + 2026235704;
  v72 = v42 ^ 0x78C5E738;
  HIDWORD(v7) = v98
              + v68
              - 258238089
              + (((v42 ^ 0x78C5E738 | v49 ^ 0xB1519E03)
                - ((2 * (v42 ^ 0x78C5E738 | v49 ^ 0xB1519E03)) & 0xC11E249A)
                + 1619989069) ^ v70);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v49) = (v7 >> 22) + (v42 ^ 0x78C5E738) - ((2 * ((v7 >> 22) + (v42 ^ 0x78C5E738))) & 0xFF2A1DE4) + 2140475122;
  v73 = v70 ^ 0x9F70EDB2;
  v74 = v49 ^ 0x7F950EF2;
  HIDWORD(v7) = v105 + v69 + 1493482887 + (((v74 | v73) - ((2 * (v74 | v73)) & 0xF18BCE70) + 2026235704) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  v75 = (v7 >> 17) + v74 - ((2 * ((v7 >> 17) + v74)) & 0xD2AC1214) + 1767246090;
  v76 = v75 ^ 0x6956090A;
  HIDWORD(v7) = v96
              + v71
              - 1442563559
              + (((v76 | v42 ^ 0x873A18C7) - ((2 * (v76 | v42 ^ 0x873A18C7)) & 0xFF2A1DE4) + 2140475122) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 11) + v76 - ((2 * ((v7 >> 11) + v76)) & 0x316CFFF6) + 414613499;
  v77 = v42 ^ 0x18B67FFB;
  HIDWORD(v7) = v103
              + v72
              + 315356067
              + (((v77 | v49 ^ 0x806AF10D) - ((2 * (v77 | v49 ^ 0x806AF10D)) & 0xD2AC1214) + 1767246090) ^ v75);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v49) = (v7 >> 26) + v77 - ((2 * ((v7 >> 26) + v77)) & 0x35FF89F6) - 1694513925;
  v78 = v49 ^ 0x9AFFC4FB;
  HIDWORD(v7) = v94
              + v74
              + 1014851186
              + (((v49 ^ 0x9AFFC4FB | v75 ^ 0x96A9F6F5)
                - ((2 * (v49 ^ 0x9AFFC4FB | v75 ^ 0x96A9F6F5)) & 0x316CFFF6)
                + 414613499) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  v79 = (v7 >> 22) + (v49 ^ 0x9AFFC4FB) - ((2 * ((v7 >> 22) + (v49 ^ 0x9AFFC4FB))) & 0x8C0E1A9A) + 1174867277;
  v80 = v79 ^ 0x46070D4D;
  HIDWORD(v7) = v101
              + v76
              - 1386181027
              + (((v80 | v42 ^ 0xE7498004) - ((2 * (v80 | v42 ^ 0xE7498004)) & 0x35FF89F6) - 1694513925) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 17) + v80 - ((2 * ((v7 >> 17) + v80)) & 0xEB637E4) + 123411442;
  v81 = v42 ^ 0x75B1BF2;
  HIDWORD(v7) = v92
              + v77
              + 854914993
              + (((v42 ^ 0x75B1BF2 | v49 ^ 0x65003B04)
                - ((2 * (v42 ^ 0x75B1BF2 | v49 ^ 0x65003B04)) & 0x8C0E1A9A)
                + 1174867277) ^ v79);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v49) = (v7 >> 11) + (v42 ^ 0x75B1BF2) - ((2 * ((v7 >> 11) + (v42 ^ 0x75B1BF2))) & 0x6CD2508E) - 1234622393;
  v82 = v49 ^ 0xB6692847;
  HIDWORD(v7) = v99
              + v78
              + 488183855
              + (((v82 | v79 ^ 0xB9F8F2B2) - ((2 * (v82 | v79 ^ 0xB9F8F2B2)) & 0xEB637E4) + 123411442) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  v83 = (v7 >> 26) + v82 - ((2 * ((v7 >> 26) + v82)) & 0xB535E680) + 1520104256;
  v84 = v83 ^ 0x5A9AF340;
  HIDWORD(v7) = v106
              + v80
              - 1415741248
              + (((v84 | v42 ^ 0xF8A4E40D) - ((2 * (v84 | v42 ^ 0xF8A4E40D)) & 0x6CD2508E) - 1234622393) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 22) + v84 - ((2 * ((v7 >> 22) + v84)) & 0x52784742) - 1455676511;
  v85 = v42 ^ 0xA93C23A1;
  HIDWORD(v7) = v97
              + v81
              + 1349639412
              + (((v42 ^ 0xA93C23A1 | v49 ^ 0x4996D7B8)
                - ((2 * (v42 ^ 0xA93C23A1 | v49 ^ 0x4996D7B8)) & 0xB535E680)
                + 1520104256) ^ v83);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v49) = (v7 >> 17) + (v42 ^ 0xA93C23A1) - ((2 * ((v7 >> 17) + (v42 ^ 0xA93C23A1))) & 0xCB231ED4) - 443445398;
  v86 = v49 ^ 0xE5918F6A;
  HIDWORD(v7) = v104
              + v82
              - 75977855
              + (((v49 ^ 0xE5918F6A | v83 ^ 0xA5650CBF)
                - ((2 * (v49 ^ 0xE5918F6A | v83 ^ 0xA5650CBF)) & 0x52784742)
                - 1455676511) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  v87 = (v7 >> 11) + (v49 ^ 0xE5918F6A) - ((2 * ((v7 >> 11) + (v49 ^ 0xE5918F6A))) & 0x6C21A080) - 1240412096;
  v88 = v87 ^ 0xB610D040;
  HIDWORD(v7) = v95
              + (v83 ^ 0x5A9AF340)
              - 1530652574
              + (((v88 | v42 ^ 0x56C3DC5E) - ((2 * (v88 | v42 ^ 0x56C3DC5E)) & 0xCB231ED4) - 443445398) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  LODWORD(v42) = (v7 >> 26) + v88 - ((2 * ((v7 >> 26) + v88)) & 0x69D36E7C) - 1259751618;
  HIDWORD(v7) = v102
              + v85
              + 1789627413
              + (((v42 ^ 0xB4E9B73E | v49 ^ 0x1A6E7095)
                - ((2 * (v42 ^ 0xB4E9B73E | v49 ^ 0x1A6E7095)) & 0x6C21A080)
                - 1240412096) ^ v87);
  LODWORD(v7) = HIDWORD(v7);
  *(_DWORD *)(v90 - 0x7C81F4D19213F4CFLL) += v42 ^ 0xB4E9B73E;
  LODWORD(v49) = ((2 * ((v7 >> 22) + (v42 ^ 0xB4E9B73E))) & 0xEB7FEEDC)
               + (((v7 >> 22) + (v42 ^ 0xB4E9B73E)) ^ 0x75BFF76E)
               - 1975514990;
  HIDWORD(v7) = result
              + v86
              - 666342245
              + (((v49 | v87 ^ 0x49EF2FBF) - ((2 * (v49 | v87 ^ 0x49EF2FBF)) & 0x69D36E7C) - 1259751618) ^ v42);
  LODWORD(v7) = HIDWORD(v7);
  v89 = v49 + (v7 >> 17);
  HIDWORD(v7) = v51 + (v87 ^ 0xB610D040) - 1728615055 + ((v89 | v42 ^ 0x4B1648C1) ^ v49);
  LODWORD(v7) = HIDWORD(v7);
  *(_DWORD *)(v90 - 0x7C81F4D19213F4CBLL) += v89 + (v7 >> 11);
  *(_DWORD *)(v90 - 0x7C81F4D19213F4C7) += v89;
  *(_DWORD *)(v90 - 0x7C81F4D19213F4C3) += v49;
  return result;
}

uint64_t NROcmM()
{
  return 16777984;
}

char *sub_218EFB684(char *result, char *a2, unint64_t a3)
{
  unint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  BOOL v11;
  char v12;
  unint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;

  if (((a2 ^ result) & 7) != 0)
  {
    if ((a3 + 7) >= 8)
      return (char *)((uint64_t (*)(void))((char *)&loc_218EFB758 + 4 * byte_218F15190[a3 & 7]))();
  }
  else
  {
    v3 = -(int)result & 7;
    switch((int)v3)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        v4 = *result++;
        *a2++ = v4;
LABEL_6:
        v5 = *result++;
        *a2++ = v5;
LABEL_7:
        v6 = *result++;
        *a2++ = v6;
LABEL_8:
        v7 = *result++;
        *a2++ = v7;
LABEL_9:
        v8 = *result++;
        *a2++ = v8;
LABEL_10:
        v9 = *result++;
        *a2++ = v9;
LABEL_11:
        v10 = *result++;
        *a2++ = v10;
        break;
      default:
        break;
    }
    v11 = a3 >= v3;
    v12 = a3 - v3;
    if (!v11)
      v12 = 0;
    v13 = v12 & 7;
    switch(v13)
    {
      case 0uLL:
        return result;
      case 1uLL:
        goto LABEL_24;
      case 2uLL:
        goto LABEL_23;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        goto LABEL_21;
      case 5uLL:
        goto LABEL_20;
      case 6uLL:
        goto LABEL_19;
      case 7uLL:
        v14 = *result++;
        *a2++ = v14;
LABEL_19:
        v15 = *result++;
        *a2++ = v15;
LABEL_20:
        v16 = *result++;
        *a2++ = v16;
LABEL_21:
        v17 = *result++;
        *a2++ = v17;
LABEL_22:
        v18 = *result++;
        *a2++ = v18;
LABEL_23:
        v19 = *result++;
        *a2++ = v19;
LABEL_24:
        *a2 = *result;
        break;
      default:
        result = (char *)((uint64_t (*)(void))((char *)&loc_218EFB7A4 + 4 * byte_218F1519F[(v13 >> 3) & 7]))();
        break;
    }
  }
  return result;
}

uint64_t sub_218EFB844(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)result ^ (846572393 * ((-2 - ((result | 0x235B6B7C) + (~(_DWORD)result | 0xDCA49483))) ^ 0xEAC7C0CA));
  v2 = *(_QWORD *)(result + 8);
  *(_BYTE *)(v2 - 0x4230C69E815219ECLL) = HIBYTE(v1) ^ 0xDA;
  *(_BYTE *)(v2 - 0x4230C69E815219EBLL) = BYTE2(v1) ^ 0xE0;
  *(_BYTE *)(v2 - 0x4230C69E815219EALL) = BYTE1(v1) ^ 0x2C;
  *(_BYTE *)(v2 - 0x4230C69E815219E9) = v1 ^ 0xFB;
  return result;
}

uint64_t sub_218EFB8FC(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = 846572393 * ((a1 + 1224902210 - 2 * (a1 & 0x49028642)) ^ 0x7F61D20B);
  v2 = *(_DWORD *)(a1 + 16) - v1;
  v3 = *(_QWORD *)a1;
  v4 = *(_DWORD *)(a1 + 20) - v1;
  v5 = 1332649919 * ((&v7 + 1800570260 - 2 * ((unint64_t)&v7 & 0x6B528594)) ^ 0x56210166);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v2 + v5 + 656340242;
  v7 = (v4 ^ 0x80A7DEC3) + v5 + 536010748 + ((2 * v4) & 0xDD9F7FFA ^ 0xDC904278);
  v10 = v3;
  return ((uint64_t (*)(unsigned int *))*(&off_24DA380E0 + (int)(v2 ^ 0xD8E10E69)))(&v7);
}

uint64_t sub_218EFBA34(uint64_t result)
{
  int v1;
  int v3;

  v1 = *(unsigned __int8 *)(result + 4) ^ (101 * ((((2 * result) | 0x46) - result - 35) ^ 0xE3));
  if (v1 == 39 || v1 == 36)
    v3 = 280600939;
  else
    v3 = 280558042;
  *(_DWORD *)result = v3;
  return result;
}

uint64_t sub_218EFBA84(uint64_t result)
{
  unsigned __int8 *v1;
  int v2;

  v1 = *(unsigned __int8 **)(result + 8);
  v2 = (v1[3] << 24) | (v1[2] << 16) | (v1[1] << 8);
  *(_DWORD *)(result + 4) = (v2 | *v1) - 2 * ((v2 | *v1) & 0x7EE3FF7D ^ *v1 & 0xC) + 2128871281;
  return result;
}

uint64_t sub_218EFBAD0(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)result + 1543459711 * ((result + 1369941851 - 2 * (result & 0x51A7A75B)) ^ 0x1D25A49F);
  v2 = *(_QWORD *)(result + 8);
  *(_BYTE *)(v2 - 0x3A9851D08A6E2B24) = HIBYTE(v1) ^ 0x49;
  *(_BYTE *)(v2 - 0x3A9851D08A6E2B23) = BYTE2(v1) ^ 0xC0;
  *(_BYTE *)(v2 - 0x3A9851D08A6E2B22) = BYTE1(v1) ^ 0x4A;
  *(_BYTE *)(v2 - 0x3A9851D08A6E2B21) = v1 ^ 0x62;
  return result;
}

uint64_t sub_218EFBB80(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  int v3;
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  int v61;
  int v62;
  unsigned int v63;
  int v64;
  int v65;
  int v66;
  unsigned int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  uint64_t result;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  unsigned int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  int v88;
  int v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  int v93;
  unsigned int v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD **)(a1 + 8);
  v1 = *(_QWORD *)(a1 + 16);
  v99 = (*v2 ^ 0x7F3BAFBF) - 940050578 + ((2 * *v2) & 0xFE775F7E);
  v100 = (v2[1] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[1]) & 0xFE775F7E);
  v101 = (v2[2] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[2]) & 0xFE775F7E);
  v102 = (v2[3] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[3]) & 0xFE775F7E);
  v103 = (v2[4] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[4]) & 0xFE775F7E);
  v104 = (v2[5] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[5]) & 0xFE775F7E);
  v105 = (v2[6] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[6]) & 0xFE775F7E);
  v106 = (v2[7] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[7]) & 0xFE775F7E);
  v107 = (v2[8] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[8]) & 0xFE775F7E);
  v108 = (v2[9] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[9]) & 0xFE775F7E);
  v109 = (v2[10] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[10]) & 0xFE775F7E);
  v110 = (v2[11] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[11]) & 0xFE775F7E);
  v111 = (v2[12] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[12]) & 0xFE775F7E);
  v112 = (v2[13] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[13]) & 0xFE775F7E);
  v113 = (v2[14] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[14]) & 0xFE775F7E);
  v114 = (v2[15] ^ 0x7F3BAFBF) - 940050578 + ((2 * v2[15]) & 0xFE775F7E);
  v98 = v1;
  v3 = *(_DWORD *)(v1 - 0x161858334005A188);
  v4 = *(_DWORD *)(v1 - 0x161858334005A184);
  v5 = *(_DWORD *)(v1 - 0x161858334005A180);
  HIDWORD(v6) = *(_DWORD *)(v1 - 0x161858334005A18CLL) + v99 - 1875444405 + (v4 & v3 | v5 & ~v3);
  LODWORD(v6) = HIDWORD(v6);
  v7 = (v6 >> 25) + v3 - ((2 * ((v6 >> 25) + v3)) & 0x9616E784) - 888441918;
  HIDWORD(v6) = v5 + v100 - 1584132055 + (v3 & (v7 ^ 0xCB0B73C2) | v4 & ~(v7 ^ 0xCB0B73C2));
  LODWORD(v6) = HIDWORD(v6);
  v8 = (v6 >> 20) + (v7 ^ 0xCB0B73C2) - ((2 * ((v6 >> 20) + (v7 ^ 0xCB0B73C2))) & 0x7D49B19E) - 1096492849;
  HIDWORD(v6) = v4 + v101 - 588461650 + ((v8 ^ 0xBEA4D8CF) & (v7 ^ (v3 - ((2 * v3) & 0x9616E784) - 888441918)) ^ v3);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 15) + (v8 ^ 0xBEA4D8CF) - ((2 * ((v6 >> 15) + (v8 ^ 0xBEA4D8CF))) & 0xB3EDF6A) + 94334901;
  v9 = v1 ^ 0x59F6FB5;
  HIDWORD(v6) = v3
              + v102
              + 2055874497
              + ((((v1 ^ 0x59F6FB5) & (v7 ^ 0x75AFAB0D ^ v8))
                - ((2 * ((v1 ^ 0x59F6FB5) & (v7 ^ 0x75AFAB0D ^ v8))) & 0x9616E784)
                - 888441918) ^ v7);
  LODWORD(v6) = HIDWORD(v6);
  v10 = (v6 >> 10) + (v1 ^ 0x59F6FB5) - ((2 * ((v6 >> 10) + (v1 ^ 0x59F6FB5))) & 0xC20F68D2) + 1627894889;
  HIDWORD(v6) = v103
              + (v7 ^ 0xCB0B73C2)
              - 1370986366
              + ((((v10 ^ 0x6107B469) & (v8 ^ 0xBB3BB77A ^ v1))
                - ((2 * ((v10 ^ 0x6107B469) & (v8 ^ 0xBB3BB77A ^ v1))) & 0x7D49B19E)
                - 1096492849) ^ v8);
  LODWORD(v6) = HIDWORD(v6);
  v11 = (v6 >> 25) + (v10 ^ 0x6107B469) - ((2 * ((v6 >> 25) + (v10 ^ 0x6107B469))) & 0xD6E1FE74) - 344916166;
  LODWORD(v2) = v11 ^ 0xEB70FF3A;
  HIDWORD(v6) = v104
              + (v8 ^ 0xBEA4D8CF)
              + 5512957
              + ((((v11 ^ 0xEB70FF3A) & (v1 ^ 0x6498DBDC ^ v10))
                - ((2 * ((v11 ^ 0xEB70FF3A) & (v1 ^ 0x6498DBDC ^ v10))) & 0xB3EDF6A)
                + 94334901) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 20) + (v11 ^ 0xEB70FF3A) - ((2 * ((v6 >> 20) + (v11 ^ 0xEB70FF3A))) & 0xCC863894) + 1715674186;
  v12 = v1 ^ 0x66431C4A;
  HIDWORD(v6) = v105
              + v9
              + 1627168486
              + ((((v1 ^ 0x66431C4A) & (v10 ^ 0x8A774B53 ^ v11))
                - ((2 * ((v1 ^ 0x66431C4A) & (v10 ^ 0x8A774B53 ^ v11))) & 0xC20F68D2)
                + 1627894889) ^ v10);
  LODWORD(v6) = HIDWORD(v6);
  v13 = (v6 >> 15) + (v1 ^ 0x66431C4A) - ((2 * ((v6 >> 15) + (v1 ^ 0x66431C4A))) & 0x48EE261A) - 1535700211;
  HIDWORD(v6) = v106
              + (v10 ^ 0x6107B469)
              - 1240273452
              + ((((v13 ^ 0xA477130D) & (v11 ^ 0x8D33E370 ^ v1))
                - ((2 * ((v13 ^ 0xA477130D) & (v11 ^ 0x8D33E370 ^ v1))) & 0xD6E1FE74)
                - 344916166) ^ v11);
  LODWORD(v6) = HIDWORD(v6);
  v14 = (v6 >> 10) + (v13 ^ 0xA477130D) - ((2 * ((v6 >> 10) + (v13 ^ 0xA477130D))) & 0x852364FE) - 1030638977;
  v15 = v14 ^ 0xC291B27F;
  HIDWORD(v6) = v107
              + (_DWORD)v2
              + 575467947
              + ((((v14 ^ 0xC291B27F) & (v1 ^ 0xC2340F47 ^ v13))
                - ((2 * ((v14 ^ 0xC291B27F) & (v1 ^ 0xC2340F47 ^ v13))) & 0xCC863894)
                + 1715674186) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 25) + (v14 ^ 0xC291B27F) - ((2 * ((v6 >> 25) + (v14 ^ 0xC291B27F))) & 0x3458C55C) + 439116462;
  v16 = v1 ^ 0x1A2C62AE;
  HIDWORD(v6) = v108
              + v12
              + 1141985410
              + ((((v1 ^ 0x1A2C62AE) & (v13 ^ 0x66E6A172 ^ v14))
                - ((2 * ((v1 ^ 0x1A2C62AE) & (v13 ^ 0x66E6A172 ^ v14))) & 0x48EE261A)
                - 1535700211) ^ v13);
  LODWORD(v6) = HIDWORD(v6);
  v17 = (v6 >> 20) + (v1 ^ 0x1A2C62AE) - ((2 * ((v6 >> 20) + (v1 ^ 0x1A2C62AE))) & 0x1909D664) - 1937446094;
  v18 = v17 ^ 0x8C84EB32;
  HIDWORD(v6) = v109
              + (v13 ^ 0xA477130D)
              - 1194609532
              + ((((v17 ^ 0x8C84EB32) & (v14 ^ 0xD8BDD0D1 ^ v1))
                - ((2 * ((v17 ^ 0x8C84EB32) & (v14 ^ 0xD8BDD0D1 ^ v1))) & 0x852364FE)
                - 1030638977) ^ v14);
  LODWORD(v6) = HIDWORD(v6);
  v19 = (v6 >> 15) + (v17 ^ 0x8C84EB32) - ((2 * ((v6 >> 15) + (v17 ^ 0x8C84EB32))) & 0x4BA57E28) - 1512915180;
  v20 = v19 ^ 0xA5D2BF14;
  HIDWORD(v6) = v110
              + v15
              + 1109995665
              + ((((v19 ^ 0xA5D2BF14) & (v1 ^ 0x96A8899C ^ v17))
                - ((2 * ((v19 ^ 0xA5D2BF14) & (v1 ^ 0x96A8899C ^ v17))) & 0x3458C55C)
                + 439116462) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 10) + (v19 ^ 0xA5D2BF14) - ((2 * ((v6 >> 10) + (v19 ^ 0xA5D2BF14))) & 0xD376EAF4) + 1773892986;
  v21 = v1 ^ 0x69BB757A;
  HIDWORD(v6) = v111
              + v16
              + 610036213
              + ((((v1 ^ 0x69BB757A) & (v17 ^ 0x29565426 ^ v19))
                - ((2 * ((v1 ^ 0x69BB757A) & (v17 ^ 0x29565426 ^ v19))) & 0x1909D664)
                - 1937446094) ^ v17);
  LODWORD(v6) = HIDWORD(v6);
  v22 = (v6 >> 25) + (v1 ^ 0x69BB757A) - ((2 * ((v6 >> 25) + (v1 ^ 0x69BB757A))) & 0xC25C979E) - 517059633;
  HIDWORD(v6) = v112
              + v18
              - 1234908570
              + ((((v22 ^ 0xE12E4BCF) & (v19 ^ 0xCC69CA6E ^ v1))
                - ((2 * ((v22 ^ 0xE12E4BCF) & (v19 ^ 0xCC69CA6E ^ v1))) & 0x4BA57E28)
                - 1512915180) ^ v19);
  LODWORD(v6) = HIDWORD(v6);
  v23 = (v6 >> 20) + (v22 ^ 0xE12E4BCF) - ((2 * ((v6 >> 20) + (v22 ^ 0xE12E4BCF))) & 0x255AB432) + 313350681;
  v24 = v23 ^ 0x12AD5A19;
  HIDWORD(v6) = v113
              + v20
              + 1598397537
              + ((((v23 ^ 0x12AD5A19) & (v1 ^ 0x88953EB5 ^ v22))
                - ((2 * ((v23 ^ 0x12AD5A19) & (v1 ^ 0x88953EB5 ^ v22))) & 0xD376EAF4)
                + 1773892986) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v1) = (v6 >> 15) + (v23 ^ 0x12AD5A19) - ((2 * ((v6 >> 15) + (v23 ^ 0x12AD5A19))) & 0x1439B772) - 1977820231;
  v25 = v1 ^ 0x8A1CDBB9;
  HIDWORD(v6) = v114
              + v21
              + 41967860
              + ((((v1 ^ 0x8A1CDBB9) & (v22 ^ 0xF38311D6 ^ v23))
                - ((2 * ((v1 ^ 0x8A1CDBB9) & (v22 ^ 0xF38311D6 ^ v23))) & 0xC25C979E)
                - 517059633) ^ v22);
  LODWORD(v6) = HIDWORD(v6);
  v26 = (v6 >> 10) + (v1 ^ 0x8A1CDBB9) - ((2 * ((v6 >> 10) + (v1 ^ 0x8A1CDBB9))) & 0x33509028) - 1717024748;
  HIDWORD(v6) = v100
              + (v22 ^ 0xE12E4BCF)
              - 1360363979
              + ((((v1 ^ 0x13B493AD ^ v26) & v24) - ((2 * ((v1 ^ 0x13B493AD ^ v26) & v24)) & 0x1439B772) - 1977820231) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = v26 ^ 0x99A84814;
  LODWORD(v1) = (v6 >> 27) + (v26 ^ 0x99A84814) - ((2 * ((v6 >> 27) + (v26 ^ 0x99A84814))) & 0x483231BC) - 1541859106;
  HIDWORD(v6) = v105
              + v24
              + 2030898195
              + ((((v26 ^ 0x3DB150CA ^ v1) & v25) - ((2 * ((v26 ^ 0x3DB150CA ^ v1) & v25)) & 0x33509028) - 1717024748) ^ v26);
  LODWORD(v6) = HIDWORD(v6);
  v27 = v1 ^ 0xA41918DE;
  v28 = (v6 >> 23) + (v1 ^ 0xA41918DE) - ((2 * ((v6 >> 23) + (v1 ^ 0xA41918DE))) & 0xB31C6F0E) - 644991097;
  HIDWORD(v6) = v110
              + v25
              - 550849756
              + ((((v1 ^ 0x7D972F59 ^ v28) & v2)
                - ((2 * ((v1 ^ 0x7D972F59 ^ v28) & v2)) & 0x483231BC)
                - 1541859106) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v29 = v28 ^ 0xD98E3787;
  LODWORD(v1) = (v6 >> 18) + (v28 ^ 0xD98E3787) - ((2 * ((v6 >> 18) + (v28 ^ 0xD98E3787))) & 0xCA9B0E78) + 1699579708;
  HIDWORD(v6) = v99
              + (_DWORD)v2
              - 1568464771
              + ((((v28 ^ 0xBCC3B0BB ^ v1) & v27) - ((2 * ((v28 ^ 0xBCC3B0BB ^ v1) & v27)) & 0xB31C6F0E) - 644991097) ^ v28);
  LODWORD(v6) = HIDWORD(v6);
  v30 = v1 ^ 0x654D873C;
  LODWORD(v2) = (v6 >> 12) + (v1 ^ 0x654D873C) - ((2 * ((v6 >> 12) + (v1 ^ 0x654D873C))) & 0x8FA4DF38) + 1204973468;
  HIDWORD(v6) = v104
              + v27
              - 1896126160
              + ((((v1 ^ 0x229FE8A0 ^ v2) & v29)
                - ((2 * ((v1 ^ 0x229FE8A0 ^ v2) & v29)) & 0xCA9B0E78)
                + 1699579708) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v31 = v2 ^ 0x47D26F9C;
  LODWORD(v1) = (v6 >> 27)
              + (v2 ^ 0x47D26F9C)
              - ((2 * ((v6 >> 27) + (v2 ^ 0x47D26F9C))) & 0x6406AD64)
              + 839079602;
  HIDWORD(v6) = v109
              + v29
              - 1156551386
              + ((((v2 ^ 0x75D1392E ^ v1) & v30)
                - ((2 * ((v2 ^ 0x75D1392E ^ v1) & v30)) & 0x8FA4DF38)
                + 1204973468) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v32 = v1 ^ 0x320356B2;
  LODWORD(v2) = (v6 >> 23) + (v1 ^ 0x320356B2) - ((2 * ((v6 >> 23) + (v1 ^ 0x320356B2))) & 0x7187586C) + 952347702;
  HIDWORD(v6) = v114
              + v30
              - 1855045804
              + ((((v1 ^ 0xAC0FA84 ^ v2) & v31)
                - ((2 * ((v1 ^ 0xAC0FA84 ^ v2) & v31)) & 0x6406AD64)
                + 839079602) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v33 = v2 ^ 0x38C3AC36;
  LODWORD(v1) = (v6 >> 18)
              + (v2 ^ 0x38C3AC36)
              - ((2 * ((v6 >> 18) + (v2 ^ 0x38C3AC36))) & 0x7992C05A)
              - 1127653331;
  HIDWORD(v6) = v103
              + v31
              - 1600105317
              + ((((v2 ^ 0x840ACC1B ^ v1) & v32)
                - ((2 * ((v2 ^ 0x840ACC1B ^ v1) & v32)) & 0x7187586C)
                + 952347702) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v34 = v1 ^ 0xBCC9602D;
  LODWORD(v2) = (v6 >> 12) + (v1 ^ 0xBCC9602D) - ((2 * ((v6 >> 12) + (v1 ^ 0xBCC9602D))) & 0x842E3BD0) - 1038672408;
  HIDWORD(v6) = v108
              + v32
              - 626121031
              + ((((v1 ^ 0x7EDE7DC5 ^ v2) & v33)
                - ((2 * ((v1 ^ 0x7EDE7DC5 ^ v2) & v33)) & 0x7992C05A)
                - 1127653331) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v35 = v2 ^ 0xC2171DE8;
  LODWORD(v1) = (v6 >> 27)
              + (v2 ^ 0xC2171DE8)
              - ((2 * ((v6 >> 27) + (v2 ^ 0xC2171DE8))) & 0xAC5A1A16)
              - 701690613;
  HIDWORD(v6) = v113
              + v33
              + 2080596137
              + ((((v2 ^ 0x143A10E3 ^ v1) & v34)
                - ((2 * ((v2 ^ 0x143A10E3 ^ v1) & v34)) & 0x842E3BD0)
                - 1038672408) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v36 = v1 ^ 0xD62D0D0B;
  LODWORD(v2) = (v6 >> 23) + (v1 ^ 0xD62D0D0B) + 1692727464 + (~(2 * ((v6 >> 23) + (v1 ^ 0xD62D0D0B))) | 0x36360EAF) + 1;
  HIDWORD(v6) = v102
              + v34
              - 1381931430
              + ((((v1 ^ 0xB2C9F5A3 ^ v2) & v35)
                - ((2 * ((v1 ^ 0xB2C9F5A3 ^ v2) & v35)) & 0xAC5A1A16)
                - 701690613) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v37 = v2 ^ 0x64E4F8A8;
  LODWORD(v1) = (v6 >> 18)
              + (v2 ^ 0x64E4F8A8)
              - ((2 * ((v6 >> 18) + (v2 ^ 0x64E4F8A8))) & 0x9544D6C6)
              - 895325341;
  HIDWORD(v6) = v107
              + v35
              - 31035968
              + ((((v2 ^ 0xAE4693CB ^ v1) & v36)
                - ((2 * ((v2 ^ 0xAE4693CB ^ v1) & v36)) & 0xC9C9F150)
                + 1692727464) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = (v6 >> 12) + (v1 ^ 0xCAA26B63) - ((2 * ((v6 >> 12) + (v1 ^ 0xCAA26B63))) & 0xF2DF633A) - 110120547;
  HIDWORD(v6) = v112
              + v36
              + 1655718360
              + ((((v1 ^ 0x33CDDAFE ^ v2) & v37)
                - ((2 * ((v1 ^ 0x33CDDAFE ^ v2) & v37)) & 0x9544D6C6)
                - 895325341) ^ v1);
  LODWORD(v6) = HIDWORD(v6);
  v38 = (v6 >> 27) + (v2 ^ 0xF96FB19D);
  v39 = v38 - ((2 * v38) & 0x6FD4CC00) - 1209375232;
  HIDWORD(v6) = v101
              + v37
              - 1245971253
              + ((((v2 ^ 0x4E85D79D ^ v39) & (v1 ^ 0xCAA26B63))
                - ((2 * ((v2 ^ 0x4E85D79D ^ v39) & (v1 ^ 0xCAA26B63))) & 0xF2DF633A)
                - 110120547) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v40 = (v6 >> 23) + (v39 ^ 0xB7EA6600) - ((2 * ((v6 >> 23) + (v39 ^ 0xB7EA6600))) & 0x7FB948F8) - 1076059012;
  HIDWORD(v6) = v106
              + (v1 ^ 0xCAA26B63)
              + 540761004
              + ((((v39 ^ 0x836C27C ^ v40) & (v2 ^ 0xF96FB19D))
                - ((2 * ((v39 ^ 0x836C27C ^ v40) & (v2 ^ 0xF96FB19D))) & 0x6FD4CC00)
                - 1209375232) ^ v39);
  LODWORD(v6) = HIDWORD(v6);
  v41 = v40 ^ 0xBFDCA47C;
  v42 = (v6 >> 18) + (v40 ^ 0xBFDCA47C) - ((2 * ((v6 >> 18) + (v40 ^ 0xBFDCA47C))) & 0xF59D056C) + 2060354230;
  HIDWORD(v6) = v111
              + (v2 ^ 0xF96FB19D)
              + 1173792093
              + ((((v40 ^ 0xC51226CA ^ v42) & (v39 ^ 0xB7EA6600))
                - 1076059012
                + (~(2 * ((v40 ^ 0xC51226CA ^ v42) & (v39 ^ 0xB7EA6600))) | 0x8046B707)
                + 1) ^ v40);
  LODWORD(v6) = HIDWORD(v6);
  v43 = (v6 >> 12) + (v42 ^ 0x7ACE82B6) - ((2 * ((v6 >> 12) + (v42 ^ 0x7ACE82B6))) & 0x776E3866) - 1145627597;
  v44 = 4 * (v38 & 0xF);
  v45 = *(unsigned int *)((char *)&v99 + v44);
  v46 = 4
      * (((v6 >> 12)
        + (v42 ^ 0xB6)
        - ((2 * ((v6 >> 12) + (v42 ^ 0xB6))) & 0x66)
        + 51) & 0xF ^ 3u);
  *(unsigned int *)((char *)&v99 + v44) = *(unsigned int *)((char *)&v99 + v46);
  *(unsigned int *)((char *)&v99 + v46) = v45;
  v47 = 4 * (v42 & 0xF ^ 6u);
  v48 = *(unsigned int *)((char *)&v99 + v47);
  v49 = 4 * (v40 & 0xF ^ 0xCu);
  *(unsigned int *)((char *)&v99 + v47) = *(unsigned int *)((char *)&v99 + v49);
  *(unsigned int *)((char *)&v99 + v49) = v48;
  v50 = 4 * (v38 >> 4);
  v51 = *(unsigned int *)((char *)&v99 + v50);
  v52 = 4
      * ((((v6 >> 12) + (v42 ^ 0xB6) - ((2 * ((v6 >> 12) + (v42 ^ 0xB6))) & 0x66) + 51) >> 4) ^ 3u);
  *(unsigned int *)((char *)&v99 + v50) = *(unsigned int *)((char *)&v99 + v52);
  *(unsigned int *)((char *)&v99 + v52) = v51;
  v53 = 4 * ((v39 >> 8) & 0xF ^ 6);
  v54 = *(unsigned int *)((char *)&v99 + v53);
  v55 = 4 * ((v43 >> 8) & 0xF ^ 0xC);
  *(unsigned int *)((char *)&v99 + v53) = *(unsigned int *)((char *)&v99 + v55);
  *(unsigned int *)((char *)&v99 + v55) = v54;
  v56 = 4 * (((unsigned __int16)(v38 - ((2 * v38) & 0xCC00) + 26112) >> 12) ^ 6u);
  v57 = *(unsigned int *)((char *)&v99 + v56);
  v58 = 4
      * (((unsigned __int16)((v6 >> 12) + (v42 ^ 0x82B6) - ((2 * ((v6 >> 12) + (v42 ^ 0x82B6))) & 0x3866) + 7219) >> 12) ^ 1u);
  *(unsigned int *)((char *)&v99 + v56) = *(unsigned int *)((char *)&v99 + v58);
  *(unsigned int *)((char *)&v99 + v58) = v57;
  HIDWORD(v6) = v104
              + (v39 ^ 0xB7EA6600)
              - 1194946027
              + (((v42 ^ 0xC1799E85 ^ v43) - ((2 * (v42 ^ 0xC1799E85 ^ v43)) & 0x7FB948F8) - 1076059012) ^ v40);
  LODWORD(v6) = HIDWORD(v6);
  v59 = (v6 >> 28) + (v43 ^ 0xBBB71C33) - ((2 * ((v6 >> 28) + (v43 ^ 0xBBB71C33))) & 0x773A63B8) + 1000157660;
  v60 = v108;
  HIDWORD(v6) = v107
              + v41
              + 1077825364
              + (((v43 ^ 0x802A2DEF ^ v59) - ((2 * (v43 ^ 0x802A2DEF ^ v59)) & 0xF59D056C) + 2060354230) ^ v42);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 21) + (v59 ^ 0x3B9D31DC) - ((2 * ((v6 >> 21) + (v59 ^ 0x3B9D31DC))) & 0x3AC0F0E8) + 492861556;
  HIDWORD(v6) = v110
              + (v42 ^ 0x7ACE82B6)
              + 644463093
              + (((v59 ^ 0x26FD49A8 ^ v56) - ((2 * (v59 ^ 0x26FD49A8 ^ v56)) & 0x776E3866) - 1145627597) ^ v43);
  LODWORD(v6) = HIDWORD(v6);
  v61 = v56 ^ 0x1D607874;
  v62 = (v6 >> 16) + (v56 ^ 0x1D607874) - ((2 * ((v6 >> 16) + (v56 ^ 0x1D607874))) & 0x9958C646) - 861117661;
  HIDWORD(v6) = v113
              + (v43 ^ 0xBBB71C33)
              - 1229877025
              + (((v56 ^ 0xD1CC1B57 ^ v62) - ((2 * (v56 ^ 0xD1CC1B57 ^ v62)) & 0x773A63B8) + 1000157660) ^ v59);
  LODWORD(v6) = HIDWORD(v6);
  v63 = v62 ^ 0xCCAC6323;
  v64 = (v6 >> 9) + (v62 ^ 0xCCAC6323) - ((2 * ((v6 >> 9) + (v62 ^ 0xCCAC6323))) & 0xAEB1A51A) - 682044787;
  HIDWORD(v6) = v100
              + (v59 ^ 0x3B9D31DC)
              + 1569407767
              + (((v62 ^ 0x1BF4B1AE ^ v64) - ((2 * (v62 ^ 0x1BF4B1AE ^ v64)) & 0x3AC0F0E8) + 492861556) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = v64 ^ 0xD758D28D;
  LODWORD(v56) = (v6 >> 28) + (v64 ^ 0xD758D28D) - ((2 * ((v6 >> 28) + (v64 ^ 0xD758D28D))) & 0x498D98B2) - 1530475431;
  HIDWORD(v6) = v103
              + v61
              + 78325884
              + (((v64 ^ 0x739E1ED4 ^ v56) - ((2 * (v64 ^ 0x739E1ED4 ^ v56)) & 0x9958C646) - 861117661) ^ v62);
  LODWORD(v6) = HIDWORD(v6);
  v65 = v56 ^ 0xA4C6CC59;
  v66 = (v6 >> 21) + (v56 ^ 0xA4C6CC59) - ((2 * ((v6 >> 21) + (v56 ^ 0xA4C6CC59))) & 0x3D980722) - 1630796911;
  HIDWORD(v6) = v106
              + v63
              - 1350065101
              + (((v66 ^ v56 ^ 0x3A0ACFC8) - 2 * ((v66 ^ v56 ^ 0x3A0ACFC8) & 0x5758D29D ^ (v66 ^ v56) & 0x10) - 682044787) ^ v64);
  LODWORD(v6) = HIDWORD(v6);
  v67 = v66 ^ 0x9ECC0391;
  v68 = (v6 >> 16) + (v66 ^ 0x9ECC0391) - ((2 * ((v6 >> 16) + (v66 ^ 0x9ECC0391))) & 0x782DCC6E) + 1008133687;
  HIDWORD(v6) = v109
              + (_DWORD)v2
              + 2005669187
              + (((v66 ^ 0xA2DAE5A6 ^ v68) - ((2 * (v66 ^ 0xA2DAE5A6 ^ v68)) & 0x498D98B2) - 1530475431) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 9) + (v68 ^ 0x3C16E637) - ((2 * ((v6 >> 9) + (v68 ^ 0x3C16E637))) & 0x2F698DD6) + 397723371;
  HIDWORD(v6) = v112
              + v65
              - 513288295
              + (((v68 ^ 0x2BA220DC ^ v56) - ((2 * (v68 ^ 0x2BA220DC ^ v56)) & 0x3D980722) - 1630796911) ^ v66);
  LODWORD(v6) = HIDWORD(v6);
  v69 = v56 ^ 0x17B4C6EB;
  LODWORD(v58) = (v6 >> 28) + (v56 ^ 0x17B4C6EB) - ((2 * ((v6 >> 28) + (v56 ^ 0x17B4C6EB))) & 0x79967B86) - 1127531069;
  HIDWORD(v6) = v99
              + v67
              - 1553104691
              + (((v56 ^ 0xAB7FFB28 ^ v58) - ((2 * (v56 ^ 0xAB7FFB28 ^ v58)) & 0x782DCC6E) + 1008133687) ^ v68);
  LODWORD(v6) = HIDWORD(v6);
  v70 = v58 ^ 0xBCCB3DC3;
  v71 = (v6 >> 21) + (v58 ^ 0xBCCB3DC3) - ((2 * ((v6 >> 21) + (v58 ^ 0xBCCB3DC3))) & 0x2054ED94) + 271218378;
  result = v101;
  HIDWORD(v6) = v102
              + (v68 ^ 0x3C16E637)
              - 1917089448
              + (((v71 ^ v58 ^ 0xACE14B09) - 2 * ((v71 ^ v58 ^ 0xACE14B09) & 0x17B4C6EF ^ (v71 ^ v58) & 4) + 397723371) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 16) + (v71 ^ 0x102A76CA) - ((2 * ((v6 >> 16) + (v71 ^ 0x102A76CA))) & 0x3773B718) + 465165196;
  HIDWORD(v6) = v105
              + v69
              - 1118538280
              + (((v56 ^ v71 ^ 0xB93AD46) - 2 * ((v56 ^ v71 ^ 0xB93AD46) & 0x3CCB3DD3 ^ (v56 ^ v71) & 0x10) - 1127531069) ^ v58);
  LODWORD(v6) = HIDWORD(v6);
  v73 = v56 ^ 0x1BB9DB8C;
  LODWORD(v58) = (v6 >> 9) + (v56 ^ 0x1BB9DB8C) - ((2 * ((v6 >> 9) + (v56 ^ 0x1BB9DB8C))) & 0x5201F576) + 687930043;
  HIDWORD(v6) = v108
              + v70
              - 1834931956
              + (((v56 ^ 0x32B92137 ^ v58) - ((2 * (v56 ^ 0x32B92137 ^ v58)) & 0x2054ED94) + 271218378) ^ v71);
  LODWORD(v6) = HIDWORD(v6);
  v74 = v58 ^ 0x2900FABB;
  v75 = (v6 >> 28) + (v58 ^ 0x2900FABB) - ((2 * ((v6 >> 28) + (v58 ^ 0x2900FABB))) & 0xC51760FA) - 494161795;
  HIDWORD(v6) = v111
              + (v71 ^ 0x102A76CA)
              - 1616383304
              + (((v58 ^ 0xCB8B4AC6 ^ v75) - ((2 * (v58 ^ 0xCB8B4AC6 ^ v75)) & 0x3773B718) + 465165196) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 21) + (v75 ^ 0xE28BB07D) - ((2 * ((v6 >> 21) + (v75 ^ 0xE28BB07D))) & 0xE10B46D8) - 259677332;
  HIDWORD(v6) = v114
              + v73
              - 663824949
              + (((v75 ^ 0x120E1311 ^ v56) - ((2 * (v75 ^ 0x120E1311 ^ v56)) & 0x5201F576) + 687930043) ^ v58);
  LODWORD(v6) = HIDWORD(v6);
  v76 = v56 ^ 0xF085A36C;
  LODWORD(v58) = (v6 >> 16) + (v56 ^ 0xF085A36C) - ((2 * ((v6 >> 16) + (v56 ^ 0xF085A36C))) & 0x1982995E) + 213994671;
  HIDWORD(v6) = v101
              + v74
              + 2105061176
              + (((v56 ^ 0xFC44EFC3 ^ v58) - ((2 * (v56 ^ 0xFC44EFC3 ^ v58)) & 0xC51760FA) - 494161795) ^ v75);
  LODWORD(v6) = HIDWORD(v6);
  v77 = (v6 >> 9) + (v58 ^ 0xCC14CAF) - ((2 * ((v6 >> 9) + (v58 ^ 0xCC14CAF))) & 0x563534B2) - 1424319911;
  v78 = v77 ^ 0xAB1A9A59;
  HIDWORD(v6) = v99
              + (v75 ^ 0xE28BB07D)
              - 1393198313
              + (((v78 | v56 ^ 0xF7A5C93) - ((2 * (v78 | v56 ^ 0xF7A5C93)) & 0x1982995E) + 213994671) ^ v58);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 26) + v78 - ((2 * ((v6 >> 26) + v78)) & 0xF46E603E) - 97046497;
  v79 = v56 ^ 0xFA37301F;
  HIDWORD(v6) = v106
              + v76
              - 67676054
              + (((v56 ^ 0xFA37301F | v58 ^ 0xF33EB350)
                - ((2 * (v56 ^ 0xFA37301F | v58 ^ 0xF33EB350)) & 0x563534B2)
                - 1424319911) ^ v77);
  LODWORD(v6) = HIDWORD(v6);
  v80 = (v6 >> 22) + (v56 ^ 0xFA37301F) - ((2 * ((v6 >> 22) + (v56 ^ 0xFA37301F))) & 0x3F2A4756) + 529867691;
  v81 = v77 ^ 0x54E565A6;
  v82 = v80 ^ 0x1F9523AB;
  HIDWORD(v6) = v113
              + (v58 ^ 0xCC14CAF)
              + 1684044922
              + (((v82 | v81) - ((2 * (v82 | v81)) & 0xF46E603E) - 97046497) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = (v6 >> 17) + v82 - ((2 * ((v6 >> 17) + v82)) & 0x3F28D184) + 529819842;
  v83 = v2 ^ 0x1F9468C2;
  HIDWORD(v6) = v104
              + v78
              - 1252001524
              + (((v83 | v56 ^ 0x5C8CFE0) - ((2 * (v83 | v56 ^ 0x5C8CFE0)) & 0x3F2A4756) + 529867691) ^ v80);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 11) + v83 - ((2 * ((v6 >> 11) + v83)) & 0x44AD0520) + 576094864;
  v84 = v56 ^ 0x22568290;
  HIDWORD(v6) = v111
              + v79
              + 505918102
              + (((v84 | v80 ^ 0xE06ADC54) - ((2 * (v84 | v80 ^ 0xE06ADC54)) & 0x3F28D184) + 529819842) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v85 = (v6 >> 26) + v84 - ((2 * ((v6 >> 26) + v84)) & 0xAF4944AE) - 677076393;
  v86 = v85 ^ 0xD7A4A257;
  HIDWORD(v6) = v102
              + v82
              + 1205413221
              + (((v85 ^ 0xD7A4A257 | v2 ^ 0xE06B973D)
                - ((2 * (v85 ^ 0xD7A4A257 | v2 ^ 0xE06B973D)) & 0x44AD0520)
                + 576094864) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = (v6 >> 22) + (v85 ^ 0xD7A4A257) - ((2 * ((v6 >> 22) + (v85 ^ 0xD7A4A257))) & 0xC6EA2730) - 478866536;
  v87 = v2 ^ 0xE3751398;
  HIDWORD(v6) = v109
              + v83
              - 1195618992
              + (((v87 | v56 ^ 0xDDA97D6F) - ((2 * (v87 | v56 ^ 0xDDA97D6F)) & 0xAF4944AE) - 677076393) ^ v85);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 17) + v87 - ((2 * ((v6 >> 17) + v87)) & 0x2B6ED77A) - 1783141443;
  v88 = v56 ^ 0x95B76BBD;
  HIDWORD(v6) = v100
              + v84
              + 1045477028
              + (((v56 ^ 0x95B76BBD | v85 ^ 0x285B5DA8)
                - ((2 * (v56 ^ 0x95B76BBD | v85 ^ 0x285B5DA8)) & 0xC6EA2730)
                - 478866536) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v89 = (v6 >> 11) + (v56 ^ 0x95B76BBD) - ((2 * ((v6 >> 11) + (v56 ^ 0x95B76BBD))) & 0xDE600E46) - 282065117;
  v90 = v89 ^ 0xEF300723;
  HIDWORD(v6) = v107
              + v86
              + 678745890
              + (((v90 | v2 ^ 0x1C8AEC67)
                - ((2 * (v90 | v2 ^ 0x1C8AEC67)) & 0x2B6ED77A)
                - 1783141443) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = (v6 >> 26) + v90 - ((2 * ((v6 >> 26) + v90)) & 0xCC1C6586) - 435277117;
  v91 = v2 ^ 0xE60E32C3;
  HIDWORD(v6) = v114
              + v87
              - 1225179213
              + (((v91 | v56 ^ 0x6A489442) - ((2 * (v91 | v56 ^ 0x6A489442)) & 0xDE600E46) - 282065117) ^ v89);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 22) + v91 - ((2 * ((v6 >> 22) + v91)) & 0x20F7294) + 17283402;
  v92 = v56 ^ 0x107B94A;
  HIDWORD(v6) = v105
              + v88
              + 1540201447
              + (((v56 ^ 0x107B94A | v89 ^ 0x10CFF8DC)
                - ((2 * (v56 ^ 0x107B94A | v89 ^ 0x10CFF8DC)) & 0xCC1C6586)
                - 435277117) ^ v2);
  LODWORD(v6) = HIDWORD(v6);
  v93 = (v6 >> 17) + (v56 ^ 0x107B94A) - ((2 * ((v6 >> 17) + (v56 ^ 0x107B94A))) & 0xBE8E63A2) - 548982319;
  v94 = v93 ^ 0xDF4731D1;
  HIDWORD(v6) = v112
              + v90
              + 114584180
              + (((v93 ^ 0xDF4731D1 | v2 ^ 0x19F1CD3C)
                - ((2 * (v93 ^ 0xDF4731D1 | v2 ^ 0x19F1CD3C)) & 0x20F7294)
                + 17283402) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  v95 = (v6 >> 11) + (v93 ^ 0xDF4731D1) - ((2 * ((v6 >> 11) + (v93 ^ 0xDF4731D1))) & 0x950BD10) + 78143112;
  v96 = v95 ^ 0x4A85E88;
  HIDWORD(v6) = v103
              + (v2 ^ 0xE60E32C3)
              - 1340090539
              + (((v96 | v56 ^ 0xFEF846B5) - ((2 * (v96 | v56 ^ 0xFEF846B5)) & 0xBE8E63A2) - 548982319) ^ v93);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v56) = (v6 >> 26) + v96 - 1599871445 + (~(2 * ((v6 >> 26) + v96)) | 0xBEB833A9) + 1;
  HIDWORD(v6) = v110
              + v92
              + 1980189448
              + (((v56 ^ 0xA0A3E62B | v93 ^ 0x20B8CE2E)
                - ((2 * (v56 ^ 0xA0A3E62B | v93 ^ 0x20B8CE2E)) & 0x950BD10)
                + 78143112) ^ v95);
  LODWORD(v6) = HIDWORD(v6);
  *(_DWORD *)(v98 - 0x161858334005A18CLL) += v56 ^ 0xA0A3E62B;
  v97 = ((2 * ((v6 >> 22) + (v56 ^ 0xA0A3E62B))) & 0xFFFBFEFE)
      + (((v6 >> 22) + (v56 ^ 0xA0A3E62B)) ^ 0xFFFDFF7F)
      + 131201;
  HIDWORD(v6) = result
              + v94
              - 475780210
              + (((v97 | v95 ^ 0xFB57A177) - ((2 * (v97 | v95 ^ 0xFB57A177)) & 0x4147CC56) - 1599871445) ^ v56);
  LODWORD(v6) = HIDWORD(v6);
  LODWORD(v2) = v97 + (v6 >> 17);
  HIDWORD(v6) = v60 + (v95 ^ 0x4A85E88) - 1538053020 + ((v2 | v56 ^ 0x5F5C19D4) ^ v97);
  LODWORD(v6) = HIDWORD(v6);
  *(_DWORD *)(v98 - 0x161858334005A188) += (_DWORD)v2 + (v6 >> 11);
  *(_DWORD *)(v98 - 0x161858334005A184) += (_DWORD)v2;
  *(_DWORD *)(v98 - 0x161858334005A180) += v97;
  return result;
}

void sub_218EFDAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_218EFDD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218EFDEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void __eventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _QWORD v4[6];

  v3 = *(NSObject **)(a3 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ____eventHandler_block_invoke;
  v4[3] = &unk_24DA388C0;
  v4[4] = a3;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void ____eventHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  if (v3)
  {
    v4 = *(_QWORD *)(v2 + 32);
    if (v4)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = ____eventHandler_block_invoke_2;
      v5[3] = &unk_24DA38A50;
      v5[4] = *(_QWORD *)(a1 + 40);
      v5[5] = v4;
      dispatch_async(v3, v5);
    }
  }
}

uint64_t ____eventHandler_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

dispatch_queue_t _MediaControlClient_GlobalInit()
{
  const char *v0;
  const char *v1;
  int Int64;
  int v3;
  dispatch_queue_t result;

  v0 = getprogname();
  if (v0)
  {
    v1 = v0;
    if (!strcasecmp(v0, "mediaserverd") || !strcasecmp(v1, "audiomxd") || !strcasecmp(v1, "airplayd"))
    {
      gMediaControlForLegacyURLFlinging = 1;
      goto LABEL_8;
    }
  }
  if (gMediaControlForLegacyURLFlinging == 1)
LABEL_8:
    LogSetAppID();
  Int64 = APSSettingsGetInt64();
  if (Int64 >= 1)
    v3 = Int64;
  else
    v3 = 30;
  gMediaControlTimeoutDataSecs = v3;
  gMediaControlUseSecurity = APSSettingsGetInt64() != 0;
  if (gLogCategory_MediaControlClientAuth <= 40
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  gMediaControlMetaData = APSSettingsGetInt64() != 0;
  gAirPlayRouteLock = (uint64_t)dispatch_semaphore_create(1);
  result = dispatch_queue_create("AirPlayEventQueue", 0);
  gAirPlayEventQueue = (uint64_t)result;
  return result;
}

char *AirPlayGlobalRoute_CopyDestination(int a1, int a2)
{
  const char *v4;
  char *v5;
  void *v6;
  void *v7;
  const char *v8;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (!gAirPlayRouteLock)
  {
    APSLogErrorAt();
    return 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
  if ((a1 - 1) >= 4)
  {
    if (gLogCategory_MediaControlRouting <= 90
      && (gLogCategory_MediaControlRouting != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_17:
    v5 = 0;
    goto LABEL_18;
  }
  v4 = *(const char **)*(&off_24DA38B70 + (a1 - 1));
  if (v4)
  {
    v5 = strdup(v4);
    if (!v5)
      APSLogErrorAt();
    goto LABEL_18;
  }
  if (!a2)
    goto LABEL_17;
  v6 = (void *)objc_msgSend((id)getAVSystemControllerClass(0), "sharedAVSystemController");
  v7 = (void *)objc_msgSend(v6, "attributeForKey:", getAVSystemController_PickedRouteAttribute());
  if ((objc_msgSend((id)objc_msgSend(v7, "objectForKey:", getAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo()), "BOOLValue") & 1) == 0&& !objc_msgSend((id)objc_msgSend(v7, "objectForKey:", getAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen()), "BOOLValue"))
  {
    goto LABEL_17;
  }
  v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("AirPlayPortExtendedInfo")), "objectForKey:", CFSTR("dnsNameAirPlay")), "UTF8String");
  if (!v8)
    goto LABEL_17;
  v5 = strdup(v8);
LABEL_18:
  dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  return v5;
}

uint64_t AVSystemControllerFunction()
{
  return classAVSystemController;
}

Class initAVSystemController()
{
  Class result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("AVSystemController");
  classAVSystemController = (uint64_t)result;
  getAVSystemControllerClass = (uint64_t (*)(_QWORD))AVSystemControllerFunction;
  return result;
}

uint64_t AVSystemController_PickedRouteAttributeFunction()
{
  return constantValAVSystemController_PickedRouteAttribute;
}

uint64_t initValAVSystemController_PickedRouteAttribute()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_PickedRouteAttribute");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_PickedRouteAttribute = result;
  }
  else
  {
    result = constantValAVSystemController_PickedRouteAttribute;
  }
  getAVSystemController_PickedRouteAttribute = AVSystemController_PickedRouteAttributeFunction;
  return result;
}

uint64_t AVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideoFunction()
{
  return constantValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo;
}

uint64_t initValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo = result;
  }
  else
  {
    result = constantValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo;
  }
  getAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideo = AVSystemController_RouteDescriptionKey_RouteSupportsAirPlayVideoFunction;
  return result;
}

uint64_t AVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreenFunction()
{
  return constantValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen;
}

uint64_t initValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen = result;
  }
  else
  {
    result = constantValAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen;
  }
  getAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen = AVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreenFunction;
  return result;
}

uint64_t AirPlayGlobalRoute_SetDestination(int a1)
{
  uint64_t v2;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (gAirPlayRouteLock)
  {
    if ((a1 - 1) >= 4)
    {
      if (gLogCategory_MediaControlRouting <= 90
        && (gLogCategory_MediaControlRouting != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return 4294960591;
    }
    else
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
      v2 = ReplaceDifferentString();
      dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
      if ((_DWORD)v2)
      {
        APSLogErrorAt();
      }
      else
      {
        if (gLogCategory_MediaControlRouting <= 40
          && (gLogCategory_MediaControlRouting != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        return 0;
      }
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960534;
  }
  return v2;
}

uint64_t AirPlayGlobalRoute_CopyInfo()
{
  uint64_t v0;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (gAirPlayRouteLock)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
    v0 = gAirPlayRouteInfo;
    if (gAirPlayRouteInfo)
      CFRetain((CFTypeRef)gAirPlayRouteInfo);
    dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  }
  else
  {
    APSLogErrorAt();
    return 0;
  }
  return v0;
}

uint64_t AirPlayGlobalRoute_SetInfo(const void *a1)
{
  const void *v2;
  int v3;
  int v4;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (!gAirPlayRouteLock)
  {
    APSLogErrorAt();
    return 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
  v2 = (const void *)gAirPlayRouteInfo;
  if (a1)
    CFRetain(a1);
  gAirPlayRouteInfo = (uint64_t)a1;
  if (v2)
    CFRelease(v2);
  dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  v3 = gLogCategory_MediaControlRouting;
  if (gLogCategory_MediaControlRouting <= 20)
  {
    if (gLogCategory_MediaControlRouting != -1)
      goto LABEL_10;
    v4 = _LogCategory_Initialize();
    v3 = gLogCategory_MediaControlRouting;
    if (v4)
    {
      if (gLogCategory_MediaControlRouting > 20)
        return 0;
LABEL_10:
      if (v3 == -1 && !_LogCategory_Initialize())
        return 0;
LABEL_15:
      LogPrintF();
      return 0;
    }
  }
  if (v3 <= 40 && (v3 != -1 || _LogCategory_Initialize()))
    goto LABEL_15;
  return 0;
}

char *AirPlayGlobalRoute_CopyPassword()
{
  char *v0;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (!gAirPlayRouteLock)
  {
    APSLogErrorAt();
    return 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
  if (!gAirPlayRoutePassword)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
    return 0;
  }
  v0 = strdup((const char *)gAirPlayRoutePassword);
  dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  if (!v0)
    APSLogErrorAt();
  return v0;
}

uint64_t AirPlayGlobalRoute_SetPassword()
{
  uint64_t v0;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (gAirPlayRouteLock)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
    v0 = ReplaceDifferentString();
    dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
    if ((_DWORD)v0)
    {
      APSLogErrorAt();
    }
    else
    {
      if (gLogCategory_MediaControlRouting <= 40
        && (gLogCategory_MediaControlRouting != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return 0;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960534;
  }
  return v0;
}

uint64_t AirPlayGetEventQueue()
{
  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  return gAirPlayEventQueue;
}

uint64_t AirPlaySetProperty(CFTypeRef cf1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  float v13;
  NSObject *v14;
  _QWORD block[4];
  float v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (gAirPlayRouteLock)
  {
    v2 = CFEqual(cf1, CFSTR("quiesceScreen"));
    if ((_DWORD)v2)
    {
      v3 = (void *)objc_msgSend((id)getAVSystemControllerClass(v2), "sharedAVSystemController");
      v4 = (void *)objc_msgSend(v3, "attributeForKey:", getAVSystemController_PickedRouteAttribute());
      result = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", getAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen()), "BOOLValue");
      if ((_DWORD)result)
      {
        v6 = (void *)objc_msgSend(v3, "attributeForKey:", getAVSystemController_PickableRoutesAttribute[0]());
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (result)
        {
          v7 = result;
          v8 = *(_QWORD *)v18;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
              v11 = (void *)objc_msgSend(v10, "objectForKey:", getAVSystemController_RouteDescriptionKey_RouteType[0]());
              if (objc_msgSend(v11, "isEqual:", getAVSystemController_PickableRouteType_Default()))
              {
                if (gLogCategory_MediaControlClientCore <= 40
                  && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                objc_msgSend(v3, "setPickedRouteWithPassword:withPassword:", v10, &stru_24DA38BF0);
                return 0;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            result = 0;
            if (v7)
              continue;
            break;
          }
        }
      }
    }
    else if (CFEqual(cf1, CFSTR("volume")))
    {
      CFGetDouble();
      v13 = v12;
      dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
      if (*(float *)&gMediaControlCurrentVolume != v13)
      {
        gMediaControlCurrentVolume = LODWORD(v13);
        if (gMediaControlAudioClient)
        {
          v14 = *(NSObject **)(gMediaControlAudioClient + 16);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __AirPlaySetProperty_block_invoke;
          block[3] = &__block_descriptor_36_e5_v8__0l;
          v16 = v13;
          dispatch_async(v14, block);
        }
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
      return 0;
    }
    else
    {
      if (gLogCategory_MediaControlClientCore <= 60
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return 4294960561;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960534;
  }
  return result;
}

uint64_t AVSystemController_PickableRoutesAttributeFunction()
{
  return constantValAVSystemController_PickableRoutesAttribute;
}

uint64_t initValAVSystemController_PickableRoutesAttribute()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_PickableRoutesAttribute");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_PickableRoutesAttribute = result;
  }
  else
  {
    result = constantValAVSystemController_PickableRoutesAttribute;
  }
  getAVSystemController_PickableRoutesAttribute[0] = AVSystemController_PickableRoutesAttributeFunction;
  return result;
}

uint64_t AVSystemController_RouteDescriptionKey_RouteTypeFunction()
{
  return constantValAVSystemController_RouteDescriptionKey_RouteType;
}

uint64_t initValAVSystemController_RouteDescriptionKey_RouteType()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_RouteDescriptionKey_RouteType");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_RouteDescriptionKey_RouteType = result;
  }
  else
  {
    result = constantValAVSystemController_RouteDescriptionKey_RouteType;
  }
  getAVSystemController_RouteDescriptionKey_RouteType[0] = AVSystemController_RouteDescriptionKey_RouteTypeFunction;
  return result;
}

uint64_t AVSystemController_PickableRouteType_DefaultFunction()
{
  return constantValAVSystemController_PickableRouteType_Default;
}

uint64_t initValAVSystemController_PickableRouteType_Default()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_PickableRouteType_Default");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_PickableRouteType_Default = result;
  }
  else
  {
    result = constantValAVSystemController_PickableRouteType_Default;
  }
  getAVSystemController_PickableRouteType_Default = AVSystemController_PickableRouteType_DefaultFunction;
  return result;
}

uint64_t MediaControlClient_EnsureConnected(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  int v6;
  int v7;
  CFPropertyListRef v8;
  const __CFData *v9;
  const __CFData *v10;
  CFTypeID v11;
  const void *v12;
  CFDictionaryRef v13;
  const void *v14;
  uint64_t v15;
  const void *v16;
  CFAbsoluteTime Current;
  uint64_t v18;
  CFAbsoluteTime v19;
  uint64_t v20;

  v2 = a1 + 844952;
  v3 = a1 + 416;
  if (!*(_BYTE *)(a1 + 424))
  {
    *(CFAbsoluteTime *)v2 = CFAbsoluteTimeGetCurrent();
    *(_OWORD *)(a1 + 844960) = 0u;
    *(_OWORD *)(a1 + 844976) = 0u;
    *(_OWORD *)(a1 + 844992) = 0u;
    *(_OWORD *)(a1 + 845008) = 0u;
    *(_OWORD *)(a1 + 845024) = 0u;
    *(_QWORD *)(a1 + 845040) = 0;
  }
  v4 = _MediaControlClient_EnsureConnected(a1, v3);
  if ((_DWORD)v4)
    return v4;
  v5 = (void **)(a1 + 279600);
  if (!*(_DWORD *)(a1 + 281756))
  {
    APSGetDeviceNameCString();
    *(_DWORD *)(a1 + 281756) = 1;
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    NROcmM();
    HTTPHeader_SetField();
    v6 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, v3, 0, 0);
    if (v6)
    {
      if (v6 == 200404)
        v7 = 0;
      else
        v7 = v6;
      if (v6 != 200404)
      {
        v8 = 0;
LABEL_15:
        v12 = 0;
LABEL_18:
        if (*v5)
        {
          free(*v5);
          *v5 = 0;
        }
        if (v12)
          CFRelease(v12);
        if (v7
          && gLogCategory_MediaControlClientCore <= 60
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v8)
        {
          CFDictionaryGetInt64();
          v14 = *(const void **)(a1 + 281768);
          if (v14)
            CFRelease(v14);
          v15 = APSFeaturesCreateFromLegacyFlags();
          *(_QWORD *)(a1 + 281768) = v15;
          if (!v15)
          {
            APSLogErrorAt();
            return 4294960568;
          }
          CFDictionaryGetCString();
          *(_DWORD *)(a1 + 281776) = TextToSourceVersion();
          v16 = *(const void **)(a1 + 281760);
          CFRetain(v8);
          *(_QWORD *)(a1 + 281760) = v8;
          if (v16)
            CFRelease(v16);
          CFRelease(v8);
        }
        if (*(double *)(v2 + 40) == 0.0)
        {
          Current = CFAbsoluteTimeGetCurrent();
          *(CFAbsoluteTime *)(v2 + 40) = Current;
          *(_DWORD *)(v2 + 80) = ((Current - *(double *)(v2 + 32)) * 1000.0);
        }
        v18 = _MediaControlClient_EnsureAuthenticated((_QWORD *)a1, v3);
        if ((_DWORD)v18)
        {
          v20 = v18;
          APSLogErrorAt();
          return v20;
        }
        if (*(double *)(v2 + 48) == 0.0)
        {
          v19 = CFAbsoluteTimeGetCurrent();
          *(CFAbsoluteTime *)(v2 + 48) = v19;
          *(_DWORD *)(v2 + 84) = ((v19 - *(double *)(v2 + 40)) * 1000.0);
        }
        *(_BYTE *)(a1 + 281780) = 0;
        APSSettingsGetCString();
        *(_BYTE *)(a1 + 281796) = *(_DWORD *)(a1 + 281776) > 0x16E61Bu;
        *(_BYTE *)(a1 + 281797) = APSSettingsGetInt64() != 0;
        goto LABEL_40;
      }
      v13 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v12 = 0;
      if (v13)
      {
        v8 = v13;
        v7 = 0;
        goto LABEL_18;
      }
      v7 = -6700;
      v8 = 0;
    }
    else
    {
      v9 = CFDataCreate(0, *(const UInt8 **)(a1 + 279608), *(_QWORD *)(a1 + 279616));
      if (v9)
      {
        v10 = v9;
        v8 = CFPropertyListCreateWithData(0, v9, 0, 0, 0);
        CFRelease(v10);
        if (v8)
        {
          v11 = CFGetTypeID(v8);
          if (v11 == CFDictionaryGetTypeID())
          {
            v7 = 0;
            goto LABEL_15;
          }
          v7 = -6756;
        }
        else
        {
          v7 = -6717;
        }
      }
      else
      {
        v8 = 0;
        v7 = -6728;
      }
    }
    v12 = v8;
    APSLogErrorAt();
    v8 = 0;
    goto LABEL_18;
  }
LABEL_40:
  if (*(_QWORD *)(a1 + 563216))
    _MediaControlClient_EnsureReverseConnected(a1, (_BYTE *)(a1 + 281824));
  return 0;
}

uint64_t _MediaControlClient_DoTransaction(unsigned __int8 a1, _QWORD *a2, uint64_t a3, const char *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!*(_BYTE *)(a3 + 8))
  {
    APSLogErrorAt();
    v13 = 4294960551;
    goto LABEL_22;
  }
  v10 = 200401;
  v11 = a3 + 80;
  HTTPHeader_SetField();
  HTTPHeader_SetField();
  HTTPHeader_SetField();
  APSVersionUtilsGetShortVersionLength();
  HTTPHeader_SetField();
  v12 = _MediaControlClient_SendRequest(a1, a3, a4, a5);
  if ((_DWORD)v12)
    goto LABEL_12;
  v13 = _MediaControlClient_ReceiveResponse(a1, (uint64_t *)a3);
  if ((_DWORD)v13 != 200401)
    goto LABEL_13;
  if (_MediaControlClient_GetPassword((uint64_t)a2))
  {
    if (gLogCategory_MediaControlClientCore <= 40
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v14 = a2[4];
    a2[11] = "AirPlay";
    a2[12] = v14;
    a2[13] = v11;
    a2[14] = a3 + 8560;
    v15 = HTTPClientAuthorization_Apply();
    if ((_DWORD)v15)
    {
      v13 = v15;
    }
    else
    {
      v16 = _MediaControlClient_SendRequest(a1, a3, a4, a5);
      if (!(_DWORD)v16)
      {
        v12 = _MediaControlClient_ReceiveResponse(a1, (uint64_t *)a3);
LABEL_12:
        v13 = v12;
        goto LABEL_13;
      }
      v13 = v16;
    }
    APSLogErrorAt();
LABEL_13:
    if ((_DWORD)v13 == -6723 || !(_DWORD)v13)
      return v13;
    if ((_DWORD)v13 == 200401)
      goto LABEL_16;
LABEL_22:
    if ((v13 - 100) < 0x1F4 || (v13 - 200100) <= 0x1F3)
    {
      if (gLogCategory_MediaControlClientCore <= 50
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_MediaControlClientCore <= 50
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (a2[70402])
        CFPropertyListCreateFormatted();
      MediaControlClient_EnsureDisconnected((uint64_t)a2);
    }
    return v13;
  }
LABEL_16:
  if (gLogCategory_MediaControlClientCore <= 50
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v10;
}

uint64_t _MediaControlClient_SendRequest(unsigned __int8 a1, uint64_t a2, const char *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = HTTPHeader_Commit();
  if ((_DWORD)v8)
  {
    v10 = v8;
LABEL_16:
    APSLogErrorAt();
    return v10;
  }
  if (a4 == -1)
    strlen(a3);
  if (gLogCategory_MediaControlClientHTTPClient <= a1
    && (gLogCategory_MediaControlClientHTTPClient != -1 || _LogCategory_Initialize()))
  {
    LogHTTP();
  }
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 40))();
  v10 = v9;
  if ((_DWORD)v9 != -6723 && (_DWORD)v9 != 32 && (_DWORD)v9 != 0)
    goto LABEL_16;
  return v10;
}

uint64_t _MediaControlClient_ReceiveResponse(unsigned __int8 a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v17;

  v4 = *a2;
  v5 = NetSocket_HTTPReadHeader();
  if ((_DWORD)v5)
    return v5;
  v6 = (void **)(a2 + 34898);
  v7 = a2[2128];
  if (v7 >= 0x20000)
  {
    if (v7 >= 0x400000)
    {
      APSLogErrorAt();
      return 4294960553;
    }
    v17 = a2[2128];
    if (*v6)
      free(*v6);
    v10 = malloc_type_malloc(v7 + 1, 0x4512C85EuLL);
    *v6 = v10;
    if (!v10)
    {
      APSLogErrorAt();
      return 4294960568;
    }
    a2[34899] = (uint64_t)v10;
  }
  else
  {
    v17 = a2[2128];
    v8 = a2 + 18514;
    a2[34899] = (uint64_t)(a2 + 18514);
    if (!v7)
    {
      v9 = 0;
      goto LABEL_13;
    }
  }
  v11 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(v4 + 24))(v4, v7, v7);
  v12 = v11;
  if ((_DWORD)v11 == -6723)
    return v12;
  if ((_DWORD)v11)
  {
    APSLogErrorAt();
    return v12;
  }
  v8 = (uint64_t *)a2[34899];
  v9 = v17;
LABEL_13:
  *((_BYTE *)v8 + v9) = 0;
  a2[34900] = v17;
  if (*(_QWORD *)(v4 + 64) == *(_QWORD *)(v4 + 72))
  {
    if (gLogCategory_MediaControlClientHTTPClient <= a1
      && (gLogCategory_MediaControlClientHTTPClient != -1 || _LogCategory_Initialize()))
    {
      LogHTTP();
    }
    v13 = *((_DWORD *)a2 + 4248);
    v14 = v13 - 200;
    if (v13 == 101)
      v15 = 0;
    else
      v15 = v13 + 200000;
    if (v14 >= 0x64)
      return v15;
    else
      return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294960584;
  }
}

uint64_t _MediaControlClient_GetPassword(uint64_t a1)
{
  char *v2;
  char *v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  const char *v9;
  char *v10;
  char *v11;

  v2 = AirPlayGlobalRoute_CopyPassword();
  if (v2)
  {
    v3 = v2;
    ReplaceDifferentString();
    free(v3);
  }
  v6 = *(_BYTE **)(a1 + 32);
  v5 = a1 + 32;
  v4 = v6;
  if (!v6 || !*v4)
  {
    if (gMediaControlClientInitOnce != -1)
      dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
    if (!gAirPlayRouteLock)
      goto LABEL_15;
    if ((gMediaControlForLegacyURLFlinging & 1) == 0)
    {
      v7 = (void *)objc_msgSend((id)getAVSystemControllerClass(), "sharedAVSystemController");
      v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "attributeForKey:", getAVSystemController_PickedRouteAttribute()), "objectForKey:", CFSTR("AirPlayPortExtendedInfo"));
      if ((objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("systemFlags")), "intValue") & 8) != 0)
      {
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("pin")), "UTF8String");
        if (v9)
        {
          if (*v9)
          {
            v10 = strdup(v9);
            if (v10)
            {
              v11 = v10;
              ReplaceDifferentString();
              free(v11);
              return *(_QWORD *)v5;
            }
LABEL_15:
            APSLogErrorAt();
          }
        }
      }
    }
  }
  return *(_QWORD *)v5;
}

uint64_t MediaControlClient_EnsureDisconnected(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;

  v2 = (_QWORD *)(a1 + 844832);
  v3 = a1 + 281756;
  _MediaControlClientNowPlayingEnsureTornDown(a1);
  _MediaControlClient_LogPhotoEnded(a1);
  _MediaControlClient_LogSlideshowEnded(a1);
  _MediaControlClient_LogVideoEnded(a1);
  if (*v2)
  {
    HTTPServer_Delete();
    *v2 = 0;
  }
  v4 = v2[1];
  if (v4)
  {
    dispatch_release(v4);
    v2[1] = 0;
  }
  _MediaControlClient_EnsureDisconnected(a1, a1 + 416);
  _MediaControlClient_EnsureReverseDisconnected(a1, (dispatch_queue_t *)(a1 + 281824));
  _MediaControlClient_EnsureReverseDisconnected(a1, (dispatch_queue_t *)(a1 + 563288));
  _MediaControlClient_PlaybackStopped(a1);
  *(_DWORD *)v3 = 0;
  v5 = *(const void **)(v3 + 4);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(v3 + 4) = 0;
  }
  return 0;
}

void _MediaControlClientNowPlayingEnsureTornDown(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = a1 + 844817;
  if (*(_BYTE *)(a1 + 844817))
  {
    *(_BYTE *)v1 = 0;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    _MediaControlClient_ControlNowPlaying(0);
    if (gLogCategory_MediaControlClientMetaData <= 30
      && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v2 = *(const void **)(v1 + 7);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(v1 + 7) = 0;
  }
}

void _MediaControlClient_LogPhotoEnded(uint64_t a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)(a1 + 563256);
  if (*(double *)(a1 + 563256) != 0.0)
  {
    CFAbsoluteTimeGetCurrent();
    if (gLogCategory_MediaControlClientCore <= 50)
    {
      if (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_MediaControlClientCore <= 50
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    *v1 = 0;
  }
}

void _MediaControlClient_LogSlideshowEnded(uint64_t a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)(a1 + 844720);
  if (*(double *)(a1 + 844720) != 0.0)
  {
    CFAbsoluteTimeGetCurrent();
    if (gLogCategory_MediaControlClientCore <= 50)
    {
      if (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_MediaControlClientCore <= 50
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    *v1 = 0;
  }
}

void _MediaControlClient_LogVideoEnded(uint64_t a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)(a1 + 844768);
  if (*(double *)(a1 + 844768) != 0.0)
  {
    CFAbsoluteTimeGetCurrent();
    if (gLogCategory_MediaControlClientCore <= 50
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *v1 = 0;
  }
}

uint64_t _MediaControlClient_EnsureDisconnected(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  uint64_t result;

  v4 = a2 + 279208;
  if (*(_QWORD *)a2)
  {
    NetSocket_Delete();
    *(_QWORD *)a2 = 0;
  }
  if (*(_BYTE *)(a2 + 8))
  {
    *(_BYTE *)(a2 + 8) = 0;
    if (gLogCategory_MediaControlClientCore <= 50
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v5 = *(const void **)(v4 + 2064);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(v4 + 2064) = 0;
  }
  *(_BYTE *)(v4 + 2104) = 0;
  *(_BYTE *)(v4 + 8) = 0;
  if (_MediaControlClient_RemoveTrafficRegistration(a1)
    && gLogCategory_MediaControlClientCore <= 90
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
  {
    if (*(_DWORD *)(v4 + 2060))
    {
      result = APSConnectionInterfaceManagerReleaseInterfaceSelection();
      *(_DWORD *)(v4 + 2060) = 0;
    }
  }
  return result;
}

uint64_t _MediaControlClient_EnsureReverseDisconnected(uint64_t a1, dispatch_queue_t *a2)
{
  dispatch_queue_t *v4;
  NSObject *v5;

  v4 = a2 + 35169;
  if (*a2)
    NetSocket_Cancel();
  if (*v4)
  {
    v4[1] = dispatch_semaphore_create(0);
    dispatch_async_f(*v4, a2, (dispatch_function_t)_MediaControlClient_ReverseConnectionStop);
    dispatch_release(*v4);
    v5 = v4[1];
    if (v5)
    {
      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v4[1]);
      v4[1] = 0;
    }
    *v4 = 0;
  }
  return _MediaControlClient_EnsureDisconnected(a1, (uint64_t)a2);
}

void _MediaControlClient_PlaybackStopped(uint64_t a1)
{
  uint64_t v2;
  CFNumberRef v3;

  v2 = a1 + 844932;
  if (*(_BYTE *)(a1 + 844934))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
    if (gMediaControlAudioClient == a1)
      gMediaControlAudioClient = 0;
    dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  }
  if (gMediaControlForLegacyURLFlinging == 1)
  {
    if (*(_QWORD *)(v2 + 148))
    {
      if (gLogCategory_MediaControlClientCore <= 40
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFRelease(*(CFTypeRef *)(v2 + 148));
      *(_QWORD *)(v2 + 148) = 0;
    }
    if (*(_BYTE *)v2)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, (const void *)(a1 + 64));
        *(_BYTE *)v2 = 0;
        if (v3)
          CFRelease(v3);
      }
      else
      {
        *(_BYTE *)v2 = 0;
      }
    }
  }
  _MediaControlClient_PlaybackPaused(a1, 0);
}

void _MediaControlClient_PlaybackPaused(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  IOPMAssertionID v8;
  NSObject *v9;
  _QWORD handler[5];

  if (gMediaControlForLegacyURLFlinging == 1)
  {
    v2 = a2;
    v4 = a1 + 844933;
    if (a2)
    {
      if (!*(_BYTE *)v4)
      {
        if (!*(_QWORD *)(a1 + 845072))
        {
          v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 16));
          *(_QWORD *)(v4 + 139) = v5;
          if (!v5)
          {
            APSLogErrorAt();
            return;
          }
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = ___MediaControlClient_PlaybackPaused_block_invoke;
          handler[3] = &__block_descriptor_40_e5_v8__0l;
          handler[4] = a1;
          dispatch_source_set_event_handler(v5, handler);
          v6 = *(NSObject **)(v4 + 139);
          v7 = dispatch_time(0, 900000000000);
          dispatch_source_set_timer(v6, v7, 0x7FFFFFFFFFFFFFFFuLL, 0x3B9ACA00uLL);
          dispatch_resume(*(dispatch_object_t *)(v4 + 139));
        }
        if (!*(_DWORD *)(v4 + 135))
        {
          IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, CFSTR("com.apple.airplay.pause-grace-period"), (IOPMAssertionID *)(v4 + 135));
          if (gLogCategory_MediaControlClientCore <= 40
            && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
      }
    }
    else
    {
      v8 = *(_DWORD *)(a1 + 845068);
      if (v8)
      {
        IOPMAssertionRelease(v8);
        *(_DWORD *)(v4 + 135) = 0;
        if (gLogCategory_MediaControlClientCore <= 40
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      v9 = *(NSObject **)(v4 + 139);
      if (v9)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(v4 + 139));
        dispatch_release(v9);
        *(_QWORD *)(v4 + 139) = 0;
      }
    }
    *(_BYTE *)v4 = v2;
  }
}

void _MediaControlClient_ReverseConnectionStop(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;

  v1 = a1 + 281368;
  v2 = *(NSObject **)(a1 + 281368);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 281368));
    dispatch_release(v2);
    *(_QWORD *)v1 = 0;
  }
  v3 = *(NSObject **)(v1 + 16);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 16));
    dispatch_release(v3);
    *(_QWORD *)(v1 + 16) = 0;
  }
}

uint64_t _MediaControlClient_RemoveTrafficRegistration(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  uint64_t result;

  if (a1)
  {
    v1 = a1 + 281800;
    if (*(_BYTE *)(a1 + 281822) && *(_QWORD *)v1)
    {
      CFRelease(*(CFTypeRef *)v1);
      *(_QWORD *)v1 = 0;
    }
    if (*(_BYTE *)(v1 + 23))
    {
      v2 = *(const void **)(v1 + 8);
      if (v2)
      {
        CFRelease(v2);
        *(_QWORD *)(v1 + 8) = 0;
      }
    }
    result = 0;
    *(_QWORD *)(v1 + 16) = 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294960591;
  }
  return result;
}

uint64_t _MediaControlClientNowPlayingInfoDidChange(int a1, CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  return MRMediaRemoteGetNowPlayingInfo();
}

intptr_t _MediaControlClient_ControlNowPlaying(unsigned int a1)
{
  unsigned int v2;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (gAirPlayRouteLock)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
    v2 = gAirPlayNowPlayingFlags & 0xFFFFFFFD | (2 * ((a1 >> 1) & 1));
    gAirPlayNowPlayingFlags = v2;
    if (v2)
    {
      if ((gAirPlayNowPlayingRegistered & 1) == 0)
      {
        MRMediaRemoteRegisterForNowPlayingNotifications();
LABEL_9:
        gAirPlayNowPlayingRegistered = v2 != 0;
      }
    }
    else if (gAirPlayNowPlayingRegistered)
    {
      MRMediaRemoteUnregisterForNowPlayingNotifications();
      goto LABEL_9;
    }
    return dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  }
  return APSLogErrorAt();
}

void _MediaControlClientNowPlayingUpdate(uint64_t a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v8;
  __CFDictionary *v9;
  const __CFString *Value;
  const __CFString *v11;
  CFTypeID v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  CFTypeID v16;
  __CFString *v17;
  const __CFString *v18;
  __CFString *v19;
  CFTypeID v20;
  __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  CFTypeID v24;
  __CFString *v25;
  const __CFString *v26;
  __CFString *v27;
  CFTypeID v28;
  __CFString *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  CFTypeID v33;
  CFTypeID v34;
  uint64_t Int64;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  CFTypeID v40;
  int v41;
  const void *v42;
  const void *v43;
  const void *v44;
  const void *v45;
  __CFDictionary *v46;
  const void *v47;
  const void *v48;
  CFTypeID v49;
  int v50;
  const void *v51;
  const void *v52;
  const void *v53;
  const void *v54;
  __CFDictionary *v55;
  const void *v56;
  const void *v57;
  CFTypeID v58;
  int v59;
  const void *v60;
  const void *v61;
  const void *v62;
  const void *v63;
  __CFDictionary *v64;
  const void *v65;
  const void *v66;
  CFTypeID v67;
  int v68;
  const void *v69;
  __CFDictionary *v70;
  const void *v71;
  const void *v72;
  const void *v73;
  __CFDictionary *v74;
  const void *v75;
  const void *v76;
  CFTypeID v77;
  int v78;
  const void *v79;
  const void *v80;
  CFTypeID v81;
  const void *v82;
  const void *v83;
  const void *v84;
  const void *v85;
  __CFDictionary *v86;
  const void *v87;
  const void *v88;
  CFTypeID v89;
  int v90;
  const void *v91;
  const void *v92;
  const void *v93;
  const void *v94;
  const __CFString *v95;
  const __CFString *v96;
  CFTypeID v97;
  const __CFString *v98;
  double v99;
  const void **v100;
  const void *v101;
  const void *v102;
  uint64_t v103;
  const __CFString *v104;
  int v105;
  const __CFString *v106;
  int v107;
  uint64_t v108;
  const __CFString *v109;
  int v110;
  const __CFString *v111;
  int v112;
  uint64_t v113;
  CFNumberRef v114;
  CFNumberRef v115;
  CFNumberRef v116;
  CFHashCode v117;
  CFHashCode v118;
  CFHashCode v119;
  CFNumberRef v120;
  CFNumberRef v121;
  CFNumberRef v122;
  int v123;
  int v124;
  int v125;
  uint64_t v126;
  __CFString *v127;
  __CFString *v128;
  const __CFString *cf;
  uint64_t valuePtr;
  CFHashCode v131;
  int v132;

  v132 = 0;
  valuePtr = 0;
  v131 = 0;
  v4 = (CFMutableDictionaryRef *)(a1 + 844824);
  v5 = *(const __CFDictionary **)(a1 + 844824);
  v6 = v5;
  if (!v5)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
      goto LABEL_325;
    v6 = Mutable;
    *v4 = Mutable;
  }
  v8 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v8)
  {
    v9 = v8;
    v126 = a1;
    if (a2)
      Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65770]);
    else
      Value = 0;
    if (Value)
      v11 = Value;
    else
      v11 = &stru_24DA38BF0;
    v12 = CFGetTypeID(v11);
    if (v12 != CFStringGetTypeID())
      goto LABEL_326;
    v13 = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("album"));
    if (!v5 || v11 != v13 && (!v13 || !CFEqual(v11, v13)))
    {
      CFDictionarySetValue(v9, CFSTR("album"), v11);
      CFDictionarySetValue(v6, CFSTR("album"), v11);
    }
    v14 = a2 ? (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65780]) : 0;
    v15 = v14 ? (__CFString *)v14 : &stru_24DA38BF0;
    v16 = CFGetTypeID(v15);
    if (v16 != CFStringGetTypeID())
      goto LABEL_326;
    v17 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("artist"));
    if (!v5 || v15 != v17 && (!v17 || !CFEqual(v15, v17)))
    {
      CFDictionarySetValue(v9, CFSTR("artist"), v15);
      CFDictionarySetValue(v6, CFSTR("artist"), v15);
    }
    cf = v11;
    v18 = a2 ? (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE657B0]) : 0;
    v19 = v18 ? (__CFString *)v18 : &stru_24DA38BF0;
    v20 = CFGetTypeID(v19);
    if (v20 != CFStringGetTypeID())
      goto LABEL_326;
    v21 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("composer"));
    if (!v5 || v19 != v21 && (!v21 || !CFEqual(v19, v21)))
    {
      CFDictionarySetValue(v9, CFSTR("composer"), v19);
      CFDictionarySetValue(v6, CFSTR("composer"), v19);
    }
    v22 = a2 ? (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE657E8]) : 0;
    v23 = v22 ? (__CFString *)v22 : &stru_24DA38BF0;
    v24 = CFGetTypeID(v23);
    if (v24 != CFStringGetTypeID())
      goto LABEL_326;
    v25 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("genre"));
    if (!v5 || v23 != v25 && (!v25 || !CFEqual(v23, v25)))
    {
      CFDictionarySetValue(v9, CFSTR("genre"), v23);
      CFDictionarySetValue(v6, CFSTR("genre"), v23);
    }
    v26 = a2 ? (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65850]) : 0;
    v27 = v26 ? (__CFString *)v26 : &stru_24DA38BF0;
    v28 = CFGetTypeID(v27);
    if (v28 != CFStringGetTypeID())
      goto LABEL_326;
    v29 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("title"));
    if (!v5 || v27 != v29 && (!v29 || !CFEqual(v27, v29)))
    {
      CFDictionarySetValue(v9, CFSTR("title"), v27);
      CFDictionarySetValue(v6, CFSTR("title"), v27);
    }
    v128 = v27;
    if (a2)
    {
      v30 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65820]);
      v31 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65868]);
      if (v30)
      {
        v32 = v31;
        v33 = CFGetTypeID(v30);
        if (v33 == CFNumberGetTypeID())
        {
          if (v32)
          {
            v34 = CFGetTypeID(v32);
            if (v34 == CFNumberGetTypeID())
            {
              CFGetInt64();
              Int64 = CFNumberCreateInt64();
              if (!Int64)
              {
LABEL_318:
                APSLogErrorAt();
                v124 = -6728;
LABEL_327:
                v132 = v124;
LABEL_305:
                CFRelease(v9);
                if (!v132)
                  return;
                goto LABEL_306;
              }
              v36 = (const void *)Int64;
              v37 = CFDictionaryGetValue(v6, CFSTR("trackNumber"));
              if (!v5 || v36 != v37 && (!v37 || !CFEqual(v36, v37)))
              {
                CFDictionarySetValue(v9, CFSTR("trackNumber"), v36);
                CFDictionarySetValue(v6, CFSTR("trackNumber"), v36);
              }
              CFRelease(v36);
              v38 = CFDictionaryGetValue(v6, CFSTR("totalTracks"));
              if (!v5 || v32 != v38 && (!v38 || !CFEqual(v32, v38)))
              {
                CFDictionarySetValue(v9, CFSTR("totalTracks"), v32);
                CFDictionarySetValue(v6, CFSTR("totalTracks"), v32);
              }
              goto LABEL_119;
            }
          }
        }
      }
      v39 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65878]);
      v30 = v39;
      if (v39)
      {
        v40 = CFGetTypeID(v39);
        if (v40 != CFNumberGetTypeID())
          goto LABEL_326;
        v41 = 0;
      }
      else
      {
        v41 = 1;
      }
    }
    else
    {
      v30 = 0;
      v41 = 1;
    }
    v42 = CFDictionaryGetValue(v6, CFSTR("trackNumber"));
    if (!v5
      || v30 != v42
      && (!v41 ? (v43 = v30) : (v43 = (const void *)*MEMORY[0x24BDBD430]),
          v42 ? (v44 = v42) : (v44 = (const void *)*MEMORY[0x24BDBD430]),
          !CFEqual(v43, v44)))
    {
      if ((v41 & 1) != 0)
      {
        CFDictionarySetInt64();
        v45 = (const void *)*MEMORY[0x24BDBD430];
        v46 = v6;
      }
      else
      {
        CFDictionarySetValue(v9, CFSTR("trackNumber"), v30);
        v46 = v6;
        v45 = v30;
      }
      CFDictionarySetValue(v46, CFSTR("trackNumber"), v45);
    }
    if (a2)
    {
      v47 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65870]);
      v48 = v47;
      if (v47)
      {
        v49 = CFGetTypeID(v47);
        if (v49 != CFNumberGetTypeID())
          goto LABEL_326;
        v50 = 0;
LABEL_105:
        v51 = CFDictionaryGetValue(v6, CFSTR("totalTracks"));
        if (!v5
          || v48 != v51
          && (!v50 ? (v52 = v48) : (v52 = (const void *)*MEMORY[0x24BDBD430]),
              v51 ? (v53 = v51) : (v53 = (const void *)*MEMORY[0x24BDBD430]),
              !CFEqual(v52, v53)))
        {
          if ((v50 & 1) != 0)
          {
            CFDictionarySetInt64();
            v54 = (const void *)*MEMORY[0x24BDBD430];
            v55 = v6;
          }
          else
          {
            CFDictionarySetValue(v9, CFSTR("totalTracks"), v48);
            v55 = v6;
            v54 = v48;
          }
          CFDictionarySetValue(v55, CFSTR("totalTracks"), v54);
        }
        if (!a2)
        {
          v57 = 0;
          goto LABEL_123;
        }
LABEL_119:
        v56 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE657C8]);
        v57 = v56;
        if (v56)
        {
          v58 = CFGetTypeID(v56);
          if (v58 != CFNumberGetTypeID())
            goto LABEL_326;
          v59 = 0;
LABEL_124:
          v60 = CFDictionaryGetValue(v6, CFSTR("discNumber"));
          if (!v5
            || v57 != v60
            && (!v59 ? (v61 = v57) : (v61 = (const void *)*MEMORY[0x24BDBD430]),
                v60 ? (v62 = v60) : (v62 = (const void *)*MEMORY[0x24BDBD430]),
                !CFEqual(v61, v62)))
          {
            if ((v59 & 1) != 0)
            {
              CFDictionarySetInt64();
              v63 = (const void *)*MEMORY[0x24BDBD430];
              v64 = v6;
            }
            else
            {
              CFDictionarySetValue(v9, CFSTR("discNumber"), v57);
              v64 = v6;
              v63 = v57;
            }
            CFDictionarySetValue(v64, CFSTR("discNumber"), v63);
          }
          v127 = v15;
          if (a2)
          {
            v65 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65860]);
            v66 = v65;
            if (v65)
            {
              v67 = CFGetTypeID(v65);
              if (v67 != CFNumberGetTypeID())
                goto LABEL_326;
              v68 = 0;
LABEL_143:
              v69 = CFDictionaryGetValue(v6, CFSTR("totalDiscs"));
              v70 = v9;
              if (v5)
              {
                if (v66 == v69)
                  goto LABEL_156;
                v71 = v68 ? (const void *)*MEMORY[0x24BDBD430] : v66;
                v72 = v69 ? v69 : (const void *)*MEMORY[0x24BDBD430];
                if (CFEqual(v71, v72))
                  goto LABEL_156;
              }
              if ((v68 & 1) != 0)
              {
                CFDictionarySetInt64();
                v73 = (const void *)*MEMORY[0x24BDBD430];
                v74 = v6;
              }
              else
              {
                CFDictionarySetValue(v9, CFSTR("totalDiscs"), v66);
                v74 = v6;
                v73 = v66;
              }
              CFDictionarySetValue(v74, CFSTR("totalDiscs"), v73);
              if (v5)
              {
LABEL_156:
                if (a2)
                  goto LABEL_157;
LABEL_165:
                v76 = 0;
                goto LABEL_166;
              }
              if (a2 && (v79 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE657D8])) != 0)
              {
                v80 = v79;
                v81 = CFGetTypeID(v79);
                if (v81 != CFNumberGetTypeID())
                  goto LABEL_326;
                CFDictionaryGetValue(v6, CFSTR("elapsedTime"));
                CFDictionarySetValue(v9, CFSTR("elapsedTime"), v80);
                CFDictionarySetValue(v6, CFSTR("elapsedTime"), v80);
              }
              else
              {
                CFDictionaryGetValue(v6, CFSTR("elapsedTime"));
                CFDictionarySetInt64();
                CFDictionarySetValue(v6, CFSTR("elapsedTime"), (const void *)*MEMORY[0x24BDBD430]);
                if (!a2)
                  goto LABEL_165;
              }
LABEL_157:
              v75 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE657D0]);
              v76 = v75;
              if (v75)
              {
                v77 = CFGetTypeID(v75);
                if (v77 == CFNumberGetTypeID())
                {
                  v78 = 0;
LABEL_167:
                  v82 = CFDictionaryGetValue(v6, CFSTR("duration"));
                  if (!v5
                    || v76 != v82
                    && (!v78 ? (v83 = v76) : (v83 = (const void *)*MEMORY[0x24BDBD430]),
                        v82 ? (v84 = v82) : (v84 = (const void *)*MEMORY[0x24BDBD430]),
                        !CFEqual(v83, v84)))
                  {
                    if ((v78 & 1) != 0)
                    {
                      CFDictionarySetInt64();
                      v85 = (const void *)*MEMORY[0x24BDBD430];
                      v86 = v6;
                    }
                    else
                    {
                      CFDictionarySetValue(v70, CFSTR("duration"), v76);
                      v86 = v6;
                      v85 = v76;
                    }
                    CFDictionarySetValue(v86, CFSTR("duration"), v85);
                  }
                  if (a2)
                  {
                    v87 = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE65790]);
                    v88 = v87;
                    if (v87)
                    {
                      v89 = CFGetTypeID(v87);
                      if (v89 != CFDataGetTypeID())
                        goto LABEL_323;
                      v90 = 0;
LABEL_186:
                      v91 = CFDictionaryGetValue(v6, CFSTR("artworkData"));
                      if (!v5
                        || v88 != v91
                        && (!v90 ? (v92 = v88) : (v92 = (const void *)*MEMORY[0x24BDBD430]),
                            v91 ? (v93 = v91) : (v93 = (const void *)*MEMORY[0x24BDBD430]),
                            !CFEqual(v92, v93)))
                      {
                        if ((v90 & 1) == 0)
                          CFDictionarySetValue(v70, CFSTR("artworkData"), v88);
                        if (v90)
                          v94 = (const void *)*MEMORY[0x24BDBD430];
                        else
                          v94 = v88;
                        CFDictionarySetValue(v6, CFSTR("artworkData"), v94);
                      }
                      if (a2)
                        v95 = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE657A0]);
                      else
                        v95 = 0;
                      if (v95)
                        v96 = v95;
                      else
                        v96 = &stru_24DA38BF0;
                      v97 = CFGetTypeID(v96);
                      if (v97 == CFStringGetTypeID())
                      {
                        v98 = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("artworkMIMEType"));
                        if (v5 && (v96 == v98 || v98 && CFEqual(v96, v98)))
                        {
                          if ((v78 & 1) != 0)
                            goto LABEL_217;
                        }
                        else
                        {
                          CFDictionarySetValue(v70, CFSTR("artworkMIMEType"), v96);
                          CFDictionarySetValue(v6, CFSTR("artworkMIMEType"), v96);
                          if ((v78 & 1) != 0)
                            goto LABEL_217;
                        }
                        CFGetDouble();
                        if (v99 > 0.0)
                        {
                          v100 = (const void **)MEMORY[0x24BDBD268];
LABEL_218:
                          v9 = v70;
                          v101 = *v100;
                          v102 = CFDictionaryGetValue(v6, CFSTR("isStream"));
                          if (!v5 || v101 != v102 && (!v101 || !v102 || !CFEqual(v101, v102)))
                          {
                            CFDictionarySetValue(v70, CFSTR("isStream"), v101);
                            CFDictionarySetValue(v6, CFSTR("isStream"), v101);
                          }
                          if (a2)
                          {
                            v103 = CFDictionaryGetInt64();
                            v131 = v103;
                            v104 = CFSTR("none");
                            v105 = 1;
                            if (!v132 && v103 != 1)
                            {
                              if (v103 == 2)
                              {
                                v104 = CFSTR("one");
                              }
                              else if (v103 == 3)
                              {
                                v104 = CFSTR("all");
                              }
                              else
                              {
                                if (gLogCategory_MediaControlClientMetaData <= 50
                                  && (gLogCategory_MediaControlClientMetaData != -1
                                   || _LogCategory_Initialize()))
                                {
                                  LogPrintF();
                                }
                                v105 = 0;
                                v104 = 0;
                              }
                            }
                          }
                          else
                          {
                            v132 = -6727;
                            v104 = CFSTR("none");
                            v105 = 1;
                          }
                          v106 = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("repeatMode"));
                          if (!v5
                            || v104 != v106 && (v106 ? (v107 = v105) : (v107 = 0), v107 != 1 || !CFEqual(v104, v106)))
                          {
                            CFDictionarySetValue(v70, CFSTR("repeatMode"), v104);
                            CFDictionarySetValue(v6, CFSTR("repeatMode"), v104);
                          }
                          if (a2)
                          {
                            v108 = CFDictionaryGetInt64();
                            v131 = v108;
                            v109 = CFSTR("off");
                            v110 = 1;
                            if (!v132 && v108 != 1)
                            {
                              if (v108 == 2)
                              {
                                v109 = CFSTR("albums");
                              }
                              else if (v108 == 3)
                              {
                                v109 = CFSTR("songs");
                              }
                              else
                              {
                                if (gLogCategory_MediaControlClientMetaData <= 50
                                  && (gLogCategory_MediaControlClientMetaData != -1
                                   || _LogCategory_Initialize()))
                                {
                                  LogPrintF();
                                }
                                v110 = 0;
                                v109 = 0;
                              }
                            }
                          }
                          else
                          {
                            v132 = -6727;
                            v109 = CFSTR("off");
                            v110 = 1;
                          }
                          v111 = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("shuffleMode"));
                          if (!v5
                            || v109 != v111 && (v111 ? (v112 = v110) : (v112 = 0), v112 != 1 || !CFEqual(v109, v111)))
                          {
                            CFDictionarySetValue(v70, CFSTR("shuffleMode"), v109);
                            CFDictionarySetValue(v6, CFSTR("shuffleMode"), v109);
                          }
                          if (a2)
                          {
                            CFDictionaryGetDouble();
                            valuePtr = v113;
                            if (!v132)
                            {
LABEL_271:
                              v114 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
                              if (v114)
                              {
                                v115 = v114;
                                v116 = (CFNumberRef)CFDictionaryGetValue(v6, CFSTR("rate"));
                                if (!v5 || v115 != v116 && (!v116 || !CFEqual(v115, v116)))
                                {
                                  CFDictionarySetValue(v70, CFSTR("rate"), v115);
                                  CFDictionarySetValue(v6, CFSTR("rate"), v115);
                                }
                                CFRelease(v115);
                                if (a2)
                                {
                                  v131 = CFDictionaryGetInt64();
                                  if (!v132)
                                  {
LABEL_283:
                                    v120 = CFNumberCreate(0, kCFNumberSInt64Type, &v131);
                                    if (v120)
                                    {
                                      v121 = v120;
                                      v122 = (CFNumberRef)CFDictionaryGetValue(v6, CFSTR("uniqueID"));
                                      if (!v5 || v121 != v122 && (!v122 || !CFEqual(v121, v122)))
                                      {
                                        CFDictionarySetValue(v70, CFSTR("uniqueID"), v121);
                                        CFDictionarySetValue(v6, CFSTR("uniqueID"), v121);
                                      }
                                      CFRelease(v121);
                                      v9 = v70;
                                      if (CFDictionaryGetCount(v70) < 1)
                                        goto LABEL_304;
                                      v123 = gLogCategory_MediaControlClientMetaData;
                                      if (gLogCategory_MediaControlClientMetaData <= 20)
                                      {
                                        if (gLogCategory_MediaControlClientMetaData != -1)
                                          goto LABEL_292;
                                        if (_LogCategory_Initialize())
                                        {
                                          v123 = gLogCategory_MediaControlClientMetaData;
                                          if (gLogCategory_MediaControlClientMetaData > 21)
                                          {
LABEL_298:
                                            LogPrintF();
                                            goto LABEL_299;
                                          }
LABEL_292:
                                          if (v123 == -1)
                                            _LogCategory_Initialize();
                                          goto LABEL_298;
                                        }
                                      }
LABEL_299:
                                      v132 = MediaControlClient_SetProperty(v126);
                                      if (v132
                                        && gLogCategory_MediaControlClientMetaData <= 50
                                        && (gLogCategory_MediaControlClientMetaData != -1
                                         || _LogCategory_Initialize()))
                                      {
                                        LogPrintF();
                                      }
LABEL_304:
                                      v132 = 0;
                                      goto LABEL_305;
                                    }
                                    APSLogErrorAt();
                                    v125 = -6728;
                                    goto LABEL_324;
                                  }
                                }
                                else
                                {
                                  v132 = -6727;
                                }
                                v117 = CFHash(cf);
                                v118 = v117 ^ CFHash(v127);
                                v131 = v118 ^ CFHash(v128);
                                if (v30)
                                {
                                  v119 = CFHash(v30);
                                  v131 ^= v119;
                                }
                                goto LABEL_283;
                              }
                              goto LABEL_318;
                            }
                          }
                          else
                          {
                            v132 = -6727;
                          }
                          valuePtr = 0x3FF0000000000000;
                          goto LABEL_271;
                        }
LABEL_217:
                        v100 = (const void **)MEMORY[0x24BDBD270];
                        goto LABEL_218;
                      }
LABEL_323:
                      APSLogErrorAt();
                      v125 = -6756;
LABEL_324:
                      v132 = v125;
                      v9 = v70;
                      goto LABEL_305;
                    }
                  }
                  else
                  {
                    v88 = 0;
                  }
                  v90 = 1;
                  goto LABEL_186;
                }
LABEL_326:
                APSLogErrorAt();
                v124 = -6756;
                goto LABEL_327;
              }
LABEL_166:
              v78 = 1;
              goto LABEL_167;
            }
          }
          else
          {
            v66 = 0;
          }
          v68 = 1;
          goto LABEL_143;
        }
LABEL_123:
        v59 = 1;
        goto LABEL_124;
      }
    }
    else
    {
      v48 = 0;
    }
    v50 = 1;
    goto LABEL_105;
  }
LABEL_325:
  APSLogErrorAt();
  v132 = -6728;
LABEL_306:
  if (gLogCategory_MediaControlClientMetaData <= 90
    && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t MediaControlClient_SetProperty(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  uint64_t v5;

  v2 = MediaControlClient_EnsureConnected();
  if ((_DWORD)v2)
  {
    v5 = v2;
    APSLogErrorAt();
  }
  else
  {
    ASPrintF();
    APSLogErrorAt();
    v5 = 4294960568;
  }
  v3 = (void **)(a1 + 279600);
  if (*v3)
  {
    free(*v3);
    *v3 = 0;
  }
  if ((_DWORD)v5
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

uint64_t _MediaControlClient_EnsureConnected(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v5;
  _BOOL4 v6;
  uint64_t Int64;
  uint64_t v8;
  BOOL v9;
  int v10;
  const __CFData *Value;
  const __CFData *v12;
  char v13;
  int v14;
  int v15;
  int v16;
  char v17;
  __int128 v18;
  char v19;
  _BYTE *v20;
  unsigned int v21;
  int v22;
  _BYTE *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  char v27;
  int v28;
  _BYTE *v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  UInt8 buffer[16];
  __int128 v34;
  char v35;
  _BYTE v36[1024];
  _BYTE v37[1024];
  uint64_t v38;
  CFRange v39;

  v38 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 8))
    return 0;
  v37[0] = 0;
  v36[0] = 0;
  v35 = 0;
  v5 = *(const __CFDictionary **)(a1 + 48);
  if (v5)
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    goto LABEL_6;
  }
  v5 = (const __CFDictionary *)AirPlayGlobalRoute_CopyInfo();
  if (v5)
  {
LABEL_6:
    if (*(_BYTE *)(a1 + 424))
    {
      __strlcpy_chk();
      __strlcpy_chk();
      v6 = 0;
    }
    else
    {
      CFDictionaryGetCString();
      Int64 = CFDictionaryGetInt64();
      v8 = CFDictionaryGetInt64();
      if (*(_BYTE *)(a1 + 40))
        v9 = Int64 == 0;
      else
        v9 = 1;
      v10 = !v9;
      CFDictionaryGetValue(v5, CFSTR("MediaControlClientRouteInfo_TransportDevice"));
      if (APTransportDeviceGetAddress()
        && gLogCategory_MediaControlClientAuth <= 30
        && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v10
        && APTransportDeviceGetAddress()
        && gLogCategory_MediaControlClientAuth <= 30
        && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = v8 != 0;
      __strlcpy_chk();
      __strlcpy_chk();
    }
    Value = (const __CFData *)CFDictionaryGetValue(v5, CFSTR("MediaControlClientRouteInfo_PublicKey"));
    if (Value && (v12 = Value, CFDataGetLength(Value) == 32))
    {
      v39.location = 0;
      v39.length = 32;
      CFDataGetBytes(v12, v39, buffer);
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    v14 = v37[0];
    v15 = v36[0];
    if (!(v37[0] | v36[0]))
    {
      if (gLogCategory_MediaControlClientAuth > 90
        || gLogCategory_MediaControlClientAuth == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_73;
      }
      goto LABEL_41;
    }
    if (*(_BYTE *)(a1 + 424))
    {
      if (*(_BYTE *)(a1 + 279633))
      {
        v14 = 0;
        v37[0] = 0;
      }
      else
      {
        v15 = 0;
        v36[0] = 0;
      }
      if (!(v14 | v15))
      {
        if (gLogCategory_MediaControlClientAuth > 90
          || gLogCategory_MediaControlClientAuth == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_73;
        }
LABEL_41:
        LogPrintF();
LABEL_73:
        v32 = -6705;
LABEL_74:
        _MediaControlClient_EnsureDisconnected(a1, a2);
LABEL_75:
        CFRelease(v5);
        return v32;
      }
    }
    if (gLogCategory_MediaControlClientAuth <= 50
      && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(a2 + 281330) = 1;
    v16 = *(unsigned __int8 *)(a2 + 281312);
    v17 = v13 ^ 1;
    if (*(_BYTE *)(a2 + 281312))
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      v18 = v34;
      *(_OWORD *)(a2 + 281280) = *(_OWORD *)buffer;
      *(_OWORD *)(a2 + 281296) = v18;
      *(_BYTE *)(a2 + 281312) = 1;
      v16 = 1;
    }
    if (*(_QWORD *)(a2 + 281272))
    {
      if (!v16)
        goto LABEL_59;
    }
    else
    {
      v32 = gQblcfSzZBQsYCCV();
      if (v32)
        goto LABEL_145;
      if (!*(_BYTE *)(a2 + 281312))
        goto LABEL_59;
    }
    if (xOvZekdnwD6())
    {
      v19 = 0;
LABEL_82:
      if (!*(_BYTE *)(a2 + 8))
      {
        v22 = v37[0];
        if (v37[0])
          v23 = v37;
        else
          v23 = v36;
        if (gLogCategory_MediaControlClientAuth <= 50
          && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v25 = _MediaControlClient_Connect(a1, a2, (uint64_t)v23, v22 == 0);
        v32 = v25;
        if (v25 && v36[0] && v37[0])
        {
          v37[0] = 0;
          if (gLogCategory_MediaControlClientAuth <= 50
            && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v25 = _MediaControlClient_Connect(a1, a2, (uint64_t)v36, 1);
          v32 = v25;
        }
        if (v25)
          goto LABEL_145;
      }
      v26 = _MediaControlClient_DoPairVerify((_QWORD *)a1, a2);
      v32 = v26;
      if (v26)
        v27 = v19;
      else
        v27 = 1;
      if ((v27 & 1) == 0)
      {
        if (gLogCategory_MediaControlClientAuth <= 50
          && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v6
          || *(_BYTE *)(a1 + 74)
          || !v37[0]
          || (v30 = _MediaControlClient_DoPairSetupUnauthenticated((_QWORD *)a1, a2), v32 = v30, v30 == 200470))
        {
          v32 = _MediaControlClient_DoPairSetupPIN((_QWORD *)a1, a2);
          if (v32)
            goto LABEL_74;
        }
        else if (v30)
        {
          goto LABEL_145;
        }
        v26 = _MediaControlClient_DoPairVerify((_QWORD *)a1, a2);
        v32 = v26;
      }
      if (v26)
        goto LABEL_142;
      if (*(_BYTE *)(a2 + 8))
        goto LABEL_138;
      v28 = v37[0];
      if (v37[0])
        v29 = v37;
      else
        v29 = v36;
      if (gLogCategory_MediaControlClientAuth <= 50
        && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v31 = _MediaControlClient_Connect(a1, a2, (uint64_t)v29, v28 == 0);
      v32 = v31;
      if (v31 && v36[0] && v37[0])
      {
        v37[0] = 0;
        if (gLogCategory_MediaControlClientAuth <= 50
          && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v31 = _MediaControlClient_Connect(a1, a2, (uint64_t)v36, 1);
        v32 = v31;
      }
      if (!v31)
      {
LABEL_138:
        v32 = 0;
        if (gLogCategory_MediaControlClientCore > 50)
          goto LABEL_75;
        if (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize())
          LogPrintF();
        goto LABEL_142;
      }
LABEL_145:
      APSLogErrorAt();
LABEL_142:
      if (!v32)
        goto LABEL_75;
      goto LABEL_74;
    }
LABEL_59:
    if (v37[0])
      v20 = v37;
    else
      v20 = v36;
    if (gLogCategory_MediaControlClientAuth <= 50
      && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v21 = _MediaControlClient_Connect(a1, a2, (uint64_t)v20, v37[0] == 0);
    v32 = v21;
    if (v21 && v36[0] && v37[0])
    {
      v37[0] = 0;
      if (gLogCategory_MediaControlClientAuth <= 50
        && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v21 = _MediaControlClient_Connect(a1, a2, (uint64_t)v36, 1);
      v32 = v21;
    }
    if (v21)
      goto LABEL_145;
    if (v6
      || *(_BYTE *)(a1 + 74)
      || !v37[0]
      || (v24 = _MediaControlClient_DoPairSetupUnauthenticated((_QWORD *)a1, a2), v32 = v24, v24 == 200470))
    {
      v32 = _MediaControlClient_DoPairSetupPIN((_QWORD *)a1, a2);
      if (v32)
        goto LABEL_74;
    }
    else if (v24)
    {
      goto LABEL_145;
    }
    v19 = 1;
    goto LABEL_82;
  }
  APSLogErrorAt();
  _MediaControlClient_EnsureDisconnected(a1, a2);
  return 4294960587;
}

uint64_t _MediaControlClient_EnsureAuthenticated(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t FairPlayHWInfo;
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
  uint64_t i;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a2 + 279184;
  if (*(_BYTE *)(a2 + 279216))
    v3 = 1;
  else
    v3 = gMediaControlUseSecurity == 0;
  if (v3 || !APSFeaturesHasFeature())
    return 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  FairPlayHWInfo = GetFairPlayHWInfo();
  if ((_DWORD)FairPlayHWInfo)
  {
    v9 = FairPlayHWInfo;
    goto LABEL_47;
  }
  cp2g1b9ro();
  if ((_DWORD)v7)
  {
    v9 = v7;
    goto LABEL_47;
  }
  Mib5yocT();
  if ((_DWORD)v8)
  {
    v9 = v8;
    goto LABEL_47;
  }
  v10 = RandomBytes();
  if ((_DWORD)v10)
  {
    v9 = v10;
    goto LABEL_47;
  }
  v11 = RandomBytes();
  if ((_DWORD)v11)
  {
    v9 = v11;
    goto LABEL_47;
  }
  v12 = RandomBytes();
  if ((_DWORD)v12)
  {
    v9 = v12;
    goto LABEL_47;
  }
  v13 = RandomBytes();
  if ((_DWORD)v13)
  {
    v9 = v13;
    goto LABEL_47;
  }
  U4HBs();
  if ((_DWORD)v14)
  {
    v9 = v14;
    goto LABEL_47;
  }
  HTTPHeader_InitRequest();
  HTTPHeader_SetField();
  v9 = _MediaControlClient_DoTransaction(0x32u, a1, a2, 0, 0);
  if ((_DWORD)v9)
    goto LABEL_47;
  if (!*(_BYTE *)(v2 + 2146))
  {
LABEL_21:
    v17 = NetSocketGCM_Configure();
    if (!(_DWORD)v17)
    {
      for (i = 0; i != 64; ++i)
        *((_BYTE *)&v20 + i) = 0;
      v9 = 0;
      *(_BYTE *)(v2 + 32) = 1;
      goto LABEL_25;
    }
    v9 = v17;
    goto LABEL_47;
  }
  if (*(_QWORD *)(v2 + 2088))
  {
    v15 = PCFdAVst();
    if ((_DWORD)v15)
    {
      v9 = v15;
    }
    else
    {
      v16 = PCFdAVst();
      if (!(_DWORD)v16)
        goto LABEL_21;
      v9 = v16;
    }
LABEL_47:
    APSLogErrorAt();
    goto LABEL_25;
  }
  APSLogErrorAt();
  v9 = 4294960534;
LABEL_25:
  if (*(_QWORD *)v2)
  {
    free(*(void **)v2);
    *(_QWORD *)v2 = 0;
  }
  if ((_DWORD)v9)
  {
    if (gLogCategory_MediaControlClientAuth <= 60
      && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APSLogErrorAt();
  }
  return v9;
}

uint64_t _MediaControlClient_EnsureReverseConnected(uint64_t a1, _BYTE *a2)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  int Native;
  NSObject *v12;
  dispatch_source_t v13;
  _QWORD *v14;
  NSObject *v15;
  dispatch_time_t v16;

  v4 = a2 + 279184;
  if (a2[281344])
  {
    v5 = 4294960573;
    goto LABEL_5;
  }
  if (a2[8])
    goto LABEL_4;
  v6 = _MediaControlClient_EnsureConnected(a1, (uint64_t)a2);
  v5 = v6;
  if ((_DWORD)v6 == -6723)
    goto LABEL_5;
  if ((_DWORD)v6)
  {
LABEL_35:
    APSLogErrorAt();
    goto LABEL_5;
  }
  v7 = _MediaControlClient_EnsureAuthenticated((_QWORD *)a1, (uint64_t)a2);
  if ((_DWORD)v7)
  {
    v5 = v7;
    goto LABEL_35;
  }
  HTTPHeader_InitRequest();
  HTTPHeader_SetField();
  HTTPHeader_SetField();
  HTTPHeader_SetField();
  HTTPHeader_SetField();
  v8 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, (uint64_t)a2, 0, 0);
  if ((_DWORD)v8)
  {
    v5 = v8;
  }
  else
  {
    if (gLogCategory_MediaControlClientCore <= 40
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = dispatch_queue_create("MediaControlClientReverse", 0);
    *((_QWORD *)v4 + 271) = v10;
    if (v10)
    {
      dispatch_set_context(v10, a2);
      dispatch_set_finalizer_f(*((dispatch_object_t *)v4 + 271), (dispatch_function_t)_MediaControlClient_ReverseConnectionFinalizer);
      Native = NetSocket_GetNative();
      v12 = dispatch_source_create(MEMORY[0x24BDACA00], Native, 0, *((dispatch_queue_t *)v4 + 271));
      *((_QWORD *)v4 + 273) = v12;
      if (v12)
      {
        dispatch_set_context(v12, a2);
        dispatch_source_set_event_handler_f(*((dispatch_source_t *)v4 + 273), (dispatch_function_t)_MediaControlClient_ReverseConnectionReadHandler);
        dispatch_resume(*((dispatch_object_t *)v4 + 273));
        if ((*(_DWORD *)(a1 + 281776) - 2206800) > 0x326A3)
        {
LABEL_4:
          v5 = 0;
          goto LABEL_5;
        }
        if (gLogCategory_MediaControlClientCore <= 40
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v4 + 271));
        *((_QWORD *)v4 + 275) = v13;
        if (v13)
        {
          v14 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
          if (v14)
          {
            *v14 = a1;
            v14[1] = a2;
            dispatch_set_context(*((dispatch_object_t *)v4 + 275), v14);
            dispatch_source_set_event_handler_f(*((dispatch_source_t *)v4 + 275), (dispatch_function_t)_MediaControlClient_ReverseConnectionPingHandler);
            dispatch_source_set_cancel_handler_f(*((dispatch_source_t *)v4 + 275), _MediaControlClient_ReverseConnectionPingCancel);
            v15 = *((_QWORD *)v4 + 275);
            v16 = dispatch_time(0, 15000000000);
            dispatch_source_set_timer(v15, v16, 0x37E11D600uLL, 0x3B9ACA00uLL);
            dispatch_resume(*((dispatch_object_t *)v4 + 275));
            goto LABEL_4;
          }
        }
      }
      APSLogErrorAt();
      v5 = 4294960596;
    }
    else
    {
      APSLogErrorAt();
      v5 = 4294960568;
    }
  }
LABEL_5:
  if (*(_QWORD *)v4)
  {
    free(*(void **)v4);
    *(_QWORD *)v4 = 0;
  }
  if ((_DWORD)v5 == -6723)
    goto LABEL_20;
  if ((_DWORD)v5)
  {
    if (gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_20:
    _MediaControlClient_EnsureReverseDisconnected(a1, (dispatch_queue_t *)a2);
  }
  return v5;
}

NSObject *_MediaControlClient_ReverseConnectionFinalizer(uint64_t a1)
{
  NSObject *result;

  result = *(NSObject **)(a1 + 281360);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

void _MediaControlClient_ReverseConnectionReadHandler(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = a1 + 281368;
  v3 = NetSocket_HTTPReadHeader();
  if (v3 == -6753 || v3 == -6723)
    goto LABEL_6;
  if (v3 || (LogHTTP(), (*(unsigned int (**)(uint64_t))(v2 + 8))(a1)))
  {
    APSLogErrorAt();
LABEL_6:
    dispatch_source_cancel(*(dispatch_source_t *)v2);
  }
}

#error "218F06324: call analysis failed (funcsize=142)"

uint64_t _MediaControlClient_Connect(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t InterfaceInfo;
  int Native;
  socklen_t v14;

  v7 = a2 + 279208;
  v14 = 0;
  if (*(_QWORD *)(a1 + 56))
  {
    v8 = APSConnectionInterfaceManagerSelectInterface();
    if ((_DWORD)v8)
    {
      InterfaceInfo = v8;
      goto LABEL_26;
    }
  }
  *(_BYTE *)(v7 + 9) = a4;
  v9 = NetSocket_Create();
  if ((_DWORD)v9)
  {
    InterfaceInfo = v9;
    goto LABEL_26;
  }
  if (gLogCategory_MediaControlClientCore <= 50
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = AsyncConnection_ConnectSyncEx();
  if ((_DWORD)v10)
  {
    InterfaceInfo = v10;
    if (gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_29;
  }
  Native = NetSocket_GetNative();
  v14 = 28;
  if (getsockname(Native, (sockaddr *)(a2 + 12), &v14))
  {
    if (!*__error())
    {
      InterfaceInfo = 4294960596;
      goto LABEL_26;
    }
    InterfaceInfo = *__error();
    if ((_DWORD)InterfaceInfo)
    {
LABEL_26:
      APSLogErrorAt();
LABEL_29:
      if (*(_QWORD *)a2)
      {
        NetSocket_Delete();
        *(_QWORD *)a2 = 0;
      }
      if (*(_QWORD *)(a1 + 56) && *(_DWORD *)(v7 + 2060))
      {
        APSConnectionInterfaceManagerReleaseInterfaceSelection();
        *(_DWORD *)(v7 + 2060) = 0;
      }
      return InterfaceInfo;
    }
  }
  v14 = 28;
  if (getpeername(Native, (sockaddr *)(a2 + 40), &v14))
  {
    if (*__error())
    {
      InterfaceInfo = *__error();
      if (!(_DWORD)InterfaceInfo)
        goto LABEL_18;
    }
    else
    {
      InterfaceInfo = 4294960596;
    }
    goto LABEL_26;
  }
LABEL_18:
  InterfaceInfo = SocketGetInterfaceInfo();
  *(_BYTE *)(a2 + 8) = 1;
  if (gLogCategory_MediaControlClientCore <= 50
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((_DWORD)InterfaceInfo)
    goto LABEL_29;
  return InterfaceInfo;
}

uint64_t _MediaControlClient_DoPairSetupPIN(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  _DWORD *v4;
  const char *Password;
  const char *v6;
  uint64_t v7;
  CFStringRef v8;
  CFStringRef v9;
  uint64_t v10;
  CFStringRef v11;
  CFStringRef v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t v19;
  char cStr[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2 + 279184;
  v4 = &unk_255031000;
  if (gLogCategory_MediaControlClientAuth <= 30
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Password = (const char *)_MediaControlClient_GetPassword((uint64_t)a1);
  if (!Password || (v6 = Password, !*Password))
  {
    HTTPHeader_InitRequest();
    v15 = _MediaControlClient_DoTransaction(0x32u, a1, a2, 0, 0);
    if (v15)
      v10 = v15;
    else
      v10 = 200401;
    goto LABEL_23;
  }
  if (!*(_QWORD *)(v3 + 2088))
  {
    v7 = gQblcfSzZBQsYCCV();
    if ((_DWORD)v7)
    {
      v10 = v7;
      goto LABEL_38;
    }
  }
  XoN3GgjZNCvkN1T8I3();
  HardwareAddressToCString();
  v8 = CFStringCreateWithCString(0, cStr, 0x600u);
  if (!v8)
    goto LABEL_35;
  v9 = v8;
  v10 = rJPl3sdBfc0E3yB();
  CFRelease(v9);
  if ((_DWORD)v10)
  {
LABEL_38:
    APSLogErrorAt();
    goto LABEL_23;
  }
  v11 = CFStringCreateWithCString(0, v6, 0x600u);
  if (!v11)
  {
LABEL_35:
    APSLogErrorAt();
    v10 = 4294960596;
    goto LABEL_23;
  }
  v12 = v11;
  v10 = GvMGlTNs();
  CFRelease(v12);
  if ((_DWORD)v10)
    goto LABEL_38;
  v10 = 200401;
  v19 = 0;
  while (!SrtySZG0())
  {
    HTTPHeader_InitRequest();
    HTTPHeader_SetField();
    v13 = _MediaControlClient_DoTransaction(0x32u, a1, a2, 0, v19);
    if (v13 == 200470)
      v14 = 200401;
    else
      v14 = v13;
    if ((_DWORD)v14)
    {
      v10 = v14;
      break;
    }
    v19 = *(_QWORD *)(v3 + 16);
  }
  v4 = (_DWORD *)&unk_255031000;
LABEL_23:
  if (*(_QWORD *)v3)
  {
    free(*(void **)v3);
    *(_QWORD *)v3 = 0;
  }
  if ((_DWORD)v10)
  {
    v16 = v4[934];
    if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  return v10;
}

uint64_t _MediaControlClient_DoPairSetupUnauthenticated(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t i;
  char v11[96];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2 + 279184;
  if (gLogCategory_MediaControlClientAuth <= 30
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_QWORD *)(v4 + 2088) && (v5 = gQblcfSzZBQsYCCV(), (_DWORD)v5))
  {
    v9 = v5;
  }
  else
  {
    XoN3GgjZNCvkN1T8I3();
    for (i = 0; ; i = *(_QWORD *)(v4 + 16))
    {
      v6 = h4BvW7X();
      if ((_DWORD)v6)
      {
        v9 = v6;
        goto LABEL_11;
      }
      HTTPHeader_InitRequest();
      HTTPHeader_SetField();
      v7 = _MediaControlClient_DoTransaction(0x32u, a1, a2, v11, i);
      if ((_DWORD)v7)
        break;
    }
    v9 = v7;
  }
  APSLogErrorAt();
LABEL_11:
  if (*(_QWORD *)v4)
  {
    free(*(void **)v4);
    *(_QWORD *)v4 = 0;
  }
  if ((_DWORD)v9
    && gLogCategory_MediaControlClientAuth <= 60
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v9;
}

uint64_t _MediaControlClient_DoPairVerify(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v10[96];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2 + 279184;
  if (gLogCategory_MediaControlClientAuth <= 30
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_QWORD *)(v4 + 2088) && (v5 = gQblcfSzZBQsYCCV(), (_DWORD)v5))
  {
    v6 = v5;
    APSLogErrorAt();
  }
  else if (*(_BYTE *)(v4 + 2128))
  {
    XoN3GgjZNCvkN1T8I3();
    Dk7hjUuq();
    for (i = 0; ; i = *(_QWORD *)(v4 + 16))
    {
      v6 = VBAEFt();
      if ((_DWORD)v6)
        break;
      HTTPHeader_InitRequest();
      if (*(_BYTE *)(v4 + 2146))
        HTTPHeader_SetField();
      if (TMIsAutomaticTimeEnabled())
      {
        CFAbsoluteTimeGetCurrent();
        HTTPHeader_SetField();
      }
      HTTPHeader_SetField();
      v7 = _MediaControlClient_DoTransaction(0x32u, a1, a2, v10, i);
      if ((_DWORD)v7)
      {
        v6 = v7;
        break;
      }
    }
  }
  else
  {
    APSLogErrorAt();
    v6 = 4294960534;
  }
  if (*(_QWORD *)v4)
  {
    free(*(void **)v4);
    *(_QWORD *)v4 = 0;
  }
  if ((_DWORD)v6
    && gLogCategory_MediaControlClientAuth <= 60
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v6;
}

void _MediaControlClient_ConnectProgress(int a1, uint64_t a2, CFAbsoluteTime *a3)
{
  CFAbsoluteTime *v4;

  v4 = a3 + 105620;
  switch(a1)
  {
    case 1:
      if (*v4 == 0.0)
      {
        *v4 = CFAbsoluteTimeGetCurrent();
        if (gLogCategory_MediaControlClientCore <= 50
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_26;
        }
      }
      break;
    case 2:
      if (a3[105621] == 0.0)
      {
        a3[105621] = CFAbsoluteTimeGetCurrent();
        if (gLogCategory_MediaControlClientCore <= 50
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_26;
        }
      }
      break;
    case 3:
      if (a3[105622] == 0.0)
      {
        a3[105622] = CFAbsoluteTimeGetCurrent();
        if (gLogCategory_MediaControlClientCore <= 50
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (_MediaControlClient_AddTrafficRegistration((uint64_t)a3, 0)
          && gLogCategory_MediaControlClientCore <= 90
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
LABEL_26:
          LogPrintF();
        }
      }
      break;
    case 4:
      if (a3[105623] == 0.0)
      {
        a3[105623] = CFAbsoluteTimeGetCurrent();
        if (gLogCategory_MediaControlClientCore <= 50
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *((_DWORD *)v4 + 17) = ((v4[3] - v4[2]) * 1000.0);
      }
      break;
    default:
      return;
  }
}

uint64_t _MediaControlClient_ConnectWaitCallBack(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 281752))
    return 4294960573;
  else
    return 0;
}

uint64_t _MediaControlClient_AddTrafficRegistration(uint64_t a1, int a2)
{
  uint64_t v3;
  BOOL v6;
  int v8;
  __int16 v9;
  unsigned int PeerMACAddress;

  PeerMACAddress = 0;
  v9 = 0;
  v8 = 0;
  if (!a1)
  {
    APSLogErrorAt();
    return -6705;
  }
  v3 = a1 + 281760;
  if (*(_BYTE *)(a1 + 279633))
  {
    if (*(_QWORD *)v3)
    {
      CFDictionaryGetHardwareAddress();
      if (*(_QWORD *)v3 && PeerMACAddress == 0)
        goto LABEL_57;
    }
    if (gLogCategory_MediaControlClientCore <= 50
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    PeerMACAddress = GetPeerMACAddress();
    if (!PeerMACAddress)
    {
LABEL_57:
      if (*(_BYTE *)(v3 + 62))
      {
        if (*(unsigned __int8 *)(v3 + 63) != a2
          || (v8 == *(_DWORD *)(v3 + 56) ? (v6 = v9 == *(_WORD *)(v3 + 60)) : (v6 = 0), !v6))
        {
LABEL_29:
          PeerMACAddress = _MediaControlClient_RemoveTrafficRegistration(a1);
          if (PeerMACAddress)
          {
            if (gLogCategory_MediaControlClientCore <= 90
              && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            PeerMACAddress = 0;
          }
        }
      }
      else if (*(_BYTE *)(v3 + 63))
      {
        goto LABEL_29;
      }
      if (!*(_BYTE *)(v3 + 62))
      {
        PeerMACAddress = _MediaControlClient_addRegistration((uint64_t)&v8, 1, a2);
        if (PeerMACAddress)
        {
          if (gLogCategory_MediaControlClientCore <= 90
            && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          PeerMACAddress = 0;
        }
        *(_DWORD *)(a1 + 281816) = v8;
        *(_WORD *)(a1 + 281820) = v9;
        *(_BYTE *)(v3 + 62) = 1;
        *(_BYTE *)(v3 + 63) = a2;
      }
      return PeerMACAddress;
    }
    if (gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 281822))
      _MediaControlClient_RemoveTrafficRegistration(a1);
    if (!*(_BYTE *)(v3 + 63))
    {
      PeerMACAddress = _MediaControlClient_addRegistration((uint64_t)&v8, 0, 1);
      if (PeerMACAddress)
      {
        if (gLogCategory_MediaControlClientCore <= 90
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        PeerMACAddress = 0;
      }
      *(_WORD *)(v3 + 62) = 256;
    }
  }
  return PeerMACAddress;
}

uint64_t _MediaControlClient_addRegistration(uint64_t a1, int a2, int a3)
{
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef cf;

  cf = 0;
  APTransportGetSharedTransport();
  CMBaseObject = FigTransportGetCMBaseObject();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v6)
  {
    v9 = 4294954514;
LABEL_9:
    APSLogErrorAt();
    goto LABEL_11;
  }
  v7 = v6(CMBaseObject, *MEMORY[0x24BDFD7E8], *MEMORY[0x24BDBD240], &cf);
  if ((_DWORD)v7)
  {
    v9 = v7;
    goto LABEL_9;
  }
  if (a2)
  {
    v8 = APTransportTrafficRegistrarAWDLTrafficRegistrationCreate();
    if ((_DWORD)v8)
    {
      v9 = v8;
      goto LABEL_9;
    }
  }
  if (a3)
  {
    v9 = APTransportTrafficRegistrarInfraTransactionCreate();
    if (!(_DWORD)v9)
      goto LABEL_11;
    goto LABEL_9;
  }
  v9 = 0;
LABEL_11:
  if (cf)
    CFRelease(cf);
  return v9;
}

uint64_t MediaControlClient_Create(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t Instance;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t result;

  if (gMediaControlClientInitOnce != -1)
    dispatch_once_f(&gMediaControlClientInitOnce, 0, (dispatch_function_t)_MediaControlClient_GlobalInit);
  if (MediaControlClientImp_getTypeID_sInitOnce != -1)
    dispatch_once_f(&MediaControlClientImp_getTypeID_sInitOnce, &MediaControlClientImp_getTypeID_sTypeID, (dispatch_function_t)MediaControlClientImp_registerTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v6 = Instance;
    v7 = Instance + 842496;
    v8 = (_QWORD *)(Instance + 561032);
    v9 = (_QWORD *)(Instance + 279624);
    bzero((void *)(Instance + 16), 0xCE510uLL);
    v10 = MEMORY[0x24BDAC9B8];
    dispatch_retain(MEMORY[0x24BDAC9B8]);
    v11 = *(NSObject **)(v6 + 16);
    if (v11)
      dispatch_release(v11);
    *(_QWORD *)(v6 + 16) = v10;
    *(_QWORD *)(v6 + 384) = APSGetDeviceID();
    *(_QWORD *)(v6 + 64) = a2;
    *(_BYTE *)(v6 + 40) = APSSettingsGetInt64() != 0;
    *(_BYTE *)(v6 + 72) = APSSettingsGetInt64() != 0;
    *(_BYTE *)(v6 + 73) = APSSettingsGetInt64() != 0;
    *(_BYTE *)(v6 + 74) = APSSettingsGetInt64() != 0;
    HTTPClientAuthorization_Init();
    *(_DWORD *)(v6 + 80) = 2;
    UUIDGet();
    result = 0;
    *v9 = "control";
    *v8 = "event";
    v8[266] = v6;
    v8[271] = _MediaControlClient_HandleEventRequest;
    *(_DWORD *)(v7 + 2432) = -1;
    *(_QWORD *)v7 = "slideshow";
    *(_QWORD *)(v7 + 2128) = v6;
    *(_QWORD *)(v7 + 2168) = _MediaControlClient_HandleSlideshowRequest;
    *a3 = v6;
  }
  else
  {
    APSLogErrorAt();
    return 4294960568;
  }
  return result;
}

uint64_t MediaControlClientImp_registerTypeID(uint64_t *a1)
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  *a1 = result;
  return result;
}

uint64_t _MediaControlClient_HandleEventRequest(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  CFPropertyListRef v7;
  CFTypeID v8;
  int v9;
  void (**v10)(uint64_t, CFPropertyListRef, _QWORD);
  const void *TypedValue;
  const void *v12;
  const void *v13;
  _QWORD context[2];
  CFIndex length;

  if (*(_QWORD *)(a1 + 8544) >= 0x20000uLL)
  {
    APSLogErrorAt();
    return 4294960553;
  }
  v2 = *(_QWORD *)(a1 + 281336);
  length = *(_QWORD *)(a1 + 8544);
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 24))();
  v4 = v3;
  if ((_DWORD)v3 == -6723)
    return v4;
  if ((_DWORD)v3)
  {
    APSLogErrorAt();
    return v4;
  }
  LogHTTP();
  if (strnicmpx())
  {
    if (gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 0;
    goto LABEL_40;
  }
  v5 = CFDataCreate(0, (const UInt8 *)(a1 + 17040), length);
  if (v5)
  {
    v6 = v5;
    v7 = CFPropertyListCreateWithData(0, v5, 0, 0, 0);
    CFRelease(v6);
    if (v7)
    {
      v8 = CFGetTypeID(v7);
      if (v8 == CFDictionaryGetTypeID())
      {
        v9 = gLogCategory_MediaControlClientEvents;
        if (gLogCategory_MediaControlClientEvents > 30)
          goto LABEL_21;
        if (gLogCategory_MediaControlClientEvents == -1)
        {
          if (!_LogCategory_Initialize())
            goto LABEL_21;
          v9 = gLogCategory_MediaControlClientEvents;
        }
        if (v9 == -1)
          _LogCategory_Initialize();
        LogPrintF();
LABEL_21:
        v10 = (void (**)(uint64_t, CFPropertyListRef, _QWORD))(v2 + 563216);
        CFStringGetTypeID();
        TypedValue = (const void *)CFDictionaryGetTypedValue();
        if (TypedValue)
        {
          context[0] = v2;
          context[1] = CFEqual(TypedValue, CFSTR("paused"));
          dispatch_sync_f(*(dispatch_queue_t *)(v2 + 16), context, (dispatch_function_t)_MediaControlClient_PlaybackPausedCallback);
        }
        CFStringGetTypeID();
        v12 = (const void *)CFDictionaryGetTypedValue();
        if (!v12)
          goto LABEL_38;
        v13 = v12;
        if (CFEqual(v12, CFSTR("previous")))
        {
          if (gLogCategory_MediaControlClientEvents > 30
            || gLogCategory_MediaControlClientEvents == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_37;
          }
        }
        else
        {
          if (!CFEqual(v13, CFSTR("next")))
            goto LABEL_38;
          if (gLogCategory_MediaControlClientEvents > 30
            || gLogCategory_MediaControlClientEvents == -1 && !_LogCategory_Initialize())
          {
LABEL_37:
            MRMediaRemoteSendCommand();
LABEL_38:
            if (*v10)
              (*v10)(v2, v7, *(_QWORD *)(v2 + 563224));
            goto LABEL_40;
          }
        }
        LogPrintF();
        goto LABEL_37;
      }
    }
    APSLogErrorAt();
  }
  else
  {
    APSLogErrorAt();
    v7 = 0;
  }
LABEL_40:
  v4 = _MediaControlClient_SendStatusResponse(a1);
  if ((_DWORD)v4)
  {
    APSLogErrorAt();
    if (!v7)
      return v4;
    goto LABEL_42;
  }
  if (v7)
LABEL_42:
    CFRelease(v7);
  return v4;
}

uint64_t _MediaControlClient_HandleSlideshowRequest(_QWORD *a1)
{
  __CFDictionary *Mutable;
  __CFString *v3;
  _QWORD *v4;
  int v5;
  const __CFData *v6;
  uint64_t v7;
  const UInt8 *BytePtr;
  unsigned int Length;
  __CFDictionary *v11;
  const __CFData *Data;
  uint64_t v13;
  CFTypeRef v14;
  CFTypeRef cf;
  CFIndex v16;
  const UInt8 *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  if (!strnicmpx())
  {
    v7 = 0xFFFFFFFFLL;
LABEL_20:
    APSLogErrorAt();
    return v7;
  }
  v16 = 0;
  v17 = 0;
  v14 = 0;
  cf = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    APSLogErrorAt();
    v3 = 0;
LABEL_42:
    v6 = 0;
    goto LABEL_7;
  }
  if (SNScanF() != 1)
    goto LABEL_45;
  v3 = (__CFString *)CFStringCreateWithBytes(0, v17, v16, 0x8000100u, 0);
  if (!v3)
  {
LABEL_41:
    APSLogErrorAt();
    goto LABEL_42;
  }
  CFDictionarySetValue(Mutable, CFSTR("key"), v3);
  CFRelease(v3);
  v4 = a1 + 35167;
  v5 = (*(uint64_t (**)(__CFDictionary *, CFTypeRef *, CFTypeRef *, _QWORD))(a1[35167] + 844688))(Mutable, &cf, &v14, *(_QWORD *)(a1[35167] + 844696));
  if (v5 == -6752)
  {
    v3 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  if (v5)
  {
LABEL_45:
    APSLogErrorAt();
    v3 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  HTTPHeader_InitResponse();
  if (HTTPGetHeaderField())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)cf);
    Length = CFDataGetLength((CFDataRef)cf);
    v3 = 0;
    v6 = 0;
    goto LABEL_30;
  }
  v11 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = (__CFString *)v11;
  if (!v11)
    goto LABEL_41;
  CFDictionarySetValue(v11, CFSTR("data"), cf);
  if (v14)
    CFDictionarySetValue((CFMutableDictionaryRef)v3, CFSTR("info"), v14);
  Data = CFPropertyListCreateData(0, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  v6 = Data;
  if (Data)
  {
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(v6);
    HTTPHeader_SetField();
LABEL_30:
    HTTPHeader_SetField();
    if (!HTTPHeader_Commit())
    {
      LogHTTP();
      v13 = *((unsigned int *)a1 + 4188);
      v18[0] = a1 + 1070;
      v18[1] = v13;
      v18[2] = BytePtr;
      v18[3] = Length;
      v7 = (*(uint64_t (**)(_QWORD, _QWORD *))(*a1 + 40))(*a1, v18);
      if ((v7 & 0xFFFFFFDF) != 0
        && gLogCategory_MediaControlClientCore <= 60
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      ++*(_DWORD *)(*v4 + 844732);
      goto LABEL_37;
    }
  }
  APSLogErrorAt();
LABEL_7:
  v7 = _MediaControlClient_SendStatusResponse((uint64_t)a1);
  if ((_DWORD)v7)
  {
    APSLogErrorAt();
    if (!Mutable)
    {
LABEL_9:
      if (!v3)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if (!Mutable)
  {
    goto LABEL_9;
  }
LABEL_37:
  CFRelease(Mutable);
  if (v3)
LABEL_10:
    CFRelease(v3);
LABEL_11:
  if (v6)
    CFRelease(v6);
  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);
  if ((_DWORD)v7)
    goto LABEL_20;
  return v7;
}

uint64_t _MediaControlClient_SendStatusResponse(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  HTTPHeader_InitResponse();
  HTTPHeader_SetField();
  v2 = HTTPHeader_Commit();
  if ((_DWORD)v2)
  {
    v3 = v2;
    goto LABEL_5;
  }
  LogHTTP();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 32))();
  if ((_DWORD)v3)
LABEL_5:
    APSLogErrorAt();
  return v3;
}

void _MediaControlClient_PlaybackPausedCallback(uint64_t a1)
{
  _MediaControlClient_PlaybackPaused(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

void MediaControlClient_Finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  void **v4;
  const void *v5;
  const void *v6;
  CFTypeRef *v7;
  const void *v8;
  const void *v9;
  NSObject *v10;

  _MediaControlClient_EnsureMirroringResumed((uint64_t)a1);
  MediaControlClient_EnsureDisconnected((uint64_t)a1);
  _MediaControlClient_PlaybackStopped((uint64_t)a1);
  v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  v4 = (void **)(a1 + 105606);
  v5 = (const void *)a1[6];
  if (v5)
  {
    CFRelease(v5);
    a1[6] = 0;
  }
  v6 = (const void *)a1[7];
  if (v6)
  {
    CFRelease(v6);
    a1[7] = 0;
  }
  v7 = (CFTypeRef *)(a1 + 35225);
  HTTPClientAuthorization_Free();
  if (*v4)
  {
    free(*v4);
    *v4 = 0;
  }
  v8 = (const void *)a1[105607];
  if (v8)
  {
    CFRelease(v8);
    a1[105607] = 0;
  }
  if (*v7)
  {
    CFRelease(*v7);
    *v7 = 0;
  }
  v9 = (const void *)a1[35226];
  if (v9)
  {
    CFRelease(v9);
    a1[35226] = 0;
  }
  v10 = a1[2];
  if (v10)
  {
    dispatch_release(v10);
    a1[2] = 0;
  }
}

intptr_t _MediaControlClient_EnsureMirroringResumed(uint64_t a1)
{
  intptr_t v2;
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  intptr_t result;

  v2 = gAirPlayRouteLock;
  if (gAirPlayRouteLock)
    v2 = dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
  v3 = (_BYTE *)(a1 + 563232);
  if (*(_BYTE *)(a1 + 563232))
  {
    if (!--gAirPlayMirroringSuspendCount)
    {
      if (gLogCategory_MediaControlClientCore <= 50)
      {
        if (gLogCategory_MediaControlClientCore != -1 || (v2 = _LogCategory_Initialize(), (_DWORD)v2))
          v2 = LogPrintF();
      }
      v4 = (void *)objc_msgSend((id)getAVSystemControllerClass(v2), "sharedAVSystemController");
      v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      objc_msgSend(v4, "setAttribute:forKey:error:", v5, getAVSystemController_AirPlayScreenSuspended(), 0);
    }
    *v3 = 0;
  }
  result = gAirPlayRouteLock;
  if (gAirPlayRouteLock)
    return dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  return result;
}

uint64_t AVSystemController_AirPlayScreenSuspendedFunction()
{
  return constantValAVSystemController_AirPlayScreenSuspended;
}

uint64_t initValAVSystemController_AirPlayScreenSuspended()
{
  uint64_t *v0;
  uint64_t result;

  if (CelestialLibrary_sOnce != -1)
    dispatch_once(&CelestialLibrary_sOnce, &__block_literal_global);
  v0 = (uint64_t *)dlsym((void *)CelestialLibrary_sLib, "AVSystemController_AirPlayScreenSuspended");
  if (v0)
  {
    result = *v0;
    constantValAVSystemController_AirPlayScreenSuspended = result;
  }
  else
  {
    result = constantValAVSystemController_AirPlayScreenSuspended;
  }
  getAVSystemController_AirPlayScreenSuspended = AVSystemController_AirPlayScreenSuspendedFunction;
  return result;
}

uint64_t MediaControlClient_Cancel(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_BYTE *)(a1 + 844632);
  v2 = a1 + 563168;
  v3 = a1 + 281752;
  *(_BYTE *)(a1 + 281752) = 1;
  if (*(_QWORD *)(a1 + 416))
    NetSocket_Cancel();
  *(_BYTE *)v2 = 1;
  if (*(_QWORD *)(v3 + 72))
    NetSocket_Cancel();
  *v1 = 1;
  if (*(_QWORD *)(v2 + 120))
    NetSocket_Cancel();
  return 0;
}

void MediaControlClient_Invalidate(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = MEMORY[0x24BDAC9B8];
  dispatch_retain(MEMORY[0x24BDAC9B8]);
  v3 = *(NSObject **)(a1 + 16);
  if (v3)
    dispatch_release(v3);
  *(_QWORD *)(a1 + 16) = v2;
}

void MediaControlClient_SetDispatchQueue(uint64_t a1, NSObject *a2)
{
  NSObject *v3;
  NSObject *v4;

  if (a2)
    v3 = a2;
  else
    v3 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v3);
  v4 = *(NSObject **)(a1 + 16);
  if (v4)
    dispatch_release(v4);
  *(_QWORD *)(a1 + 16) = v3;
}

uint64_t MediaControlClient_SetHost()
{
  return ReplaceDifferentString();
}

uint64_t MediaControlClient_SetPassword()
{
  return ReplaceDifferentString();
}

uint64_t MediaControlClient_SetInfo(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 48);
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 48) = cf;
  if (v4)
    CFRelease(v4);
  return 0;
}

uint64_t MediaControlClient_SetConnectionInterfaceManager(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 56);
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 56) = cf;
  if (v4)
    CFRelease(v4);
  return 0;
}

uint64_t MediaControlClient_DoAuthorize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5, uint64_t a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFAbsoluteTime Current;
  uint64_t v24;

  v13 = a1 + 845008;
  if (gLogCategory_MediaControlClientAuth <= 30
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v24 = a4;
  v14 = (void **)(a1 + 279600);
  v15 = MediaControlClient_EnsureConnected(a1);
  if (*(double *)v13 == 0.0)
    *(CFAbsoluteTime *)v13 = CFAbsoluteTimeGetCurrent();
  if (!(_DWORD)v15)
  {
    v16 = Base64EncodeCopyEx();
    if ((_DWORD)v16)
    {
      v15 = v16;
    }
    else
    {
      v17 = snprintf((char *)(a1 + 17456), 0x20000uLL, "%s: %s\n", "PIC-Request", 0);
      free(0);
      if (v17 - 0x20000 <= 0xFFFE0000)
        goto LABEL_32;
      HTTPHeader_InitRequest();
      if (v24)
        HTTPHeader_SetField();
      v18 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, a1 + 416, (const char *)(a1 + 17456), v17);
      if ((_DWORD)v18)
      {
        v15 = v18;
        goto LABEL_17;
      }
      v19 = HTTPGetHeaderField();
      if (!(_DWORD)v19)
      {
        if (a6)
        {
          *a5 = 0;
          v20 = HTTPGetHeaderField();
          if (!(_DWORD)v20)
          {
            v15 = 0;
            *a7 = 0;
            *a8 = 0;
            goto LABEL_17;
          }
          v15 = v20;
          goto LABEL_34;
        }
LABEL_32:
        APSLogErrorAt();
        v15 = 4294960553;
        goto LABEL_17;
      }
      v15 = v19;
    }
  }
LABEL_34:
  APSLogErrorAt();
LABEL_17:
  if (*(double *)(v13 + 8) == 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(CFAbsoluteTime *)(v13 + 8) = Current;
    *(_DWORD *)(v13 + 32) = ((Current - *(double *)v13) * 1000.0);
  }
  if (*v14)
  {
    free(*v14);
    *v14 = 0;
  }
  if ((_DWORD)v15
    && gLogCategory_MediaControlClientAuth <= 60
    && (gLogCategory_MediaControlClientAuth != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v15;
}

uint64_t MediaControlClient_DoPlayLocal(uint64_t a1, const char *a2, const __CFDictionary *a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  double v17;
  uint64_t LocalHostName;
  CC_LONG v19;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int HasFeature;
  const void **v26;
  uint64_t v27;
  CFDataRef v28;
  const __CFData *v29;
  const char *BytePtr;
  CFIndex Length;
  CC_SHA1_CTX c;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  stat v38;
  char __s[256];
  double v40;
  __int128 v41;
  _BYTE data[16];
  char v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a1 + 844832;
  memset(&v38, 0, sizeof(v38));
  v34 = 0;
  v35 = 0;
  v37 = 0;
  v36 = 0;
  memset(&c, 0, sizeof(c));
  *(_BYTE *)(a1 + 844934) = CFDictionaryGetInt64() != 0;
  v7 = MediaControlClient_EnsureConnected(a1);
  v38.st_size = 0;
  stat(a2, &v38);
  _MediaControlClient_LogVideoStarted(a1, a3);
  if ((_DWORD)v7)
    goto LABEL_57;
  v9 = v8;
  if (*(_BYTE *)(v6 + 102))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
    gMediaControlAudioClient = a1;
    dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  }
  v10 = _MediaControlClient_EnsureServerListening(a1);
  if ((_DWORD)v10)
  {
    v7 = v10;
    goto LABEL_57;
  }
  v11 = strdup(a2);
  if (!v11)
  {
LABEL_53:
    APSLogErrorAt();
    v7 = 4294960568;
    goto LABEL_63;
  }
  v12 = v11;
  v13 = *(void **)(v6 + 16);
  if (v13)
    free(v13);
  *(_QWORD *)(v6 + 16) = v12;
  if (!*(_BYTE *)(a1 + 281796) && *(_BYTE *)(a1 + 429) != 2)
  {
    LocalHostName = GetLocalHostName();
    if (!(_DWORD)LocalHostName)
    {
      snprintf(__s, 0x20uLL, ":%d", *(_DWORD *)(*(_QWORD *)v6 + 128));
      __strlcat_chk();
      goto LABEL_11;
    }
    v7 = LocalHostName;
LABEL_57:
    APSLogErrorAt();
    goto LABEL_63;
  }
  SockAddrCopy();
  SockAddrSetPort();
  v14 = SockAddrToString();
  if ((_DWORD)v14)
  {
    v7 = v14;
    goto LABEL_57;
  }
LABEL_11:
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, "\xD9\x1D\xC0\x69_\x1AH\v\x94\x95\xBC\xB5\x84O\xF1\x764v", 0x10u);
  v40 = 0.0;
  __s[0] = 0;
  APSSettingsGetCString();
  v15 = strchr(__s, 58);
  if (v15
    && (v16 = v15, !StringToUUID())
    && sscanf(v16 + 1, "%lf", &v40) == 1
    && (v17 = CFAbsoluteTimeGetCurrent() - v40, v40 = v17, v17 >= 0.0)
    && v17 < 604800.0)
  {
    if (gLogCategory_MediaControlClientCore <= 20
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
LABEL_21:
      LogPrintF();
    }
  }
  else
  {
    UUIDGet();
    CFAbsoluteTimeGetCurrent();
    SNPrintF();
    APSSettingsSetCString();
    APSSettingsSynchronize();
    if (gLogCategory_MediaControlClientCore <= 40
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_21;
    }
  }
  CC_SHA1_Update(&c, data, 0x10u);
  v19 = strlen(a2);
  CC_SHA1_Update(&c, a2, v19);
  CC_SHA1_Final((unsigned __int8 *)__s, &c);
  v41 = *(_OWORD *)__s;
  BYTE6(v41) = __s[6] & 0xF | 0x50;
  BYTE8(v41) = __s[8] & 0x3F | 0x80;
  GetFileExtensionFromString();
  if (SNPrintF() - 64 > 0xFFFFFFC0)
  {
    if (a3)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
    else
      MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v21 = MutableCopy;
    if (MutableCopy)
    {
      LOBYTE(v40) = 0;
      GetDeviceModelString();
      CFDictionarySetCString();
      LOBYTE(v40) = 0;
      GetSystemBuildVersionString();
      CFDictionarySetCString();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      CFDictionarySetInt64();
      if (*(_BYTE *)(a1 + 281796))
      {
        v22 = CFDictionarySetCString();
        if ((_DWORD)v22)
        {
          v7 = v22;
          goto LABEL_61;
        }
        if ((snprintf(__s, 0x100uLL, "/1/%s", (const char *)(a1 + 844864)) - 256) > 0xFFFFFF00)
        {
          v23 = CFDictionarySetCString();
          if ((_DWORD)v23)
          {
            v7 = v23;
LABEL_61:
            APSLogErrorAt();
            goto LABEL_62;
          }
LABEL_37:
          HasFeature = APSFeaturesHasFeature();
          v26 = (const void **)MEMORY[0x24BDBD270];
          if (HasFeature && *(_QWORD *)(a1 + 281688))
            CFDictionarySetValue(v21, CFSTR("tlsPSKEnabled"), (const void *)*MEMORY[0x24BDBD270]);
          if (*(_BYTE *)(a1 + 281797))
            CFDictionarySetValue(v21, CFSTR("videoCacheClear"), *v26);
          LOBYTE(v40) = 0;
          HardwareAddressToCString();
          v27 = CFDictionarySetCString();
          if (!(_DWORD)v27)
          {
            dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
            CFDictionarySetDouble();
            dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
            v28 = CFPropertyListCreateData(0, v21, kCFPropertyListBinaryFormat_v1_0, 0, 0);
            if (v28)
            {
              v29 = v28;
              HTTPHeader_InitRequest();
              HTTPHeader_SetField();
              BytePtr = (const char *)CFDataGetBytePtr(v29);
              Length = CFDataGetLength(v29);
              v7 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, a1 + 416, BytePtr, Length);
              CFRelease(v29);
              if (!(_DWORD)v7)
              {
                _MediaControlClient_PlaybackStarted(a1, v9);
                _MediaControlClientNowPlayingEnsureSetUp(a1);
                CFRelease(v21);
                return v7;
              }
            }
            else
            {
              APSLogErrorAt();
              v7 = 4294960596;
            }
            goto LABEL_62;
          }
          v7 = v27;
          goto LABEL_61;
        }
      }
      else if ((snprintf(__s, 0x100uLL, "http://%s/1/%s", v43, (const char *)(a1 + 844864)) - 256) > 0xFFFFFF00)
      {
        v24 = CFDictionarySetCString();
        if ((_DWORD)v24)
        {
          v7 = v24;
          goto LABEL_61;
        }
        goto LABEL_37;
      }
      APSLogErrorAt();
      v7 = 4294960553;
LABEL_62:
      CFRelease(v21);
      goto LABEL_63;
    }
    goto LABEL_53;
  }
  APSLogErrorAt();
  v7 = 4294960553;
LABEL_63:
  if (gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v7;
}

void _MediaControlClient_LogVideoStarted(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v4;
  double Current;
  double v6;
  char *v7;

  v4 = a1 + 844768;
  UUIDGet();
  if (*(double *)v4 == 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(double *)v4 = Current;
    v6 = *(double *)(v4 + 248);
    if (v6 != 0.0)
      *(_DWORD *)(v4 + 276) = ((Current - v6) * 1000.0);
  }
  *(_QWORD *)(v4 + 168) = 0;
  *(_QWORD *)(v4 + 176) = 0;
  *(_OWORD *)(a1 + 844784) = 0u;
  *(_OWORD *)(a1 + 844800) = 0u;
  CFDictionaryGetInt64();
  if (!CFDictionaryGetValue(a2, CFSTR("Start-Position")) && !CFDictionaryGetValue(a2, CFSTR("Start-Date")))
    CFDictionaryGetValue(a2, CFSTR("Start-Estimated-Date"));
  v7 = (char *)sub_218F096AC + 4 * byte_218F1D0BC[MediaControlPlayParamsToStreamType(a2)];
  __asm { BR              X10 }
}

uint64_t sub_218F096AC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v34;
  const __CFDictionary *v35;
  _DWORD *v36;
  uint64_t v37;
  int v38;
  int v39;

  v38 = *(_DWORD *)(v37 + 3512);
  if (v38 <= 50 && (v38 != -1 || _LogCategory_Initialize()))
  {
    CFDictionaryGetValue(v35, CFSTR("uuid"));
    if (*(_DWORD *)(v37 + 3512) == -1)
      _LogCategory_Initialize();
    CFDictionaryGetValue(v35, CFSTR("path"));
    if (*(_DWORD *)(v37 + 3512) == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
  ++*v36;
  v39 = *(_DWORD *)(v37 + 3512);
  if (v39 <= 50 && (v39 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  return v34;
}

uint64_t _MediaControlClient_EnsureServerListening(uint64_t a1)
{
  uint64_t *v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;

  v2 = (uint64_t *)(a1 + 844832);
  if (*(_QWORD *)(a1 + 844840) || (v3 = dispatch_semaphore_create(1), (v2[1] = (uint64_t)v3) != 0))
  {
    if (*v2)
      return 0;
    v4 = HTTPServer_Create();
    if ((_DWORD)v4)
    {
      v8 = v4;
    }
    else
    {
      v5 = *v2;
      *(_QWORD *)(v5 + 200) = &gLogCategory_MediaControlClientHTTPServer;
      *(_QWORD *)(v5 + 208) = &gLogCategory_MediaControlClientHTTPServer;
      if (*(_BYTE *)(a1 + 279633))
        *(_BYTE *)(v5 + 104) = 1;
      if (!APSFeaturesHasFeature() || !*(_QWORD *)(a1 + 281688))
      {
        *(_BYTE *)(a1 + 281745) = 0;
        if (gLogCategory_MediaControlClientHTTPServer > 30
          || gLogCategory_MediaControlClientHTTPServer == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_19;
        }
LABEL_15:
        LogPrintF();
LABEL_19:
        v7 = HTTPServer_Start();
        if (!(_DWORD)v7)
        {
          if (gLogCategory_MediaControlClientHTTPServer <= 40
            && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          return 0;
        }
        v8 = v7;
        goto LABEL_30;
      }
      v6 = PCFdAVst();
      if (!(_DWORD)v6)
      {
        *(_BYTE *)(a1 + 281745) = 1;
        if (gLogCategory_MediaControlClientHTTPServer > 30
          || gLogCategory_MediaControlClientHTTPServer == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
      v8 = v6;
    }
LABEL_30:
    APSLogErrorAt();
    goto LABEL_31;
  }
  APSLogErrorAt();
  v8 = 4294960596;
LABEL_31:
  if (*v2)
  {
    HTTPServer_Delete();
    *v2 = 0;
  }
  v10 = v2[1];
  if (v10)
  {
    dispatch_release(v10);
    v2[1] = 0;
  }
  return v8;
}

void _MediaControlClient_PlaybackStarted(uint64_t a1, int a2)
{
  _BYTE *v4;
  uint64_t v5;
  CFNumberRef v6;

  if (gMediaControlForLegacyURLFlinging == 1)
  {
    v4 = (_BYTE *)(a1 + 844932);
    if (!*(_QWORD *)(a1 + 845080))
    {
      if (gLogCategory_MediaControlClientCore <= 40
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = WiFiManagerClientCreate();
      *(_QWORD *)(a1 + 845080) = v5;
      if (!v5
        && gLogCategory_MediaControlClientCore <= 60
        && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    if (!*v4)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, (const void *)(a1 + 64));
        *v4 = 1;
        if (v6)
          CFRelease(v6);
      }
      else
      {
        *v4 = 1;
      }
    }
  }
  if (_MediaControlClient_AddTrafficRegistration(a1, (a2 & 0xFFFFFFFD) == 1)
    && gLogCategory_MediaControlClientCore <= 90
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  _MediaControlClient_PlaybackPaused(a1, 0);
}

intptr_t _MediaControlClientNowPlayingEnsureSetUp(intptr_t result)
{
  _BYTE *v1;

  v1 = (_BYTE *)result;
  if (gMediaControlMetaData && (result = CFDictionaryGetInt64()) != 0)
  {
    if (!v1[844817])
    {
      _MediaControlClient_ControlNowPlaying(2u);
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      v1[844817] = 1;
      if (gLogCategory_MediaControlClientMetaData <= 30
        && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFRetain(v1);
      return MRMediaRemoteGetNowPlayingInfo();
    }
  }
  else if (v1[844817])
  {
    v1[844817] = 0;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
    result = _MediaControlClient_ControlNowPlaying(0);
    if (gLogCategory_MediaControlClientMetaData <= 30)
    {
      if (gLogCategory_MediaControlClientMetaData != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

uint64_t _MediaControlClient_ConnectionInit(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  char __s[128];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 96) + 281745))
    return 0;
  __s[0] = 0;
  SockAddrToString();
  strlen(__s);
  v1 = NetSocketTLS_Configure();
  result = 0;
  if ((_DWORD)v1)
  {
    APSLogErrorAt();
    return v1;
  }
  return result;
}

uint64_t _MediaControlClient_ProcessRequest(uint64_t a1)
{
  uint64_t v2;
  dispatch_semaphore_t *v3;
  CFIndex v4;
  uint64_t v5;
  CFStringRef v6;
  CFStringRef v7;
  const void *TypedValue;
  const char *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  CFIndex v22;
  const UInt8 *v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 96);
  v3 = (dispatch_semaphore_t *)(v2 + 844840);
  v21 = -1;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  if (gLogCategory_MediaControlClientHTTPServer <= 11
    && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v24 = 0;
  v22 = 0;
  v23 = 0;
  v15 = 0;
  v16 = 0;
  if (strnicmpx())
  {
    v24 = -6711;
    if (gLogCategory_MediaControlClientHTTPServer <= 50
      && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = 0;
    TypedValue = 0;
    goto LABEL_42;
  }
  v22 = 0;
  v23 = 0;
  if (!HTTPServer_GetNextURLSegment() || strnicmpx())
  {
    v24 = -6711;
    if (gLogCategory_MediaControlClientHTTPServer > 50
      || gLogCategory_MediaControlClientHTTPServer == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_78;
    }
LABEL_58:
    LogPrintF();
LABEL_78:
    v13 = 0;
    TypedValue = 0;
    goto LABEL_42;
  }
  if (!HTTPServer_GetNextURLSegment() || *(_QWORD *)(a1 + 8528) != *(_QWORD *)(a1 + 8536))
  {
    v24 = -6711;
    if (gLogCategory_MediaControlClientHTTPServer > 50
      || gLogCategory_MediaControlClientHTTPServer == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_78;
    }
    goto LABEL_58;
  }
  if (!*v3)
  {
    v24 = -6745;
    if (gLogCategory_MediaControlClientHTTPServer <= 50
      && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = 0;
    TypedValue = 0;
    goto LABEL_42;
  }
  dispatch_semaphore_wait(*v3, 0xFFFFFFFFFFFFFFFFLL);
  if (!strnicmpx())
  {
    v9 = *(const char **)(v2 + 844848);
    if (!v9)
    {
      v24 = -6745;
      if (gLogCategory_MediaControlClientHTTPServer <= 50
        && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      TypedValue = 0;
      v13 = 1;
      goto LABEL_42;
    }
    TypedValue = CFStringCreateWithCString(0, v9, 0x8000100u);
    if (TypedValue)
      goto LABEL_20;
    goto LABEL_23;
  }
  if (!*(_QWORD *)(v2 + 844856))
    goto LABEL_23;
  v4 = v22;
  v5 = memrchr();
  if (v5)
  {
    v4 = v5 - (_QWORD)v23;
    v22 = v5 - (_QWORD)v23;
  }
  v6 = CFStringCreateWithBytes(0, v23, v4, 0x8000100u, 0);
  if (!v6)
  {
    v24 = -6742;
    if (gLogCategory_MediaControlClientHTTPServer > 50
      || gLogCategory_MediaControlClientHTTPServer == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_41;
    }
LABEL_25:
    LogPrintF();
LABEL_41:
    TypedValue = 0;
    v13 = 1;
    goto LABEL_42;
  }
  v7 = v6;
  CFStringGetTypeID();
  TypedValue = (const void *)CFDictionaryGetTypedValue();
  CFRelease(v7);
  if (!TypedValue)
  {
LABEL_23:
    v24 = -6711;
    if (gLogCategory_MediaControlClientHTTPServer > 50
      || gLogCategory_MediaControlClientHTTPServer == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_41;
    }
    goto LABEL_25;
  }
  CFRetain(TypedValue);
LABEL_20:
  dispatch_semaphore_signal(*v3);
  if (APSHTTPOpenLocalFile())
  {
    if (gLogCategory_MediaControlClientHTTPServer <= 50
      && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_69:
    v13 = 0;
    goto LABEL_42;
  }
  v10 = HTTPGetHeaderField();
  v24 = v10;
  if (v10)
  {
    HTTPServer_InitResponse();
LABEL_28:
    HTTPHeader_SetField();
    HTTPHeader_SetField();
    HTTPHeader_SetField();
    HTTPMakeDateString();
    HTTPHeader_SetField();
    v24 = HTTPHeader_Commit();
    if (!v24)
    {
      LogHTTP();
      if (gLogCategory_MediaControlClientHTTPServer <= 40
        && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      CFAbsoluteTimeGetCurrent();
      v11 = *(unsigned int *)(a1 + 147912);
      v15 = a1 + 139720;
      v16 = v11;
      v12 = (*(uint64_t (**)(_QWORD, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 24) + 48))(*(_QWORD *)(a1 + 24), &v15, 1, 0, 0, v21);
      v13 = 0;
      v24 = v12;
      if (v12 != -6723 && v12 && v12 != 32)
      {
        if (gLogCategory_MediaControlClientHTTPServer <= 60
          && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
        {
          CFAbsoluteTimeGetCurrent();
          LogPrintF();
        }
        v13 = 0;
      }
      goto LABEL_47;
    }
    APSLogErrorAt();
    goto LABEL_69;
  }
  if (!APSHTTPParseByteRangeRequest())
  {
    HTTPServer_InitResponse();
    HTTPHeader_SetField();
    goto LABEL_28;
  }
  if (gLogCategory_MediaControlClientHTTPServer <= 50
    && (gLogCategory_MediaControlClientHTTPServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v13 = 0;
LABEL_42:
  v24 = HTTPServer_SendStatusResponse();
  if (!v24)
  {
    if (!TypedValue)
      goto LABEL_48;
LABEL_47:
    CFRelease(TypedValue);
    goto LABEL_48;
  }
  APSLogErrorAt();
  if (TypedValue)
    goto LABEL_47;
LABEL_48:
  if ((v21 & 0x80000000) == 0)
    close(v21);
  if (v13)
    dispatch_semaphore_signal(*v3);
  return v24;
}

uint64_t MediaControlPlayParamsToStreamType(const __CFDictionary *a1)
{
  const void *Value;
  uint64_t v3;
  const void *v4;

  if (CFDictionaryGetValue(a1, CFSTR("Content-Location")))
  {
    Value = CFDictionaryGetValue(a1, CFSTR("buyParams"));
    goto LABEL_3;
  }
  v4 = CFDictionaryGetValue(a1, CFSTR("path"));
  Value = CFDictionaryGetValue(a1, CFSTR("buyParams"));
  if (!v4)
  {
LABEL_3:
    v3 = 3;
    if (!Value)
    {
      if (CFDictionaryGetValue(a1, CFSTR("PD-Info")))
        return 3;
      else
        return 1;
    }
    return v3;
  }
  if (Value || CFDictionaryGetValue(a1, CFSTR("PD-Info")))
    return 2;
  else
    return 2 * (CFDictionaryGetValue(a1, CFSTR("Play-Info")) != 0);
}

uint64_t MediaControlClient_DoPlayRemote(uint64_t a1, const __CFDictionary *a2)
{
  _BYTE *v4;
  uint64_t v5;
  int v6;
  int v7;
  void **v8;
  uint64_t v9;
  __CFDictionary *MutableCopy;
  __CFDictionary *v11;
  CFDataRef Data;
  const __CFData *v13;
  const char *BytePtr;
  CFIndex Length;
  uint64_t v16;
  const void *Value;
  CFTypeID v18;
  uint64_t v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  CFTypeID v22;
  uint64_t v23;
  uint64_t valuePtr;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (_BYTE *)(a1 + 844934);
  *(_BYTE *)(a1 + 844934) = CFDictionaryGetInt64() != 0;
  v5 = MediaControlClient_EnsureConnected(a1);
  _MediaControlClient_LogVideoStarted(a1, a2);
  if ((_DWORD)v5)
  {
    APSLogErrorAt();
    goto LABEL_29;
  }
  v7 = v6;
  v8 = (void **)(a1 + 279600);
  if (*v4)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
    gMediaControlAudioClient = a1;
    dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  }
  if (APSFeaturesHasFeature())
  {
    v9 = MediaControlClient_EnsureConnected(a1);
    if ((_DWORD)v9)
    {
      v5 = v9;
      APSLogErrorAt();
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a2);
      if (MutableCopy)
      {
        v11 = MutableCopy;
        if (*(_BYTE *)(a1 + 281797))
          CFDictionarySetValue(MutableCopy, CFSTR("videoCacheClear"), (const void *)*MEMORY[0x24BDBD270]);
        dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
        CFDictionarySetDouble();
        dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
        GetDeviceModelString();
        CFDictionarySetCString();
        GetSystemBuildVersionString();
        CFDictionarySetCString();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        LOBYTE(v26) = 0;
        HardwareAddressToCString();
        CFDictionarySetCString();
        Data = CFPropertyListCreateData(0, v11, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          v13 = Data;
          HTTPHeader_InitRequest();
          LOBYTE(v26) = 0;
          MakeFractionalDateString();
          HTTPHeader_SetField();
          HTTPHeader_SetField();
          BytePtr = (const char *)CFDataGetBytePtr(v13);
          Length = CFDataGetLength(v13);
          v5 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, a1 + 416, BytePtr, Length);
          CFRelease(v13);
        }
        else
        {
          APSLogErrorAt();
          v5 = 4294960596;
        }
        CFRelease(v11);
      }
      else
      {
        APSLogErrorAt();
        v5 = 4294960568;
      }
    }
    if (*v8)
    {
      free(*v8);
      *v8 = 0;
    }
    goto LABEL_25;
  }
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  valuePtr = 0;
  DataBuffer_Init();
  v16 = MediaControlClient_EnsureConnected(a1);
  if ((_DWORD)v16)
  {
    v5 = v16;
LABEL_44:
    APSLogErrorAt();
    goto LABEL_22;
  }
  Value = CFDictionaryGetValue(a2, CFSTR("Content-Location"));
  if (!Value)
    goto LABEL_41;
  v18 = CFGetTypeID(Value);
  if (v18 != CFStringGetTypeID())
    goto LABEL_42;
  v19 = DataBuffer_AppendF();
  if ((_DWORD)v19)
  {
    v5 = v19;
    goto LABEL_44;
  }
  v20 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Start-Position"));
  if (!v20)
  {
LABEL_41:
    APSLogErrorAt();
    v5 = 4294960591;
    goto LABEL_22;
  }
  v21 = v20;
  v22 = CFGetTypeID(v20);
  if (v22 != CFNumberGetTypeID())
  {
LABEL_42:
    APSLogErrorAt();
    v5 = 4294960540;
    goto LABEL_22;
  }
  CFNumberGetValue(v21, kCFNumberDoubleType, &valuePtr);
  v23 = DataBuffer_AppendF();
  if ((_DWORD)v23)
  {
    v5 = v23;
    goto LABEL_44;
  }
  HTTPHeader_InitRequest();
  v5 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, a1 + 416, *((const char **)&v27 + 1), v28);
LABEL_22:
  if (*v8)
  {
    free(*v8);
    *v8 = 0;
  }
  DataBuffer_Free();
LABEL_25:
  if (!(_DWORD)v5)
  {
    _MediaControlClient_PlaybackStarted(a1, v7);
    _MediaControlClientNowPlayingEnsureSetUp(a1);
    return v5;
  }
LABEL_29:
  if (gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

void MediaControlClient_DoInsertPlaylistItem(uint64_t a1, const __CFDictionary *a2)
{
  char *v3;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v3 = (char *)sub_218F0B434 + 4 * byte_218F1D0C0[MediaControlPlayParamsToStreamType(a2)];
  __asm { BR              X9 }
}

uint64_t sub_218F0B434()
{
  _QWORD *v0;
  const void *v1;
  const __CFString *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  int v8;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  CFMutableDictionaryRef v15;
  int v16;
  __CFDictionary *Mutable;
  __CFDictionary *v18;
  uint64_t v19;
  char v21;

  v7 = *(_DWORD *)(v5 + 3512);
  if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
  {
    CFDictionaryGetValue(v3, CFSTR("uuid"));
    v8 = *(_DWORD *)(v5 + 3512);
    if (v8 <= 40)
    {
      if (v8 == -1)
      {
        _LogCategory_Initialize();
        v8 = gLogCategory_MediaControlClientCore;
      }
      if (v8 == -1)
        _LogCategory_Initialize();
    }
    LogPrintF();
  }
  ++*(_DWORD *)(v4 + 104);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v3);
  if (!MutableCopy)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  v10 = MutableCopy;
  CFDictionarySetInt64();
  if (!v2)
    goto LABEL_26;
  v21 = 0;
  CFStringGetCString(v2, &v21, 1025, 0x8000100u);
  CFDictionaryRemoveValue(v10, CFSTR("path"));
  if (APSFeaturesHasFeature() && *v6)
    CFDictionarySetValue(v10, CFSTR("tlsPSKEnabled"), (const void *)*MEMORY[0x24BDBD270]);
  v11 = _MediaControlClient_EnsureServerListening((uint64_t)v0);
  if ((_DWORD)v11)
  {
    v19 = v11;
LABEL_42:
    APSLogErrorAt();
    goto LABEL_34;
  }
  SockAddrCopy();
  SockAddrSetPort();
  v12 = SockAddrToString();
  if ((_DWORD)v12)
  {
    v19 = v12;
    goto LABEL_42;
  }
  v13 = CFDictionarySetCString();
  if ((_DWORD)v13)
  {
    v19 = v13;
    goto LABEL_42;
  }
  if (!CFDictionaryGetValue(v10, CFSTR("uuid")))
  {
    APSLogErrorAt();
    v19 = 4294960588;
    goto LABEL_34;
  }
  GetFileExtensionFromString();
  SNPrintF();
  CFDictionarySetCString();
  v14 = *(NSObject **)(v4 + 8);
  if (!v14)
  {
    APSLogErrorAt();
    v19 = 4294960534;
    goto LABEL_34;
  }
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(v4 + 24)
    || (v15 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]),
        (*(_QWORD *)(v4 + 24) = v15) != 0))
  {
    CFDictionarySetCString();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 8));
LABEL_26:
    v16 = *(_DWORD *)(v5 + 3512);
    if (v16 <= 19 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v18 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("item"), v10);
      if (v1)
        CFDictionarySetValue(v18, CFSTR("afterItem"), v1);
      v19 = MediaControlClient_DoAction(v0, CFSTR("playlistInsert"), v18, 0, 0);
      CFRelease(v18);
      goto LABEL_34;
    }
    APSLogErrorAt();
    goto LABEL_38;
  }
  APSLogErrorAt();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 8));
LABEL_38:
  v19 = 4294960568;
LABEL_34:
  CFRelease(v10);
  return v19;
}

uint64_t MediaControlClient_DoAction(_QWORD *a1, const void *a2, const void *a3, _DWORD *a4, _QWORD *a5)
{
  void **v10;
  uint64_t v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  const __CFData *Data;
  const char *BytePtr;
  CFIndex Length;
  uint64_t v17;
  const __CFData *v18;
  const __CFData *v19;
  CFPropertyListRef v20;
  CFTypeID v21;
  const __CFNumber *Value;
  const __CFNumber *v23;
  CFTypeID v24;
  const void *v25;
  const void *v26;

  v10 = (void **)(a1 + 34950);
  v11 = MediaControlClient_EnsureConnected((uint64_t)a1);
  if ((_DWORD)v11)
  {
    v17 = v11;
    APSLogErrorAt();
    goto LABEL_31;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    goto LABEL_34;
  v13 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("type"), a2);
  if (a3)
    CFDictionarySetValue(v13, CFSTR("params"), a3);
  Data = CFPropertyListCreateData(0, v13, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFRelease(v13);
  if (!Data)
  {
    APSLogErrorAt();
    v20 = 0;
    v17 = 4294960596;
    goto LABEL_20;
  }
  HTTPHeader_InitRequest();
  HTTPHeader_SetField();
  BytePtr = (const char *)CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  v17 = _MediaControlClient_DoTransaction(0x32u, a1, (uint64_t)(a1 + 52), BytePtr, Length);
  CFRelease(Data);
  if ((_DWORD)v17)
  {
LABEL_31:
    v20 = 0;
    goto LABEL_20;
  }
  v18 = CFDataCreate(0, (const UInt8 *)v10[1], (CFIndex)v10[2]);
  if (!v18)
  {
LABEL_34:
    APSLogErrorAt();
    v20 = 0;
    v17 = 4294960568;
    goto LABEL_20;
  }
  v19 = v18;
  v20 = CFPropertyListCreateWithData(0, v18, 0, 0, 0);
  CFRelease(v19);
  if (!v20)
  {
    APSLogErrorAt();
    v17 = 4294960579;
    goto LABEL_20;
  }
  v21 = CFGetTypeID(v20);
  if (v21 != CFDictionaryGetTypeID())
    goto LABEL_36;
  if (!a4)
    goto LABEL_14;
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v20, CFSTR("errorCode"));
  if (!Value)
  {
    *a4 = 0;
    if (a5)
      goto LABEL_15;
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  v23 = Value;
  v24 = CFGetTypeID(Value);
  if (v24 != CFNumberGetTypeID())
  {
LABEL_36:
    APSLogErrorAt();
    v17 = 4294960540;
    goto LABEL_20;
  }
  CFNumberGetValue(v23, kCFNumberSInt32Type, a4);
LABEL_14:
  if (!a5)
    goto LABEL_19;
LABEL_15:
  v25 = CFDictionaryGetValue((CFDictionaryRef)v20, CFSTR("params"));
  v26 = v25;
  if (v25)
    CFRetain(v25);
  v17 = 0;
  *a5 = v26;
LABEL_20:
  if (*v10)
  {
    free(*v10);
    *v10 = 0;
  }
  if (v20)
    CFRelease(v20);
  if ((_DWORD)v17
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v17;
}

uint64_t MediaControlClient_DoRemovePlaylistItem(_QWORD *a1, CFDictionaryRef theDict)
{
  const void *Value;
  dispatch_semaphore_t *v5;
  NSObject *v6;
  __CFDictionary *v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  uint64_t v10;

  Value = CFDictionaryGetValue(theDict, CFSTR("uuid"));
  if (gLogCategory_MediaControlClientCore <= 50
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Value)
  {
    v5 = (dispatch_semaphore_t *)(a1 + 105605);
    v6 = a1[105605];
    if (v6)
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = (__CFDictionary *)a1[105607];
    if (v7)
      CFDictionaryRemoveValue(v7, Value);
    if (*v5)
      dispatch_semaphore_signal(*v5);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v9 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("item"), theDict);
      v10 = MediaControlClient_DoAction(a1, CFSTR("playlistRemove"), v9, 0, 0);
      CFRelease(v9);
      return v10;
    }
    else
    {
      APSLogErrorAt();
      return 4294960568;
    }
  }
  else
  {
    APSLogErrorAt();
    return 4294960588;
  }
}

uint64_t MediaControlClient_DoStop(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (gLogCategory_MediaControlClientCore <= 50
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  _MediaControlClientNowPlayingEnsureTornDown(a1);
  _MediaControlClient_LogPhotoEnded(a1);
  _MediaControlClient_LogSlideshowEnded(a1);
  _MediaControlClient_LogVideoEnded(a1);
  if (*(_BYTE *)(a1 + 424))
  {
    HTTPHeader_InitRequest();
    v2 = _MediaControlClient_DoTransaction(0x32u, (_QWORD *)a1, a1 + 416, 0, 0);
  }
  else
  {
    v2 = 0;
  }
  v3 = *(void **)(a1 + 279600);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 279600) = 0;
  }
  _MediaControlClient_EnsureMirroringResumed(a1);
  _MediaControlClient_PlaybackStopped(a1);
  if ((_DWORD)v2 != -6723
    && (_DWORD)v2
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v2;
}

uint64_t MediaControlClient_CopyPlaybackInfo(uint64_t a1, __CFDictionary **a2)
{
  uint64_t v4;
  unsigned int v5;
  __CFDictionary *Mutable;
  const __CFData *v7;
  const __CFData *v8;
  CFTypeID v9;
  const void *Value;
  CFTypeID v11;
  int Int64;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  int v27;
  uint64_t v28;
  timeval valuePtr;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;

  v4 = a1 + 279600;
  v32 = MediaControlClient_EnsureConnected(a1);
  if (v32)
  {
    APSLogErrorAt();
    goto LABEL_42;
  }
  if (!*(_DWORD *)(a1 + 844928))
    goto LABEL_36;
  HTTPHeader_InitRequest();
  v5 = _MediaControlClient_DoTransaction(0xAu, (_QWORD *)a1, a1 + 416, 0, 0);
  v32 = v5;
  if (v5 == 200404)
  {
    *(_DWORD *)(a1 + 844928) = 0;
LABEL_36:
    LODWORD(valuePtr.tv_sec) = 0;
    LODWORD(v28) = 0;
    v32 = MediaControlClient_DoScrubGet((_QWORD *)a1, (uint64_t)&valuePtr, (uint64_t)&v28);
    if (v32)
    {
LABEL_42:
      Mutable = 0;
      goto LABEL_43;
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v22 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
      if (v22)
      {
        v23 = v22;
        CFDictionarySetValue(Mutable, CFSTR("position"), v22);
        CFRelease(v23);
        v24 = CFNumberCreate(0, kCFNumberFloatType, &v28);
        if (v24)
        {
          v25 = v24;
          CFDictionarySetValue(Mutable, CFSTR("duration"), v24);
          CFRelease(v25);
LABEL_41:
          *a2 = Mutable;
          v32 = 0;
          goto LABEL_42;
        }
      }
    }
    APSLogErrorAt();
    goto LABEL_50;
  }
  Mutable = 0;
  if (v5)
    goto LABEL_43;
  v7 = CFDataCreate(0, *(const UInt8 **)(v4 + 8), *(_QWORD *)(v4 + 16));
  if (!v7)
  {
    APSLogErrorAt();
    Mutable = 0;
LABEL_50:
    v27 = -6728;
    goto LABEL_51;
  }
  v8 = v7;
  Mutable = (__CFDictionary *)CFPropertyListCreateWithData(0, v7, 1uLL, 0, 0);
  CFRelease(v8);
  if (Mutable)
  {
    v9 = CFGetTypeID(Mutable);
    if (v9 == CFDictionaryGetTypeID())
    {
      Value = CFDictionaryGetValue(Mutable, CFSTR("estimatedDate"));
      if (!Value)
      {
LABEL_11:
        Int64 = CFDictionaryGetInt64();
        if (!v32)
          *(_DWORD *)(a1 + 844784) = Int64;
        v13 = CFDictionaryGetInt64();
        if (!v32)
          *(_DWORD *)(a1 + 844788) = v13;
        CFDictionaryGetDouble();
        if (!v32 && v14 > 0.0)
          *(double *)(a1 + 844792) = v14;
        CFDictionaryGetDouble();
        if (!v32 && v15 > 0.0)
          *(double *)(a1 + 844800) = v15;
        CFDictionaryGetDouble();
        if (!v32 && v16 > 0.0)
          *(double *)(a1 + 844808) = v16;
        CFDictionaryGetTypeID();
        if (CFDictionaryGetTypedValue())
        {
          CFDictionaryGetDouble();
          if (!v32)
            *(_DWORD *)(a1 + 845048) = (v17 * 1000.0);
          CFDictionaryGetDouble();
          if (!v32)
            *(_DWORD *)(a1 + 845060) = (v18 * 1000.0);
          CFDictionaryGetDouble();
          if (!v32)
            *(_DWORD *)(a1 + 845056) = (v19 * 1000.0);
          CFDictionaryGetDouble();
          if (!v32)
            *(_DWORD *)(a1 + 845052) = (v20 * 1000.0);
          CFDictionaryGetDouble();
          if (!v32)
            *(_DWORD *)(a1 + 845064) = (v21 * 1000.0);
        }
        goto LABEL_41;
      }
      v11 = CFGetTypeID(Value);
      if (v11 == CFDateGetTypeID())
      {
        v30 = 0;
        v31 = 0;
        HTTPGetHeaderField();
        goto LABEL_11;
      }
    }
    APSLogErrorAt();
    v27 = -6756;
  }
  else
  {
    APSLogErrorAt();
    v27 = -6717;
  }
LABEL_51:
  v32 = v27;
LABEL_43:
  if (*(_QWORD *)v4)
  {
    free(*(void **)v4);
    *(_QWORD *)v4 = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
  return v32;
}

uint64_t MediaControlClient_DoScrubGet(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void **v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void **)(a1 + 34950);
  v7 = MediaControlClient_EnsureConnected((uint64_t)a1);
  if ((_DWORD)v7)
  {
    v11 = v7;
    APSLogErrorAt();
  }
  else
  {
    HTTPHeader_InitRequest();
    v8 = _MediaControlClient_DoTransaction(0xAu, a1, (uint64_t)(a1 + 52), 0, 0);
    if ((_DWORD)v8)
    {
      v11 = v8;
    }
    else
    {
      v9 = 0;
      v10 = 0;
      while (ParseLine())
      {
        __memcpy_chk();
        v13[0] = 0;
        if (sscanf(v13, "duration: %f", a3) == 1)
        {
          v9 = 1;
        }
        else if (sscanf(v13, "position: %f", a2) == 1)
        {
          v10 = 1;
        }
      }
      if (v10 == 0 || (v9 & 1) == 0)
      {
        v11 = 4294960569;
      }
      else
      {
        if (gLogCategory_MediaControlClientCore <= 10
          && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v11 = 0;
      }
    }
  }
  if (*v6)
  {
    free(*v6);
    *v6 = 0;
  }
  return v11;
}

uint64_t MediaControlClient_DoScrubSet(uint64_t a1, const __CFData *a2, float a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  const __CFData *Data;
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char __str[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a1 + 279600;
  v7 = gLogCategory_MediaControlClientCore;
  if (gLogCategory_MediaControlClientCore <= 50)
  {
    if (gLogCategory_MediaControlClientCore == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      v7 = gLogCategory_MediaControlClientCore;
    }
    if (v7 == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
LABEL_9:
  v8 = MediaControlClient_EnsureConnected(a1);
  if ((_DWORD)v8)
  {
    v16 = v8;
    APSLogErrorAt();
    a2 = 0;
    goto LABEL_20;
  }
  if (!a2)
    goto LABEL_15;
  if (*(_DWORD *)(v6 + 2176) < 0x1B90A4u)
  {
    a2 = 0;
LABEL_15:
    BytePtr = 0;
    Length = 0;
    goto LABEL_16;
  }
  Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  a2 = Data;
  if (!Data)
  {
    APSLogErrorAt();
    v16 = 4294960596;
    goto LABEL_20;
  }
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(a2);
LABEL_16:
  snprintf(__str, 0x80uLL, "/scrub?position=%f", a3);
  HTTPHeader_InitRequest();
  HTTPHeader_SetField();
  if (Length)
  {
    HTTPHeader_SetField();
    v12 = (_QWORD *)a1;
    v13 = a1 + 416;
    v14 = (const char *)BytePtr;
    v15 = Length;
  }
  else
  {
    v12 = (_QWORD *)a1;
    v13 = a1 + 416;
    v14 = (const char *)BytePtr;
    v15 = 0;
  }
  v16 = _MediaControlClient_DoTransaction(0x32u, v12, v13, v14, v15);
LABEL_20:
  if (*(_QWORD *)v6)
  {
    free(*(void **)v6);
    *(_QWORD *)v6 = 0;
  }
  if (a2)
    CFRelease(a2);
  if ((_DWORD)v16
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v16;
}

uint64_t MediaControlClient_DoRate(_QWORD *a1, float a2)
{
  uint64_t v4;
  uint64_t v5;
  char __str[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_MediaControlClientCore <= 50
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = MediaControlClient_EnsureConnected((uint64_t)a1);
  if ((_DWORD)v4)
  {
    v5 = v4;
    APSLogErrorAt();
  }
  else
  {
    snprintf(__str, 0x80uLL, "/rate?value=%f", a2);
    HTTPHeader_InitRequest();
    v5 = _MediaControlClient_DoTransaction(0x32u, a1, (uint64_t)(a1 + 52), 0, 0);
    if (!(_DWORD)v5)
    {
      _MediaControlClient_PlaybackPaused((uint64_t)a1, a2 == 0.0);
      return v5;
    }
  }
  if (gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

intptr_t _MediaControlClient_EnsureMirroringSuspended(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  intptr_t result;

  if (gAirPlayRouteLock)
    dispatch_semaphore_wait((dispatch_semaphore_t)gAirPlayRouteLock, 0xFFFFFFFFFFFFFFFFLL);
  v2 = (_BYTE *)(a1 + 563232);
  if (!*(_BYTE *)(a1 + 563232))
  {
    v3 = (void *)objc_msgSend((id)((uint64_t (*)(void))getAVSystemControllerClass)(), "sharedAVSystemController");
    v4 = (void *)objc_msgSend(v3, "attributeForKey:", getAVSystemController_PickedRouteAttribute());
    v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", getAVSystemController_RouteDescriptionKey_RouteSupportsAirPlayScreen()), "BOOLValue");
    if ((_DWORD)v5)
    {
      if (!gAirPlayMirroringSuspendCount++)
      {
        if (gLogCategory_MediaControlClientCore <= 50)
        {
          if (gLogCategory_MediaControlClientCore != -1 || (v5 = _LogCategory_Initialize(), (_DWORD)v5))
            v5 = LogPrintF();
        }
        v7 = (void *)objc_msgSend((id)getAVSystemControllerClass(v5), "sharedAVSystemController");
        v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        objc_msgSend(v7, "setAttribute:forKey:error:", v8, getAVSystemController_AirPlayScreenSuspended(), 0);
      }
      *v2 = 1;
    }
  }
  result = gAirPlayRouteLock;
  if (gAirPlayRouteLock)
    return dispatch_semaphore_signal((dispatch_semaphore_t)gAirPlayRouteLock);
  return result;
}

uint64_t MediaControlClient_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, int *a4)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;

  v6 = a1 + 279600;
  v7 = MediaControlClient_EnsureConnected(a1);
  if (v7)
  {
    v9 = v7;
    APSLogErrorAt();
    v8 = 0;
  }
  else if (CFEqual(a2, CFSTR("serverInfo")))
  {
    v8 = *(_QWORD *)(v6 + 2160);
    if (v8)
      CFRetain(*(CFTypeRef *)(v6 + 2160));
    v9 = 0;
  }
  else
  {
    ASPrintF();
    APSLogErrorAt();
    v8 = 0;
    v9 = -6728;
  }
  if (*(_QWORD *)v6)
  {
    free(*(void **)v6);
    *(_QWORD *)v6 = 0;
  }
  if (a4)
    *a4 = v9;
  if (v9 != -6727
    && v9
    && gLogCategory_MediaControlClientCore <= 60
    && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v8;
}

uint64_t MediaControlClient_SetEventHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 563216) = a2;
  *(_QWORD *)(result + 563224) = a3;
  return result;
}

uint64_t MediaControlClient_IsConnected(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 424);
}

BOOL MediaControlClient_IsConnectedOnP2PInterface(uint64_t a1)
{
  return *(_BYTE *)(a1 + 424) && *(_BYTE *)(a1 + 279633) != 0;
}

uint64_t APSConnectionInterfaceManagerReleaseInterfaceSelection()
{
  return MEMORY[0x24BE03270]();
}

uint64_t APSConnectionInterfaceManagerSelectInterface()
{
  return MEMORY[0x24BE03278]();
}

uint64_t APSFeaturesCreateFromLegacyFlags()
{
  return MEMORY[0x24BE03330]();
}

uint64_t APSFeaturesHasFeature()
{
  return MEMORY[0x24BE03358]();
}

uint64_t APSGetDeviceID()
{
  return MEMORY[0x24BE03390]();
}

uint64_t APSGetDeviceNameCString()
{
  return MEMORY[0x24BE03398]();
}

uint64_t APSHTTPOpenLocalFile()
{
  return MEMORY[0x24BE033C8]();
}

uint64_t APSHTTPParseByteRangeRequest()
{
  return MEMORY[0x24BE033D0]();
}

uint64_t APSLogErrorAt()
{
  return MEMORY[0x24BE03468]();
}

uint64_t APSSettingsGetCString()
{
  return MEMORY[0x24BE03638]();
}

uint64_t APSSettingsGetInt64()
{
  return MEMORY[0x24BE03640]();
}

uint64_t APSSettingsSetCString()
{
  return MEMORY[0x24BE03678]();
}

uint64_t APSSettingsSynchronize()
{
  return MEMORY[0x24BE03690]();
}

uint64_t APSVersionUtilsGetShortVersionLength()
{
  return MEMORY[0x24BE036E0]();
}

uint64_t APTransportDeviceGetAddress()
{
  return MEMORY[0x24BDFD5B8]();
}

uint64_t APTransportGetSharedTransport()
{
  return MEMORY[0x24BDFD5C0]();
}

uint64_t APTransportTrafficRegistrarAWDLTrafficRegistrationCreate()
{
  return MEMORY[0x24BDFD5C8]();
}

uint64_t APTransportTrafficRegistrarInfraTransactionCreate()
{
  return MEMORY[0x24BDFD5F0]();
}

uint64_t ASPrintF()
{
  return MEMORY[0x24BE28DF0]();
}

uint64_t AsyncConnection_ConnectSyncEx()
{
  return MEMORY[0x24BE28DF8]();
}

uint64_t Base64DecodeCopy()
{
  return MEMORY[0x24BE28E08]();
}

uint64_t Base64EncodeCopyEx()
{
  return MEMORY[0x24BE28E10]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

uint64_t CFDictionaryGetCString()
{
  return MEMORY[0x24BE28F60]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return MEMORY[0x24BE28F80]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

uint64_t CFDictionarySetCString()
{
  return MEMORY[0x24BE28FA8]();
}

uint64_t CFDictionarySetDouble()
{
  return MEMORY[0x24BE28FB8]();
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x24BE28FC0]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

uint64_t CFGetDouble()
{
  return MEMORY[0x24BE28FD8]();
}

uint64_t CFGetInt64()
{
  return MEMORY[0x24BE28FE0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

uint64_t CFNumberCreateInt64()
{
  return MEMORY[0x24BE28FF8]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

uint64_t CFPropertyListCreateFormatted()
{
  return MEMORY[0x24BE290C0]();
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t DataBuffer_AppendF()
{
  return MEMORY[0x24BE29308]();
}

uint64_t DataBuffer_Free()
{
  return MEMORY[0x24BE29330]();
}

uint64_t DataBuffer_Init()
{
  return MEMORY[0x24BE29338]();
}

uint64_t Dk7hjUuq()
{
  return MEMORY[0x24BE03790]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x24BDC0968]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x24BDC0970]();
}

uint64_t FigTransportGetCMBaseObject()
{
  return MEMORY[0x24BDC0A90]();
}

uint64_t GetDeviceModelString()
{
  return MEMORY[0x24BE293B8]();
}

uint64_t GetFairPlayHWInfo()
{
  return MEMORY[0x24BE293D0]();
}

uint64_t GetFileExtensionFromString()
{
  return MEMORY[0x24BE293D8]();
}

uint64_t GetLocalHostName()
{
  return MEMORY[0x24BE293E0]();
}

uint64_t GetPeerMACAddress()
{
  return MEMORY[0x24BE293E8]();
}

uint64_t GetSystemBuildVersionString()
{
  return MEMORY[0x24BE293F8]();
}

uint64_t GvMGlTNs()
{
  return MEMORY[0x24BE03798]();
}

uint64_t HTTPClientAuthorization_Apply()
{
  return MEMORY[0x24BE29400]();
}

uint64_t HTTPClientAuthorization_Free()
{
  return MEMORY[0x24BE29408]();
}

uint64_t HTTPClientAuthorization_Init()
{
  return MEMORY[0x24BE29410]();
}

uint64_t HTTPGetHeaderField()
{
  return MEMORY[0x24BE294B0]();
}

uint64_t HTTPHeader_Commit()
{
  return MEMORY[0x24BE294B8]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x24BE294C0]();
}

uint64_t HTTPHeader_InitResponse()
{
  return MEMORY[0x24BE294D0]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x24BE294E0]();
}

uint64_t HTTPMakeDateString()
{
  return MEMORY[0x24BE294E8]();
}

uint64_t HTTPServer_Create()
{
  return MEMORY[0x24BE29558]();
}

uint64_t HTTPServer_Delete()
{
  return MEMORY[0x24BE29560]();
}

uint64_t HTTPServer_GetNextURLSegment()
{
  return MEMORY[0x24BE29568]();
}

uint64_t HTTPServer_InitResponse()
{
  return MEMORY[0x24BE29570]();
}

uint64_t HTTPServer_SendStatusResponse()
{
  return MEMORY[0x24BE29578]();
}

uint64_t HTTPServer_Start()
{
  return MEMORY[0x24BE29580]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x24BE29598]();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8718](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

uint64_t LogControl()
{
  return MEMORY[0x24BE295D8]();
}

uint64_t LogControlCF()
{
  return MEMORY[0x24BE295E0]();
}

uint64_t LogHTTP()
{
  return MEMORY[0x24BE295E8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t LogSetAppID()
{
  return MEMORY[0x24BE29600]();
}

uint64_t LogShow()
{
  return MEMORY[0x24BE29608]();
}

uint64_t MRMediaRemoteGetNowPlayingInfo()
{
  return MEMORY[0x24BE65190]();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return MEMORY[0x24BE651F8]();
}

uint64_t MRMediaRemoteSendCommand()
{
  return MEMORY[0x24BE65220]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x24BE65280]();
}

uint64_t MakeFractionalDateString()
{
  return MEMORY[0x24BE29638]();
}

uint64_t NetSocketGCM_Configure()
{
  return MEMORY[0x24BE29708]();
}

uint64_t NetSocketTLS_Configure()
{
  return MEMORY[0x24BE29710]();
}

uint64_t NetSocket_Cancel()
{
  return MEMORY[0x24BE29718]();
}

uint64_t NetSocket_Create()
{
  return MEMORY[0x24BE29720]();
}

uint64_t NetSocket_Delete()
{
  return MEMORY[0x24BE29730]();
}

uint64_t NetSocket_GetNative()
{
  return MEMORY[0x24BE29740]();
}

uint64_t NetSocket_HTTPReadHeader()
{
  return MEMORY[0x24BE29748]();
}

uint64_t PCFdAVst()
{
  return MEMORY[0x24BE037A8]();
}

uint64_t ParseFractionalDateString()
{
  return MEMORY[0x24BE29900]();
}

uint64_t ParseLine()
{
  return MEMORY[0x24BE29908]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

uint64_t ReplaceDifferentString()
{
  return MEMORY[0x24BE29928]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x24BE29958]();
}

uint64_t SNScanF()
{
  return MEMORY[0x24BE29960]();
}

uint64_t SockAddrCopy()
{
  return MEMORY[0x24BE299A0]();
}

uint64_t SockAddrSetPort()
{
  return MEMORY[0x24BE299B8]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x24BE299C8]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x24BE299D8]();
}

uint64_t SrtySZG0()
{
  return MEMORY[0x24BE037B8]();
}

uint64_t StringToUUID()
{
  return MEMORY[0x24BE29A30]();
}

uint64_t TMIsAutomaticTimeEnabled()
{
  return MEMORY[0x24BE289A0]();
}

uint64_t TextToSourceVersion()
{
  return MEMORY[0x24BE29AB0]();
}

uint64_t UUIDGet()
{
  return MEMORY[0x24BE29AD0]();
}

uint64_t VBAEFt()
{
  return MEMORY[0x24BE037C0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t XoN3GgjZNCvkN1T8I3()
{
  return MEMORY[0x24BE037C8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t aMoe8v8GNE9T()
{
  return MEMORY[0x24BE037D0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x24BDADF48](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFA8](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t gQblcfSzZBQsYCCV()
{
  return MEMORY[0x24BE037D8]();
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t h4BvW7X()
{
  return MEMORY[0x24BE037E0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t memrchr()
{
  return MEMORY[0x24BE29BD8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

uint64_t rJPl3sdBfc0E3yB()
{
  return MEMORY[0x24BE03940]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strnicmpx()
{
  return MEMORY[0x24BE29C20]();
}

uint64_t xOvZekdnwD6()
{
  return MEMORY[0x24BE03948]();
}


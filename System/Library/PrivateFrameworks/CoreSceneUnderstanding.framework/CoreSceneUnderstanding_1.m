char *sub_23A08033C(uint64_t a1, char *a2, uint64_t *a3)
{
  int v6;
  int i;
  uint64_t v8;
  int64_t v9;
  const void *v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  int j;
  uint64_t v22;
  int64_t v23;
  const void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  int v64;
  char v65;
  char v66;
  char v67;
  int v68;
  char v69;
  char v70;
  char v71;
  int v72;
  int k;
  uint64_t v74;
  int64_t v75;
  const void *v76;
  int v77;
  int m;
  uint64_t v79;
  int64_t v80;
  const void *v81;
  int v82;
  char v83;
  char v84;
  int v85;
  char v86;
  char v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  int v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  int v105;
  char *v106;
  char *v107;
  uint64_t v108;
  char v110;
  char v111;
  int v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;

  v6 = *(_DWORD *)(a1 + 64);
  if (v6 >= 1)
  {
    for (i = 0; v6 != i; ++i)
    {
      v8 = sub_23A086C18(a1 + 56, i);
      if (*(char *)(v8 + 23) < 0)
      {
        v9 = *(_QWORD *)(v8 + 8);
        if (v9 > 127)
          goto LABEL_13;
      }
      else
      {
        v9 = *(unsigned __int8 *)(v8 + 23);
      }
      if (*a3 - (uint64_t)a2 + 14 >= v9)
      {
        *a2 = 10;
        a2[1] = v9;
        if (*(char *)(v8 + 23) >= 0)
          v10 = (const void *)v8;
        else
          v10 = *(const void **)v8;
        memcpy(a2 + 2, v10, v9);
        a2 += v9 + 2;
        continue;
      }
LABEL_13:
      a2 = sub_23A08B874(a3, 1, v8, a2);
    }
  }
  v11 = *(_DWORD *)(a1 + 40);
  if ((v11 & 1) != 0)
  {
    a2 = sub_23A07BF08((unint64_t *)a3, 2, *(_QWORD *)(a1 + 152) & 0xFFFFFFFFFFFFFFFELL, a2);
    if ((v11 & 0x800000) == 0)
    {
LABEL_16:
      if ((v11 & 0x1000000) == 0)
        goto LABEL_38;
      goto LABEL_17;
    }
  }
  else if ((v11 & 0x800000) == 0)
  {
    goto LABEL_16;
  }
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v13 = *(int *)(a1 + 272);
  *a2 = 24;
  if (v13 > 0x7F)
  {
    a2[1] = v13 | 0x80;
    v15 = v13 >> 7;
    if (v13 >> 14)
    {
      a2 += 3;
      do
      {
        *(a2 - 1) = v15 | 0x80;
        v18 = v15 >> 7;
        ++a2;
        v19 = v15 >> 14;
        v15 >>= 7;
      }
      while (v19);
      *(a2 - 1) = v18;
      if ((v11 & 0x1000000) == 0)
        goto LABEL_38;
    }
    else
    {
      a2[2] = v15;
      a2 += 3;
      if ((v11 & 0x1000000) == 0)
        goto LABEL_38;
    }
  }
  else
  {
    a2[1] = v13;
    a2 += 2;
    if ((v11 & 0x1000000) == 0)
      goto LABEL_38;
  }
LABEL_17:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v12 = *(int *)(a1 + 276);
  *a2 = 32;
  if (v12 > 0x7F)
  {
    a2[1] = v12 | 0x80;
    v14 = v12 >> 7;
    if (v12 >> 14)
    {
      a2 += 3;
      do
      {
        *(a2 - 1) = v14 | 0x80;
        v16 = v14 >> 7;
        ++a2;
        v17 = v14 >> 14;
        v14 >>= 7;
      }
      while (v17);
      *(a2 - 1) = v16;
    }
    else
    {
      a2[2] = v14;
      a2 += 3;
    }
  }
  else
  {
    a2[1] = v12;
    a2 += 2;
  }
LABEL_38:
  v20 = *(_DWORD *)(a1 + 88);
  if (v20 >= 1)
  {
    for (j = 0; v20 != j; ++j)
    {
      v22 = sub_23A086C18(a1 + 80, j);
      if (*(char *)(v22 + 23) < 0)
      {
        v23 = *(_QWORD *)(v22 + 8);
        if (v23 > 127)
          goto LABEL_50;
      }
      else
      {
        v23 = *(unsigned __int8 *)(v22 + 23);
      }
      if (*a3 - (uint64_t)a2 + 14 >= v23)
      {
        *a2 = 42;
        a2[1] = v23;
        if (*(char *)(v22 + 23) >= 0)
          v24 = (const void *)v22;
        else
          v24 = *(const void **)v22;
        memcpy(a2 + 2, v24, v23);
        a2 += v23 + 2;
        continue;
      }
LABEL_50:
      a2 = sub_23A08B874(a3, 5, v22, a2);
    }
  }
  if ((v11 & 0x200) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v26 = *(int *)(a1 + 224);
    *a2 = 48;
    if (v26 > 0x7F)
    {
      a2[1] = v26 | 0x80;
      v28 = v26 >> 7;
      if (v26 >> 14)
      {
        a2 += 3;
        do
        {
          *(a2 - 1) = v28 | 0x80;
          v31 = v28 >> 7;
          ++a2;
          v32 = v28 >> 14;
          v28 >>= 7;
        }
        while (v32);
        *(a2 - 1) = v31;
        if ((v11 & 2) != 0)
          goto LABEL_82;
      }
      else
      {
        a2[2] = v28;
        a2 += 3;
        if ((v11 & 2) != 0)
          goto LABEL_82;
      }
    }
    else
    {
      a2[1] = v26;
      a2 += 2;
      if ((v11 & 2) != 0)
        goto LABEL_82;
    }
LABEL_53:
    if ((v11 & 0x2000000) == 0)
      goto LABEL_54;
    goto LABEL_83;
  }
  if ((v11 & 2) == 0)
    goto LABEL_53;
LABEL_82:
  a2 = sub_23A07BF08((unint64_t *)a3, 7, *(_QWORD *)(a1 + 160) & 0xFFFFFFFFFFFFFFFELL, a2);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_54:
    if ((v11 & 0x800) == 0)
      goto LABEL_55;
    goto LABEL_86;
  }
LABEL_83:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v33 = *(_DWORD *)(a1 + 280);
  *a2 = 85;
  *(_DWORD *)(a2 + 1) = v33;
  a2 += 5;
  if ((v11 & 0x800) == 0)
  {
LABEL_55:
    if ((v11 & 0x400) == 0)
      goto LABEL_56;
LABEL_97:
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v38 = *(int *)(a1 + 228);
    *a2 = 96;
    if (v38 > 0x7F)
    {
      a2[1] = v38 | 0x80;
      v39 = v38 >> 7;
      if (v38 >> 14)
      {
        a2 += 3;
        do
        {
          *(a2 - 1) = v39 | 0x80;
          v40 = v39 >> 7;
          ++a2;
          v41 = v39 >> 14;
          v39 >>= 7;
        }
        while (v41);
        *(a2 - 1) = v40;
        if ((v11 & 0x1000) != 0)
          goto LABEL_108;
      }
      else
      {
        a2[2] = v39;
        a2 += 3;
        if ((v11 & 0x1000) != 0)
          goto LABEL_108;
      }
    }
    else
    {
      a2[1] = v38;
      a2 += 2;
      if ((v11 & 0x1000) != 0)
        goto LABEL_108;
    }
LABEL_57:
    if ((v11 & 0x4000000) == 0)
      goto LABEL_58;
LABEL_119:
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v46 = *(int *)(a1 + 284);
    *a2 = 112;
    if (v46 > 0x7F)
    {
      a2[1] = v46 | 0x80;
      v47 = v46 >> 7;
      if (v46 >> 14)
      {
        a2 += 3;
        do
        {
          *(a2 - 1) = v47 | 0x80;
          v48 = v47 >> 7;
          ++a2;
          v49 = v47 >> 14;
          v47 >>= 7;
        }
        while (v49);
        *(a2 - 1) = v48;
        if ((v11 & 0x8000000) != 0)
          goto LABEL_130;
      }
      else
      {
        a2[2] = v47;
        a2 += 3;
        if ((v11 & 0x8000000) != 0)
          goto LABEL_130;
      }
    }
    else
    {
      a2[1] = v46;
      a2 += 2;
      if ((v11 & 0x8000000) != 0)
        goto LABEL_130;
    }
LABEL_59:
    if ((v11 & 0x10000000) == 0)
      goto LABEL_60;
LABEL_133:
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v51 = *(int *)(a1 + 292);
    *(_WORD *)a2 = 384;
    if (v51 > 0x7F)
    {
      a2[2] = v51 | 0x80;
      v52 = v51 >> 7;
      if (v51 >> 14)
      {
        a2 += 4;
        do
        {
          *(a2 - 1) = v52 | 0x80;
          v53 = v52 >> 7;
          ++a2;
          v54 = v52 >> 14;
          v52 >>= 7;
        }
        while (v54);
        *(a2 - 1) = v53;
        if ((v11 & 0x20000000) != 0)
          goto LABEL_144;
      }
      else
      {
        a2[3] = v52;
        a2 += 4;
        if ((v11 & 0x20000000) != 0)
          goto LABEL_144;
      }
    }
    else
    {
      a2[2] = v51;
      a2 += 3;
      if ((v11 & 0x20000000) != 0)
        goto LABEL_144;
    }
LABEL_61:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_155;
    goto LABEL_62;
  }
LABEL_86:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v34 = *(_QWORD *)(a1 + 232);
  *a2 = 88;
  if (v34 > 0x7F)
  {
    a2[1] = v34 | 0x80;
    v35 = v34 >> 7;
    if (v34 >> 14)
    {
      a2 += 3;
      do
      {
        *(a2 - 1) = v35 | 0x80;
        v36 = v35 >> 7;
        ++a2;
        v37 = v35 >> 14;
        v35 >>= 7;
      }
      while (v37);
      *(a2 - 1) = v36;
      if ((v11 & 0x400) != 0)
        goto LABEL_97;
    }
    else
    {
      a2[2] = v35;
      a2 += 3;
      if ((v11 & 0x400) != 0)
        goto LABEL_97;
    }
  }
  else
  {
    a2[1] = v34;
    a2 += 2;
    if ((v11 & 0x400) != 0)
      goto LABEL_97;
  }
LABEL_56:
  if ((v11 & 0x1000) == 0)
    goto LABEL_57;
LABEL_108:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v42 = *(int *)(a1 + 240);
  *a2 = 104;
  if (v42 > 0x7F)
  {
    a2[1] = v42 | 0x80;
    v43 = v42 >> 7;
    if (v42 >> 14)
    {
      a2 += 3;
      do
      {
        *(a2 - 1) = v43 | 0x80;
        v44 = v43 >> 7;
        ++a2;
        v45 = v43 >> 14;
        v43 >>= 7;
      }
      while (v45);
      *(a2 - 1) = v44;
      if ((v11 & 0x4000000) != 0)
        goto LABEL_119;
    }
    else
    {
      a2[2] = v43;
      a2 += 3;
      if ((v11 & 0x4000000) != 0)
        goto LABEL_119;
    }
  }
  else
  {
    a2[1] = v42;
    a2 += 2;
    if ((v11 & 0x4000000) != 0)
      goto LABEL_119;
  }
LABEL_58:
  if ((v11 & 0x8000000) == 0)
    goto LABEL_59;
LABEL_130:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v50 = *(_DWORD *)(a1 + 288);
  *a2 = 125;
  *(_DWORD *)(a2 + 1) = v50;
  a2 += 5;
  if ((v11 & 0x10000000) != 0)
    goto LABEL_133;
LABEL_60:
  if ((v11 & 0x20000000) == 0)
    goto LABEL_61;
LABEL_144:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v55 = *(int *)(a1 + 296);
  *(_WORD *)a2 = 392;
  if (v55 > 0x7F)
  {
    a2[2] = v55 | 0x80;
    v56 = v55 >> 7;
    if (v55 >> 14)
    {
      a2 += 4;
      do
      {
        *(a2 - 1) = v56 | 0x80;
        v57 = v56 >> 7;
        ++a2;
        v58 = v56 >> 14;
        v56 >>= 7;
      }
      while (v58);
      *(a2 - 1) = v57;
      if ((v11 & 0x40000000) == 0)
        goto LABEL_155;
    }
    else
    {
      a2[3] = v56;
      a2 += 4;
      if ((v11 & 0x40000000) == 0)
        goto LABEL_155;
    }
  }
  else
  {
    a2[2] = v55;
    a2 += 3;
    if ((v11 & 0x40000000) == 0)
      goto LABEL_155;
  }
LABEL_62:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v25 = *(int *)(a1 + 300);
  *(_WORD *)a2 = 400;
  if (v25 > 0x7F)
  {
    a2[2] = v25 | 0x80;
    v27 = v25 >> 7;
    if (v25 >> 14)
    {
      a2 += 4;
      do
      {
        *(a2 - 1) = v27 | 0x80;
        v29 = v27 >> 7;
        ++a2;
        v30 = v27 >> 14;
        v27 >>= 7;
      }
      while (v30);
      *(a2 - 1) = v29;
    }
    else
    {
      a2[3] = v27;
      a2 += 4;
    }
  }
  else
  {
    a2[2] = v25;
    a2 += 3;
  }
LABEL_155:
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v59 = *(_BYTE *)(a1 + 308);
    *(_WORD *)a2 = 408;
    a2[2] = v59;
    a2 += 3;
  }
  if ((*(_DWORD *)(a1 + 40) & 0x80000000) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v60 = *(int *)(a1 + 304);
    *(_WORD *)a2 = 416;
    if (v60 > 0x7F)
    {
      a2[2] = v60 | 0x80;
      v61 = v60 >> 7;
      if (v60 >> 14)
      {
        a2 += 4;
        do
        {
          *(a2 - 1) = v61 | 0x80;
          v62 = v61 >> 7;
          ++a2;
          v63 = v61 >> 14;
          v61 >>= 7;
        }
        while (v63);
        *(a2 - 1) = v62;
      }
      else
      {
        a2[3] = v61;
        a2 += 4;
      }
    }
    else
    {
      a2[2] = v60;
      a2 += 3;
    }
  }
  v64 = *(_DWORD *)(a1 + 44);
  if ((v64 & 2) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v65 = *(_BYTE *)(a1 + 309);
    *(_WORD *)a2 = 424;
    a2[2] = v65;
    a2 += 3;
    if ((v64 & 8) == 0)
    {
LABEL_171:
      if ((v64 & 4) == 0)
        goto LABEL_182;
      goto LABEL_179;
    }
  }
  else if ((v64 & 8) == 0)
  {
    goto LABEL_171;
  }
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v66 = *(_BYTE *)(a1 + 311);
  *(_WORD *)a2 = 432;
  a2[2] = v66;
  a2 += 3;
  if ((v64 & 4) != 0)
  {
LABEL_179:
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v67 = *(_BYTE *)(a1 + 310);
    *(_WORD *)a2 = 440;
    a2[2] = v67;
    a2 += 3;
  }
LABEL_182:
  v68 = *(_DWORD *)(a1 + 40);
  if ((v68 & 0x4000) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v69 = *(_BYTE *)(a1 + 245);
    *(_WORD *)a2 = 448;
    a2[2] = v69;
    a2 += 3;
    if ((v68 & 0x10000) == 0)
    {
LABEL_184:
      if ((v68 & 0x8000) == 0)
        goto LABEL_195;
      goto LABEL_192;
    }
  }
  else if ((v68 & 0x10000) == 0)
  {
    goto LABEL_184;
  }
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v70 = *(_BYTE *)(a1 + 247);
  *(_WORD *)a2 = 456;
  a2[2] = v70;
  a2 += 3;
  if ((v68 & 0x8000) != 0)
  {
LABEL_192:
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v71 = *(_BYTE *)(a1 + 246);
    *(_WORD *)a2 = 464;
    a2[2] = v71;
    a2 += 3;
  }
LABEL_195:
  v72 = *(_DWORD *)(a1 + 112);
  if (v72 >= 1)
  {
    for (k = 0; v72 != k; ++k)
    {
      v74 = sub_23A086C18(a1 + 104, k);
      if (*(char *)(v74 + 23) < 0)
      {
        v75 = *(_QWORD *)(v74 + 8);
        if (v75 > 127)
          goto LABEL_207;
      }
      else
      {
        v75 = *(unsigned __int8 *)(v74 + 23);
      }
      if (*a3 - (uint64_t)a2 + 13 >= v75)
      {
        *(_WORD *)a2 = 498;
        a2[2] = v75;
        if (*(char *)(v74 + 23) >= 0)
          v76 = (const void *)v74;
        else
          v76 = *(const void **)v74;
        memcpy(a2 + 3, v76, v75);
        a2 += v75 + 3;
        continue;
      }
LABEL_207:
      a2 = sub_23A08B874(a3, 30, v74, a2);
    }
  }
  v77 = *(_DWORD *)(a1 + 136);
  if (v77 >= 1)
  {
    for (m = 0; v77 != m; ++m)
    {
      v79 = sub_23A086C18(a1 + 128, m);
      if (*(char *)(v79 + 23) < 0)
      {
        v80 = *(_QWORD *)(v79 + 8);
        if (v80 > 127)
          goto LABEL_220;
      }
      else
      {
        v80 = *(unsigned __int8 *)(v79 + 23);
      }
      if (*a3 - (uint64_t)a2 + 13 >= v80)
      {
        *(_WORD *)a2 = 506;
        a2[2] = v80;
        if (*(char *)(v79 + 23) >= 0)
          v81 = (const void *)v79;
        else
          v81 = *(const void **)v79;
        memcpy(a2 + 3, v81, v80);
        a2 += v80 + 3;
        continue;
      }
LABEL_220:
      a2 = sub_23A08B874(a3, 31, v79, a2);
    }
  }
  v82 = *(_DWORD *)(a1 + 44);
  if ((v82 & 0x10) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v83 = *(_BYTE *)(a1 + 312);
    *(_WORD *)a2 = 640;
    a2[2] = v83;
    a2 += 3;
  }
  if ((v82 & 0x20) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v84 = *(_BYTE *)(a1 + 313);
    *(_WORD *)a2 = 648;
    a2[2] = v84;
    a2 += 3;
  }
  v85 = *(_DWORD *)(a1 + 40);
  if ((v85 & 0x40000) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v86 = *(_BYTE *)(a1 + 249);
    *(_WORD *)a2 = 656;
    a2[2] = v86;
    a2 += 3;
    if ((v85 & 0x20000) == 0)
    {
LABEL_231:
      if ((v85 & 4) == 0)
        goto LABEL_232;
      goto LABEL_240;
    }
  }
  else if ((v85 & 0x20000) == 0)
  {
    goto LABEL_231;
  }
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v87 = *(_BYTE *)(a1 + 248);
  *(_WORD *)a2 = 664;
  a2[2] = v87;
  a2 += 3;
  if ((v85 & 4) == 0)
  {
LABEL_232:
    if ((v85 & 0x100000) == 0)
      goto LABEL_250;
    goto LABEL_241;
  }
LABEL_240:
  a2 = sub_23A07BF08((unint64_t *)a3, 36, *(_QWORD *)(a1 + 168) & 0xFFFFFFFFFFFFFFFELL, a2);
  if ((v85 & 0x100000) == 0)
    goto LABEL_250;
LABEL_241:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v88 = *(int *)(a1 + 252);
  *(_WORD *)a2 = 704;
  if (v88 > 0x7F)
  {
    a2[2] = v88 | 0x80;
    v89 = v88 >> 7;
    if (v88 >> 14)
    {
      a2 += 4;
      do
      {
        *(a2 - 1) = v89 | 0x80;
        v90 = v89 >> 7;
        ++a2;
        v91 = v89 >> 14;
        v89 >>= 7;
      }
      while (v91);
      *(a2 - 1) = v90;
    }
    else
    {
      a2[3] = v89;
      a2 += 4;
    }
  }
  else
  {
    a2[2] = v88;
    a2 += 3;
  }
LABEL_250:
  v92 = *(_DWORD *)(a1 + 44);
  if ((v92 & 0x40) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v94 = *(int *)(a1 + 316);
    *(_WORD *)a2 = 712;
    if (v94 > 0x7F)
    {
      a2[2] = v94 | 0x80;
      v96 = v94 >> 7;
      if (v94 >> 14)
      {
        a2 += 4;
        do
        {
          *(a2 - 1) = v96 | 0x80;
          v99 = v96 >> 7;
          ++a2;
          v100 = v96 >> 14;
          v96 >>= 7;
        }
        while (v100);
        *(a2 - 1) = v99;
        if ((v92 & 0x80) != 0)
          goto LABEL_273;
      }
      else
      {
        a2[3] = v96;
        a2 += 4;
        if ((v92 & 0x80) != 0)
          goto LABEL_273;
      }
    }
    else
    {
      a2[2] = v94;
      a2 += 3;
      if ((v92 & 0x80) != 0)
        goto LABEL_273;
    }
LABEL_252:
    if ((v92 & 0x100) == 0)
      goto LABEL_284;
    goto LABEL_253;
  }
  if ((v92 & 0x80) == 0)
    goto LABEL_252;
LABEL_273:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v101 = *(int *)(a1 + 320);
  *(_WORD *)a2 = 720;
  if (v101 > 0x7F)
  {
    a2[2] = v101 | 0x80;
    v102 = v101 >> 7;
    if (v101 >> 14)
    {
      a2 += 4;
      do
      {
        *(a2 - 1) = v102 | 0x80;
        v103 = v102 >> 7;
        ++a2;
        v104 = v102 >> 14;
        v102 >>= 7;
      }
      while (v104);
      *(a2 - 1) = v103;
      if ((v92 & 0x100) == 0)
        goto LABEL_284;
    }
    else
    {
      a2[3] = v102;
      a2 += 4;
      if ((v92 & 0x100) == 0)
        goto LABEL_284;
    }
  }
  else
  {
    a2[2] = v101;
    a2 += 3;
    if ((v92 & 0x100) == 0)
      goto LABEL_284;
  }
LABEL_253:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v93 = *(int *)(a1 + 324);
  *(_WORD *)a2 = 728;
  if (v93 > 0x7F)
  {
    a2[2] = v93 | 0x80;
    v95 = v93 >> 7;
    if (v93 >> 14)
    {
      a2 += 4;
      do
      {
        *(a2 - 1) = v95 | 0x80;
        v97 = v95 >> 7;
        ++a2;
        v98 = v95 >> 14;
        v95 >>= 7;
      }
      while (v98);
      *(a2 - 1) = v97;
    }
    else
    {
      a2[3] = v95;
      a2 += 4;
    }
  }
  else
  {
    a2[2] = v93;
    a2 += 3;
  }
LABEL_284:
  v105 = *(_DWORD *)(a1 + 40);
  if ((v105 & 8) != 0)
  {
    a2 = sub_23A07BF08((unint64_t *)a3, 44, *(_QWORD *)(a1 + 176) & 0xFFFFFFFFFFFFFFFELL, a2);
    if ((v105 & 0x10) == 0)
    {
LABEL_286:
      if ((v105 & 0x20) == 0)
        goto LABEL_287;
      goto LABEL_299;
    }
  }
  else if ((v105 & 0x10) == 0)
  {
    goto LABEL_286;
  }
  a2 = sub_23A07BF08((unint64_t *)a3, 45, *(_QWORD *)(a1 + 184) & 0xFFFFFFFFFFFFFFFELL, a2);
  if ((v105 & 0x20) == 0)
  {
LABEL_287:
    if ((v105 & 0x40) == 0)
      goto LABEL_288;
    goto LABEL_300;
  }
LABEL_299:
  a2 = sub_23A07BF08((unint64_t *)a3, 46, *(_QWORD *)(a1 + 192) & 0xFFFFFFFFFFFFFFFELL, a2);
  if ((v105 & 0x40) == 0)
  {
LABEL_288:
    if ((v105 & 0x80) == 0)
      goto LABEL_289;
    goto LABEL_301;
  }
LABEL_300:
  a2 = sub_23A07BF08((unint64_t *)a3, 47, *(_QWORD *)(a1 + 200) & 0xFFFFFFFFFFFFFFFELL, a2);
  if ((v105 & 0x80) == 0)
  {
LABEL_289:
    if ((v105 & 0x80000) == 0)
      goto LABEL_290;
    goto LABEL_302;
  }
LABEL_301:
  a2 = sub_23A07BF08((unint64_t *)a3, 48, *(_QWORD *)(a1 + 208) & 0xFFFFFFFFFFFFFFFELL, a2);
  if ((v105 & 0x80000) == 0)
  {
LABEL_290:
    if ((v105 & 0x2000) == 0)
      goto LABEL_291;
    goto LABEL_305;
  }
LABEL_302:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v110 = *(_BYTE *)(a1 + 250);
  *(_WORD *)a2 = 904;
  a2[2] = v110;
  a2 += 3;
  if ((v105 & 0x2000) == 0)
  {
LABEL_291:
    if ((v105 & 0x200000) == 0)
      goto LABEL_292;
    goto LABEL_308;
  }
LABEL_305:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v111 = *(_BYTE *)(a1 + 244);
  *(_WORD *)a2 = 912;
  a2[2] = v111;
  a2 += 3;
  if ((v105 & 0x200000) == 0)
  {
LABEL_292:
    if ((v105 & 0x400000) == 0)
      goto LABEL_293;
    goto LABEL_311;
  }
LABEL_308:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v112 = *(_DWORD *)(a1 + 256);
  *(_WORD *)a2 = 925;
  *(_DWORD *)(a2 + 2) = v112;
  a2 += 6;
  if ((v105 & 0x400000) == 0)
  {
LABEL_293:
    if ((v105 & 0x100) == 0)
      goto LABEL_295;
    goto LABEL_294;
  }
LABEL_311:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v113 = *(_QWORD *)(a1 + 264);
  *(_WORD *)a2 = 928;
  if (v113 <= 0x7F)
  {
    a2[2] = v113;
    a2 += 3;
    if ((v105 & 0x100) == 0)
      goto LABEL_295;
LABEL_294:
    a2 = sub_23A07BF08((unint64_t *)a3, 53, *(_QWORD *)(a1 + 216) & 0xFFFFFFFFFFFFFFFELL, a2);
    goto LABEL_295;
  }
  a2[2] = v113 | 0x80;
  v114 = v113 >> 7;
  if (v113 >> 14)
  {
    a2 += 4;
    do
    {
      *(a2 - 1) = v114 | 0x80;
      v115 = v114 >> 7;
      ++a2;
      v116 = v114 >> 14;
      v114 >>= 7;
    }
    while (v116);
    *(a2 - 1) = v115;
    if ((v105 & 0x100) != 0)
      goto LABEL_294;
  }
  else
  {
    a2[3] = v114;
    a2 += 4;
    if ((v105 & 0x100) != 0)
      goto LABEL_294;
  }
LABEL_295:
  v106 = sub_23A091FC4(a1 + 16, 200, 0x20000000, a2, a3);
  v107 = v106;
  v108 = *(_QWORD *)(a1 + 8);
  if ((v108 & 1) == 0)
    return v107;
  v117 = v108 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v117 + 31) < 0)
  {
    v118 = *(void **)(v117 + 8);
    v119 = *(_QWORD *)(v117 + 16);
  }
  else
  {
    v118 = (void *)(v117 + 8);
    LODWORD(v119) = *(unsigned __int8 *)(v117 + 31);
  }
  if (*a3 - (uint64_t)v106 >= (int)v119)
  {
    v120 = (int)v119;
    memcpy(v106, v118, (int)v119);
    v107 += v120;
    return v107;
  }
  return sub_23A08B474(a3, (char *)v118, v119, (unint64_t)v106);
}

uint64_t sub_23A0814F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;

  v2 = sub_23A094B58(a1 + 16);
  v3 = *(unsigned int *)(a1 + 64);
  v4 = v2 + v3;
  if ((int)v3 >= 1)
  {
    v5 = 0;
    do
    {
      v6 = sub_23A086C18(a1 + 56, v5);
      v7 = *(unsigned __int8 *)(v6 + 23);
      if ((v7 & 0x80u) != 0)
        v7 = *(_QWORD *)(v6 + 8);
      v4 += v7 + ((9 * (__clz(v7 | 1) ^ 0x1F) + 73) >> 6);
      ++v5;
    }
    while ((_DWORD)v3 != v5);
  }
  v8 = *(unsigned int *)(a1 + 88);
  v9 = v4 + v8;
  if ((int)v8 >= 1)
  {
    v10 = 0;
    do
    {
      v11 = sub_23A086C18(a1 + 80, v10);
      v12 = *(unsigned __int8 *)(v11 + 23);
      if ((v12 & 0x80u) != 0)
        v12 = *(_QWORD *)(v11 + 8);
      v9 += v12 + ((9 * (__clz(v12 | 1) ^ 0x1F) + 73) >> 6);
      ++v10;
    }
    while ((_DWORD)v8 != v10);
  }
  v13 = *(unsigned int *)(a1 + 112);
  v14 = v9 + 2 * v13;
  if ((int)v13 >= 1)
  {
    v15 = 0;
    do
    {
      v16 = sub_23A086C18(a1 + 104, v15);
      v17 = *(unsigned __int8 *)(v16 + 23);
      if ((v17 & 0x80u) != 0)
        v17 = *(_QWORD *)(v16 + 8);
      v14 += v17 + ((9 * (__clz(v17 | 1) ^ 0x1F) + 73) >> 6);
      ++v15;
    }
    while ((_DWORD)v13 != v15);
  }
  v18 = *(unsigned int *)(a1 + 136);
  v19 = v14 + 2 * v18;
  if ((int)v18 >= 1)
  {
    v20 = 0;
    do
    {
      v21 = sub_23A086C18(a1 + 128, v20);
      v22 = *(unsigned __int8 *)(v21 + 23);
      if ((v22 & 0x80u) != 0)
        v22 = *(_QWORD *)(v21 + 8);
      v19 += v22 + ((9 * (__clz(v22 | 1) ^ 0x1F) + 73) >> 6);
      ++v20;
    }
    while ((_DWORD)v18 != v20);
  }
  v23 = *(_DWORD *)(a1 + 40);
  if (!(_BYTE)v23)
    goto LABEL_33;
  if ((v23 & 1) != 0)
  {
    v58 = *(_QWORD *)(a1 + 152) & 0xFFFFFFFFFFFFFFFELL;
    v59 = *(unsigned __int8 *)(v58 + 23);
    v60 = *(_QWORD *)(v58 + 8);
    if ((v59 & 0x80u) == 0)
      v60 = v59;
    v19 += v60 + ((9 * (__clz(v60 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v23 & 2) == 0)
    {
LABEL_24:
      if ((v23 & 4) == 0)
        goto LABEL_25;
      goto LABEL_131;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_24;
  }
  v61 = *(_QWORD *)(a1 + 160) & 0xFFFFFFFFFFFFFFFELL;
  v62 = *(unsigned __int8 *)(v61 + 23);
  v63 = *(_QWORD *)(v61 + 8);
  if ((v62 & 0x80u) == 0)
    v63 = v62;
  v19 += v63 + ((9 * (__clz(v63 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v23 & 4) == 0)
  {
LABEL_25:
    if ((v23 & 8) == 0)
      goto LABEL_26;
    goto LABEL_134;
  }
LABEL_131:
  v64 = *(_QWORD *)(a1 + 168) & 0xFFFFFFFFFFFFFFFELL;
  v65 = *(unsigned __int8 *)(v64 + 23);
  v66 = *(_QWORD *)(v64 + 8);
  if ((v65 & 0x80u) == 0)
    v66 = v65;
  v19 += v66 + ((9 * (__clz(v66 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v23 & 8) == 0)
  {
LABEL_26:
    if ((v23 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_137;
  }
LABEL_134:
  v67 = *(_QWORD *)(a1 + 176) & 0xFFFFFFFFFFFFFFFELL;
  v68 = *(unsigned __int8 *)(v67 + 23);
  v69 = *(_QWORD *)(v67 + 8);
  if ((v68 & 0x80u) == 0)
    v69 = v68;
  v19 += v69 + ((9 * (__clz(v69 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v23 & 0x10) == 0)
  {
LABEL_27:
    if ((v23 & 0x20) == 0)
      goto LABEL_28;
LABEL_140:
    v73 = *(_QWORD *)(a1 + 192) & 0xFFFFFFFFFFFFFFFELL;
    v74 = *(unsigned __int8 *)(v73 + 23);
    v75 = *(_QWORD *)(v73 + 8);
    if ((v74 & 0x80u) == 0)
      v75 = v74;
    v19 += v75 + ((9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if ((v23 & 0x40) == 0)
    {
LABEL_29:
      if ((v23 & 0x80) == 0)
        goto LABEL_33;
      goto LABEL_30;
    }
    goto LABEL_143;
  }
LABEL_137:
  v70 = *(_QWORD *)(a1 + 184) & 0xFFFFFFFFFFFFFFFELL;
  v71 = *(unsigned __int8 *)(v70 + 23);
  v72 = *(_QWORD *)(v70 + 8);
  if ((v71 & 0x80u) == 0)
    v72 = v71;
  v19 += v72 + ((9 * (__clz(v72 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v23 & 0x20) != 0)
    goto LABEL_140;
LABEL_28:
  if ((v23 & 0x40) == 0)
    goto LABEL_29;
LABEL_143:
  v76 = *(_QWORD *)(a1 + 200) & 0xFFFFFFFFFFFFFFFELL;
  v77 = *(unsigned __int8 *)(v76 + 23);
  v78 = *(_QWORD *)(v76 + 8);
  if ((v77 & 0x80u) == 0)
    v78 = v77;
  v19 += v78 + ((9 * (__clz(v78 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v23 & 0x80) != 0)
  {
LABEL_30:
    v24 = *(_QWORD *)(a1 + 208) & 0xFFFFFFFFFFFFFFFELL;
    v25 = *(unsigned __int8 *)(v24 + 23);
    v26 = *(_QWORD *)(v24 + 8);
    if ((v25 & 0x80u) == 0)
      v26 = v25;
    v19 += v26 + ((9 * (__clz(v26 | 1) ^ 0x1F) + 73) >> 6) + 2;
  }
LABEL_33:
  if ((v23 & 0xFF00) == 0)
    goto LABEL_50;
  if ((v23 & 0x100) != 0)
  {
    v79 = *(_QWORD *)(a1 + 216) & 0xFFFFFFFFFFFFFFFELL;
    v80 = *(unsigned __int8 *)(v79 + 23);
    v81 = *(_QWORD *)(v79 + 8);
    if ((v80 & 0x80u) == 0)
      v81 = v80;
    v19 += v81 + ((9 * (__clz(v81 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if ((v23 & 0x200) == 0)
    {
LABEL_36:
      if ((v23 & 0x400) == 0)
        goto LABEL_37;
      goto LABEL_154;
    }
  }
  else if ((v23 & 0x200) == 0)
  {
    goto LABEL_36;
  }
  v82 = *(_DWORD *)(a1 + 224);
  v83 = (9 * (__clz(v82 | 1) ^ 0x1F) + 73) >> 6;
  if (v82 >= 0)
    v84 = v83;
  else
    v84 = 10;
  v19 += v84 + 1;
  if ((v23 & 0x400) == 0)
  {
LABEL_37:
    if ((v23 & 0x800) == 0)
      goto LABEL_38;
LABEL_158:
    v19 += ((9 * (__clz(*(_QWORD *)(a1 + 232) | 1) ^ 0x3F) + 73) >> 6) + 1;
    if ((v23 & 0x1000) != 0)
      goto LABEL_39;
    goto LABEL_43;
  }
LABEL_154:
  v85 = *(_DWORD *)(a1 + 228);
  v86 = (9 * (__clz(v85 | 1) ^ 0x1F) + 73) >> 6;
  if (v85 >= 0)
    v87 = v86;
  else
    v87 = 10;
  v19 += v87 + 1;
  if ((v23 & 0x800) != 0)
    goto LABEL_158;
LABEL_38:
  if ((v23 & 0x1000) != 0)
  {
LABEL_39:
    v27 = *(_DWORD *)(a1 + 240);
    v28 = (9 * (__clz(v27 | 1) ^ 0x1F) + 73) >> 6;
    if (v27 >= 0)
      v29 = v28;
    else
      v29 = 10;
    v19 += v29 + 1;
  }
LABEL_43:
  v30 = v19 + 3;
  if ((v23 & 0x2000) == 0)
    v30 = v19;
  if ((v23 & 0x4000) != 0)
    v30 += 3;
  if ((v23 & 0x8000) != 0)
    v19 = v30 + 3;
  else
    v19 = v30;
LABEL_50:
  if ((v23 & 0xFF0000) != 0)
  {
    v31 = v19 + 3;
    if ((v23 & 0x10000) == 0)
      v31 = v19;
    if ((v23 & 0x20000) != 0)
      v31 += 3;
    if ((v23 & 0x40000) != 0)
      v31 += 3;
    if ((v23 & 0x80000) != 0)
      v31 += 3;
    if ((v23 & 0x100000) != 0)
    {
      v32 = *(_DWORD *)(a1 + 252);
      v33 = (9 * (__clz(v32 | 1) ^ 0x1F) + 73) >> 6;
      if (v32 >= 0)
        v34 = v33;
      else
        v34 = 10;
      v31 += v34 + 2;
    }
    if ((v23 & 0x200000) != 0)
      v19 = v31 + 6;
    else
      v19 = v31;
    if ((v23 & 0x400000) != 0)
      v19 += ((9 * (__clz(*(_QWORD *)(a1 + 264) | 1) ^ 0x3F) + 73) >> 6) + 2;
    if ((v23 & 0x800000) != 0)
    {
      v35 = *(_DWORD *)(a1 + 272);
      v36 = (9 * (__clz(v35 | 1) ^ 0x1F) + 73) >> 6;
      if (v35 >= 0)
        v37 = v36;
      else
        v37 = 10;
      v19 += v37 + 1;
    }
  }
  if (!HIBYTE(v23))
    goto LABEL_94;
  if ((v23 & 0x1000000) != 0)
  {
    v38 = *(_DWORD *)(a1 + 276);
    v39 = (9 * (__clz(v38 | 1) ^ 0x1F) + 73) >> 6;
    if (v38 >= 0)
      v40 = v39;
    else
      v40 = 10;
    v19 += v40 + 1;
  }
  v41 = v19 + 5;
  if ((v23 & 0x2000000) == 0)
    v41 = v19;
  if ((v23 & 0x4000000) != 0)
  {
    v42 = *(_DWORD *)(a1 + 284);
    v43 = (9 * (__clz(v42 | 1) ^ 0x1F) + 73) >> 6;
    if (v42 >= 0)
      v44 = v43;
    else
      v44 = 10;
    v41 += v44 + 1;
  }
  if ((v23 & 0x8000000) != 0)
    v19 = v41 + 5;
  else
    v19 = v41;
  if ((v23 & 0x10000000) == 0)
  {
    if ((v23 & 0x20000000) == 0)
      goto LABEL_92;
LABEL_164:
    v91 = *(_DWORD *)(a1 + 296);
    v92 = ((9 * (__clz(v91 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if (v91 >= 0)
      v93 = v92;
    else
      v93 = 12;
    v19 += v93;
    if ((v23 & 0x40000000) == 0)
    {
LABEL_93:
      if ((v23 & 0x80000000) == 0)
        goto LABEL_94;
      goto LABEL_172;
    }
    goto LABEL_168;
  }
  v88 = *(_DWORD *)(a1 + 292);
  v89 = (9 * (__clz(v88 | 1) ^ 0x1F) + 73) >> 6;
  if (v88 >= 0)
    v90 = v89;
  else
    v90 = 10;
  v19 += v90 + 2;
  if ((v23 & 0x20000000) != 0)
    goto LABEL_164;
LABEL_92:
  if ((v23 & 0x40000000) == 0)
    goto LABEL_93;
LABEL_168:
  v94 = *(_DWORD *)(a1 + 300);
  v95 = ((9 * (__clz(v94 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if (v94 >= 0)
    v96 = v95;
  else
    v96 = 12;
  v19 += v96;
  if ((v23 & 0x80000000) != 0)
  {
LABEL_172:
    v97 = *(_DWORD *)(a1 + 304);
    v98 = ((9 * (__clz(v97 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if (v97 >= 0)
      v99 = v98;
    else
      v99 = 12;
    v19 += v99;
  }
LABEL_94:
  v45 = *(_DWORD *)(a1 + 44);
  if ((_BYTE)v45)
  {
    v46 = v19 + 3;
    if ((v45 & 1) == 0)
      v46 = v19;
    if ((v45 & 2) != 0)
      v46 += 3;
    if ((v45 & 4) != 0)
      v46 += 3;
    if ((v45 & 8) != 0)
      v46 += 3;
    if ((v45 & 0x10) != 0)
      v46 += 3;
    if ((v45 & 0x20) != 0)
      v19 = v46 + 3;
    else
      v19 = v46;
    if ((v45 & 0x40) != 0)
    {
      v47 = *(_DWORD *)(a1 + 316);
      v48 = ((9 * (__clz(v47 | 1) ^ 0x1F) + 73) >> 6) + 2;
      if (v47 >= 0)
        v49 = v48;
      else
        v49 = 12;
      v19 += v49;
    }
    if ((v45 & 0x80) != 0)
    {
      v50 = *(_DWORD *)(a1 + 320);
      v51 = ((9 * (__clz(v50 | 1) ^ 0x1F) + 73) >> 6) + 2;
      if (v50 >= 0)
        v52 = v51;
      else
        v52 = 12;
      v19 += v52;
    }
  }
  if ((v45 & 0x100) != 0)
  {
    v53 = *(_DWORD *)(a1 + 324);
    v54 = ((9 * (__clz(v53 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if (v53 >= 0)
      v55 = v54;
    else
      v55 = 12;
    v19 += v55;
  }
  v56 = *(_QWORD *)(a1 + 8);
  if ((v56 & 1) != 0)
  {
    v100 = v56 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v100 + 31) < 0)
      v101 = *(_QWORD *)(v100 + 16);
    else
      v101 = *(unsigned __int8 *)(v100 + 31);
    v19 += v101;
  }
  *(_DWORD *)(a1 + 48) = v19;
  return v19;
}

unint64_t sub_23A081D9C(uint64_t a1, uint64_t (***a2)(), uint64_t a3)
{
  if (*a2 != &off_250B0C800)
    sub_23A07E458(a1, (uint64_t)a2, a3);
  return sub_23A081DC4(a1, (uint64_t)a2);
}

unint64_t sub_23A081DC4(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  std::string *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  unint64_t result;
  unsigned int v14;
  __int128 *v15;
  uint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  uint64_t v19;
  _QWORD *v20;
  __int128 *v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 *v24;
  uint64_t v25;
  _QWORD *v26;
  __int128 *v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 *v30;
  uint64_t v31;
  _QWORD *v32;
  __int128 *v33;
  uint64_t v34;
  _QWORD *v35;
  __int128 *v36;
  uint64_t v37;
  _QWORD *v38;
  int v39;
  int v40;
  __int128 *v41;
  uint64_t v42;
  _QWORD *v43;
  char v44;
  std::string v45[2];

  if (a2 == a1)
  {
    sub_23A08BD88((uint64_t)v45, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 1671);
    v4 = sub_23A08BDA0(v45, "CHECK failed: (&from) != (this): ");
    sub_23A08BED0((uint64_t)&v44, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v45);
  }
  sub_23A08FE8C(a1 + 16, a2 + 16);
  v5 = *(_QWORD *)(a2 + 8);
  if ((v5 & 1) != 0)
  {
    v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & 1) != 0)
      v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    else
      v9 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
    v10 = *(char *)(v6 + 31);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)v7;
    else
      v11 = *(const std::string::value_type **)(v6 + 8);
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(v6 + 31);
    else
      v12 = *(_QWORD *)(v6 + 16);
    std::string::append(v9, v11, v12);
  }
  sub_23A086E4C(a1 + 56, a2 + 56);
  sub_23A086E4C(a1 + 80, a2 + 80);
  sub_23A086E4C(a1 + 104, a2 + 104);
  result = sub_23A086E4C(a1 + 128, a2 + 128);
  v14 = *(_DWORD *)(a2 + 40);
  if (!(_BYTE)v14)
    goto LABEL_47;
  if ((v14 & 1) != 0)
  {
    v15 = (__int128 *)(*(_QWORD *)(a2 + 152) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 1u;
    v16 = *(_QWORD *)(a1 + 8);
    v17 = (_QWORD *)(v16 & 0xFFFFFFFFFFFFFFFELL);
    if ((v16 & 1) != 0)
      v17 = (_QWORD *)*v17;
    result = sub_23A08ACAC((uint64_t *)(a1 + 152), v15, (uint64_t)v17);
    if ((v14 & 2) == 0)
    {
LABEL_16:
      if ((v14 & 4) == 0)
        goto LABEL_17;
      goto LABEL_29;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_16;
  }
  v18 = (__int128 *)(*(_QWORD *)(a2 + 160) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 2u;
  v19 = *(_QWORD *)(a1 + 8);
  v20 = (_QWORD *)(v19 & 0xFFFFFFFFFFFFFFFELL);
  if ((v19 & 1) != 0)
    v20 = (_QWORD *)*v20;
  result = sub_23A08ACAC((uint64_t *)(a1 + 160), v18, (uint64_t)v20);
  if ((v14 & 4) == 0)
  {
LABEL_17:
    if ((v14 & 8) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_29:
  v21 = (__int128 *)(*(_QWORD *)(a2 + 168) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 4u;
  v22 = *(_QWORD *)(a1 + 8);
  v23 = (_QWORD *)(v22 & 0xFFFFFFFFFFFFFFFELL);
  if ((v22 & 1) != 0)
    v23 = (_QWORD *)*v23;
  result = sub_23A08ACAC((uint64_t *)(a1 + 168), v21, (uint64_t)v23);
  if ((v14 & 8) == 0)
  {
LABEL_18:
    if ((v14 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_32:
  v24 = (__int128 *)(*(_QWORD *)(a2 + 176) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 8u;
  v25 = *(_QWORD *)(a1 + 8);
  v26 = (_QWORD *)(v25 & 0xFFFFFFFFFFFFFFFELL);
  if ((v25 & 1) != 0)
    v26 = (_QWORD *)*v26;
  result = sub_23A08ACD4((uint64_t *)(a1 + 176), v24, (uint64_t)v26);
  if ((v14 & 0x10) == 0)
  {
LABEL_19:
    if ((v14 & 0x20) == 0)
      goto LABEL_20;
LABEL_38:
    v30 = (__int128 *)(*(_QWORD *)(a2 + 192) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x20u;
    v31 = *(_QWORD *)(a1 + 8);
    v32 = (_QWORD *)(v31 & 0xFFFFFFFFFFFFFFFELL);
    if ((v31 & 1) != 0)
      v32 = (_QWORD *)*v32;
    result = sub_23A08ACD4((uint64_t *)(a1 + 192), v30, (uint64_t)v32);
    if ((v14 & 0x40) == 0)
    {
LABEL_21:
      if ((v14 & 0x80) == 0)
        goto LABEL_47;
      goto LABEL_44;
    }
    goto LABEL_41;
  }
LABEL_35:
  v27 = (__int128 *)(*(_QWORD *)(a2 + 184) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 0x10u;
  v28 = *(_QWORD *)(a1 + 8);
  v29 = (_QWORD *)(v28 & 0xFFFFFFFFFFFFFFFELL);
  if ((v28 & 1) != 0)
    v29 = (_QWORD *)*v29;
  result = sub_23A08ACD4((uint64_t *)(a1 + 184), v27, (uint64_t)v29);
  if ((v14 & 0x20) != 0)
    goto LABEL_38;
LABEL_20:
  if ((v14 & 0x40) == 0)
    goto LABEL_21;
LABEL_41:
  v33 = (__int128 *)(*(_QWORD *)(a2 + 200) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 0x40u;
  v34 = *(_QWORD *)(a1 + 8);
  v35 = (_QWORD *)(v34 & 0xFFFFFFFFFFFFFFFELL);
  if ((v34 & 1) != 0)
    v35 = (_QWORD *)*v35;
  result = sub_23A08ACD4((uint64_t *)(a1 + 200), v33, (uint64_t)v35);
  if ((v14 & 0x80) != 0)
  {
LABEL_44:
    v36 = (__int128 *)(*(_QWORD *)(a2 + 208) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x80u;
    v37 = *(_QWORD *)(a1 + 8);
    v38 = (_QWORD *)(v37 & 0xFFFFFFFFFFFFFFFELL);
    if ((v37 & 1) != 0)
      v38 = (_QWORD *)*v38;
    result = sub_23A08ACD4((uint64_t *)(a1 + 208), v36, (uint64_t)v38);
  }
LABEL_47:
  if ((v14 & 0xFF00) == 0)
    goto LABEL_58;
  if ((v14 & 0x100) != 0)
  {
    v41 = (__int128 *)(*(_QWORD *)(a2 + 216) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x100u;
    v42 = *(_QWORD *)(a1 + 8);
    v43 = (_QWORD *)(v42 & 0xFFFFFFFFFFFFFFFELL);
    if ((v42 & 1) != 0)
      v43 = (_QWORD *)*v43;
    result = sub_23A08ACAC((uint64_t *)(a1 + 216), v41, (uint64_t)v43);
    if ((v14 & 0x200) == 0)
    {
LABEL_50:
      if ((v14 & 0x400) == 0)
        goto LABEL_51;
      goto LABEL_97;
    }
  }
  else if ((v14 & 0x200) == 0)
  {
    goto LABEL_50;
  }
  *(_DWORD *)(a1 + 224) = *(_DWORD *)(a2 + 224);
  if ((v14 & 0x400) == 0)
  {
LABEL_51:
    if ((v14 & 0x800) == 0)
      goto LABEL_52;
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a2 + 228);
  if ((v14 & 0x800) == 0)
  {
LABEL_52:
    if ((v14 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_99;
  }
LABEL_98:
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  if ((v14 & 0x1000) == 0)
  {
LABEL_53:
    if ((v14 & 0x2000) == 0)
      goto LABEL_54;
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(a1 + 240) = *(_DWORD *)(a2 + 240);
  if ((v14 & 0x2000) == 0)
  {
LABEL_54:
    if ((v14 & 0x4000) == 0)
      goto LABEL_55;
LABEL_101:
    *(_BYTE *)(a1 + 245) = *(_BYTE *)(a2 + 245);
    if ((v14 & 0x8000) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_100:
  *(_BYTE *)(a1 + 244) = *(_BYTE *)(a2 + 244);
  if ((v14 & 0x4000) != 0)
    goto LABEL_101;
LABEL_55:
  if ((v14 & 0x8000) != 0)
LABEL_56:
    *(_BYTE *)(a1 + 246) = *(_BYTE *)(a2 + 246);
LABEL_57:
  *(_DWORD *)(a1 + 40) |= v14;
LABEL_58:
  if ((v14 & 0xFF0000) == 0)
    goto LABEL_69;
  if ((v14 & 0x10000) != 0)
  {
    *(_BYTE *)(a1 + 247) = *(_BYTE *)(a2 + 247);
    if ((v14 & 0x20000) == 0)
    {
LABEL_61:
      if ((v14 & 0x40000) == 0)
        goto LABEL_62;
      goto LABEL_105;
    }
  }
  else if ((v14 & 0x20000) == 0)
  {
    goto LABEL_61;
  }
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  if ((v14 & 0x40000) == 0)
  {
LABEL_62:
    if ((v14 & 0x80000) == 0)
      goto LABEL_63;
    goto LABEL_106;
  }
LABEL_105:
  *(_BYTE *)(a1 + 249) = *(_BYTE *)(a2 + 249);
  if ((v14 & 0x80000) == 0)
  {
LABEL_63:
    if ((v14 & 0x100000) == 0)
      goto LABEL_64;
    goto LABEL_107;
  }
LABEL_106:
  *(_BYTE *)(a1 + 250) = *(_BYTE *)(a2 + 250);
  if ((v14 & 0x100000) == 0)
  {
LABEL_64:
    if ((v14 & 0x200000) == 0)
      goto LABEL_65;
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(a1 + 252) = *(_DWORD *)(a2 + 252);
  if ((v14 & 0x200000) == 0)
  {
LABEL_65:
    if ((v14 & 0x400000) == 0)
      goto LABEL_66;
LABEL_109:
    *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
    if ((v14 & 0x800000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_108:
  *(_DWORD *)(a1 + 256) = *(_DWORD *)(a2 + 256);
  if ((v14 & 0x400000) != 0)
    goto LABEL_109;
LABEL_66:
  if ((v14 & 0x800000) != 0)
LABEL_67:
    *(_DWORD *)(a1 + 272) = *(_DWORD *)(a2 + 272);
LABEL_68:
  *(_DWORD *)(a1 + 40) |= v14;
LABEL_69:
  if (!HIBYTE(v14))
    goto LABEL_79;
  if ((v14 & 0x1000000) != 0)
  {
    *(_DWORD *)(a1 + 276) = *(_DWORD *)(a2 + 276);
    if ((v14 & 0x2000000) == 0)
    {
LABEL_72:
      if ((v14 & 0x4000000) == 0)
        goto LABEL_73;
      goto LABEL_121;
    }
  }
  else if ((v14 & 0x2000000) == 0)
  {
    goto LABEL_72;
  }
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a2 + 280);
  if ((v14 & 0x4000000) == 0)
  {
LABEL_73:
    if ((v14 & 0x8000000) == 0)
      goto LABEL_74;
    goto LABEL_122;
  }
LABEL_121:
  *(_DWORD *)(a1 + 284) = *(_DWORD *)(a2 + 284);
  if ((v14 & 0x8000000) == 0)
  {
LABEL_74:
    if ((v14 & 0x10000000) == 0)
      goto LABEL_75;
    goto LABEL_123;
  }
LABEL_122:
  *(_DWORD *)(a1 + 288) = *(_DWORD *)(a2 + 288);
  if ((v14 & 0x10000000) == 0)
  {
LABEL_75:
    if ((v14 & 0x20000000) == 0)
      goto LABEL_76;
    goto LABEL_124;
  }
LABEL_123:
  *(_DWORD *)(a1 + 292) = *(_DWORD *)(a2 + 292);
  if ((v14 & 0x20000000) == 0)
  {
LABEL_76:
    if ((v14 & 0x40000000) == 0)
      goto LABEL_77;
LABEL_125:
    *(_DWORD *)(a1 + 300) = *(_DWORD *)(a2 + 300);
    if ((v14 & 0x80000000) == 0)
      goto LABEL_78;
LABEL_126:
    *(_DWORD *)(a1 + 304) = *(_DWORD *)(a2 + 304);
    goto LABEL_78;
  }
LABEL_124:
  *(_DWORD *)(a1 + 296) = *(_DWORD *)(a2 + 296);
  if ((v14 & 0x40000000) != 0)
    goto LABEL_125;
LABEL_77:
  if ((v14 & 0x80000000) != 0)
    goto LABEL_126;
LABEL_78:
  *(_DWORD *)(a1 + 40) |= v14;
LABEL_79:
  v39 = *(_DWORD *)(a2 + 44);
  if (!(_BYTE)v39)
    goto LABEL_90;
  if ((v39 & 1) != 0)
  {
    *(_BYTE *)(a1 + 308) = *(_BYTE *)(a2 + 308);
    if ((v39 & 2) == 0)
    {
LABEL_82:
      if ((v39 & 4) == 0)
        goto LABEL_83;
      goto LABEL_113;
    }
  }
  else if ((v39 & 2) == 0)
  {
    goto LABEL_82;
  }
  *(_BYTE *)(a1 + 309) = *(_BYTE *)(a2 + 309);
  if ((v39 & 4) == 0)
  {
LABEL_83:
    if ((v39 & 8) == 0)
      goto LABEL_84;
    goto LABEL_114;
  }
LABEL_113:
  *(_BYTE *)(a1 + 310) = *(_BYTE *)(a2 + 310);
  if ((v39 & 8) == 0)
  {
LABEL_84:
    if ((v39 & 0x10) == 0)
      goto LABEL_85;
    goto LABEL_115;
  }
LABEL_114:
  *(_BYTE *)(a1 + 311) = *(_BYTE *)(a2 + 311);
  if ((v39 & 0x10) == 0)
  {
LABEL_85:
    if ((v39 & 0x20) == 0)
      goto LABEL_86;
    goto LABEL_116;
  }
LABEL_115:
  *(_BYTE *)(a1 + 312) = *(_BYTE *)(a2 + 312);
  if ((v39 & 0x20) == 0)
  {
LABEL_86:
    if ((v39 & 0x40) == 0)
      goto LABEL_87;
LABEL_117:
    *(_DWORD *)(a1 + 316) = *(_DWORD *)(a2 + 316);
    if ((v39 & 0x80) == 0)
      goto LABEL_89;
    goto LABEL_88;
  }
LABEL_116:
  *(_BYTE *)(a1 + 313) = *(_BYTE *)(a2 + 313);
  if ((v39 & 0x40) != 0)
    goto LABEL_117;
LABEL_87:
  if ((v39 & 0x80) != 0)
LABEL_88:
    *(_DWORD *)(a1 + 320) = *(_DWORD *)(a2 + 320);
LABEL_89:
  *(_DWORD *)(a1 + 44) |= v39;
LABEL_90:
  if ((v39 & 0x100) != 0)
  {
    v40 = *(_DWORD *)(a2 + 324);
    *(_DWORD *)(a1 + 44) |= 0x100u;
    *(_DWORD *)(a1 + 324) = v40;
  }
  return result;
}

void sub_23A08231C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A082334(uint64_t a1)
{
  return sub_23A09105C(a1 + 16);
}

_QWORD *sub_23A08233C@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "sentencepiece.TrainerSpec");
}

uint64_t sub_23A08234C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = &off_250B0C9F0;
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = &unk_250B0CA90;
  sub_23A08C324(a1 + 24, a2);
  *(_QWORD *)(a1 + 48) = 0;
  if (atomic_load(dword_2569413B0))
    sub_23A096744(dword_2569413B0);
  *(_QWORD *)(a1 + 56) = &qword_2569425B8;
  *(_QWORD *)(a1 + 64) = &qword_2569425B8;
  *(_QWORD *)(a1 + 72) = &qword_2569425B8;
  *(_DWORD *)(a1 + 80) = 16843008;
  return a1;
}

void sub_23A0823CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23A08C400(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23A0823E0(uint64_t a1)
{
  sub_23A082418(a1);
  sub_23A07B7E8((uint64_t *)(a1 + 8));
  sub_23A08C400(a1 + 24);
  return a1;
}

uint64_t *sub_23A082418(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  std::string *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  std::string v15[2];

  v2 = *(_QWORD *)(a1 + 8);
  v3 = (_QWORD *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 1972);
    v4 = sub_23A08BDA0(v15, "CHECK failed: GetArena() == nullptr: ");
    sub_23A08BED0((uint64_t)&v14, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v15);
  }
LABEL_4:
  if (*(uint64_t **)(a1 + 56) != &qword_2569425B8)
  {
    v5 = sub_23A07DAB4((uint64_t *)(a1 + 56));
    v6 = v5;
    if (*(char *)(v5 + 23) < 0)
      operator delete(*(void **)v5);
    MEMORY[0x23B83FE88](v6, 0x1012C40EC159624);
  }
  result = (uint64_t *)(a1 + 64);
  if (*(uint64_t **)(a1 + 64) != &qword_2569425B8)
  {
    v8 = sub_23A07DAB4(result);
    v9 = v8;
    if (*(char *)(v8 + 23) < 0)
      operator delete(*(void **)v8);
    result = (uint64_t *)MEMORY[0x23B83FE88](v9, 0x1012C40EC159624);
  }
  v11 = *(uint64_t **)(a1 + 72);
  v10 = (uint64_t *)(a1 + 72);
  if (v11 != &qword_2569425B8)
  {
    v12 = sub_23A07DAB4(v10);
    v13 = v12;
    if (*(char *)(v12 + 23) < 0)
      operator delete(*(void **)v12);
    return (uint64_t *)MEMORY[0x23B83FE88](v13, 0x1012C40EC159624);
  }
  return result;
}

void sub_23A082564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A082580(uint64_t a1)
{
  return sub_23A0823E0(a1 - 16);
}

void sub_23A082588(uint64_t a1)
{
  sub_23A0823E0(a1);
  JUMPOUT(0x23B83FE88);
}

void sub_23A0825AC(uint64_t a1)
{
  sub_23A0823E0(a1 - 16);
  JUMPOUT(0x23B83FE88);
}

unsigned __int8 *sub_23A0825D4(uint64_t a1)
{
  unsigned __int8 *result;
  int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  result = sub_23A08FDF0((unsigned __int8 *)(a1 + 24));
  v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 7) != 0)
  {
    if ((v3 & 1) == 0)
    {
      if ((v3 & 2) == 0)
        goto LABEL_4;
LABEL_10:
      v5 = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v5 + 23) < 0)
      {
        **(_BYTE **)v5 = 0;
        *(_QWORD *)(v5 + 8) = 0;
        if ((v3 & 4) == 0)
          goto LABEL_17;
      }
      else
      {
        *(_BYTE *)v5 = 0;
        *(_BYTE *)(v5 + 23) = 0;
        if ((v3 & 4) == 0)
          goto LABEL_17;
      }
      goto LABEL_14;
    }
    v4 = *(_QWORD *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 23) < 0)
    {
      **(_BYTE **)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
      if ((v3 & 2) != 0)
        goto LABEL_10;
    }
    else
    {
      *(_BYTE *)v4 = 0;
      *(_BYTE *)(v4 + 23) = 0;
      if ((v3 & 2) != 0)
        goto LABEL_10;
    }
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_17;
LABEL_14:
    v6 = *(_QWORD *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 23) < 0)
    {
      **(_BYTE **)v6 = 0;
      *(_QWORD *)(v6 + 8) = 0;
    }
    else
    {
      *(_BYTE *)v6 = 0;
      *(_BYTE *)(v6 + 23) = 0;
    }
  }
LABEL_17:
  if ((v3 & 0x78) != 0)
    *(_DWORD *)(a1 + 80) = 16843008;
  *(_DWORD *)(a1 + 48) = 0;
  v7 = *(_QWORD *)(a1 + 8);
  if ((v7 & 1) != 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v8 + 31) < 0)
    {
      **(_BYTE **)(v8 + 8) = 0;
      *(_QWORD *)(v8 + 16) = 0;
    }
    else
    {
      *(_BYTE *)(v8 + 8) = 0;
      *(_BYTE *)(v8 + 31) = 0;
    }
  }
  return result;
}

uint64_t sub_23A0826E0(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  int v5;
  _QWORD *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  char *v23;
  uint64_t v24;
  int v25;
  char *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  std::string *v30;
  void *v31;
  BOOL v32;
  std::string *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42[2];

  *(_QWORD *)v42 = a2;
  v5 = 0;
  if ((sub_23A07DB84((uint64_t)a3, (char **)v42, a3[11].i32[1]) & 1) == 0)
  {
    v7 = (_QWORD *)(a1 + 8);
    while (1)
    {
      v8 = (char *)(*(_QWORD *)v42 + 1);
      v9 = **(_BYTE **)v42;
      if ((char)**(_BYTE **)v42 < 0)
      {
        v10 = v9 + (*v8 << 7);
        v9 = v10 - 128;
        if (*v8 < 0)
        {
          v17 = sub_23A09801C(*(uint64_t *)v42, v10 - 128);
          *(_QWORD *)v42 = v17;
          if (!v17)
            goto LABEL_67;
          v8 = (char *)v17;
          v9 = v18;
          goto LABEL_8;
        }
        v8 = (char *)(*(_QWORD *)v42 + 2);
      }
      *(_QWORD *)v42 = v8;
LABEL_8:
      switch(v9 >> 3)
      {
        case 1u:
          if (v9 != 10)
            goto LABEL_48;
          *(_DWORD *)(a1 + 48) |= 1u;
          v11 = *(_QWORD *)(a1 + 8);
          v12 = (_QWORD *)(v11 & 0xFFFFFFFFFFFFFFFELL);
          if ((v11 & 1) != 0)
            v12 = (_QWORD *)*v12;
          v13 = (uint64_t *)(a1 + 56);
          goto LABEL_44;
        case 2u:
          if (v9 != 18)
            goto LABEL_48;
          *(_DWORD *)(a1 + 48) |= 2u;
          v19 = *(_QWORD *)(a1 + 8);
          v12 = (_QWORD *)(v19 & 0xFFFFFFFFFFFFFFFELL);
          if ((v19 & 1) != 0)
            v12 = (_QWORD *)*v12;
          v13 = (uint64_t *)(a1 + 64);
          goto LABEL_44;
        case 3u:
          if (v9 != 24)
            goto LABEL_48;
          v5 |= 0x10u;
          v20 = v8 + 1;
          v21 = *v8;
          if ((*v8 & 0x80000000) == 0)
            goto LABEL_29;
          v22 = *v20;
          v21 = v21 + (v22 << 7) - 128;
          if (v22 < 0)
          {
            v36 = sub_23A097FD4((uint64_t)v8, v21);
            *(_QWORD *)v42 = v36;
            *(_BYTE *)(a1 + 81) = v37 != 0;
            if (!v36)
              goto LABEL_67;
          }
          else
          {
            v20 = v8 + 2;
LABEL_29:
            *(_QWORD *)v42 = v20;
            *(_BYTE *)(a1 + 81) = v21 != 0;
          }
          goto LABEL_46;
        case 4u:
          if (v9 != 32)
            goto LABEL_48;
          v5 |= 0x20u;
          v23 = v8 + 1;
          v24 = *v8;
          if ((*v8 & 0x80000000) == 0)
            goto LABEL_34;
          v25 = *v23;
          v24 = v24 + (v25 << 7) - 128;
          if (v25 < 0)
          {
            v38 = sub_23A097FD4((uint64_t)v8, v24);
            *(_QWORD *)v42 = v38;
            *(_BYTE *)(a1 + 82) = v39 != 0;
            if (!v38)
              goto LABEL_67;
          }
          else
          {
            v23 = v8 + 2;
LABEL_34:
            *(_QWORD *)v42 = v23;
            *(_BYTE *)(a1 + 82) = v24 != 0;
          }
          goto LABEL_46;
        case 5u:
          if (v9 != 40)
            goto LABEL_48;
          v5 |= 0x40u;
          v26 = v8 + 1;
          v27 = *v8;
          if ((*v8 & 0x80000000) == 0)
            goto LABEL_39;
          v28 = *v26;
          v27 = v27 + (v28 << 7) - 128;
          if (v28 < 0)
          {
            v40 = sub_23A097FD4((uint64_t)v8, v27);
            *(_QWORD *)v42 = v40;
            *(_BYTE *)(a1 + 83) = v41 != 0;
            if (!v40)
              goto LABEL_67;
          }
          else
          {
            v26 = v8 + 2;
LABEL_39:
            *(_QWORD *)v42 = v26;
            *(_BYTE *)(a1 + 83) = v27 != 0;
          }
          goto LABEL_46;
        case 6u:
          if (v9 != 50)
            goto LABEL_48;
          *(_DWORD *)(a1 + 48) |= 4u;
          v29 = *(_QWORD *)(a1 + 8);
          v12 = (_QWORD *)(v29 & 0xFFFFFFFFFFFFFFFELL);
          if ((v29 & 1) != 0)
            v12 = (_QWORD *)*v12;
          v13 = (uint64_t *)(a1 + 72);
LABEL_44:
          v30 = (std::string *)sub_23A08ACE4(v13, (uint64_t)v12);
          v31 = (void *)sub_23A0980D0(v30, *(char **)v42, (uint64_t)a3);
          goto LABEL_45;
        default:
          if (v9 >> 3 == 200 && v9 == 64)
          {
            v5 |= 8u;
            v14 = v8 + 1;
            v15 = *v8;
            if ((*v8 & 0x80000000) == 0)
              goto LABEL_18;
            v16 = *v14;
            v15 = v15 + (v16 << 7) - 128;
            if ((v16 & 0x80000000) == 0)
            {
              v14 = v8 + 2;
LABEL_18:
              *(_QWORD *)v42 = v14;
              *(_BYTE *)(a1 + 80) = v15 != 0;
              goto LABEL_46;
            }
            v34 = sub_23A097FD4((uint64_t)v8, v15);
            *(_QWORD *)v42 = v34;
            *(_BYTE *)(a1 + 80) = v35 != 0;
            if (!v34)
              goto LABEL_67;
          }
          else
          {
LABEL_48:
            if (v9)
              v32 = (v9 & 7) == 4;
            else
              v32 = 1;
            if (v32)
            {
              a3[10].i32[0] = v9 - 1;
              goto LABEL_2;
            }
            if (v9 < 0x648)
            {
              if ((*v7 & 1) != 0)
              {
                v33 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
              }
              else
              {
                v33 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
                v8 = *(char **)v42;
              }
              v31 = sub_23A0984FC(v9, v33, v8, a3);
            }
            else
            {
              v31 = sub_23A091390((uint64_t *)(a1 + 24), v9, (unsigned __int8 *)v8, (uint64_t)&unk_2569424B0, (unint64_t *)(a1 + 8), a3);
            }
LABEL_45:
            *(_QWORD *)v42 = v31;
            if (!v31)
            {
LABEL_67:
              *(_QWORD *)v42 = 0;
              goto LABEL_2;
            }
          }
LABEL_46:
          if ((sub_23A07DB84((uint64_t)a3, (char **)v42, a3[11].i32[1]) & 1) != 0)
            goto LABEL_2;
          break;
      }
    }
  }
LABEL_2:
  *(_DWORD *)(a1 + 48) |= v5;
  return *(_QWORD *)v42;
}

char *sub_23A082ADC(uint64_t a1, char *a2, unint64_t *a3)
{
  char *v4;
  int v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a2;
  v6 = *(_DWORD *)(a1 + 48);
  if ((v6 & 1) != 0)
  {
    v4 = sub_23A07BF08(a3, 1, *(_QWORD *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL, a2);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  v4 = sub_23A07BF08(a3, 2, *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL, v4);
  if ((v6 & 0x10) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_11:
  if (*a3 <= (unint64_t)v4)
    v4 = sub_23A08B364((uint64_t)a3, v4);
  v7 = *(_BYTE *)(a1 + 81);
  *v4 = 24;
  v4[1] = v7;
  v4 += 2;
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_14:
  if (*a3 <= (unint64_t)v4)
    v4 = sub_23A08B364((uint64_t)a3, v4);
  v8 = *(_BYTE *)(a1 + 82);
  *v4 = 32;
  v4[1] = v8;
  v4 += 2;
  if ((v6 & 0x40) == 0)
  {
LABEL_6:
    if ((v6 & 4) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_17:
  if (*a3 <= (unint64_t)v4)
    v4 = sub_23A08B364((uint64_t)a3, v4);
  v9 = *(_BYTE *)(a1 + 83);
  *v4 = 40;
  v4[1] = v9;
  v4 += 2;
  if ((v6 & 4) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0)
      goto LABEL_24;
    goto LABEL_21;
  }
LABEL_20:
  v4 = sub_23A07BF08(a3, 6, *(_QWORD *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL, v4);
  if ((v6 & 8) == 0)
    goto LABEL_24;
LABEL_21:
  if (*a3 <= (unint64_t)v4)
    v4 = sub_23A08B364((uint64_t)a3, v4);
  v10 = *(_BYTE *)(a1 + 80);
  *(_WORD *)v4 = 3264;
  v4[2] = v10;
  v4 += 3;
LABEL_24:
  v11 = sub_23A091FC4(a1 + 24, 201, 0x20000000, v4, (uint64_t *)a3);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 8);
  if ((v13 & 1) == 0)
    return v12;
  v15 = v13 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v15 + 31) < 0)
  {
    v16 = *(void **)(v15 + 8);
    v17 = *(_QWORD *)(v15 + 16);
  }
  else
  {
    v16 = (void *)(v15 + 8);
    LODWORD(v17) = *(unsigned __int8 *)(v15 + 31);
  }
  if ((uint64_t)(*a3 - (_QWORD)v11) >= (int)v17)
  {
    v18 = (int)v17;
    memcpy(v11, v16, (int)v17);
    v12 += v18;
    return v12;
  }
  return sub_23A08B474((uint64_t *)a3, (char *)v16, v17, (unint64_t)v11);
}

uint64_t sub_23A082CDC(uint64_t a1)
{
  uint64_t result;
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  result = sub_23A094B58(a1 + 24);
  v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 0x7F) == 0)
    goto LABEL_17;
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_4;
LABEL_22:
    v12 = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL;
    v13 = *(unsigned __int8 *)(v12 + 23);
    v14 = *(_QWORD *)(v12 + 8);
    if ((v13 & 0x80u) == 0)
      v14 = v13;
    result += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v3 & 4) == 0)
      goto LABEL_8;
    goto LABEL_5;
  }
  v9 = *(_QWORD *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
  v10 = *(unsigned __int8 *)(v9 + 23);
  v11 = *(_QWORD *)(v9 + 8);
  if ((v10 & 0x80u) == 0)
    v11 = v10;
  result += v11 + ((9 * (__clz(v11 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v3 & 2) != 0)
    goto LABEL_22;
LABEL_4:
  if ((v3 & 4) != 0)
  {
LABEL_5:
    v4 = *(_QWORD *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL;
    v5 = *(unsigned __int8 *)(v4 + 23);
    v6 = *(_QWORD *)(v4 + 8);
    if ((v5 & 0x80u) == 0)
      v6 = v5;
    result += v6 + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_8:
  v7 = result + 3;
  if ((v3 & 8) == 0)
    v7 = result;
  if ((v3 & 0x10) != 0)
    v7 += 2;
  if ((v3 & 0x20) != 0)
    v7 += 2;
  if ((v3 & 0x40) != 0)
    result = v7 + 2;
  else
    result = v7;
LABEL_17:
  v8 = *(_QWORD *)(a1 + 8);
  if ((v8 & 1) != 0)
  {
    v15 = v8 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v15 + 31) < 0)
      v16 = *(_QWORD *)(v15 + 16);
    else
      v16 = *(unsigned __int8 *)(v15 + 31);
    result += v16;
  }
  *(_DWORD *)(a1 + 52) = result;
  return result;
}

void sub_23A082E40(uint64_t a1, uint64_t (***a2)(), uint64_t a3)
{
  if (*a2 != &off_250B0C9F0)
    sub_23A07E458(a1, (uint64_t)a2, a3);
  sub_23A082E68(a1, (uint64_t)a2);
}

void sub_23A082E68(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  std::string *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  int v13;
  __int128 *v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 *v17;
  uint64_t v18;
  _QWORD *v19;
  __int128 *v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  std::string v24[2];

  if (a2 == a1)
  {
    sub_23A08BD88((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2246);
    v4 = sub_23A08BDA0(v24, "CHECK failed: (&from) != (this): ");
    sub_23A08BED0((uint64_t)&v23, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v24);
  }
  sub_23A08FE8C(a1 + 24, a2 + 24);
  v5 = *(_QWORD *)(a2 + 8);
  if ((v5 & 1) != 0)
  {
    v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & 1) != 0)
      v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    else
      v9 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
    v10 = *(char *)(v6 + 31);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)v7;
    else
      v11 = *(const std::string::value_type **)(v6 + 8);
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(v6 + 31);
    else
      v12 = *(_QWORD *)(v6 + 16);
    std::string::append(v9, v11, v12);
  }
  v13 = *(_DWORD *)(a2 + 48);
  if ((v13 & 0x7F) != 0)
  {
    if ((v13 & 1) != 0)
    {
      v14 = (__int128 *)(*(_QWORD *)(a2 + 56) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 48) |= 1u;
      v15 = *(_QWORD *)(a1 + 8);
      v16 = (_QWORD *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if ((v15 & 1) != 0)
        v16 = (_QWORD *)*v16;
      sub_23A08ACAC((uint64_t *)(a1 + 56), v14, (uint64_t)v16);
      if ((v13 & 2) == 0)
      {
LABEL_16:
        if ((v13 & 4) == 0)
          goto LABEL_17;
        goto LABEL_30;
      }
    }
    else if ((v13 & 2) == 0)
    {
      goto LABEL_16;
    }
    v17 = (__int128 *)(*(_QWORD *)(a2 + 64) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 48) |= 2u;
    v18 = *(_QWORD *)(a1 + 8);
    v19 = (_QWORD *)(v18 & 0xFFFFFFFFFFFFFFFELL);
    if ((v18 & 1) != 0)
      v19 = (_QWORD *)*v19;
    sub_23A08ACAC((uint64_t *)(a1 + 64), v17, (uint64_t)v19);
    if ((v13 & 4) == 0)
    {
LABEL_17:
      if ((v13 & 8) == 0)
        goto LABEL_18;
      goto LABEL_33;
    }
LABEL_30:
    v20 = (__int128 *)(*(_QWORD *)(a2 + 72) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 48) |= 4u;
    v21 = *(_QWORD *)(a1 + 8);
    v22 = (_QWORD *)(v21 & 0xFFFFFFFFFFFFFFFELL);
    if ((v21 & 1) != 0)
      v22 = (_QWORD *)*v22;
    sub_23A08ACAC((uint64_t *)(a1 + 72), v20, (uint64_t)v22);
    if ((v13 & 8) == 0)
    {
LABEL_18:
      if ((v13 & 0x10) == 0)
        goto LABEL_19;
      goto LABEL_34;
    }
LABEL_33:
    *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
    if ((v13 & 0x10) == 0)
    {
LABEL_19:
      if ((v13 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_35;
    }
LABEL_34:
    *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
    if ((v13 & 0x20) == 0)
    {
LABEL_20:
      if ((v13 & 0x40) == 0)
      {
LABEL_22:
        *(_DWORD *)(a1 + 48) |= v13;
        return;
      }
LABEL_21:
      *(_BYTE *)(a1 + 83) = *(_BYTE *)(a2 + 83);
      goto LABEL_22;
    }
LABEL_35:
    *(_BYTE *)(a1 + 82) = *(_BYTE *)(a2 + 82);
    if ((v13 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
}

void sub_23A083030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A083048(uint64_t a1)
{
  return sub_23A09105C(a1 + 24);
}

_QWORD *sub_23A083050@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "sentencepiece.NormalizerSpec");
}

uint64_t sub_23A083060(uint64_t a1)
{
  sub_23A083090(a1);
  sub_23A07B7E8((uint64_t *)(a1 + 8));
  return a1;
}

uint64_t *sub_23A083090(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  std::string *v4;
  uint64_t *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  std::string v13[2];

  v2 = *(_QWORD *)(a1 + 8);
  v3 = (_QWORD *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2362);
    v4 = sub_23A08BDA0(v13, "CHECK failed: GetArena() == nullptr: ");
    sub_23A08BED0((uint64_t)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v13);
  }
LABEL_4:
  result = (uint64_t *)(a1 + 24);
  if (*(uint64_t **)(a1 + 24) != &qword_2569425B8)
  {
    v6 = sub_23A07DAB4(result);
    v7 = v6;
    if (*(char *)(v6 + 23) < 0)
      operator delete(*(void **)v6);
    result = (uint64_t *)MEMORY[0x23B83FE88](v7, 0x1012C40EC159624);
  }
  v9 = *(uint64_t **)(a1 + 32);
  v8 = (uint64_t *)(a1 + 32);
  if (v9 != &qword_2569425B8)
  {
    v10 = sub_23A07DAB4(v8);
    v11 = v10;
    if (*(char *)(v10 + 23) < 0)
      operator delete(*(void **)v10);
    return (uint64_t *)MEMORY[0x23B83FE88](v11, 0x1012C40EC159624);
  }
  return result;
}

void sub_23A08319C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A0831B8(uint64_t a1)
{
  sub_23A083060(a1);
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A0831DC(uint64_t result)
{
  int v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_DWORD *)(result + 16);
  if ((v1 & 3) != 0)
  {
    if ((v1 & 1) != 0)
    {
      v2 = *(_QWORD *)(result + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v2 + 23) < 0)
      {
        **(_BYTE **)v2 = 0;
        *(_QWORD *)(v2 + 8) = 0;
        if ((v1 & 2) == 0)
          goto LABEL_11;
        goto LABEL_6;
      }
      *(_BYTE *)v2 = 0;
      *(_BYTE *)(v2 + 23) = 0;
    }
    if ((v1 & 2) == 0)
      goto LABEL_11;
LABEL_6:
    v3 = *(_QWORD *)(result + 32) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v3 + 23) < 0)
    {
      **(_BYTE **)v3 = 0;
      *(_QWORD *)(v3 + 8) = 0;
    }
    else
    {
      *(_BYTE *)v3 = 0;
      *(_BYTE *)(v3 + 23) = 0;
    }
  }
LABEL_11:
  *(_DWORD *)(result + 16) = 0;
  v4 = *(_QWORD *)(result + 8);
  if ((v4 & 1) != 0)
  {
    v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v5 + 31) < 0)
    {
      **(_BYTE **)(v5 + 8) = 0;
      *(_QWORD *)(v5 + 16) = 0;
    }
    else
    {
      *(_BYTE *)(v5 + 8) = 0;
      *(_BYTE *)(v5 + 31) = 0;
    }
  }
  return result;
}

uint64_t sub_23A083278(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  _QWORD *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v11;
  std::string *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  std::string *v18;
  uint64_t v19;
  unsigned int v20;
  int v21[2];

  *(_QWORD *)v21 = a2;
  if ((sub_23A07DB84((uint64_t)a3, (char **)v21, a3[11].i32[1]) & 1) == 0)
  {
    v6 = (_QWORD *)(a1 + 8);
    while (1)
    {
      v7 = (char *)(*(_QWORD *)v21 + 1);
      v8 = **(_BYTE **)v21;
      if (((char)**(_BYTE **)v21 & 0x80000000) == 0)
        goto LABEL_7;
      v9 = v8 + (*v7 << 7);
      v8 = v9 - 128;
      if ((*v7 & 0x80000000) == 0)
        break;
      v19 = sub_23A09801C(*(uint64_t *)v21, v9 - 128);
      *(_QWORD *)v21 = v19;
      if (!v19)
      {
LABEL_35:
        *(_QWORD *)v21 = 0;
        return *(_QWORD *)v21;
      }
      v7 = (char *)v19;
      v8 = v20;
LABEL_8:
      if (v8 >> 3 == 2)
      {
        if (v8 == 18)
        {
          *(_DWORD *)(a1 + 16) |= 2u;
          v14 = *(_QWORD *)(a1 + 8);
          v15 = (_QWORD *)(v14 & 0xFFFFFFFFFFFFFFFELL);
          if ((v14 & 1) != 0)
            v15 = (_QWORD *)*v15;
          v16 = (uint64_t *)(a1 + 32);
          goto LABEL_27;
        }
      }
      else if (v8 >> 3 == 1 && v8 == 10)
      {
        *(_DWORD *)(a1 + 16) |= 1u;
        v17 = *(_QWORD *)(a1 + 8);
        v15 = (_QWORD *)(v17 & 0xFFFFFFFFFFFFFFFELL);
        if ((v17 & 1) != 0)
          v15 = (_QWORD *)*v15;
        v16 = (uint64_t *)(a1 + 24);
LABEL_27:
        v18 = (std::string *)sub_23A08ACE4(v16, (uint64_t)v15);
        v13 = (void *)sub_23A0980D0(v18, *(char **)v21, (uint64_t)a3);
        goto LABEL_28;
      }
      if (v8)
        v11 = (v8 & 7) == 4;
      else
        v11 = 1;
      if (v11)
      {
        a3[10].i32[0] = v8 - 1;
        return *(_QWORD *)v21;
      }
      if ((*v6 & 1) != 0)
      {
        v12 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else
      {
        v12 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
        v7 = *(char **)v21;
      }
      v13 = sub_23A0984FC(v8, v12, v7, a3);
LABEL_28:
      *(_QWORD *)v21 = v13;
      if (!v13)
        goto LABEL_35;
      if ((sub_23A07DB84((uint64_t)a3, (char **)v21, a3[11].i32[1]) & 1) != 0)
        return *(_QWORD *)v21;
    }
    v7 = (char *)(*(_QWORD *)v21 + 2);
LABEL_7:
    *(_QWORD *)v21 = v7;
    goto LABEL_8;
  }
  return *(_QWORD *)v21;
}

char *sub_23A083420(uint64_t a1, char *__dst, unint64_t *a3)
{
  char *v4;
  int v6;
  uint64_t v7;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = __dst;
  v6 = *(_DWORD *)(a1 + 16);
  if ((v6 & 1) != 0)
    v4 = sub_23A07BF08(a3, 1, *(_QWORD *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL, __dst);
  if ((v6 & 2) != 0)
    v4 = sub_23A07BF08(a3, 2, *(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFFFFELL, v4);
  v7 = *(_QWORD *)(a1 + 8);
  if ((v7 & 1) == 0)
    return v4;
  v9 = v7 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v9 + 31) < 0)
  {
    v10 = *(void **)(v9 + 8);
    v11 = *(_QWORD *)(v9 + 16);
  }
  else
  {
    v10 = (void *)(v9 + 8);
    LODWORD(v11) = *(unsigned __int8 *)(v9 + 31);
  }
  if ((uint64_t)(*a3 - (_QWORD)v4) >= (int)v11)
  {
    v12 = (int)v11;
    memcpy(v4, v10, (int)v11);
    v4 += v12;
    return v4;
  }
  return sub_23A08B474((uint64_t *)a3, (char *)v10, v11, (unint64_t)v4);
}

uint64_t sub_23A0834F8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  uint64_t v12;

  v1 = *(_DWORD *)(a1 + 16);
  if ((v1 & 3) == 0)
  {
    v2 = 0;
    goto LABEL_12;
  }
  if ((v1 & 1) == 0)
  {
    v2 = 0;
    if ((v1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_9;
  }
  v3 = *(_QWORD *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL;
  v4 = *(unsigned __int8 *)(v3 + 23);
  v5 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x80u) == 0)
    v5 = v4;
  v2 = v5 + ((9 * (__clz(v5 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v1 & 2) != 0)
  {
LABEL_9:
    v6 = *(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFFFFELL;
    v7 = *(unsigned __int8 *)(v6 + 23);
    v8 = *(_QWORD *)(v6 + 8);
    if ((v7 & 0x80u) == 0)
      v8 = v7;
    v2 += v8 + ((9 * (__clz(v8 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_12:
  v9 = *(_QWORD *)(a1 + 8);
  if ((v9 & 1) != 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v11 + 31) < 0)
      v12 = *(_QWORD *)(v11 + 16);
    else
      v12 = *(unsigned __int8 *)(v11 + 31);
    v2 += v12;
  }
  *(_DWORD *)(a1 + 20) = v2;
  return v2;
}

unint64_t sub_23A0835D0(unint64_t a1, uint64_t (***a2)(), uint64_t a3)
{
  if (*a2 != &off_250B0CB50)
    sub_23A07E458(a1, (uint64_t)a2, a3);
  return sub_23A0835F8(a1, (uint64_t)a2);
}

unint64_t sub_23A0835F8(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  std::string *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  std::string *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  int v13;
  __int128 *v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 *v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  std::string v21[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2516);
    v4 = sub_23A08BDA0(v21, "CHECK failed: (&from) != (this): ");
    sub_23A08BED0((uint64_t)&v20, (const char **)&v4->__r_.__value_.__l.__data_);
    result = sub_23A08BED8((uint64_t)v21);
  }
  v5 = *(_QWORD *)(a2 + 8);
  if ((v5 & 1) != 0)
  {
    v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    v8 = *(_QWORD *)(v3 + 8);
    if ((v8 & 1) != 0)
      v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    else
      v9 = (std::string *)sub_23A07DCC0((unint64_t *)(v3 + 8));
    v10 = *(char *)(v6 + 31);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)v7;
    else
      v11 = *(const std::string::value_type **)(v6 + 8);
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(v6 + 31);
    else
      v12 = *(_QWORD *)(v6 + 16);
    result = (unint64_t)std::string::append(v9, v11, v12);
  }
  v13 = *(_DWORD *)(a2 + 16);
  if ((v13 & 3) != 0)
  {
    if ((v13 & 1) != 0)
    {
      v14 = (__int128 *)(*(_QWORD *)(a2 + 24) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(v3 + 16) |= 1u;
      v15 = *(_QWORD *)(v3 + 8);
      v16 = (_QWORD *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if ((v15 & 1) != 0)
        v16 = (_QWORD *)*v16;
      result = sub_23A08ACAC((uint64_t *)(v3 + 24), v14, (uint64_t)v16);
    }
    if ((v13 & 2) != 0)
    {
      v17 = (__int128 *)(*(_QWORD *)(a2 + 32) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(v3 + 16) |= 2u;
      v18 = *(_QWORD *)(v3 + 8);
      v19 = (_QWORD *)(v18 & 0xFFFFFFFFFFFFFFFELL);
      if ((v18 & 1) != 0)
        v19 = (_QWORD *)*v19;
      return sub_23A08ACAC((uint64_t *)(v3 + 32), v17, (uint64_t)v19);
    }
  }
  return result;
}

void sub_23A083728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A083740()
{
  return 1;
}

_QWORD *sub_23A083748@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "sentencepiece.SelfTestData.Sample");
}

uint64_t sub_23A083758(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = &off_250B0C880;
  *(_QWORD *)(a1 + 8) = a2;
  sub_23A08C324(a1 + 16, a2);
  *(_QWORD *)(a1 + 40) = a2;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  if (atomic_load(dword_2569413E0))
    sub_23A096744(dword_2569413E0);
  return a1;
}

void sub_23A0837CC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t *v2;

  sub_23A087050(v2);
  sub_23A08C400(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23A0837E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  v3 = (uint64_t *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 8);
  v4 = (_QWORD *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) != 0)
  {
    if (!*v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2589);
    v5 = sub_23A08BDA0(v8, "CHECK failed: GetArena() == nullptr: ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
LABEL_4:
  sub_23A07B7E8(v3);
  sub_23A087050((uint64_t *)(a1 + 40));
  sub_23A08C400(a1 + 16);
  return a1;
}

void sub_23A083884(void *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  sub_23A08A288(a1);
}

void sub_23A0838A8(uint64_t a1)
{
  sub_23A0837E8(a1);
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A0838CC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;

  sub_23A08FDF0((unsigned __int8 *)(a1 + 16));
  result = sub_23A086CF4(a1 + 40);
  v3 = *(_QWORD *)(a1 + 8);
  if ((v3 & 1) != 0)
  {
    v4 = v3 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 31) < 0)
    {
      **(_BYTE **)(v4 + 8) = 0;
      *(_QWORD *)(v4 + 16) = 0;
    }
    else
    {
      *(_BYTE *)(v4 + 8) = 0;
      *(_BYTE *)(v4 + 31) = 0;
    }
  }
  return result;
}

char *sub_23A083924(uint64_t a1, char *a2, int32x2_t *a3)
{
  _QWORD *v5;
  char *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned __int8 *v10;
  char *v11;
  unsigned __int8 *v12;
  int *v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  std::string *v19;
  char *v20;
  unsigned int v21;
  char *v23;

  v23 = a2;
  if ((sub_23A07DB84((uint64_t)a3, &v23, a3[11].i32[1]) & 1) == 0)
  {
    v5 = (_QWORD *)(a1 + 8);
    while (1)
    {
      v6 = v23 + 1;
      v7 = *v23;
      if ((*v23 & 0x80000000) == 0)
        goto LABEL_6;
      v8 = v7 + (*v6 << 7);
      v7 = v8 - 128;
      if ((*v6 & 0x80000000) == 0)
        break;
      v20 = (char *)sub_23A09801C((uint64_t)v23, v8 - 128);
      v23 = v20;
      if (!v20)
        return 0;
      v6 = v20;
      v7 = v21;
LABEL_7:
      if (v7 == 10)
      {
        v11 = v6 - 1;
        while (1)
        {
          v12 = (unsigned __int8 *)(v11 + 1);
          v23 = v11 + 1;
          v13 = *(int **)(a1 + 56);
          if (!v13)
            break;
          v14 = *(int *)(a1 + 48);
          v15 = *v13;
          if ((int)v14 >= *v13)
          {
            if (v15 == *(_DWORD *)(a1 + 52))
            {
LABEL_20:
              sub_23A09D128(a1 + 40, v15 + 1);
              v13 = *(int **)(a1 + 56);
              v15 = *v13;
            }
            *v13 = v15 + 1;
            v16 = sub_23A085EC0(*(_QWORD *)(a1 + 40));
            v17 = *(_QWORD *)(a1 + 56);
            v18 = *(int *)(a1 + 48);
            *(_DWORD *)(a1 + 48) = v18 + 1;
            *(_QWORD *)(v17 + 8 * v18 + 8) = v16;
            v12 = (unsigned __int8 *)v23;
            goto LABEL_22;
          }
          *(_DWORD *)(a1 + 48) = v14 + 1;
          v16 = *(_QWORD **)&v13[2 * v14 + 2];
LABEL_22:
          v11 = (char *)sub_23A083B38(a3, (uint64_t)v16, v12);
          v23 = v11;
          if (!v11)
            return 0;
          if (*(_QWORD *)a3 <= (unint64_t)v11 || *v11 != 10)
            goto LABEL_30;
        }
        v15 = *(_DWORD *)(a1 + 52);
        goto LABEL_20;
      }
      if (v7)
        v9 = (v7 & 7) == 4;
      else
        v9 = 1;
      if (v9)
      {
        a3[10].i32[0] = v7 - 1;
        return v23;
      }
      if (v7 < 0x640)
      {
        if ((*v5 & 1) != 0)
        {
          v19 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else
        {
          v19 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
          v6 = v23;
        }
        v10 = sub_23A0984FC(v7, v19, v6, a3);
      }
      else
      {
        v10 = sub_23A091390((uint64_t *)(a1 + 16), v7, (unsigned __int8 *)v6, (uint64_t)&unk_256942468, (unint64_t *)(a1 + 8), a3);
      }
      v23 = (char *)v10;
      if (!v10)
        return 0;
LABEL_30:
      if (sub_23A07DB84((uint64_t)a3, &v23, a3[11].i32[1]))
        return v23;
    }
    v6 = v23 + 2;
LABEL_6:
    v23 = v6;
    goto LABEL_7;
  }
  return v23;
}

uint64_t sub_23A083B38(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = (char)*a3;
  v7 = *a3;
  if (v6 < 0)
  {
    result = sub_23A098060((uint64_t)a3, v7);
    if (!result)
      return result;
    v8 = result;
    v7 = v10;
  }
  else
  {
    v8 = (uint64_t)(a3 + 1);
  }
  v11 = sub_23A07DFA4((uint64_t)a1, v8, v7);
  v12 = a1[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = sub_23A083278(a2, v8, a1);
  if (!result)
    return result;
  ++a1[11].i32[0];
  if (a1[10].i32[0])
    return 0;
  v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(_QWORD *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

char *sub_23A083BFC(uint64_t a1, char *a2, unint64_t *a3)
{
  int v6;
  int i;
  uint64_t v8;
  unsigned int v9;
  char *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_DWORD *)(a1 + 48);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*a3 <= (unint64_t)a2)
        a2 = sub_23A08B364((uint64_t)a3, a2);
      v8 = sub_23A086A7C(a1 + 40, i);
      *a2 = 10;
      v9 = *(_DWORD *)(v8 + 20);
      if (v9 > 0x7F)
      {
        a2[1] = v9 | 0x80;
        v11 = v9 >> 7;
        if (v9 >> 14)
        {
          v10 = a2 + 3;
          do
          {
            *(v10 - 1) = v11 | 0x80;
            v12 = v11 >> 7;
            ++v10;
            v13 = v11 >> 14;
            v11 >>= 7;
          }
          while (v13);
          *(v10 - 1) = v12;
        }
        else
        {
          a2[2] = v11;
          v10 = a2 + 3;
        }
      }
      else
      {
        a2[1] = v9;
        v10 = a2 + 2;
      }
      a2 = sub_23A083420(v8, v10, a3);
    }
  }
  v14 = sub_23A091FC4(a1 + 16, 200, 0x20000000, a2, (uint64_t *)a3);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if ((v16 & 1) == 0)
    return v15;
  v18 = v16 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v18 + 31) < 0)
  {
    v19 = *(void **)(v18 + 8);
    v20 = *(_QWORD *)(v18 + 16);
  }
  else
  {
    v19 = (void *)(v18 + 8);
    LODWORD(v20) = *(unsigned __int8 *)(v18 + 31);
  }
  if ((uint64_t)(*a3 - (_QWORD)v14) >= (int)v20)
  {
    v21 = (int)v20;
    memcpy(v14, v19, (int)v20);
    v15 += v21;
    return v15;
  }
  return sub_23A08B474((uint64_t *)a3, (char *)v19, v20, (unint64_t)v14);
}

uint64_t sub_23A083D80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;

  v2 = sub_23A094B58(a1 + 16);
  v3 = *(int *)(a1 + 48);
  v4 = v2 + v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    v6 = (uint64_t *)(v5 + 8);
  else
    v6 = 0;
  if ((_DWORD)v3)
  {
    v7 = 8 * v3;
    do
    {
      v8 = *v6++;
      v9 = sub_23A0834F8(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  v10 = *(_QWORD *)(a1 + 8);
  if ((v10 & 1) != 0)
  {
    v12 = v10 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v12 + 31) < 0)
      v13 = *(_QWORD *)(v12 + 16);
    else
      v13 = *(unsigned __int8 *)(v12 + 31);
    v4 += v13;
  }
  *(_DWORD *)(a1 + 64) = v4;
  return v4;
}

unint64_t sub_23A083E2C(uint64_t a1, uint64_t (***a2)(), uint64_t a3)
{
  if (*a2 != &off_250B0C880)
    sub_23A07E458(a1, (uint64_t)a2, a3);
  return sub_23A083E54(a1, (uint64_t)a2);
}

unint64_t sub_23A083E54(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  std::string *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  char v14;
  std::string v15[2];

  if (a2 == a1)
  {
    sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2724);
    v4 = sub_23A08BDA0(v15, "CHECK failed: (&from) != (this): ");
    sub_23A08BED0((uint64_t)&v14, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v15);
  }
  sub_23A08FE8C(a1 + 16, a2 + 16);
  v5 = *(_QWORD *)(a2 + 8);
  if ((v5 & 1) != 0)
  {
    v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & 1) != 0)
      v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    else
      v9 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
    v10 = *(char *)(v6 + 31);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)v7;
    else
      v11 = *(const std::string::value_type **)(v6 + 8);
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(v6 + 31);
    else
      v12 = *(_QWORD *)(v6 + 16);
    std::string::append(v9, v11, v12);
  }
  return sub_23A0870F4(a1 + 40, a2 + 40);
}

void sub_23A083F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A083F40(uint64_t a1)
{
  return sub_23A09105C(a1 + 16);
}

_QWORD *sub_23A083F48@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "sentencepiece.SelfTestData");
}

_QWORD *sub_23A083F58(_QWORD *a1, uint64_t a2)
{
  *a1 = &off_250B0CF78;
  a1[1] = a2;
  sub_23A08C324((uint64_t)(a1 + 2), a2);
  a1[5] = 0;
  if (atomic_load(dword_256941360))
    sub_23A096744(dword_256941360);
  a1[6] = &qword_2569425B8;
  a1[7] = 0x100000000;
  return a1;
}

void sub_23A083FC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23A08C400(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23A083FD8(uint64_t a1)
{
  sub_23A084010(a1);
  sub_23A07B7E8((uint64_t *)(a1 + 8));
  sub_23A08C400(a1 + 16);
  return a1;
}

uint64_t sub_23A084010(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  std::string *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  std::string v10[2];

  v1 = result;
  v2 = *(_QWORD *)(result + 8);
  v3 = (_QWORD *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 2813);
    v4 = sub_23A08BDA0(v10, "CHECK failed: GetArena() == nullptr: ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = sub_23A08BED8((uint64_t)v10);
  }
LABEL_4:
  v6 = *(uint64_t **)(v1 + 48);
  v5 = (uint64_t *)(v1 + 48);
  if (v6 != &qword_2569425B8)
  {
    v7 = sub_23A07DAB4(v5);
    v8 = v7;
    if (*(char *)(v7 + 23) < 0)
      operator delete(*(void **)v7);
    return MEMORY[0x23B83FE88](v8, 0x1012C40EC159624);
  }
  return result;
}

void sub_23A0840D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A0840F0(uint64_t a1)
{
  sub_23A083FD8(a1);
  JUMPOUT(0x23B83FE88);
}

unsigned __int8 *sub_23A084114(uint64_t a1)
{
  unsigned __int8 *result;
  int v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  result = sub_23A08FDF0((unsigned __int8 *)(a1 + 16));
  v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 23) < 0)
    {
      **(_BYTE **)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)v4 = 0;
      *(_BYTE *)(v4 + 23) = 0;
    }
  }
  if ((v3 & 6) != 0)
    *(_QWORD *)(a1 + 56) = 0x100000000;
  *(_DWORD *)(a1 + 40) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  if ((v5 & 1) != 0)
  {
    v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 31) < 0)
    {
      **(_BYTE **)(v6 + 8) = 0;
      *(_QWORD *)(v6 + 16) = 0;
    }
    else
    {
      *(_BYTE *)(v6 + 8) = 0;
      *(_BYTE *)(v6 + 31) = 0;
    }
  }
  return result;
}

uint64_t sub_23A0841A8(uint64_t a1, uint64_t a2, int32x2_t *a3)
{
  int v5;
  _QWORD *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v13;
  void *v14;
  char *v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  std::string *v21;
  uint64_t v22;
  unsigned int v23;
  std::string *v24;
  unint64_t v25;
  std::string *v26;
  int v27[2];

  *(_QWORD *)v27 = a2;
  v5 = 0;
  if ((sub_23A07DB84((uint64_t)a3, (char **)v27, a3[11].i32[1]) & 1) == 0)
  {
    v7 = (_QWORD *)(a1 + 8);
    while (1)
    {
      v8 = (char *)(*(_QWORD *)v27 + 1);
      v9 = **(_BYTE **)v27;
      if (((char)**(_BYTE **)v27 & 0x80000000) == 0)
        goto LABEL_7;
      v10 = v9 + (*v8 << 7);
      v9 = v10 - 128;
      if ((*v8 & 0x80000000) == 0)
        break;
      v22 = sub_23A09801C(*(uint64_t *)v27, v10 - 128);
      *(_QWORD *)v27 = v22;
      if (!v22)
        goto LABEL_48;
      v8 = (char *)v22;
      v9 = v23;
LABEL_8:
      v11 = v9 >> 3;
      if (v9 >> 3 == 3)
      {
        if (v9 == 24)
        {
          v15 = v8 + 1;
          v16 = *v8;
          if ((*v8 & 0x80000000) == 0)
            goto LABEL_24;
          v17 = *v15;
          v18 = v16 + (v17 << 7);
          v16 = (v18 - 128);
          if (v17 < 0)
          {
            *(_QWORD *)v27 = sub_23A097FD4((uint64_t)v8, (v18 - 128));
            if (!*(_QWORD *)v27)
            {
LABEL_48:
              *(_QWORD *)v27 = 0;
              goto LABEL_2;
            }
            v16 = v25;
          }
          else
          {
            v15 = v8 + 2;
LABEL_24:
            *(_QWORD *)v27 = v15;
          }
          if ((v16 - 1) > 5)
          {
            if ((*v7 & 1) != 0)
              v26 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
            else
              v26 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
            sub_23A097ED4(3, v16, v26);
          }
          else
          {
            *(_DWORD *)(a1 + 40) |= 4u;
            *(_DWORD *)(a1 + 60) = v16;
          }
          goto LABEL_38;
        }
      }
      else if (v11 == 2)
      {
        if (v9 == 21)
        {
          v5 |= 2u;
          *(_DWORD *)(a1 + 56) = *(_DWORD *)v8;
          *(_QWORD *)v27 = v8 + 4;
          goto LABEL_38;
        }
      }
      else if (v11 == 1 && v9 == 10)
      {
        *(_DWORD *)(a1 + 40) |= 1u;
        v19 = *(_QWORD *)(a1 + 8);
        v20 = (_QWORD *)(v19 & 0xFFFFFFFFFFFFFFFELL);
        if ((v19 & 1) != 0)
          v20 = (_QWORD *)*v20;
        v21 = (std::string *)sub_23A08ACE4((uint64_t *)(a1 + 48), (uint64_t)v20);
        v14 = (void *)sub_23A0980D0(v21, *(char **)v27, (uint64_t)a3);
        goto LABEL_37;
      }
      if (v9)
        v13 = (v9 & 7) == 4;
      else
        v13 = 1;
      if (v13)
      {
        a3[10].i32[0] = v9 - 1;
        goto LABEL_2;
      }
      if (v9 < 0x640)
      {
        if ((*v7 & 1) != 0)
        {
          v24 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else
        {
          v24 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
          v8 = *(char **)v27;
        }
        v14 = sub_23A0984FC(v9, v24, v8, a3);
      }
      else
      {
        v14 = sub_23A091390((uint64_t *)(a1 + 16), v9, (unsigned __int8 *)v8, (uint64_t)qword_256942530, (unint64_t *)(a1 + 8), a3);
      }
LABEL_37:
      *(_QWORD *)v27 = v14;
      if (!v14)
        goto LABEL_48;
LABEL_38:
      if ((sub_23A07DB84((uint64_t)a3, (char **)v27, a3[11].i32[1]) & 1) != 0)
        goto LABEL_2;
    }
    v8 = (char *)(*(_QWORD *)v27 + 2);
LABEL_7:
    *(_QWORD *)v27 = v8;
    goto LABEL_8;
  }
LABEL_2:
  *(_DWORD *)(a1 + 40) |= v5;
  return *(_QWORD *)v27;
}

char *sub_23A08442C(uint64_t a1, char *a2, unint64_t *a3)
{
  char *v4;
  int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2;
  v6 = *(_DWORD *)(a1 + 40);
  if ((v6 & 1) != 0)
  {
    v4 = sub_23A07BF08(a3, 1, *(_QWORD *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL, a2);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_18;
      goto LABEL_9;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  if (*a3 <= (unint64_t)v4)
    v4 = sub_23A08B364((uint64_t)a3, v4);
  v7 = *(_DWORD *)(a1 + 56);
  *v4 = 21;
  *(_DWORD *)(v4 + 1) = v7;
  v4 += 5;
  if ((v6 & 4) != 0)
  {
LABEL_9:
    if (*a3 <= (unint64_t)v4)
      v4 = sub_23A08B364((uint64_t)a3, v4);
    v8 = *(int *)(a1 + 60);
    *v4 = 24;
    if (v8 > 0x7F)
    {
      v4[1] = v8 | 0x80;
      v9 = v8 >> 7;
      if (v8 >> 14)
      {
        v4 += 3;
        do
        {
          *(v4 - 1) = v9 | 0x80;
          v10 = v9 >> 7;
          ++v4;
          v11 = v9 >> 14;
          v9 >>= 7;
        }
        while (v11);
        *(v4 - 1) = v10;
      }
      else
      {
        v4[2] = v9;
        v4 += 3;
      }
    }
    else
    {
      v4[1] = v8;
      v4 += 2;
    }
  }
LABEL_18:
  v12 = sub_23A091FC4(a1 + 16, 200, 0x20000000, v4, (uint64_t *)a3);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 8);
  if ((v14 & 1) == 0)
    return v13;
  v16 = v14 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v16 + 31) < 0)
  {
    v17 = *(void **)(v16 + 8);
    v18 = *(_QWORD *)(v16 + 16);
  }
  else
  {
    v17 = (void *)(v16 + 8);
    LODWORD(v18) = *(unsigned __int8 *)(v16 + 31);
  }
  if ((uint64_t)(*a3 - (_QWORD)v12) >= (int)v18)
  {
    v19 = (int)v18;
    memcpy(v12, v17, (int)v18);
    v13 += v19;
    return v13;
  }
  return sub_23A08B474((uint64_t *)a3, (char *)v17, v18, (unint64_t)v12);
}

uint64_t sub_23A0845C4(uint64_t a1)
{
  uint64_t result;
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  result = sub_23A094B58(a1 + 16);
  v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 7) != 0)
  {
    if ((v3 & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
      v5 = *(unsigned __int8 *)(v4 + 23);
      v6 = *(_QWORD *)(v4 + 8);
      if ((v5 & 0x80u) == 0)
        v6 = v5;
      result += v6 + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6) + 1;
    }
    if ((v3 & 2) != 0)
      result += 5;
    if ((v3 & 4) != 0)
    {
      v7 = *(_DWORD *)(a1 + 60);
      if (v7 < 0)
        v8 = 11;
      else
        v8 = ((9 * (__clz(v7 | 1) ^ 0x1F) + 73) >> 6) + 1;
      result += v8;
    }
  }
  v9 = *(_QWORD *)(a1 + 8);
  if ((v9 & 1) != 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v10 + 31) < 0)
      v11 = *(_QWORD *)(v10 + 16);
    else
      v11 = *(unsigned __int8 *)(v10 + 31);
    result += v11;
  }
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

void sub_23A0846A4(uint64_t a1, uint64_t (***a2)(), uint64_t a3)
{
  if (*a2 != &off_250B0CF78)
    sub_23A07E458(a1, (uint64_t)a2, a3);
  sub_23A0846CC(a1, (uint64_t)a2);
}

void sub_23A0846CC(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  std::string *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  int v13;
  __int128 *v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  std::string v18[2];

  if (a2 == a1)
  {
    sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3001);
    v4 = sub_23A08BDA0(v18, "CHECK failed: (&from) != (this): ");
    sub_23A08BED0((uint64_t)&v17, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v18);
  }
  sub_23A08FE8C(a1 + 16, a2 + 16);
  v5 = *(_QWORD *)(a2 + 8);
  if ((v5 & 1) != 0)
  {
    v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & 1) != 0)
      v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    else
      v9 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
    v10 = *(char *)(v6 + 31);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)v7;
    else
      v11 = *(const std::string::value_type **)(v6 + 8);
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(v6 + 31);
    else
      v12 = *(_QWORD *)(v6 + 16);
    std::string::append(v9, v11, v12);
  }
  v13 = *(_DWORD *)(a2 + 40);
  if ((v13 & 7) != 0)
  {
    if ((v13 & 1) != 0)
    {
      v14 = (__int128 *)(*(_QWORD *)(a2 + 48) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 40) |= 1u;
      v15 = *(_QWORD *)(a1 + 8);
      v16 = (_QWORD *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if ((v15 & 1) != 0)
        v16 = (_QWORD *)*v16;
      sub_23A08ACAC((uint64_t *)(a1 + 48), v14, (uint64_t)v16);
      if ((v13 & 2) == 0)
      {
LABEL_16:
        if ((v13 & 4) == 0)
        {
LABEL_18:
          *(_DWORD *)(a1 + 40) |= v13;
          return;
        }
LABEL_17:
        *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
        goto LABEL_18;
      }
    }
    else if ((v13 & 2) == 0)
    {
      goto LABEL_16;
    }
    *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
    if ((v13 & 4) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
}

void sub_23A084804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08481C(uint64_t a1)
{
  return sub_23A09105C(a1 + 16);
}

_QWORD *sub_23A084824@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "sentencepiece.ModelProto.SentencePiece");
}

uint64_t sub_23A084834(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = &off_250B0C5B0;
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = &unk_250B0C6C8;
  sub_23A08C324(a1 + 24, a2);
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  if (atomic_load(dword_256941378))
    sub_23A096744(dword_256941378);
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return a1;
}

void sub_23A0848B8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t *v2;

  sub_23A08729C(v2);
  sub_23A08C400(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23A0848D8(uint64_t a1)
{
  sub_23A084918(a1);
  sub_23A07B7E8((uint64_t *)(a1 + 8));
  sub_23A08729C((uint64_t *)(a1 + 56));
  sub_23A08C400(a1 + 24);
  return a1;
}

uint64_t sub_23A084918(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  std::string *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  std::string v13[2];

  v1 = result;
  v2 = *(_QWORD *)(result + 8);
  v3 = (_QWORD *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  if ((v2 & 1) == 0)
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (*v3)
  {
LABEL_3:
    sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3145);
    v4 = sub_23A08BDA0(v13, "CHECK failed: GetArena() == nullptr: ");
    sub_23A08BED0((uint64_t)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    result = sub_23A08BED8((uint64_t)v13);
  }
LABEL_4:
  if ((_UNKNOWN *)v1 != &unk_2569422B0)
  {
    v5 = *(uint64_t **)(v1 + 80);
    if (v5)
    {
      v6 = sub_23A07E810(v5);
      MEMORY[0x23B83FE88](v6, 0x10A1C4074230EEALL);
    }
    v7 = *(_QWORD *)(v1 + 88);
    if (v7)
    {
      v8 = sub_23A0823E0(v7);
      MEMORY[0x23B83FE88](v8, 0x10A1C402CDD3876);
    }
    v9 = *(_QWORD *)(v1 + 96);
    if (v9)
    {
      v10 = sub_23A0837E8(v9);
      MEMORY[0x23B83FE88](v10, 0x10A1C4075D007F8);
    }
    result = *(_QWORD *)(v1 + 104);
    if (result)
    {
      v11 = sub_23A0823E0(result);
      return MEMORY[0x23B83FE88](v11, 0x10A1C402CDD3876);
    }
  }
  return result;
}

void sub_23A084A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A084A40(uint64_t a1)
{
  return sub_23A0848D8(a1 - 16);
}

void sub_23A084A48(uint64_t a1)
{
  sub_23A0848D8(a1);
  JUMPOUT(0x23B83FE88);
}

void sub_23A084A6C(uint64_t a1)
{
  sub_23A0848D8(a1 - 16);
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A084A94(uint64_t a1)
{
  uint64_t result;
  int v3;
  uint64_t v4;
  std::string *v5;
  uint64_t v6;
  std::string *v7;
  uint64_t v8;
  std::string *v9;
  uint64_t v10;
  std::string *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  std::string v15[2];

  sub_23A08FDF0((unsigned __int8 *)(a1 + 24));
  result = (uint64_t)sub_23A086DA0((unsigned __int8 *)(a1 + 56));
  v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 0xF) != 0)
  {
    if ((v3 & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 80);
      if (!v4)
      {
        sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3178);
        v5 = sub_23A08BDA0(v15, "CHECK failed: trainer_spec_ != nullptr: ");
        sub_23A08BED0((uint64_t)&v14, (const char **)&v5->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v15);
        v4 = *(_QWORD *)(a1 + 80);
      }
      result = sub_23A07EB60(v4);
    }
    if ((v3 & 2) != 0)
    {
      v6 = *(_QWORD *)(a1 + 88);
      if (!v6)
      {
        sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3182);
        v7 = sub_23A08BDA0(v15, "CHECK failed: normalizer_spec_ != nullptr: ");
        sub_23A08BED0((uint64_t)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v15);
        v6 = *(_QWORD *)(a1 + 88);
      }
      result = (uint64_t)sub_23A0825D4(v6);
    }
    if ((v3 & 4) != 0)
    {
      v8 = *(_QWORD *)(a1 + 96);
      if (!v8)
      {
        sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3186);
        v9 = sub_23A08BDA0(v15, "CHECK failed: self_test_data_ != nullptr: ");
        sub_23A08BED0((uint64_t)&v14, (const char **)&v9->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v15);
        v8 = *(_QWORD *)(a1 + 96);
      }
      result = sub_23A0838CC(v8);
    }
    if ((v3 & 8) != 0)
    {
      v10 = *(_QWORD *)(a1 + 104);
      if (!v10)
      {
        sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3190);
        v11 = sub_23A08BDA0(v15, "CHECK failed: denormalizer_spec_ != nullptr: ");
        sub_23A08BED0((uint64_t)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v15);
        v10 = *(_QWORD *)(a1 + 104);
      }
      result = (uint64_t)sub_23A0825D4(v10);
    }
  }
  *(_DWORD *)(a1 + 48) = 0;
  v12 = *(_QWORD *)(a1 + 8);
  if ((v12 & 1) != 0)
  {
    v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v13 + 31) < 0)
    {
      **(_BYTE **)(v13 + 8) = 0;
      *(_QWORD *)(v13 + 16) = 0;
    }
    else
    {
      *(_BYTE *)(v13 + 8) = 0;
      *(_BYTE *)(v13 + 31) = 0;
    }
  }
  return result;
}

void sub_23A084C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A084C74(uint64_t a1, char *a2, int32x2_t *a3)
{
  _QWORD *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  unsigned __int8 *v11;
  int *v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  BOOL v26;
  char *v27;
  unsigned int v28;
  std::string *v29;
  char *v30;

  v30 = a2;
  if ((sub_23A07DB84((uint64_t)a3, &v30, a3[11].i32[1]) & 1) == 0)
  {
    v6 = (_QWORD *)(a1 + 8);
    while (2)
    {
      v7 = v30 + 1;
      v8 = *v30;
      if (*v30 < 0)
      {
        v9 = v8 + (*v7 << 7);
        v8 = v9 - 128;
        if (*v7 < 0)
        {
          v27 = (char *)sub_23A09801C((uint64_t)v30, v9 - 128);
          v30 = v27;
          if (!v27)
            return 0;
          v7 = v27;
          v8 = v28;
LABEL_8:
          switch(v8 >> 3)
          {
            case 1u:
              if (v8 != 10)
                goto LABEL_49;
              v10 = v7 - 1;
              break;
            case 2u:
              if (v8 != 18)
                goto LABEL_49;
              *(_DWORD *)(a1 + 48) |= 1u;
              v18 = *(_QWORD *)(a1 + 80);
              if (!v18)
              {
                v19 = (_QWORD *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
                if ((*v6 & 1) != 0)
                  v19 = (_QWORD *)*v19;
                v18 = sub_23A085D58((uint64_t)v19);
                *(_QWORD *)(a1 + 80) = v18;
                v7 = v30;
              }
              v20 = (char *)sub_23A0850B0(a3, v18, (unsigned __int8 *)v7);
              goto LABEL_46;
            case 3u:
              if (v8 != 26)
                goto LABEL_49;
              *(_DWORD *)(a1 + 48) |= 2u;
              v21 = *(_QWORD *)(a1 + 88);
              if (v21)
                goto LABEL_45;
              v22 = (_QWORD *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
              if ((*v6 & 1) != 0)
                v22 = (_QWORD *)*v22;
              v21 = sub_23A085E0C((uint64_t)v22);
              *(_QWORD *)(a1 + 88) = v21;
              goto LABEL_44;
            case 4u:
              if (v8 != 34)
                goto LABEL_49;
              *(_DWORD *)(a1 + 48) |= 4u;
              v23 = *(_QWORD *)(a1 + 96);
              if (!v23)
              {
                v24 = (_QWORD *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
                if ((*v6 & 1) != 0)
                  v24 = (_QWORD *)*v24;
                v23 = sub_23A085FCC((uint64_t)v24);
                *(_QWORD *)(a1 + 96) = v23;
                v7 = v30;
              }
              v20 = (char *)sub_23A085238(a3, v23, v7);
              goto LABEL_46;
            case 5u:
              if (v8 != 42)
                goto LABEL_49;
              *(_DWORD *)(a1 + 48) |= 8u;
              v21 = *(_QWORD *)(a1 + 104);
              if (v21)
                goto LABEL_45;
              v25 = (_QWORD *)(*v6 & 0xFFFFFFFFFFFFFFFELL);
              if ((*v6 & 1) != 0)
                v25 = (_QWORD *)*v25;
              v21 = sub_23A085E0C((uint64_t)v25);
              *(_QWORD *)(a1 + 104) = v21;
LABEL_44:
              v7 = v30;
LABEL_45:
              v20 = (char *)sub_23A085174(a3, v21, (unsigned __int8 *)v7);
              goto LABEL_46;
            default:
LABEL_49:
              if (v8)
                v26 = (v8 & 7) == 4;
              else
                v26 = 1;
              if (v26)
              {
                a3[10].i32[0] = v8 - 1;
                return v30;
              }
              if (v8 < 0x640)
              {
                if ((*v6 & 1) != 0)
                {
                  v29 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
                }
                else
                {
                  v29 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
                  v7 = v30;
                }
                v20 = (char *)sub_23A0984FC(v8, v29, v7, a3);
              }
              else
              {
                v20 = (char *)sub_23A091390((uint64_t *)(a1 + 24), v8, (unsigned __int8 *)v7, (uint64_t)&unk_2569422B0, (unint64_t *)(a1 + 8), a3);
              }
LABEL_46:
              v30 = v20;
              if (!v20)
                return 0;
LABEL_47:
              if ((sub_23A07DB84((uint64_t)a3, &v30, a3[11].i32[1]) & 1) != 0)
                return v30;
              continue;
          }
          while (1)
          {
            v11 = (unsigned __int8 *)(v10 + 1);
            v30 = v10 + 1;
            v12 = *(int **)(a1 + 72);
            if (!v12)
              break;
            v13 = *(int *)(a1 + 64);
            v14 = *v12;
            if ((int)v13 >= *v12)
            {
              if (v14 == *(_DWORD *)(a1 + 68))
              {
LABEL_16:
                sub_23A09D128(a1 + 56, v14 + 1);
                v12 = *(int **)(a1 + 72);
                v14 = *v12;
              }
              *v12 = v14 + 1;
              v15 = sub_23A086080(*(_QWORD *)(a1 + 56));
              v16 = *(_QWORD *)(a1 + 72);
              v17 = *(int *)(a1 + 64);
              *(_DWORD *)(a1 + 64) = v17 + 1;
              *(_QWORD *)(v16 + 8 * v17 + 8) = v15;
              v11 = (unsigned __int8 *)v30;
              goto LABEL_18;
            }
            *(_DWORD *)(a1 + 64) = v13 + 1;
            v15 = *(_QWORD **)&v12[2 * v13 + 2];
LABEL_18:
            v10 = (char *)sub_23A084FEC(a3, (uint64_t)v15, v11);
            v30 = v10;
            if (!v10)
              return 0;
            if (*(_QWORD *)a3 <= (unint64_t)v10 || *v10 != 10)
              goto LABEL_47;
          }
          v14 = *(_DWORD *)(a1 + 68);
          goto LABEL_16;
        }
        v7 = v30 + 2;
      }
      break;
    }
    v30 = v7;
    goto LABEL_8;
  }
  return v30;
}

uint64_t sub_23A084FEC(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = (char)*a3;
  v7 = *a3;
  if (v6 < 0)
  {
    result = sub_23A098060((uint64_t)a3, v7);
    if (!result)
      return result;
    v8 = result;
    v7 = v10;
  }
  else
  {
    v8 = (uint64_t)(a3 + 1);
  }
  v11 = sub_23A07DFA4((uint64_t)a1, v8, v7);
  v12 = a1[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = sub_23A0841A8(a2, v8, a1);
  if (!result)
    return result;
  ++a1[11].i32[0];
  if (a1[10].i32[0])
    return 0;
  v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(_QWORD *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

uint64_t sub_23A0850B0(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = (char)*a3;
  v7 = *a3;
  if (v6 < 0)
  {
    result = sub_23A098060((uint64_t)a3, v7);
    if (!result)
      return result;
    v8 = result;
    v7 = v10;
  }
  else
  {
    v8 = (uint64_t)(a3 + 1);
  }
  v11 = sub_23A07DFA4((uint64_t)a1, v8, v7);
  v12 = a1[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = (uint64_t)sub_23A07EE24(a2, v8, a1);
  if (!result)
    return result;
  ++a1[11].i32[0];
  if (a1[10].i32[0])
    return 0;
  v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(_QWORD *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

uint64_t sub_23A085174(int32x2_t *a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = (char)*a3;
  v7 = *a3;
  if (v6 < 0)
  {
    result = sub_23A098060((uint64_t)a3, v7);
    if (!result)
      return result;
    v8 = result;
    v7 = v10;
  }
  else
  {
    v8 = (uint64_t)(a3 + 1);
  }
  v11 = sub_23A07DFA4((uint64_t)a1, v8, v7);
  v12 = a1[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = sub_23A0826E0(a2, v8, a1);
  if (!result)
    return result;
  ++a1[11].i32[0];
  if (a1[10].i32[0])
    return 0;
  v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(_QWORD *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

uint64_t sub_23A085238(int32x2_t *a1, uint64_t a2, char *a3)
{
  int v6;
  unsigned int v7;
  char *v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = *a3;
  v7 = *a3;
  if (v6 < 0)
  {
    result = sub_23A098060((uint64_t)a3, v7);
    if (!result)
      return result;
    v8 = (char *)result;
    v7 = v10;
  }
  else
  {
    v8 = a3 + 1;
  }
  v11 = sub_23A07DFA4((uint64_t)a1, (int)v8, v7);
  v12 = a1[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a1[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = (uint64_t)sub_23A083924(a2, v8, a1);
  if (!result)
    return result;
  ++a1[11].i32[0];
  if (a1[10].i32[0])
    return 0;
  v15 = a1[3].i32[1] + v14;
  a1[3].i32[1] = v15;
  *a1 = (int32x2_t)(*(_QWORD *)&a1[1] + (v15 & (v15 >> 31)));
  return result;
}

char *sub_23A0852FC(uint64_t a1, char *a2, unint64_t *a3)
{
  int v6;
  int i;
  uint64_t v8;
  unsigned int v9;
  char *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  char *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  char *v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  char *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;

  v6 = *(_DWORD *)(a1 + 64);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*a3 <= (unint64_t)a2)
        a2 = sub_23A08B364((uint64_t)a3, a2);
      v8 = sub_23A05E530(a1 + 56, i);
      *a2 = 10;
      v9 = *(_DWORD *)(v8 + 44);
      if (v9 > 0x7F)
      {
        a2[1] = v9 | 0x80;
        v11 = v9 >> 7;
        if (v9 >> 14)
        {
          v10 = a2 + 3;
          do
          {
            *(v10 - 1) = v11 | 0x80;
            v12 = v11 >> 7;
            ++v10;
            v13 = v11 >> 14;
            v11 >>= 7;
          }
          while (v13);
          *(v10 - 1) = v12;
        }
        else
        {
          a2[2] = v11;
          v10 = a2 + 3;
        }
      }
      else
      {
        a2[1] = v9;
        v10 = a2 + 2;
      }
      a2 = sub_23A08442C(v8, v10, a3);
    }
  }
  v14 = *(_DWORD *)(a1 + 48);
  if ((v14 & 1) != 0)
  {
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v15 = *(_QWORD *)(a1 + 80);
    *a2 = 18;
    v16 = *(_DWORD *)(v15 + 48);
    if (v16 > 0x7F)
    {
      a2[1] = v16 | 0x80;
      v18 = v16 >> 7;
      if (v16 >> 14)
      {
        v17 = a2 + 3;
        do
        {
          *(v17 - 1) = v18 | 0x80;
          v19 = v18 >> 7;
          ++v17;
          v20 = v18 >> 14;
          v18 >>= 7;
        }
        while (v20);
        *(v17 - 1) = v19;
      }
      else
      {
        a2[2] = v18;
        v17 = a2 + 3;
      }
    }
    else
    {
      a2[1] = v16;
      v17 = a2 + 2;
    }
    a2 = sub_23A08033C(v15, v17, (uint64_t *)a3);
    if ((v14 & 2) == 0)
    {
LABEL_15:
      if ((v14 & 4) == 0)
        goto LABEL_16;
      goto LABEL_38;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_15;
  }
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v21 = *(_QWORD *)(a1 + 88);
  *a2 = 26;
  v22 = *(_DWORD *)(v21 + 52);
  if (v22 > 0x7F)
  {
    a2[1] = v22 | 0x80;
    v24 = v22 >> 7;
    if (v22 >> 14)
    {
      v23 = a2 + 3;
      do
      {
        *(v23 - 1) = v24 | 0x80;
        v25 = v24 >> 7;
        ++v23;
        v26 = v24 >> 14;
        v24 >>= 7;
      }
      while (v26);
      *(v23 - 1) = v25;
    }
    else
    {
      a2[2] = v24;
      v23 = a2 + 3;
    }
  }
  else
  {
    a2[1] = v22;
    v23 = a2 + 2;
  }
  a2 = sub_23A082ADC(v21, v23, a3);
  if ((v14 & 4) == 0)
  {
LABEL_16:
    if ((v14 & 8) == 0)
      goto LABEL_58;
    goto LABEL_48;
  }
LABEL_38:
  if (*a3 <= (unint64_t)a2)
    a2 = sub_23A08B364((uint64_t)a3, a2);
  v27 = *(_QWORD *)(a1 + 96);
  *a2 = 34;
  v28 = *(_DWORD *)(v27 + 64);
  if (v28 > 0x7F)
  {
    a2[1] = v28 | 0x80;
    v30 = v28 >> 7;
    if (v28 >> 14)
    {
      v29 = a2 + 3;
      do
      {
        *(v29 - 1) = v30 | 0x80;
        v31 = v30 >> 7;
        ++v29;
        v32 = v30 >> 14;
        v30 >>= 7;
      }
      while (v32);
      *(v29 - 1) = v31;
    }
    else
    {
      a2[2] = v30;
      v29 = a2 + 3;
    }
  }
  else
  {
    a2[1] = v28;
    v29 = a2 + 2;
  }
  a2 = sub_23A083BFC(v27, v29, a3);
  if ((v14 & 8) != 0)
  {
LABEL_48:
    if (*a3 <= (unint64_t)a2)
      a2 = sub_23A08B364((uint64_t)a3, a2);
    v33 = *(_QWORD *)(a1 + 104);
    *a2 = 42;
    v34 = *(_DWORD *)(v33 + 52);
    if (v34 > 0x7F)
    {
      a2[1] = v34 | 0x80;
      v36 = v34 >> 7;
      if (v34 >> 14)
      {
        v35 = a2 + 3;
        do
        {
          *(v35 - 1) = v36 | 0x80;
          v37 = v36 >> 7;
          ++v35;
          v38 = v36 >> 14;
          v36 >>= 7;
        }
        while (v38);
        *(v35 - 1) = v37;
      }
      else
      {
        a2[2] = v36;
        v35 = a2 + 3;
      }
    }
    else
    {
      a2[1] = v34;
      v35 = a2 + 2;
    }
    a2 = sub_23A082ADC(v33, v35, a3);
  }
LABEL_58:
  v39 = sub_23A091FC4(a1 + 24, 200, 0x20000000, a2, (uint64_t *)a3);
  v40 = v39;
  v41 = *(_QWORD *)(a1 + 8);
  if ((v41 & 1) == 0)
    return v40;
  v43 = v41 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v43 + 31) < 0)
  {
    v44 = *(void **)(v43 + 8);
    v45 = *(_QWORD *)(v43 + 16);
  }
  else
  {
    v44 = (void *)(v43 + 8);
    LODWORD(v45) = *(unsigned __int8 *)(v43 + 31);
  }
  if ((uint64_t)(*a3 - (_QWORD)v39) >= (int)v45)
  {
    v46 = (int)v45;
    memcpy(v39, v44, (int)v45);
    v40 += v46;
    return v40;
  }
  return sub_23A08B474((uint64_t *)a3, (char *)v44, v45, (unint64_t)v39);
}

uint64_t sub_23A0856F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v2 = sub_23A094B58(a1 + 24);
  v3 = *(int *)(a1 + 64);
  v4 = v2 + v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
    v6 = (uint64_t *)(v5 + 8);
  else
    v6 = 0;
  if ((_DWORD)v3)
  {
    v7 = 8 * v3;
    do
    {
      v8 = *v6++;
      v9 = sub_23A0845C4(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  v10 = *(_DWORD *)(a1 + 48);
  if ((v10 & 0xF) == 0)
    goto LABEL_13;
  if ((v10 & 1) == 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_10;
LABEL_16:
    v15 = sub_23A082CDC(*(_QWORD *)(a1 + 88));
    v4 += v15 + ((9 * (__clz(v15 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  v14 = sub_23A0814F0(*(_QWORD *)(a1 + 80));
  v4 += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_10:
  if ((v10 & 4) == 0)
    goto LABEL_11;
LABEL_17:
  v16 = sub_23A083D80(*(_QWORD *)(a1 + 96));
  v4 += v16 + ((9 * (__clz(v16 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v10 & 8) != 0)
  {
LABEL_12:
    v11 = sub_23A082CDC(*(_QWORD *)(a1 + 104));
    v4 += v11 + ((9 * (__clz(v11 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_13:
  v12 = *(_QWORD *)(a1 + 8);
  if ((v12 & 1) != 0)
  {
    v17 = v12 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v17 + 31) < 0)
      v18 = *(_QWORD *)(v17 + 16);
    else
      v18 = *(unsigned __int8 *)(v17 + 31);
    v4 += v18;
  }
  *(_DWORD *)(a1 + 52) = v4;
  return v4;
}

void sub_23A08587C(uint64_t a1, uint64_t (***a2)(), uint64_t a3)
{
  if (*a2 != &off_250B0C5B0)
    sub_23A07E458(a1, (uint64_t)a2, a3);
  sub_23A0858A4(a1, (uint64_t)a2);
}

void sub_23A0858A4(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  int v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  char v26;
  std::string v27[2];

  if (a2 == a1)
  {
    sub_23A08BD88((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.cc", 3397);
    v4 = sub_23A08BDA0(v27, "CHECK failed: (&from) != (this): ");
    sub_23A08BED0((uint64_t)&v26, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v27);
  }
  sub_23A08FE8C(a1 + 24, a2 + 24);
  v5 = (_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a2 + 8);
  if ((v6 & 1) != 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    v8 = (v6 & 0xFFFFFFFFFFFFFFFELL) + 8;
    if ((*v5 & 1) != 0)
      v9 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
    else
      v9 = (std::string *)sub_23A07DCC0((unint64_t *)(a1 + 8));
    v10 = *(char *)(v7 + 31);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)v8;
    else
      v11 = *(const std::string::value_type **)(v7 + 8);
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(v7 + 31);
    else
      v12 = *(_QWORD *)(v7 + 16);
    std::string::append(v9, v11, v12);
  }
  sub_23A087340(a1 + 56, a2 + 56);
  v13 = *(_DWORD *)(a2 + 48);
  if ((v13 & 0xF) != 0)
  {
    if ((v13 & 1) != 0)
    {
      *(_DWORD *)(a1 + 48) |= 1u;
      v14 = *(_QWORD *)(a1 + 80);
      if (!v14)
      {
        v15 = (_QWORD *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
        if ((*v5 & 1) != 0)
          v15 = (_QWORD *)*v15;
        v14 = sub_23A085D58((uint64_t)v15);
        *(_QWORD *)(a1 + 80) = v14;
      }
      if (*(_QWORD *)(a2 + 80))
        v16 = *(void **)(a2 + 80);
      else
        v16 = &unk_256942320;
      sub_23A081DC4(v14, (uint64_t)v16);
    }
    if ((v13 & 2) != 0)
    {
      *(_DWORD *)(a1 + 48) |= 2u;
      v17 = *(_QWORD *)(a1 + 88);
      if (!v17)
      {
        v18 = (_QWORD *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
        if ((*v5 & 1) != 0)
          v18 = (_QWORD *)*v18;
        v17 = sub_23A085E0C((uint64_t)v18);
        *(_QWORD *)(a1 + 88) = v17;
      }
      if (*(_QWORD *)(a2 + 88))
        v19 = *(void **)(a2 + 88);
      else
        v19 = &unk_2569424B0;
      sub_23A082E68(v17, (uint64_t)v19);
      if ((v13 & 4) == 0)
      {
LABEL_25:
        if ((v13 & 8) == 0)
          return;
        goto LABEL_43;
      }
    }
    else if ((v13 & 4) == 0)
    {
      goto LABEL_25;
    }
    *(_DWORD *)(a1 + 48) |= 4u;
    v20 = *(_QWORD *)(a1 + 96);
    if (!v20)
    {
      v21 = (_QWORD *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
      if ((*v5 & 1) != 0)
        v21 = (_QWORD *)*v21;
      v20 = sub_23A085FCC((uint64_t)v21);
      *(_QWORD *)(a1 + 96) = v20;
    }
    if (*(_QWORD *)(a2 + 96))
      v22 = *(void **)(a2 + 96);
    else
      v22 = &unk_256942468;
    sub_23A083E54(v20, (uint64_t)v22);
    if ((v13 & 8) != 0)
    {
LABEL_43:
      *(_DWORD *)(a1 + 48) |= 8u;
      v23 = *(_QWORD *)(a1 + 104);
      if (!v23)
      {
        v24 = (_QWORD *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
        if ((*v5 & 1) != 0)
          v24 = (_QWORD *)*v24;
        v23 = sub_23A085E0C((uint64_t)v24);
        *(_QWORD *)(a1 + 104) = v23;
      }
      if (*(_QWORD *)(a2 + 104))
        v25 = *(void **)(a2 + 104);
      else
        v25 = &unk_2569424B0;
      sub_23A082E68(v23, (uint64_t)v25);
    }
  }
}

void sub_23A085AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A085ADC(uint64_t a1, uint64_t a2)
{
  if (a2 != a1)
  {
    sub_23A084A94(a1);
    sub_23A0858A4(a1, a2);
  }
}

uint64_t sub_23A085B14(uint64_t a1)
{
  uint64_t result;
  int v3;
  uint64_t v4;
  std::string *v5;
  uint64_t v6;
  std::string *v7;
  uint64_t v8;
  std::string *v9;
  uint64_t v10;
  std::string *v11;
  char v12;
  std::string v13[2];

  result = sub_23A09105C(a1 + 24);
  if (!(_DWORD)result)
    return result;
  result = sub_23A085CF4(a1 + 56);
  if (!(_DWORD)result)
    return result;
  v3 = *(_DWORD *)(a1 + 48);
  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 80);
    if (!v4)
    {
      sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4741);
      v5 = sub_23A08BDA0(v13, "CHECK failed: !value || trainer_spec_ != nullptr: ");
      sub_23A08BED0((uint64_t)&v12, (const char **)&v5->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v13);
      v4 = *(_QWORD *)(a1 + 80);
    }
    result = sub_23A09105C(v4 + 16);
    if (!(_DWORD)result)
      return result;
    v3 = *(_DWORD *)(a1 + 48);
  }
  if ((v3 & 2) != 0)
  {
    v6 = *(_QWORD *)(a1 + 88);
    if (!v6)
    {
      sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4824);
      v7 = sub_23A08BDA0(v13, "CHECK failed: !value || normalizer_spec_ != nullptr: ");
      sub_23A08BED0((uint64_t)&v12, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v13);
      v6 = *(_QWORD *)(a1 + 88);
    }
    result = sub_23A09105C(v6 + 24);
    if (!(_DWORD)result)
      return result;
    v3 = *(_DWORD *)(a1 + 48);
  }
  if ((v3 & 4) == 0)
  {
LABEL_18:
    if ((v3 & 8) == 0)
      return 1;
    v10 = *(_QWORD *)(a1 + 104);
    if (!v10)
    {
      sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4990);
      v11 = sub_23A08BDA0(v13, "CHECK failed: !value || denormalizer_spec_ != nullptr: ");
      sub_23A08BED0((uint64_t)&v12, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v13);
      v10 = *(_QWORD *)(a1 + 104);
    }
    result = sub_23A09105C(v10 + 24);
    if ((_DWORD)result)
      return 1;
    return result;
  }
  v8 = *(_QWORD *)(a1 + 96);
  if (!v8)
  {
    sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/builtin_pb/sentencepiece_model.pb.h", 4907);
    v9 = sub_23A08BDA0(v13, "CHECK failed: !value || self_test_data_ != nullptr: ");
    sub_23A08BED0((uint64_t)&v12, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v13);
    v8 = *(_QWORD *)(a1 + 96);
  }
  result = sub_23A09105C(v8 + 16);
  if ((_DWORD)result)
  {
    v3 = *(_DWORD *)(a1 + 48);
    goto LABEL_18;
  }
  return result;
}

void sub_23A085CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_23A085CF4(uint64_t a1)
{
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(_DWORD *)(a1 + 8);
  do
  {
    v3 = v2;
    v4 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v4)
      break;
    v5 = sub_23A05E530(a1, v2);
  }
  while ((sub_23A09105C(v5 + 16) & 1) != 0);
  return v3 < 1;
}

_QWORD *sub_23A085D48@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "sentencepiece.ModelProto");
}

uint64_t sub_23A085D58(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_250B0C098, 328);
    v2 = sub_23A08A880(a1, 328);
    sub_23A07E6B4(v2, a1);
  }
  else
  {
    v2 = operator new();
    sub_23A07E6B4(v2, 0);
  }
  return v2;
}

void sub_23A085DE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x10A1C4074230EEALL);
  _Unwind_Resume(a1);
}

uint64_t sub_23A085E0C(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_250B0C0E8, 88);
    v2 = sub_23A08A880(a1, 88);
    sub_23A08234C(v2, a1);
  }
  else
  {
    v2 = operator new();
    sub_23A08234C(v2, 0);
  }
  return v2;
}

void sub_23A085E9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x10A1C402CDD3876);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A085EC0(uint64_t a1)
{
  _QWORD *v2;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_250B0C148, 40);
    v2 = (_QWORD *)sub_23A08A880(a1, 40);
    *v2 = &off_250B0CB50;
    v2[1] = a1;
    v2[2] = 0;
    if (atomic_load(dword_2569413C8))
      goto LABEL_7;
  }
  else
  {
    v2 = (_QWORD *)operator new();
    *v2 = &off_250B0CB50;
    v2[1] = 0;
    v2[2] = 0;
    if (atomic_load(dword_2569413C8))
LABEL_7:
      sub_23A096744(dword_2569413C8);
  }
  v2[3] = &qword_2569425B8;
  v2[4] = &qword_2569425B8;
  return v2;
}

void sub_23A085FA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x1081C400F7E8713);
  _Unwind_Resume(a1);
}

uint64_t sub_23A085FCC(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_250B0C0B0, 72);
    v2 = sub_23A08A880(a1, 72);
    sub_23A083758(v2, a1);
  }
  else
  {
    v2 = operator new();
    sub_23A083758(v2, 0);
  }
  return v2;
}

void sub_23A08605C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x10A1C4075D007F8);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A086080(uint64_t a1)
{
  _QWORD *v2;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_250B0C1A0, 64);
    v2 = (_QWORD *)sub_23A08A880(a1, 64);
    sub_23A083F58(v2, a1);
  }
  else
  {
    v2 = (_QWORD *)operator new();
    sub_23A083F58(v2, 0);
  }
  return v2;
}

void sub_23A086110(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x10A1C40F497E4DALL);
  _Unwind_Resume(a1);
}

uint64_t sub_23A086134(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_250B0C028, 112);
    v2 = sub_23A08A880(a1, 112);
    sub_23A084834(v2, a1);
  }
  else
  {
    v2 = operator new();
    sub_23A084834(v2, 0);
  }
  return v2;
}

void sub_23A0861C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x10A1C4047CE62CFLL);
  _Unwind_Resume(a1);
}

uint64_t sub_23A0861E8()
{
  return sub_23A085D58(0);
}

uint64_t sub_23A0861F0(uint64_t a1, uint64_t a2)
{
  return sub_23A085D58(a2);
}

uint64_t sub_23A0861F8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_23A086200()
{
  return sub_23A085E0C(0);
}

uint64_t sub_23A086208(uint64_t a1, uint64_t a2)
{
  return sub_23A085E0C(a2);
}

uint64_t sub_23A086210(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_23A086218(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t sub_23A086220(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 81);
}

uint64_t sub_23A086228(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 82);
}

uint64_t sub_23A086230(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 83);
}

uint64_t sub_23A086238(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 65);
}

uint64_t sub_23A086240(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 66);
}

uint64_t sub_23A086248(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 67);
}

uint64_t sub_23A086250(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

_QWORD *sub_23A086258()
{
  return sub_23A085EC0(0);
}

_QWORD *sub_23A086260(uint64_t a1, uint64_t a2)
{
  return sub_23A085EC0(a2);
}

uint64_t sub_23A086268(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_23A086270()
{
  return sub_23A085FCC(0);
}

uint64_t sub_23A086278(uint64_t a1, uint64_t a2)
{
  return sub_23A085FCC(a2);
}

uint64_t sub_23A086280(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

_QWORD *sub_23A086288()
{
  return sub_23A086080(0);
}

_QWORD *sub_23A086290(uint64_t a1, uint64_t a2)
{
  return sub_23A086080(a2);
}

uint64_t sub_23A086298(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_23A0862A0()
{
  return sub_23A086134(0);
}

uint64_t sub_23A0862A8(uint64_t a1, uint64_t a2)
{
  return sub_23A086134(a2);
}

uint64_t sub_23A0862B0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_23A0862B8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

char *sub_23A0862C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 80);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[22];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_2569411F8);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_2569411E0);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A086328(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 80);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[23];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_2569411D8);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_2569411C0);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A086390(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 80);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[24];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_256941248);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_256941230);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A0863F8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 80);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[25];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_256941268);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_256941250);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A086460(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 80);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[26];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_2569411B8);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_2569411A0);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

uint64_t sub_23A0864C8(uint64_t a1)
{
  unsigned __int8 *v1;

  v1 = *(unsigned __int8 **)(a1 + 80);
  if (!v1)
    v1 = (unsigned __int8 *)&unk_256942320;
  return v1[248];
}

uint64_t sub_23A0864E4(uint64_t a1)
{
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)&unk_256942320;
  if (*(_QWORD *)(a1 + 80))
    v1 = *(unsigned __int8 **)(a1 + 80);
  return (v1[40] >> 3) & 1;
}

char *sub_23A086504(uint64_t a1, int a2)
{
  char *result;

  result = (char *)(*(_QWORD *)(sub_23A05E530(a1 + 56, a2) + 48) & 0xFFFFFFFFFFFFFFFELL);
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

float sub_23A086538(uint64_t a1, int a2)
{
  return *(float *)(sub_23A05E530(a1 + 56, a2) + 56);
}

BOOL sub_23A086554(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 56, a2) + 60) == 1;
}

BOOL sub_23A086578(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 56, a2) + 60) == 2;
}

BOOL sub_23A08659C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 56, a2) + 60) == 3;
}

BOOL sub_23A0865C0(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 56, a2) + 60) == 5;
}

BOOL sub_23A0865E4(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 56, a2) + 60) == 4;
}

BOOL sub_23A086608(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 56, a2) + 60) == 6;
}

char *sub_23A08662C(uint64_t a1)
{
  char *v1;

  v1 = *(char **)(a1 + 88);
  if (!v1)
    v1 = (char *)&unk_2569424B0;
  return v1 + 16;
}

char *sub_23A086648(uint64_t a1)
{
  char *v1;

  v1 = *(char **)(a1 + 104);
  if (!v1)
    v1 = (char *)&unk_2569424B0;
  return v1 + 16;
}

uint64_t sub_23A086664(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = *(_DWORD **)(a1 + 80);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[68];
  v3 = v2 - 2;
  v4 = v2 - 1;
  if (v3 >= 3)
    return 0;
  else
    return v4;
}

uint64_t sub_23A086690(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

char *sub_23A086698(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 64);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[22];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_2569411F8);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_2569411E0);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A086700(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 64);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[23];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_2569411D8);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_2569411C0);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A086768(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 64);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[24];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_256941248);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_256941230);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A0867D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 64);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[25];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_256941268);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_256941250);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

char *sub_23A086838(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *result;

  v1 = *(_QWORD **)(a1 + 64);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[26];
  if (v2)
  {
    result = (char *)(v2 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    result = (char *)atomic_load(&qword_2569411B8);
    if (!result)
      result = (char *)sub_23A08A9AC(&off_2569411A0);
  }
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

uint64_t sub_23A0868A0(uint64_t a1)
{
  unsigned __int8 *v1;

  v1 = *(unsigned __int8 **)(a1 + 64);
  if (!v1)
    v1 = (unsigned __int8 *)&unk_256942320;
  return v1[248];
}

uint64_t sub_23A0868BC(uint64_t a1)
{
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)&unk_256942320;
  if (*(_QWORD *)(a1 + 64))
    v1 = *(unsigned __int8 **)(a1 + 64);
  return (v1[40] >> 3) & 1;
}

uint64_t sub_23A0868DC(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = *(_DWORD **)(a1 + 64);
  if (!v1)
    v1 = &unk_256942320;
  v2 = v1[68];
  v3 = v2 - 2;
  v4 = v2 - 1;
  if (v3 >= 3)
    return 0;
  else
    return v4;
}

char *sub_23A086908(uint64_t a1, int a2)
{
  char *result;

  result = (char *)(*(_QWORD *)(sub_23A05E530(a1 + 40, a2) + 48) & 0xFFFFFFFFFFFFFFFELL);
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

float sub_23A08693C(uint64_t a1, int a2)
{
  return *(float *)(sub_23A05E530(a1 + 40, a2) + 56);
}

BOOL sub_23A086958(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 40, a2) + 60) == 1;
}

BOOL sub_23A08697C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 40, a2) + 60) == 2;
}

BOOL sub_23A0869A0(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 40, a2) + 60) == 3;
}

BOOL sub_23A0869C4(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 40, a2) + 60) == 5;
}

BOOL sub_23A0869E8(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 40, a2) + 60) == 4;
}

BOOL sub_23A086A0C(uint64_t a1, int a2)
{
  return *(_DWORD *)(sub_23A05E530(a1 + 40, a2) + 60) == 6;
}

char *sub_23A086A30(uint64_t a1)
{
  char *v1;

  v1 = *(char **)(a1 + 72);
  if (!v1)
    v1 = (char *)&unk_2569424B0;
  return v1 + 16;
}

char *sub_23A086A4C(uint64_t a1)
{
  char *v1;

  v1 = *(char **)(a1 + 88);
  if (!v1)
    v1 = (char *)&unk_2569424B0;
  return v1 + 16;
}

void sub_23A086A68(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t sub_23A086A7C(uint64_t a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
}

void sub_23A086B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A086B58(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  std::string *v4;
  char v5;
  std::string v6[2];

  v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_23A08BD88((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    v4 = sub_23A08BDA0(v6, "CHECK failed: (n) >= (0): ");
    sub_23A08BED0((uint64_t)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
    return sub_23A08BED8((uint64_t)v6);
  }
  else if ((_DWORD)v1)
  {
    v2 = *(_QWORD *)(result + 16) + 8;
    do
    {
      v3 = *(_QWORD *)v2;
      if (*(char *)(*(_QWORD *)v2 + 23) < 0)
      {
        **(_BYTE **)v3 = 0;
        *(_QWORD *)(v3 + 8) = 0;
      }
      else
      {
        *(_BYTE *)v3 = 0;
        *(_BYTE *)(v3 + 23) = 0;
      }
      v2 += 8;
      --v1;
    }
    while (v1);
    *(_DWORD *)(result + 8) = 0;
  }
  return result;
}

void sub_23A086C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A086C18(uint64_t a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
}

void sub_23A086CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A086CF4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_23A08BD88((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    v5 = sub_23A08BDA0(v7, "CHECK failed: (n) >= (0): ");
    sub_23A08BED0((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return sub_23A08BED8((uint64_t)v7);
  }
  else if ((_DWORD)v1)
  {
    v2 = result;
    v3 = (uint64_t *)(*(_QWORD *)(result + 16) + 8);
    do
    {
      v4 = *v3++;
      result = sub_23A0831DC(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(v2 + 8) = 0;
  }
  return result;
}

void sub_23A086D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A086DA0(unsigned __int8 *result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t *v3;
  uint64_t v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v1 = *((unsigned int *)result + 2);
  if ((v1 & 0x80000000) != 0)
  {
    sub_23A08BD88((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    v5 = sub_23A08BDA0(v7, "CHECK failed: (n) >= (0): ");
    sub_23A08BED0((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return (unsigned __int8 *)sub_23A08BED8((uint64_t)v7);
  }
  else if ((_DWORD)v1)
  {
    v2 = result;
    v3 = (uint64_t *)(*((_QWORD *)result + 2) + 8);
    do
    {
      v4 = *v3++;
      result = sub_23A084114(v4);
      --v1;
    }
    while (v1);
    *((_DWORD *)v2 + 2) = 0;
  }
  return result;
}

void sub_23A086E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A086E4C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  std::string *v4;
  int v5;
  const std::string **v6;
  std::string **v7;
  int v8;
  int *v9;
  char v10;
  std::string v11[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1799);
    v4 = sub_23A08BDA0(v11, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    result = sub_23A08BED8((uint64_t)v11);
  }
  v5 = *(_DWORD *)(a2 + 8);
  if (v5)
  {
    v6 = (const std::string **)(*(_QWORD *)(a2 + 16) + 8);
    v7 = (std::string **)sub_23A09D13C((uint64_t *)v3, v5);
    result = (uint64_t)sub_23A086F38((std::string *)v3, v7, v6, v5, **(_DWORD **)(v3 + 16) - *(_DWORD *)(v3 + 8));
    v8 = *(_DWORD *)(v3 + 8) + v5;
    *(_DWORD *)(v3 + 8) = v8;
    v9 = *(int **)(v3 + 16);
    if (*v9 < v8)
      *v9 = v8;
  }
  return result;
}

void sub_23A086F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *sub_23A086F38(std::string *result, std::string **a2, const std::string **a3, signed int a4, signed int a5)
{
  std::string::__raw *v9;
  uint64_t v10;
  const std::string **v11;
  std::string **v12;
  const std::string *v13;
  const std::string *v14;
  std::string *v15;
  int v16;
  std::string::size_type v17;
  const std::string **v18;
  std::string **v19;
  const std::string *v20;
  std::string *v21;
  std::string *v22;

  v9 = (std::string::__raw *)result;
  if (a5 >= a4)
    v10 = a4;
  else
    v10 = a5;
  if ((int)v10 >= 1)
  {
    v11 = a3;
    v12 = a2;
    do
    {
      v14 = *v11++;
      v13 = v14;
      v15 = *v12++;
      result = std::string::operator=(v15, v13);
      --v10;
    }
    while (v10);
  }
  v16 = a4 - a5;
  if (a4 > a5)
  {
    v17 = v9->__words[0];
    v18 = &a3[a5];
    v19 = &a2[a5];
    do
    {
      v20 = *v18;
      if (v17)
      {
        if ((*(_BYTE *)(v17 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v17 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v17 + 32) + 32), &unk_250B0C510, 24);
        v21 = (std::string *)sub_23A08A59C((unint64_t *)v17, 0x18uLL, (uint64_t)sub_23A086A68);
      }
      else
      {
        v21 = (std::string *)operator new();
      }
      v22 = v21;
      v21->__r_.__value_.__r.__words[0] = 0;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      result = std::string::operator=(v21, v20);
      *v19++ = v22;
      ++v18;
      --v16;
    }
    while (v16);
  }
  return result;
}

uint64_t *sub_23A087050(uint64_t *a1)
{
  sub_23A087078(a1);
  return sub_23A07DF74(a1);
}

void sub_23A087078(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)a1[2];
  if (v2 && !*a1)
  {
    v3 = v2 + 1;
    v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          v5 = sub_23A083060(*v3);
          MEMORY[0x23B83FE88](v5, 0x1081C400F7E8713);
        }
        ++v3;
        --v4;
      }
      while (v4);
      v2 = (uint64_t *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

unint64_t sub_23A0870F4(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  std::string *v4;
  unsigned int v5;
  uint64_t *v6;
  unint64_t *v7;
  signed int v8;
  signed int *v9;
  char v10;
  std::string v11[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1799);
    v4 = sub_23A08BDA0(v11, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    result = sub_23A08BED8((uint64_t)v11);
  }
  v5 = *(_DWORD *)(a2 + 8);
  if (v5)
  {
    v6 = (uint64_t *)(*(_QWORD *)(a2 + 16) + 8);
    v7 = (unint64_t *)sub_23A09D13C((uint64_t *)v3, v5);
    result = sub_23A0871E0(v3, v7, v6, v5, **(_DWORD **)(v3 + 16) - *(_DWORD *)(v3 + 8));
    v8 = *(_DWORD *)(v3 + 8) + v5;
    *(_DWORD *)(v3 + 8) = v8;
    v9 = *(signed int **)(v3 + 16);
    if (*v9 < v8)
      *v9 = v8;
  }
  return result;
}

void sub_23A0871C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t sub_23A0871E0(unint64_t result, unint64_t *a2, uint64_t *a3, unsigned int a4, unsigned int a5)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t *v20;
  uint64_t v21;
  _QWORD *v22;

  v9 = (uint64_t *)result;
  if ((int)a5 >= (int)a4)
    v10 = a4;
  else
    v10 = a5;
  if ((int)v10 >= 1)
  {
    v11 = a3;
    v12 = a2;
    do
    {
      v14 = *v11++;
      v13 = v14;
      v15 = *v12++;
      result = sub_23A08728C(v13, v15);
      --v10;
    }
    while (v10);
  }
  v16 = __OFSUB__(a4, a5);
  v17 = a4 - a5;
  if (!((v17 < 0) ^ v16 | (v17 == 0)))
  {
    v18 = *v9;
    v19 = &a3[a5];
    v20 = &a2[a5];
    do
    {
      v21 = *v19++;
      v22 = sub_23A085EC0(v18);
      result = sub_23A08728C(v21, (unint64_t)v22);
      *v20++ = (unint64_t)v22;
      --v17;
    }
    while (v17);
  }
  return result;
}

unint64_t sub_23A08728C(uint64_t a1, unint64_t a2)
{
  return sub_23A0835F8(a2, a1);
}

uint64_t *sub_23A08729C(uint64_t *a1)
{
  sub_23A0872C4(a1);
  return sub_23A07DF74(a1);
}

void sub_23A0872C4(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)a1[2];
  if (v2 && !*a1)
  {
    v3 = v2 + 1;
    v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          v5 = sub_23A083FD8(*v3);
          MEMORY[0x23B83FE88](v5, 0x10A1C40F497E4DALL);
        }
        ++v3;
        --v4;
      }
      while (v4);
      v2 = (uint64_t *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

void sub_23A087340(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t *v7;
  signed int v8;
  signed int *v9;
  char v10;
  std::string v11[2];

  if (a2 == a1)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1799);
    v4 = sub_23A08BDA0(v11, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
  }
  v5 = *(_DWORD *)(a2 + 8);
  if (v5)
  {
    v6 = (uint64_t *)(*(_QWORD *)(a2 + 16) + 8);
    v7 = (uint64_t *)sub_23A09D13C((uint64_t *)a1, v5);
    sub_23A08742C((uint64_t *)a1, v7, v6, v5, **(_DWORD **)(a1 + 16) - *(_DWORD *)(a1 + 8));
    v8 = *(_DWORD *)(a1 + 8) + v5;
    *(_DWORD *)(a1 + 8) = v8;
    v9 = *(signed int **)(a1 + 16);
    if (*v9 < v8)
      *v9 = v8;
  }
}

void sub_23A087414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A08742C(uint64_t *a1, uint64_t *a2, uint64_t *a3, unsigned int a4, unsigned int a5)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD *v22;

  if ((int)a5 >= (int)a4)
    v10 = a4;
  else
    v10 = a5;
  if ((int)v10 >= 1)
  {
    v11 = a3;
    v12 = a2;
    do
    {
      v14 = *v11++;
      v13 = v14;
      v15 = *v12++;
      sub_23A0874D8(v13, v15);
      --v10;
    }
    while (v10);
  }
  v16 = __OFSUB__(a4, a5);
  v17 = a4 - a5;
  if (!((v17 < 0) ^ v16 | (v17 == 0)))
  {
    v18 = *a1;
    v19 = &a3[a5];
    v20 = &a2[a5];
    do
    {
      v21 = *v19++;
      v22 = sub_23A086080(v18);
      sub_23A0874D8(v21, (uint64_t)v22);
      *v20++ = (uint64_t)v22;
      --v17;
    }
    while (v17);
  }
}

void sub_23A0874D8(uint64_t a1, uint64_t a2)
{
  sub_23A0846CC(a2, a1);
}

_QWORD *sub_23A0874E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _QWORD *a4@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  char v7;
  _QWORD v8[2];

  v8[0] = a1;
  v8[1] = a2;
  v7 = a3;
  result = sub_23A08752C((uint64_t)v8, &v6);
  *a4 = v6;
  return result;
}

_QWORD *sub_23A08752C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = (_QWORD *)operator new();
  result = sub_23A0875A8(v4, *(const char **)a1, *(_QWORD *)(a1 + 8));
  *a2 = v4;
  return result;
}

void sub_23A087584(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A0875A8(_QWORD *a1, const char *a2, uint64_t a3)
{
  uint64_t *v6;
  _QWORD *v7;
  size_t v8;
  int *v9;
  void **v10;
  uint64_t v11;
  void *__p[2];
  unsigned __int8 v14;
  unsigned int v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;
  _DWORD *v19;

  *a1 = &off_250B0C780;
  v6 = a1 + 1;
  sub_23A089B90(a1 + 1);
  if (a3)
  {
    v7 = (_QWORD *)operator new();
    sub_23A0647AC(v7);
  }
  else
  {
    v7 = (_QWORD *)MEMORY[0x24BEDB1D0];
  }
  a1[2] = v7;
  if ((*((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 32) & 5) != 0)
  {
    v15 = 5;
    sub_23A05E390((uint64_t)v16);
    sub_23A00AE20(v16, (uint64_t)"\"", 1);
    v8 = strlen(a2);
    sub_23A00AE20(v16, (uint64_t)a2, v8);
    sub_23A00AE20(v16, (uint64_t)"\": ", 3);
    v9 = __error();
    sub_23A0880C4(*v9);
    if ((v14 & 0x80u) == 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    if ((v14 & 0x80u) == 0)
      v11 = v14;
    else
      v11 = (uint64_t)__p[1];
    sub_23A00AE20(v16, (uint64_t)v10, v11);
    sub_23A05BF64(&v15, (uint64_t)&v19);
    sub_23A089DAC(v6, &v19);
    sub_23A089B98((uint64_t *)&v19);
    if ((char)v14 < 0)
      operator delete(__p[0]);
    v16[0] = *MEMORY[0x24BEDB800];
    *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v16[1] = MEMORY[0x24BEDB848] + 16;
    if (v17 < 0)
      operator delete((void *)v16[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x23B83FDF8](&v18);
  }
  return a1;
}

void sub_23A087780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t *v15;
  uint64_t v16;

  sub_23A089B98((uint64_t *)(v16 - 56));
  if (a14 < 0)
    operator delete(__p);
  sub_23A05BFF0((uint64_t)&a15);
  sub_23A089B98(v15);
  _Unwind_Resume(a1);
}

void sub_23A0877FC(_QWORD *a1)
{
  sub_23A0879E8(a1);
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A087820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A089DA8(a2, a1 + 8);
}

BOOL sub_23A08782C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  const std::locale::facet *v4;
  unsigned __int8 v5;
  _QWORD *v6;
  std::locale v8;

  v3 = *(_QWORD **)(a1 + 16);
  std::ios_base::getloc((const std::ios_base *)((char *)v3 + *(_QWORD *)(*v3 - 24)));
  v4 = std::locale::use_facet(&v8, MEMORY[0x24BEDB350]);
  v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v8);
  v6 = sub_23A087A40(v3, a2, v5);
  return (*((_BYTE *)v6 + *(_QWORD *)(*v6 - 24) + 32) & 5) == 0;
}

void sub_23A0878C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

BOOL sub_23A0878DC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  char v11;

  v2 = *(_QWORD **)(a1 + 16);
  v3 = (_QWORD *)MEMORY[0x24BEDB1D0];
  if (v2 == (_QWORD *)MEMORY[0x24BEDB1D0])
  {
    if ((int)sub_23A087EB8() <= 2)
    {
      v11 = 0;
      v4 = sub_23A00AE20(MEMORY[0x24BEDB310], (uint64_t)"filesystem.cc", 13);
      sub_23A00AE20(v4, (uint64_t)"(", 1);
      v5 = (_QWORD *)std::ostream::operator<<();
      v6 = sub_23A00AE20(v5, (uint64_t)") ", 2);
      v7 = sub_23A00AE20(v6, (uint64_t)"LOG(", 4);
      v8 = sub_23A00AE20(v7, (uint64_t)"ERROR", 5);
      v9 = sub_23A00AE20(v8, (uint64_t)") ", 2);
      sub_23A00AE20(v9, (uint64_t)"ReadAll is not supported for stdin.", 35);
      sub_23A05E47C(&v11);
    }
  }
  else
  {
    sub_23A087BC4(a2, *(_QWORD **)((char *)v2 + *(_QWORD *)(*v2 - 24) + 40), 0);
  }
  return v2 != v3;
}

void sub_23A0879D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  sub_23A05E47C(&a13);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A0879E8(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250B0C780;
  v2 = a1[2];
  if (v2 != MEMORY[0x24BEDB1D0] && v2 != 0)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  sub_23A089B98(a1 + 1);
  return a1;
}

_QWORD *sub_23A087A40(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  MEMORY[0x23B83FC30](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_23A087B6C(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x23A087B38);
  }
  __cxa_rethrow();
}

void sub_23A087BB0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_23A087BC4(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  std::string *p_p;
  std::string::size_type size;
  std::string __p;

  sub_23A087C40(&__p, a2, a3);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  MEMORY[0x23B83FB94](a1, p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A087C24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_23A087C40(std::string *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  std::string::value_type *v5;
  std::string::value_type v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v8 = a3;
  v9 = a2;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  while (1)
  {
    result = sub_23A087D0C(&v9, &v8);
    if ((result & 1) != 0)
      break;
    v5 = (std::string::value_type *)v9[3];
    if (v5 == (std::string::value_type *)v9[4])
      v6 = (*(uint64_t (**)(_QWORD *))(*v9 + 72))(v9);
    else
      v6 = *v5;
    std::string::push_back(a1, v6);
    v7 = v9[3];
    if (v7 == v9[4])
      (*(void (**)(_QWORD *))(*v9 + 80))(v9);
    else
      v9[3] = v7 + 1;
  }
  return result;
}

void sub_23A087CDC(void *a1)
{
  uint64_t v1;

  __cxa_begin_catch(a1);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  __cxa_rethrow();
}

void sub_23A087CF8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_23A087D0C(_QWORD **a1, _QWORD **a2)
{
  _QWORD *v4;
  _BOOL4 v5;
  _QWORD *v6;
  _BOOL4 v7;

  v4 = *a1;
  if (v4)
  {
    if (v4[3] != v4[4])
    {
      v5 = 0;
      goto LABEL_8;
    }
    if ((*(unsigned int (**)(_QWORD *))(*v4 + 72))(v4) != -1)
    {
      v5 = *a1 == 0;
      goto LABEL_8;
    }
    *a1 = 0;
  }
  v5 = 1;
LABEL_8:
  v6 = *a2;
  if (!*a2)
    goto LABEL_14;
  if (v6[3] == v6[4])
  {
    if ((*(unsigned int (**)(_QWORD *))(*v6 + 72))(v6) != -1)
    {
      v7 = *a2 == 0;
      return v5 ^ v7 ^ 1u;
    }
    *a2 = 0;
LABEL_14:
    v7 = 1;
    return v5 ^ v7 ^ 1u;
  }
  v7 = 0;
  return v5 ^ v7 ^ 1u;
}

uint64_t sub_23A087DC4()
{
  unsigned int v0;
  uint64_t v1;
  std::random_device v3;

  v0 = atomic_load(&dword_256941630);
  if (v0 != -1)
    return atomic_load(&dword_256941630);
  sub_23A087E48(&v3);
  v1 = MEMORY[0x23B83FD08](&v3);
  std::random_device::~random_device(&v3);
  return v1;
}

void sub_23A087E20(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, std::random_device a11, std::random_device a12)
{
  unsigned int *v12;

  std::random_device::~random_device(&a11);
  __cxa_begin_catch(a1);
  atomic_load(v12);
  __cxa_end_catch();
  JUMPOUT(0x23A087E0CLL);
}

std::random_device *sub_23A087E48(std::random_device *a1)
{
  std::string __token;

  sub_239FEE1FC(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__token.__r_.__value_.__l.__data_);
  return a1;
}

void sub_23A087E9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_23A087EB8()
{
  return atomic_load((unsigned int *)&unk_2569421D0);
}

uint64_t sub_23A087EC8(unsigned __int8 *a1, uint64_t a2, uint64_t *a3)
{
  int v3;
  uint64_t result;
  unint64_t v5;
  char v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  int v11;
  char v12;
  int v13;

  v3 = (char)*a1;
  if ((v3 & 0x80000000) == 0)
  {
    *a3 = 1;
    return *a1;
  }
  v5 = a2 - (_QWORD)a1;
  if ((unint64_t)(a2 - (_QWORD)a1) >= 2)
  {
    if ((v3 & 0xE0) == 0xC0)
    {
      v6 = a1[1];
      if (v6 <= -65)
      {
        result = v6 & 0x3F | ((v3 & 0x1F) << 6);
        if (result >= 0x80)
        {
          v7 = 2;
LABEL_8:
          *a3 = v7;
          return result;
        }
      }
    }
    else if (v5 >= 3)
    {
      if ((v3 & 0xF0) == 0xE0)
      {
        v8 = (char)a1[1];
        if (v8 <= -65)
        {
          v9 = a1[2];
          if (v9 <= -65)
          {
            result = v9 & 0x3F | ((v8 & 0x3F) << 6) & 0xFFF | ((v3 & 0xF) << 12);
            if (result >= 0x800
              && (((v3 & 0xF) << 12) - 57344 < 0x102000u || result >> 11 <= 0x1A))
            {
              v7 = 3;
              goto LABEL_8;
            }
          }
        }
      }
      else if (v5 >= 4 && (v3 & 0xF8) == 0xF0)
      {
        v10 = (char)a1[1];
        if (v10 <= -65)
        {
          v11 = (char)a1[2];
          if (v11 <= -65)
          {
            v12 = a1[3];
            if (v12 <= -65)
            {
              v13 = ((v3 & 7) << 18) | ((v10 & 0x3F) << 12);
              result = v12 & 0x3F | ((v11 & 0x3F) << 6) | v13;
              if (result >= 0x10000 && (v13 - 57344) < 0x102000)
              {
                v7 = 4;
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
  }
  *a3 = 1;
  return 65533;
}

uint64_t sub_23A088010()
{
  uint64_t (*v0)(_QWORD);
  _DWORD *v2;
  uint64_t (*v3)(_QWORD);
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v0 = off_256941650;
  if ((*(_BYTE *)off_256941650(&off_256941650) & 1) == 0)
  {
    sub_23A087DC4();
    v2 = (_DWORD *)off_256941638(&off_256941638);
    *v2 = v4;
    do
    {
      v5 = v3(&off_256941638);
      *(_DWORD *)(v5 + 4 * v7) = v6;
    }
    while (v7 != 623);
    *(_QWORD *)(v3(&off_256941638) + 2496) = 0;
    *(_BYTE *)v0(&off_256941650) = 1;
  }
  return off_256941638(&off_256941638);
}

uint64_t sub_23A0880C4(int a1)
{
  size_t v1;
  _QWORD *v2;
  _QWORD v4[11];
  char v5;
  uint64_t v6;
  char __strerrbuf[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  strerror_r(a1, __strerrbuf, 0x3FFuLL);
  sub_23A05E390((uint64_t)v4);
  v1 = strlen(__strerrbuf);
  v2 = sub_23A00AE20(v4, (uint64_t)__strerrbuf, v1);
  sub_23A00AE20(v2, (uint64_t)" Error #", 8);
  std::ostream::operator<<();
  std::stringbuf::str();
  v4[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v4 + *(_QWORD *)(v4[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v4[1] = MEMORY[0x24BEDB848] + 16;
  if (v5 < 0)
    operator delete((void *)v4[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x23B83FDF8](&v6);
}

void sub_23A0881D4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

unint64_t sub_23A0881F0(uint64_t a1, unint64_t a2)
{
  if (!a2)
    sub_23A0883E8();
  return (a1 + a2 - 1) / a2 * a2;
}

void sub_23A088214(std::string *this)
{
  std::string::size_type size;
  std::string::size_type v3;

  LOBYTE(size) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  if ((size & 0x80u) != 0)
    size = this->__r_.__value_.__l.__size_;
  if ((size & 3) != 0)
  {
    do
    {
      std::string::push_back(this, 0);
      LOBYTE(v3) = *((_BYTE *)&this->__r_.__value_.__s + 23);
      if ((v3 & 0x80u) != 0)
        v3 = this->__r_.__value_.__l.__size_;
    }
    while ((v3 & 3) != 0);
  }
}

_QWORD *sub_23A088274@<X0>(_QWORD *a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  _QWORD *v7;
  unsigned int v9;
  _QWORD v10[11];
  char v11;
  uint64_t v12;

  v4 = a1[1];
  v5 = v4 >= a2;
  v6 = v4 - a2;
  if (v5)
  {
    *a1 += a2;
    a1[1] = v6;
    return sub_23A089B90(a3);
  }
  else
  {
    v9 = 13;
    v7 = (_QWORD *)sub_23A05E390((uint64_t)v10);
    sub_23A00AE20(v7, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/src/util.cc", 63);
    sub_23A00AE20(v10, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_23A00AE20(v10, (uint64_t)") [", 3);
    sub_23A00AE20(v10, (uint64_t)"string.size() >= size", 21);
    sub_23A00AE20(v10, (uint64_t)"] ", 2);
    sub_23A05BF64(&v9, (uint64_t)a3);
    v10[0] = *MEMORY[0x24BEDB800];
    *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v10[1] = MEMORY[0x24BEDB848] + 16;
    if (v11 < 0)
      operator delete((void *)v10[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return (_QWORD *)MEMORY[0x23B83FDF8](&v12);
  }
}

void sub_23A0883D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23A05BFF0((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_23A0883E8()
{
  __assert_rtn("RoundUp", "util.cc", 276, "multiple");
}

uint64_t sub_23A088410(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)sub_23A076CEC(a1);
  *v4 = &off_250B0D0F8;
  v4[1] = a2 + 16;
  sub_23A05C61C((uint64_t)v4);
  return a1;
}

void sub_23A08844C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23A05C140(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A088464(uint64_t a1, uint64_t a2, _DWORD *a3, unint64_t a4)
{
  _QWORD *result;

  result = (_QWORD *)sub_23A05B444(a1, a2, a3, a4);
  *result = &off_250B0D0F8;
  return result;
}

void sub_23A088488(uint64_t a1)
{
  sub_23A05C140(a1);
  JUMPOUT(0x23B83FE88);
}

void sub_23A0884AC(uint64_t *a1@<X0>, _BYTE *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>, float a5@<S0>)
{
  int v8;
  int v9;
  int v10;
  char *v11;
  __int128 v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  __int128 v20;
  char *v21;
  char *v22;
  __int128 v23;
  char *v24;
  unint64_t v25;
  int **v26;
  char *v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  int **v32;
  int **v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  float v37;
  float v38;
  int **v39;
  int v40;
  uint64_t v41;
  _DWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  char *v48;
  char *v49;
  uint64_t v50;
  _QWORD *v51;
  __int128 *v52;
  uint64_t v53;
  int v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v69[5];
  uint64_t (**v70)();
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  _OWORD v75[2];
  int v76;
  void *__p;
  char *v78;
  char *v79;
  void *v80;
  char *v81;
  uint64_t v82;
  _QWORD v83[3];
  _QWORD *v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(uint64_t (***__return_ptr)()))(*a1 + 16))(&v70);
  if (v70)
  {
    sub_23A089B98((uint64_t *)&v70);
LABEL_3:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  sub_23A089B98((uint64_t *)&v70);
  if (!a3)
    goto LABEL_3;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  __p = 0;
  v78 = 0;
  v79 = 0;
  if (a3 >> 59)
    sub_239FEBE68();
  v8 = 0;
  __p = operator new(32 * a3);
  v78 = (char *)__p;
  v79 = (char *)__p + 32 * a3;
  memset(v75, 0, sizeof(v75));
  v76 = 1065353216;
  v70 = &off_250B0D338;
  v71 = 0u;
  v72 = 0u;
  v73 = 0;
  v74 = 256;
  v69[0] = (uint64_t)a1;
  v69[1] = (uint64_t)&v70;
  v69[2] = (uint64_t)&__p;
  v69[3] = (uint64_t)&v80;
  v69[4] = (uint64_t)v75;
  do
  {
    v86 = 0uLL;
    v9 = sub_23A0634A8(a1[2], a2, a3, (BOOL *)&v85 + 8);
    *(_QWORD *)&v86 = a2;
    *((_QWORD *)&v86 + 1) = v9;
    a3 -= v9;
    if (a3)
      v10 = v8 + 1;
    else
      v10 = -1;
    LODWORD(v85) = v8 - 1;
    DWORD1(v85) = v10;
    v11 = v78;
    if (v78 >= v79)
    {
      v14 = (char *)__p;
      v15 = (v78 - (_BYTE *)__p) >> 5;
      v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 59)
        sub_239FEBE68();
      v17 = v79 - (_BYTE *)__p;
      if ((v79 - (_BYTE *)__p) >> 4 > v16)
        v16 = v17 >> 4;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0)
        v18 = 0x7FFFFFFFFFFFFFFLL;
      else
        v18 = v16;
      if (v18)
      {
        if (v18 >> 59)
          sub_239FF1A44();
        v19 = (char *)operator new(32 * v18);
      }
      else
      {
        v19 = 0;
      }
      v20 = v86;
      v21 = &v19[32 * v15];
      *(_OWORD *)v21 = v85;
      *((_OWORD *)v21 + 1) = v20;
      v22 = v21;
      if (v11 != v14)
      {
        do
        {
          v23 = *((_OWORD *)v11 - 1);
          *((_OWORD *)v22 - 2) = *((_OWORD *)v11 - 2);
          *((_OWORD *)v22 - 1) = v23;
          v22 -= 32;
          v11 -= 32;
        }
        while (v11 != v14);
        v11 = v14;
      }
      v24 = &v19[32 * v18];
      v13 = v21 + 32;
      __p = v22;
      v78 = v21 + 32;
      v79 = v24;
      if (v11)
        operator delete(v11);
    }
    else
    {
      v12 = v86;
      *(_OWORD *)v78 = v85;
      *((_OWORD *)v11 + 1) = v12;
      v13 = v11 + 32;
    }
    a2 += v9;
    ++v8;
    v78 = v13;
  }
  while (a3);
  if (__p == v13)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    goto LABEL_76;
  }
  if ((unint64_t)(v13 - (_BYTE *)__p) >= 0x21)
  {
    v25 = 1;
    do
    {
      sub_23A088C4C(v69, v25 - 1, v25);
      ++v25;
    }
    while (v25 < (v78 - (_BYTE *)__p) >> 5);
  }
  v26 = (int **)v80;
  v27 = v81;
  if (v80 != v81)
  {
    v28 = 0;
    do
    {
      v29 = *v26;
      if (v27 - (char *)v26 >= 9)
      {
        v30 = 0;
        v31 = (v27 - (char *)v26) >> 3;
        v32 = v26;
        do
        {
          v33 = v32;
          v32 += v30 + 1;
          v34 = 2 * v30;
          v30 = (2 * v30) | 1;
          v35 = v34 + 2;
          if (v35 < v31)
          {
            v36 = v32[1];
            v37 = *((float *)*v32 + 2);
            v38 = *((float *)v36 + 2);
            if (v37 < v38 || v37 == v38 && **v32 > *v36)
            {
              ++v32;
              v30 = v35;
            }
          }
          *v33 = *v32;
        }
        while (v30 <= (uint64_t)((unint64_t)(v31 - 2) >> 1));
        v39 = (int **)(v27 - 8);
        if (v32 == v39)
        {
          *v32 = v29;
        }
        else
        {
          *v32 = *v39;
          *v39 = v29;
          sub_23A089138((uint64_t)v26, (uint64_t)(v32 + 1), v32 + 1 - v26);
        }
      }
      v81 -= 8;
      v40 = *v29;
      v41 = *v29;
      v42 = __p;
      v43 = *((_QWORD *)__p + 4 * v41 + 3);
      if (!v43)
        goto LABEL_58;
      v44 = v29[1];
      v45 = *((_QWORD *)__p + 4 * v44 + 3);
      if (!v45)
        goto LABEL_58;
      v46 = v45 + v43;
      if (v46 != *((_QWORD *)v29 + 2))
        goto LABEL_58;
      if (a5 > 0.0)
      {
        if (a5 >= 1.0)
          goto LABEL_58;
        if (!v28)
          v28 = sub_23A088010();
        v47 = sub_23A07333C(v28);
        if (((double)v47 + (double)sub_23A07333C(v28) * 4294967300.0) * 5.42101086e-20 + 0.0 < a5)
          goto LABEL_58;
        v42 = __p;
        v40 = *v29;
        v44 = v29[1];
        v41 = *v29;
        v46 = *((_QWORD *)__p + 4 * v44 + 3) + *((_QWORD *)__p + 4 * v41 + 3);
      }
      v48 = (char *)&v42[8 * v41];
      v49 = (char *)&v42[8 * v44];
      *((_QWORD *)v48 + 3) = v46;
      *((_DWORD *)v48 + 1) = *((_DWORD *)v49 + 1);
      v50 = *((unsigned int *)v49 + 1);
      if ((v50 & 0x80000000) == 0)
        v42[8 * v50] = v40;
      *((_QWORD *)v49 + 2) = "";
      *((_QWORD *)v49 + 3) = 0;
      sub_23A088C4C(v69, *((_DWORD *)__p + 8 * v41), v40);
      sub_23A088C4C(v69, *v29, *((_DWORD *)__p + 8 * *v29 + 1));
LABEL_58:
      v26 = (int **)v80;
      v27 = v81;
    }
    while (v80 != v81);
  }
  v84 = 0;
  v51 = operator new(0x20uLL);
  *v51 = &off_250B0D7C8;
  v51[1] = a1;
  v51[2] = v83;
  v51[3] = v75;
  *((_QWORD *)&v86 + 1) = v51;
  sub_23A08990C(&v85, v83);
  v52 = (__int128 *)*((_QWORD *)&v86 + 1);
  if (*((__int128 **)&v86 + 1) == &v85)
  {
    v53 = 4;
    v52 = &v85;
  }
  else
  {
    if (!*((_QWORD *)&v86 + 1))
      goto LABEL_65;
    v53 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v52 + 8 * v53))();
LABEL_65:
  v54 = 0;
  v55 = (_QWORD *)MEMORY[0x24BEDB310];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  do
  {
    if (v54 < 0)
    {
      LOBYTE(v85) = 1;
      v56 = sub_23A00AE20(v55, (uint64_t)"bpe_model.cc", 12);
      sub_23A00AE20(v56, (uint64_t)"(", 1);
      v57 = (_QWORD *)std::ostream::operator<<();
      v58 = sub_23A00AE20(v57, (uint64_t)") [", 3);
      v59 = sub_23A00AE20(v58, (uint64_t)"(index) >= (0)", 14);
      sub_23A00AE20(v59, (uint64_t)"] ", 2);
      sub_23A05E47C(&v85);
    }
    v60 = __p;
    if (v54 >= (int)((unint64_t)(v78 - (_BYTE *)__p) >> 5))
    {
      LOBYTE(v85) = 1;
      v61 = sub_23A00AE20(v55, (uint64_t)"bpe_model.cc", 12);
      sub_23A00AE20(v61, (uint64_t)"(", 1);
      v62 = (_QWORD *)std::ostream::operator<<();
      v63 = sub_23A00AE20(v62, (uint64_t)") [", 3);
      v64 = sub_23A00AE20(v63, (uint64_t)"(index) < (static_cast<int>(symbols.size()))", 44);
      sub_23A00AE20(v64, (uint64_t)"] ", 2);
      sub_23A05E47C(&v85);
      v60 = __p;
    }
    sub_23A08905C((uint64_t)v83, v60[4 * v54 + 2], v60[4 * v54 + 3], (uint64_t)a4);
    v54 = *((_DWORD *)__p + 8 * v54 + 1);
  }
  while (v54 != -1);
  v65 = v84;
  if (v84 == v83)
  {
    v66 = 4;
    v65 = v83;
    goto LABEL_75;
  }
  if (v84)
  {
    v66 = 5;
LABEL_75:
    (*(void (**)(void))(*v65 + 8 * v66))();
  }
LABEL_76:
  sub_23A08909C(&v70);
  sub_23A022E90((uint64_t)v75);
  if (__p)
  {
    v78 = (char *)__p;
    operator delete(__p);
  }
  if (v80)
  {
    v81 = (char *)v80;
    operator delete(v80);
  }
}

void sub_23A088B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  sub_23A08909C(&a16);
  sub_23A022E90((uint64_t)&a23);
  if (__p)
  {
    a30 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a32)
  {
    a33 = (uint64_t)a32;
    operator delete(a32);
  }
  _Unwind_Resume(a1);
}

__n128 sub_23A088C4C(uint64_t *a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned __int8 *v20;
  int v21;
  unsigned int v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t *v54;
  char *v55;
  uint64_t v56;
  __n128 result;
  uint64_t v58;
  uint64_t v59;
  __n128 *v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  __n128 v64;
  __n128 v65;
  _QWORD v66[2];
  _OWORD *v67;

  if (a2 == -1)
    return result;
  if (a3 == -1)
    return result;
  v6 = a2;
  v7 = *(_QWORD *)a1[2];
  if (*(_BYTE *)(v7 + 32 * a2 + 8))
    return result;
  v8 = a3;
  v9 = v7 + 32 * a3;
  if (*(_BYTE *)(v9 + 8))
    return result;
  v10 = *a1;
  v11 = v7 + 32 * a2;
  v12 = *(_BYTE **)(v11 + 16);
  v13 = *(_QWORD *)(v9 + 24) + *(_QWORD *)(v11 + 24);
  v66[0] = v12;
  v66[1] = v13;
  v14 = *(unsigned int **)(v10 + 40);
  v15 = *v14;
  if (v13)
  {
    v16 = 0;
    v17 = v13;
    while (1)
    {
      v18 = *v12++;
      v16 ^= (v15 >> 10 << ((v15 >> 6) & 8)) ^ v18;
      v15 = v14[v16];
      if ((v15 & 0x800000FF) != v18)
        return result;
      if (!--v17)
        goto LABEL_17;
    }
  }
  v19 = *v12;
  if (*v12)
  {
    v16 = 0;
    v20 = v12 + 1;
    while (1)
    {
      v16 ^= (v15 >> 10 << ((v15 >> 6) & 8)) ^ v19;
      v15 = v14[v16];
      if ((v15 & 0x800000FF) != v19)
        return result;
      v21 = *v20++;
      v19 = v21;
      if (!v21)
        goto LABEL_17;
    }
  }
  v16 = 0;
LABEL_17:
  if ((v15 & 0x100) != 0)
  {
    v22 = v14[v16 ^ (v15 >> 10 << ((v15 >> 6) & 8))];
    v23 = (_QWORD *)a1[1];
    v24 = v23[5];
    v25 = v23[6];
    v26 = v23[4];
    if (v26 >= v25)
    {
      v26 = 0;
      ++v24;
      v23[4] = 0;
      v23[5] = v24;
    }
    v27 = v23[1];
    v63 = v10;
    if (v24 == (v23[2] - v27) >> 3)
    {
      v62 = v22;
      is_mul_ok(v25, 0x18uLL);
      v28 = (void *)operator new[]();
      bzero(v28, 24 * v23[6]);
      v30 = (_QWORD *)v23[2];
      v29 = v23[3];
      if ((unint64_t)v30 >= v29)
      {
        v61 = v28;
        v32 = (_QWORD *)v23[1];
        v33 = v30 - v32;
        v34 = v33 + 1;
        if ((unint64_t)(v33 + 1) >> 61)
          goto LABEL_60;
        v35 = v29 - (_QWORD)v32;
        if (v35 >> 2 > v34)
          v34 = v35 >> 2;
        if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
          v36 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v36 = v34;
        v37 = v61;
        if (v36)
        {
          if (v36 >> 61)
            goto LABEL_61;
          v38 = (char *)operator new(8 * v36);
          v33 = v30 - v32;
          v37 = v61;
        }
        else
        {
          v38 = 0;
        }
        v39 = &v38[8 * v33];
        v40 = &v38[8 * v36];
        *(_QWORD *)v39 = v37;
        v31 = v39 + 8;
        if (v30 != v32)
        {
          do
          {
            v41 = *--v30;
            *((_QWORD *)v39 - 1) = v41;
            v39 -= 8;
          }
          while (v30 != v32);
          v30 = (_QWORD *)v23[1];
        }
        v23[1] = v39;
        v23[2] = v31;
        v23[3] = v40;
        v22 = v62;
        if (v30)
          operator delete(v30);
      }
      else
      {
        *v30 = v28;
        v31 = v30 + 1;
        v22 = v62;
      }
      v23[2] = v31;
      v27 = v23[1];
      v26 = v23[4];
      v24 = v23[5];
      v10 = v63;
    }
    v42 = *(_QWORD *)(v27 + 8 * v24) + 24 * v26;
    v23[4] = v26 + 1;
    *(_DWORD *)v42 = a2;
    *(_DWORD *)(v42 + 4) = a3;
    v43 = v22 & 0x7FFFFFFF;
    *(float *)(v42 + 8) = (*(float (**)(uint64_t))(*(_QWORD *)v10 + 136))(v10);
    *(_QWORD *)(v42 + 16) = v13;
    v44 = (uint64_t *)a1[3];
    v46 = (_QWORD *)v44[1];
    v45 = v44[2];
    if ((unint64_t)v46 < v45)
    {
      *v46 = v42;
      v47 = (uint64_t)(v46 + 1);
LABEL_58:
      v44[1] = v47;
      sub_23A089138(*v44, v47, (v47 - *v44) >> 3);
      if ((*(unsigned int (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 8) + 128))(*(_QWORD *)(v10 + 8), v43))
      {
        v58 = *(_QWORD *)a1[2];
        v64 = *(__n128 *)(v58 + 32 * v6 + 16);
        v65 = *(__n128 *)(v58 + 32 * v8 + 16);
        v59 = a1[4];
        v67 = v66;
        v60 = (__n128 *)sub_23A0891D0(v59, (uint64_t)v66, (uint64_t)&unk_23A0A31B0, &v67);
        result = v64;
        v60[2] = v64;
        v60[3] = v65;
      }
      return result;
    }
    v48 = *v44;
    v49 = ((uint64_t)v46 - *v44) >> 3;
    v50 = v49 + 1;
    if (!((unint64_t)(v49 + 1) >> 61))
    {
      v51 = v45 - v48;
      if (v51 >> 2 > v50)
        v50 = v51 >> 2;
      if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8)
        v52 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v52 = v50;
      if (!v52)
      {
        v53 = 0;
        goto LABEL_51;
      }
      if (!(v52 >> 61))
      {
        v53 = (char *)operator new(8 * v52);
LABEL_51:
        v54 = (uint64_t *)&v53[8 * v49];
        v55 = &v53[8 * v52];
        *v54 = v42;
        v47 = (uint64_t)(v54 + 1);
        if (v46 == (_QWORD *)v48)
        {
          v10 = v63;
        }
        else
        {
          v10 = v63;
          do
          {
            v56 = *--v46;
            *--v54 = v56;
          }
          while (v46 != (_QWORD *)v48);
          v46 = (_QWORD *)*v44;
        }
        *v44 = (uint64_t)v54;
        v44[1] = v47;
        v44[2] = (uint64_t)v55;
        if (v46)
          operator delete(v46);
        goto LABEL_58;
      }
LABEL_61:
      sub_239FF1A44();
    }
LABEL_60:
    sub_239FEBE68();
  }
  return result;
}

uint64_t sub_23A08905C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a3;
  v6 = a4;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    sub_239FF19E8();
  return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t *))(*(_QWORD *)v4 + 48))(v4, v7, &v6);
}

_QWORD *sub_23A08909C(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;

  *a1 = &off_250B0D338;
  v2 = (_QWORD *)a1[1];
  v3 = (_QWORD *)a1[2];
  if (v2 != v3)
  {
    do
    {
      if (*v2)
        MEMORY[0x23B83FE64](*v2, 0x1000C801E56706BLL);
      ++v2;
    }
    while (v2 != v3);
    v2 = (_QWORD *)a1[1];
  }
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_23A089118(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, float))(*(_QWORD *)a1 + 56))(a1, 0.0);
}

uint64_t sub_23A089128()
{
  return 1;
}

uint64_t sub_23A089130()
{
  return 0;
}

uint64_t sub_23A089138(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  float v8;
  float v9;
  uint64_t v10;
  unint64_t v11;
  _DWORD *v12;
  float v13;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    v4 = v3 >> 1;
    v5 = result + 8 * (v3 >> 1);
    v6 = *(_DWORD **)v5;
    v7 = *(_QWORD *)(a2 - 8);
    v8 = *(float *)(*(_QWORD *)v5 + 8);
    v9 = *(float *)(v7 + 8);
    if (v8 < v9 || v8 == v9 && *v6 > *(_DWORD *)v7)
    {
      *(_QWORD *)(a2 - 8) = v6;
      if (v3 >= 2)
      {
        while (1)
        {
          v11 = v4 - 1;
          v4 = (v4 - 1) >> 1;
          v10 = result + 8 * v4;
          v12 = *(_DWORD **)v10;
          v13 = *(float *)(*(_QWORD *)v10 + 8);
          if (v13 >= v9 && (v13 != v9 || *v12 <= *(_DWORD *)v7))
            break;
          *(_QWORD *)v5 = v12;
          v5 = result + 8 * v4;
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v5;
LABEL_11:
      *(_QWORD *)v10 = v7;
    }
  }
  return result;
}

void *sub_23A0891D0(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  void **v14;
  void *v15;
  uint64_t *v16;
  size_t v17;
  uint64_t v18;
  unint64_t v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v8 = (_QWORD *)(a1 + 24);
  v9 = sub_23A089444(a1 + 24, *(uint64_t **)a2, *(_QWORD *)(a2 + 8));
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      v15 = *v14;
      if (*v14)
      {
        v18 = a2;
        v16 = *(uint64_t **)a2;
        v17 = *(_QWORD *)(v18 + 8);
        do
        {
          v19 = *((_QWORD *)v15 + 1);
          if (v19 == v10)
          {
            if (*((_QWORD *)v15 + 3) == v17 && !memcmp(*((const void **)v15 + 2), v16, v17))
              return v15;
          }
          else
          {
            if (v13 > 1)
            {
              if (v19 >= v11)
                v19 %= v11;
            }
            else
            {
              v19 &= v11 - 1;
            }
            if (v19 != v4)
              break;
          }
          v15 = *(void **)v15;
        }
        while (v15);
      }
    }
  }
  v15 = operator new(0x40uLL);
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = v10;
  *((_OWORD *)v15 + 1) = **a4;
  *((_OWORD *)v15 + 2) = 0u;
  *((_OWORD *)v15 + 3) = 0u;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    sub_23A05E974(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v15 = *v27;
LABEL_40:
    *v27 = v15;
    goto LABEL_41;
  }
  *(_QWORD *)v15 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v15;
  *(_QWORD *)(v26 + 8 * v4) = a1 + 16;
  if (*(_QWORD *)v15)
  {
    v28 = *(_QWORD *)(*(_QWORD *)v15 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11)
        v28 %= v11;
    }
    else
    {
      v28 &= v11 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_40;
  }
LABEL_41:
  ++*v8;
  return v15;
}

void sub_23A089430(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_23A089444(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  char v4;

  return sub_239FF3090((uint64_t)&v4, a2, a3);
}

void sub_23A089468(_QWORD *a1)
{
  sub_23A08909C(a1);
  JUMPOUT(0x23B83FE88);
}

void sub_23A089490()
{
  JUMPOUT(0x23B83FE88);
}

__n128 sub_23A0894A4(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_250B0D7C8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 sub_23A0894E4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_250B0D7C8;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_23A08950C(uint64_t a1, _QWORD *a2, void ***a3)
{
  uint64_t v4;
  void **v5;
  _QWORD **v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t *v9;
  char *v10;
  char *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  __int128 v33;

  v4 = a2[1];
  v5 = *a3;
  *(_QWORD *)&v33 = *a2;
  *((_QWORD *)&v33 + 1) = v4;
  v6 = *(_QWORD ***)(a1 + 8);
  v7 = ((uint64_t (*)(_QWORD **, _QWORD, uint64_t))(*v6)[14])(v6, v33, v4);
  if ((_DWORD)v7 == -1 || ((*(uint64_t (**)(_QWORD *, uint64_t))(*v6[1] + 128))(v6[1], v7) & 1) == 0)
  {
    v10 = (char *)v5[2];
    v11 = (char *)v5[1];
    if (v11 >= v10)
    {
      v13 = 0xAAAAAAAAAAAAAAABLL * ((v11 - (_BYTE *)*v5) >> 3);
      v14 = v13 + 1;
      if (v13 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        v15 = 0xAAAAAAAAAAAAAAABLL * ((v10 - (_BYTE *)*v5) >> 3);
        if (2 * v15 > v14)
          v14 = 2 * v15;
        if (v15 >= 0x555555555555555)
          v16 = 0xAAAAAAAAAAAAAAALL;
        else
          v16 = v14;
        v17 = (char *)sub_23A05ED84((uint64_t)(v5 + 2), v16);
        v18 = &v17[24 * v13];
        v20 = &v17[24 * v19];
        *(_OWORD *)v18 = v33;
        *((_DWORD *)v18 + 4) = v7;
        v12 = v18 + 24;
        v22 = (char *)*v5;
        v21 = (char *)v5[1];
        if (v21 == *v5)
          goto LABEL_16;
        do
        {
          v23 = *(_OWORD *)(v21 - 24);
          *((_QWORD *)v18 - 1) = *((_QWORD *)v21 - 1);
          *(_OWORD *)(v18 - 24) = v23;
          v18 -= 24;
          v21 -= 24;
        }
        while (v21 != v22);
        goto LABEL_15;
      }
LABEL_30:
      sub_239FEBE68();
    }
  }
  else
  {
    v8 = sub_23A0897AC(*(_QWORD **)(a1 + 24), (uint64_t)&v33);
    if (v8)
    {
      v9 = (uint64_t *)v8;
      sub_23A08905C(*(_QWORD *)(a1 + 16), v9[4], v9[5], (uint64_t)v5);
      sub_23A08905C(*(_QWORD *)(a1 + 16), v9[6], v9[7], (uint64_t)v5);
      return;
    }
    v24 = (char *)v5[2];
    v11 = (char *)v5[1];
    if (v11 >= v24)
    {
      v25 = 0xAAAAAAAAAAAAAAABLL * ((v11 - (_BYTE *)*v5) >> 3);
      v26 = v25 + 1;
      if (v25 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        v27 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (_BYTE *)*v5) >> 3);
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x555555555555555)
          v28 = 0xAAAAAAAAAAAAAAALL;
        else
          v28 = v26;
        v29 = (char *)sub_23A05ED84((uint64_t)(v5 + 2), v28);
        v18 = &v29[24 * v25];
        v20 = &v29[24 * v30];
        *(_OWORD *)v18 = v33;
        *((_DWORD *)v18 + 4) = v7;
        v12 = v18 + 24;
        v31 = (char *)*v5;
        v21 = (char *)v5[1];
        if (v21 == *v5)
          goto LABEL_16;
        do
        {
          v32 = *(_OWORD *)(v21 - 24);
          *((_QWORD *)v18 - 1) = *((_QWORD *)v21 - 1);
          *(_OWORD *)(v18 - 24) = v32;
          v18 -= 24;
          v21 -= 24;
        }
        while (v21 != v31);
LABEL_15:
        v21 = (char *)*v5;
LABEL_16:
        *v5 = v18;
        v5[1] = v12;
        v5[2] = v20;
        if (v21)
          operator delete(v21);
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  *(_OWORD *)v11 = v33;
  *((_DWORD *)v11 + 4) = v7;
  v12 = v11 + 24;
LABEL_18:
  v5[1] = v12;
}

uint64_t sub_23A089764(uint64_t a1, uint64_t a2)
{
  if (sub_23A0898C0(a2, (uint64_t)&unk_250B0C590))
    return a1 + 8;
  else
    return 0;
}

void *sub_23A0897A0()
{
  return &unk_250B0C590;
}

uint64_t **sub_23A0897AC(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **v11;
  uint64_t *v12;
  size_t v13;
  uint64_t v14;
  unint64_t v15;

  v4 = sub_23A089444((uint64_t)(a1 + 3), *(uint64_t **)a2, *(_QWORD *)(a2 + 8));
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v14 = a2;
    v12 = *(uint64_t **)a2;
    v13 = *(_QWORD *)(v14 + 8);
    do
    {
      v15 = (unint64_t)v11[1];
      if (v15 == v6)
      {
        if (v11[3] == (uint64_t *)v13 && !memcmp(v11[2], v12, v13))
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v15 >= *(_QWORD *)&v5)
            v15 %= *(_QWORD *)&v5;
        }
        else
        {
          v15 &= *(_QWORD *)&v5 - 1;
        }
        if (v15 != v9)
          return 0;
      }
      v11 = (uint64_t **)*v11;
    }
    while (v11);
  }
  return v11;
}

BOOL sub_23A0898C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

_QWORD *sub_23A08990C(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_23A089A74(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_23A08A288(a1);
}

void sub_23A089A80()
{
  _QWORD *v0;
  _QWORD *v1;

  if (!dword_2569425B0)
  {
    v0 = sub_23A089AC8(MEMORY[0x24BEDB310], "Program terminated with an unrecoverable error.");
    v1 = sub_23A089AFC(v0);
    sub_23A089B8C(v1);
    exit(-1);
  }
  dword_2569425B0 = 2;
}

_QWORD *sub_23A089AC8(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return sub_23A00AE20(a1, (uint64_t)__s, v4);
}

_QWORD *sub_23A089AFC(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_23A089B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A089B90(_QWORD *result)
{
  *result = 0;
  return result;
}

uint64_t *sub_23A089B98(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
    sub_23A089F6C((uint64_t)a1, v2);
  return a1;
}

uint64_t sub_23A089BCC(uint64_t a1, int a2, const void *a3, size_t a4)
{
  uint64_t v8;
  __int128 *p_dst;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 __dst;
  unint64_t v16;

  v8 = operator new();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 8) = 0;
  *(_QWORD *)a1 = v8;
  *(_DWORD *)v8 = a2;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  if (a4 >= 0x17)
  {
    v10 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v10 = a4 | 7;
    v11 = v10 + 1;
    p_dst = (__int128 *)operator new(v10 + 1);
    *((_QWORD *)&__dst + 1) = a4;
    v16 = v11 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v16) = a4;
  p_dst = &__dst;
  if (a4)
LABEL_8:
    memmove(p_dst, a3, a4);
  *((_BYTE *)p_dst + a4) = 0;
  v12 = *(_QWORD *)a1 + 8;
  if (*(char *)(*(_QWORD *)a1 + 31) < 0)
    operator delete(*(void **)v12);
  v13 = __dst;
  *(_QWORD *)(v12 + 16) = v16;
  *(_OWORD *)v12 = v13;
  return a1;
}

void sub_23A089CD4(_Unwind_Exception *exception_object)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *v1 = 0;
  if (v3)
    sub_23A089F6C((uint64_t)v1, v3);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_23A089CF8(uint64_t *a1, _DWORD **a2)
{
  uint64_t v4;
  _DWORD *v5;
  _BYTE *v6;
  __int128 v7;

  if (*a2)
  {
    v4 = operator new();
    v5 = *a2;
    *(_DWORD *)v4 = **a2;
    v6 = (_BYTE *)(v4 + 8);
    if (*((char *)v5 + 31) < 0)
    {
      sub_239FF1F64(v6, *((void **)v5 + 1), *((_QWORD *)v5 + 2));
    }
    else
    {
      v7 = *(_OWORD *)(v5 + 2);
      *(_QWORD *)(v4 + 24) = *((_QWORD *)v5 + 3);
      *(_OWORD *)v6 = v7;
    }
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return a1;
}

void sub_23A089D84(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x1012C40849EBCB1);
  _Unwind_Resume(a1);
}

void sub_23A089DAC(uint64_t *a1, _DWORD **a2)
{
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  _BYTE *v7;
  __int128 v8;

  v3 = *a1;
  if ((_DWORD *)*a1 != *a2)
  {
    if (*a2)
    {
      v5 = operator new();
      v6 = *a2;
      *(_DWORD *)v5 = **a2;
      v7 = (_BYTE *)(v5 + 8);
      if (*((char *)v6 + 31) < 0)
      {
        sub_239FF1F64(v7, *((void **)v6 + 1), *((_QWORD *)v6 + 2));
      }
      else
      {
        v8 = *(_OWORD *)(v6 + 2);
        *(_QWORD *)(v5 + 24) = *((_QWORD *)v6 + 3);
        *(_OWORD *)v7 = v8;
      }
      v3 = *a1;
    }
    else
    {
      v5 = 0;
    }
    *a1 = v5;
    if (v3)
      sub_23A089F6C((uint64_t)a1, v3);
  }
}

void sub_23A089E5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x1012C40849EBCB1);
  _Unwind_Resume(a1);
}

const char *sub_23A089E80(uint64_t *a1)
{
  uint64_t v1;
  const char *result;

  v1 = *a1;
  if (!*a1)
    return "";
  result = (const char *)(v1 + 8);
  if (*(char *)(v1 + 31) < 0)
    return *(const char **)result;
  return result;
}

std::string *sub_23A089EAC@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  _DWORD *v3;
  unsigned int v5;
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;

  v3 = *(_DWORD **)a1;
  if (!*(_QWORD *)a1)
    return (std::string *)sub_239FEE1FC(a2, "OK");
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v5 = *v3 - 1;
  if (v5 < 0x10)
    MEMORY[0x23B83FB88](a2, (&off_250B0E7A8)[v5]);
  std::string::append(a2, ": ");
  v6 = *(char *)(*(_QWORD *)a1 + 31);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)(*(_QWORD *)a1 + 8);
  else
    v7 = *(const std::string::value_type **)(*(_QWORD *)a1 + 8);
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(*(_QWORD *)a1 + 31);
  else
    v8 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  return std::string::append(a2, v7, v8);
}

void sub_23A089F50(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_23A089F6C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(char *)(a2 + 31) < 0)
      operator delete(*(void **)(a2 + 8));
    JUMPOUT(0x23B83FE88);
  }
}

_QWORD *sub_23A089FC0()
{
  unsigned __int8 v0;
  pthread_key_t *v2;

  v0 = atomic_load((unsigned __int8 *)&qword_2569421E0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_2569421E0))
  {
    v2 = (pthread_key_t *)operator new();
    pthread_key_create(v2, (void (__cdecl *)(void *))sub_23A08A99C);
    qword_2569421D8 = (uint64_t)v2;
    __cxa_guard_release(&qword_2569421E0);
  }
  return sub_23A08A074((pthread_key_t *)qword_2569421D8);
}

void sub_23A08A03C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x1000C4000313F17);
  __cxa_guard_abort(&qword_2569421E0);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A08A074(pthread_key_t *a1)
{
  _QWORD *v2;

  v2 = pthread_getspecific(*a1);
  if (!v2)
  {
    v2 = operator new(0x40uLL, (std::align_val_t)0x40uLL);
    *(_OWORD *)v2 = xmmword_23A0A4F70;
    v2[2] = 0;
    pthread_setspecific(*a1, v2);
  }
  return v2;
}

uint64_t sub_23A08A0E0(uint64_t a1, unint64_t a2)
{
  std::string *v4;
  char v6;
  std::string v7[2];

  if (*(_QWORD *)(a1 + 16) < a2)
  {
    sub_23A08BD88((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 111);
    v4 = sub_23A08BDA0(v7, "CHECK failed: n <= size_: ");
    sub_23A08BED0((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v7);
  }
  return a1 + a2;
}

void sub_23A08A154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A08A188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  std::string *v8;
  _QWORD *v9;
  uint64_t v10;
  char v12;
  std::string v13[2];

  v6 = *(_QWORD *)(a1 + 8);
  v7 = v6 + 72;
  if (v6 + 72 > *(_QWORD *)(a1 + 16))
  {
    sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arena.cc", 398);
    v8 = sub_23A08BDA0(v13, "CHECK failed: (pos + ArenaImpl::kSerialArenaSize) <= (b->size()): ");
    sub_23A08BED0((uint64_t)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v13);
  }
  v9 = (_QWORD *)sub_23A08A0E0(a1, v6);
  *(_QWORD *)(a1 + 8) = v7;
  *v9 = a3;
  v9[1] = a2;
  v9[2] = a1;
  v9[5] = sub_23A08A0E0(a1, v7);
  v10 = sub_23A08A0E0(a1, *(_QWORD *)(a1 + 16));
  v9[3] = 0;
  v9[7] = 0;
  v9[8] = 0;
  v9[6] = v10;
  return v9;
}

void sub_23A08A258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A08A288(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_23A08A298(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *sub_23A08A2B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  std::string *v8;
  size_t v9;
  void *result;
  unint64_t *v11;
  unint64_t v12;
  char v13;
  std::string v14[2];

  v5 = *(_QWORD *)(a1 + 32);
  if (a2 == -1)
  {
    if (v5)
      v7 = *(_QWORD *)v5;
    else
      v7 = 256;
  }
  else
  {
    if (v5)
      v6 = *(_QWORD *)(v5 + 8);
    else
      v6 = 0x2000;
    if (v6 >= 2 * a2)
      v7 = 2 * a2;
    else
      v7 = v6;
  }
  if (a3 >= 0xFFFFFFFFFFFFFFE8)
  {
    sub_23A08BD88((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arena.cc", 245);
    v8 = sub_23A08BDA0(v14, "CHECK failed: (min_bytes) <= (std::numeric_limits<size_t>::max() - kBlockHeaderSize): ");
    sub_23A08BED0((uint64_t)&v13, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v14);
    v5 = *(_QWORD *)(a1 + 32);
  }
  if (v7 <= a3 + 24)
    v9 = a3 + 24;
  else
    v9 = v7;
  if (v5)
    result = (void *)(*(uint64_t (**)(size_t))(v5 + 16))(v9);
  else
    result = operator new(v9);
  v11 = (unint64_t *)(a1 + 16);
  do
    v12 = __ldxr(v11);
  while (__stxr(v12 + v9, v11));
  return result;
}

void sub_23A08A3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23A08A3BC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  if (a1)
    v6 = *(_QWORD *)(a1 + 16);
  else
    v6 = -1;
  v7 = (uint64_t *)sub_23A08A2B0(a3, v6, a2);
  return sub_23A08A8F4(v7, v8, a1, 0, 0);
}

_QWORD *sub_23A08A404(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;

  result = (_QWORD *)a1[3];
  do
  {
    if (result)
    {
      if ((unint64_t)(2 * *result) >= 0x40)
        v7 = 64;
      else
        v7 = 2 * *result;
    }
    else
    {
      v7 = 8;
    }
    result = (_QWORD *)sub_23A08A498(a1, (16 * (_WORD)v7 + 23) & 0xFF0);
    v8 = a1[3];
    *result = v7;
    result[1] = v8;
    a1[3] = (uint64_t)result;
    a1[7] = (uint64_t)(result + 2);
    a1[8] = (uint64_t)&result[2 * v7 + 2];
  }
  while (!(16 * v7));
  result[2] = a2;
  result[3] = a3;
  a1[7] = (uint64_t)(result + 4);
  return result;
}

unint64_t sub_23A08A498(uint64_t *a1, unint64_t a2)
{
  std::string *v4;
  unint64_t result;
  unint64_t v6;
  std::string *v7;
  char v8;
  std::string v9[2];

  if (((a2 + 7) & 0xFFFFFFFFFFFFFFF8) != a2)
  {
    sub_23A08BD88((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 159);
    v4 = sub_23A08BDA0(v9, "CHECK failed: (internal::AlignUpTo8(n)) == (n): ");
    sub_23A08BED0((uint64_t)&v8, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v9);
  }
  result = a1[5];
  v6 = a1[6];
  if (v6 < result)
  {
    sub_23A08BD88((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 160);
    v7 = sub_23A08BDA0(v9, "CHECK failed: (limit_) >= (ptr_): ");
    sub_23A08BED0((uint64_t)&v8, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v9);
    result = a1[5];
    v6 = a1[6];
  }
  if (v6 - result < a2)
    return sub_23A08A804(a1, a2);
  a1[5] = result + a2;
  return result;
}

void sub_23A08A57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t sub_23A08A59C(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t *v7;
  _QWORD *v9;

  v6 = sub_23A089FC0();
  if (v6[1] == a1[3])
  {
    v7 = (uint64_t *)v6[2];
    return sub_23A08A624(v7, a2, a3);
  }
  v9 = sub_23A089FC0();
  v7 = (uint64_t *)atomic_load(a1 + 1);
  if (v7 && (_QWORD *)v7[1] == v9)
    return sub_23A08A624(v7, a2, a3);
  return sub_23A08A680(a1, a2, a3);
}

unint64_t sub_23A08A624(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t *v7;

  v5 = sub_23A08A498(a1, a2);
  v6 = v5;
  v7 = (unint64_t *)a1[7];
  if (v7 == (unint64_t *)a1[8])
  {
    sub_23A08A404(a1, v5, a3);
  }
  else
  {
    *v7 = v5;
    v7[1] = a3;
    a1[7] = (uint64_t)(v7 + 2);
  }
  return v6;
}

unint64_t sub_23A08A680(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t *v7;

  v6 = sub_23A089FC0();
  v7 = (uint64_t *)sub_23A08A70C(a1, (uint64_t)v6);
  return sub_23A08A624(v7, a2, a3);
}

unint64_t sub_23A08A6D8(unint64_t *a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t *v5;

  v4 = sub_23A089FC0();
  v5 = (uint64_t *)sub_23A08A70C(a1, (uint64_t)v4);
  return sub_23A08A498(v5, a2);
}

unint64_t sub_23A08A70C(unint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;

  v4 = atomic_load(a1);
  if (!v4)
  {
LABEL_4:
    v5 = sub_23A08A2B0((uint64_t)a1, -1, 0x48uLL);
    *(_OWORD *)v5 = xmmword_23A0A4F80;
    v5[2] = v6;
    v7 = sub_23A08A188((uint64_t)v5, a2, (uint64_t)a1);
    v4 = (unint64_t)v7;
    v8 = *a1;
    v7[4] = *a1;
    v9 = __ldxr(a1);
    if (v9 == v8)
    {
      if (__stlxr((unint64_t)v7, a1))
        goto LABEL_8;
      goto LABEL_14;
    }
    __clrex();
LABEL_8:
    while (1)
    {
      v7[4] = v9;
      v10 = __ldxr(a1);
      if (v10 != v9)
        break;
      if (__stlxr((unint64_t)v7, a1))
        goto LABEL_12;
      v11 = 1;
LABEL_13:
      v9 = v10;
      if ((v11 & 1) != 0)
        goto LABEL_14;
    }
    __clrex();
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  while (*(_QWORD *)(v4 + 8) != a2)
  {
    v4 = *(_QWORD *)(v4 + 32);
    if (!v4)
      goto LABEL_4;
  }
LABEL_14:
  sub_23A089FC0()[2] = v4;
  v12 = a1[3];
  sub_23A089FC0()[1] = v12;
  atomic_store(v4, a1 + 1);
  return v4;
}

uint64_t sub_23A08A804(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;

  v4 = a1[2];
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(v4 + 16) - a1[6] + a1[5];
  v5 = sub_23A08A3BC(v4, a2, *a1);
  a1[2] = (uint64_t)v5;
  a1[5] = sub_23A08A0E0((uint64_t)v5, v5[1]);
  a1[6] = sub_23A08A0E0(a1[2], *(_QWORD *)(a1[2] + 16));
  return sub_23A08A498(a1, a2);
}

unint64_t sub_23A08A884(unint64_t *a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t *v5;
  _QWORD *v7;

  v4 = sub_23A089FC0();
  if (v4[1] == a1[3])
  {
    v5 = (uint64_t *)v4[2];
    return sub_23A08A498(v5, a2);
  }
  v7 = sub_23A089FC0();
  v5 = (uint64_t *)atomic_load(a1 + 1);
  if (v5 && (_QWORD *)v5[1] == v7)
    return sub_23A08A498(v5, a2);
  return sub_23A08A6D8(a1, a2);
}

uint64_t *sub_23A08A8F4(uint64_t *a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v6;
  std::string *v7;
  char v9;
  std::string v10[2];

  v6 = 2;
  if (!a5)
    v6 = 0;
  *a1 = v6 | a4 | a3;
  a1[1] = 24;
  a1[2] = a2;
  if ((a3 & 3) != 0)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/arena_impl.h", 107);
    v7 = sub_23A08BDA0(v10, "CHECK failed: (reinterpret_cast<uintptr_t>(next) & 3) == (0u): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v10);
  }
  return a1;
}

void sub_23A08A984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08A99C(uint64_t result)
{
  if (result)
    JUMPOUT(0x23B83FE7CLL);
  return result;
}

unint64_t sub_23A08A9AC(_QWORD *a1)
{
  unsigned __int8 v2;
  unint64_t v3;

  v2 = atomic_load((unsigned __int8 *)&qword_256942088);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_256942088))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_2569412B8, &dword_239FE9000);
    __cxa_guard_release(&qword_256942088);
  }
  std::mutex::lock(&stru_2569412B8);
  v3 = atomic_load(a1 + 3);
  if (!v3)
  {
    sub_23A063BF4(a1, (void *)*a1, a1[1]);
    atomic_store((unint64_t)a1, a1 + 3);
    v3 = (unint64_t)a1;
  }
  std::mutex::unlock(&stru_2569412B8);
  return v3;
}

unint64_t sub_23A08AA5C(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  unint64_t result;
  unint64_t v8;
  __int128 v9;

  if (*a1 != a2)
  {
    sub_23A07DAB4(a1);
    JUMPOUT(0x23B83FB94);
  }
  if (!a4)
  {
    result = operator new();
    v8 = result;
    if ((*((char *)a3 + 23) & 0x80000000) == 0)
    {
      *(_OWORD *)result = *a3;
      *(_QWORD *)(result + 16) = *((_QWORD *)a3 + 2);
      goto LABEL_11;
    }
LABEL_10:
    result = (unint64_t)sub_239FF1F64((_BYTE *)result, *(void **)a3, *((_QWORD *)a3 + 1));
    goto LABEL_11;
  }
  if ((*(_BYTE *)(a4 + 24) & 1) != 0)
    (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a4 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a4 + 32) + 32), &unk_250B0C510, 24);
  result = sub_23A08A59C((unint64_t *)a4, 0x18uLL, (uint64_t)sub_23A086A68);
  v8 = result;
  if (*((char *)a3 + 23) < 0)
    goto LABEL_10;
  v9 = *a3;
  *(_QWORD *)(result + 16) = *((_QWORD *)a3 + 2);
  *(_OWORD *)result = v9;
LABEL_11:
  *a1 = v8;
  return result;
}

void sub_23A08AB80(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void sub_23A08ABA4(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*a1 == a2)
  {
    if (a4)
    {
      if ((*(_BYTE *)(a4 + 24) & 1) != 0)
      {
        v11 = a4;
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a4 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a4 + 32) + 32), &unk_250B0C510, 24);
        a4 = v11;
      }
      v9 = sub_23A08A59C((unint64_t *)a4, 0x18uLL, (uint64_t)sub_23A086A68);
      v10 = *((_QWORD *)a3 + 2);
      *(_OWORD *)v9 = *a3;
      *(_QWORD *)(v9 + 16) = v10;
      *((_QWORD *)a3 + 1) = 0;
      *((_QWORD *)a3 + 2) = 0;
      *(_QWORD *)a3 = 0;
    }
    else
    {
      v9 = operator new();
      *(_OWORD *)v9 = *a3;
      *(_QWORD *)(v9 + 16) = *((_QWORD *)a3 + 2);
      *(_QWORD *)a3 = 0;
      *((_QWORD *)a3 + 1) = 0;
      *((_QWORD *)a3 + 2) = 0;
    }
    *a1 = v9;
  }
  else
  {
    v6 = sub_23A07DAB4(a1);
    v7 = v6;
    if (*(char *)(v6 + 23) < 0)
      operator delete(*(void **)v6);
    v8 = *a3;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a3 + 2);
    *(_OWORD *)v7 = v8;
    *((_BYTE *)a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
  }
}

unint64_t sub_23A08ACAC(uint64_t *a1, __int128 *a2, uint64_t a3)
{
  return sub_23A08AA5C(a1, (uint64_t)&qword_2569425B8, a2, a3);
}

void sub_23A08ACC0(uint64_t *a1, __int128 *a2, uint64_t a3)
{
  sub_23A08ABA4(a1, (uint64_t)&qword_2569425B8, a2, a3);
}

unint64_t sub_23A08ACD4(uint64_t *a1, __int128 *a2, uint64_t a3)
{
  return sub_23A08AA5C(a1, 0, a2, a3);
}

uint64_t *sub_23A08ACE4(uint64_t *a1, uint64_t a2)
{
  if ((uint64_t *)*a1 == &qword_2569425B8)
    return sub_23A08AD00((uint64_t **)a1, a2);
  else
    return (uint64_t *)sub_23A07DAB4(a1);
}

uint64_t *sub_23A08AD00(uint64_t **a1, uint64_t a2)
{
  std::string *v4;
  uint64_t *result;
  char v6;
  std::string v7[2];

  if (*a1 != &qword_2569425B8)
  {
    sub_23A08BD88((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arenastring.cc", 147);
    v4 = sub_23A08BDA0(v7, "CHECK failed: IsDefault(default_value): ");
    sub_23A08BED0((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v7);
  }
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a2 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a2 + 32) + 32), &unk_250B0C510, 24);
    result = (uint64_t *)sub_23A08A59C((unint64_t *)a2, 0x18uLL, (uint64_t)sub_23A086A68);
  }
  else
  {
    result = (uint64_t *)operator new();
  }
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  *a1 = result;
  return result;
}

void sub_23A08ADE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

_BYTE *sub_23A08ADFC(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  if (*a1)
    return (_BYTE *)sub_23A07DAB4(a1);
  else
    return sub_23A08AE18(a1, a3, a2);
}

_BYTE *sub_23A08AE18(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  std::string *v6;
  unint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  __int128 v10;
  char v12;
  std::string v13[2];

  if (*a1)
  {
    sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/arenastring.cc", 147);
    v6 = sub_23A08BDA0(v13, "CHECK failed: IsDefault(default_value): ");
    sub_23A08BED0((uint64_t)&v12, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v13);
  }
  v7 = atomic_load(a3 + 3);
  if (v7)
  {
    if (a2)
      goto LABEL_5;
  }
  else
  {
    v7 = sub_23A08A9AC(a3);
    if (a2)
    {
LABEL_5:
      if ((*(_BYTE *)(a2 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(a2 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(a2 + 32) + 32), &unk_250B0C510, 24);
      v8 = (_BYTE *)sub_23A08A59C((unint64_t *)a2, 0x18uLL, (uint64_t)sub_23A086A68);
      v9 = v8;
      if (*(char *)(v7 + 23) < 0)
        goto LABEL_8;
LABEL_11:
      v10 = *(_OWORD *)v7;
      *((_QWORD *)v9 + 2) = *(_QWORD *)(v7 + 16);
      *(_OWORD *)v9 = v10;
      goto LABEL_12;
    }
  }
  v8 = (_BYTE *)operator new();
  v9 = v8;
  if ((*(char *)(v7 + 23) & 0x80000000) == 0)
    goto LABEL_11;
LABEL_8:
  sub_239FF1F64(v8, *(void **)v7, *(_QWORD *)(v7 + 8));
LABEL_12:
  *a1 = v9;
  return v9;
}

void sub_23A08AF58(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B83FE88](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

std::string *sub_23A08AF90(std::string *result, _QWORD *a2)
{
  std::string *v3;
  const std::string *v4;

  if (result->__r_.__value_.__r.__words[0])
  {
    v3 = (std::string *)sub_23A07DAB4((uint64_t *)result);
    v4 = (const std::string *)atomic_load(a2 + 3);
    if (!v4)
      v4 = (const std::string *)sub_23A08A9AC(a2);
    return std::string::operator=(v3, v4);
  }
  return result;
}

int64_t sub_23A08AFE8(uint64_t a1, char *a2)
{
  void *v4;
  char *v5;
  int v6;
  std::string *v7;
  std::string *v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  std::string *v12;
  char v14;
  std::string v15[2];

  while (1)
  {
    v5 = *(char **)a1;
    v4 = *(void **)(a1 + 8);
    if (!v4)
    {
      v10 = v5 - a2;
      v9 = v10 + 16;
      *(_QWORD *)(a1 + 8) = a2;
      if ((((_DWORD)v10 + 16) & 0x80000000) == 0)
        return v9;
      goto LABEL_12;
    }
    v6 = (_DWORD)a2 - (_DWORD)v5;
    if (a2 <= v5)
      break;
    if (*(_BYTE *)(a1 + 56))
    {
      sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 685);
      v7 = sub_23A08BDA0(v15, "CHECK failed: !had_error_: ");
      sub_23A08BED0((uint64_t)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v15);
    }
    if (v6 >= 17)
    {
      sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 686);
      v8 = sub_23A08BDA0(v15, "CHECK failed: overrun <= kSlopBytes: ");
      sub_23A08BED0((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v15);
    }
    a2 = &sub_23A08B17C((char **)a1)[v6];
    if (*(_BYTE *)(a1 + 56))
      return 0;
  }
  memcpy(v4, (const void *)(a1 + 16), (size_t)&a2[-a1 - 16]);
  v11 = *(char **)a1;
  *(_QWORD *)(a1 + 8) += &a2[-a1 - 16];
  v9 = v11 - a2;
  if ((((_DWORD)v11 - (_DWORD)a2) & 0x80000000) == 0)
    return v9;
LABEL_12:
  sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 700);
  v12 = sub_23A08BDA0(v15, "CHECK failed: s >= 0: ");
  sub_23A08BED0((uint64_t)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
  sub_23A08BED8((uint64_t)v15);
  return v9;
}

void sub_23A08B154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A08B17C(char **a1)
{
  std::string *v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  std::string *v9;
  std::string::size_type v10;
  char v11;
  int v12;
  std::string v13[2];

  if (*((_BYTE *)a1 + 56))
  {
    sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 788);
    v2 = sub_23A08BDA0(v13, "CHECK failed: !had_error_: ");
    sub_23A08BED0((uint64_t)&v12, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v13);
  }
  if (a1[6])
  {
    v3 = (char *)(a1 + 2);
    v5 = *a1;
    v4 = a1[1];
    if (v4)
    {
      memcpy(v4, a1 + 2, v5 - v3);
      v12 = 0;
      do
      {
        v13[0].__r_.__value_.__r.__words[0] = 0;
        if (((*(uint64_t (**)(char *, std::string *, int *))(*(_QWORD *)a1[6] + 16))(a1[6], v13, &v12) & 1) == 0)
        {
          *((_BYTE *)a1 + 56) = 1;
          goto LABEL_14;
        }
        v6 = v12;
      }
      while (!v12);
      v5 = (char *)v13[0].__r_.__value_.__r.__words[0];
      if (v12 >= 17)
      {
        *(_OWORD *)v13[0].__r_.__value_.__l.__data_ = *(_OWORD *)*a1;
        *a1 = &v5[v6 - 16];
        a1[1] = 0;
        return v5;
      }
      if (v12 <= 0)
      {
        v10 = v13[0].__r_.__value_.__r.__words[0];
        sub_23A08BD88((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 810);
        v9 = sub_23A08BDA0(v13, "CHECK failed: size > 0: ");
        sub_23A08BED0((uint64_t)&v11, (const char **)&v9->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v13);
        LODWORD(v6) = v12;
        v5 = (char *)v10;
      }
      *(_OWORD *)v3 = *(_OWORD *)*a1;
      v7 = &v3[(int)v6];
    }
    else
    {
      *(_OWORD *)v3 = *(_OWORD *)v5;
      v7 = (char *)(a1 + 4);
    }
    *a1 = v7;
    a1[1] = v5;
  }
  else
  {
    *((_BYTE *)a1 + 56) = 1;
    v3 = (char *)(a1 + 2);
LABEL_14:
    *a1 = (char *)(a1 + 4);
  }
  return v3;
}

void sub_23A08B2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A08B318(uint64_t a1, char *a2)
{
  int64_t v3;

  if (!*(_BYTE *)(a1 + 56))
  {
    v3 = sub_23A08AFE8(a1, a2);
    if ((_DWORD)v3)
      (*(void (**)(_QWORD, int64_t))(**(_QWORD **)(a1 + 48) + 24))(*(_QWORD *)(a1 + 48), v3);
    a2 = (char *)(a1 + 16);
    *(_QWORD *)a1 = a1 + 16;
    *(_QWORD *)(a1 + 8) = a1 + 16;
  }
  return a2;
}

char *sub_23A08B364(uint64_t a1, char *a2)
{
  char *v3;
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  while (!*(_BYTE *)(a1 + 56))
  {
    v3 = &a2[-*(_QWORD *)a1];
    if ((v3 & 0x80000000) != 0)
    {
      sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 829);
      v5 = sub_23A08BDA0(v8, "CHECK failed: overrun >= 0: ");
      sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
      goto LABEL_6;
    }
    if (v3 > 0x10)
    {
      sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/coded_stream.cc", 830);
      v4 = sub_23A08BDA0(v8, "CHECK failed: overrun <= kSlopBytes: ");
      sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
LABEL_6:
      sub_23A08BED8((uint64_t)v8);
    }
    a2 = &sub_23A08B17C((char **)a1)[(int)v3];
    if ((unint64_t)a2 < *(_QWORD *)a1)
      return a2;
  }
  return (char *)(a1 + 16);
}

void sub_23A08B454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A08B474(uint64_t *a1, char *a2, int a3, unint64_t a4)
{
  char *v4;
  int i;

  v4 = (char *)a4;
  for (i = sub_23A08B514(a1, a4); a3 > i; i = sub_23A08B514(a1, (unint64_t)v4))
  {
    memcpy(v4, a2, i);
    a3 -= i;
    a2 += i;
    v4 = sub_23A08B364((uint64_t)a1, &v4[i]);
  }
  memcpy(v4, a2, a3);
  return &v4[a3];
}

uint64_t sub_23A08B514(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  std::string *v5;
  char v7;
  std::string v8[2];

  v3 = *a1;
  if (*a1 + 16 < a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/io/coded_stream.h", 838);
    v5 = sub_23A08BDA0(v8, "CHECK failed: ptr <= end_ + kSlopBytes: ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
    v3 = *a1;
  }
  return v3 - a2 + 16;
}

void sub_23A08B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A08B5AC(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  char *v8;

  if (sub_23A08B514((uint64_t *)a1, (unint64_t)a4) <= (int)a3)
  {
    v8 = sub_23A08B318(a1, a4);
    if (((*(uint64_t (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(a1 + 48) + 40))(*(_QWORD *)(a1 + 48), a2, a3) & 1) == 0)
    {
      *(_BYTE *)(a1 + 56) = 1;
      v8 = (char *)(a1 + 16);
      *(_QWORD *)a1 = a1 + 32;
    }
    return v8;
  }
  if (*(_QWORD *)a1 - (_QWORD)a4 >= (int)a3)
  {
    memcpy(a4, a2, (int)a3);
    return &a4[(int)a3];
  }
  return sub_23A08B474((uint64_t *)a1, (char *)a2, a3, (unint64_t)a4);
}

char *sub_23A08B688(unint64_t *a1, int a2, void **a3, char *a4)
{
  char *v4;
  unint64_t v8;
  uint64_t v9;
  std::string *v10;
  unsigned int v11;
  _BYTE *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  char *v17;
  void *v18;
  unsigned int v20;
  unsigned int v21;
  char v22;
  std::string v23[2];

  v4 = a4;
  v8 = *a1;
  if (*a1 <= (unint64_t)a4)
  {
    v4 = sub_23A08B364((uint64_t)a1, a4);
    v8 = *a1;
  }
  if (*((char *)a3 + 23) >= 0)
    v9 = *((unsigned __int8 *)a3 + 23);
  else
    v9 = *((unsigned int *)a3 + 2);
  if (v8 <= (unint64_t)v4)
  {
    sub_23A08BD88((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/io/coded_stream.h", 858);
    v10 = sub_23A08BDA0(v23, "CHECK failed: ptr < end_: ");
    sub_23A08BED0((uint64_t)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v23);
  }
  v11 = (8 * a2) | 2;
  if (v11 > 0x7F)
  {
    *v4 = (8 * a2) | 0x82;
    v13 = (8 * a2) >> 7;
    if (v11 >> 14)
    {
      v12 = v4 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        v14 = v13 >> 7;
        ++v12;
        v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v4[1] = v13;
      v12 = v4 + 2;
    }
  }
  else
  {
    *v4 = v11;
    v12 = v4 + 1;
  }
  if (v9 >= 0x80)
  {
    v20 = v9;
    do
    {
      *v12++ = v20 | 0x80;
      v16 = v20 >> 7;
      v21 = v20 >> 14;
      v20 >>= 7;
    }
    while (v21);
  }
  else
  {
    LOBYTE(v16) = v9;
  }
  *v12 = v16;
  v17 = v12 + 1;
  if (*((char *)a3 + 23) >= 0)
    v18 = a3;
  else
    v18 = *a3;
  return sub_23A08B80C((uint64_t)a1, v18, v9, v17);
}

void sub_23A08B7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A08B80C(uint64_t a1, void *a2, uint64_t a3, char *__dst)
{
  uint64_t v6;

  if (*(_BYTE *)(a1 + 57))
    return sub_23A08B5AC(a1, a2, a3, __dst);
  if (*(_QWORD *)a1 - (_QWORD)__dst < (int)a3)
    return sub_23A08B474((uint64_t *)a1, (char *)a2, a3, (unint64_t)__dst);
  v6 = (int)a3;
  memcpy(__dst, a2, (int)a3);
  return &__dst[v6];
}

char *sub_23A08B874(uint64_t *a1, int a2, uint64_t a3, char *a4)
{
  char *v4;
  unint64_t v8;
  uint64_t v9;
  std::string *v10;
  unsigned int v11;
  _BYTE *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  char *v17;
  char *v18;
  unsigned int v20;
  unsigned int v21;
  char v22;
  std::string v23[2];

  v4 = a4;
  v8 = *a1;
  if (*a1 <= (unint64_t)a4)
  {
    v4 = sub_23A08B364((uint64_t)a1, a4);
    v8 = *a1;
  }
  if (*(char *)(a3 + 23) >= 0)
    LODWORD(v9) = *(unsigned __int8 *)(a3 + 23);
  else
    v9 = *(_QWORD *)(a3 + 8);
  if (v8 <= (unint64_t)v4)
  {
    sub_23A08BD88((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/io/coded_stream.h", 858);
    v10 = sub_23A08BDA0(v23, "CHECK failed: ptr < end_: ");
    sub_23A08BED0((uint64_t)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v23);
  }
  v11 = (8 * a2) | 2;
  if (v11 > 0x7F)
  {
    *v4 = (8 * a2) | 0x82;
    v13 = (8 * a2) >> 7;
    if (v11 >> 14)
    {
      v12 = v4 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        v14 = v13 >> 7;
        ++v12;
        v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v4[1] = v13;
      v12 = v4 + 2;
    }
  }
  else
  {
    *v4 = v11;
    v12 = v4 + 1;
  }
  if (v9 >= 0x80)
  {
    v20 = v9;
    do
    {
      *v12++ = v20 | 0x80;
      v16 = v20 >> 7;
      v21 = v20 >> 14;
      v20 >>= 7;
    }
    while (v21);
  }
  else
  {
    LOBYTE(v16) = v9;
  }
  *v12 = v16;
  v17 = v12 + 1;
  if (*(char *)(a3 + 23) >= 0)
    v18 = (char *)a3;
  else
    v18 = *(char **)a3;
  if (*a1 - (uint64_t)v17 < (int)v9)
    return sub_23A08B474(a1, v18, v9, (unint64_t)v17);
  memcpy(v17, v18, (int)v9);
  return &v17[(int)v9];
}

void sub_23A08BA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A08BA20(int a1, int a2, const std::string::value_type *a3)
{
  const std::string::value_type *v6;
  std::string::size_type v7;
  const std::string::value_type *p_p;
  std::string::size_type v9;
  const std::string::value_type *v10;
  std::string::size_type v11;
  const std::string::value_type *v12;
  std::string::size_type v13;
  void *__p;
  std::string::size_type v15;
  unsigned __int8 v16;
  void *v17;
  std::string::size_type v18;
  unsigned __int8 v19;
  const char *v20;
  const char *v21;
  int v22;
  std::string v23;
  char __str[127];
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a2 > 3014000)
  {
    LODWORD(v20) = 3;
    v21 = "/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/common.cc";
    v22 = 76;
    memset(&v23, 0, sizeof(v23));
    std::string::append(&v23, "This program requires version ");
    sub_23A08BE08(a2, &v17);
    if ((v19 & 0x80u) == 0)
      v6 = (const std::string::value_type *)&v17;
    else
      v6 = (const std::string::value_type *)v17;
    if ((v19 & 0x80u) == 0)
      v7 = v19;
    else
      v7 = v18;
    std::string::append(&v23, v6, v7);
    std::string::append(&v23, " of the Protocol Buffer runtime library, but the installed version is ");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 3, 14, 0);
    v25 = 0;
    sub_239FEE1FC(&__p, __str);
    if ((v16 & 0x80u) == 0)
      p_p = (const std::string::value_type *)&__p;
    else
      p_p = (const std::string::value_type *)__p;
    if ((v16 & 0x80u) == 0)
      v9 = v16;
    else
      v9 = v15;
    std::string::append(&v23, p_p, v9);
    std::string::append(&v23, ".  Please update your library.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v23, a3);
    std::string::append(&v23, "\".)");
    sub_23A08C06C(&v20);
    if ((char)v16 < 0)
      operator delete(__p);
    if ((char)v19 < 0)
      operator delete(v17);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (a1 < 3014000)
  {
    LODWORD(v20) = 3;
    v21 = "/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/common.cc";
    v22 = 87;
    memset(&v23, 0, sizeof(v23));
    std::string::append(&v23, "This program was compiled against version ");
    sub_23A08BE08(a1, &v17);
    if ((v19 & 0x80u) == 0)
      v10 = (const std::string::value_type *)&v17;
    else
      v10 = (const std::string::value_type *)v17;
    if ((v19 & 0x80u) == 0)
      v11 = v19;
    else
      v11 = v18;
    std::string::append(&v23, v10, v11);
    std::string::append(&v23, " of the Protocol Buffer runtime library, which is not compatible with the installed version (");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 3, 14, 0);
    v25 = 0;
    sub_239FEE1FC(&__p, __str);
    if ((v16 & 0x80u) == 0)
      v12 = (const std::string::value_type *)&__p;
    else
      v12 = (const std::string::value_type *)__p;
    if ((v16 & 0x80u) == 0)
      v13 = v16;
    else
      v13 = v15;
    std::string::append(&v23, v12, v13);
    std::string::append(&v23, ").  Contact the program author for an update.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v23, a3);
    std::string::append(&v23, "\".)");
    sub_23A08C06C(&v20);
    if ((char)v16 < 0)
      operator delete(__p);
    if ((char)v19 < 0)
      operator delete(v17);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
  }
}

void sub_23A08BD18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a17 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(exception_object);
}

uint64_t sub_23A08BD88(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

std::string *sub_23A08BDA0(std::string *a1, const std::string::value_type *a2)
{
  std::string::append(a1 + 1, a2);
  return a1;
}

std::string *sub_23A08BDC8(std::string *a1, const std::string::value_type *a2)
{
  std::string *v3;
  std::string::size_type v4;
  std::string::size_type v5;

  v3 = a1 + 1;
  v4 = *((_QWORD *)a2 + 1);
  if (a2[23] >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    v5 = v4;
  }
  std::string::append(v3, a2, v5);
  return a1;
}

_QWORD *sub_23A08BE08@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%d.%d.%d", a1 / 1000000, a1 / 1000 % 1000, a1 % 1000);
  __str[127] = 0;
  return sub_239FEE1FC(a2, __str);
}

const char **sub_23A08BED0(uint64_t a1, const char **a2)
{
  return sub_23A08C06C(a2);
}

uint64_t sub_23A08BED8(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  return a1;
}

uint64_t sub_23A08BF08(uint64_t result, const char *a2, int a3, uint64_t a4)
{
  FILE **v4;
  const char *v5;

  if ((result & 0x80000000) == 0)
  {
    v4 = (FILE **)MEMORY[0x24BDAC8D8];
    if (*(char *)(a4 + 23) >= 0)
      v5 = (const char *)a4;
    else
      v5 = *(const char **)a4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "[libprotobuf %s %s:%d] %s\n", (&off_250B0E828)[result], a2, a3, v5);
    return fflush(*v4);
  }
  return result;
}

std::string *sub_23A08BF74(std::string *a1, int a2)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%d", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *sub_23A08BFF0(std::string *a1, uint64_t a2)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%lu", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

const char **sub_23A08C06C(const char **result)
{
  const char **v1;
  uint64_t v2;
  int v3;
  void *exception;

  v1 = result;
  if (*(_DWORD *)result == 3)
  {
    v2 = 3;
  }
  else
  {
    v3 = atomic_load((unsigned int *)&unk_2569421E8);
    if (v3 > 0)
      goto LABEL_6;
    v2 = *(unsigned int *)result;
  }
  result = (const char **)off_256941300(v2, v1[1], *((_DWORD *)v1 + 4), (uint64_t)(v1 + 3));
LABEL_6:
  if (*(_DWORD *)v1 == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    sub_23A08C120(exception, v1[1], *((unsigned int *)v1 + 4), v1 + 3);
    __cxa_throw(exception, (struct type_info *)&unk_250B0C410, (void (*)(void *))sub_23A08C124);
  }
  return result;
}

void sub_23A08C10C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23A08C128(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_250B0D778;
  if (SHIBYTE(this[5].__vftable) < 0)
    operator delete(this[3].__vftable);
  std::exception::~exception(this);
}

void sub_23A08C164(std::exception *a1)
{
  sub_23A08C128(a1);
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A08C188(uint64_t a1)
{
  uint64_t result;

  result = a1 + 24;
  if (*(char *)(a1 + 47) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t sub_23A08C1A4(uint64_t a1, uint64_t a2, int a3, __int128 *a4)
{
  uint64_t v5;
  __int128 v6;

  *(_QWORD *)a1 = &off_250B0D778;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  v5 = a1 + 24;
  if (*((char *)a4 + 23) < 0)
  {
    sub_239FF1F64((_BYTE *)v5, *(void **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v6 = *a4;
    *(_QWORD *)(v5 + 16) = *((_QWORD *)a4 + 2);
    *(_OWORD *)v5 = v6;
  }
  return a1;
}

void sub_23A08C1FC(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08C210(uint64_t a1, int a2, _OWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t *i;
  unint64_t v12;
  __int128 v14;

  if (qword_2569421F0)
  {
    v3 = *(int8x8_t *)(qword_2569421F0 + 8);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 8);
      v5 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
      v6 = 0x9DDFEA08EB382D69 * (HIDWORD(v4) ^ (v5 >> 47) ^ v5);
      v7 = (0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47))) ^ a2;
      v8 = (uint8x8_t)vcnt_s8(v3);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = v7;
        if (v7 >= *(_QWORD *)&v3)
          v9 = v7 % *(_QWORD *)&v3;
      }
      else
      {
        v9 = (*(_QWORD *)&v3 - 1) & v7;
      }
      v10 = *(uint64_t ***)(*(_QWORD *)qword_2569421F0 + 8 * v9);
      if (v10)
      {
        for (i = *v10; i; i = (uint64_t *)*i)
        {
          v12 = i[1];
          if (v7 == v12)
          {
            if (i[2] == v4 && *((_DWORD *)i + 6) == a2)
            {
              v14 = *((_OWORD *)i + 3);
              *a3 = *((_OWORD *)i + 2);
              a3[1] = v14;
              return 1;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v12 >= *(_QWORD *)&v3)
                v12 %= *(_QWORD *)&v3;
            }
            else
            {
              v12 &= *(_QWORD *)&v3 - 1;
            }
            if (v12 != v9)
              return 0;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t sub_23A08C324(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = a2;
  *(_DWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_23A08C334(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v7;

  if (!*(_QWORD *)a1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
    {
      sub_23A0959FC(*(unsigned __int8 **)v2, (unsigned __int8 *)(v2 + 8));
    }
    else if (*(_WORD *)(a1 + 10))
    {
      v3 = 32 * *(unsigned __int16 *)(a1 + 10);
      v4 = (unsigned __int8 *)(v2 + 8);
      do
      {
        sub_23A0957BC(v4);
        v4 += 32;
        v3 -= 32;
      }
      while (v3);
    }
    v5 = *(_QWORD *)(a1 + 16);
    if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
    {
      if (v5)
      {
        v7 = *(_QWORD *)(a1 + 16);
        sub_23A004580(v5, *(_QWORD **)(v5 + 8));
        MEMORY[0x23B83FE88](v7, 0x1020C4062D53EE8);
      }
    }
    else if (v5)
    {
      MEMORY[0x23B83FE64](v5, 0x1062C802AB6010CLL);
    }
  }
  return a1;
}

unsigned __int8 *sub_23A08C404(unsigned __int8 *result)
{
  unsigned __int8 *v1;
  uint64_t v2;
  std::string *v3;
  uint64_t v4;
  std::string *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  char v10;
  std::string v11[2];

  v1 = result;
  if (result[9])
  {
    v2 = result[8];
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v3 = sub_23A08BDA0(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v10, (const char **)&v3->__r_.__value_.__l.__data_);
      result = (unsigned __int8 *)sub_23A08BED8((uint64_t)v11);
    }
    switch(v2)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
        **(_DWORD **)v1 = 0;
        break;
      case 9:
      case 12:
        result = (unsigned __int8 *)sub_23A086B58(*(_QWORD *)v1);
        break;
      case 10:
      case 11:
        result = (unsigned __int8 *)sub_23A0961A4(*(_QWORD *)v1);
        break;
      default:
        return result;
    }
  }
  else if ((result[10] & 1) == 0)
  {
    v4 = result[8];
    if ((v4 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v5 = sub_23A08BDA0(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      result = (unsigned __int8 *)sub_23A08BED8((uint64_t)v11);
    }
    v6 = dword_23A0A5468[v4];
    if (v6 == 10)
    {
      v8 = **(_QWORD **)v1;
      if ((v1[10] & 0x10) != 0)
        v9 = *(uint64_t (**)(void))(v8 + 112);
      else
        v9 = *(uint64_t (**)(void))(v8 + 40);
      result = (unsigned __int8 *)v9();
    }
    else if (v6 == 9)
    {
      v7 = *(_QWORD *)v1;
      if (*(char *)(*(_QWORD *)v1 + 23) < 0)
      {
        **(_BYTE **)v7 = 0;
        *(_QWORD *)(v7 + 8) = 0;
      }
      else
      {
        *(_BYTE *)v7 = 0;
        *(_BYTE *)(v7 + 23) = 0;
      }
    }
    v1[10] = v1[10] & 0xF0 | 1;
  }
  return result;
}

void sub_23A08C598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08C5B8(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a5;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 1)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 1)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(_DWORD *)v9 = a4;
  return result;
}

void sub_23A08C794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08C7CC(uint64_t *a1, uint64_t a2, int a3, int a4, int a5, uint64_t *a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 1)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3D0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A64);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 1)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT32): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 348);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09AB80(v23, v24 + 1);
    result = sub_23A09AFF4((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    result = sub_23A09AFF4((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08CAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08CAEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a5;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 2)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 2)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(_QWORD *)v9 = a4;
  return result;
}

void sub_23A08CCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08CD00(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t *a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 2)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3F0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A68);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 2)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_INT64): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 349);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09B7D0(v23, v24 + 1);
    result = sub_23A09BC44((uint64_t)v23);
    *(_QWORD *)(result + 8 * v24) = a5;
  }
  else
  {
    result = sub_23A09BC44((uint64_t)v23);
    *(_QWORD *)(result + 8 * v24) = a5;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08CFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08D020(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a5;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 3)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 3)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(_DWORD *)v9 = a4;
  return result;
}

void sub_23A08D1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08D234(uint64_t *a1, uint64_t a2, int a3, int a4, int a5, uint64_t *a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 3)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3E0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A6C);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 3)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT32): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 350);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09B1A8(v23, v24 + 1);
    result = sub_23A09B61C((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    result = sub_23A09B61C((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08D514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08D554(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a5;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 4)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 4)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(_QWORD *)v9 = a4;
  return result;
}

void sub_23A08D730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08D768(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t *a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C400, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A70);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_UINT64): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 351);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09BDF8(v23, v24 + 1);
    result = sub_23A09C26C((uint64_t)v23);
    *(_QWORD *)(result + 8 * v24) = a5;
  }
  else
  {
    result = sub_23A09C26C((uint64_t)v23);
    *(_QWORD *)(result + 8 * v24) = a5;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08DA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08DA88(uint64_t a1, uint64_t a2, int a3, uint64_t a4, float a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a4;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 6)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 6)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(float *)v9 = a5;
  return result;
}

void sub_23A08DC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08DCA4(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t *a5, float a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a5;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 6)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3C0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A74);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 6)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_FLOAT): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 352);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09C420(v23, v24 + 1);
    result = sub_23A09C894((uint64_t)v23);
    *(float *)(result + 4 * v24) = a6;
  }
  else
  {
    result = sub_23A09C894((uint64_t)v23);
    *(float *)(result + 4 * v24) = a6;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08DF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08DFCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a4;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 5)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 5)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(double *)v9 = a5;
  return result;
}

void sub_23A08E1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08E1E8(uint64_t *a1, uint64_t a2, int a3, int a4, uint64_t *a5, double a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a5;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 5)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3B0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A78);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 5)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_DOUBLE): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 353);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09CA48(v23, v24 + 1);
    result = sub_23A09CEBC((uint64_t)v23);
    *(double *)(result + 8 * v24) = a6;
  }
  else
  {
    result = sub_23A09CEBC((uint64_t)v23);
    *(double *)(result + 8 * v24) = a6;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08E4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08E510(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  uint64_t result;
  _BYTE *v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = (_BYTE *)result;
  *(_QWORD *)(result + 16) = a5;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 7)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v9[9] = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = v9[8];
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 7)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  v9[10] &= 0xF0u;
  *v9 = a4;
  return result;
}

void sub_23A08E6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08E724(uint64_t *a1, uint64_t a2, int a3, int a4, char a5, uint64_t *a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 7)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3A0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A7C);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 7)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_BOOL): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 354);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09A560(v23, v24 + 1);
    result = sub_23A09A9D0((uint64_t)v23);
    *(_BYTE *)(result + v24) = a5;
  }
  else
  {
    result = sub_23A09A9D0((uint64_t)v23);
    *(_BYTE *)(result + v24) = a5;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08EA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23A08EA44(uint64_t *a1, uint64_t a2, int a3, char a4, uint64_t *a5)
{
  uint64_t **v9;
  uint64_t **v10;
  char v11;
  uint64_t v12;
  uint64_t (*v13)();
  uint64_t *v14;
  uint64_t v15;
  uint64_t *(*v16)(uint64_t *);

  v9 = sub_23A090F14((uint64_t)a1, a2);
  v10 = v9;
  v9[2] = a5;
  if (v11)
  {
    *((_BYTE *)v9 + 9) = 1;
    *((_BYTE *)v9 + 8) = a3;
    *((_BYTE *)v9 + 11) = a4;
    switch(a3)
    {
      case 1:
        v12 = *a1;
        if (!v12)
          goto LABEL_32;
        if ((*(_BYTE *)(v12 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C3B0, 16);
        v13 = sub_23A095A78;
        goto LABEL_31;
      case 2:
        v12 = *a1;
        if (!v12)
          goto LABEL_32;
        if ((*(_BYTE *)(v12 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C3C0, 16);
        v13 = sub_23A095A74;
        goto LABEL_31;
      case 3:
      case 16:
      case 18:
        v12 = *a1;
        if (!v12)
          goto LABEL_32;
        if ((*(_BYTE *)(v12 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C3F0, 16);
        v13 = sub_23A095A68;
        goto LABEL_31;
      case 4:
      case 6:
        v12 = *a1;
        if (!v12)
          goto LABEL_32;
        if ((*(_BYTE *)(v12 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C400, 16);
        v13 = sub_23A095A70;
        goto LABEL_31;
      case 5:
      case 14:
      case 15:
      case 17:
        v12 = *a1;
        if (!v12)
          goto LABEL_32;
        if ((*(_BYTE *)(v12 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C3D0, 16);
        v13 = sub_23A095A64;
        goto LABEL_31;
      case 7:
      case 13:
        v12 = *a1;
        if (!v12)
          goto LABEL_32;
        if ((*(_BYTE *)(v12 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C3E0, 16);
        v13 = sub_23A095A6C;
        goto LABEL_31;
      case 8:
        v12 = *a1;
        if (v12)
        {
          if ((*(_BYTE *)(v12 + 24) & 1) != 0)
            (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C3A0, 16);
          v13 = sub_23A095A7C;
LABEL_31:
          v14 = (uint64_t *)sub_23A08A59C((unint64_t *)v12, 0x10uLL, (uint64_t)v13);
          *v14 = 0;
          v14[1] = v12;
        }
        else
        {
LABEL_32:
          v14 = (uint64_t *)operator new();
          *v14 = 0;
          v14[1] = 0;
        }
        goto LABEL_44;
      case 9:
      case 12:
        v15 = *a1;
        if (!v15)
          goto LABEL_42;
        if ((*(_BYTE *)(v15 + 24) & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v15 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v15 + 32) + 32), &unk_250B0C450, 24);
        v16 = (uint64_t *(*)(uint64_t *))sub_23A095A80;
        goto LABEL_41;
      case 10:
      case 11:
        v15 = *a1;
        if (v15)
        {
          if ((*(_BYTE *)(v15 + 24) & 1) != 0)
            (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v15 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v15 + 32) + 32), &unk_250B0C428, 24);
          v16 = sub_23A095A84;
LABEL_41:
          v14 = (uint64_t *)sub_23A08A59C((unint64_t *)v15, 0x18uLL, (uint64_t)v16);
          v14[2] = 0;
          *v14 = v15;
        }
        else
        {
LABEL_42:
          v14 = (uint64_t *)operator new();
          v14[2] = 0;
          *v14 = 0;
        }
        v14[1] = 0;
LABEL_44:
        *v10 = v14;
        break;
      default:
        return *v10;
    }
  }
  return *v10;
}

uint64_t sub_23A08ED80(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  char v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  char v17;
  std::string v18[2];

  result = (uint64_t)sub_23A090F14(a1, a2);
  v9 = result;
  *(_QWORD *)(result + 16) = a5;
  if (v10)
  {
    *(_BYTE *)(result + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[a3] != 8)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 460);
      v12 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v12->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    *(_BYTE *)(v9 + 9) = 0;
  }
  else
  {
    if (*(_BYTE *)(result + 9))
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 463);
      v13 = sub_23A08BDA0(v18, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    v14 = *(unsigned __int8 *)(v9 + 8);
    if ((v14 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v15 = sub_23A08BDA0(v18, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v15->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
    if (dword_23A0A5468[v14] != 8)
    {
      sub_23A08BD88((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 463);
      v16 = sub_23A08BDA0(v18, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_23A08BED0((uint64_t)&v17, (const char **)&v16->__r_.__value_.__l.__data_);
      result = sub_23A08BED8((uint64_t)v18);
    }
  }
  *(_BYTE *)(v9 + 10) &= 0xF0u;
  *(_DWORD *)v9 = a4;
  return result;
}

void sub_23A08EF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08EF94(uint64_t *a1, uint64_t a2, int a3, int a4, int a5, uint64_t *a6)
{
  uint64_t **v11;
  uint64_t **v12;
  char v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t *v17;
  std::string *v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  int *v23;
  uint64_t v24;
  int v25;
  uint64_t result;
  char v27;
  std::string v28[2];

  v11 = sub_23A090F14((uint64_t)a1, a2);
  v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((_BYTE *)v11 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v14 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[a3] != 8)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 488);
      v15 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    *((_BYTE *)v12 + 9) = 1;
    *((_BYTE *)v12 + 11) = a4;
    v16 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v16 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v16 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v16 + 32) + 32), &unk_250B0C3D0, 16);
      v17 = (uint64_t *)sub_23A08A59C((unint64_t *)v16, 0x10uLL, (uint64_t)sub_23A095A64);
      *v17 = 0;
      v17[1] = v16;
    }
    else
    {
      v17 = (uint64_t *)operator new();
      *v17 = 0;
      v17[1] = 0;
    }
    *v12 = v17;
  }
  else
  {
    if (!*((_BYTE *)v11 + 9))
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 494);
      v18 = sub_23A08BDA0(v28, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    v19 = *((unsigned __int8 *)v12 + 8);
    if ((v19 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v28, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (dword_23A0A5468[v19] != 8)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 494);
      v21 = sub_23A08BDA0(v28, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_ENUM): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v21->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
    if (*((unsigned __int8 *)v12 + 11) != a4)
    {
      sub_23A08BD88((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 495);
      v22 = sub_23A08BDA0(v28, "CHECK failed: (extension->is_packed) == (packed): ");
      sub_23A08BED0((uint64_t)&v27, (const char **)&v22->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v28);
    }
  }
  v23 = (int *)*v12;
  v24 = *v23;
  if ((_DWORD)v24 == v23[1])
  {
    v25 = v24 + 1;
    sub_23A09AB80(v23, v24 + 1);
    result = sub_23A09AFF4((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
  }
  else
  {
    result = sub_23A09AFF4((uint64_t)v23);
    *(_DWORD *)(result + 4 * v24) = a5;
    v25 = v24 + 1;
  }
  *v23 = v25;
  return result;
}

void sub_23A08F274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08F2B4(uint64_t *a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t **v7;
  unsigned __int8 *v8;
  char v9;
  std::string *v10;
  std::string *v11;
  uint64_t v12;
  _QWORD *v13;
  std::string *v14;
  uint64_t v15;
  std::string *v16;
  std::string *v17;
  char v19;
  std::string v20[2];

  v7 = sub_23A090F14((uint64_t)a1, a2);
  v8 = (unsigned __int8 *)v7;
  v7[2] = a4;
  if (v9)
  {
    *((_BYTE *)v7 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v10 = sub_23A08BDA0(v20, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v19, (const char **)&v10->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v20);
    }
    if (dword_23A0A5468[a3] != 9)
    {
      sub_23A08BD88((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 520);
      v11 = sub_23A08BDA0(v20, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_23A08BED0((uint64_t)&v19, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v20);
    }
    v8[9] = 0;
    v12 = *a1;
    if (v12)
    {
      if ((*(_BYTE *)(v12 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C510, 24);
      v13 = (_QWORD *)sub_23A08A59C((unint64_t *)v12, 0x18uLL, (uint64_t)sub_23A086A68);
    }
    else
    {
      v13 = (_QWORD *)operator new();
    }
    *v13 = 0;
    v13[1] = 0;
    v13[2] = 0;
    *(_QWORD *)v8 = v13;
  }
  else
  {
    if (*((_BYTE *)v7 + 9))
    {
      sub_23A08BD88((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 524);
      v14 = sub_23A08BDA0(v20, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v19, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v20);
    }
    v15 = v8[8];
    if ((v15 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v16 = sub_23A08BDA0(v20, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v19, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v20);
    }
    if (dword_23A0A5468[v15] != 9)
    {
      sub_23A08BD88((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 524);
      v17 = sub_23A08BDA0(v20, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_23A08BED0((uint64_t)&v19, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v20);
    }
  }
  v8[10] &= 0xF0u;
  return *(_QWORD *)v8;
}

void sub_23A08F500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A08F538(uint64_t *a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t **v7;
  uint64_t **v8;
  char v9;
  std::string *v10;
  std::string *v11;
  uint64_t v12;
  uint64_t *v13;
  std::string *v14;
  uint64_t v15;
  std::string *v16;
  std::string *v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int v21;
  _QWORD *result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  std::string v27[2];

  v7 = sub_23A090F14((uint64_t)a1, a2);
  v8 = v7;
  v7[2] = a4;
  if (v9)
  {
    *((_BYTE *)v7 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v10 = sub_23A08BDA0(v27, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v26, (const char **)&v10->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v27);
    }
    if (dword_23A0A5468[a3] != 9)
    {
      sub_23A08BD88((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 550);
      v11 = sub_23A08BDA0(v27, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_23A08BED0((uint64_t)&v26, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v27);
    }
    *((_BYTE *)v8 + 9) = 1;
    *((_BYTE *)v8 + 11) = 0;
    v12 = *a1;
    if (v12)
    {
      if ((*(_BYTE *)(v12 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v12 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v12 + 32) + 32), &unk_250B0C450, 24);
      v13 = (uint64_t *)sub_23A08A59C((unint64_t *)v12, 0x18uLL, (uint64_t)sub_23A095A80);
      v13[2] = 0;
      *v13 = v12;
    }
    else
    {
      v13 = (uint64_t *)operator new();
      v13[2] = 0;
      *v13 = 0;
    }
    v13[1] = 0;
    *v8 = v13;
  }
  else
  {
    if (!*((_BYTE *)v7 + 9))
    {
      sub_23A08BD88((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 556);
      v14 = sub_23A08BDA0(v27, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v26, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v27);
    }
    v15 = *((unsigned __int8 *)v8 + 8);
    if ((v15 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v16 = sub_23A08BDA0(v27, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v26, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v27);
    }
    if (dword_23A0A5468[v15] != 9)
    {
      sub_23A08BD88((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 556);
      v17 = sub_23A08BDA0(v27, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_STRING): ");
      sub_23A08BED0((uint64_t)&v26, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v27);
    }
  }
  v18 = (uint64_t)*v8;
  v19 = *(int **)(v18 + 16);
  if (!v19)
  {
    v21 = *(_DWORD *)(v18 + 12);
LABEL_23:
    sub_23A09D128(v18, v21 + 1);
    v19 = *(int **)(v18 + 16);
    v21 = *v19;
    goto LABEL_24;
  }
  v20 = *(int *)(v18 + 8);
  v21 = *v19;
  if ((int)v20 < *v19)
  {
    *(_DWORD *)(v18 + 8) = v20 + 1;
    return *(_QWORD **)&v19[2 * v20 + 2];
  }
  if (v21 == *(_DWORD *)(v18 + 12))
    goto LABEL_23;
LABEL_24:
  *v19 = v21 + 1;
  v23 = *(_QWORD *)v18;
  if (*(_QWORD *)v18)
  {
    if ((*(_BYTE *)(v23 + 24) & 1) != 0)
      (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v23 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v23 + 32) + 32), &unk_250B0C510, 24);
    result = (_QWORD *)sub_23A08A59C((unint64_t *)v23, 0x18uLL, (uint64_t)sub_23A086A68);
  }
  else
  {
    result = (_QWORD *)operator new();
  }
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  v24 = *(_QWORD *)(v18 + 16);
  v25 = *(int *)(v18 + 8);
  *(_DWORD *)(v18 + 8) = v25 + 1;
  *(_QWORD *)(v24 + 8 * v25 + 8) = result;
  return result;
}

void sub_23A08F86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08F8A4(_QWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t **v9;
  uint64_t **v10;
  char v11;
  std::string *v12;
  std::string *v13;
  uint64_t result;
  std::string *v15;
  uint64_t v16;
  std::string *v17;
  std::string *v18;
  char v19;
  char v20;
  std::string v21[2];

  v9 = sub_23A090F14((uint64_t)a1, a2);
  v10 = v9;
  v9[2] = a5;
  if (v11)
  {
    *((_BYTE *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v12 = sub_23A08BDA0(v21, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v20, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v21);
    }
    if (dword_23A0A5468[a3] != 10)
    {
      sub_23A08BD88((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 591);
      v13 = sub_23A08BDA0(v21, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_23A08BED0((uint64_t)&v20, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v21);
    }
    *((_BYTE *)v10 + 9) = 0;
    *((_BYTE *)v10 + 10) &= 0xFu;
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a4 + 32))(a4, *a1);
    *v10 = (uint64_t *)result;
    *((_BYTE *)v10 + 10) &= 0xF0u;
  }
  else
  {
    if (*((_BYTE *)v9 + 9))
    {
      sub_23A08BD88((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 598);
      v15 = sub_23A08BDA0(v21, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (OPTIONAL_FIELD): ");
      sub_23A08BED0((uint64_t)&v20, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v21);
    }
    v16 = *((unsigned __int8 *)v10 + 8);
    if ((v16 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v17 = sub_23A08BDA0(v21, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v20, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v21);
    }
    if (dword_23A0A5468[v16] != 10)
    {
      sub_23A08BD88((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 598);
      v18 = sub_23A08BDA0(v21, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_23A08BED0((uint64_t)&v20, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v21);
    }
    v19 = *((_BYTE *)v10 + 10);
    *((_BYTE *)v10 + 10) = v19 & 0xF0;
    result = (uint64_t)*v10;
    if ((v19 & 0x10) != 0)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)result + 32))(result, a4);
  }
  return result;
}

void sub_23A08FAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A08FB08(_QWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t **v9;
  unsigned __int8 *v10;
  char v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  _QWORD *v15;
  std::string *v16;
  uint64_t v17;
  std::string *v18;
  std::string *v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  std::string v26[2];

  v9 = sub_23A090F14((uint64_t)a1, a2);
  v10 = (unsigned __int8 *)v9;
  v9[2] = a5;
  if (v11)
  {
    *((_BYTE *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v12 = sub_23A08BDA0(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v25, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v26);
    }
    if (dword_23A0A5468[a3] != 10)
    {
      sub_23A08BD88((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 762);
      v13 = sub_23A08BDA0(v26, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_23A08BED0((uint64_t)&v25, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v26);
    }
    v10[9] = 1;
    v14 = *a1;
    if (*a1)
    {
      if ((*(_BYTE *)(v14 + 24) & 1) != 0)
        (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v14 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v14 + 32) + 32), &unk_250B0C428, 24);
      v15 = (_QWORD *)sub_23A08A59C((unint64_t *)v14, 0x18uLL, (uint64_t)sub_23A095A84);
      v15[2] = 0;
      *v15 = v14;
    }
    else
    {
      v15 = (_QWORD *)operator new();
      v15[2] = 0;
      *v15 = 0;
    }
    v15[1] = 0;
    *(_QWORD *)v10 = v15;
  }
  else
  {
    if (!*((_BYTE *)v9 + 9))
    {
      sub_23A08BD88((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      v16 = sub_23A08BDA0(v26, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      sub_23A08BED0((uint64_t)&v25, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v26);
    }
    v17 = v10[8];
    if ((v17 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v18 = sub_23A08BDA0(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v25, (const char **)&v18->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v26);
    }
    if (dword_23A0A5468[v17] != 10)
    {
      sub_23A08BD88((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      v19 = sub_23A08BDA0(v26, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      sub_23A08BED0((uint64_t)&v25, (const char **)&v19->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v26);
    }
  }
  v20 = *(_QWORD *)v10;
  v21 = *(_DWORD **)(*(_QWORD *)v10 + 16);
  if (!v21
    || (v22 = *(int *)(v20 + 8), (int)v22 >= *v21)
    || (*(_DWORD *)(v20 + 8) = v22 + 1, (v23 = *(_QWORD *)&v21[2 * v22 + 2]) == 0))
  {
    v23 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a4 + 32))(a4, *a1);
    sub_23A095B84(*(_QWORD *)v10, v23);
  }
  return v23;
}

void sub_23A08FDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A08FDF0(unsigned __int8 *result)
{
  _QWORD *v1;
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  BOOL v9;

  v1 = (_QWORD *)*((_QWORD *)result + 2);
  if (*((unsigned __int16 *)result + 4) >= 0x101u)
  {
    v6 = (unsigned __int8 *)*v1;
    v4 = (unsigned __int8 *)(v1 + 1);
    v5 = v6;
    if (v6 != v4)
    {
      do
      {
        result = sub_23A08C404(v5 + 40);
        v7 = (unsigned __int8 *)*((_QWORD *)v5 + 1);
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = *(unsigned __int8 **)v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (unsigned __int8 *)*((_QWORD *)v5 + 2);
            v9 = *(_QWORD *)v8 == (_QWORD)v5;
            v5 = v8;
          }
          while (!v9);
        }
        v5 = v8;
      }
      while (v8 != v4);
    }
  }
  else if (*((_WORD *)result + 5))
  {
    v2 = 32 * *((unsigned __int16 *)result + 5);
    v3 = (unsigned __int8 *)(v1 + 1);
    do
    {
      result = sub_23A08C404(v3);
      v3 += 32;
      v2 -= 32;
    }
    while (v2);
  }
  return result;
}

void sub_23A08FE8C(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char *v13;
  unint64_t v14;
  int *v15;
  int *v16;
  _QWORD *v17;
  unsigned int v18;

  if (*(unsigned __int16 *)(a1 + 8) <= 0x100u)
  {
    v4 = *(unsigned __int16 *)(a2 + 8);
    v5 = *(char **)(a1 + 16);
    v6 = *(unsigned __int16 *)(a1 + 10);
    v7 = &v5[32 * v6];
    v8 = *(_QWORD *)(a2 + 16);
    if (v4 > 0x100)
    {
      v14 = sub_23A090194(v5, v7, *(_QWORD **)v8, (_QWORD *)(v8 + 8));
    }
    else
    {
      v9 = *(unsigned __int16 *)(a2 + 10);
      v10 = v8 + 32 * v9;
      v12 = (_DWORD)v6 == 0;
      v11 = 0;
      v12 = v12 || (_DWORD)v9 == 0;
      if (!v12)
      {
        do
        {
          if (*(_DWORD *)v5 == *(_DWORD *)v8)
            v13 = v5 + 32;
          else
            v13 = v5;
          if (*(_DWORD *)v5 < *(_DWORD *)v8)
          {
            v5 += 32;
          }
          else
          {
            v8 += 32;
            v5 = v13;
          }
          ++v11;
        }
        while (v5 != v7 && v8 != v10);
      }
      v14 = v11 + ((v10 - v8) >> 5) + ((v7 - v5) >> 5);
    }
    sub_23A08FFA8((_QWORD *)a1, v14);
  }
  v15 = *(int **)(a2 + 16);
  if (*(unsigned __int16 *)(a2 + 8) >= 0x101u)
  {
    sub_23A095C9C(*(_QWORD **)v15, (_QWORD *)v15 + 1, (uint64_t *)a1);
  }
  else if (*(_WORD *)(a2 + 10))
  {
    v16 = &v15[8 * *(unsigned __int16 *)(a2 + 10)];
    do
    {
      v17 = v15 + 2;
      v18 = *v15;
      v15 += 8;
      sub_23A09029C((uint64_t *)a1, v18, v17);
    }
    while (v15 != v16);
  }
}

_QWORD *sub_23A08FFA8(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  size_t v8;
  uint64_t **v9;
  uint64_t *v10;
  char *v11;
  char *v12;
  __int128 v13;
  BOOL v14;
  int v15;
  __int128 v16;
  uint64_t v17;

  v2 = *((unsigned __int16 *)result + 4);
  if (v2 <= 0x100 && v2 < a2)
  {
    v4 = result;
    do
    {
      if ((_WORD)v2)
        LOWORD(v2) = 4 * v2;
      else
        LOWORD(v2) = 1;
    }
    while ((unsigned __int16)v2 < a2);
    v5 = (char *)result[2];
    v6 = *((unsigned __int16 *)result + 5);
    v7 = (uint64_t *)*result;
    if ((unsigned __int16)v2 < 0x101u)
    {
      v8 = 32 * (unsigned __int16)v2;
      if (v7)
      {
        if ((v7[3] & 1) != 0)
        {
          (*(void (**)(_QWORD, void *, size_t))(**(_QWORD **)(v7[4] + 32) + 40))(*(_QWORD *)(v7[4] + 32), &unk_250B0C478, v8);
          v8 = 32 * (unsigned __int16)v2;
        }
        result = (_QWORD *)sub_23A08A880(v7, v8);
      }
      else
      {
        result = operator new[](v8);
      }
      v9 = (uint64_t **)result;
      if ((_DWORD)v6)
        result = memmove(result, v5, 32 * v6);
    }
    else
    {
      if (v7)
      {
        if ((v7[3] & 1) != 0)
          (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(v7[4] + 32) + 40))(*(_QWORD *)(v7[4] + 32), &unk_250B0C580, 24);
        result = (_QWORD *)sub_23A08A59C((unint64_t *)v7, 0x18uLL, (uint64_t)sub_23A096380);
      }
      else
      {
        result = (_QWORD *)operator new();
      }
      v9 = (uint64_t **)result;
      result[1] = 0;
      v10 = result + 1;
      result[2] = 0;
      *result = result + 1;
      if ((_DWORD)v6)
      {
        v11 = &v5[32 * v6];
        v12 = v5;
        do
        {
          v15 = *(_DWORD *)v12;
          v13 = *(_OWORD *)(v12 + 8);
          v17 = *((_QWORD *)v12 + 3);
          v16 = v13;
          result = sub_23A096388(v9, v10, &v15, &v15);
          v10 = result;
          v12 += 32;
        }
        while (v12 != v11);
      }
    }
    if (*v4)
      v14 = 1;
    else
      v14 = v5 == 0;
    if (!v14)
      result = (_QWORD *)MEMORY[0x23B83FE64](v5, 0x1062C802AB6010CLL);
    *((_WORD *)v4 + 4) = v2;
    v4[2] = v9;
    if ((unsigned __int16)v2 >= 0x101u)
      *((_WORD *)v4 + 5) = 0;
  }
  return result;
}

uint64_t sub_23A090194(char *a1, char *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;

  v4 = 0;
  if (a1 != a2 && a3 != a4)
  {
    v4 = 0;
    do
    {
      v5 = *((_DWORD *)a3 + 8);
      if (*(_DWORD *)a1 >= v5)
      {
        if (*(_DWORD *)a1 == v5)
        {
          a1 += 32;
          v6 = (_QWORD *)a3[1];
          if (v6)
          {
            do
            {
              a3 = v6;
              v6 = (_QWORD *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              v7 = a3;
              a3 = (_QWORD *)a3[2];
            }
            while ((_QWORD *)*a3 != v7);
          }
        }
        else
        {
          v8 = (_QWORD *)a3[1];
          if (v8)
          {
            do
            {
              a3 = v8;
              v8 = (_QWORD *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              v9 = a3;
              a3 = (_QWORD *)a3[2];
            }
            while ((_QWORD *)*a3 != v9);
          }
        }
      }
      else
      {
        a1 += 32;
      }
      ++v4;
    }
    while (a1 != a2 && a3 != a4);
  }
  if (a3 == a4)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v11 = (_QWORD *)a3[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)a3[2];
          v13 = *v12 == (_QWORD)a3;
          a3 = v12;
        }
        while (!v13);
      }
      ++v10;
      a3 = v12;
    }
    while (v12 != a4);
  }
  return v4 + ((a2 - a1) >> 5) + v10;
}

void sub_23A09029C(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  std::string *v12;
  std::string *v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  std::string *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  int v36;
  int *v37;
  __int128 v38;
  uint64_t *v39;
  uint64_t **v40;
  uint64_t **v41;
  char v42;
  char v43;
  uint64_t v44;
  int *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _DWORD *v50;
  uint64_t v51;
  uint64_t v52;
  std::string *v53;
  std::string *v54;
  std::string *v55;
  uint64_t *v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *__p[2];
  uint64_t v62;
  char v63;
  std::string v64[2];

  if (*((_BYTE *)a3 + 9))
  {
    v6 = (uint64_t *)a3[2];
    v7 = sub_23A090F14((uint64_t)a1, a2);
    v8 = (uint64_t *)v7;
    v7[2] = v6;
    v10 = v9;
    if (v9)
    {
      *((_BYTE *)v7 + 8) = *((_BYTE *)a3 + 8);
      *((_BYTE *)v7 + 11) = *((_BYTE *)a3 + 11);
      *((_BYTE *)v7 + 9) = 1;
    }
    else
    {
      if (*((unsigned __int8 *)v7 + 8) != *((unsigned __int8 *)a3 + 8))
      {
        sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 931);
        v13 = sub_23A08BDA0(v64, "CHECK failed: (extension->type) == (other_extension.type): ");
        sub_23A08BED0((uint64_t)&v63, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v64);
      }
      if (*((unsigned __int8 *)v8 + 11) != *((unsigned __int8 *)a3 + 11))
      {
        sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 932);
        v14 = sub_23A08BDA0(v64, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
        sub_23A08BED0((uint64_t)&v63, (const char **)&v14->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v64);
      }
      if (!*((_BYTE *)v8 + 9))
      {
        sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 933);
        v15 = sub_23A08BDA0(v64, "CHECK failed: extension->is_repeated: ");
        sub_23A08BED0((uint64_t)&v63, (const char **)&v15->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v64);
      }
    }
    v16 = *((unsigned __int8 *)a3 + 8);
    if ((v16 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v17 = sub_23A08BDA0(v64, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v63, (const char **)&v17->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v64);
    }
    switch(v16)
    {
      case 1:
        if (v10)
        {
          v26 = *a1;
          if (v26)
          {
            if ((*(_BYTE *)(v26 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v26 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v26 + 32) + 32), &unk_250B0C3B0, 16);
            v27 = sub_23A08A59C((unint64_t *)v26, 0x10uLL, (uint64_t)sub_23A095A78);
            *(_QWORD *)v27 = 0;
            *(_QWORD *)(v27 + 8) = v26;
          }
          else
          {
            v27 = operator new();
            *(_QWORD *)v27 = 0;
            *(_QWORD *)(v27 + 8) = 0;
          }
          *v8 = v27;
        }
        else
        {
          v27 = *v8;
        }
        sub_23A09CF44((int *)v27, (int *)*a3);
        break;
      case 2:
        if (v10)
        {
          v28 = *a1;
          if (v28)
          {
            if ((*(_BYTE *)(v28 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v28 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v28 + 32) + 32), &unk_250B0C3C0, 16);
            v29 = sub_23A08A59C((unint64_t *)v28, 0x10uLL, (uint64_t)sub_23A095A74);
            *(_QWORD *)v29 = 0;
            *(_QWORD *)(v29 + 8) = v28;
          }
          else
          {
            v29 = operator new();
            *(_QWORD *)v29 = 0;
            *(_QWORD *)(v29 + 8) = 0;
          }
          *v8 = v29;
        }
        else
        {
          v29 = *v8;
        }
        sub_23A09C91C((int *)v29, (int *)*a3);
        break;
      case 3:
      case 16:
      case 18:
        if (v10)
        {
          v20 = *a1;
          if (v20)
          {
            if ((*(_BYTE *)(v20 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v20 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v20 + 32) + 32), &unk_250B0C3F0, 16);
            v21 = sub_23A08A59C((unint64_t *)v20, 0x10uLL, (uint64_t)sub_23A095A68);
            *(_QWORD *)v21 = 0;
            *(_QWORD *)(v21 + 8) = v20;
          }
          else
          {
            v21 = operator new();
            *(_QWORD *)v21 = 0;
            *(_QWORD *)(v21 + 8) = 0;
          }
          *v8 = v21;
        }
        else
        {
          v21 = *v8;
        }
        sub_23A09BCCC((int *)v21, (int *)*a3);
        break;
      case 4:
      case 6:
        if (v10)
        {
          v24 = *a1;
          if (v24)
          {
            if ((*(_BYTE *)(v24 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v24 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v24 + 32) + 32), &unk_250B0C400, 16);
            v25 = sub_23A08A59C((unint64_t *)v24, 0x10uLL, (uint64_t)sub_23A095A70);
            *(_QWORD *)v25 = 0;
            *(_QWORD *)(v25 + 8) = v24;
          }
          else
          {
            v25 = operator new();
            *(_QWORD *)v25 = 0;
            *(_QWORD *)(v25 + 8) = 0;
          }
          *v8 = v25;
        }
        else
        {
          v25 = *v8;
        }
        sub_23A09C2F4((int *)v25, (int *)*a3);
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        if (v10)
        {
          v18 = *a1;
          if (v18)
          {
            if ((*(_BYTE *)(v18 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v18 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v18 + 32) + 32), &unk_250B0C3D0, 16);
            v19 = sub_23A08A59C((unint64_t *)v18, 0x10uLL, (uint64_t)sub_23A095A64);
            *(_QWORD *)v19 = 0;
            *(_QWORD *)(v19 + 8) = v18;
          }
          else
          {
            v19 = operator new();
            *(_QWORD *)v19 = 0;
            *(_QWORD *)(v19 + 8) = 0;
          }
          *v8 = v19;
        }
        else
        {
          v19 = *v8;
        }
        sub_23A09B07C((int *)v19, (int *)*a3);
        break;
      case 7:
      case 13:
        if (v10)
        {
          v22 = *a1;
          if (v22)
          {
            if ((*(_BYTE *)(v22 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v22 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v22 + 32) + 32), &unk_250B0C3E0, 16);
            v23 = sub_23A08A59C((unint64_t *)v22, 0x10uLL, (uint64_t)sub_23A095A6C);
            *(_QWORD *)v23 = 0;
            *(_QWORD *)(v23 + 8) = v22;
          }
          else
          {
            v23 = operator new();
            *(_QWORD *)v23 = 0;
            *(_QWORD *)(v23 + 8) = 0;
          }
          *v8 = v23;
        }
        else
        {
          v23 = *v8;
        }
        sub_23A09B6A4((int *)v23, (int *)*a3);
        break;
      case 8:
        if (v10)
        {
          v30 = *a1;
          if (v30)
          {
            if ((*(_BYTE *)(v30 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v30 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v30 + 32) + 32), &unk_250B0C3A0, 16);
            v31 = sub_23A08A59C((unint64_t *)v30, 0x10uLL, (uint64_t)sub_23A095A7C);
            *(_QWORD *)v31 = 0;
            *(_QWORD *)(v31 + 8) = v30;
          }
          else
          {
            v31 = operator new();
            *(_QWORD *)v31 = 0;
            *(_QWORD *)(v31 + 8) = 0;
          }
          *v8 = v31;
        }
        else
        {
          v31 = *v8;
        }
        sub_23A09AA58((int *)v31, (int *)*a3);
        break;
      case 9:
      case 12:
        if (v10)
        {
          v32 = *a1;
          if (v32)
          {
            if ((*(_BYTE *)(v32 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v32 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v32 + 32) + 32), &unk_250B0C450, 24);
            v33 = (_QWORD *)sub_23A08A59C((unint64_t *)v32, 0x18uLL, (uint64_t)sub_23A095A80);
            v33[2] = 0;
            *v33 = v32;
          }
          else
          {
            v33 = (_QWORD *)operator new();
            v33[2] = 0;
            *v33 = 0;
          }
          v33[1] = 0;
          *v8 = (uint64_t)v33;
        }
        else
        {
          v33 = (_QWORD *)*v8;
        }
        sub_23A086E4C((uint64_t)v33, *a3);
        break;
      case 10:
      case 11:
        if (v10)
        {
          v34 = *a1;
          if (*a1)
          {
            if ((*(_BYTE *)(v34 + 24) & 1) != 0)
              (*(void (**)(_QWORD, void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v34 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v34 + 32) + 32), &unk_250B0C428, 24);
            v35 = (_QWORD *)sub_23A08A59C((unint64_t *)v34, 0x18uLL, (uint64_t)sub_23A095A84);
            v35[2] = 0;
            *v35 = v34;
          }
          else
          {
            v35 = (_QWORD *)operator new();
            v35[2] = 0;
            *v35 = 0;
          }
          v35[1] = 0;
          *v8 = (uint64_t)v35;
        }
        v45 = (int *)*a3;
        if (v45[2] >= 1)
        {
          v46 = 0;
          do
          {
            v47 = sub_23A095AA8((uint64_t)v45, v46);
            v48 = v47;
            v49 = *v8;
            v50 = *(_DWORD **)(*v8 + 16);
            if (!v50
              || (v51 = *(int *)(v49 + 8), (int)v51 >= *v50)
              || (*(_DWORD *)(v49 + 8) = v51 + 1, (v52 = *(_QWORD *)&v50[2 * v51 + 2]) == 0))
            {
              v52 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v47 + 32))(v47, *a1);
              sub_23A095B84(*v8, v52);
            }
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v52 + 64))(v52, v48);
            ++v46;
          }
          while (v46 < v45[2]);
        }
        break;
      default:
        return;
    }
    return;
  }
  if ((*((_BYTE *)a3 + 10) & 1) != 0)
    return;
  v11 = *((unsigned __int8 *)a3 + 8);
  if ((v11 - 19) <= 0xFFFFFFED)
  {
    sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    v12 = sub_23A08BDA0(v64, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_23A08BED0((uint64_t)&v63, (const char **)&v12->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v64);
  }
  switch(v11)
  {
    case 1:
      sub_23A08DFCC((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), a3[2], *(double *)a3);
      return;
    case 2:
      sub_23A08DA88((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), a3[2], *(float *)a3);
      return;
    case 3:
    case 16:
    case 18:
      sub_23A08CAEC((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *a3, a3[2]);
      return;
    case 4:
    case 6:
      sub_23A08D554((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *a3, a3[2]);
      return;
    case 5:
    case 15:
    case 17:
      sub_23A08C5B8((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
      return;
    case 7:
    case 13:
      sub_23A08D020((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
      return;
    case 8:
      sub_23A08E510((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_BYTE *)a3, a3[2]);
      return;
    case 9:
    case 12:
      v36 = *((unsigned __int8 *)a3 + 8);
      v37 = (int *)*a3;
      if (*(char *)(*a3 + 23) < 0)
      {
        sub_239FF1F64(__p, *(void **)v37, *((_QWORD *)v37 + 1));
      }
      else
      {
        v38 = *(_OWORD *)v37;
        v62 = *((_QWORD *)v37 + 2);
        *(_OWORD *)__p = v38;
      }
      sub_23A090DFC(a1, a2, v36, (__n128 *)__p, (uint64_t *)a3[2]);
      if (SHIBYTE(v62) < 0)
        operator delete(__p[0]);
      return;
    case 10:
    case 11:
      v39 = (uint64_t *)a3[2];
      v40 = sub_23A090F14((uint64_t)a1, a2);
      v41 = v40;
      v40[2] = v39;
      if (v42)
      {
        *((_BYTE *)v40 + 8) = *((_BYTE *)a3 + 8);
        *((_BYTE *)v40 + 11) = *((_BYTE *)a3 + 11);
        *((_BYTE *)v40 + 9) = 0;
        v43 = *((_BYTE *)v40 + 10) & 0xF;
        if ((*((_BYTE *)a3 + 10) & 0x10) != 0)
        {
          *((_BYTE *)v40 + 10) = v43 | 0x10;
          v59 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*a3 + 16))(*a3, *a1);
          *v41 = (uint64_t *)v59;
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v59 + 104))(v59, *a3);
          goto LABEL_135;
        }
        *((_BYTE *)v40 + 10) = v43;
        v44 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*a3 + 32))(*a3, *a1);
        *v41 = (uint64_t *)v44;
        goto LABEL_133;
      }
      if (*((unsigned __int8 *)v40 + 8) != *((unsigned __int8 *)a3 + 8))
      {
        sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1026);
        v53 = sub_23A08BDA0(v64, "CHECK failed: (extension->type) == (other_extension.type): ");
        sub_23A08BED0((uint64_t)&v63, (const char **)&v53->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v64);
      }
      if (*((unsigned __int8 *)v41 + 11) != *((unsigned __int8 *)a3 + 11))
      {
        sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1027);
        v54 = sub_23A08BDA0(v64, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
        sub_23A08BED0((uint64_t)&v63, (const char **)&v54->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v64);
      }
      if (*((_BYTE *)v41 + 9))
      {
        sub_23A08BD88((uint64_t)v64, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1028);
        v55 = sub_23A08BDA0(v64, "CHECK failed: !extension->is_repeated: ");
        sub_23A08BED0((uint64_t)&v63, (const char **)&v55->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v64);
      }
      v56 = *v41;
      v57 = (int *)*a3;
      if ((*((_BYTE *)a3 + 10) & 0x10) == 0)
      {
        v58 = *v56;
        if ((*((_BYTE *)v41 + 10) & 0x10) == 0)
        {
          (*(void (**)(uint64_t *, int *))(v58 + 64))(v56, v57);
          goto LABEL_135;
        }
        v44 = (*(uint64_t (**)(uint64_t *, int *))(v58 + 32))(*v41, v57);
LABEL_133:
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v44 + 64))(v44, *a3);
        goto LABEL_135;
      }
      if ((*((_BYTE *)v41 + 10) & 0x10) != 0)
      {
        (*(void (**)(uint64_t *, int *))(*v56 + 104))(v56, v57);
      }
      else
      {
        v60 = (*(uint64_t (**)(_QWORD, uint64_t *))(*(_QWORD *)v57 + 24))(*a3, *v41);
        (*(void (**)(uint64_t *, uint64_t))(*v56 + 64))(v56, v60);
      }
LABEL_135:
      *((_BYTE *)v41 + 10) &= 0xF0u;
      return;
    case 14:
      sub_23A08ED80((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
      return;
    default:
      return;
  }
}

void sub_23A090D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  sub_23A08BED8((uint64_t)&a16);
  _Unwind_Resume(a1);
}

__n128 sub_23A090DFC(uint64_t *a1, uint64_t a2, int a3, __n128 *a4, uint64_t *a5)
{
  uint64_t v6;
  __n128 *v7;
  __n128 result;

  v6 = sub_23A08F2B4(a1, a2, a3, a5);
  v7 = (__n128 *)v6;
  if (*(char *)(v6 + 23) < 0)
    operator delete(*(void **)v6);
  result = *a4;
  v7[1].n128_u64[0] = a4[1].n128_u64[0];
  *v7 = result;
  a4[1].n128_u8[7] = 0;
  a4->n128_u8[0] = 0;
  return result;
}

uint64_t sub_23A090E4C(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v3;
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v3 = (unsigned __int8 *)result;
  if (*(_QWORD *)result == *(_QWORD *)a2)
  {
    v4 = *(_WORD *)(result + 8);
    *(_WORD *)(result + 8) = *(_WORD *)(a2 + 8);
    *(_WORD *)(a2 + 8) = v4;
    v5 = *(_WORD *)(result + 10);
    *(_WORD *)(result + 10) = *(_WORD *)(a2 + 10);
    *(_WORD *)(a2 + 10) = v5;
    v6 = *(_QWORD *)(result + 16);
    *(_QWORD *)(result + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v6;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    sub_23A08FE8C((uint64_t)&v7, a2);
    sub_23A08FDF0((unsigned __int8 *)a2);
    sub_23A08FE8C(a2, (uint64_t)v3);
    sub_23A08FDF0(v3);
    sub_23A08FE8C((uint64_t)v3, (uint64_t)&v7);
    return sub_23A08C334((uint64_t)&v7);
  }
  return result;
}

void sub_23A090F00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23A08C334((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_23A090F14(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t **v4;
  uint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  unint64_t v9;
  int *v10;
  uint64_t **v11;
  int v12;
  uint64_t **result;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *(unsigned __int16 *)(a1 + 8);
  v4 = *(uint64_t ***)(a1 + 16);
  if (v3 >= 0x101)
  {
    *((_QWORD *)&v14 + 1) = 0;
    v15 = 0;
    v16 = 0;
    LODWORD(v14) = a2;
    return sub_23A0962C8(v4, (int *)&v14, &v14) + 5;
  }
  v6 = *(unsigned __int16 *)(a1 + 10);
  v7 = &v4[4 * v6];
  if (!*(_WORD *)(a1 + 10))
  {
    if (!*(_WORD *)(a1 + 8))
      goto LABEL_18;
    LOWORD(v6) = 0;
LABEL_17:
    *(_WORD *)(a1 + 10) = v6 + 1;
    *(_DWORD *)v7 = a2;
    v7[1] = 0;
    result = v7 + 1;
    v7[2] = 0;
    v7[3] = 0;
    return result;
  }
  v8 = *(unsigned __int16 *)(a1 + 10);
  do
  {
    v9 = v8 >> 1;
    v10 = (int *)&v4[4 * (v8 >> 1)];
    v12 = *v10;
    v11 = (uint64_t **)(v10 + 8);
    v8 += ~(v8 >> 1);
    if (v12 < (int)a2)
      v4 = v11;
    else
      v8 = v9;
  }
  while (v8);
  if (v4 != v7)
  {
    if (*(_DWORD *)v4 == (_DWORD)a2)
      return v4 + 1;
    if (v6 < v3)
    {
      memmove(v4 + 4, v4, (char *)v7 - (char *)v4);
      LOWORD(v6) = *(_WORD *)(a1 + 10);
      v7 = v4;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v6 < v3)
    goto LABEL_17;
LABEL_18:
  sub_23A08FFA8((_QWORD *)a1, v6 + 1);
  return (uint64_t **)sub_23A090F14(a1, a2);
}

uint64_t sub_23A09105C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  BOOL v11;

  v1 = *(_QWORD **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    v8 = (unsigned __int8 *)*v1;
    v7 = (unsigned __int8 *)(v1 + 1);
    v6 = v8;
    if (v8 == v7)
    {
      return 1;
    }
    else
    {
      do
      {
        v4 = sub_23A09112C(v6 + 40);
        if (!(_DWORD)v4)
          break;
        v9 = (unsigned __int8 *)*((_QWORD *)v6 + 1);
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = *(unsigned __int8 **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (unsigned __int8 *)*((_QWORD *)v6 + 2);
            v11 = *(_QWORD *)v10 == (_QWORD)v6;
            v6 = v10;
          }
          while (!v11);
        }
        v6 = v10;
      }
      while (v10 != v7);
    }
  }
  else
  {
    while (1)
    {
      v3 = *(_QWORD *)(a1 + 16) + 32 * *(unsigned __int16 *)(a1 + 10);
      v4 = v1 == (_QWORD *)v3;
      if (v1 == (_QWORD *)v3)
        break;
      v5 = (unsigned __int8 *)(v1 + 1);
      if (!sub_23A09112C(v5))
        break;
      v1 = v5 + 24;
      if (*(unsigned __int16 *)(a1 + 8) > 0x100u)
        sub_23A0965B4();
    }
  }
  return v4;
}

uint64_t sub_23A09112C(unsigned __int8 *a1)
{
  uint64_t v2;
  std::string *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  std::string v10[2];

  v2 = a1[8];
  if ((v2 - 19) <= 0xFFFFFFED)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    v3 = sub_23A08BDA0(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v10);
  }
  if (dword_23A0A5468[v2] != 10)
    return 1;
  if (a1[9])
  {
    v4 = *(_QWORD *)a1;
    if (*(int *)(*(_QWORD *)a1 + 8) >= 1)
    {
      v5 = 0;
      while (1)
      {
        v6 = sub_23A095AA8(v4, v5);
        if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6) & 1) == 0)
          break;
        ++v5;
        v4 = *(_QWORD *)a1;
        if (v5 >= *(_DWORD *)(*(_QWORD *)a1 + 8))
          return 1;
      }
      return 0;
    }
    return 1;
  }
  if ((a1[10] & 1) != 0)
    return 1;
  v7 = **(_QWORD **)a1;
  if ((a1[10] & 0x10) != 0)
    return ((*(uint64_t (**)(void))(v7 + 72))() & 1) != 0;
  result = (*(uint64_t (**)(void))(v7 + 48))();
  if ((_DWORD)result)
    return 1;
  return result;
}

void sub_23A091238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A091250(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, _BYTE *a6)
{
  uint64_t result;
  uint64_t v10;
  std::string *v11;
  unsigned int v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(*(_QWORD *)a4 + 16))(a4, a3, a5);
  if ((_DWORD)result)
  {
    v10 = *a5;
    if ((v10 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v15, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v15);
    }
    v12 = dword_23A0A54B4[v10];
    *a6 = 0;
    if (a2 == 2 && a5[1])
    {
      if (v12 > 5)
      {
        sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 82);
        v13 = sub_23A08BDA0(v15, "can't reach here.");
        sub_23A08BED0((uint64_t)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v15);
      }
      else
      {
        result = 1;
        if (((1 << v12) & 0x1C) == 0)
        {
          *a6 = 1;
          return result;
        }
      }
    }
    return v12 == a2;
  }
  return result;
}

void sub_23A091370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A091390(uint64_t *a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unint64_t *a5, int32x2_t *a6)
{
  unsigned int v9;
  uint64_t v11;
  std::string *v13;
  unsigned __int8 v14[39];
  unsigned __int8 v15;
  _QWORD v16[2];

  v9 = a2;
  v16[0] = &off_250B0D7A0;
  v16[1] = a4;
  v11 = a2 >> 3;
  v15 = 0;
  if ((sub_23A091250((uint64_t)a1, a2 & 7, a2 >> 3, (uint64_t)v16, v14, &v15) & 1) != 0)
    return (unsigned __int8 *)sub_23A091458(a1, v11, v15, (uint64_t)v14, a5, a3, a6);
  if ((*a5 & 1) != 0)
    v13 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
  else
    v13 = (std::string *)sub_23A07DCC0(a5);
  return sub_23A0984FC(v9, v13, (char *)a3, a6);
}

char *sub_23A091458(uint64_t *a1, uint64_t a2, int a3, uint64_t a4, unint64_t *a5, unsigned __int8 *a6, int32x2_t *a7)
{
  unsigned __int8 *v8;
  uint64_t v11;
  uint64_t *v12;
  std::string *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  char *result;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  double v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t *v44;
  int v45;
  int v46;
  uint64_t *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  int v54;
  uint64_t *v55;
  int v56;
  unint64_t v57;
  std::string *v58;
  int v59;
  std::string::value_type *v60;
  uint64_t v61;
  int v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  BOOL v75;
  uint64_t v76;
  __int32 v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  std::string *v87;
  char v88;
  std::string v89;
  unint64_t *v90;
  int v91;

  v8 = a6;
  v11 = a2;
  v12 = a1;
  if (a3)
  {
    switch(*(_BYTE *)a4)
    {
      case 1:
        v30 = sub_23A08EA44(a1, a2, 1, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A0983AC(v30, v8, a7);
        break;
      case 2:
        v31 = sub_23A08EA44(a1, a2, 2, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098344(v31, v8, a7);
        break;
      case 3:
        v32 = sub_23A08EA44(a1, a2, 3, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098154((int *)v32, v8, (uint64_t)a7);
        break;
      case 4:
        v33 = sub_23A08EA44(a1, a2, 4, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098164((int *)v33, v8, (uint64_t)a7);
        break;
      case 5:
        v16 = sub_23A08EA44(a1, a2, 5, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098134((int *)v16, v8, (uint64_t)a7);
        break;
      case 6:
        v34 = sub_23A08EA44(a1, a2, 6, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098274(v34, v8, a7);
        break;
      case 7:
        v35 = sub_23A08EA44(a1, a2, 7, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A0981A4(v35, v8, a7);
        break;
      case 8:
        v36 = sub_23A08EA44(a1, a2, 8, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098194((int *)v36, v8, (uint64_t)a7);
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        sub_23A08BD88((uint64_t)&v89, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/extension_set_inl.h", 79);
        v13 = sub_23A08BDA0(&v89, "Non-primitive types can't be packed.");
        sub_23A08BED0((uint64_t)&v88, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v89);
        return (char *)v8;
      case 0xD:
        v18 = sub_23A08EA44(a1, a2, 13, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098144((int *)v18, v8, (uint64_t)a7);
        break;
      case 0xE:
        v89.__r_.__value_.__r.__words[0] = (std::string::size_type)sub_23A08EA44(a1, a2, 14, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        *(_OWORD *)&v89.__r_.__value_.__r.__words[1] = *(_OWORD *)(a4 + 8);
        v90 = a5;
        v91 = v11;
        return sub_23A095D74((uint64_t)a7, (char *)v8, (uint64_t)&v89);
      case 0xF:
        v19 = sub_23A08EA44(a1, a2, 15, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A09820C(v19, v8, a7);
        break;
      case 0x10:
        v37 = sub_23A08EA44(a1, a2, 16, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A0982DC(v37, v8, a7);
        break;
      case 0x11:
        v20 = sub_23A08EA44(a1, a2, 17, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098174((int *)v20, v8, (uint64_t)a7);
        break;
      case 0x12:
        v38 = sub_23A08EA44(a1, a2, 18, *(_BYTE *)(a4 + 2), *(uint64_t **)(a4 + 24));
        result = (char *)sub_23A098184((int *)v38, v8, (uint64_t)a7);
        break;
      default:
        return (char *)v8;
    }
    return result;
  }
  switch(*(_BYTE *)a4)
  {
    case 1:
      v8 = a6 + 8;
      v39 = *(double *)a6;
      if (*(_BYTE *)(a4 + 1))
        sub_23A08E1E8(a1, a2, 1, *(unsigned __int8 *)(a4 + 2), *(uint64_t **)(a4 + 24), v39);
      else
        sub_23A08DFCC((uint64_t)a1, a2, 1, *(_QWORD *)(a4 + 24), v39);
      return (char *)v8;
    case 2:
      v8 = a6 + 4;
      v40 = *(float *)a6;
      if (*(_BYTE *)(a4 + 1))
        sub_23A08DCA4(a1, a2, 2, *(unsigned __int8 *)(a4 + 2), *(uint64_t **)(a4 + 24), v40);
      else
        sub_23A08DA88((uint64_t)a1, a2, 2, *(_QWORD *)(a4 + 24), v40);
      return (char *)v8;
    case 3:
      v41 = *a6;
      if ((char)*a6 < 0)
      {
        v67 = v41 + (a6[1] << 7);
        v41 = (v67 - 128);
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, (v67 - 128));
          if (!v8)
            return (char *)v8;
          v41 = v84;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v54 = *(unsigned __int8 *)(a4 + 2);
        v55 = *(uint64_t **)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v56 = 3;
        goto LABEL_136;
      }
      v79 = *(_QWORD *)(a4 + 24);
      a1 = v12;
      a2 = v11;
      v80 = 3;
      goto LABEL_138;
    case 4:
      v42 = *a6;
      if ((char)*a6 < 0)
      {
        v68 = v42 + (a6[1] << 7);
        v42 = (v68 - 128);
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, (v68 - 128));
          if (!v8)
            return (char *)v8;
          v42 = v85;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v43 = *(unsigned __int8 *)(a4 + 2);
        v44 = *(uint64_t **)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v45 = 4;
        goto LABEL_117;
      }
      v69 = *(_QWORD *)(a4 + 24);
      a1 = v12;
      a2 = v11;
      v70 = 4;
      goto LABEL_119;
    case 5:
      v21 = *a6;
      if ((char)*a6 < 0)
      {
        v63 = v21 + (a6[1] << 7);
        v21 = v63 - 128;
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, (v63 - 128));
          if (!v8)
            return (char *)v8;
          v21 = v81;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v26 = *(unsigned __int8 *)(a4 + 2);
        v27 = *(uint64_t **)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v28 = 5;
        goto LABEL_104;
      }
      v65 = *(_QWORD *)(a4 + 24);
      a1 = v12;
      a2 = v11;
      v66 = 5;
      v82 = v21;
      goto LABEL_107;
    case 6:
      v8 = a6 + 8;
      v42 = *(_QWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v43 = *(unsigned __int8 *)(a4 + 2);
        v44 = *(uint64_t **)(a4 + 24);
        v45 = 6;
LABEL_117:
        sub_23A08D768(a1, a2, v45, v43, v42, v44);
      }
      else
      {
        v69 = *(_QWORD *)(a4 + 24);
        v70 = 6;
LABEL_119:
        sub_23A08D554((uint64_t)a1, a2, v70, v42, v69);
      }
      return (char *)v8;
    case 7:
      v8 = a6 + 4;
      v25 = *(_DWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v46 = *(unsigned __int8 *)(a4 + 2);
        v47 = *(uint64_t **)(a4 + 24);
        v48 = 7;
        goto LABEL_98;
      }
      v71 = *(_QWORD *)(a4 + 24);
      v72 = 7;
      v73 = *(_DWORD *)a6;
      goto LABEL_100;
    case 8:
      v49 = *a6;
      if ((char)*a6 < 0)
      {
        v49 = v49 + (a6[1] << 7) - 128;
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, v49);
          if (!v8)
            return (char *)v8;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      if (*(_BYTE *)(a4 + 1))
        sub_23A08E724(v12, v11, 8, *(unsigned __int8 *)(a4 + 2), v49 != 0, *(uint64_t **)(a4 + 24));
      else
        sub_23A08E510((uint64_t)v12, v11, 8, v49 != 0, *(_QWORD *)(a4 + 24));
      return (char *)v8;
    case 9:
    case 0xC:
      v14 = *(uint64_t **)(a4 + 24);
      if (*(_BYTE *)(a4 + 1))
        v15 = (uint64_t)sub_23A08F538(a1, a2, 9, v14);
      else
        v15 = sub_23A08F2B4(a1, a2, 9, v14);
      v58 = (std::string *)v15;
      v59 = *v8;
      if (((char)*v8 & 0x80000000) == 0)
      {
        v60 = (std::string::value_type *)(v8 + 1);
        return (char *)sub_23A095D1C((uint64_t)a7, v60, v59, v58);
      }
      v61 = sub_23A098060((uint64_t)v8, *v8);
      if (v61)
      {
        v60 = (std::string::value_type *)v61;
        v59 = v62;
        return (char *)sub_23A095D1C((uint64_t)a7, v60, v59, v58);
      }
      return 0;
    case 0xA:
      v50 = *(_QWORD *)(a4 + 8);
      v51 = *(uint64_t **)(a4 + 24);
      if (*(_BYTE *)(a4 + 1))
        v52 = sub_23A08FB08(a1, a2, 10, v50, v51);
      else
        v52 = sub_23A08F8A4(a1, a2, 10, v50, v51);
      v74 = a7[11].i32[0];
      v75 = __OFSUB__(v74--, 1);
      a7[11].i32[0] = v74;
      if (v74 < 0 != v75)
        return 0;
      ++a7[11].i32[1];
      v76 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, int32x2_t *))(*(_QWORD *)v52 + 88))(v52, v8, a7);
      a7[11] = vadd_s32(a7[11], (int32x2_t)0xFFFFFFFF00000001);
      v77 = a7[10].i32[0];
      a7[10].i32[0] = 0;
      if (v77 == ((8 * (_DWORD)v11) | 3))
        return (char *)v76;
      else
        return 0;
    case 0xB:
      v22 = *(_QWORD *)(a4 + 8);
      v23 = *(uint64_t **)(a4 + 24);
      if (*(_BYTE *)(a4 + 1))
        v24 = sub_23A08FB08(a1, a2, 11, v22, v23);
      else
        v24 = sub_23A08F8A4(a1, a2, 11, v22, v23);
      return (char *)sub_23A097E04(a7, v24, v8);
    case 0xD:
      v25 = *a6;
      if ((char)*a6 < 0)
      {
        v64 = v25 + (a6[1] << 7);
        v25 = v64 - 128;
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, (v64 - 128));
          if (!v8)
            return (char *)v8;
          v25 = v83;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v46 = *(unsigned __int8 *)(a4 + 2);
        v47 = *(uint64_t **)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v48 = 13;
LABEL_98:
        sub_23A08D234(a1, a2, v48, v46, v25, v47);
      }
      else
      {
        v71 = *(_QWORD *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v72 = 13;
        v73 = v25;
LABEL_100:
        sub_23A08D020((uint64_t)a1, a2, v72, v73, v71);
      }
      return (char *)v8;
    case 0xE:
      v53 = *a6;
      if ((char)*a6 < 0)
      {
        v78 = v53 + (a6[1] << 7);
        v53 = (v78 - 128);
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, (v78 - 128));
          if (!v8)
            return (char *)v8;
          v53 = v86;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      if (((*(uint64_t (**)(_QWORD, unint64_t))(a4 + 8))(*(_QWORD *)(a4 + 16), v53) & 1) != 0)
      {
        if (*(_BYTE *)(a4 + 1))
          sub_23A08EF94(v12, v11, 14, *(unsigned __int8 *)(a4 + 2), v53, *(uint64_t **)(a4 + 24));
        else
          sub_23A08ED80((uint64_t)v12, v11, 14, v53, *(_QWORD *)(a4 + 24));
      }
      else
      {
        if ((*a5 & 1) != 0)
          v87 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
        else
          v87 = (std::string *)sub_23A07DCC0(a5);
        sub_23A097ED4(v11, v53, v87);
      }
      return (char *)v8;
    case 0xF:
      v8 = a6 + 4;
      v21 = *(_DWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v26 = *(unsigned __int8 *)(a4 + 2);
        v27 = *(uint64_t **)(a4 + 24);
        v28 = 15;
        goto LABEL_104;
      }
      v65 = *(_QWORD *)(a4 + 24);
      v66 = 15;
      goto LABEL_106;
    case 0x10:
      v8 = a6 + 8;
      v41 = *(_QWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v54 = *(unsigned __int8 *)(a4 + 2);
        v55 = *(uint64_t **)(a4 + 24);
        v56 = 16;
        goto LABEL_136;
      }
      v79 = *(_QWORD *)(a4 + 24);
      v80 = 16;
      goto LABEL_138;
    case 0x11:
      LODWORD(v29) = *a6;
      if ((char)*a6 < 0)
      {
        v29 = v29 + (a6[1] << 7) - 128;
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, v29);
          if (!v8)
            return (char *)v8;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      v21 = -(v29 & 1) ^ (v29 >> 1);
      if (*(_BYTE *)(a4 + 1))
      {
        v26 = *(unsigned __int8 *)(a4 + 2);
        v27 = *(uint64_t **)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v28 = 17;
LABEL_104:
        sub_23A08C7CC(a1, a2, v28, v26, v21, v27);
      }
      else
      {
        v65 = *(_QWORD *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v66 = 17;
LABEL_106:
        v82 = v21;
LABEL_107:
        sub_23A08C5B8((uint64_t)a1, a2, v66, v82, v65);
      }
      return (char *)v8;
    case 0x12:
      v57 = *a6;
      if ((char)*a6 < 0)
      {
        v57 = v57 + (a6[1] << 7) - 128;
        if ((char)a6[1] < 0)
        {
          v8 = (unsigned __int8 *)sub_23A097FD4((uint64_t)a6, v57);
          if (!v8)
            return (char *)v8;
        }
        else
        {
          v8 = a6 + 2;
        }
      }
      else
      {
        v8 = a6 + 1;
      }
      v41 = -(uint64_t)(v57 & 1) ^ (v57 >> 1);
      if (*(_BYTE *)(a4 + 1))
      {
        v54 = *(unsigned __int8 *)(a4 + 2);
        v55 = *(uint64_t **)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v56 = 18;
LABEL_136:
        sub_23A08CD00(a1, a2, v56, v54, v41, v55);
      }
      else
      {
        v79 = *(_QWORD *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        v80 = 18;
LABEL_138:
        sub_23A08CAEC((uint64_t)a1, a2, v80, v41, v79);
      }
      return (char *)v8;
    default:
      return (char *)v8;
  }
}

void sub_23A091FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A091FC4(uint64_t a1, signed int a2, int a3, char *a4, uint64_t *a5)
{
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  signed int v13;
  uint64_t v14;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  _QWORD *v19;
  int v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int *v25;
  BOOL v26;

  v7 = *(unsigned int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    v18 = *((_QWORD *)v7 + 1);
    v17 = v7 + 2;
    v16 = v18;
    if (v18)
    {
      v19 = v17;
      do
      {
        v20 = *(_DWORD *)(v16 + 32);
        v21 = v20 < a2;
        if (v20 >= a2)
          v22 = (uint64_t *)v16;
        else
          v22 = (uint64_t *)(v16 + 8);
        if (!v21)
          v19 = (_QWORD *)v16;
        v16 = *v22;
      }
      while (*v22);
      if (v19 != (_QWORD *)v17)
      {
        do
        {
          v23 = *((unsigned int *)v19 + 8);
          if ((int)v23 >= a3)
            break;
          a4 = sub_23A0920F0((_BYTE *)v19 + 40, v23, a4, a5);
          v24 = (unsigned int *)v19[1];
          if (v24)
          {
            do
            {
              v25 = v24;
              v24 = *(unsigned int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              v25 = (unsigned int *)v19[2];
              v26 = *(_QWORD *)v25 == (_QWORD)v19;
              v19 = v25;
            }
            while (!v26);
          }
          v19 = v25;
        }
        while (v25 != v17);
      }
    }
  }
  else
  {
    v8 = *(unsigned __int16 *)(a1 + 10);
    if (*(_WORD *)(a1 + 10))
    {
      v9 = &v7[8 * v8];
      do
      {
        v10 = v8 >> 1;
        v11 = &v7[8 * (v8 >> 1)];
        v13 = *v11;
        v12 = v11 + 8;
        v8 += ~(v8 >> 1);
        if (v13 < a2)
          v7 = v12;
        else
          v8 = v10;
      }
      while (v8);
      while (v7 != v9)
      {
        v14 = *v7;
        if ((int)v14 >= a3)
          break;
        a4 = sub_23A0920F0((_BYTE *)v7 + 8, v14, a4, a5);
        v7 += 8;
      }
    }
  }
  return a4;
}

char *sub_23A0920F0(_BYTE *a1, uint64_t a2, char *a3, uint64_t *a4)
{
  char *v5;
  unsigned int v8;
  _BYTE *v9;
  int v10;
  std::string *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD *v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  std::string *v19;
  _DWORD *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  char v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  _QWORD *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  std::string *v40;
  std::string *v41;
  _DWORD *v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _DWORD *v48;
  int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  _DWORD *v54;
  int v55;
  _DWORD *v56;
  int v57;
  int *v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  int *v63;
  int v64;
  _DWORD *v65;
  int v66;
  _DWORD *v67;
  int v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  _DWORD *v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  _DWORD *v79;
  int v80;
  _DWORD *v81;
  int v82;
  _DWORD *v83;
  int v84;
  _DWORD *v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  _DWORD *v91;
  int v92;
  _DWORD *v93;
  int v94;
  uint64_t *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  _DWORD *v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  char v105;
  int v106;
  _DWORD *v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  _DWORD *v111;
  int v112;
  unsigned int v113;
  char v114;
  unsigned int v115;
  unint64_t v116;
  _BYTE *v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  _DWORD *v124;
  int v125;
  unsigned int v126;
  char v127;
  unsigned int v128;
  unint64_t v129;
  _BYTE *v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  _DWORD *v137;
  int v138;
  unsigned int v139;
  char v140;
  unsigned int v141;
  unint64_t v142;
  _BYTE *v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  _DWORD *v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  char v154;
  unsigned int v155;
  unsigned int v156;
  uint64_t v157;
  _QWORD *v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  _DWORD *v162;
  int v163;
  unsigned int v164;
  unsigned int v165;
  unsigned int v166;
  char v167;
  int v168;
  _DWORD *v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  _DWORD *v173;
  int v174;
  unsigned int v175;
  char v176;
  unsigned int v177;
  char v178;
  _BYTE *v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  uint64_t v183;
  int v184;
  unsigned int v185;
  uint64_t v186;
  unsigned int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int64_t v191;
  _BYTE *v192;
  unsigned int v193;
  unsigned int v194;
  unsigned int v195;
  char *v196;
  const void *v197;
  uint64_t v198;
  int v199;
  unsigned int v200;
  char v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  char v205;
  uint64_t v206;
  char *v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  char *v211;
  unsigned int v212;
  unsigned int v213;
  unsigned int v214;
  uint64_t v215;
  int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  char v220;
  uint64_t v221;
  uint64_t v222;
  _BYTE *v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  _BYTE *v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  uint64_t v232;
  int v233;
  unsigned int v234;
  uint64_t v235;
  unsigned int v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int64_t v240;
  _BYTE *v241;
  unsigned int v242;
  unsigned int v243;
  unsigned int v244;
  char *v245;
  const void *v246;
  _DWORD *v247;
  int v248;
  unsigned int v249;
  char v250;
  unsigned int v251;
  unsigned int v252;
  _BYTE *v253;
  unsigned int v254;
  unsigned int v255;
  unsigned int v256;
  unsigned int v257;
  unsigned int v258;
  unsigned int v259;
  _DWORD *v260;
  int v261;
  unsigned int v262;
  char v263;
  unsigned int v264;
  unint64_t v265;
  _BYTE *v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  unint64_t v270;
  unint64_t v271;
  unint64_t v272;
  _DWORD *v273;
  int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  char v278;
  int v279;
  _DWORD *v280;
  unsigned int v281;
  unsigned int v282;
  unsigned int v283;
  _DWORD *v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  char v288;
  unsigned int v289;
  unsigned int v290;
  uint64_t v291;
  _QWORD *v292;
  unsigned int v293;
  unsigned int v294;
  unsigned int v295;
  _DWORD *v296;
  int v297;
  unsigned int v298;
  char v299;
  unsigned int v300;
  int v301;
  _BYTE *v302;
  unsigned int v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  unsigned int v307;
  unsigned int v308;
  unsigned int v309;
  _DWORD *v310;
  int v311;
  unsigned int v312;
  char v313;
  unsigned int v314;
  uint64_t v315;
  _BYTE *v316;
  unsigned int v317;
  unsigned int v318;
  unsigned int v319;
  unint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  int v324;
  unsigned int v325;
  unsigned int v326;
  _DWORD *v327;
  unsigned int v328;
  unsigned int v329;
  unint64_t v330;
  unsigned int v331;
  char *v332;
  unsigned int v333;
  unsigned int v334;
  unsigned int v335;
  unsigned int v336;
  unsigned int v337;
  unsigned int v338;
  _QWORD *v339;
  int64_t v340;
  uint64_t v341;
  unsigned int v342;
  unsigned int v343;
  unsigned int v344;
  char *v345;
  uint64_t v346;
  unsigned int v347;
  _BYTE *v348;
  unsigned int v349;
  unsigned int v350;
  int v351;
  unsigned int v352;
  uint64_t v353;
  unsigned int v354;
  unsigned int v355;
  unsigned int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v360;
  unsigned int v361;
  unsigned int v362;
  unsigned int v363;
  unsigned int v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  unsigned int v369;
  unsigned int v370;
  _BYTE *v371;
  unsigned int v372;
  unsigned int v373;
  unsigned int v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  unsigned int v379;
  unsigned int v380;
  unsigned int v381;
  unint64_t v382;
  unint64_t v383;
  unint64_t v384;
  unsigned int v385;
  unsigned int v386;
  unint64_t v387;
  unsigned int v388;
  unsigned int v389;
  unint64_t v390;
  unsigned int v391;
  unsigned int v392;
  unsigned int v393;
  unsigned int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  unsigned int v398;
  unsigned int v399;
  unsigned int v400;
  unsigned int v401;
  unsigned int v402;
  unsigned int v403;
  unsigned int v404;
  unsigned int v405;
  unsigned int v406;
  unsigned int v407;
  unsigned int v408;
  unint64_t v409;
  unint64_t v410;
  unsigned int v411;
  unsigned int v412;
  unsigned int v413;
  unint64_t v414;
  unsigned int v415;
  unsigned int v416;
  unint64_t v417;
  unint64_t v418;
  unsigned int v419;
  char *v420;
  unsigned int v421;
  unsigned int v422;
  unsigned int v423;
  _BYTE *v424;
  unsigned int v425;
  unsigned int v426;
  unsigned int v427;
  unsigned int v429;
  unsigned int v430;
  char v431;
  std::string v432[2];

  v5 = a3;
  if (a1[9])
  {
    if (a1[11])
    {
      if (*((_DWORD *)a1 + 3))
      {
        if (*a4 <= (unint64_t)a3)
          v5 = sub_23A08B364((uint64_t)a4, a3);
        v8 = (8 * a2) | 2;
        if (v8 > 0x7F)
        {
          *v5 = (8 * a2) | 0x82;
          v32 = (8 * a2) >> 7;
          if (v8 >> 14)
          {
            v9 = v5 + 2;
            do
            {
              *(v9 - 1) = v32 | 0x80;
              v33 = v32 >> 7;
              ++v9;
              v34 = v32 >> 14;
              v32 >>= 7;
            }
            while (v34);
            *(v9 - 1) = v33;
          }
          else
          {
            v5[1] = v32;
            v9 = v5 + 2;
          }
        }
        else
        {
          *v5 = v8;
          v9 = v5 + 1;
        }
        v35 = *((int *)a1 + 3);
        if (v35 > 0x7F)
        {
          *v9 = v35 | 0x80;
          v36 = v35 >> 7;
          if (v35 >> 14)
          {
            v5 = v9 + 2;
            do
            {
              *(v5 - 1) = v36 | 0x80;
              v37 = v36 >> 7;
              ++v5;
              v38 = v36 >> 14;
              v36 >>= 7;
            }
            while (v38);
            *(v5 - 1) = v37;
          }
          else
          {
            v9[1] = v36;
            v5 = v9 + 2;
          }
        }
        else
        {
          *v9 = v35;
          v5 = v9 + 1;
        }
        v39 = a1[8];
        if ((v39 - 19) <= 0xFFFFFFED)
        {
          sub_23A08BD88((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
          v40 = sub_23A08BDA0(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
          sub_23A08BED0((uint64_t)&v431, (const char **)&v40->__r_.__value_.__l.__data_);
          sub_23A08BED8((uint64_t)v432);
        }
        switch(v39)
        {
          case 1:
            v63 = *(int **)a1;
            if (**(int **)a1 >= 1)
            {
              v64 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v63 = *(int **)a1;
                }
                *(_QWORD *)v5 = *(_QWORD *)sub_23A09CD98(v63, v64);
                v5 += 8;
                ++v64;
                v63 = *(int **)a1;
              }
              while (v64 < **(_DWORD **)a1);
            }
            break;
          case 2:
            v65 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v66 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v65 = *(_DWORD **)a1;
                }
                *(_DWORD *)v5 = *(_DWORD *)sub_23A09C770(v65, v66);
                v5 += 4;
                ++v66;
                v65 = *(_DWORD **)a1;
              }
              while (v66 < **(_DWORD **)a1);
            }
            break;
          case 3:
            v67 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v68 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v67 = *(_DWORD **)a1;
                }
                v69 = *(_QWORD *)sub_23A09BB20(v67, v68);
                if (v69 > 0x7F)
                {
                  *v5 = v69 | 0x80;
                  v70 = v69 >> 7;
                  if (v69 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v70 | 0x80;
                      v71 = v70 >> 7;
                      ++v5;
                      v72 = v70 >> 14;
                      v70 >>= 7;
                    }
                    while (v72);
                    *(v5 - 1) = v71;
                  }
                  else
                  {
                    v5[1] = v70;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v69;
                }
                ++v68;
                v67 = *(_DWORD **)a1;
              }
              while (v68 < **(_DWORD **)a1);
            }
            break;
          case 4:
            v73 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v74 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v73 = *(_DWORD **)a1;
                }
                v75 = *(_QWORD *)sub_23A09C148(v73, v74);
                if (v75 > 0x7F)
                {
                  *v5 = v75 | 0x80;
                  v76 = v75 >> 7;
                  if (v75 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v76 | 0x80;
                      v77 = v76 >> 7;
                      ++v5;
                      v78 = v76 >> 14;
                      v76 >>= 7;
                    }
                    while (v78);
                    *(v5 - 1) = v77;
                  }
                  else
                  {
                    v5[1] = v76;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v75;
                }
                ++v74;
                v73 = *(_DWORD **)a1;
              }
              while (v74 < **(_DWORD **)a1);
            }
            break;
          case 5:
            v42 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v43 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v42 = *(_DWORD **)a1;
                }
                v44 = *(int *)sub_23A09AED0(v42, v43);
                if (v44 > 0x7F)
                {
                  *v5 = v44 | 0x80;
                  v45 = v44 >> 7;
                  if (v44 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v45 | 0x80;
                      v46 = v45 >> 7;
                      ++v5;
                      v47 = v45 >> 14;
                      v45 >>= 7;
                    }
                    while (v47);
                    *(v5 - 1) = v46;
                  }
                  else
                  {
                    v5[1] = v45;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v44;
                }
                ++v43;
                v42 = *(_DWORD **)a1;
              }
              while (v43 < **(_DWORD **)a1);
            }
            break;
          case 6:
            v79 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v80 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v79 = *(_DWORD **)a1;
                }
                *(_QWORD *)v5 = *(_QWORD *)sub_23A09C148(v79, v80);
                v5 += 8;
                ++v80;
                v79 = *(_DWORD **)a1;
              }
              while (v80 < **(_DWORD **)a1);
            }
            break;
          case 7:
            v81 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v82 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v81 = *(_DWORD **)a1;
                }
                *(_DWORD *)v5 = *(_DWORD *)sub_23A09B4F8(v81, v82);
                v5 += 4;
                ++v82;
                v81 = *(_DWORD **)a1;
              }
              while (v82 < **(_DWORD **)a1);
            }
            break;
          case 8:
            v83 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v84 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v83 = *(_DWORD **)a1;
                }
                *v5++ = *(_BYTE *)sub_23A09A8AC(v83, v84++);
                v83 = *(_DWORD **)a1;
              }
              while (v84 < **(_DWORD **)a1);
            }
            break;
          case 9:
          case 10:
          case 11:
          case 12:
            sub_23A08BD88((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1966);
            v41 = sub_23A08BDA0(v432, "Non-primitive types can't be packed.");
            sub_23A08BED0((uint64_t)&v431, (const char **)&v41->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v432);
            break;
          case 13:
            v48 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v49 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v48 = *(_DWORD **)a1;
                }
                v50 = *(_DWORD *)sub_23A09B4F8(v48, v49);
                if (v50 > 0x7F)
                {
                  *v5 = v50 | 0x80;
                  v51 = v50 >> 7;
                  if (v50 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v51 | 0x80;
                      v52 = v51 >> 7;
                      ++v5;
                      v53 = v51 >> 14;
                      v51 >>= 7;
                    }
                    while (v53);
                    *(v5 - 1) = v52;
                  }
                  else
                  {
                    v5[1] = v51;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v50;
                }
                ++v49;
                v48 = *(_DWORD **)a1;
              }
              while (v49 < **(_DWORD **)a1);
            }
            break;
          case 14:
            v85 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v86 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v85 = *(_DWORD **)a1;
                }
                v87 = *(int *)sub_23A09AED0(v85, v86);
                if (v87 > 0x7F)
                {
                  *v5 = v87 | 0x80;
                  v88 = v87 >> 7;
                  if (v87 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v88 | 0x80;
                      v89 = v88 >> 7;
                      ++v5;
                      v90 = v88 >> 14;
                      v88 >>= 7;
                    }
                    while (v90);
                    *(v5 - 1) = v89;
                  }
                  else
                  {
                    v5[1] = v88;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v87;
                }
                ++v86;
                v85 = *(_DWORD **)a1;
              }
              while (v86 < **(_DWORD **)a1);
            }
            break;
          case 15:
            v54 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v55 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v54 = *(_DWORD **)a1;
                }
                *(_DWORD *)v5 = *(_DWORD *)sub_23A09AED0(v54, v55);
                v5 += 4;
                ++v55;
                v54 = *(_DWORD **)a1;
              }
              while (v55 < **(_DWORD **)a1);
            }
            break;
          case 16:
            v91 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v92 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v91 = *(_DWORD **)a1;
                }
                *(_QWORD *)v5 = *(_QWORD *)sub_23A09BB20(v91, v92);
                v5 += 8;
                ++v92;
                v91 = *(_DWORD **)a1;
              }
              while (v92 < **(_DWORD **)a1);
            }
            break;
          case 17:
            v56 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v57 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v56 = *(_DWORD **)a1;
                }
                v58 = (int *)sub_23A09AED0(v56, v57);
                v59 = (2 * *v58) ^ (*v58 >> 31);
                if (v59 > 0x7F)
                {
                  *v5 = v59 | 0x80;
                  v60 = v59 >> 7;
                  if (v59 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v60 | 0x80;
                      v61 = v60 >> 7;
                      ++v5;
                      v62 = v60 >> 14;
                      v60 >>= 7;
                    }
                    while (v62);
                    *(v5 - 1) = v61;
                  }
                  else
                  {
                    v5[1] = v60;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v59;
                }
                ++v57;
                v56 = *(_DWORD **)a1;
              }
              while (v57 < **(_DWORD **)a1);
            }
            break;
          case 18:
            v93 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              v94 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  v5 = sub_23A08B364((uint64_t)a4, v5);
                  v93 = *(_DWORD **)a1;
                }
                v95 = (uint64_t *)sub_23A09BB20(v93, v94);
                v96 = (2 * *v95) ^ (*v95 >> 63);
                if (v96 > 0x7F)
                {
                  *v5 = v96 | 0x80;
                  v97 = v96 >> 7;
                  if (v96 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v97 | 0x80;
                      v98 = v97 >> 7;
                      ++v5;
                      v99 = v97 >> 14;
                      v97 >>= 7;
                    }
                    while (v99);
                    *(v5 - 1) = v98;
                  }
                  else
                  {
                    v5[1] = v97;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v96;
                }
                ++v94;
                v93 = *(_DWORD **)a1;
              }
              while (v94 < **(_DWORD **)a1);
            }
            break;
          default:
            return v5;
        }
      }
      return v5;
    }
    v18 = a1[8];
    if ((v18 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v19 = sub_23A08BDA0(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v431, (const char **)&v19->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v432);
    }
    switch(v18)
    {
      case 1:
        v20 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v21 = 0;
          v22 = 8 * a2;
          v23 = (8 * a2) | 1;
          v24 = (8 * a2) | 0x81;
          v25 = (a2 >> 4) & 0x1FFFFFF;
          v26 = v22 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v20 = *(_DWORD **)a1;
            }
            v27 = *(_QWORD *)sub_23A09CD98(v20, v21);
            if (v23 > 0x7F)
            {
              *v5 = v24;
              if (v23 >= 0x4000)
              {
                v28 = v5 + 2;
                v29 = v25;
                do
                {
                  *((_BYTE *)v28 - 1) = v29 | 0x80;
                  v30 = v29 >> 7;
                  v28 = (_QWORD *)((char *)v28 + 1);
                  v31 = v29 >> 14;
                  v29 >>= 7;
                }
                while (v31);
                *((_BYTE *)v28 - 1) = v30;
              }
              else
              {
                v5[1] = v26;
                v28 = v5 + 2;
              }
            }
            else
            {
              *v5 = v23;
              v28 = v5 + 1;
            }
            *v28 = v27;
            v5 = (char *)(v28 + 1);
            ++v21;
            v20 = *(_DWORD **)a1;
          }
          while (v21 < **(_DWORD **)a1);
        }
        return v5;
      case 2:
        v100 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v101 = 0;
          v102 = (8 * a2) | 5;
          v103 = (a2 >> 4) & 0x1FFFFFF;
          v104 = (8 * a2) >> 7;
          v105 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v100 = *(_DWORD **)a1;
            }
            v106 = *(_DWORD *)sub_23A09C770(v100, v101);
            if (v102 > 0x7F)
            {
              *v5 = v105;
              if (v102 >= 0x4000)
              {
                v107 = v5 + 2;
                v108 = v103;
                do
                {
                  *((_BYTE *)v107 - 1) = v108 | 0x80;
                  v109 = v108 >> 7;
                  v107 = (_DWORD *)((char *)v107 + 1);
                  v110 = v108 >> 14;
                  v108 >>= 7;
                }
                while (v110);
                *((_BYTE *)v107 - 1) = v109;
              }
              else
              {
                v5[1] = v104;
                v107 = v5 + 2;
              }
            }
            else
            {
              *v5 = v102;
              v107 = v5 + 1;
            }
            *v107 = v106;
            v5 = (char *)(v107 + 1);
            ++v101;
            v100 = *(_DWORD **)a1;
          }
          while (v101 < **(_DWORD **)a1);
        }
        return v5;
      case 3:
        v111 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v112 = 0;
          v113 = 8 * a2;
          v114 = (8 * a2) | 0x80;
          v115 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v111 = *(_DWORD **)a1;
            }
            v116 = *(_QWORD *)sub_23A09BB20(v111, v112);
            if (v113 > 0x7F)
            {
              *v5 = v114;
              if (v113 >= 0x4000)
              {
                v117 = v5 + 2;
                v118 = v115;
                do
                {
                  *(v117 - 1) = v118 | 0x80;
                  v119 = v118 >> 7;
                  ++v117;
                  v120 = v118 >> 14;
                  v118 >>= 7;
                }
                while (v120);
                *(v117 - 1) = v119;
              }
              else
              {
                v5[1] = v113 >> 7;
                v117 = v5 + 2;
              }
            }
            else
            {
              v117 = v5 + 1;
              *v5 = v113;
            }
            if (v116 > 0x7F)
            {
              *v117 = v116 | 0x80;
              v121 = v116 >> 7;
              if (v116 >> 14)
              {
                v5 = v117 + 2;
                do
                {
                  *(v5 - 1) = v121 | 0x80;
                  v122 = v121 >> 7;
                  ++v5;
                  v123 = v121 >> 14;
                  v121 >>= 7;
                }
                while (v123);
                *(v5 - 1) = v122;
              }
              else
              {
                v117[1] = v121;
                v5 = v117 + 2;
              }
            }
            else
            {
              *v117 = v116;
              v5 = v117 + 1;
            }
            ++v112;
            v111 = *(_DWORD **)a1;
          }
          while (v112 < **(_DWORD **)a1);
        }
        return v5;
      case 4:
        v124 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v125 = 0;
          v126 = 8 * a2;
          v127 = (8 * a2) | 0x80;
          v128 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v124 = *(_DWORD **)a1;
            }
            v129 = *(_QWORD *)sub_23A09C148(v124, v125);
            if (v126 > 0x7F)
            {
              *v5 = v127;
              if (v126 >= 0x4000)
              {
                v130 = v5 + 2;
                v131 = v128;
                do
                {
                  *(v130 - 1) = v131 | 0x80;
                  v132 = v131 >> 7;
                  ++v130;
                  v133 = v131 >> 14;
                  v131 >>= 7;
                }
                while (v133);
                *(v130 - 1) = v132;
              }
              else
              {
                v5[1] = v126 >> 7;
                v130 = v5 + 2;
              }
            }
            else
            {
              v130 = v5 + 1;
              *v5 = v126;
            }
            if (v129 > 0x7F)
            {
              *v130 = v129 | 0x80;
              v134 = v129 >> 7;
              if (v129 >> 14)
              {
                v5 = v130 + 2;
                do
                {
                  *(v5 - 1) = v134 | 0x80;
                  v135 = v134 >> 7;
                  ++v5;
                  v136 = v134 >> 14;
                  v134 >>= 7;
                }
                while (v136);
                *(v5 - 1) = v135;
              }
              else
              {
                v130[1] = v134;
                v5 = v130 + 2;
              }
            }
            else
            {
              *v130 = v129;
              v5 = v130 + 1;
            }
            ++v125;
            v124 = *(_DWORD **)a1;
          }
          while (v125 < **(_DWORD **)a1);
        }
        return v5;
      case 5:
        v137 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v138 = 0;
          v139 = 8 * a2;
          v140 = (8 * a2) | 0x80;
          v141 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v137 = *(_DWORD **)a1;
            }
            v142 = *(int *)sub_23A09AED0(v137, v138);
            if (v139 > 0x7F)
            {
              *v5 = v140;
              if (v139 >= 0x4000)
              {
                v143 = v5 + 2;
                v144 = v141;
                do
                {
                  *(v143 - 1) = v144 | 0x80;
                  v145 = v144 >> 7;
                  ++v143;
                  v146 = v144 >> 14;
                  v144 >>= 7;
                }
                while (v146);
                *(v143 - 1) = v145;
              }
              else
              {
                v5[1] = v139 >> 7;
                v143 = v5 + 2;
              }
            }
            else
            {
              v143 = v5 + 1;
              *v5 = v139;
            }
            if (v142 > 0x7F)
            {
              *v143 = v142 | 0x80;
              v147 = v142 >> 7;
              if (v142 >> 14)
              {
                v5 = v143 + 2;
                do
                {
                  *(v5 - 1) = v147 | 0x80;
                  v148 = v147 >> 7;
                  ++v5;
                  v149 = v147 >> 14;
                  v147 >>= 7;
                }
                while (v149);
                *(v5 - 1) = v148;
              }
              else
              {
                v143[1] = v147;
                v5 = v143 + 2;
              }
            }
            else
            {
              *v143 = v142;
              v5 = v143 + 1;
            }
            ++v138;
            v137 = *(_DWORD **)a1;
          }
          while (v138 < **(_DWORD **)a1);
        }
        return v5;
      case 6:
        v150 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v151 = 0;
          v152 = 8 * a2;
          v153 = (8 * a2) | 1;
          v154 = (8 * a2) | 0x81;
          v155 = (a2 >> 4) & 0x1FFFFFF;
          v156 = v152 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v150 = *(_DWORD **)a1;
            }
            v157 = *(_QWORD *)sub_23A09C148(v150, v151);
            if (v153 > 0x7F)
            {
              *v5 = v154;
              if (v153 >= 0x4000)
              {
                v158 = v5 + 2;
                v159 = v155;
                do
                {
                  *((_BYTE *)v158 - 1) = v159 | 0x80;
                  v160 = v159 >> 7;
                  v158 = (_QWORD *)((char *)v158 + 1);
                  v161 = v159 >> 14;
                  v159 >>= 7;
                }
                while (v161);
                *((_BYTE *)v158 - 1) = v160;
              }
              else
              {
                v5[1] = v156;
                v158 = v5 + 2;
              }
            }
            else
            {
              *v5 = v153;
              v158 = v5 + 1;
            }
            *v158 = v157;
            v5 = (char *)(v158 + 1);
            ++v151;
            v150 = *(_DWORD **)a1;
          }
          while (v151 < **(_DWORD **)a1);
        }
        return v5;
      case 7:
        v162 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v163 = 0;
          v164 = (8 * a2) | 5;
          v165 = (a2 >> 4) & 0x1FFFFFF;
          v166 = (8 * a2) >> 7;
          v167 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v162 = *(_DWORD **)a1;
            }
            v168 = *(_DWORD *)sub_23A09B4F8(v162, v163);
            if (v164 > 0x7F)
            {
              *v5 = v167;
              if (v164 >= 0x4000)
              {
                v169 = v5 + 2;
                v170 = v165;
                do
                {
                  *((_BYTE *)v169 - 1) = v170 | 0x80;
                  v171 = v170 >> 7;
                  v169 = (_DWORD *)((char *)v169 + 1);
                  v172 = v170 >> 14;
                  v170 >>= 7;
                }
                while (v172);
                *((_BYTE *)v169 - 1) = v171;
              }
              else
              {
                v5[1] = v166;
                v169 = v5 + 2;
              }
            }
            else
            {
              *v5 = v164;
              v169 = v5 + 1;
            }
            *v169 = v168;
            v5 = (char *)(v169 + 1);
            ++v163;
            v162 = *(_DWORD **)a1;
          }
          while (v163 < **(_DWORD **)a1);
        }
        return v5;
      case 8:
        v173 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v174 = 0;
          v175 = 8 * a2;
          v176 = (8 * a2) | 0x80;
          v177 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v173 = *(_DWORD **)a1;
            }
            v178 = *(_BYTE *)sub_23A09A8AC(v173, v174);
            if (v175 > 0x7F)
            {
              *v5 = v176;
              if (v175 >= 0x4000)
              {
                v179 = v5 + 2;
                v180 = v177;
                do
                {
                  *(v179 - 1) = v180 | 0x80;
                  v181 = v180 >> 7;
                  ++v179;
                  v182 = v180 >> 14;
                  v180 >>= 7;
                }
                while (v182);
                *(v179 - 1) = v181;
              }
              else
              {
                v5[1] = v175 >> 7;
                v179 = v5 + 2;
              }
            }
            else
            {
              *v5 = v175;
              v179 = v5 + 1;
            }
            *v179 = v178;
            v5 = v179 + 1;
            ++v174;
            v173 = *(_DWORD **)a1;
          }
          while (v174 < **(_DWORD **)a1);
        }
        return v5;
      case 9:
        v183 = *(_QWORD *)a1;
        if (*(int *)(*(_QWORD *)a1 + 8) < 1)
          return v5;
        v184 = 0;
        v185 = 8 * a2;
        v186 = 4;
        if (((a2 >> 25) & 0xF) != 0)
          v186 = 5;
        v187 = (8 * a2) | 2;
        v188 = 1;
        if (v185 >= 0x80)
          v188 = 2;
        if (v185 < 0x200000)
          v186 = 3;
        if (v185 >= 0x4000)
          v189 = v186;
        else
          v189 = v188;
        v429 = v185 >> 7;
        while (1)
        {
          if (*a4 <= (unint64_t)v5)
          {
            v5 = sub_23A08B364((uint64_t)a4, v5);
            v183 = *(_QWORD *)a1;
          }
          v190 = sub_23A086C18(v183, v184);
          if (*(char *)(v190 + 23) < 0)
          {
            v191 = *(_QWORD *)(v190 + 8);
            if (v191 > 127)
              goto LABEL_326;
          }
          else
          {
            v191 = *(unsigned __int8 *)(v190 + 23);
          }
          if ((uint64_t)(*a4 + ~(unint64_t)&v5[v189] + 16) >= v191)
          {
            if (v187 > 0x7F)
            {
              *v5 = (8 * a2) | 0x82;
              if (v187 >= 0x4000)
              {
                v192 = v5 + 2;
                v193 = (a2 >> 4) & 0x1FFFFFF;
                do
                {
                  *(v192 - 1) = v193 | 0x80;
                  v194 = v193 >> 7;
                  ++v192;
                  v195 = v193 >> 14;
                  v193 >>= 7;
                }
                while (v195);
                *(v192 - 1) = v194;
              }
              else
              {
                v5[1] = v429;
                v192 = v5 + 2;
              }
            }
            else
            {
              v192 = v5 + 1;
              *v5 = v187;
            }
            *v192 = v191;
            v196 = v192 + 1;
            if (*(char *)(v190 + 23) >= 0)
              v197 = (const void *)v190;
            else
              v197 = *(const void **)v190;
            memcpy(v196, v197, v191);
            v5 = &v196[v191];
            goto LABEL_324;
          }
LABEL_326:
          v5 = sub_23A08B874(a4, a2, v190, v5);
LABEL_324:
          ++v184;
          v183 = *(_QWORD *)a1;
          if (v184 >= *(_DWORD *)(*(_QWORD *)a1 + 8))
            return v5;
        }
      case 10:
        v198 = *(_QWORD *)a1;
        if (*(int *)(*(_QWORD *)a1 + 8) >= 1)
        {
          v199 = 0;
          v200 = (8 * a2) | 3;
          v201 = (8 * a2) | 0x83;
          v202 = (a2 >> 4) & 0x1FFFFFF;
          v203 = (8 * a2) | 4;
          v204 = (8 * a2) >> 7;
          v205 = (8 * a2) | 0x84;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v198 = *(_QWORD *)a1;
            }
            v206 = sub_23A095AA8(v198, v199);
            if (v200 > 0x7F)
            {
              *v5 = v201;
              if (v200 >= 0x4000)
              {
                v207 = v5 + 2;
                v208 = v202;
                do
                {
                  *(v207 - 1) = v208 | 0x80;
                  v209 = v208 >> 7;
                  ++v207;
                  v210 = v208 >> 14;
                  v208 >>= 7;
                }
                while (v210);
                *(v207 - 1) = v209;
              }
              else
              {
                v5[1] = v204;
                v207 = v5 + 2;
              }
            }
            else
            {
              v207 = v5 + 1;
              *v5 = v200;
            }
            v211 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)v206 + 96))(v206, v207, a4);
            if (*a4 <= (unint64_t)v211)
              v211 = sub_23A08B364((uint64_t)a4, v211);
            if (v203 > 0x7F)
            {
              *v211 = v205;
              if (v203 >= 0x4000)
              {
                v5 = v211 + 2;
                v212 = v202;
                do
                {
                  *(v5 - 1) = v212 | 0x80;
                  v213 = v212 >> 7;
                  ++v5;
                  v214 = v212 >> 14;
                  v212 >>= 7;
                }
                while (v214);
                *(v5 - 1) = v213;
              }
              else
              {
                v211[1] = v204;
                v5 = v211 + 2;
              }
            }
            else
            {
              v5 = v211 + 1;
              *v211 = v203;
            }
            ++v199;
            v198 = *(_QWORD *)a1;
          }
          while (v199 < *(_DWORD *)(*(_QWORD *)a1 + 8));
        }
        return v5;
      case 11:
        v215 = *(_QWORD *)a1;
        if (*(int *)(*(_QWORD *)a1 + 8) >= 1)
        {
          v216 = 0;
          v217 = (8 * a2) | 2;
          v218 = (a2 >> 4) & 0x1FFFFFF;
          v219 = (8 * a2) >> 7;
          v220 = (8 * a2) | 0x82;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v215 = *(_QWORD *)a1;
            }
            v221 = sub_23A095AA8(v215, v216);
            v222 = v221;
            if (v217 > 0x7F)
            {
              *v5 = v220;
              if (v217 >= 0x4000)
              {
                v223 = v5 + 2;
                v224 = v218;
                do
                {
                  *(v223 - 1) = v224 | 0x80;
                  v225 = v224 >> 7;
                  ++v223;
                  v226 = v224 >> 14;
                  v224 >>= 7;
                }
                while (v226);
                *(v223 - 1) = v225;
              }
              else
              {
                v5[1] = v219;
                v223 = v5 + 2;
              }
            }
            else
            {
              v223 = v5 + 1;
              *v5 = v217;
            }
            v227 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v221 + 80))(v221);
            if (v227 > 0x7F)
            {
              *v223 = v227 | 0x80;
              v229 = v227 >> 7;
              if (v227 >> 14)
              {
                v228 = v223 + 2;
                do
                {
                  *(v228 - 1) = v229 | 0x80;
                  v230 = v229 >> 7;
                  ++v228;
                  v231 = v229 >> 14;
                  v229 >>= 7;
                }
                while (v231);
                *(v228 - 1) = v230;
              }
              else
              {
                v223[1] = v229;
                v228 = v223 + 2;
              }
            }
            else
            {
              *v223 = v227;
              v228 = v223 + 1;
            }
            v5 = (char *)(*(uint64_t (**)(uint64_t, _BYTE *, uint64_t *))(*(_QWORD *)v222 + 96))(v222, v228, a4);
            ++v216;
            v215 = *(_QWORD *)a1;
          }
          while (v216 < *(_DWORD *)(*(_QWORD *)a1 + 8));
        }
        return v5;
      case 12:
        v232 = *(_QWORD *)a1;
        if (*(int *)(*(_QWORD *)a1 + 8) < 1)
          return v5;
        v233 = 0;
        v234 = 8 * a2;
        v235 = 4;
        if (((a2 >> 25) & 0xF) != 0)
          v235 = 5;
        v236 = (8 * a2) | 2;
        v237 = 1;
        if (v234 >= 0x80)
          v237 = 2;
        if (v234 < 0x200000)
          v235 = 3;
        if (v234 >= 0x4000)
          v238 = v235;
        else
          v238 = v237;
        v430 = v234 >> 7;
        break;
      case 13:
        v247 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v248 = 0;
          v249 = 8 * a2;
          v250 = (8 * a2) | 0x80;
          v251 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v247 = *(_DWORD **)a1;
            }
            v252 = *(_DWORD *)sub_23A09B4F8(v247, v248);
            if (v249 > 0x7F)
            {
              *v5 = v250;
              if (v249 >= 0x4000)
              {
                v253 = v5 + 2;
                v254 = v251;
                do
                {
                  *(v253 - 1) = v254 | 0x80;
                  v255 = v254 >> 7;
                  ++v253;
                  v256 = v254 >> 14;
                  v254 >>= 7;
                }
                while (v256);
                *(v253 - 1) = v255;
              }
              else
              {
                v5[1] = v249 >> 7;
                v253 = v5 + 2;
              }
            }
            else
            {
              v253 = v5 + 1;
              *v5 = v249;
            }
            if (v252 > 0x7F)
            {
              *v253 = v252 | 0x80;
              v257 = v252 >> 7;
              if (v252 >> 14)
              {
                v5 = v253 + 2;
                do
                {
                  *(v5 - 1) = v257 | 0x80;
                  v258 = v257 >> 7;
                  ++v5;
                  v259 = v257 >> 14;
                  v257 >>= 7;
                }
                while (v259);
                *(v5 - 1) = v258;
              }
              else
              {
                v253[1] = v257;
                v5 = v253 + 2;
              }
            }
            else
            {
              *v253 = v252;
              v5 = v253 + 1;
            }
            ++v248;
            v247 = *(_DWORD **)a1;
          }
          while (v248 < **(_DWORD **)a1);
        }
        return v5;
      case 14:
        v260 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v261 = 0;
          v262 = 8 * a2;
          v263 = (8 * a2) | 0x80;
          v264 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v260 = *(_DWORD **)a1;
            }
            v265 = *(int *)sub_23A09AED0(v260, v261);
            if (v262 > 0x7F)
            {
              *v5 = v263;
              if (v262 >= 0x4000)
              {
                v266 = v5 + 2;
                v267 = v264;
                do
                {
                  *(v266 - 1) = v267 | 0x80;
                  v268 = v267 >> 7;
                  ++v266;
                  v269 = v267 >> 14;
                  v267 >>= 7;
                }
                while (v269);
                *(v266 - 1) = v268;
              }
              else
              {
                v5[1] = v262 >> 7;
                v266 = v5 + 2;
              }
            }
            else
            {
              v266 = v5 + 1;
              *v5 = v262;
            }
            if (v265 > 0x7F)
            {
              *v266 = v265 | 0x80;
              v270 = v265 >> 7;
              if (v265 >> 14)
              {
                v5 = v266 + 2;
                do
                {
                  *(v5 - 1) = v270 | 0x80;
                  v271 = v270 >> 7;
                  ++v5;
                  v272 = v270 >> 14;
                  v270 >>= 7;
                }
                while (v272);
                *(v5 - 1) = v271;
              }
              else
              {
                v266[1] = v270;
                v5 = v266 + 2;
              }
            }
            else
            {
              *v266 = v265;
              v5 = v266 + 1;
            }
            ++v261;
            v260 = *(_DWORD **)a1;
          }
          while (v261 < **(_DWORD **)a1);
        }
        return v5;
      case 15:
        v273 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v274 = 0;
          v275 = (8 * a2) | 5;
          v276 = (a2 >> 4) & 0x1FFFFFF;
          v277 = (8 * a2) >> 7;
          v278 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v273 = *(_DWORD **)a1;
            }
            v279 = *(_DWORD *)sub_23A09AED0(v273, v274);
            if (v275 > 0x7F)
            {
              *v5 = v278;
              if (v275 >= 0x4000)
              {
                v280 = v5 + 2;
                v281 = v276;
                do
                {
                  *((_BYTE *)v280 - 1) = v281 | 0x80;
                  v282 = v281 >> 7;
                  v280 = (_DWORD *)((char *)v280 + 1);
                  v283 = v281 >> 14;
                  v281 >>= 7;
                }
                while (v283);
                *((_BYTE *)v280 - 1) = v282;
              }
              else
              {
                v5[1] = v277;
                v280 = v5 + 2;
              }
            }
            else
            {
              *v5 = v275;
              v280 = v5 + 1;
            }
            *v280 = v279;
            v5 = (char *)(v280 + 1);
            ++v274;
            v273 = *(_DWORD **)a1;
          }
          while (v274 < **(_DWORD **)a1);
        }
        return v5;
      case 16:
        v284 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v285 = 0;
          v286 = 8 * a2;
          v287 = (8 * a2) | 1;
          v288 = (8 * a2) | 0x81;
          v289 = (a2 >> 4) & 0x1FFFFFF;
          v290 = v286 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v284 = *(_DWORD **)a1;
            }
            v291 = *(_QWORD *)sub_23A09BB20(v284, v285);
            if (v287 > 0x7F)
            {
              *v5 = v288;
              if (v287 >= 0x4000)
              {
                v292 = v5 + 2;
                v293 = v289;
                do
                {
                  *((_BYTE *)v292 - 1) = v293 | 0x80;
                  v294 = v293 >> 7;
                  v292 = (_QWORD *)((char *)v292 + 1);
                  v295 = v293 >> 14;
                  v293 >>= 7;
                }
                while (v295);
                *((_BYTE *)v292 - 1) = v294;
              }
              else
              {
                v5[1] = v290;
                v292 = v5 + 2;
              }
            }
            else
            {
              *v5 = v287;
              v292 = v5 + 1;
            }
            *v292 = v291;
            v5 = (char *)(v292 + 1);
            ++v285;
            v284 = *(_DWORD **)a1;
          }
          while (v285 < **(_DWORD **)a1);
        }
        return v5;
      case 17:
        v296 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v297 = 0;
          v298 = 8 * a2;
          v299 = (8 * a2) | 0x80;
          v300 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v296 = *(_DWORD **)a1;
            }
            v301 = *(_DWORD *)sub_23A09AED0(v296, v297);
            if (v298 > 0x7F)
            {
              *v5 = v299;
              if (v298 >= 0x4000)
              {
                v302 = v5 + 2;
                v303 = v300;
                do
                {
                  *(v302 - 1) = v303 | 0x80;
                  v304 = v303 >> 7;
                  ++v302;
                  v305 = v303 >> 14;
                  v303 >>= 7;
                }
                while (v305);
                *(v302 - 1) = v304;
              }
              else
              {
                v5[1] = v298 >> 7;
                v302 = v5 + 2;
              }
            }
            else
            {
              v302 = v5 + 1;
              *v5 = v298;
            }
            v306 = (2 * v301) ^ (v301 >> 31);
            if (v306 > 0x7F)
            {
              *v302 = v306 | 0x80;
              v307 = v306 >> 7;
              if (v306 >> 14)
              {
                v5 = v302 + 2;
                do
                {
                  *(v5 - 1) = v307 | 0x80;
                  v308 = v307 >> 7;
                  ++v5;
                  v309 = v307 >> 14;
                  v307 >>= 7;
                }
                while (v309);
                *(v5 - 1) = v308;
              }
              else
              {
                v302[1] = v307;
                v5 = v302 + 2;
              }
            }
            else
            {
              *v302 = v306;
              v5 = v302 + 1;
            }
            ++v297;
            v296 = *(_DWORD **)a1;
          }
          while (v297 < **(_DWORD **)a1);
        }
        return v5;
      case 18:
        v310 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          v311 = 0;
          v312 = 8 * a2;
          v313 = (8 * a2) | 0x80;
          v314 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              v5 = sub_23A08B364((uint64_t)a4, v5);
              v310 = *(_DWORD **)a1;
            }
            v315 = *(_QWORD *)sub_23A09BB20(v310, v311);
            if (v312 > 0x7F)
            {
              *v5 = v313;
              if (v312 >= 0x4000)
              {
                v316 = v5 + 2;
                v317 = v314;
                do
                {
                  *(v316 - 1) = v317 | 0x80;
                  v318 = v317 >> 7;
                  ++v316;
                  v319 = v317 >> 14;
                  v317 >>= 7;
                }
                while (v319);
                *(v316 - 1) = v318;
              }
              else
              {
                v5[1] = v312 >> 7;
                v316 = v5 + 2;
              }
            }
            else
            {
              v316 = v5 + 1;
              *v5 = v312;
            }
            v320 = (2 * v315) ^ (v315 >> 63);
            if (v320 > 0x7F)
            {
              *v316 = v320 | 0x80;
              v321 = v320 >> 7;
              if (v320 >> 14)
              {
                v5 = v316 + 2;
                do
                {
                  *(v5 - 1) = v321 | 0x80;
                  v322 = v321 >> 7;
                  ++v5;
                  v323 = v321 >> 14;
                  v321 >>= 7;
                }
                while (v323);
                *(v5 - 1) = v322;
              }
              else
              {
                v316[1] = v321;
                v5 = v316 + 2;
              }
            }
            else
            {
              *v316 = v320;
              v5 = v316 + 1;
            }
            ++v311;
            v310 = *(_DWORD **)a1;
          }
          while (v311 < **(_DWORD **)a1);
        }
        return v5;
      default:
        return v5;
    }
    while (1)
    {
      if (*a4 <= (unint64_t)v5)
      {
        v5 = sub_23A08B364((uint64_t)a4, v5);
        v232 = *(_QWORD *)a1;
      }
      v239 = sub_23A086C18(v232, v233);
      if (*(char *)(v239 + 23) < 0)
      {
        v240 = *(_QWORD *)(v239 + 8);
        if (v240 > 127)
          goto LABEL_399;
      }
      else
      {
        v240 = *(unsigned __int8 *)(v239 + 23);
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v238] + 16) >= v240)
      {
        if (v236 > 0x7F)
        {
          *v5 = (8 * a2) | 0x82;
          if (v236 >= 0x4000)
          {
            v241 = v5 + 2;
            v242 = (a2 >> 4) & 0x1FFFFFF;
            do
            {
              *(v241 - 1) = v242 | 0x80;
              v243 = v242 >> 7;
              ++v241;
              v244 = v242 >> 14;
              v242 >>= 7;
            }
            while (v244);
            *(v241 - 1) = v243;
          }
          else
          {
            v5[1] = v430;
            v241 = v5 + 2;
          }
        }
        else
        {
          v241 = v5 + 1;
          *v5 = v236;
        }
        *v241 = v240;
        v245 = v241 + 1;
        if (*(char *)(v239 + 23) >= 0)
          v246 = (const void *)v239;
        else
          v246 = *(const void **)v239;
        memcpy(v245, v246, v240);
        v5 = &v245[v240];
        goto LABEL_397;
      }
LABEL_399:
      v5 = sub_23A08B874(a4, a2, v239, v5);
LABEL_397:
      ++v233;
      v232 = *(_QWORD *)a1;
      if (v233 >= *(_DWORD *)(*(_QWORD *)a1 + 8))
        return v5;
    }
  }
  if ((a1[10] & 1) != 0)
    return v5;
  v10 = a1[8];
  if ((v10 - 19) <= 0xFFFFFFED)
  {
    sub_23A08BD88((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    v11 = sub_23A08BDA0(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_23A08BED0((uint64_t)&v431, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v432);
  }
  switch(v10)
  {
    case 1:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v12 = *(_QWORD *)a1;
      v13 = (8 * a2) | 1;
      if (v13 <= 0x7F)
        goto LABEL_575;
      *v5 = (8 * a2) | 0x81;
      v14 = (8 * a2) >> 7;
      if (!(v13 >> 14))
        goto LABEL_602;
      v15 = v5 + 2;
      do
      {
        *((_BYTE *)v15 - 1) = v14 | 0x80;
        v16 = v14 >> 7;
        v15 = (_QWORD *)((char *)v15 + 1);
        v17 = v14 >> 14;
        v14 >>= 7;
      }
      while (v17);
      goto LABEL_693;
    case 2:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v324 = *(_DWORD *)a1;
      v325 = (8 * a2) | 5;
      if (v325 <= 0x7F)
        goto LABEL_571;
      *v5 = (8 * a2) | 0x85;
      v326 = (8 * a2) >> 7;
      if (!(v325 >> 14))
        goto LABEL_600;
      v327 = v5 + 2;
      do
      {
        *((_BYTE *)v327 - 1) = v326 | 0x80;
        v328 = v326 >> 7;
        v327 = (_DWORD *)((char *)v327 + 1);
        v329 = v326 >> 14;
        v326 >>= 7;
      }
      while (v329);
      goto LABEL_689;
    case 3:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v330 = *(_QWORD *)a1;
      v331 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v331 | 0x80;
        v355 = v331 >> 7;
        if (v331 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v355 | 0x80;
            v380 = v355 >> 7;
            ++v332;
            v381 = v355 >> 14;
            v355 >>= 7;
          }
          while (v381);
          *(v332 - 1) = v380;
        }
        else
        {
          v5[1] = v355;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v331;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
        goto LABEL_684;
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
        goto LABEL_686;
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v384 = v382 >> 14;
        v382 >>= 7;
      }
      while (v384);
      goto LABEL_718;
    case 4:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v330 = *(_QWORD *)a1;
      v333 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v333 | 0x80;
        v356 = v333 >> 7;
        if (v333 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v356 | 0x80;
            v385 = v356 >> 7;
            ++v332;
            v386 = v356 >> 14;
            v356 >>= 7;
          }
          while (v386);
          *(v332 - 1) = v385;
        }
        else
        {
          v5[1] = v356;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v333;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
        goto LABEL_684;
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
        goto LABEL_686;
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v387 = v382 >> 14;
        v382 >>= 7;
      }
      while (v387);
      goto LABEL_718;
    case 5:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v330 = *(int *)a1;
      v334 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v334 | 0x80;
        v357 = v334 >> 7;
        if (v334 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v357 | 0x80;
            v388 = v357 >> 7;
            ++v332;
            v389 = v357 >> 14;
            v357 >>= 7;
          }
          while (v389);
          *(v332 - 1) = v388;
        }
        else
        {
          v5[1] = v357;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v334;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
        goto LABEL_684;
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
        goto LABEL_686;
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v390 = v382 >> 14;
        v382 >>= 7;
      }
      while (v390);
      goto LABEL_718;
    case 6:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v12 = *(_QWORD *)a1;
      v13 = (8 * a2) | 1;
      if (v13 <= 0x7F)
        goto LABEL_575;
      *v5 = (8 * a2) | 0x81;
      v14 = (8 * a2) >> 7;
      if (!(v13 >> 14))
        goto LABEL_602;
      v15 = v5 + 2;
      do
      {
        *((_BYTE *)v15 - 1) = v14 | 0x80;
        v16 = v14 >> 7;
        v15 = (_QWORD *)((char *)v15 + 1);
        v335 = v14 >> 14;
        v14 >>= 7;
      }
      while (v335);
      goto LABEL_693;
    case 7:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v324 = *(_DWORD *)a1;
      v325 = (8 * a2) | 5;
      if (v325 <= 0x7F)
        goto LABEL_571;
      *v5 = (8 * a2) | 0x85;
      v326 = (8 * a2) >> 7;
      if (!(v325 >> 14))
        goto LABEL_600;
      v327 = v5 + 2;
      do
      {
        *((_BYTE *)v327 - 1) = v326 | 0x80;
        v328 = v326 >> 7;
        v327 = (_DWORD *)((char *)v327 + 1);
        v336 = v326 >> 14;
        v326 >>= 7;
      }
      while (v336);
      goto LABEL_689;
    case 8:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      LOBYTE(v337) = *a1;
      v338 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v338 | 0x80;
        v358 = v338 >> 7;
        if (v338 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v358 | 0x80;
            v391 = v358 >> 7;
            ++v332;
            v392 = v358 >> 14;
            v358 >>= 7;
          }
          while (v392);
          *(v332 - 1) = v391;
        }
        else
        {
          v5[1] = v358;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v338;
        v332 = v5 + 1;
      }
      goto LABEL_677;
    case 9:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v339 = *(_QWORD **)a1;
      if (*(char *)(*(_QWORD *)a1 + 23) < 0)
      {
        v340 = v339[1];
        if (v340 > 127)
          return sub_23A08B874(a4, a2, (uint64_t)v339, v5);
      }
      else
      {
        v340 = *(unsigned __int8 *)(*(_QWORD *)a1 + 23);
      }
      v364 = 8 * a2;
      v365 = 1;
      v366 = 2;
      v367 = 3;
      v368 = 4;
      if ((8 * a2) >> 28)
        v368 = 5;
      if (v364 >= 0x200000)
        v367 = v368;
      if (v364 >= 0x4000)
        v366 = v367;
      if (v364 >= 0x80)
        v365 = v366;
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v365] + 16) < v340)
        return sub_23A08B874(a4, a2, (uint64_t)v339, v5);
      v369 = v364 | 2;
      if ((v364 | 2) <= 0x7F)
        goto LABEL_633;
      *v5 = v364 | 0x82;
      v370 = v364 >> 7;
      if (!(v369 >> 14))
        goto LABEL_635;
      v371 = v5 + 2;
      do
      {
        *(v371 - 1) = v370 | 0x80;
        v372 = v370 >> 7;
        ++v371;
        v373 = v370 >> 14;
        v370 >>= 7;
      }
      while (v373);
      goto LABEL_727;
    case 10:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v341 = *(_QWORD *)a1;
      v342 = 8 * a2;
      v343 = (8 * a2) | 3;
      v344 = (8 * a2) >> 7;
      if (v343 > 0x7F)
      {
        *v5 = (8 * a2) | 0x83;
        if (v343 >> 14)
        {
          v345 = v5 + 2;
          v393 = v342 >> 7;
          do
          {
            *(v345 - 1) = v393 | 0x80;
            v394 = v393 >> 7;
            ++v345;
            v395 = v393 >> 14;
            v393 >>= 7;
          }
          while (v395);
          *(v345 - 1) = v394;
        }
        else
        {
          v5[1] = v344;
          v345 = v5 + 2;
        }
      }
      else
      {
        *v5 = v343;
        v345 = v5 + 1;
      }
      v332 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)v341 + 96))(v341, v345, a4);
      if (*a4 <= (unint64_t)v332)
        v332 = sub_23A08B364((uint64_t)a4, v332);
      v337 = v342 | 4;
      if ((v342 | 4) <= 0x7F)
        goto LABEL_677;
      *v332 = v342 | 0x84;
      if (!(v337 >> 14))
      {
        v332[1] = v344;
        return v332 + 2;
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v344 | 0x80;
        v411 = v344 >> 7;
        ++v5;
        v412 = v344 >> 14;
        v344 >>= 7;
      }
      while (v412);
      goto LABEL_715;
    case 11:
      if ((a1[10] & 0x10) != 0)
        return (char *)(*(uint64_t (**)(_QWORD, uint64_t, char *, uint64_t *))(**(_QWORD **)a1 + 136))(*(_QWORD *)a1, a2, v5, a4);
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v346 = *(_QWORD *)a1;
      v347 = (8 * a2) | 2;
      if (v347 > 0x7F)
      {
        *v5 = (8 * a2) | 0x82;
        v379 = (8 * a2) >> 7;
        if (v347 >> 14)
        {
          v348 = v5 + 2;
          do
          {
            *(v348 - 1) = v379 | 0x80;
            v421 = v379 >> 7;
            ++v348;
            v422 = v379 >> 14;
            v379 >>= 7;
          }
          while (v422);
          *(v348 - 1) = v421;
        }
        else
        {
          v5[1] = v379;
          v348 = v5 + 2;
        }
      }
      else
      {
        *v5 = v347;
        v348 = v5 + 1;
      }
      v423 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v346 + 80))(v346);
      if (v423 > 0x7F)
      {
        *v348 = v423 | 0x80;
        v425 = v423 >> 7;
        if (v423 >> 14)
        {
          v424 = v348 + 2;
          do
          {
            *(v424 - 1) = v425 | 0x80;
            v426 = v425 >> 7;
            ++v424;
            v427 = v425 >> 14;
            v425 >>= 7;
          }
          while (v427);
          *(v424 - 1) = v426;
        }
        else
        {
          v348[1] = v425;
          v424 = v348 + 2;
        }
      }
      else
      {
        *v348 = v423;
        v424 = v348 + 1;
      }
      return (char *)(*(uint64_t (**)(uint64_t, _BYTE *, uint64_t *))(*(_QWORD *)v346 + 96))(v346, v424, a4);
    case 12:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v339 = *(_QWORD **)a1;
      if (*(char *)(*(_QWORD *)a1 + 23) < 0)
      {
        v340 = v339[1];
        if (v340 > 127)
          return sub_23A08B874(a4, a2, (uint64_t)v339, v5);
      }
      else
      {
        v340 = *(unsigned __int8 *)(*(_QWORD *)a1 + 23);
      }
      v374 = 8 * a2;
      v375 = 1;
      v376 = 2;
      v377 = 3;
      v378 = 4;
      if ((8 * a2) >> 28)
        v378 = 5;
      if (v374 >= 0x200000)
        v377 = v378;
      if (v374 >= 0x4000)
        v376 = v377;
      if (v374 >= 0x80)
        v375 = v376;
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v375] + 16) < v340)
        return sub_23A08B874(a4, a2, (uint64_t)v339, v5);
      v369 = v374 | 2;
      if ((v374 | 2) > 0x7F)
      {
        *v5 = v374 | 0x82;
        v370 = v374 >> 7;
        if (v369 >> 14)
        {
          v371 = v5 + 2;
          do
          {
            *(v371 - 1) = v370 | 0x80;
            v372 = v370 >> 7;
            ++v371;
            v419 = v370 >> 14;
            v370 >>= 7;
          }
          while (v419);
LABEL_727:
          *(v371 - 1) = v372;
        }
        else
        {
LABEL_635:
          v5[1] = v370;
          v371 = v5 + 2;
        }
      }
      else
      {
LABEL_633:
        *v5 = v369;
        v371 = v5 + 1;
      }
      *v371 = v340;
      v420 = v371 + 1;
      if (*((char *)v339 + 23) < 0)
        v339 = (_QWORD *)*v339;
      memcpy(v420, v339, v340);
      return &v420[v340];
    case 13:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v337 = *(_DWORD *)a1;
      v349 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v349 | 0x80;
        v360 = v349 >> 7;
        if (v349 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v360 | 0x80;
            v396 = v360 >> 7;
            ++v332;
            v397 = v360 >> 14;
            v360 >>= 7;
          }
          while (v397);
          *(v332 - 1) = v396;
        }
        else
        {
          v5[1] = v360;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v349;
        v332 = v5 + 1;
      }
      if (v337 <= 0x7F)
      {
LABEL_677:
        *v332 = v337;
        return v332 + 1;
      }
      *v332 = v337 | 0x80;
      v398 = v337 >> 7;
      if (!(v337 >> 14))
      {
        v332[1] = v398;
        return v332 + 2;
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v398 | 0x80;
        v411 = v398 >> 7;
        ++v5;
        v413 = v398 >> 14;
        v398 >>= 7;
      }
      while (v413);
LABEL_715:
      *(v5 - 1) = v411;
      return v5;
    case 14:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v330 = *(int *)a1;
      v350 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v350 | 0x80;
        v361 = v350 >> 7;
        if (v350 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v361 | 0x80;
            v399 = v361 >> 7;
            ++v332;
            v400 = v361 >> 14;
            v361 >>= 7;
          }
          while (v400);
          *(v332 - 1) = v399;
        }
        else
        {
          v5[1] = v361;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v350;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
      {
LABEL_684:
        *v332 = v330;
        return v332 + 1;
      }
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
      {
LABEL_686:
        v332[1] = v382;
        return v332 + 2;
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v414 = v382 >> 14;
        v382 >>= 7;
      }
      while (v414);
LABEL_718:
      *(v5 - 1) = v383;
      return v5;
    case 15:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v324 = *(_DWORD *)a1;
      v325 = (8 * a2) | 5;
      if (v325 > 0x7F)
      {
        *v5 = (8 * a2) | 0x85;
        v326 = (8 * a2) >> 7;
        if (v325 >> 14)
        {
          v327 = v5 + 2;
          do
          {
            *((_BYTE *)v327 - 1) = v326 | 0x80;
            v328 = v326 >> 7;
            v327 = (_DWORD *)((char *)v327 + 1);
            v401 = v326 >> 14;
            v326 >>= 7;
          }
          while (v401);
LABEL_689:
          *((_BYTE *)v327 - 1) = v328;
        }
        else
        {
LABEL_600:
          v5[1] = v326;
          v327 = v5 + 2;
        }
      }
      else
      {
LABEL_571:
        *v5 = v325;
        v327 = v5 + 1;
      }
      *v327 = v324;
      return (char *)(v327 + 1);
    case 16:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v12 = *(_QWORD *)a1;
      v13 = (8 * a2) | 1;
      if (v13 > 0x7F)
      {
        *v5 = (8 * a2) | 0x81;
        v14 = (8 * a2) >> 7;
        if (v13 >> 14)
        {
          v15 = v5 + 2;
          do
          {
            *((_BYTE *)v15 - 1) = v14 | 0x80;
            v16 = v14 >> 7;
            v15 = (_QWORD *)((char *)v15 + 1);
            v402 = v14 >> 14;
            v14 >>= 7;
          }
          while (v402);
LABEL_693:
          *((_BYTE *)v15 - 1) = v16;
        }
        else
        {
LABEL_602:
          v5[1] = v14;
          v15 = v5 + 2;
        }
      }
      else
      {
LABEL_575:
        *v5 = v13;
        v15 = v5 + 1;
      }
      *v15 = v12;
      return (char *)(v15 + 1);
    case 17:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v351 = *(_DWORD *)a1;
      v352 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v352 | 0x80;
        v362 = v352 >> 7;
        if (v352 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v362 | 0x80;
            v403 = v362 >> 7;
            ++v332;
            v404 = v362 >> 14;
            v362 >>= 7;
          }
          while (v404);
          *(v332 - 1) = v403;
        }
        else
        {
          v5[1] = v362;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v352;
        v332 = v5 + 1;
      }
      v405 = (2 * v351) ^ (v351 >> 31);
      if (v405 <= 0x7F)
      {
        *v332 = v405;
        return v332 + 1;
      }
      *v332 = v405 | 0x80;
      v406 = v405 >> 7;
      if (!(v405 >> 14))
      {
        v332[1] = v406;
        return v332 + 2;
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v406 | 0x80;
        v415 = v406 >> 7;
        ++v5;
        v416 = v406 >> 14;
        v406 >>= 7;
      }
      while (v416);
      *(v5 - 1) = v415;
      return v5;
    case 18:
      if (*a4 <= (unint64_t)v5)
        v5 = sub_23A08B364((uint64_t)a4, v5);
      v353 = *(_QWORD *)a1;
      v354 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v354 | 0x80;
        v363 = v354 >> 7;
        if (v354 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v363 | 0x80;
            v407 = v363 >> 7;
            ++v332;
            v408 = v363 >> 14;
            v363 >>= 7;
          }
          while (v408);
          *(v332 - 1) = v407;
        }
        else
        {
          v5[1] = v363;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v354;
        v332 = v5 + 1;
      }
      v409 = (2 * v353) ^ (v353 >> 63);
      if (v409 > 0x7F)
      {
        *v332 = v409 | 0x80;
        v410 = v409 >> 7;
        if (v409 >> 14)
        {
          v5 = v332 + 2;
          do
          {
            *(v5 - 1) = v410 | 0x80;
            v417 = v410 >> 7;
            ++v5;
            v418 = v410 >> 14;
            v410 >>= 7;
          }
          while (v418);
          *(v5 - 1) = v417;
        }
        else
        {
          v332[1] = v410;
          return v332 + 2;
        }
      }
      else
      {
        *v332 = v409;
        return v332 + 1;
      }
      return v5;
    default:
      return v5;
  }
}

void sub_23A094B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A094B58(uint64_t a1)
{
  int *v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  int v5;
  int *v6;
  int *v7;
  int *v8;
  unint64_t v9;
  int *v10;
  int *v11;
  BOOL v12;

  v1 = *(int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) < 0x101u)
  {
    if (*(_WORD *)(a1 + 10))
    {
      v2 = 0;
      v3 = &v1[8 * *(unsigned __int16 *)(a1 + 10)];
      do
      {
        v4 = v1 + 2;
        v5 = *v1;
        v1 += 8;
        v2 += sub_23A094C18(v4, v5);
      }
      while (v1 != v3);
      return v2;
    }
    return 0;
  }
  v8 = *(int **)v1;
  v6 = v1 + 2;
  v7 = v8;
  if (v8 == v6)
    return 0;
  v2 = 0;
  do
  {
    v9 = sub_23A094C18((_QWORD *)v7 + 5, v7[8]);
    v10 = (int *)*((_QWORD *)v7 + 1);
    if (v10)
    {
      do
      {
        v11 = v10;
        v10 = *(int **)v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        v11 = (int *)*((_QWORD *)v7 + 2);
        v12 = *(_QWORD *)v11 == (_QWORD)v7;
        v7 = v11;
      }
      while (!v12);
    }
    v2 += v9;
    v7 = v11;
  }
  while (v11 != v6);
  return v2;
}

unint64_t sub_23A094C18(_QWORD *a1, int a2)
{
  int v4;
  unsigned __int8 v5;
  std::string *v6;
  std::string *v7;
  unint64_t v8;
  int v9;
  unsigned __int8 v10;
  std::string *v11;
  int v12;
  std::string *v13;
  int v14;
  char v15;
  std::string *v16;
  unint64_t v17;
  unsigned int v18;
  char v19;
  std::string *v20;
  uint64_t v21;
  int *v22;
  int v23;
  int *v24;
  int v25;
  int *v26;
  int *v27;
  int v28;
  int *v29;
  int v30;
  int *v31;
  int v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  int v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  int v42;
  uint64_t *v43;
  unint64_t v44;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
  int v51;
  int v52;
  int *v53;
  int v54;
  int v55;
  int *v56;
  int v57;
  int v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  int *v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int *v67;
  int v68;
  int v69;
  uint64_t v70;
  int *v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int *v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  int *v81;
  int v82;
  int v83;
  int *v84;
  int v85;
  int v86;
  int *v87;
  uint64_t v88;
  uint64_t v89;
  int *v90;
  int v91;
  int v92;
  int *v93;
  int *v94;
  int v95;
  int v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(void);
  int v100;
  uint64_t v101;
  char v102;
  std::string v103[2];

  if (*((_BYTE *)a1 + 9))
  {
    v4 = *((unsigned __int8 *)a1 + 8);
    v5 = v4 - 19;
    if (*((_BYTE *)a1 + 11))
    {
      if ((v4 - 19) <= 0xEDu)
      {
        sub_23A08BD88((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        v6 = sub_23A08BDA0(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_23A08BED0((uint64_t)&v102, (const char **)&v6->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v103);
      }
      switch(v4)
      {
        case 1:
        case 6:
        case 16:
          v21 = 8 * *(unsigned int *)*a1;
          goto LABEL_63;
        case 2:
        case 7:
        case 15:
          v21 = 4 * *(unsigned int *)*a1;
          goto LABEL_63;
        case 3:
          v27 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v28 = 0;
          do
          {
            v21 += (9 * (__clz(*(_QWORD *)sub_23A09BB20(v27, v28++) | 1) ^ 0x3F) + 73) >> 6;
            v27 = (int *)*a1;
          }
          while (v28 < *(_DWORD *)*a1);
          goto LABEL_63;
        case 4:
          v29 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v30 = 0;
          do
          {
            v21 += (9 * (__clz(*(_QWORD *)sub_23A09C148(v29, v30++) | 1) ^ 0x3F) + 73) >> 6;
            v29 = (int *)*a1;
          }
          while (v30 < *(_DWORD *)*a1);
          goto LABEL_63;
        case 5:
          v31 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v32 = 0;
          do
          {
            v33 = (int *)sub_23A09AED0(v31, v32);
            v34 = (9 * (__clz(*v33 | 1) ^ 0x1F) + 73) >> 6;
            if (*v33 >= 0)
              v35 = v34;
            else
              v35 = 10;
            v21 += v35;
            ++v32;
            v31 = (int *)*a1;
          }
          while (v32 < *(_DWORD *)*a1);
          goto LABEL_63;
        case 8:
          v21 = *(unsigned int *)*a1;
          goto LABEL_63;
        case 9:
        case 10:
        case 11:
        case 12:
          sub_23A08BD88((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1599);
          v7 = sub_23A08BDA0(v103, "Non-primitive types can't be packed.");
          sub_23A08BED0((uint64_t)&v102, (const char **)&v7->__r_.__value_.__l.__data_);
          sub_23A08BED8((uint64_t)v103);
          goto LABEL_7;
        case 13:
          v22 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v23 = 0;
          do
          {
            v21 += (9 * (__clz(*(_DWORD *)sub_23A09B4F8(v22, v23++) | 1) ^ 0x1F) + 73) >> 6;
            v22 = (int *)*a1;
          }
          while (v23 < *(_DWORD *)*a1);
          goto LABEL_63;
        case 14:
          v36 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v37 = 0;
          do
          {
            v38 = (int *)sub_23A09AED0(v36, v37);
            v39 = (9 * (__clz(*v38 | 1) ^ 0x1F) + 73) >> 6;
            if (*v38 >= 0)
              v40 = v39;
            else
              v40 = 10;
            v21 += v40;
            ++v37;
            v36 = (int *)*a1;
          }
          while (v37 < *(_DWORD *)*a1);
          goto LABEL_63;
        case 17:
          v24 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v25 = 0;
          do
          {
            v26 = (int *)sub_23A09AED0(v24, v25);
            v21 += (9 * (__clz((2 * *v26) ^ (*v26 >> 31) | 1) ^ 0x1F) + 73) >> 6;
            ++v25;
            v24 = (int *)*a1;
          }
          while (v25 < *(_DWORD *)*a1);
          goto LABEL_63;
        case 18:
          v41 = (int *)*a1;
          if (*(int *)*a1 < 1)
            goto LABEL_7;
          v21 = 0;
          v42 = 0;
          do
          {
            v43 = (uint64_t *)sub_23A09BB20(v41, v42);
            v21 += (9 * (__clz((2 * *v43) ^ (*v43 >> 63) | 1) ^ 0x3F) + 73) >> 6;
            ++v42;
            v41 = (int *)*a1;
          }
          while (v42 < *(_DWORD *)*a1);
LABEL_63:
          *((_DWORD *)a1 + 3) = v21;
          v44 = v21 + ((9 * (__clz((8 * a2) | 3) ^ 0x1F) + 73) >> 6) + ((9 * (__clz(v21 | 1) ^ 0x1F) + 73) >> 6);
          if (v21)
            v8 = v44;
          else
            v8 = 0;
          break;
        default:
LABEL_7:
          v8 = 0;
          *((_DWORD *)a1 + 3) = 0;
          break;
      }
    }
    else
    {
      if ((v4 - 19) > 0xEDu)
      {
        v14 = *((unsigned __int8 *)a1 + 8);
      }
      else
      {
        sub_23A08BD88((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        v13 = sub_23A08BDA0(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_23A08BED0((uint64_t)&v102, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v103);
        v14 = *((unsigned __int8 *)a1 + 8);
        v5 = v14 - 19;
      }
      v15 = v4 == 10;
      if (v5 <= 0xEDu)
      {
        sub_23A08BD88((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        v16 = sub_23A08BDA0(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_23A08BED0((uint64_t)&v102, (const char **)&v16->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)v103);
      }
      v17 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v15;
      switch(v14)
      {
        case 1:
        case 6:
        case 16:
          v18 = v17 + 8;
          goto LABEL_27;
        case 2:
        case 7:
        case 15:
          v18 = v17 + 4;
LABEL_27:
          v8 = v18 * (unint64_t)*(unsigned int *)*a1;
          break;
        case 3:
          v50 = (int *)*a1;
          v51 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v51;
          if (v51 >= 1)
          {
            v52 = 0;
            do
            {
              v8 += (9 * (__clz(*(_QWORD *)sub_23A09BB20(v50, v52++) | 1) ^ 0x3F) + 73) >> 6;
              v50 = (int *)*a1;
            }
            while (v52 < *(_DWORD *)*a1);
          }
          break;
        case 4:
          v53 = (int *)*a1;
          v54 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v54;
          if (v54 >= 1)
          {
            v55 = 0;
            do
            {
              v8 += (9 * (__clz(*(_QWORD *)sub_23A09C148(v53, v55++) | 1) ^ 0x3F) + 73) >> 6;
              v53 = (int *)*a1;
            }
            while (v55 < *(_DWORD *)*a1);
          }
          break;
        case 5:
          v56 = (int *)*a1;
          v57 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v57;
          if (v57 >= 1)
          {
            v58 = 0;
            do
            {
              v59 = (int *)sub_23A09AED0(v56, v58);
              v60 = (9 * (__clz(*v59 | 1) ^ 0x1F) + 73) >> 6;
              if (*v59 >= 0)
                v61 = v60;
              else
                v61 = 10;
              v8 += v61;
              ++v58;
              v56 = (int *)*a1;
            }
            while (v58 < *(_DWORD *)*a1);
          }
          break;
        case 8:
          v8 = *(unsigned int *)*a1 + *(unsigned int *)*a1 * (unint64_t)v17;
          break;
        case 9:
          v62 = (int *)*a1;
          v63 = *(_DWORD *)(*a1 + 8);
          v8 = v17 * (unint64_t)v63;
          if (v63 >= 1)
          {
            v64 = 0;
            do
            {
              v65 = sub_23A086C18((uint64_t)v62, v64);
              v66 = *(unsigned __int8 *)(v65 + 23);
              if ((v66 & 0x80u) != 0)
                v66 = *(_QWORD *)(v65 + 8);
              v8 += v66 + ((9 * (__clz(v66 | 1) ^ 0x1F) + 73) >> 6);
              ++v64;
              v62 = (int *)*a1;
            }
            while (v64 < *(_DWORD *)(*a1 + 8));
          }
          break;
        case 10:
          v67 = (int *)*a1;
          v68 = *(_DWORD *)(*a1 + 8);
          v8 = v17 * (unint64_t)v68;
          if (v68 >= 1)
          {
            v69 = 0;
            do
            {
              v70 = sub_23A095AA8((uint64_t)v67, v69);
              v8 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v70 + 72))(v70);
              ++v69;
              v67 = (int *)*a1;
            }
            while (v69 < *(_DWORD *)(*a1 + 8));
          }
          break;
        case 11:
          v71 = (int *)*a1;
          v72 = *(_DWORD *)(*a1 + 8);
          v8 = v17 * (unint64_t)v72;
          if (v72 >= 1)
          {
            v73 = 0;
            do
            {
              v74 = sub_23A095AA8((uint64_t)v71, v73);
              v75 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v74 + 72))(v74);
              v8 += v75 + ((9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6);
              ++v73;
              v71 = (int *)*a1;
            }
            while (v73 < *(_DWORD *)(*a1 + 8));
          }
          break;
        case 12:
          v76 = (int *)*a1;
          v77 = *(_DWORD *)(*a1 + 8);
          v8 = v17 * (unint64_t)v77;
          if (v77 >= 1)
          {
            v78 = 0;
            do
            {
              v79 = sub_23A086C18((uint64_t)v76, v78);
              v80 = *(unsigned __int8 *)(v79 + 23);
              if ((v80 & 0x80u) != 0)
                v80 = *(_QWORD *)(v79 + 8);
              v8 += v80 + ((9 * (__clz(v80 | 1) ^ 0x1F) + 73) >> 6);
              ++v78;
              v76 = (int *)*a1;
            }
            while (v78 < *(_DWORD *)(*a1 + 8));
          }
          break;
        case 13:
          v81 = (int *)*a1;
          v82 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v82;
          if (v82 >= 1)
          {
            v83 = 0;
            do
            {
              v8 += (9 * (__clz(*(_DWORD *)sub_23A09B4F8(v81, v83++) | 1) ^ 0x1F) + 73) >> 6;
              v81 = (int *)*a1;
            }
            while (v83 < *(_DWORD *)*a1);
          }
          break;
        case 14:
          v84 = (int *)*a1;
          v85 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v85;
          if (v85 >= 1)
          {
            v86 = 0;
            do
            {
              v87 = (int *)sub_23A09AED0(v84, v86);
              v88 = (9 * (__clz(*v87 | 1) ^ 0x1F) + 73) >> 6;
              if (*v87 >= 0)
                v89 = v88;
              else
                v89 = 10;
              v8 += v89;
              ++v86;
              v84 = (int *)*a1;
            }
            while (v86 < *(_DWORD *)*a1);
          }
          break;
        case 17:
          v90 = (int *)*a1;
          v91 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v91;
          if (v91 >= 1)
          {
            v92 = 0;
            do
            {
              v93 = (int *)sub_23A09AED0(v90, v92);
              v8 += (9 * (__clz((2 * *v93) ^ (*v93 >> 31) | 1) ^ 0x1F) + 73) >> 6;
              ++v92;
              v90 = (int *)*a1;
            }
            while (v92 < *(_DWORD *)*a1);
          }
          break;
        case 18:
          v94 = (int *)*a1;
          v95 = *(_DWORD *)*a1;
          v8 = v17 * (unint64_t)v95;
          if (v95 >= 1)
          {
            v96 = 0;
            do
            {
              v97 = (uint64_t *)sub_23A09BB20(v94, v96);
              v8 += (9 * (__clz((2 * *v97) ^ (*v97 >> 63) | 1) ^ 0x3F) + 73) >> 6;
              ++v96;
              v94 = (int *)*a1;
            }
            while (v96 < *(_DWORD *)*a1);
          }
          break;
        default:
          return 0;
      }
    }
  }
  else if ((*((_BYTE *)a1 + 10) & 1) != 0)
  {
    return 0;
  }
  else
  {
    v9 = *((unsigned __int8 *)a1 + 8);
    v10 = v9 - 19;
    if ((v9 - 19) > 0xEDu)
    {
      v12 = *((unsigned __int8 *)a1 + 8);
    }
    else
    {
      sub_23A08BD88((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = sub_23A08BDA0(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v102, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v103);
      v12 = *((unsigned __int8 *)a1 + 8);
      v10 = v12 - 19;
    }
    v19 = v9 == 10;
    if (v10 <= 0xEDu)
    {
      sub_23A08BD88((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = sub_23A08BDA0(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v102, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v103);
    }
    v8 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v19;
    switch(v12)
    {
      case 1:
      case 6:
      case 16:
        v8 += 8;
        return v8;
      case 2:
      case 7:
      case 15:
        v8 += 4;
        return v8;
      case 3:
      case 4:
        v46 = *a1;
        goto LABEL_138;
      case 5:
      case 14:
        v47 = (9 * (__clz(*(_DWORD *)a1 | 1) ^ 0x1F) + 73) >> 6;
        if (*(int *)a1 >= 0)
          v48 = v47;
        else
          v48 = 10;
        v8 += v48;
        return v8;
      case 8:
        return ++v8;
      case 9:
      case 12:
        v49 = *(_QWORD *)(*a1 + 8);
        if (*(char *)(*a1 + 23) >= 0)
          v49 = *(unsigned __int8 *)(*a1 + 23);
        v8 += v49 + ((9 * (__clz(v49 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 10:
        v8 += (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 72))(*a1);
        return v8;
      case 11:
        v98 = *(_QWORD *)*a1;
        if ((*((_BYTE *)a1 + 10) & 0x10) != 0)
          v99 = *(uint64_t (**)(void))(v98 + 88);
        else
          v99 = *(uint64_t (**)(void))(v98 + 72);
        v101 = v99();
        v8 += v101 + ((9 * (__clz(v101 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 13:
        v100 = *(_DWORD *)a1;
        goto LABEL_136;
      case 17:
        v100 = (2 * *(_DWORD *)a1) ^ (*(int *)a1 >> 31);
LABEL_136:
        v8 += (9 * (__clz(v100 | 1) ^ 0x1F) + 73) >> 6;
        break;
      case 18:
        v46 = (2 * *a1) ^ ((uint64_t)*a1 >> 63);
LABEL_138:
        v8 += (9 * (__clz(v46 | 1) ^ 0x3F) + 73) >> 6;
        break;
      default:
        return v8;
    }
  }
  return v8;
}

void sub_23A09577C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A0957BC(unsigned __int8 *result)
{
  unsigned __int8 **v1;
  uint64_t v2;
  std::string *v3;
  uint64_t *v4;
  std::string *v5;
  int v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t *v9;
  char v10;
  std::string v11[2];

  v1 = (unsigned __int8 **)result;
  v2 = result[8];
  if (result[9])
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v3 = sub_23A08BDA0(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v10, (const char **)&v3->__r_.__value_.__l.__data_);
      result = (unsigned __int8 *)sub_23A08BED8((uint64_t)v11);
    }
    switch(v2)
    {
      case 1:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09CEB8();
          goto LABEL_29;
        }
        break;
      case 2:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09C890();
          goto LABEL_29;
        }
        break;
      case 3:
      case 16:
      case 18:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09BC40();
          goto LABEL_29;
        }
        break;
      case 4:
      case 6:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09C268();
          goto LABEL_29;
        }
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09AFF0();
          goto LABEL_29;
        }
        break;
      case 7:
      case 13:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09B618();
          goto LABEL_29;
        }
        break;
      case 8:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09A9CC();
LABEL_29:
          v8 = 0x1080C4057E67DB5;
          return (unsigned __int8 *)MEMORY[0x23B83FE88](v4, v8);
        }
        break;
      case 9:
      case 12:
        result = *v1;
        if (*v1)
        {
          v4 = (uint64_t *)sub_23A09D124();
          goto LABEL_34;
        }
        break;
      case 10:
      case 11:
        v9 = (uint64_t *)*v1;
        if (v9)
        {
          sub_23A096258(v9);
          v4 = sub_23A07DF74(v9);
LABEL_34:
          v8 = 0x1020C4014030ADELL;
          return (unsigned __int8 *)MEMORY[0x23B83FE88](v4, v8);
        }
        break;
      default:
        return result;
    }
  }
  else
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v5 = sub_23A08BDA0(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_23A08BED0((uint64_t)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      result = (unsigned __int8 *)sub_23A08BED8((uint64_t)v11);
    }
    v6 = dword_23A0A5468[v2];
    if (v6 == 10)
    {
      result = *v1;
      if (*v1)
        return (unsigned __int8 *)(*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)result + 8))(result);
    }
    else if (v6 == 9)
    {
      v7 = *v1;
      if (v7)
      {
        if ((char)v7[23] < 0)
          operator delete(*(void **)v7);
        v4 = (uint64_t *)v7;
        v8 = 0x1012C40EC159624;
        return (unsigned __int8 *)MEMORY[0x23B83FE88](v4, v8);
      }
    }
  }
  return result;
}

void sub_23A0959C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A0959E8()
{
  JUMPOUT(0x23B83FE88);
}

unsigned __int8 *sub_23A0959FC(unsigned __int8 *result, unsigned __int8 *a2)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  BOOL v6;

  if (result != a2)
  {
    v3 = result;
    do
    {
      result = sub_23A0957BC(v3 + 40);
      v4 = (unsigned __int8 *)*((_QWORD *)v3 + 1);
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = *(unsigned __int8 **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (unsigned __int8 *)*((_QWORD *)v3 + 2);
          v6 = *(_QWORD *)v5 == (_QWORD)v3;
          v3 = v5;
        }
        while (!v6);
      }
      v3 = v5;
    }
    while (v5 != a2);
  }
  return result;
}

uint64_t *sub_23A095A84(uint64_t *a1)
{
  sub_23A096258(a1);
  return sub_23A07DF74(a1);
}

uint64_t sub_23A095AA8(uint64_t a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
}

void sub_23A095B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A095B84(uint64_t result, uint64_t a2)
{
  int *v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;

  v2 = *(int **)(result + 16);
  if (!v2)
    return sub_23A095BD8(result, a2);
  v3 = *v2;
  if ((int)v3 >= *(_DWORD *)(result + 12))
    return sub_23A095BD8(result, a2);
  v4 = v2 + 2;
  v5 = *(int *)(result + 8);
  if ((int)v5 < (int)v3)
    *(_QWORD *)&v4[2 * v3] = *(_QWORD *)&v4[2 * v5];
  *(_QWORD *)&v4[2 * v5] = a2;
  *(_DWORD *)(result + 8) = v5 + 1;
  ++**(_DWORD **)(result + 16);
  return result;
}

uint64_t sub_23A095BD8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int *v4;
  int v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;

  v3 = result;
  v4 = *(int **)(result + 16);
  if (!v4)
  {
    v5 = *(_DWORD *)(result + 12);
    goto LABEL_11;
  }
  v5 = *(_DWORD *)(result + 8);
  v6 = *(_DWORD *)(result + 12);
  if (v5 == v6)
  {
LABEL_11:
    result = sub_23A09D128(result, v5 + 1);
    goto LABEL_12;
  }
  v7 = *v4;
  if ((_DWORD)v7 != v6)
  {
    if (v5 >= (int)v7)
    {
      v9 = v7 + 1;
      goto LABEL_13;
    }
    *(_QWORD *)&v4[2 * v7 + 2] = *(_QWORD *)&v4[2 * v5 + 2];
LABEL_12:
    v4 = *(int **)(v3 + 16);
    v9 = *v4 + 1;
LABEL_13:
    *v4 = v9;
    goto LABEL_14;
  }
  result = *(_QWORD *)&v4[2 * v5 + 2];
  if (result)
    v8 = *(_QWORD *)v3 == 0;
  else
    v8 = 0;
  if (v8)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    v4 = *(int **)(v3 + 16);
  }
LABEL_14:
  v10 = *(int *)(v3 + 8);
  *(_DWORD *)(v3 + 8) = v10 + 1;
  *(_QWORD *)&v4[2 * v10 + 2] = a2;
  return result;
}

uint64_t *sub_23A095C9C(_QWORD *a1, _QWORD *a2, uint64_t *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      sub_23A09029C(a3, *((unsigned int *)v5 + 8), v5 + 5);
      v6 = (_QWORD *)v5[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v5[2];
          v8 = *v7 == (_QWORD)v5;
          v5 = v7;
        }
        while (!v8);
      }
      v5 = v7;
    }
    while (v7 != a2);
  }
  return a3;
}

const std::string::value_type *sub_23A095D1C(uint64_t a1, std::string::value_type *__s, int a3, std::string *a4)
{
  uint64_t v6;

  if (*(_QWORD *)(a1 + 8) - (_QWORD)__s + 16 < a3)
    return sub_23A097B1C(a1, __s, a3, a4);
  v6 = a3;
  MEMORY[0x23B83FB94](a4, __s, a3);
  return &__s[v6];
}

char *sub_23A095D74(uint64_t a1, char *a2, uint64_t a3)
{
  int v5;
  char *result;
  int v7;
  unint64_t v8;
  int v9;
  __int128 v10;
  signed int v11;
  std::string *v12;
  int v13;
  std::string *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  std::string *v18;
  _OWORD v19[2];
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;
  char v23;
  _OWORD v24[2];
  uint64_t v25;
  std::string v26;
  __int16 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v15 = (unint64_t)&result[v5];
    v16 = *(_OWORD *)(a3 + 16);
    v19[0] = *(_OWORD *)a3;
    v19[1] = v16;
    v20 = *(_QWORD *)(a3 + 32);
    result = sub_23A095FCC(result, v15, (unsigned int **)v19);
    if ((char *)v15 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      v10 = *(_OWORD *)(a3 + 16);
      v24[0] = *(_OWORD *)a3;
      v24[1] = v10;
      v25 = *(_QWORD *)(a3 + 32);
      result = sub_23A095FCC(result, v8, (unsigned int **)v24);
      if (!result)
        break;
      v11 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v11 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v12 = sub_23A08BDA0(&v26, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v23, (const char **)&v12->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v26);
      }
      v13 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v27 = 0;
        v26.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v26.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v22 = *(_QWORD *)(a3 + 32);
        v17 = *(_OWORD *)(a3 + 16);
        v21[0] = *(_OWORD *)a3;
        v21[1] = v17;
        v18 = (std::string *)sub_23A095FCC((char *)&v26 + v11, (unint64_t)&v26 + v13, (unsigned int **)v21);
        result = 0;
        if (v18 && v18 == (std::string *)((char *)&v26 + v13))
          return (char *)(*(_QWORD *)(a1 + 8) + v13);
        return result;
      }
      v5 = v5 - v9 - v11;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v14 = sub_23A08BDA0(&v26, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v23, (const char **)&v14->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v26);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v11;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A095FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  sub_23A08BED8((uint64_t)&a27);
  _Unwind_Resume(a1);
}

char *sub_23A095FCC(char *a1, unint64_t a2, unsigned int **a3)
{
  char *v3;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t *v13;
  std::string *v14;

  v3 = a1;
  while ((unint64_t)v3 < a2)
  {
    v6 = *v3;
    if (*v3 < 0)
    {
      v7 = v6 + (v3[1] << 7);
      v6 = (v7 - 128);
      if (v3[1] < 0)
      {
        v3 = (char *)sub_23A097FD4((uint64_t)v3, (v7 - 128));
        if (!v3)
          return v3;
        v6 = v8;
      }
      else
      {
        v3 += 2;
      }
    }
    else
    {
      ++v3;
    }
    if (((unsigned int (*)(unsigned int *, unint64_t))a3[1])(a3[2], v6))
    {
      v9 = (int *)*a3;
      v10 = **a3;
      if ((_DWORD)v10 == (*a3)[1])
      {
        v11 = v10 + 1;
        sub_23A09AB80((int *)*a3, v10 + 1);
        *(_DWORD *)(sub_23A09AFF4((uint64_t)v9) + 4 * v10) = v6;
      }
      else
      {
        *(_DWORD *)(sub_23A09AFF4((uint64_t)*a3) + 4 * v10) = v6;
        v11 = v10 + 1;
      }
      *v9 = v11;
    }
    else
    {
      v12 = *((_DWORD *)a3 + 8);
      v13 = (unint64_t *)a3[3];
      if ((*v13 & 1) != 0)
        v14 = (std::string *)((*v13 & 0xFFFFFFFFFFFFFFFELL) + 8);
      else
        v14 = (std::string *)sub_23A07DCC0(v13);
      sub_23A097ED4(v12, v6, v14);
    }
  }
  return v3;
}

char *sub_23A0960F4(uint64_t a1, char *__src, int64_t __n)
{
  char *v6;
  uint64_t v7;
  char *v8;

  *(_DWORD *)(a1 + 84) = 0;
  if (__n >= 17)
  {
    *(_DWORD *)(a1 + 28) = 16;
    v6 = &__src[__n - 16];
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = a1 + 40;
    if (*(_QWORD *)(a1 + 72) != 1)
      return __src;
    v7 = 2;
    v8 = __src;
    goto LABEL_6;
  }
  v8 = (char *)(a1 + 40);
  memcpy((void *)(a1 + 40), __src, __n);
  *(_DWORD *)(a1 + 28) = 0;
  *(_QWORD *)a1 = &v8[__n];
  *(_QWORD *)(a1 + 8) = &v8[__n];
  *(_QWORD *)(a1 + 16) = 0;
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    v7 = __src - v8;
LABEL_6:
    *(_QWORD *)(a1 + 72) = v7;
  }
  return v8;
}

uint64_t sub_23A0961A4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_23A08BD88((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    v5 = sub_23A08BDA0(v7, "CHECK failed: (n) >= (0): ");
    sub_23A08BED0((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return sub_23A08BED8((uint64_t)v7);
  }
  else if ((_DWORD)v1)
  {
    v2 = result;
    v3 = (uint64_t *)(*(_QWORD *)(result + 16) + 8);
    do
    {
      v4 = *v3++;
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 40))(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(v2 + 8) = 0;
  }
  return result;
}

void sub_23A096240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A096258(_QWORD *a1)
{
  unsigned int *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    v3 = v2 + 2;
    v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
          (*(void (**)(_QWORD))(*(_QWORD *)*v3 + 8))(*v3);
        ++v3;
        --v4;
      }
      while (v4);
      v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t **sub_23A0962C8(uint64_t **a1, int *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t *v10;
  __int128 v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x40uLL);
    v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    sub_23A05F360(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_23A096380(uint64_t a1)
{
  sub_23A004580(a1, *(_QWORD **)(a1 + 8));
}

uint64_t *sub_23A096388(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  __int128 v9;
  uint64_t v11;
  uint64_t *v12;

  v6 = sub_23A09640C(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x40uLL);
    v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    sub_23A05F360(a1, (uint64_t)v12, v8, v7);
  }
  return v7;
}

uint64_t *sub_23A09640C(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void sub_23A0965B4()
{
  __assert_rtn("flat_end", "extension_set.h", 829, "!is_large()");
}

uint64_t sub_23A0965DC(uint64_t (***a1)(_QWORD))
{
  return (**a1)(a1);
}

void sub_23A0965E8(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_23A0965FC()
{
  unsigned __int8 v0;

  v0 = atomic_load((unsigned __int8 *)&qword_256942078);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_256942078))
    {
      qword_2569425B8 = 0;
      unk_2569425C0 = 0;
      qword_2569425C8 = 0;
      sub_23A096FCC((uint64_t)sub_23A0965E8, (uint64_t)&qword_2569425B8);
      atomic_store(1u, byte_256942570);
      __cxa_guard_release(&qword_256942078);
    }
  }
}

void sub_23A096674(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_256942078);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09668C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 64))(v4, a1);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 64))(a1, a2);
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 64))(a2, v4);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
}

void sub_23A096728(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_23A096744(_DWORD *a1)
{
  unsigned __int8 v2;
  pthread_t v3;
  uint64_t v4;
  std::string *v5;
  unsigned __int8 v6;
  char v7;
  std::string v8[2];

  v2 = atomic_load((unsigned __int8 *)&qword_256942050);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_256942050))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_256941270, &dword_239FE9000);
    __cxa_guard_release(&qword_256942050);
  }
  v3 = pthread_self();
  v4 = (uint64_t)v3;
  if (qword_2569421F8)
  {
    if (v3 && v3 == (pthread_t)qword_2569421F8)
      goto LABEL_5;
  }
  else if (!v3)
  {
LABEL_5:
    if (*a1 != 1)
    {
      sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/generated_message_util.cc", 785);
      v5 = sub_23A08BDA0(v8, "CHECK failed: (scc->visit_status.load(std::memory_order_relaxed)) == (SCCInfoBase::kRunning): ");
      sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v8);
    }
    return;
  }
  v6 = atomic_load(byte_256942570);
  if ((v6 & 1) == 0)
    sub_23A0965FC();
  std::mutex::lock(&stru_256941270);
  qword_2569421F8 = v4;
  sub_23A096894(a1);
  qword_2569421F8 = 0;
  std::mutex::unlock(&stru_256941270);
}

void sub_23A096878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

_DWORD *sub_23A096894(_DWORD *result)
{
  uint64_t (**v1)(void);
  _DWORD *v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _DWORD *v8;

  if (*result == -1)
  {
    v1 = (uint64_t (**)(void))result;
    *result = 1;
    v2 = result + 6;
    v3 = result[1];
    if (v3 >= 1)
    {
      for (i = 0; i < v3; ++i)
      {
        if (*(_QWORD *)&v2[2 * i])
        {
          sub_23A096894();
          v3 = *((_DWORD *)v1 + 1);
        }
      }
    }
    v5 = v3;
    v6 = *((_DWORD *)v1 + 2);
    if (v6 >= 1)
    {
      v7 = 0;
      v8 = &v2[2 * v5];
      do
      {
        if (**(_QWORD **)&v8[2 * v7])
        {
          sub_23A096894();
          v6 = *((_DWORD *)v1 + 2);
        }
        ++v7;
      }
      while (v7 < v6);
    }
    result = (_DWORD *)v1[2]();
    atomic_store(0, (unsigned int *)v1);
  }
  return result;
}

uint64_t sub_23A096940(char *__src, int64_t __n, uint64_t a3, char a4)
{
  char *v6;
  BOOL v7;
  _BYTE v9[32];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0x7FFFFFFF00000000;
  v14 = dword_256941634;
  v15 = 0x80000000;
  v16 = 0;
  v17 = 0;
  v6 = sub_23A0960F4((uint64_t)v9, __src, __n);
  if ((*(uint64_t (**)(uint64_t, char *, _BYTE *))(*(_QWORD *)a3 + 88))(a3, v6, v9))
    v7 = (_DWORD)v13 == 0;
  else
    v7 = 0;
  if (v7)
  {
    if ((a4 & 2) != 0 || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 48))(a3) & 1) != 0)
      return 1;
    sub_23A096A38(a3);
  }
  return 0;
}

_QWORD *sub_23A096A28@<X0>(_QWORD *a1@<X8>)
{
  return sub_239FEE1FC(a1, "(cannot determine missing fields for lite message)");
}

uint64_t sub_23A096A38(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string __p;
  std::string v6[2];

  sub_23A08BD88((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 133);
  sub_23A096AE8("parse", a1, &__p);
  v2 = sub_23A08BDC8(v6, (const std::string::value_type *)&__p);
  sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return sub_23A08BED8((uint64_t)v6);
}

void sub_23A096AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
    operator delete(__p);
  sub_23A08BED8((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_23A096AE8(const std::string::value_type *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  const std::string::value_type *p_p;
  std::string::size_type v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  void *__p;
  std::string::size_type v11;
  unsigned __int8 v12;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a3, "Can't ");
  std::string::append(a3, a1);
  std::string::append(a3, " message of type \"");
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)a2 + 16))(&__p, a2);
  if ((v12 & 0x80u) == 0)
    p_p = (const std::string::value_type *)&__p;
  else
    p_p = (const std::string::value_type *)__p;
  if ((v12 & 0x80u) == 0)
    v7 = v12;
  else
    v7 = v11;
  std::string::append(a3, p_p, v7);
  if ((char)v12 < 0)
    operator delete(__p);
  std::string::append(a3, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)a2 + 56))(&__p, a2);
  if ((v12 & 0x80u) == 0)
    v8 = (const std::string::value_type *)&__p;
  else
    v8 = (const std::string::value_type *)__p;
  if ((v12 & 0x80u) == 0)
    v9 = v12;
  else
    v9 = v11;
  std::string::append(a3, v8, v9);
  if ((char)v12 < 0)
    operator delete(__p);
}

void sub_23A096BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

uint64_t sub_23A096C30(uint64_t a1, char *a2, unsigned int a3)
{
  int64_t v5;

  if ((a3 & 0x80000000) != 0)
    sub_23A097280();
  v5 = a3;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  return sub_23A096940(a2, v5, a1, 1);
}

BOOL sub_23A096C80(uint64_t a1, std::string *a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string __p;
  std::string v9[2];

  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1) & 1) == 0)
  {
    sub_23A08BD88((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 449);
    v4 = sub_23A08BDA0(v9, "CHECK failed: IsInitialized(): ");
    sub_23A096AE8("serialize", a1, &__p);
    v5 = sub_23A08BDC8(v4, (const std::string::value_type *)&__p);
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v9);
  }
  return sub_23A096D70(a1, a2);
}

void sub_23A096D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
    operator delete(__p);
  sub_23A08BED8((uint64_t)&a16);
  _Unwind_Resume(a1);
}

BOOL sub_23A096D70(uint64_t a1, std::string *a2)
{
  std::string *v2;
  std::string::size_type size;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  char v14;
  std::string __p[2];
  std::string v16[2];
  uint64_t v17;
  __int16 v18;
  char v19;
  uint64_t v20;

  v2 = a2;
  v20 = *MEMORY[0x24BDAC8D0];
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    size = a2->__r_.__value_.__l.__size_;
  else
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
  v6 = v5;
  v7 = v5 >> 31;
  if (v5 >> 31)
  {
    sub_23A08BD88((uint64_t)v16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 457);
    (*(void (**)(std::string *__return_ptr, uint64_t))(*(_QWORD *)a1 + 16))(__p, a1);
    v10 = sub_23A08BDC8(v16, (const std::string::value_type *)__p);
    v11 = sub_23A08BDA0(v10, " exceeded maximum protobuf size of 2GB: ");
    v12 = sub_23A08BFF0(v11, v6);
    sub_23A08BED0((uint64_t)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
    v9 = v16;
    goto LABEL_12;
  }
  std::string::resize(v2, v5 + size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
    v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  *(_OWORD *)&v16[0].__r_.__value_.__l.__data_ = (unint64_t)v2 + size + v6;
  v17 = 0;
  v18 = 0;
  v19 = byte_2569425B4 & 1;
  if (v16[0].__r_.__value_.__r.__words[0] != (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
  {
    sub_23A08BD88((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 360);
    v8 = sub_23A08BDA0(__p, "CHECK failed: target + size == res: ");
    sub_23A08BED0((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
    v9 = __p;
LABEL_12:
    sub_23A08BED8((uint64_t)v9);
  }
  return v7 == 0;
}

void sub_23A096F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  sub_23A08BED8((uint64_t)&__p);
  _Unwind_Resume(a1);
}

BOOL sub_23A096F60@<W0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _BOOL8 result;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  result = sub_23A096C80(a1, (std::string *)a2);
  if (!result)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      **(_BYTE **)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 23) = 0;
    }
  }
  return result;
}

void sub_23A096FB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_23A096FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;

  v4 = sub_23A0970EC();
  std::mutex::lock((std::mutex *)(v4 + 24));
  v5 = *(_QWORD **)(v4 + 8);
  v6 = *(_QWORD *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    v8 = ((uint64_t)v5 - *(_QWORD *)v4) >> 4;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 60)
      sub_239FEBE68();
    v10 = v6 - *(_QWORD *)v4;
    if (v10 >> 3 > v9)
      v9 = v10 >> 3;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_23A05F5F8(v4 + 16, v11);
    else
      v12 = 0;
    v13 = &v12[16 * v8];
    v14 = &v12[16 * v11];
    *(_QWORD *)v13 = a1;
    *((_QWORD *)v13 + 1) = a2;
    v7 = v13 + 16;
    v16 = *(char **)v4;
    v15 = *(char **)(v4 + 8);
    if (v15 != *(char **)v4)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v15 - 1);
        v13 -= 16;
        v15 -= 16;
      }
      while (v15 != v16);
      v15 = *(char **)v4;
    }
    *(_QWORD *)v4 = v13;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v5 = a1;
    v5[1] = a2;
    v7 = v5 + 2;
  }
  *(_QWORD *)(v4 + 8) = v7;
  std::mutex::unlock((std::mutex *)(v4 + 24));
}

void sub_23A0970D8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23A0970EC()
{
  unsigned __int8 v0;
  uint64_t v2;

  v0 = atomic_load((unsigned __int8 *)&qword_256941228);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_256941228))
  {
    v2 = operator new();
    *(_QWORD *)v2 = 0;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)(v2 + 24) = 850045863;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_QWORD *)(v2 + 80) = 0;
    qword_2569412B0 = v2;
    __cxa_guard_release(&qword_256941228);
  }
  return qword_2569412B0;
}

void sub_23A097178(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_256941228);
  _Unwind_Resume(a1);
}

void sub_23A097190()
{
  uint64_t v0;
  uint64_t v1;

  if ((byte_256942200 & 1) == 0)
  {
    v0 = sub_23A0970EC();
    if (v0)
    {
      v1 = sub_23A0971DC(v0);
      MEMORY[0x23B83FE88](v1, 0x1020C40A0054943);
    }
    byte_256942200 = 1;
  }
}

uint64_t sub_23A0971DC(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  void (*v6)(_QWORD);
  uint64_t v7;
  _QWORD *v8;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD **)(a1 + 8);
  v4 = v3 - 2;
  if (*(_QWORD **)a1 != v3 && v4 > v2)
  {
    do
    {
      v6 = (void (*)(_QWORD))*v2;
      *v2 = *v4;
      *v4 = v6;
      v7 = v2[1];
      v2[1] = v4[1];
      v4[1] = v7;
      v2 += 2;
      v4 -= 2;
    }
    while (v2 < v4);
    v2 = *(_QWORD **)a1;
    v3 = *(_QWORD **)(a1 + 8);
  }
  while (v2 != v3)
  {
    ((void (*)(_QWORD))*v2)(v2[1]);
    v2 += 2;
  }
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  v8 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v8;
    operator delete(v8);
  }
  return a1;
}

void sub_23A097280()
{
  __assert_rtn("StringPiece", "stringpiece.h", 229, "len >= 0");
}

_OWORD *sub_23A0972A8(uint64_t a1)
{
  std::string *v2;
  _OWORD *result;
  uint64_t v4;
  int v5;
  char v6;
  std::string v7[2];

  if (*(int *)(a1 + 28) <= 16)
  {
    sub_23A08BD88((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 158);
    v2 = sub_23A08BDA0(v7, "CHECK failed: limit_ > kSlopBytes: ");
    sub_23A08BED0((uint64_t)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v7);
  }
  result = sub_23A09736C(a1, 0, -1);
  v4 = *(_QWORD *)(a1 + 8);
  if (result)
  {
    v5 = *(_DWORD *)(a1 + 28) + (_DWORD)result - v4;
    *(_DWORD *)(a1 + 28) = v5;
    v4 += v5 & (v5 >> 31);
  }
  else
  {
    *(_DWORD *)(a1 + 80) = 1;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

void sub_23A097354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_23A09736C(uint64_t a1, unsigned int a2, int a3)
{
  _OWORD *v3;
  uint64_t v5;
  int v6;
  std::string *v7;
  int v8;
  std::string *v10;
  std::string *v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  std::string *v22;
  std::string *v23;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  char *v28;
  void *v29;
  unint64_t v30;
  char v31;
  void *__src;
  std::string v33[2];

  v3 = *(_OWORD **)(a1 + 16);
  if (!v3)
    return v3;
  v5 = a1 + 40;
  if (v3 != (_OWORD *)(a1 + 40))
  {
    v6 = *(_DWORD *)(a1 + 24);
    if (v6 <= 16)
    {
      sub_23A08BD88((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 105);
      v7 = sub_23A08BDA0(v33, "CHECK failed: size_ > kSlopBytes: ");
      sub_23A08BED0((uint64_t)&__src, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v33);
      v3 = *(_OWORD **)(a1 + 16);
      v6 = *(_DWORD *)(a1 + 24);
    }
    *(_QWORD *)(a1 + 8) = (char *)v3 + v6 - 16;
    *(_QWORD *)(a1 + 16) = v5;
    if (*(_QWORD *)(a1 + 72) == 1)
      *(_QWORD *)(a1 + 72) = 2;
    return v3;
  }
  *v3 = *(_OWORD *)*(_QWORD *)(a1 + 8);
  if (*(int *)(a1 + 84) < 1)
    goto LABEL_46;
  v8 = a3;
  if (a3 < 0)
    goto LABEL_39;
  if ((a2 & 0x80000000) != 0)
  {
    sub_23A08BD88((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 53);
    v11 = sub_23A08BDA0(v33, "CHECK failed: overrun >= 0: ");
    sub_23A08BED0((uint64_t)&__src, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v33);
LABEL_14:
    v12 = a1 + 56;
    v13 = (unsigned __int8 *)v3 + (int)a2;
    v14 = v13;
    while (2)
    {
      v15 = (char)*v14++;
      v16 = v15;
      if (v15 < 0)
      {
        v16 = v16 + (*v14 << 7) - 128;
        if ((char)*v14 < 0)
        {
          v14 = v13 + 3;
          v20 = -21;
          while (1)
          {
            v16 += (*(v14 - 1) - 1) << (v20 + 35);
            if (((char)*(v14 - 1) & 0x80000000) == 0)
              break;
            ++v14;
            v20 += 7;
            if (!v20)
              goto LABEL_39;
          }
        }
        else
        {
          v14 = v13 + 2;
        }
      }
      if ((unint64_t)v14 <= v12)
      {
        if (!v16)
          goto LABEL_46;
        switch(v16 & 7)
        {
          case 0:
            v33[0].__r_.__value_.__r.__words[0] = 0;
            v14 = sub_23A098660((char *)v14, v33);
            if (!v14)
              goto LABEL_39;
            goto LABEL_38;
          case 1:
            v14 += 8;
            goto LABEL_38;
          case 2:
            v18 = *v14;
            if ((char)*v14 < 0)
            {
              v19 = sub_23A098060((uint64_t)v14, v18);
              if (!v19)
                goto LABEL_39;
            }
            else
            {
              v19 = (uint64_t)(v14 + 1);
            }
            if ((uint64_t)(v12 - v19) < v18)
              goto LABEL_39;
            v14 = (unsigned __int8 *)(v19 + v18);
LABEL_38:
            v13 = v14;
            if ((unint64_t)v14 >= v12)
              goto LABEL_39;
            continue;
          case 3:
            ++v8;
            goto LABEL_38;
          case 4:
            v17 = __OFSUB__(v8--, 1);
            if (v8 < 0 != v17)
              goto LABEL_46;
            goto LABEL_38;
          case 5:
            v14 += 4;
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
      }
      goto LABEL_39;
    }
  }
  if (a2 >= 0x11)
  {
    sub_23A08BD88((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 54);
    v10 = sub_23A08BDA0(v33, "CHECK failed: overrun <= kSlopBytes: ");
    sub_23A08BED0((uint64_t)&__src, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v33);
    goto LABEL_39;
  }
  if (a2 != 16)
    goto LABEL_14;
LABEL_39:
  __src = 0;
  if (!(*(unsigned int (**)(_QWORD, void **, uint64_t))(**(_QWORD **)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &__src, a1 + 24))
  {
LABEL_45:
    *(_DWORD *)(a1 + 84) = 0;
LABEL_46:
    if (*(_QWORD *)(a1 + 72) == 2)
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 8) - (_QWORD)v3;
    *(_QWORD *)(a1 + 8) = a1 + 56;
    *(_QWORD *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 24) = 0;
    return v3;
  }
  while (1)
  {
    v21 = *(unsigned int *)(a1 + 24);
    *(_DWORD *)(a1 + 84) -= v21;
    if ((int)v21 >= 17)
    {
      v27 = *(_QWORD *)(a1 + 72);
      v26 = (_QWORD *)(a1 + 72);
      v25 = v27;
      v28 = (char *)(v26 - 2);
      v29 = __src;
      *((_OWORD *)v26 - 1) = *(_OWORD *)__src;
      *(v26 - 7) = v29;
      goto LABEL_52;
    }
    if ((int)v21 >= 1)
      break;
    if ((_DWORD)v21)
    {
      sub_23A08BD88((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 137);
      v22 = sub_23A08BDA0(v33, "CHECK failed: size_ == 0: ");
      v23 = sub_23A08BF74(v22, *(_DWORD *)(a1 + 24));
      sub_23A08BED0((uint64_t)&v31, (const char **)&v23->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v33);
    }
    if (((*(uint64_t (**)(_QWORD, void **, uint64_t))(**(_QWORD **)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &__src, a1 + 24) & 1) == 0)goto LABEL_45;
  }
  memcpy((void *)(a1 + 56), __src, v21);
  v30 = *(_QWORD *)(a1 + 72);
  v26 = (_QWORD *)(a1 + 72);
  v25 = v30;
  v28 = (char *)v3 + v21;
  *(v26 - 7) = v3;
LABEL_52:
  *(v26 - 8) = v28;
  if (v25 > 1)
    *v26 = 1;
  return v3;
}

void sub_23A097714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23A097744(uint64_t a1, signed int a2, int a3)
{
  int v3;
  signed int v5;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  _OWORD *v13;
  uint64_t v14;
  int v15;
  char *result;
  std::string *v17;
  char v18;
  std::string v19[2];

  v3 = *(_DWORD *)(a1 + 28);
  if (v3 < a2)
    return 0;
  v5 = a2;
  if (v3 == a2)
  {
    sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 175);
    v7 = sub_23A08BDA0(v19, "CHECK failed: overrun != limit_: ");
    sub_23A08BED0((uint64_t)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v19);
    v3 = *(_DWORD *)(a1 + 28);
  }
  if (v3 <= v5)
  {
    sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 176);
    v8 = sub_23A08BDA0(v19, "CHECK failed: overrun < limit_: ");
    sub_23A08BED0((uint64_t)&v18, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v19);
    v3 = *(_DWORD *)(a1 + 28);
  }
  if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) + (v3 & (v3 >> 31)))
  {
    sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 181);
    v9 = sub_23A08BDA0(v19, "CHECK failed: limit_end_ == buffer_end_ + (std::min)(0, limit_): ");
    sub_23A08BED0((uint64_t)&v18, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v19);
    v3 = *(_DWORD *)(a1 + 28);
  }
  if (v3 <= 0)
  {
    sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 183);
    v10 = sub_23A08BDA0(v19, "CHECK failed: limit_ > 0: ");
    sub_23A08BED0((uint64_t)&v18, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v19);
  }
  if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8))
  {
    sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 184);
    v11 = sub_23A08BDA0(v19, "CHECK failed: limit_end_ == buffer_end_: ");
    sub_23A08BED0((uint64_t)&v18, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v19);
  }
  while (1)
  {
    if (v5 < 0)
    {
      sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 188);
      v12 = sub_23A08BDA0(v19, "CHECK failed: overrun >= 0: ");
      sub_23A08BED0((uint64_t)&v18, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v19);
    }
    v13 = sub_23A09736C(a1, v5, a3);
    if (!v13)
      break;
    v14 = *(_QWORD *)(a1 + 8);
    v15 = *(_DWORD *)(a1 + 28) + (_DWORD)v13 - v14;
    *(_DWORD *)(a1 + 28) = v15;
    result = (char *)v13 + v5;
    v5 = (_DWORD)result - v14;
    if ((int)result - (int)v14 < 0)
    {
      *(_QWORD *)a1 = v14 + (v15 & (v15 >> 31));
      return result;
    }
  }
  if (v5)
    return 0;
  if (*(int *)(a1 + 28) <= 0)
  {
    sub_23A08BD88((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 193);
    v17 = sub_23A08BDA0(v19, "CHECK failed: limit_ > 0: ");
    sub_23A08BED0((uint64_t)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v19);
  }
  result = *(char **)(a1 + 8);
  *(_QWORD *)a1 = result;
  *(_DWORD *)(a1 + 80) = 1;
  return result;
}

void sub_23A0979F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_23A097A38(uint64_t a1, int a2, int a3)
{
  int v5;
  BOOL v6;
  std::string *v7;
  _OWORD *result;
  char v9;
  std::string v10[2];

  v5 = *(_DWORD *)(a1 + 8) - a2 + 16;
  while (1)
  {
    v6 = __OFSUB__(a3, v5);
    a3 -= v5;
    if ((a3 < 0) ^ v6 | (a3 == 0))
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      v7 = sub_23A08BDA0(v10, "CHECK failed: size > chunk_size: ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    if (!*(_QWORD *)(a1 + 16) || *(int *)(a1 + 28) < 17)
      break;
    result = sub_23A0972A8(a1);
    if (!result)
      return result;
    v5 = *(_DWORD *)(a1 + 8) - (_DWORD)result;
    if (a3 <= v5)
      return (_OWORD *)((char *)result + a3 + 16);
  }
  return 0;
}

void sub_23A097B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

const std::string::value_type *sub_23A097B1C(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5;
  const std::string::value_type *v6;
  uint64_t v8;
  std::string::size_type size;
  int v10;
  int v11;
  BOOL v12;
  std::string *v13;
  const std::string::value_type *result;
  char v15;
  std::string v16[2];

  v5 = a3;
  v6 = __s;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((_BYTE *)&this->__r_.__value_.__s + 23) = 0;
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      size = this->__r_.__value_.__l.__size_;
    else
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (a3 >= 50000000)
      v10 = 50000000;
    else
      v10 = a3;
    std::string::reserve(this, size + v10);
    v8 = *(_QWORD *)(a1 + 8);
  }
  v11 = v8 - (_DWORD)v6 + 16;
  while (1)
  {
    v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      v13 = sub_23A08BDA0(v16, "CHECK failed: size > chunk_size: ");
      sub_23A08BED0((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v16);
    }
    if (!*(_QWORD *)(a1 + 16))
      break;
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17)
      break;
    result = (const std::string::value_type *)sub_23A0972A8(a1);
    if (!result)
      return result;
    v6 = result + 16;
    v11 = *(_DWORD *)(a1 + 8) - (_DWORD)result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return &v6[v5];
    }
  }
  return 0;
}

void sub_23A097C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

const std::string::value_type *sub_23A097CA0(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5;
  const std::string::value_type *v6;
  uint64_t v8;
  std::string::size_type size;
  int v10;
  int v11;
  BOOL v12;
  std::string *v13;
  const std::string::value_type *result;
  char v15;
  std::string v16[2];

  v5 = a3;
  v6 = __s;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      size = this->__r_.__value_.__l.__size_;
    else
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (a3 >= 50000000)
      v10 = 50000000;
    else
      v10 = a3;
    std::string::reserve(this, size + v10);
    v8 = *(_QWORD *)(a1 + 8);
  }
  v11 = v8 - (_DWORD)v6 + 16;
  while (1)
  {
    v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      v13 = sub_23A08BDA0(v16, "CHECK failed: size > chunk_size: ");
      sub_23A08BED0((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v16);
    }
    if (!*(_QWORD *)(a1 + 16))
      break;
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17)
      break;
    result = (const std::string::value_type *)sub_23A0972A8(a1);
    if (!result)
      return result;
    v6 = result + 16;
    v11 = *(_DWORD *)(a1 + 8) - (_DWORD)result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return &v6[v5];
    }
  }
  return 0;
}

void sub_23A097DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A097E08(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unsigned int v7;
  char *v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = (char)*a3;
  v7 = *a3;
  if (v6 < 0)
  {
    result = sub_23A098060((uint64_t)a3, v7);
    if (!result)
      return result;
    v8 = (char *)result;
    v7 = v10;
  }
  else
  {
    v8 = (char *)(a3 + 1);
  }
  v11 = sub_23A07DFA4(a1, (int)v8, v7);
  v12 = *(_DWORD *)(a1 + 88);
  v13 = __OFSUB__(v12--, 1);
  *(_DWORD *)(a1 + 88) = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)a2 + 88))(a2, v8, a1);
  if (!result)
    return result;
  ++*(_DWORD *)(a1 + 88);
  if (*(_DWORD *)(a1 + 80))
    return 0;
  v15 = *(_DWORD *)(a1 + 28) + v14;
  *(_DWORD *)(a1 + 28) = v15;
  *(_QWORD *)a1 = *(_QWORD *)(a1 + 8) + (v15 & (v15 >> 31));
  return result;
}

void sub_23A097ED4(int a1, unint64_t a2, std::string *this)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = (8 * a1);
  if (v5 < 0x80)
  {
    LOBYTE(v6) = 8 * a1;
  }
  else
  {
    do
    {
      std::string::push_back(this, v5 | 0x80);
      v6 = v5 >> 7;
      v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  std::string::push_back(this, v6);
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      std::string::push_back(this, a2 | 0x80);
      v8 = a2 >> 7;
      v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  std::string::push_back(this, v8);
}

uint64_t sub_23A097F6C(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;

  result = a1 + 3;
  v4 = -21;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(result - 1) - 1) << (v4 + 35);
    if ((*(char *)(result - 1) & 0x80000000) == 0)
      break;
    ++result;
    v4 += 7;
    if (!v4)
    {
      while (*(char *)(a1 + v4 + 5) < 0)
      {
        result = 0;
        if (++v4 == 5)
          return result;
      }
      return a1 + v4 + 6;
    }
  }
  return result;
}

uint64_t sub_23A097FD4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  int v6;

  a2 = a2;
  result = a1 + 3;
  v4 = (char *)(a1 + 2);
  v5 = 14;
  while (1)
  {
    v6 = *v4++;
    a2 += (v6 - 1) << v5;
    if ((v6 & 0x80000000) == 0)
      break;
    ++result;
    v5 += 7;
    if (v5 == 70)
      return 0;
  }
  return result;
}

uint64_t sub_23A09801C(uint64_t a1, int a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  int v6;

  result = a1 + 3;
  v4 = (char *)(a1 + 2);
  v5 = -21;
  while (1)
  {
    v6 = *v4++;
    a2 += (v6 - 1) << (v5 + 35);
    if ((v6 & 0x80000000) == 0)
      break;
    ++result;
    v5 += 7;
    if (!v5)
      return 0;
  }
  return result;
}

uint64_t sub_23A098060(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;

  result = a1 + 2;
  v4 = -21;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(result - 1) - 1) << (v4 + 28);
    if ((*(char *)(result - 1) & 0x80000000) == 0)
      break;
    ++result;
    v4 += 7;
    if (!v4)
    {
      v5 = *(unsigned __int8 *)(a1 + 4);
      v6 = a1 + 5;
      if (a2 + (v5 << 28) - 0x10000000 > 0x7FFFFFEF)
        v6 = 0;
      if (v5 <= 7)
        return v6;
      else
        return 0;
    }
  }
  return result;
}

const std::string::value_type *sub_23A0980D0(std::string *a1, char *a2, uint64_t a3)
{
  int v5;
  std::string::value_type *v6;
  const std::string::value_type *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (const std::string::value_type *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = (std::string::value_type *)result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A095D1C(a3, v6, v5, a1);
}

unsigned __int8 *sub_23A098134(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A0986D4(a3, a2, a1);
}

unsigned __int8 *sub_23A098144(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A0989A0(a3, a2, a1);
}

unsigned __int8 *sub_23A098154(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A098C6C(a3, a2, a1);
}

unsigned __int8 *sub_23A098164(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A098F38(a3, a2, a1);
}

unsigned __int8 *sub_23A098174(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A099204(a3, a2, a1);
}

unsigned __int8 *sub_23A098184(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A0994DC(a3, a2, a1);
}

unsigned __int8 *sub_23A098194(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_23A0997B4(a3, a2, a1);
}

char *sub_23A0981A8(int *a1, char *a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A099A88(a3, v6, v5, a1);
}

char *sub_23A098210(int *a1, char *a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A099B8C(a3, v6, v5, a1);
}

char *sub_23A098278(int *a1, char *a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A099C90(a3, v6, v5, a1);
}

char *sub_23A0982E0(int *a1, char *a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A099D94(a3, v6, v5, a1);
}

char *sub_23A098348(int *a1, char *a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A099E98(a3, v6, v5, a1);
}

char *sub_23A0983B0(int *a1, char *a2, uint64_t a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *a2;
  if (*a2 < 0)
  {
    result = (char *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = a2 + 1;
  }
  return sub_23A099F9C(a3, v6, v5, a1);
}

char *sub_23A098414(uint64_t a1, char *a2, uint64_t a3)
{
  char *v5;
  unsigned int v6;
  uint64_t v8;
  char *v10;

  v10 = a2;
  while (1)
  {
    if ((sub_23A07DB84(a3, &v10, *(_DWORD *)(a3 + 92)) & 1) != 0)
      return v10;
    v5 = v10 + 1;
    v6 = *v10;
    if (*v10 < 0)
    {
      v6 = v6 + (*v5 << 7) - 128;
      if (*v5 < 0)
      {
        v5 = v10 + 3;
        v8 = -21;
        while (1)
        {
          v6 += (*(v5 - 1) - 1) << (v8 + 35);
          if ((*(v5 - 1) & 0x80000000) == 0)
            break;
          ++v5;
          v8 += 7;
          if (!v8)
            return 0;
        }
      }
      else
      {
        v5 = v10 + 2;
      }
    }
    v10 = v5;
    if (!v6 || (v6 & 7) == 4)
      break;
    v10 = (char *)sub_23A098524(v6, a1);
    if (!v10)
      return 0;
  }
  *(_DWORD *)(a3 + 80) = v6 - 1;
  return v5;
}

unsigned __int8 *sub_23A0984FC(unsigned int a1, std::string *a2, char *a3, int32x2_t *a4)
{
  std::string *v5;

  v5 = a2;
  return sub_23A098524(a1, &v5, a3, a4);
}

unsigned __int8 *sub_23A098524(unint64_t a1, std::string **a2, char *a3, int32x2_t *a4)
{
  unint64_t v4;
  unsigned __int8 *v5;
  std::string *v7;
  unsigned __int8 *v8;
  char v10;
  std::string v11[2];

  v4 = a1 >> 3;
  if (!(a1 >> 3))
    return 0;
  v5 = (unsigned __int8 *)a3;
  switch(a1 & 7)
  {
    case 0uLL:
      v11[0].__r_.__value_.__r.__words[0] = 0;
      v5 = sub_23A098660(a3, v11);
      if (v5)
        sub_23A09A0A0(a2, v4, v11[0].__r_.__value_.__r.__words[0]);
      return v5;
    case 1uLL:
      v5 = (unsigned __int8 *)(a3 + 8);
      sub_23A09A154((std::string *)a2, v4, *(_QWORD *)a3);
      return v5;
    case 2uLL:
      v8 = (unsigned __int8 *)sub_23A09A20C(a2, v4, a3, (uint64_t)a4);
      goto LABEL_10;
    case 3uLL:
      v8 = (unsigned __int8 *)sub_23A09A354(a2, v4, a3, a4);
LABEL_10:
      v5 = v8;
      break;
    case 4uLL:
      sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 758);
      v7 = sub_23A08BDA0(v11, "Can't happen");
      sub_23A08BED0((uint64_t)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v11);
      break;
    case 5uLL:
      v5 = (unsigned __int8 *)(a3 + 4);
      sub_23A09A47C((std::string *)a2, v4, *(_DWORD *)a3);
      break;
    default:
      return 0;
  }
  return v5;
}

void sub_23A098648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A098660(char *a1, _QWORD *a2)
{
  uint64_t v2;
  unsigned __int8 *result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  if (*a1 < 0)
  {
    v4 = a1[1];
    v5 = (v2 + (v4 << 7) - 128);
    if ((v4 & 0x80) != 0)
    {
      result = (unsigned __int8 *)(a1 + 3);
      v6 = 14;
      while (1)
      {
        v5 += (*(result - 1) - 1) << v6;
        if (((char)*(result - 1) & 0x80000000) == 0)
          break;
        ++result;
        v6 += 7;
        if (v6 == 70)
        {
          result = 0;
          v5 = 0;
          break;
        }
      }
      *a2 = v5;
    }
    else
    {
      *a2 = v5;
      return (unsigned __int8 *)(a1 + 2);
    }
  }
  else
  {
    *a2 = v2;
    return (unsigned __int8 *)(a1 + 1);
  }
  return result;
}

unsigned __int8 *sub_23A0986D4(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A0988F4(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A0988F4(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A0988F4((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A0988CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A0988F4(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09AB80(a3, v7 + 1);
      *(_DWORD *)(sub_23A09AFF4((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_23A09AFF4((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_23A0989A0(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A098BC0(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A098BC0(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A098BC0((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A098B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A098BC0(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09B1A8(a3, v7 + 1);
      *(_DWORD *)(sub_23A09B61C((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_23A09B61C((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_23A098C6C(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A098E8C(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A098E8C(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A098E8C((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A098E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A098E8C(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09B7D0(a3, v7 + 1);
      *(_QWORD *)(sub_23A09BC44((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(sub_23A09BC44((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_23A098F38(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A099158(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A099158(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A099158((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A099130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A099158(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09BDF8(a3, v7 + 1);
      *(_QWORD *)(sub_23A09C26C((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(sub_23A09C26C((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_23A099204(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A099424(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A099424(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A099424((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A0993FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A099424(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = -(v10 & 1) ^ (v10 >> 1);
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09AB80(a3, v7 + 1);
      *(_DWORD *)(sub_23A09AFF4((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_23A09AFF4((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_23A0994DC(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A0996FC(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A0996FC(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A0996FC((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A0996D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A0996FC(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09B7D0(a3, v7 + 1);
      *(_QWORD *)(sub_23A09BC44((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(sub_23A09BC44((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_23A0997B4(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if ((char)*a2 < 0)
  {
    result = (unsigned __int8 *)sub_23A098060((uint64_t)a2, *a2);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = a2 + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = sub_23A0999D4(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = sub_23A0999D4(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = sub_23A08BDA0(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = sub_23A0999D4((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_23A08BD88((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = sub_23A08BDA0(&v18, "CHECK failed: (size) > (0): ");
        sub_23A08BED0((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_23A08BED8((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)sub_23A0972A8(a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_23A0999AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23A0999D4(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  BOOL v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = sub_23A098660((char *)i, &v10);
    if (!i)
      break;
    v6 = v10 != 0;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      sub_23A09A560(a3, v7 + 1);
      *(_BYTE *)(sub_23A09A9D0((uint64_t)a3) + v7) = v6;
    }
    else
    {
      *(_BYTE *)(sub_23A09A9D0((uint64_t)a3) + v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_23A099A88(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  char *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *(_DWORD *)(a1 + 8) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23A09B1A8(a4, *a4 + (v5 >> 2));
    v11 = (void *)sub_23A09B360((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return &v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      sub_23A09B1A8(a4, *a4 + (v7 >> 2));
      v9 = (void *)sub_23A09B360((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = &result[-(v7 & 3) + 16];
      v7 = *(_DWORD *)(a1 + 8) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

char *sub_23A099B8C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  char *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *(_DWORD *)(a1 + 8) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23A09AB80(a4, *a4 + (v5 >> 2));
    v11 = (void *)sub_23A09AD38((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return &v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      sub_23A09AB80(a4, *a4 + (v7 >> 2));
      v9 = (void *)sub_23A09AD38((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = &result[-(v7 & 3) + 16];
      v7 = *(_DWORD *)(a1 + 8) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

char *sub_23A099C90(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  char *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *(_DWORD *)(a1 + 8) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23A09BDF8(a4, *a4 + (v5 >> 3));
    v11 = (void *)sub_23A09BFB0((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return &v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      sub_23A09BDF8(a4, *a4 + (v7 >> 3));
      v9 = (void *)sub_23A09BFB0((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = &result[-(v7 & 7) + 16];
      v7 = *(_DWORD *)(a1 + 8) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

char *sub_23A099D94(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  char *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *(_DWORD *)(a1 + 8) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23A09B7D0(a4, *a4 + (v5 >> 3));
    v11 = (void *)sub_23A09B988((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return &v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      sub_23A09B7D0(a4, *a4 + (v7 >> 3));
      v9 = (void *)sub_23A09B988((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = &result[-(v7 & 7) + 16];
      v7 = *(_DWORD *)(a1 + 8) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

char *sub_23A099E98(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  char *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *(_DWORD *)(a1 + 8) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23A09C420(a4, *a4 + (v5 >> 2));
    v11 = (void *)sub_23A09C5D8((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return &v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      sub_23A09C420(a4, *a4 + (v7 >> 2));
      v9 = (void *)sub_23A09C5D8((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = &result[-(v7 & 3) + 16];
      v7 = *(_DWORD *)(a1 + 8) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

char *sub_23A099F9C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  char *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *(_DWORD *)(a1 + 8) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23A09CA48(a4, *a4 + (v5 >> 3));
    v11 = (void *)sub_23A09CC00((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return &v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      sub_23A09CA48(a4, *a4 + (v7 >> 3));
      v9 = (void *)sub_23A09CC00((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (char *)sub_23A0972A8(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = &result[-(v7 & 7) + 16];
      v7 = *(_DWORD *)(a1 + 8) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

void sub_23A09A0A0(std::string **a1, int a2, unint64_t a3)
{
  std::string *v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;

  v3 = *a1;
  if (*a1)
  {
    v6 = (8 * a2);
    if (v6 < 0x80)
    {
      LOBYTE(v7) = 8 * a2;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9 = *a1;
    if (a3 < 0x80)
    {
      LOBYTE(v10) = a3;
    }
    else
    {
      do
      {
        std::string::push_back(v9, a3 | 0x80);
        v10 = a3 >> 7;
        v11 = a3 >> 14;
        a3 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v9, v10);
  }
}

std::string *sub_23A09A154(std::string *result, int a2, uint64_t a3)
{
  std::string *v3;
  std::string **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (std::string *)result->__r_.__value_.__r.__words[0];
  if (result->__r_.__value_.__r.__words[0])
  {
    v5 = (std::string **)result;
    v6 = (8 * a2) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9[0] = a3;
    return std::string::append(*v5, (const std::string::value_type *)v9, 8uLL);
  }
  return result;
}

const std::string::value_type *sub_23A09A20C(std::string **a1, int a2, char *a3, uint64_t a4)
{
  int v7;
  std::string::value_type *v8;
  const std::string::value_type *result;
  int v10;
  std::string *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  std::string *v16;
  unint64_t v17;
  unint64_t v18;

  v7 = *a3;
  if (*a3 < 0)
  {
    result = (const std::string::value_type *)sub_23A098060((uint64_t)a3, *a3);
    if (!result)
      return result;
    v8 = (std::string::value_type *)result;
    v7 = v10;
  }
  else
  {
    v8 = a3 + 1;
  }
  v11 = *a1;
  if (*a1)
  {
    v12 = (8 * a2) | 2u;
    if (v12 < 0x80)
    {
      LOBYTE(v13) = v12;
    }
    else
    {
      do
      {
        std::string::push_back(v11, v12 | 0x80);
        v13 = v12 >> 7;
        v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    std::string::push_back(v11, v13);
    v15 = v7;
    v16 = *a1;
    if (v7 < 0x80)
    {
      LOBYTE(v17) = v7;
    }
    else
    {
      do
      {
        std::string::push_back(v16, v15 | 0x80);
        v17 = v15 >> 7;
        v18 = v15 >> 14;
        v15 >>= 7;
      }
      while (v18);
    }
    std::string::push_back(v16, v17);
    return sub_23A09A508(a4, v8, v7, *a1);
  }
  else if (*(_QWORD *)(a4 + 8) - (_QWORD)v8 + 16 >= v7)
  {
    return &v8[v7];
  }
  else
  {
    return (const std::string::value_type *)sub_23A097A38(a4, (int)v8, v7);
  }
}

char *sub_23A09A354(std::string **a1, int a2, char *a3, int32x2_t *a4)
{
  std::string *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  char *v14;
  __int32 v15;
  char *v17;
  std::string *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v7 = *a1;
  v8 = 8 * a2;
  if (*a1)
  {
    v9 = v8 | 3u;
    if (v9 < 0x80)
    {
      LOBYTE(v10) = v8 | 3;
    }
    else
    {
      do
      {
        std::string::push_back(v7, v9 | 0x80);
        v10 = v9 >> 7;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v7, v10);
  }
  v12 = a4[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a4[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  ++a4[11].i32[1];
  v14 = sub_23A098414((uint64_t)a1, a3, (uint64_t)a4);
  a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
  v15 = a4[10].i32[0];
  a4[10].i32[0] = 0;
  if (v15 != (v8 | 3) || v14 == 0)
    return 0;
  v17 = v14;
  v18 = *a1;
  if (v18)
  {
    v19 = v8 | 4u;
    if (v19 < 0x80)
    {
      LOBYTE(v20) = v8 | 4;
    }
    else
    {
      do
      {
        std::string::push_back(v18, v19 | 0x80);
        v20 = v19 >> 7;
        v21 = v19 >> 14;
        v19 >>= 7;
      }
      while (v21);
    }
    std::string::push_back(v18, v20);
  }
  return v17;
}

std::string *sub_23A09A47C(std::string *result, int a2, int a3)
{
  std::string *v3;
  std::string **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string::value_type __s[4];

  v3 = (std::string *)result->__r_.__value_.__r.__words[0];
  if (result->__r_.__value_.__r.__words[0])
  {
    v5 = (std::string **)result;
    v6 = (8 * a2) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    *(_DWORD *)__s = a3;
    return std::string::append(*v5, __s, 4uLL);
  }
  return result;
}

const std::string::value_type *sub_23A09A508(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  uint64_t v6;

  if (*(_QWORD *)(a1 + 8) - (_QWORD)__s + 16 < a3)
    return sub_23A097CA0(a1, __s, a3, this);
  v6 = a3;
  std::string::append(this, __s, a3);
  return &__s[v6];
}

void sub_23A09A560(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  char v14;
  std::string v15[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09A9D0((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v15, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v15);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09A9D0((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  if (v6)
  {
    v11 = (v9 + 15) & 0x1FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v11);
    v12 = (_QWORD *)sub_23A08A880(v6, v11);
  }
  else
  {
    v12 = operator new(v9 + 8);
  }
  *v12 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v12 + 1;
  sub_23A09A9D0((uint64_t)a1);
  if (*a1 >= 1)
  {
    v13 = (void *)sub_23A09A9D0((uint64_t)a1);
    memcpy(v13, v5 + 1, *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09A6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09A714(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09A7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09A7D0(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09A9D0((uint64_t)a1) + a2;
}

void sub_23A09A88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09A8AC(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09A9D0((uint64_t)a1) + a2;
}

void sub_23A09A968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09A988(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09A9D0(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09A9D0(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09AA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09AA58(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09A560(v3, *v3 + *a2);
    sub_23A09A714((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09A7D0(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09A9D0((uint64_t)a2);
    return (int *)memcpy(v6, v8, *a2);
  }
  return result;
}

void sub_23A09AB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A09AB80(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09AFF4((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v16);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09AFF4((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    v13 = (_QWORD *)sub_23A08A880(v6, v12);
  }
  else
  {
    v13 = operator new(v11 + 8);
  }
  *v13 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v13 + 1;
  sub_23A09AFF4((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)sub_23A09AFF4((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09AD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09AD38(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09ADDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09ADF4(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09AFF4((uint64_t)a1) + 4 * a2;
}

void sub_23A09AEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09AED0(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09AFF4((uint64_t)a1) + 4 * a2;
}

void sub_23A09AF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09AFAC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09AFF4(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09AFF4(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09B064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09B07C(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09AB80(v3, *v3 + *a2);
    sub_23A09AD38((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09ADF4(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09AFF4((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_23A09B188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A09B1A8(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09B61C((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v16);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09B61C((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    v13 = (_QWORD *)sub_23A08A880(v6, v12);
  }
  else
  {
    v13 = operator new(v11 + 8);
  }
  *v13 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v13 + 1;
  sub_23A09B61C((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)sub_23A09B61C((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09B348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09B360(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09B404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09B41C(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09B61C((uint64_t)a1) + 4 * a2;
}

void sub_23A09B4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09B4F8(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09B61C((uint64_t)a1) + 4 * a2;
}

void sub_23A09B5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09B5D4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09B61C(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09B61C(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09B68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09B6A4(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09B1A8(v3, *v3 + *a2);
    sub_23A09B360((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09B41C(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09B61C((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_23A09B7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A09B7D0(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09BC44((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v16);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09BC44((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    v13 = (_QWORD *)sub_23A08A880(v6, v12);
  }
  else
  {
    v13 = operator new(v11 + 8);
  }
  *v13 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v13 + 1;
  sub_23A09BC44((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)sub_23A09BC44((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09B970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09B988(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09BA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09BA44(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09BC44((uint64_t)a1) + 8 * a2;
}

void sub_23A09BB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09BB20(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09BC44((uint64_t)a1) + 8 * a2;
}

void sub_23A09BBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09BBFC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09BC44(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09BC44(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09BCB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09BCCC(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09B7D0(v3, *v3 + *a2);
    sub_23A09B988((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09BA44(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09BC44((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_23A09BDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A09BDF8(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09C26C((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v16);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09C26C((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    v13 = (_QWORD *)sub_23A08A880(v6, v12);
  }
  else
  {
    v13 = operator new(v11 + 8);
  }
  *v13 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v13 + 1;
  sub_23A09C26C((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)sub_23A09C26C((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09BF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09BFB0(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09C054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C06C(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09C26C((uint64_t)a1) + 8 * a2;
}

void sub_23A09C128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C148(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09C26C((uint64_t)a1) + 8 * a2;
}

void sub_23A09C204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C224(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09C26C(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09C26C(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09C2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09C2F4(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09BDF8(v3, *v3 + *a2);
    sub_23A09BFB0((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09C06C(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09C26C((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_23A09C400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A09C420(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09C894((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v16);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09C894((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    v13 = (_QWORD *)sub_23A08A880(v6, v12);
  }
  else
  {
    v13 = operator new(v11 + 8);
  }
  *v13 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v13 + 1;
  sub_23A09C894((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)sub_23A09C894((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09C5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C5D8(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09C67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C694(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09C894((uint64_t)a1) + 4 * a2;
}

void sub_23A09C750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C770(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09C894((uint64_t)a1) + 4 * a2;
}

void sub_23A09C82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09C84C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09C894(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09C894(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09C904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09C91C(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09C420(v3, *v3 + *a2);
    sub_23A09C5D8((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09C694(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09C894((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_23A09CA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23A09CA48(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(sub_23A09CEBC((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_23A08BD88((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = sub_23A08BDA0(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_23A08BED0((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_23A08BED8((uint64_t)v16);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(sub_23A09CEBC((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    v13 = (_QWORD *)sub_23A08A880(v6, v12);
  }
  else
  {
    v13 = operator new(v11 + 8);
  }
  *v13 = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = v13 + 1;
  sub_23A09CEBC((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)sub_23A09CEBC((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_23A09CBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09CC00(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_23A08BD88((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = sub_23A08BDA0(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = sub_23A08BF74(v5, *(_DWORD *)(a1 + 4));
    v7 = sub_23A08BDA0(v6, ", ");
    v8 = sub_23A08BF74(v7, *(_DWORD *)a1);
    sub_23A08BED0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v11);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23A09CCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09CCBC(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09CEBC((uint64_t)a1) + 8 * a2;
}

void sub_23A09CD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09CD98(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = sub_23A08BDA0(v8, "CHECK failed: (index) >= (0): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_23A08BD88((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = sub_23A08BDA0(v8, "CHECK failed: (index) < (current_size_): ");
    sub_23A08BED0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v8);
  }
  return sub_23A09CEBC((uint64_t)a1) + 8 * a2;
}

void sub_23A09CE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23A09CE74(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = sub_23A09CEBC(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t sub_23A09CEBC(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    sub_23A08BD88((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = sub_23A08BDA0(v5, "CHECK failed: (total_size_) > (0): ");
    sub_23A08BED0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_23A08BED8((uint64_t)v5);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_23A09CF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_23A09CF44(int *result, int *a2)
{
  int *v3;
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  v3 = result;
  if (a2 == result)
  {
    sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = sub_23A08BDA0(v10, "CHECK failed: (&other) != (this): ");
    sub_23A08BED0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    result = (int *)sub_23A08BED8((uint64_t)v10);
  }
  if (*a2)
  {
    v5 = *v3;
    sub_23A09CA48(v3, *v3 + *a2);
    sub_23A09CC00((uint64_t)v3, *a2);
    v6 = (void *)sub_23A09CCBC(v3, v5);
    if (*a2 <= 0)
    {
      sub_23A08BD88((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = sub_23A08BDA0(v10, "CHECK failed: (index) < (current_size_): ");
      sub_23A08BED0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_23A08BED8((uint64_t)v10);
    }
    v8 = (const void *)sub_23A09CEBC((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_23A09D050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_23A08BED8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23A09D070(uint64_t *a1)
{
  sub_23A09D098(a1);
  return sub_23A07DF74(a1);
}

void sub_23A09D098(_QWORD *a1)
{
  unsigned int *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    v3 = (uint64_t *)(v2 + 2);
    v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0)
            operator delete(*(void **)v5);
          MEMORY[0x23B83FE88](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t sub_23A09D128(uint64_t result, int a2)
{
  int v2;
  BOOL v3;
  int v4;

  v2 = *(_DWORD *)(result + 8);
  v3 = __OFSUB__(a2, v2);
  v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0)))
    return sub_23A09D13C((uint64_t *)result, v4);
  return result;
}

uint64_t sub_23A09D13C(uint64_t *a1, int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int *v5;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;

  v2 = *((_DWORD *)a1 + 2);
  v3 = *((_DWORD *)a1 + 3);
  v4 = v2 + a2;
  v5 = (unsigned int *)a1[2];
  if (v3 < v2 + a2)
  {
    v7 = *a1;
    v8 = 2 * v3;
    if (2 * v3 <= v4)
      v8 = v4;
    if (v8 <= 4)
      v9 = 4;
    else
      v9 = v8;
    v10 = 8 * v9;
    if (v7)
    {
      v11 = (v10 + 15) & 0x7FFFFFFF8;
      if ((*(_BYTE *)(v7 + 24) & 1) != 0)
        (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v7 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 32), MEMORY[0x24BEDB778], v11);
      v12 = (unsigned int *)sub_23A08A880(v7, v11);
    }
    else
    {
      v12 = (unsigned int *)operator new(v10 + 8);
    }
    a1[2] = (uint64_t)v12;
    *((_DWORD *)a1 + 3) = v9;
    if (v5 && (v13 = *v5, (int)v13 >= 1))
    {
      memcpy(v12 + 2, v5 + 2, 8 * v13);
      v12 = (unsigned int *)a1[2];
      *v12 = *v5;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      *v12 = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        v12 = (unsigned int *)a1[2];
      }
    }
    v2 = *((_DWORD *)a1 + 2);
    v5 = v12;
  }
  return (uint64_t)&v5[2 * v2 + 2];
}

uint64_t sub_23A09D24C(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  uint64_t *v6;
  _DWORD *v8;

  *(_QWORD *)a1 = &off_250B0CBD0;
  *(_QWORD *)(a1 + 16) = &off_250B0D018;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = &off_250B0D018;
  *(_DWORD *)(a1 + 40) = 0;
  v6 = (uint64_t *)(a1 + 88);
  sub_23A089B90((_QWORD *)(a1 + 88));
  sub_23A09D300(a1, a2, a3, (uint64_t *)&v8);
  sub_23A089DAC(v6, &v8);
  sub_23A089B98((uint64_t *)&v8);
  return a1;
}

void sub_23A09D2DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t *v2;
  va_list va;

  va_start(va, a2);
  sub_23A089B98((uint64_t *)va);
  sub_23A089B98(v2);
  _Unwind_Resume(a1);
}

_QWORD *sub_23A09D300@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD *result;
  int v7;
  unint64_t v8;
  uint64_t *v9;
  int v10;
  int v11;
  int v12;
  _DWORD *v13;
  unint64_t v14;

  v13 = a2;
  v14 = a3;
  v12 = 0;
  result = sub_23A05BD84(a2, a3, &v12, a4);
  if (!*a4)
  {
    sub_23A089B98(a4);
    result = sub_23A088274(&v13, 4uLL, a4);
    if (!*a4)
    {
      sub_23A089B98(a4);
      *(_DWORD *)(a1 + 8) = v12;
      v11 = 0;
      result = sub_23A05BD84(v13, v14, &v11, a4);
      if (!*a4)
      {
        sub_23A089B98(a4);
        result = sub_23A088274(&v13, 4uLL, a4);
        if (!*a4)
        {
          sub_23A089B98(a4);
          *(_DWORD *)(a1 + 24) = v11;
          v10 = 0;
          result = sub_23A05BD84(v13, v14, &v10, a4);
          if (!*a4)
          {
            sub_23A089B98(a4);
            result = sub_23A088274(&v13, 4uLL, a4);
            if (!*a4)
            {
              sub_23A089B98(a4);
              v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              result = sub_23A05BC18(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*a4)
              {
                sub_23A089B98(a4);
                result = sub_23A088274(&v13, 4uLL, a4);
                if (!*a4)
                {
                  sub_23A089B98(a4);
                  *(_QWORD *)(a1 + 56) = v13;
                  v8 = sub_23A0881F0(*(int *)(a1 + 48), 4uLL);
                  result = sub_23A088274(&v13, v8, a4);
                  if (!*a4)
                  {
                    sub_23A089B98(a4);
                    *(_QWORD *)(a1 + 64) = v13;
                    result = sub_23A088274(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*a4)
                    {
                      sub_23A089B98(a4);
                      *(_QWORD *)(a1 + 72) = v13;
                      result = sub_23A088274(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*a4)
                      {
                        v9 = sub_23A089B98(a4);
                        *(_QWORD *)(a1 + 80) = v13;
                        return sub_23A089B90(v9);
                      }
                    }
                  }
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

void sub_23A09D4FC()
{
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A09D510(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_23A09D51C(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_23A09D528(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 2) & 1;
}

uint64_t sub_23A09D534(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 3) & 1;
}

_QWORD *sub_23A09D540(_QWORD *a1)
{
  *a1 = &off_250B0CBD0;
  sub_23A089B98(a1 + 11);
  return a1;
}

void sub_23A09D570(_QWORD *a1)
{
  *a1 = &off_250B0CBD0;
  sub_23A089B98(a1 + 11);
  JUMPOUT(0x23B83FE88);
}

uint64_t sub_23A09D5B0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

const char *sub_23A09D5B8(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)(*(_QWORD *)(a1 + 80) + **(unsigned int **)(a1 + 72));
  strlen(v1);
  return v1;
}

const char *sub_23A09D5EC(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)(*(_QWORD *)(a1 + 80) + *(unsigned int *)(*(_QWORD *)(a1 + 72) + 4));
  strlen(v1);
  return v1;
}

const char *sub_23A09D620(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)(*(_QWORD *)(a1 + 80) + *(unsigned int *)(*(_QWORD *)(a1 + 72) + 8));
  strlen(v1);
  return v1;
}

const char *sub_23A09D654(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)(*(_QWORD *)(a1 + 80) + *(unsigned int *)(*(_QWORD *)(a1 + 72) + 12));
  strlen(v1);
  return v1;
}

const char *sub_23A09D688(uint64_t a1)
{
  const char *v1;

  v1 = (const char *)(*(_QWORD *)(a1 + 80) + *(unsigned int *)(*(_QWORD *)(a1 + 72) + 16));
  strlen(v1);
  return v1;
}

uint64_t sub_23A09D6BC(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_23A09D6C8(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_23A09D6D4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) >> 30;
}

const char *sub_23A09D6E0(uint64_t a1, int a2)
{
  const char *v2;

  v2 = (const char *)(*(_QWORD *)(a1 + 80) + *(unsigned int *)(*(_QWORD *)(a1 + 72) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sub_23A09D718(uint64_t a1, int a2)
{
  return *(float *)(*(_QWORD *)(a1 + 64) + 4 * a2);
}

BOOL sub_23A09D724(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2) == 1;
}

BOOL sub_23A09D738(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2) == 2;
}

BOOL sub_23A09D74C(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2) == 3;
}

BOOL sub_23A09D760(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2) == 4;
}

BOOL sub_23A09D774(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2) == 5;
}

BOOL sub_23A09D788(uint64_t a1, int a2)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 56) + a2) == 6;
}

uint64_t sub_23A09D79C(uint64_t a1)
{
  return a1 + 16;
}

uint64_t sub_23A09D7A4(uint64_t a1)
{
  return a1 + 32;
}

void sub_23A09D7AC(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_23A09D7F8(void **a1, void **a2, void **a3)
{
  void **v5;
  void *v6;

  v5 = (void **)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0)
        operator delete(*(v5 - 3));
      v5 -= 3;
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_23A09D85C(uint64_t *a1)
{
  int v2;
  uint64_t *v3;
  uint64_t status_string;
  uint64_t *v5;
  int v6;
  uint64_t *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *((char *)a1 + 23);
  v3 = (uint64_t *)*a1;
  status_string = espresso_get_status_string();
  if (v2 >= 0)
    v5 = a1;
  else
    v5 = v3;
  v6 = 136315394;
  v7 = v5;
  v8 = 2080;
  v9 = status_string;
  _os_log_error_impl(&dword_239FE9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Encountered an error during: %s\n -> Espresso Error: %s", (uint8_t *)&v6, 0x16u);
}

void sub_23A09D910(void **a1)
{
  if (*((char *)a1 + 23) < 0)
    sub_239FF80A4(a1);
}

void sub_23A09D920(void **__p)
{
  void **v2;

  do
  {
    v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
    operator delete(__p);
    __p = v2;
  }
  while (v2);
}

void sub_23A09D960(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  sub_239FF9C98(&dword_239FE9000, a3, (uint64_t)a3, "%s", (uint8_t *)a2);
}

void sub_23A09D99C(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v5 = 136315138;
  v6 = v3;
  sub_239FF9C98(&dword_239FE9000, a2, v4, "CSU exception: %s", (uint8_t *)&v5);
}

void sub_23A09DA24(void **a1, char *a2, void **a3)
{
  char *v5;
  void *v6;
  char *v8;
  void *v9;
  void *v10;

  v5 = (char *)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    v8 = v5;
    do
    {
      v10 = (void *)*((_QWORD *)v8 - 3);
      v8 -= 24;
      v9 = v10;
      if (v10)
      {
        *((_QWORD *)v5 - 2) = v9;
        operator delete(v9);
      }
      v5 = v8;
    }
    while (v8 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_23A09DA88(void **a1, uint64_t a2)
{
  void **v2;
  void **v5;
  void *v6;

  v2 = (void **)*a1;
  if (*a1)
  {
    v5 = *(void ***)(a2 + 32);
    v6 = *a1;
    if (v5 != v2)
    {
      do
      {
        if (*((char *)v5 - 1) < 0)
          operator delete(*(v5 - 3));
        v5 -= 3;
      }
      while (v5 != v2);
      v6 = *a1;
    }
    *(_QWORD *)(a2 + 32) = v2;
    operator delete(v6);
  }
}

void sub_23A09DAFC(void **a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  void **v8;
  void **v11;
  void *v12;

  v8 = (void **)*a1;
  if (*a1)
  {
    v11 = *(void ***)(a2 + 32);
    v12 = *a1;
    if (v11 != v8)
    {
      do
      {
        if (*((char *)v11 - 1) < 0)
          operator delete(*(v11 - 3));
        v11 -= 3;
      }
      while (v11 != v8);
      v12 = *a1;
    }
    *(_QWORD *)(a2 + 32) = v8;
    operator delete(v12);
  }
  *(_QWORD *)a5 = a3;
  *(_DWORD *)(a5 + 8) = a4;
}

void sub_23A09DB88(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_23A009FD4(&dword_239FE9000, a1, a3, "Token embedder failed prediction", v3);
  sub_23A009FE0();
}

void sub_23A09DBBC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_23A009FD4(&dword_239FE9000, a1, a3, "Token embedder failed to set input features", v3);
  sub_23A009FE0();
}

void sub_23A09DBF0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_23A009FD4(&dword_239FE9000, a1, a3, "Text encoder failed to set input features", v3);
  sub_23A009FE0();
}

void sub_23A09DC24(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_23A009FD4(&dword_239FE9000, a3, (uint64_t)a3, "Non FP32 or FP16 datatype encountered!", a1);
}

void sub_23A09DC58(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  sub_239FF9C98(&dword_239FE9000, a2, a3, "Unsupported revision %ld specified - cannot create CSUTextEncoderConfiguration instance", (uint8_t *)&v3);
}

void sub_23A09DCC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A00EEAC(&dword_239FE9000, a1, a3, "Not a valid context length! setting e5Function default main_ctx_77", a5, a6, a7, a8, 0);
}

void sub_23A09DCF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A00EEAC(&dword_239FE9000, a1, a3, "Not supported for EspressoV1 Text Encoder SPI, using default", a5, a6, a7, a8, 0);
}

void sub_23A09DD2C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_239FF9C98(&dword_239FE9000, a3, (uint64_t)a3, "Unsupported revision %ld specified - cannot create CSUTextEncoderRevision", (uint8_t *)a1);
}

void sub_23A09DD70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23A01F394();
  sub_23A00EEAC(&dword_239FE9000, v0, v1, "Bridge model failed to generate output", v2, v3, v4, v5, v6);
  sub_23A009FE0();
}

void sub_23A09DD9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23A01F394();
  sub_23A00EEAC(&dword_239FE9000, v0, v1, "Bridge model failed to set input features", v2, v3, v4, v5, v6);
  sub_23A009FE0();
}

void sub_23A09DDC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23A01F394();
  sub_23A00EEAC(&dword_239FE9000, v0, v1, "Found bridge output to be null", v2, v3, v4, v5, v6);
  sub_23A009FE0();
}

void sub_23A09DDF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23A01F394();
  sub_23A00EEAC(&dword_239FE9000, v0, v1, "Decoder model failed to generate output", v2, v3, v4, v5, v6);
  sub_23A009FE0();
}

void sub_23A09DE20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23A01F394();
  sub_23A00EEAC(&dword_239FE9000, v0, v1, "Decoder model failed to set input features", v2, v3, v4, v5, v6);
  sub_23A009FE0();
}

void sub_23A09DE4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23A01F394();
  sub_23A00EEAC(&dword_239FE9000, v0, v1, "Found encoder buffer to be null", v2, v3, v4, v5, v6);
  sub_23A009FE0();
}

void sub_23A09DE78(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_239FE9000, a2, OS_LOG_TYPE_DEBUG, "All beams contain finished sequences. Exiting beam search loop early after %d steps", (uint8_t *)v2, 8u);
  sub_23A009FE0();
}

void sub_23A09DEE8(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_23A01F3E8(&dword_239FE9000, a3, (uint64_t)a3, "Problem with model execution. Exiting beam search.", a1);
}

void sub_23A09DF1C(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  uint64_t v3;
  int v4;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    sub_23A01F3A0(p_shared_owners);
  while (v4);
  if (!v3)
  {
    sub_23A01F3D8();
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_23A09DF54()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_23A01F394();
  sub_23A01F3E8(&dword_239FE9000, v0, v1, "Did not post process captions! No handler present.", v2);
  sub_23A009FE0();
}

void sub_23A09DF84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void **v6;
  char v7;
  void **v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  uint64_t v11;
  int v12;
  void *v13;

  v5 = (void *)sub_23A01F3C0(a1, a2);
  if (!v7)
  {
    v8 = v6;
    do
    {
      v9 = *(std::__shared_weak_count **)(v4 - 8);
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          sub_23A01F3A0(p_shared_owners);
        while (v12);
        if (!v11)
        {
          sub_23A01F3B0();
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v13 = *(void **)(v4 - 40);
      if (v13)
      {
        *(_QWORD *)(v4 - 32) = v13;
        operator delete(v13);
      }
      v4 -= 48;
    }
    while (v4 != v2);
    v5 = *v8;
  }
  *v3 = v2;
  sub_23A01F384(v5);
}

void sub_23A09DFF4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_239FE9000, a2, OS_LOG_TYPE_ERROR, "End CSUVideoCaptioner init with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_23A09E068(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No section for %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E0D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No section for %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E148(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No section for %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E1B8(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_239FE9000, a2, OS_LOG_TYPE_DEBUG, "Loaded gender option set to %d", (uint8_t *)v3, 8u);
}

void sub_23A09E230(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No section for %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E2A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No section for %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E310(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E380(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E3F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a1, a3, "No %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E460(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A02DF68(&dword_239FE9000, a2, a3, "No section for %@", a5, a6, a7, a8, 2u);
  sub_23A02DF78();
}

void sub_23A09E4C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A00EEAC(&dword_239FE9000, a1, a3, "?? CPU not found for network execution ??", a5, a6, a7, a8, 0);
  sub_23A009FE0();
}

void sub_23A09E4F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23A00EEAC(&dword_239FE9000, a1, a3, "Greedy search not implemented!", a5, a6, a7, a8, 0);
  sub_23A009FE0();
}

void sub_23A09E524(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_23A01F3E8(&dword_239FE9000, a1, a3, "Did not post process captions! No handler present.", v3);
  sub_23A009FE0();
}

void sub_23A09E558(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_239FE9000, log, OS_LOG_TYPE_ERROR, "Please specify sequence shape!", v1, 2u);
}

void sub_23A09E598(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_239FE9000, log, OS_LOG_TYPE_DEBUG, "Did not post process captions! No handler present.", v1, 2u);
}

void sub_23A09E5D8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_239FE9000, log, OS_LOG_TYPE_ERROR, "?? CPU not found for network execution ??", v1, 2u);
  sub_23A009FE0();
}

uint64_t sub_23A09E614(uint64_t *a1, void **a2, _QWORD *a3)
{
  void **v6;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v6 = (void **)a1[11];
  if (v6)
  {
    do
    {
      v7 = (void **)*v6;
      if (*((char *)v6 + 39) < 0)
        operator delete(v6[2]);
      operator delete(v6);
      v6 = v7;
    }
    while (v7);
  }
  v8 = *a2;
  *a2 = 0;
  if (v8)
    operator delete(v8);
  v9 = *a1;
  if (!*a1)
    return 1;
  v10 = a1[1];
  v11 = *a1;
  if (v10 != v9)
  {
    do
    {
      if (*(char *)(v10 - 1) < 0)
        operator delete(*(void **)(v10 - 24));
      v10 -= 24;
    }
    while (v10 != v9);
    v11 = *a1;
  }
  result = 0;
  *a3 = v11;
  a1[1] = v9;
  return result;
}

void sub_23A09E6D0(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  int v3;

  v1 = (unint64_t *)(a1 + 8);
  do
    sub_23A01F3A0(v1);
  while (v3);
  if (!v2)
  {
    sub_23A01F3D8();
    sub_23A049C5C();
  }
  sub_23A049C54();
}

void sub_23A09E700(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_23A01F3E8(&dword_239FE9000, a1, a3, "Found gender token, reporting error multiple-gender-words", v3);
}

void sub_23A09E738(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_23A01F3E8(&dword_239FE9000, a3, (uint64_t)a3, "Empty trigger tokens", a1);
}

void sub_23A09E76C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_23A01F3E8(&dword_239FE9000, a1, a3, "Found trigger tokens, reporting error: Found-exclude-gender-trigger", v3);
}

uint64_t sub_23A09E7A4()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_23A09E7B0()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_23A09E7BC()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_23A09E7C8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A09E7D4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A09E7E0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A09E7EC()
{
  return MEMORY[0x24BE67F18]();
}

uint64_t sub_23A09E7F8()
{
  return MEMORY[0x24BE67F28]();
}

uint64_t sub_23A09E804()
{
  return MEMORY[0x24BE68150]();
}

uint64_t sub_23A09E810()
{
  return MEMORY[0x24BE68210]();
}

uint64_t sub_23A09E81C()
{
  return MEMORY[0x24BE68228]();
}

uint64_t sub_23A09E828()
{
  return MEMORY[0x24BE68328]();
}

uint64_t sub_23A09E834()
{
  return MEMORY[0x24BE68380]();
}

uint64_t sub_23A09E840()
{
  return MEMORY[0x24BE68398]();
}

uint64_t sub_23A09E84C()
{
  return MEMORY[0x24BE68490]();
}

uint64_t sub_23A09E858()
{
  return MEMORY[0x24BE684A0]();
}

uint64_t sub_23A09E864()
{
  return MEMORY[0x24BE68510]();
}

uint64_t sub_23A09E870()
{
  return MEMORY[0x24BE68528]();
}

uint64_t sub_23A09E87C()
{
  return MEMORY[0x24BE68628]();
}

uint64_t sub_23A09E888()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A09E894()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A09E8A0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A09E8AC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A09E8B8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A09E8C4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A09E8D0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A09E8DC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A09E8E8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A09E8F4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A09E900()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A09E90C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A09E918()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A09E924()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A09E930()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A09E93C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A09E948()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A09E954()
{
  return MEMORY[0x24BEE3F10]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSArray *MLAllComputeDevices(void)
{
  return (NSArray *)MEMORY[0x24BDBFF20]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA10](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA18](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  MEMORY[0x24BEDAAC8](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB40](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB60](this);
}

{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC60](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE88]();
}

{
  return MEMORY[0x24BEDAE90]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x24BEDAFD8](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x24BEDAFE0](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x24BEDAFE8](this);
}

uint64_t std::ifstream::open()
{
  return MEMORY[0x24BEDB008]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB018]();
}

{
  return MEMORY[0x24BEDB020]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x24BEDB600](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB618](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250B0B388();
}

void operator delete(void *__p)
{
  off_250B0B390(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_250B0B398(__p, a2);
}

uint64_t operator delete()
{
  return off_250B0B3A0();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_250B0B3A8(__sz);
}

uint64_t operator new[]()
{
  return off_250B0B3B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250B0B3B8(__sz);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_250B0B3C0(__sz, a2);
}

uint64_t operator new()
{
  return off_250B0B3C8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x24BE2F6E0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t espresso_buffer_get_rank()
{
  return MEMORY[0x24BE2FAE0]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x24BE2FAF0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x24BE2FB68]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x24BE2FB70]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_argb8()
{
  return MEMORY[0x24BE2FBC8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x24BE2FBD0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x24BE2FBE8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_rgba8()
{
  return MEMORY[0x24BE2FBF8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x24BE2FC08]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x24BE2FC18]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x24BE2FC38]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x24BE2FC40]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x24BE2FC88]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x24BE2FCB0]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x24BE2FCC0]();
}

uint64_t espresso_plan_share_intermediate_buffer()
{
  return MEMORY[0x24BE2FCC8]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x24BE2FCE0]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x24BDAE290](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x24BDAEA90]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x24BDAEAC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x24BDAF248](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3288](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3328](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vthrsc(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3558](__A, __IA, __B, __C, __D, __ID, __N);
}


_QWORD *sub_234253298(_QWORD *result)
{
  *result = &off_25051C0C0;
  return result;
}

void sub_2342532A8(_QWORD *a1)
{
  *a1 = &off_25051C0C0;
  JUMPOUT(0x23493E704);
}

uint64_t sub_2342532C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  size_t v9;
  NSObject *v10;
  NSObject *v11;
  __int16 v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v15;
  _QWORD v16[2];
  int v17;
  __int128 __s1;
  __int128 v19;
  unsigned __int8 v20[2];
  __int16 v21;
  _BYTE v22[2];
  __int16 v23;
  unsigned __int8 v24[2];
  __int16 v25;
  _BYTE v26[2];
  __int16 v27;
  uint8_t buf[8];
  uint64_t v29;
  _QWORD v30[2];
  _DWORD v31[20];
  uint64_t __dst[8];
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  _QWORD v37[2];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24[0] = 0;
  v26[0] = 0;
  v20[0] = 0;
  v22[0] = 0;
  v34 = *(_DWORD *)(a2 + 96);
  v35 = 0xFFFF0000FFFFLL;
  v36 = -1;
  v37[1] = 0;
  v37[0] = 0;
  v38 = 0;
  v5 = *(_QWORD *)(a2 + 8);
  if (!v5 || !*(_QWORD *)(a2 + 24) || !*(_QWORD *)(a2 + 40) || !*(_QWORD *)(a2 + 56) || !*(_QWORD *)(a2 + 72))
  {
    v6 = 800;
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v6);
  }
  v6 = 800;
  if (v5 <= 0x384 && a3 && *(_QWORD *)(a2 + 88))
  {
    sub_23413D364(a2 + 64, v24, (uint64_t)buf);
    if (*(_DWORD *)buf)
    {
      v6 = 303;
      return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v6);
    }
    sub_23413D364(a2 + 48, v20, (uint64_t)buf);
    if (*(_DWORD *)buf)
    {
LABEL_14:
      v6 = 203;
      return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v6);
    }
    v6 = 305;
    if (v20[0])
    {
      if (v20[0] == v24[0] && v21 == v25)
      {
        if (!v26[0] || v22[0] && v23 != v27)
        {
          v6 = 306;
          return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v6);
        }
        *(_QWORD *)buf = &off_250505A50;
        v33 = 0;
        sub_23413C364((uint64_t *)(a2 + 64), (uint64_t)buf, (uint64_t)&v19);
        if ((_DWORD)v19)
        {
          v6 = 303;
LABEL_28:
          sub_23413A7A4(__dst, 64);
          return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v6);
        }
        v9 = *(_QWORD *)(a2 + 40);
        if (v9 > 0x40)
        {
          v6 = 503;
          goto LABEL_28;
        }
        v33 = *(_QWORD *)(a2 + 40);
        memcpy(__dst, *(const void **)(a2 + 32), v9);
        sub_2341F36FC((uint64_t)buf, a2, a2 + 16, (uint64_t)__dst, &v19);
        if ((_DWORD)v19)
        {
          v6 = 500;
          goto LABEL_28;
        }
        sub_23413A7A4(__dst, 64);
        __dst[0] = (uint64_t)v37;
        __dst[1] = 20;
        sub_23413CC88((uint64_t *)(a2 + 48), __dst, (uint64_t)buf);
        if (*(_DWORD *)buf)
          goto LABEL_14;
        v10 = sub_234117B80(0x1Bu, "Support");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::CheckPAA skipping vid-scoped PAA check - PAARootStore disabled", buf, 2u);
        }
        if (sub_234114844(2u))
          sub_2341147D0(0x1Bu, 2);
        sub_23413CA50((uint64_t *)(a2 + 64), (uint64_t)buf);
        if (*(_DWORD *)buf)
        {
          v6 = 300;
        }
        else
        {
          v11 = sub_234117B80(0x1Bu, "Support");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::CheckCertChain skipping cert chain check - PAARootStore disabled", buf, 2u);
          }
          if (sub_234114844(2u))
            sub_2341147D0(0x1Bu, 2);
          v19 = 0uLL;
          __s1 = 0uLL;
          v17 = 0;
          v16[0] = 0;
          v16[1] = 0;
          v29 = 0;
          v30[0] = 0;
          *(_DWORD *)((char *)v30 + 7) = 0;
          sub_234104468((uint64_t)v31);
          v31[18] = 21;
          v15 = 0uLL;
          LOWORD(v35) = *(_WORD *)sub_233CBCEC0(v24);
          WORD1(v35) = *(_WORD *)sub_233CBCEC0(v26);
          WORD2(v35) = *(_WORD *)sub_233CBCEC0(v20);
          v12 = v22[0];
          if (v22[0])
            v12 = *(_WORD *)sub_233C05D98(v22);
          HIWORD(v35) = v12;
          v36 = -1;
          v13 = sub_234117B80(0x1Bu, "Support");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(__dst[0]) = 0;
            _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::VerifyAttestationInformation skipping PAA subject key id extraction - PAARootStore disabled", (uint8_t *)__dst, 2u);
          }
          if (sub_234114844(2u))
            sub_2341147D0(0x1Bu, 2);
          sub_2341E05CC(a2, &v19, &__s1, &v17, (uint64_t)v16, (uint64_t)buf, (uint64_t)__dst);
          if (LODWORD(__dst[0]))
          {
            v6 = 501;
          }
          else if (*((_QWORD *)&__s1 + 1) == *(_QWORD *)(a2 + 88)
                 && (!*((_QWORD *)&__s1 + 1)
                  || !memcmp((const void *)__s1, *(const void **)(a2 + 80), *((size_t *)&__s1 + 1))))
          {
            v14 = sub_234117B80(0x1Bu, "Support");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(__dst[0]) = 0;
              _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_DEFAULT, "PartialDACVerifier::VerifyAttestationInformation skipping CD signature check - LocalCSAStore disabled", (uint8_t *)__dst, 2u);
            }
            if (sub_234114844(2u))
              sub_2341147D0(0x1Bu, 2);
            sub_2341E01A4((uint64_t *)&v19, &v15, __dst);
            if (LODWORD(__dst[0]))
              v6 = 105;
            else
              v6 = (*(uint64_t (**)(uint64_t, __int128 *, _QWORD *, int *))(*(_QWORD *)a1 + 32))(a1, &v15, v16, &v34);
          }
          else
          {
            v6 = 502;
          }
        }
      }
    }
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v6);
}

void sub_234253808()
{
  JUMPOUT(0x23493E704);
}

uint64_t sub_23425381C(uint64_t a1)
{
  return a1 + 16;
}

void sub_234253824(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;
  uint64_t v15[2];
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[2];
  int v20;
  __int128 __s1;
  int v22;
  __int128 v23;
  int *p_dst;
  uint64_t v25;
  unsigned __int8 v26[2];
  __int16 v27;
  char v28;
  unsigned __int8 v29[2];
  __int16 v30;
  _BYTE v31[2];
  __int16 v32;
  unsigned __int8 v33[2];
  __int16 v34;
  _BYTE v35[2];
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _DWORD v41[20];
  int __dst;
  __int16 v43;
  __int16 v44;
  __int16 v45;
  __int16 v46;
  __int16 v47;
  _QWORD v48[2];
  int v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v38 = 0;
  v33[0] = 0;
  v35[0] = 0;
  v29[0] = 0;
  v31[0] = 0;
  v26[0] = 0;
  v28 = 0;
  v5 = *(_QWORD *)(a2 + 8);
  if (!v5 || !*(_QWORD *)(a2 + 24) || !*(_QWORD *)(a2 + 40) || !*(_QWORD *)(a2 + 72))
  {
    v6 = 0;
    v7 = 800;
    goto LABEL_12;
  }
  v6 = 0;
  v7 = 800;
  if (v5 > 0x384 || !a3 || !*(_QWORD *)(a2 + 88))
    goto LABEL_12;
  if (!*(_QWORD *)(a2 + 56))
  {
    v6 = 0;
    v7 = 207;
    goto LABEL_12;
  }
  sub_23413BF5C((uint64_t *)(a2 + 48), 1, (uint64_t)v39);
  if (LODWORD(v39[0]))
  {
LABEL_10:
    v6 = 0;
    v7 = 203;
    goto LABEL_12;
  }
  sub_23413BF5C((uint64_t *)(a2 + 64), 2, (uint64_t)v39);
  if (LODWORD(v39[0]) || (sub_23413D364(a2 + 64, v33, (uint64_t)v39), LODWORD(v39[0])))
  {
    v6 = 0;
    v7 = 303;
    goto LABEL_12;
  }
  sub_23413D364(a2 + 48, v29, (uint64_t)v39);
  if (LODWORD(v39[0]))
    goto LABEL_10;
  v6 = 0;
  v7 = 305;
  if (!v29[0] || v29[0] != v33[0])
    goto LABEL_12;
  if (v30 != v34)
  {
    v6 = 0;
    goto LABEL_12;
  }
  if (!v35[0] || v31[0] && v32 != v36)
  {
    v6 = 0;
    v7 = 306;
    goto LABEL_12;
  }
  v39[0] = &off_250505A50;
  v50 = 0;
  sub_23413C364((uint64_t *)(a2 + 64), (uint64_t)v39, (uint64_t)&p_dst);
  if ((_DWORD)p_dst)
  {
    v9 = 303;
LABEL_34:
    sub_23413A7A4(&__dst, 64);
    v6 = 0;
    v7 = v9;
    goto LABEL_12;
  }
  v10 = *(_QWORD *)(a2 + 40);
  if (v10 > 0x40)
  {
    v9 = 503;
    goto LABEL_34;
  }
  v50 = *(_QWORD *)(a2 + 40);
  memcpy(&__dst, *(const void **)(a2 + 32), v10);
  sub_2341F36FC((uint64_t)v39, a2, a2 + 16, (uint64_t)&__dst, &p_dst);
  if ((_DWORD)p_dst)
  {
    v9 = 500;
    goto LABEL_34;
  }
  sub_23413A7A4(&__dst, 64);
  p_dst = &__dst;
  v25 = 20;
  sub_23413CC88((uint64_t *)(a2 + 48), (uint64_t *)&p_dst, (uint64_t)v39);
  if (LODWORD(v39[0]))
    goto LABEL_10;
  v6 = sub_234114774(0x258uLL);
  if (!v6)
  {
    v7 = 700;
    goto LABEL_12;
  }
  sub_233CAF22C(&v37, (uint64_t)v6, 600);
  v11 = a1[79];
  sub_233BF7114(&v23, (uint64_t)p_dst, v25);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, __int128 *, uint64_t *))(*(_QWORD *)v11 + 16))(v39, v11, &v23, &v37);
  if (LODWORD(v39[0]))
  {
    if (LODWORD(v39[0]) != 45
      || (sub_234254AB8(),
          sub_233BF7114(&v23, (uint64_t)p_dst, v25),
          sub_234253DB4((uint64_t)&qword_25615DA78, (uint64_t)&v23, (uint64_t)&v37, (uint64_t)v39),
          LODWORD(v39[0])))
    {
      v7 = 101;
      goto LABEL_12;
    }
  }
  sub_233BF7114(&v23, v37, v38);
  sub_23413D364((uint64_t)&v23, v26, (uint64_t)v39);
  if (LODWORD(v39[0]))
    goto LABEL_43;
  if (!v26[0] || v26[0] == v29[0] && v27 == v30)
  {
    if (v28)
    {
LABEL_43:
      v7 = 105;
      goto LABEL_12;
    }
    sub_23413CA50((uint64_t *)(a2 + 64), (uint64_t)v39);
    if (LODWORD(v39[0]))
    {
      v7 = 300;
    }
    else
    {
      v22 = 0;
      sub_23413C4EC(v37, v38, *(_QWORD *)(a2 + 48), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 64), *(_QWORD *)(a2 + 72), &v22, (uint64_t)v39);
      if (LODWORD(v39[0]))
      {
        v12 = sub_234253F9C(v22);
      }
      else
      {
        v23 = 0uLL;
        __s1 = 0uLL;
        v20 = 0;
        v19[0] = 0;
        v19[1] = 0;
        v39[1] = 0;
        v40[0] = 0;
        *(_DWORD *)((char *)v40 + 7) = 0;
        sub_234104468((uint64_t)v41);
        v41[18] = 21;
        v18[0] = 0;
        v18[1] = 0;
        __dst = *(_DWORD *)(a2 + 96);
        v43 = *(_WORD *)sub_233CBCEC0(v33);
        v44 = *(_WORD *)sub_233CBCEC0(v35);
        v45 = *(_WORD *)sub_233CBCEC0(v29);
        v13 = v31[0];
        if (v31[0])
          v13 = *(_WORD *)sub_233C05D98(v31);
        v46 = v13;
        if (v26[0])
          v14 = *(_WORD *)sub_233C05D98(v26);
        else
          v14 = -1;
        v47 = v14;
        v48[1] = 0;
        v48[0] = 0;
        v49 = 0;
        v16 = v48;
        v17 = 20;
        sub_233BF7114(v15, v37, v38);
        sub_23413CB48(v15, (uint64_t *)&v16, (uint64_t)&p_dst);
        v12 = 105;
        if (!(_DWORD)p_dst && v17 == 20)
        {
          sub_2341E05CC(a2, &v23, &__s1, &v20, (uint64_t)v19, (uint64_t)v39, (uint64_t)&p_dst);
          if ((_DWORD)p_dst)
          {
            v12 = 501;
          }
          else if (*((_QWORD *)&__s1 + 1) == *(_QWORD *)(a2 + 88)
                 && (!*((_QWORD *)&__s1 + 1)
                  || !memcmp((const void *)__s1, *(const void **)(a2 + 80), *((size_t *)&__s1 + 1))))
          {
            v12 = (*(uint64_t (**)(_QWORD *, __int128 *, _QWORD *))(*a1 + 24))(a1, &v23, v18);
            if (!(_DWORD)v12)
              v12 = (*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD *, int *))(*a1 + 32))(a1, v18, v19, &__dst);
          }
          else
          {
            v12 = 502;
          }
        }
      }
      v7 = v12;
    }
  }
  else
  {
    v7 = 205;
  }
LABEL_12:
  (*(void (**)(_QWORD, uint64_t, uint64_t))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, v7);
  if (v6)
    j__free(v6);
}

void sub_234253DB4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *__s2[3];
  _QWORD *v18;
  uint64_t v19;
  size_t __n[2];
  _QWORD v21[2];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a2 + 8);
  if (v5)
    v6 = *(_QWORD *)a2 == 0;
  else
    v6 = 1;
  if (v6)
  {
    *(_DWORD *)a4 = 47;
    *(_QWORD *)(a4 + 8) = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
    v7 = 233;
  }
  else if (v5 == 20)
  {
    __n[0] = 0;
    __n[1] = 0;
    if (*(_QWORD *)(a1 + 16))
    {
      v11 = 0;
      v12 = 0;
      v13 = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
      while (1)
      {
        v21[0] = 0;
        v21[1] = 0;
        v22 = 0;
        *(_OWORD *)__n = *(_OWORD *)(*(_QWORD *)(a1 + 8) + v11);
        v18 = v21;
        v19 = 20;
        sub_23413CB48((uint64_t *)__n, (uint64_t *)&v18, (uint64_t)__s2);
        if (LODWORD(__s2[0]))
        {
          v7 = 245;
          v15 = 172;
          goto LABEL_21;
        }
        sub_233BF7114(__s2, (uint64_t)v18, v19);
        v14 = *(void **)(a2 + 8);
        if (v14 == __s2[1] && (!v14 || !memcmp(*(const void **)a2, __s2[0], (size_t)v14)))
          break;
        ++v12;
        v11 += 16;
        if (v12 >= *(_QWORD *)(a1 + 16))
          goto LABEL_15;
      }
      v16 = __n[1];
      if (*(_QWORD *)(a3 + 8) >= __n[1])
      {
        memcpy(*(void **)a3, (const void *)__n[0], __n[1]);
        sub_233BF7588(a3, v16);
        v15 = 0;
        v7 = 380;
        v13 = "src/lib/support/Span.h";
      }
      else
      {
        v7 = 375;
        v13 = "src/lib/support/Span.h";
        v15 = 25;
      }
LABEL_21:
      *(_DWORD *)a4 = v15;
      *(_QWORD *)(a4 + 8) = v13;
    }
    else
    {
LABEL_15:
      *(_DWORD *)a4 = 74;
      *(_QWORD *)(a4 + 8) = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
      v7 = 254;
    }
  }
  else
  {
    *(_DWORD *)a4 = 47;
    *(_QWORD *)(a4 + 8) = "src/credentials/attestation_verifier/DeviceAttestationVerifier.h";
    v7 = 234;
  }
  *(_DWORD *)(a4 + 16) = v7;
}

uint64_t sub_234253F9C(int a1)
{
  if (a1 <= 299)
  {
    if (a1 > 199)
    {
      if (a1 == 200)
      {
        return 203;
      }
      else
      {
        if (a1 != 201)
          return 900;
        return 204;
      }
    }
    else if (a1 == 100)
    {
      return 105;
    }
    else
    {
      if (a1 != 101)
        return 900;
      return 106;
    }
  }
  else if (a1 <= 399)
  {
    if (a1 == 300)
    {
      return 303;
    }
    else
    {
      if (a1 != 301)
        return 900;
      return 304;
    }
  }
  else if (a1 == 400)
  {
    return 301;
  }
  else
  {
    if (a1 != 500)
      return 900;
    return 700;
  }
}

uint64_t sub_234254040(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  BOOL v7;
  BOOL v8;
  __n128 v9;
  _QWORD v10[3];
  __int128 v11;
  __n128 v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0uLL;
  sub_2341DFE84(a2, &v11, v12);
  if (v12[0].n128_u32[0])
    return 600;
  v12[0].n128_u64[0] = (unint64_t)&off_250505A50;
  memset(v10, 0, sizeof(v10));
  sub_23425417C((_QWORD *)(a1 + 16), (uint64_t)&v11, (uint64_t)v12, (uint64_t)v10);
  if (LODWORD(v10[0]))
    return 601;
  if (*((_QWORD *)&v11 + 1) == 20)
  {
    v7 = *(_QWORD *)v11 == 0xA9FAAC593382FA62 && *(_QWORD *)(v11 + 8) == 0xF5DD0A14FA1C3E96;
    v8 = v7 && *(_DWORD *)(v11 + 16) == 1618080516;
    if (v8 && !*(_BYTE *)(a1 + 8))
      return 601;
  }
  sub_2341DF01C(a2, (uint64_t)v12, a3, &v9);
  if (v9.n128_u32[0])
    return 602;
  else
    return 0;
}

_QWORD *sub_23425417C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v6;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v16;
  _QWORD *v17;
  int v18;
  int v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__s2;
  size_t __n;

  v6 = result;
  v8 = 0;
  v9 = *(_QWORD **)a2;
  do
  {
    if (*(_QWORD *)(a2 + 8) == 20)
    {
      v10 = *(uint64_t **)((char *)&off_25051C170 + v8);
      v11 = *v10;
      v12 = v10[1];
      v13 = *((unsigned int *)v10 + 4);
      v14 = *v9 == v11 && v9[1] == v12;
      if (v14 && *((_DWORD *)v9 + 4) == v13)
      {
        v19 = 0;
        v20 = *(uint64_t *)((char *)&off_25051C170 + v8 + 8);
        *(_OWORD *)(a3 + 8) = *(_OWORD *)v20;
        v21 = *(_OWORD *)(v20 + 16);
        v22 = *(_OWORD *)(v20 + 32);
        v23 = *(_OWORD *)(v20 + 48);
        *(_BYTE *)(a3 + 72) = *(_BYTE *)(v20 + 64);
        *(_OWORD *)(a3 + 56) = v23;
        *(_OWORD *)(a3 + 40) = v22;
        *(_OWORD *)(a3 + 24) = v21;
        v18 = 672;
        goto LABEL_20;
      }
    }
    v8 += 16;
  }
  while (v8 != 96);
  if (result[76])
  {
    v16 = 0;
    v17 = result + 7;
    while (1)
    {
      result = sub_233BF7114(&__s2, (uint64_t)(v17 - 6), *(v17 - 2));
      if (*(_QWORD *)(a2 + 8) == __n)
      {
        if (!__n)
          break;
        result = (_QWORD *)memcmp(*(const void **)a2, __s2, __n);
        if (!(_DWORD)result)
          break;
      }
      ++v16;
      v17 += 15;
      if (v16 >= v6[76])
        goto LABEL_17;
    }
    v19 = 0;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)v17;
    v24 = *((_OWORD *)v17 + 1);
    v25 = *((_OWORD *)v17 + 2);
    v26 = *((_OWORD *)v17 + 3);
    *(_BYTE *)(a3 + 72) = *((_BYTE *)v17 + 64);
    *(_OWORD *)(a3 + 56) = v26;
    *(_OWORD *)(a3 + 40) = v25;
    *(_OWORD *)(a3 + 24) = v24;
    v18 = 683;
  }
  else
  {
LABEL_17:
    v18 = 688;
    v19 = 16;
  }
LABEL_20:
  *(_DWORD *)a4 = v19;
  *(_QWORD *)(a4 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  *(_DWORD *)(a4 + 16) = v18;
  return result;
}

BOOL sub_2342542E0(uint64_t a1, _QWORD *a2)
{
  if (a2[1] != 20)
    return 0;
  return *(_QWORD *)*a2 == 0xA9FAAC593382FA62
      && *(_QWORD *)(*a2 + 8) == 0xF5DD0A14FA1C3E96
      && *(_DWORD *)(*a2 + 16) == 1618080516;
}

uint64_t sub_23425433C(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t result;
  int v7;
  int v8;
  int v9;
  _QWORD v10[3];
  _BYTE v11[76];
  uint64_t v12;
  char v13;
  int v14;
  unsigned __int8 v15;
  unsigned __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v12 = 4294901760;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = -1;
  v17 = 0;
  v19 = 0;
  v18 = 0;
  sub_234104468((uint64_t)v11);
  sub_2341DDE84(a2, (uint64_t)&v12, (uint64_t)v10);
  if (LODWORD(v10[0]))
    return 603;
  result = 501;
  if ((unsigned __int16)v12 == 1 && v15 <= 2u)
  {
    if (WORD1(v12) != *a4)
      return 604;
    if (sub_2341DE4E4((uint64_t)v11, (uint64_t)a2, a4[1]))
    {
      v7 = a4[2];
      v8 = a4[4];
      if (BYTE2(v17))
      {
        result = 604;
        if (v7 != v16 || v8 != v16)
          return result;
        v9 = a4[3];
        if (v9 == (unsigned __int16)v17 && (!a4[5] || a4[5] == v9))
        {
LABEL_21:
          if (BYTE3(v17)
            && (v10[0] = a4 + 7, v10[1] = 20, !sub_2341DE6D0((uint64_t)v11, (uint64_t)a2, (uint64_t)v10)))
          {
            return 606;
          }
          else
          {
            return 0;
          }
        }
      }
      else
      {
        result = 604;
        if (v7 != WORD1(v12) || v8 != WORD1(v12))
          return result;
        if (sub_2341DE4E4((uint64_t)v11, (uint64_t)a2, a4[3])
          && (!a4[5] || sub_2341DE4E4((uint64_t)v11, (uint64_t)a2, a4[5])))
        {
          goto LABEL_21;
        }
      }
    }
    return 605;
  }
  return result;
}

void sub_2342544F4(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X5>, _QWORD *a6@<X8>)
{
  unint64_t v7;
  BOOL v8;
  uint64_t v11;
  BOOL v15;
  BOOL v16;
  int v18;
  size_t v19;
  const char *v20;
  int v21;
  int v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  __int128 v26;
  __int128 v27;
  _BYTE __dst[64];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
    v8 = *(_QWORD *)(a2 + 8) == 0;
  else
    v8 = 1;
  if (v8 || !*(_QWORD *)(a3 + 8) || (v11 = a5[1]) == 0)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    v18 = 581;
    goto LABEL_24;
  }
  if (v7 >= 0x385)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    v18 = 583;
    goto LABEL_24;
  }
  if (v11 != 32)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    v18 = 584;
    goto LABEL_24;
  }
  v27 = 0uLL;
  v26 = 0uLL;
  v25[0] = 0;
  v25[1] = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23[0] = 0;
  v23[1] = 0;
  a6[1] = 0;
  a6[2] = 0;
  *a6 = 0;
  sub_2341E0EB8(a1, &v27, &v26, v25, v24, v23, (uint64_t)a6);
  if (*(_DWORD *)a6)
    return;
  if (*((_QWORD *)&v26 + 1) != 32)
  {
    *(_DWORD *)a6 = 47;
    a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    v18 = 594;
    goto LABEL_24;
  }
  if (a5[1] == 32)
  {
    v15 = *(_QWORD *)v26 == *(_QWORD *)*a5 && *(_QWORD *)(v26 + 8) == *(_QWORD *)(*a5 + 8);
    v16 = v15 && *(_QWORD *)(v26 + 16) == *(_QWORD *)(*a5 + 16);
    if (v16 && *(_QWORD *)(v26 + 24) == *(_QWORD *)(*a5 + 24))
    {
      v29 = 0;
      a6[1] = 0;
      a6[2] = 0;
      *a6 = 0;
      v19 = *(_QWORD *)(a3 + 8);
      v20 = "src/crypto/CHIPCryptoPAL.h";
      if (v19 > 0x40)
      {
        v22 = 289;
        v21 = 47;
      }
      else
      {
        v29 = *(_QWORD *)(a3 + 8);
        a6[1] = "src/crypto/CHIPCryptoPAL.h";
        *((_DWORD *)a6 + 4) = 291;
        memcpy(__dst, *(const void **)a3, v19);
        a6[1] = 0;
        a6[2] = 0;
        *a6 = 0;
        sub_2341F36FC(a4, a1, a2, (uint64_t)__dst, a6);
        if (*(_DWORD *)a6)
        {
LABEL_34:
          sub_23413A7A4(__dst, 64);
          return;
        }
        v21 = 0;
        v22 = 607;
        v20 = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
      }
      *(_DWORD *)a6 = v21;
      a6[1] = v20;
      *((_DWORD *)a6 + 4) = v22;
      goto LABEL_34;
    }
  }
  *(_DWORD *)a6 = 47;
  a6[1] = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  v18 = 597;
LABEL_24:
  *((_DWORD *)a6 + 4) = v18;
}

uint64_t sub_23425475C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a3 + 32))(*(_QWORD *)(a3 + 24), a2, 0);
}

_QWORD *sub_234254768@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = *(_QWORD *)(a2 + 8);
  if (v5 > 0x20)
  {
    v6 = 627;
LABEL_7:
    v9 = 47;
    goto LABEL_9;
  }
  if (!v5)
  {
    v6 = 628;
    goto LABEL_7;
  }
  v7 = result;
  v8 = result[76];
  if (v8 == 5)
  {
    v6 = 629;
    v9 = 11;
  }
  else
  {
    v11 = (char *)&result[15 * v8];
    *((_QWORD *)v11 + 5) = v5;
    result = memcpy(v11 + 8, *(const void **)a2, *(_QWORD *)(a2 + 8));
    v9 = 0;
    *(_OWORD *)(v11 + 56) = *(_OWORD *)(a3 + 8);
    v12 = *(_OWORD *)(a3 + 24);
    v13 = *(_OWORD *)(a3 + 40);
    v14 = *(_OWORD *)(a3 + 56);
    v11[120] = *(_BYTE *)(a3 + 72);
    *(_OWORD *)(v11 + 104) = v14;
    *(_OWORD *)(v11 + 88) = v13;
    *(_OWORD *)(v11 + 72) = v12;
    ++v7[76];
    v6 = 638;
  }
LABEL_9:
  *(_DWORD *)a4 = v9;
  *(_QWORD *)(a4 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  *(_DWORD *)(a4 + 16) = v6;
  return result;
}

void sub_23425483C(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  int v6;
  int v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[10];
  _QWORD v12[2];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12[1] = 0;
  v12[0] = 0;
  v13 = 0;
  v9 = v12;
  v10 = 20;
  v11[0] = &off_250505A50;
  sub_23413CB48(a2, (uint64_t *)&v9, (uint64_t)v8);
  if (!LODWORD(v8[0]))
  {
    sub_23413C364(a2, (uint64_t)v11, (uint64_t)v8);
    if (LODWORD(v8[0]))
    {
      *(_DWORD *)a3 = 47;
      *(_QWORD *)(a3 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
      v6 = 648;
      goto LABEL_12;
    }
    sub_233BF7114(v8, (uint64_t)v9, v10);
    if (((*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a1 + 40))(a1, v8) & 1) != 0)
    {
LABEL_6:
      sub_233BF7114(v8, (uint64_t)v9, v10);
      (*(void (**)(uint64_t, _QWORD *, _QWORD *))(*(_QWORD *)a1 + 16))(a1, v8, v11);
      return;
    }
    v7 = 0;
    sub_23413C4EC((uint64_t)&unk_2343036B6, 517, 0, 0, *a2, a2[1], &v7, (uint64_t)v8);
    if (LODWORD(v8[0]))
    {
      v6 = 657;
    }
    else
    {
      if (!v7)
        goto LABEL_6;
      v6 = 658;
    }
    *(_DWORD *)a3 = 47;
    *(_QWORD *)(a3 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
    goto LABEL_12;
  }
  *(_DWORD *)a3 = 47;
  *(_QWORD *)(a3 + 8) = "src/credentials/attestation_verifier/DefaultDeviceAttestationVerifier.cpp";
  v6 = 647;
LABEL_12:
  *(_DWORD *)(a3 + 16) = v6;
}

uint64_t *sub_2342549D8()
{
  sub_234254AB8();
  return &qword_25615DA78;
}

uint64_t *sub_2342549F4(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t v3;

  v1 = atomic_load((unsigned __int8 *)&qword_25615DD18);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_25615DD18))
  {
    byte_25615DAA0 = 1;
    qword_25615DA98[0] = (uint64_t)&off_25051C248;
    qword_25615DAA8 = (uint64_t)&off_25051C1E0;
    v3 = 8u;
    do
    {
      qword_25615DA98[v3] = (uint64_t)&off_250505A50;
      v3 += 15;
    }
    while (v3 != 83);
    qword_25615DD08 = 0;
    unk_25615DD10 = a1;
    __cxa_guard_release(&qword_25615DD18);
  }
  return qword_25615DA98;
}

void sub_234254AA4()
{
  JUMPOUT(0x23493E704);
}

void sub_234254AB8()
{
  _UNKNOWN **v0;
  _UNKNOWN **v1;

  if (!byte_25615DA90)
  {
    byte_25615DA90 = 1;
    v0 = *sub_234254B24();
    v1 = sub_234254B24()[1];
    qword_25615DA80 = (uint64_t)v0;
    unk_25615DA88 = v1;
    qword_25615DA78 = (uint64_t)&off_25051C2B0;
  }
}

void sub_234254B10()
{
  JUMPOUT(0x23493E704);
}

_UNKNOWN ***sub_234254B24()
{
  return &off_25051C318;
}

void sub_234254B30()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0x1Bu, "Support");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/lib/support/Span.h";
    v3 = 1024;
    v4 = 54;
    v5 = 2080;
    v6 = "databuf != nullptr || datalen == 0";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234254C0C()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234254CC8()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234254D84()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234254E48()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233C04D78();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234254EEC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233C0600C();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234254F80()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255038()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342550F0()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342551A8()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255260()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233C0600C();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255300()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233C04D78();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342553A0()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255460()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233CB85A0();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255500(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342555AC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255648(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342556E4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255780(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425581C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342558B8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255954(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342559F0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255A8C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255B28(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255BC4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255C60(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255CFC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255D98(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255E34(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255ED0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234255F6C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256008(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342560A4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CBCB98();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256140(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342561EC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256298(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256344()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234256400()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_2342564BC(uint64_t a1)
{
  std::__shared_weak_count *v1;

  sub_233CF78D0(a1);
  std::__shared_weak_count::__release_weak(v1);
}

void sub_2342564E0()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256594()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256648()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342566FC()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342567B8()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425686C()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256920(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342569CC()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  v1 = sub_234117B80(0x1Du, "Zcl");
  if (sub_233BF75C0(v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "Attribute persistence needs a persistence provider", v2, 2u);
  }
  if (sub_233C06034())
    sub_2341147D0(0x1Du, 1);
  abort();
}

void sub_234256A3C()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234256AF8()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0x1Bu, "Support");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/lib/core/Optional.h";
    v3 = 1024;
    v4 = 208;
    v5 = 2080;
    v6 = "HasValue()";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234256BDC()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256C94()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256D4C()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256E04()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/clusters/descriptor/descriptor.cpp";
    v3 = 1024;
    v4 = 212;
    v5 = 2080;
    v6 = "aPath.mClusterId == Descriptor::Id";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234256EE0()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234256F98()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257050()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257108()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342571C0(_DWORD *a1)
{
  NSObject *v2;
  int v3;
  int v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = sub_234117B80(0xDu, "DataManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = HIWORD(*a1);
    v4 = (unsigned __int16)*a1;
    *(_DWORD *)buf = 67109376;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_233BF3000, v2, OS_LOG_TYPE_ERROR, "Unexpected global attribute: 0x%04X_%04X", buf, 0xEu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0xDu, 1);
  abort();
}

void sub_234257284()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_234117B80(0x1Bu, "Support");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/lib/support/Variant.h";
    v3 = 1024;
    v4 = 224;
    v5 = 2080;
    v6 = "(mTypeId == VariantInternal::TupleIndexOfType<T, std::tuple<Ts...>>::value)";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234257360()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257418()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342574D0()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);

  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257588()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_234117B80(0x1Bu, "Support");
  v1 = objc_claimAutoreleasedReturnValue();
  if (sub_233BF75C0(v1))
  {
    sub_233C0600C();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_23425762C()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/core/Optional.h";
    v3 = 1024;
    v4 = 201;
    v5 = 2080;
    v6 = "HasValue()";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_2342576F0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257788(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425781C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342578B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_234117B80(0xDu, "DataManagement");
  if (sub_233BF75C0(v0))
    sub_2340F46A4(&dword_233BF3000, v1, v2, "Incoming exchange context should not be null", v3, v4, v5, v6, 0);
  if (sub_233C06034())
    sub_2340F46B8();
  abort();
}

void sub_234257908(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425799C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_234117B80(0xDu, "DataManagement");
  if (sub_233BF75C0(v0))
    sub_2340F46A4(&dword_233BF3000, v1, v2, "state should be ReadyForInvokeResponses", v3, v4, v5, v6, 0);
  if (sub_233C06034())
    sub_2340F46B8();
  abort();
}

void sub_2342579F4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257A88(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257B1C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257BB0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257C44(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257CD8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257D6C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234257E00()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/support/Span.h";
    v3 = 1024;
    v4 = 154;
    v5 = 2080;
    v6 = "new_size <= size()";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234257EC4()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234257F68()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_23425800C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342580A0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258134(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342581C8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258260(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342582F4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258390()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_234117B80(0xDu, "DataManagement");
  if (sub_233BF75C0(v0))
    sub_2340F46A4(&dword_233BF3000, v1, v2, "OnMessageReceived should not be called on GroupExchangeContext", v3, v4, v5, v6, 0);
  if (sub_233C06034())
    sub_2340F46B8();
  abort();
}

void sub_2342583E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_234117B80(0xDu, "DataManagement");
  if (sub_233BF75C0(v0))
    sub_2340F46A4(&dword_233BF3000, v1, v2, "Incoming exchange context should be same as the initial request.", v3, v4, v5, v6, 0);
  if (sub_233C06034())
    sub_2340F46B8();
  abort();
}

void sub_234258440(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342584DC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233CB85A0();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258560(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342585FC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233C0600C();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258680()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/core/Optional.h";
    v3 = 1024;
    v4 = 208;
    v5 = 2080;
    v6 = "HasValue()";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234258748(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342587E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258878(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258910(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2341030DC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258994(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258A30(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258ACC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258B68(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258C04(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234258CA0()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234258D44()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234258DE8()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
  {
    sub_233C04D78();
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234258E74()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234258F18()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234258FBC()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234259060(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342590FC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259198(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259234(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342592D0()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/core/ReferenceCounted.h";
    v3 = 1024;
    v4 = 70;
    v5 = 2080;
    v6 = "mRefCount != 0";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234259394(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259428(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342594BC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259550(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342595E4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259678(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425970C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342597A0()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/system/SystemClock.cpp";
    v3 = 1024;
    v4 = 85;
    v5 = 2080;
    v6 = "newTimestamp.count() >= prevTimestamp";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_234259864(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_234118AE8(a1, "chipSystemLayer");
  if (sub_233BF75C0(v1))
    sub_2340F46A4(&dword_233BF3000, v2, v3, "SystemPacketBuffer::Free: aPacket->ref = 0", v4, v5, v6, v7, 0);
  if (sub_233C06034())
    sub_234118ADC();
  abort();
}

void sub_2342598B8(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_234118AE8(a1, "chipSystemLayer");
  if (sub_233BF75C0(v1))
    sub_2340F46A4(&dword_233BF3000, v2, v3, "buffer chain too large", v4, v5, v6, v7, 0);
  if (sub_233C06034())
    sub_234118ADC();
  abort();
}

void sub_23425990C(uint64_t a1)
{
  NSObject *v2;
  uint8_t buf[4];
  uint64_t v4;

  v2 = sub_234118AE8(a1, "chipSystemLayer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v4 = a1;
    _os_log_impl(&dword_233BF3000, v2, OS_LOG_TYPE_ERROR, "next buffer %p is not exclusive to this chain", buf, 0xCu);
  }
  if (sub_233C06034())
    sub_234118ADC();
  abort();
}

void sub_23425998C(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_234118AE8(a1, "chipSystemLayer");
  if (sub_233BF75C0(v1))
    sub_2340F46A4(&dword_233BF3000, v2, v3, "packet buffer refcount overflow", v4, v5, v6, v7, 0);
  if (sub_233C06034())
    sub_234118ADC();
  abort();
}

void sub_2342599E0()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234259A84()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234259B28()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234259BCC()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234259C70(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259D0C()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  v1 = sub_234117B80(0x1Fu, "DeviceLayer");
  if (sub_233BF75C0(v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "Re-entry into HandleEvents from a timer callback?", v2, 2u);
  }
  if (sub_233C06034())
    sub_2341147D0(0x1Fu, 1);
  abort();
}

void sub_234259D7C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259E18(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259EB4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234259F50()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234259FF4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A088(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A11C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A1B0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A244(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A2D8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A36C()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  v1 = sub_234117B80(0xBu, "SecureChannel");
  if (sub_233BF75C0(v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "Bad internal state.", v2, 2u);
  }
  if (sub_233C06034())
    sub_2341147D0(0xBu, 1);
  abort();
}

void sub_23425A3DC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A470(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A504(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A598(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A62C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A6C4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A758(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A7EC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A880(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A918(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425A9AC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AA48(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AAE0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AB78(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AC10(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425ACA8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AD44(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425ADE0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AE7C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AF18(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425AFB0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B048(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B0E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233C04D78();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B164(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B1FC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B298(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B334(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B3D0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B46C()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/support/Span.h";
    v3 = 1024;
    v4 = 54;
    v5 = 2080;
    v6 = "databuf != nullptr || datalen == 0";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425B530(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B5CC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B668(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_23413DA38();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B6EC()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/messaging/EphemeralExchangeDispatch.h";
    v3 = 1024;
    v4 = 48;
    v5 = 2080;
    v6 = "false";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425B7B0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B844(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B8D8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425B96C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BA00(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BA94(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BB28(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BBBC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BC50(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BCE4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BD78(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BE0C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425BEA0()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/platform/CommissionableDataProvider.cpp";
    v3 = 1024;
    v4 = 32;
    v5 = 2080;
    v6 = "gCommissionableDataProvider != nullptr";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425BF64()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/platform/DeviceInstanceInfoProvider.cpp";
    v3 = 1024;
    v4 = 32;
    v5 = 2080;
    v6 = "gDeviceInstanceInfoProvider != nullptr";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425C028()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_23425C0CC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2341B4688();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C150(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2341B46D8();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C1D4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2341B46B0();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C258(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C2F4()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/support/IntrusiveList.h";
    v3 = 1024;
    v4 = 88;
    v5 = 2080;
    v6 = "!IsInList()";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425C3B8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C454(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C4F0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C58C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C628()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/support/SetupDiscriminator.h";
    v3 = 1024;
    v4 = 45;
    v5 = 2080;
    v6 = "discriminator == (discriminator & kShortMask)";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425C6EC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C788()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/lib/support/SetupDiscriminator.h";
    v3 = 1024;
    v4 = 52;
    v5 = 2080;
    v6 = "discriminator == (discriminator & kLongMask)";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425C84C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C8E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425C974(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CA08(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CA9C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CB30(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CBC4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CC58(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CCEC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CD80(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425CE14()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_233C06034())
    sub_2341CD3B8(0x1Bu);
  abort();
}

void sub_23425CEB8()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_233C06034())
    sub_2341CD3B8(0x1Bu);
  abort();
}

void sub_23425CF5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_234117B80(0xBu, "SecureChannel");
  if (sub_233BF75C0(v0))
    sub_2340F46A4(&dword_233BF3000, v1, v2, "We couldn't find any session to evict at all, something's wrong!", v3, v4, v5, v6, 0);
  if (sub_233C06034())
    sub_2341CD3B8(0xBu);
  abort();
}

void sub_23425CFB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_234117B80(0xBu, "SecureChannel");
  if (sub_233BF75C0(v0))
    sub_2340F46A4(&dword_233BF3000, v1, v2, "EvictAndAllocate isn't re-entrant, yet someone called us while we're already running", v3, v4, v5, v6, 0);
  if (sub_233C06034())
    sub_2341CD3B8(0xBu);
  abort();
}

void sub_23425D014(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D0AC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D140(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D1D4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D268(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D2FC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D390(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D424(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D4B8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D54C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D5E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D674(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D708(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425D79C()
{
  unsigned __int8 v0;
  NSObject *v1;
  int v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;

  v0 = atomic_load((unsigned __int8 *)qword_256158978);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(qword_256158978))
  {
    qword_256158958 = sub_2341B1C28();
    dword_256158960 = v2;
    byte_256158964 = 0;
    byte_256158968 = 0;
    byte_25615896C = 0;
    word_256158974 = 1;
    __cxa_guard_release(qword_256158978);
  }
  v1 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v4 = "src/transport/GroupSession.h";
    v5 = 1024;
    v6 = 66;
    v7 = 2080;
    v8 = "false";
    _os_log_impl(&dword_233BF3000, v1, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425D8B8()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/transport/GroupSession.h";
    v3 = 1024;
    v4 = 74;
    v5 = 2080;
    v6 = "false";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425D97C()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/transport/GroupSession.h";
    v3 = 1024;
    v4 = 81;
    v5 = 2080;
    v6 = "false";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425DA40(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DAD4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DB68(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DBFC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DC90(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DD28(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DDC0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DE58(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DEEC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425DF80(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E014(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E0A8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E13C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E1D0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E264(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2341D94BC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E2E8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E384(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2341D94E4();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E408(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E4A4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E538(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E5CC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E660(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E6FC()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/transport/raw/UDP.cpp";
    v3 = 1024;
    v4 = 85;
    v5 = 2080;
    v6 = "mUDPEndPoint != nullptr";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425E7C0()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v2 = "src/transport/raw/TCP.cpp";
    v3 = 1024;
    v4 = 482;
    v5 = 2080;
    v6 = "activeConnection != nullptr";
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "VerifyOrDie failure at %s:%d: %s", buf, 0x1Cu);
  }
  if (sub_234114844(1u))
    sub_2341147D0(0x1Bu, 1);
  abort();
}

void sub_23425E884()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  v1 = sub_234117B80(0xDu, "DataManagement");
  if (sub_233BF75C0(v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_233BF3000, v0, OS_LOG_TYPE_ERROR, "Failed to get required resources by evicting existing subscriptions.", v2, 2u);
  }
  if (sub_233C06034())
    sub_2341147D0(0xDu, 1);
  abort();
}

void sub_23425E8F4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425E988(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EA1C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EAB0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EB44(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EBD8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EC6C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425ED00(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425ED94(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EE28(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EEBC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EF50(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425EFE4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F078(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F114(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F1B0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F24C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F2E8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F384(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F418(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F4AC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F540(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F5D4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F668(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F6FC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F790(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F824(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F8B8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F94C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425F9E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FA74(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_234214E2C(a1, "DataManagement");
  if (sub_233BF75C0(v1))
    sub_2340F46A4(&dword_233BF3000, v2, v3, "CommandResponseSender can only be set in idle state", v4, v5, v6, v7, 0);
  if (sub_233C06034())
    sub_2341CD3B8(0xDu);
  abort();
}

void sub_23425FACC(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_234214E2C(a1, "DataManagement");
  if (sub_233BF75C0(v1))
    sub_2340F46A4(&dword_233BF3000, v2, v3, "state should be Idle", v4, v5, v6, v7, 0);
  if (sub_233C06034())
    sub_2341CD3B8(0xDu);
  abort();
}

void sub_23425FB24(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FBB8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FC4C(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t buf[4];
  int v5;

  v2 = sub_234214E2C((uint64_t)a1, "DataManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *a1;
    *(_DWORD *)buf = 67109120;
    v5 = v3;
    _os_log_impl(&dword_233BF3000, v2, OS_LOG_TYPE_ERROR, "CommandHandlerImpl::Close() called with %u unfinished async work items", buf, 8u);
  }
  if (sub_233C06034())
    sub_2341CD3B8(0xDu);
  abort();
}

void sub_23425FCD8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FD6C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FE00(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FE94(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FF28(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23425FFBC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260050(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342600E4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260178(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23426020C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342602A0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260334(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342603CC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260464(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342604FC()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_2342605A0()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_234117B80(0x1Bu, "Support");
  if (sub_233BF75C0(v0))
    sub_233BF75AC(&dword_233BF3000, v1, v2, "VerifyOrDie failure at %s:%d: %s", v3, v4, v5, v6, v7, v8, v9, v10, 2u);
  if (sub_234114844(1u))
    sub_233BF75CC();
  abort();
}

void sub_234260644(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342606E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23426077C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260818(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342608B4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23426094C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342609E0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260A74(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260B08(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260B9C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260C30(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260CC4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260D58(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260DF4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260E90(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260F2C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234260FC0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261054(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342610E8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23426117C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261210(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342612A4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261338(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_23424A3B0();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342613BC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261450(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342614E4(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261578(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_23426160C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342616A0(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_2340F4690();
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261734(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342617CC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261864(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_2342618FC(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261994(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
  {
    sub_233D540FC();
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  }
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261A2C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261AC8(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261B64(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261C00(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

void sub_234261C9C(uint64_t a1)
{
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_233C0603C(a1, "Support");
  if (sub_233BF75C0(v1))
    sub_233BF75AC(&dword_233BF3000, v2, v3, "VerifyOrDie failure at %s:%d: %s", v4, v5, v6, v7, v8, v9, v10, v11, 2u);
  if (sub_233C06034())
    sub_233BF75CC();
  abort();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x24BDAC3E8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x24BDAC3F8](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x24BDAC408](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  return MEMORY[0x24BDAC420](*(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x24BDAC428](sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x24BDAC438](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceRegisterRecord(DNSServiceRef sdRef, DNSRecordRef *RecordRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata, uint32_t ttl, DNSServiceRegisterRecordReply callBack, void *context)
{
  return MEMORY[0x24BDAC440](sdRef, RecordRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, rdlen);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x24BDAC448](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x24BDAC450](service, queue);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x24BDAC458](sdRef, recordRef, *(_QWORD *)&flags, rdlen, rdata, *(_QWORD *)&ttl);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  MEMORY[0x24BDAC558](txtRecord, bufferLen, buffer);
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  MEMORY[0x24BDAC560](txtRecord);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x24BDAC568](txtRecord);
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  return MEMORY[0x24BDAC570](txtLen, txtRecord);
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  return MEMORY[0x24BDAC578](txtLen, txtRecord, itemIndex, keyBufLen, key, valueLen, value);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x24BDAC580](txtRecord);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x24BDAC590](txtRecord, key, valueSize, value);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB630](retstr, __val);
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
  return off_2504EDBF0();
}

void operator delete(void *__p)
{
  off_2504EDBF8(__p);
}

uint64_t operator delete()
{
  return off_2504EDC00();
}

uint64_t operator new[]()
{
  return off_2504EDC08();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2504EDC10(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_2504EDC18(__sz, a2);
}

uint64_t operator new()
{
  return off_2504EDC20();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

uint64_t __umodti3()
{
  return MEMORY[0x24BDAC958]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x24BDAD248](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

void if_freenameindex(if_nameindex *a1)
{
  MEMORY[0x24BDAE848](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

if_nameindex *if_nameindex(void)
{
  return (if_nameindex *)MEMORY[0x24BDAE858]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
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

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

void nw_connection_set_path_changed_handler(nw_connection_t connection, nw_connection_path_event_handler_t handler)
{
  MEMORY[0x24BDE0C88](connection, handler);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x24BDE0CB8](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x24BDE13A8](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13C0](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x24BDE15A0](configure_dtls, configure_udp);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
  MEMORY[0x24BDE1808](path, enumerate_block);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A10]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

void nw_release(void *obj)
{
  MEMORY[0x24BDE2380](obj);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x24BDAF770](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFAF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFCF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int settimeofday(const timeval *a1, const timezone *a2)
{
  return MEMORY[0x24BDAFD80](a1, a2);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x24BDAFDB0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x24BDAFFF8](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}


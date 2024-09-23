uint64_t sub_21B86A310(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 128);
  if ((v4 & 4) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 24));
    v4 = *(_DWORD *)(v3 + 128);
    if ((v4 & 0x100000) == 0)
    {
LABEL_3:
      if ((v4 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((v4 & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(float *)(v3 + 100));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80) == 0)
  {
LABEL_4:
    if ((v4 & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  result = PB::Writer::write(this, *(float *)(v3 + 48));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80000) == 0)
  {
LABEL_5:
    if ((v4 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  result = PB::Writer::write(this, *(float *)(v3 + 96));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x40) == 0)
  {
LABEL_6:
    if ((v4 & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  result = PB::Writer::write(this, *(float *)(v3 + 44));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x4000) == 0)
  {
LABEL_7:
    if ((v4 & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  result = PB::Writer::write(this, *(float *)(v3 + 76));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x2000) == 0)
  {
LABEL_8:
    if ((v4 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  result = PB::Writer::write(this, *(float *)(v3 + 72));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x1000) == 0)
  {
LABEL_9:
    if ((v4 & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  result = PB::Writer::write(this, *(float *)(v3 + 68));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x800000) == 0)
  {
LABEL_10:
    if ((v4 & 0x20000000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  result = PB::Writer::write(this, *(float *)(v3 + 112));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x20000000) == 0)
  {
LABEL_11:
    if ((v4 & 0x2000000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x2000000) == 0)
  {
LABEL_12:
    if ((v4 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x400) == 0)
  {
LABEL_13:
    if ((v4 & 0x10000000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  result = PB::Writer::write(this, *(float *)(v3 + 60));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10000000) == 0)
  {
LABEL_14:
    if ((v4 & 0x40000000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x40000000) == 0)
  {
LABEL_15:
    if ((v4 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x40000) == 0)
  {
LABEL_16:
    if ((v4 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  result = PB::Writer::write(this, *(float *)(v3 + 92));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x20) == 0)
  {
LABEL_17:
    if ((v4 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  result = PB::Writer::write(this, *(float *)(v3 + 40));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x20000) == 0)
  {
LABEL_18:
    if ((v4 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  result = PB::Writer::write(this, *(float *)(v3 + 88));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10) == 0)
  {
LABEL_19:
    if ((v4 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  result = PB::Writer::write(this, *(float *)(v3 + 36));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x100) == 0)
  {
LABEL_20:
    if ((v4 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  result = PB::Writer::write(this, *(float *)(v3 + 52));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x400000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80000000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  result = PB::Writer::write(this, *(float *)(v3 + 108));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_22:
    if ((v4 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10000) == 0)
  {
LABEL_23:
    if ((v4 & 8) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  result = PB::Writer::write(this, *(float *)(v3 + 84));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 8) == 0)
  {
LABEL_24:
    if ((v4 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  result = PB::Writer::write(this, *(float *)(v3 + 32));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x200) == 0)
  {
LABEL_25:
    if ((v4 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  result = PB::Writer::write(this, *(float *)(v3 + 56));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x200000) == 0)
  {
LABEL_26:
    if ((v4 & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  result = PB::Writer::write(this, *(float *)(v3 + 104));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x4000000) == 0)
  {
LABEL_27:
    if ((v4 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x800) == 0)
  {
LABEL_28:
    if ((v4 & 1) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  result = PB::Writer::write(this, *(float *)(v3 + 64));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 1) == 0)
  {
LABEL_29:
    if ((v4 & 2) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 2) == 0)
  {
LABEL_30:
    if ((v4 & 0x1000000) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_31:
    if ((v4 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  result = PB::Writer::write(this, *(float *)(v3 + 116));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x8000) == 0)
  {
LABEL_32:
    if ((v4 & 0x8000000) == 0)
      return result;
    return PB::Writer::write(this);
  }
LABEL_64:
  result = PB::Writer::write(this, *(float *)(v3 + 80));
  if ((*(_DWORD *)(v3 + 128) & 0x8000000) != 0)
    return PB::Writer::write(this);
  return result;
}

double sub_21B86A6B4(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = &off_24DF39A60;
  *(_DWORD *)(a1 + 164) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  return result;
}

void sub_21B86A6D8(PB::Base *this)
{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_24DF39A60;
  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    *((_QWORD *)this + 5) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    *((_QWORD *)this + 2) = v3;
    operator delete(v3);
  }
  PB::Base::~Base(this);
}

void sub_21B86A728(PB::Base *a1)
{
  sub_21B86A6D8(a1);
  JUMPOUT(0x220766390);
}

uint64_t sub_21B86A74C(uint64_t a1, uint64_t a2)
{
  char *v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  char v24;
  char v25;
  char v26;
  int v27;
  int v28;
  int v29;
  char v30;
  char v31;
  char v32;
  int v33;
  int v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;
  int v39;
  char v40;

  *(_QWORD *)a1 = &off_24DF39A60;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (char *)(a1 + 8);
  *(_DWORD *)(a1 + 164) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 2) != 0)
  {
    v7 = *(_QWORD *)(a2 + 64);
    v6 = 2;
    *(_DWORD *)(a1 + 164) = 2;
    *(_QWORD *)(a1 + 64) = v7;
    v5 = *(_DWORD *)(a2 + 164);
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 0;
  if ((v5 & 0x800) != 0)
  {
LABEL_5:
    v8 = *(_DWORD *)(a2 + 108);
    v6 |= 0x800u;
    *(_DWORD *)(a1 + 164) = v6;
    *(_DWORD *)(a1 + 108) = v8;
    v5 = *(_DWORD *)(a2 + 164);
  }
LABEL_6:
  if ((v5 & 0x1000) != 0)
  {
    v13 = *(_DWORD *)(a2 + 112);
    v6 |= 0x1000u;
    *(_DWORD *)(a1 + 164) = v6;
    *(_DWORD *)(a1 + 112) = v13;
    v5 = *(_DWORD *)(a2 + 164);
    if ((v5 & 0x2000) == 0)
    {
LABEL_8:
      if ((v5 & 0x4000) == 0)
        goto LABEL_9;
      goto LABEL_43;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_8;
  }
  v14 = *(_DWORD *)(a2 + 116);
  v6 |= 0x2000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 116) = v14;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  v15 = *(_DWORD *)(a2 + 120);
  v6 |= 0x4000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 120) = v15;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  v16 = *(_DWORD *)(a2 + 124);
  v6 |= 0x8000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 124) = v16;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x10000) == 0)
  {
LABEL_11:
    if ((v5 & 0x80000) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  v17 = *(_DWORD *)(a2 + 128);
  v6 |= 0x10000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 128) = v17;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x80000) == 0)
  {
LABEL_12:
    if ((v5 & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  v18 = *(_DWORD *)(a2 + 140);
  v6 |= 0x80000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 140) = v18;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x100000) == 0)
  {
LABEL_13:
    if ((v5 & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  v19 = *(_DWORD *)(a2 + 144);
  v6 |= 0x100000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 144) = v19;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x200000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  v20 = *(_DWORD *)(a2 + 148);
  v6 |= 0x200000u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 148) = v20;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  v21 = *(_DWORD *)(a2 + 96);
  v6 |= 0x100u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 96) = v21;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x200) == 0)
  {
LABEL_16:
    if ((v5 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  v22 = *(_DWORD *)(a2 + 100);
  v6 |= 0x200u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 100) = v22;
  v5 = *(_DWORD *)(a2 + 164);
  if ((v5 & 0x400) == 0)
  {
LABEL_17:
    if ((v5 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_51:
  v23 = *(_DWORD *)(a2 + 104);
  v6 |= 0x400u;
  *(_DWORD *)(a1 + 164) = v6;
  *(_DWORD *)(a1 + 104) = v23;
  if ((*(_DWORD *)(a2 + 164) & 0x80) != 0)
  {
LABEL_18:
    v9 = *(_DWORD *)(a2 + 92);
    *(_DWORD *)(a1 + 164) = v6 | 0x80;
    *(_DWORD *)(a1 + 92) = v9;
  }
LABEL_19:
  if (a1 != a2)
  {
    sub_21B796B90((char *)(a1 + 32), *(char **)(a2 + 32), *(_QWORD *)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 2);
    sub_21B796B90(v4, *(char **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 2);
  }
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x8000000) != 0)
  {
    v24 = *(_BYTE *)(a2 + 157);
    *(_DWORD *)(a1 + 164) |= 0x8000000u;
    *(_BYTE *)(a1 + 157) = v24;
    v10 = *(_DWORD *)(a2 + 164);
    if ((v10 & 0x400000) == 0)
    {
LABEL_23:
      if ((v10 & 0x1000000) == 0)
        goto LABEL_24;
      goto LABEL_55;
    }
  }
  else if ((v10 & 0x400000) == 0)
  {
    goto LABEL_23;
  }
  v25 = *(_BYTE *)(a2 + 152);
  *(_DWORD *)(a1 + 164) |= 0x400000u;
  *(_BYTE *)(a1 + 152) = v25;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_24:
    if ((v10 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  v26 = *(_BYTE *)(a2 + 154);
  *(_DWORD *)(a1 + 164) |= 0x1000000u;
  *(_BYTE *)(a1 + 154) = v26;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x10) == 0)
  {
LABEL_25:
    if ((v10 & 8) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  v27 = *(_DWORD *)(a2 + 80);
  *(_DWORD *)(a1 + 164) |= 0x10u;
  *(_DWORD *)(a1 + 80) = v27;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 8) == 0)
  {
LABEL_26:
    if ((v10 & 4) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  v28 = *(_DWORD *)(a2 + 76);
  *(_DWORD *)(a1 + 164) |= 8u;
  *(_DWORD *)(a1 + 76) = v28;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 4) == 0)
  {
LABEL_27:
    if ((v10 & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  v29 = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 164) |= 4u;
  *(_DWORD *)(a1 + 72) = v29;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_28:
    if ((v10 & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  v30 = *(_BYTE *)(a2 + 159);
  *(_DWORD *)(a1 + 164) |= 0x20000000u;
  *(_BYTE *)(a1 + 159) = v30;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x80000000) == 0)
  {
LABEL_29:
    if ((v10 & 0x800000) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  v31 = *(_BYTE *)(a2 + 161);
  *(_DWORD *)(a1 + 164) |= 0x80000000;
  *(_BYTE *)(a1 + 161) = v31;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x800000) == 0)
  {
LABEL_30:
    if ((v10 & 0x20) == 0)
      goto LABEL_31;
    goto LABEL_62;
  }
LABEL_61:
  v32 = *(_BYTE *)(a2 + 153);
  *(_DWORD *)(a1 + 164) |= 0x800000u;
  *(_BYTE *)(a1 + 153) = v32;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x20) == 0)
  {
LABEL_31:
    if ((v10 & 0x40000) == 0)
      goto LABEL_32;
    goto LABEL_63;
  }
LABEL_62:
  v33 = *(_DWORD *)(a2 + 84);
  *(_DWORD *)(a1 + 164) |= 0x20u;
  *(_DWORD *)(a1 + 84) = v33;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x40000) == 0)
  {
LABEL_32:
    if ((v10 & 0x10000000) == 0)
      goto LABEL_33;
    goto LABEL_64;
  }
LABEL_63:
  v34 = *(_DWORD *)(a2 + 136);
  *(_DWORD *)(a1 + 164) |= 0x40000u;
  *(_DWORD *)(a1 + 136) = v34;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x10000000) == 0)
  {
LABEL_33:
    if ((v10 & 0x4000000) == 0)
      goto LABEL_34;
    goto LABEL_65;
  }
LABEL_64:
  v35 = *(_BYTE *)(a2 + 158);
  *(_DWORD *)(a1 + 164) |= 0x10000000u;
  *(_BYTE *)(a1 + 158) = v35;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x4000000) == 0)
  {
LABEL_34:
    if ((v10 & 0x40000000) == 0)
      goto LABEL_35;
    goto LABEL_66;
  }
LABEL_65:
  v36 = *(_BYTE *)(a2 + 156);
  *(_DWORD *)(a1 + 164) |= 0x4000000u;
  *(_BYTE *)(a1 + 156) = v36;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x40000000) == 0)
  {
LABEL_35:
    if ((v10 & 1) == 0)
      goto LABEL_36;
    goto LABEL_67;
  }
LABEL_66:
  v37 = *(_BYTE *)(a2 + 160);
  *(_DWORD *)(a1 + 164) |= 0x40000000u;
  *(_BYTE *)(a1 + 160) = v37;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 1) == 0)
  {
LABEL_36:
    if ((v10 & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_68;
  }
LABEL_67:
  v38 = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 164) |= 1u;
  *(_QWORD *)(a1 + 56) = v38;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x40) == 0)
  {
LABEL_37:
    if ((v10 & 0x2000000) == 0)
      goto LABEL_38;
LABEL_69:
    v40 = *(_BYTE *)(a2 + 155);
    *(_DWORD *)(a1 + 164) |= 0x2000000u;
    *(_BYTE *)(a1 + 155) = v40;
    if ((*(_DWORD *)(a2 + 164) & 0x20000) == 0)
      return a1;
    goto LABEL_39;
  }
LABEL_68:
  v39 = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 164) |= 0x40u;
  *(_DWORD *)(a1 + 88) = v39;
  v10 = *(_DWORD *)(a2 + 164);
  if ((v10 & 0x2000000) != 0)
    goto LABEL_69;
LABEL_38:
  if ((v10 & 0x20000) != 0)
  {
LABEL_39:
    v11 = *(_DWORD *)(a2 + 132);
    *(_DWORD *)(a1 + 164) |= 0x20000u;
    *(_DWORD *)(a1 + 132) = v11;
  }
  return a1;
}

uint64_t sub_21B86ABA0(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  int v5;
  float *v6;
  float *v7;
  float v8;
  int v9;
  float *v10;
  float *v11;
  float v12;
  int v13;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x400000) != 0)
  {
    PB::TextFormatter::format(this, "btz");
    v5 = *(_DWORD *)(a1 + 164);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "btzDisturbanceDuration", *(float *)(a1 + 72));
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x800000) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "btzIsCurrentlyQuiescent");
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "btzQuiescentDurationLoose", *(float *)(a1 + 76));
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "btzQuiescentDurationStrict", *(float *)(a1 + 80));
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "btzStaticPoseDuration", *(float *)(a1 + 84));
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  PB::TextFormatter::format(this, "centeredBoresight");
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  PB::TextFormatter::format(this, "centeredBoresightInHighDynamics");
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_49:
  PB::TextFormatter::format(this, "clientMode");
  if ((*(_DWORD *)(a1 + 164) & 0x4000000) != 0)
LABEL_11:
    PB::TextFormatter::format(this, "inComplexTransitionState");
LABEL_12:
  v6 = *(float **)(a1 + 8);
  v7 = *(float **)(a1 + 16);
  while (v6 != v7)
  {
    v8 = *v6++;
    PB::TextFormatter::format(this, "noiseVariance", v8);
  }
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x8000000) != 0)
  {
    PB::TextFormatter::format(this, "pinnedBoresight");
    v9 = *(_DWORD *)(a1 + 164);
    if ((v9 & 0x80) == 0)
    {
LABEL_16:
      if ((v9 & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_53;
    }
  }
  else if ((v9 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PB::TextFormatter::format(this, "qHat_W", *(float *)(a1 + 92));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x100) == 0)
  {
LABEL_17:
    if ((v9 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  PB::TextFormatter::format(this, "qHat_X", *(float *)(a1 + 96));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x200) == 0)
  {
LABEL_18:
    if ((v9 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  PB::TextFormatter::format(this, "qHat_Y", *(float *)(a1 + 100));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x400) == 0)
  {
LABEL_19:
    if ((v9 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  PB::TextFormatter::format(this, "qHat_Z", *(float *)(a1 + 104));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x800) == 0)
  {
LABEL_20:
    if ((v9 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  PB::TextFormatter::format(this, "rBoresight_X", *(float *)(a1 + 108));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x1000) == 0)
  {
LABEL_21:
    if ((v9 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  PB::TextFormatter::format(this, "rBoresight_Y", *(float *)(a1 + 112));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x2000) == 0)
  {
LABEL_22:
    if ((v9 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  PB::TextFormatter::format(this, "rBoresight_Z", *(float *)(a1 + 116));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x4000) == 0)
  {
LABEL_23:
    if ((v9 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  PB::TextFormatter::format(this, "rHat_X", *(float *)(a1 + 120));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x8000) == 0)
  {
LABEL_24:
    if ((v9 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  PB::TextFormatter::format(this, "rHat_Y", *(float *)(a1 + 124));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x10000) == 0)
  {
LABEL_25:
    if ((v9 & 0x10000000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  PB::TextFormatter::format(this, "rHat_Z", *(float *)(a1 + 128));
  v9 = *(_DWORD *)(a1 + 164);
  if ((v9 & 0x10000000) == 0)
  {
LABEL_26:
    if ((v9 & 1) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_62:
  PB::TextFormatter::format(this, "requestingCamera");
  if ((*(_DWORD *)(a1 + 164) & 1) != 0)
LABEL_27:
    PB::TextFormatter::format(this, "srcTimestamp", *(double *)(a1 + 56));
LABEL_28:
  v10 = *(float **)(a1 + 32);
  v11 = *(float **)(a1 + 40);
  while (v10 != v11)
  {
    v12 = *v10++;
    PB::TextFormatter::format(this, "stateVariance", v12);
  }
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 2) != 0)
  {
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 64));
    v13 = *(_DWORD *)(a1 + 164);
    if ((v13 & 0x20000000) == 0)
    {
LABEL_32:
      if ((v13 & 0x20000) == 0)
        goto LABEL_33;
      goto LABEL_66;
    }
  }
  else if ((v13 & 0x20000000) == 0)
  {
    goto LABEL_32;
  }
  PB::TextFormatter::format(this, "tracking1IMU");
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 0x20000) == 0)
  {
LABEL_33:
    if ((v13 & 0x40000000) == 0)
      goto LABEL_34;
    goto LABEL_67;
  }
LABEL_66:
  PB::TextFormatter::format(this, "trackingBehavior");
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 0x40000000) == 0)
  {
LABEL_34:
    if ((v13 & 0x40000) == 0)
      goto LABEL_35;
    goto LABEL_68;
  }
LABEL_67:
  PB::TextFormatter::format(this, "trackingDisabled");
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 0x40000) == 0)
  {
LABEL_35:
    if ((v13 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_69;
  }
LABEL_68:
  PB::TextFormatter::format(this, "trackingScheme");
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_36:
    if ((v13 & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_70;
  }
LABEL_69:
  PB::TextFormatter::format(this, "useRelaxedQuiescenceBounds");
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 0x80000) == 0)
  {
LABEL_37:
    if ((v13 & 0x100000) == 0)
      goto LABEL_38;
LABEL_71:
    PB::TextFormatter::format(this, "vHat_Y", *(float *)(a1 + 144));
    if ((*(_DWORD *)(a1 + 164) & 0x200000) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_39;
  }
LABEL_70:
  PB::TextFormatter::format(this, "vHat_X", *(float *)(a1 + 140));
  v13 = *(_DWORD *)(a1 + 164);
  if ((v13 & 0x100000) != 0)
    goto LABEL_71;
LABEL_38:
  if ((v13 & 0x200000) != 0)
LABEL_39:
    PB::TextFormatter::format(this, "vHat_Z", *(float *)(a1 + 148));
  return PB::TextFormatter::endObject(this);
}

BOOL sub_21B86B038(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void **v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  char v19;
  unsigned int v20;
  unint64_t v21;
  char v22;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  _DWORD *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  int v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  _DWORD *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  int v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  int v69;
  BOOL v70;
  unint64_t v71;
  unint64_t v72;
  int v73;
  BOOL v74;
  unint64_t v75;
  unint64_t v76;
  int v77;
  BOOL v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  int v84;
  BOOL v85;
  unint64_t v86;
  unint64_t v87;
  int v88;
  BOOL v89;
  unint64_t v90;
  unint64_t v91;
  int v92;
  BOOL v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  unint64_t v103;
  unint64_t v104;
  int v105;
  BOOL v106;
  unint64_t v107;
  unint64_t v108;
  int v109;
  BOOL v110;
  unint64_t v111;
  unint64_t v112;
  int v113;
  BOOL v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  char v120;
  unsigned int v121;
  uint64_t v122;
  unint64_t v123;
  char v124;
  unint64_t v125;
  unint64_t v126;
  int v127;
  BOOL v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  unint64_t v137;
  char *v138;
  _DWORD *v139;
  unint64_t v140;
  char *v141;
  char v142;
  unsigned int v143;
  unint64_t v144;
  char v145;
  char v146;
  unsigned int v147;
  unint64_t v148;
  char v149;
  char v150;
  unsigned int v151;
  unint64_t v152;
  char v153;
  char *v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  char *v165;
  char *v166;
  int v167;
  char *v168;
  int v169;
  unint64_t v170;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (void **)(a1 + 8);
    v9 = a1 + 24;
    v10 = (void **)(a1 + 32);
    v11 = a1 + 48;
    while (1)
    {
      v12 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v17 = *(_BYTE *)(v12 + v2);
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0)
          break;
        v13 += 7;
        v2 = v16;
        v18 = v14++ > 8;
        if (v18)
          goto LABEL_20;
      }
LABEL_21:
      v24 = v15 & 7;
      if (v24 == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v15 >> 3))
      {
        case 1u:
          *(_DWORD *)(a1 + 164) |= 2u;
          v25 = *((_QWORD *)this + 1);
          if (v25 > 0xFFFFFFFFFFFFFFF7 || v25 + 8 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v25);
          goto LABEL_153;
        case 2u:
          *(_DWORD *)(a1 + 164) |= 0x800u;
          v26 = *((_QWORD *)this + 1);
          if (v26 > 0xFFFFFFFFFFFFFFFBLL || v26 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 108) = *(_DWORD *)(*(_QWORD *)this + v26);
          goto LABEL_265;
        case 3u:
          *(_DWORD *)(a1 + 164) |= 0x1000u;
          v27 = *((_QWORD *)this + 1);
          if (v27 > 0xFFFFFFFFFFFFFFFBLL || v27 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 112) = *(_DWORD *)(*(_QWORD *)this + v27);
          goto LABEL_265;
        case 4u:
          *(_DWORD *)(a1 + 164) |= 0x2000u;
          v28 = *((_QWORD *)this + 1);
          if (v28 > 0xFFFFFFFFFFFFFFFBLL || v28 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 116) = *(_DWORD *)(*(_QWORD *)this + v28);
          goto LABEL_265;
        case 5u:
          *(_DWORD *)(a1 + 164) |= 0x4000u;
          v29 = *((_QWORD *)this + 1);
          if (v29 > 0xFFFFFFFFFFFFFFFBLL || v29 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 120) = *(_DWORD *)(*(_QWORD *)this + v29);
          goto LABEL_265;
        case 6u:
          *(_DWORD *)(a1 + 164) |= 0x8000u;
          v30 = *((_QWORD *)this + 1);
          if (v30 > 0xFFFFFFFFFFFFFFFBLL || v30 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 124) = *(_DWORD *)(*(_QWORD *)this + v30);
          goto LABEL_265;
        case 7u:
          *(_DWORD *)(a1 + 164) |= 0x10000u;
          v31 = *((_QWORD *)this + 1);
          if (v31 > 0xFFFFFFFFFFFFFFFBLL || v31 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 128) = *(_DWORD *)(*(_QWORD *)this + v31);
          goto LABEL_265;
        case 8u:
          *(_DWORD *)(a1 + 164) |= 0x80000u;
          v32 = *((_QWORD *)this + 1);
          if (v32 > 0xFFFFFFFFFFFFFFFBLL || v32 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 140) = *(_DWORD *)(*(_QWORD *)this + v32);
          goto LABEL_265;
        case 9u:
          *(_DWORD *)(a1 + 164) |= 0x100000u;
          v33 = *((_QWORD *)this + 1);
          if (v33 > 0xFFFFFFFFFFFFFFFBLL || v33 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 144) = *(_DWORD *)(*(_QWORD *)this + v33);
          goto LABEL_265;
        case 0xAu:
          *(_DWORD *)(a1 + 164) |= 0x200000u;
          v34 = *((_QWORD *)this + 1);
          if (v34 > 0xFFFFFFFFFFFFFFFBLL || v34 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 148) = *(_DWORD *)(*(_QWORD *)this + v34);
          goto LABEL_265;
        case 0xBu:
          *(_DWORD *)(a1 + 164) |= 0x100u;
          v35 = *((_QWORD *)this + 1);
          if (v35 > 0xFFFFFFFFFFFFFFFBLL || v35 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 96) = *(_DWORD *)(*(_QWORD *)this + v35);
          goto LABEL_265;
        case 0xCu:
          *(_DWORD *)(a1 + 164) |= 0x200u;
          v36 = *((_QWORD *)this + 1);
          if (v36 > 0xFFFFFFFFFFFFFFFBLL || v36 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 100) = *(_DWORD *)(*(_QWORD *)this + v36);
          goto LABEL_265;
        case 0xDu:
          *(_DWORD *)(a1 + 164) |= 0x400u;
          v37 = *((_QWORD *)this + 1);
          if (v37 > 0xFFFFFFFFFFFFFFFBLL || v37 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 104) = *(_DWORD *)(*(_QWORD *)this + v37);
          goto LABEL_265;
        case 0xEu:
          *(_DWORD *)(a1 + 164) |= 0x80u;
          v38 = *((_QWORD *)this + 1);
          if (v38 > 0xFFFFFFFFFFFFFFFBLL || v38 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 92) = *(_DWORD *)(*(_QWORD *)this + v38);
          goto LABEL_265;
        case 0xFu:
          if (v24 != 2)
          {
            v138 = *(char **)(a1 + 40);
            v137 = *(_QWORD *)(a1 + 48);
            if ((unint64_t)v138 >= v137)
            {
              v154 = (char *)*v10;
              v155 = (v138 - (_BYTE *)*v10) >> 2;
              v156 = v155 + 1;
              if ((unint64_t)(v155 + 1) >> 62)
LABEL_277:
                sub_21B796A0C();
              v157 = v137 - (_QWORD)v154;
              if (v157 >> 1 > v156)
                v156 = v157 >> 1;
              if ((unint64_t)v157 >= 0x7FFFFFFFFFFFFFFCLL)
                v158 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v158 = v156;
              if (v158)
              {
                v159 = (char *)sub_21B796CD8(v11, v158);
                v154 = *(char **)(a1 + 32);
                v138 = *(char **)(a1 + 40);
              }
              else
              {
                v159 = 0;
              }
              v166 = &v159[4 * v155];
              *(_DWORD *)v166 = 0;
              v139 = v166 + 4;
              while (v138 != v154)
              {
                v167 = *((_DWORD *)v138 - 1);
                v138 -= 4;
                *((_DWORD *)v166 - 1) = v167;
                v166 -= 4;
              }
              *(_QWORD *)(a1 + 32) = v166;
              *(_QWORD *)(a1 + 40) = v139;
              *(_QWORD *)(a1 + 48) = &v159[4 * v158];
              if (v154)
                operator delete(v154);
            }
            else
            {
              *(_DWORD *)v138 = 0;
              v139 = v138 + 4;
            }
            *(_QWORD *)(a1 + 40) = v139;
            goto LABEL_261;
          }
          if ((PB::Reader::placeMark() & 1) != 0)
            return 0;
          v39 = *((_QWORD *)this + 1);
          v40 = *((_QWORD *)this + 2);
          while (v39 < v40 && !*((_BYTE *)this + 24))
          {
            v42 = *(char **)(a1 + 40);
            v41 = *(_QWORD *)(a1 + 48);
            if ((unint64_t)v42 >= v41)
            {
              v44 = (char *)*v10;
              v45 = (v42 - (_BYTE *)*v10) >> 2;
              v46 = v45 + 1;
              if ((unint64_t)(v45 + 1) >> 62)
                goto LABEL_277;
              v47 = v41 - (_QWORD)v44;
              if (v47 >> 1 > v46)
                v46 = v47 >> 1;
              if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
                v48 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v48 = v46;
              if (v48)
              {
                v49 = (char *)sub_21B796CD8(v11, v48);
                v44 = *(char **)(a1 + 32);
                v42 = *(char **)(a1 + 40);
              }
              else
              {
                v49 = 0;
              }
              v50 = &v49[4 * v45];
              *(_DWORD *)v50 = 0;
              v43 = v50 + 4;
              while (v42 != v44)
              {
                v51 = *((_DWORD *)v42 - 1);
                v42 -= 4;
                *((_DWORD *)v50 - 1) = v51;
                v50 -= 4;
              }
              *(_QWORD *)(a1 + 32) = v50;
              *(_QWORD *)(a1 + 40) = v43;
              *(_QWORD *)(a1 + 48) = &v49[4 * v48];
              if (v44)
                operator delete(v44);
            }
            else
            {
              *(_DWORD *)v42 = 0;
              v43 = v42 + 4;
            }
            *(_QWORD *)(a1 + 40) = v43;
            v52 = *((_QWORD *)this + 1);
            if (v52 > 0xFFFFFFFFFFFFFFFBLL || v52 + 4 > *((_QWORD *)this + 2))
              goto LABEL_217;
            *(v43 - 1) = *(_DWORD *)(*(_QWORD *)this + v52);
            v40 = *((_QWORD *)this + 2);
            v39 = *((_QWORD *)this + 1) + 4;
            *((_QWORD *)this + 1) = v39;
          }
          goto LABEL_218;
        case 0x10u:
          if (v24 == 2)
          {
            if ((PB::Reader::placeMark() & 1) != 0)
              return 0;
            v53 = *((_QWORD *)this + 1);
            v54 = *((_QWORD *)this + 2);
            while (v53 < v54 && !*((_BYTE *)this + 24))
            {
              v56 = *(char **)(a1 + 16);
              v55 = *(_QWORD *)(a1 + 24);
              if ((unint64_t)v56 >= v55)
              {
                v58 = (char *)*v8;
                v59 = (v56 - (_BYTE *)*v8) >> 2;
                v60 = v59 + 1;
                if ((unint64_t)(v59 + 1) >> 62)
                  goto LABEL_278;
                v61 = v55 - (_QWORD)v58;
                if (v61 >> 1 > v60)
                  v60 = v61 >> 1;
                if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFFCLL)
                  v62 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v62 = v60;
                if (v62)
                {
                  v63 = (char *)sub_21B796CD8(v9, v62);
                  v58 = *(char **)(a1 + 8);
                  v56 = *(char **)(a1 + 16);
                }
                else
                {
                  v63 = 0;
                }
                v64 = &v63[4 * v59];
                *(_DWORD *)v64 = 0;
                v57 = v64 + 4;
                while (v56 != v58)
                {
                  v65 = *((_DWORD *)v56 - 1);
                  v56 -= 4;
                  *((_DWORD *)v64 - 1) = v65;
                  v64 -= 4;
                }
                *(_QWORD *)(a1 + 8) = v64;
                *(_QWORD *)(a1 + 16) = v57;
                *(_QWORD *)(a1 + 24) = &v63[4 * v62];
                if (v58)
                  operator delete(v58);
              }
              else
              {
                *(_DWORD *)v56 = 0;
                v57 = v56 + 4;
              }
              *(_QWORD *)(a1 + 16) = v57;
              v66 = *((_QWORD *)this + 1);
              if (v66 > 0xFFFFFFFFFFFFFFFBLL || v66 + 4 > *((_QWORD *)this + 2))
              {
LABEL_217:
                *((_BYTE *)this + 24) = 1;
                break;
              }
              *(v57 - 1) = *(_DWORD *)(*(_QWORD *)this + v66);
              v54 = *((_QWORD *)this + 2);
              v53 = *((_QWORD *)this + 1) + 4;
              *((_QWORD *)this + 1) = v53;
            }
LABEL_218:
            PB::Reader::recallMark();
          }
          else
          {
            v141 = *(char **)(a1 + 16);
            v140 = *(_QWORD *)(a1 + 24);
            if ((unint64_t)v141 >= v140)
            {
              v160 = (char *)*v8;
              v161 = (v141 - (_BYTE *)*v8) >> 2;
              v162 = v161 + 1;
              if ((unint64_t)(v161 + 1) >> 62)
LABEL_278:
                sub_21B796A0C();
              v163 = v140 - (_QWORD)v160;
              if (v163 >> 1 > v162)
                v162 = v163 >> 1;
              if ((unint64_t)v163 >= 0x7FFFFFFFFFFFFFFCLL)
                v164 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v164 = v162;
              if (v164)
              {
                v165 = (char *)sub_21B796CD8(v9, v164);
                v160 = *(char **)(a1 + 8);
                v141 = *(char **)(a1 + 16);
              }
              else
              {
                v165 = 0;
              }
              v168 = &v165[4 * v161];
              *(_DWORD *)v168 = 0;
              v139 = v168 + 4;
              while (v141 != v160)
              {
                v169 = *((_DWORD *)v141 - 1);
                v141 -= 4;
                *((_DWORD *)v168 - 1) = v169;
                v168 -= 4;
              }
              *(_QWORD *)(a1 + 8) = v168;
              *(_QWORD *)(a1 + 16) = v139;
              *(_QWORD *)(a1 + 24) = &v165[4 * v164];
              if (v160)
                operator delete(v160);
            }
            else
            {
              *(_DWORD *)v141 = 0;
              v139 = v141 + 4;
            }
            *(_QWORD *)(a1 + 16) = v139;
LABEL_261:
            v170 = *((_QWORD *)this + 1);
            if (v170 <= 0xFFFFFFFFFFFFFFFBLL && v170 + 4 <= *((_QWORD *)this + 2))
            {
              *(v139 - 1) = *(_DWORD *)(*(_QWORD *)this + v170);
LABEL_265:
              v116 = *((_QWORD *)this + 1) + 4;
LABEL_266:
              *((_QWORD *)this + 1) = v116;
            }
            else
            {
LABEL_263:
              *((_BYTE *)this + 24) = 1;
            }
          }
LABEL_267:
          v2 = *((_QWORD *)this + 1);
          v3 = *((_QWORD *)this + 2);
          v4 = *((unsigned __int8 *)this + 24);
          if (v2 >= v3 || v4 != 0)
            return v4 == 0;
          break;
        case 0x11u:
          *(_DWORD *)(a1 + 164) |= 0x8000000u;
          v67 = *((_QWORD *)this + 1);
          if (v67 >= *((_QWORD *)this + 2))
          {
            v70 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v68 = v67 + 1;
            v69 = *(unsigned __int8 *)(*(_QWORD *)this + v67);
            *((_QWORD *)this + 1) = v68;
            v70 = v69 != 0;
          }
          *(_BYTE *)(a1 + 157) = v70;
          goto LABEL_267;
        case 0x12u:
          *(_DWORD *)(a1 + 164) |= 0x400000u;
          v71 = *((_QWORD *)this + 1);
          if (v71 >= *((_QWORD *)this + 2))
          {
            v74 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v72 = v71 + 1;
            v73 = *(unsigned __int8 *)(*(_QWORD *)this + v71);
            *((_QWORD *)this + 1) = v72;
            v74 = v73 != 0;
          }
          *(_BYTE *)(a1 + 152) = v74;
          goto LABEL_267;
        case 0x13u:
          *(_DWORD *)(a1 + 164) |= 0x1000000u;
          v75 = *((_QWORD *)this + 1);
          if (v75 >= *((_QWORD *)this + 2))
          {
            v78 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v76 = v75 + 1;
            v77 = *(unsigned __int8 *)(*(_QWORD *)this + v75);
            *((_QWORD *)this + 1) = v76;
            v78 = v77 != 0;
          }
          *(_BYTE *)(a1 + 154) = v78;
          goto LABEL_267;
        case 0x14u:
          *(_DWORD *)(a1 + 164) |= 0x10u;
          v79 = *((_QWORD *)this + 1);
          if (v79 > 0xFFFFFFFFFFFFFFFBLL || v79 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 80) = *(_DWORD *)(*(_QWORD *)this + v79);
          goto LABEL_265;
        case 0x15u:
          *(_DWORD *)(a1 + 164) |= 8u;
          v80 = *((_QWORD *)this + 1);
          if (v80 > 0xFFFFFFFFFFFFFFFBLL || v80 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 76) = *(_DWORD *)(*(_QWORD *)this + v80);
          goto LABEL_265;
        case 0x16u:
          *(_DWORD *)(a1 + 164) |= 4u;
          v81 = *((_QWORD *)this + 1);
          if (v81 > 0xFFFFFFFFFFFFFFFBLL || v81 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 72) = *(_DWORD *)(*(_QWORD *)this + v81);
          goto LABEL_265;
        case 0x17u:
          *(_DWORD *)(a1 + 164) |= 0x20000000u;
          v82 = *((_QWORD *)this + 1);
          if (v82 >= *((_QWORD *)this + 2))
          {
            v85 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v83 = v82 + 1;
            v84 = *(unsigned __int8 *)(*(_QWORD *)this + v82);
            *((_QWORD *)this + 1) = v83;
            v85 = v84 != 0;
          }
          *(_BYTE *)(a1 + 159) = v85;
          goto LABEL_267;
        case 0x18u:
          *(_DWORD *)(a1 + 164) |= 0x80000000;
          v86 = *((_QWORD *)this + 1);
          if (v86 >= *((_QWORD *)this + 2))
          {
            v89 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v87 = v86 + 1;
            v88 = *(unsigned __int8 *)(*(_QWORD *)this + v86);
            *((_QWORD *)this + 1) = v87;
            v89 = v88 != 0;
          }
          *(_BYTE *)(a1 + 161) = v89;
          goto LABEL_267;
        case 0x19u:
          *(_DWORD *)(a1 + 164) |= 0x800000u;
          v90 = *((_QWORD *)this + 1);
          if (v90 >= *((_QWORD *)this + 2))
          {
            v93 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v91 = v90 + 1;
            v92 = *(unsigned __int8 *)(*(_QWORD *)this + v90);
            *((_QWORD *)this + 1) = v91;
            v93 = v92 != 0;
          }
          *(_BYTE *)(a1 + 153) = v93;
          goto LABEL_267;
        case 0x1Au:
          *(_DWORD *)(a1 + 164) |= 0x20u;
          v94 = *((_QWORD *)this + 1);
          if (v94 > 0xFFFFFFFFFFFFFFFBLL || v94 + 4 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_DWORD *)(a1 + 84) = *(_DWORD *)(*(_QWORD *)this + v94);
          goto LABEL_265;
        case 0x1Bu:
          *(_DWORD *)(a1 + 164) |= 0x40000u;
          v95 = *((_QWORD *)this + 1);
          v96 = *((_QWORD *)this + 2);
          v97 = *(_QWORD *)this;
          if (v95 <= 0xFFFFFFFFFFFFFFF5 && v95 + 10 <= v96)
          {
            v98 = 0;
            v99 = 0;
            v100 = 0;
            do
            {
              v101 = v95 + 1;
              *((_QWORD *)this + 1) = v95 + 1;
              v102 = *(_BYTE *)(v97 + v95);
              v100 |= (unint64_t)(v102 & 0x7F) << v98;
              if ((v102 & 0x80) == 0)
                goto LABEL_240;
              v98 += 7;
              v95 = v101;
              v18 = v99++ > 8;
            }
            while (!v18);
LABEL_194:
            LODWORD(v100) = 0;
            goto LABEL_240;
          }
          v142 = 0;
          v143 = 0;
          v100 = 0;
          if (v96 <= v95)
            v96 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v96 == v95)
            {
              LODWORD(v100) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v144 = v95 + 1;
              v145 = *(_BYTE *)(v97 + v95);
              *((_QWORD *)this + 1) = v144;
              v100 |= (unint64_t)(v145 & 0x7F) << v142;
              if (v145 < 0)
              {
                v142 += 7;
                v95 = v144;
                v18 = v143++ > 8;
                if (v18)
                  goto LABEL_194;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v100) = 0;
            }
            break;
          }
LABEL_240:
          *(_DWORD *)(a1 + 136) = v100;
          goto LABEL_267;
        case 0x1Cu:
          *(_DWORD *)(a1 + 164) |= 0x10000000u;
          v103 = *((_QWORD *)this + 1);
          if (v103 >= *((_QWORD *)this + 2))
          {
            v106 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v104 = v103 + 1;
            v105 = *(unsigned __int8 *)(*(_QWORD *)this + v103);
            *((_QWORD *)this + 1) = v104;
            v106 = v105 != 0;
          }
          *(_BYTE *)(a1 + 158) = v106;
          goto LABEL_267;
        case 0x1Du:
          *(_DWORD *)(a1 + 164) |= 0x4000000u;
          v107 = *((_QWORD *)this + 1);
          if (v107 >= *((_QWORD *)this + 2))
          {
            v110 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v108 = v107 + 1;
            v109 = *(unsigned __int8 *)(*(_QWORD *)this + v107);
            *((_QWORD *)this + 1) = v108;
            v110 = v109 != 0;
          }
          *(_BYTE *)(a1 + 156) = v110;
          goto LABEL_267;
        case 0x1Eu:
          *(_DWORD *)(a1 + 164) |= 0x40000000u;
          v111 = *((_QWORD *)this + 1);
          if (v111 >= *((_QWORD *)this + 2))
          {
            v114 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v112 = v111 + 1;
            v113 = *(unsigned __int8 *)(*(_QWORD *)this + v111);
            *((_QWORD *)this + 1) = v112;
            v114 = v113 != 0;
          }
          *(_BYTE *)(a1 + 160) = v114;
          goto LABEL_267;
        case 0x1Fu:
          *(_DWORD *)(a1 + 164) |= 1u;
          v115 = *((_QWORD *)this + 1);
          if (v115 > 0xFFFFFFFFFFFFFFF7 || v115 + 8 > *((_QWORD *)this + 2))
            goto LABEL_263;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v115);
LABEL_153:
          v116 = *((_QWORD *)this + 1) + 8;
          goto LABEL_266;
        case 0x20u:
          *(_DWORD *)(a1 + 164) |= 0x40u;
          v117 = *((_QWORD *)this + 1);
          v118 = *((_QWORD *)this + 2);
          v119 = *(_QWORD *)this;
          if (v117 <= 0xFFFFFFFFFFFFFFF5 && v117 + 10 <= v118)
          {
            v120 = 0;
            v121 = 0;
            v122 = 0;
            do
            {
              v123 = v117 + 1;
              *((_QWORD *)this + 1) = v117 + 1;
              v124 = *(_BYTE *)(v119 + v117);
              v122 |= (unint64_t)(v124 & 0x7F) << v120;
              if ((v124 & 0x80) == 0)
                goto LABEL_243;
              v120 += 7;
              v117 = v123;
              v18 = v121++ > 8;
            }
            while (!v18);
LABEL_207:
            LODWORD(v122) = 0;
            goto LABEL_243;
          }
          v146 = 0;
          v147 = 0;
          v122 = 0;
          if (v118 <= v117)
            v118 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v118 == v117)
            {
              LODWORD(v122) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v148 = v117 + 1;
              v149 = *(_BYTE *)(v119 + v117);
              *((_QWORD *)this + 1) = v148;
              v122 |= (unint64_t)(v149 & 0x7F) << v146;
              if (v149 < 0)
              {
                v146 += 7;
                v117 = v148;
                v18 = v147++ > 8;
                if (v18)
                  goto LABEL_207;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v122) = 0;
            }
            break;
          }
LABEL_243:
          *(_DWORD *)(a1 + 88) = v122;
          goto LABEL_267;
        case 0x21u:
          *(_DWORD *)(a1 + 164) |= 0x2000000u;
          v125 = *((_QWORD *)this + 1);
          if (v125 >= *((_QWORD *)this + 2))
          {
            v128 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v126 = v125 + 1;
            v127 = *(unsigned __int8 *)(*(_QWORD *)this + v125);
            *((_QWORD *)this + 1) = v126;
            v128 = v127 != 0;
          }
          *(_BYTE *)(a1 + 155) = v128;
          goto LABEL_267;
        case 0x22u:
          *(_DWORD *)(a1 + 164) |= 0x20000u;
          v129 = *((_QWORD *)this + 1);
          v130 = *((_QWORD *)this + 2);
          v131 = *(_QWORD *)this;
          if (v129 <= 0xFFFFFFFFFFFFFFF5 && v129 + 10 <= v130)
          {
            v132 = 0;
            v133 = 0;
            v134 = 0;
            do
            {
              v135 = v129 + 1;
              *((_QWORD *)this + 1) = v129 + 1;
              v136 = *(_BYTE *)(v131 + v129);
              v134 |= (unint64_t)(v136 & 0x7F) << v132;
              if ((v136 & 0x80) == 0)
                goto LABEL_246;
              v132 += 7;
              v129 = v135;
              v18 = v133++ > 8;
            }
            while (!v18);
LABEL_216:
            LODWORD(v134) = 0;
            goto LABEL_246;
          }
          v150 = 0;
          v151 = 0;
          v134 = 0;
          if (v130 <= v129)
            v130 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v130 == v129)
            {
              LODWORD(v134) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v152 = v129 + 1;
              v153 = *(_BYTE *)(v131 + v129);
              *((_QWORD *)this + 1) = v152;
              v134 |= (unint64_t)(v153 & 0x7F) << v150;
              if (v153 < 0)
              {
                v150 += 7;
                v129 = v152;
                v18 = v151++ > 8;
                if (v18)
                  goto LABEL_216;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v134) = 0;
            }
            break;
          }
LABEL_246:
          *(_DWORD *)(a1 + 132) = v134;
          goto LABEL_267;
        default:
          if ((PB::Reader::skip(this) & 1) == 0)
            return 0;
          goto LABEL_267;
      }
    }
    v19 = 0;
    v20 = 0;
    v15 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v21 = v2 + 1;
      v22 = *(_BYTE *)(v12 + v2);
      *((_QWORD *)this + 1) = v21;
      v15 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0)
        goto LABEL_21;
      v19 += 7;
      v2 = v21;
      if (v20++ >= 9)
      {
LABEL_20:
        v15 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B86BF48(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  int v4;
  float *v5;
  float *v6;
  float v7;
  float *v8;
  float *v9;
  float v10;
  int v11;

  v3 = result;
  v4 = *(_DWORD *)(result + 164);
  if ((v4 & 2) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 64));
    v4 = *(_DWORD *)(v3 + 164);
    if ((v4 & 0x800) == 0)
    {
LABEL_3:
      if ((v4 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  else if ((v4 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(float *)(v3 + 108));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x1000) == 0)
  {
LABEL_4:
    if ((v4 & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_44;
  }
LABEL_43:
  result = PB::Writer::write(this, *(float *)(v3 + 112));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x2000) == 0)
  {
LABEL_5:
    if ((v4 & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_44:
  result = PB::Writer::write(this, *(float *)(v3 + 116));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x4000) == 0)
  {
LABEL_6:
    if ((v4 & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  result = PB::Writer::write(this, *(float *)(v3 + 120));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x8000) == 0)
  {
LABEL_7:
    if ((v4 & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  result = PB::Writer::write(this, *(float *)(v3 + 124));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x10000) == 0)
  {
LABEL_8:
    if ((v4 & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  result = PB::Writer::write(this, *(float *)(v3 + 128));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x80000) == 0)
  {
LABEL_9:
    if ((v4 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  result = PB::Writer::write(this, *(float *)(v3 + 140));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x100000) == 0)
  {
LABEL_10:
    if ((v4 & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  result = PB::Writer::write(this, *(float *)(v3 + 144));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x200000) == 0)
  {
LABEL_11:
    if ((v4 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  result = PB::Writer::write(this, *(float *)(v3 + 148));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x100) == 0)
  {
LABEL_12:
    if ((v4 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_52;
  }
LABEL_51:
  result = PB::Writer::write(this, *(float *)(v3 + 96));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x200) == 0)
  {
LABEL_13:
    if ((v4 & 0x400) == 0)
      goto LABEL_14;
LABEL_53:
    result = PB::Writer::write(this, *(float *)(v3 + 104));
    if ((*(_DWORD *)(v3 + 164) & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_52:
  result = PB::Writer::write(this, *(float *)(v3 + 100));
  v4 = *(_DWORD *)(v3 + 164);
  if ((v4 & 0x400) != 0)
    goto LABEL_53;
LABEL_14:
  if ((v4 & 0x80) != 0)
LABEL_15:
    result = PB::Writer::write(this, *(float *)(v3 + 92));
LABEL_16:
  v5 = *(float **)(v3 + 32);
  v6 = *(float **)(v3 + 40);
  while (v5 != v6)
  {
    v7 = *v5++;
    result = PB::Writer::write(this, v7);
  }
  v8 = *(float **)(v3 + 8);
  v9 = *(float **)(v3 + 16);
  while (v8 != v9)
  {
    v10 = *v8++;
    result = PB::Writer::write(this, v10);
  }
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x8000000) != 0)
  {
    result = PB::Writer::write(this);
    v11 = *(_DWORD *)(v3 + 164);
    if ((v11 & 0x400000) == 0)
    {
LABEL_24:
      if ((v11 & 0x1000000) == 0)
        goto LABEL_25;
      goto LABEL_57;
    }
  }
  else if ((v11 & 0x400000) == 0)
  {
    goto LABEL_24;
  }
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_25:
    if ((v11 & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x10) == 0)
  {
LABEL_26:
    if ((v11 & 8) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  result = PB::Writer::write(this, *(float *)(v3 + 80));
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 8) == 0)
  {
LABEL_27:
    if ((v11 & 4) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  result = PB::Writer::write(this, *(float *)(v3 + 76));
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 4) == 0)
  {
LABEL_28:
    if ((v11 & 0x20000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  result = PB::Writer::write(this, *(float *)(v3 + 72));
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x20000000) == 0)
  {
LABEL_29:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v11 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x800000) == 0)
  {
LABEL_31:
    if ((v11 & 0x20) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x20) == 0)
  {
LABEL_32:
    if ((v11 & 0x40000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  result = PB::Writer::write(this, *(float *)(v3 + 84));
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x40000) == 0)
  {
LABEL_33:
    if ((v11 & 0x10000000) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  result = PB::Writer::writeVarInt(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x10000000) == 0)
  {
LABEL_34:
    if ((v11 & 0x4000000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_35:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_36;
    goto LABEL_68;
  }
LABEL_67:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_36:
    if ((v11 & 1) == 0)
      goto LABEL_37;
    goto LABEL_69;
  }
LABEL_68:
  result = PB::Writer::write(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 1) == 0)
  {
LABEL_37:
    if ((v11 & 0x40) == 0)
      goto LABEL_38;
    goto LABEL_70;
  }
LABEL_69:
  result = PB::Writer::write(this, *(double *)(v3 + 56));
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x40) == 0)
  {
LABEL_38:
    if ((v11 & 0x2000000) == 0)
      goto LABEL_39;
    goto LABEL_71;
  }
LABEL_70:
  result = PB::Writer::writeVarInt(this);
  v11 = *(_DWORD *)(v3 + 164);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_39:
    if ((v11 & 0x20000) == 0)
      return result;
    return PB::Writer::writeVarInt(this);
  }
LABEL_71:
  result = PB::Writer::write(this);
  if ((*(_DWORD *)(v3 + 164) & 0x20000) != 0)
    return PB::Writer::writeVarInt(this);
  return result;
}

uint64_t sub_21B86C338(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39A98;
  *(_DWORD *)(result + 48) = 0;
  return result;
}

void sub_21B86C350(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

float sub_21B86C374(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;
  uint64_t v4;
  char v5;

  *(_QWORD *)a1 = &off_24DF39A98;
  *(_DWORD *)(a1 + 48) = 0;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a2 + 8);
    v3 = 1;
    *(_WORD *)(a1 + 48) = 1;
    *(_QWORD *)(a1 + 8) = v4;
    v2 = *(_WORD *)(a2 + 48);
    if ((v2 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_5:
    LODWORD(v4) = *(_DWORD *)(a2 + 32);
    v3 |= 0x20u;
    *(_WORD *)(a1 + 48) = v3;
    *(_DWORD *)(a1 + 32) = v4;
    v2 = *(_WORD *)(a2 + 48);
  }
LABEL_6:
  if ((v2 & 2) != 0)
  {
    LODWORD(v4) = *(_DWORD *)(a2 + 16);
    v3 |= 2u;
    *(_WORD *)(a1 + 48) = v3;
    *(_DWORD *)(a1 + 16) = v4;
    v2 = *(_WORD *)(a2 + 48);
    if ((v2 & 0x10) == 0)
    {
LABEL_8:
      if ((v2 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else if ((v2 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  LODWORD(v4) = *(_DWORD *)(a2 + 28);
  v3 |= 0x10u;
  *(_WORD *)(a1 + 48) = v3;
  *(_DWORD *)(a1 + 28) = v4;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 0x40) == 0)
  {
LABEL_9:
    if ((v2 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  LODWORD(v4) = *(_DWORD *)(a2 + 36);
  v3 |= 0x40u;
  *(_WORD *)(a1 + 48) = v3;
  *(_DWORD *)(a1 + 36) = v4;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 0x80) == 0)
  {
LABEL_10:
    if ((v2 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  LODWORD(v4) = *(_DWORD *)(a2 + 40);
  v3 |= 0x80u;
  *(_WORD *)(a1 + 48) = v3;
  *(_DWORD *)(a1 + 40) = v4;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 0x100) == 0)
  {
LABEL_11:
    if ((v2 & 8) == 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  v5 = *(_BYTE *)(a2 + 44);
  v3 |= 0x100u;
  *(_WORD *)(a1 + 48) = v3;
  *(_BYTE *)(a1 + 44) = v5;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_12:
    if ((v2 & 4) == 0)
      return *(float *)&v4;
    goto LABEL_20;
  }
LABEL_19:
  LODWORD(v4) = *(_DWORD *)(a2 + 24);
  v3 |= 8u;
  *(_WORD *)(a1 + 48) = v3;
  *(_DWORD *)(a1 + 24) = v4;
  if ((*(_WORD *)(a2 + 48) & 4) == 0)
    return *(float *)&v4;
LABEL_20:
  LODWORD(v4) = *(_DWORD *)(a2 + 20);
  *(_WORD *)(a1 + 48) = v3 | 4;
  *(_DWORD *)(a1 + 20) = v4;
  return *(float *)&v4;
}

uint64_t sub_21B86C48C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  __int16 v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 2) != 0)
  {
    PB::TextFormatter::format(this, "avgRotationMax", *(float *)(a1 + 16));
    v5 = *(_WORD *)(a1 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "historicalDisturbanceDuration", *(float *)(a1 + 20));
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PB::TextFormatter::format(this, "historicalQuiescenceDuration", *(float *)(a1 + 24));
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PB::TextFormatter::format(this, "instAccelMagDiff", *(float *)(a1 + 28));
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PB::TextFormatter::format(this, "instRotationMax", *(float *)(a1 + 32));
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PB::TextFormatter::format(this, "isAvgGrav");
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
LABEL_19:
    PB::TextFormatter::format(this, "measNoiseVar", *(float *)(a1 + 40));
    if ((*(_WORD *)(a1 + 48) & 1) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_10;
  }
LABEL_18:
  PB::TextFormatter::format(this, "lpfAccelMagDiff", *(float *)(a1 + 36));
  v5 = *(_WORD *)(a1 + 48);
  if ((v5 & 0x80) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v5 & 1) != 0)
LABEL_10:
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 8));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86C5DC(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  int v20;
  BOOL v21;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + 48) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          v2 = *((_QWORD *)this + 1) + 8;
          goto LABEL_54;
        case 2u:
          *(_WORD *)(a1 + 48) |= 0x20u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_53;
        case 3u:
          *(_WORD *)(a1 + 48) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_DWORD *)(a1 + 16) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_53;
        case 4u:
          *(_WORD *)(a1 + 48) |= 0x10u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_DWORD *)(a1 + 28) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_53;
        case 5u:
          *(_WORD *)(a1 + 48) |= 0x40u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_DWORD *)(a1 + 36) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_53;
        case 6u:
          *(_WORD *)(a1 + 48) |= 0x80u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_DWORD *)(a1 + 40) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_53;
        case 7u:
          *(_WORD *)(a1 + 48) |= 0x100u;
          v2 = *((_QWORD *)this + 1);
          if (v2 >= *((_QWORD *)this + 2))
          {
            v21 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v20 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
            *((_QWORD *)this + 1) = v2;
            v21 = v20 != 0;
          }
          *(_BYTE *)(a1 + 44) = v21;
          break;
        case 8u:
          *(_WORD *)(a1 + 48) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_47;
          *(_DWORD *)(a1 + 24) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_53;
        case 9u:
          *(_WORD *)(a1 + 48) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((_QWORD *)this + 2))
          {
            *(_DWORD *)(a1 + 20) = *(_DWORD *)(*(_QWORD *)this + v2);
LABEL_53:
            v2 = *((_QWORD *)this + 1) + 4;
LABEL_54:
            *((_QWORD *)this + 1) = v2;
          }
          else
          {
LABEL_47:
            *((_BYTE *)this + 24) = 1;
          }
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B86C964(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  __int16 v4;

  v3 = result;
  v4 = *(_WORD *)(result + 48);
  if ((v4 & 1) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 8));
    v4 = *(_WORD *)(v3 + 48);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v4 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(float *)(v3 + 32));
  v4 = *(_WORD *)(v3 + 48);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  result = PB::Writer::write(this, *(float *)(v3 + 16));
  v4 = *(_WORD *)(v3 + 48);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  result = PB::Writer::write(this, *(float *)(v3 + 28));
  v4 = *(_WORD *)(v3 + 48);
  if ((v4 & 0x40) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  result = PB::Writer::write(this, *(float *)(v3 + 36));
  v4 = *(_WORD *)(v3 + 48);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  result = PB::Writer::write(this, *(float *)(v3 + 40));
  v4 = *(_WORD *)(v3 + 48);
  if ((v4 & 0x100) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  result = PB::Writer::write(this);
  v4 = *(_WORD *)(v3 + 48);
  if ((v4 & 8) == 0)
  {
LABEL_9:
    if ((v4 & 4) == 0)
      return result;
    return PB::Writer::write(this, *(float *)(v3 + 20));
  }
LABEL_18:
  result = PB::Writer::write(this, *(float *)(v3 + 24));
  if ((*(_WORD *)(v3 + 48) & 4) != 0)
    return PB::Writer::write(this, *(float *)(v3 + 20));
  return result;
}

uint64_t sub_21B86CA84(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39AD0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 20) = 0;
  return result;
}

void sub_21B86CA98(PB::Base *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_24DF39AD0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

void sub_21B86CAD8(PB::Base *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_24DF39AD0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x220766390);
}

uint64_t sub_21B86CB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  *(_QWORD *)a1 = &off_24DF39AD0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 20) = 0;
  if (*(_QWORD *)(a2 + 8))
  {
    v4 = operator new();
    v5 = sub_21B7AC098(v4, *(_QWORD *)(a2 + 8));
    v6 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  if ((*(_BYTE *)(a2 + 20) & 1) != 0)
  {
    v7 = *(_BYTE *)(a2 + 16);
    *(_BYTE *)(a1 + 20) |= 1u;
    *(_BYTE *)(a1 + 16) = v7;
  }
  return a1;
}

uint64_t sub_21B86CBC8(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_QWORD *)(a1 + 8);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, this, "correction");
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    PB::TextFormatter::format(this, "isAvgGrav");
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86CC34(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 1u;
        v23 = *((_QWORD *)this + 1);
        if (v23 >= *((_QWORD *)this + 2))
        {
          v26 = 0;
          *((_BYTE *)this + 24) = 1;
        }
        else
        {
          v24 = v23 + 1;
          v25 = *(unsigned __int8 *)(*(_QWORD *)this + v23);
          *((_QWORD *)this + 1) = v24;
          v26 = v25 != 0;
        }
        *(_BYTE *)(a1 + 16) = v26;
      }
      else if ((v11 >> 3) == 1)
      {
        v20 = operator new();
        v21 = sub_21B7AC368(v20);
        v22 = *(_QWORD *)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v20;
        if (v22)
        {
          (*(void (**)(uint64_t, double))(*(_QWORD *)v22 + 8))(v22, v21);
          v20 = *(_QWORD *)(a1 + 8);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v20 + 16))(v20, this) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
        result = PB::Reader::skip(this);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B86CE4C(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  const PB::Base *v4;

  v3 = result;
  v4 = *(const PB::Base **)(result + 8);
  if (v4)
    result = PB::Writer::writeSubmessage(this, v4);
  if ((*(_BYTE *)(v3 + 20) & 1) != 0)
    return PB::Writer::write(this);
  return result;
}

uint64_t sub_21B86CEA0(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39B08;
  *(_DWORD *)(result + 24) = 0;
  return result;
}

void sub_21B86CEB8(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

uint64_t sub_21B86CEDC(uint64_t result, uint64_t a2)
{
  char v2;
  char v3;
  int v4;
  char v5;
  int v6;
  int v7;
  char v8;

  *(_QWORD *)result = &off_24DF39B08;
  *(_DWORD *)(result + 24) = 0;
  v2 = *(_BYTE *)(a2 + 24);
  if ((v2 & 2) != 0)
  {
    v4 = *(_DWORD *)(a2 + 12);
    v3 = 2;
    *(_BYTE *)(result + 24) = 2;
    *(_DWORD *)(result + 12) = v4;
    v2 = *(_BYTE *)(a2 + 24);
    if ((v2 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*(_BYTE *)(a2 + 24) & 8) != 0)
  {
LABEL_5:
    v5 = *(_BYTE *)(a2 + 20);
    v3 |= 8u;
    *(_BYTE *)(result + 24) = v3;
    *(_BYTE *)(result + 20) = v5;
    v2 = *(_BYTE *)(a2 + 24);
  }
LABEL_6:
  if ((v2 & 4) != 0)
  {
    v6 = *(_DWORD *)(a2 + 16);
    v3 |= 4u;
    *(_BYTE *)(result + 24) = v3;
    *(_DWORD *)(result + 16) = v6;
    v2 = *(_BYTE *)(a2 + 24);
    if ((v2 & 1) == 0)
    {
LABEL_8:
      if ((v2 & 0x10) == 0)
        return result;
LABEL_12:
      v8 = *(_BYTE *)(a2 + 21);
      *(_BYTE *)(result + 24) = v3 | 0x10;
      *(_BYTE *)(result + 21) = v8;
      return result;
    }
  }
  else if ((v2 & 1) == 0)
  {
    goto LABEL_8;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v3 |= 1u;
  *(_BYTE *)(result + 24) = v3;
  *(_DWORD *)(result + 8) = v7;
  if ((*(_BYTE *)(a2 + 24) & 0x10) != 0)
    goto LABEL_12;
  return result;
}

uint64_t sub_21B86CF84(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 8) != 0)
  {
    PB::TextFormatter::format(this, "activeGnssSession");
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)(a1 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "currentModesOfOperation");
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    PB::TextFormatter::format(this, "hasSubscribedRhythmicClient");
    if ((*(_BYTE *)(a1 + 24) & 4) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_6;
  }
LABEL_10:
  PB::TextFormatter::format(this, "gnssModeOfOperation");
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 4) != 0)
LABEL_6:
    PB::TextFormatter::format(this, "rhythmicMode");
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86D054(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  unint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t result;
  int v27;
  BOOL v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  char v40;
  int v41;
  BOOL v42;
  char v43;
  unsigned int v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  unint64_t v53;
  char v54;

  v3 = *((_QWORD *)this + 1);
  v2 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (2)
    {
      v8 = *(_QWORD *)this;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v3 > v2)
          v2 = v3;
        while (v2 != v3)
        {
          v17 = v3 + 1;
          v18 = *(_BYTE *)(v8 + v3);
          *((_QWORD *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v3 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            v11 = 0;
            goto LABEL_20;
          }
        }
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = v3 + 1;
          *((_QWORD *)this + 1) = v3 + 1;
          v13 = *(_BYTE *)(v8 + v3);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0)
            break;
          v9 += 7;
          v3 = v12;
          v14 = v10++ > 8;
          if (v14)
            goto LABEL_19;
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_BYTE *)(a1 + 24) |= 2u;
              v20 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v21 = *(_QWORD *)this;
              if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
              {
                v43 = 0;
                v44 = 0;
                v24 = 0;
                if (v2 <= v20)
                  v3 = *((_QWORD *)this + 1);
                else
                  v3 = *((_QWORD *)this + 2);
                while (1)
                {
                  if (v3 == v20)
                  {
                    LODWORD(v24) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_81;
                  }
                  v45 = v20++;
                  v46 = *(_BYTE *)(v21 + v45);
                  *((_QWORD *)this + 1) = v20;
                  v24 |= (unint64_t)(v46 & 0x7F) << v43;
                  if ((v46 & 0x80) == 0)
                    break;
                  v43 += 7;
                  v14 = v44++ > 8;
                  if (v14)
                  {
                    LODWORD(v24) = 0;
                    goto LABEL_80;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v24) = 0;
LABEL_80:
                v3 = v45 + 1;
              }
              else
              {
                v22 = 0;
                v23 = 0;
                v24 = 0;
                do
                {
                  v3 = v20 + 1;
                  *((_QWORD *)this + 1) = v20 + 1;
                  v25 = *(_BYTE *)(v21 + v20);
                  v24 |= (unint64_t)(v25 & 0x7F) << v22;
                  if ((v25 & 0x80) == 0)
                    goto LABEL_81;
                  v22 += 7;
                  v20 = v3;
                  v14 = v23++ > 8;
                }
                while (!v14);
                LODWORD(v24) = 0;
              }
LABEL_81:
              *(_DWORD *)(a1 + 12) = v24;
              goto LABEL_92;
            case 2u:
              *(_BYTE *)(a1 + 24) |= 8u;
              v3 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              if (v3 >= v2)
              {
                v28 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v27 = *(unsigned __int8 *)(*(_QWORD *)this + v3++);
                *((_QWORD *)this + 1) = v3;
                v28 = v27 != 0;
              }
              *(_BYTE *)(a1 + 20) = v28;
              goto LABEL_92;
            case 3u:
              *(_BYTE *)(a1 + 24) |= 4u;
              v29 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v30 = *(_QWORD *)this;
              if (v29 > 0xFFFFFFFFFFFFFFF5 || v29 + 10 > v2)
              {
                v47 = 0;
                v48 = 0;
                v33 = 0;
                if (v2 <= v29)
                  v3 = *((_QWORD *)this + 1);
                else
                  v3 = *((_QWORD *)this + 2);
                while (1)
                {
                  if (v3 == v29)
                  {
                    LODWORD(v33) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_86;
                  }
                  v49 = v29++;
                  v50 = *(_BYTE *)(v30 + v49);
                  *((_QWORD *)this + 1) = v29;
                  v33 |= (unint64_t)(v50 & 0x7F) << v47;
                  if ((v50 & 0x80) == 0)
                    break;
                  v47 += 7;
                  v14 = v48++ > 8;
                  if (v14)
                  {
                    LODWORD(v33) = 0;
LABEL_85:
                    v3 = v49 + 1;
                    goto LABEL_86;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v33) = 0;
                goto LABEL_85;
              }
              v31 = 0;
              v32 = 0;
              v33 = 0;
              do
              {
                v3 = v29 + 1;
                *((_QWORD *)this + 1) = v29 + 1;
                v34 = *(_BYTE *)(v30 + v29);
                v33 |= (unint64_t)(v34 & 0x7F) << v31;
                if ((v34 & 0x80) == 0)
                  goto LABEL_86;
                v31 += 7;
                v29 = v3;
                v14 = v32++ > 8;
              }
              while (!v14);
              LODWORD(v33) = 0;
LABEL_86:
              *(_DWORD *)(a1 + 16) = v33;
              goto LABEL_92;
            case 4u:
              *(_BYTE *)(a1 + 24) |= 1u;
              v35 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v36 = *(_QWORD *)this;
              if (v35 > 0xFFFFFFFFFFFFFFF5 || v35 + 10 > v2)
              {
                v51 = 0;
                v52 = 0;
                v39 = 0;
                if (v2 <= v35)
                  v3 = *((_QWORD *)this + 1);
                else
                  v3 = *((_QWORD *)this + 2);
                while (1)
                {
                  if (v3 == v35)
                  {
                    LODWORD(v39) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_91;
                  }
                  v53 = v35++;
                  v54 = *(_BYTE *)(v36 + v53);
                  *((_QWORD *)this + 1) = v35;
                  v39 |= (unint64_t)(v54 & 0x7F) << v51;
                  if ((v54 & 0x80) == 0)
                    break;
                  v51 += 7;
                  v14 = v52++ > 8;
                  if (v14)
                  {
                    LODWORD(v39) = 0;
LABEL_90:
                    v3 = v53 + 1;
                    goto LABEL_91;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v39) = 0;
                goto LABEL_90;
              }
              v37 = 0;
              v38 = 0;
              v39 = 0;
              do
              {
                v3 = v35 + 1;
                *((_QWORD *)this + 1) = v35 + 1;
                v40 = *(_BYTE *)(v36 + v35);
                v39 |= (unint64_t)(v40 & 0x7F) << v37;
                if ((v40 & 0x80) == 0)
                  goto LABEL_91;
                v37 += 7;
                v35 = v3;
                v14 = v38++ > 8;
              }
              while (!v14);
              LODWORD(v39) = 0;
LABEL_91:
              *(_DWORD *)(a1 + 8) = v39;
LABEL_92:
              v4 = *((unsigned __int8 *)this + 24);
              if (v3 >= v2 || *((_BYTE *)this + 24))
                return v4 == 0;
              continue;
            case 5u:
              *(_BYTE *)(a1 + 24) |= 0x10u;
              v3 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              if (v3 >= v2)
              {
                v42 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v41 = *(unsigned __int8 *)(*(_QWORD *)this + v3++);
                *((_QWORD *)this + 1) = v3;
                v42 = v41 != 0;
              }
              *(_BYTE *)(a1 + 21) = v42;
              goto LABEL_92;
            default:
              result = PB::Reader::skip(this);
              if (!(_DWORD)result)
                return result;
              v3 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              goto LABEL_92;
          }
        }
        v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_21B86D504(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  char v4;

  v3 = result;
  v4 = *(_BYTE *)(result + 24);
  if ((v4 & 2) != 0)
  {
    result = PB::Writer::writeVarInt(this);
    v4 = *(_BYTE *)(v3 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)(result + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this);
  v4 = *(_BYTE *)(v3 + 24);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_BYTE *)(v3 + 24);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      return result;
    return PB::Writer::write(this);
  }
LABEL_10:
  result = PB::Writer::writeVarInt(this);
  if ((*(_BYTE *)(v3 + 24) & 0x10) != 0)
    return PB::Writer::write(this);
  return result;
}

uint64_t sub_21B86D5B4(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39B40;
  *(_DWORD *)(result + 28) = 0;
  return result;
}

void sub_21B86D5CC(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

float sub_21B86D5F0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  uint64_t v4;

  *(_QWORD *)a1 = &off_24DF39B40;
  *(_DWORD *)(a1 + 28) = 0;
  v2 = *(_BYTE *)(a2 + 28);
  if ((v2 & 1) != 0)
  {
    v4 = *(_QWORD *)(a2 + 8);
    v3 = 1;
    *(_BYTE *)(a1 + 28) = 1;
    *(_QWORD *)(a1 + 8) = v4;
    v2 = *(_BYTE *)(a2 + 28);
    if ((v2 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*(_BYTE *)(a2 + 28) & 2) != 0)
  {
LABEL_5:
    LODWORD(v4) = *(_DWORD *)(a2 + 16);
    v3 |= 2u;
    *(_BYTE *)(a1 + 28) = v3;
    *(_DWORD *)(a1 + 16) = v4;
    v2 = *(_BYTE *)(a2 + 28);
  }
LABEL_6:
  if ((v2 & 4) != 0)
  {
    LODWORD(v4) = *(_DWORD *)(a2 + 20);
    v3 |= 4u;
    *(_BYTE *)(a1 + 28) = v3;
    *(_DWORD *)(a1 + 20) = v4;
    if ((*(_BYTE *)(a2 + 28) & 8) == 0)
      return *(float *)&v4;
  }
  else if ((v2 & 8) == 0)
  {
    return *(float *)&v4;
  }
  LODWORD(v4) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = v3 | 8;
  *(_DWORD *)(a1 + 24) = v4;
  return *(float *)&v4;
}

uint64_t sub_21B86D67C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 8));
    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PB::TextFormatter::format(this, "y", *(float *)(a1 + 20));
      if ((*(_BYTE *)(a1 + 28) & 8) == 0)
        return PB::TextFormatter::endObject(this);
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)(a1 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "x", *(float *)(a1 + 16));
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 8) != 0)
LABEL_5:
    PB::TextFormatter::format(this, "z", *(float *)(a1 + 24));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86D72C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 28) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_35;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          v2 = *((_QWORD *)this + 1) + 8;
          goto LABEL_38;
        case 2u:
          *(_BYTE *)(a1 + 28) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_35;
          *(_DWORD *)(a1 + 16) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_37;
        case 3u:
          *(_BYTE *)(a1 + 28) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)this + 2))
            goto LABEL_35;
          *(_DWORD *)(a1 + 20) = *(_DWORD *)(*(_QWORD *)this + v2);
          goto LABEL_37;
        case 4u:
          *(_BYTE *)(a1 + 28) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((_QWORD *)this + 2))
          {
            *(_DWORD *)(a1 + 24) = *(_DWORD *)(*(_QWORD *)this + v2);
LABEL_37:
            v2 = *((_QWORD *)this + 1) + 4;
LABEL_38:
            *((_QWORD *)this + 1) = v2;
          }
          else
          {
LABEL_35:
            *((_BYTE *)this + 24) = 1;
          }
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B86D990(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  char v4;

  v3 = result;
  v4 = *(_BYTE *)(result + 28);
  if ((v4 & 1) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 8));
    v4 = *(_BYTE *)(v3 + 28);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)(result + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(float *)(v3 + 16));
  v4 = *(_BYTE *)(v3 + 28);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      return result;
    return PB::Writer::write(this, *(float *)(v3 + 24));
  }
LABEL_8:
  result = PB::Writer::write(this, *(float *)(v3 + 20));
  if ((*(_BYTE *)(v3 + 28) & 8) != 0)
    return PB::Writer::write(this, *(float *)(v3 + 24));
  return result;
}

uint64_t sub_21B86DA24(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39B78;
  *(_DWORD *)(result + 64) = 0;
  return result;
}

void sub_21B86DA3C(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

double sub_21B86DA60(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  double result;

  *(_QWORD *)a1 = &off_24DF39B78;
  *(_DWORD *)(a1 + 64) = 0;
  v2 = *(_BYTE *)(a2 + 64);
  if ((v2 & 2) != 0)
  {
    result = *(double *)(a2 + 16);
    v3 = 2;
    *(_BYTE *)(a1 + 64) = 2;
    *(double *)(a1 + 16) = result;
    v2 = *(_BYTE *)(a2 + 64);
    if ((v2 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*(_BYTE *)(a2 + 64) & 0x40) != 0)
  {
LABEL_5:
    result = *(double *)(a2 + 56);
    v3 |= 0x40u;
    *(_BYTE *)(a1 + 64) = v3;
    *(double *)(a1 + 56) = result;
    v2 = *(_BYTE *)(a2 + 64);
  }
LABEL_6:
  if ((v2 & 1) != 0)
  {
    result = *(double *)(a2 + 8);
    v3 |= 1u;
    *(_BYTE *)(a1 + 64) = v3;
    *(double *)(a1 + 8) = result;
    v2 = *(_BYTE *)(a2 + 64);
    if ((v2 & 4) == 0)
    {
LABEL_8:
      if ((v2 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else if ((v2 & 4) == 0)
  {
    goto LABEL_8;
  }
  result = *(double *)(a2 + 24);
  v3 |= 4u;
  *(_BYTE *)(a1 + 64) = v3;
  *(double *)(a1 + 24) = result;
  v2 = *(_BYTE *)(a2 + 64);
  if ((v2 & 0x10) == 0)
  {
LABEL_9:
    if ((v2 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_15;
  }
LABEL_14:
  result = *(double *)(a2 + 40);
  v3 |= 0x10u;
  *(_BYTE *)(a1 + 64) = v3;
  *(double *)(a1 + 40) = result;
  v2 = *(_BYTE *)(a2 + 64);
  if ((v2 & 0x20) == 0)
  {
LABEL_10:
    if ((v2 & 8) == 0)
      return result;
LABEL_16:
    result = *(double *)(a2 + 32);
    *(_BYTE *)(a1 + 64) = v3 | 8;
    *(double *)(a1 + 32) = result;
    return result;
  }
LABEL_15:
  result = *(double *)(a2 + 48);
  v3 |= 0x20u;
  *(_BYTE *)(a1 + 64) = v3;
  *(double *)(a1 + 48) = result;
  if ((*(_BYTE *)(a2 + 64) & 8) != 0)
    goto LABEL_16;
  return result;
}

uint64_t sub_21B86DB40(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "cadence", *(double *)(a1 + 8));
    v5 = *(_BYTE *)(a1 + 64);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)(a1 + 64) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 16));
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PB::TextFormatter::format(this, "swingAccelX", *(double *)(a1 + 24));
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PB::TextFormatter::format(this, "swingAccelXStandardized", *(double *)(a1 + 32));
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    PB::TextFormatter::format(this, "swingAccelZ", *(double *)(a1 + 48));
    if ((*(_BYTE *)(a1 + 64) & 0x40) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_8;
  }
LABEL_14:
  PB::TextFormatter::format(this, "swingAccelY", *(double *)(a1 + 40));
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 0x40) != 0)
LABEL_8:
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 56));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86DC50(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 64) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_44;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_46;
        case 2u:
          *(_BYTE *)(a1 + 64) |= 0x40u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_44;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_46;
        case 3u:
          *(_BYTE *)(a1 + 64) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_44;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_46;
        case 5u:
          *(_BYTE *)(a1 + 64) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_44;
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_46;
        case 6u:
          *(_BYTE *)(a1 + 64) |= 0x10u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_44;
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_46;
        case 7u:
          *(_BYTE *)(a1 + 64) |= 0x20u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_44;
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_46;
        case 8u:
          *(_BYTE *)(a1 + 64) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
          {
LABEL_44:
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_46:
            v2 = *((_QWORD *)this + 1) + 8;
            *((_QWORD *)this + 1) = v2;
          }
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B86DF54(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  char v4;

  v3 = result;
  v4 = *(_BYTE *)(result + 64);
  if ((v4 & 2) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 16));
    v4 = *(_BYTE *)(v3 + 64);
    if ((v4 & 0x40) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)(result + 64) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 56));
  v4 = *(_BYTE *)(v3 + 64);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_BYTE *)(v3 + 64);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  result = PB::Writer::write(this, *(double *)(v3 + 24));
  v4 = *(_BYTE *)(v3 + 64);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_BYTE *)(v3 + 64);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0)
      return result;
    return PB::Writer::write(this, *(double *)(v3 + 32));
  }
LABEL_14:
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  if ((*(_BYTE *)(v3 + 64) & 8) != 0)
    return PB::Writer::write(this, *(double *)(v3 + 32));
  return result;
}

uint64_t sub_21B86E03C(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39BB0;
  *(_DWORD *)(result + 120) = 0;
  return result;
}

void sub_21B86E054(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

double sub_21B86E078(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;
  double result;

  *(_QWORD *)a1 = &off_24DF39BB0;
  *(_DWORD *)(a1 + 120) = 0;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x200) != 0)
  {
    result = *(double *)(a2 + 80);
    v3 = 512;
    *(_WORD *)(a1 + 120) = 512;
    *(double *)(a1 + 80) = result;
    v2 = *(_WORD *)(a2 + 120);
    if ((v2 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*(_WORD *)(a2 + 120) & 0x2000) != 0)
  {
LABEL_5:
    result = *(double *)(a2 + 112);
    v3 |= 0x2000u;
    *(_WORD *)(a1 + 120) = v3;
    *(double *)(a1 + 112) = result;
    v2 = *(_WORD *)(a2 + 120);
  }
LABEL_6:
  if ((v2 & 0x400) != 0)
  {
    result = *(double *)(a2 + 88);
    v3 |= 0x400u;
    *(_WORD *)(a1 + 120) = v3;
    *(double *)(a1 + 88) = result;
    v2 = *(_WORD *)(a2 + 120);
    if ((v2 & 0x800) == 0)
    {
LABEL_8:
      if ((v2 & 0x1000) == 0)
        goto LABEL_9;
      goto LABEL_21;
    }
  }
  else if ((v2 & 0x800) == 0)
  {
    goto LABEL_8;
  }
  result = *(double *)(a2 + 96);
  v3 |= 0x800u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 96) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x1000) == 0)
  {
LABEL_9:
    if ((v2 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  result = *(double *)(a2 + 104);
  v3 |= 0x1000u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 104) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x40) == 0)
  {
LABEL_10:
    if ((v2 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  result = *(double *)(a2 + 56);
  v3 |= 0x40u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 56) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x80) == 0)
  {
LABEL_11:
    if ((v2 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  result = *(double *)(a2 + 64);
  v3 |= 0x80u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 64) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x100) == 0)
  {
LABEL_12:
    if ((v2 & 8) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  result = *(double *)(a2 + 72);
  v3 |= 0x100u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 72) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 8) == 0)
  {
LABEL_13:
    if ((v2 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  result = *(double *)(a2 + 32);
  v3 |= 8u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 32) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x10) == 0)
  {
LABEL_14:
    if ((v2 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  result = *(double *)(a2 + 40);
  v3 |= 0x10u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 40) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 0x20) == 0)
  {
LABEL_15:
    if ((v2 & 1) == 0)
      goto LABEL_16;
    goto LABEL_28;
  }
LABEL_27:
  result = *(double *)(a2 + 48);
  v3 |= 0x20u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 48) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 1) == 0)
  {
LABEL_16:
    if ((v2 & 2) == 0)
      goto LABEL_17;
    goto LABEL_29;
  }
LABEL_28:
  result = *(double *)(a2 + 8);
  v3 |= 1u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 8) = result;
  v2 = *(_WORD *)(a2 + 120);
  if ((v2 & 2) == 0)
  {
LABEL_17:
    if ((v2 & 4) == 0)
      return result;
LABEL_30:
    result = *(double *)(a2 + 24);
    *(_WORD *)(a1 + 120) = v3 | 4;
    *(double *)(a1 + 24) = result;
    return result;
  }
LABEL_29:
  result = *(double *)(a2 + 16);
  v3 |= 2u;
  *(_WORD *)(a1 + 120) = v3;
  *(double *)(a1 + 16) = result;
  if ((*(_WORD *)(a2 + 120) & 4) != 0)
    goto LABEL_30;
  return result;
}

uint64_t sub_21B86E21C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  __int16 v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "centerOfMassPrefiltAccelX", *(double *)(a1 + 8));
    v5 = *(_WORD *)(a1 + 120);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "centerOfMassPrefiltAccelY", *(double *)(a1 + 16));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PB::TextFormatter::format(this, "centerOfMassPrefiltAccelZ", *(double *)(a1 + 24));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PB::TextFormatter::format(this, "centripetalAccelX", *(double *)(a1 + 32));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PB::TextFormatter::format(this, "centripetalAccelY", *(double *)(a1 + 40));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PB::TextFormatter::format(this, "centripetalAccelZ", *(double *)(a1 + 48));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PB::TextFormatter::format(this, "centripetalRotationRateX", *(double *)(a1 + 56));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PB::TextFormatter::format(this, "centripetalRotationRateY", *(double *)(a1 + 64));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PB::TextFormatter::format(this, "centripetalRotationRateZ", *(double *)(a1 + 72));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 80));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PB::TextFormatter::format(this, "swingVelocityX", *(double *)(a1 + 88));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
LABEL_29:
    PB::TextFormatter::format(this, "swingVelocityZ", *(double *)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x2000) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_15;
  }
LABEL_28:
  PB::TextFormatter::format(this, "swingVelocityY", *(double *)(a1 + 96));
  v5 = *(_WORD *)(a1 + 120);
  if ((v5 & 0x1000) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v5 & 0x2000) != 0)
LABEL_15:
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 112));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86E40C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + 120) |= 0x200u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 80) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 2u:
          *(_WORD *)(a1 + 120) |= 0x2000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 112) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 3u:
          *(_WORD *)(a1 + 120) |= 0x400u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 88) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 4u:
          *(_WORD *)(a1 + 120) |= 0x800u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 96) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 5u:
          *(_WORD *)(a1 + 120) |= 0x1000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 104) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 6u:
          *(_WORD *)(a1 + 120) |= 0x40u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 7u:
          *(_WORD *)(a1 + 120) |= 0x80u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 8u:
          *(_WORD *)(a1 + 120) |= 0x100u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 72) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 9u:
          *(_WORD *)(a1 + 120) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 0xAu:
          *(_WORD *)(a1 + 120) |= 0x10u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 0xBu:
          *(_WORD *)(a1 + 120) |= 0x20u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 0xCu:
          *(_WORD *)(a1 + 120) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 0xDu:
          *(_WORD *)(a1 + 120) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_65;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_67;
        case 0xEu:
          *(_WORD *)(a1 + 120) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
          {
LABEL_65:
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_67:
            v2 = *((_QWORD *)this + 1) + 8;
            *((_QWORD *)this + 1) = v2;
          }
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B86E898(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  __int16 v4;

  v3 = result;
  v4 = *(_WORD *)(result + 120);
  if ((v4 & 0x200) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 80));
    v4 = *(_WORD *)(v3 + 120);
    if ((v4 & 0x2000) == 0)
    {
LABEL_3:
      if ((v4 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)(result + 120) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 112));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x400) == 0)
  {
LABEL_4:
    if ((v4 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  result = PB::Writer::write(this, *(double *)(v3 + 88));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x800) == 0)
  {
LABEL_5:
    if ((v4 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  result = PB::Writer::write(this, *(double *)(v3 + 96));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x1000) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  result = PB::Writer::write(this, *(double *)(v3 + 104));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  result = PB::Writer::write(this, *(double *)(v3 + 56));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  result = PB::Writer::write(this, *(double *)(v3 + 64));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x100) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  result = PB::Writer::write(this, *(double *)(v3 + 72));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x10) == 0)
  {
LABEL_11:
    if ((v4 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 0x20) == 0)
  {
LABEL_12:
    if ((v4 & 1) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 1) == 0)
  {
LABEL_13:
    if ((v4 & 2) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_WORD *)(v3 + 120);
  if ((v4 & 2) == 0)
  {
LABEL_14:
    if ((v4 & 4) == 0)
      return result;
    return PB::Writer::write(this, *(double *)(v3 + 24));
  }
LABEL_28:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  if ((*(_WORD *)(v3 + 120) & 4) != 0)
    return PB::Writer::write(this, *(double *)(v3 + 24));
  return result;
}

_QWORD *sub_21B86EA44(_QWORD *result)
{
  *result = &off_24DF39BE8;
  result[28] = 0;
  return result;
}

void sub_21B86EA5C(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

double sub_21B86EA80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  double result;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;

  *(_QWORD *)a1 = &off_24DF39BE8;
  *(_QWORD *)(a1 + 224) = 0;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x40) != 0)
  {
    result = *(double *)(a2 + 56);
    v3 = 64;
    *(_QWORD *)(a1 + 224) = 64;
    *(double *)(a1 + 56) = result;
    v2 = *(_QWORD *)(a2 + 224);
    if ((v2 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x80) != 0)
  {
LABEL_5:
    result = *(double *)(a2 + 64);
    v3 |= 0x80uLL;
    *(_QWORD *)(a1 + 224) = v3;
    *(double *)(a1 + 64) = result;
    v2 = *(_QWORD *)(a2 + 224);
  }
LABEL_6:
  if ((v2 & 0x200000000) != 0)
  {
    v5 = *(_BYTE *)(a2 + 220);
    v3 |= 0x200000000uLL;
    *(_QWORD *)(a1 + 224) = v3;
    *(_BYTE *)(a1 + 220) = v5;
    v2 = *(_QWORD *)(a2 + 224);
    if ((v2 & 2) == 0)
    {
LABEL_8:
      if ((v2 & 0x40000000) == 0)
        goto LABEL_9;
      goto LABEL_42;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_8;
  }
  result = *(double *)(a2 + 16);
  v3 |= 2uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 16) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x40000000) == 0)
  {
LABEL_9:
    if ((v2 & 0x80000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  v6 = *(_BYTE *)(a2 + 217);
  v3 |= 0x40000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_BYTE *)(a1 + 217) = v6;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x80000) == 0)
  {
LABEL_10:
    if ((v2 & 0x400000000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  result = *(double *)(a2 + 160);
  v3 |= 0x80000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 160) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x400000000) == 0)
  {
LABEL_11:
    if ((v2 & 1) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  v7 = *(_BYTE *)(a2 + 221);
  v3 |= 0x400000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_BYTE *)(a1 + 221) = v7;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 1) == 0)
  {
LABEL_12:
    if ((v2 & 0x20000000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  result = *(double *)(a2 + 8);
  v3 |= 1uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 8) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x20000000) == 0)
  {
LABEL_13:
    if ((v2 & 0x80000000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  v8 = *(_BYTE *)(a2 + 216);
  v3 |= 0x20000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_BYTE *)(a1 + 216) = v8;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x80000000) == 0)
  {
LABEL_14:
    if ((v2 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  v9 = *(_BYTE *)(a2 + 218);
  v3 |= 0x80000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_BYTE *)(a1 + 218) = v9;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x8000) == 0)
  {
LABEL_15:
    if ((v2 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  result = *(double *)(a2 + 128);
  v3 |= 0x8000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 128) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x40000) == 0)
  {
LABEL_16:
    if ((v2 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  result = *(double *)(a2 + 152);
  v3 |= 0x40000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 152) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x4000) == 0)
  {
LABEL_17:
    if ((v2 & 0x8000000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  result = *(double *)(a2 + 120);
  v3 |= 0x4000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 120) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x8000000) == 0)
  {
LABEL_18:
    if ((v2 & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  v10 = *(_DWORD *)(a2 + 208);
  v3 |= 0x8000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_DWORD *)(a1 + 208) = v10;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x4000000) == 0)
  {
LABEL_19:
    if ((v2 & 0x10000000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  v11 = *(_DWORD *)(a2 + 204);
  v3 |= 0x4000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_DWORD *)(a1 + 204) = v11;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x10000000) == 0)
  {
LABEL_20:
    if ((v2 & 0x800000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  v12 = *(_DWORD *)(a2 + 212);
  v3 |= 0x10000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_DWORD *)(a1 + 212) = v12;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x800000) == 0)
  {
LABEL_21:
    if ((v2 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  v13 = *(_DWORD *)(a2 + 192);
  v3 |= 0x800000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_DWORD *)(a1 + 192) = v13;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x1000) == 0)
  {
LABEL_22:
    if ((v2 & 0x2000000) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  result = *(double *)(a2 + 104);
  v3 |= 0x1000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 104) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x2000000) == 0)
  {
LABEL_23:
    if ((v2 & 0x1000000) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  v14 = *(_DWORD *)(a2 + 200);
  v3 |= 0x2000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_DWORD *)(a1 + 200) = v14;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x1000000) == 0)
  {
LABEL_24:
    if ((v2 & 8) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  v15 = *(_DWORD *)(a2 + 196);
  v3 |= 0x1000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_DWORD *)(a1 + 196) = v15;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 8) == 0)
  {
LABEL_25:
    if ((v2 & 4) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  result = *(double *)(a2 + 32);
  v3 |= 8uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 32) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 4) == 0)
  {
LABEL_26:
    if ((v2 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_60;
  }
LABEL_59:
  result = *(double *)(a2 + 24);
  v3 |= 4uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 24) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x10) == 0)
  {
LABEL_27:
    if ((v2 & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_61;
  }
LABEL_60:
  result = *(double *)(a2 + 40);
  v3 |= 0x10uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 40) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x100000000) == 0)
  {
LABEL_28:
    if ((v2 & 0x100) == 0)
      goto LABEL_29;
    goto LABEL_62;
  }
LABEL_61:
  v16 = *(_BYTE *)(a2 + 219);
  v3 |= 0x100000000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(_BYTE *)(a1 + 219) = v16;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x100) == 0)
  {
LABEL_29:
    if ((v2 & 0x800) == 0)
      goto LABEL_30;
    goto LABEL_63;
  }
LABEL_62:
  result = *(double *)(a2 + 72);
  v3 |= 0x100uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 72) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x800) == 0)
  {
LABEL_30:
    if ((v2 & 0x10000) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_63:
  result = *(double *)(a2 + 96);
  v3 |= 0x800uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 96) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x10000) == 0)
  {
LABEL_31:
    if ((v2 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_65;
  }
LABEL_64:
  result = *(double *)(a2 + 136);
  v3 |= 0x10000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 136) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x20000) == 0)
  {
LABEL_32:
    if ((v2 & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_66;
  }
LABEL_65:
  result = *(double *)(a2 + 144);
  v3 |= 0x20000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 144) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x20) == 0)
  {
LABEL_33:
    if ((v2 & 0x400000) == 0)
      goto LABEL_34;
    goto LABEL_67;
  }
LABEL_66:
  result = *(double *)(a2 + 48);
  v3 |= 0x20uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 48) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x400000) == 0)
  {
LABEL_34:
    if ((v2 & 0x2000) == 0)
      goto LABEL_35;
    goto LABEL_68;
  }
LABEL_67:
  result = *(double *)(a2 + 184);
  v3 |= 0x400000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 184) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x2000) == 0)
  {
LABEL_35:
    if ((v2 & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_69;
  }
LABEL_68:
  result = *(double *)(a2 + 112);
  v3 |= 0x2000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 112) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x100000) == 0)
  {
LABEL_36:
    if ((v2 & 0x200) == 0)
      goto LABEL_37;
    goto LABEL_70;
  }
LABEL_69:
  result = *(double *)(a2 + 168);
  v3 |= 0x100000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 168) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x200) == 0)
  {
LABEL_37:
    if ((v2 & 0x200000) == 0)
      goto LABEL_38;
    goto LABEL_71;
  }
LABEL_70:
  result = *(double *)(a2 + 80);
  v3 |= 0x200uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 80) = result;
  v2 = *(_QWORD *)(a2 + 224);
  if ((v2 & 0x200000) == 0)
  {
LABEL_38:
    if ((v2 & 0x400) == 0)
      return result;
LABEL_72:
    result = *(double *)(a2 + 88);
    *(_QWORD *)(a1 + 224) = v3 | 0x400;
    *(double *)(a1 + 88) = result;
    return result;
  }
LABEL_71:
  result = *(double *)(a2 + 176);
  v3 |= 0x200000uLL;
  *(_QWORD *)(a1 + 224) = v3;
  *(double *)(a1 + 176) = result;
  if ((*(_QWORD *)(a2 + 224) & 0x400) != 0)
    goto LABEL_72;
  return result;
}

uint64_t sub_21B86EE70(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "emptyField0", *(double *)(a1 + 8));
    v5 = *(_QWORD *)(a1 + 224);
    if ((v5 & 0x20000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((v5 & 0x20000000) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "emptyField1");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x800000) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "emptyField2");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "groundContactTime", *(double *)(a1 + 16));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "groundContactTimeCadence", *(double *)(a1 + 24));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "groundContactTimeGrade", *(double *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "groundContactTimeGradeSource");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "groundContactTimeGradeType");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "groundContactTimeIsValid");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  PB::TextFormatter::format(this, "groundContactTimePace", *(double *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  PB::TextFormatter::format(this, "groundContactTimeReportingStatus");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  PB::TextFormatter::format(this, "groundContactTimeUnsmoothed", *(double *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  PB::TextFormatter::format(this, "groundContactTimeWindowEndTime", *(double *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  PB::TextFormatter::format(this, "isFlat");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  PB::TextFormatter::format(this, "isFormBasedStrideLength");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  PB::TextFormatter::format(this, "strideLength", *(double *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x100) == 0)
  {
LABEL_18:
    if ((v5 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  PB::TextFormatter::format(this, "strideLengthCadence", *(double *)(a1 + 72));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x200) == 0)
  {
LABEL_19:
    if ((v5 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  PB::TextFormatter::format(this, "strideLengthGrade", *(double *)(a1 + 80));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x400) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  PB::TextFormatter::format(this, "strideLengthGradeType", *(double *)(a1 + 88));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  PB::TextFormatter::format(this, "strideLengthIsValid");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x800) == 0)
  {
LABEL_22:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  PB::TextFormatter::format(this, "strideLengthPace", *(double *)(a1 + 96));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  PB::TextFormatter::format(this, "strideLengthReportingStatus");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x1000) == 0)
  {
LABEL_24:
    if ((v5 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  PB::TextFormatter::format(this, "strideLengthUncalibrated", *(double *)(a1 + 104));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x2000) == 0)
  {
LABEL_25:
    if ((v5 & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  PB::TextFormatter::format(this, "strideLengthUnsmoothed", *(double *)(a1 + 112));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x4000) == 0)
  {
LABEL_26:
    if ((v5 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  PB::TextFormatter::format(this, "strideLengthWindowEndTime", *(double *)(a1 + 120));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x8000) == 0)
  {
LABEL_27:
    if ((v5 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 128));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x10000) == 0)
  {
LABEL_28:
    if ((v5 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  PB::TextFormatter::format(this, "verticalOscCadence", *(double *)(a1 + 136));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x20000) == 0)
  {
LABEL_29:
    if ((v5 & 0x40000) == 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  PB::TextFormatter::format(this, "verticalOscPace", *(double *)(a1 + 144));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x40000) == 0)
  {
LABEL_30:
    if ((v5 & 0x80000) == 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  PB::TextFormatter::format(this, "verticalOscWindowEndTime", *(double *)(a1 + 152));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x80000) == 0)
  {
LABEL_31:
    if ((v5 & 0x100000) == 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  PB::TextFormatter::format(this, "verticalOscillation", *(double *)(a1 + 160));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x100000) == 0)
  {
LABEL_32:
    if ((v5 & 0x200000) == 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  PB::TextFormatter::format(this, "verticalOscillationGrade", *(double *)(a1 + 168));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x200000) == 0)
  {
LABEL_33:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  PB::TextFormatter::format(this, "verticalOscillationGradeType", *(double *)(a1 + 176));
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_35;
LABEL_71:
    PB::TextFormatter::format(this, "verticalOscillationReportingStatus");
    if ((*(_QWORD *)(a1 + 224) & 0x400000) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_36;
  }
LABEL_70:
  PB::TextFormatter::format(this, "verticalOscillationIsValid");
  v5 = *(_QWORD *)(a1 + 224);
  if ((v5 & 0x10000000) != 0)
    goto LABEL_71;
LABEL_35:
  if ((v5 & 0x400000) != 0)
LABEL_36:
    PB::TextFormatter::format(this, "verticalOscillationUnsmoothed", *(double *)(a1 + 184));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B86F300(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  int v21;
  BOOL v22;
  int v23;
  BOOL v24;
  int v25;
  BOOL v26;
  int v27;
  BOOL v28;
  int v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  char v66;
  int v67;
  BOOL v68;
  char v69;
  unsigned int v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  unint64_t v83;
  char v84;
  char v85;
  unsigned int v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  unint64_t v91;
  char v92;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            v11 = 0;
            goto LABEL_20;
          }
        }
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = v2 + 1;
          *((_QWORD *)this + 1) = v2 + 1;
          v13 = *(_BYTE *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0)
            break;
          v9 += 7;
          v2 = v12;
          v14 = v10++ > 8;
          if (v14)
            goto LABEL_19;
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_QWORD *)(a1 + 224) |= 0x40uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 2u:
              *(_QWORD *)(a1 + 224) |= 0x80uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 3u:
              *(_QWORD *)(a1 + 224) |= 0x200000000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v22 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v21 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v22 = v21 != 0;
              }
              *(_BYTE *)(a1 + 220) = v22;
              goto LABEL_203;
            case 4u:
              *(_QWORD *)(a1 + 224) |= 2uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 5u:
              *(_QWORD *)(a1 + 224) |= 0x40000000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v24 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v23 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v24 = v23 != 0;
              }
              *(_BYTE *)(a1 + 217) = v24;
              goto LABEL_203;
            case 6u:
              *(_QWORD *)(a1 + 224) |= 0x80000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 160) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 7u:
              *(_QWORD *)(a1 + 224) |= 0x400000000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v26 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v25 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v26 = v25 != 0;
              }
              *(_BYTE *)(a1 + 221) = v26;
              goto LABEL_203;
            case 8u:
              *(_QWORD *)(a1 + 224) |= 1uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 9u:
              *(_QWORD *)(a1 + 224) |= 0x20000000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v28 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v27 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v28 = v27 != 0;
              }
              *(_BYTE *)(a1 + 216) = v28;
              goto LABEL_203;
            case 0xAu:
              *(_QWORD *)(a1 + 224) |= 0x80000000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v30 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v29 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v30 = v29 != 0;
              }
              *(_BYTE *)(a1 + 218) = v30;
              goto LABEL_203;
            case 0xBu:
              *(_QWORD *)(a1 + 224) |= 0x8000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 128) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0xCu:
              *(_QWORD *)(a1 + 224) |= 0x40000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 152) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0xDu:
              *(_QWORD *)(a1 + 224) |= 0x4000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 120) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0xEu:
              *(_QWORD *)(a1 + 224) |= 0x8000000uLL;
              v31 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v32 = *(_QWORD *)this;
              if (v31 > 0xFFFFFFFFFFFFFFF5 || v31 + 10 > v2)
              {
                v69 = 0;
                v70 = 0;
                v35 = 0;
                if (v2 <= v31)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v31)
                  {
                    LODWORD(v35) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_212;
                  }
                  v71 = v31++;
                  v72 = *(_BYTE *)(v32 + v71);
                  *((_QWORD *)this + 1) = v31;
                  v35 |= (unint64_t)(v72 & 0x7F) << v69;
                  if ((v72 & 0x80) == 0)
                    break;
                  v69 += 7;
                  v14 = v70++ > 8;
                  if (v14)
                  {
                    LODWORD(v35) = 0;
LABEL_211:
                    v2 = v71 + 1;
                    goto LABEL_212;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v35) = 0;
                goto LABEL_211;
              }
              v33 = 0;
              v34 = 0;
              v35 = 0;
              do
              {
                v2 = v31 + 1;
                *((_QWORD *)this + 1) = v31 + 1;
                v36 = *(_BYTE *)(v32 + v31);
                v35 |= (unint64_t)(v36 & 0x7F) << v33;
                if ((v36 & 0x80) == 0)
                  goto LABEL_212;
                v33 += 7;
                v31 = v2;
                v14 = v34++ > 8;
              }
              while (!v14);
              LODWORD(v35) = 0;
LABEL_212:
              *(_DWORD *)(a1 + 208) = v35;
              goto LABEL_203;
            case 0xFu:
              *(_QWORD *)(a1 + 224) |= 0x4000000uLL;
              v37 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v38 = *(_QWORD *)this;
              if (v37 > 0xFFFFFFFFFFFFFFF5 || v37 + 10 > v2)
              {
                v73 = 0;
                v74 = 0;
                v41 = 0;
                if (v2 <= v37)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v37)
                  {
                    LODWORD(v41) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_217;
                  }
                  v75 = v37++;
                  v76 = *(_BYTE *)(v38 + v75);
                  *((_QWORD *)this + 1) = v37;
                  v41 |= (unint64_t)(v76 & 0x7F) << v73;
                  if ((v76 & 0x80) == 0)
                    break;
                  v73 += 7;
                  v14 = v74++ > 8;
                  if (v14)
                  {
                    LODWORD(v41) = 0;
LABEL_216:
                    v2 = v75 + 1;
                    goto LABEL_217;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v41) = 0;
                goto LABEL_216;
              }
              v39 = 0;
              v40 = 0;
              v41 = 0;
              do
              {
                v2 = v37 + 1;
                *((_QWORD *)this + 1) = v37 + 1;
                v42 = *(_BYTE *)(v38 + v37);
                v41 |= (unint64_t)(v42 & 0x7F) << v39;
                if ((v42 & 0x80) == 0)
                  goto LABEL_217;
                v39 += 7;
                v37 = v2;
                v14 = v40++ > 8;
              }
              while (!v14);
              LODWORD(v41) = 0;
LABEL_217:
              *(_DWORD *)(a1 + 204) = v41;
              goto LABEL_203;
            case 0x10u:
              *(_QWORD *)(a1 + 224) |= 0x10000000uLL;
              v43 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v44 = *(_QWORD *)this;
              if (v43 > 0xFFFFFFFFFFFFFFF5 || v43 + 10 > v2)
              {
                v77 = 0;
                v78 = 0;
                v47 = 0;
                if (v2 <= v43)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v43)
                  {
                    LODWORD(v47) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_222;
                  }
                  v79 = v43++;
                  v80 = *(_BYTE *)(v44 + v79);
                  *((_QWORD *)this + 1) = v43;
                  v47 |= (unint64_t)(v80 & 0x7F) << v77;
                  if ((v80 & 0x80) == 0)
                    break;
                  v77 += 7;
                  v14 = v78++ > 8;
                  if (v14)
                  {
                    LODWORD(v47) = 0;
LABEL_221:
                    v2 = v79 + 1;
                    goto LABEL_222;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v47) = 0;
                goto LABEL_221;
              }
              v45 = 0;
              v46 = 0;
              v47 = 0;
              do
              {
                v2 = v43 + 1;
                *((_QWORD *)this + 1) = v43 + 1;
                v48 = *(_BYTE *)(v44 + v43);
                v47 |= (unint64_t)(v48 & 0x7F) << v45;
                if ((v48 & 0x80) == 0)
                  goto LABEL_222;
                v45 += 7;
                v43 = v2;
                v14 = v46++ > 8;
              }
              while (!v14);
              LODWORD(v47) = 0;
LABEL_222:
              *(_DWORD *)(a1 + 212) = v47;
              goto LABEL_203;
            case 0x11u:
              *(_QWORD *)(a1 + 224) |= 0x800000uLL;
              v49 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v50 = *(_QWORD *)this;
              if (v49 > 0xFFFFFFFFFFFFFFF5 || v49 + 10 > v2)
              {
                v81 = 0;
                v82 = 0;
                v53 = 0;
                if (v2 <= v49)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v49)
                  {
                    LODWORD(v53) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_227;
                  }
                  v83 = v49++;
                  v84 = *(_BYTE *)(v50 + v83);
                  *((_QWORD *)this + 1) = v49;
                  v53 |= (unint64_t)(v84 & 0x7F) << v81;
                  if ((v84 & 0x80) == 0)
                    break;
                  v81 += 7;
                  v14 = v82++ > 8;
                  if (v14)
                  {
                    LODWORD(v53) = 0;
LABEL_226:
                    v2 = v83 + 1;
                    goto LABEL_227;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v53) = 0;
                goto LABEL_226;
              }
              v51 = 0;
              v52 = 0;
              v53 = 0;
              do
              {
                v2 = v49 + 1;
                *((_QWORD *)this + 1) = v49 + 1;
                v54 = *(_BYTE *)(v50 + v49);
                v53 |= (unint64_t)(v54 & 0x7F) << v51;
                if ((v54 & 0x80) == 0)
                  goto LABEL_227;
                v51 += 7;
                v49 = v2;
                v14 = v52++ > 8;
              }
              while (!v14);
              LODWORD(v53) = 0;
LABEL_227:
              *(_DWORD *)(a1 + 192) = v53;
              goto LABEL_203;
            case 0x12u:
              *(_QWORD *)(a1 + 224) |= 0x1000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 104) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x13u:
              *(_QWORD *)(a1 + 224) |= 0x2000000uLL;
              v55 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v56 = *(_QWORD *)this;
              if (v55 > 0xFFFFFFFFFFFFFFF5 || v55 + 10 > v2)
              {
                v85 = 0;
                v86 = 0;
                v59 = 0;
                if (v2 <= v55)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v55)
                  {
                    LODWORD(v59) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_232;
                  }
                  v87 = v55++;
                  v88 = *(_BYTE *)(v56 + v87);
                  *((_QWORD *)this + 1) = v55;
                  v59 |= (unint64_t)(v88 & 0x7F) << v85;
                  if ((v88 & 0x80) == 0)
                    break;
                  v85 += 7;
                  v14 = v86++ > 8;
                  if (v14)
                  {
                    LODWORD(v59) = 0;
LABEL_231:
                    v2 = v87 + 1;
                    goto LABEL_232;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v59) = 0;
                goto LABEL_231;
              }
              v57 = 0;
              v58 = 0;
              v59 = 0;
              do
              {
                v2 = v55 + 1;
                *((_QWORD *)this + 1) = v55 + 1;
                v60 = *(_BYTE *)(v56 + v55);
                v59 |= (unint64_t)(v60 & 0x7F) << v57;
                if ((v60 & 0x80) == 0)
                  goto LABEL_232;
                v57 += 7;
                v55 = v2;
                v14 = v58++ > 8;
              }
              while (!v14);
              LODWORD(v59) = 0;
LABEL_232:
              *(_DWORD *)(a1 + 200) = v59;
              goto LABEL_203;
            case 0x14u:
              *(_QWORD *)(a1 + 224) |= 0x1000000uLL;
              v61 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v62 = *(_QWORD *)this;
              if (v61 > 0xFFFFFFFFFFFFFFF5 || v61 + 10 > v2)
              {
                v89 = 0;
                v90 = 0;
                v65 = 0;
                if (v2 <= v61)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v61)
                  {
                    LODWORD(v65) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_237;
                  }
                  v91 = v61++;
                  v92 = *(_BYTE *)(v62 + v91);
                  *((_QWORD *)this + 1) = v61;
                  v65 |= (unint64_t)(v92 & 0x7F) << v89;
                  if ((v92 & 0x80) == 0)
                    break;
                  v89 += 7;
                  v14 = v90++ > 8;
                  if (v14)
                  {
                    LODWORD(v65) = 0;
LABEL_236:
                    v2 = v91 + 1;
                    goto LABEL_237;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v65) = 0;
                goto LABEL_236;
              }
              v63 = 0;
              v64 = 0;
              v65 = 0;
              do
              {
                v2 = v61 + 1;
                *((_QWORD *)this + 1) = v61 + 1;
                v66 = *(_BYTE *)(v62 + v61);
                v65 |= (unint64_t)(v66 & 0x7F) << v63;
                if ((v66 & 0x80) == 0)
                  goto LABEL_237;
                v63 += 7;
                v61 = v2;
                v14 = v64++ > 8;
              }
              while (!v14);
              LODWORD(v65) = 0;
LABEL_237:
              *(_DWORD *)(a1 + 196) = v65;
LABEL_203:
              v3 = *((_QWORD *)this + 2);
              v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0)
                return v4 == 0;
              continue;
            case 0x15u:
              *(_QWORD *)(a1 + 224) |= 8uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x16u:
              *(_QWORD *)(a1 + 224) |= 4uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x17u:
              *(_QWORD *)(a1 + 224) |= 0x10uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x18u:
              *(_QWORD *)(a1 + 224) |= 0x100000000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v68 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v67 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v68 = v67 != 0;
              }
              *(_BYTE *)(a1 + 219) = v68;
              goto LABEL_203;
            case 0x19u:
              *(_QWORD *)(a1 + 224) |= 0x100uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 72) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x1Au:
              *(_QWORD *)(a1 + 224) |= 0x800uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 96) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x1Bu:
              *(_QWORD *)(a1 + 224) |= 0x10000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 136) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x1Cu:
              *(_QWORD *)(a1 + 224) |= 0x20000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 144) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x1Du:
              *(_QWORD *)(a1 + 224) |= 0x20uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x1Eu:
              *(_QWORD *)(a1 + 224) |= 0x400000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 184) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x1Fu:
              *(_QWORD *)(a1 + 224) |= 0x2000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 112) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x20u:
              *(_QWORD *)(a1 + 224) |= 0x100000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 168) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x21u:
              *(_QWORD *)(a1 + 224) |= 0x200uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 80) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x22u:
              *(_QWORD *)(a1 + 224) |= 0x200000uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_146;
              *(_QWORD *)(a1 + 176) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_202;
            case 0x23u:
              *(_QWORD *)(a1 + 224) |= 0x400uLL;
              v2 = *((_QWORD *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)this + 2))
              {
                *(_QWORD *)(a1 + 88) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_202:
                v2 = *((_QWORD *)this + 1) + 8;
                *((_QWORD *)this + 1) = v2;
              }
              else
              {
LABEL_146:
                *((_BYTE *)this + 24) = 1;
              }
              goto LABEL_203;
            default:
              result = PB::Reader::skip(this);
              if (!(_DWORD)result)
                return result;
              v2 = *((_QWORD *)this + 1);
              goto LABEL_203;
          }
        }
        v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_21B8700D4(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result;
  v4 = *(_QWORD *)(result + 224);
  if ((v4 & 0x40) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 56));
    v4 = *(_QWORD *)(v3 + 224);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x200000000) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((v4 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 64));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x200000000) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  result = PB::Writer::write(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x40000000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x40000000) == 0)
  {
LABEL_6:
    if ((v4 & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  result = PB::Writer::write(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x80000) == 0)
  {
LABEL_7:
    if ((v4 & 0x400000000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  result = PB::Writer::write(this, *(double *)(v3 + 160));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x400000000) == 0)
  {
LABEL_8:
    if ((v4 & 1) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  result = PB::Writer::write(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 1) == 0)
  {
LABEL_9:
    if ((v4 & 0x20000000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x20000000) == 0)
  {
LABEL_10:
    if ((v4 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  result = PB::Writer::write(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_11:
    if ((v4 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  result = PB::Writer::write(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x8000) == 0)
  {
LABEL_12:
    if ((v4 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  result = PB::Writer::write(this, *(double *)(v3 + 128));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x40000) == 0)
  {
LABEL_13:
    if ((v4 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  result = PB::Writer::write(this, *(double *)(v3 + 152));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x4000) == 0)
  {
LABEL_14:
    if ((v4 & 0x8000000) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  result = PB::Writer::write(this, *(double *)(v3 + 120));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v4 & 0x4000000) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x4000000) == 0)
  {
LABEL_16:
    if ((v4 & 0x10000000) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x10000000) == 0)
  {
LABEL_17:
    if ((v4 & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x800000) == 0)
  {
LABEL_18:
    if ((v4 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x1000) == 0)
  {
LABEL_19:
    if ((v4 & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  result = PB::Writer::write(this, *(double *)(v3 + 104));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x2000000) == 0)
  {
LABEL_20:
    if ((v4 & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v4 & 8) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 8) == 0)
  {
LABEL_22:
    if ((v4 & 4) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 4) == 0)
  {
LABEL_23:
    if ((v4 & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  result = PB::Writer::write(this, *(double *)(v3 + 24));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x10) == 0)
  {
LABEL_24:
    if ((v4 & 0x100000000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x100000000) == 0)
  {
LABEL_25:
    if ((v4 & 0x100) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  result = PB::Writer::write(this);
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x100) == 0)
  {
LABEL_26:
    if ((v4 & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  result = PB::Writer::write(this, *(double *)(v3 + 72));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x800) == 0)
  {
LABEL_27:
    if ((v4 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  result = PB::Writer::write(this, *(double *)(v3 + 96));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x10000) == 0)
  {
LABEL_28:
    if ((v4 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_64;
  }
LABEL_63:
  result = PB::Writer::write(this, *(double *)(v3 + 136));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x20000) == 0)
  {
LABEL_29:
    if ((v4 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_65;
  }
LABEL_64:
  result = PB::Writer::write(this, *(double *)(v3 + 144));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x20) == 0)
  {
LABEL_30:
    if ((v4 & 0x400000) == 0)
      goto LABEL_31;
    goto LABEL_66;
  }
LABEL_65:
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x400000) == 0)
  {
LABEL_31:
    if ((v4 & 0x2000) == 0)
      goto LABEL_32;
    goto LABEL_67;
  }
LABEL_66:
  result = PB::Writer::write(this, *(double *)(v3 + 184));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x2000) == 0)
  {
LABEL_32:
    if ((v4 & 0x100000) == 0)
      goto LABEL_33;
    goto LABEL_68;
  }
LABEL_67:
  result = PB::Writer::write(this, *(double *)(v3 + 112));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x100000) == 0)
  {
LABEL_33:
    if ((v4 & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_69;
  }
LABEL_68:
  result = PB::Writer::write(this, *(double *)(v3 + 168));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x200) == 0)
  {
LABEL_34:
    if ((v4 & 0x200000) == 0)
      goto LABEL_35;
    goto LABEL_70;
  }
LABEL_69:
  result = PB::Writer::write(this, *(double *)(v3 + 80));
  v4 = *(_QWORD *)(v3 + 224);
  if ((v4 & 0x200000) == 0)
  {
LABEL_35:
    if ((v4 & 0x400) == 0)
      return result;
    return PB::Writer::write(this, *(double *)(v3 + 88));
  }
LABEL_70:
  result = PB::Writer::write(this, *(double *)(v3 + 176));
  if ((*(_QWORD *)(v3 + 224) & 0x400) != 0)
    return PB::Writer::write(this, *(double *)(v3 + 88));
  return result;
}

uint64_t sub_21B8704CC(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39C20;
  *(_DWORD *)(result + 128) = 0;
  return result;
}

void sub_21B8704E4(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

uint64_t sub_21B870508(uint64_t result, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  int v22;
  char v23;
  char v24;
  int v25;

  *(_QWORD *)result = &off_24DF39C20;
  *(_DWORD *)(result + 128) = 0;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x40) != 0)
  {
    v4 = *(_QWORD *)(a2 + 56);
    v3 = 64;
    *(_DWORD *)(result + 128) = 64;
    *(_QWORD *)(result + 56) = v4;
    v2 = *(_DWORD *)(a2 + 128);
    if ((v2 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_5:
    v5 = *(_QWORD *)(a2 + 48);
    v3 |= 0x20u;
    *(_DWORD *)(result + 128) = v3;
    *(_QWORD *)(result + 48) = v5;
    v2 = *(_DWORD *)(a2 + 128);
  }
LABEL_6:
  if ((v2 & 0x100) != 0)
  {
    v6 = *(_QWORD *)(a2 + 72);
    v3 |= 0x100u;
    *(_DWORD *)(result + 128) = v3;
    *(_QWORD *)(result + 72) = v6;
    v2 = *(_DWORD *)(a2 + 128);
    if ((v2 & 0x100000) == 0)
    {
LABEL_8:
      if ((v2 & 0x800) == 0)
        goto LABEL_9;
      goto LABEL_29;
    }
  }
  else if ((v2 & 0x100000) == 0)
  {
    goto LABEL_8;
  }
  v7 = *(_BYTE *)(a2 + 124);
  v3 |= 0x100000u;
  *(_DWORD *)(result + 128) = v3;
  *(_BYTE *)(result + 124) = v7;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x800) == 0)
  {
LABEL_9:
    if ((v2 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v8 = *(_QWORD *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 96) = v8;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x400) == 0)
  {
LABEL_10:
    if ((v2 & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v9 = *(_QWORD *)(a2 + 88);
  v3 |= 0x400u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 88) = v9;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x2000) == 0)
  {
LABEL_11:
    if ((v2 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v10 = *(_DWORD *)(a2 + 108);
  v3 |= 0x2000u;
  *(_DWORD *)(result + 128) = v3;
  *(_DWORD *)(result + 108) = v10;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x1000) == 0)
  {
LABEL_12:
    if ((v2 & 2) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  v11 = *(_DWORD *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(result + 128) = v3;
  *(_DWORD *)(result + 104) = v11;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 2) == 0)
  {
LABEL_13:
    if ((v2 & 8) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v12 = *(_QWORD *)(a2 + 16);
  v3 |= 2u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 16) = v12;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 8) == 0)
  {
LABEL_14:
    if ((v2 & 4) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v13 = *(_QWORD *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 32) = v13;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 4) == 0)
  {
LABEL_15:
    if ((v2 & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  v14 = *(_QWORD *)(a2 + 24);
  v3 |= 4u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 24) = v14;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x80000) == 0)
  {
LABEL_16:
    if ((v2 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v15 = *(_BYTE *)(a2 + 123);
  v3 |= 0x80000u;
  *(_DWORD *)(result + 128) = v3;
  *(_BYTE *)(result + 123) = v15;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x10) == 0)
  {
LABEL_17:
    if ((v2 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  v16 = *(_QWORD *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 40) = v16;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x200) == 0)
  {
LABEL_18:
    if ((v2 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  v17 = *(_QWORD *)(a2 + 80);
  v3 |= 0x200u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 80) = v17;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x80) == 0)
  {
LABEL_19:
    if ((v2 & 1) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  v18 = *(_QWORD *)(a2 + 64);
  v3 |= 0x80u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 64) = v18;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 1) == 0)
  {
LABEL_20:
    if ((v2 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_40:
  v19 = *(_QWORD *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(result + 128) = v3;
  *(_QWORD *)(result + 8) = v19;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x200000) == 0)
  {
LABEL_21:
    if ((v2 & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_42;
  }
LABEL_41:
  v20 = *(_BYTE *)(a2 + 125);
  v3 |= 0x200000u;
  *(_DWORD *)(result + 128) = v3;
  *(_BYTE *)(result + 125) = v20;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x20000) == 0)
  {
LABEL_22:
    if ((v2 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_43;
  }
LABEL_42:
  v21 = *(_BYTE *)(a2 + 121);
  v3 |= 0x20000u;
  *(_DWORD *)(result + 128) = v3;
  *(_BYTE *)(result + 121) = v21;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x8000) == 0)
  {
LABEL_23:
    if ((v2 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_44;
  }
LABEL_43:
  v22 = *(_DWORD *)(a2 + 116);
  v3 |= 0x8000u;
  *(_DWORD *)(result + 128) = v3;
  *(_DWORD *)(result + 116) = v22;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x10000) == 0)
  {
LABEL_24:
    if ((v2 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_45;
  }
LABEL_44:
  v23 = *(_BYTE *)(a2 + 120);
  v3 |= 0x10000u;
  *(_DWORD *)(result + 128) = v3;
  *(_BYTE *)(result + 120) = v23;
  v2 = *(_DWORD *)(a2 + 128);
  if ((v2 & 0x40000) == 0)
  {
LABEL_25:
    if ((v2 & 0x4000) == 0)
      return result;
LABEL_46:
    v25 = *(_DWORD *)(a2 + 112);
    *(_DWORD *)(result + 128) = v3 | 0x4000;
    *(_DWORD *)(result + 112) = v25;
    return result;
  }
LABEL_45:
  v24 = *(_BYTE *)(a2 + 122);
  v3 |= 0x40000u;
  *(_DWORD *)(result + 128) = v3;
  *(_BYTE *)(result + 122) = v24;
  if ((*(_DWORD *)(a2 + 128) & 0x4000) != 0)
    goto LABEL_46;
  return result;
}

uint64_t sub_21B87078C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  int v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x1000) != 0)
  {
    PB::TextFormatter::format(this, "activityType");
    v5 = *(_DWORD *)(a1 + 128);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "activityTypeWithoutOverride");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  PB::TextFormatter::format(this, "currentCadence", *(double *)(a1 + 8));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  PB::TextFormatter::format(this, "currentPace", *(double *)(a1 + 16));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  PB::TextFormatter::format(this, "elevationSource");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  PB::TextFormatter::format(this, "eta", *(double *)(a1 + 24));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  PB::TextFormatter::format(this, "grade", *(double *)(a1 + 32));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  PB::TextFormatter::format(this, "gradeOnsetCounter");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "horizSpeed", *(double *)(a1 + 40));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x10000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(this, "isArmConstrainedStateValid");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x20000) == 0)
  {
LABEL_12:
    if ((v5 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "isGradeOnsetEscalated");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x40000) == 0)
  {
LABEL_13:
    if ((v5 & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "isRunning");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x80000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100000) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(this, "isValid");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x100000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(this, "isWeightSet");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x200000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(this, "isWorkoutSelected");
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "powerWattage", *(double *)(a1 + 48));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 56));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x80) == 0)
  {
LABEL_19:
    if ((v5 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "userHeight", *(double *)(a1 + 64));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x100) == 0)
  {
LABEL_20:
    if ((v5 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "userWeight", *(double *)(a1 + 72));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x200) == 0)
  {
LABEL_21:
    if ((v5 & 0x400) == 0)
      goto LABEL_22;
LABEL_45:
    PB::TextFormatter::format(this, "wLoad", *(double *)(a1 + 88));
    if ((*(_DWORD *)(a1 + 128) & 0x800) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_23;
  }
LABEL_44:
  PB::TextFormatter::format(this, "verticalSpeed", *(double *)(a1 + 80));
  v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x400) != 0)
    goto LABEL_45;
LABEL_22:
  if ((v5 & 0x800) != 0)
LABEL_23:
    PB::TextFormatter::format(this, "workrateMETs", *(double *)(a1 + 96));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B870A7C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  int v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  int v35;
  BOOL v36;
  int v37;
  BOOL v38;
  int v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  char v46;
  int v47;
  BOOL v48;
  int v49;
  BOOL v50;
  unint64_t v51;
  uint64_t v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  unint64_t v71;
  char v72;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            v11 = 0;
            goto LABEL_20;
          }
        }
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = v2 + 1;
          *((_QWORD *)this + 1) = v2 + 1;
          v13 = *(_BYTE *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0)
            break;
          v9 += 7;
          v2 = v12;
          v14 = v10++ > 8;
          if (v14)
            goto LABEL_19;
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_DWORD *)(a1 + 128) |= 0x40u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 2u:
              *(_DWORD *)(a1 + 128) |= 0x20u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 3u:
              *(_DWORD *)(a1 + 128) |= 0x100u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 72) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 4u:
              *(_DWORD *)(a1 + 128) |= 0x100000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v22 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v21 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v22 = v21 != 0;
              }
              *(_BYTE *)(a1 + 124) = v22;
              goto LABEL_162;
            case 5u:
              *(_DWORD *)(a1 + 128) |= 0x800u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 96) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 6u:
              *(_DWORD *)(a1 + 128) |= 0x400u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 88) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 7u:
              *(_DWORD *)(a1 + 128) |= 0x2000u;
              v23 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v24 = *(_QWORD *)this;
              if (v23 > 0xFFFFFFFFFFFFFFF5 || v23 + 10 > v2)
              {
                v57 = 0;
                v58 = 0;
                v27 = 0;
                if (v2 <= v23)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v23)
                  {
                    LODWORD(v27) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_146;
                  }
                  v59 = v23++;
                  v60 = *(_BYTE *)(v24 + v59);
                  *((_QWORD *)this + 1) = v23;
                  v27 |= (unint64_t)(v60 & 0x7F) << v57;
                  if ((v60 & 0x80) == 0)
                    break;
                  v57 += 7;
                  v14 = v58++ > 8;
                  if (v14)
                  {
                    LODWORD(v27) = 0;
LABEL_145:
                    v2 = v59 + 1;
                    goto LABEL_146;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v27) = 0;
                goto LABEL_145;
              }
              v25 = 0;
              v26 = 0;
              v27 = 0;
              do
              {
                v2 = v23 + 1;
                *((_QWORD *)this + 1) = v23 + 1;
                v28 = *(_BYTE *)(v24 + v23);
                v27 |= (unint64_t)(v28 & 0x7F) << v25;
                if ((v28 & 0x80) == 0)
                  goto LABEL_146;
                v25 += 7;
                v23 = v2;
                v14 = v26++ > 8;
              }
              while (!v14);
              LODWORD(v27) = 0;
LABEL_146:
              *(_DWORD *)(a1 + 108) = v27;
              goto LABEL_162;
            case 8u:
              *(_DWORD *)(a1 + 128) |= 0x1000u;
              v29 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v30 = *(_QWORD *)this;
              if (v29 > 0xFFFFFFFFFFFFFFF5 || v29 + 10 > v2)
              {
                v61 = 0;
                v62 = 0;
                v33 = 0;
                if (v2 <= v29)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v29)
                  {
                    LODWORD(v33) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_151;
                  }
                  v63 = v29++;
                  v64 = *(_BYTE *)(v30 + v63);
                  *((_QWORD *)this + 1) = v29;
                  v33 |= (unint64_t)(v64 & 0x7F) << v61;
                  if ((v64 & 0x80) == 0)
                    break;
                  v61 += 7;
                  v14 = v62++ > 8;
                  if (v14)
                  {
                    LODWORD(v33) = 0;
LABEL_150:
                    v2 = v63 + 1;
                    goto LABEL_151;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v33) = 0;
                goto LABEL_150;
              }
              v31 = 0;
              v32 = 0;
              v33 = 0;
              do
              {
                v2 = v29 + 1;
                *((_QWORD *)this + 1) = v29 + 1;
                v34 = *(_BYTE *)(v30 + v29);
                v33 |= (unint64_t)(v34 & 0x7F) << v31;
                if ((v34 & 0x80) == 0)
                  goto LABEL_151;
                v31 += 7;
                v29 = v2;
                v14 = v32++ > 8;
              }
              while (!v14);
              LODWORD(v33) = 0;
LABEL_151:
              *(_DWORD *)(a1 + 104) = v33;
              goto LABEL_162;
            case 9u:
              *(_DWORD *)(a1 + 128) |= 2u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 0xAu:
              *(_DWORD *)(a1 + 128) |= 8u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 0xBu:
              *(_DWORD *)(a1 + 128) |= 4u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 0xCu:
              *(_DWORD *)(a1 + 128) |= 0x80000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v36 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v35 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v36 = v35 != 0;
              }
              *(_BYTE *)(a1 + 123) = v36;
              goto LABEL_162;
            case 0xDu:
              *(_DWORD *)(a1 + 128) |= 0x10u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 0xEu:
              *(_DWORD *)(a1 + 128) |= 0x200u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 80) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 0xFu:
              *(_DWORD *)(a1 + 128) |= 0x80u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_141;
            case 0x10u:
              *(_DWORD *)(a1 + 128) |= 1u;
              v2 = *((_QWORD *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)this + 2))
              {
                *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_141:
                v2 = *((_QWORD *)this + 1) + 8;
                *((_QWORD *)this + 1) = v2;
              }
              else
              {
LABEL_77:
                *((_BYTE *)this + 24) = 1;
              }
              goto LABEL_162;
            case 0x11u:
              *(_DWORD *)(a1 + 128) |= 0x200000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v38 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v37 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v38 = v37 != 0;
              }
              *(_BYTE *)(a1 + 125) = v38;
              goto LABEL_162;
            case 0x12u:
              *(_DWORD *)(a1 + 128) |= 0x20000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v40 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v39 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v40 = v39 != 0;
              }
              *(_BYTE *)(a1 + 121) = v40;
              goto LABEL_162;
            case 0x13u:
              *(_DWORD *)(a1 + 128) |= 0x8000u;
              v41 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v42 = *(_QWORD *)this;
              if (v41 > 0xFFFFFFFFFFFFFFF5 || v41 + 10 > v2)
              {
                v65 = 0;
                v66 = 0;
                v45 = 0;
                if (v2 <= v41)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v41)
                  {
                    LODWORD(v45) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_156;
                  }
                  v67 = v41++;
                  v68 = *(_BYTE *)(v42 + v67);
                  *((_QWORD *)this + 1) = v41;
                  v45 |= (unint64_t)(v68 & 0x7F) << v65;
                  if ((v68 & 0x80) == 0)
                    break;
                  v65 += 7;
                  v14 = v66++ > 8;
                  if (v14)
                  {
                    LODWORD(v45) = 0;
LABEL_155:
                    v2 = v67 + 1;
                    goto LABEL_156;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v45) = 0;
                goto LABEL_155;
              }
              v43 = 0;
              v44 = 0;
              v45 = 0;
              do
              {
                v2 = v41 + 1;
                *((_QWORD *)this + 1) = v41 + 1;
                v46 = *(_BYTE *)(v42 + v41);
                v45 |= (unint64_t)(v46 & 0x7F) << v43;
                if ((v46 & 0x80) == 0)
                  goto LABEL_156;
                v43 += 7;
                v41 = v2;
                v14 = v44++ > 8;
              }
              while (!v14);
              LODWORD(v45) = 0;
LABEL_156:
              *(_DWORD *)(a1 + 116) = v45;
              goto LABEL_162;
            case 0x14u:
              *(_DWORD *)(a1 + 128) |= 0x10000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v48 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v47 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v48 = v47 != 0;
              }
              *(_BYTE *)(a1 + 120) = v48;
              goto LABEL_162;
            case 0x15u:
              *(_DWORD *)(a1 + 128) |= 0x40000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v50 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v49 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v50 = v49 != 0;
              }
              *(_BYTE *)(a1 + 122) = v50;
              goto LABEL_162;
            case 0x16u:
              *(_DWORD *)(a1 + 128) |= 0x4000u;
              v51 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v52 = *(_QWORD *)this;
              if (v51 > 0xFFFFFFFFFFFFFFF5 || v51 + 10 > v2)
              {
                v69 = 0;
                v70 = 0;
                v55 = 0;
                if (v2 <= v51)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v51)
                  {
                    LODWORD(v55) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_161;
                  }
                  v71 = v51++;
                  v72 = *(_BYTE *)(v52 + v71);
                  *((_QWORD *)this + 1) = v51;
                  v55 |= (unint64_t)(v72 & 0x7F) << v69;
                  if ((v72 & 0x80) == 0)
                    break;
                  v69 += 7;
                  v14 = v70++ > 8;
                  if (v14)
                  {
                    LODWORD(v55) = 0;
LABEL_160:
                    v2 = v71 + 1;
                    goto LABEL_161;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v55) = 0;
                goto LABEL_160;
              }
              v53 = 0;
              v54 = 0;
              v55 = 0;
              do
              {
                v2 = v51 + 1;
                *((_QWORD *)this + 1) = v51 + 1;
                v56 = *(_BYTE *)(v52 + v51);
                v55 |= (unint64_t)(v56 & 0x7F) << v53;
                if ((v56 & 0x80) == 0)
                  goto LABEL_161;
                v53 += 7;
                v51 = v2;
                v14 = v54++ > 8;
              }
              while (!v14);
              LODWORD(v55) = 0;
LABEL_161:
              *(_DWORD *)(a1 + 112) = v55;
LABEL_162:
              v3 = *((_QWORD *)this + 2);
              v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0)
                return v4 == 0;
              continue;
            default:
              result = PB::Reader::skip(this);
              if (!(_DWORD)result)
                return result;
              v2 = *((_QWORD *)this + 1);
              goto LABEL_162;
          }
        }
        v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_21B8713E0(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 128);
  if ((v4 & 0x40) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 56));
    v4 = *(_DWORD *)(v3 + 128);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v4 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x100) == 0)
  {
LABEL_4:
    if ((v4 & 0x100000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  result = PB::Writer::write(this, *(double *)(v3 + 72));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x100000) == 0)
  {
LABEL_5:
    if ((v4 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x800) == 0)
  {
LABEL_6:
    if ((v4 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  result = PB::Writer::write(this, *(double *)(v3 + 96));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x400) == 0)
  {
LABEL_7:
    if ((v4 & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  result = PB::Writer::write(this, *(double *)(v3 + 88));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x2000) == 0)
  {
LABEL_8:
    if ((v4 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x1000) == 0)
  {
LABEL_9:
    if ((v4 & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 8) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 8) == 0)
  {
LABEL_11:
    if ((v4 & 4) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 4) == 0)
  {
LABEL_12:
    if ((v4 & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  result = PB::Writer::write(this, *(double *)(v3 + 24));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80000) == 0)
  {
LABEL_13:
    if ((v4 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10) == 0)
  {
LABEL_14:
    if ((v4 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x200) == 0)
  {
LABEL_15:
    if ((v4 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  result = PB::Writer::write(this, *(double *)(v3 + 80));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x80) == 0)
  {
LABEL_16:
    if ((v4 & 1) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  result = PB::Writer::write(this, *(double *)(v3 + 64));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 1) == 0)
  {
LABEL_17:
    if ((v4 & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x200000) == 0)
  {
LABEL_18:
    if ((v4 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x20000) == 0)
  {
LABEL_19:
    if ((v4 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x8000) == 0)
  {
LABEL_20:
    if ((v4 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x10000) == 0)
  {
LABEL_21:
    if ((v4 & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 128);
  if ((v4 & 0x40000) == 0)
  {
LABEL_22:
    if ((v4 & 0x4000) == 0)
      return result;
    return PB::Writer::writeVarInt(this);
  }
LABEL_44:
  result = PB::Writer::write(this);
  if ((*(_DWORD *)(v3 + 128) & 0x4000) != 0)
    return PB::Writer::writeVarInt(this);
  return result;
}

uint64_t sub_21B87166C(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39C58;
  *(_DWORD *)(result + 48) = 0;
  return result;
}

void sub_21B871684(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

double sub_21B8716A8(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  double result;

  *(_QWORD *)a1 = &off_24DF39C58;
  *(_DWORD *)(a1 + 48) = 0;
  v2 = *(_BYTE *)(a2 + 48);
  if ((v2 & 8) != 0)
  {
    result = *(double *)(a2 + 32);
    v3 = 8;
    *(_BYTE *)(a1 + 48) = 8;
    *(double *)(a1 + 32) = result;
    v2 = *(_BYTE *)(a2 + 48);
    if ((v2 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*(_BYTE *)(a2 + 48) & 0x10) != 0)
  {
LABEL_5:
    result = *(double *)(a2 + 40);
    v3 |= 0x10u;
    *(_BYTE *)(a1 + 48) = v3;
    *(double *)(a1 + 40) = result;
    v2 = *(_BYTE *)(a2 + 48);
  }
LABEL_6:
  if ((v2 & 1) != 0)
  {
    result = *(double *)(a2 + 8);
    v3 |= 1u;
    *(_BYTE *)(a1 + 48) = v3;
    *(double *)(a1 + 8) = result;
    v2 = *(_BYTE *)(a2 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_8:
      if ((v2 & 4) == 0)
        return result;
LABEL_12:
      result = *(double *)(a2 + 24);
      *(_BYTE *)(a1 + 48) = v3 | 4;
      *(double *)(a1 + 24) = result;
      return result;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_8;
  }
  result = *(double *)(a2 + 16);
  v3 |= 2u;
  *(_BYTE *)(a1 + 48) = v3;
  *(double *)(a1 + 16) = result;
  if ((*(_BYTE *)(a2 + 48) & 4) != 0)
    goto LABEL_12;
  return result;
}

uint64_t sub_21B871750(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "primaryAxisX", *(double *)(a1 + 8));
    v5 = *(_BYTE *)(a1 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)(a1 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "primaryAxisY", *(double *)(a1 + 16));
  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 32));
    if ((*(_BYTE *)(a1 + 48) & 0x10) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_6;
  }
LABEL_10:
  PB::TextFormatter::format(this, "primaryAxisZ", *(double *)(a1 + 24));
  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 0x10) != 0)
LABEL_6:
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 40));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B871820(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 48) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_38;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_40;
        case 2u:
          *(_BYTE *)(a1 + 48) |= 0x10u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_38;
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_40;
        case 3u:
          *(_BYTE *)(a1 + 48) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_38;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_40;
        case 4u:
          *(_BYTE *)(a1 + 48) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_38;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_40;
        case 5u:
          *(_BYTE *)(a1 + 48) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)this + 2))
          {
            *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_40:
            v2 = *((_QWORD *)this + 1) + 8;
            *((_QWORD *)this + 1) = v2;
          }
          else
          {
LABEL_38:
            *((_BYTE *)this + 24) = 1;
          }
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B871AB4(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  char v4;

  v3 = result;
  v4 = *(_BYTE *)(result + 48);
  if ((v4 & 8) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 32));
    v4 = *(_BYTE *)(v3 + 48);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)(result + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_BYTE *)(v3 + 48);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_BYTE *)(v3 + 48);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 4) == 0)
      return result;
    return PB::Writer::write(this, *(double *)(v3 + 24));
  }
LABEL_10:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  if ((*(_BYTE *)(v3 + 48) & 4) != 0)
    return PB::Writer::write(this, *(double *)(v3 + 24));
  return result;
}

uint64_t sub_21B871B64(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39C90;
  *(_DWORD *)(result + 188) = 0;
  return result;
}

void sub_21B871B7C(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

uint64_t sub_21B871BA0(uint64_t result, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
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
  int v23;
  int v24;
  int v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  *(_QWORD *)result = &off_24DF39C90;
  *(_DWORD *)(result + 188) = 0;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x80000) != 0)
  {
    v4 = *(_QWORD *)(a2 + 160);
    v3 = 0x80000;
    *(_DWORD *)(result + 188) = 0x80000;
    *(_QWORD *)(result + 160) = v4;
    v2 = *(_DWORD *)(a2 + 188);
    if ((v2 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x80) != 0)
  {
LABEL_5:
    v5 = *(_QWORD *)(a2 + 64);
    v3 |= 0x80u;
    *(_DWORD *)(result + 188) = v3;
    *(_QWORD *)(result + 64) = v5;
    v2 = *(_DWORD *)(a2 + 188);
  }
LABEL_6:
  if ((v2 & 0x40000) != 0)
  {
    v6 = *(_QWORD *)(a2 + 152);
    v3 |= 0x40000u;
    *(_DWORD *)(result + 188) = v3;
    *(_QWORD *)(result + 152) = v6;
    v2 = *(_DWORD *)(a2 + 188);
    if ((v2 & 0x8000000) == 0)
    {
LABEL_8:
      if ((v2 & 0x20000) == 0)
        goto LABEL_9;
      goto LABEL_35;
    }
  }
  else if ((v2 & 0x8000000) == 0)
  {
    goto LABEL_8;
  }
  v7 = *(_BYTE *)(a2 + 184);
  v3 |= 0x8000000u;
  *(_DWORD *)(result + 188) = v3;
  *(_BYTE *)(result + 184) = v7;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x20000) == 0)
  {
LABEL_9:
    if ((v2 & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  v8 = *(_QWORD *)(a2 + 144);
  v3 |= 0x20000u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 144) = v8;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x10000) == 0)
  {
LABEL_10:
    if ((v2 & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  v9 = *(_QWORD *)(a2 + 136);
  v3 |= 0x10000u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 136) = v9;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x2000000) == 0)
  {
LABEL_11:
    if ((v2 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  v10 = *(_BYTE *)(a2 + 182);
  v3 |= 0x2000000u;
  *(_DWORD *)(result + 188) = v3;
  *(_BYTE *)(result + 182) = v10;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v2 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  v11 = *(_BYTE *)(a2 + 183);
  v3 |= 0x4000000u;
  *(_DWORD *)(result + 188) = v3;
  *(_BYTE *)(result + 183) = v11;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x40) == 0)
  {
LABEL_13:
    if ((v2 & 8) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  v12 = *(_QWORD *)(a2 + 56);
  v3 |= 0x40u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 56) = v12;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 8) == 0)
  {
LABEL_14:
    if ((v2 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  v13 = *(_QWORD *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 32) = v13;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x20) == 0)
  {
LABEL_15:
    if ((v2 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  v14 = *(_QWORD *)(a2 + 48);
  v3 |= 0x20u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 48) = v14;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x10) == 0)
  {
LABEL_16:
    if ((v2 & 1) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  v15 = *(_QWORD *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 40) = v15;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 1) == 0)
  {
LABEL_17:
    if ((v2 & 2) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  v16 = *(_QWORD *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 8) = v16;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 2) == 0)
  {
LABEL_18:
    if ((v2 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  v17 = *(_QWORD *)(a2 + 16);
  v3 |= 2u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 16) = v17;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x8000) == 0)
  {
LABEL_19:
    if ((v2 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  v18 = *(_QWORD *)(a2 + 128);
  v3 |= 0x8000u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 128) = v18;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x4000) == 0)
  {
LABEL_20:
    if ((v2 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  v19 = *(_QWORD *)(a2 + 120);
  v3 |= 0x4000u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 120) = v19;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x100) == 0)
  {
LABEL_21:
    if ((v2 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  v20 = *(_QWORD *)(a2 + 72);
  v3 |= 0x100u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 72) = v20;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x200) == 0)
  {
LABEL_22:
    if ((v2 & 4) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  v21 = *(_QWORD *)(a2 + 80);
  v3 |= 0x200u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 80) = v21;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 4) == 0)
  {
LABEL_23:
    if ((v2 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  v22 = *(_QWORD *)(a2 + 24);
  v3 |= 4u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 24) = v22;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x400000) == 0)
  {
LABEL_24:
    if ((v2 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  v23 = *(_DWORD *)(a2 + 176);
  v3 |= 0x400000u;
  *(_DWORD *)(result + 188) = v3;
  *(_DWORD *)(result + 176) = v23;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x100000) == 0)
  {
LABEL_25:
    if ((v2 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  v24 = *(_DWORD *)(a2 + 168);
  v3 |= 0x100000u;
  *(_DWORD *)(result + 188) = v3;
  *(_DWORD *)(result + 168) = v24;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x200000) == 0)
  {
LABEL_26:
    if ((v2 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  v25 = *(_DWORD *)(a2 + 172);
  v3 |= 0x200000u;
  *(_DWORD *)(result + 188) = v3;
  *(_DWORD *)(result + 172) = v25;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x800000) == 0)
  {
LABEL_27:
    if ((v2 & 0x1000) == 0)
      goto LABEL_28;
    goto LABEL_54;
  }
LABEL_53:
  v26 = *(_BYTE *)(a2 + 180);
  v3 |= 0x800000u;
  *(_DWORD *)(result + 188) = v3;
  *(_BYTE *)(result + 180) = v26;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x1000) == 0)
  {
LABEL_28:
    if ((v2 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_55;
  }
LABEL_54:
  v27 = *(_QWORD *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 104) = v27;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x2000) == 0)
  {
LABEL_29:
    if ((v2 & 0x400) == 0)
      goto LABEL_30;
    goto LABEL_56;
  }
LABEL_55:
  v28 = *(_QWORD *)(a2 + 112);
  v3 |= 0x2000u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 112) = v28;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x400) == 0)
  {
LABEL_30:
    if ((v2 & 0x800) == 0)
      goto LABEL_31;
    goto LABEL_57;
  }
LABEL_56:
  v29 = *(_QWORD *)(a2 + 88);
  v3 |= 0x400u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 88) = v29;
  v2 = *(_DWORD *)(a2 + 188);
  if ((v2 & 0x800) == 0)
  {
LABEL_31:
    if ((v2 & 0x1000000) == 0)
      return result;
LABEL_58:
    v31 = *(_BYTE *)(a2 + 181);
    *(_DWORD *)(result + 188) = v3 | 0x1000000;
    *(_BYTE *)(result + 181) = v31;
    return result;
  }
LABEL_57:
  v30 = *(_QWORD *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(result + 188) = v3;
  *(_QWORD *)(result + 96) = v30;
  if ((*(_DWORD *)(a2 + 188) & 0x1000000) != 0)
    goto LABEL_58;
  return result;
}

uint64_t sub_21B871ECC(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  int v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "algDelay", *(double *)(a1 + 8));
    v5 = *(_DWORD *)(a1 + 188);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "biasFactor", *(double *)(a1 + 16));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "deltaCalibratedPedometerDistance", *(double *)(a1 + 24));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(this, "deltaOdometerDistance", *(double *)(a1 + 32));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "deltaOdometerTime", *(double *)(a1 + 40));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "deltaPedometerTime", *(double *)(a1 + 48));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(this, "deltaRawPedometerDistance", *(double *)(a1 + 56));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(this, "endTime", *(double *)(a1 + 64));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(this, "gestureState");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x200000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "gestureType");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x800000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "interruptFlag");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "isTrackRunOdometer");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "isValidOdometerSpeed");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "isValidPedometerSpeed");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "isValidRunningSpeed");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x100) == 0)
  {
LABEL_17:
    if ((v5 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "kalmanEpsOdometer", *(double *)(a1 + 72));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x200) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  PB::TextFormatter::format(this, "kalmanEpsPedometer", *(double *)(a1 + 80));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  PB::TextFormatter::format(this, "kalmanGainOdometer", *(double *)(a1 + 88));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x800) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  PB::TextFormatter::format(this, "kalmanGainPedometer", *(double *)(a1 + 96));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x1000) == 0)
  {
LABEL_21:
    if ((v5 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  PB::TextFormatter::format(this, "kalmanMeasurementNoiseOdometer", *(double *)(a1 + 104));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x2000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  PB::TextFormatter::format(this, "kalmanMeasurementNoisePedometer", *(double *)(a1 + 112));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x4000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  PB::TextFormatter::format(this, "kalmanProcessNoise", *(double *)(a1 + 120));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x8000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  PB::TextFormatter::format(this, "kalmanStateCovariance", *(double *)(a1 + 128));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x400000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  PB::TextFormatter::format(this, "odometerQuality");
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  PB::TextFormatter::format(this, "odometerSpeed", *(double *)(a1 + 136));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x20000) == 0)
  {
LABEL_27:
    if ((v5 & 0x40000) == 0)
      goto LABEL_28;
LABEL_57:
    PB::TextFormatter::format(this, "runningSpeed", *(double *)(a1 + 152));
    if ((*(_DWORD *)(a1 + 188) & 0x80000) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_29;
  }
LABEL_56:
  PB::TextFormatter::format(this, "pedometerSpeed", *(double *)(a1 + 144));
  v5 = *(_DWORD *)(a1 + 188);
  if ((v5 & 0x40000) != 0)
    goto LABEL_57;
LABEL_28:
  if ((v5 & 0x80000) != 0)
LABEL_29:
    PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 160));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B87227C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  int v21;
  BOOL v22;
  int v23;
  BOOL v24;
  int v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  char v44;
  int v45;
  BOOL v46;
  int v47;
  BOOL v48;
  char v49;
  unsigned int v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  unint64_t v59;
  char v60;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            v11 = 0;
            goto LABEL_20;
          }
        }
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = v2 + 1;
          *((_QWORD *)this + 1) = v2 + 1;
          v13 = *(_BYTE *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0)
            break;
          v9 += 7;
          v2 = v12;
          v14 = v10++ > 8;
          if (v14)
            goto LABEL_19;
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_DWORD *)(a1 + 188) |= 0x80000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 160) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 2u:
              *(_DWORD *)(a1 + 188) |= 0x80u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 3u:
              *(_DWORD *)(a1 + 188) |= 0x40000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 152) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 4u:
              *(_DWORD *)(a1 + 188) |= 0x8000000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v22 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v21 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v22 = v21 != 0;
              }
              *(_BYTE *)(a1 + 184) = v22;
              goto LABEL_148;
            case 5u:
              *(_DWORD *)(a1 + 188) |= 0x20000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 144) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 6u:
              *(_DWORD *)(a1 + 188) |= 0x10000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 136) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 7u:
              *(_DWORD *)(a1 + 188) |= 0x2000000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v24 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v23 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v24 = v23 != 0;
              }
              *(_BYTE *)(a1 + 182) = v24;
              goto LABEL_148;
            case 8u:
              *(_DWORD *)(a1 + 188) |= 0x4000000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v26 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v25 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v26 = v25 != 0;
              }
              *(_BYTE *)(a1 + 183) = v26;
              goto LABEL_148;
            case 9u:
              *(_DWORD *)(a1 + 188) |= 0x40u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0xAu:
              *(_DWORD *)(a1 + 188) |= 8u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0xBu:
              *(_DWORD *)(a1 + 188) |= 0x20u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0xCu:
              *(_DWORD *)(a1 + 188) |= 0x10u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0xDu:
              *(_DWORD *)(a1 + 188) |= 1u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0xEu:
              *(_DWORD *)(a1 + 188) |= 2u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0xFu:
              *(_DWORD *)(a1 + 188) |= 0x8000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 128) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x10u:
              *(_DWORD *)(a1 + 188) |= 0x4000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 120) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x11u:
              *(_DWORD *)(a1 + 188) |= 0x100u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 72) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x12u:
              *(_DWORD *)(a1 + 188) |= 0x200u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 80) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x13u:
              *(_DWORD *)(a1 + 188) |= 4u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x14u:
              *(_DWORD *)(a1 + 188) |= 0x400000u;
              v27 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v28 = *(_QWORD *)this;
              if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
              {
                v49 = 0;
                v50 = 0;
                v31 = 0;
                if (v2 <= v27)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v27)
                  {
                    LODWORD(v31) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_157;
                  }
                  v51 = v27++;
                  v52 = *(_BYTE *)(v28 + v51);
                  *((_QWORD *)this + 1) = v27;
                  v31 |= (unint64_t)(v52 & 0x7F) << v49;
                  if ((v52 & 0x80) == 0)
                    break;
                  v49 += 7;
                  v14 = v50++ > 8;
                  if (v14)
                  {
                    LODWORD(v31) = 0;
LABEL_156:
                    v2 = v51 + 1;
                    goto LABEL_157;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v31) = 0;
                goto LABEL_156;
              }
              v29 = 0;
              v30 = 0;
              v31 = 0;
              do
              {
                v2 = v27 + 1;
                *((_QWORD *)this + 1) = v27 + 1;
                v32 = *(_BYTE *)(v28 + v27);
                v31 |= (unint64_t)(v32 & 0x7F) << v29;
                if ((v32 & 0x80) == 0)
                  goto LABEL_157;
                v29 += 7;
                v27 = v2;
                v14 = v30++ > 8;
              }
              while (!v14);
              LODWORD(v31) = 0;
LABEL_157:
              *(_DWORD *)(a1 + 176) = v31;
              goto LABEL_148;
            case 0x15u:
              *(_DWORD *)(a1 + 188) |= 0x100000u;
              v33 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v34 = *(_QWORD *)this;
              if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
              {
                v53 = 0;
                v54 = 0;
                v37 = 0;
                if (v2 <= v33)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v33)
                  {
                    LODWORD(v37) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_162;
                  }
                  v55 = v33++;
                  v56 = *(_BYTE *)(v34 + v55);
                  *((_QWORD *)this + 1) = v33;
                  v37 |= (unint64_t)(v56 & 0x7F) << v53;
                  if ((v56 & 0x80) == 0)
                    break;
                  v53 += 7;
                  v14 = v54++ > 8;
                  if (v14)
                  {
                    LODWORD(v37) = 0;
LABEL_161:
                    v2 = v55 + 1;
                    goto LABEL_162;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v37) = 0;
                goto LABEL_161;
              }
              v35 = 0;
              v36 = 0;
              v37 = 0;
              do
              {
                v2 = v33 + 1;
                *((_QWORD *)this + 1) = v33 + 1;
                v38 = *(_BYTE *)(v34 + v33);
                v37 |= (unint64_t)(v38 & 0x7F) << v35;
                if ((v38 & 0x80) == 0)
                  goto LABEL_162;
                v35 += 7;
                v33 = v2;
                v14 = v36++ > 8;
              }
              while (!v14);
              LODWORD(v37) = 0;
LABEL_162:
              *(_DWORD *)(a1 + 168) = v37;
              goto LABEL_148;
            case 0x16u:
              *(_DWORD *)(a1 + 188) |= 0x200000u;
              v39 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v40 = *(_QWORD *)this;
              if (v39 > 0xFFFFFFFFFFFFFFF5 || v39 + 10 > v2)
              {
                v57 = 0;
                v58 = 0;
                v43 = 0;
                if (v2 <= v39)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v39)
                  {
                    LODWORD(v43) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_167;
                  }
                  v59 = v39++;
                  v60 = *(_BYTE *)(v40 + v59);
                  *((_QWORD *)this + 1) = v39;
                  v43 |= (unint64_t)(v60 & 0x7F) << v57;
                  if ((v60 & 0x80) == 0)
                    break;
                  v57 += 7;
                  v14 = v58++ > 8;
                  if (v14)
                  {
                    LODWORD(v43) = 0;
LABEL_166:
                    v2 = v59 + 1;
                    goto LABEL_167;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v43) = 0;
                goto LABEL_166;
              }
              v41 = 0;
              v42 = 0;
              v43 = 0;
              do
              {
                v2 = v39 + 1;
                *((_QWORD *)this + 1) = v39 + 1;
                v44 = *(_BYTE *)(v40 + v39);
                v43 |= (unint64_t)(v44 & 0x7F) << v41;
                if ((v44 & 0x80) == 0)
                  goto LABEL_167;
                v41 += 7;
                v39 = v2;
                v14 = v42++ > 8;
              }
              while (!v14);
              LODWORD(v43) = 0;
LABEL_167:
              *(_DWORD *)(a1 + 172) = v43;
LABEL_148:
              v3 = *((_QWORD *)this + 2);
              v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0)
                return v4 == 0;
              continue;
            case 0x17u:
              *(_DWORD *)(a1 + 188) |= 0x800000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v46 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v45 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v46 = v45 != 0;
              }
              *(_BYTE *)(a1 + 180) = v46;
              goto LABEL_148;
            case 0x18u:
              *(_DWORD *)(a1 + 188) |= 0x1000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 104) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x19u:
              *(_DWORD *)(a1 + 188) |= 0x2000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 112) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x1Au:
              *(_DWORD *)(a1 + 188) |= 0x400u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_112;
              *(_QWORD *)(a1 + 88) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_147;
            case 0x1Bu:
              *(_DWORD *)(a1 + 188) |= 0x800u;
              v2 = *((_QWORD *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)this + 2))
              {
                *(_QWORD *)(a1 + 96) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_147:
                v2 = *((_QWORD *)this + 1) + 8;
                *((_QWORD *)this + 1) = v2;
              }
              else
              {
LABEL_112:
                *((_BYTE *)this + 24) = 1;
              }
              goto LABEL_148;
            case 0x1Cu:
              *(_DWORD *)(a1 + 188) |= 0x1000000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v48 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v47 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v48 = v47 != 0;
              }
              *(_BYTE *)(a1 + 181) = v48;
              goto LABEL_148;
            default:
              result = PB::Reader::skip(this);
              if (!(_DWORD)result)
                return result;
              v2 = *((_QWORD *)this + 1);
              goto LABEL_148;
          }
        }
        v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_21B872C90(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 188);
  if ((v4 & 0x80000) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 160));
    v4 = *(_DWORD *)(v3 + 188);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x40000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((v4 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 64));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x40000) == 0)
  {
LABEL_4:
    if ((v4 & 0x8000000) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  result = PB::Writer::write(this, *(double *)(v3 + 152));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_5:
    if ((v4 & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x20000) == 0)
  {
LABEL_6:
    if ((v4 & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  result = PB::Writer::write(this, *(double *)(v3 + 144));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x10000) == 0)
  {
LABEL_7:
    if ((v4 & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  result = PB::Writer::write(this, *(double *)(v3 + 136));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x2000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x4000000) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x4000000) == 0)
  {
LABEL_9:
    if ((v4 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x40) == 0)
  {
LABEL_10:
    if ((v4 & 8) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  result = PB::Writer::write(this, *(double *)(v3 + 56));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 8) == 0)
  {
LABEL_11:
    if ((v4 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x20) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x10) == 0)
  {
LABEL_13:
    if ((v4 & 1) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    if ((v4 & 2) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 2) == 0)
  {
LABEL_15:
    if ((v4 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x8000) == 0)
  {
LABEL_16:
    if ((v4 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  result = PB::Writer::write(this, *(double *)(v3 + 128));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x4000) == 0)
  {
LABEL_17:
    if ((v4 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  result = PB::Writer::write(this, *(double *)(v3 + 120));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x100) == 0)
  {
LABEL_18:
    if ((v4 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  result = PB::Writer::write(this, *(double *)(v3 + 72));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x200) == 0)
  {
LABEL_19:
    if ((v4 & 4) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  result = PB::Writer::write(this, *(double *)(v3 + 80));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 4) == 0)
  {
LABEL_20:
    if ((v4 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  result = PB::Writer::write(this, *(double *)(v3 + 24));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x400000) == 0)
  {
LABEL_21:
    if ((v4 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x100000) == 0)
  {
LABEL_22:
    if ((v4 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x200000) == 0)
  {
LABEL_23:
    if ((v4 & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x800000) == 0)
  {
LABEL_24:
    if ((v4 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x1000) == 0)
  {
LABEL_25:
    if ((v4 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  result = PB::Writer::write(this, *(double *)(v3 + 104));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x2000) == 0)
  {
LABEL_26:
    if ((v4 & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_55;
  }
LABEL_54:
  result = PB::Writer::write(this, *(double *)(v3 + 112));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x400) == 0)
  {
LABEL_27:
    if ((v4 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_56;
  }
LABEL_55:
  result = PB::Writer::write(this, *(double *)(v3 + 88));
  v4 = *(_DWORD *)(v3 + 188);
  if ((v4 & 0x800) == 0)
  {
LABEL_28:
    if ((v4 & 0x1000000) == 0)
      return result;
    return PB::Writer::write(this);
  }
LABEL_56:
  result = PB::Writer::write(this, *(double *)(v3 + 96));
  if ((*(_DWORD *)(v3 + 188) & 0x1000000) != 0)
    return PB::Writer::write(this);
  return result;
}

uint64_t sub_21B872FC4(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39CC8;
  *(_DWORD *)(result + 136) = 0;
  return result;
}

void sub_21B872FDC(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

double sub_21B873000(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  double result;
  int v5;
  char v6;

  *(_QWORD *)a1 = &off_24DF39CC8;
  *(_DWORD *)(a1 + 136) = 0;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 4) != 0)
  {
    result = *(double *)(a2 + 24);
    v3 = 4;
    *(_DWORD *)(a1 + 136) = 4;
    *(double *)(a1 + 24) = result;
    v2 = *(_DWORD *)(a2 + 136);
    if ((v2 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x200) != 0)
  {
LABEL_5:
    result = *(double *)(a2 + 80);
    v3 |= 0x200u;
    *(_DWORD *)(a1 + 136) = v3;
    *(double *)(a1 + 80) = result;
    v2 = *(_DWORD *)(a2 + 136);
  }
LABEL_6:
  if ((v2 & 0x4000) != 0)
  {
    result = *(double *)(a2 + 120);
    v3 |= 0x4000u;
    *(_DWORD *)(a1 + 136) = v3;
    *(double *)(a1 + 120) = result;
    v2 = *(_DWORD *)(a2 + 136);
    if ((v2 & 0x400) == 0)
    {
LABEL_8:
      if ((v2 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_24;
    }
  }
  else if ((v2 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  result = *(double *)(a2 + 88);
  v3 |= 0x400u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 88) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x10) == 0)
  {
LABEL_9:
    if ((v2 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  result = *(double *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 40) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x20) == 0)
  {
LABEL_10:
    if ((v2 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  result = *(double *)(a2 + 48);
  v3 |= 0x20u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 48) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x80) == 0)
  {
LABEL_11:
    if ((v2 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  result = *(double *)(a2 + 64);
  v3 |= 0x80u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 64) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x40) == 0)
  {
LABEL_12:
    if ((v2 & 8) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  result = *(double *)(a2 + 56);
  v3 |= 0x40u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 56) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 8) == 0)
  {
LABEL_13:
    if ((v2 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  result = *(double *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 32) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x1000) == 0)
  {
LABEL_14:
    if ((v2 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  result = *(double *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 104) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x800) == 0)
  {
LABEL_15:
    if ((v2 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  result = *(double *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 96) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x2000) == 0)
  {
LABEL_16:
    if ((v2 & 1) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  result = *(double *)(a2 + 112);
  v3 |= 0x2000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 112) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 1) == 0)
  {
LABEL_17:
    if ((v2 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  result = *(double *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 8) = result;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x8000) == 0)
  {
LABEL_18:
    if ((v2 & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_34;
  }
LABEL_33:
  v5 = *(_DWORD *)(a2 + 128);
  v3 |= 0x8000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(_DWORD *)(a1 + 128) = v5;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x10000) == 0)
  {
LABEL_19:
    if ((v2 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_35;
  }
LABEL_34:
  v6 = *(_BYTE *)(a2 + 132);
  v3 |= 0x10000u;
  *(_DWORD *)(a1 + 136) = v3;
  *(_BYTE *)(a1 + 132) = v6;
  v2 = *(_DWORD *)(a2 + 136);
  if ((v2 & 0x100) == 0)
  {
LABEL_20:
    if ((v2 & 2) == 0)
      return result;
LABEL_36:
    result = *(double *)(a2 + 16);
    *(_DWORD *)(a1 + 136) = v3 | 2;
    *(double *)(a1 + 16) = result;
    return result;
  }
LABEL_35:
  result = *(double *)(a2 + 72);
  v3 |= 0x100u;
  *(_DWORD *)(a1 + 136) = v3;
  *(double *)(a1 + 72) = result;
  if ((*(_DWORD *)(a2 + 136) & 2) != 0)
    goto LABEL_36;
  return result;
}

uint64_t sub_21B8731F8(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  int v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x8000) != 0)
  {
    PB::TextFormatter::format(this, "algorithmType");
    v5 = *(_DWORD *)(a1 + 136);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "alpha", *(double *)(a1 + 8));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PB::TextFormatter::format(this, "cadence", *(double *)(a1 + 16));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PB::TextFormatter::format(this, "formBasedStartTime", *(double *)(a1 + 24));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PB::TextFormatter::format(this, "grade", *(double *)(a1 + 32));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PB::TextFormatter::format(this, "heightCM", *(double *)(a1 + 40));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PB::TextFormatter::format(this, "horizontalAccelMagnitudeMeanSqrt", *(double *)(a1 + 48));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PB::TextFormatter::format(this, "isValid");
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PB::TextFormatter::format(this, "rotationRateGravityProjectionMax", *(double *)(a1 + 56));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  PB::TextFormatter::format(this, "rotationRateMagnitudeMin", *(double *)(a1 + 64));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PB::TextFormatter::format(this, "speed", *(double *)(a1 + 72));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PB::TextFormatter::format(this, "speedBasedStartTime", *(double *)(a1 + 80));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PB::TextFormatter::format(this, "strideLength", *(double *)(a1 + 88));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x800) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "strideLengthFormBasedCalibrated", *(double *)(a1 + 96));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 0x2000) == 0)
      goto LABEL_17;
LABEL_35:
    PB::TextFormatter::format(this, "strideLengthSpeedBased", *(double *)(a1 + 112));
    if ((*(_DWORD *)(a1 + 136) & 0x4000) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_18;
  }
LABEL_34:
  PB::TextFormatter::format(this, "strideLengthFormBasedUncalibrated", *(double *)(a1 + 104));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x2000) != 0)
    goto LABEL_35;
LABEL_17:
  if ((v5 & 0x4000) != 0)
LABEL_18:
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 120));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B873448(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  int v27;
  BOOL v28;
  char v29;
  unsigned int v30;
  unint64_t v31;
  char v32;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (2)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)this + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          if (v16++ >= 9)
          {
LABEL_19:
            v11 = 0;
            goto LABEL_20;
          }
        }
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = v2 + 1;
          *((_QWORD *)this + 1) = v2 + 1;
          v13 = *(_BYTE *)(v8 + v2);
          v11 |= (unint64_t)(v13 & 0x7F) << v9;
          if ((v13 & 0x80) == 0)
            break;
          v9 += 7;
          v2 = v12;
          v14 = v10++ > 8;
          if (v14)
            goto LABEL_19;
        }
LABEL_20:
        if ((v11 & 7) != 4)
        {
          switch((v11 >> 3))
          {
            case 1u:
              *(_DWORD *)(a1 + 136) |= 4u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 2u:
              *(_DWORD *)(a1 + 136) |= 0x200u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 80) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 3u:
              *(_DWORD *)(a1 + 136) |= 0x4000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 120) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 4u:
              *(_DWORD *)(a1 + 136) |= 0x400u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 88) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 5u:
              *(_DWORD *)(a1 + 136) |= 0x10u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 6u:
              *(_DWORD *)(a1 + 136) |= 0x20u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 7u:
              *(_DWORD *)(a1 + 136) |= 0x80u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 8u:
              *(_DWORD *)(a1 + 136) |= 0x40u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 9u:
              *(_DWORD *)(a1 + 136) |= 8u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 0xAu:
              *(_DWORD *)(a1 + 136) |= 0x1000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 104) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 0xBu:
              *(_DWORD *)(a1 + 136) |= 0x800u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 96) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 0xCu:
              *(_DWORD *)(a1 + 136) |= 0x2000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 112) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 0xDu:
              *(_DWORD *)(a1 + 136) |= 1u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 0xEu:
              *(_DWORD *)(a1 + 136) |= 0x8000u;
              v21 = *((_QWORD *)this + 1);
              v2 = *((_QWORD *)this + 2);
              v22 = *(_QWORD *)this;
              if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v2)
              {
                v29 = 0;
                v30 = 0;
                v25 = 0;
                if (v2 <= v21)
                  v2 = *((_QWORD *)this + 1);
                while (1)
                {
                  if (v2 == v21)
                  {
                    LODWORD(v25) = 0;
                    *((_BYTE *)this + 24) = 1;
                    goto LABEL_93;
                  }
                  v31 = v21++;
                  v32 = *(_BYTE *)(v22 + v31);
                  *((_QWORD *)this + 1) = v21;
                  v25 |= (unint64_t)(v32 & 0x7F) << v29;
                  if ((v32 & 0x80) == 0)
                    break;
                  v29 += 7;
                  v14 = v30++ > 8;
                  if (v14)
                  {
                    LODWORD(v25) = 0;
LABEL_92:
                    v2 = v31 + 1;
                    goto LABEL_93;
                  }
                }
                if (*((_BYTE *)this + 24))
                  LODWORD(v25) = 0;
                goto LABEL_92;
              }
              v23 = 0;
              v24 = 0;
              v25 = 0;
              do
              {
                v2 = v21 + 1;
                *((_QWORD *)this + 1) = v21 + 1;
                v26 = *(_BYTE *)(v22 + v21);
                v25 |= (unint64_t)(v26 & 0x7F) << v23;
                if ((v26 & 0x80) == 0)
                  goto LABEL_93;
                v23 += 7;
                v21 = v2;
                v14 = v24++ > 8;
              }
              while (!v14);
              LODWORD(v25) = 0;
LABEL_93:
              *(_DWORD *)(a1 + 128) = v25;
LABEL_94:
              v3 = *((_QWORD *)this + 2);
              v4 = *((unsigned __int8 *)this + 24);
              if (v2 >= v3 || v4 != 0)
                return v4 == 0;
              continue;
            case 0xFu:
              *(_DWORD *)(a1 + 136) |= 0x10000u;
              v2 = *((_QWORD *)this + 1);
              if (v2 >= *((_QWORD *)this + 2))
              {
                v28 = 0;
                *((_BYTE *)this + 24) = 1;
              }
              else
              {
                v27 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
                *((_QWORD *)this + 1) = v2;
                v28 = v27 != 0;
              }
              *(_BYTE *)(a1 + 132) = v28;
              goto LABEL_94;
            case 0x10u:
              *(_DWORD *)(a1 + 136) |= 0x100u;
              v2 = *((_QWORD *)this + 1);
              if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
                goto LABEL_77;
              *(_QWORD *)(a1 + 72) = *(_QWORD *)(*(_QWORD *)this + v2);
              goto LABEL_88;
            case 0x11u:
              *(_DWORD *)(a1 + 136) |= 2u;
              v2 = *((_QWORD *)this + 1);
              if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)this + 2))
              {
                *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_88:
                v2 = *((_QWORD *)this + 1) + 8;
                *((_QWORD *)this + 1) = v2;
              }
              else
              {
LABEL_77:
                *((_BYTE *)this + 24) = 1;
              }
              goto LABEL_94;
            default:
              result = PB::Reader::skip(this);
              if (!(_DWORD)result)
                return result;
              v2 = *((_QWORD *)this + 1);
              goto LABEL_94;
          }
        }
        v4 = 0;
      }
      break;
    }
  }
  return v4 == 0;
}

uint64_t sub_21B873A3C(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 136);
  if ((v4 & 4) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 24));
    v4 = *(_DWORD *)(v3 + 136);
    if ((v4 & 0x200) == 0)
    {
LABEL_3:
      if ((v4 & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v4 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 80));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x4000) == 0)
  {
LABEL_4:
    if ((v4 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  result = PB::Writer::write(this, *(double *)(v3 + 120));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x400) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  result = PB::Writer::write(this, *(double *)(v3 + 88));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  result = PB::Writer::write(this, *(double *)(v3 + 64));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  result = PB::Writer::write(this, *(double *)(v3 + 56));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x1000) == 0)
  {
LABEL_11:
    if ((v4 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  result = PB::Writer::write(this, *(double *)(v3 + 104));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x800) == 0)
  {
LABEL_12:
    if ((v4 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  result = PB::Writer::write(this, *(double *)(v3 + 96));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x2000) == 0)
  {
LABEL_13:
    if ((v4 & 1) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  result = PB::Writer::write(this, *(double *)(v3 + 112));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 1) == 0)
  {
LABEL_14:
    if ((v4 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x8000) == 0)
  {
LABEL_15:
    if ((v4 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  result = PB::Writer::writeVarInt(this);
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x10000) == 0)
  {
LABEL_16:
    if ((v4 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  result = PB::Writer::write(this);
  v4 = *(_DWORD *)(v3 + 136);
  if ((v4 & 0x100) == 0)
  {
LABEL_17:
    if ((v4 & 2) == 0)
      return result;
    return PB::Writer::write(this, *(double *)(v3 + 16));
  }
LABEL_34:
  result = PB::Writer::write(this, *(double *)(v3 + 72));
  if ((*(_DWORD *)(v3 + 136) & 2) != 0)
    return PB::Writer::write(this, *(double *)(v3 + 16));
  return result;
}

uint64_t sub_21B873C3C(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39D00;
  *(_DWORD *)(result + 40) = 0;
  return result;
}

void sub_21B873C54(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

double sub_21B873C78(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  double result;

  *(_QWORD *)a1 = &off_24DF39D00;
  *(_DWORD *)(a1 + 40) = 0;
  v2 = *(_BYTE *)(a2 + 40);
  if ((v2 & 4) != 0)
  {
    result = *(double *)(a2 + 24);
    v3 = 4;
    *(_BYTE *)(a1 + 40) = 4;
    *(double *)(a1 + 24) = result;
    v2 = *(_BYTE *)(a2 + 40);
    if ((v2 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*(_BYTE *)(a2 + 40) & 8) != 0)
  {
LABEL_5:
    result = *(double *)(a2 + 32);
    v3 |= 8u;
    *(_BYTE *)(a1 + 40) = v3;
    *(double *)(a1 + 32) = result;
    v2 = *(_BYTE *)(a2 + 40);
  }
LABEL_6:
  if ((v2 & 1) == 0)
  {
    if ((v2 & 2) == 0)
      return result;
LABEL_10:
    result = *(double *)(a2 + 16);
    *(_BYTE *)(a1 + 40) = v3 | 2;
    *(double *)(a1 + 16) = result;
    return result;
  }
  result = *(double *)(a2 + 8);
  v3 |= 1u;
  *(_BYTE *)(a1 + 40) = v3;
  *(double *)(a1 + 8) = result;
  if ((*(_BYTE *)(a2 + 40) & 2) != 0)
    goto LABEL_10;
  return result;
}

uint64_t sub_21B873D04(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "displacement", *(double *)(a1 + 8));
    v5 = *(_BYTE *)(a1 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 24));
      if ((*(_BYTE *)(a1 + 40) & 8) == 0)
        return PB::TextFormatter::endObject(this);
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "endTime", *(double *)(a1 + 16));
  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 8) != 0)
LABEL_5:
    PB::TextFormatter::format(this, "timestamp", *(double *)(a1 + 32));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B873DB4(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 40) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_35;
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_37;
        case 2u:
          *(_BYTE *)(a1 + 40) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_35;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_37;
        case 3u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_35;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_37;
        case 4u:
          *(_BYTE *)(a1 + 40) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)this + 2))
          {
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_37:
            v2 = *((_QWORD *)this + 1) + 8;
            *((_QWORD *)this + 1) = v2;
          }
          else
          {
LABEL_35:
            *((_BYTE *)this + 24) = 1;
          }
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B874010(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  char v4;

  v3 = result;
  v4 = *(_BYTE *)(result + 40);
  if ((v4 & 4) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 24));
    v4 = *(_BYTE *)(v3 + 40);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)(result + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_BYTE *)(v3 + 40);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      return result;
    return PB::Writer::write(this, *(double *)(v3 + 16));
  }
LABEL_8:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  if ((*(_BYTE *)(v3 + 40) & 2) != 0)
    return PB::Writer::write(this, *(double *)(v3 + 16));
  return result;
}

uint64_t sub_21B8740A4(uint64_t result)
{
  *(_QWORD *)result = &off_24DF39D38;
  *(_DWORD *)(result + 212) = 0;
  return result;
}

void sub_21B8740BC(PB::Base *a1)
{
  PB::Base::~Base(a1);
  JUMPOUT(0x220766390);
}

uint64_t sub_21B8740E0(uint64_t result, uint64_t a2)
{
  int v2;
  int v3;
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
  uint64_t v28;
  char v29;

  *(_QWORD *)result = &off_24DF39D38;
  *(_DWORD *)(result + 212) = 0;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x40000) != 0)
  {
    v4 = *(_QWORD *)(a2 + 152);
    v3 = 0x40000;
    *(_DWORD *)(result + 212) = 0x40000;
    *(_QWORD *)(result + 152) = v4;
    v2 = *(_DWORD *)(a2 + 212);
    if ((v2 & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x4000) != 0)
  {
LABEL_5:
    v5 = *(_QWORD *)(a2 + 120);
    v3 |= 0x4000u;
    *(_DWORD *)(result + 212) = v3;
    *(_QWORD *)(result + 120) = v5;
    v2 = *(_DWORD *)(a2 + 212);
  }
LABEL_6:
  if ((v2 & 0x400) != 0)
  {
    v6 = *(_QWORD *)(a2 + 88);
    v3 |= 0x400u;
    *(_DWORD *)(result + 212) = v3;
    *(_QWORD *)(result + 88) = v6;
    v2 = *(_DWORD *)(a2 + 212);
    if ((v2 & 0x800) == 0)
    {
LABEL_8:
      if ((v2 & 0x1000) == 0)
        goto LABEL_9;
      goto LABEL_33;
    }
  }
  else if ((v2 & 0x800) == 0)
  {
    goto LABEL_8;
  }
  v7 = *(_QWORD *)(a2 + 96);
  v3 |= 0x800u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 96) = v7;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x1000) == 0)
  {
LABEL_9:
    if ((v2 & 2) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v8 = *(_QWORD *)(a2 + 104);
  v3 |= 0x1000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 104) = v8;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 2) == 0)
  {
LABEL_10:
    if ((v2 & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v9 = *(_QWORD *)(a2 + 16);
  v3 |= 2u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 16) = v9;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x1000000) == 0)
  {
LABEL_11:
    if ((v2 & 0x200000) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v10 = *(_QWORD *)(a2 + 200);
  v3 |= 0x1000000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 200) = v10;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x200000) == 0)
  {
LABEL_12:
    if ((v2 & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v11 = *(_QWORD *)(a2 + 176);
  v3 |= 0x200000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 176) = v11;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x100000) == 0)
  {
LABEL_13:
    if ((v2 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v12 = *(_QWORD *)(a2 + 168);
  v3 |= 0x100000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 168) = v12;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x20000) == 0)
  {
LABEL_14:
    if ((v2 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v13 = *(_QWORD *)(a2 + 144);
  v3 |= 0x20000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 144) = v13;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x8000) == 0)
  {
LABEL_15:
    if ((v2 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v14 = *(_QWORD *)(a2 + 128);
  v3 |= 0x8000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 128) = v14;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x200) == 0)
  {
LABEL_16:
    if ((v2 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v15 = *(_QWORD *)(a2 + 80);
  v3 |= 0x200u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 80) = v15;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x40) == 0)
  {
LABEL_17:
    if ((v2 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v16 = *(_QWORD *)(a2 + 56);
  v3 |= 0x40u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 56) = v16;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x20) == 0)
  {
LABEL_18:
    if ((v2 & 8) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v17 = *(_QWORD *)(a2 + 48);
  v3 |= 0x20u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 48) = v17;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 8) == 0)
  {
LABEL_19:
    if ((v2 & 0x800000) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v18 = *(_QWORD *)(a2 + 32);
  v3 |= 8u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 32) = v18;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x800000) == 0)
  {
LABEL_20:
    if ((v2 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v19 = *(_QWORD *)(a2 + 192);
  v3 |= 0x800000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 192) = v19;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x10) == 0)
  {
LABEL_21:
    if ((v2 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v20 = *(_QWORD *)(a2 + 40);
  v3 |= 0x10u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 40) = v20;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x2000) == 0)
  {
LABEL_22:
    if ((v2 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v21 = *(_QWORD *)(a2 + 112);
  v3 |= 0x2000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 112) = v21;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x100) == 0)
  {
LABEL_23:
    if ((v2 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  v22 = *(_QWORD *)(a2 + 72);
  v3 |= 0x100u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 72) = v22;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x10000) == 0)
  {
LABEL_24:
    if ((v2 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_48:
  v23 = *(_QWORD *)(a2 + 136);
  v3 |= 0x10000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 136) = v23;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x80) == 0)
  {
LABEL_25:
    if ((v2 & 4) == 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  v24 = *(_QWORD *)(a2 + 64);
  v3 |= 0x80u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 64) = v24;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 4) == 0)
  {
LABEL_26:
    if ((v2 & 1) == 0)
      goto LABEL_27;
    goto LABEL_51;
  }
LABEL_50:
  v25 = *(_QWORD *)(a2 + 24);
  v3 |= 4u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 24) = v25;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 1) == 0)
  {
LABEL_27:
    if ((v2 & 0x400000) == 0)
      goto LABEL_28;
    goto LABEL_52;
  }
LABEL_51:
  v26 = *(_QWORD *)(a2 + 8);
  v3 |= 1u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 8) = v26;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x400000) == 0)
  {
LABEL_28:
    if ((v2 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_53;
  }
LABEL_52:
  v27 = *(_QWORD *)(a2 + 184);
  v3 |= 0x400000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 184) = v27;
  v2 = *(_DWORD *)(a2 + 212);
  if ((v2 & 0x80000) == 0)
  {
LABEL_29:
    if ((v2 & 0x2000000) == 0)
      return result;
LABEL_54:
    v29 = *(_BYTE *)(a2 + 208);
    *(_DWORD *)(result + 212) = v3 | 0x2000000;
    *(_BYTE *)(result + 208) = v29;
    return result;
  }
LABEL_53:
  v28 = *(_QWORD *)(a2 + 160);
  v3 |= 0x80000u;
  *(_DWORD *)(result + 212) = v3;
  *(_QWORD *)(result + 160) = v28;
  if ((*(_DWORD *)(a2 + 212) & 0x2000000) != 0)
    goto LABEL_54;
  return result;
}

uint64_t sub_21B8743D4(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  int v5;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "centerOfMassAccelZAmplitudeBackwards", *(double *)(a1 + 8));
    v5 = *(_DWORD *)(a1 + 212);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "height", *(double *)(a1 + 16));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  PB::TextFormatter::format(this, "integratedAngleYg", *(double *)(a1 + 24));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  PB::TextFormatter::format(this, "integratedAngleYgBackwards", *(double *)(a1 + 32));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  PB::TextFormatter::format(this, "integratedCenterOfAccelZMaxBackwards", *(double *)(a1 + 40));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  PB::TextFormatter::format(this, "integratedRotationAxisWZ", *(double *)(a1 + 48));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  PB::TextFormatter::format(this, "integratedRotationAxisWZForwards", *(double *)(a1 + 56));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  PB::TextFormatter::format(this, "integratedRotationRateYBackwards", *(double *)(a1 + 64));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  PB::TextFormatter::format(this, "integratedUserAccelTForwards", *(double *)(a1 + 72));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  PB::TextFormatter::format(this, "integratedUserAccelY", *(double *)(a1 + 80));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  PB::TextFormatter::format(this, "integratedVelocityZ", *(double *)(a1 + 88));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  PB::TextFormatter::format(this, "integratedVelocityZBackwards", *(double *)(a1 + 96));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  PB::TextFormatter::format(this, "integratedVelocityZForwards", *(double *)(a1 + 104));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  PB::TextFormatter::format(this, "isValidPeak");
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  PB::TextFormatter::format(this, "medianCadence", *(double *)(a1 + 112));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  PB::TextFormatter::format(this, "peakTime", *(double *)(a1 + 120));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((v5 & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  PB::TextFormatter::format(this, "rotationAxisWTAmplitudeXForwards", *(double *)(a1 + 128));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x10000) == 0)
  {
LABEL_19:
    if ((v5 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  PB::TextFormatter::format(this, "rotationRateMaxZForwards", *(double *)(a1 + 136));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x20000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  PB::TextFormatter::format(this, "rotationTMaxZForwards", *(double *)(a1 + 144));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x40000) == 0)
  {
LABEL_21:
    if ((v5 & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  PB::TextFormatter::format(this, "startTime", *(double *)(a1 + 152));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x80000) == 0)
  {
LABEL_22:
    if ((v5 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  PB::TextFormatter::format(this, "strideLengthCadence", *(double *)(a1 + 160));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x100000) == 0)
  {
LABEL_23:
    if ((v5 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  PB::TextFormatter::format(this, "swingAccelAmplitudeYBackwards", *(double *)(a1 + 168));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x200000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  PB::TextFormatter::format(this, "swingAccelMeanXBackwards", *(double *)(a1 + 176));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x400000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0)
      goto LABEL_26;
LABEL_53:
    PB::TextFormatter::format(this, "userAccelTMeanXBackards", *(double *)(a1 + 192));
    if ((*(_DWORD *)(a1 + 212) & 0x1000000) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_27;
  }
LABEL_52:
  PB::TextFormatter::format(this, "swingAccelTZMean", *(double *)(a1 + 184));
  v5 = *(_DWORD *)(a1 + 212);
  if ((v5 & 0x800000) != 0)
    goto LABEL_53;
LABEL_26:
  if ((v5 & 0x1000000) != 0)
LABEL_27:
    PB::TextFormatter::format(this, "weight", *(double *)(a1 + 200));
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_21B874744(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  int v20;
  BOOL v21;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        if (v10++ > 8)
          goto LABEL_19;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_DWORD *)(a1 + 212) |= 0x40000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 152) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 2u:
          *(_DWORD *)(a1 + 212) |= 0x4000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 120) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 3u:
          *(_DWORD *)(a1 + 212) |= 0x400u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 88) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 4u:
          *(_DWORD *)(a1 + 212) |= 0x800u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 96) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 5u:
          *(_DWORD *)(a1 + 212) |= 0x1000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 104) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 6u:
          *(_DWORD *)(a1 + 212) |= 2u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 7u:
          *(_DWORD *)(a1 + 212) |= 0x1000000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 200) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 8u:
          *(_DWORD *)(a1 + 212) |= 0x200000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 176) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 9u:
          *(_DWORD *)(a1 + 212) |= 0x100000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 168) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0xAu:
          *(_DWORD *)(a1 + 212) |= 0x20000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 144) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0xBu:
          *(_DWORD *)(a1 + 212) |= 0x8000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 128) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0xCu:
          *(_DWORD *)(a1 + 212) |= 0x200u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 80) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0xDu:
          *(_DWORD *)(a1 + 212) |= 0x40u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0xEu:
          *(_DWORD *)(a1 + 212) |= 0x20u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0xFu:
          *(_DWORD *)(a1 + 212) |= 8u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x10u:
          *(_DWORD *)(a1 + 212) |= 0x800000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 192) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x11u:
          *(_DWORD *)(a1 + 212) |= 0x10u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x12u:
          *(_DWORD *)(a1 + 212) |= 0x2000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 112) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x13u:
          *(_DWORD *)(a1 + 212) |= 0x100u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 72) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x14u:
          *(_DWORD *)(a1 + 212) |= 0x10000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 136) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x15u:
          *(_DWORD *)(a1 + 212) |= 0x80u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x16u:
          *(_DWORD *)(a1 + 212) |= 4u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x17u:
          *(_DWORD *)(a1 + 212) |= 1u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x18u:
          *(_DWORD *)(a1 + 212) |= 0x400000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
            goto LABEL_100;
          *(_QWORD *)(a1 + 184) = *(_QWORD *)(*(_QWORD *)this + v2);
          goto LABEL_104;
        case 0x19u:
          *(_DWORD *)(a1 + 212) |= 0x80000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)this + 2))
          {
LABEL_100:
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            *(_QWORD *)(a1 + 160) = *(_QWORD *)(*(_QWORD *)this + v2);
LABEL_104:
            v2 = *((_QWORD *)this + 1) + 8;
            *((_QWORD *)this + 1) = v2;
          }
          break;
        case 0x1Au:
          *(_DWORD *)(a1 + 212) |= 0x2000000u;
          v2 = *((_QWORD *)this + 1);
          if (v2 >= *((_QWORD *)this + 2))
          {
            v21 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v20 = *(unsigned __int8 *)(*(_QWORD *)this + v2++);
            *((_QWORD *)this + 1) = v2;
            v21 = v20 != 0;
          }
          *(_BYTE *)(a1 + 208) = v21;
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)this + 1);
          break;
      }
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_21B874E80(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 212);
  if ((v4 & 0x40000) != 0)
  {
    result = PB::Writer::write(this, *(double *)(result + 152));
    v4 = *(_DWORD *)(v3 + 212);
    if ((v4 & 0x4000) == 0)
    {
LABEL_3:
      if ((v4 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((v4 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::write(this, *(double *)(v3 + 120));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x400) == 0)
  {
LABEL_4:
    if ((v4 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  result = PB::Writer::write(this, *(double *)(v3 + 88));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x800) == 0)
  {
LABEL_5:
    if ((v4 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  result = PB::Writer::write(this, *(double *)(v3 + 96));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x1000) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  result = PB::Writer::write(this, *(double *)(v3 + 104));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 2) == 0)
  {
LABEL_7:
    if ((v4 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  result = PB::Writer::write(this, *(double *)(v3 + 16));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x200000) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  result = PB::Writer::write(this, *(double *)(v3 + 200));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x200000) == 0)
  {
LABEL_9:
    if ((v4 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  result = PB::Writer::write(this, *(double *)(v3 + 176));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x100000) == 0)
  {
LABEL_10:
    if ((v4 & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  result = PB::Writer::write(this, *(double *)(v3 + 168));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x20000) == 0)
  {
LABEL_11:
    if ((v4 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  result = PB::Writer::write(this, *(double *)(v3 + 144));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x8000) == 0)
  {
LABEL_12:
    if ((v4 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  result = PB::Writer::write(this, *(double *)(v3 + 128));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x200) == 0)
  {
LABEL_13:
    if ((v4 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  result = PB::Writer::write(this, *(double *)(v3 + 80));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x40) == 0)
  {
LABEL_14:
    if ((v4 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  result = PB::Writer::write(this, *(double *)(v3 + 56));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x20) == 0)
  {
LABEL_15:
    if ((v4 & 8) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  result = PB::Writer::write(this, *(double *)(v3 + 48));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 8) == 0)
  {
LABEL_16:
    if ((v4 & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  result = PB::Writer::write(this, *(double *)(v3 + 32));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x800000) == 0)
  {
LABEL_17:
    if ((v4 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  result = PB::Writer::write(this, *(double *)(v3 + 192));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x10) == 0)
  {
LABEL_18:
    if ((v4 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  result = PB::Writer::write(this, *(double *)(v3 + 40));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x2000) == 0)
  {
LABEL_19:
    if ((v4 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  result = PB::Writer::write(this, *(double *)(v3 + 112));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x100) == 0)
  {
LABEL_20:
    if ((v4 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  result = PB::Writer::write(this, *(double *)(v3 + 72));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x10000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  result = PB::Writer::write(this, *(double *)(v3 + 136));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 4) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  result = PB::Writer::write(this, *(double *)(v3 + 64));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 4) == 0)
  {
LABEL_23:
    if ((v4 & 1) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  result = PB::Writer::write(this, *(double *)(v3 + 24));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 1) == 0)
  {
LABEL_24:
    if ((v4 & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  result = PB::Writer::write(this, *(double *)(v3 + 8));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x400000) == 0)
  {
LABEL_25:
    if ((v4 & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  result = PB::Writer::write(this, *(double *)(v3 + 184));
  v4 = *(_DWORD *)(v3 + 212);
  if ((v4 & 0x80000) == 0)
  {
LABEL_26:
    if ((v4 & 0x2000000) == 0)
      return result;
    return PB::Writer::write(this);
  }
LABEL_52:
  result = PB::Writer::write(this, *(double *)(v3 + 160));
  if ((*(_DWORD *)(v3 + 212) & 0x2000000) != 0)
    return PB::Writer::write(this);
  return result;
}

float sub_21B87517C(float *a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  float v5;
  float result;
  float v7;
  _OWORD v8[5];
  int v9;
  float v10[10];
  float v11[10];
  float v12[10];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)(a2 + 32);
  v8[0] = *(_OWORD *)(a2 + 16);
  v8[1] = v3;
  v4 = *(_OWORD *)(a2 + 64);
  v8[2] = *(_OWORD *)(a2 + 48);
  v8[3] = v4;
  v8[4] = *(_OWORD *)(a2 + 80);
  v9 = *(_DWORD *)(a2 + 96);
  sub_21B88FB74((float *)v8, word_21B8A074C, 21);
  sub_21B88FB98((float *)v8, v12, (uint64_t)&unk_21B8A0776, 1, 21, 0xAuLL);
  sub_21B88FB98(v12, v11, (uint64_t)&unk_21B8A092E, 1, 10, 0xAuLL);
  sub_21B88FB98(v11, v10, (uint64_t)&unk_21B8A0A0A, 1, 10, 0xAuLL);
  sub_21B88FB98(v10, &v7, (uint64_t)&unk_21B8A0AE6, 0, 10, 1uLL);
  v5 = v7;
  if (v7 <= 0.15)
    v5 = 0.0;
  *a1 = fminf(v5, 3.5);
  sub_21B88FB98((float *)v8, v12, (uint64_t)&unk_21B8A0720, 0, 21, 1uLL);
  result = fminf(fmaxf(v12[0] + (float)(v7 * -0.19324), 0.0225), 12.25);
  a1[1] = result;
  return result;
}

float sub_21B875BF4(int a1, unint64_t a2, float a3)
{
  float result;

  result = a3 / (float)((float)((float)a1 * 0.25) / (float)(int)(a2 >> 1));
  if (result > (float)((int)a2 - 1))
    return (float)((int)a2 - 1);
  return result;
}

uint64_t sub_21B875C24(uint64_t a1)
{
  int32x2_t v2;
  uint64_t v3;
  int32x2_t v4;
  int64x2_t v5;
  float32x2_t v6;
  __float2 v7;
  __float2 v8;
  float *v9;
  float64x2_t v11;
  float64x2_t v12;
  float v13;
  float32x2x2_t v14;

  *(_QWORD *)(a1 + 144) = a1 + 152;
  *(_QWORD *)(a1 + 8) = 256;
  *(_DWORD *)a1 = 8;
  v2 = (int32x2_t)0x100000000;
  v3 = 152;
  v11 = (float64x2_t)vdupq_n_s64(0x3F80000000000000uLL);
  v12 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  do
  {
    v4 = vneg_s32(v2);
    v5.i64[0] = v4.i32[0];
    v5.i64[1] = v4.i32[1];
    v6 = vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_s64(v5), v12), v11));
    v13 = v6.f32[0];
    v7 = __sincosf_stret(v6.f32[1]);
    v8 = __sincosf_stret(v13);
    v14.val[1] = (float32x2_t)__PAIR64__(LODWORD(v7.__sinval), LODWORD(v8.__sinval));
    v14.val[0] = (float32x2_t)__PAIR64__(LODWORD(v7.__cosval), LODWORD(v8.__cosval));
    v9 = (float *)(a1 + v3);
    vst2_f32(v9, v14);
    v2 = vadd_s32(v2, (int32x2_t)0x200000002);
    v3 += 16;
  }
  while (v3 != 2200);
  sub_21B875D14(256, (int *)(a1 + 16));
  return a1;
}

uint64_t sub_21B875D14(uint64_t result, int *a2)
{
  float v2;
  int v3;
  int v4;

  v2 = sqrtf((float)(int)result);
  v3 = 4;
  do
  {
    while ((int)result % v3)
    {
      v4 = v3 + 2;
      if (v3 == 2)
        v4 = 3;
      if (v3 == 4)
        v3 = 2;
      else
        v3 = v4;
      if (v2 < (float)v3)
        v3 = result;
    }
    result = ((int)result / v3);
    *a2 = v3;
    a2[1] = result;
    a2 += 2;
  }
  while ((int)result > 1);
  return result;
}

void sub_21B875D70(uint64_t a1, _DWORD *a2, unsigned __int16 *a3)
{
  int *v5;
  unint64_t v6;
  unint64_t v7;
  float v8;
  float *v9;
  float32x2_t *v10;
  unint64_t v11;
  float32x2_t v12;
  float v13;
  _QWORD v14[256];

  v14[255] = *MEMORY[0x24BDAC8D0];
  v5 = (int *)(a1 + 8);
  bzero(&v13, 8 * *(int *)(a1 + 8));
  sub_21B875E50(&v13, a3, 0, 1, 1u, v5 + 2, (uint64_t)v5);
  *a2 = 0;
  v6 = *v5;
  if ((int)v6 >= 4)
  {
    v7 = v6 >> 1;
    v8 = (float)(int)v6;
    v9 = (float *)(a2 + 1);
    v10 = (float32x2_t *)v14;
    v11 = v7 - 1;
    do
    {
      v12 = *v10++;
      *v9++ = sqrtf(vaddv_f32(vmul_f32(v12, v12)) / v8);
      --v11;
    }
    while (v11);
  }
}

void sub_21B875E50(float *a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int *a6, uint64_t a7)
{
  float *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  float *v14;
  unint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float *v22;
  float *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  float *v27;
  float *v28;
  float *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float *v60;
  uint64_t v61;
  float *v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  NSObject *v70;
  int v72;
  uint8_t buf[4];
  int v76;
  uint64_t v77;

  v9 = a1;
  v77 = *MEMORY[0x24BDAC8D0];
  v10 = a6[1];
  v11 = v10 * *a6;
  v72 = *a6;
  if (v10 == 1)
  {
    v12 = a4 * a5;
    v13 = 8 * v11;
    v14 = a1;
    do
    {
      *v14 = *(float *)sub_21B8761BC(a2, (int)a3);
      v14 += 2;
      LODWORD(a3) = a3 + v12;
      v13 -= 8;
    }
    while (v13);
  }
  else
  {
    v15 = 0;
    v16 = a6 + 2;
    v17 = *a6 * a4;
    v18 = a4 * a5;
    v19 = 8 * v11;
    do
    {
      sub_21B875E50(&v9[v15 / 4], a2, a3, v17, a5, v16, a7);
      a3 = (a3 + v18);
      v15 += 8 * v10;
    }
    while (v19 != v15);
  }
  if (v72 == 2)
  {
    v60 = (float *)(*(_QWORD *)(a7 + 136) + 4);
    v61 = 2 * v10;
    do
    {
      v62 = &v9[v61];
      v63 = *(v60 - 1);
      v64 = v9[v61];
      v65 = v9[v61 + 1];
      v66 = (float)(v64 * v63) - (float)(v65 * *v60);
      v67 = (float)(v63 * v65) + (float)(v64 * *v60);
      v68 = v9[1] - v67;
      *v62 = *v9 - v66;
      v62[1] = v68;
      v69 = v67 + v9[1];
      *v9 = v66 + *v9;
      v9[1] = v69;
      v9 += 2;
      v60 += 2 * a4;
      --v10;
    }
    while (v10);
  }
  else
  {
    v20 = v10;
    if (v72 == 4)
    {
      v21 = 2 * v10;
      v22 = v9 + 1;
      v23 = (float *)(*(_QWORD *)(a7 + 136) + 4);
      v24 = 4 * v10;
      v25 = *(_DWORD *)(a7 + 4);
      v26 = 6 * v10;
      v27 = v23;
      v28 = v23;
      do
      {
        v29 = &v22[v21];
        v30 = *(v23 - 1);
        v31 = v22[v21 - 1];
        v32 = v22[2 * v10];
        v33 = (float)(v31 * v30) - (float)(v32 * *v23);
        v34 = (float)(v30 * v32) + (float)(v31 * *v23);
        v35 = &v22[v24];
        v36 = *(v27 - 1);
        v37 = v22[v24 - 1];
        v38 = v22[4 * v10];
        v39 = (float)(v37 * v36) - (float)(v38 * *v27);
        v40 = (float)(v36 * v38) + (float)(v37 * *v27);
        v41 = &v22[v26];
        v42 = *(v28 - 1);
        v43 = v22[v26 - 1];
        v44 = v22[6 * v10];
        v45 = (float)(v43 * v42) - (float)(v44 * *v28);
        v46 = (float)(v42 * v44) + (float)(v43 * *v28);
        v47 = *(v22 - 1);
        v48 = v47 - v39;
        v49 = *v22 - v40;
        v50 = v39 + v47;
        v51 = v40 + *v22;
        *(v22 - 1) = v50;
        *v22 = v51;
        v52 = v34 + v46;
        v53 = v33 - v45;
        v54 = v34 - v46;
        *(v35 - 1) = v50 - (float)(v33 + v45);
        *v35 = v51 - v52;
        v55 = v52 + *v22;
        *(v22 - 1) = (float)(v33 + v45) + *(v22 - 1);
        *v22 = v55;
        if (v25)
        {
          v56 = v48 + v54;
          v57 = v49 - v53;
          v58 = v48 - v54;
          v59 = v49 + v53;
        }
        else
        {
          v58 = v48 + v54;
          v59 = v49 - v53;
          v56 = v48 - v54;
          v57 = v49 + v53;
        }
        v22[2 * v10] = v59;
        v22[6 * v10] = v57;
        v22 += 2;
        v28 += 6 * a4;
        *(v29 - 1) = v58;
        v27 += 4 * a4;
        v23 += 2 * a4;
        *(v41 - 1) = v56;
        --v20;
      }
      while (v20);
    }
    else
    {
      if (qword_25518E200 != -1)
        dispatch_once(&qword_25518E200, &unk_24DF3A8A8);
      v70 = qword_25518E208;
      if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v76 = v72;
        _os_log_impl(&dword_21B72A000, v70, OS_LOG_TYPE_FAULT, "Error in FFT,p,%d", buf, 8u);
      }
    }
  }
}

os_log_t sub_21B876190()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

uint64_t sub_21B8761BC(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A8A8);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[2 * (v5 - v4) + 4];
}

uint64_t sub_21B8762D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  float *v10;
  uint64_t v11;

  v2 = 0;
  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 16) = 0x10000000000;
  *(_DWORD *)(a1 + 12) = 1031798784;
  *(_BYTE *)(a1 + 1048) = 1;
  *(_QWORD *)(a1 + 1064) = 0x10000000000;
  *(_DWORD *)(a1 + 1060) = 1031798784;
  *(_BYTE *)(a1 + 2096) = 1;
  *(_QWORD *)(a1 + 2112) = 0x10000000000;
  *(_DWORD *)(a1 + 2108) = 1031798784;
  *(_BYTE *)(a1 + 3144) = 1;
  *(_QWORD *)(a1 + 3160) = 0x10000000000;
  *(_DWORD *)(a1 + 3156) = 1031798784;
  *(_BYTE *)(a1 + 4192) = 1;
  *(_QWORD *)(a1 + 4208) = 0x10000000000;
  *(_DWORD *)(a1 + 4204) = 1031798784;
  *(_BYTE *)(a1 + 5240) = 1;
  *(_QWORD *)(a1 + 5256) = 0x10000000000;
  *(_BYTE *)(a1 + 6288) = 1;
  *(_DWORD *)(a1 + 5252) = 1031798784;
  *(_QWORD *)(a1 + 6304) = 0x10000000000;
  *(_DWORD *)(a1 + 6300) = 1031798784;
  *(_BYTE *)(a1 + 7336) = 1;
  *(_QWORD *)(a1 + 7352) = 0x10000000000;
  *(_DWORD *)(a1 + 7348) = 1031798784;
  *(_BYTE *)(a1 + 8384) = 1;
  *(_QWORD *)(a1 + 8400) = 0x10000000000;
  *(_DWORD *)(a1 + 8396) = 1031798784;
  *(_BYTE *)(a1 + 9432) = 1;
  *(_QWORD *)(a1 + 9448) = 0x10000000000;
  *(_DWORD *)(a1 + 9444) = 1031798784;
  *(_BYTE *)(a1 + 10480) = 1;
  *(_QWORD *)(a1 + 10496) = 0x10000000000;
  *(_DWORD *)(a1 + 10492) = 1031798784;
  *(_BYTE *)(a1 + 11528) = 1;
  *(_QWORD *)(a1 + 11544) = 0x10000000000;
  *(_BYTE *)(a1 + 12576) = 1;
  *(_DWORD *)(a1 + 11540) = 1031798784;
  *(_QWORD *)(a1 + 12592) = 0x10000000000;
  *(_DWORD *)(a1 + 12588) = 1031798784;
  *(_BYTE *)(a1 + 13624) = 1;
  *(_QWORD *)(a1 + 13640) = 0x10000000000;
  *(_DWORD *)(a1 + 13636) = 1031798784;
  *(_BYTE *)(a1 + 14672) = 1;
  *(_QWORD *)(a1 + 14688) = 0x10000000000;
  *(_DWORD *)(a1 + 14684) = 1031798784;
  *(_QWORD *)(a1 + 15720) = 0x10000000000;
  *(_QWORD *)(a1 + 19824) = 0;
  *(_QWORD *)(a1 + 19832) = 0x7F00000000;
  *(_OWORD *)(a1 + 20096) = 0u;
  *(_OWORD *)(a1 + 20112) = 0u;
  *(_QWORD *)(a1 + 20128) = 0;
  *(_DWORD *)(a1 + 20136) = 1065353216;
  *(_QWORD *)(a1 + 20140) = 0;
  *(_QWORD *)(a1 + 20148) = 0;
  *(_DWORD *)(a1 + 20156) = 1065353216;
  *(_BYTE *)(a1 + 20160) = 0;
  v3 = a1 + 20184;
  *(_QWORD *)(a1 + 20164) = 0;
  *(_QWORD *)(a1 + 20172) = 0;
  *(_QWORD *)(a1 + 20184) = 2;
  v4 = 20236;
  *(_QWORD *)(a1 + 20192) = 0;
  do
  {
    *(_DWORD *)(a1 + v4) = dword_21B8A0B74[v2++];
    v4 -= 4;
  }
  while (v2 != 5);
  v5 = 0;
  *(float *)(a1 + 20224) = -*(float *)(a1 + 20224);
  *(float *)(a1 + 20232) = -*(float *)(a1 + 20232);
  *(_OWORD *)(a1 + 20240) = *(_OWORD *)(a1 + 20220);
  *(_OWORD *)(a1 + 20256) = xmmword_21B8A0B60;
  v6 = 20308;
  do
  {
    *(_DWORD *)(a1 + v6) = dword_21B8A0B74[v5++];
    v6 -= 4;
  }
  while (v5 != 5);
  *(float *)(a1 + 20296) = -*(float *)(a1 + 20296);
  *(float *)(a1 + 20304) = -*(float *)(a1 + 20304);
  *(_OWORD *)(a1 + 20312) = *(_OWORD *)(a1 + 20292);
  sub_21B892CFC((uint64_t *)(a1 + 20328), (uint64_t)&off_24DF3A8C8);
  sub_21B892CFC((uint64_t *)(a1 + 20392), (uint64_t)&off_24DF3A8C8);
  sub_21B892CFC((uint64_t *)(a1 + 20456), (uint64_t)&off_24DF3A8C8);
  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v8;
    v10 = (float *)(v3 + 72 * v7);
    v11 = 4;
    do
    {
      sub_21B878988(v10, 0.0);
      --v11;
    }
    while (v11);
    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);
  return a1;
}

unsigned __int16 *sub_21B876578(unsigned __int16 *result, unsigned __int16 *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;

  v2 = *((unsigned int *)result + 1);
  v3 = *result + (unint64_t)result[1];
  if (v3 >= v2)
    v4 = *((unsigned int *)result + 1);
  else
    v4 = 0;
  result[v3 - v4 + 4] = *a2;
  v5 = result[1];
  if (v2 <= v5)
  {
    v6 = *result + 1;
    if (v6 < v2)
      LOWORD(v2) = 0;
    *result = v6 - v2;
  }
  else
  {
    result[1] = v5 + 1;
  }
  return result;
}

uint64_t sub_21B8765D4(uint64_t a1)
{
  unsigned __int16 *v1;
  uint64_t v2;
  unint64_t v3;
  unsigned __int16 *v4;

  v1 = (unsigned __int16 *)(a1 + 19834);
  if (*(_DWORD *)(a1 + 19836) != *(unsigned __int16 *)(a1 + 19834))
    return 0;
  v2 = *(_QWORD *)(a1 + 19824);
  if (*(_WORD *)(a1 + 19834))
  {
    v3 = 0;
    v4 = (unsigned __int16 *)(a1 + 19832);
    do
      v2 -= *(unsigned __int16 *)sub_21B876650(v4, v3++);
    while (v3 < *v1);
  }
  return v2;
}

uint64_t sub_21B876650(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A900);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[v5 - v4 + 4];
}

BOOL sub_21B876764(uint64_t a1)
{
  return *(_DWORD *)(a1 + 20) == *(unsigned __int16 *)(a1 + 18)
      && *(_DWORD *)(a1 + 1068) == *(unsigned __int16 *)(a1 + 1066)
      && *(_DWORD *)(a1 + 2116) == *(unsigned __int16 *)(a1 + 2114)
      && *(_DWORD *)(a1 + 3164) == *(unsigned __int16 *)(a1 + 3162)
      && *(_DWORD *)(a1 + 4212) == *(unsigned __int16 *)(a1 + 4210)
      && *(_DWORD *)(a1 + 5260) == *(unsigned __int16 *)(a1 + 5258)
      && *(_DWORD *)(a1 + 6308) == *(unsigned __int16 *)(a1 + 6306)
      && *(_DWORD *)(a1 + 7356) == *(unsigned __int16 *)(a1 + 7354)
      && *(_DWORD *)(a1 + 8404) == *(unsigned __int16 *)(a1 + 8402)
      && *(_DWORD *)(a1 + 9452) == *(unsigned __int16 *)(a1 + 9450)
      && *(_DWORD *)(a1 + 10500) == *(unsigned __int16 *)(a1 + 10498)
      && *(_DWORD *)(a1 + 11548) == *(unsigned __int16 *)(a1 + 11546)
      && *(_DWORD *)(a1 + 15724) == *(unsigned __int16 *)(a1 + 15722)
      && *(_DWORD *)(a1 + 19836) == *(unsigned __int16 *)(a1 + 19834);
}

unsigned __int16 *sub_21B876860(uint64_t a1, uint64_t a2)
{
  float v4;
  int v5;
  int v6;
  int v7;
  int v8;
  float v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int16 *result;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unsigned __int16 v65;

  v4 = sub_21B8931BC((float *)a2, *(float *)(a2 + 28), *(float *)(a2 + 32), *(float *)(a2 + 36));
  v6 = v5;
  v8 = v7;
  v9 = sub_21B8931BC((float *)a2, *(float *)(a2 + 16), *(float *)(a2 + 20), *(float *)(a2 + 24));
  v12 = *(unsigned __int16 *)(a1 + 16);
  v13 = *(unsigned __int16 *)(a1 + 18);
  v14 = *(unsigned int *)(a1 + 20);
  if (v12 + v13 >= v14)
    v15 = *(unsigned int *)(a1 + 20);
  else
    v15 = 0;
  *(float *)(a1 + 16 + 4 * (v12 + v13 - v15) + 8) = v9;
  if (v14 <= v13)
  {
    v16 = v12 + 1;
    if (v16 < v14)
      LOWORD(v14) = 0;
    *(_WORD *)(a1 + 16) = v16 - v14;
  }
  else
  {
    *(_WORD *)(a1 + 18) = v13 + 1;
  }
  *(_BYTE *)a1 = 1;
  v17 = *(unsigned __int16 *)(a1 + 1066);
  v18 = *(unsigned int *)(a1 + 1068);
  v19 = *(unsigned __int16 *)(a1 + 1064);
  if (v19 + v17 >= v18)
    v20 = *(unsigned int *)(a1 + 1068);
  else
    v20 = 0;
  *(_DWORD *)(a1 + 1064 + 4 * (v19 + v17 - v20) + 8) = v10;
  if (v18 <= v17)
  {
    if (v19 + 1 < v18)
      LOWORD(v18) = 0;
    *(_WORD *)(a1 + 1064) = v19 + 1 - v18;
  }
  else
  {
    *(_WORD *)(a1 + 1066) = v17 + 1;
  }
  *(_BYTE *)(a1 + 1048) = 1;
  v21 = *(unsigned __int16 *)(a1 + 2114);
  v22 = *(unsigned int *)(a1 + 2116);
  v23 = *(unsigned __int16 *)(a1 + 2112);
  if (v23 + v21 >= v22)
    v24 = *(unsigned int *)(a1 + 2116);
  else
    v24 = 0;
  *(_DWORD *)(a1 + 2112 + 4 * (v23 + v21 - v24) + 8) = v11;
  if (v22 <= v21)
  {
    if (v23 + 1 < v22)
      LOWORD(v22) = 0;
    *(_WORD *)(a1 + 2112) = v23 + 1 - v22;
  }
  else
  {
    *(_WORD *)(a1 + 2114) = v21 + 1;
  }
  *(_BYTE *)(a1 + 2096) = 1;
  v25 = *(unsigned __int16 *)(a1 + 3162);
  v26 = *(unsigned int *)(a1 + 3164);
  v27 = *(unsigned __int16 *)(a1 + 3160);
  if (v27 + v25 >= v26)
    v28 = *(unsigned int *)(a1 + 3164);
  else
    v28 = 0;
  *(_DWORD *)(a1 + 3160 + 4 * (v27 + v25 - v28) + 8) = *(_DWORD *)(a2 + 16);
  if (v26 <= v25)
  {
    if (v27 + 1 < v26)
      LOWORD(v26) = 0;
    *(_WORD *)(a1 + 3160) = v27 + 1 - v26;
  }
  else
  {
    *(_WORD *)(a1 + 3162) = v25 + 1;
  }
  *(_BYTE *)(a1 + 3144) = 1;
  v29 = *(unsigned __int16 *)(a1 + 4210);
  v30 = *(unsigned int *)(a1 + 4212);
  v31 = *(unsigned __int16 *)(a1 + 4208);
  if (v31 + v29 >= v30)
    v32 = *(unsigned int *)(a1 + 4212);
  else
    v32 = 0;
  *(_DWORD *)(a1 + 4208 + 4 * (v31 + v29 - v32) + 8) = *(_DWORD *)(a2 + 20);
  if (v30 <= v29)
  {
    if (v31 + 1 < v30)
      LOWORD(v30) = 0;
    *(_WORD *)(a1 + 4208) = v31 + 1 - v30;
  }
  else
  {
    *(_WORD *)(a1 + 4210) = v29 + 1;
  }
  *(_BYTE *)(a1 + 4192) = 1;
  v33 = *(unsigned __int16 *)(a1 + 5258);
  v34 = *(unsigned int *)(a1 + 5260);
  v35 = *(unsigned __int16 *)(a1 + 5256);
  if (v35 + v33 >= v34)
    v36 = *(unsigned int *)(a1 + 5260);
  else
    v36 = 0;
  *(_DWORD *)(a1 + 5256 + 4 * (v35 + v33 - v36) + 8) = *(_DWORD *)(a2 + 24);
  if (v34 <= v33)
  {
    if (v35 + 1 < v34)
      LOWORD(v34) = 0;
    *(_WORD *)(a1 + 5256) = v35 + 1 - v34;
  }
  else
  {
    *(_WORD *)(a1 + 5258) = v33 + 1;
  }
  *(_BYTE *)(a1 + 5240) = 1;
  v37 = *(unsigned __int16 *)(a1 + 6306);
  v38 = *(unsigned int *)(a1 + 6308);
  v39 = *(unsigned __int16 *)(a1 + 6304);
  if (v39 + v37 >= v38)
    v40 = *(unsigned int *)(a1 + 6308);
  else
    v40 = 0;
  *(float *)(a1 + 6304 + 4 * (v39 + v37 - v40) + 8) = v4;
  if (v38 <= v37)
  {
    if (v39 + 1 < v38)
      LOWORD(v38) = 0;
    *(_WORD *)(a1 + 6304) = v39 + 1 - v38;
  }
  else
  {
    *(_WORD *)(a1 + 6306) = v37 + 1;
  }
  *(_BYTE *)(a1 + 6288) = 1;
  v41 = *(unsigned __int16 *)(a1 + 7354);
  v42 = *(unsigned int *)(a1 + 7356);
  v43 = *(unsigned __int16 *)(a1 + 7352);
  if (v43 + v41 >= v42)
    v44 = *(unsigned int *)(a1 + 7356);
  else
    v44 = 0;
  *(_DWORD *)(a1 + 7352 + 4 * (v43 + v41 - v44) + 8) = v6;
  if (v42 <= v41)
  {
    if (v43 + 1 < v42)
      LOWORD(v42) = 0;
    *(_WORD *)(a1 + 7352) = v43 + 1 - v42;
  }
  else
  {
    *(_WORD *)(a1 + 7354) = v41 + 1;
  }
  *(_BYTE *)(a1 + 7336) = 1;
  v45 = *(unsigned __int16 *)(a1 + 8402);
  v46 = *(unsigned int *)(a1 + 8404);
  v47 = *(unsigned __int16 *)(a1 + 8400);
  if (v47 + v45 >= v46)
    v48 = *(unsigned int *)(a1 + 8404);
  else
    v48 = 0;
  *(_DWORD *)(a1 + 4 * (v47 + v45 - v48) + 8408) = v8;
  if (v46 <= v45)
  {
    if (v47 + 1 < v46)
      LOWORD(v46) = 0;
    *(_WORD *)(a1 + 8400) = v47 + 1 - v46;
  }
  else
  {
    *(_WORD *)(a1 + 8402) = v45 + 1;
  }
  *(_BYTE *)(a1 + 8384) = 1;
  v49 = *(unsigned __int16 *)(a1 + 9450);
  v50 = *(unsigned int *)(a1 + 9452);
  v51 = *(unsigned __int16 *)(a1 + 9448);
  if (v51 + v49 >= v50)
    v52 = *(unsigned int *)(a1 + 9452);
  else
    v52 = 0;
  *(_DWORD *)(a1 + 4 * (v51 + v49 - v52) + 9456) = *(_DWORD *)(a2 + 28);
  if (v50 <= v49)
  {
    if (v51 + 1 < v50)
      LOWORD(v50) = 0;
    *(_WORD *)(a1 + 9448) = v51 + 1 - v50;
  }
  else
  {
    *(_WORD *)(a1 + 9450) = v49 + 1;
  }
  *(_BYTE *)(a1 + 9432) = 1;
  v53 = *(unsigned __int16 *)(a1 + 10498);
  v54 = *(unsigned int *)(a1 + 10500);
  v55 = *(unsigned __int16 *)(a1 + 10496);
  if (v55 + v53 >= v54)
    v56 = *(unsigned int *)(a1 + 10500);
  else
    v56 = 0;
  *(_DWORD *)(a1 + 4 * (v55 + v53 - v56) + 10504) = *(_DWORD *)(a2 + 32);
  if (v54 <= v53)
  {
    if (v55 + 1 < v54)
      LOWORD(v54) = 0;
    *(_WORD *)(a1 + 10496) = v55 + 1 - v54;
  }
  else
  {
    *(_WORD *)(a1 + 10498) = v53 + 1;
  }
  *(_BYTE *)(a1 + 10480) = 1;
  v57 = *(unsigned __int16 *)(a1 + 11546);
  v58 = *(unsigned int *)(a1 + 11548);
  v59 = *(unsigned __int16 *)(a1 + 11544);
  if (v59 + v57 >= v58)
    v60 = *(unsigned int *)(a1 + 11548);
  else
    v60 = 0;
  *(_DWORD *)(a1 + 4 * (v59 + v57 - v60) + 11552) = *(_DWORD *)(a2 + 36);
  if (v58 <= v57)
  {
    if (v59 + 1 < v58)
      LOWORD(v58) = 0;
    *(_WORD *)(a1 + 11544) = v59 + 1 - v58;
  }
  else
  {
    *(_WORD *)(a1 + 11546) = v57 + 1;
  }
  *(_BYTE *)(a1 + 11528) = 1;
  result = sub_21B876D84((unsigned __int16 *)(a1 + 15720), (_OWORD *)a2);
  v62 = *(_QWORD *)(a2 + 40);
  v63 = *(_QWORD *)(a1 + 19824);
  if (v63)
  {
    v64 = v62 - v63;
    if (v64 >> 16)
      LOWORD(v64) = 10000;
    v65 = v64;
    result = sub_21B876578((unsigned __int16 *)(a1 + 19832), &v65);
  }
  *(_QWORD *)(a1 + 19824) = v62;
  return result;
}

unsigned __int16 *sub_21B876D84(unsigned __int16 *result, _OWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *((unsigned int *)result + 1);
  v3 = *result + (unint64_t)result[1];
  if (v3 < v2)
    v2 = 0;
  *(_OWORD *)&result[8 * (v3 - v2) + 4] = *a2;
  v4 = result[1];
  v5 = *((unsigned int *)result + 1);
  if (v5 <= v4)
  {
    v6 = *result + 1;
    if (v6 < v5)
      LOWORD(v5) = 0;
    *result = v6 - v5;
  }
  else
  {
    result[1] = v4 + 1;
  }
  return result;
}

float sub_21B876DE4(uint64_t a1, int a2, float *a3, int a4)
{
  float result;

  if (sub_21B876764(a1))
  {
    if (a2)
    {
      sub_21B876EC8((unsigned __int16 *)a1, a3);
      sub_21B8770C0((unsigned __int16 *)a1, a3);
      if (*(_DWORD *)(a1 + 12596) == *(unsigned __int16 *)(a1 + 12594)
        && *(_DWORD *)(a1 + 13644) == *(unsigned __int16 *)(a1 + 13642)
        && *(_DWORD *)(a1 + 14692) == *(unsigned __int16 *)(a1 + 14690))
      {
        sub_21B877374((unsigned __int16 *)a1, a3);
      }
    }
    else if (!a4)
    {
      return result;
    }
    sub_21B877624();
    return sub_21B877AF8();
  }
  return result;
}

float sub_21B876EC8(unsigned __int16 *a1, float *a2)
{
  float v4;
  uint64_t i;
  float v6;
  uint64_t j;
  float v8;
  uint64_t k;
  float v10;
  uint64_t m;
  float v12;
  uint64_t n;
  float v14;
  uint64_t ii;
  float v16;
  uint64_t jj;
  float v18;
  uint64_t kk;
  float v20;
  uint64_t mm;
  float result;
  _BYTE v23[2200];
  _DWORD v24[128];
  _DWORD v25[128];
  _DWORD v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sub_21B875D6C((uint64_t)v23);
  sub_21B875D70((uint64_t)v23, v26, a1 + 1580);
  sub_21B875D6C((uint64_t)v23);
  sub_21B875D70((uint64_t)v23, v25, a1 + 2104);
  sub_21B875D6C((uint64_t)v23);
  sub_21B875D70((uint64_t)v23, v24, a1 + 2628);
  v4 = 0.0;
  for (i = 2; i != 127; ++i)
    v4 = v4 + *(float *)&v26[i];
  v6 = 0.0;
  for (j = 2; j != 127; ++j)
    v6 = v6 + *(float *)&v25[j];
  v8 = 0.0;
  for (k = 2; k != 127; ++k)
    v8 = v8 + *(float *)&v24[k];
  v10 = 0.0;
  for (m = 3; m != 11; ++m)
    v10 = v10 + *(float *)&v26[m];
  v12 = 0.0;
  for (n = 3; n != 11; ++n)
    v12 = v12 + *(float *)&v25[n];
  v14 = 0.0;
  for (ii = 3; ii != 11; ++ii)
    v14 = v14 + *(float *)&v24[ii];
  v16 = 0.0;
  for (jj = 2; jj != 13; ++jj)
    v16 = v16 + *(float *)&v26[jj];
  v18 = 0.0;
  for (kk = 2; kk != 13; ++kk)
    v18 = v18 + *(float *)&v25[kk];
  v20 = 0.0;
  for (mm = 2; mm != 13; ++mm)
    v20 = v20 + *(float *)&v24[mm];
  result = (float)(v4 + v6) + v8;
  *a2 = (float)((float)(v16 + v18) + v20) / result;
  a2[15] = result;
  a2[2] = (float)((float)(v10 + v12) + v14) / result;
  return result;
}

float sub_21B8770C0(unsigned __int16 *a1, float *a2)
{
  float v4;
  uint64_t i;
  float v6;
  uint64_t j;
  float v8;
  uint64_t k;
  float v10;
  uint64_t m;
  float v12;
  uint64_t n;
  float v14;
  uint64_t ii;
  float v16;
  uint64_t jj;
  float v18;
  uint64_t kk;
  float v20;
  uint64_t mm;
  float v22;
  float v23;
  float v24;
  uint64_t nn;
  float v26;
  uint64_t i1;
  float v28;
  uint64_t i2;
  float result;
  float v31;
  _BYTE v32[2200];
  _DWORD v33[128];
  _DWORD v34[128];
  _DWORD v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  sub_21B875D6C((uint64_t)v32);
  sub_21B875D70((uint64_t)v32, v35, a1 + 4724);
  sub_21B875D6C((uint64_t)v32);
  sub_21B875D70((uint64_t)v32, v34, a1 + 5248);
  sub_21B875D6C((uint64_t)v32);
  sub_21B875D70((uint64_t)v32, v33, a1 + 5772);
  v4 = 0.0;
  for (i = 2; i != 127; ++i)
    v4 = v4 + *(float *)&v35[i];
  v6 = 0.0;
  for (j = 2; j != 127; ++j)
    v6 = v6 + *(float *)&v34[j];
  v8 = 0.0;
  for (k = 2; k != 127; ++k)
    v8 = v8 + *(float *)&v33[k];
  v10 = 0.0;
  for (m = 3; m != 11; ++m)
    v10 = v10 + *(float *)&v35[m];
  v12 = 0.0;
  for (n = 3; n != 11; ++n)
    v12 = v12 + *(float *)&v34[n];
  v14 = 0.0;
  for (ii = 3; ii != 11; ++ii)
    v14 = v14 + *(float *)&v33[ii];
  v16 = 0.0;
  for (jj = 2; jj != 13; ++jj)
    v16 = v16 + *(float *)&v35[jj];
  v18 = 0.0;
  for (kk = 2; kk != 13; ++kk)
    v18 = v18 + *(float *)&v34[kk];
  v20 = 0.0;
  for (mm = 2; mm != 13; ++mm)
    v20 = v20 + *(float *)&v33[mm];
  v22 = 0.0;
  do
    v22 = v22 + *(float *)&v35[mm++];
  while (mm != 39);
  v23 = 0.0;
  do
    v23 = v23 + *(float *)&v35[mm++];
  while (mm != 64);
  v24 = 0.0;
  for (nn = 39; nn != 64; ++nn)
    v24 = v24 + *(float *)&v34[nn];
  v26 = 0.0;
  for (i1 = 39; i1 != 64; ++i1)
    v26 = v26 + *(float *)&v33[i1];
  v28 = 0.0;
  for (i2 = 89; i2 != 127; ++i2)
    v28 = v28 + *(float *)&v35[i2];
  result = (float)(v4 + v6) + v8;
  v31 = (float)(v10 + v12) + v14;
  a2[16] = result;
  a2[20] = (float)((float)(v16 + v18) + v20) / result;
  a2[21] = (float)((float)(v23 + v24) + v26) / result;
  a2[7] = v31 / result;
  a2[8] = v31;
  a2[29] = v28;
  a2[32] = v22;
  a2[43] = v31 / result;
  a2[48] = v28;
  a2[53] = v22;
  return result;
}

void sub_21B877374(unsigned __int16 *a1, float *a2)
{
  uint64_t v4;
  unint64_t i;
  float v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  float v17;
  uint64_t j;
  uint64_t k;
  float v20;
  float v21;
  signed int v22;
  int v23;
  float v24;
  uint64_t v25;
  float *v26;
  float v27;
  float *v28;
  float v29;
  unsigned __int16 v30[12];
  _QWORD v31[3];
  float v32[128];
  float v33[128];
  float v34[128];
  float v35[550];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v31[0] = 0x300000000;
  sub_21B875D6C((uint64_t)v35);
  sub_21B875D70((uint64_t)v35, v34, a1 + 6296);
  sub_21B875D6C((uint64_t)v35);
  sub_21B875D70((uint64_t)v35, v33, a1 + 6820);
  sub_21B875D6C((uint64_t)v35);
  sub_21B875D70((uint64_t)v35, v32, a1 + 7344);
  for (i = 0; i != 128; ++i)
  {
    v6 = (float)(v34[i] + v33[i]) + v32[i];
    v7 = WORD1(v31[0]);
    v8 = HIDWORD(v31[0]);
    v9 = LOWORD(v31[0]);
    v10 = LOWORD(v31[0]) + (unint64_t)WORD1(v31[0]);
    if (v10 >= HIDWORD(v31[0]))
      v11 = HIDWORD(v31[0]);
    else
      v11 = 0;
    *((float *)&v31[1] + v10 - v11) = v6;
    if (v8 <= v7)
    {
      if (v9 + 1 < v8)
        LOWORD(v8) = 0;
      LOWORD(v31[0]) = v9 + 1 - v8;
    }
    else
    {
      WORD1(v31[0]) = v7 + 1;
    }
    if (i >= 2)
    {
      *(_QWORD *)v30 = 0x300000000;
      sub_21B8781D8((uint64_t)v30, (uint64_t)v31);
      v6 = sub_21B878308(v30);
    }
    v35[i] = v6;
  }
  v12 = 0;
  v13 = 0;
  v14 = -3.4028e38;
  do
  {
    if (v35[v13] > v14)
    {
      v12 = v13;
      v14 = v35[v13];
    }
    ++v13;
  }
  while (v13 != 128);
  v15 = 0.0;
  v17 = sub_21B87801C(0.0, 50.0, 100.0, v4, (uint64_t)v35);
  for (j = 0; j != 127; ++j)
    v15 = v15 + v35[j];
  for (k = 0; k != 10; ++k)
  {
    v20 = (float)(5 * k);
    v21 = (float)(5 * k + 5);
    v22 = vcvtps_s32_f32(v20 / 0.3937);
    v23 = vcvtps_s32_f32(v21 / 0.3937);
    if (v23 >= 128)
      v23 = 128;
    v24 = 0.0;
    if (v23 > v22)
    {
      v25 = v23 - (uint64_t)v22;
      v26 = &v35[v22];
      do
      {
        v27 = *v26++;
        v24 = v24 + v27;
        --v25;
      }
      while (v25);
    }
    v28 = &a2[3 * k];
    v28[59] = v24;
    v28[60] = v24 / v15;
    v28[61] = sub_21B87801C(v20, v21, 100.0, v16, (uint64_t)v35);
  }
  v29 = (double)v12 * 0.390625;
  a2[55] = v14;
  a2[56] = v29;
  a2[57] = v17;
  a2[58] = v15;
}

float sub_21B877624()
{
  uint64_t v0;
  float *v1;
  float *v2;
  float *v3;
  float *v4;
  int v5;
  int v6;
  unsigned __int16 *v7;
  float v8;
  uint64_t i;
  float v10;
  uint64_t j;
  float v12;
  uint64_t k;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  uint64_t m;
  float v19;
  uint64_t n;
  float v21;
  uint64_t ii;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  uint64_t jj;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unint64_t v34;
  unint64_t v35;
  float v36;
  float v37;
  unint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unint64_t v41;
  unint64_t v42;
  float v43;
  float v44;
  unint64_t v45;
  float result;
  _BYTE v47[512];
  _DWORD v48[128];
  _DWORD v49[128];
  _DWORD v50[128];
  float v51[550];
  uint64_t v52;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (unsigned __int16 *)v0;
  v52 = *MEMORY[0x24BDAC8D0];
  sub_21B875D6C((uint64_t)v51);
  sub_21B875D70((uint64_t)v51, v50, v7 + 8);
  sub_21B875D6C((uint64_t)v51);
  sub_21B875D70((uint64_t)v51, v49, v7 + 532);
  sub_21B875D6C((uint64_t)v51);
  sub_21B875D70((uint64_t)v51, v48, v7 + 1056);
  if (v6)
  {
    v8 = 0.0;
    for (i = 2; i != 127; ++i)
      v8 = v8 + *(float *)&v50[i];
    v10 = 0.0;
    for (j = 2; j != 127; ++j)
      v10 = v10 + *(float *)&v49[j];
    v12 = 0.0;
    for (k = 2; k != 127; ++k)
      v12 = v12 + *(float *)&v48[k];
    v14 = 0;
    v15 = 0.0;
    do
    {
      v15 = v15 + *(float *)&v48[v14 + 3];
      ++v14;
    }
    while (v14 != 8);
    v16 = v8 + v10;
    v17 = 0.0;
    for (m = 2; m != 13; ++m)
      v17 = v17 + *(float *)&v50[m];
    v19 = 0.0;
    for (n = 2; n != 13; ++n)
      v19 = v19 + *(float *)&v49[n];
    v21 = 0.0;
    for (ii = 2; ii != 13; ++ii)
      v21 = v21 + *(float *)&v48[ii];
    v23 = 0;
    v24 = v17 + v19;
    v25 = 0.0;
    v26 = v24 / v16;
    do
    {
      v25 = v25 + *(float *)&v50[v23 + 13];
      ++v23;
    }
    while (v23 != 26);
    v27 = 0;
    v28 = 0.0;
    v29 = v15 / v12;
    do
    {
      v28 = v28 + *(float *)&v49[v27 + 13];
      ++v27;
    }
    while (v27 != 26);
    v4[13] = v16;
    v4[9] = v21 / v12;
    v4[17] = v29;
    v4[18] = v26;
    v30 = (float)(v25 + v28) / v16;
    v4[30] = v30;
    v4[49] = v30;
    v4[51] = v26;
  }
  for (jj = 0; jj != 128; jj += 4)
  {
    *(float32x4_t *)&v51[jj] = vaddq_f32(vmulq_f32(*(float32x4_t *)&v50[jj], *(float32x4_t *)&v50[jj]), vmulq_f32(*(float32x4_t *)&v49[jj], *(float32x4_t *)&v49[jj]));
    *(float32x4_t *)&v47[jj * 4] = vmulq_f32(*(float32x4_t *)&v48[jj], *(float32x4_t *)&v48[jj]);
  }
  v32 = atomic_load((unsigned __int8 *)&qword_25518E308);
  if ((v32 & 1) == 0 && __cxa_guard_acquire(&qword_25518E308))
  {
    qword_25518E300 = vcvtas_u32_f32(sub_21B875BF4(100, 0x80uLL, 0.5));
    __cxa_guard_release(&qword_25518E308);
  }
  v33 = atomic_load((unsigned __int8 *)&qword_25518E318);
  if ((v33 & 1) == 0 && __cxa_guard_acquire(&qword_25518E318))
  {
    qword_25518E310 = vcvtas_u32_f32(sub_21B875BF4(100, 0x80uLL, 3.5));
    __cxa_guard_release(&qword_25518E318);
  }
  v34 = qword_25518E300;
  v35 = qword_25518E310;
  if (qword_25518E300 <= (unint64_t)qword_25518E310)
  {
    v37 = 0.0;
    v38 = qword_25518E300;
    do
      v37 = v37 + v51[v38++];
    while (v38 <= qword_25518E310);
    v2[17] = sqrtf(v37);
    v36 = 0.0;
    do
      v36 = v36 + *(float *)&v47[4 * v34++];
    while (v34 <= v35);
  }
  else
  {
    v2[17] = 0.0;
    v36 = 0.0;
  }
  v2[19] = sqrtf(v36);
  v39 = atomic_load((unsigned __int8 *)&qword_25518E328);
  if ((v39 & 1) == 0 && __cxa_guard_acquire(&qword_25518E328))
  {
    qword_25518E320 = (unint64_t)(float)(roundf(sub_21B875BF4(100, 0x80uLL, 3.5)) + 1.0);
    __cxa_guard_release(&qword_25518E328);
  }
  v40 = atomic_load((unsigned __int8 *)&qword_25518E338);
  if ((v40 & 1) == 0 && __cxa_guard_acquire(&qword_25518E338))
  {
    qword_25518E330 = vcvtas_u32_f32(sub_21B875BF4(100, 0x80uLL, 20.0));
    __cxa_guard_release(&qword_25518E338);
  }
  v41 = qword_25518E320;
  v42 = qword_25518E330;
  if (qword_25518E320 <= (unint64_t)qword_25518E330)
  {
    v44 = 0.0;
    v45 = qword_25518E320;
    do
      v44 = v44 + v51[v45++];
    while (v45 <= qword_25518E330);
    v2[18] = sqrtf(v44);
    v43 = 0.0;
    do
      v43 = v43 + *(float *)&v47[4 * v41++];
    while (v41 <= v42);
  }
  else
  {
    v2[18] = 0.0;
    v43 = 0.0;
  }
  result = sqrtf(v43);
  v2[20] = result;
  return result;
}

void sub_21B877AA8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_25518E338);
  _Unwind_Resume(a1);
}

float sub_21B877AF8()
{
  uint64_t v0;
  float *v1;
  float *v2;
  float *v3;
  float *v4;
  int v5;
  int v6;
  unsigned __int16 *v7;
  float v8;
  uint64_t i;
  float v10;
  uint64_t j;
  float v12;
  uint64_t k;
  uint64_t v14;
  float v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  uint64_t m;
  float v27;
  uint64_t n;
  uint64_t v29;
  float v30;
  float v31;
  float v32;
  uint64_t ii;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unint64_t v36;
  unint64_t v37;
  float v38;
  float v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unint64_t v43;
  unint64_t v44;
  float v45;
  float v46;
  unint64_t v47;
  float result;
  _BYTE v49[512];
  _DWORD v50[128];
  _DWORD v51[128];
  _DWORD v52[128];
  float v53[550];
  uint64_t v54;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (unsigned __int16 *)v0;
  v54 = *MEMORY[0x24BDAC8D0];
  sub_21B875D6C((uint64_t)v53);
  sub_21B875D70((uint64_t)v53, v52, v7 + 3152);
  sub_21B875D6C((uint64_t)v53);
  sub_21B875D70((uint64_t)v53, v51, v7 + 3676);
  sub_21B875D6C((uint64_t)v53);
  sub_21B875D70((uint64_t)v53, v50, v7 + 4200);
  if (v6)
  {
    v8 = 0.0;
    for (i = 2; i != 127; ++i)
      v8 = v8 + *(float *)&v52[i];
    v10 = 0.0;
    for (j = 2; j != 127; ++j)
      v10 = v10 + *(float *)&v51[j];
    v12 = 0.0;
    for (k = 2; k != 127; ++k)
      v12 = v12 + *(float *)&v50[k];
    v14 = 0;
    v15 = 0.0;
    do
    {
      v15 = v15 + *(float *)&v52[v14 + 3];
      ++v14;
    }
    while (v14 != 8);
    v16 = 0;
    v17 = 0.0;
    do
    {
      v17 = v17 + *(float *)&v51[v16 + 3];
      ++v16;
    }
    while (v16 != 8);
    v18 = 0;
    v19 = 0.0;
    do
    {
      v19 = v19 + *(float *)&v50[v18 + 3];
      ++v18;
    }
    while (v18 != 8);
    v20 = v15 + v17;
    v21 = 0.0;
    v22 = 2;
    v23 = v19 / v12;
    do
      v21 = v21 + *(float *)&v52[v22++];
    while (v22 != 13);
    v24 = v8 + v10;
    v25 = 0.0;
    for (m = 2; m != 13; ++m)
      v25 = v25 + *(float *)&v51[m];
    v27 = 0.0;
    for (n = 2; n != 13; ++n)
      v27 = v27 + *(float *)&v50[n];
    v29 = 0;
    v30 = v21 + v25;
    v31 = 0.0;
    do
    {
      v31 = v31 + *(float *)&v50[v29 + 89];
      ++v29;
    }
    while (v29 != 38);
    v32 = v19 / v20;
    v4[19] = v24;
    v4[6] = v20 / v24;
    v4[3] = v12;
    v4[10] = v23;
    v4[11] = v30 / v24;
    v4[33] = v27;
    v4[31] = v31;
    v4[26] = v32;
    v4[38] = v27;
    v4[39] = v31;
    v4[40] = (float)(v12 - v27) - v31;
    v4[45] = v32;
    v4[52] = v31;
    v4[54] = v27;
  }
  for (ii = 0; ii != 128; ii += 4)
  {
    *(float32x4_t *)&v53[ii] = vaddq_f32(vmulq_f32(*(float32x4_t *)&v52[ii], *(float32x4_t *)&v52[ii]), vmulq_f32(*(float32x4_t *)&v51[ii], *(float32x4_t *)&v51[ii]));
    *(float32x4_t *)&v49[ii * 4] = vmulq_f32(*(float32x4_t *)&v50[ii], *(float32x4_t *)&v50[ii]);
  }
  v34 = atomic_load((unsigned __int8 *)&qword_25518E348);
  if ((v34 & 1) == 0 && __cxa_guard_acquire(&qword_25518E348))
  {
    qword_25518E340 = vcvtas_u32_f32(sub_21B875BF4(100, 0x80uLL, 0.5));
    __cxa_guard_release(&qword_25518E348);
  }
  v35 = atomic_load((unsigned __int8 *)&qword_25518E358);
  if ((v35 & 1) == 0 && __cxa_guard_acquire(&qword_25518E358))
  {
    qword_25518E350 = vcvtas_u32_f32(sub_21B875BF4(100, 0x80uLL, 3.5));
    __cxa_guard_release(&qword_25518E358);
  }
  v36 = qword_25518E340;
  v37 = qword_25518E350;
  if (qword_25518E340 <= (unint64_t)qword_25518E350)
  {
    v39 = 0.0;
    v40 = qword_25518E340;
    do
      v39 = v39 + v53[v40++];
    while (v40 <= qword_25518E350);
    v2[21] = sqrtf(v39);
    v38 = 0.0;
    do
      v38 = v38 + *(float *)&v49[4 * v36++];
    while (v36 <= v37);
  }
  else
  {
    v2[21] = 0.0;
    v38 = 0.0;
  }
  v2[23] = sqrtf(v38);
  v41 = atomic_load((unsigned __int8 *)&qword_25518E368);
  if ((v41 & 1) == 0 && __cxa_guard_acquire(&qword_25518E368))
  {
    qword_25518E360 = (unint64_t)(float)(roundf(sub_21B875BF4(100, 0x80uLL, 3.5)) + 1.0);
    __cxa_guard_release(&qword_25518E368);
  }
  v42 = atomic_load((unsigned __int8 *)&qword_25518E378);
  if ((v42 & 1) == 0 && __cxa_guard_acquire(&qword_25518E378))
  {
    qword_25518E370 = vcvtas_u32_f32(sub_21B875BF4(100, 0x80uLL, 20.0));
    __cxa_guard_release(&qword_25518E378);
  }
  v43 = qword_25518E360;
  v44 = qword_25518E370;
  if (qword_25518E360 <= (unint64_t)qword_25518E370)
  {
    v46 = 0.0;
    v47 = qword_25518E360;
    do
      v46 = v46 + v53[v47++];
    while (v47 <= qword_25518E370);
    v2[22] = sqrtf(v46);
    v45 = 0.0;
    do
      v45 = v45 + *(float *)&v49[4 * v43++];
    while (v43 <= v44);
  }
  else
  {
    v2[22] = 0.0;
    v45 = 0.0;
  }
  result = sqrtf(v45);
  v2[24] = result;
  return result;
}

void sub_21B877FCC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_25518E378);
  _Unwind_Resume(a1);
}

float sub_21B87801C(float a1, float a2, float a3, uint64_t a4, uint64_t a5)
{
  float v5;
  unsigned int v6;
  unsigned int v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  float v11;
  unint64_t v12;
  float v13;
  unint64_t v15;
  float v16;
  _OWORD v18[32];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (float)(a3 * 0.5) / 127.0;
  v6 = vcvtps_s32_f32(a1 / v5);
  memset(v18, 0, sizeof(v18));
  v7 = vcvtps_s32_f32(a2 / v5);
  v8 = 0.0;
  if (v6 < v7)
  {
    v9 = (int)v6;
    v10 = (int)v7;
    v11 = 0.0;
    v12 = (int)v6;
    do
    {
      v13 = *(float *)(a5 + 4 * v12) * *(float *)(a5 + 4 * v12);
      *((float *)v18 + v12) = v13;
      v11 = v11 + v13;
      ++v12;
    }
    while (v12 < v10);
    v8 = 0.0;
    if (v11 != 0.0 && v6 < v10)
    {
      v15 = (int)v6;
      do
      {
        *((float *)v18 + v15) = *((float *)v18 + v15) / v11;
        ++v15;
      }
      while (v15 < v10);
      if (v6 < v10)
      {
        v8 = 0.0;
        do
        {
          v16 = *((float *)v18 + v9);
          if (v16 != 0.0)
            v8 = v8 - (float)(v16 * logf(*((float *)v18 + v9)));
          ++v9;
        }
        while (v9 < v10);
      }
    }
  }
  return v8;
}

unsigned __int16 *sub_21B878184(unsigned __int16 *result, _DWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result[1];
  v3 = *((unsigned int *)result + 1);
  v4 = *result;
  if (v4 + v2 >= v3)
    v5 = *((unsigned int *)result + 1);
  else
    v5 = 0;
  *(_DWORD *)&result[2 * (v4 + v2 - v5) + 4] = *a2;
  if (v3 <= v2)
  {
    if (v4 + 1 < v3)
      LOWORD(v3) = 0;
    *result = v4 + 1 - v3;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

void sub_21B8781D8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _DWORD *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)a1 = 0;
  if (*(_DWORD *)(a2 + 4) != *(_DWORD *)(a1 + 4))
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A900);
    v6 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v7 = *(unsigned int *)(a1 + 4);
      v8 = *(unsigned int *)(a2 + 4);
      v9 = 134218240;
      v10 = v7;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_21B72A000, v6, OS_LOG_TYPE_FAULT, "Assertion failed: rhs.capacity() == capacity(), file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 70,capacity,%zu,%zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (*(_WORD *)(a2 + 2))
  {
    v4 = 0;
    do
    {
      v5 = (_DWORD *)sub_21B8761BC((unsigned __int16 *)a2, v4);
      sub_21B878184((unsigned __int16 *)a1, v5);
      ++v4;
    }
    while (v4 < *(unsigned __int16 *)(a2 + 2));
  }
}

float sub_21B878308(unsigned __int16 *a1)
{
  unsigned int v1;
  float v3;

  v1 = a1[1];
  if (!a1[1])
    return 0.0;
  if (v1 == 1)
    return *(float *)sub_21B8761BC(a1, 0);
  v3 = sub_21B878A28(a1, v1 >> 1);
  if ((v1 & 1) == 0)
    return (float)(v3 + sub_21B878A28(a1, (v1 >> 1) - 1)) * 0.5;
  return v3;
}

BOOL sub_21B878394(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 result;

  v1 = *(_QWORD *)(a1 + 20096) + 1;
  *(_QWORD *)(a1 + 20096) = v1;
  if ((v1 & 3) != 0)
    return 0;
  result = sub_21B876764(a1);
  if (result)
  {
    *(_QWORD *)(a1 + 20096) = 0;
    return 1;
  }
  return result;
}

void sub_21B8783DC(uint64_t a1, float *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  unsigned __int16 *v14;
  float v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  unsigned __int16 *v19;
  unint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float *v27;
  float v28;
  __float2 v29;
  float *v30;
  float v31;
  __float2 v32;
  float *v33;
  float v34;
  __float2 v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  BOOL v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float *v58;
  unsigned __int16 *v59;
  unsigned __int16 *v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 19824);
  v4 = sub_21B8765D4(a1);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  *((_QWORD *)a2 + 1) = v4;
  v12 = 0.0;
  v13 = 0.0;
  v71 = 0.0;
  v72 = 0.0;
  v60 = (unsigned __int16 *)(a1 + 6304);
  v73 = 0.0;
  v74 = 0.0;
  v58 = a2;
  v59 = (unsigned __int16 *)(a1 + 7352);
  v14 = (unsigned __int16 *)(a1 + 8400);
  v75 = 0.0;
  v76 = 0.0;
  v15 = 0.0;
  v16 = (unsigned __int16 *)(a1 + 16);
  v17 = (unsigned __int16 *)(a1 + 1064);
  v18 = (unsigned __int16 *)(a1 + 2112);
  v19 = (unsigned __int16 *)(a1 + 15720);
  v20 = 1;
  v21 = 0.0;
  v22 = 0.0;
  v23 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  do
  {
    v67 = v22;
    v68 = v12;
    v69 = v10;
    v70 = v15;
    v66 = *(float *)sub_21B8761BC(v60, v5);
    v65 = *(float *)sub_21B8761BC(v59, v5);
    v64 = *(float *)sub_21B8761BC(v14, v5);
    v63 = *(float *)sub_21B8761BC(v16, v5);
    v62 = *(float *)sub_21B8761BC(v17, v5);
    v61 = *(float *)sub_21B8761BC(v18, v5);
    v27 = (float *)sub_21B878848(v19, v5);
    v28 = sub_21B892F88(v27);
    ++v8;
    v29 = __sincosf_stret(v28);
    v75 = v75 + v29.__cosval;
    v76 = v76 + v29.__sinval;
    v30 = (float *)sub_21B878848(v19, v5);
    v31 = sub_21B892FC8(v30);
    ++v7;
    v32 = __sincosf_stret(v31);
    v73 = v73 + v32.__cosval;
    v74 = v74 + v32.__sinval;
    v33 = (float *)sub_21B878848(v19, v5);
    v34 = sub_21B892FE0(v33);
    ++v6;
    v35 = __sincosf_stret(v34);
    v71 = v71 + v35.__cosval;
    v72 = v72 + v35.__sinval;
    v36 = v66 - v9;
    v9 = v9 + (float)((float)(v66 - v9) / (float)v20);
    v10 = v69 + (float)(v36 * (float)(v66 - v9));
    v37 = v65 - v11;
    v11 = v11 + (float)((float)(v65 - v11) / (float)v20);
    v12 = v68 + (float)(v37 * (float)(v65 - v11));
    v38 = v64 - v13;
    v13 = v13 + (float)((float)(v64 - v13) / (float)v20);
    v26 = v26 + (float)(v38 * (float)(v64 - v13));
    v39 = v63 - v25;
    v25 = v25 + (float)((float)(v63 - v25) / (float)v20);
    v24 = v24 + (float)(v39 * (float)(v63 - v25));
    v40 = v62 - v23;
    v23 = v23 + (float)((float)(v62 - v23) / (float)v20);
    v22 = v67 + (float)(v40 * (float)(v62 - v23));
    v41 = v61 - v21;
    v21 = v21 + (float)((float)(v61 - v21) / (float)v20);
    v15 = v70 + (float)(v41 * (float)(v61 - v21));
    v5 += 5;
    ++v20;
  }
  while (v5 != 260);
  v58[4] = sqrtf((float)(v11 * v11) + (float)(v9 * v9));
  v58[5] = v13;
  v58[6] = sqrtf((float)(v10 / 51.0) + (float)(v12 / 51.0));
  v58[7] = sqrtf(v26 / 51.0);
  v58[8] = sqrtf((float)(v25 * v25) + (float)(v23 * v23));
  v58[9] = v21;
  v58[10] = sqrtf((float)(v24 / 51.0) + (float)(v22 / 51.0));
  v58[11] = sqrtf(v15 / 51.0);
  if (v7)
  {
    v58[12] = atan2f(v74, v73);
    v42 = 0.0;
    v44 = v75;
    v43 = v76;
    if (v7 != 1)
    {
      v45 = logf(fmaxf((float)((float)(v73 * v73) + (float)(v74 * v74)) / (float)(unint64_t)(v7 * v7), 0.00000011921));
      v46 = -v45;
      v47 = v45 < 0.0;
      v48 = 0.0;
      if (v47)
        v48 = v46;
      v42 = sqrtf(v48);
    }
  }
  else
  {
    v58[12] = 0.0;
    v42 = 0.0;
    v44 = v75;
    v43 = v76;
  }
  v58[14] = v42;
  if (v8)
  {
    v49 = atan2f(v43, v44);
    if (v49 <= 0.0)
      v49 = -v49;
    v58[13] = v49;
    v50 = 0.0;
    if (v8 != 1)
    {
      v51 = logf(fmaxf((float)((float)(v44 * v44) + (float)(v43 * v43)) / (float)(unint64_t)(v8 * v8), 0.00000011921));
      v52 = -v51;
      v47 = v51 < 0.0;
      v53 = 0.0;
      if (v47)
        v53 = v52;
      v50 = sqrtf(v53);
    }
  }
  else
  {
    v58[13] = -0.0;
    v50 = 0.0;
  }
  v58[15] = v50;
  v54 = 0.0;
  if (v6 >= 2)
  {
    v55 = logf(fmaxf((float)((float)(v71 * v71) + (float)(v72 * v72)) / (float)(v6 * v6), 0.00000011921));
    v56 = -v55;
    v47 = v55 < 0.0;
    v57 = 0.0;
    if (v47)
      v57 = v56;
    v54 = sqrtf(v57);
  }
  v58[16] = v54;
}

uint64_t sub_21B878848(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A900);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[8 * (v5 - v4) + 4];
}

os_log_t sub_21B87895C()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

BOOL sub_21B878988(float *a1, float a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
  {
    v3 = *((_QWORD *)a1 + 1);
    if ((unint64_t)(v3 + 1) <= 4)
      v4 = v3 + 1;
    else
      v4 = 0;
    a1[v4 + 4] = a2;
    if ((unint64_t)(v4 + 1) <= 4)
      v5 = v4 + 1;
    else
      v5 = 0;
    *(_QWORD *)a1 = v2 - 1;
  }
  else
  {
    v6 = 0;
    v7 = *((_QWORD *)a1 + 1);
    if ((unint64_t)(v7 + 1) <= 4)
      v8 = v7 + 1;
    else
      v8 = 0;
    a1[v8 + 4] = a2;
    a2 = 0.0;
    do
    {
      a2 = a2 + (float)(a1[v6 + 13 - v8] * a1[v6 + 4]);
      ++v6;
    }
    while (v6 != 5);
    if ((unint64_t)(v8 + 1) <= 4)
      v5 = v8 + 1;
    else
      v5 = 0;
  }
  *((_QWORD *)a1 + 1) = v5;
  a1[v5 + 4] = a2;
  return v2 == 0;
}

float sub_21B878A28(unsigned __int16 *a1, int a2)
{
  unint64_t v2;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a1[1];
  if (v2 > a2)
    return sub_21B878ADC(a1, 0, v2 - 1, a2);
  if (qword_25518E200 != -1)
    dispatch_once(&qword_25518E200, &unk_24DF3A900);
  v4 = qword_25518E208;
  if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B72A000, v4, OS_LOG_TYPE_DEBUG, "Get Nth, attempting to access invalid element", v5, 2u);
  }
  return 0.0;
}

float sub_21B878ADC(unsigned __int16 *a1, int a2, int a3, int a4)
{
  float v4;
  int v6;
  int v7;
  int v9;

  v4 = 0.0;
  if (a2 <= a3)
  {
    v6 = a3;
    v7 = a2;
    while (1)
    {
      v9 = sub_21B878B68(a1, v7, v6);
      if (v9 == a4)
        break;
      if (v9 > a4)
        v6 = v9 - 1;
      else
        v7 = v9 + 1;
      if (v7 > v6)
        return v4;
    }
    return *(float *)sub_21B8761BC(a1, a4);
  }
  return v4;
}

uint64_t sub_21B878B68(unsigned __int16 *a1, int a2, int a3)
{
  unint64_t v4;
  float *v6;
  int v7;
  float v8;
  uint64_t v9;

  LODWORD(v4) = a2;
  v6 = (float *)sub_21B8761BC(a1, a3);
  v7 = v4 - 1;
  if ((int)v4 < a3)
  {
    v8 = *v6;
    v4 = (int)v4;
    do
    {
      if (*(float *)sub_21B8761BC(a1, v4) <= v8)
        sub_21B878C08(a1, ++v7, v4);
      ++v4;
    }
    while (a3 != (_DWORD)v4);
  }
  v9 = (v7 + 1);
  sub_21B878C08(a1, v9, a3);
  return v9;
}

_DWORD *sub_21B878C08(unsigned __int16 *a1, int a2, int a3)
{
  unint64_t v5;
  int v6;
  int v7;
  _DWORD *result;

  v5 = a2;
  v6 = *(_DWORD *)sub_21B8761BC(a1, a2);
  v7 = *(_DWORD *)sub_21B8761BC(a1, a3);
  *(_DWORD *)sub_21B8761BC(a1, v5) = v7;
  result = (_DWORD *)sub_21B8761BC(a1, a3);
  *result = v6;
  return result;
}

float sub_21B878C7C(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A900);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 2;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 271,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

uint64_t sub_21B878D6C(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A900);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 2;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 277,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

uint64_t sub_21B878E5C(uint64_t result, uint64_t a2, float a3, float a4, float a5, float a6, float a7)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  float *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17[3];
  uint64_t v18;

  v7 = 0;
  v8 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  v17[0] = a3 * 1000.0;
  v17[1] = a4 * 1000.0;
  v17[2] = a5 * 1000.0;
  v9 = result + 308;
  v10 = (float *)(result + 388);
  do
  {
    v11 = v17[v7];
    v12 = *(float *)(v9 + v7 * 4) - v11;
    if (v12 <= 0.0)
      v12 = -v12;
    *(float *)(v9 + v7 * 4) = v11;
    v13 = *(v10 - 13);
    *(v10 - 14) = v12 + *(v10 - 14);
    ++*((_DWORD *)v10 - 15);
    if (v13 > v12)
      *(v10 - 13) = v12;
    if (*(v10 - 12) < v12)
      *(v10 - 12) = v12;
    ++*((_DWORD *)v10 - 3);
    v14 = *(v10 - 1);
    *(v10 - 2) = v11 + *(v10 - 2);
    if (v14 > v11)
      *(v10 - 1) = v11;
    if (*v10 < v11)
      *v10 = v11;
    v8 |= v12 > 0.000001;
    ++v7;
    v10 += 4;
  }
  while (v7 != 3);
  ++*(_DWORD *)(result + 424);
  *(float *)(result + 428) = *(float *)(result + 428) + a6;
  if (*(float *)(result + 432) > a6)
    *(float *)(result + 432) = a6;
  if (*(float *)(result + 436) < a6)
    *(float *)(result + 436) = a6;
  ++*(_DWORD *)(result + 440);
  *(float *)(result + 444) = *(float *)(result + 444) + a7;
  if (*(float *)(result + 448) > a7)
    *(float *)(result + 448) = a7;
  if (*(float *)(result + 452) < a7)
    *(float *)(result + 452) = a7;
  if ((v8 & 1) != 0)
  {
    v15 = a2 - *(_QWORD *)(result + 320);
    *(_QWORD *)(result + 320) = a2;
    v16 = (float)v15;
    ++*(_DWORD *)(result + 456);
    *(float *)(result + 460) = *(float *)(result + 460) + (float)v15;
    if (*(float *)(result + 464) > (float)v15)
      *(float *)(result + 464) = v16;
    if (*(float *)(result + 468) < v16)
      *(float *)(result + 468) = v16;
  }
  return result;
}

uint64_t sub_21B879034@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  float *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  float v16;
  float v17;
  int v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  float v26;
  float v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  float v32;
  float v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  float v39;
  uint64_t v40;
  int v41;
  int v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _DWORD *v55;
  uint64_t i;
  uint64_t v57;

  v2 = 0;
  *(_OWORD *)(a2 + 464) = 0u;
  *(_OWORD *)(a2 + 480) = 0u;
  v3 = (float *)(result + 428);
  *(_OWORD *)(a2 + 432) = 0u;
  *(_OWORD *)(a2 + 448) = 0u;
  *(_OWORD *)(a2 + 400) = 0u;
  *(_OWORD *)(a2 + 416) = 0u;
  *(_OWORD *)(a2 + 368) = 0u;
  *(_OWORD *)(a2 + 384) = 0u;
  *(_OWORD *)(a2 + 336) = 0u;
  *(_OWORD *)(a2 + 352) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 320) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  v4 = a2 + 32;
  v5 = *(_DWORD *)(result + 432);
  v6 = *(_DWORD *)(result + 436);
  v7 = *(_DWORD *)(result + 424);
  v8 = *(_DWORD *)(result + 448);
  v9 = *(_DWORD *)(result + 452);
  v10 = *(_DWORD *)(result + 440);
  v11 = (unint64_t)*(float *)(result + 464);
  v12 = (unint64_t)*(float *)(result + 468);
  v13 = *(_DWORD *)(result + 456);
  do
  {
    v14 = result + v2;
    *(_DWORD *)(v4 - 20) = *(_DWORD *)(result + v2 + 384);
    *(_DWORD *)(v4 - 12) = *(_DWORD *)(result + v2 + 388);
    v15 = *(_DWORD *)(result + v2 + 376);
    v16 = 0.0;
    v17 = 0.0;
    if (v15)
      v17 = *(float *)(v14 + 380) / (float)v15;
    *(float *)(v4 - 16) = v17;
    *(_DWORD *)(v4 - 32) = *(_DWORD *)(v14 + 336);
    *(_DWORD *)(v4 - 24) = *(_DWORD *)(v14 + 340);
    v18 = *(_DWORD *)(v14 + 328);
    if (v18)
      v16 = *(float *)(result + v2 + 332) / (float)v18;
    *(float *)(v4 - 28) = v16;
    *(_DWORD *)(v4 - 8) = v5;
    v19 = 0.0;
    v20 = 0.0;
    *(_DWORD *)v4 = v6;
    if (v7)
      v20 = *v3 / (float)v7;
    *(float *)(v4 - 4) = v20;
    *(_DWORD *)(v4 + 4) = v8;
    *(_DWORD *)(v4 + 12) = v9;
    if (v10)
      v19 = *(float *)(result + 444) / (float)v10;
    *(float *)(v4 + 8) = v19;
    *(_QWORD *)(v4 + 16) = v11;
    *(_QWORD *)(v4 + 32) = v12;
    if (v13)
      v21 = *(float *)(result + 460) / (float)v13;
    else
      v21 = 0.0;
    *(_QWORD *)(v4 + 24) = (unint64_t)v21;
    v2 += 16;
    v4 += 72;
  }
  while (v2 != 48);
  v22 = 0;
  v23 = result + 164;
  v24 = a2 + 216;
  do
  {
    *(_DWORD *)(v24 + v22) = *(_DWORD *)(v23 - 88);
    v25 = *(_DWORD *)(v23 - 96);
    v26 = 0.0;
    v27 = 0.0;
    if (v25)
      v27 = *(float *)(v23 - 92) / (float)v25;
    v28 = v24 + v22;
    v29 = *(_DWORD *)(v23 - 84);
    *(float *)(v28 + 4) = v27;
    *(_DWORD *)(v28 + 8) = v29;
    *(_DWORD *)(v28 + 12) = *(_DWORD *)(v23 - 40);
    v30 = *(_DWORD *)(v23 - 48);
    if (v30)
      v26 = *(float *)(v23 - 44) / (float)v30;
    v31 = *(_DWORD *)(v23 - 36);
    *(float *)(v28 + 16) = v26;
    *(_DWORD *)(v28 + 20) = v31;
    *(_DWORD *)(v28 + 24) = *(_DWORD *)(v23 + 8);
    v32 = 0.0;
    v33 = 0.0;
    if (*(_DWORD *)v23)
      v33 = *(float *)(v23 + 4) / (float)*(int *)v23;
    v34 = v24 + v22;
    v35 = *(_DWORD *)(v23 + 12);
    *(float *)(v34 + 28) = v33;
    *(_DWORD *)(v34 + 32) = v35;
    *(_DWORD *)(v34 + 36) = *(_DWORD *)(v23 + 56);
    v36 = *(_DWORD *)(v23 + 48);
    if (v36)
      v32 = *(float *)(v23 + 52) / (float)v36;
    v37 = *(_DWORD *)(v23 + 60);
    *(float *)(v34 + 40) = v32;
    *(_DWORD *)(v34 + 44) = v37;
    *(_DWORD *)(v34 + 48) = *(_DWORD *)(v23 + 104);
    v38 = *(_DWORD *)(v23 + 96);
    if (v38)
      v39 = *(float *)(v23 + 100) / (float)v38;
    else
      v39 = 0.0;
    v40 = v24 + v22;
    v41 = *(_DWORD *)(v23 + 108);
    *(float *)(v40 + 52) = v39;
    *(_DWORD *)(v40 + 56) = v41;
    v22 += 60;
    v23 += 16;
  }
  while (v22 != 180);
  *(_QWORD *)(a2 + 400) = (unint64_t)*(float *)(result + 60);
  v42 = *(_DWORD *)(result + 52);
  if (v42)
    v43 = (unint64_t)(float)(*(float *)(result + 56) / (float)v42);
  else
    v43 = 0;
  v44 = (unint64_t)*(float *)(result + 64);
  *(_QWORD *)(a2 + 408) = v43;
  *(_QWORD *)(a2 + 416) = v44;
  *(_QWORD *)(a2 + 424) = (unint64_t)*(float *)(result + 44);
  v45 = *(_DWORD *)(result + 36);
  if (v45)
    v46 = (unint64_t)(float)(*(float *)(result + 40) / (float)v45);
  else
    v46 = 0;
  v47 = (unint64_t)*(float *)(result + 48);
  *(_QWORD *)(a2 + 432) = v46;
  *(_QWORD *)(a2 + 440) = v47;
  *(_QWORD *)(a2 + 448) = (unint64_t)*(float *)(result + 28);
  v48 = *(_DWORD *)(result + 20);
  if (v48)
    v49 = (unint64_t)(float)(*(float *)(result + 24) / (float)v48);
  else
    v49 = 0;
  v50 = (unint64_t)*(float *)(result + 32);
  *(_QWORD *)(a2 + 456) = v49;
  *(_QWORD *)(a2 + 464) = v50;
  *(_QWORD *)(a2 + 472) = (unint64_t)*(float *)(result + 12);
  v51 = *(_DWORD *)(result + 4);
  if (v51)
    v52 = (unint64_t)(float)(*(float *)(result + 8) / (float)v51);
  else
    v52 = 0;
  v53 = 0;
  v54 = (unint64_t)*(float *)(result + 16);
  *(_QWORD *)(a2 + 480) = v52;
  *(_QWORD *)(a2 + 488) = v54;
  *(_QWORD *)(result + 436) = 4286578687;
  *(_QWORD *)(result + 452) = 4286578687;
  *(_DWORD *)(result + 4) = 0;
  *(_QWORD *)(result + 8) = 0x7F7FFFFF00000000;
  *(_QWORD *)(result + 16) = 4286578687;
  *(_QWORD *)(result + 24) = 0x7F7FFFFF00000000;
  *(_QWORD *)(result + 32) = 4286578687;
  *(_QWORD *)(result + 40) = 0x7F7FFFFF00000000;
  *(_QWORD *)(result + 48) = 4286578687;
  *(_QWORD *)(result + 56) = 0x7F7FFFFF00000000;
  *(_DWORD *)(result + 64) = -8388609;
  *(_DWORD *)(result + 424) = 0;
  *(_QWORD *)v3 = 0x7F7FFFFF00000000;
  *(_QWORD *)(result + 444) = 0x7F7FFFFF00000000;
  *(_QWORD *)(result + 460) = 0x7F7FFFFF00000000;
  *(_DWORD *)(result + 468) = -8388609;
  do
  {
    v55 = (_DWORD *)(result + v53);
    v55[94] = 0;
    *(_QWORD *)(result + v53 + 380) = 0x7F7FFFFF00000000;
    v55[97] = -8388609;
    v55[82] = 0;
    *(_QWORD *)(result + v53 + 332) = 0x7F7FFFFF00000000;
    v55[85] = -8388609;
    v53 += 16;
  }
  while (v53 != 48);
  for (i = 0; i != 48; i += 16)
  {
    v57 = result + i;
    *(_DWORD *)(v57 + 68) = 0;
    *(_QWORD *)(v57 + 72) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 80) = -8388609;
    *(_DWORD *)(v57 + 116) = 0;
    *(_QWORD *)(v57 + 120) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 128) = -8388609;
    *(_DWORD *)(v57 + 164) = 0;
    *(_QWORD *)(v57 + 168) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 176) = -8388609;
    *(_DWORD *)(v57 + 212) = 0;
    *(_QWORD *)(v57 + 216) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 224) = -8388609;
    *(_DWORD *)(v57 + 260) = 0;
    *(_QWORD *)(v57 + 264) = 0x7F7FFFFF00000000;
    *(_DWORD *)(v57 + 272) = -8388609;
  }
  return result;
}

float sub_21B87943C(uint64_t a1, _OWORD *a2, uint64_t a3, float a4, float a5)
{
  unint64_t v8;
  uint64_t i;
  float result;
  __int128 v11;
  __int128 v12;
  int v13;
  _OWORD v14[2];
  int v15;

  *(_BYTE *)a1 = 1;
  if ((_OWORD *)(a1 + 4) != a2)
    *(_OWORD *)(a1 + 4) = *a2;
  v8 = 0;
  *(_QWORD *)(a1 + 24) = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0;
  do
  {
    *(_DWORD *)sub_21B87A024((uint64_t)&v11, v8, v8) = 1065353216;
    ++v8;
  }
  while (v8 != 3);
  for (i = 0; i != 36; i += 4)
    *(float *)((char *)&v11 + i) = (float)(a5 * a5) * *(float *)((char *)&v11 + i);
  v14[0] = v11;
  v14[1] = v12;
  v15 = v13;
  sub_21B879518(a1 + 32, (uint64_t)v14);
  result = a4 * a4;
  *(float *)(a1 + 56) = a4 * a4;
  *(float *)(a1 + 60) = a4 * a4;
  *(float *)(a1 + 64) = a4 * a4;
  return result;
}

BOOL sub_21B879518(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  float v11;
  float v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  float v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  result = sub_21B87B478(a2);
  if (result)
  {
    v5 = 3;
    v6 = 2;
    while (1)
    {
      v7 = v6;
      v8 = sub_21B87B518(a2, v6, v6);
      v9 = v5;
      v10 = v5 - 2;
      if (v5 <= 2)
      {
        do
        {
          v11 = *(float *)sub_21B87B6A4(a1 + 12, v7, v9);
          v12 = *(float *)sub_21B87B6A4(a1 + 12, v7, v9);
          v8 = v8 + (float)((float)-(float)(v11 * v12) * *(float *)sub_21B87B830(a1, v9++));
        }
        while (v9 != 3);
      }
      *(float *)sub_21B87B830(a1, v7) = v8;
      if (*(float *)sub_21B87B830(a1, v7) <= 0.0)
        break;
      if (v7)
      {
        do
        {
          v13 = v10;
          v14 = sub_21B87B518(a2, v10, v7);
          v15 = v5;
          if (v5 <= 2)
          {
            do
            {
              v16 = *(float *)sub_21B87B6A4(a1 + 12, v13, v15);
              v17 = *(float *)sub_21B87B6A4(a1 + 12, v7, v15);
              v14 = v14 + (float)((float)-(float)(v16 * v17) * *(float *)sub_21B87B830(a1, v15++));
            }
            while (v15 != 3);
          }
          v18 = v14 / *(float *)sub_21B87B830(a1, v7);
          *(float *)sub_21B87B6A4(a1 + 12, v13, v7) = v18;
          v10 = v13 - 1;
        }
        while (v13);
      }
      v6 = v7 - 1;
      v5 = v7;
      if (!v7)
        return 1;
    }
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v19 = qword_25518E208;
    result = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      v20 = 134217984;
      v21 = v7;
      _os_log_impl(&dword_21B72A000, v19, OS_LOG_TYPE_DEBUG, "D(%zu) <= 0 non-positive definite matrix!", (uint8_t *)&v20, 0xCu);
      return 0;
    }
  }
  return result;
}

double sub_21B879774(uint64_t a1)
{
  double result;

  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 12) = 0x3F80000000000000;
  result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  return result;
}

void sub_21B879798(float32x2_t *a1, float32x2_t *a2, unint64_t a3)
{
  float32x2_t v5;
  NSObject *v6;
  float32x2_t v7;
  float v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13[4];
  float v14;
  float32x2_t v15;
  float v16;
  _OWORD v17[2];
  int v18;
  uint8_t v19[36];
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  float32x2_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a1->i8[0])
  {
    v5 = a1[3];
    if (a3 > *(_QWORD *)&v5)
    {
      if (*(_QWORD *)&v5 + 1000000 >= a3)
      {
        v9 = (double)(a3 - v5.i32[0]) / 1000000.0;
        v12 = v9;
        sub_21B8799B4((uint64_t)a1, a2, v9);
        sub_21B879A24((float *)a2, (uint64_t)buf);
        sub_21B879A94((uint64_t)buf, (uint64_t)v19, v12);
        v10 = 0;
        v18 = 0;
        memset(v17, 0, sizeof(v17));
        do
        {
          *(_DWORD *)sub_21B87A024((uint64_t)v17, v10, v10) = 1065353216;
          ++v10;
        }
        while (v10 != 3);
        v11 = a1[8].f32[0] * v12;
        v15 = vmul_n_f32(a1[7], v12);
        v16 = v11;
        sub_21B879BE4((uint64_t)&a1[4], (uint64_t)v19, (uint64_t)v17, (uint64_t)&v15);
        if (sub_21B879FC8((uint64_t)&a1[4]) < 0.000000060923)
        {
          sub_21B87BCA0((uint64_t)&a1[4], 0, 0, (uint64_t)v13);
          v13[0] = v13[0] + 0.000000030462;
          v14 = v14 + 0.000000030462;
          sub_21B879518((uint64_t)&a1[4], (uint64_t)v13);
        }
        a1[3] = (float32x2_t)a3;
      }
      else
      {
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3A940);
        v6 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
        {
          v7 = a1[3];
          *(_DWORD *)buf = 134218240;
          v21 = a3;
          v22 = 2048;
          v23 = v7;
          _os_log_impl(&dword_21B72A000, v6, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollMEKF]:[propagate] Requested propagation time: %llu us cannot be 1s ahead of the last state timestamp: %llu us. Rejecting request.", buf, 0x16u);
        }
      }
    }
  }
}

double sub_21B8799B4(uint64_t a1, float32x2_t *a2, float a3)
{
  float v4;
  float32x4_t v5;
  float32x4_t *v6;
  double result;
  float32x4_t v8;
  float32x4_t v9;
  float32x2_t v10;
  float v11;

  v4 = a2[1].f32[0] * a3;
  v10 = vmul_n_f32(*a2, a3);
  v11 = v4;
  *(double *)v5.i64 = sub_21B8931F8(&v9, (float *)&v10);
  v6 = (float32x4_t *)(a1 + 4);
  result = sub_21B892E6C((uint64_t)&v9, v6->f32, &v8, v5);
  if (v6 != &v8)
  {
    result = *(double *)v8.i64;
    *v6 = v8;
  }
  return result;
}

double sub_21B879A24@<D0>(float *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  float v3;
  float v4;
  float v5;
  float v6;
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  int v11;

  v2 = 0;
  v4 = a1[1];
  v3 = a1[2];
  v5 = *a1;
  v6 = -*a1;
  LODWORD(v9) = 0;
  *((float *)&v9 + 1) = v3;
  *((float *)&v9 + 2) = -v4;
  *((float *)&v9 + 3) = -v3;
  LODWORD(v10) = 0;
  *(_QWORD *)((char *)&v10 + 4) = __PAIR64__(LODWORD(v4), LODWORD(v5));
  *((float *)&v10 + 3) = v6;
  v11 = 0;
  do
  {
    *(float *)((char *)&v9 + v2) = -*(float *)((char *)&v9 + v2);
    v2 += 4;
  }
  while (v2 != 36);
  result = *(double *)&v9;
  v8 = v10;
  *(_OWORD *)a2 = v9;
  *(_OWORD *)(a2 + 16) = v8;
  *(_DWORD *)(a2 + 32) = v11;
  return result;
}

void sub_21B879A94(uint64_t a1@<X1>, uint64_t a2@<X8>, float a3@<S0>)
{
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  unint64_t v9;
  float v10;
  uint64_t i;
  unint64_t v12;
  _OWORD v13[2];
  int v14;
  __int128 v15;
  __int128 v16;
  int v17;
  __int128 v18;
  __int128 v19;
  int v20;

  v6 = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  do
  {
    *(_DWORD *)sub_21B87A024(a2, v6, v6) = 1065353216;
    ++v6;
  }
  while (v6 != 3);
  v7 = 0;
  v8 = *(_OWORD *)(a1 + 16);
  v15 = *(_OWORD *)a1;
  v16 = v8;
  v17 = *(_DWORD *)(a1 + 32);
  do
  {
    *(float *)((char *)&v15 + v7) = *(float *)((char *)&v15 + v7) * a3;
    v7 += 4;
  }
  while (v7 != 36);
  v9 = 0;
  v18 = v15;
  v19 = v16;
  v20 = v17;
  do
  {
    *(float *)(a2 + 4 * v9) = sub_21B87BDB0((uint64_t)&v18, v9) + *(float *)(a2 + 4 * v9);
    ++v9;
  }
  while (v9 != 9);
  v10 = (float)(a3 * 0.5) * a3;
  sub_21B87A1B0(a1, a1, (uint64_t)v13);
  for (i = 0; i != 36; i += 4)
    *(float *)((char *)v13 + i) = v10 * *(float *)((char *)v13 + i);
  v12 = 0;
  v18 = v13[0];
  v19 = v13[1];
  v20 = v14;
  do
  {
    *(float *)(a2 + 4 * v12) = sub_21B87BDB0((uint64_t)&v18, v12) + *(float *)(a2 + 4 * v12);
    ++v12;
  }
  while (v12 != 9);
}

void sub_21B879BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t j;
  float v13;
  float v14;
  float *v15;
  uint64_t k;
  unint64_t v17;
  unint64_t v18;
  float v19;
  float v20;
  float v21;
  unint64_t m;
  float v23;
  float v24;
  unint64_t ii;
  unint64_t v26;
  float v27;
  float v28;
  float v29;
  unint64_t jj;
  float v31;
  float v32;
  unint64_t v33;
  float v34;
  float v35;
  float *v36;
  unint64_t kk;
  float v38;
  float v39;
  float *v40;
  unint64_t n;
  float v42;
  NSObject *v43;
  int v44;
  unint64_t v45;
  float v46[3];
  uint64_t v47;

  v8 = 0;
  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a1 + 12;
  do
  {
    for (i = 2; i; i = v11 - 1)
    {
      v11 = i;
      for (j = 0; j != v11; ++j)
      {
        v13 = *(float *)sub_21B87A024(a2, v8, j);
        v14 = *(float *)sub_21B87B6A4(v9, j, v11);
        v15 = (float *)sub_21B87A024(a2, v8, v11);
        *v15 = *v15 + (float)(v13 * v14);
      }
    }
    ++v8;
  }
  while (v8 != 3);
  for (k = 2; ; k = v18 - 1)
  {
    v17 = 0;
    v18 = k;
    v46[k] = 0.0;
    v19 = 0.0;
    do
    {
      v20 = *(float *)sub_21B87A024(a2, v18, v17);
      v21 = v20 * *(float *)sub_21B87A024(a2, v18, v17);
      v19 = v19 + (float)(v21 * *(float *)sub_21B87B830(a1, v17));
      v46[v18] = v19;
      ++v17;
    }
    while (v17 != 3);
    for (m = 0; m != 3; ++m)
    {
      v23 = *(float *)sub_21B87A024(a3, v18, m);
      v24 = v23 * *(float *)sub_21B87A024(a3, v18, m);
      v19 = v19 + (float)(v24 * sub_21B87B1A8(a4, m));
      v46[v18] = v19;
    }
    if (v19 <= 0.0)
      break;
    if (!v18)
    {
      for (n = 0; n != 3; ++n)
      {
        v42 = v46[n];
        *(float *)sub_21B87B830(a1, n) = v42;
      }
      return;
    }
    for (ii = 0; ii != v18; ++ii)
    {
      v26 = 0;
      v27 = 0.0;
      do
      {
        v28 = *(float *)sub_21B87A024(a2, ii, v26);
        v29 = v28 * *(float *)sub_21B87B830(a1, v26);
        v27 = v27 + (float)(v29 * *(float *)sub_21B87A024(a2, v18, v26++));
      }
      while (v26 != 3);
      for (jj = 0; jj != 3; ++jj)
      {
        v31 = *(float *)sub_21B87A024(a3, ii, jj);
        v32 = v31 * sub_21B87B1A8(a4, jj);
        v27 = v27 + (float)(v32 * *(float *)sub_21B87A024(a3, v18, jj));
      }
      v33 = 0;
      *(float *)sub_21B87B6A4(v9, ii, v18) = v27 / v19;
      do
      {
        v34 = *(float *)sub_21B87B6A4(v9, ii, v18);
        v35 = *(float *)sub_21B87A024(a2, v18, v33);
        v36 = (float *)sub_21B87A024(a2, ii, v33);
        *v36 = *v36 - (float)(v34 * v35);
        ++v33;
      }
      while (v33 != 3);
      for (kk = 0; kk != 3; ++kk)
      {
        v38 = *(float *)sub_21B87B6A4(v9, ii, v18);
        v39 = *(float *)sub_21B87A024(a3, v18, kk);
        v40 = (float *)sub_21B87A024(a3, ii, kk);
        *v40 = *v40 - (float)(v38 * v39);
      }
    }
  }
  if (qword_25518E200 != -1)
    dispatch_once(&qword_25518E200, &unk_24DF3A980);
  v43 = qword_25518E208;
  if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
  {
    v44 = 134217984;
    v45 = v18;
    _os_log_impl(&dword_21B72A000, v43, OS_LOG_TYPE_DEBUG, "D[%zu] <= 0, matrix ! positive definite", (uint8_t *)&v44, 0xCu);
  }
}

float sub_21B879FC8(uint64_t a1)
{
  float v2;
  unint64_t i;

  v2 = sub_21B87B94C(a1, 0, 0);
  for (i = 1; i != 3; ++i)
    v2 = v2 + sub_21B87B94C(a1, i, i);
  return v2;
}

uint64_t sub_21B87A024(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (3 * a3 + a2);
}

float *sub_21B87A1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t i;
  unint64_t j;
  float v8;
  float v9;
  unint64_t k;
  float v11;
  float v12;
  float *result;

  for (i = 0; i != 3; ++i)
  {
    for (j = 0; j != 3; ++j)
    {
      v8 = sub_21B87B518(a1, i, 0);
      v9 = v8 * sub_21B87B518(a2, 0, j);
      *(float *)sub_21B87A024(a3, i, j) = v9;
      for (k = 1; k != 3; ++k)
      {
        v11 = sub_21B87B518(a1, i, k);
        v12 = sub_21B87B518(a2, k, j);
        result = (float *)sub_21B87A024(a3, i, j);
        *result = *result + (float)(v11 * v12);
      }
    }
  }
  return result;
}

void sub_21B87A29C(uint64_t a1, float *a2, uint64_t a3, unint64_t a4)
{
  unsigned __int8 v8;
  float32x4_t *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  float v16;
  float v17;
  unsigned int v18;
  unsigned int v19;
  __int32 v20;
  unint64_t v21;
  uint64_t i;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float32x4_t v30;
  NSObject *v31;
  uint64_t v32;
  float v33[3];
  __int128 v34;
  __int128 v35;
  int v36;
  _OWORD v37[2];
  int v38;
  float32x4_t v39;
  float32x4_t v40[2];
  _OWORD v41[2];
  int v42;
  float v43[9];
  _OWORD v44[2];
  int v45;
  _BYTE v46[24];
  uint64_t v47;
  float v48;
  __int128 v49;
  __int128 v50;
  int v51;
  _BYTE buf[32];
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 24) == a4)
  {
    v8 = atomic_load((unsigned __int8 *)&qword_25518E390);
    if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_25518E390))
    {
      qword_25518E380 = 0x3F80000000000000;
      dword_25518E388 = 0;
      __cxa_guard_release(&qword_25518E390);
    }
    v9 = (float32x4_t *)(a1 + 4);
    v10 = sub_21B893128((float *)(a1 + 4), *(float *)&qword_25518E380, *((float *)&qword_25518E380 + 1), *(float *)&dword_25518E388);
    v12 = v11;
    v14 = v13;
    v15 = 0;
    LODWORD(v49) = 0;
    *((float *)&v49 + 1) = v13;
    *((float *)&v49 + 2) = -v11;
    *((float *)&v49 + 3) = -v13;
    LODWORD(v50) = 0;
    *(_QWORD *)((char *)&v50 + 4) = __PAIR64__(LODWORD(v11), LODWORD(v10));
    *((float *)&v50 + 3) = -v10;
    v51 = 0;
    do
    {
      *(float *)((char *)&v49 + v15) = *(float *)((char *)&v49 + v15) + *(float *)((char *)&v49 + v15);
      v15 += 4;
    }
    while (v15 != 36);
    *(_OWORD *)buf = v49;
    *(_OWORD *)&buf[16] = v50;
    v53 = v51;
    *(float *)&v47 = sub_21B884F78(a2) - v10;
    *((float *)&v47 + 1) = v16 - v12;
    v48 = v17 - v14;
    sub_21B88506C(a2, (uint64_t)v46);
    v39.i32[0] = sub_21B87A834(a3);
    *(uint64_t *)((char *)v39.i64 + 4) = __PAIR64__(v19, v18);
    v39.i32[3] = v20;
    sub_21B87A750((uint64_t)v46, (uint64_t)&v39, (uint64_t)v43);
    sub_21B87A8B0((uint64_t)v46, (uint64_t)v40);
    sub_21B87A674((uint64_t)v43, (uint64_t)v40, (uint64_t)v44);
    sub_21B893118((float *)(a1 + 4), v43);
    sub_21B87A1B0((uint64_t)v43, (uint64_t)v44, (uint64_t)v40);
    sub_21B87A940((uint64_t)v43, (uint64_t)&v39);
    sub_21B87A1B0((uint64_t)v40, (uint64_t)&v39, (uint64_t)v41);
    v21 = 0;
    v34 = 0u;
    v35 = 0u;
    v36 = 0;
    do
    {
      *(_DWORD *)sub_21B87A024((uint64_t)&v34, v21, v21) = 1065353216;
      ++v21;
    }
    while (v21 != 3);
    for (i = 0; i != 36; i += 4)
      *(float *)((char *)&v34 + i) = *(float *)((char *)&v34 + i) * 0.01;
    v23 = 0;
    v37[0] = v34;
    v37[1] = v35;
    v38 = v36;
    do
    {
      *((float *)v41 + v23) = sub_21B87BDB0((uint64_t)v37, v23) + *((float *)v41 + v23);
      ++v23;
    }
    while (v23 != 9);
    v44[0] = v41[0];
    v44[1] = v41[1];
    v45 = v42;
    LODWORD(v37[0]) = sub_21B87A9B8((uint64_t)v44);
    *(_QWORD *)((char *)v37 + 4) = __PAIR64__(v25, v24);
    if (sub_21B87AA20(a1, (uint64_t)buf, &v47, (uint64_t)v44, a4))
    {
      sub_21B87AC78((float *)(a1 + 32), (uint64_t)buf, (uint64_t)v37, (uint64_t)&v47);
      v29 = (float)((float)(v14 * v26) + (float)(v12 * v27)) + (float)(v10 * v28);
      v33[0] = v28 - (float)(v10 * v29);
      v33[1] = v27 - (float)(v12 * v29);
      v33[2] = v26 - (float)(v14 * v29);
      *(double *)v30.i64 = sub_21B8931F8(v40, v33);
      sub_21B892E6C((uint64_t)v40, v9->f32, &v39, v30);
      if (v9 != &v39)
        *v9 = v39;
    }
  }
  else
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3A940);
    v31 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v32 = *(_QWORD *)(a1 + 24);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl(&dword_21B72A000, v31, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollMEKF]:[ringMeasurementUpdate] Measurement timestamp: %llu us must match the state timestamp: %llu us", buf, 0x16u);
    }
  }
}

float *sub_21B87A674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t i;
  unint64_t j;
  float v8;
  float v9;
  float v10;
  float v11;
  float *result;

  for (i = 0; i != 3; ++i)
  {
    for (j = 0; j != 3; ++j)
    {
      v8 = sub_21B87C028(a1, i, 0);
      v9 = v8 * sub_21B87C650(a2, 0, j);
      *(float *)sub_21B87A024(a3, i, j) = v9;
      v10 = sub_21B87C028(a1, i, 1uLL);
      v11 = sub_21B87C650(a2, 1uLL, j);
      result = (float *)sub_21B87A024(a3, i, j);
      *result = *result + (float)(v10 * v11);
    }
  }
  return result;
}

float *sub_21B87A750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t i;
  unint64_t v7;
  char v8;
  char v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float *result;

  for (i = 0; i != 3; ++i)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = v8;
      v10 = sub_21B87C028(a1, i, 0);
      v11 = v10 * sub_21B87C1B4(a2, 0, v7);
      *(float *)sub_21B87C33C(a3, i, v7) = v11;
      v12 = sub_21B87C028(a1, i, 1uLL);
      v13 = sub_21B87C1B4(a2, 1uLL, v7);
      result = (float *)sub_21B87C33C(a3, i, v7);
      v8 = 0;
      *result = *result + (float)(v12 * v13);
      v7 = 1;
    }
    while ((v9 & 1) != 0);
  }
  return result;
}

float sub_21B87A834(uint64_t a1)
{
  float v2;
  float v3;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  v2 = sub_21B878C7C(a1, 0);
  *(float *)sub_21B87BEA0((uint64_t)v5, 0, 0) = v2;
  v3 = sub_21B878C7C(a1, 1uLL);
  *(float *)sub_21B87BEA0((uint64_t)v5, 1uLL, 1uLL) = v3;
  return *(float *)v5;
}

float *sub_21B87A8B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t i;
  float v5;
  float v6;
  float *result;

  for (i = 0; i != 3; ++i)
  {
    v5 = sub_21B87C028(a1, i, 0);
    *(float *)sub_21B87C4C8(a2, 0, i) = v5;
    v6 = sub_21B87C028(a1, i, 1uLL);
    result = (float *)sub_21B87C4C8(a2, 1uLL, i);
    *result = v6;
  }
  return result;
}

float *sub_21B87A940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t i;
  unint64_t j;
  float v6;
  float *result;

  for (i = 0; i != 3; ++i)
  {
    for (j = 0; j != 3; ++j)
    {
      v6 = sub_21B87B518(a1, i, j);
      result = (float *)sub_21B87A024(a2, j, i);
      *result = v6;
    }
  }
  return result;
}

float sub_21B87A9B8(uint64_t a1)
{
  unint64_t i;
  float v3;
  float v5;

  for (i = 0; i != 3; ++i)
  {
    v3 = sub_21B87B518(a1, i, i);
    *(float *)sub_21B87C7D8((uint64_t)&v5, i) = v3;
  }
  return v5;
}

BOOL sub_21B87AA20(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, unint64_t a5)
{
  unint64_t i;
  int v10;
  float v11;
  float v12;
  unsigned int v13;
  unsigned int v14;
  float v15;
  _BOOL8 v16;
  NSObject *v17;
  double v18;
  double v19;
  double v20;
  float v22[3];
  char v23;
  uint64_t v24;
  int v25;
  _BYTE v26[36];
  _OWORD v27[2];
  int v28;
  _OWORD v29[2];
  int v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  sub_21B87BCA0(a1 + 32, 0, 0, (uint64_t)v26);
  sub_21B87A1B0(a2, (uint64_t)v26, (uint64_t)buf);
  sub_21B87A940(a2, (uint64_t)&v24);
  sub_21B87A1B0((uint64_t)buf, (uint64_t)&v24, (uint64_t)v27);
  for (i = 0; i != 9; ++i)
    *((float *)v27 + i) = sub_21B87BDB0(a4, i) + *((float *)v27 + i);
  v29[0] = v27[0];
  v29[1] = v27[1];
  v30 = v28;
  v23 = 0;
  sub_21B87AFC8((float *)v29, &v23, (uint64_t)v26);
  if (!v23)
    return 0;
  v10 = *((_DWORD *)a3 + 2);
  v24 = *a3;
  v25 = v10;
  v22[0] = sub_21B87B3E0((uint64_t)&v24);
  v22[1] = v11;
  v22[2] = v12;
  *(_DWORD *)buf = sub_21B87B310(v22, (uint64_t)v26);
  v32 = COERCE_DOUBLE(__PAIR64__(v14, v13));
  v15 = sub_21B87B298((float *)buf, (float *)&v24);
  v16 = v15 < 16.266;
  if (v15 >= 16.266)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3A940);
    v17 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(float *)a3;
      v19 = *((float *)a3 + 1);
      v20 = *((float *)a3 + 2);
      *(_DWORD *)buf = 134219264;
      v32 = (float)((float)a5 * 0.000001);
      v33 = 2048;
      v34 = v15;
      v35 = 2048;
      v36 = 0x40304425A0000000;
      v37 = 2048;
      v38 = v18;
      v39 = 2048;
      v40 = v19;
      v41 = 2048;
      v42 = v20;
      _os_log_impl(&dword_21B72A000, v17, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMABarrelRollMEKF]:[checkNIS] Measurement rejected by NIS check.t: %.6f s, NIS score: %.6f,  NIS Threshold: %.6f, r: %.6f %.6f %.6f", buf, 0x3Eu);
    }
  }
  return v16;
}

void sub_21B87AC78(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  float v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t i;
  float v18;
  float v19;
  float v20;
  float *v21;
  unint64_t v22;
  float v23;
  float v24;
  float *v25;
  float v26;
  unint64_t v27;
  float v28;
  float v29;
  float *v30;
  NSObject *v31;
  uint64_t v33;
  int v34;
  uint8_t buf[4];
  unint64_t v36;
  float v37[3];
  float v38[3];
  uint64_t v39;

  v7 = 0;
  v39 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v34 = 0;
  v8 = (uint64_t)(a1 + 3);
  while (2)
  {
    v9 = 0;
    v10 = -1;
    do
    {
      v11 = sub_21B87B518(a2, v7, v9);
      v12 = v10;
      if (v9)
      {
        do
        {
          v13 = sub_21B87B518(a2, v7, v12);
          v11 = v11 + (float)(v13 * *(float *)sub_21B87B6A4(v8, v12--, v9));
        }
        while (v12 != -1);
      }
      v38[v9] = v11;
      v37[v9] = v11 * *(float *)sub_21B87B830((uint64_t)a1, v9);
      ++v9;
      ++v10;
    }
    while (v9 != 3);
    v14 = sub_21B87B1A8(a3, v7);
    v15 = v14 + (float)(v38[0] * v37[0]);
    if (v15 <= 0.0)
    {
      if (qword_25518E200 != -1)
        dispatch_once(&qword_25518E200, &unk_24DF3A980);
      v31 = qword_25518E208;
      if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v36 = v7;
LABEL_20:
        _os_log_impl(&dword_21B72A000, v31, OS_LOG_TYPE_DEBUG, "%zu: alpha <= 0, matrix ! positive definite", buf, 0xCu);
      }
    }
    else
    {
      v16 = 1.0 / v15;
      *a1 = *a1 * (float)((float)(1.0 / v15) * sub_21B87B1A8(a3, v7));
      for (i = 1; i != 3; ++i)
      {
        v18 = v38[i];
        v19 = v15 + (float)(v18 * v37[i]);
        if (v19 <= 0.0)
        {
          if (qword_25518E200 != -1)
            dispatch_once(&qword_25518E200, &unk_24DF3A980);
          v31 = qword_25518E208;
          if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v36 = v7;
            goto LABEL_20;
          }
          return;
        }
        v20 = -(float)(v18 * v16);
        v16 = 1.0 / v19;
        v21 = (float *)sub_21B87B830((uint64_t)a1, i);
        v22 = 0;
        *v21 = (float)(v15 * (float)(1.0 / v19)) * *v21;
        do
        {
          v23 = *(float *)sub_21B87B6A4(v8, v22, i);
          v24 = v37[v22];
          v25 = (float *)sub_21B87B6A4(v8, v22, i);
          v26 = v37[i];
          *v25 = v23 + (float)(v24 * v20);
          v37[v22++] = v24 + (float)(v26 * v23);
        }
        while (i != v22);
        v15 = v19;
      }
      v27 = 0;
      v28 = v16 * sub_21B87B1A8(a4, v7);
      do
      {
        v29 = v37[v27];
        v30 = (float *)sub_21B87C7D8((uint64_t)&v33, v27);
        *v30 = *v30 + (float)(v28 * v29);
        ++v27;
      }
      while (v27 != 3);
      if (++v7 != 3)
        continue;
    }
    break;
  }
}

float *sub_21B87AFC8@<X0>(float *a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>)
{
  float v6;
  unint64_t v7;
  float *result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  int v29;
  _OWORD v30[2];
  int v31;

  v6 = sub_21B87C8C8(a1);
  if (fabsf(v6) >= 0.000000001)
  {
    v25 = a3;
    v9 = 0;
    *a2 = 1;
    do
    {
      v10 = 0;
      v11 = v9;
      if (v9)
        v12 = (int)v9 - 1;
      else
        v12 = 2;
      v13 = v9 + 1;
      v26 = v13;
      if (v13 == 3)
        v14 = 0;
      else
        v14 = v13;
      v15 = 0xFFFFFFFF00000000;
      do
      {
        if (v10)
          v16 = v15 >> 32;
        else
          v16 = 2;
        v17 = v10 + 1;
        if (v10 == 2)
          v18 = 0;
        else
          v18 = v10 + 1;
        v19 = sub_21B87B518((uint64_t)a1, v12, v16);
        v20 = sub_21B87B518((uint64_t)a1, v14, v18);
        v21 = sub_21B87B518((uint64_t)a1, v14, v16);
        v22 = (float)(v19 * v20) - (float)(v21 * sub_21B87B518((uint64_t)a1, v12, v18));
        result = (float *)sub_21B87A024((uint64_t)v30, v10, v11);
        *result = v22;
        v15 += 0x100000000;
        ++v10;
      }
      while (v17 != 3);
      v9 = v26;
    }
    while (v26 != 3);
    v23 = 0;
    v27 = v30[0];
    v28 = v30[1];
    v29 = v31;
    do
    {
      *(float *)((char *)&v27 + v23) = *(float *)((char *)&v27 + v23) / v6;
      v23 += 4;
    }
    while (v23 != 36);
    v24 = v28;
    *(_OWORD *)v25 = v27;
    *(_OWORD *)(v25 + 16) = v24;
    *(_DWORD *)(v25 + 32) = v29;
  }
  else
  {
    v7 = 0;
    *a2 = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    do
    {
      result = (float *)sub_21B87A024(a3, v7, v7);
      *result = 1.0;
      ++v7;
    }
    while (v7 != 3);
  }
  return result;
}

float sub_21B87B1A8(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 3;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 271,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

float sub_21B87B298(float *a1, float *a2)
{
  float v4;
  unint64_t i;
  float v6;

  v4 = *a1 * *a2;
  for (i = 1; i != 3; ++i)
  {
    v6 = sub_21B87CC1C((uint64_t)a1, 0, i);
    v4 = v4 + (float)(v6 * sub_21B87C910((uint64_t)a2, i, 0));
  }
  return v4;
}

float sub_21B87B310(float *a1, uint64_t a2)
{
  unint64_t i;
  float v5;
  float v6;
  unint64_t j;
  float v8;
  float v9;
  float *v10;
  float v12;

  for (i = 0; i != 3; ++i)
  {
    v5 = *a1;
    v6 = v5 * sub_21B87B518(a2, 0, i);
    *(float *)sub_21B87CA98((uint64_t)&v12, 0, i) = v6;
    for (j = 1; j != 3; ++j)
    {
      v8 = sub_21B87CC1C((uint64_t)a1, 0, j);
      v9 = sub_21B87B518(a2, j, i);
      v10 = (float *)sub_21B87CA98((uint64_t)&v12, 0, i);
      *v10 = *v10 + (float)(v8 * v9);
    }
  }
  return v12;
}

float sub_21B87B3E0(uint64_t a1)
{
  unint64_t i;
  float v3;
  float v5;

  for (i = 0; i != 3; ++i)
  {
    v3 = sub_21B87C910(a1, i, 0);
    *(float *)sub_21B87CA98((uint64_t)&v5, 0, i) = v3;
  }
  return v5;
}

os_log_t sub_21B87B44C()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

BOOL sub_21B87B478(uint64_t a1)
{
  unint64_t v2;
  char v3;
  char v4;
  unint64_t v5;
  float v6;
  float v7;

  v2 = 0;
  v3 = 1;
LABEL_2:
  v4 = v3;
  v5 = v2 + 1;
  while (1)
  {
    v6 = sub_21B87B518(a1, v2, v5);
    v7 = v6 - sub_21B87B518(a1, v5, v2);
    if (v7 <= 0.0)
      v7 = -v7;
    if (v7 > 1.0e-16)
      return v7 <= 1.0e-16;
    if (++v5 == 3)
    {
      v3 = 0;
      v2 = 1;
      if ((v4 & 1) != 0)
        goto LABEL_2;
      return v7 <= 1.0e-16;
    }
  }
}

float sub_21B87B518(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (3 * a3 + a2));
}

uint64_t sub_21B87B6A4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 237,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = a2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col > row, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 238,invalid element %zu <= %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + (((a3 - 1) * a3) >> 1));
}

uint64_t sub_21B87B830(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 3;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: row < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 191,invalid row %zu > %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

os_log_t sub_21B87B920()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

float sub_21B87B94C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  float v4;
  uint64_t v8;
  float v9;
  float v10;

  if (a2 <= a3)
    v3 = a3;
  else
    v3 = a2;
  v4 = 0.0;
  if (v3 <= 2)
  {
    v8 = a1 + 12;
    do
    {
      v9 = 1.0;
      v10 = 1.0;
      if (a3 != v3)
      {
        v10 = 0.0;
        if (v3 > a3)
          v10 = sub_21B87BA24(v8, a3, v3);
      }
      if (a2 != v3)
      {
        v9 = 0.0;
        if (v3 > a2)
          v9 = sub_21B87BA24(v8, a2, v3);
      }
      v4 = v4 + (float)((float)(v9 * sub_21B87BBB0(a1, v3++)) * v10);
    }
    while (v3 != 3);
  }
  return v4;
}

float sub_21B87BA24(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 231,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = a2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col > row, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 232,invalid element %zu <= %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + (((a3 - 1) * a3) >> 1)));
}

float sub_21B87BBB0(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 3;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: row < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 186,invalid row %zu > %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

float *sub_21B87BCA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t i;
  unint64_t j;
  float v10;
  float *result;
  NSObject *v12;
  uint8_t v13[16];

  if (a3 | a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v12 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21B72A000, v12, OS_LOG_TYPE_FAULT, "Assertion failed: i0 < N-Ni+1 && j0 < N-Nj+1, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 302,indices exceed factored matrix size.", v13, 2u);
    }
  }
  for (i = 0; i != 3; ++i)
  {
    for (j = 0; j != 3; ++j)
    {
      v10 = sub_21B87B94C(a1, i + a2, a3 + j);
      result = (float *)sub_21B87A024(a4, i, j);
      *result = v10;
    }
  }
  return result;
}

float sub_21B87BDB0(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 9)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 9;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: ldx < M*N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 84,invalid element %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

uint64_t sub_21B87BEA0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + 2 * a3);
}

float sub_21B87C028(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (3 * a3 + a2));
}

float sub_21B87C1B4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + 2 * a3));
}

uint64_t sub_21B87C33C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (3 * a3 + a2);
}

uint64_t sub_21B87C4C8(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + 2 * a3);
}

float sub_21B87C650(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + 2 * a3));
}

uint64_t sub_21B87C7D8(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 3;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: i < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMVector.h, line 277,invalid index %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

float sub_21B87C8C8(float *a1)
{
  return (float)((float)((float)((float)((float)((float)(a1[3] * a1[7]) * a1[2]) + (float)((float)(*a1 * a1[4]) * a1[8]))
                               + (float)((float)(a1[6] * a1[1]) * a1[5]))
                       + (float)((float)-(float)(*a1 * a1[7]) * a1[5]))
               + (float)((float)-(float)(a1[3] * a1[1]) * a1[8]))
       + (float)((float)-(float)(a1[6] * a1[4]) * a1[2]);
}

float sub_21B87C910(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (3 * a3 + a2));
}

uint64_t sub_21B87CA98(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a3 + a2);
}

float sub_21B87CC1C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3A980);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 3;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a3 + a2));
}

uint64_t sub_21B87CDA0(int a1, uint32_t __upper_bound)
{
  return arc4random_uniform(__upper_bound);
}

void sub_21B87CDB0()
{
  JUMPOUT(0x220766390);
}

float sub_21B87CDC4(float *a1)
{
  float v1;
  float v2;

  v1 = 1.57079633 - sub_21B87CE48(a1);
  fmod(v2 + 1.57079633 + 3.14159265, 6.28318531);
  return v1;
}

float sub_21B87CE48(float *a1)
{
  float v1;
  float v3[9];

  sub_21B893118(a1, v3);
  v1 = asinf(v3[7]);
  atan2f(v3[6], v3[8]);
  atan2f(v3[1], v3[4]);
  return v1;
}

uint64_t sub_21B87CEA4(uint64_t result)
{
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_BYTE *)(result + 16) = 0;
  return result;
}

double sub_21B87CEB0@<D0>(int *a1@<X0>, float32x4_t *a2@<X8>)
{
  int v2;
  uint64_t v4;
  int v5;

  v2 = *a1;
  v4 = 0;
  v5 = v2;
  return sub_21B8931F8(a2, (float *)&v4);
}

void sub_21B87CEE0(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  float *v5;
  float v6;
  float v7;
  float v8;
  int v9;
  int v10;

  if (*(_BYTE *)(a1 + 16))
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (a2 >= v4)
    {
      v5 = (float *)(a1 + 4);
      v6 = 0.0;
      if ((float)(*(float *)(a1 + 4) + 0.0) < 0.27416)
      {
        v9 = 1065353216;
        v10 = 1065353216;
        if (v4)
        {
          v7 = (double)(a2 - v4) * 0.000001;
          v6 = v7 * 0.0000030462;
        }
        v8 = v6;
        sub_21B87CF84(v5, (uint64_t)&v10, (uint64_t)&v9, &v8);
      }
      *(_QWORD *)(a1 + 8) = a2;
    }
  }
}

void sub_21B87CF84(float *a1, uint64_t a2, uint64_t a3, float *a4)
{
  float v8;
  float v9;
  float v10;
  float v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = *(float *)sub_21B87DA2C(a2, 0, 0);
  v9 = (float)((float)(v8 * *(float *)sub_21B87DA2C(a2, 0, 0)) * *a1) + 0.0;
  v10 = *(float *)sub_21B87DA2C(a3, 0, 0);
  v11 = v9 + (float)((float)(v10 * *(float *)sub_21B87DA2C(a3, 0, 0)) * *a4);
  if (v11 <= 0.0)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v12 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134217984;
      v14 = 0;
      _os_log_impl(&dword_21B72A000, v12, OS_LOG_TYPE_DEBUG, "D[%zu] <= 0, matrix ! positive definite", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    *a1 = v11;
  }
}

void sub_21B87D0E0(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5, unint64_t a6)
{
  unint64_t v6;
  BOOL v8;
  float v11[8];

  v6 = *(_QWORD *)(a1 + 8);
  if (a6 >= v6)
  {
    if (v6)
      v8 = (a6 - v6) > 0xF4240;
    else
      v8 = 0;
    if (!v8)
    {
      sub_21B884FC0((uint64_t)v11, a2, a3, a4, a5);
      if (*(_BYTE *)(a1 + 16))
      {
        sub_21B87CEE0(a1, a6);
        sub_21B87D1D8((float *)a1, v11, a3);
      }
      else
      {
        sub_21B87D178(a1, v11, a6);
      }
    }
  }
}

uint64_t sub_21B87D178(uint64_t result, float *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  int v6;

  if (!*(_BYTE *)(result + 16))
  {
    v4 = result;
    sub_21B885010(a2);
    *(_DWORD *)v4 = v5;
    v6 = 1022986982;
    result = sub_21B87D37C(v4 + 4, (uint64_t)&v6);
    *(_QWORD *)(v4 + 8) = a3;
    *(_BYTE *)(v4 + 16) = 1;
  }
  return result;
}

void sub_21B87D1D8(float *a1, float *a2, _DWORD *a3)
{
  float v6;
  float v7;
  float v8;
  __float2 v9;
  int v10;
  int v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  __int32 v23;
  float v24;
  float v25;
  float v26;
  float32x2_t v32;
  float32x2_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  _DWORD v40[4];
  _DWORD v41[2];
  float v42[4];
  _DWORD v43[2];

  v6 = sub_21B884FC4(a2, *a1);
  v8 = v7;
  *(float *)v43 = v6;
  *(float *)&v43[1] = v7;
  v9 = __sincosf_stret(*a1);
  v42[0] = -v9.__sinval;
  v42[1] = -v9.__cosval;
  v42[2] = v9.__cosval;
  v42[3] = -v9.__sinval;
  v41[0] = sub_21B87D48C((uint64_t)v42, a2);
  v41[1] = v10;
  v11 = a3[1];
  v40[0] = *a3;
  v40[1] = 0;
  v40[2] = 0;
  v40[3] = v11;
  v33.f32[0] = a1[1] + 0.0;
  v34 = sub_21B87D6C4((uint64_t)v41, (float *)&v33);
  v35 = v12;
  v38 = sub_21B87D74C((uint64_t)v41);
  v39 = v13;
  v14 = sub_21B87D5A0((uint64_t)&v34, (uint64_t)&v38);
  v18 = sub_21B87D538((uint64_t)v40, v14, v15, v16, v17);
  v22 = (float)(v18 * v21) - (float)(v20 * v19);
  if (fabsf(v22) >= 0.000001)
  {
    v34 = v21 / v22;
    v35 = (float)-v19 / v22;
    v36 = (float)-v20 / v22;
    v37 = v18 / v22;
    v38 = v6;
    v39 = v8;
    v33.i32[0] = sub_21B87D74C((uint64_t)&v38);
    v33.i32[1] = v23;
    v24 = sub_21B87D7C8((float *)&v33, (uint64_t)&v34);
    if ((float)((float)(v38 * v24) + (float)(v25 * v39)) < 16.266)
    {
      v33 = *(float32x2_t *)a3;
      v26 = sub_21B87D87C(a1 + 1, (uint64_t)v41, (uint64_t)&v33, (uint64_t)v43);
      if (fabsf(v26) > 0.17453)
      {
        __asm { FMOV            V1.2S, #16.0 }
        v32 = vmul_f32(v33, _D1);
        v26 = sub_21B87D87C(a1 + 1, (uint64_t)v41, (uint64_t)&v32, (uint64_t)v43);
      }
      *a1 = v26 + *a1;
    }
  }
}

BOOL sub_21B87D37C(uint64_t a1, uint64_t a2)
{
  float v3;
  float v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21B87DC98(a2, 0, 0);
  *(float *)sub_21B87DBAC(a1, 0) = v3;
  v4 = *(float *)sub_21B87DBAC(a1, 0);
  if (v4 <= 0.0)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134217984;
      v8 = 0;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_DEBUG, "D(%zu) <= 0 non-positive definite matrix!", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 > 0.0;
}

float sub_21B87D48C(uint64_t a1, float *a2)
{
  unint64_t v4;
  char v5;
  char v6;
  float v7;
  float v8;
  float v9;
  float *v10;
  float v12;

  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = sub_21B87C1B4(a1, v4, 0) * *a2;
    *(float *)sub_21B878D6C((uint64_t)&v12, v4) = v7;
    v8 = sub_21B87C1B4(a1, v4, 1uLL);
    v9 = a2[1];
    v10 = (float *)sub_21B878D6C((uint64_t)&v12, v4);
    v5 = 0;
    *v10 = *v10 + (float)(v8 * v9);
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v12;
}

float sub_21B87D538(uint64_t a1, float a2, float a3, float a4, float a5)
{
  unint64_t v6;
  _DWORD v8[4];

  v6 = 0;
  *(float *)v8 = a2;
  *(float *)&v8[1] = a3;
  *(float *)&v8[2] = a4;
  *(float *)&v8[3] = a5;
  do
  {
    *(float *)&v8[v6] = sub_21B87E428(a1, v6) + *(float *)&v8[v6];
    ++v6;
  }
  while (v6 != 4);
  return *(float *)v8;
}

float sub_21B87D5A0(uint64_t a1, uint64_t a2)
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v13;

  v4 = sub_21B87DE18(a1, 0, 0);
  v5 = v4 * sub_21B87E2A4(a2, 0, 0);
  *(float *)sub_21B87BEA0((uint64_t)&v13, 0, 0) = v5;
  v6 = sub_21B87DE18(a1, 0, 0);
  v7 = v6 * sub_21B87E2A4(a2, 0, 1uLL);
  *(float *)sub_21B87BEA0((uint64_t)&v13, 0, 1uLL) = v7;
  v8 = sub_21B87DE18(a1, 1uLL, 0);
  v9 = v8 * sub_21B87E2A4(a2, 0, 0);
  *(float *)sub_21B87BEA0((uint64_t)&v13, 1uLL, 0) = v9;
  v10 = sub_21B87DE18(a1, 1uLL, 0);
  v11 = v10 * sub_21B87E2A4(a2, 0, 1uLL);
  *(float *)sub_21B87BEA0((uint64_t)&v13, 1uLL, 1uLL) = v11;
  return v13;
}

float sub_21B87D6C4(uint64_t a1, float *a2)
{
  float v4;
  float v5;
  float v7;

  v4 = sub_21B87DE18(a1, 0, 0) * *a2;
  *(float *)sub_21B87DF9C((uint64_t)&v7, 0, 0) = v4;
  v5 = sub_21B87DE18(a1, 1uLL, 0) * *a2;
  *(float *)sub_21B87DF9C((uint64_t)&v7, 1uLL, 0) = v5;
  return v7;
}

float sub_21B87D74C(uint64_t a1)
{
  float v2;
  float v3;
  float v5;

  v2 = sub_21B87DE18(a1, 0, 0);
  *(float *)sub_21B87E120((uint64_t)&v5, 0, 0) = v2;
  v3 = sub_21B87DE18(a1, 1uLL, 0);
  *(float *)sub_21B87E120((uint64_t)&v5, 0, 1uLL) = v3;
  return v5;
}

float sub_21B87D7C8(float *a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  char v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float *v11;
  float v13;

  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = *a1;
    v8 = v7 * sub_21B87C1B4(a2, 0, v4);
    *(float *)sub_21B87E120((uint64_t)&v13, 0, v4) = v8;
    v9 = a1[1];
    v10 = sub_21B87C1B4(a2, 1uLL, v4);
    v11 = (float *)sub_21B87E120((uint64_t)&v13, 0, v4);
    v5 = 0;
    *v11 = *v11 + (float)(v9 * v10);
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v13;
}

float sub_21B87D87C(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  float v9;
  char v10;
  char v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  NSObject *v17;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v8 = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  v9 = 0.0;
  v10 = 1;
  while (1)
  {
    v11 = v10;
    v12 = sub_21B87DE18(a2, v8, 0);
    v13 = v12 * *a1;
    v14 = sub_21B878C7C(a3, v8) + (float)(v12 * v13);
    if (v14 <= 0.0)
      break;
    v15 = 1.0 / v14;
    *a1 = *a1 * (float)((float)(1.0 / v14) * sub_21B878C7C(a3, v8));
    v16 = sub_21B878C7C(a4, v8);
    v10 = 0;
    v9 = v9 + (float)((float)(v15 * v16) * v13);
    v8 = 1;
    if ((v11 & 1) == 0)
      return v9;
  }
  if (qword_25518E200 != -1)
    dispatch_once(&qword_25518E200, &unk_24DF3AA18);
  v17 = qword_25518E208;
  v9 = 0.0;
  if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134217984;
    v20 = v8;
    _os_log_impl(&dword_21B72A000, v17, OS_LOG_TYPE_DEBUG, "%zu: alpha <= 0, matrix ! positive definite", (uint8_t *)&v19, 0xCu);
  }
  return v9;
}

os_log_t sub_21B87DA00()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

uint64_t sub_21B87DA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a3 + a2);
}

uint64_t sub_21B87DBAC(uint64_t a1, uint64_t a2)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 1;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: row < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMFactoredMatrix.h, line 191,invalid row %zu > %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return a1 + 4 * a2;
}

float sub_21B87DC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a3 + a2));
}

float sub_21B87DE18(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a2 + 2 * a3));
}

uint64_t sub_21B87DF9C(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a2 + 2 * a3);
}

uint64_t sub_21B87E120(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 77,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 78,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return a1 + 4 * (a3 + a2);
}

float sub_21B87E2A4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v7 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = 1;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: row < M, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 70,invalid row %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (a3 >= 2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v8 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_FAULT, "Assertion failed: col < N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 71,invalid col %zu > %zu.", (uint8_t *)&v9, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * (a3 + a2));
}

float sub_21B87E428(uint64_t a1, unint64_t a2)
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 4)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AA18);
    v5 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v6 = 134218240;
      v7 = a2;
      v8 = 2048;
      v9 = 4;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_FAULT, "Assertion failed: ldx < M*N, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/Math/CMMatrix.h, line 84,invalid element %zu >= %zu.", (uint8_t *)&v6, 0x16u);
    }
  }
  return *(float *)(a1 + 4 * a2);
}

uint64_t sub_21B87E518(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  *(_DWORD *)a1 = 0;
  sub_21B880800(a1 + 8);
  *(_BYTE *)(a1 + 9920) = 0;
  *(_OWORD *)(a1 + 9904) = 0u;
  *(_OWORD *)(a1 + 9888) = 0u;
  *(_OWORD *)(a1 + 9928) = 0u;
  *(_OWORD *)(a1 + 9944) = 0u;
  *(_QWORD *)(a1 + 9960) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(a1 + 9968) = 0;
  *(_QWORD *)(a1 + 9976) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(a1 + 9984) = 0;
  *(_QWORD *)(a1 + 9992) = 0xFF7FFFFF7F7FFFFFLL;
  *(_BYTE *)(a1 + 10000) = 0;
  *(_OWORD *)(a1 + 10008) = 0u;
  *(_DWORD *)(a1 + 10024) = 0;
  sub_21B880B9C(a1 + 10032);
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
  v2 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B72A000, v2, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService] Created CMABarrelRollService.", v4, 2u);
  }
  return a1;
}

void sub_21B87E618(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_21B87E62C(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_21B87E62C(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = a1 + 834;
  v3 = (_QWORD *)a1[837];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  sub_21B880B04(a1 + 772);
  sub_21B880D14(a1 + 701);
  sub_21B880D14(a1 + 695);
  sub_21B880D14(a1 + 537);
  sub_21B880D14(a1 + 531);
  return a1;
}

void sub_21B87E6C0(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sub_21B886754((unsigned __int16 *)(a1 + 8));
  *(_BYTE *)(a1 + 9920) = 0;
  *(_QWORD *)(a1 + 9888) = 0;
  *(_QWORD *)(a1 + 9904) = 0;
  *(_QWORD *)(a1 + 9896) = 0;
  *(_OWORD *)(a1 + 9928) = 0u;
  *(_OWORD *)(a1 + 9944) = 0u;
  *(_QWORD *)(a1 + 9960) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(a1 + 9968) = 0;
  *(_QWORD *)(a1 + 9976) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(a1 + 9984) = 0;
  *(_QWORD *)(a1 + 9992) = 0xFF7FFFFF7F7FFFFFLL;
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
  v2 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21B72A000, v2, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[reset] Reset CMABarrelRollService.", v3, 2u);
  }
}

void sub_21B87E794(uint64_t a1, unint64_t a2, int a3, int a4, float a5, float a6)
{
  unint64_t v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  NSObject *v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float *v34;
  float v35;
  uint64_t v36;
  float v37;
  uint64_t v38;
  float v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[6];
  uint8_t buf[4];
  _BYTE v49[24];
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (!*(_BYTE *)(a1 + 9920))
    {
LABEL_9:
      v15 = sub_21B886CCC((unsigned __int16 *)(a1 + 8), a2, a3, a4, a5, a6);
      if (!*(_QWORD *)(a1 + 9936))
      {
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
        v16 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
        {
          sub_21B880DA8((uint64_t)v47, (_QWORD *)(a1 + 5568));
          v17 = sub_21B87EFB0(v47);
          sub_21B880DA8((uint64_t)v46, (_QWORD *)(a1 + 4256));
          v18 = sub_21B87EFB0(v46);
          v19 = *(unsigned __int16 *)(a1 + 4354);
          v20 = *(unsigned __int16 *)(a1 + 3042);
          *(_DWORD *)buf = 134351104;
          *(_QWORD *)v49 = a2;
          *(_WORD *)&v49[8] = 1026;
          *(_DWORD *)&v49[10] = a3;
          *(_WORD *)&v49[14] = 2050;
          *(double *)&v49[16] = (float)(a5 * 57.296);
          v50 = 2050;
          v51 = (float)(a6 * 57.296);
          v52 = 2050;
          v53 = (float)(v17 * 57.296);
          v54 = 2050;
          v55 = (float)(v18 * 57.296);
          v56 = 2050;
          v57 = v19;
          v58 = 2050;
          v59 = v20;
          v60 = 1026;
          v61 = v15;
          _os_log_impl(&dword_21B72A000, v16, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Received first ring sensor input, timestamp: %{public}llu us, touching: %{public}d, altitude: %{public}.3f deg, azimuth: %{public}.3f deg, wAuxNorm: %{public}.3f dps, wSrcNorm: %{public}.3f dps, numAuxDM6:%{public}zu, numSrcDM6:%{public}zu, feedRing: %{public}d", buf, 0x54u);
          sub_21B880D14(v46);
          sub_21B880D14(v47);
        }
        *(_QWORD *)(a1 + 9936) = a2;
      }
      if (*(_QWORD *)(a1 + 9944))
        v21 = 0;
      else
        v21 = v15;
      if (v21)
      {
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
        v22 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
        {
          sub_21B880DA8((uint64_t)v45, (_QWORD *)(a1 + 5568));
          v23 = sub_21B87EFB0(v45);
          sub_21B880DA8((uint64_t)v44, (_QWORD *)(a1 + 4256));
          v24 = sub_21B87EFB0(v44);
          v25 = *(unsigned __int16 *)(a1 + 4354);
          v26 = *(unsigned __int16 *)(a1 + 3042);
          *(_DWORD *)buf = 134351104;
          *(_QWORD *)v49 = a2;
          *(_WORD *)&v49[8] = 1026;
          *(_DWORD *)&v49[10] = a3;
          *(_WORD *)&v49[14] = 2050;
          *(double *)&v49[16] = (float)(a5 * 57.296);
          v50 = 2050;
          v51 = (float)(a6 * 57.296);
          v52 = 2050;
          v53 = (float)(v23 * 57.296);
          v54 = 2050;
          v55 = (float)(v24 * 57.296);
          v56 = 2050;
          v57 = v25;
          v58 = 2050;
          v59 = v26;
          v60 = 1026;
          v61 = 1;
          _os_log_impl(&dword_21B72A000, v22, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Consumed first ring sensor input, timestamp: %{public}llu us, touching: %{public}d, altitude: %{public}.3f deg, azimuth: %{public}.3f deg, wAuxNorm: %{public}.3f dps, wSrcNorm: %{public}.3f dps, numAuxDM6:%{public}zu, numSrcDM6:%{public}zu, feedRing: %{public}d", buf, 0x54u);
          sub_21B880D14(v44);
          sub_21B880D14(v45);
        }
        *(_QWORD *)(a1 + 9944) = a2;
      }
      v27 = *(_QWORD *)(a1 + 9888);
      if (v27)
      {
        v28 = a2 - v27;
        v29 = (double)v28 * 0.000001;
        ++*(_DWORD *)(a1 + 9952);
        *(float *)(a1 + 9956) = *(float *)(a1 + 9956) + v29;
        if (*(float *)(a1 + 9960) > v29)
          *(float *)(a1 + 9960) = v29;
        if (*(float *)(a1 + 9964) < v29)
          *(float *)(a1 + 9964) = v29;
        v30 = (float)v28;
        ++*(_DWORD *)(a1 + 10036);
        *(float *)(a1 + 10040) = *(float *)(a1 + 10040) + (float)v28;
        if (*(float *)(a1 + 10044) > (float)v28)
          *(float *)(a1 + 10044) = v30;
        if (*(float *)(a1 + 10048) < v30)
          *(float *)(a1 + 10048) = v30;
        v31 = a3 ^ 1u;
        *(_DWORD *)(a1 + 10032) = v31;
        v32 = a1 + 10032 + 16 * v31;
        v33 = a6 * 57.296;
        v35 = *(float *)(v32 + 76);
        v34 = (float *)(v32 + 76);
        ++*((_DWORD *)v34 - 2);
        *(v34 - 1) = (float)(a6 * 57.296) + *(v34 - 1);
        if (v35 > (float)(a6 * 57.296))
          *v34 = v33;
        v36 = a1 + 16 * v31;
        if (*(float *)(v36 + 10112) < v33)
          *(float *)(v36 + 10112) = v33;
        v37 = a5 * 57.296;
        ++*(_DWORD *)(v36 + 10148);
        *(float *)(v36 + 10152) = (float)(a5 * 57.296) + *(float *)(v36 + 10152);
        if (*(float *)(v36 + 10156) > (float)(a5 * 57.296))
          *(float *)(v36 + 10156) = v37;
        v38 = a1 + 16 * v31;
        if (*(float *)(v38 + 10160) < v37)
          *(float *)(v38 + 10160) = v37;
      }
      *(_QWORD *)(a1 + 9888) = a2;
      v39 = (float)a2 - (float)*(unint64_t *)(a1 + 9896);
      if (v39 <= 0.0)
        v39 = 1.0;
      ++*(_DWORD *)(a1 + 10084);
      *(float *)(a1 + 10088) = *(float *)(a1 + 10088) + v39;
      if (*(float *)(a1 + 10092) > v39)
        *(float *)(a1 + 10092) = v39;
      if (*(float *)(a1 + 10096) < v39)
        *(float *)(a1 + 10096) = v39;
      sub_21B87F034(a1, a2);
      return;
    }
    v12 = *(_QWORD *)(a1 + 9888);
    if (a2 > v12)
    {
      v13 = a2 - v12;
      if ((a2 - v12) >= 0x11E1A301)
      {
        sub_21B87E6C0(a1);
        sub_21B87EEB0((int *)a1, 2, a2);
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
        v14 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67240448;
          *(_DWORD *)v49 = v13;
          *(_WORD *)&v49[4] = 2050;
          *(_QWORD *)&v49[6] = a2;
          _os_log_impl(&dword_21B72A000, v14, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Reset due to large ring sensor timestamp gap. Time gap:%{public}u us, timestamp: %{public}llu us.", buf, 0x12u);
        }
      }
      goto LABEL_9;
    }
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v42 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v43 = *(_QWORD *)(a1 + 9888);
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v49 = a2;
      *(_WORD *)&v49[8] = 2050;
      *(_QWORD *)&v49[10] = v43;
      _os_log_impl(&dword_21B72A000, v42, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Ring sensor timestamps must be monotonically increasing. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
  }
  else
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v40 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v41 = *(_QWORD *)(a1 + 9888);
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v49 = 0;
      *(_WORD *)&v49[8] = 2050;
      *(_QWORD *)&v49[10] = v41;
      _os_log_impl(&dword_21B72A000, v40, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateRingSensor] Reset due to unexpected zero ring sensor timestamp. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
    sub_21B87E6C0(a1);
    sub_21B87EEB0((int *)a1, 5, 0);
  }
}

void sub_21B87EE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  sub_21B880D14(&a21);
  sub_21B880D14(&a27);
  _Unwind_Resume(a1);
}

void sub_21B87EEB0(int *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*a1 != a2)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v6 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *a1;
      v8[0] = 67240704;
      v8[1] = v7;
      v9 = 1026;
      v10 = a2;
      v11 = 2050;
      v12 = a3;
      _os_log_impl(&dword_21B72A000, v6, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[setTrackingStatus] Status changed from: %{public}d to %{public}d, timestamp: %{public}llu us .", (uint8_t *)v8, 0x18u);
    }
    *a1 = a2;
  }
}

float sub_21B87EFB0(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  float v3;
  unint64_t v4;
  float **v5;
  float *v6;
  float *v7;
  uint64_t v8;
  float v9;
  float v10;
  float *v11;

  v1 = a1[5];
  if (!v1)
    return 0.0;
  v2 = a1[1];
  v3 = 0.0;
  if (a1[2] != v2)
  {
    v4 = a1[4];
    v5 = (float **)(v2 + 8 * (v4 >> 10));
    v6 = *v5;
    v7 = &(*v5)[v4 & 0x3FF];
    v8 = *(_QWORD *)(v2 + (((v4 + v1) >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * ((v4 + v1) & 0x3FF);
    while (v7 != (float *)v8)
    {
      v9 = *v7++;
      v10 = v9;
      if ((char *)v7 - (char *)v6 == 4096)
      {
        v11 = v5[1];
        ++v5;
        v6 = v11;
        v7 = v11;
      }
      v3 = v3 + v10;
    }
  }
  return v3 / (float)v1;
}

void sub_21B87F034(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (_BYTE *)(a1 + 6184);
  if (!*(_BYTE *)(a1 + 9920) && *v2)
  {
    *(_BYTE *)(a1 + 9920) = 1;
    *(_QWORD *)(a1 + 9928) = a2;
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v4 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 9928);
      v6 = v2[744];
      v7 = *(unsigned __int16 *)(a1 + 10);
      v8 = *(unsigned __int16 *)(a1 + 4354);
      v9 = *(unsigned __int16 *)(a1 + 3042);
      sub_21B880DA8((uint64_t)v17, (_QWORD *)(a1 + 5568));
      v10 = sub_21B87EFB0(v17);
      sub_21B880DA8((uint64_t)v16, (_QWORD *)(a1 + 4256));
      v11 = sub_21B87EFB0(v16);
      *(_DWORD *)buf = 134350592;
      v19 = v5;
      v20 = 1026;
      v21 = v6;
      v22 = 2050;
      v23 = v7;
      v24 = 2050;
      v25 = v8;
      v26 = 2050;
      v27 = v9;
      v28 = 2050;
      v29 = (float)(v10 * 57.296);
      v30 = 2050;
      v31 = (float)(v11 * 57.296);
      _os_log_impl(&dword_21B72A000, v4, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[checkSessionStarted] BarrelRoll session start timestamp: %{public}llu microseconds, initialized during no-trust: %{public}d, numRingSensor: %{public}zu, numAuxDM6: %{public}zu, numSrcDM6: %{public}zu, wAuxNorm: %{public}f dps, wSrcNorm: %{public}f dps", buf, 0x44u);
      sub_21B880D14(v16);
      sub_21B880D14(v17);
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    }
    v12 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 9928) - *(_QWORD *)(a1 + 9944);
      *(_DWORD *)buf = 134349056;
      v19 = v13;
      _os_log_impl(&dword_21B72A000, v12, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[checkSessionStarted] Time elapsed between first consumed ring sensor and session start: %{public}llu microseconds.", buf, 0xCu);
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    }
    v14 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 9944) - *(_QWORD *)(a1 + 9936);
      *(_DWORD *)buf = 134349056;
      v19 = v15;
      _os_log_impl(&dword_21B72A000, v14, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[checkSessionStarted] Time elapsed between first consumed ring sensor and first ring sensor: %{public}llu microseconds.", buf, 0xCu);
    }
  }
}

void sub_21B87F2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_21B880D14(&a9);
  sub_21B880D14(&a15);
  _Unwind_Resume(a1);
}

void sub_21B87F30C(uint64_t a1, unint64_t a2, float *a3, float32x4_t a4, float a5)
{
  float v7;
  unint64_t v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  float v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float *v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  float32x4_t v29;
  uint8_t buf[4];
  _BYTE v31[18];
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v7 = a4.f32[0];
    if (!*(_BYTE *)(a1 + 9920))
    {
LABEL_9:
      sub_21B87F7B8(a3, &v29, a4);
      sub_21B892EEC(&v29, (float32x4_t *)buf);
      sub_21B8883B4(a1 + 8, a2, (float32x4_t *)buf, v7, a5);
      v13 = *(_QWORD *)(a1 + 9896);
      if (v13)
        goto LABEL_15;
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
      v14 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134350336;
        *(_QWORD *)v31 = a2;
        *(_WORD *)&v31[8] = 2050;
        *(double *)&v31[10] = (float)(v7 * 57.296);
        v32 = 2050;
        v33 = v29.f32[0];
        v34 = 2050;
        v35 = v29.f32[1];
        v36 = 2050;
        v37 = v29.f32[2];
        v38 = 2050;
        v39 = v29.f32[3];
        _os_log_impl(&dword_21B72A000, v14, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Received first aux DM6 input, timestamp: %{public}llu us, wNorm: %{public}.3f dps, q_p_ip: %{public}.3f %{public}.3f %{public}.3f %{public}.3f", buf, 0x3Eu);
      }
      v13 = *(_QWORD *)(a1 + 9896);
      if (v13)
      {
LABEL_15:
        v15 = a2 - v13;
        v16 = (double)v15 * 0.000001;
        ++*(_DWORD *)(a1 + 9984);
        *(float *)(a1 + 9988) = *(float *)(a1 + 9988) + v16;
        if (*(float *)(a1 + 9992) > v16)
          *(float *)(a1 + 9992) = v16;
        if (*(float *)(a1 + 9996) < v16)
          *(float *)(a1 + 9996) = v16;
        v17 = (float)v15;
        ++*(_DWORD *)(a1 + 10068);
        *(float *)(a1 + 10072) = *(float *)(a1 + 10072) + (float)v15;
        if (*(float *)(a1 + 10076) > (float)v15)
          *(float *)(a1 + 10076) = v17;
        if (*(float *)(a1 + 10080) < v17)
          *(float *)(a1 + 10080) = v17;
        v18 = *(unsigned int *)(a1 + 10032);
        v19 = a1 + 10032 + 16 * v18;
        v20 = v7 * 57.296;
        v22 = *(float *)(v19 + 220);
        v21 = (float *)(v19 + 220);
        ++*((_DWORD *)v21 - 2);
        *(v21 - 1) = (float)(v7 * 57.296) + *(v21 - 1);
        if (v22 > (float)(v7 * 57.296))
          *v21 = v20;
        v23 = a1 + 16 * v18;
        if (*(float *)(v23 + 10256) < v20)
          *(float *)(v23 + 10256) = v20;
        ++*(_DWORD *)(v23 + 10292);
        *(float *)(v23 + 10296) = *(float *)(v23 + 10296) + a5;
        if (*(float *)(v23 + 10300) > a5)
          *(float *)(v23 + 10300) = a5;
        v24 = a1 + 16 * v18;
        if (*(float *)(v24 + 10304) < a5)
          *(float *)(v24 + 10304) = a5;
      }
      *(_QWORD *)(a1 + 9896) = a2;
      return;
    }
    v10 = *(_QWORD *)(a1 + 9896);
    if (a2 > v10)
    {
      v11 = a2 - v10;
      if ((a2 - v10) >= 0x186A1)
      {
        sub_21B87E6C0(a1);
        sub_21B87EEB0((int *)a1, 3, a2);
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
        v12 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67240448;
          *(_DWORD *)v31 = v11;
          *(_WORD *)&v31[4] = 2050;
          *(_QWORD *)&v31[6] = a2;
          _os_log_impl(&dword_21B72A000, v12, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Reset due to large aux DM6 timestamp gap. Time gap:%{public}u us, timestamp: %{public}llu us.", buf, 0x12u);
        }
      }
      goto LABEL_9;
    }
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v27 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v28 = *(_QWORD *)(a1 + 9896);
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v31 = a2;
      *(_WORD *)&v31[8] = 2050;
      *(_QWORD *)&v31[10] = v28;
      _os_log_impl(&dword_21B72A000, v27, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Aux DM6 timestamps must be monotonically increasing. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
  }
  else
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v25 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 9896);
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v31 = 0;
      *(_WORD *)&v31[8] = 2050;
      *(_QWORD *)&v31[10] = v26;
      _os_log_impl(&dword_21B72A000, v25, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateAuxDM] Reset due to unexpected zero Aux DM6 timestamp. Input: %{public}llu us, previous: %{public}llu us.", buf, 0x16u);
    }
    sub_21B87E6C0(a1);
    sub_21B87EEB0((int *)a1, 6, 0);
  }
}

double sub_21B87F7B8@<D0>(float *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>)
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;

  v5 = atomic_load((unsigned __int8 *)&qword_25518E3A8);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_25518E3A8))
  {
    qword_25518E398 = 0x3FC90FDB00000000;
    dword_25518E3A0 = 0;
    __cxa_guard_release(&qword_25518E3A8);
  }
  v6 = atomic_load((unsigned __int8 *)&qword_25518E3C0);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25518E3C0))
  {
    qword_25518E3B0 = 3217625051;
    dword_25518E3B8 = 0;
    __cxa_guard_release(&qword_25518E3C0);
  }
  v7 = atomic_load((unsigned __int8 *)&qword_25518E3D8);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_25518E3D8))
  {
    sub_21B8931F8(&v11, (float *)&qword_25518E3B0);
    *(double *)v9.i64 = sub_21B8931F8(&v10, (float *)&qword_25518E398);
    sub_21B892E6C((uint64_t)&v11, v10.f32, &xmmword_25518E3C8, v9);
    __cxa_guard_release(&qword_25518E3D8);
  }
  return sub_21B892E6C((uint64_t)&xmmword_25518E3C8, a1, a2, a3);
}

void sub_21B87F8E8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_25518E3D8);
  _Unwind_Resume(a1);
}

void sub_21B87F904(uint64_t a1, unint64_t a2, uint64_t a3, float a4, float a5)
{
  unint64_t v7;
  _BYTE *v11;
  unsigned int v12;
  NSObject *v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  unsigned int v24;
  float v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  float *v30;
  float v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  double v42;
  NSObject *v43;
  uint64_t v44;
  double v45;
  int v46;
  _BYTE v47[18];
  __int16 v48;
  double v49;
  __int16 v50;
  _BYTE v51[10];
  double v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v33 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v34 = *(_QWORD *)(a1 + 9904);
      v46 = 134349312;
      *(_QWORD *)v47 = 0;
      *(_WORD *)&v47[8] = 2050;
      *(_QWORD *)&v47[10] = v34;
      _os_log_impl(&dword_21B72A000, v33, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Reset due to unexpected zero Src DM6 timestamp. Input: %{public}llu us, previous: %{public}llu us.", (uint8_t *)&v46, 0x16u);
    }
    sub_21B87E6C0(a1);
    v35 = (int *)a1;
    v36 = 7;
    v37 = 0;
    goto LABEL_48;
  }
  v7 = *(_QWORD *)(a1 + 9904);
  if (a2 > v7)
  {
    v11 = (_BYTE *)(a1 + 6184);
    if (v7)
      v12 = a2 - v7;
    else
      v12 = 0;
    if (v12 >= 0x186A1)
    {
      sub_21B87E6C0(a1);
      sub_21B87EEB0((int *)a1, 4, a2);
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
      v13 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
      {
        v46 = 67240448;
        *(_DWORD *)v47 = v12;
        *(_WORD *)&v47[4] = 2050;
        *(_QWORD *)&v47[6] = a2;
        _os_log_impl(&dword_21B72A000, v13, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollSession]:[updateSrcDM] Reset due to large Src DM6 timestamp gap. Time gap:%{public}u us, timestamp: %{public}llu us.", (uint8_t *)&v46, 0x12u);
      }
    }
    if (!*(_BYTE *)(a1 + 9920))
      goto LABEL_16;
    v14 = *(_QWORD *)(a1 + 9896);
    if (a2 > v14 && (v15 = a2 - v14, (a2 - v14) >= 0x30D41))
    {
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
      v40 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
      {
        v41 = *(_QWORD *)(a1 + 9896);
        v42 = *(double *)(a1 + 9888);
        v46 = 134350080;
        *(_QWORD *)v47 = a2;
        *(_WORD *)&v47[8] = 2050;
        *(_QWORD *)&v47[10] = v41;
        v48 = 2050;
        v49 = v42;
        v50 = 1026;
        *(_DWORD *)v51 = v15;
        *(_WORD *)&v51[4] = 1026;
        *(_DWORD *)&v51[6] = 200000;
        _os_log_impl(&dword_21B72A000, v40, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Reset due to large gap between the latest source and aux sample. Aux is too far in the past, likely due to a gap.Latest src timestamp: %{public}llu us, latest aux timestamp: %{public}llu us, latest ring sensor timestamp: %{public}llu us, src-to-aux-delta:%{public}u us, threshold:%{public}u us.", (uint8_t *)&v46, 0x2Cu);
      }
      sub_21B87E6C0(a1);
      v35 = (int *)a1;
      v36 = 3;
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 9888);
      if (a2 <= v16 || (v17 = a2 - v16, (a2 - v16) < 0x11E1A301))
      {
LABEL_16:
        sub_21B889098((unsigned __int16 *)(a1 + 8), a2, (_OWORD *)a3, a4, a5);
        if (!*(_QWORD *)(a1 + 9904))
        {
          if (qword_25518E1D0 != -1)
            dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
          v18 = qword_25518E1D8;
          if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(float *)a3;
            v20 = *(float *)(a3 + 4);
            v21 = *(float *)(a3 + 8);
            v22 = *(float *)(a3 + 12);
            v46 = 134350336;
            *(_QWORD *)v47 = a2;
            *(_WORD *)&v47[8] = 2050;
            *(double *)&v47[10] = (float)(a4 * 57.296);
            v48 = 2050;
            v49 = v19;
            v50 = 2050;
            *(double *)v51 = v20;
            *(_WORD *)&v51[8] = 2050;
            v52 = v21;
            v53 = 2050;
            v54 = v22;
            _os_log_impl(&dword_21B72A000, v18, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Received first src DM6 input, timestamp: %{public}llu us, wNorm: %{public}.3f dps, q_s_is: %{public}.3f %{public}.3f %{public}.3f %{public}.3f", (uint8_t *)&v46, 0x3Eu);
          }
        }
        if (*(_QWORD *)(a1 + 9888) + 16666 < a2)
          *(_DWORD *)(a1 + 10032) = 2;
        v23 = *(_QWORD *)(a1 + 9904);
        if (v23)
        {
          v24 = a2 - v23;
          v25 = (double)v24 * 0.000001;
          ++*(_DWORD *)(a1 + 9968);
          *(float *)(a1 + 9972) = *(float *)(a1 + 9972) + v25;
          if (*(float *)(a1 + 9976) > v25)
            *(float *)(a1 + 9976) = v25;
          if (*(float *)(a1 + 9980) < v25)
            *(float *)(a1 + 9980) = v25;
          v26 = (float)v24;
          ++*(_DWORD *)(a1 + 10052);
          *(float *)(a1 + 10056) = *(float *)(a1 + 10056) + (float)v24;
          if (*(float *)(a1 + 10060) > (float)v24)
            *(float *)(a1 + 10060) = v26;
          if (*(float *)(a1 + 10064) < v26)
            *(float *)(a1 + 10064) = v26;
          v27 = *(unsigned int *)(a1 + 10032);
          v28 = a1 + 10032 + 16 * v27;
          v29 = a4 * 57.296;
          v31 = *(float *)(v28 + 172);
          v30 = (float *)(v28 + 172);
          ++*((_DWORD *)v30 - 2);
          *(v30 - 1) = (float)(a4 * 57.296) + *(v30 - 1);
          if (v31 > (float)(a4 * 57.296))
            *v30 = v29;
          v32 = a1 + 16 * v27;
          if (*(float *)(v32 + 10208) < v29)
            *(float *)(v32 + 10208) = v29;
        }
        *(_QWORD *)(a1 + 9904) = a2;
        sub_21B87F034(a1, a2);
        if (*(_DWORD *)a1 != 1 && *v11)
          sub_21B87EEB0((int *)a1, 1, a2);
        if (*(_BYTE *)(a1 + 10000))
        {
          if (!*(_QWORD *)(a1 + 10008))
            *(_QWORD *)(a1 + 10008) = a2;
        }
        sub_21B87FF80((int *)a1, a2);
        return;
      }
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
      v43 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
      {
        v44 = *(_QWORD *)(a1 + 9888);
        v45 = *(double *)(a1 + 9896);
        v46 = 134350080;
        *(_QWORD *)v47 = a2;
        *(_WORD *)&v47[8] = 2050;
        *(_QWORD *)&v47[10] = v44;
        v48 = 2050;
        v49 = v45;
        v50 = 1026;
        *(_DWORD *)v51 = v17;
        *(_WORD *)&v51[4] = 1026;
        *(_DWORD *)&v51[6] = 300000000;
        _os_log_impl(&dword_21B72A000, v43, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Reset due to large gap between the latest source and ring sample. Ring is too far in the past, likely due to pencil being away from screen.Latest src timestamp: %{public}llu us, latest ring sensor timestamp: %{public}llu us, latest aux timestamp: %{public}llu us, src-to-ring-delta:%{public}u us, threshold:%{public}u us.", (uint8_t *)&v46, 0x2Cu);
      }
      sub_21B87E6C0(a1);
      v35 = (int *)a1;
      v36 = 2;
    }
    v37 = a2;
LABEL_48:
    sub_21B87EEB0(v35, v36, v37);
    return;
  }
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
  v38 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
  {
    v39 = *(_QWORD *)(a1 + 9904);
    v46 = 134349312;
    *(_QWORD *)v47 = a2;
    *(_WORD *)&v47[8] = 2050;
    *(_QWORD *)&v47[10] = v39;
    _os_log_impl(&dword_21B72A000, v38, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRollService]:[updateSrcDM] Src DM6 timestamps must be monotonically increasing. Input: %{public}llu us, previous: %{public}llu us.", (uint8_t *)&v46, 0x16u);
  }
}

void sub_21B87FF80(int *a1, unint64_t a2)
{
  unint64_t v2;
  int v5;
  unsigned __int8 *v6;
  float32x4_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  float v15;
  unint64_t v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  BOOL v22;
  unint64_t v23;
  float v24;
  unint64_t v25;
  BOOL v26;
  unint64_t v27;
  float v28;
  NSObject *v29;
  int v30;
  float v31;
  float v32;
  int v33;
  double v34;
  int v35;
  float v36;
  float v37;
  int v38;
  double v39;
  float v40;
  int v41;
  float v42;
  float v43;
  float v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  float32x4_t v62;
  uint8_t buf[4];
  unint64_t v64;
  __int16 v65;
  int v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  int v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  int v98;
  __int16 v99;
  double v100;
  __int16 v101;
  int v102;
  __int16 v103;
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  int v110;
  __int16 v111;
  double v112;
  __int16 v113;
  int v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  __int16 v119;
  double v120;
  __int16 v121;
  int v122;
  __int16 v123;
  double v124;
  __int16 v125;
  int v126;
  __int16 v127;
  double v128;
  __int16 v129;
  double v130;
  __int16 v131;
  double v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  double v140;
  __int16 v141;
  double v142;
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v2 = a2 - *((_QWORD *)a1 + 1239);
  if (v2 >= 0x4C4B40)
  {
    v5 = *a1;
    if (*a1 == 1 || v5 != a1[2506])
    {
      v6 = (unsigned __int8 *)(a1 + 1732);
      *((_QWORD *)a1 + 1239) = a2;
      a1[2506] = v5;
      sub_21B88BADC((uint64_t)(a1 + 2), (float32x4_t *)buf);
      sub_21B892ECC((float32x2_t *)buf, &v62, v7);
      v8 = sub_21B87CDC4(v62.f32);
      v10 = v9;
      v12 = v11;
      v13 = -1.0;
      v14 = -1.0;
      if (*((_BYTE *)a1 + 9920))
      {
        v15 = (double)(a2 - *((_QWORD *)a1 + 1241)) * 0.000001;
        v14 = v15;
      }
      v16 = *((_QWORD *)a1 + 1251);
      if (a2 > v16 && v16)
      {
        v17 = (double)(a2 - v16) * 0.000001;
        v13 = v17;
      }
      v18 = *((_QWORD *)a1 + 1236);
      v19 = *((_QWORD *)a1 + 1237);
      v20 = -1.0;
      v21 = -1.0;
      v22 = v18 > v19;
      v23 = v18 - v19;
      if (v22)
      {
        v24 = (double)v23 * 0.001;
        v21 = v24;
      }
      v25 = *((_QWORD *)a1 + 1238);
      v26 = v25 >= v19;
      v27 = v25 - v19;
      if (v27 != 0 && v26)
      {
        v28 = (double)v27 * 0.001;
        v20 = v28;
      }
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
      v29 = qword_25518E1D8;
      if (!os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      v30 = a1[2488];
      v31 = *((float *)a1 + 2489);
      if (v30 && (v32 = v31 / (float)v30, v32 >= 0.000001))
      {
        v33 = (int)(float)(1.0 / v32);
      }
      else
      {
        v33 = 0;
        if (!v30)
        {
          v34 = 0.0;
LABEL_24:
          v35 = a1[2492];
          v36 = *((float *)a1 + 2493);
          if (v35 && (v37 = v36 / (float)v35, v37 >= 0.000001))
            v38 = (int)(float)(1.0 / v37);
          else
            v38 = 0;
          if (v35)
            v39 = (float)((float)(v36 / (float)v35) * 1000.0);
          else
            v39 = 0.0;
          v40 = *((float *)a1 + 2490) * 1000.0;
          v41 = a1[2496];
          v42 = *((float *)a1 + 2497);
          v43 = *((float *)a1 + 2495) * 1000.0;
          if (v41 && (v44 = v42 / (float)v41, v44 >= 0.000001))
            v45 = (int)(float)(1.0 / v44);
          else
            v45 = 0;
          v46 = *a1;
          v47 = *((unsigned __int8 *)a1 + 9920);
          v48 = *((unsigned __int8 *)a1 + 10000);
          v49 = *((_QWORD *)a1 + 1251);
          v50 = *v6;
          v51 = *((_QWORD *)a1 + 1236);
          v52 = v31;
          v53 = (float)(*((float *)a1 + 2491) * 1000.0);
          v54 = v36;
          v55 = (float)(*((float *)a1 + 2494) * 1000.0);
          v56 = v42;
          v57 = (float)(*((float *)a1 + 2498) * 1000.0);
          v58 = (float)(*((float *)a1 + 2499) * 1000.0);
          if (v41)
            v59 = (float)((float)(v42 / (float)v41) * 1000.0);
          else
            v59 = 0.0;
          v60 = *((_QWORD *)a1 + 1238);
          v61 = *((_QWORD *)a1 + 1237);
          *(_DWORD *)buf = 134359040;
          v64 = a2;
          v65 = 1026;
          v66 = v46;
          v67 = 2050;
          v68 = v2;
          v69 = 1026;
          v70 = v47;
          v71 = 1026;
          v72 = v48;
          v73 = 2050;
          v74 = v49;
          v75 = 2050;
          v76 = v14;
          v77 = 2050;
          v78 = v13;
          v79 = 1026;
          v80 = v50;
          v81 = 2050;
          v82 = v51;
          v83 = 2050;
          v84 = v62.f32[0];
          v85 = 2050;
          v86 = v62.f32[1];
          v87 = 2050;
          v88 = v62.f32[2];
          v89 = 2050;
          v90 = v62.f32[3];
          v91 = 2050;
          v92 = (float)(v12 * 57.296);
          v93 = 2050;
          v94 = (float)(v10 * 57.296);
          v95 = 2050;
          v96 = (float)(v8 * 57.296);
          v97 = 1026;
          v98 = v33;
          v99 = 2050;
          v100 = v52;
          v101 = 1026;
          v102 = v30;
          v103 = 2050;
          v104 = v40;
          v105 = 2050;
          v106 = v53;
          v107 = 2050;
          v108 = v34;
          v109 = 1026;
          v110 = v38;
          v111 = 2050;
          v112 = v54;
          v113 = 1026;
          v114 = v35;
          v115 = 2050;
          v116 = v55;
          v117 = 2050;
          v118 = v43;
          v119 = 2050;
          v120 = v39;
          v121 = 1026;
          v122 = v45;
          v123 = 2050;
          v124 = v56;
          v125 = 1026;
          v126 = v41;
          v127 = 2050;
          v128 = v57;
          v129 = 2050;
          v130 = v58;
          v131 = 2050;
          v132 = v59;
          v133 = 2050;
          v134 = v51;
          v135 = 2050;
          v136 = v60;
          v137 = 2050;
          v138 = v61;
          v139 = 2050;
          v140 = v21;
          v141 = 2050;
          v142 = v20;
          _os_log_impl(&dword_21B72A000, v29, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRollService]:[periodicSysDiagnoseLog] { timestamp: %{public}llu us, trackingStatus: %{public}d, sinceLastLog: %{public}llu us, fSessionStarted: %{public}d, HID started flag: %{public}d , HID start timestamp: %{public}llu us, durationSinceSessionStart: %{public}.1f s, durationSinceHIDStart: %{public}.1f s }, { initialized during no-trust: %{public}d, }, { Latest estimate: timestamp: %{public}llu us, Q_SP: %{public}.3f %{public}.3f %{public}.3f %{public}.3f, roll: %{public}.1f deg, azimuth: %{public}.1f deg, altitude: %{public}.1f deg } { Ring: avgNumSamplesPerSecond: %{public}u, over: %{public}.1f s, num samples: %{public}d, sample period min/max/avg: %{public}.1f/%{public}.1f/%{public}.1f ms }, { Src : avgNumSamplesPerSecond: %{public}u, over: %{public}.1f s, num samples: %{public}d, sample period min/max/avg: %{public}.1f/%{public}.1f/%{public}.1f ms }, { Aux : avgNumSamplesPerSecond: %{public}u, over: %{public}.1f s, num samples: %{public}d, sample period min/max/avg: %{public}.1f/%{public}.1f/%{public}.1f ms }, { Latest timestamp ring / src / aux: %{public}llu us / %{public}llu us/ %{public}llu us }, { Aux-to-Ring Delay: %{public}.1f ms, Aux-to-Src Delay: %{public}.1f ms  }", buf, 0x16Au);
LABEL_39:
          *((_QWORD *)a1 + 1244) = 0;
          *((_QWORD *)a1 + 1245) = 0xFF7FFFFF7F7FFFFFLL;
          *((_QWORD *)a1 + 1246) = 0;
          *((_QWORD *)a1 + 1247) = 0xFF7FFFFF7F7FFFFFLL;
          *((_QWORD *)a1 + 1248) = 0;
          *((_QWORD *)a1 + 1249) = 0xFF7FFFFF7F7FFFFFLL;
          return;
        }
      }
      v34 = (float)((float)(v31 / (float)v30) * 1000.0);
      goto LABEL_24;
    }
  }
}

void sub_21B8804B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 10000))
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v2 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 9904);
      v4 = *(_QWORD *)(a1 + 10008);
      v11 = 134349312;
      v12 = v3;
      v13 = 2050;
      v14 = v4;
      v5 = "[BarrelRoll]:[CMABarrelRollService]:[informStartPencilFusionUpdates] Called hidStartedPencilFusionUpdates whe"
           "n the start flag was already true. Latest src timestamp: %{public}llu us, HID start timestamp: %{public}llu";
      v6 = v2;
      v7 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_21B72A000, v6, v7, v5, (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    *(_BYTE *)(a1 + 10000) = 1;
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v8 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 9904);
      v10 = *(_QWORD *)(a1 + 10008);
      v11 = 134349312;
      v12 = v9;
      v13 = 2050;
      v14 = v10;
      v5 = "[BarrelRoll]:[CMABarrelRollService]:[informStartPencilFusionUpdates] HID started pencil fusion updates.  Late"
           "st src timestamp: %{public}llu us, fTimeStampHIDStartedPencilFusionUpdates: %{public}llu";
      v6 = v8;
      v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }
}

void sub_21B880628(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  double v4;
  BOOL v5;
  unint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 10000))
  {
    *(_BYTE *)(a1 + 10000) = 0;
    v2 = *(_QWORD *)(a1 + 9904);
    *(_QWORD *)(a1 + 10016) = v2;
    v3 = *(_QWORD *)(a1 + 10008);
    v4 = -1.0;
    v5 = v2 > v3;
    v6 = v2 - v3;
    if (v5)
    {
      v7 = (double)v6 * 0.000001;
      v4 = v7;
    }
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v8 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 9904);
      v10 = *(_QWORD *)(a1 + 10008);
      v11 = *(_QWORD *)(a1 + 10016);
      v20 = 134349824;
      v21 = v4;
      v22 = 2050;
      v23 = v9;
      v24 = 2050;
      v25 = v10;
      v26 = 2050;
      v27 = v11;
      v12 = "[BarrelRoll]:[CMABarrelRollService]:[informStopPencilFusionUpdates] HID stopped pencil fusion updates. Sessi"
            "on duration: %{public}.1f s. Latest src timestamp: %{public}llu us, HID start timestamp: %{public}llu, HID s"
            "top timestamp: %{public}llu .";
      v13 = v8;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 42;
LABEL_13:
      _os_log_impl(&dword_21B72A000, v13, v14, v12, (uint8_t *)&v20, v15);
    }
  }
  else
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AA58);
    v16 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v17 = *(double *)(a1 + 9904);
      v18 = *(_QWORD *)(a1 + 10008);
      v19 = *(_QWORD *)(a1 + 10016);
      v20 = 134349568;
      v21 = v17;
      v22 = 2050;
      v23 = v18;
      v24 = 2050;
      v25 = v19;
      v12 = "[BarrelRoll]:[CMABarrelRollService]:[informStopPencilFusionUpdates] Called hidStoppedPencilFusionUpdates whe"
            "n the start flag was already false. Latest src timestamp: %{public}llu us, HID start timestamp: %{public}llu"
            ", HID stop timestamp: %{public}llu .";
      v13 = v16;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 32;
      goto LABEL_13;
    }
  }
}

uint64_t sub_21B8807F4(uint64_t a1, uint64_t a2, float a3, float a4, float a5, float a6, float a7)
{
  return sub_21B878E5C(a1 + 10032, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_21B880800(uint64_t a1)
{
  *(_QWORD *)a1 = 0x7800000000;
  *(_QWORD *)(a1 + 968) = 0x7800000000;
  *(_QWORD *)(a1 + 1936) = 0x7800000000;
  *(_QWORD *)(a1 + 2904) = 0x7800000000;
  *(_QWORD *)(a1 + 3032) = 0x3200000000;
  *(_QWORD *)(a1 + 3440) = 0x3200000000;
  *(_OWORD *)(a1 + 4248) = 0u;
  *(_OWORD *)(a1 + 4264) = 0u;
  *(_OWORD *)(a1 + 4280) = 0u;
  *(_OWORD *)(a1 + 4296) = 0u;
  *(_OWORD *)(a1 + 4312) = 0u;
  *(_OWORD *)(a1 + 4328) = 0u;
  *(_QWORD *)(a1 + 4344) = 0x3200000000;
  *(_QWORD *)(a1 + 4752) = 0x3200000000;
  *(_OWORD *)(a1 + 5560) = 0u;
  *(_OWORD *)(a1 + 5576) = 0u;
  *(_OWORD *)(a1 + 5592) = 0u;
  *(_OWORD *)(a1 + 5608) = 0u;
  *(_OWORD *)(a1 + 5624) = 0u;
  *(_OWORD *)(a1 + 5640) = 0u;
  *(_QWORD *)(a1 + 5656) = 0x7800000000;
  *(_OWORD *)(a1 + 6144) = 0u;
  *(_BYTE *)(a1 + 6168) = 1;
  *(_QWORD *)(a1 + 6160) = 0x3F80000000000000;
  sub_21B8809C8(a1 + 6176);
  *(_QWORD *)(a1 + 6696) = 0;
  *(_BYTE *)(a1 + 6704) = 0;
  *(_QWORD *)(a1 + 6708) = 0;
  *(_QWORD *)(a1 + 6716) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 6728) = 0;
  *(_QWORD *)(a1 + 6776) = 0;
  *(_QWORD *)(a1 + 6784) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 6792) = 0;
  *(_BYTE *)(a1 + 6800) = 0;
  *(_QWORD *)(a1 + 6804) = 0;
  *(_QWORD *)(a1 + 6812) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 6824) = 0;
  *(_QWORD *)(a1 + 6872) = 0;
  *(_QWORD *)(a1 + 6880) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 6896) = 0;
  *(_QWORD *)(a1 + 6904) = 0x3F80000000000000;
  *(_WORD *)(a1 + 6920) = 0;
  *(_OWORD *)(a1 + 6924) = xmmword_21B8A0CD0;
  sub_21B89329C((float32x4_t *)(a1 + 6924), (float32x4_t)xmmword_21B8A0CD0);
  *(_QWORD *)(a1 + 6944) = 0;
  *(_BYTE *)(a1 + 6952) = 0;
  *(_DWORD *)(a1 + 6968) = 0;
  *(_QWORD *)(a1 + 6976) = 0x7800000000;
  *(_QWORD *)(a1 + 7944) = 0x7800000000;
  *(_DWORD *)(a1 + 9872) = 0;
  *(_WORD *)(a1 + 9876) = 0;
  return a1;
}

void sub_21B88094C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)v1[837];
  if (v6 == v1 + 834)
  {
    v7 = 4;
    v6 = v1 + 834;
  }
  else
  {
    if (!v6)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  sub_21B880B04(v4);
  sub_21B880D14(v1 + 701);
  sub_21B880D14(v3);
  sub_21B880D14(v1 + 537);
  sub_21B880D14(v2);
  _Unwind_Resume(a1);
}

uint64_t sub_21B8809C8(uint64_t a1)
{
  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_DWORD *)(a1 + 136) = 1065353216;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = xmmword_21B8A0CE0;
  *(_OWORD *)(a1 + 208) = xmmword_21B8A0CF0;
  *(_QWORD *)(a1 + 224) = 0x7F7FFFFF00000000;
  *(_DWORD *)(a1 + 232) = -8388609;
  *(_DWORD *)(a1 + 292) = 0;
  *(_QWORD *)(a1 + 282) = 0;
  *(_OWORD *)(a1 + 268) = 0u;
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 236) = 0u;
  *(_BYTE *)(a1 + 296) = 0;
  sub_21B882D74(a1 + 304, 120);
  *(_QWORD *)(a1 + 456) = 0;
  *(_BYTE *)(a1 + 464) = 0;
  *(_BYTE *)(a1 + 472) = 0;
  *(_QWORD *)(a1 + 476) = 0;
  *(_QWORD *)(a1 + 484) = 0x3F80000000000000;
  return a1;
}

void sub_21B880A90(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_21B880ABC(v2);
  sub_21B880D14((_QWORD *)(v1 + 72));
  sub_21B880D14((_QWORD *)(v1 + 24));
  _Unwind_Resume(a1);
}

uint64_t sub_21B880ABC(uint64_t a1)
{
  void *v2;
  void *v3;

  sub_21B880D14((_QWORD *)(a1 + 96));
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

_QWORD *sub_21B880B04(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)a1[53];
  if (v2)
  {
    a1[54] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[50];
  if (v3)
  {
    a1[51] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[47];
  if (v4)
  {
    a1[48] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[40];
  if (v5)
  {
    a1[41] = v5;
    operator delete(v5);
  }
  sub_21B880D14(a1 + 30);
  v6 = (void *)a1[21];
  if (v6)
  {
    a1[22] = v6;
    operator delete(v6);
  }
  v7 = (void *)a1[18];
  if (v7)
  {
    a1[19] = v7;
    operator delete(v7);
  }
  sub_21B880D14(a1 + 9);
  sub_21B880D14(a1 + 3);
  return a1;
}

uint64_t sub_21B880B9C(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  *(_DWORD *)result = 0;
  *(_QWORD *)(result + 4) = 0;
  *(_QWORD *)(result + 12) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(result + 20) = 0;
  *(_QWORD *)(result + 28) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 44) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(result + 52) = 0;
  *(_QWORD *)(result + 60) = 0xFF7FFFFF7F7FFFFFLL;
  v1 = 68;
  do
  {
    v2 = (_QWORD *)(result + v1);
    *v2 = 0;
    v2[1] = 0xFF7FFFFF7F7FFFFFLL;
    v1 += 16;
  }
  while (v2 + 2 != (_QWORD *)(result + 116));
  v3 = 116;
  do
  {
    v4 = (_QWORD *)(result + v3);
    *v4 = 0;
    v4[1] = 0xFF7FFFFF7F7FFFFFLL;
    v3 += 16;
  }
  while (v4 + 2 != (_QWORD *)(result + 164));
  v5 = 164;
  do
  {
    v6 = (_QWORD *)(result + v5);
    *v6 = 0;
    v6[1] = 0xFF7FFFFF7F7FFFFFLL;
    v5 += 16;
  }
  while (v6 + 2 != (_QWORD *)(result + 212));
  v7 = 212;
  do
  {
    v8 = (_QWORD *)(result + v7);
    *v8 = 0;
    v8[1] = 0xFF7FFFFF7F7FFFFFLL;
    v7 += 16;
  }
  while (v8 + 2 != (_QWORD *)(result + 260));
  v9 = 260;
  do
  {
    v10 = (_QWORD *)(result + v9);
    *v10 = 0;
    v10[1] = 0xFF7FFFFF7F7FFFFFLL;
    v9 += 16;
  }
  while (v10 + 2 != (_QWORD *)(result + 308));
  *(_DWORD *)(result + 308) = 0;
  *(_QWORD *)(result + 312) = 0;
  v11 = 328;
  do
  {
    v12 = (_QWORD *)(result + v11);
    *v12 = 0;
    v12[1] = 0xFF7FFFFF7F7FFFFFLL;
    v11 += 16;
  }
  while (v12 + 2 != (_QWORD *)(result + 376));
  v13 = 376;
  do
  {
    v14 = (_QWORD *)(result + v13);
    *v14 = 0;
    v14[1] = 0xFF7FFFFF7F7FFFFFLL;
    v13 += 16;
  }
  while (v14 + 2 != (_QWORD *)(result + 424));
  *(_QWORD *)(result + 424) = 0;
  *(_QWORD *)(result + 432) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(result + 440) = 0;
  *(_QWORD *)(result + 448) = 0xFF7FFFFF7F7FFFFFLL;
  *(_QWORD *)(result + 456) = 0;
  *(_QWORD *)(result + 464) = 0xFF7FFFFF7F7FFFFFLL;
  return result;
}

os_log_t sub_21B880CE8()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

uint64_t sub_21B880D14(_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 512;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 1024;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return sub_21B7E5580((uint64_t)a1);
}

uint64_t sub_21B880DA8(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char **v7;
  char *v8;
  unint64_t v9;
  char *v10;
  char *v11;

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  v4 = a2[4];
  v5 = a2[1];
  v6 = a2[2];
  v7 = (char **)(v5 + 8 * (v4 >> 10));
  if (v6 == v5)
  {
    v8 = 0;
    v11 = 0;
    v10 = (char *)(v5 + 8 * ((a2[5] + v4) >> 10));
  }
  else
  {
    v8 = &(*v7)[4 * (v4 & 0x3FF)];
    v9 = a2[5] + v4;
    v10 = (char *)(v5 + 8 * (v9 >> 10));
    v11 = (char *)(*(_QWORD *)v10 + 4 * (v9 & 0x3FF));
  }
  sub_21B880E50((_QWORD *)a1, v7, v8, v10, v11);
  return a1;
}

void sub_21B880E3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_21B7E5580(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_21B880E50(_QWORD *a1, char **a2, char *a3, char *a4, char *a5)
{
  unint64_t v5;

  if (a5 == a3)
    v5 = 0;
  else
    v5 = ((uint64_t)&a5[-*(_QWORD *)a4] >> 2) + ((a4 - (char *)a2) << 7) - ((a3 - *a2) >> 2);
  return sub_21B880E84(a1, a2, a3, v5);
}

_QWORD *sub_21B880E84(_QWORD *a1, char **a2, char *a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _DWORD *v20;
  int v21;
  char *v22;
  uint64_t v23;
  _QWORD v24[2];

  v8 = a1[1];
  v9 = a1[2];
  if (v9 == v8)
    v10 = 0;
  else
    v10 = ((v9 - v8) << 7) - 1;
  v11 = a1[5] + a1[4];
  v12 = v10 - v11;
  if (a4 > v12)
  {
    sub_21B880FB8(a1, a4 - v12);
    v8 = a1[1];
    v9 = a1[2];
    v11 = a1[4] + a1[5];
  }
  v13 = (_QWORD *)(v8 + 8 * (v11 >> 10));
  if (v9 == v8)
    v14 = 0;
  else
    v14 = *v13 + 4 * (v11 & 0x3FF);
  v24[0] = v8 + 8 * (v11 >> 10);
  v24[1] = v14;
  result = sub_21B881540((uint64_t)v24, a4);
  if (v14 != v16)
  {
    v17 = a1[5];
    do
    {
      if (v13 == result)
        v18 = v16;
      else
        v18 = *v13 + 4096;
      if (v14 == v18)
      {
        v18 = v14;
      }
      else
      {
        v19 = *a2;
        v20 = (_DWORD *)v14;
        do
        {
          v21 = *(_DWORD *)a3;
          a3 += 4;
          *v20++ = v21;
          if (a3 - v19 == 4096)
          {
            v22 = a2[1];
            ++a2;
            v19 = v22;
            a3 = v22;
          }
        }
        while (v20 != (_DWORD *)v18);
      }
      v17 += (v18 - v14) >> 2;
      if (v13 == result)
        break;
      v23 = v13[1];
      ++v13;
      v14 = v23;
    }
    while (v23 != v16);
    a1[5] = v17;
  }
  return result;
}

void sub_21B880FB8(_QWORD *a1, unint64_t a2)
{
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int64_t v26;
  char *v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int64_t v46;
  char *v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  uint64_t v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t i;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  _QWORD *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  int64_t v76;
  char *v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  void *v88;
  void *__p[2];
  __int128 v90;
  _QWORD *v91;

  v3 = (char *)a1[2];
  v4 = (uint64_t)&v3[-a1[1]];
  if (v4)
    v5 = a2;
  else
    v5 = a2 + 1;
  if ((v5 & 0x3FF) != 0)
    v6 = (v5 >> 10) + 1;
  else
    v6 = v5 >> 10;
  v7 = a1[4];
  if (v6 >= v7 >> 10)
    v8 = v7 >> 10;
  else
    v8 = v6;
  if (v6 <= v7 >> 10)
  {
    for (a1[4] = v7 - (v8 << 10); v8; --v8)
    {
      v16 = (_QWORD *)a1[1];
      v19 = *v16;
      v17 = (char *)(v16 + 1);
      v18 = v19;
      a1[1] = v17;
      if (v3 == (char *)a1[3])
      {
        v20 = (uint64_t)&v17[-*a1];
        if ((unint64_t)v17 <= *a1)
        {
          if (v3 == (char *)*a1)
            v28 = 1;
          else
            v28 = (uint64_t)&v3[-*a1] >> 2;
          v29 = (char *)sub_21B796A20((uint64_t)(a1 + 3), v28);
          v31 = &v29[8 * (v28 >> 2)];
          v32 = (uint64_t *)a1[1];
          v3 = v31;
          v33 = a1[2] - (_QWORD)v32;
          if (v33)
          {
            v3 = &v31[v33 & 0xFFFFFFFFFFFFFFF8];
            v34 = 8 * (v33 >> 3);
            v35 = &v29[8 * (v28 >> 2)];
            do
            {
              v36 = *v32++;
              *(_QWORD *)v35 = v36;
              v35 += 8;
              v34 -= 8;
            }
            while (v34);
          }
          v37 = (char *)*a1;
          *a1 = v29;
          a1[1] = v31;
          a1[2] = v3;
          a1[3] = &v29[8 * v30];
          if (v37)
          {
            operator delete(v37);
            v3 = (char *)a1[2];
          }
        }
        else
        {
          v21 = v20 >> 3;
          v22 = v20 >> 3 < -1;
          v23 = (v20 >> 3) + 2;
          if (v22)
            v24 = v23;
          else
            v24 = v21 + 1;
          v25 = &v17[-8 * (v24 >> 1)];
          v26 = v3 - v17;
          if (v3 != v17)
          {
            memmove(&v17[-8 * (v24 >> 1)], v17, v3 - v17);
            v3 = (char *)a1[1];
          }
          v27 = &v3[-8 * (v24 >> 1)];
          v3 = &v25[v26];
          a1[1] = v27;
          a1[2] = &v25[v26];
        }
      }
      *(_QWORD *)v3 = v18;
      v3 = (char *)(a1[2] + 8);
      a1[2] = v3;
    }
  }
  else
  {
    v9 = v6 - v8;
    v10 = a1[3] - *a1;
    if (v6 - v8 <= (v10 >> 3) - (v4 >> 3))
    {
      if (v9)
      {
        while (a1[3] != a1[2])
        {
          __p[0] = operator new(0x1000uLL);
          sub_21B7E4C54(a1, __p);
          --v6;
          if (!--v9)
            goto LABEL_75;
        }
        for (i = 0; i != v9; ++i)
        {
          __p[0] = operator new(0x1000uLL);
          sub_21B7E4D68((uint64_t)a1, __p);
          if (a1[2] - a1[1] == 8)
            v64 = 1023;
          else
            v64 = 1024;
          v65 = v64 + a1[4];
          a1[4] = v65;
        }
        v8 = v6;
      }
      else
      {
LABEL_75:
        v65 = a1[4];
      }
      a1[4] = v65 - (v8 << 10);
      if (v8)
      {
        v66 = (char *)a1[2];
        do
        {
          v67 = (_QWORD *)a1[1];
          v70 = *v67;
          v68 = (char *)(v67 + 1);
          v69 = v70;
          a1[1] = v68;
          if (v66 == (char *)a1[3])
          {
            v71 = (uint64_t)&v68[-*a1];
            if ((unint64_t)v68 <= *a1)
            {
              if (v66 == (char *)*a1)
                v78 = 1;
              else
                v78 = (uint64_t)&v66[-*a1] >> 2;
              v79 = (char *)sub_21B796A20((uint64_t)(a1 + 3), v78);
              v81 = &v79[8 * (v78 >> 2)];
              v82 = (uint64_t *)a1[1];
              v66 = v81;
              v83 = a1[2] - (_QWORD)v82;
              if (v83)
              {
                v66 = &v81[v83 & 0xFFFFFFFFFFFFFFF8];
                v84 = 8 * (v83 >> 3);
                v85 = &v79[8 * (v78 >> 2)];
                do
                {
                  v86 = *v82++;
                  *(_QWORD *)v85 = v86;
                  v85 += 8;
                  v84 -= 8;
                }
                while (v84);
              }
              v87 = (char *)*a1;
              *a1 = v79;
              a1[1] = v81;
              a1[2] = v66;
              a1[3] = &v79[8 * v80];
              if (v87)
              {
                operator delete(v87);
                v66 = (char *)a1[2];
              }
            }
            else
            {
              v72 = v71 >> 3;
              v22 = v71 >> 3 < -1;
              v73 = (v71 >> 3) + 2;
              if (v22)
                v74 = v73;
              else
                v74 = v72 + 1;
              v75 = &v68[-8 * (v74 >> 1)];
              v76 = v66 - v68;
              if (v66 != v68)
              {
                memmove(&v68[-8 * (v74 >> 1)], v68, v66 - v68);
                v66 = (char *)a1[1];
              }
              v77 = &v66[-8 * (v74 >> 1)];
              v66 = &v75[v76];
              a1[1] = v77;
              a1[2] = &v75[v76];
            }
          }
          *(_QWORD *)v66 = v69;
          v66 = (char *)(a1[2] + 8);
          a1[2] = v66;
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      v11 = v4 >> 3;
      v12 = v10 >> 2;
      if (v12 <= v9 + v11)
        v13 = v9 + v11;
      else
        v13 = v12;
      v14 = v11 - v8;
      v91 = a1 + 3;
      if (v13)
        v15 = (char *)sub_21B796A20((uint64_t)(a1 + 3), v13);
      else
        v15 = 0;
      v38 = v8 << 10;
      __p[0] = v15;
      __p[1] = &v15[8 * v14];
      *(void **)&v90 = __p[1];
      *((_QWORD *)&v90 + 1) = &v15[8 * v13];
      do
      {
        v88 = operator new(0x1000uLL);
        sub_21B7E4E84(__p, &v88);
        --v9;
      }
      while (v9);
      if (v8)
      {
        v39 = (_QWORD *)a1[1];
        v40 = (char *)v90;
        do
        {
          if (v40 == *((char **)&v90 + 1))
          {
            v41 = (char *)__p[1] - (char *)__p[0];
            if (__p[1] <= __p[0])
            {
              if (v40 == __p[0])
                v48 = 1;
              else
                v48 = (v40 - (char *)__p[0]) >> 2;
              v49 = (char *)sub_21B796A20((uint64_t)v91, v48);
              v51 = (uint64_t *)__p[1];
              v40 = &v49[8 * (v48 >> 2)];
              v52 = v90 - (unint64_t)__p[1];
              if ((void *)v90 != __p[1])
              {
                v40 = &v49[8 * (v48 >> 2) + (v52 & 0xFFFFFFFFFFFFFFF8)];
                v53 = 8 * (v52 >> 3);
                v54 = &v49[8 * (v48 >> 2)];
                do
                {
                  v55 = *v51++;
                  *(_QWORD *)v54 = v55;
                  v54 += 8;
                  v53 -= 8;
                }
                while (v53);
              }
              v56 = __p[0];
              __p[0] = v49;
              __p[1] = &v49[8 * (v48 >> 2)];
              *(_QWORD *)&v90 = v40;
              *((_QWORD *)&v90 + 1) = &v49[8 * v50];
              if (v56)
              {
                operator delete(v56);
                v40 = (char *)v90;
              }
            }
            else
            {
              v42 = v41 >> 3;
              v22 = v41 >> 3 < -1;
              v43 = (v41 >> 3) + 2;
              if (v22)
                v44 = v43;
              else
                v44 = v42 + 1;
              v45 = (char *)__p[1] - 8 * (v44 >> 1);
              v46 = v40 - (char *)__p[1];
              if (v40 != __p[1])
              {
                memmove((char *)__p[1] - 8 * (v44 >> 1), __p[1], v40 - (char *)__p[1]);
                v40 = (char *)__p[1];
              }
              v47 = &v40[-8 * (v44 >> 1)];
              v40 = &v45[v46];
              __p[1] = v47;
              *(_QWORD *)&v90 = &v45[v46];
            }
          }
          *(_QWORD *)v40 = *v39;
          v40 = (char *)(v90 + 8);
          *(_QWORD *)&v90 = v90 + 8;
          v39 = (_QWORD *)(a1[1] + 8);
          a1[1] = v39;
          --v8;
        }
        while (v8);
      }
      v57 = (_QWORD *)a1[2];
      v58 = -7 - (_QWORD)v57;
      while (v57 != (_QWORD *)a1[1])
      {
        --v57;
        v58 += 8;
        sub_21B7E4F98((uint64_t)__p, v57);
      }
      v59 = (char *)*a1;
      v60 = *(_OWORD *)__p;
      v61 = v90;
      __p[0] = *(void **)a1;
      __p[1] = v57;
      v62 = *((_OWORD *)a1 + 1);
      *(_OWORD *)a1 = v60;
      *((_OWORD *)a1 + 1) = v61;
      v90 = v62;
      a1[4] -= v38;
      if (v57 != (_QWORD *)v62)
        *(_QWORD *)&v90 = v62 + (-(v62 + v58) & 0xFFFFFFFFFFFFFFF8);
      if (v59)
        operator delete(v59);
    }
  }
}

void sub_21B8814CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21B881540(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;

  result = *(_QWORD **)a1;
  if (a2)
  {
    v4 = a2 + ((uint64_t)(*(_QWORD *)(a1 + 8) - *result) >> 2);
    if (v4 < 1)
      result -= (unint64_t)(1023 - v4) >> 10;
    else
      result += (unint64_t)v4 >> 10;
  }
  return result;
}

BOOL sub_21B8815A4(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  float32x4_t v7;
  float32x4_t v8[2];
  float32x2_t v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;

  v4 = *(double *)(a1 + 8);
  v5 = *(double *)a2;
  if (v4 > 0.0 && v5 < v4 + *(double *)(a1 + 16))
    return 0;
  *(double *)(a1 + 16) = v5;
  v7 = *(float32x4_t *)(a2 + 24);
  v8[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a2 + 8)), (float64x2_t)v7);
  sub_21B89329C(v8, v7);
  v8[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a2 + 40)), *(float64x2_t *)(a2 + 56));
  v9 = vcvt_f32_f64(*(float64x2_t *)(a2 + 72));
  v10 = (unint64_t)(*(double *)a2 * 1000000.0);
  v11 = 0;
  v12 = 0;
  return sub_21B881660(a1, (uint64_t)v8);
}

BOOL sub_21B881660(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  __float2 v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
  double v21;
  __int128 v22;
  float v24[27];
  float v25[89];
  _BYTE buf[12];
  _BYTE v27[20];
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  sub_21B892B34();
  sub_21B876860(a1 + 40, a2);
  v4 = sub_21B878394(a1 + 40);
  sub_21B876DE4(a1 + 40, 0, v25, v4);
  if (v4)
  {
    sub_21B8783DC(a1 + 40, v24);
    sub_21B87517C((float *)(a1 + 20560), (uint64_t)v24);
    sub_21B885B18(a1 + 20568, a1 + 15760, a1 + 8424);
    v6 = v5;
    v7 = sub_21B885D98((float *)(a1 + 20568), (unsigned __int16 *)(a1 + 15760));
    *(_BYTE *)(a1 + 20600) = 0;
    v8 = v7;
    if (v7 < 0.61087)
    {
      *(_BYTE *)(a1 + 20600) = 1;
      v9 = *(float *)(a1 + 20560) + 0.04;
      v10 = __sincosf_stret(v6);
      v11 = v10.__sinval * v9;
      v12 = sinf(v8);
      v13 = -(float)(v12 * (float)(v10.__sinval * v9));
      if ((float)(v12 * (float)(v10.__sinval * v9)) > 0.0)
        v13 = v12 * v11;
      v14 = v12 * (float)(v10.__cosval * v9);
      v15 = -v14;
      if (v14 > 0.0)
        v15 = v14;
      if (v13 >= 0.5 || v15 >= 0.5)
        *(_BYTE *)(a1 + 20600) = 0;
      *(float *)(a1 + 32) = (float)(v13 * 0.5655) + 0.2407;
      *(float *)(a1 + 36) = (float)(v15 * 0.6527) + 0.2277;
      *(float *)(a1 + 24) = v10.__cosval * v9;
      *(float *)(a1 + 28) = v11;
      v17 = (double)*(unint64_t *)(a2 + 40);
      if (qword_25518E1C0 != -1)
        dispatch_once(&qword_25518E1C0, &unk_24DF3AA98);
      v18 = v17 * 0.000000999999997;
      v19 = qword_25518E1C8;
      if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(float *)(a1 + 24);
        v21 = *(float *)(a1 + 28);
        *(_DWORD *)buf = 134349824;
        *(double *)&buf[4] = v18;
        *(_WORD *)v27 = 2050;
        *(double *)&v27[2] = v6;
        *(_WORD *)&v27[10] = 2050;
        *(double *)&v27[12] = v20;
        v28 = 2050;
        v29 = v21;
        _os_log_impl(&dword_21B72A000, v19, OS_LOG_TYPE_DEFAULT, "CMPrecisionFindingVelocityEstimator,timestamp,%{public}f,directionOfTravel,%{public}f,velocityX,%{public}f,velocityY,%{public}f", buf, 0x2Au);
      }
      *(_QWORD *)&v27[12] = 0;
      *(double *)buf = v18;
      *(float *)&buf[8] = v6;
      *(_QWORD *)&v22 = *(_QWORD *)(a1 + 20560);
      *((_QWORD *)&v22 + 1) = *(_QWORD *)(a1 + 24);
      *(_OWORD *)v27 = v22;
      sub_21B890F3C((uint64_t *)buf);
    }
  }
  sub_21B892B34();
  return v4;
}

os_log_t sub_21B881960()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PrecisionFinding");
  qword_25518E1C8 = (uint64_t)result;
  return result;
}

size_t sub_21B88198C(char *__source)
{
  return strlcpy(byte_25518F730, __source, 0x100uLL);
}

uint64_t sub_21B8819A0(uint64_t a1, float a2, float a3, float a4, float a5)
{
  NSObject *v10;
  const char *v11;
  uint64_t result;
  float v13;
  float v14;
  __float2 v15;
  int v16;
  __float2 v17;
  float v18;
  float v19;
  uint8_t buf[4];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (sub_21B881DA4(0, (int *)&unk_25518E210, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0))
  {
    if (qword_25518E1F0 != -1)
      dispatch_once(&qword_25518E1F0, &unk_24DF3AAD8);
    v10 = qword_25518E1F8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1F8, OS_LOG_TYPE_DEBUG))
      return 0xFFFFFFFFLL;
    *(_WORD *)buf = 0;
    v11 = "WMM initialization encountered an error";
LABEL_11:
    _os_log_impl(&dword_21B72A000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 2u);
    return 0xFFFFFFFFLL;
  }
  dword_25518E3E0 = LODWORD(a2);
  dword_25518E3E4 = LODWORD(a3);
  *(float *)&dword_25518E3E8 = a4 / 1000.0;
  dword_25518E3EC = LODWORD(a5);
  if (sub_21B881DA4(1, 0, (float *)&dword_25518E3F0, (float *)&dword_25518E3F4, (float *)&dword_25518E3F8, &flt_25518E3FC, a4 / 1000.0, a2, a3, a5))
  {
    if (qword_25518E1F0 != -1)
      dispatch_once(&qword_25518E1F0, &unk_24DF3AAD8);
    v10 = qword_25518E1F8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1F8, OS_LOG_TYPE_DEBUG))
      return 0xFFFFFFFFLL;
    *(_WORD *)buf = 0;
    v11 = "WMM evaluation encountered an error";
    goto LABEL_11;
  }
  dword_25518E400 = dword_25518E3F0;
  dword_25518E404 = dword_25518E3F4;
  dword_25518E408 = dword_25518E3F8;
  *(float *)&dword_25518E3EC = *(float *)&dword_25518E3EC + 1.0;
  sub_21B881DA4(1, 0, (float *)&dword_25518E3F0, (float *)&dword_25518E3F4, (float *)&dword_25518E3F8, &flt_25518E3FC, *(float *)&dword_25518E3E8, *(float *)&dword_25518E3E0, *(float *)&dword_25518E3E4, *(float *)&dword_25518E3EC);
  v13 = *(float *)&dword_25518E408;
  v14 = *(float *)&dword_25518E400;
  v15 = __sincosf_stret(*(float *)&dword_25518E400 * 0.017453);
  v16 = dword_25518E404;
  v17 = __sincosf_stret(*(float *)&dword_25518E404 * 0.017453);
  if ((float)(v13 * v17.__cosval) < 100.0)
  {
    v14 = log(-1.0);
    dword_25518E400 = LODWORD(v14);
  }
  if (90.0 - fabsf(*(float *)&dword_25518E3E0) <= 0.001)
  {
    v14 = log(-1.0);
    dword_25518E400 = LODWORD(v14);
    v18 = v14;
    v19 = v14;
  }
  else
  {
    v18 = v13 * (float)(v15.__cosval * v17.__cosval);
    v19 = v13 * (float)(v15.__sinval * v17.__cosval);
  }
  result = 0;
  *(float *)a1 = v18 / 1000.0;
  *(float *)(a1 + 4) = v19 / 1000.0;
  *(float *)(a1 + 8) = (float)(v13 * v17.__sinval) / 1000.0;
  *(float *)(a1 + 12) = v13 / 1000.0;
  *(float *)(a1 + 16) = (float)(v13 * v17.__cosval) / 1000.0;
  *(float *)(a1 + 20) = v14;
  *(_DWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_21B881DA4(int a1, int *a2, float *a3, float *a4, float *a5, float *a6, float a7, float a8, float a9, float a10)
{
  float v16;
  float *v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  FILE *v24;
  FILE *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  char *v30;
  int v31;
  uint64_t v32;
  float *v33;
  float *v34;
  float *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  float *v39;
  int v40;
  uint64_t v41;
  float v42;
  int v43;
  int v44;
  float v45;
  float v46;
  __float2 v47;
  float sinval;
  float cosval;
  float *v50;
  _BOOL4 v51;
  float *v52;
  float *v53;
  __float2 v54;
  float v55;
  float v56;
  int v57;
  float v58;
  float v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int *v63;
  char *v64;
  uint32_t v65;
  uint64_t v66;
  uint64_t v67;
  float *v68;
  float v69;
  float *v70;
  float v71;
  float v72;
  float v73;
  uint64_t v74;
  float *v75;
  float *v76;
  float *v77;
  float *v78;
  float *v79;
  float *v80;
  int *v81;
  int v82;
  int v83;
  float v84;
  float v85;
  int *v86;
  float v87;
  float v88;
  float v89;
  int v90;
  unint64_t v91;
  float v92;
  float v93;
  float *v94;
  int *v95;
  int *v96;
  float v97;
  float v98;
  float v99;
  uint64_t v100;
  int64_t v101;
  float v102;
  int *v103;
  float v104;
  int64_t v105;
  int *v106;
  unint64_t v107;
  float *v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  int *v112;
  float *v113;
  int *v114;
  uint64_t v115;
  float *v116;
  uint64_t v117;
  float *v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  unint64_t v130;
  int *v131;
  float *v132;
  float *v133;
  float *v134;
  int *v135;
  float *v136;
  uint64_t v137;
  float *v138;
  uint64_t v139;
  uint64_t v140;
  float *v141;
  int *v142;
  uint64_t v143;
  int *v144;
  float v145;
  float v146;
  float v147;
  int v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float *v158;
  float *v159;
  uint64_t v162;
  unint64_t v163;
  int *v164;
  int v165;
  int v166;
  uint64_t v167;
  _BOOL4 v168;
  int *v169;
  float *v170;
  uint8_t buf[4];
  double v172;
  __int16 v173;
  double v174;
  uint64_t v175;

  v175 = *MEMORY[0x24BDAC8D0];
  if (a1 == 1)
  {
    v16 = a10 - *(float *)&dword_25518F50C;
    v17 = (float *)&unk_25518F000;
    v18 = *(float *)&dword_25518F520;
    if (*(float *)&dword_25518F520 < 0.0 && v16 < 0.0)
    {
      if (qword_25518E1F0 != -1)
        dispatch_once(&qword_25518E1F0, &unk_24DF3AAD8);
      v19 = qword_25518E1F8;
      v20 = 1;
      if (os_log_type_enabled((os_log_t)qword_25518E1F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        v172 = a10;
        v173 = 2050;
        v174 = *(float *)&dword_25518F50C;
        v21 = "supplied date (%{public}f) outside valid range (epoch=%{public}f)";
        v22 = v19;
LABEL_42:
        v65 = 22;
LABEL_112:
        _os_log_impl(&dword_21B72A000, v22, OS_LOG_TYPE_INFO, v21, buf, v65);
        return v20;
      }
      return v20;
    }
    v47 = __sincosf_stret(a9 * 0.017453);
    sinval = v47.__sinval;
    cosval = v47.__cosval;
    v50 = (float *)&unk_25518F000;
    v51 = *(float *)&dword_25518F528 != a8 || *(float *)&dword_25518F524 != a7;
    dword_25518F150 = LODWORD(v47.__sinval);
    dword_25518F184 = LODWORD(v47.__cosval);
    v52 = (float *)&unk_25518F000;
    v53 = (float *)&unk_25518F000;
    if (v51)
    {
      v54 = __sincosf_stret(a8 * 0.017453);
      v17 = (float *)&unk_25518F000;
      v50 = (float *)&unk_25518F000;
      v55 = sqrtf(*(float *)&dword_25518F4F8 - (float)(*(float *)&dword_25518F500 * (float)(v54.__sinval * v54.__sinval)));
      v56 = (float)(*(float *)&dword_25518F4F8 + (float)(v55 * a7))
          / (float)((float)(v55 * a7) + *(float *)&dword_25518F4FC);
      *(float *)&dword_25518F530 = v54.__sinval
                                 / sqrtf((float)(v54.__sinval * v54.__sinval)+ (float)((float)(v56 * v56) * (float)(v54.__cosval * v54.__cosval)));
      *(float *)&v57 = sqrt(1.0 - (float)(*(float *)&dword_25518F530 * *(float *)&dword_25518F530));
      dword_25518F534 = v57;
      v58 = (float)(a7 * a7)
          + (float)(v55 * a7) * 2.0
          + (float)((float)(*(float *)&dword_25518F504
                          - (float)(*(float *)&dword_25518F508 * (float)(v54.__sinval * v54.__sinval)))
                  / (float)(v55 * v55));
      dword_25518F538 = sqrtf(v58);
      v59 = sqrtf((float)((float)(v54.__sinval * v54.__sinval) * *(float *)&dword_25518F4FC)+ (float)(*(float *)&dword_25518F4F8 * (float)(v54.__cosval * v54.__cosval)));
      *(float *)&dword_25518F53C = (float)(v59 + a7) / *(float *)&dword_25518F538;
      *(float *)&dword_25518F540 = (float)(v54.__sinval * (float)(v54.__cosval * *(float *)&dword_25518F500))
                                 / (float)(v59 * *(float *)&dword_25518F538);
    }
    v60 = dword_25518E40C;
    if (*(float *)&dword_25518F52C != a9)
    {
      if (dword_25518E40C >= 2)
      {
        v61 = dword_25518E40C + 1;
        v67 = dword_25518E40C - 1;
        v68 = (float *)&dword_25518F188;
        v69 = v47.__sinval;
        v70 = (float *)&dword_25518F154;
        do
        {
          v71 = *(float *)&dword_25518F184;
          v72 = (float)(*(float *)&dword_25518F184 * sinval) + (float)(v69 * cosval);
          *v70++ = v72;
          v69 = *(float *)&dword_25518F150;
          cosval = (float)(v71 * cosval) - (float)(*(float *)&dword_25518F150 * sinval);
          *v68++ = cosval;
          sinval = v72;
          --v67;
        }
        while (v67);
      }
      else
      {
        v61 = 2;
      }
      dword_25518E414 = v61;
    }
    v73 = *(float *)&dword_25518F534;
    if ((int)v60 >= 1)
    {
      v158 = a3;
      v159 = a6;
      v74 = 0;
      v75 = (float *)&unk_25518E964;
      v76 = (float *)&unk_25518E990;
      v77 = (float *)&unk_25518E41C;
      v78 = (float *)&unk_25518E448;
      v79 = (float *)&unk_25518E6C0;
      v80 = (float *)&unk_25518E6EC;
      v81 = &dword_25518EEAC;
      v82 = -1;
      v83 = 3;
      v84 = *(float *)&dword_25518F4F4 / *(float *)&dword_25518F538;
      v85 = v84 * v84;
      v86 = &dword_25518EC08;
      v170 = (float *)&unk_25518F254;
      v87 = *(float *)&dword_25518F530;
      v88 = -*(float *)&dword_25518F534;
      v89 = *(float *)dword_25518F180;
      v90 = dword_25518F21C;
      v91 = 1;
      v92 = *(float *)&dword_25518F14C;
      v93 = 0.0;
      v94 = flt_25518F1E8;
      v95 = &dword_25518F21C;
      v96 = &dword_25518F14C;
      v97 = 0.0;
      v98 = 0.0;
      v99 = 0.0;
      v162 = v60 + 1;
      v168 = v51;
      while (1)
      {
        v100 = 0;
        v101 = 0;
        v166 = v82;
        v102 = -(float)(v84 * v85);
        v85 = v84 * v85;
        v163 = v91 + 1;
        v103 = &dword_25518EEA8[v91];
        v104 = flt_25518F1B4[v91];
        v105 = v91 - 2;
        v169 = &dword_25518EC04[v82];
        v106 = v103 - 1;
        v107 = v91 - 1;
        v108 = (float *)((char *)&unk_25518F250 + 4 * v91 + 52);
        v109 = v83;
        v110 = 13 * (int)v91 - 13;
        v111 = 13 * (int)v91;
        v112 = &dword_25518EC04[13 * v91];
        v113 = (float *)&v112[v91 - 14];
        v114 = v86;
        v115 = 13 * (v91 - 1);
        v116 = (float *)&v112[v91];
        v167 = v74;
        v117 = v74 + 1;
        v164 = v114;
        v118 = (float *)v114;
        v165 = v109;
        do
        {
          if (v51)
          {
            if (v117 == v101)
            {
              *(float *)&v103[v111] = v73 * *(float *)&v106[v110];
              *v116 = (float)(v87 * *(float *)&v106[v115]) + (float)(v73 * *v113);
            }
            else
            {
              if (v91 == 1 && !v101)
              {
                *(float *)&dword_25518EEAC = v87 * *(float *)dword_25518EEA8;
                *(float *)&dword_25518EC08 = (float)(*(float *)dword_25518EEA8 * v88)
                                           + (float)(v87 * *(float *)&dword_25518EC04[v107]);
                if (v18 == a10)
                {
LABEL_64:
                  v119 = v85 * *(float *)&v81[v100];
LABEL_65:
                  v126 = flt_25518E960[v91];
                  v124 = v126 * v89;
                  v125 = v126 * v92;
                  goto LABEL_66;
                }
LABEL_57:
                v75[v100] = v77[v100] + (float)(v16 * v79[v100]);
                if (!v101)
                  goto LABEL_64;
                v76[v101] = v78[v101] + (float)(v16 * v80[v101]);
                v119 = v85 * *(float *)&v103[v100];
                goto LABEL_60;
              }
              if (v91 >= 2)
              {
                v130 = v107;
                v131 = v95;
                v132 = v80;
                v133 = v78;
                v134 = v94;
                v135 = v81;
                v136 = v116;
                v137 = v115;
                v138 = v113;
                v139 = v111;
                v140 = v110;
                v141 = v108;
                v142 = v96;
                if (v101 <= v105)
                {
                  v144 = v103 - 2;
                  v145 = *(float *)&v169[v100];
                  v143 = v100;
                }
                else
                {
                  v143 = v100;
                  v144 = v103 - 2;
                  v103[v100 - 2] = 0;
                  v169[v100] = 0;
                  v145 = 0.0;
                }
                v146 = *(float *)&v106[v143];
                v147 = v170[v100];
                *(float *)&v103[v143] = (float)(v87 * v146) - (float)(v147 * *(float *)&v144[v143]);
                *v118 = (float)((float)(v146 * v88) + (float)(v87 * *(v118 - 1))) - (float)(v147 * v145);
                v96 = v142;
                v108 = v141;
                v110 = v140;
                v111 = v139;
                v113 = v138;
                v115 = v137;
                v116 = v136;
                v81 = v135;
                v94 = v134;
                v78 = v133;
                v80 = v132;
                v95 = v131;
                v107 = v130;
                v51 = v168;
              }
            }
          }
          if (v18 != a10)
            goto LABEL_57;
          v119 = v85 * *(float *)&v103[v100];
          if (!v101)
            goto LABEL_65;
LABEL_60:
          v120 = v75[v100];
          v121 = *(float *)&dword_25518F180[v101];
          v122 = v76[v101];
          v123 = *(float *)&v96[v101];
          v124 = (float)(v122 * v123) + (float)(v120 * v121);
          v125 = (float)(v120 * v123) - (float)(v122 * v121);
LABEL_66:
          v127 = *v118;
          v128 = v125 * v94[v101];
          if (v101 == 1 && v73 == 0.0)
          {
            if (v91 == 1)
            {
              v95[1] = v90;
              v129 = *((float *)v95 + 1);
            }
            else
            {
              v129 = (float)(v87 * *(float *)&v95[v107]) - (float)(*v108 * *(float *)&v95[v105]);
              *(float *)&v95[v91] = v129;
            }
            v99 = v99 + (float)(v128 * (float)(v85 * v129));
          }
          v93 = v93 + (float)((float)(v124 * v102) * v127);
          v97 = v97 + (float)(v128 * v119);
          v98 = v98 + (float)((float)(v124 * v104) * v119);
          ++v101;
          v100 += 13;
          --v109;
          v118 += 13;
        }
        while (v109 > 1);
        ++v81;
        v82 = v166 + 1;
        v83 = v165 + 1;
        ++v91;
        v86 = v164 + 1;
        ++v170;
        ++v75;
        ++v79;
        ++v77;
        v76 += 13;
        v78 += 13;
        v80 += 13;
        v74 = v167 + 1;
        v148 = v162;
        if (v163 == v162)
        {
          dword_25518E414 = v101;
          a3 = v158;
          a6 = v159;
          v17 = (float *)&unk_25518F000;
          v50 = (float *)&unk_25518F000;
          v52 = (float *)&unk_25518F000;
          v53 = (float *)&unk_25518F000;
          goto LABEL_82;
        }
      }
    }
    v148 = 1;
    v98 = 0.0;
    v93 = 0.0;
    v99 = 0.0;
    v97 = 0.0;
LABEL_82:
    dword_25518E410 = v148;
    if (v73 == 0.0)
      v149 = v99;
    else
      v149 = v97 / v73;
    v150 = v52[335];
    v151 = v53[336];
    v152 = (float)-(float)(v98 * v151) - (float)(v93 * v150);
    v153 = (float)(v93 * v151) - (float)(v98 * v150);
    v154 = sqrtf((float)(v149 * v149) + (float)(v152 * v152));
    *a5 = sqrtf((float)(v153 * v153) + (float)(v154 * v154));
    *a3 = atan2f(v149, v152) / 0.017453;
    *a4 = atan2f(v153, v154) / 0.017453;
    *a6 = -999.0;
    if (fabsf(a8) >= 55.0)
    {
      v155 = -999.0;
      if (a9 >= 0.0 && a8 > 0.0)
      {
        v155 = *a3 - a9;
        *a6 = v155;
      }
      v156 = fabsf(a9);
      if (a8 > 0.0 && a9 < 0.0)
      {
        v155 = v156 + *a3;
        *a6 = v155;
      }
      if (a9 >= 0.0 && a8 < 0.0)
      {
        v155 = *a3 + a9;
        *a6 = v155;
      }
      if (a8 < 0.0 && a9 < 0.0)
      {
        v155 = *a3 - v156;
        *a6 = v155;
      }
      if (v155 > 180.0)
      {
        v155 = v155 + -360.0;
LABEL_101:
        if (v155 < -180.0)
          v155 = v155 + 360.0;
        *a6 = v155;
        goto LABEL_104;
      }
      if (v155 < -180.0)
        goto LABEL_101;
    }
LABEL_104:
    v20 = 0;
    v17[328] = a10;
    v50[329] = a7;
    dword_25518F528 = LODWORD(a8);
    dword_25518F52C = LODWORD(a9);
    return v20;
  }
  v24 = fopen(byte_25518F730, "r");
  if (v24)
  {
    v25 = v24;
    dword_25518E40C = *a2;
    dword_25518F14C = 0;
    dword_25518F21C = 1065353216;
    dword_25518EEA8[0] = 1065353216;
    dword_25518F180[0] = 1065353216;
    dword_25518EC04[0] = 0;
    dword_25518F4F4 = 1170676122;
    dword_25518F4F8 = 1276849967;
    dword_25518F4FC = 1276781883;
    dword_25518F500 = 1216674304;
    dword_25518F504 = 1488725079;
    dword_25518F508 = 1436593536;
    dword_25518E418[0] = 0;
    dword_25518E6BC[0] = 0;
    if (fgets(byte_25518F544, 80, v24))
    {
      sscanf(byte_25518F544, "%f", &dword_25518F50C);
      if (fgets(byte_25518F544, 80, v25))
      {
        v26 = 0;
        do
        {
          do
          {
            if (!byte_25518F544[v26])
              break;
            *((_BYTE *)&dword_25518F595 + v26) = byte_25518F544[v26];
            ++v26;
            *((_BYTE *)&dword_25518F595 + v26) = 0;
          }
          while (v26 != 4);
          if (!(dword_25518F595 ^ 0x39393939 | byte_25518F599))
            break;
          sscanf(byte_25518F544, "%d%d%f%f%f%f", &dword_25518E410, &dword_25518E414, &dword_25518F510, &dword_25518F514, &dword_25518F518, &dword_25518F51C);
          v27 = dword_25518E414;
          if (dword_25518E414 > 0xC
            || (v28 = dword_25518E410, dword_25518E410 > 12)
            || dword_25518E410 < 0)
          {
            fclose(v25);
            if (qword_25518E1F0 != -1)
              dispatch_once(&qword_25518E1F0, &unk_24DF3AAD8);
            v66 = qword_25518E1F8;
            v20 = 1;
            if (os_log_type_enabled((os_log_t)qword_25518E1F8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v21 = "geomagnetic data file appears to have invalid dimensions";
              goto LABEL_111;
            }
            return v20;
          }
          if (dword_25518E414 <= dword_25518E410)
          {
            dword_25518E418[13 * dword_25518E414 + dword_25518E410] = dword_25518F510;
            dword_25518E6BC[13 * v27 + v28] = dword_25518F518;
            if (v27)
            {
              v29 = v27 - 1;
              dword_25518E418[13 * v28 + v29] = dword_25518F514;
              dword_25518E6BC[13 * v28 + v29] = dword_25518F51C;
            }
          }
          v30 = fgets(byte_25518F544, 80, v25);
          v26 = 0;
        }
        while (v30);
      }
      dword_25518EEA8[0] = 1065353216;
      if (dword_25518E40C < 1)
      {
        LODWORD(v32) = 1;
      }
      else
      {
        v31 = 0;
        v32 = dword_25518E40C + 1;
        v33 = (float *)&unk_25518E6C0;
        v34 = (float *)&unk_25518E41C;
        v35 = (float *)&unk_25518F254;
        v36 = 1;
        do
        {
          v37 = 0;
          v38 = 0;
          v39 = (float *)&dword_25518EEA8[v36];
          v40 = 2 * v36 - 1;
          *v39 = (float)(*(v39 - 1) * (float)v40) / (float)(int)v36;
          v41 = v36 + 1;
          v42 = (float)(v40 * (2 * v36 - 3));
          v43 = 2;
          v44 = v31;
          do
          {
            v35[v37] = (float)((v31 + v38) * v44) / v42;
            if (v37)
            {
              v45 = v39[(int)v37 - 13] * sqrtf((float)(v43 * (v44 + 2)) / (float)(v31 + v38 + 1));
              v39[(int)v37] = v45;
              *(float *)&dword_25518E418[13 * v36 + (v38 - 1)] = *(float *)&dword_25518E418[13 * v36 + (v38 - 1)]
                                                                             * v45;
              *(float *)&dword_25518E6BC[13 * v36 + (v38 - 1)] = v45
                                                                             * *(float *)&dword_25518E6BC[13 * v36 + (v38 - 1)];
              v43 = 1;
            }
            v46 = v39[v37];
            v34[v37] = v46 * v34[v37];
            v33[v37] = v46 * v33[v37];
            ++v38;
            v37 += 13;
            --v44;
          }
          while (v44 + 3 > 1);
          flt_25518F1B4[v36] = (float)(int)v41;
          flt_25518F1E8[v36] = (float)(int)v36;
          ++v31;
          ++v33;
          ++v34;
          ++v35;
          ++v36;
        }
        while (v41 != v32);
        dword_25518E414 = v38;
      }
      dword_25518E410 = v32;
      dword_25518F288 = 0;
      dword_25518F52C = -998637568;
      dword_25518F528 = -998637568;
      dword_25518F524 = -998637568;
      dword_25518F520 = -998637568;
      fclose(v25);
      return 0;
    }
    else
    {
      fclose(v25);
      if (qword_25518E1F0 != -1)
        dispatch_once(&qword_25518E1F0, &unk_24DF3AAD8);
      v66 = qword_25518E1F8;
      v20 = 1;
      if (os_log_type_enabled((os_log_t)qword_25518E1F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v21 = "geomagnetic data file appears to be empty";
LABEL_111:
        v22 = v66;
        v65 = 2;
        goto LABEL_112;
      }
    }
  }
  else
  {
    if (qword_25518E1F0 != -1)
      dispatch_once(&qword_25518E1F0, &unk_24DF3AAD8);
    v62 = qword_25518E1F8;
    v20 = 1;
    if (os_log_type_enabled((os_log_t)qword_25518E1F8, OS_LOG_TYPE_INFO))
    {
      v63 = __error();
      v64 = strerror(*v63);
      *(_DWORD *)buf = 136315394;
      v172 = COERCE_DOUBLE(byte_25518F730);
      v173 = 2082;
      v174 = *(double *)&v64;
      v21 = "could not open geomagnetic data file %s (%{public}s)";
      v22 = v62;
      goto LABEL_42;
    }
  }
  return v20;
}

os_log_t sub_21B882C2C()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "Compass");
  qword_25518E1F8 = (uint64_t)result;
  return result;
}

uint64_t sub_21B882C58(uint64_t a1, unint64_t a2)
{
  void **v3;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 16) = 0;
  v3 = (void **)(a1 + 16);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  sub_21B883F38((unint64_t *)(a1 + 56), a2);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16);
  sub_21B882F04(v3, *(_QWORD *)a1);
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return a1;
}

void sub_21B882CC0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  _QWORD *v3;
  void *v5;

  sub_21B882D24(v3);
  v5 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

void sub_21B882CEC(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16);
  sub_21B882F04((void **)(a1 + 16), *(_QWORD *)a1);
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 40) = 0;
}

_QWORD *sub_21B882D24(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[2];
  if (v4)
  {
    a1[3] = v4;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_21B882D78(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5)
{
  uint64_t result;

  result = sub_21B882DA8((uint64_t *)(a1 + 16), a2, a3, a4, a5);
  ++*(_QWORD *)(a1 + 8);
  return result;
}

uint64_t sub_21B882DA8(uint64_t *a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5)
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;

  v12 = a1[2];
  v10 = (uint64_t)(a1 + 2);
  v11 = v12;
  v13 = *(_QWORD *)(v10 - 8);
  if (v13 >= v12)
  {
    v15 = (uint64_t)(v13 - *a1) >> 5;
    if ((unint64_t)(v15 + 1) >> 59)
      sub_21B796A0C();
    v16 = v11 - *a1;
    v17 = v16 >> 4;
    if (v16 >> 4 <= (unint64_t)(v15 + 1))
      v17 = v15 + 1;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0)
      v18 = 0x7FFFFFFFFFFFFFFLL;
    else
      v18 = v17;
    if (v18)
    {
      v19 = (char *)sub_21B8840F4(v10, v18);
      v21 = v20;
    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v22 = sub_21B884FC0((uint64_t)&v19[32 * v15], a2, a3, a4, a5);
    v14 = v22 + 32;
    v24 = (char *)*a1;
    v23 = (char *)a1[1];
    if (v23 != (char *)*a1)
    {
      do
      {
        v25 = *((_OWORD *)v23 - 1);
        *(_OWORD *)(v22 - 32) = *((_OWORD *)v23 - 2);
        *(_OWORD *)(v22 - 16) = v25;
        v22 -= 32;
        v23 -= 32;
      }
      while (v23 != v24);
      v23 = (char *)*a1;
    }
    *a1 = v22;
    a1[1] = v14;
    a1[2] = (uint64_t)&v19[32 * v21];
    if (v23)
      operator delete(v23);
  }
  else
  {
    sub_21B884FC0(*(_QWORD *)(v10 - 8), a2, a3, a4, a5);
    v14 = v13 + 32;
    a1[1] = v13 + 32;
  }
  a1[1] = v14;
  return v14 - 32;
}

void sub_21B882EE0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_21B882F04(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 5)
  {
    if (a2 >> 59)
      sub_21B796A0C();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_21B8840F4(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    v9 = &v6[32 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_21B882FA0(uint64_t a1)
{
  *(float *)(a1 + 40) = sub_21B882FD8(a1);
  *(float *)(a1 + 44) = sub_21B88308C(a1);
  *(_BYTE *)(a1 + 48) = 1;
}

float sub_21B882FD8(uint64_t a1)
{
  float *v1;
  float *v2;
  int v3;
  float v4;
  _QWORD v6[6];
  int v7;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v1 = *(float **)(a1 + 16);
  v2 = *(float **)(a1 + 24);
  while (v1 != v2)
  {
    sub_21B885010(v1);
    v7 = v3;
    sub_21B88361C(v8, (float *)&v7);
    v1 += 8;
  }
  sub_21B880DA8((uint64_t)v6, v8);
  v4 = sub_21B8836A0(v6);
  sub_21B880D14(v6);
  sub_21B880D14(v8);
  return v4;
}

void sub_21B883064(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  sub_21B880D14((uint64_t *)va);
  sub_21B880D14((uint64_t *)va1);
  _Unwind_Resume(a1);
}

float sub_21B88308C(uint64_t a1)
{
  unint64_t v2;
  int v3;
  float v4;
  uint64_t v5;
  float *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v12[2];
  __int128 v13;

  if (*(_QWORD *)(a1 + 8))
  {
    v2 = 0;
    v3 = 0;
    v4 = 0.0;
    v5 = 16;
    do
    {
      v6 = (float *)(*(_QWORD *)(a1 + 16) + v5);
      v13 = *(_OWORD *)v6;
      v12[0] = sub_21B884FC4(v6 - 4, *(float *)(a1 + 40));
      v12[1] = v7;
      v8 = sub_21B87D48C((uint64_t)&v13, v12);
      v4 = v4 + (float)((float)(v9 * v9) + (float)(v8 * v8));
      v3 += 2;
      ++v2;
      v5 += 32;
    }
    while (*(_QWORD *)(a1 + 8) > v2);
    v10 = v4 / (float)v3;
  }
  else
  {
    v10 = NAN;
  }
  return sqrtf(v10);
}

void sub_21B883140(uint64_t a1, float a2)
{
  *(float *)(a1 + 40) = (float)(sub_21B882FD8(a1) + a2) * 0.5;
  *(float *)(a1 + 44) = sub_21B88308C(a1);
  *(_BYTE *)(a1 + 48) = 1;
}

float sub_21B883190(uint64_t a1, int a2)
{
  int v2;
  int v4;
  float v5;
  float v6;
  int v7;
  int v8;
  float v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 48))
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
    v12 = qword_25518E1D8;
    v6 = 0.0;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Reject iterate request before initialization.";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl(&dword_21B72A000, v14, v15, v13, buf, 2u);
    }
    return v6;
  }
  if (a2 >= 50)
    v2 = 50;
  else
    v2 = a2;
  if (v2 < 0)
    return 0.0;
  v4 = *(_DWORD *)(a1 + 40);
  v18 = 0;
  v5 = 0.01;
  v6 = 0.0;
  if (sub_21B883534(a1, (float *)&v18 + 1, (float *)&v18, 0.01))
  {
    v7 = 0;
    v8 = v2 + 1;
    while (1)
    {
      *(float *)(a1 + 40) = *((float *)&v18 + 1) + *(float *)(a1 + 40);
      v6 = sub_21B88308C(a1);
      v9 = *(float *)(a1 + 44);
      if ((float)(v6 - v9) <= 0.0)
      {
        if (fabsf(v6 - v9) < (float)(fabsf(v9) * 0.001))
        {
          if (qword_25518E1D0 != -1)
            dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
          v17 = qword_25518E1D8;
          if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v13 = "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Converged!";
            goto LABEL_38;
          }
          return v6;
        }
        *(float *)(a1 + 44) = v6;
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
        v5 = fmaxf(v5 * 0.5, 0.00000001);
        v11 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v20 = v5;
          _os_log_impl(&dword_21B72A000, v11, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Accept (lambda = %.6f)", buf, 0xCu);
        }
        v7 = 0;
      }
      else
      {
        *(_DWORD *)(a1 + 40) = v4;
        *(float *)(a1 + 44) = sub_21B88308C(a1);
        if (v7 >= 3)
        {
          if (qword_25518E1D0 != -1)
            dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
          v17 = qword_25518E1D8;
          if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v13 = "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Max rollbacks exceeded, exiting!";
LABEL_38:
            v14 = v17;
            v15 = OS_LOG_TYPE_DEBUG;
            goto LABEL_27;
          }
          return v6;
        }
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
        v5 = v5 * 5.0;
        ++v7;
        v10 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v20 = v5;
          _os_log_impl(&dword_21B72A000, v10, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentSolver]:[iterate] Rollback (lambda = %.6f)", buf, 0xCu);
        }
      }
      if (--v8)
      {
        v4 = *(_DWORD *)(a1 + 40);
        v18 = 0;
        if (sub_21B883534(a1, (float *)&v18 + 1, (float *)&v18, v5))
          continue;
      }
      return v6;
    }
  }
  return v6;
}

uint64_t sub_21B883534(uint64_t a1, float *a2, float *a3, float a4)
{
  unint64_t *v8;
  __float2 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v16[2];
  float v17[2];
  __int128 v18;
  float v19[4];

  v8 = (unint64_t *)(a1 + 56);
  sub_21B8837EC((_QWORD *)(a1 + 56));
  v9 = __sincosf_stret(*(float *)(a1 + 40));
  v19[0] = -v9.__sinval;
  v19[1] = -v9.__cosval;
  v19[2] = v9.__cosval;
  v19[3] = -v9.__sinval;
  if (*(_QWORD *)(a1 + 8))
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = *(_QWORD *)(a1 + 16) + v10;
      v18 = *(_OWORD *)(v12 + 16);
      v17[0] = sub_21B87D48C((uint64_t)v19, (float *)v12);
      v17[1] = v13;
      v16[0] = sub_21B884FC4((float *)(*(_QWORD *)(a1 + 16) + v10), *(float *)(a1 + 40));
      v16[1] = v14;
      sub_21B88389C(v8, v16, v17, (uint64_t)&v18);
      ++v11;
      v10 += 32;
    }
    while (*(_QWORD *)(a1 + 8) > v11);
  }
  return sub_21B883AC4(v8, a2, a3, a4);
}

float sub_21B88361C(_QWORD *a1, float *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float result;

  v4 = a1[2];
  v5 = a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = ((v4 - v5) << 7) - 1;
  v7 = a1[5];
  v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_21B884128(a1);
    v5 = a1[1];
    v7 = a1[5];
    v8 = a1[4] + v7;
  }
  result = *a2;
  *(float *)(*(_QWORD *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
  return result;
}

float sub_21B8836A0(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  float **v8;
  float *v9;
  float *v10;
  float **v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  float **v15;
  float *v16;
  unint64_t v17;
  _QWORD v18[2];

  v1 = a1[5];
  if (!v1)
    return 0.0;
  if (v1 == 1)
  {
    v3 = a1[4];
  }
  else
  {
    v5 = v1 >> 1;
    v6 = a1[4];
    v7 = a1[1];
    v8 = (float **)(v7 + 8 * (v6 >> 10));
    if (a1[2] == v7)
      v9 = 0;
    else
      v9 = &(*v8)[a1[4] & 0x3FFLL];
    v18[0] = v7 + 8 * (v6 >> 10);
    v18[1] = v9;
    v11 = (float **)sub_21B881540((uint64_t)v18, v5);
    v12 = a1[5];
    v13 = a1[4] + v12;
    v14 = a1[1];
    v15 = (float **)(v14 + 8 * (v13 >> 10));
    if (a1[2] == v14)
      v16 = 0;
    else
      v16 = &(*v15)[v13 & 0x3FF];
    if (v10 != v16)
    {
      sub_21B88443C(v8, v9, v11, v10, v15, v16);
      v12 = a1[5];
    }
    if ((v12 & 1) == 0)
    {
      v17 = a1[4] + v5;
      return (float)(*(float *)(*(_QWORD *)(a1[1] + (((v17 - 1) >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * ((v17 - 1) & 0x3FF))
                   + *(float *)(*(_QWORD *)(a1[1] + ((v17 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v17 & 0x3FF)))
           * 0.5;
    }
    v3 = a1[4] + v5;
  }
  return *(float *)(*(_QWORD *)(a1[1] + ((v3 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v3 & 0x3FF));
}

void sub_21B8837EC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  a1[1] = 0;
  v2 = (void *)a1[2];
  v3 = a1[3] - (_QWORD)v2;
  if (v3 >= 1)
    bzero(v2, 4 * (((unint64_t)v3 >> 2) - ((unint64_t)v3 > 3)) + 4);
  v4 = (void *)a1[5];
  v5 = a1[6] - (_QWORD)v4;
  if (v5 >= 1)
    bzero(v4, 4 * (((unint64_t)v5 >> 2) - ((unint64_t)v5 > 3)) + 4);
  v6 = (void *)a1[8];
  v7 = a1[9] - (_QWORD)v6;
  if (v7 >= 1)
    bzero(v6, 8 * (((unint64_t)v7 >> 3) - ((unint64_t)v7 > 7)) + 8);
}

void sub_21B88389C(unint64_t *a1, float *a2, float *a3, uint64_t a4)
{
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v12;
  _BOOL4 v13;
  unint64_t v14;
  int v15;
  float v16;
  unint64_t v17;
  int v18;
  char v19;
  char v20;
  float v21;
  unint64_t v22;
  _DWORD v23[2];
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a1[1];
  if (v5 <= *a1)
  {
    if (v5 == *a1 - 1)
    {
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
      v12 = qword_25518E1D8;
      v13 = os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG);
      v5 = a1[1];
      if (v13)
      {
        v14 = *a1;
        *(_DWORD *)buf = 134218240;
        v25 = v5;
        v26 = 2048;
        v27 = v14;
        _os_log_impl(&dword_21B72A000, v12, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAMEstimator1DConstant]:[add] Adding last sample. Number of added inputs: %lu, initial allocation: %lu.", buf, 0x16u);
        v5 = a1[1];
      }
    }
    *(_QWORD *)(a1[8] + 8 * v5) = 2 * v5;
    *(_DWORD *)buf = sub_21B87D48C(a4, a3);
    LODWORD(v25) = v15;
    v16 = sub_21B87D48C(a4, a2);
    v17 = 0;
    *(float *)v23 = v16;
    v23[1] = v18;
    v19 = 1;
    do
    {
      v20 = v19;
      *(float *)(a1[2] + 4 * (*(_QWORD *)(a1[8] + 8 * a1[1]) + v17)) = sub_21B878C7C((uint64_t)buf, v17);
      v21 = sub_21B878C7C((uint64_t)v23, v17);
      v19 = 0;
      v22 = a1[1];
      *(float *)(a1[5] + 4 * (*(_QWORD *)(a1[8] + 8 * v22) + v17)) = v21;
      v17 = 1;
    }
    while ((v20 & 1) != 0);
    a1[1] = v22 + 1;
  }
  else
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
    v6 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v8 = *a1;
      v7 = a1[1];
      *(_DWORD *)buf = 134218240;
      v25 = v7;
      v26 = 2048;
      v27 = v8;
      _os_log_impl(&dword_21B72A000, v6, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[add] Number of added inputs: %lu exceeded the initial allocation: %lu . Will NOT add this sample.", buf, 0x16u);
    }
  }
}

uint64_t sub_21B883AC4(_QWORD *a1, float *a2, float *a3, float a4)
{
  unint64_t v5;
  unsigned int v9;
  float v10;
  float v11;
  unint64_t v12;
  unint64_t v13;
  float *v14;
  float *v15;
  uint64_t v16;
  float *v17;
  float v18;
  float v19;
  float v20;
  unint64_t v21;
  uint64_t v22;
  float *v23;
  float *v24;
  float *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  float v33;
  unint64_t v34;
  float v35;
  unint64_t v36;
  int v37;
  int v38;
  float v39;
  float v40;
  char v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  _BYTE v46[8];
  float v47;
  float v48;
  void *__p;
  _BYTE *v50;
  void *v51[3];
  uint8_t v52[8];
  float *v53;
  uint8_t buf[8];
  void *v55;

  v5 = a1[1];
  if (v5)
  {
    *(_DWORD *)v52 = 1065353216;
    sub_21B883FF4(buf, v5, v52);
    v9 = 0;
    *a2 = 0.0;
    v10 = 0.0;
    v11 = 3.4028e38;
    while (1)
    {
      if (v9 > 0x63)
      {
LABEL_42:
        v42 = 1;
        goto LABEL_53;
      }
      if (!sub_21B884A88(a1, buf, a2, a3, a4))
        break;
      v12 = 2 * a1[1];
      LODWORD(v51[0]) = 0;
      sub_21B883FF4(v52, v12, v51);
      v13 = 2 * a1[1];
      if (v13)
      {
        v14 = (float *)a1[5];
        v15 = (float *)a1[2];
        v16 = 2 * a1[1];
        v17 = *(float **)v52;
        do
        {
          v18 = *v14++;
          v19 = v18;
          v20 = *v15++;
          *v17++ = v19 - (float)(v20 * *a2);
          --v16;
        }
        while (v16);
      }
      LODWORD(__p) = 0;
      sub_21B883FF4(v51, v13, &__p);
      v21 = a1[1];
      v22 = 2 * v21;
      if (2 * v21)
      {
        v23 = (float *)a1[5];
        v24 = (float *)a1[2];
        v25 = (float *)v51[0];
        do
        {
          v26 = *v23++;
          v27 = v26;
          v28 = *v24++;
          *v25++ = v27 - (float)(v28 * v10);
          --v22;
        }
        while (v22);
      }
      v47 = 0.0;
      sub_21B883FF4(&__p, v21, &v47);
      v30 = a1[1];
      if (v30)
      {
        v31 = 0;
        v32 = a1[8];
        v33 = 0.0;
        do
        {
          v34 = *(_QWORD *)(v32 + 8 * v31);
          v35 = 0.0;
          if (v34 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v36 = 0;
            do
            {
              v37 = *((_DWORD *)v51[0] + v34);
              *(_DWORD *)sub_21B878D6C((uint64_t)&v47, v36) = v37;
              v38 = *(_DWORD *)(*(_QWORD *)v52 + 4 * v34);
              *(_DWORD *)sub_21B878D6C((uint64_t)v46, v36++) = v38;
              v35 = v35 + (float)(*(float *)(*(_QWORD *)v52 + 4 * v34) * *(float *)(*(_QWORD *)v52 + 4 * v34));
              ++v34;
              v32 = a1[8];
            }
            while (v34 < *(_QWORD *)(v32 + 8 * v31) + 2);
            v29 = v47;
            v30 = a1[1];
          }
          if (v29 <= 0.0)
            v29 = -v29;
          v39 = v48;
          if (v48 <= 0.0)
            v39 = -v48;
          if (v39 > v29)
            v29 = v39;
          if (v29 <= 1.345)
            v40 = 1.0;
          else
            v40 = 1.345 / v29;
          *((float *)__p + v31) = v40;
          v29 = *(float *)(*(_QWORD *)buf + 4 * v31);
          v33 = v33 + (float)(v29 * v35);
          ++v31;
        }
        while (v30 > v31);
      }
      else
      {
        v33 = 0.0;
      }
      if ((float)(v33 - v11) <= 0.0)
      {
        sub_21B796B90((char *)buf, (char *)__p, (uint64_t)v50, (v50 - (_BYTE *)__p) >> 2);
        if (fabsf(v33 - v11) >= (float)(fabsf(v11) * 0.00001))
        {
          v10 = *a2;
          ++v9;
          v41 = 1;
        }
        else
        {
          v41 = 0;
        }
        v11 = v33;
      }
      else
      {
        v41 = 0;
        *a2 = v10;
      }
      if (__p)
      {
        v50 = __p;
        operator delete(__p);
      }
      if (v51[0])
      {
        v51[1] = v51[0];
        operator delete(v51[0]);
      }
      if (*(_QWORD *)v52)
      {
        v53 = *(float **)v52;
        operator delete(*(void **)v52);
      }
      if ((v41 & 1) == 0)
        goto LABEL_42;
    }
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
    v44 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_21B72A000, v44, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[solve] Ill conditioned. Exiting solver.", v52, 2u);
    }
    v42 = 0;
LABEL_53:
    if (*(_QWORD *)buf)
    {
      v55 = *(void **)buf;
      operator delete(*(void **)buf);
    }
  }
  else
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
    v43 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B72A000, v43, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[solve] Called solve before adding any constraints. Aborting and returning false.", buf, 2u);
    }
    return 0;
  }
  return v42;
}

void sub_21B883EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  if (a23)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

os_log_t sub_21B883F0C()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

unint64_t *sub_21B883F38(unint64_t *a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v6;

  *a1 = a2;
  a1[1] = 0;
  v4 = 2 * a2;
  LODWORD(v6) = 0;
  sub_21B883FF4(a1 + 2, 2 * a2, &v6);
  LODWORD(v6) = 0;
  sub_21B883FF4(a1 + 5, v4, &v6);
  v6 = 0;
  sub_21B884074(a1 + 8, a2, &v6);
  return a1;
}

void sub_21B883FC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 48) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21B883FF4(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_21B796C98(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21B884058(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21B884074(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_21B7969CC(a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21B8840D8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_21B8840F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_21B796AC8();
  return operator new(32 * a2);
}

void sub_21B884128(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x400;
  v4 = v2 - 1024;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_21B796A20(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      sub_21B7E4C54(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    sub_21B7E4D68((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_21B796A20((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = sub_21B796A20((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  sub_21B7E4E84(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_21B7E4F98((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_21B8843F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

float **sub_21B88443C(float **result, float *a2, float **a3, float *a4, float **a5, float *a6)
{
  float *v6;
  float *v10;
  float *v11;
  uint64_t v12;
  float *v13;
  _QWORD *v14;
  float *v15;
  float **v16;
  uint64_t v17;
  float *v18;
  int v19;
  float v20;
  float *v21;
  float *v22;
  float *v23;
  float *v24;
  float *v25;
  float **v26;
  float v27;
  float v28;
  float *v29;
  float *v30;
  float *v31;
  float v32;
  float v33;
  BOOL v34;
  float *v35;
  int v36;
  float *v37;
  float *v38;
  float **v39;
  float *v40;
  float **v41;
  float *v42;
  float *v43;
  BOOL v44;
  float *v45;
  float *v46;
  float *v47;
  float *v48;
  float **v49;
  float *v50;
  float *v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float *v56;
  float *v57;
  float v58;
  float v59;
  float *v60;
  float v61;
  float *v62;
  float *v63;
  float *v64;
  float *v65;
  float **v66;
  uint64_t v67;
  float v68;
  float v69;
  float **v70;
  float *v71;

  v70 = result;
  v71 = a2;
  if (a6 != a4)
  {
    v6 = a6;
    v10 = a2;
    do
    {
      if (v6 == v10)
        break;
      v11 = *a5;
      v12 = v6 - *a5 + (((char *)a5 - (char *)result) << 7) - (v10 - *result);
      if ((unint64_t)v12 < 2)
        break;
      if (v12 == 3)
      {
        v65 = v10 + 1;
        v66 = v70;
        if ((char *)(v10 + 1) - (char *)*v70 == 4096)
        {
          v66 = v70 + 1;
          v65 = v70[1];
        }
        if (v6 == v11)
        {
          v67 = (uint64_t)*--a5;
          v6 = (float *)(v67 + 4096);
        }
        return (float **)sub_21B884950((uint64_t)v70, v10, (uint64_t)v66, v65, (uint64_t)a5, v6 - 1);
      }
      if (v12 == 2)
      {
        if (v6 == v11)
          v6 = *(a5 - 1) + 1024;
        v68 = *(v6 - 1);
        if (v68 < *v10)
        {
          v69 = *a2;
          *a2 = v68;
          *(v6 - 1) = v69;
        }
        return result;
      }
      if (v12 <= 7)
        return sub_21B8849D8(v70, a2, a5, v6);
      v14 = sub_21B881540((uint64_t)&v70, (unint64_t)v12 >> 1);
      v15 = v13;
      v16 = a5;
      v17 = (uint64_t)v6;
      if (v6 == *a5)
      {
        v16 = a5 - 1;
        v17 = (uint64_t)(*(a5 - 1) + 1024);
      }
      v18 = (float *)(v17 - 4);
      v19 = sub_21B884950((uint64_t)v70, v71, (uint64_t)v14, v13, (uint64_t)v16, (float *)(v17 - 4));
      result = v70;
      a2 = v71;
      v20 = *v71;
      if (*v71 < *v15)
      {
LABEL_17:
        v23 = a2 + 1;
        v24 = *result;
        v25 = *result;
        v26 = result;
        if ((char *)(a2 + 1) - (char *)*result == 4096)
        {
          v26 = result + 1;
          v25 = result[1];
          v23 = v25;
        }
        if (v26 < v16 || v26 == v16 && v23 < v18)
        {
          while (1)
          {
            v27 = *v15;
            while (1)
            {
              v28 = *v23;
              if (*v23 >= v27)
                break;
              if ((char *)++v23 - (char *)v25 == 4096)
              {
                v29 = v26[1];
                ++v26;
                v25 = v29;
                v23 = v29;
              }
            }
            v30 = *v16;
            do
            {
              if (v18 == v30)
              {
                v31 = *--v16;
                v30 = v31;
                v18 = v31 + 1024;
              }
              v32 = *--v18;
              v33 = v32;
            }
            while (v32 >= v27);
            if (v26 >= v16 && (v26 != v16 || v23 >= v18))
              break;
            v34 = v15 == v23;
            *v23++ = v33;
            *v18 = v28;
            ++v19;
            if (v34)
              v15 = v18;
            if ((char *)v23 - (char *)v25 == 4096)
            {
              v35 = v26[1];
              ++v26;
              v25 = v35;
              v23 = v35;
            }
          }
        }
        if (v23 != v15)
        {
          v36 = *(_DWORD *)v23;
          if (*v15 < *v23)
          {
            *v23 = *v15;
            *(_DWORD *)v15 = v36;
            ++v19;
          }
        }
        if (v23 == a4)
          return result;
        if (!v19)
        {
          if (v26 > a3 || (v37 = v25, v38 = v23, v39 = v26, v23 > a4) && (v37 = v25, v38 = v23, v39 = v26, v26 == a3))
          {
            v40 = a2;
            v41 = result;
            while (1)
            {
              v42 = v40 + 1;
              if ((char *)(v40 + 1) - (char *)v24 == 4096)
              {
                v43 = v41[1];
                ++v41;
                v24 = v43;
                v42 = v43;
              }
              if (v42 == v23)
                break;
              v44 = *v42 < *v40;
              v40 = v42;
              if (v44)
                goto LABEL_42;
            }
          }
          else
          {
            while (1)
            {
              v45 = v38 + 1;
              if ((char *)(v38 + 1) - (char *)v37 == 4096)
              {
                v46 = v39[1];
                ++v39;
                v37 = v46;
                v45 = v46;
              }
              if (v45 == v6)
                break;
              v44 = *v45 < *v38;
              v38 = v45;
              if (v44)
                goto LABEL_42;
            }
          }
          return result;
        }
LABEL_42:
        if (v26 <= a3)
        {
          if (v23 > a4 && v26 == a3)
          {
            v10 = a2;
            v6 = v23;
            a5 = a3;
          }
          else
          {
            a2 = v23 + 1;
            if ((char *)(v23 + 1) - (char *)v25 == 4096)
            {
              v63 = v26[1];
              ++v26;
              a2 = v63;
            }
            v70 = v26;
            v71 = a2;
            result = v26;
            v10 = a2;
          }
        }
        else
        {
          v10 = a2;
          v6 = v23;
          a5 = v26;
        }
      }
      else
      {
        v21 = *v16;
        while (1)
        {
          if (v18 == v21)
          {
            v22 = *--v16;
            v21 = v22;
            v18 = v22 + 1024;
          }
          if (v71 == --v18)
            break;
          if (*v18 < *v15)
          {
            *v71 = *v18;
            *v18 = v20;
            ++v19;
            goto LABEL_17;
          }
        }
        v10 = v71 + 1;
        v47 = *v70;
        if ((char *)(v71 + 1) - (char *)*v70 == 4096)
        {
          result = v70 + 1;
          v47 = v70[1];
          v10 = v47;
        }
        v48 = *a5;
        v49 = a5;
        v50 = v6;
        if (v6 == *a5)
        {
          v49 = a5 - 1;
          v48 = *(a5 - 1);
          v50 = v48 + 1024;
        }
        v52 = *(v50 - 1);
        v51 = v50 - 1;
        v53 = v52;
        if (v20 >= v52)
        {
          while (v10 != v51)
          {
            v61 = *v10;
            if (v20 < *v10)
            {
              *v10++ = v53;
              *v51 = v61;
              if ((char *)v10 - (char *)v47 == 4096)
              {
                v64 = result[1];
                ++result;
                v47 = v64;
                v10 = v64;
              }
              goto LABEL_68;
            }
            if ((char *)++v10 - (char *)v47 == 4096)
            {
              v62 = result[1];
              ++result;
              v47 = v62;
              v10 = v62;
            }
          }
          return result;
        }
LABEL_68:
        if (v10 == v51)
          return result;
        while (1)
        {
          v54 = *a2;
          while (1)
          {
            v55 = *v10;
            if (v54 < *v10)
              break;
            if ((char *)++v10 - (char *)v47 == 4096)
            {
              v56 = result[1];
              ++result;
              v47 = v56;
              v10 = v56;
            }
          }
          do
          {
            if (v51 == v48)
            {
              v57 = *--v49;
              v48 = v57;
              v51 = v57 + 1024;
            }
            v58 = *--v51;
            v59 = v58;
          }
          while (v54 < v58);
          if (result >= v49 && (result != v49 || v10 >= v51))
            break;
          *v10++ = v59;
          *v51 = v55;
          if ((char *)v10 - (char *)v47 == 4096)
          {
            v60 = result[1];
            ++result;
            v47 = v60;
            v10 = v60;
          }
        }
        if (result > a3 || v10 > a4 && result == a3)
          return result;
        v70 = result;
        v71 = v10;
        a2 = v10;
      }
    }
    while (v6 != a4);
  }
  return result;
}

uint64_t sub_21B884950(uint64_t a1, float *a2, uint64_t a3, float *a4, uint64_t a5, float *a6)
{
  float v6;
  float v7;
  float v8;
  float v9;

  v6 = *a4;
  v7 = *a2;
  v8 = *a6;
  if (*a4 < *a2)
  {
    if (v8 < v6)
    {
      *a2 = v8;
      *a6 = v7;
      return 1;
    }
    *a2 = v6;
    *a4 = v7;
    if (*a6 >= v7)
      return 1;
    *a4 = *a6;
    *a6 = v7;
    return 2;
  }
  if (v8 < v6)
  {
    *a4 = v8;
    *a6 = v6;
    v9 = *a2;
    if (*a4 >= *a2)
      return 1;
    *a2 = *a4;
    *a4 = v9;
    return 2;
  }
  return 0;
}

float **sub_21B8849D8(float **result, float *a2, float **a3, float *a4)
{
  uint64_t v4;
  float *v5;
  float *v6;
  float *v7;
  float *v8;
  float **v9;
  float *v10;
  float v11;
  float *v12;

  v4 = (uint64_t)a4;
  if (*a3 == a4)
    v4 = (uint64_t)(*(a3 - 1) + 1024);
  v5 = (float *)(v4 - 4);
  while (a2 != v5)
  {
    if (a2 == a4)
    {
      v7 = a4;
    }
    else
    {
      v6 = *result;
      v7 = a2;
      v8 = a2;
      v9 = result;
      while (1)
      {
        if ((char *)++v8 - (char *)v6 == 4096)
        {
          v10 = v9[1];
          ++v9;
          v6 = v10;
          v8 = v10;
        }
        if (v8 == a4)
          break;
        if (*v8 < *v7)
          v7 = v8;
      }
    }
    if (v7 != a2)
    {
      v11 = *a2;
      *a2 = *v7;
      *v7 = v11;
    }
    if ((char *)++a2 - (char *)*result == 4096)
    {
      v12 = result[1];
      ++result;
      a2 = v12;
    }
  }
  return result;
}

BOOL sub_21B884A88(_QWORD *a1, _QWORD *a2, float *a3, float *a4, float a5)
{
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  NSObject *v17;
  _BOOL8 result;
  int v19;
  double v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a1[1];
  if (v7)
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v11 = *(_QWORD *)(a1[8] + 8 * v8);
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11 + 2;
        v13 = *(float *)(*a2 + 4 * v8);
        do
        {
          v14 = *(float *)(a1[2] + 4 * v11);
          v10 = v10 + (float)((float)(v13 * v14) * v14);
          v9 = v9 + (float)((float)(v13 * v14) * *(float *)(a1[5] + 4 * v11++));
        }
        while (v11 < v12);
      }
      ++v8;
    }
    while (v8 != v7);
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
  }
  v15 = v10 + a5;
  if ((float)(v10 + a5) < 0.000000001)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AB18);
    v17 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v19 = 134218240;
      v20 = v15;
      v21 = 2048;
      v22 = 0x3E112E0BE0000000;
      _os_log_impl(&dword_21B72A000, v17, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAMEstimator1DConstant]:[normal_solve] Information matrix: %f below min valid value: %f. Will not proceed with this solve step.", (uint8_t *)&v19, 0x16u);
    }
    *a4 = 0.0;
    v16 = 0.0;
  }
  else
  {
    *a4 = v15;
    v16 = v9 / v15;
  }
  result = v15 >= 0.000000001;
  *a3 = v16;
  return result;
}

uint64_t sub_21B884C20(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5)
{
  float v9;
  __float2 v10;
  float32x4_t v11;
  __float2 v12;
  float32x4_t v13;
  float v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  float v18;
  float v19;
  unsigned __int8 v20;
  float v21;
  float v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  float v27;
  unint64_t v28;
  char v29;
  char v30;
  char v31;
  float v32;
  float *v33;
  int v34;
  int v35;
  int v36;
  NSObject *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _BYTE v45[8];
  uint8_t buf[4];
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v9 = a2[1];
  v10 = __sincosf_stret(*a2);
  v12 = __sincosf_stret(v9);
  v11.f32[0] = v12.__sinval;
  sub_21B892ECC(a4, (float32x4_t *)buf, v11);
  v13.f32[0] = sub_21B893128((float *)buf, v10.__sinval * v12.__cosval, v10.__sinval * v12.__sinval, v10.__cosval);
  v15 = 0;
  *(_DWORD *)buf = v13.i32[0];
  *(_QWORD *)&v47 = LODWORD(v14);
  v16 = 0.0;
  do
  {
    v16 = v16 + (float)(*(float *)&buf[v15] * *(float *)&buf[v15]);
    v15 += 4;
  }
  while (v15 != 12);
  if (sqrtf(v16) > 0.00000011921)
  {
    v17 = 0;
    v18 = 0.0;
    do
    {
      v18 = v18 + (float)(*(float *)&buf[v17] * *(float *)&buf[v17]);
      v17 += 4;
    }
    while (v17 != 12);
    v19 = sqrtf(v18);
    v13.f32[0] = v13.f32[0] / v19;
    v14 = v14 / v19;
  }
  *(_DWORD *)a1 = v13.i32[0];
  *(float *)(a1 + 4) = v14;
  v20 = atomic_load((unsigned __int8 *)&qword_25518F5B0);
  if ((v20 & 1) == 0 && __cxa_guard_acquire(&qword_25518F5B0))
  {
    qword_25518F5A0 = 0x3F80000000000000;
    dword_25518F5A8 = 0;
    __cxa_guard_release(&qword_25518F5B0);
  }
  sub_21B892ECC(a5, (float32x4_t *)buf, v13);
  v21 = sub_21B893128((float *)buf, *(float *)&qword_25518F5A0, *((float *)&qword_25518F5A0 + 1), *(float *)&dword_25518F5A8);
  v23 = 0;
  *(float *)buf = v21;
  *(_QWORD *)&v47 = LODWORD(v22);
  v24 = 0.0;
  do
  {
    v24 = v24 + (float)(*(float *)&buf[v23] * *(float *)&buf[v23]);
    v23 += 4;
  }
  while (v23 != 12);
  if (sqrtf(v24) > 0.00000011921)
  {
    v25 = 0;
    v26 = 0.0;
    do
    {
      v26 = v26 + (float)(*(float *)&buf[v25] * *(float *)&buf[v25]);
      v25 += 4;
    }
    while (v25 != 12);
    v27 = sqrtf(v26);
    v21 = v21 / v27;
    v22 = v22 / v27;
  }
  v28 = 0;
  *(float *)(a1 + 8) = v21;
  *(float *)(a1 + 12) = v22;
  v29 = 1;
  v30 = 1;
  do
  {
    v31 = v29;
    if (sub_21B878C7C((uint64_t)a3, v28) >= 0.000000001)
    {
      v32 = sqrtf(1.0 / sub_21B878C7C((uint64_t)a3, v28));
    }
    else
    {
      if ((v30 & 1) != 0)
        v30 = 0;
      v32 = 0.000000001;
    }
    v33 = (float *)sub_21B878D6C((uint64_t)v45, v28);
    v29 = 0;
    *v33 = v32;
    v28 = 1;
  }
  while ((v31 & 1) != 0);
  *(float *)(a1 + 16) = sub_21B87A834((uint64_t)v45);
  *(_DWORD *)(a1 + 20) = v34;
  *(_DWORD *)(a1 + 24) = v35;
  *(_DWORD *)(a1 + 28) = v36;
  if ((v30 & 1) == 0)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AB58);
    v37 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v38 = *(float *)a1;
      v39 = *(float *)(a1 + 4);
      v40 = *(float *)(a1 + 8);
      v41 = *(float *)(a1 + 12);
      v42 = *a3;
      v43 = a3[1];
      *(_DWORD *)buf = 134219264;
      v47 = v38;
      v48 = 2048;
      v49 = v39;
      v50 = 2048;
      v51 = v40;
      v52 = 2048;
      v53 = v41;
      v54 = 2048;
      v55 = v42;
      v56 = 2048;
      v57 = v43;
      _os_log_impl(&dword_21B72A000, v37, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMAPencilDMYawAlignmentMeasurement]:[CMAPencilDMYawAlignmentMeasurement] Failed measurement covariance Cholesky decomposition. f_eY_IS_xy: %.6f %.6f, f_eY_IP_xy: %.6f %.6f, ringMeasCovRad2: %.6f %.6f", buf, 0x3Eu);
    }
  }
  return a1;
}

float sub_21B884F78(float *a1)
{
  float v1;
  float sinval;

  v1 = a1[1];
  sinval = __sincosf_stret(*a1).__sinval;
  return sinval * __sincosf_stret(v1).__cosval;
}

float sub_21B884FC4(float *a1, float a2)
{
  __float2 v3;
  _DWORD v5[2];
  __float2 v6;

  v3 = __sincosf_stret(a2);
  v5[0] = LODWORD(v3.__cosval);
  *(float *)&v5[1] = -v3.__sinval;
  v6 = v3;
  return a1[2] - sub_21B87D48C((uint64_t)v5, a1);
}

void sub_21B885010(float *a1)
{
  float v1;

  v1 = (float)((float)(a1[1] * a1[3]) + 0.0) + (float)(*a1 * a1[2]);
  if (v1 > 1.0)
    v1 = 1.0;
  if (v1 < -1.0)
    v1 = -1.0;
  acosf(v1);
}

float sub_21B88506C@<S0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  float v3;
  __float2 v4;
  __float2 v5;
  float result;

  v3 = a1[1];
  v4 = __sincosf_stret(*a1);
  v5 = __sincosf_stret(v3);
  result = -(float)(v5.__sinval * v4.__sinval);
  *(float *)a2 = v4.__cosval * v5.__cosval;
  *(float *)(a2 + 4) = v4.__cosval * v5.__sinval;
  *(float *)(a2 + 8) = -v4.__sinval;
  *(float *)(a2 + 12) = result;
  *(float *)(a2 + 16) = v4.__sinval * v5.__cosval;
  *(_DWORD *)(a2 + 20) = 0;
  return result;
}

os_log_t sub_21B8850D4()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

uint64_t sub_21B885100(uint64_t a1)
{
  uint64_t v2;

  *(_DWORD *)a1 = 0x1000000;
  *(_BYTE *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 8) = 0xBF80000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0x3F80000000000000;
  sub_21B88FD28(a1 + 176);
  *(_DWORD *)a1 = 0x1000000;
  *(_BYTE *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 8) = 0xBF80000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0x3F80000000000000;
  sub_21B88FD74(v2);
  return a1;
}

void sub_21B88519C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = &off_24DF3AB88;
  _Unwind_Resume(a1);
}

double sub_21B8851AC(uint64_t a1)
{
  *(_DWORD *)a1 = 0x1000000;
  *(_BYTE *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 8) = 0xBF80000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 152) = 0x3F80000000000000;
  return sub_21B88FD74(a1 + 176);
}

_QWORD *sub_21B8851EC(_QWORD *result)
{
  *result = &off_24DF3AB88;
  return result;
}

void sub_21B885200(uint64_t a1, uint64_t a2, float a3, double a4)
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unsigned int v12;
  float v13;
  float v14;
  int8x16_t v15;
  double v16;
  float32x4_t *v17;
  int v18;
  int v19;
  char v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  int v33;
  float32x4_t v34;
  uint64_t v35;
  int v36;
  unint64_t v37;
  float v38;

  v7 = (unint64_t)(a4 * 1000000.0);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 32) = v8;
  v9 = *(_OWORD *)(a2 + 32);
  v10 = *(_OWORD *)(a2 + 64);
  v11 = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 80) = v10;
  *(_OWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 96) = v11;
  *(_QWORD *)(a1 + 104) = v7;
  v12 = *(_DWORD *)(a2 + 44);
  v13 = *(float *)(a2 + 48);
  v14 = *(float *)(a2 + 52);
  v37 = __PAIR64__(LODWORD(v13), v12);
  v38 = v14;
  LODWORD(v9) = *(_DWORD *)(a2 + 64);
  v35 = *(_QWORD *)(a2 + 56);
  v36 = v9;
  v15 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)a2), *(float64x2_t *)(a2 + 16));
  v34 = (float32x4_t)vextq_s8(v15, v15, 4uLL);
  *(_QWORD *)&v16 = sub_21B89329C(&v34, v34).u64[0];
  v17 = (float32x4_t *)(a1 + 144);
  if ((float32x4_t *)(a1 + 144) != &v34)
  {
    HIDWORD(v16) = v34.i32[1];
    *v17 = v34;
  }
  v18 = *(_DWORD *)(a1 + 84);
  *(_BYTE *)a1 = v18 > 0;
  if (v18 >= 1)
  {
    v19 = *(unsigned __int8 *)(a2 + 72);
    *(_BYTE *)(a1 + 1) = v19;
    if (*(_BYTE *)(a1 + 2))
    {
      v20 = (float)(unint64_t)(v7 - *(_QWORD *)(a1 + 136)) < 60000000.0;
      if (*(_BYTE *)(a1 + 3))
        *(_BYTE *)(a1 + 3) = 0;
    }
    else
    {
      v20 = *(_BYTE *)(a1 + 3);
      if (v20)
      {
        *(float32x4_t *)(a1 + 160) = *v17;
LABEL_17:
        sub_21B88FDAC(a1 + 176, (uint64_t)&v37, (__n128 *)(a1 + 160), v7);
        *(_QWORD *)(a1 + 112) = v7;
        *(_QWORD *)(a1 + 120) = v37;
        *(float *)(a1 + 128) = v38;
        v32 = *(float *)(a1 + 168);
        *(double *)(a1 + 16) = *(float *)(a1 + 172);
        *(float64x2_t *)(a1 + 24) = vcvtq_f64_f32(*(float32x2_t *)(a1 + 160));
        *(double *)(a1 + 40) = v32;
        sub_21B89343C((float *)(a1 + 160));
        *(_DWORD *)(a1 + 92) = v33;
        *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 1);
        *(_BYTE *)(a1 + 96) = *(_BYTE *)(a1 + 2);
        *(_BYTE *)(a1 + 97) = *(_BYTE *)(a1 + 4);
        *(_BYTE *)(a1 + 4) = 0;
        *(float *)(a1 + 12) = a3;
        return;
      }
    }
    if (!v19 || (v20 & 1) != 0)
    {
      LODWORD(v16) = v12;
      sub_21B885524((float32x2_t *)a1, v16, v13, v14);
      sub_21B89343C((float *)(a1 + 160));
      v22 = v21;
      sub_21B89343C((float *)(a1 + 144));
      sub_21B8855D4((float32x4_t *)a1, v22 - v23);
      *(_BYTE *)(a1 + 1) = 0;
    }
    else
    {
      sub_21B88545C((float32x4_t *)a1, (float *)&v35);
    }
    if (!*(_BYTE *)(a1 + 2))
    {
      sub_21B89343C((float *)(a1 + 160));
      v25 = v24;
      sub_21B89343C((float *)(a1 + 144));
      v27 = v25 - v26;
      sub_21B89343C((float *)(a1 + 160));
      v29 = v28;
      sub_21B89343C((float *)(a1 + 144));
      v31 = v29 - v30;
      if (v27 < 0.0)
        v31 = -v31;
      *(_BYTE *)(a1 + 3) = v31 < 0.1;
    }
    goto LABEL_17;
  }
}

void sub_21B88545C(float32x4_t *a1, float *a2)
{
  float v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  float v18;

  v4 = sub_21B893020(a1[10].f32);
  v5 = 0;
  v17 = *(_QWORD *)a2;
  v18 = a2[2];
  v8 = (float)((float)(v6 * a2[2]) + (float)(a2[1] * v7)) + (float)(*a2 * v4);
  v9 = v4 * v8;
  v10 = v7 * v8;
  v11 = v6 * v8;
  v12 = *(float *)&v17 - v9;
  v13 = *((float *)&v17 + 1) - v10;
  *(float *)&v17 = v12;
  *((float *)&v17 + 1) = *((float *)&v17 + 1) - v10;
  v14 = v18 - v11;
  v18 = v18 - v11;
  v15 = 0.0;
  do
  {
    v15 = v15 + (float)(*(float *)((char *)&v17 + v5) * *(float *)((char *)&v17 + v5));
    v5 += 4;
  }
  while (v5 != 12);
  v16 = sqrtf(v15);
  *(float *)&v17 = v12 / v16;
  *((float *)&v17 + 1) = v13 / v16;
  v18 = v14 / v16;
  sub_21B88566C(a1, (float *)&v17);
  a1->i8[2] = 0;
}

double sub_21B885524(float32x2_t *a1, double result, float a3, float a4)
{
  float v4;
  float v6;
  float v7;
  float32x4_t v8;
  float32x4_t *v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x2_t v12;
  float v13;

  v4 = (double)(unint64_t)(*(_QWORD *)&a1[13] - *(_QWORD *)&a1[14]) * 0.000001;
  if (v4 <= 0.1)
  {
    v6 = v4 * 0.5;
    v7 = v6 * (float)(a4 + a1[16].f32[0]);
    *((float *)&result + 1) = a3;
    v12 = vmul_n_f32(vadd_f32(*(float32x2_t *)&result, a1[15]), v6);
    v13 = v7;
    *(double *)v8.i64 = sub_21B8931F8(&v11, (float *)&v12);
    v9 = (float32x4_t *)&a1[20];
    result = sub_21B892E6C((uint64_t)&v11, v9->f32, &v10, v8);
    if (v9 != &v10)
    {
      result = *(double *)v10.i64;
      *v9 = v10;
    }
  }
  return result;
}

void sub_21B8855D4(float32x4_t *a1, float a2)
{
  float *f32;
  float v5;
  float v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10[3];

  f32 = a1[9].f32;
  v10[0] = (float)(a2 * 0.017453) * sub_21B893020(a1[9].f32);
  v10[1] = (float)(a2 * 0.017453) * v5;
  v10[2] = (float)(a2 * 0.017453) * v6;
  *(double *)v7.i64 = sub_21B8931F8(&v9, v10);
  sub_21B892E6C((uint64_t)&v9, f32, &v8, v7);
  if (&a1[10] != &v8)
    a1[10] = v8;
}

void sub_21B88566C(float32x4_t *a1, float *a2)
{
  float v4;
  float v5;
  float v6;
  float v7[9];

  sub_21B8931AC(a1[10].f32, v7);
  v4 = sub_21B885938((uint64_t)v7, a2);
  v6 = atan2f(v5, v4);
  sub_21B8859FC(a1, v6);
}

uint64_t sub_21B8856C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;

  result = sub_21B88FEB8(a1 + 176, a2, a3, a4, *(float *)(a1 + 8));
  if ((_DWORD)result)
  {
    result = sub_21B885710(a1, v6, (float *)(a1 + 8200));
    *(_BYTE *)(a1 + 2) |= result;
  }
  *(_BYTE *)(a1 + 4) = result;
  return result;
}

uint64_t sub_21B885710(uint64_t a1, uint64_t a2, float *a3)
{
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v15;
  float v16;
  float v17;
  _BYTE v18[22];
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (qword_25518E200 != -1)
    dispatch_once(&qword_25518E200, &unk_24DF3ABA8);
  v5 = qword_25518E208;
  if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_DEBUG))
  {
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[2];
    v9 = a3[3];
    *(_DWORD *)v18 = 134218752;
    *(double *)&v18[4] = v6;
    *(_WORD *)&v18[12] = 2048;
    *(double *)&v18[14] = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_DEBUG, "visual localization,measurement,%f,%f,%f,%f", v18, 0x2Au);
  }
  *(_OWORD *)v18 = *(_OWORD *)(a1 + 160);
  sub_21B89343C(a3);
  v11 = v10;
  sub_21B89343C((float *)v18);
  v13 = v11 - v12;
  if (v13 < 0.0)
    v13 = -v13;
  if (v13 > 30.0 && *(_DWORD *)(a1 + 84) == 5)
    return 0;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a1 + 104);
  sub_21B89343C(a3);
  v16 = v15;
  sub_21B89343C((float *)v18);
  sub_21B885894((float32x4_t *)a1, v16 - v17);
  return 1;
}

void sub_21B885894(float32x4_t *a1, float a2)
{
  float v3;
  float v5;
  float v6;
  float32x4_t v7;
  float32x4_t *v8;
  float32x4_t v9;
  float32x4_t v10;
  float v11[3];

  v3 = -a2;
  if (a2 >= 0.0)
    v3 = a2;
  if (v3 >= 0.00000011921)
  {
    v11[0] = (float)(a2 * 0.017453) * sub_21B893020(a1[9].f32);
    v11[1] = (float)(a2 * 0.017453) * v5;
    v11[2] = (float)(a2 * 0.017453) * v6;
    *(double *)v7.i64 = sub_21B8931F8(&v10, v11);
    v8 = a1 + 10;
    sub_21B892E6C((uint64_t)&v10, v8->f32, &v9, v7);
    if (v8 != &v9)
      *v8 = v9;
  }
}

float sub_21B885938(uint64_t a1, float *a2)
{
  unint64_t i;
  float v5;
  unint64_t j;
  float v7;
  float v8;
  float *v9;
  float v11;

  for (i = 0; i != 3; ++i)
  {
    v5 = sub_21B87B518(a1, i, 0) * *a2;
    *(float *)sub_21B87C7D8((uint64_t)&v11, i) = v5;
    for (j = 1; j != 3; ++j)
    {
      v7 = sub_21B87B518(a1, i, j);
      v8 = sub_21B87B1A8((uint64_t)a2, j);
      v9 = (float *)sub_21B87C7D8((uint64_t)&v11, i);
      *v9 = *v9 + (float)(v7 * v8);
    }
  }
  return v11;
}

void sub_21B8859FC(float32x4_t *a1, float a2)
{
  float v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float32x4_t v12;
  float32x4_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  float v16;
  float v17;
  float v18;

  v4 = sub_21B893020(a1[9].f32);
  v5 = 0;
  v6 = v4 * a2;
  v8 = v7 * a2;
  v10 = v9 * a2;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v11 = 0.0;
  do
  {
    v11 = v11 + (float)(*(float *)((char *)&v16 + v5) * *(float *)((char *)&v16 + v5));
    v5 += 4;
  }
  while (v5 != 12);
  if (sqrtf(v11) > 0.00000011921)
  {
    v16 = v6 * 0.01;
    v17 = v8 * 0.01;
    v18 = v10 * 0.01;
  }
  *(double *)v12.i64 = sub_21B8931F8(&v15, &v16);
  v13 = a1 + 10;
  sub_21B892E6C((uint64_t)&v15, v13->f32, &v14, v12);
  if (v13 != &v14)
    *v13 = v14;
}

void sub_21B885ACC(_QWORD *a1)
{
  *a1 = &off_24DF3AB88;
  JUMPOUT(0x220766390);
}

os_log_t sub_21B885AEC()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

void sub_21B885B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v5;
  float *v6;
  float v7;
  float v8;

  if (*(_BYTE *)(a1 + 12))
  {
    v5 = sub_21B885BC0(a1, a3);
    if (!v5 && *(_DWORD *)(a2 + 4) == *(unsigned __int16 *)(a2 + 2))
    {
      if (sub_21B885C64(v5, (unsigned __int16 *)a2))
      {
        v6 = (float *)sub_21B878848((unsigned __int16 *)a2, 0xFFuLL);
        v7 = sub_21B8931BC(v6, *(float *)a1, *(float *)(a1 + 4), *(float *)(a1 + 8));
        atan2f(v8, v7);
      }
    }
  }
}

BOOL sub_21B885BC0(uint64_t a1, uint64_t a2)
{
  unsigned __int16 *v2;
  float v3;
  unint64_t v4;
  unint64_t v5;
  float v6;
  float v7;
  float v8;

  v2 = (unsigned __int16 *)(a2 + 16);
  v3 = 0.0;
  v4 = 255;
  v5 = 1;
  v6 = 0.0;
  do
  {
    v7 = *(float *)sub_21B8761BC(v2, v4) * -9.8067;
    v8 = v7 - v6;
    v6 = v6 + (float)((float)(v7 - v6) / (float)v5);
    v3 = v3 + (float)(v8 * (float)(v7 - v6));
    --v4;
    ++v5;
  }
  while (v4 != 155);
  return (float)(v3 / 99.0) < 0.18;
}

uint64_t sub_21B885C64(uint64_t a1, unsigned __int16 *a2)
{
  unint64_t v3;
  float *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  _BOOL4 v13;
  uint64_t result;

  if (!a2[1])
    return 1;
  v3 = 0;
  do
  {
    v4 = (float *)sub_21B878848(a2, v3);
    v5 = sub_21B893020(v4);
    v7 = v6;
    v8 = v5 * v5;
    v10 = v9 * v9;
    v11 = atan2f(sqrtf((float)(v9 * v9) + (float)(v6 * v6)), v5);
    v12 = atan2f(sqrtf(v8 + v10), v7);
    v13 = v11 >= 1.309;
    if (v11 > 1.9199)
      v13 = 0;
    result = v12 >= 1.5708 && v13;
    if ((result & 1) == 0)
      break;
    ++v3;
  }
  while (v3 < a2[1]);
  return result;
}

double sub_21B885D40(uint64_t a1, __int128 *a2)
{
  int v2;
  __int128 v3;

  if (!*(_BYTE *)(a1 + 12)
    || *(_DWORD *)(a1 + 24) != *((_DWORD *)a2 + 2)
    || (v2 = *(_DWORD *)(a1 + 28), v2 != *((_DWORD *)a2 + 3)))
  {
    v3 = *a2;
    *(_OWORD *)(a1 + 16) = *a2;
    *(_BYTE *)(a1 + 12) = 1;
    v2 = *(_DWORD *)(a1 + 28);
  }
  if (v2 == 1)
  {
    *(_QWORD *)&v3 = 0xBF80000000000000;
    *(_QWORD *)a1 = 0xBF80000000000000;
    *(_DWORD *)(a1 + 8) = 0;
  }
  return *(double *)&v3;
}

float sub_21B885D98(float *a1, unsigned __int16 *a2)
{
  unint64_t v4;
  float v5;
  float v6;
  float *v7;
  float v8;
  float v9;
  float v10;
  __float2 v11;
  unint64_t v12;
  float v13;

  if (a2[1])
  {
    v4 = 0;
    v5 = 0.0;
    v6 = 0.0;
    do
    {
      v7 = (float *)sub_21B878848(a2, v4);
      v8 = sub_21B8931BC(v7, *a1, a1[1], a1[2]);
      v10 = atan2f(v9, v8);
      v11 = __sincosf_stret(v10);
      v5 = v5 + v11.__cosval;
      v6 = v6 + v11.__sinval;
      ++v4;
      v12 = a2[1];
    }
    while (v4 < v12);
    v13 = (float)v12;
  }
  else
  {
    v6 = 0.0;
    v5 = 0.0;
    v13 = 0.0;
  }
  return (float)((float)((float)(sqrtf(1.0 - (float)(sqrtf((float)(v6 * v6) + (float)(v5 * v5)) / v13)) * 57.296)
                       * 0.5228)
               + 14.06)
       * 0.017453;
}

double sub_21B885E80(uint64_t a1)
{
  double result;

  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_QWORD *)(a1 + 20) = 0xA00000000;
  *(_DWORD *)(a1 + 16) = 1031798784;
  *(_BYTE *)(a1 + 72) = 1;
  *(_QWORD *)(a1 + 104) = 0xA00000000;
  *(_QWORD *)(a1 + 96) = 0x3FB0000000000000;
  *(_BYTE *)(a1 + 192) = 1;
  *(_QWORD *)(a1 + 196) = 0xA00000000;
  *(_BYTE *)(a1 + 195) = 1;
  *(_DWORD *)(a1 + 220) = 0;
  *(_QWORD *)&result = 1036182680;
  *(_QWORD *)(a1 + 224) = 1036182680;
  *(_BYTE *)(a1 + 232) = 0;
  *(_DWORD *)(a1 + 236) = 0;
  return result;
}

double sub_21B885ED8@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  double v2;
  float v3;
  double result;

  v2 = *(double *)(a1 + 8);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  v3 = v2;
  *(float *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 12) = 0;
  result = -0.00781250572;
  *(_QWORD *)(a2 + 16) = 0xBF800000C47A0000;
  *(_WORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_21B885F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t result;
  unint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  float v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  float v30;

  v7 = *(unsigned __int16 *)(a1 + 20);
  v8 = *(unsigned __int16 *)(a1 + 22);
  v9 = *(unsigned int *)(a1 + 24);
  if (v7 + v8 >= v9)
    v10 = *(unsigned int *)(a1 + 24);
  else
    v10 = 0;
  v6 = *(double *)(a2 + 8);
  *(float *)(a1 + 20 + 4 * (v7 + v8 - v10) + 8) = v6;
  if (v9 <= v8)
  {
    v11 = v7 + 1;
    if (v11 < v9)
      LOWORD(v9) = 0;
    *(_WORD *)(a1 + 20) = v11 - v9;
  }
  else
  {
    *(_WORD *)(a1 + 22) = v8 + 1;
  }
  *(_BYTE *)(a1 + 4) = 1;
  sub_21B8864AC((unsigned __int16 *)(a1 + 104), (_QWORD *)a2);
  *(_BYTE *)(a1 + 72) = 1;
  v12 = *(unsigned __int16 *)(a1 + 198);
  v13 = *(unsigned int *)(a1 + 200);
  v14 = a1 + 204;
  v15 = *(unsigned __int16 *)(a1 + 196);
  if (v15 + v12 >= v13)
    v16 = *(unsigned int *)(a1 + 200);
  else
    v16 = 0;
  *(_BYTE *)(v14 + v15 + v12 - v16) = 0;
  if (v13 <= v12)
  {
    if (v15 + 1 < v13)
      LOWORD(v13) = 0;
    *(_WORD *)(a1 + 196) = v15 + 1 - v13;
  }
  else
  {
    *(_WORD *)(a1 + 198) = v12 + 1;
  }
  *(_BYTE *)(a1 + 192) = 1;
  v17 = *(double *)(a2 + 8);
  v30 = v17;
  result = sub_21B886134(a1 + 220, &v30);
  LOWORD(v19) = *(_WORD *)(a1 + 22);
  v20 = (double)v19;
  v21 = *(unsigned __int16 *)(a1 + 106);
  v22 = 0.0;
  if (*(_WORD *)(a1 + 106))
  {
    result = sub_21B886500((unsigned __int16 *)(a1 + 104), v21 - 1);
    v23 = *(double *)result;
    LODWORD(v21) = *(unsigned __int16 *)(a1 + 106);
    if (*(_WORD *)(a1 + 106))
    {
      result = sub_21B886500((unsigned __int16 *)(a1 + 104), 0);
      v22 = *(double *)result;
      LODWORD(v21) = *(unsigned __int16 *)(a1 + 106);
    }
  }
  else
  {
    v23 = 0.0;
  }
  v24 = v20 / fmax(v23 - v22, 0.100000001);
  *(float *)(a3 + 20) = v24;
  if (*(_DWORD *)(a1 + 108) == (_DWORD)v21 && v24 >= 5.0)
  {
    sub_21B886184(a1, a3);
    v25 = *(unsigned __int16 *)(a1 + 198);
    v26 = *(unsigned int *)(a1 + 200);
    v27 = *(unsigned __int16 *)(a1 + 196);
    if (v27 + v25 >= v26)
      v28 = *(unsigned int *)(a1 + 200);
    else
      v28 = 0;
    *(_BYTE *)(v14 + v27 + v25 - v28) = *(_BYTE *)(a3 + 24) ^ 1;
    if (v26 <= v25)
    {
      if (v27 + 1 < v26)
        LOWORD(v26) = 0;
      *(_WORD *)(a1 + 196) = v27 + 1 - v26;
    }
    else
    {
      *(_WORD *)(a1 + 198) = v25 + 1;
    }
    result = 1;
    *(_BYTE *)(a1 + 192) = 1;
    if (!*(_BYTE *)a1)
      result = sub_21B8862C4((unsigned __int16 *)a1);
    *(_BYTE *)a1 = result;
    if (*(_BYTE *)(a3 + 24))
      v29 = 0;
    else
      v29 = result;
    *(_BYTE *)(a3 + 25) = v29;
  }
  return result;
}

uint64_t sub_21B886134(uint64_t result, float *a2)
{
  int v2;
  int v3;
  float v4;

  v2 = *(_DWORD *)result;
  v3 = *(_DWORD *)result + 1;
  *(_DWORD *)result = v3;
  if (v2 > 2)
    v4 = *(float *)(result + 8) - (float)(*(float *)(result + 4) * (float)(*(float *)(result + 8) - *a2));
  else
    v4 = (float)(1.0 / (float)v3) * (float)(*a2 + (float)(*(float *)(result + 8) * (float)v2));
  *(float *)(result + 8) = v4;
  return result;
}

double *sub_21B886184(uint64_t a1, uint64_t a2)
{
  char v3;
  unint64_t v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  unint64_t i;
  float v8;
  float v9;
  double v10;
  double *result;
  float v12;
  float v13;
  BOOL v14;
  float v15;
  _BYTE v16[10];
  uint64_t v17;

  v3 = 0;
  v4 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (unsigned __int16 *)(a1 + 20);
  v6 = (unsigned __int16 *)(a1 + 104);
  for (i = 1; i != 10; ++i)
  {
    v16[i] = 1;
    v8 = *(float *)sub_21B8761BC(v5, i);
    v9 = v8 - *(float *)sub_21B8761BC(v5, v4);
    v10 = *(double *)sub_21B886500(v6, i);
    result = (double *)sub_21B886500(v6, v4);
    v12 = v10 - *result;
    v13 = v9 / v12;
    v14 = v12 <= 0.0;
    v15 = 40.0;
    if (!v14)
      v15 = v13;
    if (v15 < 4.0 && v9 < 0.4)
    {
      v16[i] = 0;
      v4 = i;
      ++v3;
    }
  }
  *(_BYTE *)(a2 + 12) = v3;
  *(_BYTE *)(a2 + 24) = v16[9];
  return result;
}

BOOL sub_21B8862C4(unsigned __int16 *a1)
{
  unsigned __int8 v2;
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  BOOL v5;
  unint64_t v6;
  unint64_t i;
  double v8;

  v2 = 0;
  v3 = a1 + 98;
  v4 = a1 + 52;
  v5 = 1;
  v6 = 9;
  for (i = 1; i != 11; ++i)
  {
    v2 += *(_BYTE *)sub_21B886640(v3, v6);
    if (v2 >= 5u)
    {
      v8 = a1[53] ? *(double *)sub_21B886500(v4, a1[53] - 1) : 0.0;
      if (v8 - *(double *)sub_21B886500(v4, v6) < 1.0)
        break;
    }
    v5 = i < 0xA;
    --v6;
  }
  return v5;
}

uint64_t sub_21B886398(uint64_t a1, unsigned int a2, float a3)
{
  unsigned int v3;
  _BOOL4 v4;
  int v6;

  if (a3 <= 0.01)
    return 0;
  if (a3 >= 25.0)
  {
    *(_DWORD *)(a1 + 236) = 0;
    goto LABEL_7;
  }
  v3 = *(_DWORD *)(a1 + 236) + 1;
  *(_DWORD *)(a1 + 236) = v3;
  if (v3 <= 2)
  {
LABEL_7:
    v4 = *(_BYTE *)(a1 + 232) != 0;
    goto LABEL_8;
  }
  v4 = 1;
LABEL_8:
  *(_BYTE *)(a1 + 232) = v4;
  v6 = a3 < 25.0 || !v4;
  return v6 | a2;
}

float sub_21B886400(uint64_t a1, double a2)
{
  float v2;
  float v3;
  double v4;

  v2 = a2 - *(float *)(a1 + 228);
  v3 = -v2;
  if (v2 > 0.0)
    v3 = a2 - *(float *)(a1 + 228);
  v4 = 0.0;
  if (v3 > 0.2)
    v4 = (float)((float)((float)(v3 + -0.2) * v2) / v3);
  return v4 / a2;
}

uint64_t sub_21B886454(double a1, float a2, uint64_t a3, int a4)
{
  _BOOL4 v4;
  unsigned int v5;

  v4 = a1 > 2.0;
  if (a2 <= 0.0)
    a2 = -a2;
  if (a2 > 2.0)
    v4 = 1;
  v5 = v4 & (a4 ^ 1);
  if (a1 > 15.0)
    return 1;
  else
    return v5;
}

uint64_t sub_21B886490(uint64_t result)
{
  *(_DWORD *)(result + 20) = 0;
  *(_DWORD *)(result + 104) = 0;
  *(_DWORD *)(result + 196) = 0;
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 232) = 0;
  *(_DWORD *)(result + 236) = 0;
  return result;
}

unsigned __int16 *sub_21B8864AC(unsigned __int16 *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result[1];
  v3 = *((unsigned int *)result + 1);
  v4 = *result;
  if (v4 + v2 >= v3)
    v5 = *((unsigned int *)result + 1);
  else
    v5 = 0;
  *(_QWORD *)&result[4 * (v4 + v2 - v5) + 4] = *a2;
  if (v3 <= v2)
  {
    if (v4 + 1 < v3)
      LOWORD(v3) = 0;
    *result = v4 + 1 - v3;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

uint64_t sub_21B886500(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3ABE8);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[4 * (v5 - v4) + 4];
}

os_log_t sub_21B886614()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

uint64_t sub_21B886640(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3ABE8);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)a1 + v5 - v4 + 8;
}

double sub_21B886754(unsigned __int16 *a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void **v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double result;
  _DWORD v36[2];
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 3084;
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
  v3 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[1517];
    if (a1[1517])
    {
      v5 = v4 + a1[1516] - 1;
      v6 = *((unsigned int *)a1 + 759);
      if (v5 < v6)
        v6 = 0;
      v7 = *(_QWORD *)&a1[4 * (v5 - v6) + 1520];
    }
    else
    {
      v7 = 0;
    }
    v8 = a1[2173];
    if (a1[2173])
    {
      v9 = v8 + a1[2172] - 1;
      v10 = *((unsigned int *)a1 + 1087);
      if (v9 < v10)
        v10 = 0;
      v11 = *(_QWORD *)&a1[4 * (v9 - v10) + 2176];
    }
    else
    {
      v11 = 0;
    }
    v12 = v2[752];
    v13 = v2[8];
    v14 = a1[1];
    if (a1[1])
    {
      v15 = v14 + *a1 - 1;
      v16 = *((unsigned int *)a1 + 1);
      if (v15 < v16)
        v16 = 0;
      v17 = *(_QWORD *)&a1[4 * (v15 - v16) + 4];
    }
    else
    {
      v17 = 0;
    }
    v18 = *((_QWORD *)a1 + 861);
    v36[0] = 67111168;
    v36[1] = v12;
    v37 = 1024;
    v38 = v13;
    v39 = 2048;
    v40 = v7;
    v41 = 2048;
    v42 = v4;
    v43 = 2048;
    v44 = v11;
    v45 = 2048;
    v46 = v8;
    v47 = 2048;
    v48 = v17;
    v49 = 2048;
    v50 = v14;
    v51 = 2048;
    v52 = v18;
    _os_log_impl(&dword_21B72A000, v3, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[reset] Reset CMABarrelRoll. Stats before reset: fBoolInitDuringNoTrust: %d, initializedDMYawAlignment:%d, last src timestamp %llu us, num src samples: %zu, last aux timestamp %llu us, num aux samples: %zu, last ring timestamp %llu us, num ring samples: %zu, fCurrentEstimateTimeMicroSeconds: %llu", (uint8_t *)v36, 0x54u);
  }
  sub_21B886AFC((uint64_t)a1);
  *((_QWORD *)a1 + 859) = 0;
  *((_QWORD *)a1 + 860) = 0x3F80000000000000;
  v2[752] = 0;
  *((_DWORD *)a1 + 758) = 0;
  *((_DWORD *)a1 + 860) = 0;
  v19 = (void **)*((_QWORD *)a1 + 532);
  v20 = *((_QWORD *)a1 + 533);
  *((_QWORD *)a1 + 536) = 0;
  v21 = v20 - (_QWORD)v19;
  if (v21 >= 0x11)
  {
    do
    {
      operator delete(*v19);
      v19 = (void **)(*((_QWORD *)a1 + 532) + 8);
      *((_QWORD *)a1 + 532) = v19;
      v21 = *((_QWORD *)a1 + 533) - (_QWORD)v19;
    }
    while (v21 > 0x10);
  }
  if (v21 >> 3 == 1)
  {
    v22 = 512;
  }
  else
  {
    if (v21 >> 3 != 2)
      goto LABEL_27;
    v22 = 1024;
  }
  *((_QWORD *)a1 + 535) = v22;
LABEL_27:
  v23 = (void **)*((_QWORD *)a1 + 538);
  v24 = *((_QWORD *)a1 + 539);
  *((_QWORD *)a1 + 542) = 0;
  v25 = v24 - (_QWORD)v23;
  if (v25 >= 0x11)
  {
    do
    {
      operator delete(*v23);
      v23 = (void **)(*((_QWORD *)a1 + 538) + 8);
      *((_QWORD *)a1 + 538) = v23;
      v25 = *((_QWORD *)a1 + 539) - (_QWORD)v23;
    }
    while (v25 > 0x10);
  }
  if (v25 >> 3 == 1)
  {
    v26 = 512;
  }
  else
  {
    if (v25 >> 3 != 2)
      goto LABEL_34;
    v26 = 1024;
  }
  *((_QWORD *)a1 + 541) = v26;
LABEL_34:
  *((_DWORD *)a1 + 1086) = 0;
  *((_DWORD *)a1 + 1188) = 0;
  v27 = (void **)*((_QWORD *)a1 + 696);
  v28 = *((_QWORD *)a1 + 697);
  *((_QWORD *)a1 + 700) = 0;
  v29 = v28 - (_QWORD)v27;
  if (v29 >= 0x11)
  {
    do
    {
      operator delete(*v27);
      v27 = (void **)(*((_QWORD *)a1 + 696) + 8);
      *((_QWORD *)a1 + 696) = v27;
      v29 = *((_QWORD *)a1 + 697) - (_QWORD)v27;
    }
    while (v29 > 0x10);
  }
  if (v29 >> 3 == 1)
  {
    v30 = 512;
  }
  else
  {
    if (v29 >> 3 != 2)
      goto LABEL_41;
    v30 = 1024;
  }
  *((_QWORD *)a1 + 699) = v30;
LABEL_41:
  v31 = (void **)*((_QWORD *)a1 + 702);
  v32 = *((_QWORD *)a1 + 703);
  *((_QWORD *)a1 + 706) = 0;
  v33 = v32 - (_QWORD)v31;
  if (v33 >= 0x11)
  {
    do
    {
      operator delete(*v31);
      v31 = (void **)(*((_QWORD *)a1 + 702) + 8);
      *((_QWORD *)a1 + 702) = v31;
      v33 = *((_QWORD *)a1 + 703) - (_QWORD)v31;
    }
    while (v33 > 0x10);
  }
  if (v33 >> 3 == 1)
  {
    v34 = 512;
    goto LABEL_47;
  }
  if (v33 >> 3 == 2)
  {
    v34 = 1024;
LABEL_47:
    *((_QWORD *)a1 + 705) = v34;
  }
  *((_DWORD *)a1 + 1414) = 0;
  result = 0.0;
  *((_OWORD *)a1 + 384) = 0u;
  *((_QWORD *)a1 + 770) = 0x3F80000000000000;
  *v2 = 1;
  v2[753] = 0;
  *(_QWORD *)(a1 + 3462) = 0;
  *(_QWORD *)(a1 + 3466) = 0x3F80000000000000;
  return result;
}

double sub_21B886AFC(uint64_t a1)
{
  uint64_t v2;
  double result;

  v2 = a1 + 6952;
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 968) = 0;
  *(_DWORD *)(a1 + 1936) = 0;
  *(_DWORD *)(a1 + 2904) = 0;
  sub_21B88F2E8((unsigned __int8 *)(a1 + 6176));
  *(_QWORD *)(a1 + 6792) = 0;
  sub_21B879774(a1 + 6704);
  *(_QWORD *)(a1 + 6776) = 0;
  *(_QWORD *)(a1 + 6784) = 0x3F80000000000000;
  sub_21B879774(a1 + 6800);
  *(_QWORD *)(a1 + 6944) = 0;
  *(_BYTE *)v2 = 0;
  *(_QWORD *)(a1 + 6960) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 6888) = 0u;
  *(_QWORD *)(a1 + 6904) = 0x3F80000000000000;
  *(_QWORD *)(a1 + 6912) = 0;
  *(_DWORD *)(a1 + 6976) = 0;
  *(_DWORD *)(a1 + 7944) = 0;
  *(_DWORD *)(a1 + 9872) = 0;
  *(_WORD *)(v2 + 2924) = 0;
  *(_DWORD *)(a1 + 6968) = 0;
  return result;
}

void sub_21B886BA0(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  sub_21B886C34((_QWORD *)(a1 + 6672), a2);
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
  v2 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21B72A000, v2, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[registerCorrectedUpdateCallbackFn] Registered corrected update callback.", v3, 2u);
  }
}

_QWORD *sub_21B886C34(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sub_21B88BCD0((uint64_t)v6, a2);
  sub_21B88BD34(v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

BOOL sub_21B886CCC(unsigned __int16 *a1, unint64_t a2, int a3, int a4, float a5, float a6)
{
  unsigned __int16 *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  NSObject *v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL8 result;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  int v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  float v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[6];
  uint8_t buf[4];
  _BYTE v49[24];
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  unsigned int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (!a1[1])
    goto LABEL_5;
  v12 = a1 + 4;
  v13 = a1[1] + (unint64_t)*a1 - 1;
  v14 = *((unsigned int *)a1 + 1);
  if (v13 < v14)
    v14 = 0;
  if (*(_QWORD *)&v12[4 * (v13 - v14)] >= a2)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
    v23 = qword_25518E1D8;
    result = os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR);
    if (result)
    {
      v25 = *a1 + (unint64_t)a1[1] - 1;
      v26 = *((unsigned int *)a1 + 1);
      if (v25 < v26)
        v26 = 0;
      v27 = *(_QWORD *)&v12[4 * (v25 - v26)];
      *(float *)buf = 3.8521e-34;
      *(_QWORD *)v49 = a2;
      *(_WORD *)&v49[8] = 2048;
      *(_QWORD *)&v49[10] = v27;
      _os_log_impl(&dword_21B72A000, v23, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Ring sensor timestamp must be greater than the last value. Input: %llu us, last: %llu us", buf, 0x16u);
      return 0;
    }
  }
  else
  {
LABEL_5:
    v15 = a1 + 3088;
    if (!*((_BYTE *)a1 + 6176) && !*((_QWORD *)a1 + 868))
    {
      *((_QWORD *)a1 + 868) = a2;
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
      v16 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *((_QWORD *)a1 + 868);
        *(float *)buf = 3.852e-34;
        *(_QWORD *)v49 = v17;
        _os_log_impl(&dword_21B72A000, v16, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Received initial ring sensor timestamp : %llu", buf, 0xCu);
      }
    }
    sub_21B880DA8((uint64_t)v47, (_QWORD *)a1 + 695);
    v18 = sub_21B87EFB0(v47);
    sub_21B880D14(v47);
    sub_21B880DA8((uint64_t)v46, (_QWORD *)a1 + 701);
    v19 = sub_21B87EFB0(v46);
    sub_21B880D14(v46);
    sub_21B880DA8((uint64_t)v45, (_QWORD *)a1 + 531);
    v20 = sub_21B87EFB0(v45);
    sub_21B880D14(v45);
    sub_21B880DA8((uint64_t)v44, (_QWORD *)a1 + 537);
    v21 = sub_21B87EFB0(v44);
    sub_21B880D14(v44);
    if (*v15 || a3)
    {
      *((_BYTE *)a1 + 6952) = 0;
    }
    else
    {
      v22 = 0;
      if (v18 < 6.2832 && v19 < 0.5 && v20 < 0.5236 && v21 < 0.25)
        v22 = *((_QWORD *)a1 + 700) >= 2uLL && *((_QWORD *)a1 + 536) > 1uLL;
      v28 = a2 - *((_DWORD *)a1 + 1736);
      v29 = !v22;
      if (v28 < 0x7A121)
        v30 = v29;
      else
        v30 = 0;
      if (*((unsigned __int8 *)a1 + 6952) != v30)
      {
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
        v31 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *((unsigned __int8 *)a1 + 6952);
          *(float *)buf = 1.5285e-36;
          *(_DWORD *)v49 = v32;
          *(_WORD *)&v49[4] = 2050;
          *(_QWORD *)&v49[6] = a2;
          *(_WORD *)&v49[14] = 2050;
          *(double *)&v49[16] = (float)(v18 * 57.296);
          v50 = 2050;
          v51 = v19;
          v52 = 2050;
          v53 = (float)(v20 * 57.296);
          v54 = 2050;
          v55 = v21;
          v56 = 1026;
          v57 = v28;
          _os_log_impl(&dword_21B72A000, v31, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Setting fBlockInitializationDueToHighDynamicMotion to %{public}d, timestamp: %{public}llu us, avgOmegaAuxNorm: %{public}.3f dps, avgUserAccelAuxNorm: %{public}.3f g, avgOmegaSrcNorm: %{public}.3f dps, avgUserAccelSrcNorm: %{public}.3f g, timeElapsedMicroSeconds: %{public}u", buf, 0x40u);
        }
        *((_BYTE *)a1 + 6952) = v30;
      }
    }
    if (*((_BYTE *)a1 + 6920) && *((_BYTE *)a1 + 6472))
    {
      sub_21B886AFC((uint64_t)a1);
      *((_BYTE *)a1 + 6920) = 0;
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
      v33 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
      {
        *(float *)buf = 3.852e-34;
        *(_QWORD *)v49 = a2;
        _os_log_impl(&dword_21B72A000, v33, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Received ring sensor trust state=True after initializing during no-trust, reinitializing. Ring sensor timestamp: %llu", buf, 0xCu);
      }
    }
    if ((a3 & a4) != 0)
      v34 = 4.0;
    else
      v34 = 32.0;
    v35 = a1[1];
    v36 = *((unsigned int *)a1 + 1);
    v37 = *a1;
    if (v37 + v35 >= v36)
      v38 = *((unsigned int *)a1 + 1);
    else
      v38 = 0;
    *(_QWORD *)&a1[4 * (v37 + v35 - v38) + 4] = a2;
    if (v36 <= v35)
    {
      if (v37 + 1 < v36)
        LOWORD(v36) = 0;
      *a1 = v37 + 1 - v36;
    }
    else
    {
      a1[1] = v35 + 1;
    }
    *(float *)buf = a5;
    *(float *)v49 = a6;
    sub_21B887300(a1 + 484, buf);
    *(float *)buf = v34 * sub_21B887360((uint64_t)a1);
    *(float *)v49 = v34 * v39;
    sub_21B887300(a1 + 968, buf);
    v40 = a1[1453];
    v41 = *((unsigned int *)a1 + 727);
    v42 = a1[1452];
    if (v42 + v40 >= v41)
      v43 = *((unsigned int *)a1 + 727);
    else
      v43 = 0;
    *((_BYTE *)a1 + v42 + v40 - v43 + 2912) = a4;
    if (v41 <= v40)
    {
      if (v42 + 1 < v41)
        LOWORD(v41) = 0;
      a1[1452] = v42 + 1 - v41;
    }
    else
    {
      a1[1453] = v40 + 1;
    }
    if (!*v15)
      sub_21B88747C(a1);
    sub_21B887870(a1);
    *((_BYTE *)a1 + 6968) = a3;
    return 1;
  }
  return result;
}

void sub_21B88726C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_21B880D14(&a9);
  _Unwind_Resume(a1);
}

unsigned __int16 *sub_21B8872AC(unsigned __int16 *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = result[1];
  v3 = *((unsigned int *)result + 1);
  v4 = *result;
  if (v4 + v2 >= v3)
    v5 = *((unsigned int *)result + 1);
  else
    v5 = 0;
  *(_QWORD *)&result[4 * (v4 + v2 - v5) + 4] = *a2;
  if (v3 <= v2)
  {
    if (v4 + 1 < v3)
      LOWORD(v3) = 0;
    *result = v4 + 1 - v3;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

unsigned __int16 *sub_21B887300(unsigned __int16 *result, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *((unsigned int *)result + 1);
  v3 = *result + (unint64_t)result[1];
  if (v3 < v2)
    v2 = 0;
  *(_QWORD *)&result[4 * (v3 - v2) + 4] = *a2;
  v4 = result[1];
  v5 = *((unsigned int *)result + 1);
  if (v5 <= v4)
  {
    v6 = *result + 1;
    if (v6 < v5)
      LOWORD(v5) = 0;
    *result = v6 - v5;
  }
  else
  {
    result[1] = v4 + 1;
  }
  return result;
}

float sub_21B887360(uint64_t a1)
{
  _QWORD v2[6];

  if (*(_QWORD *)(a1 + 5600) == 16)
  {
    sub_21B880DA8((uint64_t)v2, (_QWORD *)(a1 + 5560));
    sub_21B87EFB0(v2);
    sub_21B880D14(v2);
  }
  return 0.0027416;
}

void sub_21B887468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_21B880D14(&a9);
  _Unwind_Resume(a1);
}

void sub_21B88747C(unsigned __int16 *a1)
{
  unsigned __int8 *v2;
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  int v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19[3];
  void *v20[3];
  void *__p[3];
  _QWORD v22[6];
  _QWORD v23[6];
  uint8_t buf[4];
  _BYTE v25[10];
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned __int8 *)(a1 + 3088);
  if (*((_BYTE *)a1 + 6176) || !*((_BYTE *)a1 + 6952))
  {
    if (a1[1])
    {
      if (*((_QWORD *)a1 + 700))
      {
        sub_21B880DA8((uint64_t)v23, (_QWORD *)a1 + 695);
        v3 = sub_21B87EFB0(v23) > 2.0944;
        sub_21B880D14(v23);
      }
      else
      {
        v3 = 0;
      }
      if (*((_QWORD *)a1 + 536))
      {
        sub_21B880DA8((uint64_t)v22, (_QWORD *)a1 + 531);
        v4 = sub_21B87EFB0(v22) > 0.5236;
        sub_21B880D14(v22);
      }
      else
      {
        v4 = 0;
      }
      if (!*v2 || !v3 && !v4)
      {
        sub_21B889A58((uint64_t)a1, v19);
        v5 = *v2;
        sub_21B88E518(v2, a1, a1 + 484, a1 + 968, a1 + 1720, a1 + 2376, a1 + 1452, (uint64_t)(a1 + 2828), (uint64_t)v19, v20, __p);
        v6 = *v2;
        if ((v5 != 0) != (*v2 != 0))
        {
          if (qword_25518E1D0 != -1)
            dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
          v7 = qword_25518E1D8;
          if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
          {
            v8 = *a1 + (unint64_t)a1[1] - 1;
            v9 = *((unsigned int *)a1 + 1);
            if (v8 < v9)
              v9 = 0;
            v10 = *(_QWORD *)&a1[4 * (v8 - v9) + 4];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v25 = v5;
            *(_WORD *)&v25[4] = 1024;
            *(_DWORD *)&v25[6] = v6;
            v26 = 2048;
            v27 = v10;
            _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[updateDMInertialYaw] DM yaw alignment state changed from: %d to %d, latest ring sensor timestamp: %llu", buf, 0x18u);
          }
          if (v6)
          {
            if (qword_25518E1D0 != -1)
              dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
            v11 = qword_25518E1D8;
            if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
            {
              v12 = *a1 + (unint64_t)a1[1] - 1;
              v13 = *((unsigned int *)a1 + 1);
              if (v12 < v13)
                v13 = 0;
              v14 = *(_QWORD *)&a1[4 * (v12 - v13) + 4];
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v25 = v14;
              _os_log_impl(&dword_21B72A000, v11, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[updateDMInertialYaw] Initialized DM yaw alignment state, latest ring sensor timestamp: %llu", buf, 0xCu);
            }
            if (!(v2[744] | v2[296]))
            {
              v2[744] = 1;
              if (qword_25518E1D0 != -1)
                dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
              v15 = qword_25518E1D8;
              if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
              {
                v16 = *a1 + (unint64_t)a1[1] - 1;
                v17 = *((unsigned int *)a1 + 1);
                if (v16 < v17)
                  v17 = 0;
                v18 = *(_QWORD *)&a1[4 * (v16 - v17) + 4];
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)v25 = v18;
                _os_log_impl(&dword_21B72A000, v15, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedRingSensor] Setting fBoolInitDuringNoTrust=True, latest ring sensor timestamp: %llu", buf, 0xCu);
              }
            }
          }
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v20[0])
        {
          v20[1] = v20[0];
          operator delete(v20[0]);
        }
        if (v19[0])
        {
          v19[1] = v19[0];
          operator delete(v19[0]);
        }
      }
    }
  }
}

void sub_21B887838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_21B88A67C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B887870(unsigned __int16 *a1)
{
  unsigned __int16 *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float32x2_t *v17;
  float32x4_t v18;
  unint64_t v19;
  unint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  BOOL v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  float v33;
  unint64_t v34;
  char v35;
  float32x2_t v41;
  float v42;
  float32x2_t *v43;
  float32x4_t v44;
  unint64_t v45;
  unint64_t v46;
  float v47;
  float *v48;
  unint64_t v49;
  unint64_t v50;
  float v51;
  float32x4_t v52;
  unint64_t v53;
  unint64_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float v58;
  float v59;
  float v60;
  unint64_t v61;
  _QWORD *v62;
  float *v63;
  float32x4_t v64;
  float *v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float *v70;
  uint64_t v71;
  float v72;
  uint64_t v73;
  float v74;
  float v75;
  float v76;
  BOOL v77;
  float v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  float *v85;
  float v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  float v90;
  uint64_t v91;
  float v92;
  float v93;
  BOOL v94;
  float v95;
  float32x4_t v96;
  float v97;
  float v98;
  NSObject *v99;
  uint64_t v100;
  float v101;
  char v102;
  uint64_t v103;
  float32x2_t *v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x2_t v107;
  float v108;
  _QWORD v109[6];
  _QWORD v110[6];
  float32x2_t v111;
  float v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  __int128 v117;
  float32x4_t v118;
  float32x2_t v119;
  float v120;
  unint64_t v121;
  float v122[3];
  _BYTE buf[22];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)a1 + 6176))
  {
    if (a1[1517] >= 3u)
    {
      v103 = (uint64_t)(a1 + 3088);
      v121 = 0;
      if (sub_21B88B5FC(a1, v122, &v121, (float *)&v119))
      {
        v2 = a1 + 2176;
        v3 = a1[1517] - 1;
        do
        {
          v4 = v3;
          if (!v3)
            break;
          v5 = *(_QWORD *)sub_21B88A160(a1 + 1516, v3);
          v6 = a1[2172] + (unint64_t)a1[2173] - 1;
          v7 = *((unsigned int *)a1 + 1087);
          if (v6 < v7)
            v7 = 0;
          v8 = *(_QWORD *)&v2[4 * (v6 - v7)];
          v3 = v4 - 1;
        }
        while (v5 > v8);
        v9 = *(_QWORD *)sub_21B88A160(a1 + 1516, v4);
        v10 = a1[2172] + (unint64_t)a1[2173] - 1;
        v11 = *((unsigned int *)a1 + 1087);
        if (v10 < v11)
          v11 = 0;
        if (v9 != *(_QWORD *)&v2[4 * (v10 - v11)])
        {
          if (qword_25518E1D0 != -1)
            dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
          v12 = qword_25518E1D8;
          if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
          {
            v13 = a1[2172] + (unint64_t)a1[2173] - 1;
            v14 = *((unsigned int *)a1 + 1087);
            if (v13 < v14)
              v14 = 0;
            v15 = *(_QWORD *)&v2[4 * (v13 - v14)];
            v16 = *(_QWORD *)sub_21B88A160(a1 + 1516, v4);
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v16;
            _os_log_impl(&dword_21B72A000, v12, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[updateCurrentEstimate] Timestamp mismatch error. Latest aux timestamp: %llu us, corresponding src timestamp: %llu us", buf, 0x16u);
          }
        }
        v17 = (float32x2_t *)sub_21B878848(a1 + 1720, v4);
        sub_21B892ECC(v17, &v118, v18);
        v19 = a1[2376] + (unint64_t)a1[2377] - 1;
        v20 = *((unsigned int *)a1 + 1189);
        if (v19 < v20)
          v20 = 0;
        v117 = *(_OWORD *)&a1[8 * (v19 - v20) + 2380];
        v21 = sub_21B88F624(v103, &v116);
        *(double *)v22.i64 = sub_21B892E6C((uint64_t)&v117, v116.f32, &v114, v21);
        *(double *)v23.i64 = sub_21B892E6C((uint64_t)&v114, v118.f32, (float32x4_t *)buf, v22);
        sub_21B892ECC((float32x2_t *)buf, &v115, v23);
        v24 = *(_QWORD *)sub_21B88A160(a1 + 1516, v4);
        v104 = (float32x2_t *)(a1 + 3400);
        sub_21B879774((uint64_t)(a1 + 3400));
        sub_21B88A6CC((uint64_t)a1);
        sub_21B87943C((uint64_t)(a1 + 3400), a1 + 3354, v24, 0.017453, 0.05236);
        v114.i64[0] = 0;
        v114.i64[1] = 0x3F80000000000000;
        v113.i64[0] = 0;
        v113.i64[1] = 0x3F80000000000000;
        if (a1[1517] && a1[2173])
        {
          v25 = a1[1517] + (unint64_t)a1[1516] - 1;
          v26 = *((unsigned int *)a1 + 759);
          if (v25 < v26)
            v26 = 0;
          v27 = *(_DWORD *)&a1[4 * (v25 - v26) + 1520];
          v28 = *((_DWORD *)a1 + 1736);
          if (*((_QWORD *)a1 + 700) < 5uLL)
          {
            v29 = 1;
          }
          else
          {
            sub_21B880DA8((uint64_t)v110, (_QWORD *)a1 + 695);
            v29 = sub_21B87EFB0(v110) >= 0.087266;
            sub_21B880D14(v110);
          }
          if (*((_QWORD *)a1 + 536) < 5uLL)
          {
            v30 = 1;
          }
          else
          {
            sub_21B880DA8((uint64_t)v109, (_QWORD *)a1 + 531);
            v30 = sub_21B87EFB0(v109) >= 0.087266;
            sub_21B880D14(v109);
          }
          v31 = v4 + 1;
          v32 = *((_QWORD *)a1 + 700);
          if (v32)
            v33 = *(float *)(*(_QWORD *)(*((_QWORD *)a1 + 696)
                                       + (((unint64_t)(v32 + *((_QWORD *)a1 + 699) - 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                           + 4 * ((v32 + *((_QWORD *)a1 + 699) - 1) & 0x3FF));
          else
            v33 = 0.0;
          v101 = v33;
          if (v31 >= a1[1517])
          {
            v46 = 0;
          }
          else
          {
            v34 = 0;
            v35 = (v27 - v28) > 0x4C4B3F || v29;
            v102 = v35 | v30;
            __asm { FMOV            V2.2S, #0.75 }
            v41 = vmul_f32(v119, _D2);
            v42 = v120 * 0.75;
            do
            {
              v43 = (float32x2_t *)sub_21B878848(a1 + 1720, v31);
              sub_21B892ECC(v43, (float32x4_t *)buf, v44);
              v118 = *(float32x4_t *)buf;
              v45 = 0;
              v46 = *(_QWORD *)sub_21B88A160(a1 + 1516, v31);
              v107 = v41;
              v108 = v42;
              do
              {
                v47 = *(float *)sub_21B87C7D8((uint64_t)&v107, v45);
                v48 = (float *)sub_21B87C7D8((uint64_t)&v107, v45);
                if (v47 <= 2.0944)
                {
                  if (*v48 < -2.0944)
                    *(_DWORD *)sub_21B87C7D8((uint64_t)&v107, v45) = -1073345902;
                }
                else
                {
                  *v48 = 2.0944;
                }
                ++v45;
              }
              while (v45 != 3);
              v49 = a1[2172] + (unint64_t)a1[2173] - 1;
              v50 = *((unsigned int *)a1 + 1087);
              if (v49 < v50)
                v50 = 0;
              v51 = (float)(v46 - *(_QWORD *)&v2[4 * (v49 - v50)]) * 0.000001;
              *(float32x2_t *)v105.f32 = vmul_n_f32(v107, v51);
              v105.f32[2] = v108 * v51;
              *(double *)v52.i64 = sub_21B8931F8(&v106, v105.f32);
              v53 = a1[2376] + (unint64_t)a1[2377] - 1;
              v54 = *((unsigned int *)a1 + 1189);
              if (v53 < v54)
                v54 = 0;
              sub_21B892E6C((uint64_t)&v106, (float *)&a1[8 * (v53 - v54) + 2380], (float32x4_t *)buf, v52);
              v117 = *(_OWORD *)buf;
              *(double *)v55.i64 = sub_21B892E6C((uint64_t)&v117, v116.f32, &v105, *(float32x4_t *)buf);
              *(double *)v56.i64 = sub_21B892E6C((uint64_t)&v105, v118.f32, &v106, v55);
              sub_21B892ECC((float32x2_t *)&v106, (float32x4_t *)buf, v56);
              v114 = *(float32x4_t *)buf;
              *(double *)v57.i64 = sub_21B892ECC((float32x2_t *)&v115, &v106, *(float32x4_t *)buf);
              sub_21B892E6C((uint64_t)&v114, v106.f32, (float32x4_t *)buf, v57);
              v113 = *(float32x4_t *)buf;
              v58 = (float)(v46 - v24) * 0.000001;
              if (v58 >= 0.0000001)
              {
                v111.f32[0] = sub_21B893300(&v113) / v58;
                v111.f32[1] = v59 / v58;
                v112 = v60 / v58;
                if ((v102 & 1) == 0)
                {
                  v112 = 0.0;
                  v111 = 0;
                }
                sub_21B879798(v104, &v111, v46);
                v115 = v114;
                v61 = a1[1];
                while (v34 < v61)
                {
                  v62 = (_QWORD *)sub_21B88A160(a1, v34);
                  v61 = a1[1];
                  if (v46 == *v62)
                    break;
                  ++v34;
                }
                if (v34 != v61 && *(_QWORD *)sub_21B88A160(a1, v34) == v46)
                {
                  v63 = (float *)sub_21B88A160(a1 + 484, v34);
                  if (*v63 > 0.17453)
                  {
                    v65 = v63;
                    v64.f32[0] = *v63;
                    sub_21B892ECC((float32x2_t *)(a1 + 3354), (float32x4_t *)buf, v64);
                    sub_21B87CDC4((float *)buf);
                    v67 = fmodf((float)(v66 - v65[1]) + 3.1416, 6.2832);
                    if (v67 < 0.0)
                      v67 = v67 + 6.2832;
                    v68 = fabsf(v67 + -3.1416);
                    if (*(_BYTE *)(v103 + 296) || v68 > 0.7854)
                    {
                      v69 = v68 <= 0.7854 ? 1.0 : 0.1;
                      v70 = (float *)sub_21B88A160(a1 + 968, v34);
                      v71 = 0;
                      v72 = 0.0;
                      do
                      {
                        v72 = v72 + (float)(v111.f32[v71] * v111.f32[v71]);
                        ++v71;
                      }
                      while (v71 != 3);
                      if (sqrtf(v72) < 0.87266 && v101 < 0.87266)
                      {
                        v73 = 0;
                        v74 = v69 * v70[1];
                        v75 = 0.0;
                        do
                        {
                          v75 = v75 + (float)(v111.f32[v73] * v111.f32[v73]);
                          ++v73;
                        }
                        while (v73 != 3);
                        v76 = sqrtf(v75);
                        v77 = v101 <= 0.5236 && v76 <= 0.5236;
                        v78 = 1.0;
                        if (!v77)
                          v78 = 9.0;
                        *(float *)buf = (float)(v69 * *v70) * v78;
                        *(float *)&buf[4] = v74 * v78;
                        sub_21B87A29C((uint64_t)v104, v65, (uint64_t)buf, v46);
                      }
                    }
                  }
                }
                ++v31;
                v24 = v46;
              }
            }
            while (v31 < a1[1517]);
          }
          v79 = *a1 + (unint64_t)a1[1] - 1;
          v80 = *((unsigned int *)a1 + 1);
          if (v79 < v80)
            v80 = 0;
          v81 = *(_QWORD *)&a1[4 * (v79 - v80) + 4];
          if (v81 > v46 && (v81 - v46) >> 5 <= 0xC34)
          {
            sub_21B879798(v104, &v111, v81);
            if (*(_BYTE *)(v103 + 296))
            {
              v82 = a1[484] + (unint64_t)a1[485] - 1;
              v83 = *((unsigned int *)a1 + 243);
              if (v82 < v83)
                v83 = 0;
              v84 = (uint64_t)&a1[4 * (v82 - v83) + 484];
              v86 = *(float *)(v84 + 8);
              v85 = (float *)(v84 + 8);
              if (v86 > 0.17453)
              {
                v87 = 0;
                v88 = a1[968] + (unint64_t)a1[969] - 1;
                v89 = *((unsigned int *)a1 + 485);
                if (v88 < v89)
                  v89 = 0;
                v90 = 0.0;
                do
                {
                  v90 = v90 + (float)(v111.f32[v87] * v111.f32[v87]);
                  ++v87;
                }
                while (v87 != 3);
                if (sqrtf(v90) < 0.87266 && v101 < 0.87266)
                {
                  v91 = 0;
                  v92 = 0.0;
                  do
                  {
                    v92 = v92 + (float)(v111.f32[v91] * v111.f32[v91]);
                    ++v91;
                  }
                  while (v91 != 3);
                  v93 = sqrtf(v92);
                  v94 = v101 <= 0.5236 && v93 <= 0.5236;
                  v95 = 1.0;
                  if (!v94)
                    v95 = 9.0;
                  *(float32x2_t *)buf = vmul_n_f32(*(float32x2_t *)&a1[4 * (v88 - v89) + 972], v95);
                  sub_21B87A29C((uint64_t)v104, v85, (uint64_t)buf, v81);
                }
              }
            }
            v46 = v81;
          }
          *((_QWORD *)a1 + 861) = v46;
          *(_OWORD *)(a1 + 3436) = *(_OWORD *)(a1 + 3402);
          sub_21B8872AC(a1 + 3488, (_QWORD *)a1 + 861);
          sub_21B876D84(a1 + 3972, a1 + 3436);
          if (!*(_BYTE *)(v103 + 745))
          {
            sub_21B892ECC((float32x2_t *)a1 + 859, (float32x4_t *)buf, v96);
            sub_21B87CDC4((float *)buf);
            v98 = v97;
            v106.i32[0] = 0;
            v106.f32[1] = -v97;
            v106.i32[2] = 0;
            sub_21B8931F8((float32x4_t *)buf, v106.f32);
            if (a1 + 3462 != (unsigned __int16 *)buf)
              *(_OWORD *)(a1 + 3462) = *(_OWORD *)buf;
            *(_BYTE *)(v103 + 745) = 1;
            if (qword_25518E1D0 != -1)
              dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
            v99 = qword_25518E1D8;
            if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
            {
              v100 = *((_QWORD *)a1 + 861);
              *(_DWORD *)buf = 134218240;
              *(double *)&buf[4] = (float)(v98 * 57.296);
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v100;
              _os_log_impl(&dword_21B72A000, v99, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[updateCurrentEstimate] Initial roll angle recorded: %.1f deg, timestamp: %llu us", buf, 0x16u);
            }
          }
        }
      }
    }
  }
}

void sub_21B88838C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  sub_21B880D14(&a27);
  _Unwind_Resume(a1);
}

void sub_21B8883B4(uint64_t a1, unint64_t a2, float32x4_t *a3, float a4, float a5)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  float32x4_t v16;
  unint64_t *v17;
  unint64_t *i;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  float32x4_t v31;
  float v32;
  float v33;
  _BYTE buf[22];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32 = a5;
  v33 = a4;
  if (!*(_WORD *)(a1 + 4346))
    goto LABEL_45;
  v8 = a1 + 4352;
  v9 = *(unsigned __int16 *)(a1 + 4346) + (unint64_t)*(unsigned __int16 *)(a1 + 4344) - 1;
  v10 = *(unsigned int *)(a1 + 4348);
  if (v9 < v10)
    v10 = 0;
  if (*(_QWORD *)(v8 + 8 * (v9 - v10)) >= a2)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
    v11 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
    {
      v12 = *(unsigned __int16 *)(a1 + 4344) + (unint64_t)*(unsigned __int16 *)(a1 + 4346) - 1;
      v13 = *(unsigned int *)(a1 + 4348);
      if (v12 < v13)
        v13 = 0;
      v14 = *(_QWORD *)(v8 + 8 * (v12 - v13));
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a2;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_21B72A000, v11, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedAuxDM] AuxDM timestamp must be greater than the last value. Input: %llu us, last: %llu us", buf, 0x16u);
    }
  }
  else
  {
LABEL_45:
    if (*(_BYTE *)(a1 + 6168))
    {
      *(_QWORD *)(a1 + 6144) = a2;
      sub_21B892EEC(a3, (float32x4_t *)buf);
      if ((_BYTE *)(a1 + 6152) != buf)
        *(_OWORD *)(a1 + 6152) = *(_OWORD *)buf;
      *(_BYTE *)(a1 + 6168) = 0;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 6144);
      if (v15 + 1000000 >= a2)
      {
        sub_21B888794((unsigned __int16 *)(a1 + 3032), v15, a2, (char **)buf);
        v17 = *(unint64_t **)buf;
        for (i = *(unint64_t **)&buf[8]; v17 != i; ++v17)
        {
          v19 = *v17;
          sub_21B88898C(*(_QWORD *)(a1 + 6144), a2, (float32x2_t *)(a1 + 6152), (uint64_t)a3, *v17, &v31, v16);
          v20 = *(unsigned __int16 *)(a1 + 4346);
          v21 = *(unsigned int *)(a1 + 4348);
          v22 = *(unsigned __int16 *)(a1 + 4344);
          if (v22 + v20 >= v21)
            v23 = *(unsigned int *)(a1 + 4348);
          else
            v23 = 0;
          *(_QWORD *)(a1 + 4352 + 8 * (v22 + v20 - v23)) = v19;
          if (v21 <= v20)
          {
            if (v22 + 1 < v21)
              LOWORD(v21) = 0;
            *(_WORD *)(a1 + 4344) = v22 + 1 - v21;
          }
          else
          {
            *(_WORD *)(a1 + 4346) = v20 + 1;
          }
          sub_21B876D84((unsigned __int16 *)(a1 + 4752), &v31);
          if (*(_BYTE *)(a1 + 6176))
            sub_21B888A90(a1);
        }
        if (*(_WORD *)(a1 + 4346))
        {
          v24 = *(unsigned __int16 *)(a1 + 4346) + (unint64_t)*(unsigned __int16 *)(a1 + 4344) - 1;
          v25 = *(unsigned int *)(a1 + 4348);
          if (v24 < v25)
            v25 = 0;
          *(_QWORD *)(a1 + 6144) = *(_QWORD *)(a1 + 4344 + 8 * (v24 - v25) + 8);
          v26 = *(unsigned __int16 *)(a1 + 4752) + (unint64_t)*(unsigned __int16 *)(a1 + 4754) - 1;
          v27 = *(unsigned int *)(a1 + 4756);
          if (v26 < v27)
            v27 = 0;
          v28 = (_OWORD *)(a1 + 4752 + 16 * (v26 - v27) + 8);
          if ((_OWORD *)(a1 + 6152) != v28)
            *(_OWORD *)(a1 + 6152) = *v28;
        }
        if (*(_QWORD *)(a1 + 5600) == 16)
        {
          v29 = *(_QWORD *)(a1 + 5592);
          *(_QWORD *)(a1 + 5600) = 15;
          *(_QWORD *)(a1 + 5592) = v29 + 1;
          sub_21B88BEA8(a1 + 5560, 1);
        }
        sub_21B88361C((_QWORD *)(a1 + 5560), &v33);
        if (*(_QWORD *)(a1 + 5648) == 16)
        {
          v30 = *(_QWORD *)(a1 + 5640);
          *(_QWORD *)(a1 + 5648) = 15;
          *(_QWORD *)(a1 + 5640) = v30 + 1;
          sub_21B88BEA8(a1 + 5608, 1);
        }
        sub_21B88361C((_QWORD *)(a1 + 5608), &v32);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
      }
      else
      {
        *(_QWORD *)(a1 + 6144) = a2;
        sub_21B892EEC(a3, (float32x4_t *)buf);
        if ((_BYTE *)(a1 + 6152) != buf)
          *(_OWORD *)(a1 + 6152) = *(_OWORD *)buf;
      }
    }
  }
}

void sub_21B88876C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21B888794(unsigned __int16 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v5;
  unsigned __int16 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v5 = a1[1];
  if (a1[1])
  {
    v8 = a1 + 4;
    v9 = *a1;
    v10 = v5 + v9 - 1;
    v11 = *((unsigned int *)a1 + 1);
    if (v10 < v11)
      v11 = 0;
    if (*(_QWORD *)&v8[4 * (v10 - v11)] >= a2 && *(_QWORD *)&v8[4 * v9] < a3)
    {
      v13 = v5 - 1;
      do
      {
        v14 = v13;
        if (!v13)
          break;
        v15 = (unint64_t *)sub_21B88A160(a1, v13);
        v13 = v14 - 1;
      }
      while (*v15 >= a3);
      if (*(_QWORD *)sub_21B88A160(a1, v14) > a2)
      {
        v16 = v14 + 1;
        while (1)
        {
          v17 = v16 - 1;
          if (v16 == 1)
            break;
          v18 = (unint64_t *)sub_21B88A160(a1, v16 - 2);
          v16 = v17;
          if (*v18 <= a2)
          {
            if (v17 > v14)
              return;
            goto LABEL_14;
          }
        }
        do
        {
LABEL_14:
          v19 = (_QWORD *)sub_21B88A160(a1, v17);
          v20 = v19;
          v22 = a4[1];
          v21 = (unint64_t)a4[2];
          if ((unint64_t)v22 >= v21)
          {
            v24 = *a4;
            v25 = (v22 - *a4) >> 3;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 61)
              sub_21B796A0C();
            v27 = v21 - (_QWORD)v24;
            if (v27 >> 2 > v26)
              v26 = v27 >> 2;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
              v28 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v28 = v26;
            if (v28)
            {
              v29 = (char *)sub_21B796A20((uint64_t)(a4 + 2), v28);
              v24 = *a4;
              v22 = a4[1];
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[8 * v25];
            *(_QWORD *)v30 = *v20;
            v23 = v30 + 8;
            while (v22 != v24)
            {
              v31 = *((_QWORD *)v22 - 1);
              v22 -= 8;
              *((_QWORD *)v30 - 1) = v31;
              v30 -= 8;
            }
            *a4 = v30;
            a4[1] = v23;
            a4[2] = &v29[8 * v28];
            if (v24)
              operator delete(v24);
          }
          else
          {
            *(_QWORD *)v22 = *v19;
            v23 = v22 + 8;
          }
          a4[1] = v23;
          ++v17;
        }
        while (v17 <= v14);
      }
    }
  }
}

void sub_21B88896C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double sub_21B88898C@<D0>(unint64_t a1@<X0>, unint64_t a2@<X1>, float32x2_t *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, float32x4_t *a6@<X8>, float32x4_t a7@<Q0>)
{
  int v8;
  int v9;
  int v12;
  float32x4_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float32x4_t v22;
  float v24[3];
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;

  if (a2 >= a1 && (v8 = a5, v9 = a1, a5 >= a1))
  {
    v12 = a2;
    *(double *)v13.i64 = sub_21B892ECC(a3, &v25, a7);
    sub_21B892E6C(a4, v25.f32, &v26, v13);
    sub_21B892EEC(&v26, &v27);
    v14 = sub_21B893300(&v27);
    v15 = (double)(v12 - v9) * 0.000001;
    v16 = v14 / v15;
    v18 = v17 / v15;
    v20 = v19 / v15;
    v21 = (double)(v8 - v9) * 0.000001;
    v24[0] = v16 * v21;
    v24[1] = v18 * v21;
    v24[2] = v20 * v21;
    *(double *)v22.i64 = sub_21B8931F8(&v25, v24);
    sub_21B892E6C((uint64_t)&v25, (float *)a3, &v26, v22);
    a7.i64[0] = sub_21B892EEC(&v26, a6).u64[0];
  }
  else
  {
    a6->i64[0] = 0;
    a6->i64[1] = 0x3F80000000000000;
  }
  return *(double *)a7.i64;
}

uint64_t sub_21B888A90(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  float32x2_t *v13;
  float32x4_t v14;
  float32x4_t v15;
  unint64_t v16;
  unint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  float32x4_t *v26;
  float32x4_t v27;
  float v28;
  uint64_t v29;
  unsigned int v30;
  __int32 v31;
  float v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (*(_WORD *)(result + 2))
  {
    v1 = result;
    v2 = result + 6921;
    if (*(_BYTE *)(result + 6921))
    {
      v3 = result + 4352;
      v4 = *(unsigned __int16 *)(result + 4344) + (unint64_t)*(unsigned __int16 *)(result + 4346) - 1;
      v5 = *(unsigned int *)(result + 4348);
      if (v4 < v5)
        v5 = 0;
      v6 = *(_QWORD *)(v3 + 8 * (v4 - v5));
      v7 = *(unsigned __int16 *)(result + 2) - 1;
      while (v7)
      {
        result = sub_21B88A160((unsigned __int16 *)v1, v7--);
        if (*(_QWORD *)result == v6)
        {
          v8 = *(unsigned __int16 *)(v1 + 3034) - 1;
          do
          {
            v9 = v8;
            if (!v8)
              break;
            v10 = (_QWORD *)sub_21B88A160((unsigned __int16 *)(v1 + 3032), v8);
            v8 = v9 - 1;
          }
          while (*v10 != v6);
          if (*(_QWORD *)sub_21B88A160((unsigned __int16 *)(v1 + 3032), v9) != v6)
          {
            if (qword_25518E1D0 != -1)
              dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
            v11 = qword_25518E1D8;
            if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
            {
              v12 = *(_QWORD *)sub_21B88A160((unsigned __int16 *)(v1 + 3032), v9);
              *(_DWORD *)buf = 134218496;
              v45 = v6;
              v46 = 2048;
              v47 = v12;
              v48 = 2048;
              v49 = v9;
              _os_log_impl(&dword_21B72A000, v11, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedAuxDM] Expected exact source vs aux timestamp, not finding one should not have been possible. fBufAuxDM6TimestampMicroSeconds.back(): %llu, fBufSrcDM6TimestampMicroSeconds[indSrc]: %llu, indSrc: %lu", buf, 0x20u);
            }
          }
          v13 = (float32x2_t *)sub_21B878848((unsigned __int16 *)(v1 + 3440), v9);
          sub_21B892ECC(v13, (float32x4_t *)buf, v14);
          v15 = sub_21B88F624(v1 + 6176, &v43);
          v16 = *(unsigned __int16 *)(v1 + 4752) + (unint64_t)*(unsigned __int16 *)(v1 + 4754) - 1;
          v17 = *(unsigned int *)(v1 + 4756);
          if (v16 < v17)
            v17 = 0;
          *(double *)v18.i64 = sub_21B892E6C(v1 + 4752 + 16 * (v16 - v17) + 8, v43.f32, &v40, v15);
          *(double *)v19.i64 = sub_21B892E6C((uint64_t)&v40, (float *)buf, &v41, v18);
          *(double *)v20.i64 = sub_21B892ECC((float32x2_t *)&v41, &v42, v19);
          *(double *)v21.i64 = sub_21B892ECC((float32x2_t *)(v1 + 6924), &v40, v20);
          sub_21B892E6C((uint64_t)&v42, v40.f32, &v41, v21);
          v42 = v41;
          v22 = *(unsigned __int16 *)(v1 + 4344) + (unint64_t)*(unsigned __int16 *)(v1 + 4346) - 1;
          v23 = *(unsigned int *)(v1 + 4348);
          if (v22 < v23)
            v23 = 0;
          v24 = *(_QWORD *)(v3 + 8 * (v22 - v23));
          sub_21B888E64(v1, (float32x2_t *)&v42, v24, v41);
          v25 = *(_QWORD *)(v1 + 6888);
          v26 = (float32x4_t *)(v1 + 6872);
          sub_21B892F24((float32x2_t *)&v42, v1 + 6872, &v41, v27);
          v28 = sub_21B893300(&v41);
          v29 = 0;
          v40.i64[0] = __PAIR64__(v30, LODWORD(v28));
          v40.i32[2] = v31;
          v32 = 0.0;
          do
          {
            v32 = v32 + (float)(v40.f32[v29] * v40.f32[v29]);
            ++v29;
          }
          while (v29 != 3);
          if (v25 <= v24)
            v33 = v24 - v25;
          else
            v33 = v25 - v24;
          if (&v42 != v26 && v33 <= 0x7A11F && sqrtf(v32) < 0.017453)
            v42 = *v26;
          if ((float32x4_t *)(v1 + 6896) != &v42)
            *(float32x4_t *)(v1 + 6896) = v42;
          *(_QWORD *)(v1 + 6912) = v24;
          LODWORD(v34) = *(unsigned __int16 *)(v1 + 6978);
          if (*(_WORD *)(v1 + 6978) && *(_BYTE *)(v2 + 2955))
          {
            while (1)
            {
              v35 = __OFSUB__((_DWORD)v34, 1);
              v34 = (v34 - 1);
              if (((v34 & 0x80000000) != 0) != v35)
                break;
              if (*(_QWORD *)sub_21B88A160((unsigned __int16 *)(v1 + 6976), v34) == v24)
              {
                v36 = sub_21B878848((unsigned __int16 *)(v1 + 7944), v34);
                *(double *)v38.i64 = sub_21B892ECC((float32x2_t *)(v1 + 6924), &v40, v37);
                sub_21B892E6C(v36, v40.f32, &v41, v38);
                v42 = v41;
                break;
              }
            }
          }
          result = *(_QWORD *)(v1 + 6696);
          if (result)
          {
            v39 = v42;
            v41.i64[0] = v24;
            return (*(uint64_t (**)(uint64_t, float32x4_t *, float32x4_t *))(*(_QWORD *)result + 48))(result, &v41, &v39);
          }
          return result;
        }
      }
    }
  }
  return result;
}

void sub_21B888E64(uint64_t a1, float32x2_t *a2, unint64_t a3, float32x4_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  float32x4_t v11;
  float32x4_t v12;
  float v13;
  uint64_t v14;
  int v15;
  int v16;
  float v17;
  float v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  _DWORD v24[3];
  float32x4_t v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a1 + 6921;
  if (!*(_BYTE *)(a1 + 6921))
    goto LABEL_10;
  v6 = *(_QWORD *)(a1 + 6888);
  if (!v6)
    goto LABEL_10;
  v8 = v6 - a3;
  if (v6 < a3)
    goto LABEL_10;
  v9 = *(_QWORD *)(a1 + 6944);
  if (a3 <= v9)
    goto LABEL_10;
  *(double *)a4.i64 = (double)(a3 - v9) * 0.000001;
  a4.f32[0] = *(double *)a4.i64;
  if (a4.f32[0] < 5.0)
    goto LABEL_10;
  if (v8 >= 0x30D41)
    goto LABEL_10;
  *(double *)v11.i64 = sub_21B892ECC((float32x2_t *)(a1 + 6924), (float32x4_t *)buf, a4);
  *(double *)v12.i64 = sub_21B892E6C(a1 + 6872, (float *)buf, &v25, v11);
  sub_21B892F24(a2, (uint64_t)&v25, (float32x4_t *)buf, v12);
  v13 = sub_21B893300((float32x4_t *)buf);
  v14 = 0;
  *(float *)v24 = v13;
  v24[1] = v15;
  v24[2] = v16;
  v17 = 0.0;
  do
  {
    v17 = v17 + (float)(*(float *)&v24[v14] * *(float *)&v24[v14]);
    ++v14;
  }
  while (v14 != 3);
  v18 = sqrtf(v17);
  if (v18 < 0.087266)
  {
LABEL_10:
    *(_QWORD *)(a1 + 6960) = 0;
LABEL_11:
    *(_BYTE *)(v5 + 48) = 0;
    return;
  }
  v19 = *(_QWORD *)(a1 + 6960);
  if (!v19)
  {
    *(_QWORD *)(a1 + 6960) = a3;
    goto LABEL_11;
  }
  v20 = a3 >= v19;
  v21 = a3 - v19;
  if (v20)
    v22 = v21;
  else
    v22 = 0;
  if (v22 >= 0x4C4B40 && !*(_BYTE *)(v5 + 48))
  {
    *(_BYTE *)(v5 + 48) = 1;
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
    v23 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349824;
      v27 = a3;
      v28 = 2050;
      v29 = v22;
      v30 = 2050;
      v31 = v8;
      v32 = 2050;
      v33 = (float)(v18 * 57.296);
      _os_log_impl(&dword_21B72A000, v23, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[checkPersistentCorrectedVsCurrentRollDelta] Detected persistent large difference between corrected vs. current roll estimate. Timestamp: %{public}llu us, sustained duration: %{public}llu us durationSinceLastCurrentUpdate: %{public}llu us, rollDelta: %{public}.3f deg", buf, 0x2Au);
    }
  }
}

void sub_21B889098(unsigned __int16 *a1, unint64_t a2, _OWORD *a3, float a4, float a5)
{
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unsigned __int16 *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  float32x4_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  __int16 v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  float v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unsigned int v62;
  _BOOL4 v63;
  int v64;
  float v65;
  NSObject *v66;
  double v67;
  _QWORD v68[6];
  float32x4_t v69;
  float32x4_t v70;
  float v71;
  float v72;
  _BYTE buf[22];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v8 = a1 + 3084;
  v71 = a5;
  v72 = a4;
  v9 = a1[1517];
  v10 = a1[1516];
  if (!a1[1517])
  {
    v21 = 0;
    goto LABEL_63;
  }
  v11 = a1 + 1520;
  v12 = v9 + v10 - 1;
  v13 = *((unsigned int *)a1 + 759);
  if (v12 < v13)
    v13 = 0;
  v14 = *(_QWORD *)&v11[4 * (v12 - v13)];
  if (v14 < a2)
  {
    sub_21B8897A4(a1, v14, a2, (char **)buf);
    v15 = *(unint64_t **)buf;
    v16 = *(unint64_t **)&buf[8];
    if (*(_QWORD *)buf == *(_QWORD *)&buf[8])
      goto LABEL_55;
    v17 = a1[1517];
    if (**(_QWORD **)buf - v14 > 0x9C3)
      goto LABEL_39;
    if (a1[1517])
    {
      v18 = v17 + a1[1516] - 1;
      v19 = *((unsigned int *)a1 + 759);
      if (v18 < v19)
        v19 = 0;
      v20 = *(_QWORD *)&v11[4 * (v18 - v19)];
    }
    else
    {
      v20 = 0;
    }
    v26 = a1[2173];
    if (a1[2173])
    {
      v27 = v26 + a1[2172] - 1;
      v28 = *((unsigned int *)a1 + 1087);
      if (v27 < v28)
        v28 = 0;
      v29 = *(_QWORD *)&a1[4 * (v27 - v28) + 2176];
      if (!a1[1517])
      {
LABEL_27:
        if ((_DWORD)v26 && (_WORD)v17 && v29 == v20)
        {
          v30 = v26 - 1;
          a1[2173] = v30;
          v31 = a1[2377];
          if (v31)
            a1[2377] = --v31;
          if (v30)
          {
            v32 = a1[2172] + (unint64_t)v30 - 1;
            v33 = *((unsigned int *)a1 + 1087);
            if (v32 < v33)
              v33 = 0;
            *((_QWORD *)a1 + 768) = *(_QWORD *)&a1[4 * (v32 - v33) + 2176];
            v34 = a1[2376] + (unint64_t)v31 - 1;
            v35 = *((unsigned int *)a1 + 1189);
            if (v34 < v35)
              v35 = 0;
            v36 = &a1[8 * (v34 - v35) + 2380];
            if (a1 + 3076 != v36)
              *(_OWORD *)(a1 + 3076) = *(_OWORD *)v36;
          }
          else
          {
            *v8 = 1;
          }
LABEL_40:
          v37 = a1[1516] + (unint64_t)(unsigned __int16)v17 - 1;
          v38 = *((unsigned int *)a1 + 759);
          if (v37 < v38)
            v38 = 0;
          v39 = *(_QWORD *)&v11[4 * (v37 - v38)];
          v40 = a1[1720] + (unint64_t)a1[1721] - 1;
          v41 = *((unsigned int *)a1 + 861);
          if (v40 < v41)
            v41 = 0;
          v42 = *(float32x4_t *)&a1[8 * (v40 - v41) + 1724];
          v70 = v42;
          do
          {
            v43 = *v15;
            sub_21B88898C(v39, a2, (float32x2_t *)&v70, (uint64_t)a3, *v15, &v69, v42);
            v44 = a1[1517];
            v45 = *((unsigned int *)a1 + 759);
            v46 = a1[1516];
            if (v46 + v44 >= v45)
              v47 = *((unsigned int *)a1 + 759);
            else
              v47 = 0;
            *(_QWORD *)&v11[4 * (v46 + v44 - v47)] = v43;
            if (v45 <= v44)
            {
              if (v46 + 1 < v45)
                LOWORD(v45) = 0;
              a1[1516] = v46 + 1 - v45;
            }
            else
            {
              a1[1517] = v44 + 1;
            }
            sub_21B876D84(a1 + 1720, &v69);
            ++v15;
          }
          while (v15 != v16);
          v15 = *(unint64_t **)buf;
LABEL_55:
          if (!v15)
            goto LABEL_57;
          goto LABEL_56;
        }
LABEL_39:
        if (!(_WORD)v17)
        {
LABEL_56:
          *(_QWORD *)&buf[8] = v15;
          operator delete(v15);
LABEL_57:
          v9 = a1[1517];
          v10 = a1[1516];
          if (a1[1517])
          {
            v48 = v9 + v10 - 1;
            v49 = *((unsigned int *)a1 + 759);
            if (v48 < v49)
              v49 = 0;
            v21 = *(_QWORD *)&v11[4 * (v48 - v49)];
            if (v21 + 2500 >= a2)
            {
LABEL_73:
              if (*((_QWORD *)a1 + 768) > (unint64_t)(*((_QWORD *)a1 + 849) + 10000))
              {
                sub_21B88747C(a1);
                sub_21B88A6CC((uint64_t)a1);
              }
              if (*((_QWORD *)a1 + 536) == 16)
              {
                v55 = *((_QWORD *)a1 + 535);
                *((_QWORD *)a1 + 536) = 15;
                *((_QWORD *)a1 + 535) = v55 + 1;
                sub_21B88BEA8((uint64_t)(a1 + 2124), 1);
              }
              sub_21B88361C((_QWORD *)a1 + 531, &v72);
              if (*((_QWORD *)a1 + 542) == 16)
              {
                v56 = *((_QWORD *)a1 + 541);
                *((_QWORD *)a1 + 542) = 15;
                *((_QWORD *)a1 + 541) = v56 + 1;
                sub_21B88BEA8((uint64_t)(a1 + 2148), 1);
              }
              sub_21B88361C((_QWORD *)a1 + 537, &v71);
              v57 = *((_QWORD *)a1 + 868);
              v58 = (double)(a2 - v57) * 0.000001;
              if (a2 <= v57)
                v58 = 0.0;
              *((float *)a1 + 2468) = v58;
              if (!a1[1])
                goto LABEL_88;
              v59 = a1[1] + (unint64_t)*a1 - 1;
              v60 = *((unsigned int *)a1 + 1);
              if (v59 < v60)
                v60 = 0;
              v61 = *(_QWORD *)&a1[4 * (v59 - v60) + 4];
              if (v61)
              {
                v62 = v61 - v21;
                if (v61 <= v21)
                  v62 = v21 - v61;
                v63 = v62 > 0x124F7;
                v8[802] = v62 < 0x124F8;
              }
              else
              {
LABEL_88:
                v8[802] = 0;
                v63 = 1;
              }
              if (v8[800])
                v64 = v63;
              else
                v64 = 1;
              v8[3709] = v64;
              if (*((_QWORD *)a1 + 700))
              {
                sub_21B880DA8((uint64_t)v68, (_QWORD *)a1 + 695);
                v65 = sub_21B87EFB0(v68);
                sub_21B880D14(v68);
                if (!v8[3709])
                {
LABEL_103:
                  if (v64)
                  {
                    if (v8[801])
                    {
                      sub_21B88999C((uint64_t)a1);
                      v8[801] = 0;
                      *((_QWORD *)a1 + 870) = 0;
                    }
                  }
                  return;
                }
              }
              else
              {
                v65 = 0.0;
                if (!v64)
                  goto LABEL_103;
              }
              if (v8[3708] && v65 < 0.7854 && *((float *)a1 + 2468) > 5.0)
              {
                sub_21B88999C((uint64_t)a1);
                v8[3708] = 0;
                v8[801] = 0;
                *((_QWORD *)a1 + 870) = 0;
                if (qword_25518E1D0 != -1)
                  dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
                v66 = qword_25518E1D8;
                if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
                {
                  v67 = *((float *)a1 + 2468);
                  *(_DWORD *)buf = 134349312;
                  *(_QWORD *)&buf[4] = a2;
                  *(_WORD *)&buf[12] = 2050;
                  *(double *)&buf[14] = v67;
                  _os_log_impl(&dword_21B72A000, v66, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] Performed soft reset on the first hover-or-out opportunity. Timestamp: %{public}llu us, durationFromSessionStartSeconds: %{public}.3f s", buf, 0x16u);
                }
              }
              goto LABEL_103;
            }
          }
          else
          {
            v21 = 0;
          }
LABEL_63:
          v50 = *((unsigned int *)a1 + 759);
          v51 = v10 + (unint64_t)v9;
          if (v51 >= v50)
            v52 = *((unsigned int *)a1 + 759);
          else
            v52 = 0;
          *(_QWORD *)&a1[4 * (v51 - v52) + 1520] = a2;
          if (v50 <= v9)
          {
            v53 = v10 + 1;
            if ((unint64_t)v10 + 1 >= v50)
              v54 = v50;
            else
              v54 = 0;
            a1[1516] = v53 - v54;
          }
          else
          {
            a1[1517] = v9 + 1;
          }
          sub_21B876D84(a1 + 1720, a3);
          goto LABEL_73;
        }
        goto LABEL_40;
      }
    }
    else
    {
      v29 = 0;
      if (!a1[1517])
        goto LABEL_27;
    }
    LOWORD(v17) = v17 - 1;
    a1[1517] = v17;
    if (a1[1721])
      --a1[1721];
    goto LABEL_27;
  }
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
  v22 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
  {
    v23 = a1[1516] + (unint64_t)a1[1517] - 1;
    v24 = *((unsigned int *)a1 + 759);
    if (v23 < v24)
      v24 = 0;
    v25 = *(_QWORD *)&v11[4 * (v23 - v24)];
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_21B72A000, v22, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] SrcDM timestamp must be greater than the last value. Input: %llu us, last: %llu us", buf, 0x16u);
  }
}

void sub_21B889770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  sub_21B880D14(&a9);
  _Unwind_Resume(a1);
}

void sub_21B8897A4(unsigned __int16 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v5;
  unsigned __int16 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v5 = a1[1];
  if (a1[1])
  {
    v8 = a1 + 4;
    v9 = *a1;
    v10 = v5 + v9 - 1;
    v11 = *((unsigned int *)a1 + 1);
    if (v10 < v11)
      v11 = 0;
    if (*(_QWORD *)&v8[4 * (v10 - v11)] >= a2 && *(_QWORD *)&v8[4 * v9] < a3)
    {
      v13 = v5 - 1;
      do
      {
        v14 = v13;
        if (!v13)
          break;
        v15 = (unint64_t *)sub_21B88A160(a1, v13);
        v13 = v14 - 1;
      }
      while (*v15 >= a3);
      if (*(_QWORD *)sub_21B88A160(a1, v14) > a2)
      {
        v16 = v14 + 1;
        while (1)
        {
          v17 = v16 - 1;
          if (v16 == 1)
            break;
          v18 = (unint64_t *)sub_21B88A160(a1, v16 - 2);
          v16 = v17;
          if (*v18 <= a2)
          {
            if (v17 > v14)
              return;
            goto LABEL_14;
          }
        }
        do
        {
LABEL_14:
          v19 = (_QWORD *)sub_21B88A160(a1, v17);
          v20 = v19;
          v22 = a4[1];
          v21 = (unint64_t)a4[2];
          if ((unint64_t)v22 >= v21)
          {
            v24 = *a4;
            v25 = (v22 - *a4) >> 3;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 61)
              sub_21B796A0C();
            v27 = v21 - (_QWORD)v24;
            if (v27 >> 2 > v26)
              v26 = v27 >> 2;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
              v28 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v28 = v26;
            if (v28)
            {
              v29 = (char *)sub_21B796A20((uint64_t)(a4 + 2), v28);
              v24 = *a4;
              v22 = a4[1];
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[8 * v25];
            *(_QWORD *)v30 = *v20;
            v23 = v30 + 8;
            while (v22 != v24)
            {
              v31 = *((_QWORD *)v22 - 1);
              v22 -= 8;
              *((_QWORD *)v30 - 1) = v31;
              v30 -= 8;
            }
            *a4 = v30;
            a4[1] = v23;
            a4[2] = &v29[8 * v28];
            if (v24)
              operator delete(v24);
          }
          else
          {
            *(_QWORD *)v22 = *v19;
            v23 = v22 + 8;
          }
          a4[1] = v23;
          ++v17;
        }
        while (v17 <= v14);
      }
    }
  }
}

void sub_21B88997C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B88999C(uint64_t result)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  float32x4_t v6;
  float32x4_t v7;

  v1 = (_BYTE *)(result + 6704);
  if (*(_BYTE *)(result + 6921))
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 6912);
    if (v3)
    {
      if (*v1)
      {
        v4 = *(_QWORD *)(result + 6728);
        if (v4 <= v3)
          v5 = v3 - v4;
        else
          v5 = v4 - v3;
        if (v5 <= 0x30D40)
        {
          *(double *)v6.i64 = sub_21B879774(result + 6704);
          sub_21B892E6C(v2 + 6896, (float *)(v2 + 6924), &v7, v6);
          sub_21B87943C((uint64_t)v1, &v7, *(_QWORD *)(v2 + 6912), 0.0017453, 0.017453);
          result = sub_21B88E3C4(v2 + 6176);
          *(_QWORD *)(v2 + 6792) = *(_QWORD *)(v2 + 6912);
        }
      }
    }
  }
  return result;
}

void sub_21B889A58(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD *v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  void *v67;
  _BYTE *v68;
  void *v69;
  void *v70;
  void *v71;
  char *v72;
  char *v73;
  void *__p;
  char *v75;
  char *v76;
  void *v77;
  char *v78;
  char *v79;
  void *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;

  v83 = 0;
  v84 = 0;
  v85 = 0;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  v77 = 0;
  v78 = 0;
  v79 = 0;
  __p = 0;
  v75 = 0;
  v76 = 0;
  sub_21B88A0CC(&__p, *(unsigned __int16 *)(a1 + 2));
  if (*(_WORD *)(a1 + 2))
  {
    v4 = 0;
    do
    {
      v5 = (_QWORD *)sub_21B88A160((unsigned __int16 *)a1, v4);
      v6 = v5;
      v7 = v75;
      if (v75 >= v76)
      {
        v9 = (char *)__p;
        v10 = (v75 - (_BYTE *)__p) >> 3;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61)
          sub_21B796A0C();
        v12 = v76 - (_BYTE *)__p;
        if ((v76 - (_BYTE *)__p) >> 2 > v11)
          v11 = v12 >> 2;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
        {
          v14 = (char *)sub_21B796A20((uint64_t)&v76, v13);
          v9 = (char *)__p;
          v7 = v75;
        }
        else
        {
          v14 = 0;
        }
        v15 = &v14[8 * v10];
        *(_QWORD *)v15 = *v6;
        v8 = v15 + 8;
        while (v7 != v9)
        {
          v16 = *((_QWORD *)v7 - 1);
          v7 -= 8;
          *((_QWORD *)v15 - 1) = v16;
          v15 -= 8;
        }
        __p = v15;
        v75 = v8;
        v76 = &v14[8 * v13];
        if (v9)
          operator delete(v9);
      }
      else
      {
        *(_QWORD *)v75 = *v5;
        v8 = v7 + 8;
      }
      v75 = v8;
      ++v4;
    }
    while (v4 < *(unsigned __int16 *)(a1 + 2));
  }
  v71 = 0;
  v72 = 0;
  v73 = 0;
  sub_21B88A0CC(&v71, *(unsigned __int16 *)(a1 + 3034));
  if (*(_WORD *)(a1 + 3034))
  {
    v17 = 0;
    do
    {
      v18 = (_QWORD *)sub_21B88A160((unsigned __int16 *)(a1 + 3032), v17);
      v19 = v18;
      v20 = v72;
      if (v72 >= v73)
      {
        v22 = (char *)v71;
        v23 = (v72 - (_BYTE *)v71) >> 3;
        v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61)
          sub_21B796A0C();
        v25 = v73 - (_BYTE *)v71;
        if ((v73 - (_BYTE *)v71) >> 2 > v24)
          v24 = v25 >> 2;
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v24;
        if (v26)
        {
          v27 = (char *)sub_21B796A20((uint64_t)&v73, v26);
          v22 = (char *)v71;
          v20 = v72;
        }
        else
        {
          v27 = 0;
        }
        v28 = &v27[8 * v23];
        *(_QWORD *)v28 = *v19;
        v21 = v28 + 8;
        while (v20 != v22)
        {
          v29 = *((_QWORD *)v20 - 1);
          v20 -= 8;
          *((_QWORD *)v28 - 1) = v29;
          v28 -= 8;
        }
        v71 = v28;
        v72 = v21;
        v73 = &v27[8 * v26];
        if (v22)
          operator delete(v22);
      }
      else
      {
        *(_QWORD *)v72 = *v18;
        v21 = v20 + 8;
      }
      v72 = v21;
      ++v17;
    }
    while (v17 < *(unsigned __int16 *)(a1 + 3034));
  }
  sub_21B88A274((uint64_t **)&v71, (uint64_t **)&__p, &v67);
  if (v67 != v68)
  {
    v30 = *(unsigned __int16 *)(a1 + 4344) + (unint64_t)*(unsigned __int16 *)(a1 + 4346) - 1;
    v31 = *(unsigned int *)(a1 + 4348);
    if (v30 < v31)
      v31 = 0;
    if (*(_QWORD *)(a1 + 4344 + 8 * (v30 - v31) + 8) >= *((_QWORD *)v71 + *(_QWORD *)v67) && *(_WORD *)(a1 + 4346))
    {
      v32 = 0;
      v33 = 0;
      do
      {
        if (v32 >= (v68 - (_BYTE *)v67) >> 3)
          break;
        v34 = (_QWORD *)sub_21B88A160((unsigned __int16 *)(a1 + 4344), v33);
        if (*v34 == *((_QWORD *)v71 + *((_QWORD *)v67 + v32)))
        {
          v35 = v78;
          if (v78 >= v79)
          {
            v37 = (char *)v77;
            v38 = (v78 - (_BYTE *)v77) >> 3;
            v39 = v38 + 1;
            if ((unint64_t)(v38 + 1) >> 61)
              goto LABEL_115;
            v40 = v79 - (_BYTE *)v77;
            if ((v79 - (_BYTE *)v77) >> 2 > v39)
              v39 = v40 >> 2;
            if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
              v41 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v41 = v39;
            if (v41)
            {
              v42 = (char *)sub_21B796A20((uint64_t)&v79, v41);
              v37 = (char *)v77;
              v35 = v78;
            }
            else
            {
              v42 = 0;
            }
            v43 = (unint64_t *)&v42[8 * v38];
            *v43 = v33;
            v36 = (char *)(v43 + 1);
            while (v35 != v37)
            {
              v44 = *((_QWORD *)v35 - 1);
              v35 -= 8;
              *--v43 = v44;
            }
            v77 = v43;
            v78 = v36;
            v79 = &v42[8 * v41];
            if (v37)
              operator delete(v37);
          }
          else
          {
            *(_QWORD *)v78 = v33;
            v36 = v35 + 8;
          }
          v78 = v36;
          v45 = v67;
          v46 = v81;
          if (v81 >= v82)
          {
            v48 = (char *)v80;
            v49 = (v81 - (_BYTE *)v80) >> 3;
            v50 = v49 + 1;
            if ((unint64_t)(v49 + 1) >> 61)
              goto LABEL_115;
            v51 = v82 - (_BYTE *)v80;
            if ((v82 - (_BYTE *)v80) >> 2 > v50)
              v50 = v51 >> 2;
            if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8)
              v52 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v52 = v50;
            if (v52)
            {
              v53 = (char *)sub_21B796A20((uint64_t)&v82, v52);
              v48 = (char *)v80;
              v46 = v81;
            }
            else
            {
              v53 = 0;
            }
            v54 = &v53[8 * v49];
            *(_QWORD *)v54 = v45[v32];
            v47 = v54 + 8;
            while (v46 != v48)
            {
              v55 = *((_QWORD *)v46 - 1);
              v46 -= 8;
              *((_QWORD *)v54 - 1) = v55;
              v54 -= 8;
            }
            v80 = v54;
            v81 = v47;
            v82 = &v53[8 * v52];
            if (v48)
              operator delete(v48);
          }
          else
          {
            *(_QWORD *)v81 = *((_QWORD *)v67 + v32);
            v47 = v46 + 8;
          }
          v81 = v47;
          v56 = v69;
          v57 = v84;
          if (v84 >= v85)
          {
            v59 = v83;
            v60 = (v84 - v83) >> 3;
            v61 = v60 + 1;
            if ((unint64_t)(v60 + 1) >> 61)
LABEL_115:
              sub_21B796A0C();
            v62 = v85 - v83;
            if ((v85 - v83) >> 2 > v61)
              v61 = v62 >> 2;
            if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v61;
            if (v63)
            {
              v64 = (char *)sub_21B796A20((uint64_t)&v85, v63);
              v59 = v83;
              v57 = v84;
            }
            else
            {
              v64 = 0;
            }
            v65 = &v64[8 * v60];
            *(_QWORD *)v65 = v56[v32];
            v58 = v65 + 8;
            while (v57 != v59)
            {
              v66 = *((_QWORD *)v57 - 1);
              v57 -= 8;
              *((_QWORD *)v65 - 1) = v66;
              v65 -= 8;
            }
            v83 = v65;
            v84 = v58;
            v85 = &v64[8 * v63];
            if (v59)
              operator delete(v59);
          }
          else
          {
            *(_QWORD *)v84 = *((_QWORD *)v69 + v32);
            v58 = v57 + 8;
          }
          v84 = v58;
          ++v32;
        }
        ++v33;
      }
      while (v33 < *(unsigned __int16 *)(a1 + 4346));
    }
  }
  sub_21B88BB9C(a2, (uint64_t)&v83, (uint64_t)&v80, (uint64_t)&v77);
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  if (v67)
  {
    v68 = v67;
    operator delete(v67);
  }
  if (v71)
  {
    v72 = (char *)v71;
    operator delete(v71);
  }
  if (__p)
  {
    v75 = (char *)__p;
    operator delete(__p);
  }
  if (v77)
  {
    v78 = (char *)v77;
    operator delete(v77);
  }
  if (v80)
  {
    v81 = (char *)v80;
    operator delete(v80);
  }
  if (v83)
  {
    v84 = v83;
    operator delete(v83);
  }
}

void sub_21B88A03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27)
{
  uint64_t v27;
  void *v29;

  sub_21B88A63C((uint64_t)&a11);
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a20)
  {
    a21 = (uint64_t)a20;
    operator delete(a20);
  }
  if (a23)
  {
    a24 = (uint64_t)a23;
    operator delete(a23);
  }
  if (a26)
  {
    a27 = (uint64_t)a26;
    operator delete(a26);
  }
  v29 = *(void **)(v27 - 112);
  if (v29)
  {
    *(_QWORD *)(v27 - 104) = v29;
    operator delete(v29);
  }
  _Unwind_Resume(a1);
}

void sub_21B88A0CC(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_21B796A0C();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_21B796A20(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t sub_21B88A160(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AC68);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[4 * (v5 - v4) + 4];
}

void sub_21B88A274(uint64_t **a1@<X0>, uint64_t **a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  int v16;
  unint64_t v17;
  char *v18;
  void *v19;
  char *v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  unint64_t *v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  int v32;
  char *v33;
  void *v34;
  char *v35;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  unint64_t *v41;
  unint64_t v42;
  BOOL v43;
  uint64_t *v44;
  uint64_t *v45;
  _BYTE *v46;
  _BYTE *v47;
  uint64_t v48;
  void *v49[2];
  char *v50;
  void *__p[2];
  char *v52;
  uint64_t *v53;

  __p[0] = 0;
  __p[1] = 0;
  v52 = 0;
  v49[0] = 0;
  v49[1] = 0;
  v50 = 0;
  v6 = *a1;
  v7 = a1[1];
  if (v6 == v7 || (v8 = *a2, v9 = a2[1], *a2 == v9))
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    a3[3] = 0;
    __p[1] = 0;
    v52 = 0;
    __p[0] = 0;
    a3[4] = 0;
    a3[5] = 0;
    goto LABEL_58;
  }
  v46 = 0;
  v47 = 0;
  v48 = 0;
  sub_21B88BF30(v6, v7, v8, v9, (uint64_t)&v46, &v53);
  v10 = v46;
  if (v46 == v47)
  {
    *(_OWORD *)a3 = *(_OWORD *)__p;
    a3[2] = v52;
    __p[1] = 0;
    v52 = 0;
    __p[0] = 0;
    *(_OWORD *)(a3 + 3) = *(_OWORD *)v49;
    a3[5] = v50;
    v49[0] = 0;
    v49[1] = 0;
    v50 = 0;
    if (!v10)
      goto LABEL_58;
    goto LABEL_56;
  }
  v11 = (v47 - v46) >> 3;
  v44 = *a2;
  v45 = a2[1];
  v12 = (char *)a1[1] - (char *)*a1;
  if (v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = v12 >> 3;
    do
    {
      if ((*a1)[v14] == *(_QWORD *)&v46[8 * v13])
      {
        v18 = (char *)__p[1];
        if (__p[1] >= v52)
        {
          v20 = (char *)__p[0];
          v21 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 61)
            sub_21B796A0C();
          v23 = v52 - (char *)__p[0];
          if ((v52 - (char *)__p[0]) >> 2 > v22)
            v22 = v23 >> 2;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
            v24 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v24 = v22;
          if (v24)
          {
            v25 = (char *)sub_21B796A20((uint64_t)&v52, v24);
            v20 = (char *)__p[0];
            v18 = (char *)__p[1];
          }
          else
          {
            v25 = 0;
          }
          v26 = (unint64_t *)&v25[8 * v21];
          *v26 = v14;
          v19 = v26 + 1;
          while (v18 != v20)
          {
            v27 = *((_QWORD *)v18 - 1);
            v18 -= 8;
            *--v26 = v27;
          }
          __p[0] = v26;
          __p[1] = v19;
          v52 = &v25[8 * v24];
          if (v20)
            operator delete(v20);
        }
        else
        {
          *(_QWORD *)__p[1] = v14;
          v19 = v18 + 8;
        }
        __p[1] = v19;
        ++v15;
      }
      v14 = (v16 + 1);
      v13 = v15;
      v28 = v17 > v14 && v11 > v15;
      ++v16;
    }
    while (v28);
  }
  if (v45 != v44)
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    do
    {
      if ((*a2)[v30] == *(_QWORD *)&v46[8 * v29])
      {
        v33 = (char *)v49[1];
        if (v49[1] >= v50)
        {
          v35 = (char *)v49[0];
          v36 = ((char *)v49[1] - (char *)v49[0]) >> 3;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 61)
            sub_21B796A0C();
          v38 = v50 - (char *)v49[0];
          if ((v50 - (char *)v49[0]) >> 2 > v37)
            v37 = v38 >> 2;
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
            v39 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v39 = v37;
          if (v39)
          {
            v40 = (char *)sub_21B796A20((uint64_t)&v50, v39);
            v35 = (char *)v49[0];
            v33 = (char *)v49[1];
          }
          else
          {
            v40 = 0;
          }
          v41 = (unint64_t *)&v40[8 * v36];
          *v41 = v30;
          v34 = v41 + 1;
          while (v33 != v35)
          {
            v42 = *((_QWORD *)v33 - 1);
            v33 -= 8;
            *--v41 = v42;
          }
          v49[0] = v41;
          v49[1] = v34;
          v50 = &v40[8 * v39];
          if (v35)
            operator delete(v35);
        }
        else
        {
          *(_QWORD *)v49[1] = v30;
          v34 = v33 + 8;
        }
        v49[1] = v34;
        ++v31;
      }
      v30 = (v32 + 1);
      v29 = v31;
      v43 = v45 - v44 > v30 && v11 > v31;
      ++v32;
    }
    while (v43);
  }
  *(_OWORD *)a3 = *(_OWORD *)__p;
  a3[2] = v52;
  __p[1] = 0;
  v52 = 0;
  __p[0] = 0;
  *(_OWORD *)(a3 + 3) = *(_OWORD *)v49;
  a3[5] = v50;
  v49[0] = 0;
  v49[1] = 0;
  v50 = 0;
  v10 = v46;
  if (v46)
  {
LABEL_56:
    v47 = v10;
    operator delete(v10);
    if (v49[0])
    {
      v49[1] = v49[0];
      operator delete(v49[0]);
    }
  }
LABEL_58:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_21B88A5F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  if (a15)
    operator delete(a15);
  if (a19)
    operator delete(a19);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B88A63C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

uint64_t sub_21B88A67C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v3;
    operator delete(v3);
  }
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
  }
  return a1;
}

void sub_21B88A6CC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  float32x2_t *v12;
  float32x2_t *v13;
  char v14;
  float32x2_t *v15;
  float32x2_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  float32x2_t *v24;
  float32x4_t v25;
  __int128 *v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;
  float v35;
  float v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  unint64_t v42;
  float *v43;
  float32x4_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  _BOOL4 v52;
  _BOOL4 v53;
  unint64_t v54;
  float *v55;
  float *v56;
  float32x2_t *v57;
  float v58;
  float32x2_t *v59;
  uint64_t v60;
  float v61;
  float v62;
  uint64_t i;
  uint64_t v64;
  float v65;
  float v66;
  BOOL v67;
  float v68;
  unsigned __int16 *v69;
  char v70;
  unint64_t v71;
  uint64_t v72;
  unsigned __int16 *v73;
  uint64_t v74;
  unsigned __int16 *v75;
  unsigned __int16 *v76;
  uint64_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  _QWORD v81[6];
  _QWORD v82[6];
  float32x2_t v83;
  float v84;
  float32x4_t v85;
  float32x4_t v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[8];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  void *__p;
  _BYTE buf[22];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  sub_21B88AF04((unsigned __int16 *)a1, (uint64_t)v89);
  if (v89[0])
  {
    v2 = v92;
    v74 = v90;
    *(_QWORD *)&v88 = 0;
    *((_QWORD *)&v88 + 1) = 0x3F80000000000000;
    *(_QWORD *)&v87 = 0;
    *((_QWORD *)&v87 + 1) = 0x3F80000000000000;
    v86.i64[0] = 0;
    v86.i64[1] = 0x3F80000000000000;
    v85.i64[0] = 0;
    v85.i64[1] = 0x3F80000000000000;
    if (*(_WORD *)(a1 + 3034))
    {
      if (*(_WORD *)(a1 + 4346))
      {
        v3 = *(unsigned __int16 *)(a1 + 3034) + (unint64_t)*(unsigned __int16 *)(a1 + 3032) - 1;
        v4 = *(unsigned int *)(a1 + 3036);
        if (v3 < v4)
          v4 = 0;
        v5 = *(_DWORD *)(a1 + 3032 + 8 * (v3 - v4) + 8);
        v6 = *(_DWORD *)(a1 + 6944);
        if (*(_QWORD *)(a1 + 5600) < 5uLL)
        {
          v7 = 1;
        }
        else
        {
          sub_21B880DA8((uint64_t)v82, (_QWORD *)(a1 + 5560));
          v7 = sub_21B87EFB0(v82) >= 0.087266;
          sub_21B880D14(v82);
        }
        if (*(_QWORD *)(a1 + 4288) < 5uLL)
        {
          v8 = 1;
        }
        else
        {
          sub_21B880DA8((uint64_t)v81, (_QWORD *)(a1 + 4248));
          v8 = sub_21B87EFB0(v81) >= 0.087266;
          sub_21B880D14(v81);
        }
        v9 = v2 + 1;
        if (v2 + 1 != v74)
        {
          v10 = 0;
          v11 = v9 - v74;
          v75 = (unsigned __int16 *)(a1 + 4344);
          v76 = (unsigned __int16 *)(a1 + 3032);
          v67 = (v5 - v6) > 0x4C4B3F;
          v73 = (unsigned __int16 *)(a1 + 3440);
          v77 = a1 + 6176;
          v12 = (float32x2_t *)(a1 + 6704);
          v13 = (float32x2_t *)(a1 + 6776);
          v14 = v67 || v7;
          v70 = v14 | v8;
          v69 = (unsigned __int16 *)(a1 + 968);
          v72 = v91;
          if (v11 <= 1)
            v11 = 1;
          v71 = v11;
          while (1)
          {
            v15 = v12;
            v16 = v13;
            v17 = v74 + v10;
            v18 = v72 + v10;
            v19 = *(_QWORD *)sub_21B88A160(v75, v74 + v10);
            v20 = *(_QWORD *)sub_21B88A160(v75, v74 + v10);
            if (v20 != *(_QWORD *)sub_21B88A160(v76, v72 + v10))
            {
              if (qword_25518E1D0 != -1)
                dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
              v21 = qword_25518E1D8;
              if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_ERROR))
              {
                v22 = *(_QWORD *)sub_21B88A160(v75, v17);
                v23 = *(_QWORD *)sub_21B88A160(v76, v18);
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v22;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v23;
                _os_log_impl(&dword_21B72A000, v21, OS_LOG_TYPE_ERROR, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] aux timestamp: %llu us does not match the src timestamp: %llu", buf, 0x16u);
              }
            }
            v24 = (float32x2_t *)sub_21B878848(v73, v18);
            sub_21B892ECC(v24, (float32x4_t *)buf, v25);
            v88 = *(_OWORD *)buf;
            v26 = (__int128 *)sub_21B878848((unsigned __int16 *)(a1 + 4752), v17);
            if (&v87 != v26)
              v87 = *v26;
            v27 = sub_21B88F624(v77, (float32x4_t *)buf);
            *(double *)v28.i64 = sub_21B892E6C((uint64_t)&v87, (float *)buf, &v78, v27);
            *(double *)v29.i64 = sub_21B892E6C((uint64_t)&v78, (float *)&v88, &v79, v28);
            sub_21B892ECC((float32x2_t *)&v79, &v80, v29);
            v86 = v80;
            v12 = v15;
            if (!v15->i8[0])
              break;
            v13 = v16;
            *(double *)v30.i64 = sub_21B892ECC(v16, &v79, v80);
            sub_21B892E6C((uint64_t)&v86, v79.f32, &v80, v30);
            v85 = v80;
            v31 = (float)(v19 - *(_QWORD *)(a1 + 6792)) * 0.000001;
            if (v31 >= 0.0000001)
            {
              v83.f32[0] = sub_21B893300(&v85) / v31;
              v83.f32[1] = v32 / v31;
              v84 = v33 / v31;
              if ((v70 & 1) == 0)
              {
                v84 = 0.0;
                v83 = 0;
              }
              sub_21B879798(v15, &v83, v19);
              sub_21B88F4DC(v77, v19);
              v34 = 0;
              v35 = 0.0;
              do
              {
                v35 = v35 + (float)(v83.f32[v34] * v83.f32[v34]);
                ++v34;
              }
              while (v34 != 3);
              v36 = sqrtf(v35);
              v37 = *(unsigned __int16 *)(a1 + 5658);
              v38 = *(unsigned int *)(a1 + 5660);
              v39 = *(unsigned __int16 *)(a1 + 5656);
              if (v39 + v37 >= v38)
                v40 = *(unsigned int *)(a1 + 5660);
              else
                v40 = 0;
              *(float *)(a1 + 5664 + 4 * (v39 + v37 - v40)) = v36;
              if (v38 <= v37)
              {
                if (v39 + 1 < v38)
                  LOWORD(v38) = 0;
                *(_WORD *)(a1 + 5656) = v39 + 1 - v38;
              }
              else
              {
                *(_WORD *)(a1 + 5658) = v37 + 1;
              }
              if (v93)
              {
                v41 = (int *)__p;
                v42 = *((int *)__p + v10);
                if ((_DWORD)v42 == -1)
                {
                  v53 = 0;
                }
                else
                {
                  v43 = (float *)sub_21B88A160(v69, v42);
                  sub_21B892ECC((float32x2_t *)(a1 + 6708), &v80, v44);
                  v45 = sub_21B87CDC4(v80.f32);
                  v47 = fmodf((float)(v46 - v43[1]) + 3.1416, 6.2832);
                  if (v47 < 0.0)
                    v47 = v47 + 6.2832;
                  v48 = fabsf(v47 + -3.1416);
                  v49 = *v43;
                  v50 = fmodf((float)(v45 - *v43) + 3.1416, 6.2832);
                  if (v50 < 0.0)
                    v50 = v50 + 6.2832;
                  v51 = fabsf(v50 + -3.1416);
                  v52 = v49 > 0.17453;
                  if (v48 <= 0.7854)
                    v52 = 0;
                  v53 = v51 < 0.17453 && v52;
                }
                if (*(_BYTE *)(a1 + 6472) || v53)
                {
                  v54 = v41[v10];
                  if ((_DWORD)v54 != -1)
                  {
                    v55 = (float *)sub_21B88A160(v69, v41[v10]);
                    if (*v55 > 0.17453)
                    {
                      v56 = v55;
                      v57 = (float32x2_t *)sub_21B88A160((unsigned __int16 *)(a1 + 1936), v54);
                      v58 = 9.0;
                      if (v53)
                        v58 = 1.0;
                      *(float32x2_t *)v80.f32 = vmul_n_f32(*v57, v58);
                      v59 = (float32x2_t *)sub_21B878848(v73, v18);
                      sub_21B88F4E4(v77, v56, v80.f32, v59, (float32x2_t *)&v87, v19);
                      v60 = *(_QWORD *)(a1 + 5600);
                      v61 = 0.0;
                      v62 = 0.0;
                      if (v60)
                        v62 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 5568)
                                                   + (((unint64_t)(v60 + *(_QWORD *)(a1 + 5592) - 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                                       + 4 * ((v60 + *(_QWORD *)(a1 + 5592) - 1) & 0x3FF));
                      for (i = 0; i != 3; ++i)
                        v61 = v61 + (float)(v83.f32[i] * v83.f32[i]);
                      if (sqrtf(v61) < 0.87266 && v62 < 0.87266)
                      {
                        v64 = 0;
                        v65 = 0.0;
                        do
                        {
                          v65 = v65 + (float)(v83.f32[v64] * v83.f32[v64]);
                          ++v64;
                        }
                        while (v64 != 3);
                        v66 = sqrtf(v65);
                        v67 = v62 <= 0.5236 && v66 <= 0.5236;
                        v68 = 9.0;
                        if (v67)
                          v68 = 1.0;
                        *(float32x2_t *)v79.f32 = vmul_n_f32(*(float32x2_t *)v80.f32, v68);
                        sub_21B87A29C((uint64_t)v15, v56, (uint64_t)&v79, v19);
                      }
                    }
                  }
                }
              }
              goto LABEL_77;
            }
LABEL_80:
            if (++v10 == v71)
              goto LABEL_13;
          }
          sub_21B879774((uint64_t)v15);
          sub_21B87943C((uint64_t)v15, &v86, v19, 0.0017453, 0.017453);
LABEL_77:
          v13 = v16;
          if (v16 != (float32x2_t *)&v86)
            *(float32x4_t *)v16->f32 = v86;
          *(_QWORD *)(a1 + 6792) = v19;
          v12 = v15;
          goto LABEL_80;
        }
      }
    }
  }
LABEL_13:
  if (__p)
    operator delete(__p);
}

void sub_21B88AE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_21B88AF04(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int16 *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 *v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unsigned __int16 *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  int v42;
  _DWORD *v43;
  _DWORD *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  _BYTE buf[24];
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_BYTE *)a2 = 0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_BYTE *)(a2 + 40) = 0;
  if (!*((_BYTE *)a1 + 6176) || !a1[2173] || !a1[1517])
    return;
  v4 = a1 + 2176;
  v5 = a1[2173] + (unint64_t)a1[2172] - 1;
  v6 = *((unsigned int *)a1 + 1087);
  if (v5 < v6)
    v6 = 0;
  v7 = *(_QWORD *)&v4[4 * (v5 - v6)];
  v8 = a1[1516];
  if (v7 < *(_QWORD *)&a1[4 * v8 + 1520])
    return;
  v9 = *((_QWORD *)a1 + 849);
  if (v7 <= v9)
    return;
  v10 = a1[1517] + v8 - 1;
  v11 = *((unsigned int *)a1 + 759);
  if (v10 < v11)
    v11 = 0;
  if (*(_QWORD *)&a1[4 * (v10 - v11) + 1520] <= v9)
    return;
  v12 = 0;
  v13 = a1 + 2172;
  do
  {
    v14 = (_QWORD *)sub_21B88A160(a1 + 1516, v12);
    v15 = a1[1517];
    if (*v14 >= *(_QWORD *)&v4[4 * a1[2172]])
      break;
    ++v12;
  }
  while (v12 < v15);
  if (v12 == v15)
    return;
  LODWORD(v16) = a1[2173];
  if (a1[2173])
  {
    v17 = 0;
    do
    {
      v18 = *(_QWORD *)sub_21B88A160(a1 + 2172, v17);
      v19 = (unint64_t *)sub_21B88A160(a1 + 1516, v12);
      v16 = a1[2173];
      if (v18 >= *v19)
        break;
      ++v17;
    }
    while (v17 < v16);
  }
  else
  {
    v17 = 0;
  }
  if (v17 == v16)
    return;
  v20 = *(_QWORD *)sub_21B88A160(a1 + 2172, v17);
  if (v20 != *(_QWORD *)sub_21B88A160(a1 + 1516, v12))
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
    v23 = qword_25518E1D8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
      return;
    goto LABEL_32;
  }
  v21 = a1[2173];
  if (v17 < v21)
  {
    while (v12 < a1[1517])
    {
      v22 = (_QWORD *)sub_21B88A160(a1 + 2172, v17);
      v21 = a1[2173];
      if (*v22 > *((_QWORD *)a1 + 849))
        break;
      ++v17;
      ++v12;
      if (v17 >= v21)
        break;
    }
    v21 = v21;
  }
  if (v17 == v21 || v12 == a1[1517])
    return;
  v27 = *(_QWORD *)sub_21B88A160(a1 + 2172, v17);
  if (v27 != *(_QWORD *)sub_21B88A160(a1 + 1516, v12))
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
    v23 = qword_25518E1D8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
      return;
LABEL_32:
    v24 = *(_QWORD *)sub_21B88A160(a1 + 1516, v12);
    v25 = *(_QWORD *)sub_21B88A160(v13, v17);
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2048;
    v53 = v17;
    v54 = 2048;
    v55 = v25;
    v26 = "[BarrelRoll]:[CMABarrelRoll]:[getPastMEKFUpdateIndices] Unexpected timestamp mismatch.indSrc: %zu, src: %llu, "
          "indAux: %zu, aux: %llu";
    goto LABEL_33;
  }
  v28 = v17;
  v29 = v12;
  if (v17 < a1[2173])
  {
    v29 = v12;
    v28 = v17;
    while (v29 < a1[1517])
    {
      v30 = *(_QWORD *)sub_21B88A160(a1 + 2172, v28);
      if (v30 != *(_QWORD *)sub_21B88A160(a1 + 1516, v29))
        break;
      ++v28;
      ++v29;
      if (v28 >= a1[2173])
        goto LABEL_51;
    }
  }
  if (v28 && v29)
  {
LABEL_51:
    v31 = v28 - 1;
    v32 = v29 - 1;
    v33 = v31 - v17;
    if (v31 < v17 || v32 < v12)
    {
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
      v23 = qword_25518E1D8;
      if (!os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
        return;
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2048;
      v53 = v32;
      v54 = 2048;
      v55 = v12;
      v26 = "[BarrelRoll]:[CMABarrelRoll]:[getPastMEKFUpdateIndices] Unexpected index order.lastAuxInd: %zu, firstAuxInd:"
            " %zu, lastSrcInd: %zu, firstSrcInd: %zu";
    }
    else
    {
      if (v33 == v32 - v12)
      {
        *(_BYTE *)a2 = 1;
        *(_QWORD *)(a2 + 8) = v17;
        *(_QWORD *)(a2 + 16) = v12;
        *(_QWORD *)(a2 + 24) = v31;
        *(_QWORD *)(a2 + 32) = v32;
        if (a1[1])
        {
          v34 = *(_QWORD *)sub_21B88A160(a1 + 2172, v17);
          v35 = a1 + 4;
          v36 = *a1 + (unint64_t)a1[1] - 1;
          v37 = *((unsigned int *)a1 + 1);
          if (v36 < v37)
            v37 = 0;
          if (v34 <= *(_QWORD *)&v35[4 * (v36 - v37)]
            && *(_QWORD *)sub_21B88A160(a1 + 2172, v31) >= *(_QWORD *)&v35[4 * *a1]
            && a1[1])
          {
            v38 = 0;
            do
            {
              v39 = *(_QWORD *)sub_21B88A160(a1, v38);
              v40 = (unint64_t *)sub_21B88A160(a1 + 1516, v12);
              v41 = a1[1];
              if (v39 >= *v40)
                break;
              ++v38;
            }
            while (v38 < v41);
            if ((_DWORD)v38 != (_DWORD)v41)
            {
              v42 = v38;
              v51 = -1;
              sub_21B88C0C4(buf, v33 + 1, &v51);
              v43 = *(_DWORD **)buf;
              *(_QWORD *)(a2 + 48) = *(_QWORD *)buf;
              v44 = *(_DWORD **)&buf[8];
              *(_OWORD *)(a2 + 56) = *(_OWORD *)&buf[8];
              if (v44 != v43)
              {
                v45 = v44 - v43;
                if (v45 <= 1)
                  v45 = 1;
                v46 = v45 - 1;
                do
                {
                  v47 = v46;
                  v48 = *(_QWORD *)sub_21B88A160(a1 + 1516, v12);
                  v49 = v42;
                  if (v48 == *(_QWORD *)sub_21B88A160(a1, v42))
                  {
                    *v43 = v42++;
                    v49 = v42;
                  }
                  else
                  {
                    v50 = *(_QWORD *)sub_21B88A160(a1 + 1516, v12);
                    if (v50 > *(_QWORD *)sub_21B88A160(a1, v42))
                      break;
                  }
                  if (v49 == a1[1])
                    break;
                  v46 = v47 - 1;
                  ++v12;
                  ++v43;
                }
                while (v47);
              }
              *(_BYTE *)(a2 + 40) = 1;
            }
          }
        }
        return;
      }
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
      v23 = qword_25518E1D8;
      if (!os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
        return;
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2048;
      v53 = v32;
      v54 = 2048;
      v55 = v12;
      v26 = "[BarrelRoll]:[CMABarrelRoll]:[getPastMEKFUpdateIndices] Unexpected index delta.lastAuxInd: %zu, firstAuxInd:"
            " %zu, lastSrcInd: %zu, firstSrcInd: %zu";
    }
LABEL_33:
    _os_log_impl(&dword_21B72A000, v23, OS_LOG_TYPE_DEBUG, v26, buf, 0x2Au);
  }
}

uint64_t sub_21B88B5FC(unsigned __int16 *a1, float *a2, unint64_t *a3, float *a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned __int16 *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  unsigned __int16 *v16;
  uint64_t v17;
  float32x2_t *v18;
  float32x4_t v19;
  float32x4_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  float32x2_t *v32;
  float32x4_t v33;
  float32x4_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float32x4_t v42;
  float32x4_t v43;

  v4 = a1[2173];
  v5 = v4 - 3;
  if (v4 < 3)
    return 0;
  v10 = a1 + 2172;
  v11 = v4 - 1;
  v12 = *(_QWORD *)sub_21B88A160(a1 + 2172, v4 - 1);
  v13 = v4 - 2;
  v14 = *(_QWORD *)sub_21B88A160(v10, v13);
  v15 = (double)(v12 - v14) * 0.000001;
  if (v15 < 0.0000001)
    return 0;
  v16 = a1 + 2376;
  v17 = sub_21B878848(v16, v11);
  v18 = (float32x2_t *)sub_21B878848(v16, v13);
  *(double *)v20.i64 = sub_21B892ECC(v18, &v42, v19);
  sub_21B892E6C(v17, v42.f32, &v43, v20);
  v21 = sub_21B893300(&v43);
  v23 = v22;
  v25 = v24;
  v26 = *(_QWORD *)sub_21B88A160(v10, v5);
  v27 = (double)(v14 - v26) * 0.000001;
  if (v27 < 0.0000001)
    return 0;
  v28 = v25 / v15;
  v29 = v23 / v15;
  v30 = v21 / v15;
  v31 = sub_21B878848(v16, v13);
  v32 = (float32x2_t *)sub_21B878848(v16, v5);
  *(double *)v34.i64 = sub_21B892ECC(v32, &v42, v33);
  sub_21B892E6C(v31, v42.f32, &v43, v34);
  v35 = sub_21B893300(&v43) / v27;
  v37 = v36 / v27;
  v39 = v38 / v27;
  v40 = (double)(v12 - v26) * 0.000001;
  *a2 = (float)(v30 - v35) / v40;
  a2[1] = (float)(v29 - v37) / v40;
  a2[2] = (float)(v28 - v39) / v40;
  *a3 = (unint64_t)(v14 + v12) >> 1;
  *a4 = (float)(v30 + v35) * 0.5;
  a4[1] = (float)(v29 + v37) * 0.5;
  a4[2] = (float)(v28 + v39) * 0.5;
  return 1;
}

void sub_21B88B808(unsigned __int16 *a1, float32x2_t *a2, float32x4_t a3)
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  int v13;
  int v14;
  float v15;
  NSObject *v17;
  NSObject *v18;
  _DWORD v19[3];
  uint8_t buf[4];
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a1 + 6971;
  if (a1[1])
  {
    v5 = a1[1] + (unint64_t)*a1 - 1;
    v6 = *((unsigned int *)a1 + 1);
    if (v5 < v6)
      v6 = 0;
    v7 = *(double *)&a1[4 * (v5 - v6) + 4];
  }
  else
  {
    v7 = 0.0;
  }
  v8 = *((_QWORD *)a1 + 868);
  *(double *)a3.i64 = (double)(LODWORD(v7) - v8) * 0.000001;
  a3.f32[0] = *(double *)a3.i64;
  v9 = 0.0;
  if (*(_QWORD *)&v7 <= v8)
    v10 = 0.0;
  else
    v10 = a3.f32[0];
  a3.i32[0] = 15.0;
  if (v10 <= 15.0)
  {
    sub_21B892F24(a2, (uint64_t)(a1 + 3448), (float32x4_t *)buf, a3);
    v11 = sub_21B893300((float32x4_t *)buf);
    v12 = 0;
    *(float *)v19 = v11;
    v19[1] = v13;
    v19[2] = v14;
    do
    {
      v9 = v9 + (float)(*(float *)&v19[v12] * *(float *)&v19[v12]);
      ++v12;
    }
    while (v12 != 3);
    v15 = sqrtf(v9);
    if (v10 > 0.2 && v10 < 5.0)
    {
      if (v15 > 0.087266 && !*v4)
      {
        *v4 = 1;
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
        v17 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349312;
          v21 = v10;
          v22 = 2050;
          v23 = (float)(v15 * 57.296);
          _os_log_impl(&dword_21B72A000, v17, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[checkPencilDM6InitAnomaly] Detected cold start init anomaly. deltaFromSessionStartSeconds: %{public}.3f s, rollDeltaWillAndDidUpdateRad: %{public}.3f deg", buf, 0x16u);
        }
      }
    }
    else
    {
      *v4 = 0;
      if (v10 < 15.0 && v15 > 0.087266)
        sub_21B88E3C4((uint64_t)(a1 + 3088));
    }
    if (*v4 && !v4[2905])
    {
      v4[2905] = 1;
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AC28);
      v18 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        v21 = v7;
        v22 = 2050;
        v23 = v10;
        v24 = 2050;
        v25 = (float)(v15 * 57.296);
        _os_log_impl(&dword_21B72A000, v18, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMABarrelRoll]:[feedSrcDM] Will perform soft reset on the first hover-or-out opportunity. Timestamp: %{public}llu us, durationFromSessionStartSeconds: %{public}.3f s,  rollDeltaWillAndDidUpdateRad: %{public}.3f deg", buf, 0x20u);
      }
    }
  }
  else
  {
    *v4 = 0;
  }
}

void sub_21B88BADC(uint64_t a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;

  if (*(_BYTE *)(a1 + 6921))
  {
    v4 = *(float32x4_t *)(a1 + 6872);
    *a2 = v4;
    *(double *)v5.i64 = sub_21B892ECC((float32x2_t *)(a1 + 6924), &v7, v4);
    *(double *)v6.i64 = sub_21B892E6C((uint64_t)a2, v7.f32, &v8, v5);
    if (&v8 != a2)
    {
      v6 = v8;
      *a2 = v8;
    }
    sub_21B88B808((unsigned __int16 *)a1, (float32x2_t *)a2, v6);
  }
  else
  {
    a2->i64[0] = 0;
    a2->i64[1] = 0x3F80000000000000;
  }
}

os_log_t sub_21B88BB70()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

_QWORD *sub_21B88BB9C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_21B88BC58(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  sub_21B88BC58(a1 + 3, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 3);
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  sub_21B88BC58(a1 + 6, *(const void **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3);
  return a1;
}

void sub_21B88BC24(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;
  void *v5;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v4;
    operator delete(v4);
  }
  v5 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21B88BC58(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_21B7969CC(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B88BCB4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B88BCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

_QWORD *sub_21B88BD34(_QWORD *result, _QWORD *a2)
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

void sub_21B88BE9C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_21B72BAB8(a1);
}

uint64_t sub_21B88BEA8(uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0x400)
    a2 = 1;
  if (v2 < 0x800)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 1024;
  }
  return v4 ^ 1u;
}

os_log_t sub_21B88BF04()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

uint64_t *sub_21B88BF30@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t **a6@<X8>)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = a5;
  if (result != a2)
  {
    v9 = a3;
    if (a3 != a4)
    {
      v10 = result;
      do
      {
        if (*v10 >= (unint64_t)*v9)
        {
          if (*v9 >= (unint64_t)*v10)
            result = sub_21B88BFD8(&v11, v10++);
          ++v9;
        }
        else
        {
          ++v10;
        }
      }
      while (v10 != a2 && v9 != a4);
      a5 = v11;
    }
  }
  *a6 = a2;
  a6[1] = a4;
  a6[2] = (uint64_t *)a5;
  return result;
}

uint64_t *sub_21B88BFD8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = *a1;
  v5 = *(_QWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_QWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_21B796A0C();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)sub_21B796A20((uint64_t)v6, v12);
      v8 = *(_QWORD **)v4;
      v5 = *(_QWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(_QWORD *)v4 = v14;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v5 = *a2;
    v7 = v5 + 1;
  }
  *(_QWORD *)(v4 + 8) = v7;
  return a1;
}

_QWORD *sub_21B88C0C4(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_21B796C98(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21B88C128(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

float sub_21B88C144(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  v4 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x24BDBCE60], a2, a3, a4);
  v8 = (void *)objc_msgSend_currentCalendar(MEMORY[0x24BDBCE48], v5, v6, v7);
  v10 = (void *)objc_msgSend_components_fromDate_(v8, v9, 252, v4);
  v14 = (id)objc_msgSend_copy(v10, v11, v12, v13);
  objc_msgSend_setDay_(v14, v15, 1, v16);
  objc_msgSend_setMonth_(v14, v17, 1, v18);
  v19 = objc_alloc(MEMORY[0x24BDBCE48]);
  v22 = (id)objc_msgSend_initWithCalendarIdentifier_(v19, v20, *MEMORY[0x24BDBCA18], v21);
  v25 = objc_msgSend_dateFromComponents_(v22, v23, (uint64_t)v14, v24);
  v27 = (void *)objc_msgSend_components_fromDate_toDate_options_(v22, v26, 16, v25, v4, 0);
  v31 = (double)objc_msgSend_year(v10, v28, v29, v30);
  v35 = fabs((double)(objc_msgSend_day(v27, v32, v33, v34) + 1));
  return v35 / dbl_21B8A0E40[(objc_msgSend_year(v10, v36, v37, v38) & 3) == 0] + v31;
}

void sub_21B88C244(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)(a1 + 48) = xmmword_21B8A0CE0;
  *(_OWORD *)(a1 + 64) = xmmword_21B8A0CF0;
  *(_OWORD *)(a1 + 80) = xmmword_21B8A0E50;
  v2 = *(void ***)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 136) = 0;
  v4 = v3 - (_QWORD)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v5 = *(_QWORD *)(a1 + 112);
      v2 = (void **)(*(_QWORD *)(a1 + 104) + 8);
      *(_QWORD *)(a1 + 104) = v2;
      v4 = v5 - (_QWORD)v2;
    }
    while (v4 > 0x10);
  }
  if (v4 >> 3 == 1)
  {
    v6 = 512;
    goto LABEL_7;
  }
  if (v4 >> 3 == 2)
  {
    v6 = 1024;
LABEL_7:
    *(_QWORD *)(a1 + 128) = v6;
  }
  *(_BYTE *)(a1 + 144) = 1;
}

void sub_21B88C2E0(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, uint64_t a7, unint64_t **a8, _QWORD *a9, _QWORD *a10)
{
  unint64_t *v10;
  unint64_t *v11;
  BOOL v20;
  BOOL v21;
  unint64_t v22;
  float v23;
  unint64_t v24;
  float v25;
  char v26;
  float32x4_t v27;
  float v28[3];
  float v29;

  v10 = *a8;
  v11 = a8[1];
  if (*a8 != v11)
  {
    if (*(_WORD *)(a7 + 2))
      v20 = *(_DWORD *)(a7 + 4) == *(unsigned __int16 *)(a7 + 2);
    else
      v20 = 0;
    if (v20)
    {
      v22 = 0;
      v23 = 0.0;
      do
      {
        v23 = v23 + *(float *)sub_21B8761BC((unsigned __int16 *)a7, v22++);
        v24 = *(unsigned __int16 *)(a7 + 2);
      }
      while (v22 < v24);
      v10 = *a8;
      v11 = a8[1];
      v25 = v23 / (float)v24;
      v21 = v25 > 0.05236;
      *(float *)(a1 + 148) = v25;
    }
    else
    {
      v21 = 0;
    }
    if ((unint64_t)((char *)v11 - (char *)v10) < 0x40)
    {
      v26 = 2;
LABEL_25:
      *(_BYTE *)(a1 + 145) = v26;
      sub_21B88C528(a1, 0, a2);
      return;
    }
    while (v10 != v11)
    {
      if (!*(_BYTE *)sub_21B886640(a6, *v10))
      {
        v26 = 3;
        goto LABEL_25;
      }
      ++v10;
    }
    if (!v21)
    {
      v26 = 4;
      goto LABEL_25;
    }
    sub_21B88C63C(a1, a3, a4, a5, a8, a9, a10);
    if ((float)(*(float *)(a1 + 52) - *(float *)(a1 + 48)) < 0.0034907
      || (v27.f32[0] = *(float *)(a1 + 64) - *(float *)(a1 + 60), v27.f32[0] < 0.0034907))
    {
      v26 = 5;
      goto LABEL_25;
    }
    sub_21B88CAF0(a1, a3, (uint64_t *)a8, (uint64_t)v28, v27);
    if ((sub_21B88CC20(a1, v28) & 1) != 0)
    {
      *(_BYTE *)(a1 + 145) = 1;
      sub_21B88C528(a1, 1, a2);
      if (*(_QWORD *)(a1 + 136) == 16)
      {
        ++*(_QWORD *)(a1 + 128);
        *(_QWORD *)(a1 + 136) = 15;
        sub_21B88BEA8(a1 + 96, 1);
      }
      sub_21B88361C((_QWORD *)(a1 + 96), &v29);
    }
    else
    {
      *(_BYTE *)(a1 + 145) = 6;
      sub_21B88C528(a1, 0, a2);
    }
  }
}

void sub_21B88C528(uint64_t a1, int a2, unint64_t a3)
{
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(a1 + 144) != a2)
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3ACA8);
    v6 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(unsigned __int8 *)(a1 + 144);
      v8[0] = 67109632;
      v8[1] = v7;
      v9 = 1024;
      v10 = a2;
      v11 = 2048;
      v12 = (float)((float)a3 * 0.000001);
      _os_log_impl(&dword_21B72A000, v6, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilRingSensorTrustModel]:[setTrustPencilBool] Changed fTrustPencilRingSensorBool from %d to %d, t: %.6f s", (uint8_t *)v8, 0x18u);
    }
    *(_BYTE *)(a1 + 144) = a2;
  }
}

float sub_21B88C63C(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  unsigned __int8 v12;
  unsigned __int8 v13;
  unint64_t v14;
  float32x2_t *v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  unint64_t v26;
  float *v27;
  float *v28;
  float *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  float *v35;
  int v36;
  float v37;
  float v38;
  unint64_t v39;
  float *v40;
  float *v41;
  float *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  float *v48;
  int v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  unint64_t v57;
  float result;
  void **v59;
  float32x4_t v62;
  float32x4_t v63;

  *(_OWORD *)(a1 + 48) = xmmword_21B8A0CE0;
  *(_OWORD *)(a1 + 64) = xmmword_21B8A0CF0;
  *(_OWORD *)(a1 + 80) = xmmword_21B8A0E50;
  v12 = atomic_load((unsigned __int8 *)&qword_25518F5C8);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_25518F5C8))
  {
    qword_25518F5B8 = 0x3F80000000000000;
    dword_25518F5C0 = 0;
    __cxa_guard_release(&qword_25518F5C8);
  }
  v13 = atomic_load((unsigned __int8 *)&qword_25518F5E0);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_25518F5E0))
  {
    qword_25518F5D0 = 0;
    dword_25518F5D8 = 1065353216;
    __cxa_guard_release(&qword_25518F5E0);
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)a1;
  sub_21B88CD74((void **)a1, (uint64_t)(a5[1] - *a5) >> 3);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 24);
  v59 = (void **)(a1 + 24);
  sub_21B88CD74((void **)(a1 + 24), (uint64_t)(a5[1] - *a5) >> 3);
  if (a5[1] == *a5)
  {
    v57 = 0;
    v52 = *(float *)(a1 + 80);
    v53 = *(float *)(a1 + 92);
    v54 = *(float *)(a1 + 56);
    v56 = *(float *)(a1 + 68);
  }
  else
  {
    v14 = 0;
    do
    {
      v15 = (float32x2_t *)sub_21B878848(a3, *(_QWORD *)(*a6 + 8 * v14));
      v16 = sub_21B878848(a4, *(_QWORD *)(*a7 + 8 * v14));
      *(double *)v18.i64 = sub_21B892ECC(v15, &v62, v17);
      *(double *)v19.i64 = sub_21B892E6C(v16, v62.f32, &v63, v18);
      sub_21B892ECC((float32x2_t *)&v63, &v62, v19);
      v20 = sub_21B893128(v62.f32, *(float *)&qword_25518F5B8, *((float *)&qword_25518F5B8 + 1), *(float *)&dword_25518F5C0);
      v22 = v21;
      v24 = acosf(fmaxf(fminf((float)((float)(v23 * *(float *)&dword_25518F5D8) + (float)(v21 * *((float *)&qword_25518F5D0 + 1)))+ (float)(v20 * *(float *)&qword_25518F5D0), 1.0), -1.0));
      v25 = v24;
      v27 = *(float **)(a1 + 8);
      v26 = *(_QWORD *)(a1 + 16);
      if ((unint64_t)v27 >= v26)
      {
        v29 = *(float **)a1;
        v30 = ((uint64_t)v27 - *(_QWORD *)a1) >> 2;
        v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62)
          sub_21B796A0C();
        v32 = v26 - (_QWORD)v29;
        if (v32 >> 1 > v31)
          v31 = v32 >> 1;
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
          v33 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v33 = v31;
        if (v33)
        {
          v34 = (char *)sub_21B796CD8(a1 + 16, v33);
          v29 = *(float **)a1;
          v27 = *(float **)(a1 + 8);
        }
        else
        {
          v34 = 0;
        }
        v35 = (float *)&v34[4 * v30];
        *v35 = v25;
        v28 = v35 + 1;
        while (v27 != v29)
        {
          v36 = *((_DWORD *)v27-- - 1);
          *((_DWORD *)v35-- - 1) = v36;
        }
        *(_QWORD *)a1 = v35;
        *(_QWORD *)(a1 + 8) = v28;
        *(_QWORD *)(a1 + 16) = &v34[4 * v33];
        if (v29)
          operator delete(v29);
      }
      else
      {
        *v27 = v24;
        v28 = v27 + 1;
      }
      *(_QWORD *)(a1 + 8) = v28;
      v37 = atan2f(v22, v20);
      v38 = v37;
      v40 = *(float **)(a1 + 32);
      v39 = *(_QWORD *)(a1 + 40);
      if ((unint64_t)v40 >= v39)
      {
        v42 = (float *)*v59;
        v43 = ((char *)v40 - (_BYTE *)*v59) >> 2;
        v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 62)
          sub_21B796A0C();
        v45 = v39 - (_QWORD)v42;
        if (v45 >> 1 > v44)
          v44 = v45 >> 1;
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL)
          v46 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v46 = v44;
        if (v46)
        {
          v47 = (char *)sub_21B796CD8(a1 + 40, v46);
          v42 = *(float **)(a1 + 24);
          v40 = *(float **)(a1 + 32);
        }
        else
        {
          v47 = 0;
        }
        v48 = (float *)&v47[4 * v43];
        *v48 = v38;
        v41 = v48 + 1;
        while (v40 != v42)
        {
          v49 = *((_DWORD *)v40-- - 1);
          *((_DWORD *)v48-- - 1) = v49;
        }
        *(_QWORD *)(a1 + 24) = v48;
        *(_QWORD *)(a1 + 32) = v41;
        *(_QWORD *)(a1 + 40) = &v47[4 * v46];
        if (v42)
          operator delete(v42);
      }
      else
      {
        *v40 = v37;
        v41 = v40 + 1;
      }
      *(_QWORD *)(a1 + 32) = v41;
      v50 = *(float *)sub_21B88A160(a2, *(_QWORD *)(*a5 + 8 * v14));
      v51 = *(float *)(sub_21B88A160(a2, *(_QWORD *)(*a5 + 8 * v14)) + 4);
      v52 = v25 + *(float *)(a1 + 80);
      *(float *)(a1 + 80) = v52;
      v53 = v38 + *(float *)(a1 + 92);
      *(float *)(a1 + 92) = v53;
      v54 = v50 + *(float *)(a1 + 56);
      *(float *)(a1 + 56) = v54;
      v55 = *(float *)(a1 + 72);
      v56 = v51 + *(float *)(a1 + 68);
      *(float *)(a1 + 68) = v56;
      if (v25 < v55)
        *(float *)(a1 + 72) = v25;
      if (v38 < *(float *)(a1 + 84))
        *(float *)(a1 + 84) = v38;
      if (v50 < *(float *)(a1 + 48))
        *(float *)(a1 + 48) = v50;
      if (v51 < *(float *)(a1 + 60))
        *(float *)(a1 + 60) = v51;
      if (v25 > *(float *)(a1 + 76))
        *(float *)(a1 + 76) = v25;
      if (v38 > *(float *)(a1 + 88))
        *(float *)(a1 + 88) = v38;
      if (v50 > *(float *)(a1 + 52))
        *(float *)(a1 + 52) = v50;
      if (v51 > *(float *)(a1 + 64))
        *(float *)(a1 + 64) = v51;
      ++v14;
      v57 = (uint64_t)(a5[1] - *a5) >> 3;
    }
    while (v57 > v14);
  }
  *(float *)(a1 + 80) = v52 / (float)v57;
  *(float *)(a1 + 92) = v53 / (float)v57;
  *(float *)(a1 + 56) = v54 / (float)v57;
  result = v56 / (float)v57;
  *(float *)(a1 + 68) = result;
  return result;
}

float32x4_t sub_21B88CAF0@<Q0>(uint64_t a1@<X0>, unsigned __int16 *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>, float32x4_t a5@<Q1>)
{
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  unint64_t v14;
  float32x4_t v15;
  float v16;
  unint64_t v17;
  float32x4_t result;
  float32x4_t v19;

  v7 = *(float *)(a1 + 84);
  v6 = *(float *)(a1 + 88);
  v9 = *(float *)(a1 + 60);
  v8 = *(float *)(a1 + 64);
  v10 = *a3;
  if (a3[1] == *a3)
  {
    v17 = 0;
    v15 = 0uLL;
  }
  else
  {
    v14 = 0;
    v15 = 0uLL;
    do
    {
      v19 = v15;
      v16 = *(float *)sub_21B88A160(a2, *(_QWORD *)(v10 + 8 * v14));
      a5.f32[0] = *(float *)(*(_QWORD *)(a1 + 24) + 4 * v14)
                - *(float *)(sub_21B88A160(a2, *(_QWORD *)(*a3 + 8 * v14)) + 4);
      a5.f32[1] = a5.f32[0] - (float)(*(float *)(a1 + 92) - *(float *)(a1 + 68));
      a5.f32[2] = *(float *)(*(_QWORD *)a1 + 4 * v14) - v16;
      a5.f32[3] = a5.f32[2] - (float)(*(float *)(a1 + 80) - *(float *)(a1 + 56));
      v15 = vmlaq_f32(v19, a5, a5);
      ++v14;
      v10 = *a3;
      v17 = (a3[1] - *a3) >> 3;
    }
    while (v17 > v14);
  }
  a5.f32[0] = (float)v17;
  *(float *)a4 = vabds_f32(v8 - v9, v6 - v7);
  result = vsqrtq_f32(vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)a5.f32, 0)));
  *(float32x4_t *)(a4 + 4) = result;
  return result;
}

uint64_t sub_21B88CC20(uint64_t a1, float *a2)
{
  float v3;
  float v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v12;
  _BOOL4 v13;
  double v14;
  _QWORD v15[6];

  if (*(_BYTE *)(a1 + 144))
    v3 = 1.0;
  else
    v3 = *(float *)"fff?";
  if (*(_QWORD *)(a1 + 136))
  {
    sub_21B880DA8((uint64_t)v15, (_QWORD *)(a1 + 96));
    v4 = fminf(sub_21B8836A0(v15), 0.087266);
    sub_21B880D14(v15);
  }
  else
  {
    v4 = 0.17453;
  }
  v5 = v3;
  v6 = v3 * *(double *)"";
  v7 = a2[3] >= (float)(v3 * v4) || v6 <= a2[4];
  v8 = *a2;
  v9 = a2[2];
  if (!v7 && v5 * 0.043633231 > v8 && v6 > v9)
    return 1;
  v12 = v5 * 0.00872664619;
  v13 = v5 * 0.0872664619 > a2[4];
  v14 = v5 * 0.00349065848;
  if (v12 <= v8)
    v13 = 0;
  return v14 > v9 && v13;
}

void sub_21B88CD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_21B880D14(&a9);
  _Unwind_Resume(a1);
}

void sub_21B88CD74(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      sub_21B796A0C();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_21B796CD8(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

os_log_t sub_21B88CE08()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

uint64_t sub_21B88CE34(uint64_t a1)
{
  uint64_t v2;
  int v4;

  v2 = a1 + 32;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v4 = 0;
  sub_21B88E0F4(a1 + 32, (void (*)(uint64_t, uint64_t, _QWORD))sub_21B88CEF8, (uint64_t)&v4, 0x2710uLL);
  *(_QWORD *)(a1 + 88) = v2;
  *(_QWORD *)(a1 + 96) = a1 + 56;
  *(_QWORD *)(a1 + 104) = 10000;
  *(_BYTE *)(a1 + 112) = 1;
  *(_QWORD *)(a1 + 124) = 0;
  *(_QWORD *)(a1 + 116) = 0;
  *(_QWORD *)(a1 + 132) = 0x4120000000000000;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_DWORD *)(a1 + 176) = 0;
  *(_BYTE *)(a1 + 180) = 1;
  *(_QWORD *)(a1 + 184) = 1;
  *(_OWORD *)(a1 + 192) = xmmword_21B8A0E90;
  *(_DWORD *)(a1 + 208) = 0;
  sub_21B88D07C(a1);
  return a1;
}

void sub_21B88CEE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_21B88A63C(v1);
  _Unwind_Resume(a1);
}

void sub_21B88CEF8(_QWORD *a1, float *a2, unint64_t a3)
{
  unsigned __int8 v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float *v18;
  float v19;
  __float2 v20;
  float v21;
  float v22;
  int v23;

  v6 = atomic_load((unsigned __int8 *)&qword_25518F5F0);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25518F5F0))
  {
    *(float *)&v23 = 6.28318531 / (double)a3;
    dword_25518F5E8 = v23;
    __cxa_guard_release(&qword_25518F5F0);
  }
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = *(float *)&dword_25518F5E8;
      v10 = *a2;
      sub_21B88DF70();
      v12 = v10 + (float)(v11 * 0.5);
      if (sub_21B88E024() >= 0.4)
      {
        sub_21B88DF70();
        v14 = v12;
        if (v12 >= (float)(v15 * 0.5))
        {
          sub_21B88DF70();
          v14 = v16 * 0.5;
        }
      }
      else
      {
        v13 = fminf(v12, 5.0);
        v14 = v13 + (float)((float)(v13 * -2.0) * sub_21B88E024());
      }
      v17 = v9 * (float)v8;
      v18 = (float *)(*a1 + v7);
      v18[2] = v14;
      v19 = sqrtf((float)(v12 * v12) - (float)(v14 * v14));
      v20 = __sincosf_stret(v17);
      *v18 = v20.__cosval * v19;
      v18[1] = v20.__sinval * v19;
      sub_21B88DF70();
      *(float *)(*a1 + v7 + 12) = v21 * 0.5;
      sub_21B88DF70();
      *(float *)(*a1 + v7 + 16) = v22 * 0.5;
      ++v8;
      v7 += 20;
    }
    while (a3 != v8);
  }
}

void sub_21B88D07C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float *v10;
  float v11;
  float *v12;
  unint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  sub_21B892B34();
  *(_DWORD *)sub_21B878D6C((uint64_t)&v18, 0) = 0;
  *(_DWORD *)sub_21B878D6C((uint64_t)&v18, 1uLL) = 0;
  if (*(_QWORD *)(a1 + 104))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *(_DWORD *)(**(_QWORD **)(a1 + 88) + v2);
      *(_DWORD *)sub_21B878D6C((uint64_t)&v16, 0) = v4;
      v5 = *(_DWORD *)(**(_QWORD **)(a1 + 88) + v2 + 4);
      *(_DWORD *)sub_21B878D6C((uint64_t)&v16, 1uLL) = v5;
      v7 = v16;
      v6 = v17;
      v8 = sqrtf((float)(v7 * v7) + (float)(v6 * v6));
      if (v8 > 0.00000011921)
      {
        v7 = v16 / v8;
        v6 = v17 / v8;
      }
      v16 = v7;
      v17 = v6;
      v9 = *(float *)sub_21B878D6C((uint64_t)&v16, 0);
      v10 = (float *)sub_21B878D6C((uint64_t)&v18, 0);
      *v10 = v9 + *v10;
      v11 = *(float *)sub_21B878D6C((uint64_t)&v16, 1uLL);
      v12 = (float *)sub_21B878D6C((uint64_t)&v18, 1uLL);
      *v12 = v11 + *v12;
      ++v3;
      v13 = *(_QWORD *)(a1 + 104);
      v2 += 20;
    }
    while (v3 < v13);
    v14 = (float)v13;
  }
  else
  {
    v14 = 0.0;
  }
  v15 = sqrtf((float)(v18 * v18) + (float)(v19 * v19)) / v14;
  *(float *)(a1 + 136) = sqrtf((float)(1.0 - v15) + (float)(1.0 - v15));
  sub_21B892B34();
}

void sub_21B88D228(uint64_t a1, unint64_t a2)
{
  int v4;

  v4 = 0;
  sub_21B88D278(a1 + 32, (void (*)(uint64_t, uint64_t, _QWORD))sub_21B88CEF8, (uint64_t)&v4, a2);
  *(_QWORD *)(a1 + 104) = a2;
  sub_21B88D07C(a1);
}

void sub_21B88D278(uint64_t a1, void (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3, unint64_t a4)
{
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  if (a4)
  {
    *(_QWORD *)(a1 + 48) = a4;
    v8 = *(void **)a1;
    if (v8)
    {
      *(_QWORD *)(a1 + 8) = v8;
      operator delete(v8);
    }
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    sub_21B88E150((void **)a1, a4);
    v9 = *(void **)(a1 + 24);
    if (v9)
    {
      *(_QWORD *)(a1 + 32) = v9;
      operator delete(v9);
    }
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    sub_21B88E228((void **)(a1 + 24), a4);
    a2(a1, a3, *(_QWORD *)(a1 + 48));
    sub_21B88E2BC(a1);
  }
  else
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AD10);
    v10 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21B72A000, v10, OS_LOG_TYPE_FAULT, "Number of particles must be nonzero", v11, 2u);
    }
  }
}

void sub_21B88D3A0(uint64_t a1, float32x2_t *a2, double a3)
{
  double v4;
  float v5;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float v9;
  __int128 v10;
  uint64_t v11;

  v4 = *(double *)(a1 + 144);
  if (v4 <= 0.0)
  {
    v6 = 0.0;
  }
  else
  {
    v5 = a3 - v4;
    v6 = v5;
  }
  v7 = *a2;
  v8 = vadd_f32(*(float32x2_t *)(a1 + 160), vmul_n_f32(*a2, v6));
  *(float32x2_t *)(a1 + 152) = *a2;
  *(float32x2_t *)(a1 + 160) = v8;
  v8.f32[0] = v6 + *(float *)(a1 + 168);
  *(_DWORD *)(a1 + 168) = v8.i32[0];
  *(double *)(a1 + 144) = a3;
  if (v8.f32[0] <= 0.25)
  {
    if (*(_BYTE *)(a1 + 112))
    {
      v9 = v6;
      sub_21B88D53C((_QWORD *)(a1 + 32), (uint64_t)&v10);
      v6 = v9;
      *(_OWORD *)(a1 + 116) = v10;
      *(_DWORD *)(a1 + 132) = v11;
    }
    *(float *)&v10 = v6;
    *(_QWORD *)((char *)&v10 + 4) = *(_QWORD *)(a1 + 152);
    BYTE12(v10) = 0;
    v11 = 0;
    sub_21B88D5A0((float32x2_t *)(a1 + 116), (uint64_t)&v10);
  }
  else
  {
    sub_21B88D488((float32x2_t *)a1, -1.0, *(double *)&v7);
    sub_21B88D53C((_QWORD *)(a1 + 32), (uint64_t)&v10);
    *(_OWORD *)(a1 + 116) = v10;
    *(_DWORD *)(a1 + 132) = v11;
  }
  *(_BYTE *)(a1 + 112) = 0;
}

float32_t sub_21B88D488(float32x2_t *a1, float a2, double a3)
{
  uint64_t v4;
  unint64_t v5;
  float32_t result;
  __int32 v7;
  float32x2_t v8;
  char v9;
  float v10;
  float v11;

  LODWORD(a3) = a1[21].i32[0];
  if (*(float *)&a3 > 0.0)
  {
    v7 = a1[21].i32[0];
    v8 = vdiv_f32(a1[20], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0));
    v9 = 1;
    v10 = a1[22].f32[0] - a1[21].f32[1];
    v11 = a2;
    if (a1[10])
    {
      v4 = 0;
      v5 = 0;
      do
      {
        sub_21B88D5A0((float32x2_t *)(*(_QWORD *)&a1[4] + v4), (uint64_t)&v7);
        ++v5;
        v4 += 20;
      }
      while (v5 < *(_QWORD *)&a1[10]);
    }
    sub_21B88D07C((uint64_t)a1);
  }
  sub_21B88DD0C((uint64_t)a1);
  a1[21].i32[0] = 0;
  a1[20] = 0;
  result = a1[22].f32[0];
  a1[21].f32[1] = result;
  return result;
}

_QWORD *sub_21B88D53C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double *v5;
  float v6;
  float *v7;
  uint64_t v8;
  float v9;
  double v10;
  double v11;

  v2 = 0;
  v3 = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  v4 = result[6];
  do
  {
    if (v4)
    {
      v5 = (double *)result[3];
      v6 = *(float *)(a2 + 4 * v3);
      v7 = (float *)(*result + v2);
      v8 = v4;
      do
      {
        v9 = *v7;
        v7 += 5;
        v10 = v9;
        v11 = *v5++;
        v6 = v6 + v10 * v11;
        --v8;
      }
      while (v8);
      *(float *)(a2 + 4 * v3) = v6;
    }
    ++v3;
    v2 += 4;
  }
  while (v3 != 5);
  return result;
}

void sub_21B88D5A0(float32x2_t *a1, uint64_t a2)
{
  float v2;
  unint64_t v5;
  float v6;
  float v7;
  float v8;
  float *v9;
  float v10;
  float v11;
  float *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  unsigned int v19;
  unsigned int v20;
  float v21;
  float v22;
  float v23;
  float32_t v24;
  float v25;
  double v26;
  float v27;
  float v28;
  float v29;
  unint64_t v30;

  v2 = *(float *)a2;
  if (*(float *)a2 != 0.0)
  {
    v5 = *(_QWORD *)(a2 + 4);
    v30 = v5;
    if (*(_BYTE *)(a2 + 12))
    {
      v6 = sqrtf(0.002 / v2);
      sub_21B88DF70();
      v8 = v7;
      v9 = (float *)sub_21B878D6C((uint64_t)&v30, 0);
      *v9 = *v9 + (float)((float)(v6 * 4.0) * v8);
      sub_21B88DF70();
      v11 = v10;
      v12 = (float *)sub_21B878D6C((uint64_t)&v30, 1uLL);
      *v12 = *v12 + (float)((float)(v6 * 4.0) * v11);
      sub_21B88DF70();
      v14 = v6 * v13;
      v15 = sub_21B88E024();
      v16 = -1.0;
      if (v15 >= 0.005)
        v16 = 1.0;
      v2 = *(float *)a2;
      v18 = *((float *)&v30 + 1);
      v17 = *(float *)&v30;
    }
    else
    {
      v18 = *((float *)&v5 + 1);
      v17 = *(float *)&v5;
      v14 = 0.0;
      v16 = 1.0;
    }
    *(float *)&v19 = v2 * v17;
    *(float *)&v20 = v2 * v18;
    v22 = a1[1].f32[0];
    v21 = a1[1].f32[1];
    v23 = a1->f32[1];
    v24 = (float)(v2 * v21) + *(float *)&v19 * 0.5 * v2 + a1->f32[0];
    a1->f32[0] = v24;
    v25 = a1[2].f32[0];
    v26 = (float)(v25 * *(float *)a2) + *(float *)&v20 * 0.5 * *(float *)a2;
    v30 = __PAIR64__(v20, v19);
    *(float *)&v26 = v26 + v23;
    a1->i32[1] = LODWORD(v26);
    a1[1].f32[0] = v16 * (float)((float)(v14 * v2) + (float)(v22 + *(float *)(a2 + 16)));
    a1[1].f32[1] = *(float *)&v19 + v21;
    a1[2].f32[0] = v25 + *(float *)&v20;
    if (*(float *)(a2 + 20) > 0.0 && sub_21B88E024() < 0.05)
    {
      v27 = sqrtf((float)(a1->f32[0] * a1->f32[0]) + (float)(a1->f32[1] * a1->f32[1]));
      sub_21B88DF70();
      v29 = (float)((float)(*(float *)(a2 + 20) + (float)(v28 * 0.1)) * (float)(*(float *)(a2 + 20) + (float)(v28 * 0.1)))
          - (float)(a1[1].f32[0] * a1[1].f32[0]);
      if (v29 < 0.0)
        v29 = 0.0;
      *a1 = vmul_n_f32(*a1, sqrtf(v29) / v27);
    }
  }
}

uint64_t sub_21B88D7A0(uint64_t result, float a2)
{
  if (*(_BYTE *)(result + 180))
  {
    *(float *)(result + 172) = a2;
    *(_BYTE *)(result + 180) = 0;
  }
  *(float *)(result + 176) = a2;
  return result;
}

void sub_21B88D7B8(uint64_t a1, int a2, float a3, double a4, float a5)
{
  *(float *)a1 = a3;
  *(float *)(a1 + 4) = a5;
  if (a2)
  {
    sub_21B88D278(a1 + 32, (void (*)(uint64_t, uint64_t, _QWORD))sub_21B88CEF8, a1, *(_QWORD *)(a1 + 104));
    sub_21B88D07C(a1);
    *(_DWORD *)(a1 + 168) = 0;
    *(_QWORD *)(a1 + 160) = 0;
    *(_DWORD *)(a1 + 172) = *(_DWORD *)(a1 + 176);
  }
  sub_21B88D824(a1, 0, a4);
}

void sub_21B88D824(uint64_t a1, int a2, double a3)
{
  float v4;
  BOOL v5;
  double v6;

  if (a2 <= 2)
  {
    v6 = *(double *)(a1 + 144);
    v4 = a3 - v6;
    v5 = v6 <= 0.0;
    LODWORD(v6) = 0;
    if (!v5)
      *(float *)&v6 = v4;
    *(float32x2_t *)(a1 + 160) = vadd_f32(*(float32x2_t *)(a1 + 160), vmul_n_f32(*(float32x2_t *)(a1 + 152), *(float *)&v6));
    *(float *)&v6 = *(float *)&v6 + *(float *)(a1 + 168);
    *(_DWORD *)(a1 + 168) = LODWORD(v6);
    *(double *)(a1 + 144) = a3;
    switch(a2)
    {
      case 2:
        sub_21B88D908((_QWORD *)(a1 + 32), (float (*)(uint64_t, uint64_t))sub_21B88DBC8, a1 + 8);
        goto LABEL_11;
      case 1:
        sub_21B88D908((_QWORD *)(a1 + 32), (float (*)(uint64_t, uint64_t))sub_21B88DB0C, a1 + 24);
        goto LABEL_11;
      case 0:
        sub_21B88D488((float32x2_t *)a1, *(float *)a1, v6);
        sub_21B88D908((_QWORD *)(a1 + 32), (float (*)(uint64_t, uint64_t))sub_21B88D9E4, a1);
LABEL_11:
        sub_21B88DC74(a1);
        *(_BYTE *)(a1 + 112) = 1;
        sub_21B88DD0C(a1);
        break;
    }
  }
}

double sub_21B88D908(_QWORD *a1, float (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  double v8;
  float v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  double result;
  double *v14;

  if (!a1[6])
    return sub_21B88E2BC((uint64_t)a1);
  v6 = 0;
  v7 = 0;
  v8 = 0.0;
  do
  {
    v9 = a2(*a1 + v6, a3);
    v10 = a1[3];
    v11 = *(double *)(v10 + 8 * v7) * (float)(v9 + 0.0);
    *(double *)(v10 + 8 * v7) = v11;
    v8 = v8 + v11;
    ++v7;
    v12 = a1[6];
    v6 += 20;
  }
  while (v7 < v12);
  result = 0.000001;
  if (v8 <= 0.000001)
    return sub_21B88E2BC((uint64_t)a1);
  if (v12)
  {
    v14 = (double *)a1[3];
    do
    {
      result = *v14 / v8;
      *v14++ = result;
      --v12;
    }
    while (v12);
  }
  return result;
}

float sub_21B88D9E4(float *a1, float *a2)
{
  float v2;
  float v3;
  uint64_t v4;
  float *v5;
  float *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float *v12;

  v2 = a2[1];
  v3 = (float)(*a2 - sqrtf((float)((float)(*a1 * *a1) + (float)(a1[1] * a1[1])) + (float)(a1[2] * a1[2]))) / *a2;
  if (v2 <= -0.125)
  {
    v12 = (float *)&unk_21B8A0EBC;
    return sub_21B88E080(v12, v3);
  }
  if (v2 >= 0.275)
  {
    v12 = (float *)&unk_21B8A129C;
    return sub_21B88E080(v12, v3);
  }
  v4 = 0;
  v5 = (float *)&unk_21B8A0EBC;
  v6 = (float *)&unk_21B8A129C;
  v7 = 0.0;
  do
  {
    v8 = **(float **)((char *)&off_24DF3ACC8 + v4);
    if (v2 > v8)
    {
      v9 = **(float **)((char *)&off_24DF3ACC8 + v4 + 8);
      if (v2 <= v9)
      {
        v5 = *(float **)((char *)&off_24DF3ACC8 + v4);
        v6 = *(float **)((char *)&off_24DF3ACC8 + v4 + 8);
        v7 = (float)(v2 - v8) / (float)(v9 - v8);
      }
    }
    v4 += 8;
  }
  while (v4 != 32);
  v10 = sub_21B88E080(v5, v3);
  return (float)(v7 * sub_21B88E080(v6, v3)) + (float)((float)(1.0 - v7) * v10);
}

float sub_21B88DB0C(uint64_t a1, float *a2)
{
  unsigned __int8 v2;
  float *v3;
  float v4;
  float v5;
  int v7;
  int v8;
  float *v9;
  uint64_t v10;

  v2 = atomic_load((unsigned __int8 *)&qword_25518F600);
  v3 = (float *)&unk_25518F000;
  if ((v2 & 1) == 0)
  {
    v9 = a2;
    v10 = a1;
    v7 = __cxa_guard_acquire(&qword_25518F600);
    v3 = (float *)&unk_25518F000;
    v8 = v7;
    a2 = v9;
    a1 = v10;
    if (v8)
    {
      dword_25518F5F8 = 1032971806;
      __cxa_guard_release(&qword_25518F600);
      v3 = (float *)&unk_25518F000;
      a2 = v9;
      a1 = v10;
    }
  }
  v4 = sqrtf((float)(*(float *)(a1 + 12) * *(float *)(a1 + 12)) + (float)(*(float *)(a1 + 16) * *(float *)(a1 + 16)));
  v5 = v3[382];
  return v5 * expf((float)((float)((float)(v4 - *a2) * (float)(v4 - *a2)) * -0.5) / 31.36);
}

float sub_21B88DBC8(uint64_t a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;

  v2 = (float)(a2[2] * a2[2]) * 50.0;
  v3 = (float)(a2[3] * a2[3]) * 50.0;
  v4 = (float)(v2 * v3) + -0.0001;
  v5 = a2[1] - *(float *)(a1 + 16);
  v6 = 1.0 / (sqrtf(v4) * 6.28318531);
  return expf((float)((float)(v5* (float)((float)((float)(v2 / v4) * v5)+ (float)((float)(0.01 / v4) * (float)(*a2 - *(float *)(a1 + 12)))))+ (float)((float)(*a2 - *(float *)(a1 + 12))* (float)((float)((float)(0.01 / v4) * v5)+ (float)((float)(v3 / v4) * (float)(*a2 - *(float *)(a1 + 12))))))* -0.5)* v6;
}

void sub_21B88DC74(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v1 + 1;
  if (0xAAAAAAAAAAAAAAABLL * v1 <= 0x5555555555555555)
  {
    *(_QWORD *)(a1 + 184) = 1;
    sub_21B892B34();
    sub_21B88DE2C(a1 + 32);
    sub_21B892B34();
  }
}

void sub_21B88DD0C(uint64_t a1)
{
  unint64_t v2;
  unsigned int v3;
  double *v4;
  float *v5;
  float v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;

  sub_21B892B34();
  v2 = *(_QWORD *)(a1 + 104);
  if (v2)
  {
    v3 = 0;
    v4 = **(double ***)(a1 + 96);
    v5 = (float *)(**(_QWORD **)(a1 + 88) + 8);
    v6 = 0.0;
    v7 = *(_QWORD *)(a1 + 104);
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v11 = *(v5 - 2);
      v12 = *(v5 - 1);
      v13 = *v5;
      v5 += 5;
      v14 = v13;
      v15 = -v13;
      if (v13 > 0.0)
        v15 = v14;
      v16 = (float)(v11 * v11) + (float)(v12 * v12);
      v17 = sqrtf(v16);
      v18 = sqrtf(v16 + (float)(v14 * v14));
      v19 = *v4++;
      v20 = v19;
      v6 = v6 + (float)(v20 * v15);
      v8 = v8 + (float)(v20 * v17);
      v9 = v9 + (float)(v20 * v18);
      if (v15 <= 1.8)
        v21 = -0.0;
      else
        v21 = v20;
      v10 = v10 + v21;
      if (v15 > 1.8)
        ++v3;
      --v7;
    }
    while (v7);
    v22 = (float)v3;
  }
  else
  {
    v10 = 0.0;
    v22 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
  }
  *(float *)(a1 + 208) = v10;
  *(float *)(a1 + 192) = v6;
  *(float *)(a1 + 196) = v8;
  *(float *)(a1 + 200) = v9;
  *(float *)(a1 + 204) = v22 / (float)v2;
  sub_21B892B34();
}

void sub_21B88DE2C(uint64_t a1)
{
  unint64_t v2;
  float v3;
  unint64_t v4;
  double v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  unint64_t v11;
  unint64_t v13;
  BOOL v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  BOOL v18;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = sub_21B88E024();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = **(double **)(a1 + 24);
  v6 = *(char **)a1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  sub_21B88E150((void **)a1, v4);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = v3 / (float)v4;
    do
    {
      v11 = v7 - 1;
      if (v5 >= v10 || v8 >= v11)
      {
        v13 = v8;
      }
      else
      {
        do
        {
          v13 = v8 + 1;
          v5 = v5 + *(double *)(*(_QWORD *)(a1 + 24) + 8 + 8 * v8);
          v14 = v5 >= v10 || v13 >= v11;
          ++v8;
        }
        while (!v14);
      }
      v15 = &v6[20 * v13];
      v16 = *(_QWORD *)a1 + 20 * v9++;
      v17 = *(_OWORD *)v15;
      *(_DWORD *)(v16 + 16) = *((_DWORD *)v15 + 4);
      *(_OWORD *)v16 = v17;
      v10 = (float)(1.0 / (float)v2) + v10;
      v7 = *(_QWORD *)(a1 + 48);
      v18 = v9 >= v7 || v13 >= v7;
      v8 = v13;
    }
    while (!v18);
    sub_21B88E2BC(a1);
  }
  else
  {
    sub_21B88E2BC(a1);
    if (!v6)
      return;
  }
  operator delete(v6);
}

void sub_21B88DF58(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_21B88DF70()
{
  float v0;
  float v1;
  float v2;

  if (byte_25518E218)
  {
    byte_25518E218 = 0;
  }
  else
  {
    do
    {
      v0 = (float)(sub_21B88E024() * 2.0) + -1.0;
      v1 = (float)(sub_21B88E024() * 2.0) + -1.0;
      v2 = (float)(v1 * v1) + (float)(v0 * v0);
    }
    while (v2 >= 1.0);
    if (v2 != 0.0)
    {
      *(float *)&dword_25518E21C = v1 * sqrtf((float)(logf((float)(v1 * v1) + (float)(v0 * v0)) * -2.0) / v2);
      byte_25518E218 = 1;
    }
  }
}

float sub_21B88E024()
{
  unsigned __int8 v0;

  v0 = atomic_load((unsigned __int8 *)&qword_25518E228);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_25518E228))
    __cxa_guard_release(&qword_25518E228);
  return (float)sub_21B87CDA0((int)&off_25518E220, 0x7FFFFFFFu) * 4.6566e-10;
}

float sub_21B88E080(float *a1, float a2)
{
  float *v3;
  uint64_t v4;
  float v5;
  float v6;

  if (a1[2] > a2 || a1[31] < a2)
    return a1[1];
  v3 = a1 + 32;
  v4 = 0x3FFFFFFFFFFFFFE3;
  while (1)
  {
    v5 = v3[v4];
    if (v5 > a2)
    {
      v6 = v3[v4 - 1];
      if (v6 < a2)
        break;
    }
    if (!(++v4 * 4))
      return 0.0;
  }
  return a1[v4 + 61] + (float)((float)((float)(a1[v4 + 62] - a1[v4 + 61]) / (float)(v5 - v6)) * (float)(a2 - v6));
}

uint64_t sub_21B88E0F4(uint64_t a1, void (*a2)(uint64_t, uint64_t, _QWORD), uint64_t a3, unint64_t a4)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_QWORD *)(a1 + 48) = 1;
  sub_21B88D278(a1, a2, a3, a4);
  return a1;
}

void sub_21B88E12C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 24);
  if (v3)
  {
    *(_QWORD *)(v1 + 32) = v3;
    operator delete(v3);
  }
  sub_21B8995F4(v1);
  _Unwind_Resume(a1);
}

void sub_21B88E150(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (_BYTE *)*a1) >> 2) < a2)
  {
    if (a2 >= 0xCCCCCCCCCCCCCCDLL)
      sub_21B796A0C();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 20;
    v6 = (char *)sub_21B88E380(v3, a2);
    v7 = &v6[20 * v5];
    v9 = &v6[20 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 20);
        *((_DWORD *)v12 - 1) = *((_DWORD *)v10 - 1);
        *(_OWORD *)(v12 - 20) = v13;
        v12 -= 20;
        v10 -= 20;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_21B88E228(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_21B796A0C();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_21B796A20(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

double sub_21B88E2BC(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  _QWORD *v3;
  double result;
  int v5;
  uint64_t v6;

  v1 = atomic_load((unsigned __int8 *)&qword_25518E238);
  if ((v1 & 1) == 0)
  {
    v6 = a1;
    v5 = __cxa_guard_acquire(&qword_25518E238);
    a1 = v6;
    if (v5)
    {
      *(double *)&qword_25518E230 = (float)(1.0 / (float)*(unint64_t *)(v6 + 48));
      __cxa_guard_release(&qword_25518E238);
      a1 = v6;
    }
  }
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v3 = *(_QWORD **)(a1 + 24);
    do
    {
      result = *(double *)&qword_25518E230;
      *v3++ = qword_25518E230;
      --v2;
    }
    while (v2);
  }
  return result;
}

os_log_t sub_21B88E354()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "Motion");
  qword_25518E1E8 = (uint64_t)result;
  return result;
}

void *sub_21B88E380(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL)
    sub_21B796AC8();
  return operator new(20 * a2);
}

uint64_t sub_21B88E3C4(uint64_t a1)
{
  NSObject *v2;
  float v3;
  uint64_t v4;
  int v5;
  int v6;
  float v7;
  float v8;
  uint64_t v9;
  _DWORD v11[3];
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 472))
  {
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
    v2 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_INFO))
    {
      v3 = sub_21B893300((float32x4_t *)(a1 + 124));
      v4 = 0;
      *(float *)v11 = v3;
      v11[1] = v5;
      v11[2] = v6;
      v7 = 0.0;
      do
      {
        v7 = v7 + (float)(*(float *)&v11[v4] * *(float *)&v11[v4]);
        ++v4;
      }
      while (v4 != 3);
      v8 = *(float *)(a1 + 448) * 57.296;
      v9 = *(_QWORD *)(a1 + 456);
      *(_DWORD *)buf = 134349568;
      v13 = (float)(sqrtf(v7) * 57.296);
      v14 = 2050;
      v15 = v8;
      v16 = 2050;
      v17 = v9;
      _os_log_impl(&dword_21B72A000, v2, OS_LOG_TYPE_INFO, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[softReset] Enter soft reset. fDMYawAlignmentQ_IP_IS.angle: %{public}.1f deg, fDMYawAlignmentMEKF angle: %{public}.1f deg, timestamp: %{public}llu", buf, 0x20u);
    }
  }
  *(_OWORD *)(a1 + 476) = *(_OWORD *)(a1 + 124);
  *(_BYTE *)(a1 + 472) = 1;
  return sub_21B87CEA4(a1 + 448);
}

void sub_21B88E518(unsigned __int8 *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, unsigned __int16 *a7, uint64_t a8, uint64_t a9, _QWORD *a10, _QWORD *a11)
{
  uint64_t v17;
  unint64_t v18;
  int v19;
  unint64_t *v20;
  unint64_t v21;
  float *v22;
  uint64_t v23;
  _DWORD *v24;
  unsigned int v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  float *v39;
  float *v40;
  float32x2_t *v41;
  float32x2_t *v42;
  uint64_t v43;
  float v44;
  float v45;
  float v46;
  float v47;
  uint64_t v48;
  float v49;
  float v50;
  float v51;
  float v52;
  double v53;
  double v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  float v58;
  float v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  double v63;
  double v64;
  NSObject *v65;
  double v66;
  double v67;
  uint64_t v70;
  int v71;
  _QWORD v72[6];
  _QWORD v73[6];
  float v74;
  _BYTE buf[38];
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  if (*a1)
  {
    v17 = *(_QWORD *)(a9 + 8);
    if (*(_QWORD *)a9 == v17)
      v18 = 0;
    else
      v18 = *(_QWORD *)sub_21B88A160(a2, *(_QWORD *)(v17 - 8));
    sub_21B88C2E0((uint64_t)(a1 + 144), v18, a3, a5, a6, a7, a8, (unint64_t **)a9, a10, a11);
  }
  v19 = a1[288];
  a1[296] = v19;
  if (v19 || !*a1)
  {
    v20 = *(unint64_t **)a9;
    if (*(_QWORD *)a9 != *(_QWORD *)(a9 + 8))
    {
      v21 = 0;
      do
      {
        v22 = (float *)sub_21B88A160(a3, v20[v21]);
        if (*a1 && *v22 < 0.17453)
          return;
        ++v21;
        v20 = *(unint64_t **)a9;
        v23 = *(_QWORD *)(a9 + 8);
      }
      while (v21 < (v23 - *(_QWORD *)a9) >> 3);
      v24 = (_DWORD *)sub_21B88A160(a2, *(_QWORD *)(v23 - 8));
      if (!*a1
        || ((*v24 - *((_DWORD *)a1 + 2)) <= 0x4C4B40 ? (v25 = 200000) : (v25 = 5000000),
            v25 < *v24 - *((_DWORD *)a1 + 4)))
      {
        if (qword_25518E1D0 != -1)
          dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
        v26 = qword_25518E1D8;
        if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
        {
          v27 = *a1;
          v28 = (uint64_t)(*(_QWORD *)(a9 + 8) - *(_QWORD *)a9) >> 3;
          v29 = a3[1];
          v30 = a6[1];
          v31 = *a2;
          v32 = *(_QWORD *)&a2[4 * v31 + 4];
          v33 = v31 + a2[1] - 1;
          v34 = *((unsigned int *)a2 + 1);
          if (v33 < v34)
            v34 = 0;
          v35 = *(_QWORD *)&a2[4 * (v33 - v34) + 4];
          v36 = a5[1];
          *(_DWORD *)buf = 67110656;
          *(_DWORD *)&buf[4] = v27;
          *(_WORD *)&buf[8] = 2048;
          *(_QWORD *)&buf[10] = v28;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v29;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v30;
          v76 = 2048;
          v77 = v36;
          v78 = 2048;
          v79 = v32;
          v80 = 2048;
          v81 = v35;
          _os_log_impl(&dword_21B72A000, v26, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Starting north alignment. fBoolInitializedDMYawAlignment: %d, numMatchedSensorData: %zu, numRingSensor: %zu, numAuxDM: %zu, numSrcDM: %zu, first/last ring timestamp entry in buffer: %llu %llu us", buf, 0x44u);
        }
        sub_21B882CEC((uint64_t)(a1 + 304));
        v37 = *(unint64_t **)a9;
        if (*(_QWORD *)(a9 + 8) != *(_QWORD *)a9)
        {
          v38 = 0;
          do
          {
            v39 = (float *)sub_21B88A160(a3, v37[v38]);
            v40 = (float *)sub_21B88A160(a4, *(_QWORD *)(*(_QWORD *)a9 + 8 * v38));
            v41 = (float32x2_t *)sub_21B878848(a5, *(_QWORD *)(*a10 + 8 * v38));
            v42 = (float32x2_t *)sub_21B878848(a6, *(_QWORD *)(*a11 + 8 * v38));
            sub_21B882D78((uint64_t)(a1 + 304), v39, v40, v41, v42);
            ++v38;
            v37 = *(unint64_t **)a9;
          }
          while (v38 < (uint64_t)(*(_QWORD *)(a9 + 8) - *(_QWORD *)a9) >> 3);
        }
        if (*a1)
          sub_21B883140((uint64_t)(a1 + 304), *((float *)a1 + 30));
        else
          sub_21B882FA0((uint64_t)(a1 + 304));
        sub_21B883190((uint64_t)(a1 + 304), 50);
        v44 = fmodf(*((float *)a1 + 86) + 3.1416, 6.2832);
        if (v44 < 0.0)
          v44 = v44 + 6.2832;
        v45 = v44 + -3.1416;
        v74 = v44 + -3.1416;
        sub_21B88EC44(*((float *)a1 + 30), v43, a3, a5, a6, (uint64_t *)a9, a10, a11);
        v47 = v46;
        sub_21B88EC44(v45, v48, a3, a5, a6, (uint64_t *)a9, a10, a11);
        if (!*a1 || v47 >= v49)
        {
          if (*((_QWORD *)a1 + 8) == 64)
          {
            ++*((_QWORD *)a1 + 7);
            *((_QWORD *)a1 + 8) = 63;
            sub_21B88BEA8((uint64_t)(a1 + 24), 1);
          }
          sub_21B880DA8((uint64_t)v73, (_QWORD *)a1 + 3);
          v50 = sub_21B8836A0(v73);
          v51 = fmodf(v50 + 3.1416, 6.2832);
          if (v51 < 0.0)
            v51 = v51 + 6.2832;
          v52 = v51 + -3.1416;
          sub_21B880D14(v73);
          if (vabds_f32(v52, v45) <= 3.14159265)
            goto LABEL_47;
          if (v52 <= 0.0 || v45 >= 0.0)
          {
            if (v52 >= 0.0 || v45 <= 0.0)
            {
LABEL_47:
              v55 = (uint64_t *)sub_21B88A160(a2, *(_QWORD *)(*(_QWORD *)(a9 + 8) - 8));
              if ((sub_21B88EDB8(a1, *v55, v45) & 1) == 0)
              {
                sub_21B88361C((_QWORD *)a1 + 3, &v74);
                v56 = (uint64_t *)sub_21B88A160(a2, *(_QWORD *)(*(_QWORD *)(a9 + 8) - 8));
                v57 = *v56;
                *((_QWORD *)a1 + 2) = *v56;
                if (!*((_QWORD *)a1 + 1))
                  *((_QWORD *)a1 + 1) = v57;
                sub_21B880DA8((uint64_t)v72, (_QWORD *)a1 + 3);
                v58 = sub_21B8836A0(v72);
                v59 = fmodf(v58 + 3.1416, 6.2832);
                if (v59 < 0.0)
                  v59 = v59 + 6.2832;
                *((float *)a1 + 30) = v59 + -3.1416;
                sub_21B880D14(v72);
                v60 = *((_DWORD *)a1 + 30);
                v70 = 0;
                v71 = v60;
                sub_21B8931F8((float32x4_t *)buf, (float *)&v70);
                if (a1 + 124 != buf)
                  *(_OWORD *)(a1 + 124) = *(_OWORD *)buf;
                v61 = qword_25518E1D0;
                if (!*a1)
                {
                  if (qword_25518E1D0 != -1)
                    dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
                  v62 = qword_25518E1D8;
                  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
                  {
                    v63 = (double)*((unint64_t *)a1 + 2) * 0.000001;
                    v64 = (float)(*((float *)a1 + 30) * 57.296);
                    *(_DWORD *)buf = 134218240;
                    *(double *)&buf[4] = v63;
                    *(_WORD *)&buf[12] = 2048;
                    *(double *)&buf[14] = v64;
                    _os_log_impl(&dword_21B72A000, v62, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Initialized DM north alignment, t: %.6f s, angle: %.6f deg", buf, 0x16u);
                    v61 = qword_25518E1D0;
                  }
                  else
                  {
                    v61 = -1;
                  }
                  *a1 = 1;
                }
                if (v61 != -1)
                  dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
                v65 = qword_25518E1D8;
                if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = (double)*((unint64_t *)a1 + 2) * 0.000001;
                  v67 = (float)(*((float *)a1 + 30) * 57.296);
                  *(_DWORD *)buf = 134218496;
                  *(double *)&buf[4] = v66;
                  *(_WORD *)&buf[12] = 2048;
                  *(double *)&buf[14] = (float)(v74 * 57.296);
                  *(_WORD *)&buf[22] = 2048;
                  *(double *)&buf[24] = v67;
                  _os_log_impl(&dword_21B72A000, v65, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Updated DM north alignment, t: %.6f s, new angle: %.6f deg, median angle: %.6f deg", buf, 0x20u);
                }
              }
              return;
            }
            v53 = v45;
            v54 = -6.28318531;
          }
          else
          {
            v53 = v45;
            v54 = 6.28318531;
          }
          v45 = v53 + v54;
          v74 = v45;
          goto LABEL_47;
        }
      }
    }
  }
}

void sub_21B88EC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_21B880D14(va);
  _Unwind_Resume(a1);
}

void sub_21B88EC44(float a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, uint64_t *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t v14;
  unint64_t v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  float32x2_t *v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  float32x4_t v29;
  uint64_t v30;
  float v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;

  if (*a6 != a6[1])
  {
    v30 = 0;
    v31 = a1;
    sub_21B8931F8(&v29, (float *)&v30);
    v14 = *a6;
    if (a6[1] != *a6)
    {
      v15 = 0;
      v16 = 0.0;
      do
      {
        v17 = *(_QWORD *)(v14 + 8 * v15);
        v18 = *(_QWORD *)(*a7 + 8 * v15);
        v19 = sub_21B878848(a5, *(_QWORD *)(*a8 + 8 * v15));
        v20 = (float32x2_t *)sub_21B878848(a4, v18);
        *(double *)v22.i64 = sub_21B892E6C(v19, v29.f32, &v34, v21);
        *(double *)v23.i64 = sub_21B892ECC(v20, &v32, v22);
        *(double *)v24.i64 = sub_21B892E6C((uint64_t)&v34, v32.f32, &v33, v23);
        sub_21B892ECC((float32x2_t *)&v33, &v32, v24);
        v25 = sub_21B893128(v32.f32, 0.0, 1.0, 0.0);
        v27 = atan2f(v26, v25);
        v28 = sub_21B88A160(a3, v17);
        v16 = v16 + (float)((float)(*(float *)(v28 + 4) - v27) * (float)(*(float *)(v28 + 4) - v27));
        ++v15;
        v14 = *a6;
      }
      while ((a6[1] - *a6) >> 3 > v15);
    }
  }
}

uint64_t sub_21B88EDB8(_QWORD *a1, uint64_t a2, float a3)
{
  _QWORD *v6;
  _QWORD *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void **v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  void **v30;
  void **v31;
  void **v32;
  _BYTE *v33;
  float *v34;
  float v35;
  unint64_t v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  float *v41;
  uint64_t result;
  unint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[6];
  _QWORD v48[6];
  float v49;
  uint8_t buf[4];
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  if (!a1[8])
    return 0;
  v6 = a1 + 3;
  v7 = a1 + 9;
  if (a1[14] == 16)
  {
    ++a1[13];
    a1[14] = 15;
    sub_21B88BEA8((uint64_t)(a1 + 9), 1);
  }
  sub_21B880DA8((uint64_t)v48, v6);
  v8 = sub_21B8836A0(v48);
  v9 = fmodf(v8 + 3.1416, 6.2832);
  if (v9 < 0.0)
    v9 = v9 + 6.2832;
  v10 = v9 + -3.1416;
  sub_21B880D14(v48);
  v11 = vabds_f32(v10, a3);
  v12 = fabsf(v10) * 0.15;
  if (v12 > 0.2618)
    v12 = 0.2618;
  if (v11 < v12)
  {
    v13 = (void **)a1[10];
    v14 = a1[11];
    a1[14] = 0;
    v15 = v14 - (_QWORD)v13;
    if (v15 >= 0x11)
    {
      do
      {
        operator delete(*v13);
        v16 = a1[11];
        v13 = (void **)(a1[10] + 8);
        a1[10] = v13;
        v15 = v16 - (_QWORD)v13;
      }
      while (v15 > 0x10);
    }
    if (v15 >> 3 == 1)
    {
      v17 = 512;
      goto LABEL_39;
    }
    if (v15 >> 3 == 2)
    {
      v17 = 1024;
LABEL_39:
      result = 0;
      a1[13] = v17;
      return result;
    }
    return 0;
  }
  if (v11 <= 1.5708)
  {
    if (!a1[14])
    {
      sub_21B88361C(v7, &v49);
      return 1;
    }
    sub_21B880DA8((uint64_t)v47, v7);
    v23 = sub_21B8836A0(v47);
    v24 = fmodf(v23 + 3.1416, 6.2832);
    if (v24 < 0.0)
      v24 = v24 + 6.2832;
    v25 = v24 + -3.1416;
    sub_21B880D14(v47);
    v26 = fmodf((float)(v49 - v25) + 3.1416, 6.2832);
    if (v26 < 0.0)
      v26 = v26 + 6.2832;
    v27 = fabsf(v26 + -3.1416);
    v28 = fabsf(v25) * 0.15;
    if (v28 > 0.2618)
      v28 = 0.2618;
    v29 = a1[13];
    v30 = (void **)a1[10];
    v31 = (void **)a1[11];
    v32 = &v30[v29 >> 10];
    v33 = *v32;
    v34 = (float *)((char *)*v32 + 4 * (v29 & 0x3FF));
    v35 = *v34;
    v36 = (char *)v31 - (char *)v30;
    if (v31 == v30
      || (v37 = *(uint64_t *)((char *)v30 + (((a1[14] + v29) >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * ((a1[14] + v29) & 0x3FF),
          v34 == (float *)v37))
    {
      v38 = *v34;
    }
    else
    {
      v38 = *v34;
      do
      {
        v39 = *v34++;
        v40 = v39;
        if (v39 > v35)
          v35 = v40;
        if (v40 < v38)
          v38 = v40;
        if ((char *)v34 - v33 == 4096)
        {
          v41 = (float *)v32[1];
          ++v32;
          v33 = v41;
          v34 = v41;
        }
      }
      while (v34 != (float *)v37);
    }
    if (v27 <= v28 && (float)(v35 - v38) <= 0.34907)
    {
      sub_21B88361C(v7, &v49);
      v43 = 8;
      if (v11 > 1.0472)
        v43 = 2;
      if (a1[14] <= v43)
        return 1;
      sub_21B88F274(v6);
      if (qword_25518E1D0 != -1)
        dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
      v44 = qword_25518E1D8;
      if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        v51 = (float)(v11 * 57.296);
        v52 = 2048;
        v53 = (float)(v49 * 57.296);
        v54 = 2048;
        v55 = (float)(v10 * 57.296);
        v56 = 2048;
        v57 = a2;
        _os_log_impl(&dword_21B72A000, v44, OS_LOG_TYPE_DEFAULT, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[updateDMInertialYaw] Reset median buffer. Large delta between new angle and median: %.1f deg, new angle: %.1f deg, old median: %.1f deg, timestamp: %llu", buf, 0x2Au);
      }
      sub_21B88F274(v7);
      return 0;
    }
    a1[14] = 0;
    if (v36 >= 0x11)
    {
      do
      {
        operator delete(*v30);
        v45 = a1[11];
        v30 = (void **)(a1[10] + 8);
        a1[10] = v30;
        v36 = v45 - (_QWORD)v30;
      }
      while (v36 > 0x10);
    }
    if (v36 >> 3 == 1)
    {
      v46 = 512;
    }
    else
    {
      if (v36 >> 3 != 2)
      {
LABEL_62:
        sub_21B88361C(v7, &v49);
        return 1;
      }
      v46 = 1024;
    }
    a1[13] = v46;
    goto LABEL_62;
  }
  v18 = (void **)a1[10];
  v19 = a1[11];
  a1[14] = 0;
  v20 = v19 - (_QWORD)v18;
  if (v20 >= 0x11)
  {
    do
    {
      operator delete(*v18);
      v21 = a1[11];
      v18 = (void **)(a1[10] + 8);
      a1[10] = v18;
      v20 = v21 - (_QWORD)v18;
    }
    while (v20 > 0x10);
  }
  if (v20 >> 3 == 1)
  {
    v22 = 512;
    goto LABEL_54;
  }
  if (v20 >> 3 == 2)
  {
    v22 = 1024;
LABEL_54:
    a1[13] = v22;
  }
  return 1;
}

void sub_21B88F24C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B880D14(va);
  _Unwind_Resume(a1);
}

void sub_21B88F274(_QWORD *a1)
{
  void **v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void **)a1[1];
  v3 = a1[2];
  a1[5] = 0;
  v4 = v3 - (_QWORD)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v5 = a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = v5 - (_QWORD)v2;
    }
    while (v4 > 0x10);
  }
  if (v4 >> 3 == 1)
  {
    v6 = 512;
  }
  else
  {
    if (v4 >> 3 != 2)
      return;
    v6 = 1024;
  }
  a1[4] = v6;
}

uint64_t sub_21B88F2E8(unsigned __int8 *a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  int v7;
  void **v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (qword_25518E1D0 != -1)
    dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
  v2 = qword_25518E1D8;
  if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_DEBUG))
  {
    v3 = *a1;
    v4 = *((_QWORD *)a1 + 1);
    v5 = *((_QWORD *)a1 + 2);
    v6 = (float)(*((float *)a1 + 30) * 57.296);
    v7 = a1[296];
    v19[0] = 67110144;
    v19[1] = v3;
    v20 = 2048;
    v21 = v4;
    v22 = 2048;
    v23 = v5;
    v24 = 2048;
    v25 = v6;
    v26 = 1024;
    v27 = v7;
    _os_log_impl(&dword_21B72A000, v2, OS_LOG_TYPE_DEBUG, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[reset] Resetting. Values before reset: fBoolInitializedDMYawAlignment: %d, fFirstDMYawAlignmentUpdateTimeMicroSeconds: %llu us, fLatestDMYawAlignmentUpdateTimeMicroSeconds: %llu us, fDMYawAlignmentAngle: %.1f deg, fBoolTrustPencilRingSensor: %d", (uint8_t *)v19, 0x2Cu);
  }
  *a1 = 0;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  v8 = (void **)*((_QWORD *)a1 + 4);
  v9 = *((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 8) = 0;
  v10 = v9 - (_QWORD)v8;
  if (v10 >= 0x11)
  {
    do
    {
      operator delete(*v8);
      v11 = *((_QWORD *)a1 + 5);
      v8 = (void **)(*((_QWORD *)a1 + 4) + 8);
      *((_QWORD *)a1 + 4) = v8;
      v10 = v11 - (_QWORD)v8;
    }
    while (v10 > 0x10);
  }
  if (v10 >> 3 == 1)
  {
    v12 = 512;
  }
  else
  {
    if (v10 >> 3 != 2)
      goto LABEL_12;
    v12 = 1024;
  }
  *((_QWORD *)a1 + 7) = v12;
LABEL_12:
  v13 = (void **)*((_QWORD *)a1 + 10);
  v14 = *((_QWORD *)a1 + 11);
  *((_QWORD *)a1 + 14) = 0;
  v15 = v14 - (_QWORD)v13;
  if (v15 >= 0x11)
  {
    do
    {
      operator delete(*v13);
      v16 = *((_QWORD *)a1 + 11);
      v13 = (void **)(*((_QWORD *)a1 + 10) + 8);
      *((_QWORD *)a1 + 10) = v13;
      v15 = v16 - (_QWORD)v13;
    }
    while (v15 > 0x10);
  }
  if (v15 >> 3 == 1)
  {
    v17 = 512;
    goto LABEL_18;
  }
  if (v15 >> 3 == 2)
  {
    v17 = 1024;
LABEL_18:
    *((_QWORD *)a1 + 13) = v17;
  }
  *((_QWORD *)a1 + 15) = 0;
  *((_QWORD *)a1 + 16) = 0;
  *((_DWORD *)a1 + 34) = 1065353216;
  sub_21B88C244((uint64_t)(a1 + 144));
  a1[296] = 1;
  sub_21B882CEC((uint64_t)(a1 + 304));
  return sub_21B87CEA4((uint64_t)(a1 + 448));
}

void sub_21B88F4DC(uint64_t a1, unint64_t a2)
{
  sub_21B87CEE0(a1 + 448, a2);
}

void sub_21B88F4E4(uint64_t a1, float *a2, float *a3, float32x2_t *a4, float32x2_t *a5, unint64_t a6)
{
  NSObject *v7;
  float v8;
  uint64_t v9;
  int v10;
  int v11;
  float v12;
  float v13;
  uint64_t v14;
  _DWORD v15[3];
  uint8_t buf[4];
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sub_21B87D0E0(a1 + 448, a2, a3, a4, a5, a6);
  if (*(_BYTE *)(a1 + 472))
  {
    *(_BYTE *)(a1 + 472) = 0;
    if (qword_25518E1D0 != -1)
      dispatch_once(&qword_25518E1D0, &unk_24DF3AD50);
    v7 = qword_25518E1D8;
    if (os_log_type_enabled((os_log_t)qword_25518E1D8, OS_LOG_TYPE_INFO))
    {
      v8 = sub_21B893300((float32x4_t *)(a1 + 124));
      v9 = 0;
      *(float *)v15 = v8;
      v15[1] = v10;
      v15[2] = v11;
      v12 = 0.0;
      do
      {
        v12 = v12 + (float)(*(float *)&v15[v9] * *(float *)&v15[v9]);
        ++v9;
      }
      while (v9 != 3);
      v13 = *(float *)(a1 + 448);
      v14 = *(_QWORD *)(a1 + 456);
      *(_DWORD *)buf = 134218496;
      v17 = (float)(sqrtf(v12) * 57.296);
      v18 = 2048;
      v19 = v13;
      v20 = 2048;
      v21 = v14;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_INFO, "[BarrelRoll]:[CMAPencilDMYawAlignmentManager]:[feedMEKF] Exit soft reset. fDMYawAlignmentQ_IP_IS.angle: %.1f deg, fDMYawAlignmentMEKF angle: %.1f deg, timestamp: %llu", buf, 0x20u);
    }
  }
}

float32x4_t sub_21B88F624@<Q0>(uint64_t a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t result;

  if (*(_BYTE *)(a1 + 472))
  {
    result = *(float32x4_t *)(a1 + 476);
    *a2 = result;
  }
  else
  {
    if (*(_BYTE *)(a1 + 464))
    {
      *(double *)result.i64 = sub_21B87CEB0((int *)(a1 + 448), a2);
    }
    else
    {
      result = *(float32x4_t *)(a1 + 124);
      *a2 = result;
    }
    if ((float32x4_t *)(a1 + 124) != a2)
    {
      result = *a2;
      *(float32x4_t *)(a1 + 124) = *a2;
    }
  }
  return result;
}

os_log_t sub_21B88F690()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

uint64_t sub_21B88F6BC(uint64_t result)
{
  *(_BYTE *)(result + 24) = 0;
  return result;
}

uint64_t sub_21B88F6C4(uint64_t result, double a2, double a3, double a4)
{
  double v4;
  double v5;

  if (*(_BYTE *)(result + 24))
  {
    v4 = *(double *)(result + 8) + a3 - *(double *)(result + 16);
    v5 = v4 / (v4 + a4);
    *(double *)result = *(double *)result + v5 * (a2 - *(double *)result);
    *(double *)(result + 8) = v4 * (1.0 - v5);
    *(double *)(result + 16) = a3;
  }
  else
  {
    *(double *)result = a2;
    *(double *)(result + 8) = a4;
    *(double *)(result + 16) = a3;
    *(_BYTE *)(result + 24) = 1;
  }
  return result;
}

double sub_21B88F718(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  v4 = a2[2];
  v3 = a2[3];
  v5 = a3[2];
  v6 = a3[3];
  v7 = *a2;
  v8 = *a3;
  a1[1] = v3 * v5 + *a2 * a3[1] - v4 * v6 + a2[1] * *a3;
  v9 = a3[1];
  v10 = a2[1];
  a1[2] = v7 * v5 - v3 * v9 + v10 * v6 + v4 * v8;
  v11 = a2[2];
  v12 = a3[2];
  a1[3] = v11 * v9 - v10 * v12 + v7 * v6 + v3 * v8;
  result = -(v11 * v12) - v10 * v9 - a2[3] * a3[3] + v7 * v8;
  *a1 = result;
  return result;
}

void sub_21B88F794(uint64_t a1, float a2, double a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  __double2 v17;
  __int128 v18;
  float v19;
  float v20;
  float v21;
  _OWORD v22[2];
  double v23[12];

  if (a3 >= 0.0)
  {
    v23[4] = v8;
    v23[5] = v7;
    v23[6] = v6;
    v23[7] = v5;
    v23[10] = v3;
    v23[11] = v4;
    v11 = *(double *)(a1 + 16);
    v12 = *(double *)(a1 + 24) + *(double *)(a1 + 24);
    v13 = *(double *)(a1 + 8);
    v14 = v13 * v12 - *(double *)a1 * (v11 + v11);
    v15 = (v13 + v13) * *(double *)a1 + v11 * v12;
    v16 = 1.0 - v13 * (v13 + v13) - v11 * (v11 + v11);
    v17 = __sincos_stret(a2 * -0.5 * *(double *)"");
    v23[0] = v17.__cosval;
    v23[1] = v17.__sinval * v14;
    v23[2] = v17.__sinval * v15;
    v23[3] = v17.__sinval * v16;
    sub_21B88F718((double *)v22, v23, (double *)a1);
    v18 = v22[1];
    *(_OWORD *)a1 = v22[0];
    *(_OWORD *)(a1 + 16) = v18;
    v19 = *(float *)(a1 + 76);
    if (v19 >= 0.0)
    {
      v20 = v19 + a2;
      *(float *)(a1 + 76) = v20;
      v21 = 360.0;
      if (v20 >= 360.0)
      {
        v21 = -360.0;
      }
      else if (v20 >= 0.0)
      {
        return;
      }
      *(float *)(a1 + 76) = v20 + v21;
    }
  }
}

void sub_21B88F8A4(uint64_t a1, float a2, double a3)
{
  sub_21B88F794(a1, -a2, a3);
}

_QWORD *sub_21B88F8AC(_QWORD *a1, char *a2, char *a3)
{
  _BYTE v6[16];
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *__p;
  char v12;
  void *v13[2];
  char v14;

  sub_21B797DBC(v13, a2);
  sub_21B798550(a3, "/tmp/", 1048576000, 86400, 50, "msl", 2, 300, (uint64_t)v6);
  sub_21B797E9C((uint64_t)a1, (uint64_t)v13, (uint64_t)v6);
  if (v12 < 0)
    operator delete(__p);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v14 < 0)
    operator delete(v13[0]);
  *a1 = &off_24DF3AD80;
  return a1;
}

void sub_21B88F970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  sub_21B79744C((uint64_t)&a9);
  if (*(char *)(v9 - 17) < 0)
    operator delete(*(void **)(v9 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_21B88F99C()
{
  if (qword_25518F608 != -1)
    dispatch_once(&qword_25518F608, &unk_24DF3AD90);
  return qword_25518F830;
}

_QWORD *sub_21B88F9DC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD *result;

  v4 = (void *)objc_msgSend_processInfo(MEMORY[0x24BDD1760], a2, a3, a4);
  v8 = objc_msgSend_processName(v4, v5, v6, v7);
  v11 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("%s.%@"), v10, "com.apple.CoreMotionAlgorithms.Msl", v8);
  v14 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("CoreMotionAlgorithms-%@"), v13, v8);
  v15 = (_QWORD *)operator new();
  v19 = (char *)objc_msgSend_UTF8String(v11, v16, v17, v18);
  v23 = (char *)objc_msgSend_UTF8String(v14, v20, v21, v22);
  result = sub_21B88F8AC(v15, v19, v23);
  qword_25518F830 = (uint64_t)v15;
  return result;
}

void sub_21B88FA9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220766390](v1, 0x10A1C4096F084F8);
  _Unwind_Resume(a1);
}

void sub_21B88FAC4(uint64_t a1)
{
  sub_21B79827C(a1);
  JUMPOUT(0x220766390);
}

void sub_21B88FAE8(uint64_t a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[616];
  CFAbsoluteTime v6;
  char v7;

  if ((*(_BYTE *)(a1 + 3616) & 1) != 0)
  {
    v4 = sub_21B88F99C();
    sub_21B798390(v4, a1);
  }
  else
  {
    sub_21B7EFFA0((uint64_t)v5, a1);
    Current = CFAbsoluteTimeGetCurrent();
    v7 |= 1u;
    v6 = Current;
    v3 = sub_21B88F99C();
    sub_21B798390(v3, (uint64_t)v5);
    sub_21B7E877C((PB::Base *)v5);
  }
}

void sub_21B88FB60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

float *sub_21B88FB74(float *result, __int16 *a2, uint64_t a3)
{
  __int16 v3;

  for (; a3; --a3)
  {
    v3 = *a2++;
    _H0 = v3;
    __asm { FCVT            S0, H0 }
    *result = *result * _S0;
    ++result;
  }
  return result;
}

void sub_21B88FB98(float *a1, float *a2, uint64_t a3, int a4, uint64_t a5, unint64_t a6)
{
  unint64_t v6;
  uint64_t v12;
  uint64_t v13;
  _WORD *v14;
  uint64_t v15;
  _WORD *v22;
  float *v23;
  uint64_t i;
  float v25;
  float v26;
  float *v29;
  float *v30;
  float v31;
  uint64_t v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float *v38;
  unint64_t v39;
  float v40;
  float v41;

  if (!a6)
    return;
  v6 = a6;
  v12 = 0;
  v13 = a5 + 1;
  v14 = (_WORD *)(a3 + 2);
  v15 = 2 * a5 + 2;
  do
  {
    _H0 = *(_WORD *)(a3 + 2 * v12 * v13);
    __asm { FCVT            S0, H0 }
    a2[v12] = _S0;
    v22 = v14;
    v23 = a1;
    for (i = a5; i; --i)
    {
      v25 = *v23++;
      v26 = v25;
      LOWORD(v25) = *v22++;
      _H2 = LOWORD(v25);
      __asm { FCVT            S2, H2 }
      _S0 = _S0 + (float)(v26 * _S2);
      a2[v12] = _S0;
    }
    if (a4 == 1)
    {
      if (_S0 < 0.0)
        _S0 = 0.0;
    }
    else
    {
      if (a4 != 2)
        goto LABEL_11;
      _S0 = 1.0 / (float)(expf(-_S0) + 1.0);
    }
    a2[v12] = _S0;
LABEL_11:
    ++v12;
    v14 = (_WORD *)((char *)v14 + v15);
  }
  while (v12 != v6);
  if (a4 == 3)
  {
    v29 = a2;
    if (v6 >= 2)
    {
      v30 = a2 + 1;
      v31 = *a2;
      v32 = 4 * v6 - 4;
      v29 = a2;
      v33 = a2 + 1;
      do
      {
        v34 = *v33++;
        v35 = v34;
        if (v31 < v34)
        {
          v31 = v35;
          v29 = v30;
        }
        v30 = v33;
        v32 -= 4;
      }
      while (v32);
    }
    v36 = *v29;
    v37 = 0.0;
    v38 = a2;
    v39 = v6;
    do
    {
      v40 = expf(*v38 - v36);
      *v38++ = v40;
      v37 = v37 + v40;
      --v39;
    }
    while (v39);
    v41 = 1.0;
    if (v37 > 0.0000001)
      v41 = v37;
    do
    {
      *a2 = *a2 / v41;
      ++a2;
      --v6;
    }
    while (v6);
  }
}

double sub_21B88FD28(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = &off_24DF3AB88;
  *(_QWORD *)(a1 + 8) = 0x19000000000;
  *(_QWORD *)(a1 + 4816) = 0x19000000000;
  *(_QWORD *)(a1 + 8024) = 0;
  *(_DWORD *)(a1 + 8032) = 0;
  *(_QWORD *)(a1 + 8036) = 0xBF8000003F800000;
  result = 0.0;
  *(_OWORD *)(a1 + 8048) = 0u;
  *(_QWORD *)(a1 + 8064) = 0x3F80000000000000;
  return result;
}

double sub_21B88FD74(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 4816) = 0;
  *(_QWORD *)(a1 + 8024) = 0;
  *(_DWORD *)(a1 + 8032) = 0;
  *(_QWORD *)(a1 + 8036) = 0xBF8000003F800000;
  result = 0.0;
  *(_OWORD *)(a1 + 8048) = 0u;
  *(_QWORD *)(a1 + 8064) = 0x3F80000000000000;
  return result;
}

__n128 sub_21B88FDAC(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4)
{
  __n128 result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_21B88FE4C((unsigned __int16 *)(a1 + 8), a2);
  v8 = *(unsigned __int16 *)(a1 + 4818);
  v9 = *(unsigned int *)(a1 + 4820);
  v10 = *(unsigned __int16 *)(a1 + 4816);
  if (v10 + v8 >= v9)
    v11 = *(unsigned int *)(a1 + 4820);
  else
    v11 = 0;
  *(_QWORD *)(a1 + 4816 + 8 * (v10 + v8 - v11) + 8) = a4;
  if (v9 <= v8)
  {
    if (v10 + 1 < v9)
      LOWORD(v9) = 0;
    *(_WORD *)(a1 + 4816) = v10 + 1 - v9;
  }
  else
  {
    *(_WORD *)(a1 + 4818) = v8 + 1;
  }
  if ((__n128 *)(a1 + 8056) != a3)
  {
    result = *a3;
    *(__n128 *)(a1 + 8056) = *a3;
  }
  return result;
}

unsigned __int16 *sub_21B88FE4C(unsigned __int16 *result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned __int16 *v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *((unsigned int *)result + 1);
  v3 = *result + (unint64_t)result[1];
  if (v3 < v2)
    v2 = 0;
  v4 = &result[6 * (v3 - v2)];
  v5 = *(_DWORD *)(a2 + 8);
  *((_QWORD *)v4 + 1) = *(_QWORD *)a2;
  *((_DWORD *)v4 + 4) = v5;
  v6 = result[1];
  v7 = *((unsigned int *)result + 1);
  if (v7 <= v6)
  {
    v8 = *result + 1;
    if (v8 < v7)
      LOWORD(v7) = 0;
    *result = v8 - v7;
  }
  else
  {
    result[1] = v6 + 1;
  }
  return result;
}

BOOL sub_21B88FEB8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, float a5)
{
  __double2 v8;
  double sinval;
  unsigned __int8 v10;
  float64x2_t v15;
  __double2 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  __double2 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unsigned __int8 v31;
  uint64_t v32;
  float64x2_t v33;
  double v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t *v38;
  uint64_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  _OWORD *v43;
  uint64_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t *v50;
  uint64_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t *v57;
  double v58;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float64x2_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  _BOOL8 result;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float32x4_t v83;
  unint64_t v84;
  unsigned int v85;
  unsigned int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  float32x2_t *v97;
  float32x2_t *v98;
  float32_t v99;
  float32x4_t v100;
  unint64_t v101;
  float v102;
  int v103;
  int v104;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  float64x2_t v112;
  float64x2_t v113;
  double v114;
  float64x2_t v115;
  float v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  _OWORD v121[6];
  _OWORD v122[12];
  _OWORD v123[6];
  float64x2_t v124;
  float64_t v125;
  float64x2_t v126;
  float64_t v127;
  float64x2_t v128;
  float64_t v129;
  float64x2_t v130;
  float64_t v131;
  float64x2_t v132;
  float64_t v133;
  float64x2_t v134;
  float64_t v135;
  int64x2_t v136;
  __int128 v137;
  float64x2_t v138;
  float64x2_t v139;
  int64x2_t v140;
  double v141[3];
  uint64_t v142;
  double v143;
  double v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  long double v151;
  long double v152;
  long double v153;

  if (!a2)
    return 0;
  objc_msgSend_transform(a2, (const char *)a2, a3, a4);
  v143 = 0.0;
  v144 = 0.0;
  v142 = 0;
  sub_21B891244(&v144, &v143, (double *)&v142, v151, v152, v153);
  v8 = __sincos_stret(a5 * 3.14159265 / -180.0);
  sinval = v8.__sinval;
  v10 = atomic_load((unsigned __int8 *)qword_25518F680);
  __asm { FMOV            V0.2D, #1.0 }
  v115 = _Q0;
  if ((v10 & 1) == 0)
  {
    v103 = __cxa_guard_acquire(qword_25518F680);
    sinval = v8.__sinval;
    if (v103)
    {
      xmmword_25518F620 = xmmword_21B8A1410;
      *(_OWORD *)algn_25518F630 = 0u;
      xmmword_25518F640 = xmmword_21B8A1420;
      unk_25518F650 = 0u;
      xmmword_25518F660 = 0uLL;
      xmmword_25518F670 = (__int128)v115;
      __cxa_guard_release(qword_25518F680);
      sinval = v8.__sinval;
    }
  }
  v114 = -sinval;
  v16 = __sincos_stret(v144 * 3.14159265 / 180.0);
  v15.f64[0] = v16.__sinval;
  v113 = v15;
  v24 = __sincos_stret(v143 * 3.14159265 / 180.0);
  v21.f64[0] = v24.__cosval;
  v20.f64[0] = v24.__sinval;
  v26 = v145;
  v25 = v146;
  v28 = v147;
  v27 = v148;
  v30 = v149;
  v29 = v150;
  v31 = atomic_load((unsigned __int8 *)&qword_25518F700);
  if ((v31 & 1) == 0)
  {
    v111 = v146;
    v112 = v21;
    v109 = v150;
    v110 = v148;
    v107 = v147;
    v108 = v145;
    v106 = v149;
    v104 = __cxa_guard_acquire(&qword_25518F700);
    v30 = v106;
    v28 = v107;
    v26 = v108;
    v29 = v109;
    v27 = v110;
    v25 = v111;
    v21.f64[0] = v112.f64[0];
    v20.f64[0] = v24.__sinval;
    if (v104)
    {
      xmmword_25518F6A0 = 0uLL;
      __asm { FMOV            V0.2D, #-1.0 }
      xmmword_25518F6B0 = _Q0;
      xmmword_25518F6C0 = xmmword_21B8A1410;
      xmmword_25518F6D0 = 0u;
      xmmword_25518F6E0 = xmmword_21B8A1430;
      unk_25518F6F0 = 0u;
      __cxa_guard_release(&qword_25518F700);
      v30 = v106;
      v28 = v107;
      v26 = v108;
      v29 = v109;
      v27 = v110;
      v25 = v111;
      v21.f64[0] = v112.f64[0];
      v20.f64[0] = v24.__sinval;
    }
  }
  v32 = 0;
  v33.f64[0] = -v20.f64[0];
  v140 = 0u;
  *(_OWORD *)v141 = 0u;
  v34 = -(v20.f64[0] * v113.f64[0]);
  v20.f64[0] = v16.__cosval * v20.f64[0];
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v123[2] = xmmword_25518F640;
  v123[3] = unk_25518F650;
  v123[4] = xmmword_25518F660;
  v123[5] = xmmword_25518F670;
  v123[0] = xmmword_25518F620;
  v123[1] = *(_OWORD *)algn_25518F630;
  v35.f64[0] = v8.__cosval;
  v35.f64[1] = v114;
  v23.f64[0] = 0.0;
  do
  {
    v37 = (float64x2_t)v123[v32];
    v36 = (float64x2_t)v123[v32 + 1];
    v38 = (float64x2_t *)((char *)&v124 + v32 * 16);
    *v38 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v35, v37.f64[0]), (float64x2_t)v8, v37, 1), (float64x2_t)0, v36.f64[0]);
    v38[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v23, v37), v23, v37, 1), v115, v36);
    v32 += 2;
  }
  while (v32 != 6);
  v39 = 0;
  v122[0] = v26;
  v122[1] = v25;
  v122[2] = v28;
  v122[3] = v27;
  v122[4] = v30;
  v122[5] = v29;
  v21.f64[1] = v34;
  v23.f64[1] = v16.__cosval;
  do
  {
    v41 = (float64x2_t)v122[v39];
    v40 = (float64x2_t)v122[v39 + 1];
    v22.f64[0] = v16.__cosval * v21.f64[0];
    v42 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v22, v41), v20, v41, 1), v40, v113);
    v43 = &v122[v39 + 6];
    v33.f64[1] = -(v21.f64[0] * v113.f64[0]);
    *v43 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v33, v41.f64[0]), v21, v41, 1), v23, v40.f64[0]);
    v43[1] = v42;
    v39 += 2;
  }
  while (v39 != 6);
  v44 = 0;
  v45 = v124;
  v46 = v126;
  v47 = v128;
  v40.f64[0] = v125;
  v41.f64[0] = v127;
  v42.f64[0] = v129;
  *(_QWORD *)&v45.f64[1] = vextq_s8((int8x16_t)v45, (int8x16_t)v45, 8uLL).u64[0];
  *(_QWORD *)&v46.f64[1] = vextq_s8((int8x16_t)v46, (int8x16_t)v46, 8uLL).u64[0];
  *(_QWORD *)&v47.f64[1] = vextq_s8((int8x16_t)v47, (int8x16_t)v47, 8uLL).u64[0];
  do
  {
    v49 = (float64x2_t)v122[v44 + 6];
    v48 = (float64x2_t)v122[v44 + 7];
    v50 = (float64x2_t *)((char *)&v130 + v44 * 16);
    *v50 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v45, v49.f64[0]), v46, v49, 1), v47, v48.f64[0]);
    v50[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v40, v49), v41, v49, 1), v48, v42);
    v44 += 2;
  }
  while (v44 != 6);
  v51 = 0;
  v121[2] = xmmword_25518F6C0;
  v121[3] = xmmword_25518F6D0;
  v121[4] = xmmword_25518F6E0;
  v121[5] = unk_25518F6F0;
  v121[0] = xmmword_25518F6A0;
  v121[1] = xmmword_25518F6B0;
  v52 = v130;
  v53 = v132;
  v54 = v134;
  v40.f64[0] = v131;
  v41.f64[0] = v133;
  v42.f64[0] = v135;
  *(_QWORD *)&v52.f64[1] = vextq_s8((int8x16_t)v52, (int8x16_t)v52, 8uLL).u64[0];
  *(_QWORD *)&v53.f64[1] = vextq_s8((int8x16_t)v53, (int8x16_t)v53, 8uLL).u64[0];
  *(_QWORD *)&v54.f64[1] = vextq_s8((int8x16_t)v54, (int8x16_t)v54, 8uLL).u64[0];
  do
  {
    v56 = (float64x2_t)v121[v51];
    v55 = (float64x2_t)v121[v51 + 1];
    v57 = (float64x2_t *)&v136.i8[v51 * 16];
    *v57 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v52, v56.f64[0]), v53, v56, 1), v54, v55.f64[0]);
    v57[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v40, v56), v41, v56, 1), v55, v42);
    v51 += 2;
  }
  while (v51 != 6);
  v58 = *(double *)v136.i64 + v138.f64[1] + v141[0];
  if (v58 >= 0.0)
  {
    v74 = sqrt(v58 + 1.0);
    v75 = v74 + v74;
    v78 = 1.0 / v75 * vsubq_f64(v139, (float64x2_t)vdupq_laneq_s64(v140, 1)).f64[0];
    v79 = (*(double *)v140.i64 - *(double *)&v137) * (1.0 / v75);
    v80 = 1.0 / v75 * vsubq_f64((float64x2_t)vdupq_laneq_s64(v136, 1), v138).f64[0];
    v81 = v75 * 0.25;
  }
  else if (*(double *)v136.i64 < v138.f64[1] || *(double *)v136.i64 < v141[0])
  {
    v60 = sqrt(1.0 - *(double *)v136.i64 - v138.f64[1] + v141[0]);
    v61 = v60 + v60;
    v62 = 1.0 / v61;
    v63 = (*(double *)&v137 + *(double *)v140.i64) * (1.0 / v61);
    v64 = vaddq_f64(v139, (float64x2_t)vdupq_laneq_s64(v140, 1)).f64[0];
    v65 = 1.0 / v61 * v64;
    v66 = (float64x2_t)vdupq_laneq_s64(v136, 1);
    v67 = v61 * 0.25;
    v68 = v62 * vsubq_f64(v66, v138).f64[0];
    v69 = sqrt(v138.f64[1] + 1.0 - *(double *)v136.i64 - v141[0]);
    v70 = v69 + v69;
    v71 = 1.0 / v70 * vaddq_f64(v66, v138).f64[0];
    v72 = 1.0 / v70 * v64;
    if (v138.f64[1] >= v141[0])
      v78 = v71;
    else
      v78 = v63;
    if (v138.f64[1] >= v141[0])
      v79 = v70 * 0.25;
    else
      v79 = v65;
    if (v138.f64[1] >= v141[0])
      v80 = v72;
    else
      v80 = v67;
    if (v138.f64[1] >= v141[0])
      v81 = (*(double *)v140.i64 - *(double *)&v137) * (1.0 / v70);
    else
      v81 = v68;
  }
  else
  {
    v76 = sqrt(*(double *)v136.i64 + 1.0 - v138.f64[1] - v141[0]);
    v77 = v76 + v76;
    v78 = v77 * 0.25;
    v79 = 1.0 / v77 * vaddq_f64((float64x2_t)vdupq_laneq_s64(v136, 1), v138).f64[0];
    v80 = (*(double *)&v137 + *(double *)v140.i64) * (1.0 / v77);
    v81 = 1.0 / v77 * vsubq_f64(v139, (float64x2_t)vdupq_laneq_s64(v140, 1)).f64[0];
  }
  objc_msgSend_timestamp(a2, v17, v18, v19, v106, v107, v108, v109, v110, v111, *(_OWORD *)&v112);
  *(double *)v83.i64 = v82 * 1000000.0;
  v84 = (unint64_t)*(double *)v83.i64;
  v83.f32[0] = v78;
  *(float *)&v85 = v79;
  *(float *)&v86 = v80;
  v120.i64[0] = __PAIR64__(v85, v83.u32[0]);
  v83.f32[0] = v81;
  v120.i64[1] = __PAIR64__(v83.u32[0], v86);
  sub_21B89329C(&v120, v83);
  v119 = v120;
  v90 = *(unsigned __int16 *)(a1 + 4818);
  v91 = *(unsigned int *)(a1 + 4820);
  v92 = *(unsigned __int16 *)(a1 + 4816);
  if ((_DWORD)v91 == (_DWORD)v90 && *(_QWORD *)(a1 + 4824 + 8 * v92) < v84)
  {
    v93 = v90 + v92 - 1;
    v94 = v93 >= v90 ? *(unsigned __int16 *)(a1 + 4818) : 0;
    if (*(_QWORD *)(a1 + 4824 + 8 * (v93 - v94)) > v84)
    {
      if (v90 >= 2)
      {
        v95 = 1;
        v96 = v84;
        do
        {
          if (v96 >= *(_QWORD *)sub_21B88A160((unsigned __int16 *)(a1 + 4816), v95 - 1)
            && v96 < *(_QWORD *)sub_21B88A160((unsigned __int16 *)(a1 + 4816), v95))
          {
            v116 = (float)(*(_QWORD *)sub_21B88A160((unsigned __int16 *)(a1 + 4816), v95) - v96) * 0.000001;
            v97 = (float32x2_t *)sub_21B890660((unsigned __int16 *)(a1 + 8), v95 - 1);
            v98 = (float32x2_t *)sub_21B890660((unsigned __int16 *)(a1 + 8), v95);
            v99 = v116 * (float)((float)(v97[1].f32[0] + v98[1].f32[0]) * 0.5);
            *(float32x2_t *)v117.f32 = vmul_n_f32(vmul_f32(vadd_f32(*v97, *v98), (float32x2_t)0x3F0000003F000000), v116);
            v117.f32[2] = v99;
            *(double *)v100.i64 = sub_21B8931F8(&v118, v117.f32);
            sub_21B892E6C((uint64_t)&v118, v119.f32, &v117, v100);
            v119 = v117;
            v96 = *(_QWORD *)sub_21B88A160((unsigned __int16 *)(a1 + 4816), v95);
          }
          ++v95;
        }
        while (v95 < *(unsigned __int16 *)(a1 + 4818));
      }
LABEL_48:
      if ((float32x4_t *)(a1 + 8024) != &v119)
        *(float32x4_t *)(a1 + 8024) = v119;
      *(_DWORD *)(a1 + 8040) = 989432550;
      *(_QWORD *)(a1 + 8048) = v84;
      objc_msgSend_confidence(a2, v87, v88, v89);
      return v102 >= 0.85;
    }
  }
  v101 = v90 + v92 - 1;
  if (v101 < v91)
    v91 = 0;
  if (*(_QWORD *)(a1 + 8 * (v101 - v91) + 4824) == v84)
    goto LABEL_48;
  if ((float32x4_t *)(a1 + 8024) != &v119)
    *(float32x4_t *)(a1 + 8024) = v120;
  result = 0;
  *(_DWORD *)(a1 + 8040) = 989432550;
  *(_QWORD *)(a1 + 8048) = v84;
  return result;
}

os_log_t sub_21B890634()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

uint64_t sub_21B890660(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3ADC8);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[6 * (v5 - v4) + 4];
}

uint64_t sub_21B890778(float *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[310];
  uint64_t v15;
  char v16;

  sub_21B7E5CDC(v14);
  sub_21B7FD1DC(v14);
  Current = CFAbsoluteTimeGetCurrent();
  v16 |= 1u;
  *(CFAbsoluteTime *)&v14[77] = Current;
  v3 = v15;
  v4 = *(_QWORD *)a1;
  *(_BYTE *)(v15 + 40) |= 2u;
  *(_QWORD *)(v3 + 16) = v4;
  v5 = v15;
  v6 = a1[2];
  *(_BYTE *)(v15 + 40) |= 1u;
  *(double *)(v5 + 8) = v6;
  v7 = v15;
  v8 = *((char *)a1 + 12);
  *(_BYTE *)(v15 + 40) |= 4u;
  *(_DWORD *)(v7 + 24) = v8;
  v9 = v15;
  *(float *)&v6 = a1[4];
  *(_BYTE *)(v15 + 40) |= 0x10u;
  *(_DWORD *)(v9 + 32) = LODWORD(v6);
  v10 = v15;
  *(float *)&v6 = a1[5];
  *(_BYTE *)(v15 + 40) |= 8u;
  *(_DWORD *)(v10 + 28) = LODWORD(v6);
  v11 = v15;
  LOBYTE(v8) = *((_BYTE *)a1 + 24);
  *(_BYTE *)(v15 + 40) |= 0x20u;
  *(_BYTE *)(v11 + 36) = v8;
  v12 = v15;
  LOBYTE(v8) = *((_BYTE *)a1 + 25);
  *(_BYTE *)(v15 + 40) |= 0x40u;
  *(_BYTE *)(v12 + 37) = v8;
  sub_21B88FAE8((uint64_t)v14);
  return sub_21B7E877C((PB::Base *)v14);
}

void sub_21B89087C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890890(uint64_t a1, float *a2, double a3)
{
  CFAbsoluteTime Current;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[312];
  uint64_t v32;
  char v33;

  sub_21B7E5CDC(v31);
  sub_21B7FD114(v31);
  Current = CFAbsoluteTimeGetCurrent();
  v33 |= 1u;
  *(CFAbsoluteTime *)&v31[77] = Current;
  v7 = v32;
  *(_WORD *)(v32 + 92) |= 0x40u;
  *(double *)(v7 + 56) = a3;
  v8 = v32;
  v9 = *(float *)(a1 + 12);
  *(_WORD *)(v32 + 92) |= 1u;
  *(double *)(v8 + 8) = v9;
  v10 = v32;
  v11 = *(float *)(a1 + 16);
  *(_WORD *)(v32 + 92) |= 2u;
  *(double *)(v10 + 16) = v11;
  v12 = v32;
  v13 = a2[2];
  *(_WORD *)(v32 + 92) |= 4u;
  *(double *)(v12 + 24) = v13;
  v14 = v32;
  v15 = a2[3];
  *(_WORD *)(v32 + 92) |= 8u;
  *(double *)(v14 + 32) = v15;
  v16 = v32;
  v17 = a2[4];
  *(_WORD *)(v32 + 92) |= 0x10u;
  *(double *)(v16 + 40) = v17;
  v18 = v32;
  v19 = a2[5];
  *(_WORD *)(v32 + 92) |= 0x20u;
  *(double *)(v18 + 48) = v19;
  v20 = v32;
  v21 = a2[6];
  *(_WORD *)(v32 + 92) |= 0x80u;
  *(double *)(v20 + 64) = v21;
  v22 = v32;
  v23 = a2[7];
  *(_WORD *)(v32 + 92) |= 0x100u;
  *(double *)(v22 + 72) = v23;
  v24 = v32;
  v25 = *(_BYTE *)(a1 + 20);
  *(_WORD *)(v32 + 92) |= 0x800u;
  *(_BYTE *)(v24 + 88) = v25;
  v26 = v32;
  v27 = *(_DWORD *)(a1 + 24);
  *(_WORD *)(v32 + 92) |= 0x400u;
  *(_DWORD *)(v26 + 84) = v27;
  v28 = v32;
  LODWORD(v23) = *(_DWORD *)(a1 + 8);
  *(_WORD *)(v32 + 92) |= 0x200u;
  *(_DWORD *)(v28 + 80) = LODWORD(v23);
  v29 = v32;
  LOBYTE(v27) = *(_BYTE *)(a1 + 28);
  *(_WORD *)(v32 + 92) |= 0x1000u;
  *(_BYTE *)(v29 + 89) = v27;
  sub_21B88FAE8((uint64_t)v31);
  return sub_21B7E877C((PB::Base *)v31);
}

void sub_21B890A54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890A68()
{
  CFAbsoluteTime Current;
  uint64_t v1;
  double v2;
  uint64_t v3;
  _QWORD v5[311];
  uint64_t v6;
  char v7;

  sub_21B7E5CDC(v5);
  sub_21B7FD2A4(v5);
  Current = CFAbsoluteTimeGetCurrent();
  v7 |= 1u;
  *(CFAbsoluteTime *)&v5[77] = Current;
  v1 = v6;
  v2 = sub_21B833EF0();
  *(_BYTE *)(v1 + 20) |= 1u;
  *(double *)(v1 + 8) = v2;
  v3 = v6;
  *(_BYTE *)(v6 + 20) |= 2u;
  *(_BYTE *)(v3 + 16) = 1;
  sub_21B88FAE8((uint64_t)v5);
  return sub_21B7E877C((PB::Base *)v5);
}

void sub_21B890AEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890B00(double *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  double v4;
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
  _QWORD v20[93];
  uint64_t v21;
  char v22;

  sub_21B892B34();
  sub_21B7E5CDC(v20);
  sub_21B7FCFE8(v20);
  Current = CFAbsoluteTimeGetCurrent();
  v22 |= 1u;
  *(CFAbsoluteTime *)&v20[77] = Current;
  v3 = v21;
  v4 = *a1;
  *(_DWORD *)(v21 + 124) |= 0x10u;
  *(double *)(v3 + 40) = v4;
  v5 = v21;
  v6 = *((_QWORD *)a1 + 1);
  *(_DWORD *)(v21 + 124) |= 2u;
  *(_QWORD *)(v5 + 16) = v6;
  v7 = v21;
  v8 = *((_QWORD *)a1 + 2);
  *(_DWORD *)(v21 + 124) |= 4u;
  *(_QWORD *)(v7 + 24) = v8;
  v9 = v21;
  v10 = *((_QWORD *)a1 + 3);
  *(_DWORD *)(v21 + 124) |= 8u;
  *(_QWORD *)(v9 + 32) = v10;
  v11 = v21;
  v12 = *((_QWORD *)a1 + 4);
  *(_DWORD *)(v21 + 124) |= 1u;
  *(_QWORD *)(v11 + 8) = v12;
  v13 = v21;
  *(float *)&v12 = a1[8];
  *(_DWORD *)(v21 + 124) |= 0x40000u;
  *(_DWORD *)(v13 + 100) = v12;
  v14 = v21;
  *(float *)&v12 = a1[9];
  *(_DWORD *)(v21 + 124) |= 0x80000u;
  *(_DWORD *)(v14 + 104) = v12;
  v15 = v21;
  *(float *)&v12 = a1[10];
  *(_DWORD *)(v21 + 124) |= 0x100000u;
  *(_DWORD *)(v15 + 108) = v12;
  v16 = v21;
  *(float *)&v12 = a1[5];
  *(_DWORD *)(v21 + 124) |= 0x2000u;
  *(_DWORD *)(v16 + 80) = v12;
  v17 = v21;
  *(float *)&v12 = a1[6];
  *(_DWORD *)(v21 + 124) |= 0x4000u;
  *(_DWORD *)(v17 + 84) = v12;
  v18 = v21;
  *(float *)&v12 = a1[7];
  *(_DWORD *)(v21 + 124) |= 0x8000u;
  *(_DWORD *)(v18 + 88) = v12;
  sub_21B88FAE8((uint64_t)v20);
  sub_21B892B34();
  return sub_21B7E877C((PB::Base *)v20);
}

void sub_21B890CB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890CCC(uint64_t *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD v8[293];
  uint64_t v9;
  char v10;

  sub_21B7E5CDC(v8);
  sub_21B7FD240(v8);
  Current = CFAbsoluteTimeGetCurrent();
  v10 |= 1u;
  *(CFAbsoluteTime *)&v8[77] = Current;
  v3 = v9;
  v4 = *a1;
  *(_BYTE *)(v9 + 20) |= 1u;
  *(_QWORD *)(v3 + 8) = v4;
  v5 = v9;
  v6 = *((_DWORD *)a1 + 2);
  *(_BYTE *)(v9 + 20) |= 2u;
  *(_DWORD *)(v5 + 16) = v6;
  sub_21B88FAE8((uint64_t)v8);
  return sub_21B7E877C((PB::Base *)v8);
}

void sub_21B890D54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890D68(double *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[399];
  uint64_t v15;
  char v16;

  sub_21B892B34();
  sub_21B7E5CDC(v14);
  sub_21B7FD0B0(v14);
  Current = CFAbsoluteTimeGetCurrent();
  v16 |= 1u;
  *(CFAbsoluteTime *)&v14[77] = Current;
  v3 = v15;
  v4 = *a1;
  *(_BYTE *)(v15 + 56) |= 8u;
  *(double *)(v3 + 32) = v4;
  v5 = v15;
  v6 = *((_QWORD *)a1 + 1);
  *(_BYTE *)(v15 + 56) |= 0x10u;
  *(_QWORD *)(v5 + 40) = v6;
  v7 = v15;
  v8 = (unint64_t)a1[2];
  *(_BYTE *)(v15 + 56) |= 2u;
  *(_QWORD *)(v7 + 16) = v8;
  v9 = v15;
  v10 = *((_QWORD *)a1 + 3);
  *(_BYTE *)(v15 + 56) |= 0x20u;
  *(_QWORD *)(v9 + 48) = v10;
  v11 = v15;
  v12 = *((unsigned __int16 *)a1 + 16);
  *(_BYTE *)(v15 + 56) |= 1u;
  *(_QWORD *)(v11 + 8) = v12;
  sub_21B88FAE8((uint64_t)v14);
  sub_21B892B34();
  return sub_21B7E877C((PB::Base *)v14);
}

void sub_21B890E7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890E90(uint64_t a1)
{
  CFAbsoluteTime Current;
  _BOOL4 v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  _QWORD v8[426];
  uint64_t v9;
  char v10;

  sub_21B7E5CDC(v8);
  sub_21B7FD04C(v8);
  Current = CFAbsoluteTimeGetCurrent();
  v10 |= 1u;
  *(CFAbsoluteTime *)&v8[77] = Current;
  v3 = *(_DWORD *)(a1 + 8) != 1;
  v4 = v9;
  *(_BYTE *)(v9 + 16) |= 2u;
  *(_DWORD *)(v4 + 12) = v3;
  v5 = *(_DWORD *)(a1 + 12) != 1;
  v6 = v9;
  *(_BYTE *)(v9 + 16) |= 1u;
  *(_DWORD *)(v6 + 8) = v5;
  sub_21B88FAE8((uint64_t)v8);
  return sub_21B7E877C((PB::Base *)v8);
}

void sub_21B890F28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B890F3C(uint64_t *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[313];
  uint64_t v12;
  char v13;

  sub_21B7E5CDC(v11);
  sub_21B7FD178(v11);
  Current = CFAbsoluteTimeGetCurrent();
  v13 |= 1u;
  *(CFAbsoluteTime *)&v11[77] = Current;
  v3 = v12;
  v4 = *a1;
  *(_BYTE *)(v12 + 44) |= 1u;
  *(_QWORD *)(v3 + 8) = v4;
  v5 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 2);
  *(_BYTE *)(v12 + 44) |= 2u;
  *(_DWORD *)(v5 + 16) = v4;
  v6 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 3);
  *(_BYTE *)(v12 + 44) |= 0x10u;
  *(_DWORD *)(v6 + 28) = v4;
  v7 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 4);
  *(_BYTE *)(v12 + 44) |= 0x20u;
  *(_DWORD *)(v7 + 32) = v4;
  v8 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 5);
  *(_BYTE *)(v12 + 44) |= 0x40u;
  *(_DWORD *)(v8 + 36) = v4;
  v9 = v12;
  LODWORD(v4) = *((_DWORD *)a1 + 6);
  *(_BYTE *)(v12 + 44) |= 0x80u;
  *(_DWORD *)(v9 + 40) = v4;
  sub_21B88FAE8((uint64_t)v11);
  return sub_21B7E877C((PB::Base *)v11);
}

void sub_21B891024(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B891038(_QWORD *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[39];
  uint64_t v11;
  CFAbsoluteTime v12;
  char v13;

  sub_21B7E5CDC(v10);
  sub_21B7FD36C(v10);
  Current = CFAbsoluteTimeGetCurrent();
  v13 |= 1u;
  v12 = Current;
  v3 = v11;
  v4 = a1[2];
  *(_BYTE *)(v11 + 40) |= 4u;
  *(_QWORD *)(v3 + 24) = v4;
  v5 = v11;
  v6 = a1[3];
  *(_BYTE *)(v11 + 40) |= 2u;
  *(_QWORD *)(v5 + 16) = v6;
  v7 = v11;
  v8 = a1[1];
  *(_BYTE *)(v11 + 40) |= 1u;
  *(_QWORD *)(v7 + 8) = v8;
  sub_21B88FAE8((uint64_t)v10);
  return sub_21B7E877C((PB::Base *)v10);
}

void sub_21B8910D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B8910EC(float *a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  _QWORD v22[314];
  uint64_t v23;
  char v24;

  sub_21B7E5CDC(v22);
  sub_21B7FD308(v22);
  Current = CFAbsoluteTimeGetCurrent();
  v24 |= 1u;
  *(CFAbsoluteTime *)&v22[77] = Current;
  v3 = v23;
  v4 = *(_QWORD *)a1;
  *(_WORD *)(v23 + 60) |= 0x10u;
  *(_QWORD *)(v3 + 40) = v4;
  v5 = v23;
  v6 = a1[2];
  *(_WORD *)(v23 + 60) |= 2u;
  *(double *)(v5 + 16) = v6;
  v7 = v23;
  v8 = a1[3];
  *(_WORD *)(v23 + 60) |= 0x20u;
  *(double *)(v7 + 48) = v8;
  v9 = v23;
  v10 = a1[4];
  *(_WORD *)(v23 + 60) |= 8u;
  *(double *)(v9 + 32) = v10;
  v11 = v23;
  v12 = a1[5];
  *(_WORD *)(v23 + 60) |= 1u;
  *(double *)(v11 + 8) = v12;
  v13 = v23;
  v14 = a1[6];
  *(_WORD *)(v23 + 60) |= 4u;
  *(double *)(v13 + 24) = v14;
  v15 = v23;
  v16 = *((_BYTE *)a1 + 28);
  *(_WORD *)(v23 + 60) |= 0x100u;
  *(_BYTE *)(v15 + 58) = v16;
  v17 = v23;
  v18 = *((_BYTE *)a1 + 29);
  *(_WORD *)(v23 + 60) |= 0x40u;
  *(_BYTE *)(v17 + 56) = v18;
  v19 = v23;
  v20 = *((_BYTE *)a1 + 30);
  *(_WORD *)(v23 + 60) |= 0x80u;
  *(_BYTE *)(v19 + 57) = v20;
  sub_21B88FAE8((uint64_t)v22);
  return sub_21B7E877C((PB::Base *)v22);
}

void sub_21B891230(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_21B891244(double *a1, long double *a2, double *a3, long double a4, long double a5, long double a6)
{
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  __double2 v16;
  double v17;
  long double __y;

  v9 = sqrt(a5 * a5 + a4 * a4);
  *a2 = atan2(a5, a4) / 0.0174532925;
  v10 = v9 * 0.99330562;
  v11 = 0.0;
  v12 = 1.57079633;
  if (v9 * 0.99330562 != 0.0)
  {
    __y = a6;
    v13 = 0;
    v12 = 0.0;
    v14 = 0.0;
    do
    {
      v15 = v12;
      v12 = atan2(__y, v10);
      v16 = __sincos_stret(v12);
      v17 = 6378137.0 / sqrt(v16.__sinval * -0.00669437999 * v16.__sinval + 1.0);
      v11 = v9 / v16.__cosval - v17;
      if (vabdd_f64(v15, v12) >= 0.000001)
      {
        if (v13 > 8)
          goto LABEL_13;
      }
      else if (vabdd_f64(v14, v11) < 0.001 || v13 >= 9)
      {
        goto LABEL_13;
      }
      ++v13;
      v10 = v9 * (v17 / (v11 + v17) * -0.00669437999 + 1.0);
      v14 = v9 / v16.__cosval - v17;
    }
    while (v10 != 0.0);
    v12 = 1.57079633;
  }
LABEL_13:
  *a1 = v12 / 0.0174532925;
  *a3 = v11;
}

uint64_t sub_21B8913B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = 0xBFF0000000000000;
  v2 = a1 + 21164;
  *(_QWORD *)(a1 + 8) = 3212836864;
  *(_DWORD *)(a1 + 16) = 1127481344;
  v3 = a1 + 20672;
  *(_BYTE *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 2;
  *(_BYTE *)(a1 + 28) = 0;
  *(_QWORD *)(a1 + 32) = 0xBFF0000000000000;
  *(_DWORD *)(a1 + 40) = 1127481344;
  *(_QWORD *)(a1 + 52) = 0;
  *(_QWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 60) = 0;
  *(_QWORD *)(a1 + 64) = 0xBFF0000000000000;
  *(_OWORD *)(a1 + 72) = xmmword_21B8A14A0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 91) = 0;
  *(_QWORD *)(a1 + 96) = &off_24DF3AE78;
  *(_QWORD *)(a1 + 104) = 0x3F8374BC6A7EF9DBLL;
  *(_QWORD *)(a1 + 112) = 0;
  *(int32x4_t *)(a1 + 120) = vdupq_n_s32(0x7FC00000u);
  sub_21B876574(a1 + 136);
  *(_OWORD *)(a1 + 20656) = xmmword_21B8A14B0;
  *(_DWORD *)v3 = 0;
  *(_BYTE *)(v3 + 4) = 0;
  *(_QWORD *)(a1 + 20680) = 0xBFF0000000000000;
  *(_BYTE *)(a1 + 20696) = 0;
  *(_QWORD *)(a1 + 20688) = 0;
  sub_21B885E80(a1 + 20704);
  sub_21B88D224(a1 + 20944);
  *(_BYTE *)(v3 + 488) = 0;
  *(_BYTE *)v2 = 1;
  *(_DWORD *)(v2 + 20) = 4;
  *(_QWORD *)(a1 + 21176) = 0;
  *(_BYTE *)(v2 + 40) = 1;
  *(_DWORD *)(v2 + 60) = 4;
  *(_QWORD *)(a1 + 21216) = 0;
  *(_QWORD *)(a1 + 21248) = 0xBFF0000000000000;
  *(_QWORD *)(a1 + 21256) = 0;
  *(_DWORD *)(a1 + 21263) = 0;
  *(_QWORD *)(a1 + 21272) = 10000;
  *(_BYTE *)(v2 + 116) = 0;
  *(_QWORD *)(a1 + 21288) = 0xC12E848000000000;
  *(_DWORD *)(v2 + 132) = -1082130432;
  *(_QWORD *)(a1 + 21304) = 0xC12E848000000000;
  *(_BYTE *)(v2 + 148) = 0;
  *(_BYTE *)(v2 + 188) = 0;
  *(_QWORD *)(a1 + 21360) = 0;
  *(_QWORD *)(a1 + 21376) = 0;
  *(_QWORD *)(a1 + 21368) = 0;
  *(_BYTE *)(a1 + 21384) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(a1 + 21392) = _Q0;
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)(a1 + 21408) = _Q0;
  *(_WORD *)(v2 + 252) = 0;
  *(_BYTE *)(v2 + 254) = 0;
  *(int64x2_t *)(a1 + 21424) = vdupq_n_s64(0xC12E848000000000);
  *(_WORD *)(v2 + 276) = 0;
  *(_QWORD *)(v2 + 280) = 0x42C80000BF800000;
  *(_DWORD *)(v2 + 288) = 0;
  *(_BYTE *)(v2 + 292) = 0;
  *(_QWORD *)(a1 + 21464) = &off_24DF3AE78;
  *(_QWORD *)(a1 + 21480) = 0;
  *(_QWORD *)(a1 + 21472) = 0x3FDFF7CED916872BLL;
  sub_21B8915B0(a1);
  return a1;
}

void sub_21B89159C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_21B7DB900(v1);
  _Unwind_Resume(a1);
}

double sub_21B8915B0(uint64_t a1)
{
  uint64_t v2;
  double result;

  v2 = a1 + 21266;
  sub_21B886490(a1 + 20704);
  *(_OWORD *)(a1 + 21312) = xmmword_21B8A14C0;
  *(_BYTE *)v2 = 0;
  *(_QWORD *)(a1 + 8) = 3212836864;
  *(_DWORD *)(a1 + 16) = 1127481344;
  sub_21B88D228(a1 + 20944, *(_QWORD *)(a1 + 21272));
  *(_BYTE *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 2;
  sub_21B88F6BC(a1 + 21360);
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)(a1 + 21408) = _D0;
  *(_WORD *)(v2 + 150) = 0;
  *(_BYTE *)(v2 + 152) = 0;
  *(int64x2_t *)(a1 + 21424) = vdupq_n_s64(0xC12E848000000000);
  *(_WORD *)(v2 + 174) = 0;
  result = 5.27765832e13;
  *(_QWORD *)(v2 + 178) = 0x42C80000BF800000;
  *(_DWORD *)(v2 + 186) = 0;
  return result;
}

void sub_21B891668(uint64_t a1, unint64_t a2)
{
  sub_21B88D228(a1 + 20944, a2);
  *(_QWORD *)(a1 + 21272) = a2;
}

void sub_21B891698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  float32x4_t v5;
  float v6;
  double v7;
  __int128 v8;
  float v9;
  float v10;
  float v11;
  float32x2_t v12;
  float v13;
  float32x4_t v14;

  v4 = a1 + 21080;
  sub_21B892B34();
  *(_QWORD *)a1 = *(_QWORD *)a2;
  if (*(_BYTE *)(v4 + 185) && *(_BYTE *)(v4 + 186))
  {
    v5 = *(float32x4_t *)(a2 + 24);
    v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a2 + 8)), (float64x2_t)v5);
    sub_21B89329C(&v14, v5);
    v6 = *(double *)(a2 + 80);
    v12 = vmul_f32(vcvt_f32_f64(*(float64x2_t *)(a2 + 64)), (float32x2_t)vdup_n_s32(0xC11CE80A));
    v13 = v6 * -9.8067;
    sub_21B893164(v14.f32, (uint64_t)&v12);
    sub_21B88D3A0(a1 + 20944, &v12, *(double *)a2);
    if (sub_21B8815A4(a1 + 96, a2))
      sub_21B891864(a1, *(double *)a2);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)a2;
    v8 = *(_OWORD *)(a1 + 21060);
    *(_OWORD *)(a1 + 44) = v8;
    *(_DWORD *)(a1 + 60) = *(_DWORD *)(a1 + 21076);
    LODWORD(v8) = *(_DWORD *)(v4 + 64);
    *(_DWORD *)(a1 + 8) = v8;
    v9 = sub_21B8919E8(a1, v14.f32, *(double *)&v8, v7);
    v10 = (float)(*(float *)v4 + *(float *)v4) * 57.296;
    *(float *)(a1 + 12) = v9;
    *(float *)(a1 + 16) = v10;
    *(float *)(a1 + 40) = v10;
    sub_21B891A9C(a1, *(double *)a2);
    sub_21B891C10(a1, *(double *)a2);
    sub_21B892B34();
  }
  else
  {
    sub_21B8815A4(a1 + 96, a2);
    if (*(_BYTE *)(v4 + 304))
    {
      v11 = *(double *)(a1 + 21360);
      *(float *)(a1 + 8) = v11;
      *(_BYTE *)(a1 + 28) = 1;
      if (*(double *)a1 - *(double *)(a1 + 21376) > 2.0)
        *(_BYTE *)(a1 + 28) = 0;
    }
  }
}

void sub_21B891864(uint64_t a1, double a2)
{
  float *v4;
  float v5;
  float v6;
  float v10;
  float v11;
  __float2 v12;
  uint64_t v13;

  v4 = (float *)(a1 + 20952);
  v5 = *(float *)(a1 + 8);
  v6 = *(float *)(a1 + 20656) + 0.04;
  if (v6 > 1.3 && v5 >= 3.0 && v5 < 5.0)
    v6 = 1.3;
  if (v6 > 0.6 && v5 < 3.0)
    v10 = 0.6;
  else
    v10 = v6;
  if (*(_BYTE *)(a1 + 20696))
  {
    v11 = atan2f(*(float *)(a1 + 124), *(float *)(a1 + 120));
    v12 = __sincosf_stret(v11);
    v13 = *(_QWORD *)(a1 + 128);
    sub_21B892B34();
    *v4 = v10 * v12.__cosval;
    v4[1] = v10 * v12.__sinval;
    *(_QWORD *)(a1 + 20960) = v13;
    sub_21B88D824(a1 + 20944, 2, a2);
    sub_21B892B34();
    *(double *)(a1 + 21304) = a2;
  }
  else
  {
    sub_21B892B34();
    v4[4] = v10;
    sub_21B88D824(a1 + 20944, 1, a2);
    sub_21B892B34();
  }
}

float sub_21B8919E8(uint64_t a1, float *a2, double a3, double a4)
{
  uint64_t v5;
  float32x2_t v6;
  float v7;
  float v8;
  float32x2_t v10;
  float v11;

  v5 = 0;
  v11 = 0.0;
  v6 = vneg_f32(*(float32x2_t *)(a1 + 44));
  v10 = v6;
  LODWORD(a4) = 0;
  do
  {
    *(float *)&a4 = *(float *)&a4 + (float)(v10.f32[v5] * v10.f32[v5]);
    ++v5;
  }
  while (v5 != 3);
  *(float *)&a4 = sqrtf(*(float *)&a4);
  v10 = vdiv_f32(v6, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a4, 0));
  v11 = 0.0 / *(float *)&a4;
  sub_21B8930D0(a2, (uint64_t)&v10);
  v8 = v10.f32[1];
  v7 = v10.f32[0];
  if (*(_DWORD *)(a1 + 21260) == 1)
  {
    v8 = -v10.f32[1];
    v7 = -v10.f32[0];
  }
  return atan2f(v7, v8) * 57.296;
}

void sub_21B891A9C(uint64_t a1, double a2)
{
  uint64_t v3;
  double v4;
  _BOOL4 v5;
  float v9;
  int v10;
  float v11;
  float v12;
  float v13;
  int v17;

  v3 = a1 + 21160;
  v4 = a2 - *(double *)(a1 + 21312);
  v5 = v4 > 3.0;
  if (a2 - *(double *)(a1 + 21304) <= 3.0)
    v5 = 0;
  if (v4 > 5.0 && *(float *)(a1 + 8) > 15.0 || v4 > 10.0 || v5)
  {
    if (*(_BYTE *)(a1 + 21384))
    {
      v9 = *(double *)(a1 + 21360);
      *(float *)(a1 + 8) = v9;
      *(_BYTE *)(a1 + 28) = 1;
      if (*(double *)a1 - *(double *)(a1 + 21376) > 2.0)
        *(_BYTE *)(a1 + 28) = 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + 20);
  v11 = *(float *)(a1 + 16);
  if (!sub_21B8924DC(a1))
  {
    if (v10)
    {
      sub_21B892548(a1, v4 > 10.0, v11 > 120.0, v11 < 100.0);
    }
    else
    {
      v12 = *(float *)(a1 + 8);
      v13 = v12 - *(float *)(v3 + 136);
      if (v13 <= 0.0)
        v13 = -v13;
      if (v4 >= 0.5 || v11 >= 100.0 || v12 < 2.0 || v13 <= 0.5)
      {
        v17 = *(_DWORD *)(a1 + 24);
      }
      else
      {
        v17 = 0;
        *(_BYTE *)v3 = 1;
      }
      *(_DWORD *)(a1 + 24) = v17;
      *(_BYTE *)(a1 + 20) = v17 == 0;
    }
  }
}

uint64_t sub_21B891C10(uint64_t result, double a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  float *v5;
  float v6;
  _BOOL4 v8;
  float v9;
  BOOL v10;
  BOOL v11;
  double v12;
  _BOOL4 v13;
  float v14;
  float v15;
  float v16;
  char v17;
  char v18;
  double v19;
  float *v20;
  double v21;
  float v22;
  float v23;
  int32x2_t v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;
  double v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  double v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  double v66;
  __int16 v67;
  _BOOL4 v68;
  __int16 v69;
  double v70;
  __int16 v71;
  _BOOL4 v72;
  __int16 v73;
  double v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v2 = result + 21148;
  if (!*(_BYTE *)(result + 21416))
    return result;
  v3 = result;
  v4 = !*(_BYTE *)(result + 21417) && *(_BYTE *)(result + 28) && *(float *)(result + 8) < 8.0
    || *(_BYTE *)(result + 21417) != 0;
  *(_BYTE *)(result + 21417) = v4;
  v5 = (float *)(result + 80);
  v6 = *(float *)(result + 80);
  v8 = vabds_f32(v6, *(float *)(result + 21408)) > 1.7 || *(_BYTE *)(result + 21418) != 0;
  *(_BYTE *)(result + 21418) = v8;
  v9 = *(float *)v2;
  v10 = *(float *)v2 <= 0.9;
  v11 = *(float *)v2 > 0.9;
  *(_BYTE *)(result + 21456) = v11;
  if (v10)
  {
    v13 = 0;
    *(double *)(result + 21424) = a2;
    v12 = a2 - a2;
    *(_QWORD *)(result + 21444) = 0x42C80000BF800000;
    v15 = -1.0;
    v14 = 100.0;
  }
  else
  {
    v12 = a2 - *(double *)(result + 21424);
    v13 = v12 > 4.5;
    if (*(_BYTE *)(result + 28))
    {
      v14 = *(float *)(result + 8);
      v15 = *(float *)(result + 21444);
      if (v14 > v15)
        v15 = *(float *)(result + 8);
      *(float *)(result + 21444) = v15;
      if (v14 >= *(float *)(result + 21448))
        v14 = *(float *)(result + 21448);
      *(float *)(result + 21448) = v14;
    }
    else
    {
      v15 = *(float *)(result + 21444);
      v14 = *(float *)(result + 21448);
    }
  }
  v16 = v15 - v14;
  v17 = !v4;
  if (!*(_BYTE *)(result + 21160))
    v17 = 1;
  if ((v17 & 1) != 0 || v8 || !v13 || v16 <= 0.5 || *(_BYTE *)(result + 21441))
  {
    v18 = *(_BYTE *)(result + 21440);
    if (!v18)
    {
      v19 = a2;
      goto LABEL_31;
    }
  }
  else
  {
    *(_BYTE *)(result + 21440) = 1;
  }
  v19 = *(double *)(result + 21432);
  v18 = 1;
LABEL_31:
  v20 = (float *)(result + 64);
  *(double *)(result + 21432) = v19;
  v21 = a2 - v19;
  if (v9 > 0.9)
    v5 = (float *)(result + 21452);
  v22 = *v5;
  *(float *)(result + 21452) = *v5;
  v23 = vabds_f32(v22, v6);
  if (v21 > 10.0 || v23 > 1.0)
  {
    v18 = 0;
    *(_WORD *)(result + 21440) = 256;
  }
  v24 = vrev64_s32(*(int32x2_t *)(result + 21136));
  *(_QWORD *)(result + 64) = *(_QWORD *)(result + 32);
  *(int32x2_t *)(result + 72) = v24;
  *(_DWORD *)(result + 80) = *(_DWORD *)(result + 21412);
  *(float *)(result + 84) = v9;
  *(_DWORD *)(result + 88) = *(_DWORD *)(result + 21152);
  *(_BYTE *)(result + 92) = *(_BYTE *)(result + 20);
  *(_BYTE *)(result + 93) = v11;
  *(_BYTE *)(result + 94) = v18;
  v25 = *(double *)(result + 21472);
  if (v25 <= 0.0 || v25 + *(double *)(result + 21480) <= a2)
  {
    *(double *)(result + 21480) = a2;
    if (qword_25518E1C0 != -1)
      dispatch_once(&qword_25518E1C0, &unk_24DF3AE08);
    v26 = qword_25518E1C8;
    if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(v3 + 64);
      v28 = *(float *)(v3 + 72);
      v29 = *(float *)(v3 + 76);
      v30 = *(float *)(v3 + 80);
      v31 = *(unsigned __int8 *)(v3 + 92);
      v32 = *(float *)(v3 + 84);
      v33 = *(float *)(v3 + 88);
      v34 = *(unsigned __int8 *)(v3 + 93);
      v35 = *(unsigned __int8 *)(v3 + 94);
      v36 = *(unsigned __int8 *)(v2 + 269);
      v37 = *(unsigned __int8 *)(v2 + 270);
      v38 = *(unsigned __int8 *)(v2 + 293);
      v39 = 134353920;
      v40 = v27;
      v41 = 2050;
      v42 = v28;
      v43 = 2050;
      v44 = v29;
      v45 = 2050;
      v46 = v30;
      v47 = 2050;
      v48 = v32;
      v49 = 2050;
      v50 = v33;
      v51 = 1026;
      v52 = v31;
      v53 = 1026;
      v54 = v34;
      v55 = 1026;
      v56 = v35;
      v57 = 1026;
      v58 = v36;
      v59 = 1026;
      v60 = v37;
      v61 = 2050;
      v62 = v12;
      v63 = 1026;
      v64 = v13;
      v65 = 2050;
      v66 = v16;
      v67 = 1026;
      v68 = v16 > 0.5;
      v69 = 2050;
      v70 = v21;
      v71 = 1026;
      v72 = v21 > 10.0;
      v73 = 2050;
      v74 = v23;
      v75 = 1026;
      v76 = v23 > 1.0;
      v77 = 1026;
      v78 = v38;
      _os_log_impl(&dword_21B72A000, v26, OS_LOG_TYPE_DEFAULT, "CMPrecisionFindingPositionEstimator::fVerticalState,timestamp,%{public}f,horizontalDistance,%{public}f,verticalDistance,%{public}f,relativeAltitude,%{public}f,fractionAboveThreshold,%{public}f,likelihoodAboveThreshold,%{public}f,isConverged,%{public}d,isAboveBelow,%{public}d,isAboveBelowMessageShowing,%{public}d,wasInMediumRange,%{public}d,wasLevelChanged,%{public}d,timeElapsedSinceAboveBelowFractionHigh,%{public}f,isAboveBelowFractionConsistentlyHigh,%{public}d,distanceChangeSinceAboveBelowFractionHigh,%{public}f,isDistanceChangedEnoughForAboveBelowMessage,%{public}d,timeElapsedSinceAboveBelowMessageShown,%{public}f,aboveBelowMessageShownLongerThanThreshold,%{public}d,elevationChangeSinceAboveBelowMessageShown,%{public}f,isChangingLevelWhileAboveBelowMessageShowing,%{public}d,wasAboveBelowMessageShown,%{public}d", (uint8_t *)&v39, 0xA2u);
    }
  }
  return sub_21B8910EC(v20);
}

double sub_21B891FFC(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  float v7;
  double v8;
  NSObject *v9;
  float v10;
  float v11;
  int v12;
  float v13;
  float v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;

  result = *(double *)(a2 + 8);
  if (result > 0.00999999978)
  {
    v5 = a1 + 21144;
    v19 = 0u;
    v20 = 0u;
    v6 = a1 + 20704;
    sub_21B885ED8(a2, (uint64_t)&v19);
    sub_21B892B34();
    if (*(_BYTE *)(v5 + 121)
      && (v7 = *(double *)(a2 + 8), (sub_21B886398(v6, *(unsigned __int8 *)(v5 + 16), v7) & 1) != 0))
    {
      sub_21B885F04(v6, a2, (uint64_t)&v19);
      if (BYTE9(v20))
      {
        if (*(_BYTE *)(v5 + 122))
        {
          v8 = *(double *)(a2 + 8);
        }
        else
        {
          if (qword_25518E1C0 != -1)
            dispatch_once(&qword_25518E1C0, &unk_24DF3AE08);
          v9 = qword_25518E1C8;
          if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_21B72A000, v9, OS_LOG_TYPE_DEFAULT, "Particle filter successfully initialized.", v18, 2u);
          }
          *(_BYTE *)(v5 + 122) = 1;
          v8 = *(double *)(a2 + 8);
          v10 = v8;
          *(float *)(v5 + 152) = v10;
        }
        LODWORD(v20) = sub_21B886400(v6, v8);
        v11 = *(double *)(a2 + 8) - *(double *)(a1 + 21320);
        v12 = sub_21B886454(*(double *)a2 - *(double *)(a1 + 21312), v11, v6, *(unsigned __int8 *)(v5 + 16));
        v13 = *(double *)(a2 + 8);
        sub_21B88D7B8(a1 + 20944, v12, v13, *(double *)a2, *(float *)&v20);
        v14 = *(float *)v5;
        *(_DWORD *)(a1 + 8) = *(_DWORD *)v5;
        *(_BYTE *)(a1 + 28) = 1;
        sub_21B88F6C4(a1 + 21360, v14, *(double *)a2, 0.0001);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v15 = *(unsigned __int8 *)(v5 + 208);
        v16 = *(_QWORD *)(a2 + 32);
        v17 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)(a1 + 21312) = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 21328) = v17;
        *(_QWORD *)(a1 + 21344) = v16;
        if (!v15)
          *(_BYTE *)(v5 + 208) = 1;
      }
      else
      {
        sub_21B892250(a1, (double *)a2);
      }
      sub_21B890778((float *)&v19);
      sub_21B892B34();
    }
    else
    {
      sub_21B890778((float *)&v19);
      sub_21B892250(a1, (double *)a2);
    }
    *(_QWORD *)(a1 + 21392) = *(_QWORD *)(a2 + 8);
    result = *(double *)a2;
    *(_QWORD *)(a1 + 21400) = *(_QWORD *)a2;
  }
  return result;
}

double sub_21B892250(uint64_t a1, double *a2)
{
  double result;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  result = a2[1];
  if (result <= 65.0)
  {
    v7 = *(double *)(a1 + 21392);
    if (v7 >= 0.0)
    {
      v8 = *(double *)(a1 + 21400);
      if (v8 >= 0.0)
      {
        v4 = (double *)(a1 + 21360);
        v5 = *a2;
        if (*(_BYTE *)(a1 + 21384))
        {
          v9 = v5 - *(double *)(a1 + 21376);
          if (v9 <= 0.0)
            v10 = 1000000.0;
          else
            v10 = (result - *v4) / v9;
          if (v10 * v10 <= 0.5 || v10 <= 0.0)
            v6 = 0.5;
          else
            v6 = v10 * v10;
          goto LABEL_4;
        }
        v11 = v5 - v8;
        if (result < v7)
          v7 = a2[1];
        if (v11 < 1.5)
          result = v7;
        if (result <= 65.0)
        {
          v6 = 1.0;
          goto LABEL_4;
        }
      }
    }
  }
  else if (*(_BYTE *)(a1 + 21384))
  {
    v4 = (double *)(a1 + 21360);
    result = *(double *)(a1 + 21360);
    v5 = *a2;
    v6 = 1000000.0;
LABEL_4:
    sub_21B88F6C4((uint64_t)v4, result, v5, v6);
  }
  return result;
}

unsigned __int16 *sub_21B89232C(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  unsigned __int16 *result;
  unsigned int v6;

  v4 = (_BYTE *)(a1 + 21164);
  sub_21B892754((unsigned __int16 *)(a1 + 21180), (_DWORD *)(a2 + 8));
  *v4 = 1;
  v6 = *(double *)a2;
  result = sub_21B892754((unsigned __int16 *)(a1 + 21220), &v6);
  v4[40] = 1;
  return result;
}

double sub_21B89239C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  double result;
  uint8_t v7[16];

  v4 = a1 + 21256;
  if (!*(_BYTE *)(a1 + 21265)
    || *(_DWORD *)v4 != *(_DWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 21260) != *(_DWORD *)(a2 + 12))
  {
    if (qword_25518E1C0 != -1)
      dispatch_once(&qword_25518E1C0, &unk_24DF3AE08);
    v5 = qword_25518E1C8;
    if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21B72A000, v5, OS_LOG_TYPE_DEFAULT, "Wrist and crown successfully initialized.", v7, 2u);
    }
    *(_OWORD *)(a1 + 21248) = *(_OWORD *)a2;
    *(_BYTE *)(v4 + 9) = 1;
    return sub_21B885D40(a1 + 20664, (__int128 *)a2);
  }
  return result;
}

float sub_21B892484(uint64_t a1, uint64_t a2)
{
  float *v3;
  float v4;
  float result;

  v3 = (float *)(a1 + 21408);
  v4 = *(double *)(a2 + 16);
  if (!*(_BYTE *)(a1 + 21416))
  {
    *v3 = v4;
    *(_BYTE *)(a1 + 21416) = 1;
  }
  sub_21B88D7A0(a1 + 20944, v4);
  result = *(double *)(a2 + 16);
  v3[1] = result;
  return result;
}

BOOL sub_21B8924DC(uint64_t a1)
{
  _BOOL8 v2;

  v2 = sub_21B8925F0(a1);
  if (v2)
  {
    *(_BYTE *)(a1 + 20) = 0;
    *(_DWORD *)(a1 + 24) = 4;
    *(_BYTE *)(a1 + 21264) = 1;
  }
  else if (*(_BYTE *)(a1 + 21264))
  {
    sub_21B8915B0(a1);
    *(_BYTE *)(a1 + 21264) = 0;
  }
  return v2;
}

float sub_21B892548(uint64_t a1, int a2, int a3, int a4)
{
  float *v4;
  float v5;
  _BYTE *v6;
  _BOOL4 v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  double v11;
  int v12;
  float result;

  v4 = (float *)(a1 + 8);
  v5 = *(float *)(a1 + 8);
  v6 = (_BYTE *)(a1 + 21280);
  v7 = (a3 & 1) != 0 || *v6 != 0;
  v9 = v7 & (a4 ^ 1);
  v8 = v9 == 0;
  *v6 = v9;
  v10 = 32;
  if (!v8)
    v10 = 21288;
  v11 = *(double *)(a1 + v10);
  *(double *)(a1 + 21288) = v11;
  if (a3 && *(double *)(a1 + 32) - v11 > 1.5)
    v12 = 2;
  else
    v12 = *(_DWORD *)(a1 + 24);
  if (v5 < 1.75)
    v12 = 1;
  if (a2)
    v12 = 3;
  *(_DWORD *)(a1 + 24) = v12;
  *(_BYTE *)(a1 + 20) = v12 == 0;
  if (!v12)
    v4 = (float *)(a1 + 21296);
  result = *v4;
  *(float *)(a1 + 21296) = *v4;
  return result;
}

BOOL sub_21B8925F0(uint64_t a1)
{
  _WORD *v1;
  uint64_t v2;
  int v4;
  unsigned __int16 *v5;
  _DWORD *v6;
  unint64_t v8;
  unint64_t v9;
  _DWORD *v10;

  v1 = (_WORD *)(a1 + 21222);
  v2 = *(unsigned __int16 *)(a1 + 21222);
  if (*(_DWORD *)(a1 + 21224) != (_DWORD)v2)
    return 0;
  if (*(_WORD *)(a1 + 21222))
  {
    v4 = *(_DWORD *)sub_21B8927AC((unsigned __int16 *)(a1 + 21220), v2 - 1);
    LODWORD(v2) = (unsigned __int16)*v1;
    if (*v1)
      LODWORD(v2) = *(_DWORD *)sub_21B8927AC((unsigned __int16 *)(a1 + 21220), 0);
  }
  else
  {
    v4 = 0;
  }
  if ((v4 - v2) > 2)
    return 0;
  v5 = (unsigned __int16 *)(a1 + 21180);
  v6 = (_DWORD *)sub_21B8927AC(v5, 0);
  if (CLMotionActivity::indexToActivityType((CLMotionActivity *)(*v6 - 1)) - 1 < 2)
    return 0;
  v8 = 0;
  do
  {
    v9 = v8;
    if (v8 == 3)
      break;
    ++v8;
    v10 = (_DWORD *)sub_21B8927AC(v5, v9 + 1);
  }
  while (CLMotionActivity::indexToActivityType((CLMotionActivity *)(*v10 - 1)) - 1 > 1);
  return v9 > 2;
}

os_log_t sub_21B8926E8()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PrecisionFinding");
  qword_25518E1C8 = (uint64_t)result;
  return result;
}

os_log_t sub_21B892714()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

void sub_21B892740()
{
  JUMPOUT(0x220766390);
}

unsigned __int16 *sub_21B892754(unsigned __int16 *result, _DWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int16 v6;
  __int16 v7;

  v2 = result[1];
  v3 = *((unsigned int *)result + 1);
  v4 = *result;
  if (v4 + v2 < v3)
    v3 = 0;
  *(_DWORD *)&result[2 * (v4 + v2 - v3) + 4] = *a2;
  v5 = *((unsigned int *)result + 1);
  if (v5 <= v2)
  {
    v6 = v4 + 1;
    if (v4 + 1 >= v5)
      v7 = *((_DWORD *)result + 1);
    else
      v7 = 0;
    *result = v6 - v7;
  }
  else
  {
    result[1] = v2 + 1;
  }
  return result;
}

uint64_t sub_21B8927AC(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AE48);
    v7 = qword_25518E208;
    v8 = os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT);
    LODWORD(v4) = *((_DWORD *)a1 + 1);
    if (v8)
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_21B72A000, v7, OS_LOG_TYPE_FAULT, "Assertion failed: i < fCapacity, file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMQueue.h, line 233,i,%zu,capacity,%u.", (uint8_t *)&v9, 0x12u);
      LODWORD(v4) = *((_DWORD *)a1 + 1);
    }
  }
  v5 = *a1 + a2;
  if (v5 >= v4)
    v4 = v4;
  else
    v4 = 0;
  return (uint64_t)&a1[2 * (v5 - v4) + 4];
}

void sub_21B892B34()
{
  if (qword_25518F710 != -1)
    dispatch_once(&qword_25518F710, &unk_24DF3AE98);
  if (byte_25518F708)
    kdebug_trace();
}

uint64_t sub_21B892BE4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;

  v4 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, a3, a4);
  result = objc_msgSend_BOOLForKey_(v4, v5, (uint64_t)CFSTR("LogAriadneSignposts"), v6);
  byte_25518F708 = result;
  return result;
}

uint64_t *sub_21B892CFC(uint64_t *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *a1 = a2;
  *((_DWORD *)a1 + 2) = 0;
  *(uint64_t *)((char *)a1 + 12) = 0x500000000;
  a1[5] = 0x400000000;
  if (!a2 || *(unsigned __int8 *)(a2 + 16) >= 5u)
  {
    if (qword_25518E200 != -1)
      dispatch_once(&qword_25518E200, &unk_24DF3AED8);
    v4 = qword_25518E208;
    if (os_log_type_enabled((os_log_t)qword_25518E208, OS_LOG_TYPE_FAULT))
    {
      v5 = *a1;
      v6 = *(unsigned __int8 *)(*a1 + 16);
      v7 = 134218496;
      v8 = v5;
      v9 = 1024;
      v10 = v6;
      v11 = 1024;
      v12 = 4;
      _os_log_impl(&dword_21B72A000, v4, OS_LOG_TYPE_FAULT, "Assertion failed: (fIirFilterParams != __null) && (fIirFilterParams->filterOrder <= kMaxFilterOrder), file /Library/Caches/com.apple.xbs/Sources/CoreMotionAlgorithmsFramework/Oscar/CMIirFilter.cpp, line 17,IirFilterParams,%p,filterOrder,%d,maxFilterOrder,%d.", (uint8_t *)&v7, 0x18u);
    }
  }
  *((_DWORD *)a1 + 3) = 0;
  *((_DWORD *)a1 + 10) = 0;
  return a1;
}

os_log_t sub_21B892E20()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Legacy", "Generic_deprecated");
  qword_25518E208 = (uint64_t)result;
  return result;
}

double sub_21B892E6C@<D0>(uint64_t a1@<X0>, float *a2@<X1>, float32x4_t *a3@<X8>, float32x4_t a4@<Q0>)
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float32_t v9;
  float32_t v10;
  float32_t v11;
  float v12;
  double result;

  v4 = *(float *)(a1 + 8);
  a4.i32[0] = *(_DWORD *)(a1 + 12);
  v5 = a2[1];
  v6 = *(float *)(a1 + 4);
  v7 = a2[2];
  v8 = a2[3];
  v9 = (float)((float)((float)(v4 * v5) + (float)(a4.f32[0] * *a2)) - (float)(v6 * v7)) + (float)(*(float *)a1 * v8);
  v10 = (float)((float)((float)(a4.f32[0] * v5) - (float)(v4 * *a2)) + (float)(*(float *)a1 * v7)) + (float)(v6 * v8);
  v11 = (float)((float)((float)(v6 * *a2) - (float)(*(float *)a1 * v5)) + (float)(a4.f32[0] * v7)) + (float)(v4 * v8);
  v12 = (float)((float)-(float)(v6 * v5) - (float)(*(float *)a1 * *a2)) - (float)(v4 * v7);
  a3->f32[0] = v9;
  a3->f32[1] = v10;
  a4.f32[0] = v12 + (float)(a4.f32[0] * v8);
  a3->f32[2] = v11;
  a3->i32[3] = a4.i32[0];
  *(_QWORD *)&result = sub_21B89329C(a3, a4).u64[0];
  return result;
}

double sub_21B892ECC@<D0>(float32x2_t *a1@<X0>, float32x4_t *a2@<X8>, float32x4_t a3@<Q0>)
{
  __int32 v3;
  double result;

  v3 = a1[1].i32[1];
  a3.f32[0] = -a1[1].f32[0];
  *(float32x2_t *)a2->f32 = vneg_f32(*a1);
  a2->i32[2] = a3.i32[0];
  a2->i32[3] = v3;
  *(_QWORD *)&result = sub_21B89329C(a2, a3).u64[0];
  return result;
}

float32x4_t sub_21B892EEC@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  float32x4_t v2;
  float32x4_t result;

  if (a1->f32[3] >= 0.0)
  {
    result = *a1;
    *a2 = *a1;
  }
  else
  {
    v2 = vnegq_f32(*a1);
    *a2 = v2;
    result.i64[0] = sub_21B89329C(a2, v2).u64[0];
  }
  return result;
}

double sub_21B892F24@<D0>(float32x2_t *a1@<X0>, uint64_t a2@<X1>, float32x4_t *a3@<X8>, float32x4_t a4@<Q0>)
{
  __int32 v6;
  float32x4_t v7;
  double result;
  float32x4_t v9;
  float32x4_t v10;

  v6 = a1[1].i32[1];
  a4.f32[0] = -a1[1].f32[0];
  *(float32x2_t *)v9.f32 = vneg_f32(*a1);
  v9.i64[1] = __PAIR64__(v6, a4.u32[0]);
  v7 = sub_21B89329C(&v9, a4);
  sub_21B892E6C(a2, v9.f32, &v10, v7);
  *(_QWORD *)&result = sub_21B892EEC(&v10, a3).u64[0];
  return result;
}

float sub_21B892F88(float *a1)
{
  float v1;
  float v2;

  v1 = a1[1];
  v2 = (float)(*a1 * a1[2]) - (float)(a1[3] * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*a1 * *a1)) * -2.0) + 1.0);
}

float sub_21B892FC8(float *a1)
{
  return asinf((float)((float)(*a1 * a1[3]) + (float)(a1[1] * a1[2]))+ (float)((float)(*a1 * a1[3]) + (float)(a1[1] * a1[2])));
}

float sub_21B892FE0(float *a1)
{
  float v1;
  float v2;

  v1 = a1[2];
  v2 = (float)(*a1 * a1[1]) - (float)(a1[3] * v1);
  return -atan2f(v2 + v2, (float)((float)((float)(v1 * v1) + (float)(*a1 * *a1)) * -2.0) + 1.0);
}

float sub_21B893020(float *a1)
{
  uint64_t v1;
  float v2;
  float v3;
  float v4;
  float result;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  _DWORD v11[3];

  v1 = 0;
  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[1];
  result = (float)((float)(v3 * v4) - (float)(*a1 * v2)) + (float)((float)(v3 * v4) - (float)(*a1 * v2));
  v6 = (float)-(float)(v3 * *a1) - (float)(v4 * v2);
  v7 = (float)((float)((float)(v4 * v4) + (float)(*a1 * *a1)) * 2.0) + -1.0;
  *(float *)v11 = result;
  *(float *)&v11[1] = v6 + v6;
  *(float *)&v11[2] = v7;
  v8 = 0.0;
  do
  {
    v8 = v8 + (float)(*(float *)&v11[v1] * *(float *)&v11[v1]);
    ++v1;
  }
  while (v1 != 3);
  if (sqrtf(v8) > 0.00000011921)
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      v10 = v10 + (float)(*(float *)&v11[v9] * *(float *)&v11[v9]);
      ++v9;
    }
    while (v9 != 3);
    return result / sqrtf(v10);
  }
  return result;
}

void sub_21B8930D0(float *a1, uint64_t a2)
{
  int v3;
  int v4;
  float v5[9];

  sub_21B8933BC(v5, a1, 1.0);
  *(float *)a2 = sub_21B885938((uint64_t)v5, (float *)a2);
  *(_DWORD *)(a2 + 4) = v3;
  *(_DWORD *)(a2 + 8) = v4;
}

float sub_21B893118@<S0>(float *a1@<X0>, float *a2@<X8>)
{
  return sub_21B8933BC(a2, a1, 1.0);
}

float sub_21B893128(float *a1, float a2, float a3, float a4)
{
  float v5[3];
  float v6[9];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  sub_21B8933BC(v6, a1, 1.0);
  return sub_21B885938((uint64_t)v6, v5);
}

void sub_21B893164(float *a1, uint64_t a2)
{
  int v3;
  int v4;
  float v5[9];

  sub_21B8933BC(v5, a1, -1.0);
  *(float *)a2 = sub_21B885938((uint64_t)v5, (float *)a2);
  *(_DWORD *)(a2 + 4) = v3;
  *(_DWORD *)(a2 + 8) = v4;
}

float sub_21B8931AC@<S0>(float *a1@<X0>, float *a2@<X8>)
{
  return sub_21B8933BC(a2, a1, -1.0);
}

float sub_21B8931BC(float *a1, float a2, float a3, float a4)
{
  float v5[3];
  float v6[9];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  sub_21B8933BC(v6, a1, -1.0);
  return sub_21B885938((uint64_t)v6, v5);
}

double sub_21B8931F8(float32x4_t *a1, float *a2)
{
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float32x4_t v9;
  double result;

  v4 = 0;
  v5 = 0.0;
  do
  {
    v5 = v5 + (float)(a2[v4] * a2[v4]);
    ++v4;
  }
  while (v4 != 3);
  v6 = sqrtf(v5);
  v7 = 0.5;
  v8 = v6 * 0.5;
  if ((float)(v6 * 0.5) > 0.0)
    v7 = (float)(sinf(v6 * 0.5) / v8) * 0.5;
  a1->f32[0] = v7 * *a2;
  a1->f32[1] = v7 * a2[1];
  a1->f32[2] = v7 * a2[2];
  v9.f32[0] = cosf(v8);
  a1->i32[3] = v9.i32[0];
  *(_QWORD *)&result = sub_21B89329C(a1, v9).u64[0];
  return result;
}

float32x4_t sub_21B89329C(float32x4_t *a1, float32x4_t result)
{
  float v2;

  result.f32[0] = sqrtf((float)((float)((float)(a1->f32[1] * a1->f32[1]) + (float)(a1->f32[0] * a1->f32[0]))+ (float)(a1->f32[2] * a1->f32[2]))+ (float)(a1->f32[3] * a1->f32[3]));
  v2 = result.f32[0] + -1.0;
  if ((float)(result.f32[0] + -1.0) <= 0.0)
    v2 = -(float)(result.f32[0] + -1.0);
  if (v2 >= 0.00000011921)
  {
    if (result.f32[0] == 0.0)
    {
      a1->i64[0] = 0;
      a1->i64[1] = 0x3F80000000000000;
    }
    else
    {
      result = vdivq_f32(*a1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)result.f32, 0));
      *a1 = result;
    }
  }
  return result;
}

float sub_21B893300(float32x4_t *a1)
{
  uint64_t v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float32x4_t v7;
  float32x4_t v8;

  v8 = *a1;
  sub_21B892EEC(&v8, &v7);
  v1 = 0;
  v8 = v7;
  v2 = v7.f32[0];
  v3 = 0.0;
  do
  {
    v3 = v3 + (float)(v7.f32[v1] * v7.f32[v1]);
    ++v1;
  }
  while (v1 != 3);
  v4 = sqrtf(v3);
  if (v4 >= 0.00000011921)
  {
    v5 = atan2f(v4, v8.f32[3]);
    return v2 * (float)((float)(v5 + v5) / v4);
  }
  return v2;
}

float sub_21B8933BC(float *a1, float *a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float result;

  v4 = a2[2];
  v3 = a2[3];
  v5 = v3 + v3;
  v6 = *a2;
  v7 = a2[1];
  v8 = v7 + v7;
  v9 = v3 * (float)(v3 + v3);
  v10 = (float)((float)(v7 + v7) * v7) + -1.0;
  v11 = (float)((float)(v4 + v4) * v4) + -1.0;
  v12 = (float)(v6 + v6) * v7;
  v13 = (float)(v6 + v6) * v4;
  v14 = v3 * (float)(v6 + v6);
  v15 = v8 * v4;
  v16 = v3 * v8;
  v17 = v5 * v4;
  v18 = v9 + (float)((float)((float)(v6 + v6) * v6) + -1.0);
  v19 = v12 - (float)(v17 * a3);
  v20 = v13 + (float)(v16 * a3);
  v21 = v12 + (float)(v17 * a3);
  v22 = v9 + v10;
  v23 = v15 - (float)(v14 * a3);
  v24 = v13 - (float)(v16 * a3);
  result = v15 + (float)(v14 * a3);
  *a1 = v18;
  a1[1] = v19;
  a1[2] = v20;
  a1[3] = v21;
  a1[4] = v22;
  a1[5] = v23;
  a1[6] = v24;
  a1[7] = result;
  a1[8] = v9 + v11;
  return result;
}

void sub_21B89343C(float *a1)
{
  unsigned __int8 v2;
  float v3;
  float v4;
  float v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float i;
  float32x4_t v21;
  float v22[3];
  uint64_t v23;
  int v24;
  float v25[9];

  v2 = atomic_load((unsigned __int8 *)&qword_25518F720);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_25518F720))
  {
    dword_25518F718 = 1043452116;
    __cxa_guard_release(&qword_25518F720);
  }
  v5 = sub_21B893020(a1);
  v6 = 0;
  v7 = sqrtf((float)(v3 * v3) + (float)(v5 * v5));
  v8 = -1.0;
  if (v4 > v7)
    v8 = 1.0;
  v23 = 0x3F80000000000000;
  v24 = 0;
  v9 = (float)(v4 * -0.0) + (float)(v3 * v8);
  v10 = 0.0;
  v11 = (float)(v4 * 0.0) - (float)(v5 * v8);
  v12 = (float)(v3 * -0.0) + (float)(v5 * 0.0);
  v22[0] = v9;
  v22[1] = v11;
  v22[2] = v12;
  do
  {
    v10 = v10 + (float)(v22[v6] * v22[v6]);
    ++v6;
  }
  while (v6 != 3);
  v13 = sqrtf(v10);
  if (v13 <= *(float *)&dword_25518F718)
  {
    v16 = 1.0;
    v17 = 0.0;
    v15 = 0.0;
  }
  else
  {
    v14 = (float)-atan2f(v7, v4 * v8) / v13;
    v25[0] = v9 * v14;
    v25[1] = v11 * v14;
    v25[2] = v12 * v14;
    sub_21B8931F8(&v21, v25);
    sub_21B8933BC(v25, v21.f32, -1.0);
    v15 = sub_21B885938((uint64_t)v25, (float *)&v23);
  }
  v18 = sub_21B8931BC(a1, v15, v16, v17);
  for (i = atan2f(-v19, v18) * 57.296; i < 0.0; i = i + 360.0)
    ;
  for (; i >= 360.0; i = i + -360.0)
    ;
}

void sub_21B8936BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220766390](v1, 0x1080C4086865149);
  _Unwind_Resume(a1);
}

void sub_21B89388C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B893954(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B893A24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B893B50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B893DE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21B8941C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

os_log_t sub_21B8942C0()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "Motion");
  qword_25518E1E8 = (uint64_t)result;
  return result;
}

void sub_21B8944CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char *v22;
  uint64_t v23;

  v22 = a17;
  if (a17 == &a14)
  {
    v23 = 4;
    v22 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_6:
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B8946D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;

  if (objc_msgSend_isRunning(*(void **)(a1 + 32), a2, a3, a4))
    objc_msgSend_stopPencilFusionUpdates(*(void **)(a1 + 32), v5, v6, v7);
  objc_msgSend_setHandlerQueue_(*(void **)(a1 + 32), v5, *(_QWORD *)(a1 + 40), v7);
  v11 = (id)objc_msgSend_copy(*(void **)(a1 + 48), v8, v9, v10);
  objc_msgSend_setHandler_(*(void **)(a1 + 32), v12, (uint64_t)v11, v13);
  objc_msgSend_setRunning_(*(void **)(a1 + 32), v14, 1, v15);
  objc_msgSend_setCurrentEstimationUpdateIndex_(*(void **)(a1 + 32), v16, 0, v17);
  sub_21B8804B4(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void sub_21B89481C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  if (objc_msgSend_isRunning(*(void **)(a1 + 32), a2, a3, a4))
  {
    v8 = (void *)objc_msgSend_estimations(*(void **)(a1 + 32), v5, v6, v7);
    objc_msgSend_removeAllObjects(v8, v9, v10, v11);
    objc_msgSend_setRunning_(*(void **)(a1 + 32), v12, 0, v13);
    objc_msgSend_setHandler_(*(void **)(a1 + 32), v14, 0, v15);
    objc_msgSend_setHandlerQueue_(*(void **)(a1 + 32), v16, 0, v17);
    objc_msgSend_sendPencilStatistics(*(void **)(a1 + 32), v18, v19, v20);
    sub_21B880628(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    sub_21B87E6C0(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
}

void sub_21B8949F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21B894A0C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_21B894A1C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id sub_21B894A28(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id result;

  v5 = (void *)objc_msgSend_estimations(*(void **)(a1 + 32), a2, a3, a4);
  result = (id)objc_msgSend_lastObject(v5, v6, v7, v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t sub_21B894C64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float32x4_t v17;
  float v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t Object;
  const char *v90;
  uint64_t v91;
  float32x4_t v92;
  float32x4_t v93;

  result = objc_msgSend_isRunning(*(void **)(a1 + 48), a2, a3, a4);
  if ((_DWORD)result)
  {
    if (objc_msgSend_mslEnabled(*(void **)(a1 + 48), v6, v7, v8))
    {
      LODWORD(v12) = *(_DWORD *)(a1 + 64);
      LODWORD(v13) = *(_DWORD *)(a1 + 68);
      LODWORD(v14) = *(_DWORD *)(a1 + 72);
      LODWORD(v15) = *(_DWORD *)(a1 + 76);
      LODWORD(v16) = *(_DWORD *)(a1 + 80);
      objc_msgSend_logTouchAltitudeAngle_altitudeAngleConfidence_azimuthAngle_azimuthAngleConfidence_position_positionConfidence_timestamp_(*(void **)(a1 + 48), v9, v10, v11, v12, v13, v14, v15, *(double *)(a1 + 32), v16, *(double *)(a1 + 56));
    }
    sub_21B87E794(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (unint64_t)(*(double *)(a1 + 56) * 1000000.0), fabsf(*(float *)(a1 + 40)) < 0.000001, *(float *)(a1 + 68) > 0.5, *(float *)(a1 + 64), *(float *)(a1 + 72));
    sub_21B88BADC(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 8, &v93);
    v17.f32[0] = -v93.f32[2];
    *(float32x2_t *)v92.f32 = vneg_f32(*(float32x2_t *)v93.f32);
    v92.f32[2] = -v93.f32[2];
    v92.i32[3] = v93.i32[3];
    sub_21B89329C(&v92, v17);
    v18 = sub_21B87CDC4(v92.f32);
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_opt_new();
    *(float *)&v24 = v18;
    objc_msgSend_setAltitudeAngle_(v23, v25, v26, v27, v24);
    LODWORD(v28) = v20;
    objc_msgSend_setAzimuthAngle_(v23, v29, v30, v31, v28);
    LODWORD(v32) = v22;
    objc_msgSend_setRollAngle_(v23, v33, v34, v35, v32);
    objc_msgSend_setPosition_(v23, v36, v37, v38, *(double *)(a1 + 32));
    v39 = (void *)MEMORY[0x24BDD16E0];
    v40 = *(_QWORD *)(a1 + 48);
    v41 = *(_QWORD *)(v40 + 32);
    *(_QWORD *)(v40 + 32) = v41 + 1;
    v44 = objc_msgSend_numberWithUnsignedLongLong_(v39, v42, v41, v43);
    objc_msgSend_setEstimationUpdateIndex_(v23, v45, v44, v46);
    objc_msgSend_setEstimated_(v23, v47, 1, v48);
    objc_msgSend_setTimestamp_(v23, v49, v50, v51, *(double *)(a1 + 56));
    v55 = (void *)objc_msgSend_estimations(*(void **)(a1 + 48), v52, v53, v54);
    objc_msgSend_addObject_(v55, v56, (uint64_t)v23, v57);
    v61 = (void *)objc_msgSend_estimations(*(void **)(a1 + 48), v58, v59, v60);
    if ((unint64_t)objc_msgSend_count(v61, v62, v63, v64) >= 0x19)
    {
      do
      {
        v68 = (void *)objc_msgSend_estimations(*(void **)(a1 + 48), v65, v66, v67);
        objc_msgSend_removeObjectAtIndex_(v68, v69, 0, v70);
        v74 = (void *)objc_msgSend_estimations(*(void **)(a1 + 48), v71, v72, v73);
      }
      while ((unint64_t)objc_msgSend_count(v74, v75, v76, v77) > 0x18);
    }

    result = objc_msgSend_mslEnabled(*(void **)(a1 + 48), v78, v79, v80);
    if ((_DWORD)result)
    {
      v84 = *(void **)(a1 + 48);
      v85 = (void *)objc_msgSend_estimations(v84, v81, v82, v83);
      Object = objc_msgSend_lastObject(v85, v86, v87, v88);
      return objc_msgSend_logPencilFusionResult_(v84, v90, Object, v91);
    }
  }
  return result;
}

uint64_t sub_21B8953A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  float32x4_t v15;

  result = objc_msgSend_isRunning(*(void **)(a1 + 96), a2, a3, a4);
  if ((_DWORD)result)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v7 = *(_QWORD *)(a1 + 135);
    v15 = *(float32x4_t *)(a1 + 32);
    sub_21B89329C(&v15, v15);
    v8 = vmulq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 48));
    v9 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1)));
    v10 = vmulq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a1 + 64));
    v9.f32[0] = sqrtf(v9.f32[0]);
    sub_21B87F30C(v6, v7, v15.f32, v9, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0]));
    sub_21B8807F4(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8), *(_QWORD *)(a1 + 135), *(float *)(a1 + 80), *(float *)(a1 + 84), *(float *)(a1 + 88), *(float *)(a1 + 120), *(float *)(a1 + 124));
    result = objc_msgSend_mslEnabled(*(void **)(a1 + 96), v11, v12, v13);
    if ((_DWORD)result)
      return objc_msgSend_logPencilDeviceMotionQuaternion_rotationRate_acceleration_gyroBias_temperatureGyroBias_temperatureGyro_status_sensorTime_timestamp_(*(void **)(a1 + 96), v14, (int)*(float *)(a1 + 120), (int)*(float *)(a1 + 124), *(unsigned __int16 *)(a1 + 128), *(_QWORD *)(a1 + 104), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 112));
  }
  return result;
}

uint64_t sub_21B895668(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float32x4_t v16;

  result = objc_msgSend_isRunning(*(void **)(a1 + 80), a2, a3, a4);
  if ((_DWORD)result)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = (unint64_t)(*(double *)(a1 + 88) * 1000000.0);
    v16 = *(float32x4_t *)(a1 + 32);
    sub_21B89329C(&v16, v16);
    v8 = vmulq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 48));
    v9 = vmulq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a1 + 64));
    sub_21B87F904(v6, v7, (uint64_t)&v16, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0]), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]));
    result = objc_msgSend_mslEnabled(*(void **)(a1 + 80), v10, v11, v12);
    if ((_DWORD)result)
      return objc_msgSend_logHostDeviceMotionQuaternion_rotationRate_acceleration_timestamp_(*(void **)(a1 + 80), v13, v14, v15, *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 88));
  }
  return result;
}

uint64_t sub_21B895BBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = objc_msgSend_handler(*(void **)(a1 + 32), a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40), 0);
}

void sub_21B8960C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_21B896298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_21B896E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

void sub_21B896FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_21B7E877C((PB::Base *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21B8973C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  _QWORD v61[16];
  _QWORD v62[17];

  v62[16] = *MEMORY[0x24BDAC8D0];
  v61[0] = CFSTR("Axis");
  v62[0] = objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, *(unsigned int *)(a1 + 104), a4);
  v61[1] = CFSTR("MinDeltaGyroBias");
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  v62[1] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v6, v7, v8, v5);
  v61[2] = CFSTR("MeanDeltaGyroBias");
  LODWORD(v9) = *(_DWORD *)(a1 + 36);
  v62[2] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v10, v11, v12, v9);
  v61[3] = CFSTR("MaxDeltaGyroBias");
  LODWORD(v13) = *(_DWORD *)(a1 + 40);
  v62[3] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v14, v15, v16, v13);
  v61[4] = CFSTR("MinGyroBias");
  LODWORD(v17) = *(_DWORD *)(a1 + 44);
  v62[4] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v18, v19, v20, v17);
  v61[5] = CFSTR("MeanGyroBias");
  LODWORD(v21) = *(_DWORD *)(a1 + 48);
  v62[5] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v22, v23, v24, v21);
  v61[6] = CFSTR("MaxGyroBias");
  LODWORD(v25) = *(_DWORD *)(a1 + 52);
  v62[6] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v26, v27, v28, v25);
  v61[7] = CFSTR("MinGyroBiasTemperature");
  LODWORD(v29) = *(_DWORD *)(a1 + 56);
  v62[7] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v30, v31, v32, v29);
  v61[8] = CFSTR("MeanGyroBiasTemperature");
  LODWORD(v33) = *(_DWORD *)(a1 + 60);
  v62[8] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v34, v35, v36, v33);
  v61[9] = CFSTR("MaxGyroBiasTemperature");
  LODWORD(v37) = *(_DWORD *)(a1 + 64);
  v62[9] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v38, v39, v40, v37);
  v61[10] = CFSTR("MinGyroTemperature");
  LODWORD(v41) = *(_DWORD *)(a1 + 68);
  v62[10] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v42, v43, v44, v41);
  v61[11] = CFSTR("MeanGyroTemperature");
  LODWORD(v45) = *(_DWORD *)(a1 + 72);
  v62[11] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v46, v47, v48, v45);
  v61[12] = CFSTR("MaxGyroTemperature");
  LODWORD(v49) = *(_DWORD *)(a1 + 76);
  v62[12] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v50, v51, v52, v49);
  v61[13] = CFSTR("MinTimeBetweenGyroBiasUpdates");
  v62[13] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v53, *(_QWORD *)(a1 + 80), v54);
  v61[14] = CFSTR("MeanTimeBetweenGyroBiasUpdates");
  v62[14] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v55, *(_QWORD *)(a1 + 88), v56);
  v61[15] = CFSTR("MaxTimeBetweenGyroBiasUpdates");
  v62[15] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v57, *(_QWORD *)(a1 + 96), v58);
  return objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)v62, (uint64_t)v61, 16);
}

uint64_t sub_21B897668(unsigned int *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  _QWORD v67[16];
  _QWORD v68[17];

  v68[16] = *MEMORY[0x24BDAC8D0];
  v67[0] = CFSTR("ContactCondition");
  v68[0] = objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, a1[8], a4);
  v67[1] = CFSTR("MinAzimuth");
  LODWORD(v5) = a1[9];
  v68[1] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v6, v7, v8, v5);
  v67[2] = CFSTR("MeanAzimuth");
  LODWORD(v9) = a1[10];
  v68[2] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v10, v11, v12, v9);
  v67[3] = CFSTR("MaxAzimuth");
  LODWORD(v13) = a1[11];
  v68[3] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v14, v15, v16, v13);
  v67[4] = CFSTR("MinTilt");
  LODWORD(v17) = a1[12];
  v68[4] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v18, v19, v20, v17);
  v67[5] = CFSTR("MeanTilt");
  LODWORD(v21) = a1[13];
  v68[5] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v22, v23, v24, v21);
  v67[6] = CFSTR("MaxTilt");
  LODWORD(v25) = a1[14];
  v68[6] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v26, v27, v28, v25);
  v67[7] = CFSTR("MinGyroNorm");
  LODWORD(v29) = a1[15];
  v68[7] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v30, v31, v32, v29);
  v67[8] = CFSTR("MeanGyroNorm");
  LODWORD(v33) = a1[16];
  v68[8] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v34, v35, v36, v33);
  v67[9] = CFSTR("MaxGyroNorm");
  LODWORD(v37) = a1[17];
  v68[9] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v38, v39, v40, v37);
  v67[10] = CFSTR("MinGyroShaftAxisNorm");
  LODWORD(v41) = a1[18];
  v68[10] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v42, v43, v44, v41);
  v67[11] = CFSTR("MeanGyroShaftAxisNorm");
  LODWORD(v45) = a1[19];
  v68[11] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v46, v47, v48, v45);
  v67[12] = CFSTR("MaxGyroShaftAxisNorm");
  LODWORD(v49) = a1[20];
  v68[12] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v50, v51, v52, v49);
  v67[13] = CFSTR("MinUserAccelNorm");
  LODWORD(v53) = a1[21];
  v68[13] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v54, v55, v56, v53);
  v67[14] = CFSTR("MeanUserAccelNorm");
  LODWORD(v57) = a1[22];
  v68[14] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v58, v59, v60, v57);
  v67[15] = CFSTR("MaxUserAccelNorm");
  LODWORD(v61) = a1[23];
  v68[15] = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v62, v63, v64, v61);
  return objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v65, (uint64_t)v68, (uint64_t)v67, 16);
}

uint64_t sub_21B897908(uint64_t *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[12];
  _QWORD v30[13];

  v30[12] = *MEMORY[0x24BDAC8D0];
  v29[0] = CFSTR("MinAuxToRingSensorLatency");
  v30[0] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, a1[4], a4);
  v29[1] = CFSTR("MeanAuxToRingSensorLatency");
  v30[1] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v5, a1[5], v6);
  v29[2] = CFSTR("MaxAuxToRingSensorLatency");
  v30[2] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, a1[6], v8);
  v29[3] = CFSTR("MinPencilIMUSamplePeriod");
  v30[3] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v9, a1[7], v10);
  v29[4] = CFSTR("MeanPencilIMUSamplePeriod");
  v30[4] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v11, a1[8], v12);
  v29[5] = CFSTR("MaxPencilIMUSamplePeriod");
  v30[5] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v13, a1[9], v14);
  v29[6] = CFSTR("MinSourceIMUSamplePeriod");
  v30[6] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v15, a1[10], v16);
  v29[7] = CFSTR("MeanSourceIMUSamplePeriod");
  v30[7] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v17, a1[11], v18);
  v29[8] = CFSTR("MaxSourceIMUSamplePeriod");
  v30[8] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v19, a1[12], v20);
  v29[9] = CFSTR("MinRingSensorSamplePeriod");
  v30[9] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v21, a1[13], v22);
  v29[10] = CFSTR("MeanRingSensorSamplePeriod");
  v30[10] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v23, a1[14], v24);
  v29[11] = CFSTR("MaxRingSensorSamplePeriod");
  v30[11] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v25, a1[15], v26);
  return objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)v30, (uint64_t)v29, 12);
}

os_log_t sub_21B897B74()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PencilFusion");
  qword_25518E1D8 = (uint64_t)result;
  return result;
}

void sub_21B897BA0(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = a1 + 835;
  v3 = (_QWORD *)a1[838];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
    {
LABEL_6:
      sub_21B880B04(a1 + 773);
      sub_21B880D14(a1 + 702);
      sub_21B880D14(a1 + 696);
      sub_21B880D14(a1 + 538);
      sub_21B880D14(a1 + 532);
      JUMPOUT(0x220766390);
    }
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
  goto LABEL_6;
}

uint64_t sub_21B897C40(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

void sub_21B897C68(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x220766390);
}

id *sub_21B897CA0(uint64_t a1)
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_24DF3B0D8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

void sub_21B897CE0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a2 = &off_24DF3B0D8;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
}

void sub_21B897CFC(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 8));
}

void sub_21B897D04(id *a1)
{
  objc_destroyWeak(a1 + 1);
  operator delete(a1);
}

void sub_21B897D2C(uint64_t a1, unint64_t *a2, __int128 *a3)
{
  id *v3;
  unint64_t v4;
  void *v5;
  id Weak;
  const char *v7;
  uint64_t v8;
  __int128 v9;

  v3 = (id *)(a1 + 8);
  v4 = *a2;
  v9 = *a3;
  v5 = (void *)MEMORY[0x22076678C](a1, a2);
  Weak = objc_loadWeak(v3);
  objc_msgSend_updateEstimationsWithRealValuesWithQuaternion_timestamp_(Weak, v7, (uint64_t)&v9, v8, (double)v4 * 0.000001);
  objc_autoreleasePoolPop(v5);
}

uint64_t sub_21B897D94(uint64_t a1, uint64_t a2)
{
  if (sub_21B7D9FB8(a2, (uint64_t)&unk_24DF3B148))
    return a1 + 8;
  else
    return 0;
}

void *sub_21B897DD0()
{
  return &unk_24DF3B148;
}

void sub_21B8983D0(uint64_t a1)
{
  __objc2_class_ro **p_info;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  float v59;
  float v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  unint64_t v87;
  uint64_t v88;
  os_log_type_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  int v96;
  int v97;
  uint64_t v98;
  float32x4_t v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  float v106;
  uint64_t v107;
  _OWORD v108[2];
  _OWORD v109[2];
  uint8_t buf[4];
  _BYTE v111[38];
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  int v121;
  __int16 v122;
  int v123;
  __int16 v124;
  int v125;
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v3 = 4;
  switch(*(_DWORD *)(a1 + 72))
  {
    case 0:
      v3 = 1;
      goto LABEL_7;
    case 1:
      goto LABEL_6;
    case 2:
      v3 = 5;
      goto LABEL_6;
    case 3:
      v3 = 6;
      goto LABEL_6;
    case 4:
      v3 = 2;
LABEL_6:
      if (*(_BYTE *)(a1 + 68))
        goto LABEL_40;
LABEL_7:
      v4 = (void *)objc_opt_new();
      v7 = v4;
      if (*(_BYTE *)(a1 + 68))
        objc_msgSend_setConvergenceStatus_(v4, v5, 2, v6);
      else
        objc_msgSend_setConvergenceStatus_(v4, v5, 1, v6);
      objc_msgSend_setRevokeReason_(v7, v8, v3, v9);
      objc_msgSend_setDistance_(v7, v10, v11, v12, *(float *)(a1 + 56));
      objc_msgSend_setHorizontalAngle_(v7, v13, v14, v15, *(float *)(a1 + 60));
      objc_msgSend_setHorizontalAngleAccuracy_(v7, v16, v17, v18, *(float *)(a1 + 64));
      if (*(_BYTE *)(a1 + 76))
      {
        v22 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v19, v20, v21, *(float *)(a1 + 56));
        objc_msgSend_setHorizontalDistanceNumber_(v7, v23, v22, v24);
      }
      else
      {
        objc_msgSend_setHorizontalDistanceNumber_(v7, v19, 0, v21);
      }
      v28 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v25, v26, v27, *(float *)(a1 + 60));
      objc_msgSend_setHorizontalAngleNumber_(v7, v29, v28, v30);
      v34 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v31, v32, v33, *(float *)(a1 + 64));
      objc_msgSend_setHorizontalAngleAccuracyNumber_(v7, v35, v34, v36);
      v40 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v37, v38, v39, *(float *)(a1 + 64));
      objc_msgSend_setHorizontalAngleUncertaintyNumber_(v7, v41, v40, v42);
      v45 = *(_QWORD *)(a1 + 32);
      v46 = *(float *)(v45 + 92);
      v47 = *(_BYTE *)(v45 + 102) & 1;
      if ((*(_BYTE *)(v45 + 102) & 1) != 0)
        objc_msgSend_setVerticalState_(v7, v43, 2, v44);
      else
        objc_msgSend_setVerticalState_(v7, v43, 1, v44);
      v51 = (void *)objc_msgSend_delegate(*(void **)(a1 + 32), v48, v49, v50);
      objc_msgSend_didUpdatePreciseDevicePosition_withError_(v51, v52, (uint64_t)v7, 0);
      v56 = (void *)objc_msgSend_analyticsManager(*(void **)(a1 + 32), v53, v54, v55);
      objc_msgSend_feedRevokeReason_(v56, v57, *(unsigned int *)(a1 + 72), v58);
      v59 = *(float *)(a1 + 92);
      v60 = *(float *)(a1 + 100);
      v106 = *(float *)(a1 + 96);
      v107 = *(_QWORD *)(a1 + 104);
      v64 = (void *)objc_msgSend_analyticsManager(*(void **)(a1 + 32), v61, v62, v63);
      v65 = v60;
      objc_msgSend_feedEstimatedHeight_(v64, v66, v67, v68, v65);
      v72 = (void *)objc_msgSend_analyticsManager(*(void **)(a1 + 32), v69, v70, v71);
      objc_msgSend_feedFractionAboveThreshold_(v72, v73, v74, v75, v46);
      v76 = *(_OWORD *)(a1 + 64);
      v109[0] = *(_OWORD *)(a1 + 48);
      v109[1] = v76;
      v77 = *(_OWORD *)(a1 + 96);
      v108[0] = *(_OWORD *)(a1 + 80);
      v108[1] = v77;
      objc_msgSend_timestamp(*(void **)(a1 + 40), v78, v79, v80);
      sub_21B890890((uint64_t)v109, (float *)v108, v81);
      if (*(float *)(a1 + 60) > 0.0
        || (v99.i32[0] = *(_DWORD *)(a1 + 64),
            v99.f32[1] = v106,
            v99.i64[1] = v107,
            (vmaxv_u16((uint16x4_t)vmovn_s32(vcgtzq_f32(v99))) & 1) != 0)
        || v59 > 0.0)
      {
        v85 = *(_QWORD *)(a1 + 32);
        objc_msgSend_timestamp(*(void **)(a1 + 40), v82, v83, v84);
        v87 = (unint64_t)(v86 * 1000000.0);
        v88 = *(_QWORD *)(v85 + 21528);
        if (v88 && *(_QWORD *)(v85 + 21536) + v88 > v87)
        {
          v89 = OS_LOG_TYPE_INFO;
        }
        else
        {
          v89 = OS_LOG_TYPE_DEFAULT;
          *(_QWORD *)(v85 + 21536) = v87;
        }
        if (qword_25518E1C0 != -1)
          dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
        v90 = qword_25518E1C8;
        if (os_log_type_enabled((os_log_t)qword_25518E1C8, v89))
        {
          objc_msgSend_timestamp(*(void **)(a1 + 40), v91, v92, v93);
          v94 = *(float *)(a1 + 60);
          v95 = *(float *)(a1 + 64);
          v96 = *(unsigned __int8 *)(a1 + 68);
          v97 = *(_DWORD *)(a1 + 72);
          *(_DWORD *)buf = 134351616;
          *(_QWORD *)v111 = v98;
          *(_WORD *)&v111[8] = 2050;
          *(double *)&v111[10] = v94;
          *(_WORD *)&v111[18] = 2050;
          *(double *)&v111[20] = v95;
          *(_WORD *)&v111[28] = 2050;
          *(double *)&v111[30] = v59;
          v112 = 2050;
          v113 = v106;
          v114 = 2050;
          v115 = v65;
          v116 = 2050;
          v117 = *(float *)&v107;
          v118 = 2050;
          v119 = *((float *)&v107 + 1);
          v120 = 1026;
          v121 = v96;
          v122 = 1026;
          v123 = v97;
          v124 = 1026;
          v125 = v47;
          _os_log_impl(&dword_21B72A000, v90, v89, "CMAPrecisionFindingManager,timestamp,%{public}f,horizontalAngle,%{public}f,horizontalAngleUncertainty,%{public}f,positionX,%{public}f,positionY,%{public}f,positionZ,%{public}f,velocityX,%{public}f,velocityY,%{public}f,isConverged,%{public}d,revokeReason,%{public}d,verticalState,%{public}d", buf, 0x64u);
        }
      }

      return;
    default:
      if (!*(_BYTE *)(a1 + 68))
      {
        if (qword_25518E1C0 != -1)
          dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
        v100 = qword_25518E1C8;
        if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v111 = 0;
          *(_WORD *)&v111[4] = 2082;
          *(_QWORD *)&v111[6] = &unk_21B8AC24E;
          *(_WORD *)&v111[14] = 2082;
          *(_QWORD *)&v111[16] = "assert";
          *(_WORD *)&v111[24] = 2081;
          *(_QWORD *)&v111[26] = "!estimatorPosition.isConverged && revokeReason != CMAPositionRevokeReasonUnknown";
          _os_log_impl(&dword_21B72A000, v100, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"If not converged, there must be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_25518E1C0 != -1)
            dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
        }
        v101 = qword_25518E1C8;
        if (os_signpost_enabled((os_log_t)qword_25518E1C8))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v111 = 0;
          *(_WORD *)&v111[4] = 2082;
          *(_QWORD *)&v111[6] = &unk_21B8AC24E;
          *(_WORD *)&v111[14] = 2082;
          *(_QWORD *)&v111[16] = "assert";
          *(_WORD *)&v111[24] = 2081;
          *(_QWORD *)&v111[26] = "!estimatorPosition.isConverged && revokeReason != CMAPositionRevokeReasonUnknown";
          _os_signpost_emit_with_name_impl(&dword_21B72A000, v101, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "If not converged, there must be a revoke reason", "{\"msg%{public}.0s\":\"If not converged, there must be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_25518E1C0 != -1)
            dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
        }
        v102 = qword_25518E1C8;
        if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v111 = 0;
          *(_WORD *)&v111[4] = 2082;
          *(_QWORD *)&v111[6] = &unk_21B8AC24E;
          *(_WORD *)&v111[14] = 2082;
          *(_QWORD *)&v111[16] = "assert";
          *(_WORD *)&v111[24] = 2081;
          *(_QWORD *)&v111[26] = "!estimatorPosition.isConverged && revokeReason != CMAPositionRevokeReasonUnknown";
          _os_log_impl(&dword_21B72A000, v102, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"If not converged, there must be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        while (1)
        {
          abort_report_np();
LABEL_50:
          dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
LABEL_41:
          v103 = qword_25518E1C8;
          if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289539;
            *(_DWORD *)v111 = 0;
            *(_WORD *)&v111[4] = 2082;
            *(_QWORD *)&v111[6] = &unk_21B8AC24E;
            *(_WORD *)&v111[14] = 2082;
            *(_QWORD *)&v111[16] = "assert";
            *(_WORD *)&v111[24] = 2081;
            *(_QWORD *)&v111[26] = "revokeReason == CMAPositionRevokeReasonNotRevoked";
            _os_log_impl(&dword_21B72A000, v103, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"If converged, there must not be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (p_info[56] != (__objc2_class_ro *)-1)
              dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
          }
          v104 = qword_25518E1C8;
          if (os_signpost_enabled((os_log_t)qword_25518E1C8))
          {
            *(_DWORD *)buf = 68289539;
            *(_DWORD *)v111 = 0;
            *(_WORD *)&v111[4] = 2082;
            *(_QWORD *)&v111[6] = &unk_21B8AC24E;
            *(_WORD *)&v111[14] = 2082;
            *(_QWORD *)&v111[16] = "assert";
            *(_WORD *)&v111[24] = 2081;
            *(_QWORD *)&v111[26] = "revokeReason == CMAPositionRevokeReasonNotRevoked";
            _os_signpost_emit_with_name_impl(&dword_21B72A000, v104, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "If converged, there must not be a revoke reason", "{\"msg%{public}.0s\":\"If converged, there must not be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (p_info[56] != (__objc2_class_ro *)-1)
              dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
          }
          v105 = qword_25518E1C8;
          if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68289539;
            *(_DWORD *)v111 = 0;
            *(_WORD *)&v111[4] = 2082;
            *(_QWORD *)&v111[6] = &unk_21B8AC24E;
            *(_WORD *)&v111[14] = 2082;
            *(_QWORD *)&v111[16] = "assert";
            *(_WORD *)&v111[24] = 2081;
            *(_QWORD *)&v111[26] = "revokeReason == CMAPositionRevokeReasonNotRevoked";
            _os_log_impl(&dword_21B72A000, v105, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"If converged, there must not be a revoke reason\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }
        }
      }
LABEL_40:
      p_info = &OBJC_METACLASS___CMARange.info;
      if (qword_25518E1C0 == -1)
        goto LABEL_41;
      goto LABEL_50;
  }
}

void sub_21B899140(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v6 = (void *)objc_msgSend_analyticsManager(*(void **)(a1 + 32), v3, v4, v5);
  v10 = objc_msgSend_analyticsDictionary(v6, v7, v8, v9);
  v18 = (id)objc_msgSend_initWithDictionary_(v2, v11, v10, v12);
  v16 = (void *)objc_msgSend_delegate(*(void **)(a1 + 32), v13, v14, v15);
  objc_msgSend_didUpdateAnalytics_withError_(v16, v17, (uint64_t)v18, 0);

}

os_log_t sub_21B8992A8()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Motion", "PrecisionFinding");
  qword_25518E1C8 = (uint64_t)result;
  return result;
}

void sub_21B8992D4()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void sub_21B899308()
{
  JUMPOUT(0x220766390);
}

void sub_21B89931C(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_21B72A000, a2, OS_LOG_TYPE_DEBUG, "MSL config updated from user defaults %@", (uint8_t *)&v3, 0xCu);
}

void sub_21B899394(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_21B72A000, a2, OS_LOG_TYPE_FAULT, "fUserDefaults returned nil for domain: %@", (uint8_t *)&v3, 0xCu);
}

void sub_21B89940C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21B79877C(&dword_21B72A000, a1, a3, "[MSLManager] Logging is not enabled.", a5, a6, a7, a8, 0);
}

void sub_21B899440(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21B79877C(&dword_21B72A000, a1, a3, "[MSLManager] Logging Msl item.", a5, a6, a7, a8, 0);
}

void sub_21B899474()
{
  __assert_rtn("setFlushTimeoutSeconds_block_invoke", "MSLWriter.cpp", 56, "(fFd == -1) && (\"Writer::setFlushTimeout() must be called before ::open().\")");
}

void sub_21B89949C(uint64_t a1, _QWORD *a2, os_log_t log)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 39) < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136446210;
  v4 = a2;
  _os_log_error_impl(&dword_21B72A000, log, OS_LOG_TYPE_ERROR, "Unable to create directory at path: %{public}s", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_21B899520(os_log_t log)
{
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "assert";
  v4 = 2080;
  v5 = "fValid";
  v6 = 2080;
  v7 = "On call to writeItem client should check if the logger was opened";
  _os_log_fault_impl(&dword_21B72A000, log, OS_LOG_TYPE_FAULT, "Event: %s\n Condition: %s\n Message: %s", (uint8_t *)&v2, 0x20u);
  if (qword_25518E2E0 == -1)
    return 1;
  dispatch_once(&qword_25518E2E0, &unk_24DF35950);
  return 0;
}

void sub_21B8995F4(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t CLMotionActivity::indexToActivityType(CLMotionActivity *this)
{
  return MEMORY[0x24BDC1450](this);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x24BE7B1E8](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x24BE7B1F0]();
}

{
  return MEMORY[0x24BE7B1F8]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x24BE7B200](this, a2);
}

{
  return MEMORY[0x24BE7B218](this, a2);
}

{
  return MEMORY[0x24BE7B220](this, a2);
}

{
  return MEMORY[0x24BE7B228](this, a2);
}

{
  return MEMORY[0x24BE7B230](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x24BE7B208](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x24BE7B210](this, a2, a3);
}

uint64_t PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  return MEMORY[0x24BE7B238](this);
}

void PB::Base::~Base(PB::Base *this)
{
  MEMORY[0x24BE7B240](this);
}

uint64_t PB::Data::Data()
{
  return MEMORY[0x24BE7B250]();
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x24BE7B258]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x24BE7B260]();
}

{
  return MEMORY[0x24BE7B268]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x24BE7B270](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x24BE7B278]();
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x24BE7B288](this);
}

{
  return MEMORY[0x24BE7B290](this);
}

{
  return MEMORY[0x24BE7B298](this);
}

{
  return MEMORY[0x24BE7B2A0](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x24BE7B2A8](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x24BE7B2B0]();
}

{
  return MEMORY[0x24BE7B2B8]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x24BE7B2C0](this);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x24BE7B2C8](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x24BE7B2D0](this, a2);
}

uint64_t PB::Writer::writeSInt(PB::Writer *this)
{
  return MEMORY[0x24BE7B2D8](this);
}

{
  return MEMORY[0x24BE7B2E0](this);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x24BE7B2E8](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x24BE7B2F0](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

uint64_t std::time_put<char,std::ostreambuf_iterator<char>>::put()
{
  return MEMORY[0x24BEDAA80]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
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

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAD08](this, __c);
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
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF80]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
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

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
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

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x24BEDB3F8](__t);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24DF30808(__p);
}

uint64_t operator delete()
{
  return off_24DF30810();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DF30818(__sz);
}

uint64_t operator new()
{
  return off_24DF30820();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
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

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E8](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x24BEDF1F0](strm);
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

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
  MEMORY[0x24BDADDF8](channel, barrier);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x24BDADE08](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x24BDADE38](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
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

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}


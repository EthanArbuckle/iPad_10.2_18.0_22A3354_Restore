uint64_t CMMsl::WalkingDetectionResult::readFrom(CMMsl::WalkingDetectionResult *this, PB::Reader *a2)
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
  int v20;
  BOOL v21;
  int v22;
  BOOL v23;
  int v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  int v32;
  BOOL v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_21;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      v2 = *((_QWORD *)a2 + 1);
      goto LABEL_106;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_21:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        *((_WORD *)this + 30) |= 8u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 6) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 2u:
        *((_WORD *)this + 30) |= 0x10u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 7) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 3u:
        *((_WORD *)this + 30) |= 0x20u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 8) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 4u:
        *((_WORD *)this + 30) |= 0x40u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 9) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 5u:
        *((_WORD *)this + 30) |= 0x200u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 12) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 6u:
        *((_WORD *)this + 30) |= 0x100u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 11) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 7u:
        *((_WORD *)this + 30) |= 0x400u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 13) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 8u:
        *((_WORD *)this + 30) |= 0x4000u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v21 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v20 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v21 = v20 != 0;
        }
        *((_BYTE *)this + 59) = v21;
        break;
      case 9u:
        *((_WORD *)this + 30) |= 0x2000u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v23 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v22 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v23 = v22 != 0;
        }
        *((_BYTE *)this + 58) = v23;
        break;
      case 0xAu:
        *((_WORD *)this + 30) |= 0x1000u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v25 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v24 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v25 = v24 != 0;
        }
        *((_BYTE *)this + 57) = v25;
        break;
      case 0xBu:
        *((_WORD *)this + 30) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v27 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          v40 = 0;
          v41 = 0;
          v30 = 0;
          if (v2 <= v26)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v26)
            {
              v30 = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_100;
            }
            v42 = v26++;
            v43 = *(_BYTE *)(v27 + v42);
            *((_QWORD *)a2 + 1) = v26;
            v30 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0)
              break;
            v40 += 7;
            v14 = v41++ > 8;
            if (v14)
            {
              v30 = 0;
LABEL_99:
              v2 = v42 + 1;
              goto LABEL_100;
            }
          }
          if (*((_BYTE *)a2 + 24))
            v30 = 0;
          goto LABEL_99;
        }
        v28 = 0;
        v29 = 0;
        v30 = 0;
        do
        {
          v2 = v26 + 1;
          *((_QWORD *)a2 + 1) = v26 + 1;
          v31 = *(_BYTE *)(v27 + v26);
          v30 |= (unint64_t)(v31 & 0x7F) << v28;
          if ((v31 & 0x80) == 0)
            goto LABEL_100;
          v28 += 7;
          v26 = v2;
          v14 = v29++ > 8;
        }
        while (!v14);
        v30 = 0;
LABEL_100:
        *((_QWORD *)this + 1) = v30;
        break;
      case 0xCu:
        *((_WORD *)this + 30) |= 0x800u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v33 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v32 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v33 = v32 != 0;
        }
        *((_BYTE *)this + 56) = v33;
        break;
      case 0xDu:
        *((_WORD *)this + 30) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
          goto LABEL_64;
        *((_DWORD *)this + 4) = *(_DWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_95;
      case 0xEu:
        *((_WORD *)this + 30) |= 4u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((_QWORD *)a2 + 2))
        {
          *((_DWORD *)this + 5) = *(_DWORD *)(*(_QWORD *)a2 + v2);
LABEL_95:
          v2 = *((_QWORD *)a2 + 1) + 4;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
LABEL_64:
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 0xFu:
        *((_WORD *)this + 30) |= 0x80u;
        v34 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v35 = *(_QWORD *)a2;
        if (v34 > 0xFFFFFFFFFFFFFFF5 || v34 + 10 > v2)
        {
          v44 = 0;
          v45 = 0;
          v38 = 0;
          if (v2 <= v34)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v34)
            {
              LODWORD(v38) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_105;
            }
            v46 = v34++;
            v47 = *(_BYTE *)(v35 + v46);
            *((_QWORD *)a2 + 1) = v34;
            v38 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0)
              break;
            v44 += 7;
            v14 = v45++ > 8;
            if (v14)
            {
              LODWORD(v38) = 0;
LABEL_104:
              v2 = v46 + 1;
              goto LABEL_105;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v38) = 0;
          goto LABEL_104;
        }
        v36 = 0;
        v37 = 0;
        v38 = 0;
        do
        {
          v2 = v34 + 1;
          *((_QWORD *)a2 + 1) = v34 + 1;
          v39 = *(_BYTE *)(v35 + v34);
          v38 |= (unint64_t)(v39 & 0x7F) << v36;
          if ((v39 & 0x80) == 0)
            goto LABEL_105;
          v36 += 7;
          v34 = v2;
          v14 = v37++ > 8;
        }
        while (!v14);
        LODWORD(v38) = 0;
LABEL_105:
        *((_DWORD *)this + 10) = v38;
        break;
      default:
        goto LABEL_19;
    }
LABEL_106:
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t CMMsl::WalkingDetectionResult::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  __int16 v4;

  v3 = this;
  v4 = *(_WORD *)(this + 60);
  if ((v4 & 8) != 0)
  {
    this = PB::Writer::write(a2, *(float *)(this + 24));
    v4 = *(_WORD *)(v3 + 60);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(float *)(v3 + 28));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  this = PB::Writer::write(a2, *(float *)(v3 + 32));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x40) == 0)
  {
LABEL_5:
    if ((v4 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  this = PB::Writer::write(a2, *(float *)(v3 + 36));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x200) == 0)
  {
LABEL_6:
    if ((v4 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  this = PB::Writer::write(a2, *(float *)(v3 + 48));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x100) == 0)
  {
LABEL_7:
    if ((v4 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  this = PB::Writer::write(a2, *(float *)(v3 + 44));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x400) == 0)
  {
LABEL_8:
    if ((v4 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  this = PB::Writer::write(a2, *(float *)(v3 + 52));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x4000) == 0)
  {
LABEL_9:
    if ((v4 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  this = PB::Writer::write(a2);
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x2000) == 0)
  {
LABEL_10:
    if ((v4 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  this = PB::Writer::write(a2);
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x1000) == 0)
  {
LABEL_11:
    if ((v4 & 1) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  this = PB::Writer::write(a2);
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 1) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 2) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  this = PB::Writer::write(a2);
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 2) == 0)
  {
LABEL_14:
    if ((v4 & 4) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  this = PB::Writer::write(a2, *(float *)(v3 + 16));
  v4 = *(_WORD *)(v3 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_15:
    if ((v4 & 0x80) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_30:
  this = PB::Writer::write(a2, *(float *)(v3 + 20));
  if ((*(_WORD *)(v3 + 60) & 0x80) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t CMMsl::WalkingDetectionResult::hash_value(CMMsl::WalkingDetectionResult *this)
{
  __int16 v1;
  uint64_t v2;
  float v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  float v25;

  v1 = *((_WORD *)this + 30);
  if ((v1 & 8) == 0)
  {
    v2 = 0;
    if ((v1 & 0x10) != 0)
      goto LABEL_3;
LABEL_36:
    v4 = 0;
    if ((v1 & 0x20) != 0)
      goto LABEL_6;
LABEL_37:
    v6 = 0;
    if ((v1 & 0x40) != 0)
      goto LABEL_9;
LABEL_38:
    v8 = 0;
    if ((*((_WORD *)this + 30) & 0x200) != 0)
      goto LABEL_12;
LABEL_39:
    v10 = 0;
    if ((*((_WORD *)this + 30) & 0x100) != 0)
      goto LABEL_15;
LABEL_40:
    v12 = 0;
    if ((*((_WORD *)this + 30) & 0x400) != 0)
      goto LABEL_18;
LABEL_41:
    v14 = 0;
    if ((*((_WORD *)this + 30) & 0x4000) != 0)
      goto LABEL_21;
    goto LABEL_42;
  }
  v25 = *((float *)this + 6);
  v2 = LODWORD(v25);
  if (v25 == 0.0)
    v2 = 0;
  if ((v1 & 0x10) == 0)
    goto LABEL_36;
LABEL_3:
  v3 = *((float *)this + 7);
  v4 = LODWORD(v3);
  if (v3 == 0.0)
    v4 = 0;
  if ((v1 & 0x20) == 0)
    goto LABEL_37;
LABEL_6:
  v5 = *((float *)this + 8);
  v6 = LODWORD(v5);
  if (v5 == 0.0)
    v6 = 0;
  if ((v1 & 0x40) == 0)
    goto LABEL_38;
LABEL_9:
  v7 = *((float *)this + 9);
  v8 = LODWORD(v7);
  if (v7 == 0.0)
    v8 = 0;
  if ((*((_WORD *)this + 30) & 0x200) == 0)
    goto LABEL_39;
LABEL_12:
  v9 = *((float *)this + 12);
  v10 = LODWORD(v9);
  if (v9 == 0.0)
    v10 = 0;
  if ((*((_WORD *)this + 30) & 0x100) == 0)
    goto LABEL_40;
LABEL_15:
  v11 = *((float *)this + 11);
  v12 = LODWORD(v11);
  if (v11 == 0.0)
    v12 = 0;
  if ((*((_WORD *)this + 30) & 0x400) == 0)
    goto LABEL_41;
LABEL_18:
  v13 = *((float *)this + 13);
  v14 = LODWORD(v13);
  if (v13 == 0.0)
    v14 = 0;
  if ((*((_WORD *)this + 30) & 0x4000) != 0)
  {
LABEL_21:
    v15 = *((unsigned __int8 *)this + 59);
    if ((*((_WORD *)this + 30) & 0x2000) != 0)
      goto LABEL_22;
    goto LABEL_43;
  }
LABEL_42:
  v15 = 0;
  if ((*((_WORD *)this + 30) & 0x2000) != 0)
  {
LABEL_22:
    v16 = *((unsigned __int8 *)this + 58);
    if ((*((_WORD *)this + 30) & 0x1000) != 0)
      goto LABEL_23;
    goto LABEL_44;
  }
LABEL_43:
  v16 = 0;
  if ((*((_WORD *)this + 30) & 0x1000) != 0)
  {
LABEL_23:
    v17 = *((unsigned __int8 *)this + 57);
    if ((v1 & 1) != 0)
      goto LABEL_24;
    goto LABEL_45;
  }
LABEL_44:
  v17 = 0;
  if ((v1 & 1) != 0)
  {
LABEL_24:
    v18 = *((_QWORD *)this + 1);
    if ((*((_WORD *)this + 30) & 0x800) != 0)
      goto LABEL_25;
    goto LABEL_46;
  }
LABEL_45:
  v18 = 0;
  if ((*((_WORD *)this + 30) & 0x800) != 0)
  {
LABEL_25:
    v19 = *((unsigned __int8 *)this + 56);
    if ((v1 & 2) != 0)
      goto LABEL_26;
LABEL_47:
    v21 = 0;
    if ((v1 & 4) != 0)
      goto LABEL_29;
    goto LABEL_48;
  }
LABEL_46:
  v19 = 0;
  if ((v1 & 2) == 0)
    goto LABEL_47;
LABEL_26:
  v20 = *((float *)this + 4);
  v21 = LODWORD(v20);
  if (v20 == 0.0)
    v21 = 0;
  if ((v1 & 4) != 0)
  {
LABEL_29:
    v22 = *((float *)this + 5);
    v23 = LODWORD(v22);
    if (v22 == 0.0)
      v23 = 0;
    if ((v1 & 0x80) != 0)
      goto LABEL_32;
LABEL_49:
    v24 = 0;
    return v4 ^ v2 ^ v6 ^ v8 ^ v10 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v23 ^ v24;
  }
LABEL_48:
  v23 = 0;
  if ((v1 & 0x80) == 0)
    goto LABEL_49;
LABEL_32:
  v24 = *((unsigned int *)this + 10);
  return v4 ^ v2 ^ v6 ^ v8 ^ v10 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v23 ^ v24;
}

void CMMsl::WalkingSteadinessClassification::~WalkingSteadinessClassification(CMMsl::WalkingSteadinessClassification *this)
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

  *(_QWORD *)this = &off_251361BC8;
  v2 = *((_QWORD *)this + 21);
  *((_QWORD *)this + 21) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 20);
  *((_QWORD *)this + 20) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 19);
  *((_QWORD *)this + 19) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 18);
  *((_QWORD *)this + 18) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = *((_QWORD *)this + 17);
  *((_QWORD *)this + 17) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = *((_QWORD *)this + 13);
  *((_QWORD *)this + 13) = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  v11 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v12 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  v13 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  PB::Base::~Base(this);
}

{
  CMMsl::WalkingSteadinessClassification::~WalkingSteadinessClassification(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WalkingSteadinessClassification *CMMsl::WalkingSteadinessClassification::WalkingSteadinessClassification(CMMsl::WalkingSteadinessClassification *this, const CMMsl::WalkingSteadinessClassification *a2)
{
  uint64_t *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CMMsl::SteadinessEvent *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CMMsl::SteadinessModelGaitBaselineFeatures *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CMMsl::SteadinessModelContinuousWalkingFeatures *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CMMsl::SteadinessModelTemporalDispersionFeatures *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CMMsl::SteadinessModelTemporalEntropyFeatures *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  CMMsl::SteadinessModelBalanceFeatures *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CMMsl::SteadinessModelHarmonicFeatures *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  int v59;
  int v60;
  int v61;
  char v62;
  int v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;

  *(_QWORD *)this = &off_251361BC8;
  *((_QWORD *)this + 8) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  v4 = (uint64_t *)((char *)this + 88);
  *((_DWORD *)this + 61) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *((_QWORD *)this + 21) = 0;
  v5 = *((_DWORD *)a2 + 61);
  if ((v5 & 0x100) != 0)
  {
    v7 = *((_QWORD *)a2 + 10);
    v6 = 256;
    *((_DWORD *)this + 61) = 256;
    *((_QWORD *)this + 10) = v7;
    v5 = *((_DWORD *)a2 + 61);
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 0;
  if ((v5 & 0x80) != 0)
  {
LABEL_5:
    v8 = *((_QWORD *)a2 + 9);
    v6 |= 0x80u;
    *((_DWORD *)this + 61) = v6;
    *((_QWORD *)this + 9) = v8;
    v5 = *((_DWORD *)a2 + 61);
  }
LABEL_6:
  if ((v5 & 0x10000) != 0)
  {
    v59 = *((_DWORD *)a2 + 55);
    v6 |= 0x10000u;
    *((_DWORD *)this + 61) = v6;
    *((_DWORD *)this + 55) = v59;
    v5 = *((_DWORD *)a2 + 61);
    if ((v5 & 0x8000) == 0)
    {
LABEL_8:
      if ((v5 & 0x40000) == 0)
        goto LABEL_9;
      goto LABEL_74;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_8;
  }
  v60 = *((_DWORD *)a2 + 54);
  v6 |= 0x8000u;
  *((_DWORD *)this + 61) = v6;
  *((_DWORD *)this + 54) = v60;
  v5 = *((_DWORD *)a2 + 61);
  if ((v5 & 0x40000) == 0)
  {
LABEL_9:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_75;
  }
LABEL_74:
  v61 = *((_DWORD *)a2 + 57);
  v6 |= 0x40000u;
  *((_DWORD *)this + 61) = v6;
  *((_DWORD *)this + 57) = v61;
  v5 = *((_DWORD *)a2 + 61);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_76;
  }
LABEL_75:
  v62 = *((_BYTE *)a2 + 241);
  v6 |= 0x2000000u;
  *((_DWORD *)this + 61) = v6;
  *((_BYTE *)this + 241) = v62;
  v5 = *((_DWORD *)a2 + 61);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_77;
  }
LABEL_76:
  v63 = *((_DWORD *)a2 + 58);
  v6 |= 0x80000u;
  *((_DWORD *)this + 61) = v6;
  *((_DWORD *)this + 58) = v63;
  v5 = *((_DWORD *)a2 + 61);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
LABEL_78:
    v65 = *((_QWORD *)a2 + 22);
    v6 |= 0x200u;
    *((_DWORD *)this + 61) = v6;
    *((_QWORD *)this + 22) = v65;
    if ((*((_DWORD *)a2 + 61) & 0x400000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_77:
  v64 = *((_BYTE *)a2 + 242);
  v6 |= 0x4000000u;
  *((_DWORD *)this + 61) = v6;
  *((_BYTE *)this + 242) = v64;
  v5 = *((_DWORD *)a2 + 61);
  if ((v5 & 0x200) != 0)
    goto LABEL_78;
LABEL_13:
  if ((v5 & 0x400000) != 0)
  {
LABEL_14:
    v9 = *((_BYTE *)a2 + 238);
    *((_DWORD *)this + 61) = v6 | 0x400000;
    *((_BYTE *)this + 238) = v9;
  }
LABEL_15:
  if (*((_QWORD *)a2 + 8))
  {
    v10 = (CMMsl::SteadinessEvent *)operator new();
    v11 = CMMsl::SteadinessEvent::SteadinessEvent(v10, *((const CMMsl::SteadinessEvent **)a2 + 8));
    v12 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v13;
    if (v12)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v12 + 8))(v12, v11);
  }
  v14 = *((_DWORD *)a2 + 61);
  if ((v14 & 0x800) != 0)
  {
    v66 = *((_QWORD *)a2 + 24);
    *((_DWORD *)this + 61) |= 0x800u;
    *((_QWORD *)this + 24) = v66;
    v14 = *((_DWORD *)a2 + 61);
    if ((v14 & 0x800000) == 0)
    {
LABEL_20:
      if ((v14 & 0x400) == 0)
        goto LABEL_21;
LABEL_82:
      v68 = *((_QWORD *)a2 + 23);
      *((_DWORD *)this + 61) |= 0x400u;
      *((_QWORD *)this + 23) = v68;
      if ((*((_DWORD *)a2 + 61) & 0x200000) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((v14 & 0x800000) == 0)
  {
    goto LABEL_20;
  }
  v67 = *((_BYTE *)a2 + 239);
  *((_DWORD *)this + 61) |= 0x800000u;
  *((_BYTE *)this + 239) = v67;
  v14 = *((_DWORD *)a2 + 61);
  if ((v14 & 0x400) != 0)
    goto LABEL_82;
LABEL_21:
  if ((v14 & 0x200000) != 0)
  {
LABEL_22:
    v15 = *((_BYTE *)a2 + 237);
    *((_DWORD *)this + 61) |= 0x200000u;
    *((_BYTE *)this + 237) = v15;
  }
LABEL_23:
  if (*((_QWORD *)a2 + 15))
  {
    v16 = operator new();
    v17 = CMMsl::SteadinessModelResult::SteadinessModelResult(v16, *((const CMMsl::SteadinessModelResult **)a2 + 15));
    v18 = *((_QWORD *)this + 15);
    *((_QWORD *)this + 15) = v17;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  }
  if (*((_QWORD *)a2 + 14))
  {
    v19 = (CMMsl::SteadinessModelGaitBaselineFeatures *)operator new();
    v20 = CMMsl::SteadinessModelGaitBaselineFeatures::SteadinessModelGaitBaselineFeatures(v19, *((const CMMsl::SteadinessModelGaitBaselineFeatures **)a2 + 14));
    v21 = *((_QWORD *)this + 14);
    *((_QWORD *)this + 14) = v22;
    if (v21)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v21 + 8))(v21, v20);
  }
  if (*((_QWORD *)a2 + 13))
  {
    v23 = operator new();
    v24 = CMMsl::SteadinessModelResult::SteadinessModelResult(v23, *((const CMMsl::SteadinessModelResult **)a2 + 13));
    v25 = *((_QWORD *)this + 13);
    *((_QWORD *)this + 13) = v24;
    if (v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  }
  if (*((_QWORD *)a2 + 12))
  {
    v26 = (CMMsl::SteadinessModelContinuousWalkingFeatures *)operator new();
    v27 = CMMsl::SteadinessModelContinuousWalkingFeatures::SteadinessModelContinuousWalkingFeatures(v26, *((const CMMsl::SteadinessModelContinuousWalkingFeatures **)a2 + 12));
    v28 = *((_QWORD *)this + 12);
    *((_QWORD *)this + 12) = v29;
    if (v28)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v28 + 8))(v28, v27);
  }
  if (*((_QWORD *)a2 + 19))
  {
    v30 = operator new();
    v31 = CMMsl::SteadinessModelResult::SteadinessModelResult(v30, *((const CMMsl::SteadinessModelResult **)a2 + 19));
    v32 = *((_QWORD *)this + 19);
    *((_QWORD *)this + 19) = v31;
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
  }
  if (*((_QWORD *)a2 + 18))
  {
    v33 = (CMMsl::SteadinessModelTemporalDispersionFeatures *)operator new();
    v34 = CMMsl::SteadinessModelTemporalDispersionFeatures::SteadinessModelTemporalDispersionFeatures(v33, *((const CMMsl::SteadinessModelTemporalDispersionFeatures **)a2 + 18));
    v35 = *((_QWORD *)this + 18);
    *((_QWORD *)this + 18) = v36;
    if (v35)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v35 + 8))(v35, v34);
  }
  if (*((_QWORD *)a2 + 21))
  {
    v37 = operator new();
    v38 = CMMsl::SteadinessModelResult::SteadinessModelResult(v37, *((const CMMsl::SteadinessModelResult **)a2 + 21));
    v39 = *((_QWORD *)this + 21);
    *((_QWORD *)this + 21) = v38;
    if (v39)
      (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  }
  if (*((_QWORD *)a2 + 20))
  {
    v40 = (CMMsl::SteadinessModelTemporalEntropyFeatures *)operator new();
    v41 = CMMsl::SteadinessModelTemporalEntropyFeatures::SteadinessModelTemporalEntropyFeatures(v40, *((const CMMsl::SteadinessModelTemporalEntropyFeatures **)a2 + 20));
    v42 = *((_QWORD *)this + 20);
    *((_QWORD *)this + 20) = v43;
    if (v42)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v42 + 8))(v42, v41);
  }
  if ((*((_BYTE *)a2 + 246) & 0x10) != 0)
  {
    v44 = *((_BYTE *)a2 + 236);
    *((_DWORD *)this + 61) |= 0x100000u;
    *((_BYTE *)this + 236) = v44;
  }
  if (*((_QWORD *)a2 + 11))
  {
    v45 = (CMMsl::SteadinessModelBalanceFeatures *)operator new();
    v46 = CMMsl::SteadinessModelBalanceFeatures::SteadinessModelBalanceFeatures(v45, *((const CMMsl::SteadinessModelBalanceFeatures **)a2 + 11));
    v47 = *v4;
    *v4 = v48;
    if (v47)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v47 + 8))(v47, v46);
  }
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 1) != 0)
  {
    v69 = *((_QWORD *)a2 + 1);
    *((_DWORD *)this + 61) |= 1u;
    *((_QWORD *)this + 1) = v69;
    v49 = *((_DWORD *)a2 + 61);
    if ((v49 & 8) == 0)
    {
LABEL_54:
      if ((v49 & 0x20000) == 0)
        goto LABEL_55;
      goto LABEL_86;
    }
  }
  else if ((v49 & 8) == 0)
  {
    goto LABEL_54;
  }
  v70 = *((_QWORD *)a2 + 4);
  *((_DWORD *)this + 61) |= 8u;
  *((_QWORD *)this + 4) = v70;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x20000) == 0)
  {
LABEL_55:
    if ((v49 & 0x1000000) == 0)
      goto LABEL_56;
    goto LABEL_87;
  }
LABEL_86:
  v71 = *((_DWORD *)a2 + 56);
  *((_DWORD *)this + 61) |= 0x20000u;
  *((_DWORD *)this + 56) = v71;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x1000000) == 0)
  {
LABEL_56:
    if ((v49 & 0x1000) == 0)
      goto LABEL_57;
    goto LABEL_88;
  }
LABEL_87:
  v72 = *((_BYTE *)a2 + 240);
  *((_DWORD *)this + 61) |= 0x1000000u;
  *((_BYTE *)this + 240) = v72;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x1000) == 0)
  {
LABEL_57:
    if ((v49 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_89;
  }
LABEL_88:
  v73 = *((_QWORD *)a2 + 25);
  *((_DWORD *)this + 61) |= 0x1000u;
  *((_QWORD *)this + 25) = v73;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x40) == 0)
  {
LABEL_58:
    if ((v49 & 2) == 0)
      goto LABEL_59;
    goto LABEL_90;
  }
LABEL_89:
  v74 = *((_QWORD *)a2 + 7);
  *((_DWORD *)this + 61) |= 0x40u;
  *((_QWORD *)this + 7) = v74;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 2) == 0)
  {
LABEL_59:
    if ((v49 & 0x10) == 0)
      goto LABEL_60;
    goto LABEL_91;
  }
LABEL_90:
  v75 = *((_QWORD *)a2 + 2);
  *((_DWORD *)this + 61) |= 2u;
  *((_QWORD *)this + 2) = v75;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x10) == 0)
  {
LABEL_60:
    if ((v49 & 0x4000) == 0)
      goto LABEL_61;
    goto LABEL_92;
  }
LABEL_91:
  v76 = *((_QWORD *)a2 + 5);
  *((_DWORD *)this + 61) |= 0x10u;
  *((_QWORD *)this + 5) = v76;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x4000) == 0)
  {
LABEL_61:
    if ((v49 & 0x2000) == 0)
      goto LABEL_62;
    goto LABEL_93;
  }
LABEL_92:
  v77 = *((_DWORD *)a2 + 53);
  *((_DWORD *)this + 61) |= 0x4000u;
  *((_DWORD *)this + 53) = v77;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x2000) == 0)
  {
LABEL_62:
    if ((v49 & 0x20) == 0)
      goto LABEL_63;
LABEL_94:
    v79 = *((_QWORD *)a2 + 6);
    *((_DWORD *)this + 61) |= 0x20u;
    *((_QWORD *)this + 6) = v79;
    if ((*((_DWORD *)a2 + 61) & 4) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_93:
  v78 = *((_DWORD *)a2 + 52);
  *((_DWORD *)this + 61) |= 0x2000u;
  *((_DWORD *)this + 52) = v78;
  v49 = *((_DWORD *)a2 + 61);
  if ((v49 & 0x20) != 0)
    goto LABEL_94;
LABEL_63:
  if ((v49 & 4) != 0)
  {
LABEL_64:
    v50 = *((_QWORD *)a2 + 3);
    *((_DWORD *)this + 61) |= 4u;
    *((_QWORD *)this + 3) = v50;
  }
LABEL_65:
  if (*((_QWORD *)a2 + 17))
  {
    v51 = operator new();
    v52 = CMMsl::SteadinessModelResult::SteadinessModelResult(v51, *((const CMMsl::SteadinessModelResult **)a2 + 17));
    v53 = *((_QWORD *)this + 17);
    *((_QWORD *)this + 17) = v52;
    if (v53)
      (*(void (**)(uint64_t))(*(_QWORD *)v53 + 8))(v53);
  }
  if (*((_QWORD *)a2 + 16))
  {
    v54 = (CMMsl::SteadinessModelHarmonicFeatures *)operator new();
    v55 = CMMsl::SteadinessModelHarmonicFeatures::SteadinessModelHarmonicFeatures(v54, *((const CMMsl::SteadinessModelHarmonicFeatures **)a2 + 16));
    v56 = *((_QWORD *)this + 16);
    *((_QWORD *)this + 16) = v57;
    if (v56)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v56 + 8))(v56, v55);
  }
  return this;
}

CMMsl *CMMsl::WalkingSteadinessClassification::operator=(CMMsl *a1, const CMMsl::WalkingSteadinessClassification *a2)
{
  CMMsl::WalkingSteadinessClassification *v3;
  _BYTE v5[248];

  if (a1 != a2)
  {
    CMMsl::WalkingSteadinessClassification::WalkingSteadinessClassification((CMMsl::WalkingSteadinessClassification *)v5, a2);
    CMMsl::swap(a1, (CMMsl::WalkingSteadinessClassification *)v5, v3);
    CMMsl::WalkingSteadinessClassification::~WalkingSteadinessClassification((CMMsl::WalkingSteadinessClassification *)v5);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WalkingSteadinessClassification *a2, CMMsl::WalkingSteadinessClassification *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
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
  double result;
  uint64_t v29;
  uint64_t v30;

  v3 = *((_DWORD *)this + 61);
  *((_DWORD *)this + 61) = *((_DWORD *)a2 + 61);
  *((_DWORD *)a2 + 61) = v3;
  v4 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 10) = v4;
  v5 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v5;
  v6 = *((_DWORD *)this + 55);
  *((_DWORD *)this + 55) = *((_DWORD *)a2 + 55);
  *((_DWORD *)a2 + 55) = v6;
  v7 = *((_DWORD *)this + 54);
  *((_DWORD *)this + 54) = *((_DWORD *)a2 + 54);
  *((_DWORD *)a2 + 54) = v7;
  LODWORD(v5) = *((_DWORD *)this + 57);
  *((_DWORD *)this + 57) = *((_DWORD *)a2 + 57);
  *((_DWORD *)a2 + 57) = v5;
  LOBYTE(v7) = *((_BYTE *)this + 241);
  *((_BYTE *)this + 241) = *((_BYTE *)a2 + 241);
  *((_BYTE *)a2 + 241) = v7;
  LODWORD(v5) = *((_DWORD *)this + 58);
  *((_DWORD *)this + 58) = *((_DWORD *)a2 + 58);
  *((_DWORD *)a2 + 58) = v5;
  LOBYTE(v7) = *((_BYTE *)this + 242);
  *((_BYTE *)this + 242) = *((_BYTE *)a2 + 242);
  *((_BYTE *)a2 + 242) = v7;
  v8 = *((_QWORD *)this + 22);
  *((_QWORD *)this + 22) = *((_QWORD *)a2 + 22);
  *((_QWORD *)a2 + 22) = v8;
  LOBYTE(v7) = *((_BYTE *)this + 238);
  *((_BYTE *)this + 238) = *((_BYTE *)a2 + 238);
  *((_BYTE *)a2 + 238) = v7;
  v9 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v9;
  v10 = *((_QWORD *)this + 24);
  *((_QWORD *)this + 24) = *((_QWORD *)a2 + 24);
  *((_QWORD *)a2 + 24) = v10;
  LOBYTE(v9) = *((_BYTE *)this + 239);
  *((_BYTE *)this + 239) = *((_BYTE *)a2 + 239);
  *((_BYTE *)a2 + 239) = v9;
  v11 = *((_QWORD *)this + 23);
  *((_QWORD *)this + 23) = *((_QWORD *)a2 + 23);
  *((_QWORD *)a2 + 23) = v11;
  LOBYTE(v9) = *((_BYTE *)this + 237);
  *((_BYTE *)this + 237) = *((_BYTE *)a2 + 237);
  *((_BYTE *)a2 + 237) = v9;
  v12 = *((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = *((_QWORD *)a2 + 15);
  *((_QWORD *)a2 + 15) = v12;
  v13 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v13;
  v14 = *((_QWORD *)this + 13);
  *((_QWORD *)this + 13) = *((_QWORD *)a2 + 13);
  *((_QWORD *)a2 + 13) = v14;
  v15 = *((_QWORD *)this + 12);
  *((_QWORD *)this + 12) = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 12) = v15;
  v16 = *((_QWORD *)this + 19);
  *((_QWORD *)this + 19) = *((_QWORD *)a2 + 19);
  *((_QWORD *)a2 + 19) = v16;
  v17 = *((_QWORD *)this + 18);
  *((_QWORD *)this + 18) = *((_QWORD *)a2 + 18);
  *((_QWORD *)a2 + 18) = v17;
  v18 = *((_QWORD *)this + 21);
  *((_QWORD *)this + 21) = *((_QWORD *)a2 + 21);
  *((_QWORD *)a2 + 21) = v18;
  v19 = *((_QWORD *)this + 20);
  *((_QWORD *)this + 20) = *((_QWORD *)a2 + 20);
  *((_QWORD *)a2 + 20) = v19;
  LOBYTE(v19) = *((_BYTE *)this + 236);
  *((_BYTE *)this + 236) = *((_BYTE *)a2 + 236);
  *((_BYTE *)a2 + 236) = v19;
  v20 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = *((_QWORD *)a2 + 11);
  *((_QWORD *)a2 + 11) = v20;
  v21 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v21;
  v22 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v22;
  LODWORD(v22) = *((_DWORD *)this + 56);
  *((_DWORD *)this + 56) = *((_DWORD *)a2 + 56);
  *((_DWORD *)a2 + 56) = v22;
  LOBYTE(v20) = *((_BYTE *)this + 240);
  *((_BYTE *)this + 240) = *((_BYTE *)a2 + 240);
  *((_BYTE *)a2 + 240) = v20;
  v23 = *((_QWORD *)this + 25);
  *((_QWORD *)this + 25) = *((_QWORD *)a2 + 25);
  *((_QWORD *)a2 + 25) = v23;
  v24 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v24;
  v25 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v25;
  v26 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v26;
  LODWORD(v20) = *((_DWORD *)this + 53);
  *((_DWORD *)this + 53) = *((_DWORD *)a2 + 53);
  *((_DWORD *)a2 + 53) = v20;
  LODWORD(v20) = *((_DWORD *)this + 52);
  *((_DWORD *)this + 52) = *((_DWORD *)a2 + 52);
  *((_DWORD *)a2 + 52) = v20;
  v27 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v27;
  result = *((double *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((double *)a2 + 3) = result;
  v29 = *((_QWORD *)this + 17);
  *((_QWORD *)this + 17) = *((_QWORD *)a2 + 17);
  *((_QWORD *)a2 + 17) = v29;
  v30 = *((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = *((_QWORD *)a2 + 16);
  *((_QWORD *)a2 + 16) = v30;
  return result;
}

uint64_t CMMsl::WalkingSteadinessClassification::WalkingSteadinessClassification(uint64_t a1, uint64_t a2)
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

  *(_QWORD *)a1 = &off_251361BC8;
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_QWORD *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 244) = *(_DWORD *)(a2 + 244);
  *(_DWORD *)(a2 + 244) = 0;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 220) = *(_DWORD *)(a2 + 220);
  *(_DWORD *)(a1 + 216) = *(_DWORD *)(a2 + 216);
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a2 + 228);
  *(_BYTE *)(a1 + 241) = *(_BYTE *)(a2 + 241);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 242) = *(_BYTE *)(a2 + 242);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 238) = *(_BYTE *)(a2 + 238);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = 0;
  v5 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 239) = *(_BYTE *)(a2 + 239);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 237) = *(_BYTE *)(a2 + 237);
  v6 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a2 + 120) = 0;
  v7 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a2 + 112) = 0;
  v9 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v8;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a2 + 104) = 0;
  v11 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v10;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v12 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a2 + 96) = 0;
  v13 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v12;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  v14 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a2 + 152) = 0;
  v15 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v14;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  v16 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a2 + 144) = 0;
  v17 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 144) = v16;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  v18 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a2 + 168) = 0;
  v19 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v18;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  v20 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a2 + 160) = 0;
  v21 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 160) = v20;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  *(_BYTE *)(a1 + 236) = *(_BYTE *)(a2 + 236);
  v22 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a2 + 88) = 0;
  v23 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v22;
  if (v23)
    (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 224) = *(_DWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 240) = *(_BYTE *)(a2 + 240);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 212) = *(_DWORD *)(a2 + 212);
  *(_DWORD *)(a1 + 208) = *(_DWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v24 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a2 + 136) = 0;
  v25 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v24;
  if (v25)
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  v26 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a2 + 128) = 0;
  v27 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v26;
  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
  return a1;
}

CMMsl *CMMsl::WalkingSteadinessClassification::operator=(CMMsl *a1, uint64_t a2)
{
  CMMsl::WalkingSteadinessClassification *v3;
  _BYTE v5[248];

  if (a1 != (CMMsl *)a2)
  {
    CMMsl::WalkingSteadinessClassification::WalkingSteadinessClassification((uint64_t)v5, a2);
    CMMsl::swap(a1, (CMMsl::WalkingSteadinessClassification *)v5, v3);
    CMMsl::WalkingSteadinessClassification::~WalkingSteadinessClassification((CMMsl::WalkingSteadinessClassification *)v5);
  }
  return a1;
}

uint64_t CMMsl::WalkingSteadinessClassification::formatText(CMMsl::WalkingSteadinessClassification *this, PB::TextFormatter *a2, const char *a3)
{
  int v5;
  uint64_t v6;
  int v7;
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
  int v19;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 0x100000) != 0)
  {
    PB::TextFormatter::format(a2, "appliedBoutMetricCorrections");
    v5 = *((_DWORD *)this + 61);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_58;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "dailyFlights30daysMax", *((double *)this + 1));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_59;
  }
LABEL_58:
  PB::TextFormatter::format(a2, "dailyFlights30daysMean", *((double *)this + 2));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_60;
  }
LABEL_59:
  PB::TextFormatter::format(a2, "dailySteps30DaysTotal", *((double *)this + 3));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_61;
  }
LABEL_60:
  PB::TextFormatter::format(a2, "dailySteps30daysMax", *((double *)this + 4));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_62;
  }
LABEL_61:
  PB::TextFormatter::format(a2, "dailySteps30daysMean", *((double *)this + 5));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_63;
  }
LABEL_62:
  PB::TextFormatter::format(a2, "dailySteps7DaysTotal", *((double *)this + 6));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_64;
  }
LABEL_63:
  PB::TextFormatter::format(a2, "dailySteps7daysMean", *((double *)this + 7));
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 0x2000) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_65;
  }
LABEL_64:
  PB::TextFormatter::format(a2, "daysWithSteps30Days");
  v5 = *((_DWORD *)this + 61);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_65:
  PB::TextFormatter::format(a2, "daysWithSteps7Days");
  if ((*((_DWORD *)this + 61) & 0x8000) != 0)
LABEL_12:
    PB::TextFormatter::format(a2, "errorStatus");
LABEL_13:
  v6 = *((_QWORD *)this + 8);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "eventResult");
  v7 = *((_DWORD *)this + 61);
  if ((v7 & 0x200000) != 0)
  {
    PB::TextFormatter::format(a2, "fusionSuccess");
    v7 = *((_DWORD *)this + 61);
    if ((v7 & 0x80) == 0)
    {
LABEL_17:
      if ((v7 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PB::TextFormatter::format(a2, "hkEndTime", *((double *)this + 9));
  v7 = *((_DWORD *)this + 61);
  if ((v7 & 0x100) == 0)
  {
LABEL_18:
    if ((v7 & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_69:
  PB::TextFormatter::format(a2, "hkStartTime", *((double *)this + 10));
  if ((*((_DWORD *)this + 61) & 0x400000) != 0)
LABEL_19:
    PB::TextFormatter::format(a2, "isHistoricalCompute");
LABEL_20:
  v8 = *((_QWORD *)this + 11);
  if (v8)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "modelBalanceFeatures");
  v9 = *((_QWORD *)this + 12);
  if (v9)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v9 + 32))(v9, a2, "modelContinuousWalkingFeatures");
  v10 = *((_QWORD *)this + 13);
  if (v10)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, a2, "modelContinuousWalkingResult");
  v11 = *((_QWORD *)this + 14);
  if (v11)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "modelGaitBaselineFeatures");
  v12 = *((_QWORD *)this + 15);
  if (v12)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v12 + 32))(v12, a2, "modelGaitBaselineResult");
  v13 = *((_QWORD *)this + 16);
  if (v13)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v13 + 32))(v13, a2, "modelHarmonicFeatures");
  v14 = *((_QWORD *)this + 17);
  if (v14)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v14 + 32))(v14, a2, "modelHarmonicResult");
  v15 = *((_QWORD *)this + 18);
  if (v15)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v15 + 32))(v15, a2, "modelTemporalDispersionFeatures");
  v16 = *((_QWORD *)this + 19);
  if (v16)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v16 + 32))(v16, a2, "modelTemporalDispersionResult");
  v17 = *((_QWORD *)this + 20);
  if (v17)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v17 + 32))(v17, a2, "modelTemporalEntropyFeatures");
  v18 = *((_QWORD *)this + 21);
  if (v18)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v18 + 32))(v18, a2, "modelTemporalEntropyResult");
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x200) != 0)
  {
    PB::TextFormatter::format(a2, "nextClassificationTime", *((double *)this + 22));
    v19 = *((_DWORD *)this + 61);
    if ((v19 & 0x400) == 0)
    {
LABEL_44:
      if ((v19 & 0x10000) == 0)
        goto LABEL_45;
      goto LABEL_73;
    }
  }
  else if ((v19 & 0x400) == 0)
  {
    goto LABEL_44;
  }
  PB::TextFormatter::format(a2, "rawSteadiness", *((double *)this + 23));
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x10000) == 0)
  {
LABEL_45:
    if ((v19 & 0x800) == 0)
      goto LABEL_46;
    goto LABEL_74;
  }
LABEL_73:
  PB::TextFormatter::format(a2, "rejectionStatus");
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x800) == 0)
  {
LABEL_46:
    if ((v19 & 0x800000) == 0)
      goto LABEL_47;
    goto LABEL_75;
  }
LABEL_74:
  PB::TextFormatter::format(a2, "steadinessScore", *((double *)this + 24));
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x800000) == 0)
  {
LABEL_47:
    if ((v19 & 0x1000) == 0)
      goto LABEL_48;
    goto LABEL_76;
  }
LABEL_75:
  PB::TextFormatter::format(a2, "steadinessScoreIsValid");
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x1000) == 0)
  {
LABEL_48:
    if ((v19 & 0x20000) == 0)
      goto LABEL_49;
    goto LABEL_77;
  }
LABEL_76:
  PB::TextFormatter::format(a2, "unadjustedScore", *((double *)this + 25));
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x20000) == 0)
  {
LABEL_49:
    if ((v19 & 0x40000) == 0)
      goto LABEL_50;
    goto LABEL_78;
  }
LABEL_77:
  PB::TextFormatter::format(a2, "userAge", *((float *)this + 56));
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x40000) == 0)
  {
LABEL_50:
    if ((v19 & 0x1000000) == 0)
      goto LABEL_51;
    goto LABEL_79;
  }
LABEL_78:
  PB::TextFormatter::format(a2, "userHeight", *((float *)this + 57));
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x1000000) == 0)
  {
LABEL_51:
    if ((v19 & 0x2000000) == 0)
      goto LABEL_52;
    goto LABEL_80;
  }
LABEL_79:
  PB::TextFormatter::format(a2, "userIsAgeSet");
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x2000000) == 0)
  {
LABEL_52:
    if ((v19 & 0x4000000) == 0)
      goto LABEL_53;
LABEL_81:
    PB::TextFormatter::format(a2, "userIsWeightSet");
    if ((*((_DWORD *)this + 61) & 0x80000) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_54;
  }
LABEL_80:
  PB::TextFormatter::format(a2, "userIsHeightSet");
  v19 = *((_DWORD *)this + 61);
  if ((v19 & 0x4000000) != 0)
    goto LABEL_81;
LABEL_53:
  if ((v19 & 0x80000) != 0)
LABEL_54:
    PB::TextFormatter::format(a2, "userWeight", *((float *)this + 58));
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WalkingSteadinessClassification::readFrom(CMMsl::WalkingSteadinessClassification *this, PB::Reader *a2)
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
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  BOOL v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  BOOL v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  BOOL v52;
  _DWORD *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  int v58;
  BOOL v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  int v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  int v75;
  BOOL v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  int v84;
  BOOL v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  unsigned int v111;
  unint64_t v112;
  char v113;
  char v114;
  unsigned int v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  unint64_t v124;
  char v125;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_21:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *((_DWORD *)this + 61) |= 0x100u;
          v20 = *((_QWORD *)a2 + 1);
          if (v20 > 0xFFFFFFFFFFFFFFF7 || v20 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 10) = *(_QWORD *)(*(_QWORD *)a2 + v20);
          goto LABEL_184;
        case 2u:
          *((_DWORD *)this + 61) |= 0x80u;
          v21 = *((_QWORD *)a2 + 1);
          if (v21 > 0xFFFFFFFFFFFFFFF7 || v21 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 9) = *(_QWORD *)(*(_QWORD *)a2 + v21);
          goto LABEL_184;
        case 4u:
          *((_DWORD *)this + 61) |= 0x10000u;
          v22 = *((_QWORD *)a2 + 1);
          v23 = *((_QWORD *)a2 + 2);
          v24 = *(_QWORD *)a2;
          if (v22 <= 0xFFFFFFFFFFFFFFF5 && v22 + 10 <= v23)
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            do
            {
              v28 = v22 + 1;
              *((_QWORD *)a2 + 1) = v22 + 1;
              v29 = *(_BYTE *)(v24 + v22);
              v27 |= (unint64_t)(v29 & 0x7F) << v25;
              if ((v29 & 0x80) == 0)
                goto LABEL_189;
              v25 += 7;
              v22 = v28;
              v14 = v26++ > 8;
            }
            while (!v14);
LABEL_147:
            LODWORD(v27) = 0;
            goto LABEL_189;
          }
          v110 = 0;
          v111 = 0;
          v27 = 0;
          if (v23 <= v22)
            v23 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v112 = v22 + 1;
              v113 = *(_BYTE *)(v24 + v22);
              *((_QWORD *)a2 + 1) = v112;
              v27 |= (unint64_t)(v113 & 0x7F) << v110;
              if (v113 < 0)
              {
                v110 += 7;
                v22 = v112;
                v14 = v111++ > 8;
                if (v14)
                  goto LABEL_147;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                LODWORD(v27) = 0;
            }
            break;
          }
LABEL_189:
          *((_DWORD *)this + 55) = v27;
          goto LABEL_202;
        case 5u:
          *((_DWORD *)this + 61) |= 0x8000u;
          v30 = *((_QWORD *)a2 + 1);
          v31 = *((_QWORD *)a2 + 2);
          v32 = *(_QWORD *)a2;
          if (v30 <= 0xFFFFFFFFFFFFFFF5 && v30 + 10 <= v31)
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            do
            {
              v36 = v30 + 1;
              *((_QWORD *)a2 + 1) = v30 + 1;
              v37 = *(_BYTE *)(v32 + v30);
              v35 |= (unint64_t)(v37 & 0x7F) << v33;
              if ((v37 & 0x80) == 0)
                goto LABEL_193;
              v33 += 7;
              v30 = v36;
              v14 = v34++ > 8;
            }
            while (!v14);
LABEL_154:
            LODWORD(v35) = 0;
            goto LABEL_193;
          }
          v114 = 0;
          v115 = 0;
          v35 = 0;
          if (v31 <= v30)
            v31 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v31 == v30)
            {
              LODWORD(v35) = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v116 = v30 + 1;
              v117 = *(_BYTE *)(v32 + v30);
              *((_QWORD *)a2 + 1) = v116;
              v35 |= (unint64_t)(v117 & 0x7F) << v114;
              if (v117 < 0)
              {
                v114 += 7;
                v30 = v116;
                v14 = v115++ > 8;
                if (v14)
                  goto LABEL_154;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                LODWORD(v35) = 0;
            }
            break;
          }
LABEL_193:
          *((_DWORD *)this + 54) = v35;
          goto LABEL_202;
        case 6u:
          *((_DWORD *)this + 61) |= 0x40000u;
          v38 = *((_QWORD *)a2 + 1);
          if (v38 > 0xFFFFFFFFFFFFFFFBLL || v38 + 4 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_DWORD *)this + 57) = *(_DWORD *)(*(_QWORD *)a2 + v38);
          goto LABEL_99;
        case 7u:
          *((_DWORD *)this + 61) |= 0x2000000u;
          v39 = *((_QWORD *)a2 + 1);
          if (v39 >= *((_QWORD *)a2 + 2))
          {
            v42 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v40 = v39 + 1;
            v41 = *(unsigned __int8 *)(*(_QWORD *)a2 + v39);
            *((_QWORD *)a2 + 1) = v40;
            v42 = v41 != 0;
          }
          *((_BYTE *)this + 241) = v42;
          goto LABEL_202;
        case 8u:
          *((_DWORD *)this + 61) |= 0x80000u;
          v43 = *((_QWORD *)a2 + 1);
          if (v43 > 0xFFFFFFFFFFFFFFFBLL || v43 + 4 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_DWORD *)this + 58) = *(_DWORD *)(*(_QWORD *)a2 + v43);
          goto LABEL_99;
        case 9u:
          *((_DWORD *)this + 61) |= 0x4000000u;
          v44 = *((_QWORD *)a2 + 1);
          if (v44 >= *((_QWORD *)a2 + 2))
          {
            v47 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v45 = v44 + 1;
            v46 = *(unsigned __int8 *)(*(_QWORD *)a2 + v44);
            *((_QWORD *)a2 + 1) = v45;
            v47 = v46 != 0;
          }
          *((_BYTE *)this + 242) = v47;
          goto LABEL_202;
        case 0xAu:
          *((_DWORD *)this + 61) |= 0x200u;
          v48 = *((_QWORD *)a2 + 1);
          if (v48 > 0xFFFFFFFFFFFFFFF7 || v48 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 22) = *(_QWORD *)(*(_QWORD *)a2 + v48);
          goto LABEL_184;
        case 0xBu:
          *((_DWORD *)this + 61) |= 0x400000u;
          v49 = *((_QWORD *)a2 + 1);
          if (v49 >= *((_QWORD *)a2 + 2))
          {
            v52 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v50 = v49 + 1;
            v51 = *(unsigned __int8 *)(*(_QWORD *)a2 + v49);
            *((_QWORD *)a2 + 1) = v50;
            v52 = v51 != 0;
          }
          *((_BYTE *)this + 238) = v52;
          goto LABEL_202;
        case 0xCu:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513610D8;
          v53[15] = 0;
          v54 = *((_QWORD *)this + 8);
          *((_QWORD *)this + 8) = v53;
          if (v54)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
            v53 = (_DWORD *)*((_QWORD *)this + 8);
          }
          goto LABEL_138;
        case 0xDu:
          *((_DWORD *)this + 61) |= 0x800u;
          v55 = *((_QWORD *)a2 + 1);
          if (v55 > 0xFFFFFFFFFFFFFFF7 || v55 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 24) = *(_QWORD *)(*(_QWORD *)a2 + v55);
          goto LABEL_184;
        case 0xEu:
          *((_DWORD *)this + 61) |= 0x800000u;
          v56 = *((_QWORD *)a2 + 1);
          if (v56 >= *((_QWORD *)a2 + 2))
          {
            v59 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v57 = v56 + 1;
            v58 = *(unsigned __int8 *)(*(_QWORD *)a2 + v56);
            *((_QWORD *)a2 + 1) = v57;
            v59 = v58 != 0;
          }
          *((_BYTE *)this + 239) = v59;
          goto LABEL_202;
        case 0xFu:
          *((_DWORD *)this + 61) |= 0x400u;
          v60 = *((_QWORD *)a2 + 1);
          if (v60 > 0xFFFFFFFFFFFFFFF7 || v60 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 23) = *(_QWORD *)(*(_QWORD *)a2 + v60);
          goto LABEL_184;
        case 0x10u:
          *((_DWORD *)this + 61) |= 0x200000u;
          v61 = *((_QWORD *)a2 + 1);
          if (v61 >= *((_QWORD *)a2 + 2))
          {
            v64 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v62 = v61 + 1;
            v63 = *(unsigned __int8 *)(*(_QWORD *)a2 + v61);
            *((_QWORD *)a2 + 1) = v62;
            v64 = v63 != 0;
          }
          *((_BYTE *)this + 237) = v64;
          goto LABEL_202;
        case 0x11u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513611F0;
          v53[13] = 0;
          v65 = *((_QWORD *)this + 15);
          *((_QWORD *)this + 15) = v53;
          if (v65)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v65 + 8))(v65);
            v53 = (_DWORD *)*((_QWORD *)this + 15);
          }
          goto LABEL_138;
        case 0x12u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_251361180;
          v53[22] = 0;
          v66 = *((_QWORD *)this + 14);
          *((_QWORD *)this + 14) = v53;
          if (v66)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v66 + 8))(v66);
            v53 = (_DWORD *)*((_QWORD *)this + 14);
          }
          goto LABEL_138;
        case 0x13u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513611F0;
          v53[13] = 0;
          v67 = *((_QWORD *)this + 13);
          *((_QWORD *)this + 13) = v53;
          if (v67)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v67 + 8))(v67);
            v53 = (_DWORD *)*((_QWORD *)this + 13);
          }
          goto LABEL_138;
        case 0x14u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_251361148;
          v53[44] = 0;
          v68 = *((_QWORD *)this + 12);
          *((_QWORD *)this + 12) = v53;
          if (v68)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v68 + 8))(v68);
            v53 = (_DWORD *)*((_QWORD *)this + 12);
          }
          goto LABEL_138;
        case 0x15u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513611F0;
          v53[13] = 0;
          v69 = *((_QWORD *)this + 19);
          *((_QWORD *)this + 19) = v53;
          if (v69)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v69 + 8))(v69);
            v53 = (_DWORD *)*((_QWORD *)this + 19);
          }
          goto LABEL_138;
        case 0x16u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_251361228;
          v53[10] = 0;
          v70 = *((_QWORD *)this + 18);
          *((_QWORD *)this + 18) = v53;
          if (v70)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v70 + 8))(v70);
            v53 = (_DWORD *)*((_QWORD *)this + 18);
          }
          goto LABEL_138;
        case 0x17u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513611F0;
          v53[13] = 0;
          v71 = *((_QWORD *)this + 21);
          *((_QWORD *)this + 21) = v53;
          if (v71)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v71 + 8))(v71);
            v53 = (_DWORD *)*((_QWORD *)this + 21);
          }
          goto LABEL_138;
        case 0x18u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_251361260;
          v53[54] = 0;
          v72 = *((_QWORD *)this + 20);
          *((_QWORD *)this + 20) = v53;
          if (v72)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v72 + 8))(v72);
            v53 = (_DWORD *)*((_QWORD *)this + 20);
          }
          goto LABEL_138;
        case 0x19u:
          *((_DWORD *)this + 61) |= 0x100000u;
          v73 = *((_QWORD *)a2 + 1);
          if (v73 >= *((_QWORD *)a2 + 2))
          {
            v76 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v74 = v73 + 1;
            v75 = *(unsigned __int8 *)(*(_QWORD *)a2 + v73);
            *((_QWORD *)a2 + 1) = v74;
            v76 = v75 != 0;
          }
          *((_BYTE *)this + 236) = v76;
          goto LABEL_202;
        case 0x1Au:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_251361110;
          v53[10] = 0;
          v77 = *((_QWORD *)this + 11);
          *((_QWORD *)this + 11) = v53;
          if (v77)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v77 + 8))(v77);
            v53 = (_DWORD *)*((_QWORD *)this + 11);
          }
          goto LABEL_138;
        case 0x1Bu:
          *((_DWORD *)this + 61) |= 1u;
          v78 = *((_QWORD *)a2 + 1);
          if (v78 > 0xFFFFFFFFFFFFFFF7 || v78 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v78);
          goto LABEL_184;
        case 0x1Cu:
          *((_DWORD *)this + 61) |= 8u;
          v79 = *((_QWORD *)a2 + 1);
          if (v79 > 0xFFFFFFFFFFFFFFF7 || v79 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 4) = *(_QWORD *)(*(_QWORD *)a2 + v79);
          goto LABEL_184;
        case 0x1Du:
          *((_DWORD *)this + 61) |= 0x20000u;
          v80 = *((_QWORD *)a2 + 1);
          if (v80 > 0xFFFFFFFFFFFFFFFBLL || v80 + 4 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_DWORD *)this + 56) = *(_DWORD *)(*(_QWORD *)a2 + v80);
LABEL_99:
          v81 = *((_QWORD *)a2 + 1) + 4;
          goto LABEL_185;
        case 0x1Eu:
          *((_DWORD *)this + 61) |= 0x1000000u;
          v82 = *((_QWORD *)a2 + 1);
          if (v82 >= *((_QWORD *)a2 + 2))
          {
            v85 = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v83 = v82 + 1;
            v84 = *(unsigned __int8 *)(*(_QWORD *)a2 + v82);
            *((_QWORD *)a2 + 1) = v83;
            v85 = v84 != 0;
          }
          *((_BYTE *)this + 240) = v85;
          goto LABEL_202;
        case 0x1Fu:
          *((_DWORD *)this + 61) |= 0x1000u;
          v86 = *((_QWORD *)a2 + 1);
          if (v86 > 0xFFFFFFFFFFFFFFF7 || v86 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 25) = *(_QWORD *)(*(_QWORD *)a2 + v86);
          goto LABEL_184;
        case 0x20u:
          *((_DWORD *)this + 61) |= 0x40u;
          v87 = *((_QWORD *)a2 + 1);
          if (v87 > 0xFFFFFFFFFFFFFFF7 || v87 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 7) = *(_QWORD *)(*(_QWORD *)a2 + v87);
          goto LABEL_184;
        case 0x21u:
          *((_DWORD *)this + 61) |= 2u;
          v88 = *((_QWORD *)a2 + 1);
          if (v88 > 0xFFFFFFFFFFFFFFF7 || v88 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v88);
          goto LABEL_184;
        case 0x22u:
          *((_DWORD *)this + 61) |= 0x10u;
          v89 = *((_QWORD *)a2 + 1);
          if (v89 > 0xFFFFFFFFFFFFFFF7 || v89 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 5) = *(_QWORD *)(*(_QWORD *)a2 + v89);
          goto LABEL_184;
        case 0x23u:
          *((_DWORD *)this + 61) |= 0x4000u;
          v90 = *((_QWORD *)a2 + 1);
          v91 = *((_QWORD *)a2 + 2);
          v92 = *(_QWORD *)a2;
          if (v90 <= 0xFFFFFFFFFFFFFFF5 && v90 + 10 <= v91)
          {
            v93 = 0;
            v94 = 0;
            v95 = 0;
            do
            {
              v96 = v90 + 1;
              *((_QWORD *)a2 + 1) = v90 + 1;
              v97 = *(_BYTE *)(v92 + v90);
              v95 |= (unint64_t)(v97 & 0x7F) << v93;
              if ((v97 & 0x80) == 0)
                goto LABEL_197;
              v93 += 7;
              v90 = v96;
              v14 = v94++ > 8;
            }
            while (!v14);
LABEL_175:
            LODWORD(v95) = 0;
            goto LABEL_197;
          }
          v118 = 0;
          v119 = 0;
          v95 = 0;
          if (v91 <= v90)
            v91 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v91 == v90)
            {
              LODWORD(v95) = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v120 = v90 + 1;
              v121 = *(_BYTE *)(v92 + v90);
              *((_QWORD *)a2 + 1) = v120;
              v95 |= (unint64_t)(v121 & 0x7F) << v118;
              if (v121 < 0)
              {
                v118 += 7;
                v90 = v120;
                v14 = v119++ > 8;
                if (v14)
                  goto LABEL_175;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                LODWORD(v95) = 0;
            }
            break;
          }
LABEL_197:
          *((_DWORD *)this + 53) = v95;
          goto LABEL_202;
        case 0x24u:
          *((_DWORD *)this + 61) |= 0x2000u;
          v98 = *((_QWORD *)a2 + 1);
          v99 = *((_QWORD *)a2 + 2);
          v100 = *(_QWORD *)a2;
          if (v98 <= 0xFFFFFFFFFFFFFFF5 && v98 + 10 <= v99)
          {
            v101 = 0;
            v102 = 0;
            v103 = 0;
            do
            {
              v104 = v98 + 1;
              *((_QWORD *)a2 + 1) = v98 + 1;
              v105 = *(_BYTE *)(v100 + v98);
              v103 |= (unint64_t)(v105 & 0x7F) << v101;
              if ((v105 & 0x80) == 0)
                goto LABEL_201;
              v101 += 7;
              v98 = v104;
              v14 = v102++ > 8;
            }
            while (!v14);
LABEL_182:
            LODWORD(v103) = 0;
            goto LABEL_201;
          }
          v122 = 0;
          v123 = 0;
          v103 = 0;
          if (v99 <= v98)
            v99 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v99 == v98)
            {
              LODWORD(v103) = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v124 = v98 + 1;
              v125 = *(_BYTE *)(v100 + v98);
              *((_QWORD *)a2 + 1) = v124;
              v103 |= (unint64_t)(v125 & 0x7F) << v122;
              if (v125 < 0)
              {
                v122 += 7;
                v98 = v124;
                v14 = v123++ > 8;
                if (v14)
                  goto LABEL_182;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                LODWORD(v103) = 0;
            }
            break;
          }
LABEL_201:
          *((_DWORD *)this + 52) = v103;
          goto LABEL_202;
        case 0x25u:
          *((_DWORD *)this + 61) |= 0x20u;
          v106 = *((_QWORD *)a2 + 1);
          if (v106 > 0xFFFFFFFFFFFFFFF7 || v106 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_133;
          *((_QWORD *)this + 6) = *(_QWORD *)(*(_QWORD *)a2 + v106);
          goto LABEL_184;
        case 0x26u:
          *((_DWORD *)this + 61) |= 4u;
          v107 = *((_QWORD *)a2 + 1);
          if (v107 <= 0xFFFFFFFFFFFFFFF7 && v107 + 8 <= *((_QWORD *)a2 + 2))
          {
            *((_QWORD *)this + 3) = *(_QWORD *)(*(_QWORD *)a2 + v107);
LABEL_184:
            v81 = *((_QWORD *)a2 + 1) + 8;
LABEL_185:
            *((_QWORD *)a2 + 1) = v81;
          }
          else
          {
LABEL_133:
            *((_BYTE *)a2 + 24) = 1;
          }
          goto LABEL_202;
        case 0x27u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513611F0;
          v53[13] = 0;
          v108 = *((_QWORD *)this + 17);
          *((_QWORD *)this + 17) = v53;
          if (v108)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v108 + 8))(v108);
            v53 = (_DWORD *)*((_QWORD *)this + 17);
          }
          goto LABEL_138;
        case 0x28u:
          v53 = (_DWORD *)operator new();
          *(_QWORD *)v53 = &off_2513611B8;
          v53[62] = 0;
          v109 = *((_QWORD *)this + 16);
          *((_QWORD *)this + 16) = v53;
          if (v109)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v109 + 8))(v109);
            v53 = (_DWORD *)*((_QWORD *)this + 16);
          }
LABEL_138:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v53 + 16))(v53, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_19;
      }
      goto LABEL_202;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_21;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
    }
    while (!v14);
LABEL_19:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_202:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
}

uint64_t CMMsl::WalkingSteadinessClassification::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  int v4;
  const PB::Base *v5;
  int v6;
  const PB::Base *v7;
  const PB::Base *v8;
  const PB::Base *v9;
  const PB::Base *v10;
  const PB::Base *v11;
  const PB::Base *v12;
  const PB::Base *v13;
  const PB::Base *v14;
  const PB::Base *v15;
  int v16;
  const PB::Base *v17;
  const PB::Base *v18;

  v3 = this;
  v4 = *(_DWORD *)(this + 244);
  if ((v4 & 0x100) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 80));
    v4 = *(_DWORD *)(v3 + 244);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_58;
    }
  }
  else if ((v4 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(double *)(v3 + 72));
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x10000) == 0)
  {
LABEL_4:
    if ((v4 & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_59;
  }
LABEL_58:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x8000) == 0)
  {
LABEL_5:
    if ((v4 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_60;
  }
LABEL_59:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x40000) == 0)
  {
LABEL_6:
    if ((v4 & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_61;
  }
LABEL_60:
  this = PB::Writer::write(a2, *(float *)(v3 + 228));
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v4 & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_62;
  }
LABEL_61:
  this = PB::Writer::write(a2);
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x80000) == 0)
  {
LABEL_8:
    if ((v4 & 0x4000000) == 0)
      goto LABEL_9;
    goto LABEL_63;
  }
LABEL_62:
  this = PB::Writer::write(a2, *(float *)(v3 + 232));
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x4000000) == 0)
  {
LABEL_9:
    if ((v4 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_64;
  }
LABEL_63:
  this = PB::Writer::write(a2);
  v4 = *(_DWORD *)(v3 + 244);
  if ((v4 & 0x200) == 0)
  {
LABEL_10:
    if ((v4 & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_64:
  this = PB::Writer::write(a2, *(double *)(v3 + 176));
  if ((*(_DWORD *)(v3 + 244) & 0x400000) != 0)
LABEL_11:
    this = PB::Writer::write(a2);
LABEL_12:
  v5 = *(const PB::Base **)(v3 + 64);
  if (v5)
    this = PB::Writer::writeSubmessage(a2, v5);
  v6 = *(_DWORD *)(v3 + 244);
  if ((v6 & 0x800) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(v3 + 192));
    v6 = *(_DWORD *)(v3 + 244);
    if ((v6 & 0x800000) == 0)
    {
LABEL_16:
      if ((v6 & 0x400) == 0)
        goto LABEL_17;
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x800000) == 0)
  {
    goto LABEL_16;
  }
  this = PB::Writer::write(a2);
  v6 = *(_DWORD *)(v3 + 244);
  if ((v6 & 0x400) == 0)
  {
LABEL_17:
    if ((v6 & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_68:
  this = PB::Writer::write(a2, *(double *)(v3 + 184));
  if ((*(_DWORD *)(v3 + 244) & 0x200000) != 0)
LABEL_18:
    this = PB::Writer::write(a2);
LABEL_19:
  v7 = *(const PB::Base **)(v3 + 120);
  if (v7)
    this = PB::Writer::writeSubmessage(a2, v7);
  v8 = *(const PB::Base **)(v3 + 112);
  if (v8)
    this = PB::Writer::writeSubmessage(a2, v8);
  v9 = *(const PB::Base **)(v3 + 104);
  if (v9)
    this = PB::Writer::writeSubmessage(a2, v9);
  v10 = *(const PB::Base **)(v3 + 96);
  if (v10)
    this = PB::Writer::writeSubmessage(a2, v10);
  v11 = *(const PB::Base **)(v3 + 152);
  if (v11)
    this = PB::Writer::writeSubmessage(a2, v11);
  v12 = *(const PB::Base **)(v3 + 144);
  if (v12)
    this = PB::Writer::writeSubmessage(a2, v12);
  v13 = *(const PB::Base **)(v3 + 168);
  if (v13)
    this = PB::Writer::writeSubmessage(a2, v13);
  v14 = *(const PB::Base **)(v3 + 160);
  if (v14)
    this = PB::Writer::writeSubmessage(a2, v14);
  if ((*(_BYTE *)(v3 + 246) & 0x10) != 0)
    this = PB::Writer::write(a2);
  v15 = *(const PB::Base **)(v3 + 88);
  if (v15)
    this = PB::Writer::writeSubmessage(a2, v15);
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 1) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(v3 + 8));
    v16 = *(_DWORD *)(v3 + 244);
    if ((v16 & 8) == 0)
    {
LABEL_41:
      if ((v16 & 0x20000) == 0)
        goto LABEL_42;
      goto LABEL_72;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_41;
  }
  this = PB::Writer::write(a2, *(double *)(v3 + 32));
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x20000) == 0)
  {
LABEL_42:
    if ((v16 & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_73;
  }
LABEL_72:
  this = PB::Writer::write(a2, *(float *)(v3 + 224));
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x1000000) == 0)
  {
LABEL_43:
    if ((v16 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_74;
  }
LABEL_73:
  this = PB::Writer::write(a2);
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x1000) == 0)
  {
LABEL_44:
    if ((v16 & 0x40) == 0)
      goto LABEL_45;
    goto LABEL_75;
  }
LABEL_74:
  this = PB::Writer::write(a2, *(double *)(v3 + 200));
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x40) == 0)
  {
LABEL_45:
    if ((v16 & 2) == 0)
      goto LABEL_46;
    goto LABEL_76;
  }
LABEL_75:
  this = PB::Writer::write(a2, *(double *)(v3 + 56));
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 2) == 0)
  {
LABEL_46:
    if ((v16 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_77;
  }
LABEL_76:
  this = PB::Writer::write(a2, *(double *)(v3 + 16));
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x10) == 0)
  {
LABEL_47:
    if ((v16 & 0x4000) == 0)
      goto LABEL_48;
    goto LABEL_78;
  }
LABEL_77:
  this = PB::Writer::write(a2, *(double *)(v3 + 40));
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x4000) == 0)
  {
LABEL_48:
    if ((v16 & 0x2000) == 0)
      goto LABEL_49;
    goto LABEL_79;
  }
LABEL_78:
  this = PB::Writer::writeVarInt(a2);
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x2000) == 0)
  {
LABEL_49:
    if ((v16 & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_80;
  }
LABEL_79:
  this = PB::Writer::writeVarInt(a2);
  v16 = *(_DWORD *)(v3 + 244);
  if ((v16 & 0x20) == 0)
  {
LABEL_50:
    if ((v16 & 4) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_80:
  this = PB::Writer::write(a2, *(double *)(v3 + 48));
  if ((*(_DWORD *)(v3 + 244) & 4) != 0)
LABEL_51:
    this = PB::Writer::write(a2, *(double *)(v3 + 24));
LABEL_52:
  v17 = *(const PB::Base **)(v3 + 136);
  if (v17)
    this = PB::Writer::writeSubmessage(a2, v17);
  v18 = *(const PB::Base **)(v3 + 128);
  if (v18)
    return PB::Writer::writeSubmessage(a2, v18);
  return this;
}

unint64_t CMMsl::WalkingSteadinessClassification::hash_value(CMMsl::WalkingSteadinessClassification *this)
{
  int v2;
  double v3;
  float v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  double v8;
  double v9;
  CMMsl::SteadinessEvent *v10;
  double v11;
  double v12;
  CMMsl::SteadinessModelResult *v13;
  uint64_t v14;
  CMMsl::SteadinessModelGaitBaselineFeatures *v15;
  uint64_t v16;
  CMMsl::SteadinessModelResult *v17;
  uint64_t v18;
  CMMsl::SteadinessModelContinuousWalkingFeatures *v19;
  uint64_t v20;
  CMMsl::SteadinessModelResult *v21;
  uint64_t v22;
  CMMsl::SteadinessModelTemporalDispersionFeatures *v23;
  uint64_t v24;
  CMMsl::SteadinessModelResult *v25;
  uint64_t v26;
  CMMsl::SteadinessModelTemporalEntropyFeatures *v27;
  CMMsl::SteadinessModelBalanceFeatures *v28;
  double v29;
  float v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  CMMsl::SteadinessModelBalanceFeatures *v38;
  uint64_t v39;
  CMMsl::SteadinessModelResult *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  CMMsl::SteadinessModelTemporalEntropyFeatures *v69;
  uint64_t v70;
  uint64_t v71;
  CMMsl::SteadinessEvent *v72;

  v2 = *((_DWORD *)this + 61);
  if ((v2 & 0x100) == 0)
  {
    v68 = 0.0;
    if ((v2 & 0x80) != 0)
      goto LABEL_3;
LABEL_23:
    v67 = 0.0;
    if ((v2 & 0x10000) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
  v9 = *((double *)this + 10);
  if (v9 == 0.0)
    v9 = 0.0;
  v68 = v9;
  if ((v2 & 0x80) == 0)
    goto LABEL_23;
LABEL_3:
  v3 = *((double *)this + 9);
  if (v3 == 0.0)
    v3 = 0.0;
  v67 = v3;
  if ((v2 & 0x10000) != 0)
  {
LABEL_6:
    v66 = *((unsigned int *)this + 55);
    if ((v2 & 0x8000) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v66 = 0;
  if ((v2 & 0x8000) != 0)
  {
LABEL_7:
    v65 = *((unsigned int *)this + 54);
    if ((v2 & 0x40000) != 0)
      goto LABEL_8;
LABEL_26:
    v64 = 0;
    if ((v2 & 0x2000000) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_25:
  v65 = 0;
  if ((v2 & 0x40000) == 0)
    goto LABEL_26;
LABEL_8:
  v4 = *((float *)this + 57);
  v5 = LODWORD(v4);
  if (v4 == 0.0)
    v5 = 0;
  v64 = v5;
  if ((v2 & 0x2000000) != 0)
  {
LABEL_11:
    v63 = *((unsigned __int8 *)this + 241);
    if ((v2 & 0x80000) != 0)
      goto LABEL_12;
LABEL_28:
    v62 = 0;
    if ((v2 & 0x4000000) != 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_27:
  v63 = 0;
  if ((v2 & 0x80000) == 0)
    goto LABEL_28;
LABEL_12:
  v6 = *((float *)this + 58);
  v7 = LODWORD(v6);
  if (v6 == 0.0)
    v7 = 0;
  v62 = v7;
  if ((v2 & 0x4000000) != 0)
  {
LABEL_15:
    v61 = *((unsigned __int8 *)this + 242);
    if ((v2 & 0x200) != 0)
      goto LABEL_16;
    goto LABEL_30;
  }
LABEL_29:
  v61 = 0;
  if ((v2 & 0x200) != 0)
  {
LABEL_16:
    v8 = *((double *)this + 22);
    if (v8 == 0.0)
      v8 = 0.0;
    v60 = v8;
    if ((v2 & 0x400000) != 0)
      goto LABEL_19;
    goto LABEL_31;
  }
LABEL_30:
  v60 = 0.0;
  if ((v2 & 0x400000) != 0)
  {
LABEL_19:
    v59 = *((unsigned __int8 *)this + 238);
    goto LABEL_32;
  }
LABEL_31:
  v59 = 0;
LABEL_32:
  v10 = (CMMsl::SteadinessEvent *)*((_QWORD *)this + 8);
  if (v10)
    v10 = (CMMsl::SteadinessEvent *)CMMsl::SteadinessEvent::hash_value(v10);
  if ((v2 & 0x800) == 0)
  {
    v58 = 0.0;
    if ((v2 & 0x800000) != 0)
      goto LABEL_36;
LABEL_43:
    v57 = 0;
    if ((v2 & 0x400) != 0)
      goto LABEL_37;
LABEL_44:
    v56 = 0.0;
    goto LABEL_45;
  }
  v12 = *((double *)this + 24);
  if (v12 == 0.0)
    v12 = 0.0;
  v58 = v12;
  if ((v2 & 0x800000) == 0)
    goto LABEL_43;
LABEL_36:
  v57 = *((unsigned __int8 *)this + 239);
  if ((v2 & 0x400) == 0)
    goto LABEL_44;
LABEL_37:
  v11 = *((double *)this + 23);
  if (v11 == 0.0)
    v11 = 0.0;
  v56 = v11;
LABEL_45:
  v72 = v10;
  if ((v2 & 0x200000) != 0)
    v55 = *((unsigned __int8 *)this + 237);
  else
    v55 = 0;
  v13 = (CMMsl::SteadinessModelResult *)*((_QWORD *)this + 15);
  if (v13)
    v14 = CMMsl::SteadinessModelResult::hash_value(v13);
  else
    v14 = 0;
  v15 = (CMMsl::SteadinessModelGaitBaselineFeatures *)*((_QWORD *)this + 14);
  if (v15)
    v16 = CMMsl::SteadinessModelGaitBaselineFeatures::hash_value(v15);
  else
    v16 = 0;
  v17 = (CMMsl::SteadinessModelResult *)*((_QWORD *)this + 13);
  if (v17)
    v18 = CMMsl::SteadinessModelResult::hash_value(v17);
  else
    v18 = 0;
  v19 = (CMMsl::SteadinessModelContinuousWalkingFeatures *)*((_QWORD *)this + 12);
  if (v19)
    v20 = CMMsl::SteadinessModelContinuousWalkingFeatures::hash_value(v19);
  else
    v20 = 0;
  v21 = (CMMsl::SteadinessModelResult *)*((_QWORD *)this + 19);
  if (v21)
    v22 = CMMsl::SteadinessModelResult::hash_value(v21);
  else
    v22 = 0;
  v23 = (CMMsl::SteadinessModelTemporalDispersionFeatures *)*((_QWORD *)this + 18);
  if (v23)
    v24 = CMMsl::SteadinessModelTemporalDispersionFeatures::hash_value(v23);
  else
    v24 = 0;
  v25 = (CMMsl::SteadinessModelResult *)*((_QWORD *)this + 21);
  if (v25)
    v26 = CMMsl::SteadinessModelResult::hash_value(v25);
  else
    v26 = 0;
  v27 = (CMMsl::SteadinessModelTemporalEntropyFeatures *)*((_QWORD *)this + 20);
  if (v27)
    v27 = (CMMsl::SteadinessModelTemporalEntropyFeatures *)CMMsl::SteadinessModelTemporalEntropyFeatures::hash_value(v27);
  v69 = v27;
  if ((v2 & 0x100000) != 0)
    v54 = *((unsigned __int8 *)this + 236);
  else
    v54 = 0;
  v28 = (CMMsl::SteadinessModelBalanceFeatures *)*((_QWORD *)this + 11);
  if (v28)
    v28 = (CMMsl::SteadinessModelBalanceFeatures *)CMMsl::SteadinessModelBalanceFeatures::hash_value(v28);
  if ((v2 & 1) == 0)
  {
    v53 = 0.0;
    if ((v2 & 8) != 0)
      goto LABEL_78;
LABEL_94:
    v52 = 0.0;
    if ((v2 & 0x20000) != 0)
      goto LABEL_81;
LABEL_95:
    v51 = 0;
    if ((v2 & 0x1000000) != 0)
      goto LABEL_84;
    goto LABEL_96;
  }
  v34 = *((double *)this + 1);
  if (v34 == 0.0)
    v34 = 0.0;
  v53 = v34;
  if ((v2 & 8) == 0)
    goto LABEL_94;
LABEL_78:
  v29 = *((double *)this + 4);
  if (v29 == 0.0)
    v29 = 0.0;
  v52 = v29;
  if ((v2 & 0x20000) == 0)
    goto LABEL_95;
LABEL_81:
  v30 = *((float *)this + 56);
  v31 = LODWORD(v30);
  if (v30 == 0.0)
    v31 = 0;
  v51 = v31;
  if ((v2 & 0x1000000) != 0)
  {
LABEL_84:
    v50 = *((unsigned __int8 *)this + 240);
    if ((v2 & 0x1000) != 0)
      goto LABEL_85;
    goto LABEL_97;
  }
LABEL_96:
  v50 = 0;
  if ((v2 & 0x1000) != 0)
  {
LABEL_85:
    v32 = *((double *)this + 25);
    if (v32 == 0.0)
      v32 = 0.0;
    v49 = v32;
    if ((v2 & 0x40) != 0)
      goto LABEL_88;
LABEL_98:
    v48 = 0.0;
    goto LABEL_99;
  }
LABEL_97:
  v49 = 0.0;
  if ((v2 & 0x40) == 0)
    goto LABEL_98;
LABEL_88:
  v33 = *((double *)this + 7);
  if (v33 == 0.0)
    v33 = 0.0;
  v48 = v33;
LABEL_99:
  v71 = v16;
  if ((v2 & 2) != 0)
  {
    v35 = *((double *)this + 2);
    if (v35 == 0.0)
      v35 = 0.0;
    v47 = v35;
  }
  else
  {
    v47 = 0.0;
  }
  v70 = v14;
  if ((v2 & 0x10) != 0)
  {
    v37 = *((double *)this + 5);
    if (v37 == 0.0)
      v37 = 0.0;
    v46 = v37;
    if ((v2 & 0x4000) != 0)
    {
LABEL_106:
      v45 = *((int *)this + 53);
      if ((v2 & 0x2000) != 0)
        goto LABEL_107;
      goto LABEL_115;
    }
  }
  else
  {
    v46 = 0.0;
    if ((v2 & 0x4000) != 0)
      goto LABEL_106;
  }
  v45 = 0;
  if ((v2 & 0x2000) != 0)
  {
LABEL_107:
    v44 = *((int *)this + 52);
    if ((v2 & 0x20) != 0)
      goto LABEL_108;
    goto LABEL_116;
  }
LABEL_115:
  v44 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_108:
    if (*((double *)this + 6) == 0.0)
      v36 = 0;
    else
      v36 = *((_QWORD *)this + 6);
    goto LABEL_117;
  }
LABEL_116:
  v36 = 0;
LABEL_117:
  v38 = v28;
  if ((v2 & 4) != 0)
  {
    if (*((double *)this + 3) == 0.0)
      v39 = 0;
    else
      v39 = *((_QWORD *)this + 3);
  }
  else
  {
    v39 = 0;
  }
  v40 = (CMMsl::SteadinessModelResult *)*((_QWORD *)this + 17);
  if (v40)
    v41 = CMMsl::SteadinessModelResult::hash_value(v40);
  else
    v41 = 0;
  v42 = *((_QWORD *)this + 16);
  if (v42)
    v42 = CMMsl::SteadinessModelHarmonicFeatures::hash_value((CMMsl::SteadinessModelHarmonicFeatures *)v42);
  return *(_QWORD *)&v67 ^ *(_QWORD *)&v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ *(_QWORD *)&v60 ^ v59 ^ (unint64_t)v72 ^ *(_QWORD *)&v58 ^ v57 ^ *(_QWORD *)&v56 ^ v55 ^ v70 ^ v71 ^ v18 ^ v20 ^ v22 ^ v24 ^ v26 ^ (unint64_t)v69 ^ v54 ^ (unint64_t)v38 ^ *(_QWORD *)&v53 ^ *(_QWORD *)&v52 ^ v51 ^ v50 ^ *(_QWORD *)&v49 ^ *(_QWORD *)&v48 ^ *(_QWORD *)&v47 ^ *(_QWORD *)&v46 ^ v45 ^ v44 ^ v36 ^ v39 ^ v41 ^ v42;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeEventResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[8])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513610D8;
    *(_DWORD *)(v2 + 60) = 0;
    this = (_QWORD *)v1[8];
    v1[8] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelGaitBaselineResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[15])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513611F0;
    *(_DWORD *)(v2 + 52) = 0;
    this = (_QWORD *)v1[15];
    v1[15] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelGaitBaselineFeatures(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[14])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361180;
    *(_DWORD *)(v2 + 88) = 0;
    this = (_QWORD *)v1[14];
    v1[14] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelContinuousWalkingResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[13])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513611F0;
    *(_DWORD *)(v2 + 52) = 0;
    this = (_QWORD *)v1[13];
    v1[13] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelContinuousWalkingFeatures(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[12])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361148;
    *(_DWORD *)(v2 + 176) = 0;
    this = (_QWORD *)v1[12];
    v1[12] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelTemporalDispersionResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[19])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513611F0;
    *(_DWORD *)(v2 + 52) = 0;
    this = (_QWORD *)v1[19];
    v1[19] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelTemporalDispersionFeatures(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[18])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361228;
    *(_DWORD *)(v2 + 40) = 0;
    this = (_QWORD *)v1[18];
    v1[18] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelTemporalEntropyResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[21])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513611F0;
    *(_DWORD *)(v2 + 52) = 0;
    this = (_QWORD *)v1[21];
    v1[21] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelTemporalEntropyFeatures(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[20])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361260;
    *(_DWORD *)(v2 + 216) = 0;
    this = (_QWORD *)v1[20];
    v1[20] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelBalanceFeatures(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[11])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361110;
    *(_DWORD *)(v2 + 40) = 0;
    this = (_QWORD *)v1[11];
    v1[11] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelHarmonicResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[17])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513611F0;
    *(_DWORD *)(v2 + 52) = 0;
    this = (_QWORD *)v1[17];
    v1[17] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *CMMsl::WalkingSteadinessClassification::makeModelHarmonicFeatures(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[16])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_2513611B8;
    *(_DWORD *)(v2 + 248) = 0;
    this = (_QWORD *)v1[16];
    v1[16] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WatchActiveCalories::~WatchActiveCalories(CMMsl::WatchActiveCalories *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

double CMMsl::WatchActiveCalories::WatchActiveCalories(CMMsl::WatchActiveCalories *this, const CMMsl::WatchActiveCalories *a2)
{
  char v2;
  char v3;
  double result;

  *(_QWORD *)this = &off_251361C00;
  *((_DWORD *)this + 7) = 0;
  v2 = *((_BYTE *)a2 + 28);
  if ((v2 & 4) != 0)
  {
    LODWORD(result) = *((_DWORD *)a2 + 6);
    v3 = 4;
    *((_BYTE *)this + 28) = 4;
    *((_DWORD *)this + 6) = LODWORD(result);
    v2 = *((_BYTE *)a2 + 28);
    if ((v2 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 28) & 2) != 0)
  {
LABEL_5:
    result = *((double *)a2 + 2);
    v3 |= 2u;
    *((_BYTE *)this + 28) = v3;
    *((double *)this + 2) = result;
    v2 = *((_BYTE *)a2 + 28);
  }
LABEL_6:
  if ((v2 & 1) != 0)
  {
    result = *((double *)a2 + 1);
    *((_BYTE *)this + 28) = v3 | 1;
    *((double *)this + 1) = result;
  }
  return result;
}

uint64_t CMMsl::WatchActiveCalories::operator=(uint64_t a1, uint64_t a2, float a3, double a4, double a5)
{
  char v6;
  char v7;
  int v8;
  int v9;
  __int128 v10;
  void (**v12)(CMMsl::WatchActiveCalories *__hidden);
  __int128 v13;
  int v14;
  int v15;

  if (a1 != a2)
  {
    v12 = &off_251361C00;
    v15 = 0;
    v6 = *(_BYTE *)(a2 + 28);
    if ((v6 & 4) != 0)
    {
      a3 = *(float *)(a2 + 24);
      v7 = 4;
      LOBYTE(v15) = 4;
      if ((v6 & 2) != 0)
      {
LABEL_4:
        a4 = *(double *)(a2 + 16);
        v7 |= 2u;
        LOBYTE(v15) = v7;
        if ((v6 & 1) != 0)
          goto LABEL_8;
        goto LABEL_9;
      }
    }
    else
    {
      v7 = 0;
      if ((*(_BYTE *)(a2 + 28) & 2) != 0)
        goto LABEL_4;
    }
    if ((v6 & 1) != 0)
    {
LABEL_8:
      a5 = *(double *)(a2 + 8);
      LOBYTE(v15) = v7 | 1;
    }
LABEL_9:
    v8 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)(a1 + 28) = v15;
    v15 = v8;
    v9 = *(_DWORD *)(a1 + 24);
    *(float *)(a1 + 24) = a3;
    v14 = v9;
    v10 = *(_OWORD *)(a1 + 8);
    *(double *)(a1 + 8) = a5;
    *(double *)(a1 + 16) = a4;
    v13 = v10;
    PB::Base::~Base((PB::Base *)&v12);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WatchActiveCalories *a2, CMMsl::WatchActiveCalories *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  double result;

  v3 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  return result;
}

double CMMsl::WatchActiveCalories::WatchActiveCalories(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361C00;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251361C00;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

uint64_t CMMsl::WatchActiveCalories::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  __int128 v6;
  __int128 v7;
  void (**v9)(CMMsl::WatchActiveCalories *__hidden);
  __int128 v10;
  int v11;
  int v12;

  if (a1 != a2)
  {
    v9 = &off_251361C00;
    v3 = *(_DWORD *)(a2 + 28);
    *(_DWORD *)(a2 + 28) = 0;
    v4 = *(_DWORD *)(a2 + 24);
    v12 = *(_DWORD *)(a1 + 28);
    v5 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v4;
    v11 = v5;
    v6 = *(_OWORD *)(a1 + 8);
    v7 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 28) = v3;
    *(_OWORD *)(a1 + 8) = v7;
    v10 = v6;
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t CMMsl::WatchActiveCalories::formatText(CMMsl::WatchActiveCalories *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)this + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PB::TextFormatter::format(a2, "globalMachtime", *((double *)this + 1));
    if ((*((_BYTE *)this + 28) & 2) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_4;
  }
  PB::TextFormatter::format(a2, "calories_kCal", *((float *)this + 6));
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
LABEL_4:
    PB::TextFormatter::format(a2, "localMachtime", *((double *)this + 2));
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WatchActiveCalories::readFrom(CMMsl::WatchActiveCalories *this, PB::Reader *a2)
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
  unint64_t v19;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
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
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_27;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
        break;
      if ((_DWORD)v19 == 2)
      {
        *((_BYTE *)this + 28) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_34;
        *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
LABEL_36:
        v2 = *((_QWORD *)a2 + 1) + 8;
        goto LABEL_37;
      }
      if ((_DWORD)v19 != 1)
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v2 = *((_QWORD *)a2 + 1);
        goto LABEL_38;
      }
      *((_BYTE *)this + 28) |= 4u;
      v2 = *((_QWORD *)a2 + 1);
      if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
      {
LABEL_34:
        *((_BYTE *)a2 + 24) = 1;
        goto LABEL_38;
      }
      *((_DWORD *)this + 6) = *(_DWORD *)(*(_QWORD *)a2 + v2);
      v2 = *((_QWORD *)a2 + 1) + 4;
LABEL_37:
      *((_QWORD *)a2 + 1) = v2;
LABEL_38:
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    *((_BYTE *)this + 28) |= 1u;
    v2 = *((_QWORD *)a2 + 1);
    if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
      goto LABEL_34;
    *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
    goto LABEL_36;
  }
  return v4 == 0;
}

uint64_t CMMsl::WatchActiveCalories::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 28);
  if ((v4 & 4) != 0)
  {
    this = PB::Writer::write(a2, *(float *)(this + 24));
    v4 = *(_BYTE *)(v3 + 28);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        return this;
      return PB::Writer::write(a2, *(double *)(v3 + 8));
    }
  }
  else if ((*(_BYTE *)(this + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(double *)(v3 + 16));
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    return PB::Writer::write(a2, *(double *)(v3 + 8));
  return this;
}

uint64_t CMMsl::WatchActiveCalories::hash_value(CMMsl::WatchActiveCalories *this)
{
  uint64_t v1;
  double v2;
  double v3;
  float v4;

  if ((*((_BYTE *)this + 28) & 4) != 0)
  {
    v4 = *((float *)this + 6);
    v1 = LODWORD(v4);
    if (v4 == 0.0)
      v1 = 0;
    if ((*((_BYTE *)this + 28) & 2) != 0)
    {
LABEL_3:
      v2 = *((double *)this + 2);
      if (v2 == 0.0)
        v2 = 0.0;
      if ((*((_BYTE *)this + 28) & 1) != 0)
        goto LABEL_6;
LABEL_13:
      v3 = 0.0;
      return *(_QWORD *)&v2 ^ v1 ^ *(_QWORD *)&v3;
    }
  }
  else
  {
    v1 = 0;
    if ((*((_BYTE *)this + 28) & 2) != 0)
      goto LABEL_3;
  }
  v2 = 0.0;
  if ((*((_BYTE *)this + 28) & 1) == 0)
    goto LABEL_13;
LABEL_6:
  v3 = *((double *)this + 1);
  if (v3 == 0.0)
    v3 = 0.0;
  return *(_QWORD *)&v2 ^ v1 ^ *(_QWORD *)&v3;
}

void CMMsl::WatchBasalCalories::~WatchBasalCalories(CMMsl::WatchBasalCalories *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

double CMMsl::WatchBasalCalories::WatchBasalCalories(CMMsl::WatchBasalCalories *this, const CMMsl::WatchBasalCalories *a2)
{
  char v2;
  char v3;
  double result;

  *(_QWORD *)this = &off_251361C38;
  *((_DWORD *)this + 7) = 0;
  v2 = *((_BYTE *)a2 + 28);
  if ((v2 & 4) != 0)
  {
    LODWORD(result) = *((_DWORD *)a2 + 6);
    v3 = 4;
    *((_BYTE *)this + 28) = 4;
    *((_DWORD *)this + 6) = LODWORD(result);
    v2 = *((_BYTE *)a2 + 28);
    if ((v2 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 28) & 2) != 0)
  {
LABEL_5:
    result = *((double *)a2 + 2);
    v3 |= 2u;
    *((_BYTE *)this + 28) = v3;
    *((double *)this + 2) = result;
    v2 = *((_BYTE *)a2 + 28);
  }
LABEL_6:
  if ((v2 & 1) != 0)
  {
    result = *((double *)a2 + 1);
    *((_BYTE *)this + 28) = v3 | 1;
    *((double *)this + 1) = result;
  }
  return result;
}

uint64_t CMMsl::WatchBasalCalories::operator=(uint64_t a1, uint64_t a2, float a3, double a4, double a5)
{
  char v6;
  char v7;
  int v8;
  int v9;
  __int128 v10;
  void (**v12)(CMMsl::WatchBasalCalories *__hidden);
  __int128 v13;
  int v14;
  int v15;

  if (a1 != a2)
  {
    v12 = &off_251361C38;
    v15 = 0;
    v6 = *(_BYTE *)(a2 + 28);
    if ((v6 & 4) != 0)
    {
      a3 = *(float *)(a2 + 24);
      v7 = 4;
      LOBYTE(v15) = 4;
      if ((v6 & 2) != 0)
      {
LABEL_4:
        a4 = *(double *)(a2 + 16);
        v7 |= 2u;
        LOBYTE(v15) = v7;
        if ((v6 & 1) != 0)
          goto LABEL_8;
        goto LABEL_9;
      }
    }
    else
    {
      v7 = 0;
      if ((*(_BYTE *)(a2 + 28) & 2) != 0)
        goto LABEL_4;
    }
    if ((v6 & 1) != 0)
    {
LABEL_8:
      a5 = *(double *)(a2 + 8);
      LOBYTE(v15) = v7 | 1;
    }
LABEL_9:
    v8 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)(a1 + 28) = v15;
    v15 = v8;
    v9 = *(_DWORD *)(a1 + 24);
    *(float *)(a1 + 24) = a3;
    v14 = v9;
    v10 = *(_OWORD *)(a1 + 8);
    *(double *)(a1 + 8) = a5;
    *(double *)(a1 + 16) = a4;
    v13 = v10;
    PB::Base::~Base((PB::Base *)&v12);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WatchBasalCalories *a2, CMMsl::WatchBasalCalories *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  double result;

  v3 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  return result;
}

double CMMsl::WatchBasalCalories::WatchBasalCalories(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361C38;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251361C38;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

uint64_t CMMsl::WatchBasalCalories::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  __int128 v6;
  __int128 v7;
  void (**v9)(CMMsl::WatchBasalCalories *__hidden);
  __int128 v10;
  int v11;
  int v12;

  if (a1 != a2)
  {
    v9 = &off_251361C38;
    v3 = *(_DWORD *)(a2 + 28);
    *(_DWORD *)(a2 + 28) = 0;
    v4 = *(_DWORD *)(a2 + 24);
    v12 = *(_DWORD *)(a1 + 28);
    v5 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v4;
    v11 = v5;
    v6 = *(_OWORD *)(a1 + 8);
    v7 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 28) = v3;
    *(_OWORD *)(a1 + 8) = v7;
    v10 = v6;
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t CMMsl::WatchBasalCalories::formatText(CMMsl::WatchBasalCalories *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)this + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PB::TextFormatter::format(a2, "globalMachtime", *((double *)this + 1));
    if ((*((_BYTE *)this + 28) & 2) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_4;
  }
  PB::TextFormatter::format(a2, "calories_kCal", *((float *)this + 6));
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
LABEL_4:
    PB::TextFormatter::format(a2, "localMachtime", *((double *)this + 2));
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WatchBasalCalories::readFrom(CMMsl::WatchBasalCalories *this, PB::Reader *a2)
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
  unint64_t v19;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
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
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_27;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
        break;
      if ((_DWORD)v19 == 2)
      {
        *((_BYTE *)this + 28) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_34;
        *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
LABEL_36:
        v2 = *((_QWORD *)a2 + 1) + 8;
        goto LABEL_37;
      }
      if ((_DWORD)v19 != 1)
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v2 = *((_QWORD *)a2 + 1);
        goto LABEL_38;
      }
      *((_BYTE *)this + 28) |= 4u;
      v2 = *((_QWORD *)a2 + 1);
      if (v2 > 0xFFFFFFFFFFFFFFFBLL || v2 + 4 > *((_QWORD *)a2 + 2))
      {
LABEL_34:
        *((_BYTE *)a2 + 24) = 1;
        goto LABEL_38;
      }
      *((_DWORD *)this + 6) = *(_DWORD *)(*(_QWORD *)a2 + v2);
      v2 = *((_QWORD *)a2 + 1) + 4;
LABEL_37:
      *((_QWORD *)a2 + 1) = v2;
LABEL_38:
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    *((_BYTE *)this + 28) |= 1u;
    v2 = *((_QWORD *)a2 + 1);
    if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
      goto LABEL_34;
    *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
    goto LABEL_36;
  }
  return v4 == 0;
}

uint64_t CMMsl::WatchBasalCalories::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 28);
  if ((v4 & 4) != 0)
  {
    this = PB::Writer::write(a2, *(float *)(this + 24));
    v4 = *(_BYTE *)(v3 + 28);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        return this;
      return PB::Writer::write(a2, *(double *)(v3 + 8));
    }
  }
  else if ((*(_BYTE *)(this + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(double *)(v3 + 16));
  if ((*(_BYTE *)(v3 + 28) & 1) != 0)
    return PB::Writer::write(a2, *(double *)(v3 + 8));
  return this;
}

uint64_t CMMsl::WatchBasalCalories::hash_value(CMMsl::WatchBasalCalories *this)
{
  uint64_t v1;
  double v2;
  double v3;
  float v4;

  if ((*((_BYTE *)this + 28) & 4) != 0)
  {
    v4 = *((float *)this + 6);
    v1 = LODWORD(v4);
    if (v4 == 0.0)
      v1 = 0;
    if ((*((_BYTE *)this + 28) & 2) != 0)
    {
LABEL_3:
      v2 = *((double *)this + 2);
      if (v2 == 0.0)
        v2 = 0.0;
      if ((*((_BYTE *)this + 28) & 1) != 0)
        goto LABEL_6;
LABEL_13:
      v3 = 0.0;
      return *(_QWORD *)&v2 ^ v1 ^ *(_QWORD *)&v3;
    }
  }
  else
  {
    v1 = 0;
    if ((*((_BYTE *)this + 28) & 2) != 0)
      goto LABEL_3;
  }
  v2 = 0.0;
  if ((*((_BYTE *)this + 28) & 1) == 0)
    goto LABEL_13;
LABEL_6:
  v3 = *((double *)this + 1);
  if (v3 == 0.0)
    v3 = 0.0;
  return *(_QWORD *)&v2 ^ v1 ^ *(_QWORD *)&v3;
}

void CMMsl::WatchEnclosureMaterial::~WatchEnclosureMaterial(CMMsl::WatchEnclosureMaterial *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WatchEnclosureMaterial::WatchEnclosureMaterial(uint64_t this, const CMMsl::WatchEnclosureMaterial *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_251361C70;
  *(_DWORD *)(this + 24) = 0;
  if ((*((_BYTE *)a2 + 24) & 2) != 0)
  {
    v3 = *((_QWORD *)a2 + 2);
    *(_BYTE *)(this + 24) = 2;
    *(_QWORD *)(this + 16) = v3;
    v2 = 3;
    if ((*((_BYTE *)a2 + 24) & 1) == 0)
      return this;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*((_BYTE *)a2 + 24) & 1) != 0)
  {
LABEL_5:
    v4 = *((_QWORD *)a2 + 1);
    *(_BYTE *)(this + 24) = v2;
    *(_QWORD *)(this + 8) = v4;
  }
  return this;
}

uint64_t CMMsl::WatchEnclosureMaterial::operator=(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  char v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  int v12;

  if (a1 != a2)
  {
    v11[0] = &off_251361C70;
    v12 = 0;
    v5 = *(_BYTE *)(a2 + 24);
    if ((v5 & 2) != 0)
    {
      a3 = *(double *)(a2 + 16);
      LOBYTE(v12) = 2;
      v6 = 3;
      if ((v5 & 1) != 0)
      {
LABEL_6:
        v3 = *(_QWORD *)(a2 + 8);
        LOBYTE(v12) = v6;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(a2 + 24) & 1) != 0)
        goto LABEL_6;
    }
    v7 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v12;
    v12 = v7;
    v8 = *(_QWORD *)(a1 + 16);
    *(double *)(a1 + 16) = a3;
    v11[2] = v8;
    v9 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v11[1] = v9;
    PB::Base::~Base((PB::Base *)v11);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WatchEnclosureMaterial *a2, CMMsl::WatchEnclosureMaterial *a3)
{
  int v3;
  double result;
  uint64_t v5;

  v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  result = *((double *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((double *)a2 + 2) = result;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return result;
}

double CMMsl::WatchEnclosureMaterial::WatchEnclosureMaterial(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361C70;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251361C70;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t CMMsl::WatchEnclosureMaterial::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  int v11;

  if (a1 != a2)
  {
    v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 8);
    v6 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v3;
    v11 = v6;
    v7 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v4;
    v10[2] = v7;
    v8 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v5;
    v10[0] = &off_251361C70;
    v10[1] = v8;
    PB::Base::~Base((PB::Base *)v10);
  }
  return a1;
}

uint64_t CMMsl::WatchEnclosureMaterial::formatText(CMMsl::WatchEnclosureMaterial *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 24);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "enclosureMaterial");
    v5 = *((_BYTE *)this + 24);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "timestamp", *((double *)this + 2));
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WatchEnclosureMaterial::readFrom(CMMsl::WatchEnclosureMaterial *this, PB::Reader *a2)
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
  unint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  unint64_t v28;
  char v29;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_26;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 24) |= 1u;
        v20 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v21 = *(_QWORD *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
        {
          v26 = 0;
          v27 = 0;
          v24 = 0;
          if (v2 <= v20)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v20)
            {
              v24 = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_47;
            }
            v28 = v20++;
            v29 = *(_BYTE *)(v21 + v28);
            *((_QWORD *)a2 + 1) = v20;
            v24 |= (unint64_t)(v29 & 0x7F) << v26;
            if ((v29 & 0x80) == 0)
              break;
            v26 += 7;
            v14 = v27++ > 8;
            if (v14)
            {
              v24 = 0;
              goto LABEL_46;
            }
          }
          if (*((_BYTE *)a2 + 24))
            v24 = 0;
LABEL_46:
          v2 = v28 + 1;
        }
        else
        {
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (1)
          {
            v2 = v20 + 1;
            *((_QWORD *)a2 + 1) = v20 + 1;
            v25 = *(_BYTE *)(v21 + v20);
            v24 |= (unint64_t)(v25 & 0x7F) << v22;
            if ((v25 & 0x80) == 0)
              break;
            v22 += 7;
            v20 = v2;
            v14 = v23++ > 8;
            if (v14)
            {
              v24 = 0;
              break;
            }
          }
        }
LABEL_47:
        *((_QWORD *)this + 1) = v24;
      }
      else if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 24) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
      }
      else
      {
LABEL_26:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v2 = *((_QWORD *)a2 + 1);
      }
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_26;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WatchEnclosureMaterial::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 24);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 16));
    v4 = *(_BYTE *)(v3 + 24);
  }
  if ((v4 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t CMMsl::WatchEnclosureMaterial::hash_value(CMMsl::WatchEnclosureMaterial *this)
{
  double v1;
  uint64_t v2;

  if ((*((_BYTE *)this + 24) & 2) != 0)
  {
    v1 = *((double *)this + 2);
    if (v1 == 0.0)
      v1 = 0.0;
    if ((*((_BYTE *)this + 24) & 1) != 0)
      goto LABEL_3;
LABEL_7:
    v2 = 0;
    return v2 ^ *(_QWORD *)&v1;
  }
  v1 = 0.0;
  if ((*((_BYTE *)this + 24) & 1) == 0)
    goto LABEL_7;
LABEL_3:
  v2 = *((_QWORD *)this + 1);
  return v2 ^ *(_QWORD *)&v1;
}

void CMMsl::WatchHeartRateData::~WatchHeartRateData(CMMsl::WatchHeartRateData *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_251361CA8;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_251361CA8;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_251361CA8;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WatchHeartRateData *CMMsl::WatchHeartRateData::WatchHeartRateData(CMMsl::WatchHeartRateData *this, const CMMsl::WatchHeartRateData *a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)this = &off_251361CA8;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  if ((*((_BYTE *)a2 + 32) & 2) == 0)
  {
    v4 = 1;
    if ((*((_BYTE *)a2 + 32) & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = *((_QWORD *)a2 + 2);
  *((_BYTE *)this + 32) = 2;
  *((_QWORD *)this + 2) = v5;
  v4 = 3;
  if ((*((_BYTE *)a2 + 32) & 1) != 0)
  {
LABEL_5:
    v6 = *((_QWORD *)a2 + 1);
    *((_BYTE *)this + 32) = v4;
    *((_QWORD *)this + 1) = v6;
  }
LABEL_6:
  if (*((_QWORD *)a2 + 3))
  {
    v7 = operator new();
    v8 = CMMsl::OnsetHeartRateData::OnsetHeartRateData(v7, *((const CMMsl::OnsetHeartRateData **)a2 + 3));
    v9 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v8;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  }
  return this;
}

uint64_t CMMsl::WatchHeartRateData::operator=(uint64_t a1, const CMMsl::WatchHeartRateData *a2)
{
  int v3;
  __int128 v4;
  uint64_t v5;
  void (**v7)(CMMsl::WatchHeartRateData *__hidden);
  __int128 v8;
  uint64_t v9;
  int v10;

  if ((const CMMsl::WatchHeartRateData *)a1 != a2)
  {
    CMMsl::WatchHeartRateData::WatchHeartRateData((CMMsl::WatchHeartRateData *)&v7, a2);
    v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v10;
    v10 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    v8 = v4;
    v5 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v9;
    v7 = &off_251361CA8;
    v9 = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WatchHeartRateData *a2, CMMsl::WatchHeartRateData *a3)
{
  int v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v3 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  v6 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  return result;
}

uint64_t CMMsl::WatchHeartRateData::WatchHeartRateData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = &off_251361CA8;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v4 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WatchHeartRateData::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void (**v9)(CMMsl::WatchHeartRateData *__hidden);
  __int128 v10;
  uint64_t v11;
  int v12;

  if (a1 != a2)
  {
    v3 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 32) = 0;
    v4 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a2 + 24) = 0;
    v12 = *(_DWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 32) = v3;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v5;
    v10 = v6;
    v7 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;
    v9 = &off_251361CA8;
    v11 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t CMMsl::WatchHeartRateData::formatText(CMMsl::WatchHeartRateData *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  uint64_t v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 32);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "globalMachtime", *((double *)this + 1));
    v5 = *((_BYTE *)this + 32);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "localMachtime", *((double *)this + 2));
  v6 = *((_QWORD *)this + 3);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WatchHeartRateData::readFrom(CMMsl::WatchHeartRateData *this, PB::Reader *a2)
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
  unint64_t v20;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  unint64_t v24;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    do
    {
      v8 = *(_QWORD *)a2;
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
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_21;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_19;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_21:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v20 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        v22 = (_DWORD *)operator new();
        *(_QWORD *)v22 = &off_25135F7E8;
        v22[17] = 0;
        v23 = *((_QWORD *)this + 3);
        *((_QWORD *)this + 3) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v22 = (_DWORD *)*((_QWORD *)this + 3);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
        if ((_DWORD)v20 == 2)
        {
          *((_BYTE *)this + 32) |= 1u;
          v24 = *((_QWORD *)a2 + 1);
          if (v24 > 0xFFFFFFFFFFFFFFF7 || v24 + 8 > *((_QWORD *)a2 + 2))
            goto LABEL_35;
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v24);
        }
        else
        {
          if ((_DWORD)v20 != 1)
          {
LABEL_19:
            result = PB::Reader::skip(a2);
            if (!(_DWORD)result)
              return result;
            goto LABEL_38;
          }
          *((_BYTE *)this + 32) |= 2u;
          v21 = *((_QWORD *)a2 + 1);
          if (v21 > 0xFFFFFFFFFFFFFFF7 || v21 + 8 > *((_QWORD *)a2 + 2))
          {
LABEL_35:
            *((_BYTE *)a2 + 24) = 1;
            goto LABEL_38;
          }
          *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v21);
        }
        *((_QWORD *)a2 + 1) += 8;
      }
LABEL_38:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((_BYTE *)a2 + 24));
  }
  return v4 == 0;
}

uint64_t CMMsl::WatchHeartRateData::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;
  const PB::Base *v5;

  v3 = this;
  v4 = *(_BYTE *)(this + 32);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 16));
    v4 = *(_BYTE *)(v3 + 32);
  }
  if ((v4 & 1) != 0)
    this = PB::Writer::write(a2, *(double *)(v3 + 8));
  v5 = *(const PB::Base **)(v3 + 24);
  if (v5)
    return PB::Writer::writeSubmessage(a2, v5);
  return this;
}

unint64_t CMMsl::WatchHeartRateData::hash_value(CMMsl::WatchHeartRateData *this)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  if ((*((_BYTE *)this + 32) & 2) != 0)
  {
    if (*((double *)this + 2) == 0.0)
      v1 = 0;
    else
      v1 = *((_QWORD *)this + 2);
    if ((*((_BYTE *)this + 32) & 1) != 0)
      goto LABEL_3;
LABEL_10:
    v2 = 0;
    goto LABEL_11;
  }
  v1 = 0;
  if ((*((_BYTE *)this + 32) & 1) == 0)
    goto LABEL_10;
LABEL_3:
  if (*((double *)this + 1) == 0.0)
    v2 = 0;
  else
    v2 = *((_QWORD *)this + 1);
LABEL_11:
  v3 = *((_QWORD *)this + 3);
  if (v3)
    v3 = CMMsl::OnsetHeartRateData::hash_value((CMMsl::OnsetHeartRateData *)v3);
  return v2 ^ v1 ^ v3;
}

_QWORD *CMMsl::WatchHeartRateData::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[3])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135F7E8;
    *(_DWORD *)(v2 + 68) = 0;
    this = (_QWORD *)v1[3];
    v1[3] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WatchOnWristState::~WatchOnWristState(CMMsl::WatchOnWristState *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WatchOnWristState::WatchOnWristState(uint64_t this, const CMMsl::WatchOnWristState *a2)
{
  char v2;
  char v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;

  *(_QWORD *)this = &off_251361CE0;
  *(_DWORD *)(this + 40) = 0;
  v2 = *((_BYTE *)a2 + 40);
  if ((v2 & 1) != 0)
  {
    v4 = *((_QWORD *)a2 + 1);
    v3 = 1;
    *(_BYTE *)(this + 40) = 1;
    *(_QWORD *)(this + 8) = v4;
    v2 = *((_BYTE *)a2 + 40);
    if ((v2 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 40) & 4) != 0)
  {
LABEL_5:
    v5 = *((_DWORD *)a2 + 6);
    v3 |= 4u;
    *(_BYTE *)(this + 40) = v3;
    *(_DWORD *)(this + 24) = v5;
    v2 = *((_BYTE *)a2 + 40);
  }
LABEL_6:
  if ((v2 & 0x10) != 0)
  {
    v6 = *((_DWORD *)a2 + 8);
    v3 |= 0x10u;
    *(_BYTE *)(this + 40) = v3;
    *(_DWORD *)(this + 32) = v6;
    v2 = *((_BYTE *)a2 + 40);
    if ((v2 & 8) == 0)
    {
LABEL_8:
      if ((v2 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  else if ((v2 & 8) == 0)
  {
    goto LABEL_8;
  }
  v7 = *((_DWORD *)a2 + 7);
  v3 |= 8u;
  *(_BYTE *)(this + 40) = v3;
  *(_DWORD *)(this + 28) = v7;
  v2 = *((_BYTE *)a2 + 40);
  if ((v2 & 0x40) == 0)
  {
LABEL_9:
    if ((v2 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  v8 = *((_BYTE *)a2 + 37);
  v3 |= 0x40u;
  *(_BYTE *)(this + 40) = v3;
  *(_BYTE *)(this + 37) = v8;
  v2 = *((_BYTE *)a2 + 40);
  if ((v2 & 0x20) == 0)
  {
LABEL_10:
    if ((v2 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_17;
  }
LABEL_16:
  v9 = *((_BYTE *)a2 + 36);
  v3 |= 0x20u;
  *(_BYTE *)(this + 40) = v3;
  *(_BYTE *)(this + 36) = v9;
  v2 = *((_BYTE *)a2 + 40);
  if ((v2 & 0x80) == 0)
  {
LABEL_11:
    if ((v2 & 2) == 0)
      return this;
LABEL_18:
    v11 = *((_QWORD *)a2 + 2);
    *(_BYTE *)(this + 40) = v3 | 2;
    *(_QWORD *)(this + 16) = v11;
    return this;
  }
LABEL_17:
  v10 = *((_BYTE *)a2 + 38);
  v3 |= 0x80u;
  *(_BYTE *)(this + 40) = v3;
  *(_BYTE *)(this + 38) = v10;
  if ((*((_BYTE *)a2 + 40) & 2) != 0)
    goto LABEL_18;
  return this;
}

uint64_t CMMsl::WatchOnWristState::operator=(uint64_t a1, const CMMsl::WatchOnWristState *a2)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  char v15;
  char v16;
  int v17;

  if ((const CMMsl::WatchOnWristState *)a1 != a2)
  {
    CMMsl::WatchOnWristState::WatchOnWristState((uint64_t)&v9, a2);
    v3 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v17;
    v17 = v3;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v10;
    v10 = v4;
    v5 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v13;
    v13 = v5;
    v6 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v12;
    v12 = v6;
    LOBYTE(v5) = *(_BYTE *)(a1 + 37);
    *(_BYTE *)(a1 + 37) = v15;
    v15 = v5;
    LOBYTE(v5) = *(_BYTE *)(a1 + 36);
    *(_BYTE *)(a1 + 36) = v14;
    v14 = v5;
    LOBYTE(v5) = *(_BYTE *)(a1 + 38);
    *(_BYTE *)(a1 + 38) = v16;
    v16 = v5;
    v7 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v11;
    v11 = v7;
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WatchOnWristState *a2, CMMsl::WatchOnWristState *a3)
{
  int v3;
  double result;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  v3 = *((_DWORD *)this + 10);
  *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v3;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  v5 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v5;
  v6 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v6;
  v7 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v7;
  LOBYTE(v7) = *((_BYTE *)this + 37);
  *((_BYTE *)this + 37) = *((_BYTE *)a2 + 37);
  *((_BYTE *)a2 + 37) = v7;
  LOBYTE(v7) = *((_BYTE *)this + 36);
  *((_BYTE *)this + 36) = *((_BYTE *)a2 + 36);
  *((_BYTE *)a2 + 36) = v7;
  LOBYTE(v7) = *((_BYTE *)this + 38);
  *((_BYTE *)this + 38) = *((_BYTE *)a2 + 38);
  *((_BYTE *)a2 + 38) = v7;
  v8 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v8;
  return result;
}

double CMMsl::WatchOnWristState::WatchOnWristState(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361CE0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a2 + 40) = 0;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_BYTE *)(a1 + 37) = *(_BYTE *)(a2 + 37);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_BYTE *)(a1 + 38) = *(_BYTE *)(a2 + 38);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251361CE0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a2 + 40) = 0;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_BYTE *)(a1 + 37) = *(_BYTE *)(a2 + 37);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_BYTE *)(a1 + 38) = *(_BYTE *)(a2 + 38);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return result;
}

uint64_t CMMsl::WatchOnWristState::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];
  int v16;
  char v17;
  char v18;
  char v19;
  int v20;

  if (a1 != a2)
  {
    v15[0] = &off_251361CE0;
    v3 = *(_DWORD *)(a2 + 40);
    *(_DWORD *)(a2 + 40) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    v5 = *(_DWORD *)(a2 + 32);
    v6 = *(_BYTE *)(a2 + 37);
    v7 = *(_BYTE *)(a2 + 36);
    v8 = *(_BYTE *)(a2 + 38);
    v9 = *(_QWORD *)(a2 + 16);
    v20 = *(_DWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v15[1] = v10;
    v16 = *(_DWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 24);
    v12 = *(_QWORD *)(a2 + 24);
    *(_DWORD *)(a1 + 40) = v3;
    *(_DWORD *)(a1 + 32) = v5;
    *(_QWORD *)(a1 + 24) = v12;
    v15[3] = v11;
    LOBYTE(v3) = *(_BYTE *)(a1 + 37);
    *(_BYTE *)(a1 + 37) = v6;
    v18 = v3;
    LOBYTE(v3) = *(_BYTE *)(a1 + 36);
    *(_BYTE *)(a1 + 36) = v7;
    v17 = v3;
    LOBYTE(v3) = *(_BYTE *)(a1 + 38);
    *(_BYTE *)(a1 + 38) = v8;
    v19 = v3;
    v13 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    v15[2] = v13;
    PB::Base::~Base((PB::Base *)v15);
  }
  return a1;
}

uint64_t CMMsl::WatchOnWristState::formatText(CMMsl::WatchOnWristState *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "date", *((double *)this + 1));
    v5 = *((_BYTE *)this + 40);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)this + 40) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "isForcedOnWristEnabled");
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PB::TextFormatter::format(a2, "isOnCharger");
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PB::TextFormatter::format(a2, "isWristDetectionEnabled");
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PB::TextFormatter::format(a2, "onWrist");
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
LABEL_17:
    PB::TextFormatter::format(a2, "onWristSensor");
    if ((*((_BYTE *)this + 40) & 2) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_9;
  }
LABEL_16:
  PB::TextFormatter::format(a2, "onWristConfidence");
  v5 = *((_BYTE *)this + 40);
  if ((v5 & 0x10) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 2) != 0)
LABEL_9:
    PB::TextFormatter::format(a2, "timestamp");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WatchOnWristState::readFrom(CMMsl::WatchOnWristState *this, PB::Reader *a2)
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
  int v39;
  BOOL v40;
  int v41;
  BOOL v42;
  int v43;
  BOOL v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  unint64_t v65;
  char v66;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_26;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      v2 = *((_QWORD *)a2 + 1);
      goto LABEL_21;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_26:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        *((_BYTE *)this + 40) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 2u:
        *((_BYTE *)this + 40) |= 4u;
        v21 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v22 = *(_QWORD *)a2;
        if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v2)
        {
          v51 = 0;
          v52 = 0;
          v25 = 0;
          if (v2 <= v21)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v21)
            {
              LODWORD(v25) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_104;
            }
            v53 = v21++;
            v54 = *(_BYTE *)(v22 + v53);
            *((_QWORD *)a2 + 1) = v21;
            v25 |= (unint64_t)(v54 & 0x7F) << v51;
            if ((v54 & 0x80) == 0)
              break;
            v51 += 7;
            v14 = v52++ > 8;
            if (v14)
            {
              LODWORD(v25) = 0;
LABEL_103:
              v2 = v53 + 1;
              goto LABEL_104;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v25) = 0;
          goto LABEL_103;
        }
        v23 = 0;
        v24 = 0;
        v25 = 0;
        do
        {
          v2 = v21 + 1;
          *((_QWORD *)a2 + 1) = v21 + 1;
          v26 = *(_BYTE *)(v22 + v21);
          v25 |= (unint64_t)(v26 & 0x7F) << v23;
          if ((v26 & 0x80) == 0)
            goto LABEL_104;
          v23 += 7;
          v21 = v2;
          v14 = v24++ > 8;
        }
        while (!v14);
        LODWORD(v25) = 0;
LABEL_104:
        *((_DWORD *)this + 6) = v25;
        break;
      case 3u:
        *((_BYTE *)this + 40) |= 0x10u;
        v27 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
        {
          v55 = 0;
          v56 = 0;
          v31 = 0;
          if (v2 <= v27)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v27)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_109;
            }
            v57 = v27++;
            v58 = *(_BYTE *)(v28 + v57);
            *((_QWORD *)a2 + 1) = v27;
            v31 |= (unint64_t)(v58 & 0x7F) << v55;
            if ((v58 & 0x80) == 0)
              break;
            v55 += 7;
            v14 = v56++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
LABEL_108:
              v2 = v57 + 1;
              goto LABEL_109;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
          goto LABEL_108;
        }
        v29 = 0;
        v30 = 0;
        v31 = 0;
        do
        {
          v2 = v27 + 1;
          *((_QWORD *)a2 + 1) = v27 + 1;
          v32 = *(_BYTE *)(v28 + v27);
          v31 |= (unint64_t)(v32 & 0x7F) << v29;
          if ((v32 & 0x80) == 0)
            goto LABEL_109;
          v29 += 7;
          v27 = v2;
          v14 = v30++ > 8;
        }
        while (!v14);
        LODWORD(v31) = 0;
LABEL_109:
        *((_DWORD *)this + 8) = v31;
        break;
      case 4u:
        *((_BYTE *)this + 40) |= 8u;
        v33 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v34 = *(_QWORD *)a2;
        if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
        {
          v59 = 0;
          v60 = 0;
          v37 = 0;
          if (v2 <= v33)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v33)
            {
              LODWORD(v37) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_114;
            }
            v61 = v33++;
            v62 = *(_BYTE *)(v34 + v61);
            *((_QWORD *)a2 + 1) = v33;
            v37 |= (unint64_t)(v62 & 0x7F) << v59;
            if ((v62 & 0x80) == 0)
              break;
            v59 += 7;
            v14 = v60++ > 8;
            if (v14)
            {
              LODWORD(v37) = 0;
LABEL_113:
              v2 = v61 + 1;
              goto LABEL_114;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v37) = 0;
          goto LABEL_113;
        }
        v35 = 0;
        v36 = 0;
        v37 = 0;
        do
        {
          v2 = v33 + 1;
          *((_QWORD *)a2 + 1) = v33 + 1;
          v38 = *(_BYTE *)(v34 + v33);
          v37 |= (unint64_t)(v38 & 0x7F) << v35;
          if ((v38 & 0x80) == 0)
            goto LABEL_114;
          v35 += 7;
          v33 = v2;
          v14 = v36++ > 8;
        }
        while (!v14);
        LODWORD(v37) = 0;
LABEL_114:
        *((_DWORD *)this + 7) = v37;
        break;
      case 5u:
        *((_BYTE *)this + 40) |= 0x40u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v40 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v39 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v40 = v39 != 0;
        }
        *((_BYTE *)this + 37) = v40;
        break;
      case 6u:
        *((_BYTE *)this + 40) |= 0x20u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v42 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v41 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v42 = v41 != 0;
        }
        *((_BYTE *)this + 36) = v42;
        break;
      case 7u:
        *((_BYTE *)this + 40) |= 0x80u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v44 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v43 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v44 = v43 != 0;
        }
        *((_BYTE *)this + 38) = v44;
        break;
      case 8u:
        *((_BYTE *)this + 40) |= 2u;
        v45 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v46 = *(_QWORD *)a2;
        if (v45 > 0xFFFFFFFFFFFFFFF5 || v45 + 10 > v2)
        {
          v63 = 0;
          v64 = 0;
          v49 = 0;
          if (v2 <= v45)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v45)
            {
              v49 = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_119;
            }
            v65 = v45++;
            v66 = *(_BYTE *)(v46 + v65);
            *((_QWORD *)a2 + 1) = v45;
            v49 |= (unint64_t)(v66 & 0x7F) << v63;
            if ((v66 & 0x80) == 0)
              break;
            v63 += 7;
            v14 = v64++ > 8;
            if (v14)
            {
              v49 = 0;
LABEL_118:
              v2 = v65 + 1;
              goto LABEL_119;
            }
          }
          if (*((_BYTE *)a2 + 24))
            v49 = 0;
          goto LABEL_118;
        }
        v47 = 0;
        v48 = 0;
        v49 = 0;
        do
        {
          v2 = v45 + 1;
          *((_QWORD *)a2 + 1) = v45 + 1;
          v50 = *(_BYTE *)(v46 + v45);
          v49 |= (unint64_t)(v50 & 0x7F) << v47;
          if ((v50 & 0x80) == 0)
            goto LABEL_119;
          v47 += 7;
          v45 = v2;
          v14 = v48++ > 8;
        }
        while (!v14);
        v49 = 0;
LABEL_119:
        *((_QWORD *)this + 2) = v49;
        break;
      default:
        goto LABEL_19;
    }
LABEL_21:
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t CMMsl::WatchOnWristState::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 40);
  if ((v4 & 1) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 8));
    v4 = *(_BYTE *)(v3 + 40);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)(this + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 40);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 40);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 40);
  if ((v4 & 0x40) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  this = PB::Writer::write(a2);
  v4 = *(_BYTE *)(v3 + 40);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  this = PB::Writer::write(a2);
  v4 = *(_BYTE *)(v3 + 40);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 2) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_16:
  this = PB::Writer::write(a2);
  if ((*(_BYTE *)(v3 + 40) & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t CMMsl::WatchOnWristState::hash_value(CMMsl::WatchOnWristState *this)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*((_BYTE *)this + 40) & 1) != 0)
  {
    v1 = *((double *)this + 1);
    if (v1 == 0.0)
      v1 = 0.0;
    if ((*((_BYTE *)this + 40) & 4) != 0)
    {
LABEL_3:
      v2 = *((unsigned int *)this + 6);
      if ((*((_BYTE *)this + 40) & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v1 = 0.0;
    if ((*((_BYTE *)this + 40) & 4) != 0)
      goto LABEL_3;
  }
  v2 = 0;
  if ((*((_BYTE *)this + 40) & 0x10) != 0)
  {
LABEL_4:
    v3 = *((unsigned int *)this + 8);
    if ((*((_BYTE *)this + 40) & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v3 = 0;
  if ((*((_BYTE *)this + 40) & 8) != 0)
  {
LABEL_5:
    v4 = *((unsigned int *)this + 7);
    if ((*((_BYTE *)this + 40) & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((*((_BYTE *)this + 40) & 0x40) != 0)
  {
LABEL_6:
    v5 = *((unsigned __int8 *)this + 37);
    if ((*((_BYTE *)this + 40) & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*((_BYTE *)this + 40) & 0x20) != 0)
  {
LABEL_7:
    v6 = *((unsigned __int8 *)this + 36);
    if ((*((_BYTE *)this + 40) & 0x80) != 0)
      goto LABEL_8;
LABEL_18:
    v7 = 0;
    if ((*((_BYTE *)this + 40) & 2) != 0)
      goto LABEL_9;
LABEL_19:
    v8 = 0;
    return v2 ^ *(_QWORD *)&v1 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_17:
  v6 = 0;
  if ((*((_BYTE *)this + 40) & 0x80) == 0)
    goto LABEL_18;
LABEL_8:
  v7 = *((unsigned __int8 *)this + 38);
  if ((*((_BYTE *)this + 40) & 2) == 0)
    goto LABEL_19;
LABEL_9:
  v8 = *((_QWORD *)this + 2);
  return v2 ^ *(_QWORD *)&v1 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

void CMMsl::WatchOrientationSettings::~WatchOrientationSettings(CMMsl::WatchOrientationSettings *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WatchOrientationSettings::WatchOrientationSettings(uint64_t this, const CMMsl::WatchOrientationSettings *a2)
{
  char v2;
  int v3;
  int v4;

  *(_QWORD *)this = &off_251361D18;
  *(_DWORD *)(this + 16) = 0;
  if ((*((_BYTE *)a2 + 16) & 2) != 0)
  {
    v3 = *((_DWORD *)a2 + 3);
    *(_BYTE *)(this + 16) = 2;
    *(_DWORD *)(this + 12) = v3;
    v2 = 3;
    if ((*((_BYTE *)a2 + 16) & 1) == 0)
      return this;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*((_BYTE *)a2 + 16) & 1) != 0)
  {
LABEL_5:
    v4 = *((_DWORD *)a2 + 2);
    *(_BYTE *)(this + 16) = v2;
    *(_DWORD *)(this + 8) = v4;
  }
  return this;
}

uint64_t CMMsl::WatchOrientationSettings::operator=(uint64_t a1, uint64_t a2)
{
  int v2;
  void (**v4)(CMMsl::WatchOrientationSettings *__hidden);
  char v5;
  char v6;
  int v7;
  uint64_t v8;
  _QWORD v10[2];
  int v11;

  if (a1 != a2)
  {
    v4 = &off_251361D18;
    v10[0] = &off_251361D18;
    v11 = 0;
    v5 = *(_BYTE *)(a2 + 16);
    if ((v5 & 2) != 0)
    {
      LODWORD(v4) = *(_DWORD *)(a2 + 12);
      LOBYTE(v11) = 2;
      v6 = 3;
      if ((v5 & 1) != 0)
      {
LABEL_6:
        v2 = *(_DWORD *)(a2 + 8);
        LOBYTE(v11) = v6;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(a2 + 16) & 1) != 0)
        goto LABEL_6;
    }
    v7 = v11;
    v11 = *(_DWORD *)(a1 + 16);
    v8 = *(_QWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 12) = (_DWORD)v4;
    *(_DWORD *)(a1 + 16) = v7;
    *(_DWORD *)(a1 + 8) = v2;
    v10[1] = v8;
    PB::Base::~Base((PB::Base *)v10);
  }
  return a1;
}

{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  int v8;

  if (a1 != a2)
  {
    v7[0] = &off_251361D18;
    v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    v8 = *(_DWORD *)(a1 + 16);
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 16) = v3;
    *(_QWORD *)(a1 + 8) = v5;
    v7[1] = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

_DWORD *CMMsl::swap(_DWORD *this, CMMsl::WatchOrientationSettings *a2, CMMsl::WatchOrientationSettings *a3)
{
  int v3;
  int v4;
  int v5;

  v3 = this[4];
  this[4] = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  v4 = this[3];
  this[3] = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v4;
  v5 = this[2];
  this[2] = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v5;
  return this;
}

uint64_t CMMsl::WatchOrientationSettings::WatchOrientationSettings(uint64_t result, _DWORD *a2)
{
  *(_QWORD *)result = &off_251361D18;
  *(_DWORD *)(result + 16) = a2[4];
  a2[4] = 0;
  *(_DWORD *)(result + 12) = a2[3];
  *(_DWORD *)(result + 8) = a2[2];
  return result;
}

{
  *(_QWORD *)result = &off_251361D18;
  *(_DWORD *)(result + 16) = a2[4];
  a2[4] = 0;
  *(_DWORD *)(result + 12) = a2[3];
  *(_DWORD *)(result + 8) = a2[2];
  return result;
}

uint64_t CMMsl::WatchOrientationSettings::formatText(CMMsl::WatchOrientationSettings *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 16);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "crown");
    v5 = *((_BYTE *)this + 16);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "wrist");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WatchOrientationSettings::readFrom(CMMsl::WatchOrientationSettings *this, PB::Reader *a2)
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
  unint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  char v24;
  uint64_t result;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  unint64_t v38;
  char v39;

  v3 = *((_QWORD *)a2 + 1);
  v2 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v3 + 1;
        *((_QWORD *)a2 + 1) = v3 + 1;
        v13 = *(_BYTE *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v3 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_30;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 16) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v27 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          v36 = 0;
          v37 = 0;
          v30 = 0;
          if (v2 <= v26)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v26)
            {
              LODWORD(v30) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_64;
            }
            v38 = v26++;
            v39 = *(_BYTE *)(v27 + v38);
            *((_QWORD *)a2 + 1) = v26;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0)
              break;
            v36 += 7;
            v14 = v37++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              goto LABEL_63;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v30) = 0;
LABEL_63:
          v3 = v38 + 1;
        }
        else
        {
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (1)
          {
            v3 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v31 = *(_BYTE *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0)
              break;
            v28 += 7;
            v26 = v3;
            v14 = v29++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              break;
            }
          }
        }
LABEL_64:
        *((_DWORD *)this + 2) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 16) |= 2u;
        v19 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v20 = *(_QWORD *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          v32 = 0;
          v33 = 0;
          v23 = 0;
          if (v2 <= v19)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_60;
            }
            v34 = v19++;
            v35 = *(_BYTE *)(v20 + v34);
            *((_QWORD *)a2 + 1) = v19;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0)
              break;
            v32 += 7;
            v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v23) = 0;
LABEL_59:
          v3 = v34 + 1;
        }
        else
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (1)
          {
            v3 = v19 + 1;
            *((_QWORD *)a2 + 1) = v19 + 1;
            v24 = *(_BYTE *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0)
              break;
            v21 += 7;
            v19 = v3;
            v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 3) = v23;
      }
      else
      {
LABEL_30:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v3 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
      }
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v3 > v2)
      v2 = v3;
    while (v2 != v3)
    {
      v17 = v3 + 1;
      v18 = *(_BYTE *)(v8 + v3);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v3 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_30;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WatchOrientationSettings::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 16);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 16);
  }
  if ((v4 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t CMMsl::WatchOrientationSettings::hash_value(CMMsl::WatchOrientationSettings *this)
{
  uint64_t v1;
  uint64_t v2;

  if ((*((_BYTE *)this + 16) & 2) != 0)
  {
    v1 = *((unsigned int *)this + 3);
    if ((*((_BYTE *)this + 16) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v2 = 0;
    return v2 ^ v1;
  }
  v1 = 0;
  if ((*((_BYTE *)this + 16) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v2 = *((unsigned int *)this + 2);
  return v2 ^ v1;
}

uint64_t CMMsl::WifiScanEntry::WifiScanEntry(uint64_t this)
{
  *(_QWORD *)this = &off_251361D50;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_251361D50;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

void CMMsl::WifiScanEntry::~WifiScanEntry(CMMsl::WifiScanEntry *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WifiScanEntry::WifiScanEntry(uint64_t this, const CMMsl::WifiScanEntry *a2)
{
  char v2;
  char v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  char v7;

  *(_QWORD *)this = &off_251361D50;
  *(_DWORD *)(this + 32) = 0;
  v2 = *((_BYTE *)a2 + 32);
  if ((v2 & 1) != 0)
  {
    v4 = *((_QWORD *)a2 + 1);
    v3 = 1;
    *(_BYTE *)(this + 32) = 1;
    *(_QWORD *)(this + 8) = v4;
    v2 = *((_BYTE *)a2 + 32);
    if ((v2 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 32) & 4) != 0)
  {
LABEL_5:
    v5 = *((_DWORD *)a2 + 6);
    v3 |= 4u;
    *(_BYTE *)(this + 32) = v3;
    *(_DWORD *)(this + 24) = v5;
    v2 = *((_BYTE *)a2 + 32);
  }
LABEL_6:
  if ((v2 & 2) == 0)
  {
    if ((v2 & 8) == 0)
      return this;
LABEL_10:
    v7 = *((_BYTE *)a2 + 28);
    *(_BYTE *)(this + 32) = v3 | 8;
    *(_BYTE *)(this + 28) = v7;
    return this;
  }
  v6 = *((_QWORD *)a2 + 2);
  v3 |= 2u;
  *(_BYTE *)(this + 32) = v3;
  *(_QWORD *)(this + 16) = v6;
  if ((*((_BYTE *)a2 + 32) & 8) != 0)
    goto LABEL_10;
  return this;
}

uint64_t CMMsl::WifiScanEntry::operator=(uint64_t a1, const CMMsl::WifiScanEntry *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[8];
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  int v12;

  if ((const CMMsl::WifiScanEntry *)a1 != a2)
  {
    CMMsl::WifiScanEntry::WifiScanEntry((uint64_t)v7, a2);
    v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v12;
    v12 = v3;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v8;
    v8 = v4;
    LODWORD(v4) = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v10;
    v10 = v4;
    v5 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    v9 = v5;
    LOBYTE(v4) = *(_BYTE *)(a1 + 28);
    *(_BYTE *)(a1 + 28) = v11;
    v11 = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WifiScanEntry *a2, CMMsl::WifiScanEntry *a3)
{
  int v3;
  uint64_t v4;
  double result;

  v3 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  result = *((double *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((double *)a2 + 2) = result;
  LOBYTE(v4) = *((_BYTE *)this + 28);
  *((_BYTE *)this + 28) = *((_BYTE *)a2 + 28);
  *((_BYTE *)a2 + 28) = v4;
  return result;
}

double CMMsl::WifiScanEntry::WifiScanEntry(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361D50;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251361D50;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  return result;
}

uint64_t CMMsl::WifiScanEntry::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  char v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _QWORD v13[3];
  int v14;
  char v15;
  int v16;

  if (a1 != a2)
  {
    v3 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 32) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    v5 = *(_DWORD *)(a2 + 24);
    v6 = *(_QWORD *)(a2 + 16);
    v7 = *(_BYTE *)(a2 + 28);
    v8 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v3;
    v16 = v8;
    v9 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v13[0] = &off_251361D50;
    v13[1] = v9;
    v10 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v5;
    v14 = v10;
    v11 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v6;
    v13[2] = v11;
    LOBYTE(v10) = *(_BYTE *)(a1 + 28);
    *(_BYTE *)(a1 + 28) = v7;
    v15 = v10;
    PB::Base::~Base((PB::Base *)v13);
  }
  return a1;
}

uint64_t CMMsl::WifiScanEntry::formatText(CMMsl::WifiScanEntry *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 32);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "entryId");
    v5 = *((_BYTE *)this + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PB::TextFormatter::format(a2, "rssi");
      if ((*((_BYTE *)this + 32) & 2) == 0)
        return PB::TextFormatter::endObject(a2);
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)this + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "isMoving");
  v5 = *((_BYTE *)this + 32);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 2) != 0)
LABEL_5:
    PB::TextFormatter::format(a2, "timestamp", *((double *)this + 2));
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WifiScanEntry::readFrom(CMMsl::WifiScanEntry *this, PB::Reader *a2)
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
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  int v33;
  BOOL v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  unint64_t v41;
  char v42;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_26;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      v2 = *((_QWORD *)a2 + 1);
      goto LABEL_21;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_26:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        *((_BYTE *)this + 32) |= 1u;
        v21 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v22 = *(_QWORD *)a2;
        if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v2)
        {
          v35 = 0;
          v36 = 0;
          v25 = 0;
          if (v2 <= v21)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v21)
            {
              v25 = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_68;
            }
            v37 = v21++;
            v38 = *(_BYTE *)(v22 + v37);
            *((_QWORD *)a2 + 1) = v21;
            v25 |= (unint64_t)(v38 & 0x7F) << v35;
            if ((v38 & 0x80) == 0)
              break;
            v35 += 7;
            v14 = v36++ > 8;
            if (v14)
            {
              v25 = 0;
LABEL_67:
              v2 = v37 + 1;
              goto LABEL_68;
            }
          }
          if (*((_BYTE *)a2 + 24))
            v25 = 0;
          goto LABEL_67;
        }
        v23 = 0;
        v24 = 0;
        v25 = 0;
        do
        {
          v2 = v21 + 1;
          *((_QWORD *)a2 + 1) = v21 + 1;
          v26 = *(_BYTE *)(v22 + v21);
          v25 |= (unint64_t)(v26 & 0x7F) << v23;
          if ((v26 & 0x80) == 0)
            goto LABEL_68;
          v23 += 7;
          v21 = v2;
          v14 = v24++ > 8;
        }
        while (!v14);
        v25 = 0;
LABEL_68:
        *((_QWORD *)this + 1) = v25;
        break;
      case 2u:
        *((_BYTE *)this + 32) |= 4u;
        v27 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
        {
          v39 = 0;
          v40 = 0;
          v31 = 0;
          if (v2 <= v27)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v27)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_73;
            }
            v41 = v27++;
            v42 = *(_BYTE *)(v28 + v41);
            *((_QWORD *)a2 + 1) = v27;
            v31 |= (unint64_t)(v42 & 0x7F) << v39;
            if ((v42 & 0x80) == 0)
              break;
            v39 += 7;
            v14 = v40++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
LABEL_72:
              v2 = v41 + 1;
              goto LABEL_73;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
          goto LABEL_72;
        }
        v29 = 0;
        v30 = 0;
        v31 = 0;
        do
        {
          v2 = v27 + 1;
          *((_QWORD *)a2 + 1) = v27 + 1;
          v32 = *(_BYTE *)(v28 + v27);
          v31 |= (unint64_t)(v32 & 0x7F) << v29;
          if ((v32 & 0x80) == 0)
            goto LABEL_73;
          v29 += 7;
          v27 = v2;
          v14 = v30++ > 8;
        }
        while (!v14);
        LODWORD(v31) = 0;
LABEL_73:
        *((_DWORD *)this + 6) = -(v31 & 1) ^ ((int)v31 >> 1);
        break;
      case 3u:
        *((_BYTE *)this + 32) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 4u:
        *((_BYTE *)this + 32) |= 8u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v34 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v33 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v34 = v33 != 0;
        }
        *((_BYTE *)this + 28) = v34;
        break;
      default:
        goto LABEL_19;
    }
LABEL_21:
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t CMMsl::WifiScanEntry::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 32);
  if ((v4 & 1) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 32);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)(this + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::writeSInt(a2);
  v4 = *(_BYTE *)(v3 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      return this;
    return PB::Writer::write(a2);
  }
LABEL_8:
  this = PB::Writer::write(a2, *(double *)(v3 + 16));
  if ((*(_BYTE *)(v3 + 32) & 8) != 0)
    return PB::Writer::write(a2);
  return this;
}

BOOL CMMsl::WifiScanEntry::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 1) == 0 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 32) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 2) == 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 2) != 0)
  {
    return 0;
  }
  v2 = (*(_BYTE *)(a2 + 32) & 8) == 0;
  if ((*(_BYTE *)(a1 + 32) & 8) != 0)
    return (*(_BYTE *)(a2 + 32) & 8) != 0 && *(unsigned __int8 *)(a1 + 28) == *(unsigned __int8 *)(a2 + 28);
  return v2;
}

uint64_t CMMsl::WifiScanEntry::hash_value(CMMsl::WifiScanEntry *this)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;

  if ((*((_BYTE *)this + 32) & 1) != 0)
  {
    v1 = *((_QWORD *)this + 1);
    if ((*((_BYTE *)this + 32) & 4) != 0)
    {
LABEL_3:
      v2 = *((int *)this + 6);
      if ((*((_BYTE *)this + 32) & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v1 = 0;
    if ((*((_BYTE *)this + 32) & 4) != 0)
      goto LABEL_3;
  }
  v2 = 0;
  if ((*((_BYTE *)this + 32) & 2) != 0)
  {
LABEL_4:
    v3 = *((double *)this + 2);
    if (v3 == 0.0)
      v3 = 0.0;
    if ((*((_BYTE *)this + 32) & 8) != 0)
      goto LABEL_7;
LABEL_11:
    v4 = 0;
    return v2 ^ v1 ^ *(_QWORD *)&v3 ^ v4;
  }
LABEL_10:
  v3 = 0.0;
  if ((*((_BYTE *)this + 32) & 8) == 0)
    goto LABEL_11;
LABEL_7:
  v4 = *((unsigned __int8 *)this + 28);
  return v2 ^ v1 ^ *(_QWORD *)&v3 ^ v4;
}

void CMMsl::WifiScanResults::~WifiScanResults(CMMsl::WifiScanResults *this)
{
  void **v2;

  *(_QWORD *)this = &off_251361D88;
  v2 = (void **)((char *)this + 8);
  sub_242910B70(&v2);
  PB::Base::~Base(this);
}

{
  void **v2;

  *(_QWORD *)this = &off_251361D88;
  v2 = (void **)((char *)this + 8);
  sub_242910B70(&v2);
  PB::Base::~Base(this);
}

{
  void **v2;

  *(_QWORD *)this = &off_251361D88;
  v2 = (void **)((char *)this + 8);
  sub_242910B70(&v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WifiScanResults *CMMsl::WifiScanResults::WifiScanResults(CMMsl::WifiScanResults *this, const CMMsl::WifiScanResults *a2)
{
  int64x2_t *v3;
  const CMMsl::WifiScanEntry **v4;
  const CMMsl::WifiScanEntry **i;
  const CMMsl::WifiScanEntry *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int64x2_t v21;
  unint64_t v22;
  uint64_t v24;
  int64x2_t v25;
  unint64_t v26;
  char *v27;

  *((_QWORD *)this + 1) = 0;
  v3 = (int64x2_t *)((char *)this + 8);
  *(_QWORD *)this = &off_251361D88;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = (const CMMsl::WifiScanEntry **)*((_QWORD *)a2 + 1);
  for (i = (const CMMsl::WifiScanEntry **)*((_QWORD *)a2 + 2); v4 != i; ++v4)
  {
    v6 = *v4;
    v7 = operator new();
    CMMsl::WifiScanEntry::WifiScanEntry(v7, v6);
    v9 = (uint64_t *)*((_QWORD *)this + 2);
    v8 = *((_QWORD *)this + 3);
    if ((unint64_t)v9 >= v8)
    {
      v11 = ((uint64_t)v9 - v3->i64[0]) >> 3;
      if ((unint64_t)(v11 + 1) >> 61)
        sub_242729A44();
      v12 = v8 - v3->i64[0];
      v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1))
        v13 = v11 + 1;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
        v14 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      v27 = (char *)this + 24;
      if (v14)
        v14 = (unint64_t)sub_2429112FC(v14);
      else
        v15 = 0;
      v16 = (uint64_t *)(v14 + 8 * v11);
      v17 = v14 + 8 * v15;
      v26 = v17;
      *v16 = v7;
      v10 = v16 + 1;
      v25.i64[1] = (uint64_t)(v16 + 1);
      v19 = (_QWORD *)*((_QWORD *)this + 1);
      v18 = (_QWORD *)*((_QWORD *)this + 2);
      if (v18 == v19)
      {
        v21 = vdupq_n_s64((unint64_t)v18);
      }
      else
      {
        do
        {
          v20 = *--v18;
          *v18 = 0;
          *--v16 = v20;
        }
        while (v18 != v19);
        v21 = *v3;
        v10 = (_QWORD *)v25.i64[1];
        v17 = v26;
      }
      *((_QWORD *)this + 1) = v16;
      *((_QWORD *)this + 2) = v10;
      v25 = v21;
      v22 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v17;
      v26 = v22;
      v24 = v21.i64[0];
      sub_2429114EC((uint64_t)&v24);
    }
    else
    {
      *v9 = v7;
      v10 = v9 + 1;
    }
    *((_QWORD *)this + 2) = v10;
  }
  return this;
}

void sub_2429062F8(void *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  sub_2427297D4(a1);
}

uint64_t CMMsl::WifiScanResults::operator=(uint64_t a1, const CMMsl::WifiScanResults *a2)
{
  __int128 v3;
  uint64_t v4;
  void (**v6)(CMMsl::WifiScanResults *__hidden);
  __int128 v7;
  uint64_t v8;
  void **v9;

  if ((const CMMsl::WifiScanResults *)a1 != a2)
  {
    CMMsl::WifiScanResults::WifiScanResults((CMMsl::WifiScanResults *)&v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v3;
    v4 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v8;
    v8 = v4;
    v6 = &off_251361D88;
    v9 = (void **)&v7;
    sub_242910B70(&v9);
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

_QWORD *CMMsl::swap(_QWORD *this, CMMsl::WifiScanResults *a2, CMMsl::WifiScanResults *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  v4 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  return this;
}

_QWORD *CMMsl::WifiScanResults::WifiScanResults(_QWORD *a1, uint64_t a2)
{
  _OWORD *v4;

  *a1 = &off_251361D88;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  v4 = a1 + 1;
  sub_242910BEC(a1 + 1);
  *v4 = *(_OWORD *)(a2 + 8);
  a1[3] = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

{
  _OWORD *v4;

  *a1 = &off_251361D88;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  v4 = a1 + 1;
  sub_242910BEC(a1 + 1);
  *v4 = *(_OWORD *)(a2 + 8);
  a1[3] = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t CMMsl::WifiScanResults::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void (**v9)(CMMsl::WifiScanResults *__hidden);
  __int128 v10;
  uint64_t v11;
  void **v12;

  if (a1 != a2)
  {
    v9 = &off_251361D88;
    v10 = 0uLL;
    v11 = 0;
    sub_242910BEC(&v10);
    v4 = *(_QWORD *)(a2 + 24);
    v5 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v5;
    v10 = v6;
    v7 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;
    v11 = v7;
    v12 = (void **)&v10;
    v9 = &off_251361D88;
    sub_242910B70(&v12);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t CMMsl::WifiScanResults::formatText(CMMsl::WifiScanResults *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "entries");
  }
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WifiScanResults::readFrom(CMMsl::WifiScanResults *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  int64x2_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64x2_t v41;
  unint64_t v42;
  char *v43;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (char *)this + 24;
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_25;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 1)
      {
        v20 = operator new();
        v21 = v20;
        *(_QWORD *)v20 = &off_251361D50;
        *(_DWORD *)(v20 + 32) = 0;
        v23 = (uint64_t *)*((_QWORD *)this + 2);
        v22 = *((_QWORD *)this + 3);
        if ((unint64_t)v23 >= v22)
        {
          v26 = *((_QWORD *)this + 1);
          v27 = ((uint64_t)v23 - v26) >> 3;
          if ((unint64_t)(v27 + 1) >> 61)
            sub_242729A44();
          v28 = v22 - v26;
          v29 = v28 >> 2;
          if (v28 >> 2 <= (unint64_t)(v27 + 1))
            v29 = v27 + 1;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
            v30 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v30 = v29;
          v43 = v8;
          if (v30)
            v30 = (unint64_t)sub_2429112FC(v30);
          else
            v31 = 0;
          v32 = (uint64_t *)(v30 + 8 * v27);
          v33 = v30 + 8 * v31;
          v42 = v33;
          *v32 = v21;
          v24 = v32 + 1;
          v41.i64[1] = (uint64_t)(v32 + 1);
          v35 = (_QWORD *)*((_QWORD *)this + 1);
          v34 = (_QWORD *)*((_QWORD *)this + 2);
          if (v34 == v35)
          {
            v37 = vdupq_n_s64((unint64_t)v34);
          }
          else
          {
            do
            {
              v36 = *--v34;
              *v34 = 0;
              *--v32 = v36;
            }
            while (v34 != v35);
            v37 = *(int64x2_t *)((char *)this + 8);
            v24 = (_QWORD *)v41.i64[1];
            v33 = v42;
          }
          *((_QWORD *)this + 1) = v32;
          *((_QWORD *)this + 2) = v24;
          v41 = v37;
          v38 = *((_QWORD *)this + 3);
          *((_QWORD *)this + 3) = v33;
          v42 = v38;
          v40 = v37.i64[0];
          sub_2429114EC((uint64_t)&v40);
        }
        else
        {
          *v23 = v20;
          v24 = v23 + 1;
        }
        *((_QWORD *)this + 2) = v24;
        v39 = *(v24 - 1);
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v39 + 16))(v39, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_25:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_25;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_24290684C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t CMMsl::WifiScanResults::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base **v2;
  const PB::Base **i;
  const PB::Base *v5;

  v2 = *(const PB::Base ***)(this + 8);
  for (i = *(const PB::Base ***)(this + 16); v2 != i; this = PB::Writer::writeSubmessage(a2, v5))
    v5 = *v2++;
  return this;
}

BOOL sub_2429068B4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;
  BOOL v9;

  if (a2 - a1 != a4 - (_QWORD)a3)
    return 0;
  if (a1 == a2)
    return 1;
  v5 = a3;
  v6 = a1 + 8;
  do
  {
    v7 = *v5++;
    result = CMMsl::WifiScanEntry::operator==(*(_QWORD *)(v6 - 8), v7);
    v9 = !result || v6 == a2;
    v6 += 8;
  }
  while (!v9);
  return result;
}

uint64_t CMMsl::WifiScanResults::hash_value(CMMsl::WifiScanResults *this)
{
  CMMsl::WifiScanEntry **v1;
  CMMsl::WifiScanEntry **v2;
  uint64_t v3;
  CMMsl::WifiScanEntry *v4;

  v1 = (CMMsl::WifiScanEntry **)*((_QWORD *)this + 1);
  v2 = (CMMsl::WifiScanEntry **)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 0;
  v3 = 0;
  do
  {
    v4 = *v1++;
    v3 ^= CMMsl::WifiScanEntry::hash_value(v4);
  }
  while (v1 != v2);
  return v3;
}

void CMMsl::WorkoutActivity::~WorkoutActivity(CMMsl::WorkoutActivity *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WorkoutActivity::WorkoutActivity(uint64_t this, const CMMsl::WorkoutActivity *a2)
{
  char v2;
  int v3;
  int v4;

  *(_QWORD *)this = &off_251361DC0;
  *(_DWORD *)(this + 16) = 0;
  if ((*((_BYTE *)a2 + 16) & 2) != 0)
  {
    v3 = *((_DWORD *)a2 + 3);
    *(_BYTE *)(this + 16) = 2;
    *(_DWORD *)(this + 12) = v3;
    v2 = 3;
    if ((*((_BYTE *)a2 + 16) & 1) == 0)
      return this;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*((_BYTE *)a2 + 16) & 1) != 0)
  {
LABEL_5:
    v4 = *((_DWORD *)a2 + 2);
    *(_BYTE *)(this + 16) = v2;
    *(_DWORD *)(this + 8) = v4;
  }
  return this;
}

uint64_t CMMsl::WorkoutActivity::operator=(uint64_t a1, uint64_t a2)
{
  int v2;
  void (**v4)(CMMsl::WorkoutActivity *__hidden);
  char v5;
  char v6;
  int v7;
  uint64_t v8;
  _QWORD v10[2];
  int v11;

  if (a1 != a2)
  {
    v4 = &off_251361DC0;
    v10[0] = &off_251361DC0;
    v11 = 0;
    v5 = *(_BYTE *)(a2 + 16);
    if ((v5 & 2) != 0)
    {
      LODWORD(v4) = *(_DWORD *)(a2 + 12);
      LOBYTE(v11) = 2;
      v6 = 3;
      if ((v5 & 1) != 0)
      {
LABEL_6:
        v2 = *(_DWORD *)(a2 + 8);
        LOBYTE(v11) = v6;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(a2 + 16) & 1) != 0)
        goto LABEL_6;
    }
    v7 = v11;
    v11 = *(_DWORD *)(a1 + 16);
    v8 = *(_QWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 12) = (_DWORD)v4;
    *(_DWORD *)(a1 + 16) = v7;
    *(_DWORD *)(a1 + 8) = v2;
    v10[1] = v8;
    PB::Base::~Base((PB::Base *)v10);
  }
  return a1;
}

{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  int v8;

  if (a1 != a2)
  {
    v7[0] = &off_251361DC0;
    v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    v8 = *(_DWORD *)(a1 + 16);
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 16) = v3;
    *(_QWORD *)(a1 + 8) = v5;
    v7[1] = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

_DWORD *CMMsl::swap(_DWORD *this, CMMsl::WorkoutActivity *a2, CMMsl::WorkoutActivity *a3)
{
  int v3;
  int v4;
  int v5;

  v3 = this[4];
  this[4] = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  v4 = this[3];
  this[3] = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v4;
  v5 = this[2];
  this[2] = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v5;
  return this;
}

uint64_t CMMsl::WorkoutActivity::WorkoutActivity(uint64_t result, _DWORD *a2)
{
  *(_QWORD *)result = &off_251361DC0;
  *(_DWORD *)(result + 16) = a2[4];
  a2[4] = 0;
  *(_DWORD *)(result + 12) = a2[3];
  *(_DWORD *)(result + 8) = a2[2];
  return result;
}

{
  *(_QWORD *)result = &off_251361DC0;
  *(_DWORD *)(result + 16) = a2[4];
  a2[4] = 0;
  *(_DWORD *)(result + 12) = a2[3];
  *(_DWORD *)(result + 8) = a2[2];
  return result;
}

uint64_t CMMsl::WorkoutActivity::formatText(CMMsl::WorkoutActivity *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 16);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "activityType");
    v5 = *((_BYTE *)this + 16);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "motionNotification");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutActivity::readFrom(CMMsl::WorkoutActivity *this, PB::Reader *a2)
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
  unint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  char v24;
  uint64_t result;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  unint64_t v38;
  char v39;

  v3 = *((_QWORD *)a2 + 1);
  v2 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v3 + 1;
        *((_QWORD *)a2 + 1) = v3 + 1;
        v13 = *(_BYTE *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v3 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_30;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 16) |= 1u;
        v26 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v27 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          v36 = 0;
          v37 = 0;
          v30 = 0;
          if (v2 <= v26)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v26)
            {
              LODWORD(v30) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_64;
            }
            v38 = v26++;
            v39 = *(_BYTE *)(v27 + v38);
            *((_QWORD *)a2 + 1) = v26;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0)
              break;
            v36 += 7;
            v14 = v37++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              goto LABEL_63;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v30) = 0;
LABEL_63:
          v3 = v38 + 1;
        }
        else
        {
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (1)
          {
            v3 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v31 = *(_BYTE *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0)
              break;
            v28 += 7;
            v26 = v3;
            v14 = v29++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              break;
            }
          }
        }
LABEL_64:
        *((_DWORD *)this + 2) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 16) |= 2u;
        v19 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v20 = *(_QWORD *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          v32 = 0;
          v33 = 0;
          v23 = 0;
          if (v2 <= v19)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_60;
            }
            v34 = v19++;
            v35 = *(_BYTE *)(v20 + v34);
            *((_QWORD *)a2 + 1) = v19;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0)
              break;
            v32 += 7;
            v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v23) = 0;
LABEL_59:
          v3 = v34 + 1;
        }
        else
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (1)
          {
            v3 = v19 + 1;
            *((_QWORD *)a2 + 1) = v19 + 1;
            v24 = *(_BYTE *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0)
              break;
            v21 += 7;
            v19 = v3;
            v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 3) = v23;
      }
      else
      {
LABEL_30:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v3 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
      }
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v3 > v2)
      v2 = v3;
    while (v2 != v3)
    {
      v17 = v3 + 1;
      v18 = *(_BYTE *)(v8 + v3);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v3 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_30;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutActivity::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 16);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 16);
  }
  if ((v4 & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t CMMsl::WorkoutActivity::hash_value(CMMsl::WorkoutActivity *this)
{
  uint64_t v1;
  uint64_t v2;

  if ((*((_BYTE *)this + 16) & 2) != 0)
  {
    v1 = *((unsigned int *)this + 3);
    if ((*((_BYTE *)this + 16) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v2 = 0;
    return v2 ^ v1;
  }
  v1 = 0;
  if ((*((_BYTE *)this + 16) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v2 = *((unsigned int *)this + 2);
  return v2 ^ v1;
}

void CMMsl::WorkoutEvent::~WorkoutEvent(CMMsl::WorkoutEvent *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WorkoutEvent::WorkoutEvent(uint64_t this, const CMMsl::WorkoutEvent *a2)
{
  __int16 v2;
  __int16 v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  *(_QWORD *)this = &off_251361DF8;
  *(_DWORD *)(this + 64) = 0;
  v2 = *((_WORD *)a2 + 32);
  if ((v2 & 0x200) != 0)
  {
    v4 = *((_DWORD *)a2 + 15);
    v3 = 512;
    *(_WORD *)(this + 64) = 512;
    *(_DWORD *)(this + 60) = v4;
    v2 = *((_WORD *)a2 + 32);
    if ((v2 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_5:
    v5 = *((_DWORD *)a2 + 10);
    v3 |= 0x10u;
    *(_WORD *)(this + 64) = v3;
    *(_DWORD *)(this + 40) = v5;
    v2 = *((_WORD *)a2 + 32);
  }
LABEL_6:
  if ((v2 & 2) != 0)
  {
    v6 = *((_QWORD *)a2 + 2);
    v3 |= 2u;
    *(_WORD *)(this + 64) = v3;
    *(_QWORD *)(this + 16) = v6;
    v2 = *((_WORD *)a2 + 32);
    if ((v2 & 8) == 0)
    {
LABEL_8:
      if ((v2 & 1) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((v2 & 8) == 0)
  {
    goto LABEL_8;
  }
  v7 = *((_QWORD *)a2 + 4);
  v3 |= 8u;
  *(_WORD *)(this + 64) = v3;
  *(_QWORD *)(this + 32) = v7;
  v2 = *((_WORD *)a2 + 32);
  if ((v2 & 1) == 0)
  {
LABEL_9:
    if ((v2 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v8 = *((_QWORD *)a2 + 1);
  v3 |= 1u;
  *(_WORD *)(this + 64) = v3;
  *(_QWORD *)(this + 8) = v8;
  v2 = *((_WORD *)a2 + 32);
  if ((v2 & 0x80) == 0)
  {
LABEL_10:
    if ((v2 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  v9 = *((_DWORD *)a2 + 13);
  v3 |= 0x80u;
  *(_WORD *)(this + 64) = v3;
  *(_DWORD *)(this + 52) = v9;
  v2 = *((_WORD *)a2 + 32);
  if ((v2 & 0x100) == 0)
  {
LABEL_11:
    if ((v2 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  v10 = *((_DWORD *)a2 + 14);
  v3 |= 0x100u;
  *(_WORD *)(this + 64) = v3;
  *(_DWORD *)(this + 56) = v10;
  v2 = *((_WORD *)a2 + 32);
  if ((v2 & 0x40) == 0)
  {
LABEL_12:
    if ((v2 & 4) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  v11 = *((_DWORD *)a2 + 12);
  v3 |= 0x40u;
  *(_WORD *)(this + 64) = v3;
  *(_DWORD *)(this + 48) = v11;
  v2 = *((_WORD *)a2 + 32);
  if ((v2 & 4) == 0)
  {
LABEL_13:
    if ((v2 & 0x20) == 0)
      return this;
LABEL_22:
    v13 = *((_DWORD *)a2 + 11);
    *(_WORD *)(this + 64) = v3 | 0x20;
    *(_DWORD *)(this + 44) = v13;
    return this;
  }
LABEL_21:
  v12 = *((_QWORD *)a2 + 3);
  v3 |= 4u;
  *(_WORD *)(this + 64) = v3;
  *(_QWORD *)(this + 24) = v12;
  if ((*((_WORD *)a2 + 32) & 0x20) != 0)
    goto LABEL_22;
  return this;
}

uint64_t CMMsl::WorkoutEvent::operator=(uint64_t a1, const CMMsl::WorkoutEvent *a2)
{
  int v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _BYTE v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;

  if ((const CMMsl::WorkoutEvent *)a1 != a2)
  {
    CMMsl::WorkoutEvent::WorkoutEvent((uint64_t)v9, a2);
    v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v14;
    v14 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v5 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v13;
    v13 = v5;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v10 = v4;
    v11 = v6;
    v7 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v12 = v7;
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WorkoutEvent *a2, CMMsl::WorkoutEvent *a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  double result;
  int v13;

  v3 = *((_DWORD *)this + 16);
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = v3;
  v4 = *((_DWORD *)this + 15);
  *((_DWORD *)this + 15) = *((_DWORD *)a2 + 15);
  *((_DWORD *)a2 + 15) = v4;
  v5 = *((_DWORD *)this + 10);
  *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v5;
  v6 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v6;
  v7 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v7;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v8;
  v9 = *((_DWORD *)this + 13);
  *((_DWORD *)this + 13) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = v9;
  v10 = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  *((_DWORD *)a2 + 14) = v10;
  v11 = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v11;
  result = *((double *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((double *)a2 + 3) = result;
  v13 = *((_DWORD *)this + 11);
  *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v13;
  return result;
}

double CMMsl::WorkoutEvent::WorkoutEvent(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361DF8;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 64) = 0;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  result = *(double *)(a2 + 24);
  *(double *)(a1 + 24) = result;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  return result;
}

uint64_t CMMsl::WorkoutEvent::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void (**v11)(CMMsl::WorkoutEvent *__hidden);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  int v16;

  if (a1 != a2)
  {
    v11 = &off_251361DF8;
    v3 = *(_DWORD *)(a2 + 64);
    *(_DWORD *)(a2 + 64) = 0;
    v16 = *(_DWORD *)(a1 + 64);
    v4 = *(_OWORD *)(a1 + 8);
    v5 = *(_OWORD *)(a2 + 8);
    v15 = *(_QWORD *)(a1 + 56);
    v6 = *(_OWORD *)(a1 + 24);
    v7 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v5;
    *(_OWORD *)(a1 + 24) = v7;
    v12 = v4;
    v13 = v6;
    v8 = *(_OWORD *)(a1 + 40);
    v9 = *(_OWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_DWORD *)(a1 + 64) = v3;
    *(_OWORD *)(a1 + 40) = v9;
    v14 = v8;
    PB::Base::~Base((PB::Base *)&v11);
  }
  return a1;
}

uint64_t CMMsl::WorkoutEvent::formatText(CMMsl::WorkoutEvent *this, PB::TextFormatter *a2, const char *a3)
{
  __int16 v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_WORD *)this + 32);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "endTime", *((double *)this + 1));
    v5 = *((_WORD *)this + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "eventTime", *((double *)this + 2));
  v5 = *((_WORD *)this + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PB::TextFormatter::format(a2, "eventType");
  v5 = *((_WORD *)this + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PB::TextFormatter::format(a2, "genericWorkoutLabel");
  v5 = *((_WORD *)this + 32);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PB::TextFormatter::format(a2, "poolLength", *((double *)this + 3));
  v5 = *((_WORD *)this + 32);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PB::TextFormatter::format(a2, "startTime", *((double *)this + 4));
  v5 = *((_WORD *)this + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PB::TextFormatter::format(a2, "swimLocation");
  v5 = *((_WORD *)this + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
LABEL_21:
    PB::TextFormatter::format(a2, "workoutMode");
    if ((*((_WORD *)this + 32) & 0x200) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_11;
  }
LABEL_20:
  PB::TextFormatter::format(a2, "workoutLocationType");
  v5 = *((_WORD *)this + 32);
  if ((v5 & 0x100) != 0)
    goto LABEL_21;
LABEL_10:
  if ((v5 & 0x200) != 0)
LABEL_11:
    PB::TextFormatter::format(a2, "workoutType");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutEvent::readFrom(CMMsl::WorkoutEvent *this, PB::Reader *a2)
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
  unint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  unint64_t v78;
  char v79;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_21;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      v2 = *((_QWORD *)a2 + 1);
      goto LABEL_151;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_21:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        *((_WORD *)this + 32) |= 0x200u;
        v20 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v21 = *(_QWORD *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
        {
          v56 = 0;
          v57 = 0;
          v24 = 0;
          if (v2 <= v20)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v20)
            {
              LODWORD(v24) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_125;
            }
            v58 = v20++;
            v59 = *(_BYTE *)(v21 + v58);
            *((_QWORD *)a2 + 1) = v20;
            v24 |= (unint64_t)(v59 & 0x7F) << v56;
            if ((v59 & 0x80) == 0)
              break;
            v56 += 7;
            v14 = v57++ > 8;
            if (v14)
            {
              LODWORD(v24) = 0;
LABEL_124:
              v2 = v58 + 1;
              goto LABEL_125;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v24) = 0;
          goto LABEL_124;
        }
        v22 = 0;
        v23 = 0;
        v24 = 0;
        do
        {
          v2 = v20 + 1;
          *((_QWORD *)a2 + 1) = v20 + 1;
          v25 = *(_BYTE *)(v21 + v20);
          v24 |= (unint64_t)(v25 & 0x7F) << v22;
          if ((v25 & 0x80) == 0)
            goto LABEL_125;
          v22 += 7;
          v20 = v2;
          v14 = v23++ > 8;
        }
        while (!v14);
        LODWORD(v24) = 0;
LABEL_125:
        *((_DWORD *)this + 15) = v24;
        break;
      case 2u:
        *((_WORD *)this + 32) |= 0x10u;
        v26 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v27 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          v60 = 0;
          v61 = 0;
          v30 = 0;
          if (v2 <= v26)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v26)
            {
              LODWORD(v30) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_130;
            }
            v62 = v26++;
            v63 = *(_BYTE *)(v27 + v62);
            *((_QWORD *)a2 + 1) = v26;
            v30 |= (unint64_t)(v63 & 0x7F) << v60;
            if ((v63 & 0x80) == 0)
              break;
            v60 += 7;
            v14 = v61++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
LABEL_129:
              v2 = v62 + 1;
              goto LABEL_130;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v30) = 0;
          goto LABEL_129;
        }
        v28 = 0;
        v29 = 0;
        v30 = 0;
        do
        {
          v2 = v26 + 1;
          *((_QWORD *)a2 + 1) = v26 + 1;
          v31 = *(_BYTE *)(v27 + v26);
          v30 |= (unint64_t)(v31 & 0x7F) << v28;
          if ((v31 & 0x80) == 0)
            goto LABEL_130;
          v28 += 7;
          v26 = v2;
          v14 = v29++ > 8;
        }
        while (!v14);
        LODWORD(v30) = 0;
LABEL_130:
        *((_DWORD *)this + 10) = v30;
        break;
      case 3u:
        *((_WORD *)this + 32) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_69;
        *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_120;
      case 4u:
        *((_WORD *)this + 32) |= 8u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_69;
        *((_QWORD *)this + 4) = *(_QWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_120;
      case 5u:
        *((_WORD *)this + 32) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_69;
        *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_120;
      case 6u:
        *((_WORD *)this + 32) |= 0x80u;
        v32 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v33 = *(_QWORD *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v2)
        {
          v64 = 0;
          v65 = 0;
          v36 = 0;
          if (v2 <= v32)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v32)
            {
              LODWORD(v36) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_135;
            }
            v66 = v32++;
            v67 = *(_BYTE *)(v33 + v66);
            *((_QWORD *)a2 + 1) = v32;
            v36 |= (unint64_t)(v67 & 0x7F) << v64;
            if ((v67 & 0x80) == 0)
              break;
            v64 += 7;
            v14 = v65++ > 8;
            if (v14)
            {
              LODWORD(v36) = 0;
LABEL_134:
              v2 = v66 + 1;
              goto LABEL_135;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v36) = 0;
          goto LABEL_134;
        }
        v34 = 0;
        v35 = 0;
        v36 = 0;
        do
        {
          v2 = v32 + 1;
          *((_QWORD *)a2 + 1) = v32 + 1;
          v37 = *(_BYTE *)(v33 + v32);
          v36 |= (unint64_t)(v37 & 0x7F) << v34;
          if ((v37 & 0x80) == 0)
            goto LABEL_135;
          v34 += 7;
          v32 = v2;
          v14 = v35++ > 8;
        }
        while (!v14);
        LODWORD(v36) = 0;
LABEL_135:
        *((_DWORD *)this + 13) = v36;
        break;
      case 7u:
        *((_WORD *)this + 32) |= 0x100u;
        v38 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v39 = *(_QWORD *)a2;
        if (v38 > 0xFFFFFFFFFFFFFFF5 || v38 + 10 > v2)
        {
          v68 = 0;
          v69 = 0;
          v42 = 0;
          if (v2 <= v38)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v38)
            {
              LODWORD(v42) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_140;
            }
            v70 = v38++;
            v71 = *(_BYTE *)(v39 + v70);
            *((_QWORD *)a2 + 1) = v38;
            v42 |= (unint64_t)(v71 & 0x7F) << v68;
            if ((v71 & 0x80) == 0)
              break;
            v68 += 7;
            v14 = v69++ > 8;
            if (v14)
            {
              LODWORD(v42) = 0;
LABEL_139:
              v2 = v70 + 1;
              goto LABEL_140;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v42) = 0;
          goto LABEL_139;
        }
        v40 = 0;
        v41 = 0;
        v42 = 0;
        do
        {
          v2 = v38 + 1;
          *((_QWORD *)a2 + 1) = v38 + 1;
          v43 = *(_BYTE *)(v39 + v38);
          v42 |= (unint64_t)(v43 & 0x7F) << v40;
          if ((v43 & 0x80) == 0)
            goto LABEL_140;
          v40 += 7;
          v38 = v2;
          v14 = v41++ > 8;
        }
        while (!v14);
        LODWORD(v42) = 0;
LABEL_140:
        *((_DWORD *)this + 14) = v42;
        break;
      case 8u:
        *((_WORD *)this + 32) |= 0x40u;
        v44 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v45 = *(_QWORD *)a2;
        if (v44 > 0xFFFFFFFFFFFFFFF5 || v44 + 10 > v2)
        {
          v72 = 0;
          v73 = 0;
          v48 = 0;
          if (v2 <= v44)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v44)
            {
              LODWORD(v48) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_145;
            }
            v74 = v44++;
            v75 = *(_BYTE *)(v45 + v74);
            *((_QWORD *)a2 + 1) = v44;
            v48 |= (unint64_t)(v75 & 0x7F) << v72;
            if ((v75 & 0x80) == 0)
              break;
            v72 += 7;
            v14 = v73++ > 8;
            if (v14)
            {
              LODWORD(v48) = 0;
LABEL_144:
              v2 = v74 + 1;
              goto LABEL_145;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v48) = 0;
          goto LABEL_144;
        }
        v46 = 0;
        v47 = 0;
        v48 = 0;
        do
        {
          v2 = v44 + 1;
          *((_QWORD *)a2 + 1) = v44 + 1;
          v49 = *(_BYTE *)(v45 + v44);
          v48 |= (unint64_t)(v49 & 0x7F) << v46;
          if ((v49 & 0x80) == 0)
            goto LABEL_145;
          v46 += 7;
          v44 = v2;
          v14 = v47++ > 8;
        }
        while (!v14);
        LODWORD(v48) = 0;
LABEL_145:
        *((_DWORD *)this + 12) = v48;
        break;
      case 9u:
        *((_WORD *)this + 32) |= 4u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 3) = *(_QWORD *)(*(_QWORD *)a2 + v2);
LABEL_120:
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
LABEL_69:
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 0xAu:
        *((_WORD *)this + 32) |= 0x20u;
        v50 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v51 = *(_QWORD *)a2;
        if (v50 > 0xFFFFFFFFFFFFFFF5 || v50 + 10 > v2)
        {
          v76 = 0;
          v77 = 0;
          v54 = 0;
          if (v2 <= v50)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v50)
            {
              LODWORD(v54) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_150;
            }
            v78 = v50++;
            v79 = *(_BYTE *)(v51 + v78);
            *((_QWORD *)a2 + 1) = v50;
            v54 |= (unint64_t)(v79 & 0x7F) << v76;
            if ((v79 & 0x80) == 0)
              break;
            v76 += 7;
            v14 = v77++ > 8;
            if (v14)
            {
              LODWORD(v54) = 0;
LABEL_149:
              v2 = v78 + 1;
              goto LABEL_150;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v54) = 0;
          goto LABEL_149;
        }
        v52 = 0;
        v53 = 0;
        v54 = 0;
        do
        {
          v2 = v50 + 1;
          *((_QWORD *)a2 + 1) = v50 + 1;
          v55 = *(_BYTE *)(v51 + v50);
          v54 |= (unint64_t)(v55 & 0x7F) << v52;
          if ((v55 & 0x80) == 0)
            goto LABEL_150;
          v52 += 7;
          v50 = v2;
          v14 = v53++ > 8;
        }
        while (!v14);
        LODWORD(v54) = 0;
LABEL_150:
        *((_DWORD *)this + 11) = v54;
        break;
      default:
        goto LABEL_19;
    }
LABEL_151:
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t CMMsl::WorkoutEvent::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  __int16 v4;

  v3 = this;
  v4 = *(_WORD *)(this + 64);
  if ((v4 & 0x200) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_WORD *)(v3 + 64);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  this = PB::Writer::write(a2, *(double *)(v3 + 16));
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  this = PB::Writer::write(a2, *(double *)(v3 + 32));
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  this = PB::Writer::write(a2, *(double *)(v3 + 8));
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 0x100) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 4) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_WORD *)(v3 + 64);
  if ((v4 & 4) == 0)
  {
LABEL_10:
    if ((v4 & 0x20) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_20:
  this = PB::Writer::write(a2, *(double *)(v3 + 24));
  if ((*(_WORD *)(v3 + 64) & 0x20) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t CMMsl::WorkoutEvent::hash_value(CMMsl::WorkoutEvent *this)
{
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v1 = *((_WORD *)this + 32);
  if ((v1 & 0x200) != 0)
  {
    v2 = *((unsigned int *)this + 15);
    if ((v1 & 0x10) != 0)
    {
LABEL_3:
      v3 = *((unsigned int *)this + 10);
      if ((v1 & 2) != 0)
        goto LABEL_4;
LABEL_22:
      v4 = 0.0;
      if ((v1 & 8) != 0)
        goto LABEL_7;
LABEL_23:
      v5 = 0.0;
      if ((v1 & 1) != 0)
        goto LABEL_10;
LABEL_24:
      v6 = 0.0;
      if ((v1 & 0x80) != 0)
        goto LABEL_13;
      goto LABEL_25;
    }
  }
  else
  {
    v2 = 0;
    if ((v1 & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((v1 & 2) == 0)
    goto LABEL_22;
LABEL_4:
  v4 = *((double *)this + 2);
  if (v4 == 0.0)
    v4 = 0.0;
  if ((v1 & 8) == 0)
    goto LABEL_23;
LABEL_7:
  v5 = *((double *)this + 4);
  if (v5 == 0.0)
    v5 = 0.0;
  if ((v1 & 1) == 0)
    goto LABEL_24;
LABEL_10:
  v6 = *((double *)this + 1);
  if (v6 == 0.0)
    v6 = 0.0;
  if ((v1 & 0x80) != 0)
  {
LABEL_13:
    v7 = *((unsigned int *)this + 13);
    if ((*((_WORD *)this + 32) & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  v7 = 0;
  if ((*((_WORD *)this + 32) & 0x100) != 0)
  {
LABEL_14:
    v8 = *((unsigned int *)this + 14);
    if ((v1 & 0x40) != 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  v8 = 0;
  if ((v1 & 0x40) != 0)
  {
LABEL_15:
    v9 = *((unsigned int *)this + 12);
    if ((v1 & 4) != 0)
      goto LABEL_16;
    goto LABEL_28;
  }
LABEL_27:
  v9 = 0;
  if ((v1 & 4) != 0)
  {
LABEL_16:
    v10 = *((double *)this + 3);
    if (v10 == 0.0)
      v10 = 0.0;
    if ((v1 & 0x20) != 0)
      goto LABEL_19;
LABEL_29:
    v11 = 0;
    return v3 ^ v2 ^ *(_QWORD *)&v4 ^ *(_QWORD *)&v5 ^ *(_QWORD *)&v6 ^ v7 ^ v8 ^ v9 ^ *(_QWORD *)&v10 ^ v11;
  }
LABEL_28:
  v10 = 0.0;
  if ((v1 & 0x20) == 0)
    goto LABEL_29;
LABEL_19:
  v11 = *((unsigned int *)this + 11);
  return v3 ^ v2 ^ *(_QWORD *)&v4 ^ *(_QWORD *)&v5 ^ *(_QWORD *)&v6 ^ v7 ^ v8 ^ v9 ^ *(_QWORD *)&v10 ^ v11;
}

uint64_t CMMsl::WorkoutPriorInformation::WorkoutPriorInformation(uint64_t this)
{
  *(_QWORD *)this = &off_251361E30;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_251361E30;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

void CMMsl::WorkoutPriorInformation::~WorkoutPriorInformation(CMMsl::WorkoutPriorInformation *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

uint64_t CMMsl::WorkoutPriorInformation::WorkoutPriorInformation(uint64_t this, const CMMsl::WorkoutPriorInformation *a2)
{
  char v2;
  char v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  *(_QWORD *)this = &off_251361E30;
  *(_DWORD *)(this + 32) = 0;
  v2 = *((_BYTE *)a2 + 32);
  if ((v2 & 0x10) != 0)
  {
    v4 = *((_DWORD *)a2 + 7);
    v3 = 16;
    *(_BYTE *)(this + 32) = 16;
    *(_DWORD *)(this + 28) = v4;
    v2 = *((_BYTE *)a2 + 32);
    if ((v2 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 32) & 8) != 0)
  {
LABEL_5:
    v5 = *((_DWORD *)a2 + 6);
    v3 |= 8u;
    *(_BYTE *)(this + 32) = v3;
    *(_DWORD *)(this + 24) = v5;
    v2 = *((_BYTE *)a2 + 32);
  }
LABEL_6:
  if ((v2 & 4) != 0)
  {
    v6 = *((_DWORD *)a2 + 5);
    v3 |= 4u;
    *(_BYTE *)(this + 32) = v3;
    *(_DWORD *)(this + 20) = v6;
    v2 = *((_BYTE *)a2 + 32);
    if ((v2 & 1) == 0)
    {
LABEL_8:
      if ((v2 & 2) == 0)
        return this;
LABEL_12:
      v8 = *((_DWORD *)a2 + 4);
      *(_BYTE *)(this + 32) = v3 | 2;
      *(_DWORD *)(this + 16) = v8;
      return this;
    }
  }
  else if ((v2 & 1) == 0)
  {
    goto LABEL_8;
  }
  v7 = *((_QWORD *)a2 + 1);
  v3 |= 1u;
  *(_BYTE *)(this + 32) = v3;
  *(_QWORD *)(this + 8) = v7;
  if ((*((_BYTE *)a2 + 32) & 2) != 0)
    goto LABEL_12;
  return this;
}

uint64_t CMMsl::WorkoutPriorInformation::operator=(uint64_t a1, const CMMsl::WorkoutPriorInformation *a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  _BYTE v7[8];
  uint64_t v8;
  __int128 v9;
  int v10;

  if ((const CMMsl::WorkoutPriorInformation *)a1 != a2)
  {
    CMMsl::WorkoutPriorInformation::WorkoutPriorInformation((uint64_t)v7, a2);
    v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v10;
    v10 = v3;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v8;
    v8 = v4;
    v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v9;
    v9 = v5;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WorkoutPriorInformation *a2, CMMsl::WorkoutPriorInformation *a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  double result;
  int v8;

  v3 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v3;
  v4 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v4;
  v5 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v5;
  v6 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v6;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  v8 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v8;
  return result;
}

double CMMsl::WorkoutPriorInformation::WorkoutPriorInformation(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251361E30;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251361E30;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return result;
}

uint64_t CMMsl::WorkoutPriorInformation::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _QWORD v9[2];
  __int128 v10;
  int v11;

  if (a1 != a2)
  {
    v9[0] = &off_251361E30;
    v3 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 32) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    v11 = *(_DWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v9[1] = v5;
    v6 = *(_OWORD *)(a1 + 16);
    v7 = *(_OWORD *)(a2 + 16);
    *(_DWORD *)(a1 + 32) = v3;
    *(_OWORD *)(a1 + 16) = v7;
    v10 = v6;
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t CMMsl::WorkoutPriorInformation::formatText(CMMsl::WorkoutPriorInformation *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 32);
  if ((v5 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "genericWorkoutLabel");
    v5 = *((_BYTE *)this + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)this + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "poolLength", *((double *)this + 1));
  v5 = *((_BYTE *)this + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PB::TextFormatter::format(a2, "workoutLocationType");
    if ((*((_BYTE *)this + 32) & 0x10) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_6;
  }
LABEL_10:
  PB::TextFormatter::format(a2, "swimLocation");
  v5 = *((_BYTE *)this + 32);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 0x10) != 0)
LABEL_6:
    PB::TextFormatter::format(a2, "workoutType");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutPriorInformation::readFrom(CMMsl::WorkoutPriorInformation *this, PB::Reader *a2)
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
  char v45;
  unsigned int v46;
  unint64_t v47;
  char v48;
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

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_26;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      v2 = *((_QWORD *)a2 + 1);
      goto LABEL_21;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
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
LABEL_26:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        *((_BYTE *)this + 32) |= 0x10u;
        v21 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v22 = *(_QWORD *)a2;
        if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v2)
        {
          v45 = 0;
          v46 = 0;
          v25 = 0;
          if (v2 <= v21)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v21)
            {
              LODWORD(v25) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_92;
            }
            v47 = v21++;
            v48 = *(_BYTE *)(v22 + v47);
            *((_QWORD *)a2 + 1) = v21;
            v25 |= (unint64_t)(v48 & 0x7F) << v45;
            if ((v48 & 0x80) == 0)
              break;
            v45 += 7;
            v14 = v46++ > 8;
            if (v14)
            {
              LODWORD(v25) = 0;
LABEL_91:
              v2 = v47 + 1;
              goto LABEL_92;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v25) = 0;
          goto LABEL_91;
        }
        v23 = 0;
        v24 = 0;
        v25 = 0;
        do
        {
          v2 = v21 + 1;
          *((_QWORD *)a2 + 1) = v21 + 1;
          v26 = *(_BYTE *)(v22 + v21);
          v25 |= (unint64_t)(v26 & 0x7F) << v23;
          if ((v26 & 0x80) == 0)
            goto LABEL_92;
          v23 += 7;
          v21 = v2;
          v14 = v24++ > 8;
        }
        while (!v14);
        LODWORD(v25) = 0;
LABEL_92:
        *((_DWORD *)this + 7) = v25;
        break;
      case 2u:
        *((_BYTE *)this + 32) |= 8u;
        v27 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
        {
          v49 = 0;
          v50 = 0;
          v31 = 0;
          if (v2 <= v27)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v27)
            {
              LODWORD(v31) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_97;
            }
            v51 = v27++;
            v52 = *(_BYTE *)(v28 + v51);
            *((_QWORD *)a2 + 1) = v27;
            v31 |= (unint64_t)(v52 & 0x7F) << v49;
            if ((v52 & 0x80) == 0)
              break;
            v49 += 7;
            v14 = v50++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
LABEL_96:
              v2 = v51 + 1;
              goto LABEL_97;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v31) = 0;
          goto LABEL_96;
        }
        v29 = 0;
        v30 = 0;
        v31 = 0;
        do
        {
          v2 = v27 + 1;
          *((_QWORD *)a2 + 1) = v27 + 1;
          v32 = *(_BYTE *)(v28 + v27);
          v31 |= (unint64_t)(v32 & 0x7F) << v29;
          if ((v32 & 0x80) == 0)
            goto LABEL_97;
          v29 += 7;
          v27 = v2;
          v14 = v30++ > 8;
        }
        while (!v14);
        LODWORD(v31) = 0;
LABEL_97:
        *((_DWORD *)this + 6) = v31;
        break;
      case 3u:
        *((_BYTE *)this + 32) |= 4u;
        v33 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v34 = *(_QWORD *)a2;
        if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
        {
          v53 = 0;
          v54 = 0;
          v37 = 0;
          if (v2 <= v33)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v33)
            {
              LODWORD(v37) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_102;
            }
            v55 = v33++;
            v56 = *(_BYTE *)(v34 + v55);
            *((_QWORD *)a2 + 1) = v33;
            v37 |= (unint64_t)(v56 & 0x7F) << v53;
            if ((v56 & 0x80) == 0)
              break;
            v53 += 7;
            v14 = v54++ > 8;
            if (v14)
            {
              LODWORD(v37) = 0;
LABEL_101:
              v2 = v55 + 1;
              goto LABEL_102;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v37) = 0;
          goto LABEL_101;
        }
        v35 = 0;
        v36 = 0;
        v37 = 0;
        do
        {
          v2 = v33 + 1;
          *((_QWORD *)a2 + 1) = v33 + 1;
          v38 = *(_BYTE *)(v34 + v33);
          v37 |= (unint64_t)(v38 & 0x7F) << v35;
          if ((v38 & 0x80) == 0)
            goto LABEL_102;
          v35 += 7;
          v33 = v2;
          v14 = v36++ > 8;
        }
        while (!v14);
        LODWORD(v37) = 0;
LABEL_102:
        *((_DWORD *)this + 5) = v37;
        break;
      case 4u:
        *((_BYTE *)this + 32) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 5u:
        *((_BYTE *)this + 32) |= 2u;
        v39 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v40 = *(_QWORD *)a2;
        if (v39 > 0xFFFFFFFFFFFFFFF5 || v39 + 10 > v2)
        {
          v57 = 0;
          v58 = 0;
          v43 = 0;
          if (v2 <= v39)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v39)
            {
              LODWORD(v43) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_107;
            }
            v59 = v39++;
            v60 = *(_BYTE *)(v40 + v59);
            *((_QWORD *)a2 + 1) = v39;
            v43 |= (unint64_t)(v60 & 0x7F) << v57;
            if ((v60 & 0x80) == 0)
              break;
            v57 += 7;
            v14 = v58++ > 8;
            if (v14)
            {
              LODWORD(v43) = 0;
LABEL_106:
              v2 = v59 + 1;
              goto LABEL_107;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v43) = 0;
          goto LABEL_106;
        }
        v41 = 0;
        v42 = 0;
        v43 = 0;
        do
        {
          v2 = v39 + 1;
          *((_QWORD *)a2 + 1) = v39 + 1;
          v44 = *(_BYTE *)(v40 + v39);
          v43 |= (unint64_t)(v44 & 0x7F) << v41;
          if ((v44 & 0x80) == 0)
            goto LABEL_107;
          v41 += 7;
          v39 = v2;
          v14 = v42++ > 8;
        }
        while (!v14);
        LODWORD(v43) = 0;
LABEL_107:
        *((_DWORD *)this + 4) = v43;
        break;
      default:
        goto LABEL_19;
    }
LABEL_21:
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t CMMsl::WorkoutPriorInformation::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 32);
  if ((v4 & 0x10) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 32);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)(this + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 32);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_10:
  this = PB::Writer::write(a2, *(double *)(v3 + 8));
  if ((*(_BYTE *)(v3 + 32) & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL CMMsl::WorkoutPriorInformation::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if ((*(_BYTE *)(a1 + 32) & 0x10) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 0x10) == 0 || *(_DWORD *)(a1 + 28) != *(_DWORD *)(a2 + 28))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 32) & 8) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 8) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 8) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 32) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 4) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 32) & 1) != 0)
  {
    return 0;
  }
  v2 = (*(_BYTE *)(a2 + 32) & 2) == 0;
  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
    return (*(_BYTE *)(a2 + 32) & 2) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
  return v2;
}

uint64_t CMMsl::WorkoutPriorInformation::hash_value(CMMsl::WorkoutPriorInformation *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;

  if ((*((_BYTE *)this + 32) & 0x10) != 0)
  {
    v1 = *((unsigned int *)this + 7);
    if ((*((_BYTE *)this + 32) & 8) != 0)
    {
LABEL_3:
      v2 = *((unsigned int *)this + 6);
      if ((*((_BYTE *)this + 32) & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v1 = 0;
    if ((*((_BYTE *)this + 32) & 8) != 0)
      goto LABEL_3;
  }
  v2 = 0;
  if ((*((_BYTE *)this + 32) & 4) != 0)
  {
LABEL_4:
    v3 = *((unsigned int *)this + 5);
    if ((*((_BYTE *)this + 32) & 1) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v3 = 0;
  if ((*((_BYTE *)this + 32) & 1) != 0)
  {
LABEL_5:
    v4 = *((double *)this + 1);
    if (v4 == 0.0)
      v4 = 0.0;
    if ((*((_BYTE *)this + 32) & 2) != 0)
      goto LABEL_8;
LABEL_13:
    v5 = 0;
    return v2 ^ v1 ^ v3 ^ *(_QWORD *)&v4 ^ v5;
  }
LABEL_12:
  v4 = 0.0;
  if ((*((_BYTE *)this + 32) & 2) == 0)
    goto LABEL_13;
LABEL_8:
  v5 = *((unsigned int *)this + 4);
  return v2 ^ v1 ^ v3 ^ *(_QWORD *)&v4 ^ v5;
}

void CMMsl::WorkoutRecorderALSData::~WorkoutRecorderALSData(CMMsl::WorkoutRecorderALSData *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361E68;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361E68;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361E68;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderALSData *CMMsl::WorkoutRecorderALSData::WorkoutRecorderALSData(CMMsl::WorkoutRecorderALSData *this, const CMMsl::WorkoutRecorderALSData *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)this = &off_251361E68;
  *((_QWORD *)this + 1) = 0;
  if (*((_QWORD *)a2 + 1))
  {
    v4 = operator new();
    v5 = *((_QWORD *)a2 + 1);
    *(_QWORD *)v4 = &off_25135BBC0;
    *(_DWORD *)(v4 + 12) = 0;
    if ((*(_BYTE *)(v5 + 12) & 1) != 0)
    {
      v6 = *(_DWORD *)(v5 + 8);
      *(_BYTE *)(v4 + 12) = 1;
      *(_DWORD *)(v4 + 8) = v6;
    }
    v7 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v4;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  return this;
}

const CMMsl::WorkoutRecorderALSData *CMMsl::WorkoutRecorderALSData::operator=(const CMMsl::WorkoutRecorderALSData *a1, const CMMsl::WorkoutRecorderALSData *a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderALSData *__hidden);
  uint64_t v6;

  if (a1 != a2)
  {
    CMMsl::WorkoutRecorderALSData::WorkoutRecorderALSData((CMMsl::WorkoutRecorderALSData *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = &off_251361E68;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderALSData *a2, CMMsl::WorkoutRecorderALSData *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderALSData::WorkoutRecorderALSData(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361E68;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361E68;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderALSData::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361E68;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderALSData::formatText(CMMsl::WorkoutRecorderALSData *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderALSData::readFrom(CMMsl::WorkoutRecorderALSData *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135BBC0;
        v19[3] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderALSData::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

uint64_t CMMsl::WorkoutRecorderALSData::hash_value(CMMsl::WorkoutRecorderALSData *this)
{
  uint64_t v1;
  float v2;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(float *)(v1 + 8);
  if (v2 == 0.0 || (*(_BYTE *)(v1 + 12) & 1) == 0)
    return 0;
  else
    return LODWORD(v2);
}

_QWORD *CMMsl::WorkoutRecorderALSData::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135BBC0;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderAccel::~WorkoutRecorderAccel(CMMsl::WorkoutRecorderAccel *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361EA0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361EA0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361EA0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderAccel *CMMsl::WorkoutRecorderAccel::WorkoutRecorderAccel(CMMsl::WorkoutRecorderAccel *this, const CMMsl::Accel **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251361EA0;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::Accel::Accel(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderAccel::operator=(uint64_t a1, const CMMsl::Accel **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderAccel *__hidden);
  uint64_t v6;

  if ((const CMMsl::Accel **)a1 != a2)
  {
    CMMsl::WorkoutRecorderAccel::WorkoutRecorderAccel((CMMsl::WorkoutRecorderAccel *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251361EA0;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderAccel *a2, CMMsl::WorkoutRecorderAccel *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderAccel::WorkoutRecorderAccel(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361EA0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361EA0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderAccel::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361EA0;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderAccel::formatText(CMMsl::WorkoutRecorderAccel *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderAccel::readFrom(CMMsl::WorkoutRecorderAccel *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135BD10;
        v19[8] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderAccel::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::Accel *CMMsl::WorkoutRecorderAccel::hash_value(CMMsl::WorkoutRecorderAccel *this)
{
  CMMsl::Accel *result;

  result = (CMMsl::Accel *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::Accel *)CMMsl::Accel::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderAccel::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135BD10;
    *(_DWORD *)(v2 + 32) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderAccel800::~WorkoutRecorderAccel800(CMMsl::WorkoutRecorderAccel800 *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361ED8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361ED8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361ED8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderAccel800 *CMMsl::WorkoutRecorderAccel800::WorkoutRecorderAccel800(CMMsl::WorkoutRecorderAccel800 *this, const CMMsl::Accel **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251361ED8;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::Accel::Accel(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderAccel800::operator=(uint64_t a1, const CMMsl::Accel **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderAccel800 *__hidden);
  uint64_t v6;

  if ((const CMMsl::Accel **)a1 != a2)
  {
    CMMsl::WorkoutRecorderAccel800::WorkoutRecorderAccel800((CMMsl::WorkoutRecorderAccel800 *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251361ED8;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderAccel800 *a2, CMMsl::WorkoutRecorderAccel800 *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderAccel800::WorkoutRecorderAccel800(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361ED8;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361ED8;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderAccel800::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361ED8;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderAccel800::formatText(CMMsl::WorkoutRecorderAccel800 *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderAccel800::readFrom(CMMsl::WorkoutRecorderAccel800 *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135BD10;
        v19[8] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderAccel800::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::Accel *CMMsl::WorkoutRecorderAccel800::hash_value(CMMsl::WorkoutRecorderAccel800 *this)
{
  CMMsl::Accel *result;

  result = (CMMsl::Accel *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::Accel *)CMMsl::Accel::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderAccel800::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135BD10;
    *(_DWORD *)(v2 + 32) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderAveragedALSData::~WorkoutRecorderAveragedALSData(CMMsl::WorkoutRecorderAveragedALSData *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F10;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F10;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F10;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderAveragedALSData *CMMsl::WorkoutRecorderAveragedALSData::WorkoutRecorderAveragedALSData(CMMsl::WorkoutRecorderAveragedALSData *this, const CMMsl::WorkoutRecorderAveragedALSData *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  *(_QWORD *)this = &off_251361F10;
  *((_QWORD *)this + 1) = 0;
  if (!*((_QWORD *)a2 + 1))
    return this;
  v4 = operator new();
  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)v4 = &off_25135C608;
  *(_DWORD *)(v4 + 20) = 0;
  v6 = *(_BYTE *)(v5 + 20);
  if ((v6 & 1) != 0)
  {
    v8 = *(_QWORD *)(v5 + 8);
    *(_BYTE *)(v4 + 20) = 1;
    *(_QWORD *)(v4 + 8) = v8;
    v7 = 3;
    if ((v6 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = 2;
  if ((*(_BYTE *)(v5 + 20) & 2) != 0)
  {
LABEL_6:
    v9 = *(_DWORD *)(v5 + 16);
    *(_BYTE *)(v4 + 20) = v7;
    *(_DWORD *)(v4 + 16) = v9;
  }
LABEL_7:
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v4;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  return this;
}

const CMMsl::WorkoutRecorderAveragedALSData *CMMsl::WorkoutRecorderAveragedALSData::operator=(const CMMsl::WorkoutRecorderAveragedALSData *a1, const CMMsl::WorkoutRecorderAveragedALSData *a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderAveragedALSData *__hidden);
  uint64_t v6;

  if (a1 != a2)
  {
    CMMsl::WorkoutRecorderAveragedALSData::WorkoutRecorderAveragedALSData((CMMsl::WorkoutRecorderAveragedALSData *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = &off_251361F10;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderAveragedALSData *a2, CMMsl::WorkoutRecorderAveragedALSData *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderAveragedALSData::WorkoutRecorderAveragedALSData(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361F10;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361F10;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderAveragedALSData::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361F10;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderAveragedALSData::formatText(CMMsl::WorkoutRecorderAveragedALSData *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderAveragedALSData::readFrom(CMMsl::WorkoutRecorderAveragedALSData *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135C608;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderAveragedALSData::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

uint64_t CMMsl::WorkoutRecorderAveragedALSData::hash_value(CMMsl::WorkoutRecorderAveragedALSData *this)
{
  uint64_t v1;
  char v2;
  BOOL v3;
  uint64_t v4;
  int v5;
  float v6;
  BOOL v7;
  uint64_t v8;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(_BYTE *)(v1 + 20);
  v3 = *(double *)(v1 + 8) == 0.0 || (v2 & 1) == 0;
  v4 = *(_QWORD *)(v1 + 8);
  if (v3)
    v4 = 0;
  v5 = v2 & 2;
  v6 = *(float *)(v1 + 16);
  v7 = v6 == 0.0 || v5 == 0;
  v8 = LODWORD(v6);
  if (v7)
    v8 = 0;
  return v8 ^ v4;
}

_QWORD *CMMsl::WorkoutRecorderAveragedALSData::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135C608;
    *(_DWORD *)(v2 + 20) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderBodyMetrics::~WorkoutRecorderBodyMetrics(CMMsl::WorkoutRecorderBodyMetrics *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F48;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F48;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F48;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderBodyMetrics *CMMsl::WorkoutRecorderBodyMetrics::WorkoutRecorderBodyMetrics(CMMsl::WorkoutRecorderBodyMetrics *this, const CMMsl::BodyMetrics **a2)
{
  CMMsl::BodyMetrics *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_251361F48;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::BodyMetrics *)operator new();
    v5 = CMMsl::BodyMetrics::BodyMetrics(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    if (v6)
      (*(void (**)(uint64_t, float))(*(_QWORD *)v6 + 8))(v6, v5);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderBodyMetrics::operator=(uint64_t a1, const CMMsl::BodyMetrics **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderBodyMetrics *__hidden);
  uint64_t v6;

  if ((const CMMsl::BodyMetrics **)a1 != a2)
  {
    CMMsl::WorkoutRecorderBodyMetrics::WorkoutRecorderBodyMetrics((CMMsl::WorkoutRecorderBodyMetrics *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251361F48;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderBodyMetrics *a2, CMMsl::WorkoutRecorderBodyMetrics *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderBodyMetrics::WorkoutRecorderBodyMetrics(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361F48;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361F48;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderBodyMetrics::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361F48;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderBodyMetrics::formatText(CMMsl::WorkoutRecorderBodyMetrics *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderBodyMetrics::readFrom(CMMsl::WorkoutRecorderBodyMetrics *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135CA30;
        v19[16] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderBodyMetrics::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::BodyMetrics *CMMsl::WorkoutRecorderBodyMetrics::hash_value(CMMsl::WorkoutRecorderBodyMetrics *this)
{
  CMMsl::BodyMetrics *result;

  result = (CMMsl::BodyMetrics *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::BodyMetrics *)CMMsl::BodyMetrics::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderBodyMetrics::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135CA30;
    *(_DWORD *)(v2 + 64) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderCompassCalibration::~WorkoutRecorderCompassCalibration(CMMsl::WorkoutRecorderCompassCalibration *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F80;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F80;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361F80;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderCompassCalibration *CMMsl::WorkoutRecorderCompassCalibration::WorkoutRecorderCompassCalibration(CMMsl::WorkoutRecorderCompassCalibration *this, const CMMsl::CompassCalibration **a2)
{
  CMMsl::CompassCalibration *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_251361F80;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::CompassCalibration *)operator new();
    v5 = CMMsl::CompassCalibration::CompassCalibration(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    if (v6)
      (*(void (**)(uint64_t, float))(*(_QWORD *)v6 + 8))(v6, v5);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderCompassCalibration::operator=(uint64_t a1, const CMMsl::CompassCalibration **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderCompassCalibration *__hidden);
  uint64_t v6;

  if ((const CMMsl::CompassCalibration **)a1 != a2)
  {
    CMMsl::WorkoutRecorderCompassCalibration::WorkoutRecorderCompassCalibration((CMMsl::WorkoutRecorderCompassCalibration *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251361F80;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderCompassCalibration *a2, CMMsl::WorkoutRecorderCompassCalibration *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderCompassCalibration::WorkoutRecorderCompassCalibration(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361F80;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361F80;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderCompassCalibration::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361F80;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderCompassCalibration::formatText(CMMsl::WorkoutRecorderCompassCalibration *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderCompassCalibration::readFrom(CMMsl::WorkoutRecorderCompassCalibration *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135CE90;
        v19[20] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderCompassCalibration::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::CompassCalibration *CMMsl::WorkoutRecorderCompassCalibration::hash_value(CMMsl::WorkoutRecorderCompassCalibration *this)
{
  CMMsl::CompassCalibration *result;

  result = (CMMsl::CompassCalibration *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::CompassCalibration *)CMMsl::CompassCalibration::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderCompassCalibration::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135CE90;
    *(_DWORD *)(v2 + 80) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderElevation::~WorkoutRecorderElevation(CMMsl::WorkoutRecorderElevation *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361FB8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361FB8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361FB8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderElevation *CMMsl::WorkoutRecorderElevation::WorkoutRecorderElevation(CMMsl::WorkoutRecorderElevation *this, const CMMsl::ElevationChange **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251361FB8;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::ElevationChange::ElevationChange(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderElevation::operator=(uint64_t a1, const CMMsl::ElevationChange **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderElevation *__hidden);
  uint64_t v6;

  if ((const CMMsl::ElevationChange **)a1 != a2)
  {
    CMMsl::WorkoutRecorderElevation::WorkoutRecorderElevation((CMMsl::WorkoutRecorderElevation *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251361FB8;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderElevation *a2, CMMsl::WorkoutRecorderElevation *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderElevation::WorkoutRecorderElevation(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361FB8;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361FB8;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderElevation::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361FB8;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderElevation::formatText(CMMsl::WorkoutRecorderElevation *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderElevation::readFrom(CMMsl::WorkoutRecorderElevation *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135D3D0;
        v19[15] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderElevation::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::ElevationChange *CMMsl::WorkoutRecorderElevation::hash_value(CMMsl::WorkoutRecorderElevation *this)
{
  CMMsl::ElevationChange *result;

  result = (CMMsl::ElevationChange *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::ElevationChange *)CMMsl::ElevationChange::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderElevation::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135D3D0;
    *(_DWORD *)(v2 + 60) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderFaceCovered::~WorkoutRecorderFaceCovered(CMMsl::WorkoutRecorderFaceCovered *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361FF0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361FF0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251361FF0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderFaceCovered *CMMsl::WorkoutRecorderFaceCovered::WorkoutRecorderFaceCovered(CMMsl::WorkoutRecorderFaceCovered *this, const CMMsl::WorkoutRecorderFaceCovered *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  *(_QWORD *)this = &off_251361FF0;
  *((_QWORD *)this + 1) = 0;
  if (!*((_QWORD *)a2 + 1))
    return this;
  v4 = operator new();
  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)v4 = &off_25135D558;
  *(_DWORD *)(v4 + 20) = 0;
  v6 = *(_BYTE *)(v5 + 20);
  if ((v6 & 1) != 0)
  {
    v8 = *(_QWORD *)(v5 + 8);
    *(_BYTE *)(v4 + 20) = 1;
    *(_QWORD *)(v4 + 8) = v8;
    v7 = 3;
    if ((v6 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = 2;
  if ((*(_BYTE *)(v5 + 20) & 2) != 0)
  {
LABEL_6:
    v9 = *(_BYTE *)(v5 + 16);
    *(_BYTE *)(v4 + 20) = v7;
    *(_BYTE *)(v4 + 16) = v9;
  }
LABEL_7:
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v4;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  return this;
}

const CMMsl::WorkoutRecorderFaceCovered *CMMsl::WorkoutRecorderFaceCovered::operator=(const CMMsl::WorkoutRecorderFaceCovered *a1, const CMMsl::WorkoutRecorderFaceCovered *a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderFaceCovered *__hidden);
  uint64_t v6;

  if (a1 != a2)
  {
    CMMsl::WorkoutRecorderFaceCovered::WorkoutRecorderFaceCovered((CMMsl::WorkoutRecorderFaceCovered *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = &off_251361FF0;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderFaceCovered *a2, CMMsl::WorkoutRecorderFaceCovered *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderFaceCovered::WorkoutRecorderFaceCovered(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361FF0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251361FF0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderFaceCovered::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251361FF0;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderFaceCovered::formatText(CMMsl::WorkoutRecorderFaceCovered *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderFaceCovered::readFrom(CMMsl::WorkoutRecorderFaceCovered *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135D558;
        v19[5] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderFaceCovered::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

uint64_t CMMsl::WorkoutRecorderFaceCovered::hash_value(CMMsl::WorkoutRecorderFaceCovered *this)
{
  uint64_t v1;
  int v2;
  BOOL v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(unsigned __int8 *)(v1 + 20);
  v3 = *(double *)(v1 + 8) == 0.0 || (v2 & 1) == 0;
  v4 = *(_QWORD *)(v1 + 8);
  if (v3)
    v4 = 0;
  return v4 ^ (*(_BYTE *)(v1 + 16) & (v2 << 30 >> 31));
}

_QWORD *CMMsl::WorkoutRecorderFaceCovered::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135D558;
    *(_DWORD *)(v2 + 20) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderFitnessMachineData::~WorkoutRecorderFitnessMachineData(CMMsl::WorkoutRecorderFitnessMachineData *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362028;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362028;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362028;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderFitnessMachineData *CMMsl::WorkoutRecorderFitnessMachineData::WorkoutRecorderFitnessMachineData(CMMsl::WorkoutRecorderFitnessMachineData *this, const CMMsl::FitnessMachineData **a2)
{
  CMMsl::FitnessMachineData *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_251362028;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::FitnessMachineData *)operator new();
    v5 = CMMsl::FitnessMachineData::FitnessMachineData(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    if (v6)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v6 + 8))(v6, v5);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderFitnessMachineData::operator=(uint64_t a1, const CMMsl::FitnessMachineData **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderFitnessMachineData *__hidden);
  uint64_t v6;

  if ((const CMMsl::FitnessMachineData **)a1 != a2)
  {
    CMMsl::WorkoutRecorderFitnessMachineData::WorkoutRecorderFitnessMachineData((CMMsl::WorkoutRecorderFitnessMachineData *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362028;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderFitnessMachineData *a2, CMMsl::WorkoutRecorderFitnessMachineData *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderFitnessMachineData::WorkoutRecorderFitnessMachineData(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362028;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362028;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderFitnessMachineData::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362028;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderFitnessMachineData::formatText(CMMsl::WorkoutRecorderFitnessMachineData *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderFitnessMachineData::readFrom(CMMsl::WorkoutRecorderFitnessMachineData *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135D948;
        v19[44] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderFitnessMachineData::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::FitnessMachineData *CMMsl::WorkoutRecorderFitnessMachineData::hash_value(CMMsl::WorkoutRecorderFitnessMachineData *this)
{
  CMMsl::FitnessMachineData *result;

  result = (CMMsl::FitnessMachineData *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::FitnessMachineData *)CMMsl::FitnessMachineData::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderFitnessMachineData::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135D948;
    *(_DWORD *)(v2 + 176) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderHealthKitInfo::~WorkoutRecorderHealthKitInfo(CMMsl::WorkoutRecorderHealthKitInfo *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

double CMMsl::WorkoutRecorderHealthKitInfo::WorkoutRecorderHealthKitInfo(CMMsl::WorkoutRecorderHealthKitInfo *this, const CMMsl::WorkoutRecorderHealthKitInfo *a2)
{
  char v2;
  char v3;
  int v4;
  double result;

  *(_QWORD *)this = &off_251362060;
  *((_DWORD *)this + 7) = 0;
  v2 = *((_BYTE *)a2 + 28);
  if ((v2 & 4) != 0)
  {
    v4 = *((_DWORD *)a2 + 6);
    v3 = 4;
    *((_BYTE *)this + 28) = 4;
    *((_DWORD *)this + 6) = v4;
    v2 = *((_BYTE *)a2 + 28);
    if ((v2 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 28) & 1) != 0)
  {
LABEL_5:
    result = *((double *)a2 + 1);
    v3 |= 1u;
    *((_BYTE *)this + 28) = v3;
    *((double *)this + 1) = result;
    v2 = *((_BYTE *)a2 + 28);
  }
LABEL_6:
  if ((v2 & 2) != 0)
  {
    result = *((double *)a2 + 2);
    *((_BYTE *)this + 28) = v3 | 2;
    *((double *)this + 2) = result;
  }
  return result;
}

uint64_t CMMsl::WorkoutRecorderHealthKitInfo::operator=(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void (**v5)(CMMsl::WorkoutRecorderHealthKitInfo *__hidden);
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  __int128 v10;
  void (**v12)(CMMsl::WorkoutRecorderHealthKitInfo *__hidden);
  __int128 v13;
  uint64_t v14;

  if (a1 != a2)
  {
    v5 = &off_251362060;
    v12 = &off_251362060;
    HIDWORD(v14) = 0;
    v6 = *(_BYTE *)(a2 + 28);
    if ((v6 & 4) != 0)
    {
      LODWORD(v5) = *(_DWORD *)(a2 + 24);
      v7 = 4;
      BYTE4(v14) = 4;
      if ((v6 & 1) != 0)
      {
LABEL_4:
        a3 = *(double *)(a2 + 8);
        v7 |= 1u;
        BYTE4(v14) = v7;
        if ((v6 & 2) != 0)
          goto LABEL_8;
        goto LABEL_9;
      }
    }
    else
    {
      v7 = 0;
      if ((*(_BYTE *)(a2 + 28) & 1) != 0)
        goto LABEL_4;
    }
    if ((v6 & 2) != 0)
    {
LABEL_8:
      a4 = *(double *)(a2 + 16);
      BYTE4(v14) = v7 | 2;
    }
LABEL_9:
    v8 = HIDWORD(v14);
    v9 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = (_DWORD)v5;
    *(_DWORD *)(a1 + 28) = v8;
    v14 = v9;
    v10 = *(_OWORD *)(a1 + 8);
    *(double *)(a1 + 8) = a3;
    *(double *)(a1 + 16) = a4;
    v13 = v10;
    PB::Base::~Base((PB::Base *)&v12);
  }
  return a1;
}

double CMMsl::swap(CMMsl *this, CMMsl::WorkoutRecorderHealthKitInfo *a2, CMMsl::WorkoutRecorderHealthKitInfo *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  double result;

  v3 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  v4 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  result = *((double *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((double *)a2 + 2) = result;
  return result;
}

double CMMsl::WorkoutRecorderHealthKitInfo::WorkoutRecorderHealthKitInfo(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_251362060;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_251362060;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  return result;
}

uint64_t CMMsl::WorkoutRecorderHealthKitInfo::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  void (**v7)(CMMsl::WorkoutRecorderHealthKitInfo *__hidden);
  __int128 v8;
  uint64_t v9;

  if (a1 != a2)
  {
    v7 = &off_251362060;
    v3 = *(_OWORD *)(a2 + 8);
    v4 = *(_QWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 28) = 0;
    v9 = *(_QWORD *)(a1 + 24);
    v5 = *(_OWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 24) = v4;
    *(_OWORD *)(a1 + 8) = v3;
    v8 = v5;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderHealthKitInfo::formatText(CMMsl::WorkoutRecorderHealthKitInfo *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)this + 28) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PB::TextFormatter::format(a2, "walkingHeartRateAverage", *((double *)this + 2));
    if ((*((_BYTE *)this + 28) & 4) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_4;
  }
  PB::TextFormatter::format(a2, "restingHeartRate", *((double *)this + 1));
  v5 = *((_BYTE *)this + 28);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
LABEL_4:
    PB::TextFormatter::format(a2, "workoutActivityType");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderHealthKitInfo::readFrom(CMMsl::WorkoutRecorderHealthKitInfo *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int i;
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
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t result;
  char v27;
  unsigned int v28;
  unint64_t v29;
  char v30;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  for (i = *((unsigned __int8 *)a2 + 24); v2 < v3 && i == 0; i = *((unsigned __int8 *)a2 + 24))
  {
    v8 = *(_QWORD *)a2;
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
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_20;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
        if (v14)
          goto LABEL_31;
      }
      i = 1;
      *((_BYTE *)a2 + 24) = 1;
      return i == 0;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_31;
    }
LABEL_20:
    if ((v11 & 7) == 4)
    {
      i = 0;
      return i == 0;
    }
    v19 = v11 >> 3;
    if ((v11 >> 3) == 3)
    {
      *((_BYTE *)this + 28) |= 2u;
      v2 = *((_QWORD *)a2 + 1);
      if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
      {
        *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
LABEL_47:
        v2 = *((_QWORD *)a2 + 1) + 8;
        *((_QWORD *)a2 + 1) = v2;
        goto LABEL_53;
      }
    }
    else
    {
      if ((_DWORD)v19 != 2)
      {
        if ((_DWORD)v19 == 1)
        {
          *((_BYTE *)this + 28) |= 4u;
          v20 = *((_QWORD *)a2 + 1);
          v2 = *((_QWORD *)a2 + 2);
          v21 = *(_QWORD *)a2;
          if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
          {
            v27 = 0;
            v28 = 0;
            v24 = 0;
            if (v2 <= v20)
              v2 = *((_QWORD *)a2 + 1);
            while (1)
            {
              if (v2 == v20)
              {
                LODWORD(v24) = 0;
                *((_BYTE *)a2 + 24) = 1;
                goto LABEL_52;
              }
              v29 = v20++;
              v30 = *(_BYTE *)(v21 + v29);
              *((_QWORD *)a2 + 1) = v20;
              v24 |= (unint64_t)(v30 & 0x7F) << v27;
              if ((v30 & 0x80) == 0)
                break;
              v27 += 7;
              v14 = v28++ > 8;
              if (v14)
              {
                LODWORD(v24) = 0;
                goto LABEL_51;
              }
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v24) = 0;
LABEL_51:
            v2 = v29 + 1;
          }
          else
          {
            v22 = 0;
            v23 = 0;
            v24 = 0;
            while (1)
            {
              v2 = v20 + 1;
              *((_QWORD *)a2 + 1) = v20 + 1;
              v25 = *(_BYTE *)(v21 + v20);
              v24 |= (unint64_t)(v25 & 0x7F) << v22;
              if ((v25 & 0x80) == 0)
                break;
              v22 += 7;
              v20 = v2;
              v14 = v23++ > 8;
              if (v14)
              {
                LODWORD(v24) = 0;
                break;
              }
            }
          }
LABEL_52:
          *((_DWORD *)this + 6) = v24;
        }
        else
        {
LABEL_31:
          result = PB::Reader::skip(a2);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)a2 + 1);
        }
        goto LABEL_53;
      }
      *((_BYTE *)this + 28) |= 1u;
      v2 = *((_QWORD *)a2 + 1);
      if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
      {
        *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_47;
      }
    }
    *((_BYTE *)a2 + 24) = 1;
LABEL_53:
    v3 = *((_QWORD *)a2 + 2);
  }
  return i == 0;
}

uint64_t CMMsl::WorkoutRecorderHealthKitInfo::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 28);
  if ((v4 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        return this;
      return PB::Writer::write(a2, *(double *)(v3 + 16));
    }
  }
  else if ((*(_BYTE *)(this + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(double *)(v3 + 8));
  if ((*(_BYTE *)(v3 + 28) & 2) != 0)
    return PB::Writer::write(a2, *(double *)(v3 + 16));
  return this;
}

uint64_t CMMsl::WorkoutRecorderHealthKitInfo::hash_value(CMMsl::WorkoutRecorderHealthKitInfo *this)
{
  uint64_t v1;
  double v2;
  double v3;

  if ((*((_BYTE *)this + 28) & 4) != 0)
  {
    v1 = *((unsigned int *)this + 6);
    if ((*((_BYTE *)this + 28) & 1) != 0)
    {
LABEL_3:
      v2 = *((double *)this + 1);
      if (v2 == 0.0)
        v2 = 0.0;
      if ((*((_BYTE *)this + 28) & 2) != 0)
        goto LABEL_6;
LABEL_11:
      v3 = 0.0;
      return *(_QWORD *)&v2 ^ v1 ^ *(_QWORD *)&v3;
    }
  }
  else
  {
    v1 = 0;
    if ((*((_BYTE *)this + 28) & 1) != 0)
      goto LABEL_3;
  }
  v2 = 0.0;
  if ((*((_BYTE *)this + 28) & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v3 = *((double *)this + 2);
  if (v3 == 0.0)
    v3 = 0.0;
  return *(_QWORD *)&v2 ^ v1 ^ *(_QWORD *)&v3;
}

void CMMsl::WorkoutRecorderHeartRate::~WorkoutRecorderHeartRate(CMMsl::WorkoutRecorderHeartRate *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362098;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362098;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362098;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderHeartRate *CMMsl::WorkoutRecorderHeartRate::WorkoutRecorderHeartRate(CMMsl::WorkoutRecorderHeartRate *this, const CMMsl::OnsetHeartRateData **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251362098;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::OnsetHeartRateData::OnsetHeartRateData(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderHeartRate::operator=(uint64_t a1, const CMMsl::OnsetHeartRateData **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderHeartRate *__hidden);
  uint64_t v6;

  if ((const CMMsl::OnsetHeartRateData **)a1 != a2)
  {
    CMMsl::WorkoutRecorderHeartRate::WorkoutRecorderHeartRate((CMMsl::WorkoutRecorderHeartRate *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362098;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderHeartRate *a2, CMMsl::WorkoutRecorderHeartRate *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderHeartRate::WorkoutRecorderHeartRate(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362098;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362098;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderHeartRate::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362098;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderHeartRate::formatText(CMMsl::WorkoutRecorderHeartRate *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderHeartRate::readFrom(CMMsl::WorkoutRecorderHeartRate *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135F7E8;
        v19[17] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderHeartRate::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::OnsetHeartRateData *CMMsl::WorkoutRecorderHeartRate::hash_value(CMMsl::WorkoutRecorderHeartRate *this)
{
  CMMsl::OnsetHeartRateData *result;

  result = (CMMsl::OnsetHeartRateData *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::OnsetHeartRateData *)CMMsl::OnsetHeartRateData::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderHeartRate::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135F7E8;
    *(_DWORD *)(v2 + 68) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderMagnetometer::~WorkoutRecorderMagnetometer(CMMsl::WorkoutRecorderMagnetometer *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513620D0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513620D0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513620D0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderMagnetometer *CMMsl::WorkoutRecorderMagnetometer::WorkoutRecorderMagnetometer(CMMsl::WorkoutRecorderMagnetometer *this, const CMMsl::Magnetometer **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_2513620D0;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::Magnetometer::Magnetometer(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderMagnetometer::operator=(uint64_t a1, const CMMsl::Magnetometer **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderMagnetometer *__hidden);
  uint64_t v6;

  if ((const CMMsl::Magnetometer **)a1 != a2)
  {
    CMMsl::WorkoutRecorderMagnetometer::WorkoutRecorderMagnetometer((CMMsl::WorkoutRecorderMagnetometer *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_2513620D0;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderMagnetometer *a2, CMMsl::WorkoutRecorderMagnetometer *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderMagnetometer::WorkoutRecorderMagnetometer(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_2513620D0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_2513620D0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderMagnetometer::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_2513620D0;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderMagnetometer::formatText(CMMsl::WorkoutRecorderMagnetometer *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderMagnetometer::readFrom(CMMsl::WorkoutRecorderMagnetometer *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_25135F200;
        v19[9] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderMagnetometer::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::Magnetometer *CMMsl::WorkoutRecorderMagnetometer::hash_value(CMMsl::WorkoutRecorderMagnetometer *this)
{
  CMMsl::Magnetometer *result;

  result = (CMMsl::Magnetometer *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::Magnetometer *)CMMsl::Magnetometer::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderMagnetometer::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135F200;
    *(_DWORD *)(v2 + 36) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderOdometer::~WorkoutRecorderOdometer(CMMsl::WorkoutRecorderOdometer *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362108;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362108;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362108;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderOdometer *CMMsl::WorkoutRecorderOdometer::WorkoutRecorderOdometer(CMMsl::WorkoutRecorderOdometer *this, const CMMsl::Odometer ***a2)
{
  CMMsl::OdometerWithAltitude *v4;
  CMMsl::OdometerWithAltitude *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251362108;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::OdometerWithAltitude *)operator new();
    v5 = CMMsl::OdometerWithAltitude::OdometerWithAltitude(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderOdometer::operator=(uint64_t a1, const CMMsl::Odometer ***a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderOdometer *__hidden);
  uint64_t v6;

  if ((const CMMsl::Odometer ***)a1 != a2)
  {
    CMMsl::WorkoutRecorderOdometer::WorkoutRecorderOdometer((CMMsl::WorkoutRecorderOdometer *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362108;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderOdometer *a2, CMMsl::WorkoutRecorderOdometer *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderOdometer::WorkoutRecorderOdometer(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362108;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362108;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderOdometer::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362108;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderOdometer::formatText(CMMsl::WorkoutRecorderOdometer *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderOdometer::readFrom(CMMsl::WorkoutRecorderOdometer *this, PB::Reader *a2)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = operator new();
        *(_QWORD *)v19 = &off_25135F7B0;
        *(_QWORD *)(v19 + 72) = 0;
        *(_DWORD *)(v19 + 80) = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = *((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderOdometer::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::OdometerWithAltitude *CMMsl::WorkoutRecorderOdometer::hash_value(CMMsl::WorkoutRecorderOdometer *this)
{
  CMMsl::OdometerWithAltitude *result;

  result = (CMMsl::OdometerWithAltitude *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::OdometerWithAltitude *)CMMsl::OdometerWithAltitude::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderOdometer::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135F7B0;
    *(_QWORD *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 80) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderPressure::~WorkoutRecorderPressure(CMMsl::WorkoutRecorderPressure *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362140;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362140;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362140;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderPressure *CMMsl::WorkoutRecorderPressure::WorkoutRecorderPressure(CMMsl::WorkoutRecorderPressure *this, const CMMsl::Pressure **a2)
{
  CMMsl::Pressure *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_251362140;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::Pressure *)operator new();
    v5 = CMMsl::Pressure::Pressure(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    if (v6)
      (*(void (**)(uint64_t, float))(*(_QWORD *)v6 + 8))(v6, v5);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderPressure::operator=(uint64_t a1, const CMMsl::Pressure **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderPressure *__hidden);
  uint64_t v6;

  if ((const CMMsl::Pressure **)a1 != a2)
  {
    CMMsl::WorkoutRecorderPressure::WorkoutRecorderPressure((CMMsl::WorkoutRecorderPressure *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362140;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderPressure *a2, CMMsl::WorkoutRecorderPressure *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderPressure::WorkoutRecorderPressure(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362140;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362140;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderPressure::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362140;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderPressure::formatText(CMMsl::WorkoutRecorderPressure *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderPressure::readFrom(CMMsl::WorkoutRecorderPressure *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_251360380;
        v19[6] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderPressure::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::Pressure *CMMsl::WorkoutRecorderPressure::hash_value(CMMsl::WorkoutRecorderPressure *this)
{
  CMMsl::Pressure *result;

  result = (CMMsl::Pressure *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::Pressure *)CMMsl::Pressure::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderPressure::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251360380;
    *(_DWORD *)(v2 + 24) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderRotationRate::~WorkoutRecorderRotationRate(CMMsl::WorkoutRecorderRotationRate *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362178;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362178;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362178;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderRotationRate *CMMsl::WorkoutRecorderRotationRate::WorkoutRecorderRotationRate(CMMsl::WorkoutRecorderRotationRate *this, const CMMsl::RotationRate **a2)
{
  CMMsl::RotationRate *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_251362178;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::RotationRate *)operator new();
    v5 = CMMsl::RotationRate::RotationRate(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    if (v6)
      (*(void (**)(uint64_t, float))(*(_QWORD *)v6 + 8))(v6, v5);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderRotationRate::operator=(uint64_t a1, const CMMsl::RotationRate **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderRotationRate *__hidden);
  uint64_t v6;

  if ((const CMMsl::RotationRate **)a1 != a2)
  {
    CMMsl::WorkoutRecorderRotationRate::WorkoutRecorderRotationRate((CMMsl::WorkoutRecorderRotationRate *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362178;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderRotationRate *a2, CMMsl::WorkoutRecorderRotationRate *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderRotationRate::WorkoutRecorderRotationRate(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362178;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362178;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderRotationRate::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362178;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderRotationRate::formatText(CMMsl::WorkoutRecorderRotationRate *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderRotationRate::readFrom(CMMsl::WorkoutRecorderRotationRate *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_251360818;
        v19[7] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderRotationRate::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::RotationRate *CMMsl::WorkoutRecorderRotationRate::hash_value(CMMsl::WorkoutRecorderRotationRate *this)
{
  CMMsl::RotationRate *result;

  result = (CMMsl::RotationRate *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::RotationRate *)CMMsl::RotationRate::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderRotationRate::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251360818;
    *(_DWORD *)(v2 + 28) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderWatchOnWristStatus::~WorkoutRecorderWatchOnWristStatus(CMMsl::WorkoutRecorderWatchOnWristStatus *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513621B0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513621B0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513621B0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderWatchOnWristStatus *CMMsl::WorkoutRecorderWatchOnWristStatus::WorkoutRecorderWatchOnWristStatus(CMMsl::WorkoutRecorderWatchOnWristStatus *this, const CMMsl::WatchOnWristState **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_2513621B0;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::WatchOnWristState::WatchOnWristState(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderWatchOnWristStatus::operator=(uint64_t a1, const CMMsl::WatchOnWristState **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderWatchOnWristStatus *__hidden);
  uint64_t v6;

  if ((const CMMsl::WatchOnWristState **)a1 != a2)
  {
    CMMsl::WorkoutRecorderWatchOnWristStatus::WorkoutRecorderWatchOnWristStatus((CMMsl::WorkoutRecorderWatchOnWristStatus *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_2513621B0;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderWatchOnWristStatus *a2, CMMsl::WorkoutRecorderWatchOnWristStatus *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderWatchOnWristStatus::WorkoutRecorderWatchOnWristStatus(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_2513621B0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_2513621B0;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWatchOnWristStatus::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_2513621B0;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWatchOnWristStatus::formatText(CMMsl::WorkoutRecorderWatchOnWristStatus *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderWatchOnWristStatus::readFrom(CMMsl::WorkoutRecorderWatchOnWristStatus *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_251361CE0;
        v19[10] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderWatchOnWristStatus::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::WatchOnWristState *CMMsl::WorkoutRecorderWatchOnWristStatus::hash_value(CMMsl::WorkoutRecorderWatchOnWristStatus *this)
{
  CMMsl::WatchOnWristState *result;

  result = (CMMsl::WatchOnWristState *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::WatchOnWristState *)CMMsl::WatchOnWristState::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderWatchOnWristStatus::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361CE0;
    *(_DWORD *)(v2 + 40) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderWatchOrientationSettings::~WorkoutRecorderWatchOrientationSettings(CMMsl::WorkoutRecorderWatchOrientationSettings *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513621E8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513621E8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_2513621E8;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderWatchOrientationSettings *CMMsl::WorkoutRecorderWatchOrientationSettings::WorkoutRecorderWatchOrientationSettings(CMMsl::WorkoutRecorderWatchOrientationSettings *this, const CMMsl::WorkoutRecorderWatchOrientationSettings *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  int v9;
  uint64_t v10;

  *(_QWORD *)this = &off_2513621E8;
  *((_QWORD *)this + 1) = 0;
  if (!*((_QWORD *)a2 + 1))
    return this;
  v4 = operator new();
  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)v4 = &off_251361D18;
  *(_DWORD *)(v4 + 16) = 0;
  v6 = *(_BYTE *)(v5 + 16);
  if ((v6 & 2) != 0)
  {
    v8 = *(_DWORD *)(v5 + 12);
    *(_BYTE *)(v4 + 16) = 2;
    *(_DWORD *)(v4 + 12) = v8;
    v7 = 3;
    if ((v6 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = 1;
  if ((*(_BYTE *)(v5 + 16) & 1) != 0)
  {
LABEL_6:
    v9 = *(_DWORD *)(v5 + 8);
    *(_BYTE *)(v4 + 16) = v7;
    *(_DWORD *)(v4 + 8) = v9;
  }
LABEL_7:
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v4;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  return this;
}

const CMMsl::WorkoutRecorderWatchOrientationSettings *CMMsl::WorkoutRecorderWatchOrientationSettings::operator=(const CMMsl::WorkoutRecorderWatchOrientationSettings *a1, const CMMsl::WorkoutRecorderWatchOrientationSettings *a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderWatchOrientationSettings *__hidden);
  uint64_t v6;

  if (a1 != a2)
  {
    CMMsl::WorkoutRecorderWatchOrientationSettings::WorkoutRecorderWatchOrientationSettings((CMMsl::WorkoutRecorderWatchOrientationSettings *)&v5, a2);
    v3 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v6;
    v5 = &off_2513621E8;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderWatchOrientationSettings *a2, CMMsl::WorkoutRecorderWatchOrientationSettings *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderWatchOrientationSettings::WorkoutRecorderWatchOrientationSettings(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_2513621E8;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_2513621E8;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWatchOrientationSettings::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_2513621E8;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWatchOrientationSettings::formatText(CMMsl::WorkoutRecorderWatchOrientationSettings *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderWatchOrientationSettings::readFrom(CMMsl::WorkoutRecorderWatchOrientationSettings *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_251361D18;
        v19[4] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderWatchOrientationSettings::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

uint64_t CMMsl::WorkoutRecorderWatchOrientationSettings::hash_value(CMMsl::WorkoutRecorderWatchOrientationSettings *this)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *((_QWORD *)this + 1);
  if (!v1)
    return 0;
  v2 = *(_BYTE *)(v1 + 16);
  v5 = v1 + 8;
  v3 = *(unsigned int *)(v1 + 8);
  v4 = *(unsigned int *)(v5 + 4);
  if ((v2 & 2) == 0)
    v4 = 0;
  if ((v2 & 1) == 0)
    v3 = 0;
  return v3 ^ v4;
}

_QWORD *CMMsl::WorkoutRecorderWatchOrientationSettings::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361D18;
    *(_DWORD *)(v2 + 16) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderWifiScanResults::~WorkoutRecorderWifiScanResults(CMMsl::WorkoutRecorderWifiScanResults *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362220;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362220;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362220;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderWifiScanResults *CMMsl::WorkoutRecorderWifiScanResults::WorkoutRecorderWifiScanResults(CMMsl::WorkoutRecorderWifiScanResults *this, const CMMsl::WifiScanResults **a2)
{
  CMMsl::WifiScanResults *v4;
  CMMsl::WifiScanResults *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251362220;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::WifiScanResults *)operator new();
    v5 = CMMsl::WifiScanResults::WifiScanResults(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderWifiScanResults::operator=(uint64_t a1, const CMMsl::WifiScanResults **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderWifiScanResults *__hidden);
  uint64_t v6;

  if ((const CMMsl::WifiScanResults **)a1 != a2)
  {
    CMMsl::WorkoutRecorderWifiScanResults::WorkoutRecorderWifiScanResults((CMMsl::WorkoutRecorderWifiScanResults *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362220;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderWifiScanResults *a2, CMMsl::WorkoutRecorderWifiScanResults *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderWifiScanResults::WorkoutRecorderWifiScanResults(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362220;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362220;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWifiScanResults::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362220;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWifiScanResults::formatText(CMMsl::WorkoutRecorderWifiScanResults *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderWifiScanResults::readFrom(CMMsl::WorkoutRecorderWifiScanResults *this, PB::Reader *a2)
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_QWORD *)operator new();
        *v19 = &off_251361D88;
        v19[1] = 0;
        v19[2] = 0;
        v19[3] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_QWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderWifiScanResults::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

uint64_t CMMsl::WorkoutRecorderWifiScanResults::hash_value(CMMsl::WorkoutRecorderWifiScanResults *this)
{
  return sub_2428121D4(*((_QWORD *)this + 1));
}

_QWORD *CMMsl::WorkoutRecorderWifiScanResults::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[1])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_251361D88;
    v2[1] = 0;
    v2[2] = 0;
    v2[3] = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderWorkoutEvent::~WorkoutRecorderWorkoutEvent(CMMsl::WorkoutRecorderWorkoutEvent *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362258;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362258;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362258;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderWorkoutEvent *CMMsl::WorkoutRecorderWorkoutEvent::WorkoutRecorderWorkoutEvent(CMMsl::WorkoutRecorderWorkoutEvent *this, const CMMsl::WorkoutEvent **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251362258;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = operator new();
    v5 = CMMsl::WorkoutEvent::WorkoutEvent(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderWorkoutEvent::operator=(uint64_t a1, const CMMsl::WorkoutEvent **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderWorkoutEvent *__hidden);
  uint64_t v6;

  if ((const CMMsl::WorkoutEvent **)a1 != a2)
  {
    CMMsl::WorkoutRecorderWorkoutEvent::WorkoutRecorderWorkoutEvent((CMMsl::WorkoutRecorderWorkoutEvent *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362258;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderWorkoutEvent *a2, CMMsl::WorkoutRecorderWorkoutEvent *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderWorkoutEvent::WorkoutRecorderWorkoutEvent(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362258;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362258;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWorkoutEvent::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362258;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWorkoutEvent::formatText(CMMsl::WorkoutRecorderWorkoutEvent *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderWorkoutEvent::readFrom(CMMsl::WorkoutRecorderWorkoutEvent *this, PB::Reader *a2)
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
  _DWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_251361DF8;
        v19[16] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderWorkoutEvent::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::WorkoutEvent *CMMsl::WorkoutRecorderWorkoutEvent::hash_value(CMMsl::WorkoutRecorderWorkoutEvent *this)
{
  CMMsl::WorkoutEvent *result;

  result = (CMMsl::WorkoutEvent *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::WorkoutEvent *)CMMsl::WorkoutEvent::hash_value(result);
  return result;
}

_QWORD *CMMsl::WorkoutRecorderWorkoutEvent::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_251361DF8;
    *(_DWORD *)(v2 + 64) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutRecorderWorkoutSessionPriors::~WorkoutRecorderWorkoutSessionPriors(CMMsl::WorkoutRecorderWorkoutSessionPriors *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362290;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362290;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362290;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutRecorderWorkoutSessionPriors *CMMsl::WorkoutRecorderWorkoutSessionPriors::WorkoutRecorderWorkoutSessionPriors(CMMsl::WorkoutRecorderWorkoutSessionPriors *this, const CMMsl::WorkoutSessionPriors **a2)
{
  CMMsl::WorkoutSessionPriors *v4;
  CMMsl::WorkoutSessionPriors *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251362290;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::WorkoutSessionPriors *)operator new();
    v5 = CMMsl::WorkoutSessionPriors::WorkoutSessionPriors(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::WorkoutRecorderWorkoutSessionPriors::operator=(uint64_t a1, const CMMsl::WorkoutSessionPriors **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::WorkoutRecorderWorkoutSessionPriors *__hidden);
  uint64_t v6;

  if ((const CMMsl::WorkoutSessionPriors **)a1 != a2)
  {
    CMMsl::WorkoutRecorderWorkoutSessionPriors::WorkoutRecorderWorkoutSessionPriors((CMMsl::WorkoutRecorderWorkoutSessionPriors *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362290;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::WorkoutRecorderWorkoutSessionPriors *a2, CMMsl::WorkoutRecorderWorkoutSessionPriors *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::WorkoutRecorderWorkoutSessionPriors::WorkoutRecorderWorkoutSessionPriors(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362290;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362290;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWorkoutSessionPriors::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362290;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::WorkoutRecorderWorkoutSessionPriors::formatText(CMMsl::WorkoutRecorderWorkoutSessionPriors *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "super");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutRecorderWorkoutSessionPriors::readFrom(CMMsl::WorkoutRecorderWorkoutSessionPriors *this, PB::Reader *a2)
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = (_QWORD *)operator new();
        *v19 = &off_2513622C8;
        v19[1] = 0;
        v19[2] = 0;
        v19[3] = 0;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_QWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::WorkoutRecorderWorkoutSessionPriors::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

uint64_t CMMsl::WorkoutRecorderWorkoutSessionPriors::hash_value(CMMsl::WorkoutRecorderWorkoutSessionPriors *this)
{
  return sub_242812228(*((_QWORD *)this + 1));
}

_QWORD *CMMsl::WorkoutRecorderWorkoutSessionPriors::makeSuper(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[1])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_2513622C8;
    v2[1] = 0;
    v2[2] = 0;
    v2[3] = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void CMMsl::WorkoutSessionPriors::~WorkoutSessionPriors(CMMsl::WorkoutSessionPriors *this)
{
  void **v2;

  *(_QWORD *)this = &off_2513622C8;
  v2 = (void **)((char *)this + 8);
  sub_242910B70(&v2);
  PB::Base::~Base(this);
}

{
  void **v2;

  *(_QWORD *)this = &off_2513622C8;
  v2 = (void **)((char *)this + 8);
  sub_242910B70(&v2);
  PB::Base::~Base(this);
}

{
  void **v2;

  *(_QWORD *)this = &off_2513622C8;
  v2 = (void **)((char *)this + 8);
  sub_242910B70(&v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::WorkoutSessionPriors *CMMsl::WorkoutSessionPriors::WorkoutSessionPriors(CMMsl::WorkoutSessionPriors *this, const CMMsl::WorkoutSessionPriors *a2)
{
  int64x2_t *v3;
  const CMMsl::WorkoutPriorInformation **v4;
  const CMMsl::WorkoutPriorInformation **i;
  const CMMsl::WorkoutPriorInformation *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int64x2_t v21;
  unint64_t v22;
  uint64_t v24;
  int64x2_t v25;
  unint64_t v26;
  char *v27;

  *((_QWORD *)this + 1) = 0;
  v3 = (int64x2_t *)((char *)this + 8);
  *(_QWORD *)this = &off_2513622C8;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = (const CMMsl::WorkoutPriorInformation **)*((_QWORD *)a2 + 1);
  for (i = (const CMMsl::WorkoutPriorInformation **)*((_QWORD *)a2 + 2); v4 != i; ++v4)
  {
    v6 = *v4;
    v7 = operator new();
    CMMsl::WorkoutPriorInformation::WorkoutPriorInformation(v7, v6);
    v9 = (uint64_t *)*((_QWORD *)this + 2);
    v8 = *((_QWORD *)this + 3);
    if ((unint64_t)v9 >= v8)
    {
      v11 = ((uint64_t)v9 - v3->i64[0]) >> 3;
      if ((unint64_t)(v11 + 1) >> 61)
        sub_242729A44();
      v12 = v8 - v3->i64[0];
      v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1))
        v13 = v11 + 1;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
        v14 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      v27 = (char *)this + 24;
      if (v14)
        v14 = (unint64_t)sub_2429112FC(v14);
      else
        v15 = 0;
      v16 = (uint64_t *)(v14 + 8 * v11);
      v17 = v14 + 8 * v15;
      v26 = v17;
      *v16 = v7;
      v10 = v16 + 1;
      v25.i64[1] = (uint64_t)(v16 + 1);
      v19 = (_QWORD *)*((_QWORD *)this + 1);
      v18 = (_QWORD *)*((_QWORD *)this + 2);
      if (v18 == v19)
      {
        v21 = vdupq_n_s64((unint64_t)v18);
      }
      else
      {
        do
        {
          v20 = *--v18;
          *v18 = 0;
          *--v16 = v20;
        }
        while (v18 != v19);
        v21 = *v3;
        v10 = (_QWORD *)v25.i64[1];
        v17 = v26;
      }
      *((_QWORD *)this + 1) = v16;
      *((_QWORD *)this + 2) = v10;
      v25 = v21;
      v22 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v17;
      v26 = v22;
      v24 = v21.i64[0];
      sub_2429114EC((uint64_t)&v24);
    }
    else
    {
      *v9 = v7;
      v10 = v9 + 1;
    }
    *((_QWORD *)this + 2) = v10;
  }
  return this;
}

void sub_24290FF08(void *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  sub_2427297D4(a1);
}

uint64_t CMMsl::WorkoutSessionPriors::operator=(uint64_t a1, const CMMsl::WorkoutSessionPriors *a2)
{
  __int128 v3;
  uint64_t v4;
  void (**v6)(CMMsl::WorkoutSessionPriors *__hidden);
  __int128 v7;
  uint64_t v8;
  void **v9;

  if ((const CMMsl::WorkoutSessionPriors *)a1 != a2)
  {
    CMMsl::WorkoutSessionPriors::WorkoutSessionPriors((CMMsl::WorkoutSessionPriors *)&v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v3;
    v4 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v8;
    v8 = v4;
    v6 = &off_2513622C8;
    v9 = (void **)&v7;
    sub_242910B70(&v9);
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

_QWORD *CMMsl::swap(_QWORD *this, CMMsl::WorkoutSessionPriors *a2, CMMsl::WorkoutSessionPriors *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  v4 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  return this;
}

_QWORD *CMMsl::WorkoutSessionPriors::WorkoutSessionPriors(_QWORD *a1, uint64_t a2)
{
  _OWORD *v4;

  *a1 = &off_2513622C8;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  v4 = a1 + 1;
  sub_242910BEC(a1 + 1);
  *v4 = *(_OWORD *)(a2 + 8);
  a1[3] = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

{
  _OWORD *v4;

  *a1 = &off_2513622C8;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  v4 = a1 + 1;
  sub_242910BEC(a1 + 1);
  *v4 = *(_OWORD *)(a2 + 8);
  a1[3] = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t CMMsl::WorkoutSessionPriors::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void (**v9)(CMMsl::WorkoutSessionPriors *__hidden);
  __int128 v10;
  uint64_t v11;
  void **v12;

  if (a1 != a2)
  {
    v9 = &off_2513622C8;
    v10 = 0uLL;
    v11 = 0;
    sub_242910BEC(&v10);
    v4 = *(_QWORD *)(a2 + 24);
    v5 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v5;
    v10 = v6;
    v7 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;
    v11 = v7;
    v12 = (void **)&v10;
    v9 = &off_2513622C8;
    sub_242910B70(&v12);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

uint64_t CMMsl::WorkoutSessionPriors::formatText(CMMsl::WorkoutSessionPriors *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "workoutPriors");
  }
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::WorkoutSessionPriors::readFrom(CMMsl::WorkoutSessionPriors *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  int64x2_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64x2_t v41;
  unint64_t v42;
  char *v43;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (char *)this + 24;
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_25;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 2)
      {
        v20 = operator new();
        v21 = v20;
        *(_QWORD *)v20 = &off_251361E30;
        *(_DWORD *)(v20 + 32) = 0;
        v23 = (uint64_t *)*((_QWORD *)this + 2);
        v22 = *((_QWORD *)this + 3);
        if ((unint64_t)v23 >= v22)
        {
          v26 = *((_QWORD *)this + 1);
          v27 = ((uint64_t)v23 - v26) >> 3;
          if ((unint64_t)(v27 + 1) >> 61)
            sub_242729A44();
          v28 = v22 - v26;
          v29 = v28 >> 2;
          if (v28 >> 2 <= (unint64_t)(v27 + 1))
            v29 = v27 + 1;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
            v30 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v30 = v29;
          v43 = v8;
          if (v30)
            v30 = (unint64_t)sub_2429112FC(v30);
          else
            v31 = 0;
          v32 = (uint64_t *)(v30 + 8 * v27);
          v33 = v30 + 8 * v31;
          v42 = v33;
          *v32 = v21;
          v24 = v32 + 1;
          v41.i64[1] = (uint64_t)(v32 + 1);
          v35 = (_QWORD *)*((_QWORD *)this + 1);
          v34 = (_QWORD *)*((_QWORD *)this + 2);
          if (v34 == v35)
          {
            v37 = vdupq_n_s64((unint64_t)v34);
          }
          else
          {
            do
            {
              v36 = *--v34;
              *v34 = 0;
              *--v32 = v36;
            }
            while (v34 != v35);
            v37 = *(int64x2_t *)((char *)this + 8);
            v24 = (_QWORD *)v41.i64[1];
            v33 = v42;
          }
          *((_QWORD *)this + 1) = v32;
          *((_QWORD *)this + 2) = v24;
          v41 = v37;
          v38 = *((_QWORD *)this + 3);
          *((_QWORD *)this + 3) = v33;
          v42 = v38;
          v40 = v37.i64[0];
          sub_2429114EC((uint64_t)&v40);
        }
        else
        {
          *v23 = v20;
          v24 = v23 + 1;
        }
        *((_QWORD *)this + 2) = v24;
        v39 = *(v24 - 1);
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v39 + 16))(v39, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_25:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_25;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_24291045C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t CMMsl::WorkoutSessionPriors::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base **v2;
  const PB::Base **i;
  const PB::Base *v5;

  v2 = *(const PB::Base ***)(this + 8);
  for (i = *(const PB::Base ***)(this + 16); v2 != i; this = PB::Writer::writeSubmessage(a2, v5))
    v5 = *v2++;
  return this;
}

BOOL sub_2429104C4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;
  BOOL v9;

  if (a2 - a1 != a4 - (_QWORD)a3)
    return 0;
  if (a1 == a2)
    return 1;
  v5 = a3;
  v6 = a1 + 8;
  do
  {
    v7 = *v5++;
    result = CMMsl::WorkoutPriorInformation::operator==(*(_QWORD *)(v6 - 8), v7);
    v9 = !result || v6 == a2;
    v6 += 8;
  }
  while (!v9);
  return result;
}

uint64_t CMMsl::WorkoutSessionPriors::hash_value(CMMsl::WorkoutSessionPriors *this)
{
  CMMsl::WorkoutPriorInformation **v1;
  CMMsl::WorkoutPriorInformation **v2;
  uint64_t v3;
  CMMsl::WorkoutPriorInformation *v4;

  v1 = (CMMsl::WorkoutPriorInformation **)*((_QWORD *)this + 1);
  v2 = (CMMsl::WorkoutPriorInformation **)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 0;
  v3 = 0;
  do
  {
    v4 = *v1++;
    v3 ^= CMMsl::WorkoutPriorInformation::hash_value(v4);
  }
  while (v1 != v2);
  return v3;
}

void CMMsl::ZeroVelocityCorrection::~ZeroVelocityCorrection(CMMsl::ZeroVelocityCorrection *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362300;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362300;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_251362300;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
  JUMPOUT(0x2494E8384);
}

CMMsl::ZeroVelocityCorrection *CMMsl::ZeroVelocityCorrection::ZeroVelocityCorrection(CMMsl::ZeroVelocityCorrection *this, const CMMsl::DeviceMotionCorrection **a2)
{
  CMMsl::DeviceMotionCorrection *v4;
  CMMsl::DeviceMotionCorrection *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_251362300;
  *((_QWORD *)this + 1) = 0;
  if (a2[1])
  {
    v4 = (CMMsl::DeviceMotionCorrection *)operator new();
    v5 = CMMsl::DeviceMotionCorrection::DeviceMotionCorrection(v4, a2[1]);
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return this;
}

uint64_t CMMsl::ZeroVelocityCorrection::operator=(uint64_t a1, const CMMsl::DeviceMotionCorrection **a2)
{
  uint64_t v3;
  void (**v5)(CMMsl::ZeroVelocityCorrection *__hidden);
  uint64_t v6;

  if ((const CMMsl::DeviceMotionCorrection **)a1 != a2)
  {
    CMMsl::ZeroVelocityCorrection::ZeroVelocityCorrection((CMMsl::ZeroVelocityCorrection *)&v5, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v5 = &off_251362300;
    v6 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    PB::Base::~Base((PB::Base *)&v5);
  }
  return a1;
}

uint64_t CMMsl::swap(uint64_t this, CMMsl::ZeroVelocityCorrection *a2, CMMsl::ZeroVelocityCorrection *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  return this;
}

_QWORD *CMMsl::ZeroVelocityCorrection::ZeroVelocityCorrection(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362300;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &off_251362300;
  a1[1] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = a1[1];
  a1[1] = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t CMMsl::ZeroVelocityCorrection::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v6[0] = &off_251362300;
    v6[1] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t CMMsl::ZeroVelocityCorrection::formatText(CMMsl::ZeroVelocityCorrection *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "correction");
  return PB::TextFormatter::endObject(a2);
}

uint64_t CMMsl::ZeroVelocityCorrection::readFrom(CMMsl::ZeroVelocityCorrection *this, PB::Reader *a2)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        v19 = operator new();
        *(_QWORD *)v19 = &off_25135D130;
        *(_DWORD *)(v19 + 160) = 0;
        *(_OWORD *)(v19 + 8) = 0u;
        *(_OWORD *)(v19 + 24) = 0u;
        *(_OWORD *)(v19 + 40) = 0u;
        *(_OWORD *)(v19 + 56) = 0u;
        *(_OWORD *)(v19 + 72) = 0u;
        *(_OWORD *)(v19 + 88) = 0u;
        *(_OWORD *)(v19 + 104) = 0u;
        *(_OWORD *)(v19 + 120) = 0u;
        *(_OWORD *)(v19 + 136) = 0u;
        v20 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = *((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
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
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t CMMsl::ZeroVelocityCorrection::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base *v2;

  v2 = *(const PB::Base **)(this + 8);
  if (v2)
    return PB::Writer::writeSubmessage(a2, v2);
  return this;
}

CMMsl::DeviceMotionCorrection *CMMsl::ZeroVelocityCorrection::hash_value(CMMsl::ZeroVelocityCorrection *this)
{
  CMMsl::DeviceMotionCorrection *result;

  result = (CMMsl::DeviceMotionCorrection *)*((_QWORD *)this + 1);
  if (result)
    return (CMMsl::DeviceMotionCorrection *)CMMsl::DeviceMotionCorrection::hash_value(result);
  return result;
}

_QWORD *CMMsl::ZeroVelocityCorrection::makeCorrection(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_25135D130;
    *(_DWORD *)(v2 + 160) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sub_242910B70(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_242910BEC(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = (_QWORD *)a1[1];
    v4 = (_QWORD *)*a1;
    if (v3 != v1)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v1);
      v4 = (_QWORD *)*a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_242910C5C(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  JUMPOUT(0x2494E8384);
}

void ***sub_242910C9C(void ***result, void **a2)
{
  void **v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    free(*v2);
    JUMPOUT(0x2494E8384);
  }
  return result;
}

void *sub_242910CE8(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_242729920();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

unint64_t sub_242910D74(uint64_t a1)
{
  int v1;
  unint64_t v2;
  BOOL v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
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
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
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
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;

  v1 = *(char *)(a1 + 23);
  v2 = *(_QWORD *)(a1 + 8);
  v3 = v1 < 0;
  if (v1 >= 0)
    v4 = (uint64_t *)a1;
  else
    v4 = *(uint64_t **)a1;
  if (!v3)
    v2 = *(unsigned __int8 *)(a1 + 23);
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      v34 = 0x9DDFEA08EB382D69;
      v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      v50 = v46 + v48;
      v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      v53 = v44 + v46 + v47 + v2;
      v54 = v53 + v43;
      v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v47 + v2 + v43 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      v57 = v45 + v48 + v56;
      v58 = __ROR8__(v57, 44);
      v59 = v57 + v49;
      v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      v62 = *v4;
      v61 = v4 + 4;
      v63 = v62 - 0x4B6D499041670D8DLL * v43;
      v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v65 = *(v61 - 3);
        v66 = v63 + v54 + v50 + v65;
        v67 = v61[2];
        v68 = v61[3];
        v69 = v61[1];
        v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        v70 = v52 + v59;
        v71 = *(v61 - 2);
        v72 = *(v61 - 1);
        v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        v74 = v73 + v59 + v72;
        v75 = v73 + v65 + v71;
        v54 = v75 + v72;
        v76 = __ROR8__(v75, 44) + v73;
        v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        v55 = v76 + __ROR8__(v74 + v77, 21);
        v78 = v63 + v60 + *v61;
        v59 = v69 + v67 + v78 + v68;
        v60 = __ROR8__(v69 + v67 + v78, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        v52 = v77;
        v64 += 64;
      }
      while (v64);
      v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      v9 = (char *)v4 + v2;
      v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      v12 = v4[1];
      v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      v16 = v4 + 2;
      v14 = v4[2];
      v15 = v16[1];
      v17 = __ROR8__(v13 + v15, 52);
      v18 = __ROR8__(v13, 37);
      v19 = v13 + v12;
      v20 = __ROR8__(v19, 7);
      v21 = v19 + v14;
      v22 = v20 + v18;
      v23 = *((_QWORD *)v9 - 4) + v14;
      v24 = v11 + v15;
      v25 = __ROR8__(v24 + v23, 52);
      v26 = v22 + v17;
      v27 = __ROR8__(v23, 37);
      v28 = *((_QWORD *)v9 - 3) + v23;
      v29 = __ROR8__(v28, 7);
      v30 = v26 + __ROR8__(v21, 31);
      v31 = v28 + v10;
      v32 = v31 + v24;
      v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      v34 = 0x9AE16A3B2F90404FLL;
      v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      v36 = v4[1];
      v37 = 0xB492B66FBE98F273 * *v4;
      v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      v41 = 0x9DDFEA08EB382D69 * ((v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)) ^ v40);
      v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      v5 = *v4;
      v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      v82 = *(_DWORD *)v4;
      v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

_QWORD *sub_2429111C4(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  size_t v13;
  void **v14;
  _BYTE *v15;
  unint64_t v16;
  char *v17;
  void *v18;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 3)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      goto LABEL_23;
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 61)
LABEL_23:
      sub_242729A44();
    result = sub_2429112FC(v11);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = &result[v12];
    v13 = a3 - v6;
    if (v13)
      result = memmove(result, v6, v13);
    v14 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  v14 = (void **)(result + 1);
  v15 = (_BYTE *)result[1];
  v16 = (v15 - v9) >> 3;
  if (v16 >= a4)
  {
    v13 = a3 - __src;
    if (a3 == __src)
      goto LABEL_22;
    v18 = (void *)*result;
LABEL_21:
    result = memmove(v18, __src, v13);
    goto LABEL_22;
  }
  v17 = &__src[8 * v16];
  if (v15 != v9)
  {
    result = memmove((void *)*result, __src, v15 - v9);
    v9 = (char *)*v14;
  }
  v13 = a3 - v17;
  if (v13)
  {
    v18 = v9;
    __src = v17;
    goto LABEL_21;
  }
LABEL_22:
  *v14 = &v9[v13];
  return result;
}

void *sub_2429112FC(unint64_t a1)
{
  if (a1 >> 61)
    sub_2427299A8();
  return operator new(8 * a1);
}

__n128 sub_242911330(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

_QWORD *sub_242911380(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  size_t v13;
  void **v14;
  _BYTE *v15;
  unint64_t v16;
  char *v17;
  void *v18;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 2)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      goto LABEL_23;
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 62)
LABEL_23:
      sub_242729A44();
    result = sub_2429114B8(v11);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = (char *)result + 4 * v12;
    v13 = a3 - v6;
    if (v13)
      result = memmove(result, v6, v13);
    v14 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  v14 = (void **)(result + 1);
  v15 = (_BYTE *)result[1];
  v16 = (v15 - v9) >> 2;
  if (v16 >= a4)
  {
    v13 = a3 - __src;
    if (a3 == __src)
      goto LABEL_22;
    v18 = (void *)*result;
LABEL_21:
    result = memmove(v18, __src, v13);
    goto LABEL_22;
  }
  v17 = &__src[4 * v16];
  if (v15 != v9)
  {
    result = memmove((void *)*result, __src, v15 - v9);
    v9 = (char *)*v14;
  }
  v13 = a3 - v17;
  if (v13)
  {
    v18 = v9;
    __src = v17;
    goto LABEL_21;
  }
LABEL_22:
  *v14 = &v9[v13];
  return result;
}

void *sub_2429114B8(unint64_t a1)
{
  if (a1 >> 62)
    sub_2427299A8();
  return operator new(4 * a1);
}

uint64_t sub_2429114EC(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v4 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t CMMsl::ReaderIterator::operator++(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  CMMsl::Item *v4;
  CMMsl::Reader *v5;
  int ItemInternal;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;

  v2 = (std::__shared_weak_count *)operator new(0xE40uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&off_251364F90;
  v2[1].__vftable = (std::__shared_weak_count_vtbl *)&off_25135E518;
  v4 = (CMMsl::Item *)&v2[1];
  bzero(&v2[1].__shared_owners_, 0x260uLL);
  bzero(&v2[27], 0xBB4uLL);
  v5 = *(CMMsl::Reader **)a1;
  do
    ItemInternal = CMMsl::Reader::nextItemInternal(v5, v4);
  while (ItemInternal == 1);
  if (ItemInternal)
  {
    *(_QWORD *)a1 = 0;
  }
  else
  {
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    v8 = *(std::__shared_weak_count **)(a1 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v2;
    if (v8)
    {
      v9 = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  if (v2)
  {
    v11 = (unint64_t *)&v2->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void sub_242911684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_242911D70((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL CMMsl::Reader::nextItem(CMMsl::Reader *this, CMMsl::Item *a2)
{
  int ItemInternal;

  do
    ItemInternal = CMMsl::Reader::nextItemInternal(this, a2);
  while (ItemInternal == 1);
  return ItemInternal == 0;
}

uint64_t CMMsl::ReaderIterator::ReaderIterator(CMMsl::ReaderIterator *this, CMMsl::Reader *a2)
{
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  return CMMsl::ReaderIterator::operator++((uint64_t)this);
}

void sub_242911704(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_242911D70(v1);
  _Unwind_Resume(a1);
}

CMMsl::Reader *CMMsl::Reader::Reader(CMMsl::Reader *this)
{
  *(_QWORD *)this = 0;
  *((_DWORD *)this + 2) = -1;
  *((_OWORD *)this + 10) = 0u;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_BYTE *)this + 40) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_OWORD *)this + 11) = 0u;
  *((_QWORD *)this + 24) = 0;
  inflateInit_((z_streamp)((char *)this + 48), "1.2.12", 112);
  return this;
}

void sub_242911788(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;

  v3 = v2;
  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 168) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void CMMsl::Reader::~Reader(CMMsl::Reader *this)
{
  void *v2;

  inflateEnd((z_streamp)((char *)this + 48));
  v2 = (void *)*((_QWORD *)this + 20);
  if (v2)
  {
    *((_QWORD *)this + 21) = v2;
    operator delete(v2);
  }
}

uint64_t CMMsl::Reader::open(CMMsl::Reader *this, const char *a2)
{
  int v4;
  size_t v5;
  size_t v6;
  void *v7;

  CMMsl::Reader::close(this);
  v4 = open(a2, 0x1000000);
  *((_DWORD *)this + 2) = v4;
  if ((v4 & 0x80000000) == 0)
  {
    v5 = lseek(v4, 0, 2);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      v7 = mmap(0, v5, 1, 1, *((_DWORD *)this + 2), 0);
      if (v7 != (void *)-1)
      {
        *((_QWORD *)this + 2) = v6;
        *((_QWORD *)this + 3) = 0;
        *((_QWORD *)this + 4) = v7;
        *((_BYTE *)this + 40) = 0;
        return CMMsl::Reader::openInternal(this);
      }
    }
    CMMsl::Reader::close(this);
  }
  return 0;
}

uint64_t CMMsl::Reader::close(CMMsl::Reader *this)
{
  void *v2;
  uint64_t result;

  *((_QWORD *)this + 21) = *((_QWORD *)this + 20);
  *((_QWORD *)this + 23) = 0;
  *((_QWORD *)this + 24) = 0;
  if (!*(_QWORD *)this)
  {
    v2 = (void *)*((_QWORD *)this + 4);
    if (v2)
      munmap(v2, *((_QWORD *)this + 2));
  }
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_BYTE *)this + 40) = 0;
  *((_QWORD *)this + 4) = 0;
  result = *((unsigned int *)this + 2);
  if ((result & 0x80000000) == 0)
    result = close(result);
  *((_DWORD *)this + 2) = -1;
  *(_QWORD *)this = 0;
  return result;
}

uint64_t CMMsl::Reader::openInternal(CMMsl::Reader *this)
{
  _QWORD *v1;

  v1 = (_QWORD *)*((_QWORD *)this + 4);
  if (v1)
  {
    if (*((_QWORD *)this + 2) > 7uLL && *v1 == 0xE020C5BE006C536DLL)
    {
      *((_QWORD *)this + 3) += 8;
      return 1;
    }
    CMMsl::Reader::close(this);
  }
  return 0;
}

uint64_t CMMsl::Reader::open(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 16) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 32))(a2);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  *(_BYTE *)(a1 + 40) = 0;
  return CMMsl::Reader::openInternal((CMMsl::Reader *)a1);
}

_QWORD *CMMsl::Reader::closeSens(_QWORD *this)
{
  this[21] = this[20];
  this[23] = 0;
  this[24] = 0;
  return this;
}

BOOL CMMsl::Reader::isOpen(CMMsl::Reader *this)
{
  return *((_QWORD *)this + 4) != 0;
}

uint64_t CMMsl::Reader::nextItemInternal(CMMsl::Reader *this, CMMsl::Item *a2)
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  _DWORD *v7;
  const unsigned __int8 *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  _BYTE v14[32];

  v3 = *((_QWORD *)this + 20);
  if (v3 == *((_QWORD *)this + 21))
    return CMMsl::Reader::nextSens(this);
  v4 = (_QWORD *)((char *)this + 184);
  v5 = *((_QWORD *)this + 23);
  if (v5 >= 4
    && (v7 = (_DWORD *)*((_QWORD *)this + 24),
        v10 = *v7,
        v8 = (const unsigned __int8 *)(v7 + 1),
        v9 = v10,
        v11 = v5 - 4,
        *((_QWORD *)this + 23) = v11,
        *((_QWORD *)this + 24) = v8,
        v11 >= v10))
  {
    PB::Reader::Reader((PB::Reader *)v14, v8);
    (*(void (**)(CMMsl::Item *, _BYTE *))(*(_QWORD *)a2 + 16))(a2, v14);
    v13 = *((_QWORD *)this + 24) + v9;
    *((_QWORD *)this + 23) -= v9;
    *((_QWORD *)this + 24) = v13;
    return v14[24];
  }
  else
  {
    *((_QWORD *)this + 21) = v3;
    result = 1;
    *v4 = 0;
    *((_QWORD *)this + 24) = 0;
  }
  return result;
}

uint64_t CMMsl::Reader::nextSens(CMMsl::Reader *this)
{
  uint64_t v1;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v1 = *((_QWORD *)this + 4);
  if (!v1)
    return 2;
  v3 = *((_QWORD *)this + 2);
  v4 = *((_QWORD *)this + 3);
  if (v4 >= v3 || (v5 = v4 + 16, v3 <= v4 + 16))
  {
LABEL_18:
    CMMsl::Reader::close(this);
    return 2;
  }
  if (*((_BYTE *)this + 40))
  {
    *((_BYTE *)this + 40) = 0;
    if (v4 + 8 < v3)
    {
      result = 1;
      while (*(_QWORD *)(v1 + v4) != 0x5979AAB3D5E07959)
      {
        v7 = v4 + 16;
        v4 += 8;
        *((_QWORD *)this + 3) = v4;
        if (v7 >= v3)
          return result;
      }
    }
    return 1;
  }
  v8 = v1 + v4;
  if (*(_QWORD *)(v1 + v4) != 0x5979AAB3D5E07959)
  {
    *((_QWORD *)this + 3) = v4 + 8;
    goto LABEL_21;
  }
  v11 = v8 + 8;
  v9 = *(_DWORD *)(v8 + 8);
  v10 = *(unsigned int *)(v11 + 4);
  *((_QWORD *)this + 3) = v5;
  if (v9 != 1936614771)
  {
    v13 = v4 + v10 + 23;
    goto LABEL_23;
  }
  if (v10 <= 0xB)
  {
LABEL_21:
    result = 1;
    *((_BYTE *)this + 40) = 1;
    return result;
  }
  v12 = v10;
  if (v5 + v10 >= v3)
  {
    if (v4 + 44 < v3)
    {
      v12 = v3 - (v4 + 16);
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_16:
  if (!CMMsl::Reader::decompressSens(this, (const unsigned __int8 *)(v1 + v5 + 12), v12 - 12))
    goto LABEL_21;
  v13 = v10 + *((_QWORD *)this + 3) + 7;
LABEL_23:
  *((_QWORD *)this + 3) = v13 & 0xFFFFFFFFFFFFFFF8;
  return 1;
}

uint64_t CMMsl::Reader::scanForSync(uint64_t this)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  *(_BYTE *)(this + 40) = 0;
  v1 = *(_QWORD *)(this + 16);
  v2 = *(_QWORD *)(this + 24);
  if (v2 + 8 < v1)
  {
    v3 = *(_QWORD *)(this + 32);
    do
    {
      if (*(_QWORD *)(v3 + v2) == 0x5979AAB3D5E07959)
        break;
      v4 = v2 + 16;
      v2 += 8;
      *(_QWORD *)(this + 24) = v2;
    }
    while (v4 < v1);
  }
  return this;
}

BOOL CMMsl::Reader::decompressSens(CMMsl::Reader *this, const unsigned __int8 *a2, int a3)
{
  int v6;
  char *v7;
  char *v8;
  int v9;
  size_t v10;
  char *v11;
  _BOOL8 v12;
  unint64_t v13;
  BOOL v14;
  char *v15;
  int64_t v16;
  char *v17;
  char *v18;
  char *v20;
  char *v21;
  char *v22;

  v6 = 0x4000;
  v7 = (char *)operator new(0x4000uLL);
  v8 = v7 + 0x4000;
  v20 = v7;
  v22 = v7 + 0x4000;
  bzero(v7, 0x4000uLL);
  v21 = v7 + 0x4000;
  *((_QWORD *)this + 6) = a2;
  *((_DWORD *)this + 14) = a3;
  *((_QWORD *)this + 9) = v7;
  while (1)
  {
    *((_DWORD *)this + 20) = v6;
    v9 = inflate((z_streamp)((char *)this + 48), 2);
    if (v9)
      break;
    v10 = v8 - v7;
    if (v8 - v7 < 1)
    {
      if ((v10 & 0x8000000000000000) != 0)
      {
        v8 = &v7[2 * v10];
        v21 = v8;
      }
    }
    else
    {
      sub_242911E18((unint64_t *)&v20, v10);
      v7 = v20;
      v8 = v21;
    }
    v11 = &v7[*((_QWORD *)this + 11)];
    *((_QWORD *)this + 9) = v11;
    v6 = (_DWORD)v8 - (_DWORD)v11;
  }
  v12 = v9 == 1;
  v13 = *((_QWORD *)this + 11);
  v14 = v13 >= v8 - v7;
  if (v13 <= v8 - v7)
  {
    v15 = &v7[v13];
    if (v14)
      v15 = v8;
  }
  else
  {
    sub_242911E18((unint64_t *)&v20, v13 - (v8 - v7));
    v7 = v20;
    v15 = v21;
  }
  v16 = v15 - v7;
  v20 = (char *)*((_QWORD *)this + 20);
  v17 = v20;
  *((_QWORD *)this + 20) = v7;
  *((_QWORD *)this + 21) = v15;
  v18 = v22;
  *((_QWORD *)this + 23) = v16;
  *((_QWORD *)this + 24) = v7;
  *((_QWORD *)this + 22) = v18;
  inflateReset((z_streamp)((char *)this + 48));
  if (v17)
    operator delete(v17);
  return v12;
}

void sub_242911D50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_242911D70(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void sub_242911DC8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251364F90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_242911DD8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251364F90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242911E08(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void sub_242911E18(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      sub_242729A44();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

uint64_t sub_242911F3C(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  __int128 v5;
  __int128 v6;
  _BYTE *v7;
  __int128 v8;
  __int128 v9;
  char v10;
  NSObject *v11;
  int v13;
  uint64_t *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = (uint64_t *)(a1 + 16);
  if (*(char *)(a2 + 39) < 0)
  {
    sub_242910CE8((_BYTE *)(a1 + 16), *(void **)(a2 + 16), *(_QWORD *)(a2 + 24));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_OWORD *)v4 = v5;
  }
  if (*(char *)(a2 + 63) < 0)
  {
    sub_242910CE8((_BYTE *)(a1 + 40), *(void **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = v6;
  }
  v7 = (_BYTE *)(a1 + 64);
  if (*(char *)(a2 + 87) < 0)
  {
    sub_242910CE8(v7, *(void **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_OWORD *)v7 = v8;
  }
  v9 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 88) = v9;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_BYTE *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0xBFF0000000000000;
  v10 = sub_242729014(v4);
  *(_BYTE *)(a1 + 136) = v10;
  if ((v10 & 1) == 0)
  {
    if (qword_257206B48 != -1)
      dispatch_once(&qword_257206B48, &unk_251364FF0);
    v11 = qword_257206B40;
    if (os_log_type_enabled((os_log_t)qword_257206B40, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a1 + 39) < 0)
        v4 = (uint64_t *)*v4;
      v13 = 136446210;
      v14 = v4;
      _os_log_error_impl(&dword_242728000, v11, OS_LOG_TYPE_ERROR, "Unable to create directory at path: %{public}s", (uint8_t *)&v13, 0xCu);
    }
  }
  return a1;
}

void sub_2429120E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 63) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 39) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t sub_242912148(uint64_t a1)
{
  sub_2429121B8(a1);
  sub_242913214((CMMsl::Writer **)(a1 + 128), 0);
  if (*(char *)(a1 + 127) < 0)
    operator delete(*(void **)(a1 + 104));
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

CMMsl::Writer *sub_2429121B8(uint64_t a1)
{
  CMMsl::Writer *result;
  CMMsl::Writer **v2;

  v2 = (CMMsl::Writer **)(a1 + 128);
  result = *(CMMsl::Writer **)(a1 + 128);
  if (result)
  {
    CMMsl::Writer::sync(result);
    return sub_242913214(v2, 0);
  }
  return result;
}

uint64_t sub_2429121F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2494E8360](a1 + 112);
  return a1;
}

void sub_242912278(uint64_t a1, uint64_t a2, double a3, double a4)
{
  CMMsl::Writer *v7;
  CMMsl::Writer **v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  CMMsl::Writer *v12;
  uint64_t v13;
  CMMsl::Writer *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::ios_base *v20;
  uint64_t v21;
  _QWORD *v22;
  const std::ios_base *v23;
  const std::locale::facet *v24;
  std::ios_base::fmtflags v25;
  char *v26;
  uint64_t v27;
  int v28;
  int v29;
  const std::locale::facet *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  std::locale::__imp *p_b;
  uint64_t v36;
  uint64_t v37;
  void *locale;
  uint64_t v39;
  uint64_t v40;
  const std::string::value_type *p_p;
  std::string::size_type v42;
  std::string *v43;
  __int128 v44;
  int v45;
  const std::string::value_type *v46;
  std::string::size_type v47;
  std::string *v48;
  std::string::size_type v49;
  char v50;
  uint64_t v51;
  int v52;
  const std::string::value_type *v53;
  std::string::size_type v54;
  std::string *v55;
  __int128 v56;
  void **v57;
  int v58;
  unint64_t v59;
  uint64_t v60;
  NSObject *v61;
  std::string::size_type v62;
  std::string::size_type size;
  __int128 v64;
  NSObject *v65;
  std::string *p_dst;
  std::string::size_type v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  std::string::size_type v71;
  NSObject *v72;
  void *v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  CMMsl::Writer **v80;
  uint64_t v81;
  void *v82[2];
  int64_t v83;
  time_t v84;
  std::chrono::system_clock::time_point __t;
  std::locale v86;
  std::locale __b;
  size_t v88;
  int64_t v89;
  std::string v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  std::string v94;
  __int128 __p;
  unsigned __int8 v96;
  _BYTE block[24];
  const char *v98;
  CMMsl::Writer *v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  int v103;
  uint64_t v104[20];
  _QWORD v105[2];
  std::string __dst;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 136))
  {
    v8 = (CMMsl::Writer **)(a1 + 128);
    v7 = *(CMMsl::Writer **)(a1 + 128);
    v9 = MEMORY[0x24BDAC760];
    if (!v7
      || (v10 = *(double *)(a1 + 144), v10 < 0.0)
      || (v10 <= a3 ? (v11 = *((_QWORD *)v7 + 15) + *((_QWORD *)v7 + 6) <= *(_QWORD *)a1) : (v11 = 0),
          !v11 || (LODWORD(a4) = *(_DWORD *)(a1 + 8), a3 - v10 > (double)*(unint64_t *)&a4)))
    {
      sub_2429121B8(a1);
      v12 = (CMMsl::Writer *)operator new();
      CMMsl::Writer::Writer(v12);
      sub_242913214(v8, v12);
      v13 = *(_QWORD *)(a1 + 96);
      if (v13 >= 1)
      {
        v14 = *v8;
        v15 = *((_QWORD *)*v8 + 1);
        *(_QWORD *)block = v9;
        *(_QWORD *)&block[8] = 0x40000000;
        *(_QWORD *)&block[16] = sub_24272AEEC;
        v98 = (const char *)&unk_25135BA08;
        v99 = v14;
        v100 = v13;
        dispatch_sync(v15, block);
      }
      __t.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      v84 = std::chrono::system_clock::to_time_t(&__t);
      v16 = MEMORY[0x24BEDB870];
      v17 = MEMORY[0x24BEDB870] + 64;
      v18 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
      v19 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
      v104[0] = MEMORY[0x24BEDB870] + 64;
      *(_QWORD *)block = v18;
      *(_QWORD *)&block[*(_QWORD *)(v18 - 24)] = v19;
      v20 = (std::ios_base *)&block[*(_QWORD *)(*(_QWORD *)block - 24)];
      std::ios_base::init(v20, &block[8]);
      v80 = v8;
      v81 = a2;
      v20[1].__vftable = 0;
      v20[1].__fmtflags_ = -1;
      *(_QWORD *)block = v16 + 24;
      v104[0] = v17;
      std::streambuf::basic_streambuf();
      *(_QWORD *)&block[8] = MEMORY[0x24BEDB848] + 16;
      v101 = 0u;
      v102 = 0u;
      v103 = 16;
      v21 = *(_QWORD *)block;
      *(_DWORD *)&block[*(_QWORD *)(*(_QWORD *)block - 24) + 8] |= 4u;
      *(_QWORD *)&block[*(_QWORD *)(v21 - 24) + 16] = 6;
      v22 = (_QWORD *)std::ostream::operator<<();
      localtime(&v84);
      MEMORY[0x2494E8258](&v90, v22);
      if (v90.__r_.__value_.__s.__data_[0])
      {
        std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
        std::locale::use_facet((const std::locale *)&v94, MEMORY[0x24BEDB598]);
        std::locale::~locale((std::locale *)&v94);
        v23 = (const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24));
        if (v23[1].__fmtflags_ == -1)
        {
          std::ios_base::getloc(v23);
          v24 = std::locale::use_facet(&v86, MEMORY[0x24BEDB350]);
          v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 32);
          std::locale::~locale(&v86);
          v23[1].__fmtflags_ = v25;
        }
        if (!std::time_put<char,std::ostreambuf_iterator<char>>::put())
          std::ios_base::clear((std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)), *(_DWORD *)((char *)v22 + *(_QWORD *)(*v22 - 24) + 32) | 1);
      }
      MEMORY[0x2494E8264](&v90);
      MEMORY[0x2494E8258](&v90, v22);
      if (v90.__r_.__value_.__s.__data_[0])
      {
        v26 = (char *)v22 + *(_QWORD *)(*v22 - 24);
        v27 = *((_QWORD *)v26 + 5);
        v28 = *((_DWORD *)v26 + 2);
        v29 = *((_DWORD *)v26 + 36);
        if (v29 == -1)
        {
          std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
          v30 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
          v29 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 32);
          std::locale::~locale(&__b);
          *((_DWORD *)v26 + 36) = v29;
        }
        if ((v28 & 0xB0) == 0x20)
          v31 = "";
        else
          v31 = ".";
        if (!v27)
          goto LABEL_45;
        v32 = *((_QWORD *)v26 + 3);
        v11 = v32 <= 1;
        v33 = v32 - 1;
        v34 = v11 ? 0 : v33;
        if (v31 - "." >= 1
          && (*(uint64_t (**)(uint64_t, const char *, int64_t))(*(_QWORD *)v27 + 96))(v27, ".", v31 - ".") != v31 - ".")
        {
          goto LABEL_45;
        }
        if ((uint64_t)v34 >= 1)
        {
          if (v34 >= 0x7FFFFFFFFFFFFFF8)
            sub_242729920();
          if (v34 >= 0x17)
          {
            v36 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v34 | 7) != 0x17)
              v36 = v34 | 7;
            v37 = v36 + 1;
            p_b = (std::locale::__imp *)operator new(v36 + 1);
            v88 = v34;
            v89 = v37 | 0x8000000000000000;
            __b.__locale_ = p_b;
          }
          else
          {
            HIBYTE(v89) = v34;
            p_b = (std::locale::__imp *)&__b;
          }
          memset(p_b, v29, v34);
          *((_BYTE *)p_b + v34) = 0;
          if (v89 >= 0)
            locale = &__b;
          else
            locale = __b.__locale_;
          v39 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(_QWORD *)v27 + 96))(v27, locale, v34);
          if (SHIBYTE(v89) < 0)
            operator delete(__b.__locale_);
          if (v39 != v34)
            goto LABEL_45;
        }
        v40 = "." - v31 + 1;
        if (v40 < 1
          || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(_QWORD *)v27 + 96))(v27, v31, "." - v31 + 1) == v40)
        {
          *((_QWORD *)v26 + 3) = 0;
        }
        else
        {
LABEL_45:
          std::ios_base::clear((std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)), *(_DWORD *)((char *)v22 + *(_QWORD *)(*v22 - 24) + 32) | 5);
        }
      }
      MEMORY[0x2494E8264](&v90);
      std::ostream::operator<<();
      std::stringbuf::str();
      sub_242913250(&__dst, (const void **)(a1 + 40), 95);
      if ((v96 & 0x80u) == 0)
        p_p = (const std::string::value_type *)&__p;
      else
        p_p = (const std::string::value_type *)__p;
      if ((v96 & 0x80u) == 0)
        v42 = v96;
      else
        v42 = *((_QWORD *)&__p + 1);
      v43 = std::string::append(&__dst, p_p, v42);
      v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
      v94.__r_.__value_.__r.__words[2] = v43->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v94.__r_.__value_.__l.__data_ = v44;
      v43->__r_.__value_.__l.__size_ = 0;
      v43->__r_.__value_.__r.__words[2] = 0;
      v43->__r_.__value_.__r.__words[0] = 0;
      std::string::push_back(&v94, 46);
      v90 = v94;
      memset(&v94, 0, sizeof(v94));
      v45 = *(char *)(a1 + 87);
      if (v45 >= 0)
        v46 = (const std::string::value_type *)(a1 + 64);
      else
        v46 = *(const std::string::value_type **)(a1 + 64);
      if (v45 >= 0)
        v47 = *(unsigned __int8 *)(a1 + 87);
      else
        v47 = *(_QWORD *)(a1 + 72);
      v48 = std::string::append(&v90, v46, v47);
      v49 = v48->__r_.__value_.__r.__words[0];
      v105[0] = v48->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v105 + 7) = *(std::string::size_type *)((char *)&v48->__r_.__value_.__r.__words[1] + 7);
      v50 = HIBYTE(v48->__r_.__value_.__r.__words[2]);
      v48->__r_.__value_.__l.__size_ = 0;
      v48->__r_.__value_.__r.__words[2] = 0;
      v48->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a1 + 127) < 0)
        operator delete(*(void **)(a1 + 104));
      v51 = v105[0];
      *(_QWORD *)(a1 + 104) = v49;
      *(_QWORD *)(a1 + 112) = v51;
      *(_QWORD *)(a1 + 119) = *(_QWORD *)((char *)v105 + 7);
      *(_BYTE *)(a1 + 127) = v50;
      if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v90.__r_.__value_.__l.__data_);
      if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v94.__r_.__value_.__l.__data_);
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__dst.__r_.__value_.__l.__data_);
      sub_242913250(&v90, (const void **)(a1 + 16), 47);
      v52 = *(char *)(a1 + 127);
      if (v52 >= 0)
        v53 = (const std::string::value_type *)(a1 + 104);
      else
        v53 = *(const std::string::value_type **)(a1 + 104);
      if (v52 >= 0)
        v54 = *(unsigned __int8 *)(a1 + 127);
      else
        v54 = *(_QWORD *)(a1 + 112);
      v55 = std::string::append(&v90, v53, v54);
      v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
      v83 = v55->__r_.__value_.__r.__words[2];
      *(_OWORD *)v82 = v56;
      v55->__r_.__value_.__l.__size_ = 0;
      v55->__r_.__value_.__r.__words[2] = 0;
      v55->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v90.__r_.__value_.__l.__data_);
      if ((char)v96 < 0)
        operator delete((void *)__p);
      if (v83 >= 0)
        v57 = v82;
      else
        v57 = (void **)v82[0];
      v58 = CMMsl::Writer::open(*(_QWORD *)(a1 + 128), (uint64_t)v57, *(_DWORD *)(a1 + 88));
      *(_BYTE *)(a1 + 136) = v58;
      if (v58)
      {
        *(double *)(a1 + 144) = a3;
        sub_2427291C0((uint64_t *)(a1 + 16), (uint64_t *)(a1 + 64), (uint64_t *)&v94);
        sub_242913354((const std::locale *)&v90);
        v93 = 0;
        v92 = 0u;
        v91 = 0u;
        if (sub_2429133B0((uint64_t)&v90, ".*_(\\d+-\\d+-\\d+_\\d+:\\d+:\\d+\\.\\d+)\\..*", "") != "")
          sub_242913790();
        v59 = 126
            - 2
            * __clz(0xAAAAAAAAAAAAAAABLL* ((uint64_t)(v94.__r_.__value_.__l.__size_ - v94.__r_.__value_.__r.__words[0]) >> 3));
        v105[0] = &v90;
        __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v105;
        if (v94.__r_.__value_.__l.__size_ == v94.__r_.__value_.__r.__words[0])
          v60 = 0;
        else
          v60 = v59;
        sub_24291A848((uint64_t)v94.__r_.__value_.__l.__data_, (__n128 *)v94.__r_.__value_.__l.__size_, (uint64_t **)&__dst, v60, 1);
        if (qword_257206B48 != -1)
          dispatch_once(&qword_257206B48, &unk_251364FF0);
        v61 = qword_257206B40;
        if (os_log_type_enabled((os_log_t)qword_257206B40, OS_LOG_TYPE_INFO))
        {
          LOWORD(__dst.__r_.__value_.__l.__data_) = 0;
          _os_log_impl(&dword_242728000, v61, OS_LOG_TYPE_INFO, "Msl files on disk:", (uint8_t *)&__dst, 2u);
        }
        size = v94.__r_.__value_.__l.__size_;
        v62 = v94.__r_.__value_.__r.__words[0];
        if (v94.__r_.__value_.__r.__words[0] == v94.__r_.__value_.__l.__size_)
        {
          v67 = v94.__r_.__value_.__r.__words[0];
        }
        else
        {
          do
          {
            if (*(char *)(v62 + 23) < 0)
            {
              sub_242910CE8(&__dst, *(void **)v62, *(_QWORD *)(v62 + 8));
            }
            else
            {
              v64 = *(_OWORD *)v62;
              __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v62 + 16);
              *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v64;
            }
            if (qword_257206B48 != -1)
              dispatch_once(&qword_257206B48, &unk_251364FF0);
            v65 = qword_257206B40;
            if (os_log_type_enabled((os_log_t)qword_257206B40, OS_LOG_TYPE_INFO))
            {
              if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                p_dst = &__dst;
              else
                p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
              LODWORD(__p) = 136380675;
              *(_QWORD *)((char *)&__p + 4) = p_dst;
              _os_log_impl(&dword_242728000, v65, OS_LOG_TYPE_INFO, "  %{private}s", (uint8_t *)&__p, 0xCu);
            }
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__dst.__r_.__value_.__l.__data_);
            v62 += 24;
          }
          while (v62 != size);
          v67 = v94.__r_.__value_.__l.__size_;
          v62 = v94.__r_.__value_.__r.__words[0];
        }
        v68 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v67 - v62) >> 3);
        v69 = *(unsigned int *)(a1 + 12);
        v11 = v68 > v69;
        v70 = v68 - v69;
        if (v11 && v70 >= 1)
        {
          v71 = v62 + 24 * v70;
          do
          {
            if (qword_257206B48 != -1)
              dispatch_once(&qword_257206B48, &unk_251364FF0);
            v72 = qword_257206B40;
            if (os_log_type_enabled((os_log_t)qword_257206B40, OS_LOG_TYPE_INFO))
            {
              v73 = (void *)v62;
              if (*(char *)(v62 + 23) < 0)
                v73 = *(void **)v62;
              LODWORD(__dst.__r_.__value_.__l.__data_) = 136380675;
              *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = (std::string::size_type)v73;
              _os_log_impl(&dword_242728000, v72, OS_LOG_TYPE_INFO, "MSLWriter - deleting: %{private}s", (uint8_t *)&__dst, 0xCu);
            }
            sub_242729624((uint64_t *)v62);
            v62 += 24;
          }
          while (v62 < v71);
        }
        v74 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
        if (*((_QWORD *)&v92 + 1))
        {
          v75 = (unint64_t *)(*((_QWORD *)&v92 + 1) + 8);
          do
            v76 = __ldaxr(v75);
          while (__stlxr(v76 - 1, v75));
          if (!v76)
          {
            ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
            std::__shared_weak_count::__release_weak(v74);
          }
        }
        std::locale::~locale((std::locale *)&v90);
        v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&v94;
        sub_2427297E4((void ***)&v90);
      }
      if (SHIBYTE(v83) < 0)
        operator delete(v82[0]);
      *(_QWORD *)block = *MEMORY[0x24BEDB800];
      *(_QWORD *)&block[*(_QWORD *)(*(_QWORD *)block - 24)] = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
      *(_QWORD *)&block[8] = MEMORY[0x24BEDB848] + 16;
      a2 = v81;
      v9 = MEMORY[0x24BDAC760];
      if (SBYTE7(v102) < 0)
        operator delete((void *)v101);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x2494E8360](v104);
      v7 = *v80;
    }
    v77 = *((_QWORD *)v7 + 1);
    *(_QWORD *)block = v9;
    *(_QWORD *)&block[8] = 0x40000000;
    *(_QWORD *)&block[16] = sub_24272B2F0;
    v98 = (const char *)&unk_25135BA70;
    v99 = v7;
    v100 = a2;
    dispatch_sync(v77, block);
  }
  else
  {
    if (qword_257206B48 != -1)
      dispatch_once(&qword_257206B48, &unk_251364FF0);
    v78 = qword_257206B40;
    if (os_log_type_enabled((os_log_t)qword_257206B40, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)block = 136315650;
      *(_QWORD *)&block[4] = "assert";
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = "fValid";
      *(_WORD *)&block[22] = 2080;
      v98 = "On call to writeItem client should check if the logger was opened";
      _os_log_fault_impl(&dword_242728000, v78, OS_LOG_TYPE_FAULT, "Event: %s\n Condition: %s\n Message: %s", block, 0x20u);
      if (qword_257206B48 != -1)
        dispatch_once(&qword_257206B48, &unk_251364FF0);
    }
    v79 = qword_257206B40;
    if (os_log_type_enabled((os_log_t)qword_257206B40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)block = 136315650;
      *(_QWORD *)&block[4] = "assert";
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = "fValid";
      *(_WORD *)&block[22] = 2080;
      v98 = "On call to writeItem client should check if the logger was opened";
      _os_log_impl(&dword_242728000, v79, OS_LOG_TYPE_INFO, "Event: %s\n Condition: %s\n Message: %s", block, 0x20u);
    }
    abort_report_np();
    __break(1u);
  }
}

void sub_242912EC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,std::locale a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,std::locale a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,std::locale a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,uint64_t a59,char a60)
{
  _QWORD *v60;

  if (a2)
  {
    if (a34 < 0)
      operator delete(__p);
    MEMORY[0x2494E8264](&a35);
    __cxa_begin_catch(exception_object);
    std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v60 + *(_QWORD *)(*v60 - 24)));
    __cxa_end_catch();
    JUMPOUT(0x242912774);
  }
  _Unwind_Resume(exception_object);
}

void sub_242913044()
{
  __cxa_end_catch();
  JUMPOUT(0x242913100);
}

void sub_24291305C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  std::ostream::~ostream();
  MEMORY[0x2494E8360](a15);
  JUMPOUT(0x242913108);
}

void sub_242913088()
{
  uint64_t v0;

  MEMORY[0x2494E8384](v0, 0x10F0C401CD2F398);
  JUMPOUT(0x242913108);
}

void sub_2429130BC()
{
  JUMPOUT(0x242913100);
}

void sub_2429130C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::locale a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  sub_242911D70(&a37);
  std::locale::~locale(&a32);
  a32.__locale_ = (std::locale::__imp *)&a40;
  sub_2427297E4(&a32);
  if (a24 < 0)
    operator delete(a19);
  sub_2429121F4(&a48);
  _Unwind_Resume(a1);
}

uint64_t sub_242913114(uint64_t a1, uint64_t a2)
{
  CMMsl::Writer *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];

  v4 = (CMMsl::Writer *)operator new();
  CMMsl::Writer::Writer(v4);
  v5 = (uint64_t *)(a1 + 128);
  sub_242913214((CMMsl::Writer **)(a1 + 128), v4);
  v6 = *(_QWORD *)(a1 + 96);
  if (v6 >= 1)
  {
    v7 = *v5;
    v8 = *(NSObject **)(*v5 + 8);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = sub_24272AEEC;
    v12[3] = &unk_25135BA08;
    v12[4] = v7;
    v12[5] = v6;
    dispatch_sync(v8, v12);
  }
  if (*(char *)(a2 + 23) >= 0)
    v9 = a2;
  else
    v9 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 136) = CMMsl::Writer::open(*(_QWORD *)(a1 + 128), v9, 4);
  v10 = mach_continuous_time();
  *(double *)(a1 + 144) = sub_24272AB4C(v10);
  return *(unsigned __int8 *)(a1 + 136);
}

void sub_2429131F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2494E8384](v1, 0x10F0C401CD2F398);
  _Unwind_Resume(a1);
}

CMMsl::Writer *sub_242913214(CMMsl::Writer **a1, CMMsl::Writer *a2)
{
  CMMsl::Writer *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    CMMsl::Writer::~Writer(result);
    JUMPOUT(0x2494E8384);
  }
  return result;
}

_QWORD *sub_242913250(_QWORD *__dst, const void **a2, char a3)
{
  _QWORD *v3;
  int v4;
  size_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  const void *v12;
  _BYTE *v13;

  v3 = __dst;
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  v6 = v5 + 1;
  if (v5 + 1 >= 0x7FFFFFFFFFFFFFF8)
    sub_242729920();
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v11 = operator new(v9 + 1);
    v3[1] = v6;
    v3[2] = v10 | 0x8000000000000000;
    *v3 = v11;
    v3 = v11;
  }
  else
  {
    __dst[1] = 0;
    __dst[2] = 0;
    *__dst = 0;
    *((_BYTE *)__dst + 23) = v6;
    if (!v5)
      goto LABEL_15;
  }
  if (v4 >= 0)
    v12 = a2;
  else
    v12 = *a2;
  __dst = memmove(v3, v12, v5);
LABEL_15:
  v13 = (char *)v3 + v5;
  *v13 = a3;
  v13[1] = 0;
  return __dst;
}

os_log_t sub_242913328()
{
  os_log_t result;

  result = os_log_create("com.apple.MotionSensorLogging", "MSL");
  qword_257206B40 = (uint64_t)result;
  return result;
}

const std::locale *sub_242913354(const std::locale *a1)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x2494E8324]();
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, MEMORY[0x24BEDB4B0]);
  return a1;
}

void sub_24291339C(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *sub_2429133B0(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  char *v14;
  char *v15;
  char *v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = (_QWORD *)operator new();
  *v6 = &off_251365020;
  v7 = (_QWORD *)operator new();
  *v7 = &off_2513650C8;
  v7[1] = v6;
  v8 = (_QWORD *)operator new();
  *v8 = &off_251365078;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v13 > 0x3F)
  {
    switch(v13)
    {
      case 0x40u:
        return sub_242913A5C(a1, a2, a3);
      case 0x80u:
        v17 = (char *)memchr(a2, 10, a3 - a2);
        if (v17)
          v18 = v17;
        else
          v18 = a3;
        if (v18 == a2)
        {
          v28 = (_QWORD *)operator new();
          v29 = *(_QWORD *)(a1 + 56);
          v30 = *(_QWORD *)(v29 + 8);
          *v28 = &off_2513650C8;
          v28[1] = v30;
          *(_QWORD *)(v29 + 8) = v28;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        else
        {
          sub_242913918(a1, a2, v18);
        }
        if (v18 != a3)
          ++v18;
        while (v18 != a3)
        {
          v31 = (char *)memchr(v18, 10, a3 - v18);
          if (v31)
            v32 = v31;
          else
            v32 = a3;
          v33 = *(_QWORD *)(a1 + 56);
          if (v32 == v18)
          {
            v34 = (_QWORD *)operator new();
            v35 = *(_QWORD *)(a1 + 56);
            v36 = *(_QWORD *)(v35 + 8);
            *v34 = &off_2513650C8;
            v34[1] = v36;
            *(_QWORD *)(v35 + 8) = v34;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            sub_242913918(a1, v18, v32);
          }
          sub_242913D50(a1, v12, v33);
          if (v32 == a3)
            v18 = v32;
          else
            v18 = v32 + 1;
        }
        break;
      case 0x100u:
        v14 = (char *)memchr(a2, 10, a3 - a2);
        if (v14)
          v15 = v14;
        else
          v15 = a3;
        if (v15 == a2)
        {
          v19 = (_QWORD *)operator new();
          v20 = *(_QWORD *)(a1 + 56);
          v21 = *(_QWORD *)(v20 + 8);
          *v19 = &off_2513650C8;
          v19[1] = v21;
          *(_QWORD *)(v20 + 8) = v19;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        else
        {
          sub_242913A5C(a1, a2, v15);
        }
        if (v15 != a3)
          ++v15;
        while (v15 != a3)
        {
          v22 = (char *)memchr(v15, 10, a3 - v15);
          if (v22)
            v23 = v22;
          else
            v23 = a3;
          v24 = *(_QWORD *)(a1 + 56);
          if (v23 == v15)
          {
            v25 = (_QWORD *)operator new();
            v26 = *(_QWORD *)(a1 + 56);
            v27 = *(_QWORD *)(v26 + 8);
            *v25 = &off_2513650C8;
            v25[1] = v27;
            *(_QWORD *)(v26 + 8) = v25;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            sub_242913A5C(a1, v15, v23);
          }
          sub_242913D50(a1, v12, v24);
          if (v23 == a3)
            v15 = v23;
          else
            v15 = v23 + 1;
        }
        break;
      default:
        goto LABEL_54;
    }
    return a3;
  }
  else if (v13)
  {
    if (v13 != 16)
    {
      if (v13 != 32)
LABEL_54:
        sub_242913AFC();
      return sub_242913A5C(a1, a2, a3);
    }
    return sub_242913918(a1, a2, a3);
  }
  else
  {
    return sub_2429137DC(a1, (unsigned __int8 *)a2, a3);
  }
}

void sub_24291375C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_242913790()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2429137C8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_2429137DC(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  do
  {
    v8 = v7;
    v7 = sub_242913E24(a1, v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    v9 = (_QWORD *)operator new();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v10 + 8);
    *v9 = &off_2513650C8;
    v9[1] = v11;
    *(_QWORD *)(v10 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = v8 + 1;
    v14 = v8 + 1;
    do
    {
      v8 = v14;
      v14 = sub_242913E24(a1, v14, a3);
    }
    while (v14 != v8);
    if (v8 == v13)
    {
      v15 = (_QWORD *)operator new();
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(v16 + 8);
      *v15 = &off_2513650C8;
      v15[1] = v17;
      *(_QWORD *)(v16 + 8) = v15;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    sub_242913D50(a1, v6, v12);
  }
  return a3;
}

char *sub_242913918(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v4 = a3;
  if (*a2 == 94)
  {
    v6 = operator new();
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v6 = &off_251365170;
    *(_QWORD *)(v6 + 8) = v9;
    *(_BYTE *)(v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != v4)
  {
    do
    {
      v10 = v3;
      v3 = sub_24291A020(a1, v3, v4);
    }
    while (v3 != v10);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36)
        sub_242919FD4();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &off_2513651B8;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

char *sub_242913A5C(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v3 = a3;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = sub_24291A4C8(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    sub_242919FD4();
  v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = sub_24291A4C8(a1, (char *)v8 + 1, v3);
    if (v10 == v8 + 1)
      goto LABEL_9;
    v8 = v10;
    sub_242913D50(a1, v6, v9);
  }
  return v3;
}

void sub_242913AFC()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242913B34(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_242913B4C()
{
  JUMPOUT(0x2494E8384);
}

void sub_242913B60(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_242913B78(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242913B9C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_242913BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000242924E27
    || ((v3 & 0x8000000242924E27 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x8000000242924E27)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000242924E27 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

_QWORD *sub_242913C1C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_242913C5C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242913CAC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_242913CC0(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_242913D00(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

_QWORD *sub_242913D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *result;
  uint64_t v11;

  v6 = (_QWORD *)operator new();
  v7 = *(_QWORD *)(a3 + 8);
  v6[1] = *(_QWORD *)(a2 + 8);
  v6[2] = v7;
  *v6 = &off_251365638;
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a3 + 8) = 0;
  v8 = (_QWORD *)operator new();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *v8 = &off_2513650C8;
  v8[1] = v9;
  *(_QWORD *)(a3 + 8) = v8;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
  result = (_QWORD *)operator new();
  v11 = *(_QWORD *)(a3 + 8);
  *result = &off_251365680;
  result[1] = v11;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = result;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a3 + 8);
  return result;
}

unsigned __int8 *sub_242913E24(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  int v6;
  int v7;
  char *v8;
  BOOL v9;
  char *v10;
  int v12;
  char *v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (**v19)();
  unsigned __int8 *result;
  int v21;
  char v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  _DWORD *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  unsigned __int8 *v31;
  unsigned __int8 *v32;
  int v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char *v39;
  int v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  unsigned __int8 *v48;
  uint64_t v49;
  char v50;
  std::locale v51[3];
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  if (a2 == (unsigned __int8 *)a3)
    return a2;
  v6 = (char)*a2;
  v7 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 == (unsigned __int8 *)a3)
        goto LABEL_32;
      v21 = a2[1];
      if (v21 == 66)
      {
        v22 = 1;
      }
      else
      {
        if (v21 != 98)
          goto LABEL_32;
        v22 = 0;
      }
      sub_24291476C(a1, v22);
      return a2 + 2;
    }
    if (v6 != 94)
      goto LABEL_32;
    v15 = operator new();
    v16 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(v17 + 8);
    v19 = &off_251365170;
LABEL_21:
    *(_QWORD *)v15 = v19;
    *(_QWORD *)(v15 + 8) = v18;
    *(_BYTE *)(v15 + 16) = v16;
    *(_QWORD *)(v17 + 8) = v15;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    v15 = operator new();
    v16 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(v17 + 8);
    v19 = &off_2513651B8;
    goto LABEL_21;
  }
  v9 = v6 == 40;
  v8 = (char *)(a2 + 1);
  v9 = !v9 || v8 == a3;
  if (!v9)
  {
    v9 = *v8 == 63;
    v10 = (char *)(a2 + 2);
    if (v9 && v10 != a3)
    {
      v12 = *v10;
      if (v12 == 33)
      {
        sub_242913354(v51);
        v52 = 0u;
        v54 = 0;
        v53 = 0u;
        LODWORD(v52) = *(_DWORD *)(a1 + 24);
        v13 = (char *)sub_2429133B0(v51, a2 + 3, a3);
        v23 = DWORD1(v52);
        sub_2429147EC(a1, (uint64_t)v51, 1, *(_DWORD *)(a1 + 28));
        *(_DWORD *)(a1 + 28) += v23;
        if (v13 == a3 || *v13 != 41)
          sub_2429148B0();
      }
      else
      {
        if (v12 != 61)
          goto LABEL_32;
        sub_242913354(v51);
        v52 = 0u;
        v54 = 0;
        v53 = 0u;
        LODWORD(v52) = *(_DWORD *)(a1 + 24);
        v13 = (char *)sub_2429133B0(v51, a2 + 3, a3);
        v14 = DWORD1(v52);
        sub_2429147EC(a1, (uint64_t)v51, 0, *(_DWORD *)(a1 + 28));
        *(_DWORD *)(a1 + 28) += v14;
        if (v13 == a3 || *v13 != 41)
          sub_2429148B0();
      }
      sub_242911D70((uint64_t)&v53);
      std::locale::~locale(v51);
      result = (unsigned __int8 *)(v13 + 1);
      if (v13 + 1 != (char *)a2)
        return result;
      v7 = *a2;
    }
  }
LABEL_32:
  v24 = *(_QWORD *)(a1 + 56);
  v25 = *(_DWORD *)(a1 + 28);
  v26 = (char)v7;
  if ((int)v26 <= 91)
  {
    result = a2;
    switch((char)v7)
    {
      case '$':
      case ')':
        return result;
      case '%':
      case '&':
      case '\'':
      case ',':
      case '-':
        goto LABEL_60;
      case '(':
        if (a2 + 1 == (unsigned __int8 *)a3)
          goto LABEL_98;
        if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
        {
          v27 = (_DWORD *)(a1 + 36);
          ++*(_DWORD *)(a1 + 36);
          v28 = (char *)sub_2429137DC(a1, a2 + 3, a3);
          if (v28 == a3)
            goto LABEL_98;
          v29 = v28;
          if (*v28 != 41)
            goto LABEL_98;
        }
        else
        {
          sub_24291686C(a1);
          v38 = *(_DWORD *)(a1 + 28);
          v27 = (_DWORD *)(a1 + 36);
          ++*(_DWORD *)(a1 + 36);
          v39 = (char *)sub_2429137DC(a1, a2 + 1, a3);
          if (v39 == a3 || (v29 = v39, *v39 != 41))
LABEL_98:
            sub_2429148B0();
          sub_2429168DC(a1, v38);
        }
        --*v27;
        v31 = (unsigned __int8 *)(v29 + 1);
        goto LABEL_57;
      case '*':
      case '+':
        goto LABEL_64;
      case '.':
        v35 = (_QWORD *)operator new();
        v36 = *(_QWORD *)(a1 + 56);
        v37 = *(_QWORD *)(v36 + 8);
        *v35 = &off_251365290;
        v35[1] = v37;
        *(_QWORD *)(v36 + 8) = v35;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        goto LABEL_61;
      default:
        if ((_DWORD)v26 == 91)
        {
          v31 = (unsigned __int8 *)sub_242915C38(a1, (char *)a2, a3);
          goto LABEL_57;
        }
        if ((_DWORD)v26 != 63)
          goto LABEL_60;
        goto LABEL_64;
    }
  }
  v30 = (v26 - 92);
  if (v30 > 0x21)
  {
LABEL_60:
    sub_242916D18(a1, v26);
LABEL_61:
    v31 = a2 + 1;
    return sub_242914474(a1, v31, (unsigned __int8 *)a3, v24, v25 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  if (((1 << (v7 - 92)) & 0x300000006) != 0)
    return a2;
  if ((_DWORD)v26 != 92)
  {
    if (v30 == 31)
LABEL_64:
      sub_242916944();
    goto LABEL_60;
  }
  if (v7 != 92)
    return a2;
  v32 = a2 + 1;
  if (a2 + 1 == (unsigned __int8 *)a3)
    sub_242916A20();
  v33 = *v32;
  v34 = (v33 - 48);
  if (v33 == 48)
  {
    sub_242916D18(a1, v34);
LABEL_97:
    v31 = a2 + 2;
    return sub_242914474(a1, v31, (unsigned __int8 *)a3, v24, v25 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  if ((v33 - 49) > 8)
  {
LABEL_77:
    if ((char)v33 > 99)
    {
      if ((char)v33 == 119)
      {
        v41 = a1;
        v42 = 0;
        goto LABEL_89;
      }
      if ((char)v33 == 115)
      {
        v49 = a1;
        v50 = 0;
LABEL_95:
        v45 = sub_2429176E4(v49, v50);
        v46 = *(_DWORD *)(v45 + 160) | 0x4000;
        goto LABEL_96;
      }
      if ((char)v33 != 100)
      {
LABEL_90:
        v48 = sub_242916A6C(a1, a2 + 1, a3, 0);
        if (v48 == v32)
          v31 = a2;
        else
          v31 = v48;
        goto LABEL_57;
      }
      v43 = a1;
      v44 = 0;
    }
    else
    {
      if ((char)v33 != 68)
      {
        if ((char)v33 != 83)
        {
          if ((char)v33 == 87)
          {
            v41 = a1;
            v42 = 1;
LABEL_89:
            v47 = sub_2429176E4(v41, v42);
            *(_DWORD *)(v47 + 160) |= 0x500u;
            sub_2429178D0(v47, 95);
            goto LABEL_97;
          }
          goto LABEL_90;
        }
        v49 = a1;
        v50 = 1;
        goto LABEL_95;
      }
      v43 = a1;
      v44 = 1;
    }
    v45 = sub_2429176E4(v43, v44);
    v46 = *(_DWORD *)(v45 + 160) | 0x400;
LABEL_96:
    *(_DWORD *)(v45 + 160) = v46;
    goto LABEL_97;
  }
  v31 = a2 + 2;
  if (a2 + 2 == (unsigned __int8 *)a3)
  {
    v31 = (unsigned __int8 *)a3;
  }
  else
  {
    while (1)
    {
      v40 = *v31;
      if ((v40 - 48) > 9)
        break;
      if (v34 >= 0x19999999)
        goto LABEL_99;
      ++v31;
      LODWORD(v34) = v40 + 10 * v34 - 48;
      if (v31 == (unsigned __int8 *)a3)
      {
        v31 = (unsigned __int8 *)a3;
        break;
      }
    }
    if (!(_DWORD)v34)
LABEL_99:
      sub_242916E8C();
  }
  if (v34 > v25)
    goto LABEL_99;
  sub_242916ED8(a1, v34);
  if (v31 == v32)
  {
    LOBYTE(v33) = *v32;
    goto LABEL_77;
  }
LABEL_57:
  result = a2;
  if (v31 != a2)
    return sub_242914474(a1, v31, (unsigned __int8 *)a3, v24, v25 + 1, *(_DWORD *)(a1 + 28) + 1);
  return result;
}

void sub_242914448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_242911D70((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_242914474(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  char v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  int v28;

  if (a2 == a3)
    return a2;
  v6 = a6;
  v7 = a5;
  v10 = a1;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      v13 = a2 + 1;
      if (v11)
        v20 = 1;
      else
        v20 = v13 == a3;
      if (!v20 && *v13 == 63)
      {
        v13 = a2 + 2;
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123)
      return a2;
    v15 = a2 + 1;
    v16 = sub_242919A78(a2 + 1, a3, &v28);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              v13 = v16 + 2;
              v14 = v28;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = v28;
LABEL_33:
              v21 = a4;
              v22 = 0;
LABEL_46:
              sub_24291993C(a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = v28;
LABEL_45:
            v21 = a4;
            v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3)
          goto LABEL_58;
        if (*v23 == 125)
        {
          v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            v13 = v16 + 3;
            v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = v28;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = sub_242919A78(v16 + 1, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = v28;
          if (v27 >= v28)
          {
            v13 = v25 + 1;
            v22 = 1;
            if (!v11 && v13 != a3)
            {
              v26 = v25[1];
              v22 = v26 != 63;
              if (v26 == 63)
                v13 = v25 + 2;
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v21 = a4;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      sub_242919B5C();
    }
LABEL_58:
    sub_242919B10();
  }
  if (v12 == 42)
  {
    v13 = a2 + 1;
    if (v11)
      v19 = 1;
    else
      v19 = v13 == a3;
    if (!v19 && *v13 == 63)
    {
      v13 = a2 + 2;
      v14 = 0;
      goto LABEL_26;
    }
    v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

__n128 sub_24291476C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 result;

  v4 = operator new();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)v4 = &off_251365200;
  *(_QWORD *)(v4 + 8) = v5;
  std::locale::locale((std::locale *)(v4 + 16), (const std::locale *)a1);
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v4 + 24) = result;
  *(_BYTE *)(v4 + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v4;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

std::locale *sub_2429147EC(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  std::locale *result;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;

  v8 = operator new();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)v8 = &off_251365248;
  *(_QWORD *)(v8 + 8) = v9;
  result = std::locale::locale((std::locale *)(v8 + 16), (const std::locale *)a2);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(v8 + 64) = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(v8 + 80) = a4;
  *(_BYTE *)(v8 + 84) = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

void sub_2429148B0()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2429148E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2429148FC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_24291493C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_24291498C(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

_QWORD *sub_2429149EC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_242914A2C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242914A7C(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_242914ACC(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_251365200;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_242914B1C(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_251365200;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242914B7C(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

std::locale *sub_242914C90(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_251365248;
  v2 = a1 + 2;
  sub_242911D70((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_242914CF0(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_251365248;
  v2 = a1 + 2;
  sub_242911D70((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x2494E8384);
}

void sub_242914D60(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  char *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  void *__p;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  char v27;
  char v28;
  uint64_t v29;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0uLL;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  __p = 0;
  v19 = 0;
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v20 = 0;
  *(_QWORD *)&v21 = v5;
  *((_QWORD *)&v21 + 1) = v5;
  v22 = 0;
  sub_2429152D0((char **)&__p, v4, &v21);
  v23 = v6;
  v24 = v6;
  v25 = 0;
  v26 = v21;
  v27 = v22;
  v29 = v6;
  v28 = 1;
  v7 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(_QWORD *)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_242914EF0(a1 + 16, v7, *(_QWORD *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  v10 = (char *)__p;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (uint64_t)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &v10[24 * v15];
    v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  operator delete(v10);
}

void sub_242914ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_242914EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  signed int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  __int128 v42;
  char v43;
  int64x2_t v44;
  unint64_t v45;

  v44 = 0uLL;
  v45 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v42 = a3;
    *((_QWORD *)&v42 + 1) = a3;
    v43 = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v44.i64[1] = (uint64_t)sub_242915818(&v44, (uint64_t)v39);
    if (__p[0])
      operator delete(__p[0]);
    if (*(_QWORD *)&v39[32])
      operator delete(*(void **)&v39[32]);
    v36 = a4;
    v12 = v44.i64[1];
    *(_DWORD *)(v44.i64[1] - 96) = 0;
    *(_QWORD *)(v12 - 88) = a2;
    *(_QWORD *)(v12 - 80) = a2;
    *(_QWORD *)(v12 - 72) = a3;
    sub_242915504((void **)(v12 - 64), *(unsigned int *)(a1 + 28), &v42);
    sub_24291567C((char **)(v44.i64[1] - 40), *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = a3 - a2;
    v14 = v44.i64[1];
    *(_QWORD *)(v44.i64[1] - 16) = v6;
    *(_DWORD *)(v14 - 8) = a5;
    *(_BYTE *)(v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        sub_242915780();
      v17 = (_QWORD *)(v14 - 16);
      v16 = *(_QWORD *)(v14 - 16);
      v18 = (_OWORD *)(v14 - 96);
      if (v16)
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v16 + 16))(v16, v14 - 96);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *(_QWORD *)(v14 - 80);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *(_QWORD *)(v14 - 64);
          v29 = *(_QWORD *)(v14 - 56) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v44.i64[1] - 96;
          sub_2429159DC((_QWORD *)(v44.i64[1] - 96));
          v44.i64[1] = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *(_OWORD *)(v14 - 80);
          *(_OWORD *)v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          sub_242915AA0(&v39[32], *(__int128 **)(v14 - 64), *(__int128 **)(v14 - 56), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v14 - 56) - *(_QWORD *)(v14 - 64)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          sub_242915B1C((char *)__p, *(__int128 **)(v14 - 40), *(__int128 **)(v14 - 32), (uint64_t)(*(_QWORD *)(v14 - 32) - *(_QWORD *)(v14 - 40)) >> 4);
          v22 = *v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)(v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 96);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v44.i64[1];
          if (v44.i64[1] >= v45)
          {
            v44.i64[1] = (uint64_t)sub_242915818(&v44, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *(_OWORD *)v44.i64[1] = *(_OWORD *)v39;
            *(_OWORD *)(v23 + 16) = v24;
            *(_QWORD *)(v23 + 32) = 0;
            *(_QWORD *)(v23 + 40) = 0;
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 0;
            *(_OWORD *)(v23 + 32) = *(_OWORD *)&v39[32];
            *(_QWORD *)(v23 + 48) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *(_QWORD *)(v23 + 64) = 0;
            *(_QWORD *)(v23 + 72) = 0;
            *(_OWORD *)(v23 + 56) = *(_OWORD *)__p;
            *(_QWORD *)(v23 + 72) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)(v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *(_QWORD *)(v23 + 80) = v25;
            v44.i64[1] = v23 + 96;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v44.i64[1];
          ++v15;
          if (v44.i64[0] != v44.i64[1])
            continue;
          v6 = 0;
          break;
        default:
          sub_2429157CC();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v44;
  sub_242915BC8((void ***)v39);
  return v6;
}

void sub_242915278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  sub_2429154C4(&a13);
  a13 = v18 - 112;
  sub_242915BC8((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_2429152D0(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  char *result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    v15 = a1[1];
    v16 = (v15 - result) / 24;
    if (v16 >= a2)
      v17 = a2;
    else
      v17 = (v15 - result) / 24;
    if (v17)
    {
      v18 = result;
      do
      {
        *(_OWORD *)v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      v19 = &v15[24 * (a2 - v16)];
      v20 = 24 * a2 - 24 * v16;
      do
      {
        v21 = *a3;
        *((_QWORD *)v15 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= a2)
      v9 = a2;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    result = sub_242915434(a1, v10);
    v11 = a1[1];
    v12 = &v11[24 * a2];
    v13 = 24 * a2;
    do
    {
      v14 = *a3;
      *((_QWORD *)v11 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

char *sub_242915434(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_242729A44();
  result = (char *)sub_242915480(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_242915480(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    sub_2427299A8();
  return operator new(24 * a1);
}

_QWORD *sub_2429154C4(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_242915504(void **a1, unint64_t a2, __int128 *a3)
{
  char *v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  char *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  uint64_t v26;
  __int128 v27;

  v6 = (char *)*a1;
  v5 = (char *)a1[1];
  v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
  v8 = a2 - v7;
  if (a2 <= v7)
  {
    if (a2 < v7)
      a1[1] = &v6[24 * a2];
  }
  else
  {
    v10 = a1[2];
    if (0xAAAAAAAAAAAAAAABLL * ((v10 - v5) >> 3) >= v8)
    {
      v25 = &v5[24 * v8];
      v26 = 24 * a2 - 8 * ((v5 - (_BYTE *)*a1) >> 3);
      do
      {
        v27 = *a3;
        *((_QWORD *)v5 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v5 = v27;
        v5 += 24;
        v26 -= 24;
      }
      while (v26);
      a1[1] = v25;
    }
    else
    {
      if (a2 > 0xAAAAAAAAAAAAAAALL)
        sub_242729A44();
      v11 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v6) >> 3);
      v12 = 2 * v11;
      if (2 * v11 <= a2)
        v12 = a2;
      if (v11 >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      v14 = (char *)sub_242915480(v13);
      v16 = &v14[24 * v7];
      v17 = &v14[24 * a2];
      v18 = v16;
      v19 = 24 * a2 - 24 * v7;
      do
      {
        v20 = *a3;
        *((_QWORD *)v18 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v18 = v20;
        v18 += 24;
        v19 -= 24;
      }
      while (v19);
      v21 = &v14[24 * v15];
      v23 = (char *)*a1;
      v22 = (char *)a1[1];
      if (v22 != *a1)
      {
        do
        {
          v24 = *(_OWORD *)(v22 - 24);
          *((_QWORD *)v16 - 1) = *((_QWORD *)v22 - 1);
          *(_OWORD *)(v16 - 24) = v24;
          v16 -= 24;
          v22 -= 24;
        }
        while (v22 != v23);
        v22 = (char *)*a1;
      }
      *a1 = v16;
      a1[1] = v17;
      a1[2] = v21;
      if (v22)
        operator delete(v22);
    }
  }
}

void sub_24291567C(char **a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;

  v3 = *a1;
  v4 = a1[1];
  v5 = (v4 - *a1) >> 4;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v18 = &v3[16 * a2];
    goto LABEL_17;
  }
  v6 = a2 - v5;
  v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 4)
  {
    bzero(a1[1], 16 * v6);
    v18 = &v4[16 * v6];
LABEL_17:
    a1[1] = v18;
    return;
  }
  if (a2 >> 60)
    sub_242729A44();
  v8 = v7 - v3;
  v9 = v8 >> 3;
  if (v8 >> 3 <= a2)
    v9 = a2;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v10 = 0xFFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  v11 = (char *)sub_242915A6C(v10);
  v12 = &v11[16 * v5];
  v14 = &v11[16 * v13];
  bzero(v12, 16 * v6);
  v15 = &v12[16 * v6];
  v17 = *a1;
  v16 = a1[1];
  if (v16 != *a1)
  {
    do
    {
      *((_OWORD *)v12 - 1) = *((_OWORD *)v16 - 1);
      v12 -= 16;
      v16 -= 16;
    }
    while (v16 != v17);
    v16 = *a1;
  }
  *a1 = v12;
  a1[1] = v15;
  a1[2] = v14;
  if (v16)
    operator delete(v16);
}

void sub_242915780()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2429157B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2429157CC()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242915804(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_242915818(int64x2_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  int64x2_t v21;
  char *v22;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  int64x2_t *v27;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((a1->i64[1] - a1->i64[0]) >> 5);
  v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL)
    sub_242729A44();
  if (0x5555555555555556 * ((a1[1].i64[0] - a1->i64[0]) >> 5) > v3)
    v3 = 0x5555555555555556 * ((a1[1].i64[0] - a1->i64[0]) >> 5);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[1].i64[0] - a1->i64[0]) >> 5) >= 0x155555555555555)
    v6 = 0x2AAAAAAAAAAAAAALL;
  else
    v6 = v3;
  v27 = a1 + 1;
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL)
      sub_2427299A8();
    v7 = (char *)operator new(96 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_OWORD *)(a2 + 16);
  v9 = &v7[96 * v2];
  *(_OWORD *)v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v9 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(v9 + 85) = *(_QWORD *)(a2 + 85);
  v11 = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  *((_QWORD *)v9 + 9) = 0;
  *((_QWORD *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v9 + 9) = v11;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v13 = v9 + 96;
  v25.i64[1] = (uint64_t)(v9 + 96);
  v26 = v10;
  v15 = a1->i64[0];
  v14 = a1->u64[1];
  if (v14 == a1->i64[0])
  {
    v21 = vdupq_n_s64(v14);
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = &v9[v16];
      v18 = v14 + v16;
      v19 = *(_OWORD *)(v14 + v16 - 80);
      *((_OWORD *)v17 - 6) = *(_OWORD *)(v14 + v16 - 96);
      *((_OWORD *)v17 - 5) = v19;
      *((_QWORD *)v17 - 7) = 0;
      *((_QWORD *)v17 - 6) = 0;
      *((_QWORD *)v17 - 8) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)(v14 + v16 - 64);
      *((_QWORD *)v17 - 6) = *(_QWORD *)(v14 + v16 - 48);
      *(_QWORD *)(v18 - 64) = 0;
      *(_QWORD *)(v18 - 56) = 0;
      *(_QWORD *)(v18 - 48) = 0;
      *((_QWORD *)v17 - 5) = 0;
      *((_QWORD *)v17 - 4) = 0;
      *((_QWORD *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)(v14 + v16 - 40);
      *((_QWORD *)v17 - 3) = *(_QWORD *)(v14 + v16 - 24);
      *(_QWORD *)(v18 - 40) = 0;
      *(_QWORD *)(v18 - 32) = 0;
      *(_QWORD *)(v18 - 24) = 0;
      v20 = *(_QWORD *)(v14 + v16 - 16);
      *(_QWORD *)(v17 - 11) = *(_QWORD *)(v14 + v16 - 11);
      *((_QWORD *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (v14 + v16 != v15);
    v21 = *a1;
    v9 += v16;
    v13 = (char *)v25.i64[1];
    v10 = v26;
  }
  a1->i64[0] = (uint64_t)v9;
  a1->i64[1] = (uint64_t)v13;
  v25 = v21;
  v22 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v10;
  v26 = v22;
  v24 = v21.i64[0];
  sub_242915A20((uint64_t)&v24);
  return v13;
}

void sub_2429159DC(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t sub_242915A20(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    sub_2429159DC((_QWORD *)(i - 96));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *sub_242915A6C(unint64_t a1)
{
  if (a1 >> 60)
    sub_2427299A8();
  return operator new(16 * a1);
}

char *sub_242915AA0(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_242915434(result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_242915B00(_Unwind_Exception *exception_object)
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

char *sub_242915B1C(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_242915B8C(result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_242915B70(_Unwind_Exception *exception_object)
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

char *sub_242915B8C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_242729A44();
  result = (char *)sub_242915A6C(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_242915BC8(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_2429159DC(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *sub_242915C38(uint64_t a1, char *a2, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int v10;
  int v11;
  char *j;
  int v13;
  char *v14;
  int v15;
  std::string *v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  unint64_t i;
  std::string::size_type size;
  char *v22;
  int v23;
  std::string::size_type v24;
  std::string *v25;
  std::string *v26;
  std::regex_traits<char>::char_class_type classname;
  char v28;
  unint64_t v29;
  char *v30;
  std::string::size_type v31;
  std::string *v32;
  std::string::size_type v33;
  std::string *v34;
  std::string::size_type v35;
  std::string *p_p;
  std::string::size_type v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  std::string::size_type v42;
  std::string *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  std::string *v49;
  unint64_t v50;
  std::string::size_type v51;
  __int128 v52;
  BOOL v53;
  std::string::size_type v54;
  std::string::size_type v55;
  std::string *v56;
  std::string::value_type v57;
  std::string *v58;
  std::string::size_type v59;
  BOOL v60;
  std::string::size_type v61;
  std::string::size_type v62;
  std::string *v63;
  std::string::value_type v64;
  std::string *v65;
  std::string::size_type v66;
  std::string::size_type v67;
  std::string *v68;
  std::string::size_type v69;
  std::string *v70;
  void *v71;
  std::string::size_type v72;
  std::string::size_type v73;
  std::string *v74;
  std::string::value_type v75;
  std::string *v76;
  std::string *v77;
  std::string::value_type v78;
  std::string *v79;
  _QWORD *v81;
  uint64_t v82;
  uint64_t *v83;
  char *v84;
  std::string v85;
  std::string v86;
  std::string v87;
  std::string v88;
  std::string __p;
  std::string v90;
  std::string v91;
  std::string v92;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_239;
    v5 = (uint64_t)(a2[1] == 94 ? a2 + 2 : a2 + 1);
    v6 = sub_2429176E4(a1, a2[1] == 94);
    if ((char *)v5 == a3)
      goto LABEL_239;
    v7 = v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(_BYTE *)v5 == 93)
    {
      sub_2429178D0(v6, 93);
      ++v5;
    }
    if ((char *)v5 == a3)
      goto LABEL_239;
    v82 = v7 + 16;
    v83 = (uint64_t *)(v7 + 136);
    v81 = (_QWORD *)(v7 + 88);
    v84 = a3 - 4;
    while (1)
    {
      v8 = (char *)v5;
      v9 = a3;
      if ((char *)v5 == a3)
        goto LABEL_148;
      v10 = *(unsigned __int8 *)v5;
      v9 = (char *)v5;
      if (v10 == 93)
        goto LABEL_148;
      memset(&v88, 0, sizeof(v88));
      if ((char *)(v5 + 1) != a3 && v10 == 91)
      {
        v11 = *(unsigned __int8 *)(v5 + 1);
        switch(v11)
        {
          case '.':
            v9 = (char *)sub_242918A24(a1, (char *)(v5 + 2), a3, (uint64_t)&v88);
            v5 = *(_DWORD *)(a1 + 24) & 0x1F0;
            size = HIBYTE(v88.__r_.__value_.__r.__words[2]);
            if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              size = v88.__r_.__value_.__l.__size_;
            if (size)
              goto LABEL_33;
            goto LABEL_27;
          case ':':
            if ((uint64_t)&a3[-v5 - 2] < 2)
              goto LABEL_238;
            for (i = 0; *(_BYTE *)(v5 + i + 2) != 58 || *(_BYTE *)(v5 + i + 3) != 93; ++i)
            {
              if (&v84[-v5] == (char *)i)
                goto LABEL_238;
            }
            v22 = (char *)(v5 + i + 2);
            if (v22 == a3)
LABEL_238:
              sub_2429189D8();
            v23 = *(_DWORD *)(a1 + 24);
            sub_242918834(&v91, (char *)(v5 + 2), v22, i);
            v24 = HIBYTE(v91.__r_.__value_.__r.__words[2]);
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v25 = &v91;
            else
              v25 = (std::string *)v91.__r_.__value_.__r.__words[0];
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v24 = v91.__r_.__value_.__l.__size_;
            (*(void (**)(_QWORD, std::string *, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v25, (char *)v25 + v24);
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v26 = &v91;
            else
              v26 = (std::string *)v91.__r_.__value_.__r.__words[0];
            classname = std::__get_classname((const char *)v26, v23 & 1);
            if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v91.__r_.__value_.__l.__data_);
            if (!classname)
              sub_242919440();
            v28 = 0;
            *(_DWORD *)(v7 + 160) |= classname;
            v29 = v5 + i;
            goto LABEL_144;
          case '=':
            if ((uint64_t)&a3[-v5 - 2] < 2)
              goto LABEL_238;
            for (j = 0; j[v5 + 2] != 61 || j[v5 + 3] != 93; ++j)
            {
              if (&v84[-v5] == j)
                goto LABEL_238;
            }
            v30 = &j[v5 + 2];
            if (v30 == a3)
              goto LABEL_238;
            sub_2429192A0((uint64_t)&v90, a1, (char *)(v5 + 2), v30);
            if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
            {
              v31 = v90.__r_.__value_.__l.__size_;
              if (!v90.__r_.__value_.__l.__size_)
LABEL_240:
                sub_242919254();
              v32 = (std::string *)v90.__r_.__value_.__r.__words[0];
            }
            else
            {
              v31 = HIBYTE(v90.__r_.__value_.__r.__words[2]);
              if (!*((_BYTE *)&v90.__r_.__value_.__s + 23))
                goto LABEL_240;
              v32 = &v90;
            }
            sub_242918834(&v91, (char *)v32, (char *)v32 + v31, v31);
            v33 = HIBYTE(v91.__r_.__value_.__r.__words[2]);
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v34 = &v91;
            else
              v34 = (std::string *)v91.__r_.__value_.__r.__words[0];
            if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v33 = v91.__r_.__value_.__l.__size_;
            (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16)
                                                                                             + 32))(&__p, *(_QWORD *)(a1 + 16), v34, (char *)v34 + v33);
            v35 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v35 = __p.__r_.__value_.__l.__size_;
            if (v35 != 1)
            {
              if (v35 == 12)
              {
                p_p = &__p;
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                p_p->__r_.__value_.__s.__data_[11] = p_p->__r_.__value_.__s.__data_[3];
              }
              else if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              {
                *__p.__r_.__value_.__l.__data_ = 0;
                __p.__r_.__value_.__l.__size_ = 0;
              }
              else
              {
                __p.__r_.__value_.__s.__data_[0] = 0;
                *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
              }
            }
            if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v91.__r_.__value_.__l.__data_);
            v37 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            v38 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v37 = __p.__r_.__value_.__l.__size_;
            if (v37)
            {
              v40 = *(_QWORD *)(v7 + 144);
              v39 = *(_QWORD *)(v7 + 152);
              if (v40 >= v39)
              {
                v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - *v83) >> 3);
                v45 = v44 + 1;
                if (v44 + 1 > 0xAAAAAAAAAAAAAAALL)
                  sub_242729A44();
                v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - *v83) >> 3);
                if (2 * v46 > v45)
                  v45 = 2 * v46;
                if (v46 >= 0x555555555555555)
                  v47 = 0xAAAAAAAAAAAAAAALL;
                else
                  v47 = v45;
                v92.__r_.__value_.__l.__size_ = v7 + 152;
                if (v47)
                {
                  v48 = sub_242729A58(v7 + 152, v47);
                  v38 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                }
                else
                {
                  v48 = 0;
                }
                v51 = (std::string::size_type)v48 + 24 * v44;
                v91.__r_.__value_.__r.__words[0] = (std::string::size_type)v48;
                v91.__r_.__value_.__l.__size_ = v51;
                v91.__r_.__value_.__r.__words[2] = v51;
                v92.__r_.__value_.__r.__words[0] = (std::string::size_type)v48 + 24 * v47;
                if (v38 < 0)
                {
                  sub_242910CE8((_BYTE *)v51, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
                  v51 = v91.__r_.__value_.__r.__words[2];
                }
                else
                {
                  v52 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
                  *(_QWORD *)(v51 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
                  *(_OWORD *)v51 = v52;
                }
                v91.__r_.__value_.__r.__words[2] = v51 + 24;
                sub_2427299D0(v83, &v91);
                v50 = *(_QWORD *)(v7 + 144);
                sub_242729BB0((uint64_t)&v91);
              }
              else
              {
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                {
                  sub_242910CE8(*(_BYTE **)(v7 + 144), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
                }
                else
                {
                  v41 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
                  *(_QWORD *)(v40 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
                  *(_OWORD *)v40 = v41;
                }
                v50 = v40 + 24;
                *(_QWORD *)(v7 + 144) = v40 + 24;
              }
              *(_QWORD *)(v7 + 144) = v50;
            }
            else
            {
              v42 = HIBYTE(v90.__r_.__value_.__r.__words[2]);
              if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v42 = v90.__r_.__value_.__l.__size_;
              if (v42 == 2)
              {
                v49 = &v90;
                if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v49 = (std::string *)v90.__r_.__value_.__r.__words[0];
                sub_24291904C(v7, v49->__r_.__value_.__s.__data_[0], v49->__r_.__value_.__s.__data_[1]);
              }
              else
              {
                if (v42 != 1)
                  sub_242919254();
                v43 = &v90;
                if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v43 = (std::string *)v90.__r_.__value_.__r.__words[0];
                sub_2429178D0(v7, v43->__r_.__value_.__s.__data_[0]);
              }
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v90.__r_.__value_.__l.__data_);
            v28 = 0;
            v29 = (unint64_t)&j[v5];
LABEL_144:
            v5 = v29 + 4;
            v18 = v8;
            goto LABEL_145;
        }
      }
      v5 = *(_DWORD *)(a1 + 24) & 0x1F0;
      v9 = v8;
LABEL_27:
      if ((v5 | 0x40) != 0x40)
      {
        LOBYTE(v13) = *v9;
LABEL_32:
        std::string::operator=(&v88, v13);
        ++v9;
        goto LABEL_33;
      }
      v13 = *v9;
      if (v13 != 92)
        goto LABEL_32;
      v14 = v9 + 1;
      if ((_DWORD)v5)
      {
        v9 = sub_242918E74(a1, v14, a3, &v88);
      }
      else
      {
        v9 = (char *)sub_242918B0C(a1, (unsigned __int8 *)v14, a3, &v88, v7);
        v5 = 0;
      }
LABEL_33:
      if (v9 != a3)
      {
        v15 = *v9;
        if (v15 != 93)
        {
          v17 = v9 + 1;
          if (v9 + 1 != a3 && v15 == 45 && *v17 != 93)
          {
            memset(&v87, 0, sizeof(v87));
            v18 = v9 + 2;
            if (v9 + 2 != a3 && *v17 == 91 && *v18 == 46)
            {
              v19 = sub_242918A24(a1, v9 + 3, a3, (uint64_t)&v87);
              goto LABEL_152;
            }
            if ((v5 | 0x40) == 0x40)
            {
              LODWORD(v17) = *v17;
              if ((_DWORD)v17 == 92)
              {
                if ((_DWORD)v5)
                  v19 = (uint64_t)sub_242918E74(a1, v9 + 2, a3, &v87);
                else
                  v19 = (uint64_t)sub_242918B0C(a1, (unsigned __int8 *)v9 + 2, a3, &v87, v7);
LABEL_152:
                v18 = (char *)v19;
LABEL_153:
                v86 = v88;
                v85 = v87;
                memset(&v87, 0, sizeof(v87));
                memset(&v88, 0, sizeof(v88));
                if (*(_BYTE *)(v7 + 170))
                {
                  if (*(_BYTE *)(v7 + 169))
                  {
                    v53 = (v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                    v54 = HIBYTE(v86.__r_.__value_.__r.__words[2]);
                    if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v54 = v86.__r_.__value_.__l.__size_;
                    if (v54)
                    {
                      v55 = 0;
                      do
                      {
                        if (v53)
                          v56 = (std::string *)v86.__r_.__value_.__r.__words[0];
                        else
                          v56 = &v86;
                        v57 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v56->__r_.__value_.__s.__data_[v55]);
                        if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v58 = &v86;
                        else
                          v58 = (std::string *)v86.__r_.__value_.__r.__words[0];
                        v58->__r_.__value_.__s.__data_[v55++] = v57;
                        v53 = (v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                        v59 = HIBYTE(v86.__r_.__value_.__r.__words[2]);
                        if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v59 = v86.__r_.__value_.__l.__size_;
                      }
                      while (v55 < v59);
                    }
                    v60 = (v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                    v61 = HIBYTE(v85.__r_.__value_.__r.__words[2]);
                    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v61 = v85.__r_.__value_.__l.__size_;
                    if (v61)
                    {
                      v62 = 0;
                      do
                      {
                        if (v60)
                          v63 = (std::string *)v85.__r_.__value_.__r.__words[0];
                        else
                          v63 = &v85;
                        v64 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v63->__r_.__value_.__s.__data_[v62]);
                        if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v65 = &v85;
                        else
                          v65 = (std::string *)v85.__r_.__value_.__r.__words[0];
                        v65->__r_.__value_.__s.__data_[v62++] = v64;
                        v60 = (v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                        v66 = HIBYTE(v85.__r_.__value_.__r.__words[2]);
                        if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v66 = v85.__r_.__value_.__l.__size_;
                      }
                      while (v62 < v66);
                    }
                  }
                  v67 = HIBYTE(v86.__r_.__value_.__r.__words[2]);
                  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v68 = &v86;
                  else
                    v68 = (std::string *)v86.__r_.__value_.__r.__words[0];
                  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v67 = v86.__r_.__value_.__l.__size_;
                  sub_242919644((uint64_t)&v90, v82, (char *)v68, (char *)v68 + v67);
                  v69 = HIBYTE(v85.__r_.__value_.__r.__words[2]);
                  if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v70 = &v85;
                  else
                    v70 = (std::string *)v85.__r_.__value_.__r.__words[0];
                  if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v69 = v85.__r_.__value_.__l.__size_;
                  sub_242919644((uint64_t)&__p, v82, (char *)v70, (char *)v70 + v69);
                  v91 = v90;
                  memset(&v90, 0, sizeof(v90));
                  v92 = __p;
                  memset(&__p, 0, sizeof(__p));
                  sub_24291948C(v81, (__int128 *)&v91);
                  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v92.__r_.__value_.__l.__data_);
                  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v91.__r_.__value_.__l.__data_);
                  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(__p.__r_.__value_.__l.__data_);
                  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
                  {
                    v71 = (void *)v90.__r_.__value_.__r.__words[0];
                    goto LABEL_223;
                  }
                }
                else
                {
                  v72 = HIBYTE(v86.__r_.__value_.__r.__words[2]);
                  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v72 = v86.__r_.__value_.__l.__size_;
                  if (v72 != 1)
                    goto LABEL_242;
                  v73 = HIBYTE(v85.__r_.__value_.__r.__words[2]);
                  if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v73 = v85.__r_.__value_.__l.__size_;
                  if (v73 != 1)
LABEL_242:
                    sub_2429196EC();
                  if (*(_BYTE *)(v7 + 169))
                  {
                    if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v74 = &v86;
                    else
                      v74 = (std::string *)v86.__r_.__value_.__r.__words[0];
                    v75 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v74->__r_.__value_.__s.__data_[0]);
                    if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v76 = &v86;
                    else
                      v76 = (std::string *)v86.__r_.__value_.__r.__words[0];
                    v76->__r_.__value_.__s.__data_[0] = v75;
                    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v77 = &v85;
                    else
                      v77 = (std::string *)v85.__r_.__value_.__r.__words[0];
                    v78 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v77->__r_.__value_.__s.__data_[0]);
                    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v79 = &v85;
                    else
                      v79 = (std::string *)v85.__r_.__value_.__r.__words[0];
                    v79->__r_.__value_.__s.__data_[0] = v78;
                  }
                  v91 = v86;
                  memset(&v86, 0, sizeof(v86));
                  v92 = v85;
                  memset(&v85, 0, sizeof(v85));
                  sub_24291948C(v81, (__int128 *)&v91);
                  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v92.__r_.__value_.__l.__data_);
                  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
                  {
                    v71 = (void *)v91.__r_.__value_.__r.__words[0];
LABEL_223:
                    operator delete(v71);
                  }
                }
                if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v85.__r_.__value_.__l.__data_);
                if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v86.__r_.__value_.__l.__data_);
                if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v87.__r_.__value_.__l.__data_);
                v28 = 1;
LABEL_145:
                if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v88.__r_.__value_.__l.__data_);
                v9 = v18;
                if ((v28 & 1) == 0)
                  goto LABEL_149;
                goto LABEL_148;
              }
            }
            else
            {
              LOBYTE(v17) = *v17;
            }
            std::string::operator=(&v87, (std::string::value_type)v17);
            goto LABEL_153;
          }
        }
      }
      if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
      {
        if (v88.__r_.__value_.__l.__size_)
        {
          if (v88.__r_.__value_.__l.__size_ == 1)
          {
            v16 = (std::string *)v88.__r_.__value_.__r.__words[0];
LABEL_42:
            sub_2429178D0(v7, v16->__r_.__value_.__s.__data_[0]);
LABEL_80:
            v28 = 1;
            v18 = v9;
            goto LABEL_145;
          }
          v16 = (std::string *)v88.__r_.__value_.__r.__words[0];
LABEL_79:
          sub_24291904C(v7, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_80;
        }
        operator delete(v88.__r_.__value_.__l.__data_);
      }
      else if (*((_BYTE *)&v88.__r_.__value_.__s + 23))
      {
        v16 = &v88;
        if (HIBYTE(v88.__r_.__value_.__r.__words[2]) == 1)
          goto LABEL_42;
        goto LABEL_79;
      }
LABEL_148:
      v5 = (uint64_t)v9;
LABEL_149:
      if ((char *)v5 == v8)
      {
        if (v8 != a3)
        {
          if (*v8 == 45)
          {
            sub_2429178D0(v7, 45);
            ++v8;
          }
          if (v8 != a3 && *v8 == 93)
            return v8 + 1;
        }
LABEL_239:
        sub_2429189D8();
      }
    }
  }
  return a2;
}

void sub_24291673C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  *(_QWORD *)(v46 + 144) = v47;
  if (a46 < 0)
    operator delete(__p);
  if (*(char *)(v48 - 145) < 0)
    operator delete(*(void **)(v48 - 168));
  if (a40 < 0)
    operator delete(a35);
  _Unwind_Resume(exception_object);
}

uint64_t sub_24291686C(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(result + 24) & 2) == 0)
  {
    v1 = result;
    result = operator new();
    v2 = *(_DWORD *)(v1 + 28) + 1;
    *(_DWORD *)(v1 + 28) = v2;
    v3 = *(_QWORD *)(v1 + 56);
    v4 = *(_QWORD *)(v3 + 8);
    *(_QWORD *)result = &off_2513654D0;
    *(_QWORD *)(result + 8) = v4;
    *(_DWORD *)(result + 16) = v2;
    *(_QWORD *)(v3 + 8) = result;
    *(_QWORD *)(v1 + 56) = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
  }
  return result;
}

uint64_t sub_2429168DC(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(result + 24) & 2) == 0)
  {
    v3 = result;
    result = operator new();
    v4 = *(_QWORD *)(v3 + 56);
    v5 = *(_QWORD *)(v4 + 8);
    *(_QWORD *)result = &off_251365518;
    *(_QWORD *)(result + 8) = v5;
    *(_DWORD *)(result + 16) = a2;
    *(_QWORD *)(v4 + 8) = result;
    *(_QWORD *)(v3 + 56) = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8);
  }
  return result;
}

void sub_242916944()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24291697C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_242916990(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_2429169D0(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

void sub_242916A20()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242916A58(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_242916A6C(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this)
{
  unsigned __int8 *v4;
  int v5;
  std::string *v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned __int8 v10;
  char v11;
  unsigned __int8 v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    v5 = (char)*a2;
    if (v5 > 109)
    {
      switch(*a2)
      {
        case 'n':
          if (this)
          {
            v6 = this;
            LOBYTE(v7) = 10;
            goto LABEL_48;
          }
          v7 = 10;
          goto LABEL_57;
        case 'r':
          if (this)
          {
            v6 = this;
            LOBYTE(v7) = 13;
            goto LABEL_48;
          }
          v7 = 13;
          goto LABEL_57;
        case 't':
          if (this)
          {
            v6 = this;
            LOBYTE(v7) = 9;
            goto LABEL_48;
          }
          v7 = 9;
          goto LABEL_57;
        case 'u':
          if (a2 + 1 != (unsigned __int8 *)a3)
          {
            v8 = a2[1];
            if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38 || (v8 | 0x20u) - 97 < 6)
            {
              v4 = a2 + 2;
              if (a2 + 2 != (unsigned __int8 *)a3)
              {
                v9 = *v4;
                if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38 || (v9 | 0x20u) - 97 < 6)
                  goto LABEL_23;
              }
            }
          }
          goto LABEL_62;
        case 'v':
          if (this)
          {
            v6 = this;
            LOBYTE(v7) = 11;
            goto LABEL_48;
          }
          v7 = 11;
          break;
        case 'x':
LABEL_23:
          if (v4 + 1 == (unsigned __int8 *)a3)
            goto LABEL_62;
          v10 = v4[1];
          v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
            goto LABEL_28;
          v10 |= 0x20u;
          if ((v10 - 97) >= 6u)
            goto LABEL_62;
          v11 = -87;
LABEL_28:
          if (v4 + 2 == (unsigned __int8 *)a3)
            goto LABEL_62;
          v12 = v4[2];
          v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
            goto LABEL_33;
          v12 |= 0x20u;
          if ((v12 - 97) >= 6u)
            goto LABEL_62;
          v13 = -87;
LABEL_33:
          if (this)
            std::string::operator=(this, v12 + 16 * (v10 + v11) + v13);
          else
            sub_242916D18(a1, (char)(v12 + 16 * (v10 + v11) + v13));
          v4 += 3;
          return v4;
        default:
          goto LABEL_43;
      }
      goto LABEL_57;
    }
    if (v5 == 48)
    {
      if (this)
      {
        v6 = this;
        LOBYTE(v7) = 0;
        goto LABEL_48;
      }
      v7 = 0;
LABEL_57:
      sub_242916D18(a1, v7);
      return ++v4;
    }
    if (v5 != 99)
    {
      if (v5 == 102)
      {
        if (this)
        {
          v6 = this;
          LOBYTE(v7) = 12;
LABEL_48:
          std::string::operator=(v6, v7);
          return ++v4;
        }
        v7 = 12;
        goto LABEL_57;
      }
LABEL_43:
      v15 = *a2;
      if ((_DWORD)v15 != 95
        && ((v15 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 4 * v15) & 0x500) == 0))
      {
        v7 = (char)v15;
        if (this)
        {
          v6 = this;
          goto LABEL_48;
        }
        goto LABEL_57;
      }
LABEL_62:
      sub_242916A20();
    }
    if (a2 + 1 == (unsigned __int8 *)a3 || ((a2[1] & 0xDF) - 65) > 0x19u)
      goto LABEL_62;
    v14 = a2[1] & 0x1F;
    if (this)
      std::string::operator=(this, v14);
    else
      sub_242916D18(a1, v14);
    v4 += 2;
  }
  return v4;
}

uint64_t sub_242916D18(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    v8 = operator new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)v8 = &off_2513652D8;
    *(_QWORD *)(v8 + 8) = v9;
    std::locale::locale((std::locale *)(v8 + 16), (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    result = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8), a2);
    *(_BYTE *)(v8 + 40) = result;
LABEL_6:
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    goto LABEL_7;
  }
  if ((v4 & 8) != 0)
  {
    v8 = operator new();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)v8 = &off_251365320;
    *(_QWORD *)(v8 + 8) = v10;
    result = (uint64_t)std::locale::locale((std::locale *)(v8 + 16), (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    *(_BYTE *)(v8 + 40) = a2;
    goto LABEL_6;
  }
  result = operator new();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)result = &off_251365368;
  *(_QWORD *)(result + 8) = v7;
  *(_BYTE *)(result + 16) = a2;
  *(_QWORD *)(v6 + 8) = result;
LABEL_7:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

void sub_242916E40(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::locale *v2;
  uint64_t v4;

  std::locale::~locale(v2);
  *v1 = &off_251365140;
  v4 = v1[1];
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  MEMORY[0x2494E8384](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void sub_242916E8C()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242916EC4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_242916ED8(uint64_t a1, int a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  std::locale *v8;
  std::locale *v9;
  std::locale::__imp *v10;
  uint64_t (**v11)();

  v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    v10 = *(std::locale::__imp **)(*(_QWORD *)(a1 + 56) + 8);
    v11 = &off_2513653B0;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)v11;
    v8[1].__locale_ = v10;
    result = (uint64_t)std::locale::locale(v8 + 2, (const std::locale *)a1);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)(a1 + 8);
    LODWORD(v9[5].__locale_) = a2;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v9;
    goto LABEL_7;
  }
  if ((v4 & 8) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    v10 = *(std::locale::__imp **)(*(_QWORD *)(a1 + 56) + 8);
    v11 = &off_2513653F8;
    goto LABEL_6;
  }
  result = operator new();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)result = &off_251365440;
  *(_QWORD *)(result + 8) = v7;
  *(_DWORD *)(result + 16) = a2;
  *(_QWORD *)(v6 + 8) = result;
LABEL_7:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

std::locale *sub_242916FCC(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2513652D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_24291701C(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2513652D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_24291707C(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_2429170F4(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_251365320;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_242917144(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_251365320;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_2429171A4(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

_QWORD *sub_2429171EC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_24291722C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_24291727C(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_2429172C4(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2513653B0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_242917314(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2513653B0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242917374(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_242917458(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2513653F8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_2429174A8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_2513653F8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242917508(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = v6;
      v10 = *(unsigned __int8 **)(a2 + 16);
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v10++;
        if (v11 != v13)
          break;
        if (!--v9)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

_QWORD *sub_242917598(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_2429175D8(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

unsigned int *sub_242917628(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    sub_242916E8C();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

uint64_t sub_2429176E4(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  char v7;
  int v8;
  BOOL v9;
  std::locale v11;
  std::string v12;

  v4 = operator new();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(unsigned __int8 *)(a1 + 24);
  v7 = v6 & 1;
  v8 = (v6 >> 3) & 1;
  *(_QWORD *)v4 = off_251365488;
  *(_QWORD *)(v4 + 8) = v5;
  std::locale::locale((std::locale *)(v4 + 16), (const std::locale *)a1);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *(_OWORD *)(v4 + 120) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_BYTE *)(v4 + 168) = a2;
  *(_BYTE *)(v4 + 169) = v7;
  *(_BYTE *)(v4 + 170) = v8;
  std::locale::locale(&v11, (const std::locale *)(v4 + 16));
  std::locale::name(&v12, &v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
  {
    v9 = v12.__r_.__value_.__l.__size_ != 1 || *v12.__r_.__value_.__l.__data_ != 67;
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  else
  {
    v9 = SHIBYTE(v12.__r_.__value_.__r.__words[2]) != 1 || v12.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v11);
  *(_BYTE *)(v4 + 171) = v9;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v4;
  *(_QWORD *)(a1 + 56) = v4;
  return v4;
}

void sub_242917830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  _QWORD *v10;
  std::locale *v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_2427297E4((void ***)&a10);
  v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  sub_242918698((void ***)&a10);
  v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  *v10 = &off_251365140;
  v17 = v10[1];
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  MEMORY[0x2494E8384](v10, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void sub_2429178D0(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  _BYTE *v21;
  char v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  _BYTE *v28;
  char v29;
  _BYTE *v30;
  char v31;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = &v5[-v6];
      v8 = (uint64_t)&v5[-v6 + 1];
      if (v8 >= 0)
      {
        v9 = v4 - v6;
        if (2 * v9 > v8)
          v8 = 2 * v9;
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v10 = v8;
        if (v10)
          v11 = operator new(v10);
        else
          v11 = 0;
        v19 = &v7[(_QWORD)v11];
        v20 = (char *)v11 + v10;
        v7[(_QWORD)v11] = v2;
        v18 = (uint64_t)&v7[(_QWORD)v11 + 1];
        if (v5 != (_BYTE *)v6)
        {
          v21 = &v5[~v6];
          do
          {
            v22 = *--v5;
            (v21--)[(_QWORD)v11] = v22;
          }
          while (v5 != (_BYTE *)v6);
LABEL_45:
          v5 = *(_BYTE **)(a1 + 40);
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_242729A44();
    }
    goto LABEL_22;
  }
  v5 = *(_BYTE **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v12)
    {
      v23 = *(_QWORD *)(a1 + 40);
      v24 = &v5[-v23];
      v25 = (uint64_t)&v5[-v23 + 1];
      if (v25 >= 0)
      {
        v26 = v12 - v23;
        if (2 * v26 > v25)
          v25 = 2 * v26;
        if (v26 >= 0x3FFFFFFFFFFFFFFFLL)
          v27 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
          v11 = operator new(v27);
        else
          v11 = 0;
        v19 = &v24[(_QWORD)v11];
        v20 = (char *)v11 + v27;
        v24[(_QWORD)v11] = v2;
        v18 = (uint64_t)&v24[(_QWORD)v11 + 1];
        if (v5 != (_BYTE *)v23)
        {
          v30 = &v5[~v23];
          do
          {
            v31 = *--v5;
            (v30--)[(_QWORD)v11] = v31;
          }
          while (v5 != (_BYTE *)v23);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v18 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v12)
    goto LABEL_22;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = &v5[-v13];
  v15 = (uint64_t)&v5[-v13 + 1];
  if (v15 < 0)
    goto LABEL_50;
  v16 = v12 - v13;
  if (2 * v16 > v15)
    v15 = 2 * v16;
  if (v16 >= 0x3FFFFFFFFFFFFFFFLL)
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v17 = v15;
  if (v17)
    v11 = operator new(v17);
  else
    v11 = 0;
  v19 = &v14[(_QWORD)v11];
  v20 = (char *)v11 + v17;
  v14[(_QWORD)v11] = v2;
  v18 = (uint64_t)&v14[(_QWORD)v11 + 1];
  if (v5 != (_BYTE *)v13)
  {
    v28 = &v5[~v13];
    do
    {
      v29 = *--v5;
      (v28--)[(_QWORD)v11] = v29;
    }
    while (v5 != (_BYTE *)v13);
    goto LABEL_45;
  }
LABEL_46:
  v11 = v19;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v11;
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v20;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v18;
}

std::locale *sub_242917AE8(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)off_251365488;
  v7 = a1 + 17;
  sub_2427297E4((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_242918698((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

uint64_t sub_242917B94(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)off_251365488;
  v7 = a1 + 17;
  sub_2427297E4((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_242918698((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_251365140;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return MEMORY[0x2494E8384](a1, 0x10F1C4061CF1F02);
}

void sub_242917C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v4;
  char *v5;
  char v6;
  char v7;
  std::string::size_type size;
  int v9;
  uint64_t v10;
  int v11;
  std::string::size_type v12;
  std::string *p_s;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  std::string::size_type v25;
  std::string *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  BOOL v29;
  int v30;
  size_t v31;
  char *v32;
  size_t v33;
  int v34;
  _BOOL4 v35;
  int v36;
  size_t v37;
  char *v38;
  size_t v39;
  int v40;
  BOOL v41;
  char v42;
  std::string::size_type v43;
  unsigned __int8 v44;
  unsigned __int8 *v45;
  unint64_t v46;
  int v47;
  unsigned int v48;
  char v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  std::string::size_type v60;
  std::string *v61;
  uint64_t v62;
  unsigned __int8 *v63;
  BOOL v64;
  int v65;
  size_t v66;
  char *v67;
  size_t v68;
  int v69;
  _BOOL4 v70;
  int v71;
  size_t v72;
  char *v73;
  size_t v74;
  int v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  const void *v82;
  size_t v83;
  std::string::size_type v84;
  uint64_t v85;
  BOOL j;
  unsigned __int8 **v87;
  unsigned __int8 *v88;
  int v89;
  unsigned __int8 *v90;
  uint64_t v91;
  uint64_t v92;
  const void *v93;
  size_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  const void *v100;
  size_t v101;
  std::string::size_type v102;
  uint64_t v103;
  BOOL i;
  uint64_t v105;
  uint64_t v106;
  int v107;
  unsigned __int8 *v108;
  uint64_t v109;
  unint64_t v110;
  const void *v111;
  size_t v112;
  unsigned int v113;
  int v114;
  uint64_t v115;
  int v116;
  int v117;
  uint64_t v118;
  int v119;
  int v120;
  int v121;
  char v122;
  BOOL v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  std::string __p;
  __int16 v131;
  std::string v132;
  std::string __s;

  v2 = a2;
  v4 = *(char **)(a2 + 16);
  v5 = *(char **)(a2 + 24);
  if (v4 == v5)
  {
    v10 = 0;
    v11 = *(unsigned __int8 *)(a1 + 168);
LABEL_222:
    v129 = v11;
    goto LABEL_223;
  }
  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5)
    goto LABEL_66;
  v6 = *v4;
  LOBYTE(v131) = *v4;
  v7 = v4[1];
  HIBYTE(v131) = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    LOBYTE(v131) = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v6);
    HIBYTE(v131) = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v7);
  }
  *((_BYTE *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = v131;
  __s.__r_.__value_.__s.__data_[2] = 0;
  std::__get_collation_name(&v132, (const char *)&__s);
  __p = v132;
  size = HIBYTE(v132.__r_.__value_.__r.__words[2]);
  v9 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
  if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v132.__r_.__value_.__l.__size_;
  if (size)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v12 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      goto LABEL_15;
    p_s = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 32) + 32))(&v132, *(_QWORD *)(a1 + 32), p_s, (char *)p_s + v12);
  if (v9 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v132;
  if ((SHIBYTE(v132.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(v132.__r_.__value_.__r.__words[2]) != 12 && HIBYTE(v132.__r_.__value_.__r.__words[2]) != 1)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_175;
  }
  if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
  {
LABEL_175:
    std::string::operator=(&__p, &__s);
    goto LABEL_9;
  }
  *__p.__r_.__value_.__l.__data_ = 0;
  __p.__r_.__value_.__l.__size_ = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
LABEL_15:
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_17;
LABEL_66:
    v129 = 0;
    v10 = 1;
    goto LABEL_67;
  }
  v43 = __p.__r_.__value_.__l.__size_;
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v43)
    goto LABEL_66;
LABEL_17:
  v14 = *(_QWORD *)(a1 + 112);
  v15 = *(_QWORD *)(a1 + 120) - v14;
  if (v15)
  {
    v16 = v15 >> 1;
    if ((unint64_t)(v15 >> 1) <= 1)
      v16 = 1;
    v17 = (unsigned __int8 *)(v14 + 1);
    do
    {
      if (v131 == *(v17 - 1) && HIBYTE(v131) == *v17)
        goto LABEL_250;
      v17 += 2;
      --v16;
    }
    while (v16);
  }
  v19 = a1 + 16;
  if (!*(_BYTE *)(a1 + 170) || *(_QWORD *)(a1 + 88) == *(_QWORD *)(a1 + 96))
  {
    v129 = 0;
    goto LABEL_184;
  }
  sub_24291878C((uint64_t)&__s, a1 + 16, (char *)&v131, (char *)&v132);
  v20 = *(_QWORD *)(a1 + 88);
  v21 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v22 = *(_QWORD *)(a1 + 96) - v20;
  if (v22)
  {
    v23 = 0;
    v24 = v22 / 48;
    v122 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v25 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    else
      v25 = __s.__r_.__value_.__l.__size_;
    if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v26 = &__s;
    else
      v26 = (std::string *)__s.__r_.__value_.__r.__words[0];
    if (v24 <= 1)
      v27 = 1;
    else
      v27 = v22 / 48;
    v28 = (unsigned __int8 *)(v20 + 47);
    v29 = 1;
    while (1)
    {
      v30 = (char)*(v28 - 24);
      if (v30 >= 0)
        v31 = *(v28 - 24);
      else
        v31 = *(_QWORD *)(v28 - 39);
      if (v30 >= 0)
        v32 = (char *)(v28 - 47);
      else
        v32 = *(char **)(v28 - 47);
      if (v31 >= v25)
        v33 = v25;
      else
        v33 = v31;
      v34 = memcmp(v26, v32, v33);
      v35 = v25 >= v31;
      if (v34)
        v35 = v34 >= 0;
      if (v35)
      {
        v36 = (char)*v28;
        if (v36 >= 0)
          v37 = *v28;
        else
          v37 = *(_QWORD *)(v28 - 15);
        if (v36 >= 0)
          v38 = (char *)(v28 - 23);
        else
          v38 = *(char **)(v28 - 23);
        if (v25 >= v37)
          v39 = v37;
        else
          v39 = v25;
        v40 = memcmp(v38, v26, v39);
        v41 = v37 >= v25;
        if (v40)
          v41 = v40 >= 0;
        if (v41)
          break;
      }
      v29 = ++v23 < v24;
      v28 += 48;
      if (v27 == v23)
      {
        v129 = 0;
        v42 = 1;
        goto LABEL_178;
      }
    }
    v42 = 0;
    v129 = 1;
LABEL_178:
    v19 = a1 + 16;
    v21 = v122;
  }
  else
  {
    v29 = 0;
    v129 = 0;
    v42 = 1;
  }
  if (v21 < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v29)
  {
LABEL_184:
    if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
      goto LABEL_232;
    sub_2429188D8((uint64_t)&__s, v19, (char *)&v131, (char *)&v132);
    v95 = *(_QWORD *)(a1 + 136);
    v96 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    v97 = *(_QWORD *)(a1 + 144) - v95;
    if (v97)
    {
      v98 = 0;
      v99 = v97 / 24;
      v101 = __s.__r_.__value_.__l.__size_;
      v100 = (const void *)__s.__r_.__value_.__r.__words[0];
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v102 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      else
        v102 = __s.__r_.__value_.__l.__size_;
      if (v99 <= 1)
        v103 = 1;
      else
        v103 = v97 / 24;
      for (i = 1; ; i = v98 < v99)
      {
        v105 = v95 + 24 * v98;
        v106 = *(unsigned __int8 *)(v105 + 23);
        v107 = (char)v106;
        if ((v106 & 0x80u) != 0)
          v106 = *(_QWORD *)(v105 + 8);
        if (v102 != v106)
          goto LABEL_205;
        v108 = v107 >= 0 ? (unsigned __int8 *)(v95 + 24 * v98) : *(unsigned __int8 **)v105;
        if ((v96 & 0x80) == 0)
          break;
        v128 = v95;
        v110 = v99;
        v111 = v100;
        v112 = v101;
        if (!memcmp(v100, v108, v101))
        {
          operator delete(__s.__r_.__value_.__l.__data_);
LABEL_230:
          if (!i)
          {
            v129 = 1;
            goto LABEL_232;
          }
LABEL_250:
          v121 = 1;
LABEL_251:
          v129 = v121;
LABEL_252:
          v10 = 2;
          goto LABEL_223;
        }
        ++v98;
        v101 = v112;
        v100 = v111;
        v99 = v110;
        v95 = v128;
        if (v98 == v103)
          goto LABEL_211;
LABEL_209:
        ;
      }
      if (!(_DWORD)v96)
        goto LABEL_230;
      v109 = 0;
      while (__s.__r_.__value_.__s.__data_[v109] == v108[v109])
      {
        if (v96 == ++v109)
          goto LABEL_230;
      }
LABEL_205:
      if (++v98 == v103)
        goto LABEL_210;
      goto LABEL_209;
    }
LABEL_210:
    if ((v96 & 0x80) != 0)
LABEL_211:
      operator delete(__s.__r_.__value_.__l.__data_);
LABEL_232:
    if ((char)v131 < 0)
    {
      v120 = *(_DWORD *)(a1 + 164);
    }
    else
    {
      v117 = *(_DWORD *)(a1 + 160);
      v118 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
      v119 = *(_DWORD *)(v118 + 4 * v131);
      if (((v119 & v117) != 0 || v131 == 95 && (v117 & 0x80) != 0)
        && (SHIBYTE(v131) & 0x80000000) == 0
        && ((*(_DWORD *)(v118 + 4 * HIBYTE(v131)) & v117) != 0 || (v117 & 0x80) != 0 && HIBYTE(v131) == 95))
      {
        goto LABEL_250;
      }
      v120 = *(_DWORD *)(a1 + 164);
      if ((v120 & v119) != 0 || v131 == 95 && (v120 & 0x80) != 0)
        goto LABEL_249;
    }
    if (SHIBYTE(v131) < 0)
      goto LABEL_250;
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * HIBYTE(v131)) & v120) == 0)
    {
      v121 = 1;
      if (HIBYTE(v131) != 95 || (v120 & 0x80) == 0)
        goto LABEL_251;
    }
LABEL_249:
    v121 = v129;
    goto LABEL_251;
  }
  if ((v42 & 1) == 0)
    goto LABEL_252;
  v10 = 2;
LABEL_67:
  v44 = **(_BYTE **)(v2 + 16);
  v132.__r_.__value_.__s.__data_[0] = v44;
  if (*(_BYTE *)(a1 + 169))
  {
    v44 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), (char)v44);
    v132.__r_.__value_.__s.__data_[0] = v44;
  }
  v45 = *(unsigned __int8 **)(a1 + 40);
  v46 = *(_QWORD *)(a1 + 48) - (_QWORD)v45;
  if (v46)
  {
    if (v46 <= 1)
      v46 = 1;
    do
    {
      v47 = *v45++;
      if (v47 == v44)
        goto LABEL_221;
    }
    while (--v46);
  }
  v48 = *(_DWORD *)(a1 + 164);
  if (v48 || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    if ((v44 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v44) & v48) == 0)
    {
      v50 = (v48 >> 7) & 1;
      v49 = v44 == 95 ? v50 : 0;
    }
    else
    {
      v49 = 1;
    }
    v51 = *(void **)(a1 + 72);
    v52 = memchr(*(void **)(a1 + 64), (char)v44, (size_t)v51 - *(_QWORD *)(a1 + 64));
    v53 = v52 ? v52 : v51;
    if ((v49 & 1) == 0 && v53 == v51)
    {
LABEL_221:
      v11 = 1;
      goto LABEL_222;
    }
  }
  v54 = *(_QWORD *)(a1 + 88);
  v55 = *(_QWORD *)(a1 + 96);
  if (v54 != v55)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_24291878C((uint64_t)&__s, a1 + 16, (char *)&v132, &v132.__r_.__value_.__s.__data_[1]);
      v54 = *(_QWORD *)(a1 + 88);
      v55 = *(_QWORD *)(a1 + 96);
      v56 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v56 = 1;
      *((_BYTE *)&__s.__r_.__value_.__s + 23) = 1;
      LOWORD(__s.__r_.__value_.__l.__data_) = v44;
    }
    v57 = v55 - v54;
    if (v57)
    {
      v126 = v10;
      v58 = 0;
      v59 = v57 / 48;
      v124 = v56;
      if ((v56 & 0x80u) == 0)
        v60 = v56;
      else
        v60 = __s.__r_.__value_.__l.__size_;
      if ((v56 & 0x80u) == 0)
        v61 = &__s;
      else
        v61 = (std::string *)__s.__r_.__value_.__r.__words[0];
      if (v59 <= 1)
        v62 = 1;
      else
        v62 = v57 / 48;
      v63 = (unsigned __int8 *)(v54 + 47);
      v64 = 1;
      while (1)
      {
        v65 = (char)*(v63 - 24);
        if (v65 >= 0)
          v66 = *(v63 - 24);
        else
          v66 = *(_QWORD *)(v63 - 39);
        if (v65 >= 0)
          v67 = (char *)(v63 - 47);
        else
          v67 = *(char **)(v63 - 47);
        if (v66 >= v60)
          v68 = v60;
        else
          v68 = v66;
        v69 = memcmp(v61, v67, v68);
        v70 = v60 >= v66;
        if (v69)
          v70 = v69 >= 0;
        if (v70)
        {
          v71 = (char)*v63;
          if (v71 >= 0)
            v72 = *v63;
          else
            v72 = *(_QWORD *)(v63 - 15);
          if (v71 >= 0)
            v73 = (char *)(v63 - 23);
          else
            v73 = *(char **)(v63 - 23);
          if (v60 >= v72)
            v74 = v72;
          else
            v74 = v60;
          v75 = memcmp(v73, v61, v74);
          v76 = v72 >= v60;
          if (v75)
            v76 = v75 >= 0;
          if (v76)
            break;
        }
        v64 = ++v58 < v59;
        v63 += 48;
        if (v62 == v58)
          goto LABEL_140;
      }
      v129 = 1;
LABEL_140:
      v10 = v126;
      if ((v124 & 0x80) == 0)
        goto LABEL_142;
    }
    else
    {
      v64 = 0;
      if ((v56 & 0x80) == 0)
        goto LABEL_142;
    }
    operator delete(__s.__r_.__value_.__l.__data_);
LABEL_142:
    if (v64)
      goto LABEL_223;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_216;
  sub_2429188D8((uint64_t)&__s, a1 + 16, (char *)&v132, &v132.__r_.__value_.__s.__data_[1]);
  v77 = *(_QWORD *)(a1 + 136);
  v78 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v79 = *(_QWORD *)(a1 + 144) - v77;
  if (!v79)
  {
    if ((*((_BYTE *)&__s.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__s.__r_.__value_.__l.__data_);
LABEL_216:
    if (v132.__r_.__value_.__s.__data_[0] < 0)
      goto LABEL_223;
    v113 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4
                                                               * v132.__r_.__value_.__s.__data_[0]) & v113) == 0)
    {
      v114 = (v113 >> 7) & 1;
      if (v132.__r_.__value_.__s.__data_[0] != 95)
        v114 = 0;
      if (v114 != 1)
        goto LABEL_223;
    }
    goto LABEL_221;
  }
  v127 = v10;
  v80 = 0;
  v81 = v79 / 24;
  v83 = __s.__r_.__value_.__l.__size_;
  v82 = (const void *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v84 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    v84 = __s.__r_.__value_.__l.__size_;
  if (v81 <= 1)
    v85 = 1;
  else
    v85 = v79 / 24;
  for (j = 1; ; j = v80 < v81)
  {
    v87 = (unsigned __int8 **)(v77 + 24 * v80);
    v88 = (unsigned __int8 *)*((unsigned __int8 *)v87 + 23);
    v89 = (char)v88;
    if ((char)v88 < 0)
      v88 = v87[1];
    if ((unsigned __int8 *)v84 == v88)
      break;
LABEL_164:
    if (++v80 == v85)
    {
      if ((v78 & 0x80) != 0)
LABEL_214:
        operator delete(__s.__r_.__value_.__l.__data_);
      v10 = v127;
      goto LABEL_216;
    }
LABEL_168:
    ;
  }
  if (v89 >= 0)
    v90 = (unsigned __int8 *)(v77 + 24 * v80);
  else
    v90 = *v87;
  if ((v78 & 0x80) == 0)
  {
    if (!(_DWORD)v78)
    {
LABEL_169:
      v129 = 1;
      v10 = v127;
      if (!j)
        goto LABEL_216;
      goto LABEL_223;
    }
    v91 = 0;
    while (__s.__r_.__value_.__s.__data_[v91] == v90[v91])
    {
      if (v78 == ++v91)
        goto LABEL_169;
    }
    goto LABEL_164;
  }
  v123 = j;
  v125 = v2;
  v92 = v77;
  v93 = v82;
  v94 = v83;
  if (memcmp(v82, v90, v83))
  {
    ++v80;
    v83 = v94;
    v82 = v93;
    v77 = v92;
    v2 = v125;
    if (v80 == v85)
      goto LABEL_214;
    goto LABEL_168;
  }
  operator delete(__s.__r_.__value_.__l.__data_);
  v129 = 1;
  v2 = v125;
  v10 = v127;
  if (!v123)
    goto LABEL_216;
LABEL_223:
  if (v129 == *(unsigned __int8 *)(a1 + 168))
  {
    v115 = 0;
    v116 = -993;
  }
  else
  {
    *(_QWORD *)(v2 + 16) += v10;
    v115 = *(_QWORD *)(a1 + 8);
    v116 = -995;
  }
  *(_DWORD *)v2 = v116;
  *(_QWORD *)(v2 + 80) = v115;
}

void sub_24291865C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

void sub_242918698(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_242918708(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_242918708(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t sub_24291874C(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_24291878C(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v5;
  void **v6;
  void *__p[2];
  unsigned __int8 v8;

  sub_242918834(__p, a3, a4, a4 - a3);
  v5 = v8;
  if ((v8 & 0x80u) == 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if ((v8 & 0x80u) != 0)
    v5 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void sub_242918818(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_242918834(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_242729920();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void sub_2429188D8(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_242918834(__p, a3, a4, a4 - a3);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a1 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a1 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a1;
      else
        v10 = *(_BYTE **)a1;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_2429189BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2429189D8()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242918A10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_242918A24(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (&a2[i] == a3)
LABEL_15:
    sub_2429189D8();
  sub_2429192A0((uint64_t)&v10, a1, a2, &a2[i]);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    sub_242919254();
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_242918B0C(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this, uint64_t a5)
{
  int v7;
  int v8;
  int v9;
  char v10;
  char v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  std::string::value_type v15;
  std::string *v16;
  unint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  void *v25;
  unint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  unint64_t v29;
  size_t v30;
  _BYTE *v31;
  uint64_t v32;
  char *v33;
  _BYTE *v34;
  char v35;
  unint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  unint64_t v39;
  size_t v40;
  char *v41;
  char *v42;
  _BYTE *v43;
  char v44;
  _BYTE *v45;
  char v46;

  if (a2 == (unsigned __int8 *)a3)
    sub_242916A20();
  v7 = (char)*a2;
  if (v7 <= 97)
  {
    if (v7 <= 82)
    {
      if (*a2)
      {
        if (v7 == 68)
        {
          v8 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_23:
          *(_DWORD *)(a5 + 164) = v8;
          return a2 + 1;
        }
        return sub_242916A6C(a1, a2, a3, this);
      }
      v15 = 0;
      v16 = this;
      goto LABEL_21;
    }
    if (v7 == 83)
    {
      v8 = *(_DWORD *)(a5 + 164) | 0x4000;
      goto LABEL_23;
    }
    if (v7 != 87)
      return sub_242916A6C(a1, a2, a3, this);
    *(_DWORD *)(a5 + 164) |= 0x500u;
    if (*(_BYTE *)(a5 + 169))
    {
      v10 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a5 + 24) + 40))(*(_QWORD *)(a5 + 24), 95);
      v11 = v10;
      v13 = *(_BYTE **)(a5 + 72);
      v12 = *(_QWORD *)(a5 + 80);
      if ((unint64_t)v13 < v12)
      {
        *v13 = v10;
        v14 = (uint64_t)(v13 + 1);
LABEL_55:
        *(_QWORD *)(a5 + 72) = v14;
        return a2 + 1;
      }
      v26 = *(_QWORD *)(a5 + 64);
      v27 = &v13[-v26];
      v28 = (uint64_t)&v13[-v26 + 1];
      if (v28 >= 0)
      {
        v29 = v12 - v26;
        if (2 * v29 > v28)
          v28 = 2 * v29;
        if (v29 >= 0x3FFFFFFFFFFFFFFFLL)
          v30 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v30 = v28;
        if (v30)
          v31 = operator new(v30);
        else
          v31 = 0;
        v33 = &v31[v30];
        v27[(_QWORD)v31] = v11;
        v14 = (uint64_t)&v27[(_QWORD)v31 + 1];
        if (v13 == (_BYTE *)v26)
        {
          v31 = &v27[(_QWORD)v31];
        }
        else
        {
          v34 = &v13[~v26];
          do
          {
            v35 = *--v13;
            (v34--)[(_QWORD)v31] = v35;
          }
          while (v13 != (_BYTE *)v26);
          v13 = *(_BYTE **)(a5 + 64);
        }
        *(_QWORD *)(a5 + 64) = v31;
        *(_QWORD *)(a5 + 72) = v14;
        *(_QWORD *)(a5 + 80) = v33;
        if (v13)
          operator delete(v13);
        goto LABEL_55;
      }
LABEL_80:
      sub_242729A44();
    }
    v19 = *(_BYTE **)(a5 + 72);
    v18 = *(_QWORD *)(a5 + 80);
    if (*(_BYTE *)(a5 + 170))
    {
      if ((unint64_t)v19 >= v18)
      {
        v20 = *(_QWORD *)(a5 + 64);
        v21 = &v19[-v20];
        v22 = (uint64_t)&v19[-v20 + 1];
        if (v22 < 0)
          goto LABEL_80;
        v23 = v18 - v20;
        if (2 * v23 > v22)
          v22 = 2 * v23;
        if (v23 >= 0x3FFFFFFFFFFFFFFFLL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
          v25 = operator new(v24);
        else
          v25 = 0;
        v41 = &v21[(_QWORD)v25];
        v42 = (char *)v25 + v24;
        v21[(_QWORD)v25] = 95;
        v32 = (uint64_t)&v21[(_QWORD)v25 + 1];
        if (v19 != (_BYTE *)v20)
        {
          v43 = &v19[~v20];
          do
          {
            v44 = *--v19;
            (v43--)[(_QWORD)v25] = v44;
          }
          while (v19 != (_BYTE *)v20);
LABEL_73:
          v19 = *(_BYTE **)(a5 + 64);
          goto LABEL_75;
        }
        goto LABEL_74;
      }
    }
    else if ((unint64_t)v19 >= v18)
    {
      v36 = *(_QWORD *)(a5 + 64);
      v37 = &v19[-v36];
      v38 = (uint64_t)&v19[-v36 + 1];
      if (v38 < 0)
        goto LABEL_80;
      v39 = v18 - v36;
      if (2 * v39 > v38)
        v38 = 2 * v39;
      if (v39 >= 0x3FFFFFFFFFFFFFFFLL)
        v40 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v40 = v38;
      if (v40)
        v25 = operator new(v40);
      else
        v25 = 0;
      v41 = &v37[(_QWORD)v25];
      v42 = (char *)v25 + v40;
      v37[(_QWORD)v25] = 95;
      v32 = (uint64_t)&v37[(_QWORD)v25 + 1];
      if (v19 != (_BYTE *)v36)
      {
        v45 = &v19[~v36];
        do
        {
          v46 = *--v19;
          (v45--)[(_QWORD)v25] = v46;
        }
        while (v19 != (_BYTE *)v36);
        goto LABEL_73;
      }
LABEL_74:
      v25 = v41;
LABEL_75:
      *(_QWORD *)(a5 + 64) = v25;
      *(_QWORD *)(a5 + 72) = v32;
      *(_QWORD *)(a5 + 80) = v42;
      if (v19)
        operator delete(v19);
      goto LABEL_77;
    }
    *v19 = 95;
    v32 = (uint64_t)(v19 + 1);
LABEL_77:
    *(_QWORD *)(a5 + 72) = v32;
    return a2 + 1;
  }
  if (v7 <= 114)
  {
    if (v7 == 98)
    {
      v16 = this;
      v15 = 8;
LABEL_21:
      std::string::operator=(v16, v15);
      return a2 + 1;
    }
    if (v7 != 100)
      return sub_242916A6C(a1, a2, a3, this);
    v9 = *(_DWORD *)(a5 + 160) | 0x400;
LABEL_25:
    *(_DWORD *)(a5 + 160) = v9;
    return a2 + 1;
  }
  if (v7 == 115)
  {
    v9 = *(_DWORD *)(a5 + 160) | 0x4000;
    goto LABEL_25;
  }
  if (v7 != 119)
    return sub_242916A6C(a1, a2, a3, this);
  *(_DWORD *)(a5 + 160) |= 0x500u;
  sub_2429178D0(a5, 95);
  return a2 + 1;
}

char *sub_242918E74(uint64_t a1, char *a2, char *a3, std::string *this)
{
  uint64_t v5;
  std::string *v6;
  std::string::value_type v7;
  char *v8;
  char v9;
  int v10;
  std::string::value_type v11;

  if (a2 == a3)
LABEL_52:
    sub_242916A20();
  v5 = *a2;
  if ((int)v5 > 97)
  {
    switch((int)v5)
    {
      case 'n':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        v5 = 10;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }
        v5 = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        v5 = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        v5 = 11;
        goto LABEL_49;
      default:
        if ((_DWORD)v5 == 98)
        {
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          v5 = 8;
        }
        else
        {
          if ((_DWORD)v5 != 102)
            goto LABEL_21;
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          v5 = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if ((int)v5 > 91)
  {
    if ((_DWORD)v5 != 92)
    {
      if ((_DWORD)v5 != 97)
        goto LABEL_21;
      if (this)
      {
        v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      v5 = 7;
LABEL_49:
      sub_242916D18(a1, v5);
      return a2 + 1;
    }
LABEL_14:
    if (this)
    {
      v6 = this;
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if ((_DWORD)v5 == 34 || (_DWORD)v5 == 47)
    goto LABEL_14;
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30)
    goto LABEL_52;
  v7 = v5 - 48;
  v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30)
      goto LABEL_39;
    v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      goto LABEL_39;
    }
  }
  v8 = a3;
LABEL_39:
  if (this)
    std::string::operator=(this, v7);
  else
    sub_242916D18(a1, v7);
  return v8;
}

void sub_24291904C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  _WORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _WORD *v24;
  _WORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;

  if (!*(_BYTE *)(a1 + 169))
  {
    v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v8 = *(_WORD **)(a1 + 120);
    v16 = *(_QWORD *)(a1 + 128);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v8 < v16)
        goto LABEL_24;
      v17 = *(_QWORD *)(a1 + 112);
      v18 = (uint64_t)v8 - v17;
      if ((uint64_t)v8 - v17 > -3)
      {
        v19 = v18 >> 1;
        v20 = v16 - v17;
        if (v20 <= (v18 >> 1) + 1)
          v21 = v19 + 1;
        else
          v21 = v20;
        if (v20 >= 0x7FFFFFFFFFFFFFFELL)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        if (v22)
          v22 = (uint64_t)sub_242919784(v22);
        else
          v23 = 0;
        v25 = (_WORD *)(v22 + 2 * v19);
        v26 = v22 + 2 * v23;
        *v25 = v6;
        v24 = v25 + 1;
        v37 = *(char **)(a1 + 112);
        v27 = *(char **)(a1 + 120);
        if (v27 == v37)
          goto LABEL_46;
        do
        {
          v38 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--v25 = v38;
        }
        while (v27 != v37);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v8 < v16)
        goto LABEL_24;
      v30 = *(_QWORD *)(a1 + 112);
      v31 = (uint64_t)v8 - v30;
      if ((uint64_t)v8 - v30 > -3)
      {
        v32 = v31 >> 1;
        v33 = v16 - v30;
        if (v33 <= (v31 >> 1) + 1)
          v34 = v32 + 1;
        else
          v34 = v33;
        if (v33 >= 0x7FFFFFFFFFFFFFFELL)
          v35 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v35 = v34;
        if (v35)
          v35 = (uint64_t)sub_242919784(v35);
        else
          v36 = 0;
        v25 = (_WORD *)(v35 + 2 * v32);
        v26 = v35 + 2 * v36;
        *v25 = v6;
        v24 = v25 + 1;
        v39 = *(char **)(a1 + 112);
        v27 = *(char **)(a1 + 120);
        if (v27 == v39)
          goto LABEL_46;
        do
        {
          v40 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--v25 = v40;
        }
        while (v27 != v39);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_242729A44();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3) << 8);
  v8 = *(_WORD **)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  if ((unint64_t)v8 < v7)
  {
LABEL_24:
    *v8 = v6;
    v24 = v8 + 1;
    goto LABEL_48;
  }
  v9 = *(_QWORD *)(a1 + 112);
  v10 = (uint64_t)v8 - v9;
  if ((uint64_t)v8 - v9 <= -3)
    goto LABEL_49;
  v11 = v10 >> 1;
  v12 = v7 - v9;
  if (v12 <= (v10 >> 1) + 1)
    v13 = v11 + 1;
  else
    v13 = v12;
  if (v12 >= 0x7FFFFFFFFFFFFFFELL)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = v13;
  if (v14)
    v14 = (uint64_t)sub_242919784(v14);
  else
    v15 = 0;
  v25 = (_WORD *)(v14 + 2 * v11);
  v26 = v14 + 2 * v15;
  *v25 = v6;
  v24 = v25 + 1;
  v28 = *(char **)(a1 + 112);
  v27 = *(char **)(a1 + 120);
  if (v27 == v28)
    goto LABEL_46;
  do
  {
    v29 = *((_WORD *)v27 - 1);
    v27 -= 2;
    *--v25 = v29;
  }
  while (v27 != v28);
LABEL_45:
  v27 = *(char **)(a1 + 112);
LABEL_46:
  *(_QWORD *)(a1 + 112) = v25;
  *(_QWORD *)(a1 + 120) = v24;
  *(_QWORD *)(a1 + 128) = v26;
  if (v27)
    operator delete(v27);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v24;
}

void sub_242919254()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24291928C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2429192A0(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_242918834(&__s, a3, a4, a4 - a3);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a1 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a1 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v13, *(_QWORD *)(a2 + 16), v10, (char *)v10 + size);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  *(std::string *)a1 = v13;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a1 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a1 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a1, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_24291940C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_242919440()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242919478(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24291948C(_QWORD *result, __int128 *a2)
{
  char **v3;
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  char *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  int64x2_t v20;
  char *v21;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  _QWORD *v25;

  v3 = (char **)result;
  v4 = result[2];
  v5 = result[1];
  if (v5 >= v4)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *result) >> 4);
    v10 = v9 + 1;
    if (v9 + 1 > 0x555555555555555)
      sub_242729A44();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *result) >> 4);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x2AAAAAAAAAAAAAALL)
      v12 = 0x555555555555555;
    else
      v12 = v10;
    v25 = result + 2;
    if (v12)
    {
      if (v12 > 0x555555555555555)
        sub_2427299A8();
      v13 = (char *)operator new(48 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[48 * v9];
    *((_QWORD *)v14 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v14 = *a2;
    v15 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)a2 + 2) = 0;
    *((_QWORD *)a2 + 3) = 0;
    *(_QWORD *)a2 = 0;
    *((_QWORD *)a2 + 1) = 0;
    *(_OWORD *)(v14 + 24) = v15;
    *((_QWORD *)v14 + 5) = *((_QWORD *)a2 + 5);
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    v8 = v14 + 48;
    v16 = *v3;
    v17 = (unint64_t)v3[1];
    if ((char *)v17 == *v3)
    {
      v20 = vdupq_n_s64(v17);
    }
    else
    {
      do
      {
        v18 = *(_OWORD *)(v17 - 48);
        *((_QWORD *)v14 - 4) = *(_QWORD *)(v17 - 32);
        *((_OWORD *)v14 - 3) = v18;
        *(_QWORD *)(v17 - 40) = 0;
        *(_QWORD *)(v17 - 32) = 0;
        *(_QWORD *)(v17 - 48) = 0;
        v19 = *(_OWORD *)(v17 - 24);
        *((_QWORD *)v14 - 1) = *(_QWORD *)(v17 - 8);
        *(_OWORD *)(v14 - 24) = v19;
        v14 -= 48;
        *(_QWORD *)(v17 - 16) = 0;
        *(_QWORD *)(v17 - 8) = 0;
        *(_QWORD *)(v17 - 24) = 0;
        v17 -= 48;
      }
      while ((char *)v17 != v16);
      v20 = *(int64x2_t *)v3;
    }
    *v3 = v14;
    v3[1] = v8;
    v23 = v20;
    v21 = v3[2];
    v3[2] = &v13[48 * v12];
    v24 = v21;
    v22 = v20.i64[0];
    result = (_QWORD *)sub_242919738((uint64_t)&v22);
  }
  else
  {
    v6 = *a2;
    *(_QWORD *)(v5 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v5 = v6;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v7 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v5 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v5 + 24) = v7;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v8 = (char *)(v5 + 48);
  }
  v3[1] = v8;
  return result;
}

void sub_242919644(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v5;
  void **v6;
  void *__p[2];
  unsigned __int8 v8;

  sub_242918834(__p, a3, a4, a4 - a3);
  v5 = v8;
  if ((v8 & 0x80u) == 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if ((v8 & 0x80u) != 0)
    v5 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void sub_2429196D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2429196EC()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242919724(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_242919738(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    sub_242918708(i - 48);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *sub_242919784(uint64_t a1)
{
  if (a1 < 0)
    sub_2427299A8();
  return operator new(2 * a1);
}

_QWORD *sub_2429197B4(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_2429197F4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242919844(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_242919874(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_2429198B4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242919904(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_24291993C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, char a7)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _QWORD *result;

  v14 = (_QWORD *)operator new();
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(v15 + 8);
  *v14 = &off_2513650C8;
  v14[1] = v16;
  *(_QWORD *)(v15 + 8) = 0;
  v17 = operator new();
  v18 = *(_DWORD *)(a1 + 32);
  v19 = *(_QWORD *)(a4 + 8);
  *(_QWORD *)v17 = &off_251365560;
  *(_QWORD *)(v17 + 8) = v19;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = a2;
  *(_QWORD *)(v17 + 32) = a3;
  *(_DWORD *)(v17 + 40) = v18;
  *(_DWORD *)(v17 + 44) = a5;
  *(_DWORD *)(v17 + 48) = a6;
  *(_BYTE *)(v17 + 52) = a7;
  *(_QWORD *)(a4 + 8) = 0;
  result = (_QWORD *)operator new();
  *result = &off_2513655F0;
  result[1] = v17;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = result;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(v17 + 16);
  *(_QWORD *)(a4 + 8) = v17;
  ++*(_DWORD *)(a1 + 32);
  return result;
}

void sub_242919A50(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_242919A78(unsigned __int8 *result, unsigned __int8 *a2, int *a3)
{
  int v3;
  int v4;
  int v5;

  if (result != a2)
  {
    v3 = *result;
    if ((v3 & 0xF8) == 0x30 || (v3 & 0xFE) == 0x38)
    {
      v4 = v3 - 48;
      *a3 = v4;
      if (++result == a2)
      {
        return a2;
      }
      else
      {
        while (1)
        {
          v5 = *result;
          if ((v5 & 0xF8) != 0x30 && (v5 & 0xFE) != 0x38)
            break;
          if (v4 >= 214748364)
            sub_242919B10();
          v4 = v5 + 10 * v4 - 48;
          *a3 = v4;
          if (++result == a2)
            return a2;
        }
      }
    }
  }
  return result;
}

void sub_242919B10()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242919B48(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_242919B5C()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_242919B94(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_242919BA8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_2513655C0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &off_251365140;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_242919C08(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_2513655C0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &off_251365140;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  JUMPOUT(0x2494E8384);
}

unsigned int *sub_242919C78(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return sub_242919E2C(result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *sub_242919D2C(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return sub_242919E2C(result, a3);
  }
  return result;
}

_QWORD *sub_242919D5C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_2513655C0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &off_251365140;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_242919DBC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_2513655C0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &off_251365140;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  JUMPOUT(0x2494E8384);
}

unsigned int *sub_242919E2C(unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = (_BYTE *)(a2[4] + 24 * v4 + 16);
    do
    {
      *((_QWORD *)v7 - 2) = v5;
      *((_QWORD *)v7 - 1) = v5;
      *v7 = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_242919E80()
{
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242919E94(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_242919EA8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_2513655C0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &off_251365140;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_242919F08(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_2513655C0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &off_251365140;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  JUMPOUT(0x2494E8384);
}

void sub_242919F78(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_242919F84(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void sub_242919FAC()
{
  JUMPOUT(0x2494E8384);
}

uint64_t sub_242919FC0(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_242919FD4()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x2494E8210](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24291A00C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_24291A020(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  uint64_t v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  char *v10;
  char *v11;
  int v12;
  uint64_t v13;
  int v14;
  char *v15;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  unsigned __int8 *v25;
  char *v26;
  int v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v33;
  int v34;

  v3 = a2;
  if (a2 != a3)
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_DWORD *)(a1 + 28);
    v9 = (unsigned __int8 *)(a2 + 1);
    v8 = *a2;
    if (a2 + 1 != a3 || v8 != 36)
    {
      if ((v8 - 46) > 0x2E || ((1 << (v8 - 46)) & 0x600000000001) == 0)
      {
        sub_242916D18(a1, (char)v8);
        goto LABEL_32;
      }
      if (v9 == (unsigned __int8 *)a3 || v8 != 92)
      {
        if (v8 == 46)
        {
          v18 = (_QWORD *)operator new();
          v19 = *(_QWORD *)(a1 + 56);
          v20 = *(_QWORD *)(v19 + 8);
          *v18 = &off_2513656C8;
          v18[1] = v20;
          *(_QWORD *)(v19 + 8) = v18;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          goto LABEL_32;
        }
      }
      else
      {
        v17 = (char)*v9;
        if ((v17 - 36) <= 0x3A && ((1 << (v17 - 36)) & 0x580000000000441) != 0)
        {
          sub_242916D18(a1, (char)v17);
          v9 = (unsigned __int8 *)(v3 + 2);
          goto LABEL_32;
        }
      }
    }
    v10 = sub_242915C38(a1, a2, a3);
    v11 = v10;
    if (v10 == v3 && v10 != a3)
    {
      if (v9 == (unsigned __int8 *)a3 || *v3 != 92)
        return v3;
      v12 = *v9;
      if (v12 == 40)
      {
        v13 = (uint64_t)(v3 + 2);
        sub_24291686C(a1);
        v14 = *(_DWORD *)(a1 + 28);
        do
        {
          v15 = (char *)v13;
          v13 = sub_24291A020(a1, v13, a3);
        }
        while ((char *)v13 != v15);
        if (v15 == a3 || v15 + 1 == a3 || *v15 != 92 || v15[1] != 41)
          sub_2429148B0();
        v11 = v15 + 2;
        sub_2429168DC(a1, v14);
      }
      else
      {
        v21 = sub_24291A46C(a1, v12);
        v22 = 2;
        if (!v21)
          v22 = 0;
        v11 = &v3[v22];
      }
    }
    v9 = (unsigned __int8 *)v11;
    if (v11 != v3)
    {
LABEL_32:
      if (v9 == (unsigned __int8 *)a3)
        return a3;
      v23 = *(_DWORD *)(a1 + 28) + 1;
      v24 = *v9;
      if (v24 == 42)
      {
        sub_24291993C(a1, 0, -1, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1, 1);
        return (char *)(v9 + 1);
      }
      if (v9 + 1 == (unsigned __int8 *)a3 || v24 != 92 || v9[1] != 123)
        return (char *)v9;
      v34 = 0;
      v25 = sub_242919A78(v9 + 2, (unsigned __int8 *)a3, &v34);
      if (v25 == v9 + 2)
LABEL_48:
        sub_242919B10();
      if (v25 != (unsigned __int8 *)a3)
      {
        v26 = (char *)(v25 + 1);
        v27 = *v25;
        if (v27 == 44)
        {
          v33 = -1;
          v28 = sub_242919A78(v25 + 1, (unsigned __int8 *)a3, &v33);
          if (v28 != (unsigned __int8 *)a3 && v28 + 1 != (unsigned __int8 *)a3 && *v28 == 92 && v28[1] == 125)
          {
            v30 = v33;
            v29 = v34;
            if (v33 == -1)
            {
              v30 = -1;
            }
            else if (v33 < v34)
            {
              goto LABEL_48;
            }
            v3 = (char *)&v28[2 * (v28[1] == 125)];
            v31 = a1;
LABEL_56:
            sub_24291993C(v31, v29, v30, v6, v7 + 1, v23, 1);
            return v3;
          }
        }
        else if (v26 != a3 && v27 == 92 && *v26 == 125)
        {
          v3 = (char *)(v25 + 2);
          v29 = v34;
          v31 = a1;
          v30 = v34;
          goto LABEL_56;
        }
      }
      sub_242919B5C();
    }
  }
  return v3;
}

_QWORD *sub_24291A39C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_251365140;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_24291A3DC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_251365140;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x2494E8384);
}

uint64_t sub_24291A42C(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_24291A46C(uint64_t a1, unsigned __int8 a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > *(_DWORD *)(a1 + 28))
    sub_242916E8C();
  sub_242916ED8(a1, a2 - 48);
  return 1;
}

unsigned __int8 *sub_24291A4C8(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = sub_24291A524(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    sub_242919FD4();
  do
  {
    v7 = v6;
    v6 = sub_24291A524(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_24291A524(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  int v12;
  signed __int8 v13;
  char *v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (**v25)();
  int v26;
  char *v27;
  char *v28;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  if (a2 == a3)
  {
LABEL_24:
    v14 = sub_242915C38(a1, a2, a3);
    goto LABEL_25;
  }
  v8 = *a2;
  v9 = *a2;
  v10 = (v8 - 36);
  if (v10 > 0x3A)
    goto LABEL_13;
  if (((1 << (v8 - 36)) & 0x5800000080004D1) == 0)
  {
    if (v10 == 5)
    {
      if (*(_DWORD *)(a1 + 36))
        goto LABEL_4;
LABEL_14:
      sub_242916D18(a1, (char)v9);
LABEL_33:
      v11 = (unsigned __int8 *)(a2 + 1);
      return sub_242914474(a1, v11, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
    }
LABEL_13:
    if ((v8 - 123) < 2)
      goto LABEL_4;
    goto LABEL_14;
  }
LABEL_4:
  v11 = (unsigned __int8 *)(a2 + 1);
  if (a2 + 1 == a3 || v9 != 92)
  {
LABEL_22:
    if (v9 == 46)
    {
      v17 = (_QWORD *)operator new();
      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(_QWORD *)(v18 + 8);
      *v17 = &off_2513656C8;
      v17[1] = v19;
      *(_QWORD *)(v18 + 8) = v17;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return sub_242914474(a1, v11, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
    }
    goto LABEL_24;
  }
  v12 = (char)*v11;
  v13 = *v11;
  if ((v12 - 36) <= 0x3A && ((1 << (v12 - 36)) & 0x5800000080004F1) != 0
    || (v12 - 123) < 3)
  {
    sub_242916D18(a1, v13);
    v11 = (unsigned __int8 *)(a2 + 2);
    return sub_242914474(a1, v11, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
  {
    v14 = sub_242918E74(a1, a2 + 1, a3, 0);
  }
  else
  {
    v15 = sub_24291A46C(a1, v13);
    v16 = 2;
    if (!v15)
      v16 = 0;
    v14 = &a2[v16];
  }
  if (v14 == a2)
  {
    v9 = *a2;
    goto LABEL_22;
  }
LABEL_25:
  if (v14 != a2 || v14 == a3)
    goto LABEL_37;
  v20 = *a2;
  switch(v20)
  {
    case '$':
      v21 = operator new();
      v22 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(v23 + 8);
      v25 = &off_2513651B8;
      goto LABEL_32;
    case '(':
      sub_24291686C(a1);
      v26 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v27 = (char *)sub_242913A5C(a1, a2 + 1, a3);
      if (v27 == a3 || (v28 = v27, *v27 != 41))
        sub_2429148B0();
      sub_2429168DC(a1, v26);
      --*(_DWORD *)(a1 + 36);
      v14 = v28 + 1;
LABEL_37:
      v11 = (unsigned __int8 *)v14;
      if (v14 != a2)
        return sub_242914474(a1, v11, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
      return (unsigned __int8 *)a2;
    case '^':
      v21 = operator new();
      v22 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(v23 + 8);
      v25 = &off_251365170;
LABEL_32:
      *(_QWORD *)v21 = v25;
      *(_QWORD *)(v21 + 8) = v24;
      *(_BYTE *)(v21 + 16) = v22;
      *(_QWORD *)(v23 + 8) = v21;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      goto LABEL_33;
  }
  return (unsigned __int8 *)a2;
}

void sub_24291A848(uint64_t a1, __n128 *a2, uint64_t **a3, uint64_t a4, char a5)
{
  uint64_t v9;
  __n128 *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __n128 v15;
  __int128 v16;
  __int128 v17;
  BOOL v18;
  uint64_t v19;
  __n128 v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  _BOOL4 v24;
  BOOL v25;
  unint64_t v26;
  __n128 v27;
  __n128 v28;
  __int128 v29;
  BOOL v30;
  _BOOL4 v31;
  __int8 *v32;
  __int128 v33;
  __n128 v34;
  BOOL v35;
  __n128 v36;
  BOOL v37;
  BOOL v38;
  __n128 *v39;
  _BOOL4 v40;
  unint64_t v41;
  BOOL v42;
  __n128 v43;
  __n128 v44;
  __int128 v45;
  _BOOL4 v46;
  BOOL v47;
  __int8 *v48;
  __int128 v49;
  __n128 v50;
  _BOOL4 v51;
  __n128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL4 v59;
  __n128 v60;
  uint64_t v61;
  uint64_t v62;
  void **v63;
  BOOL v64;
  uint64_t v65;
  __n128 v66;
  __n128 *v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  _BOOL4 v74;
  uint64_t v75;
  BOOL v76;
  __n128 v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  _BOOL4 v81;
  _BOOL4 v82;
  __n128 v83;
  int64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BOOL4 v90;
  __n128 v91;
  __n128 v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  _BOOL4 v97;
  uint64_t v98;
  __n128 v99;
  uint64_t v100;
  __int128 v101;
  BOOL v102;
  __n128 v103;
  uint64_t v105;
  uint64_t i;
  uint64_t v107;
  _BOOL4 v108;
  __n128 v109;
  uint64_t v110;
  void **v111;
  BOOL v112;
  int v113;
  uint64_t v114;
  __n128 v115;
  uint64_t v116;
  int64_t v117;
  __n128 *v118;
  uint64_t v119;
  int64_t v120;
  unint64_t v121;
  __n128 *v122;
  unsigned __int8 v123;
  __n128 v124;
  unint64_t v125;
  void *__p[2];
  char v127;
  void *v128[2];
  unint64_t v129;
  _QWORD v130[3];

  v130[2] = *MEMORY[0x24BDAC8D0];
LABEL_2:
  v9 = (uint64_t)&a2[-2].n128_i64[1];
  v119 = (uint64_t)&a2[-3];
  v122 = a2;
  v116 = (uint64_t)&a2[-5].n128_i64[1];
  v10 = (__n128 *)a1;
  while (2)
  {
    a1 = (uint64_t)v10;
    v11 = (char *)v122 - (char *)v10;
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v122 - (char *)v10) >> 3);
    switch(v12)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        sub_24291C410(v128, **a3, v9);
        sub_24291C410(__p, **a3, a1);
        v51 = sub_24272A620(v128, __p);
        if (v127 < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v129) < 0)
          operator delete(v128[0]);
        if (v51)
        {
          v52 = *(__n128 *)a1;
          v129 = *(_QWORD *)(a1 + 16);
          *(__n128 *)v128 = v52;
          v53 = *(_OWORD *)v9;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v9 + 16);
          *(_OWORD *)a1 = v53;
          v54 = *(_OWORD *)v128;
          *(_QWORD *)(v9 + 16) = v129;
          *(_OWORD *)v9 = v54;
        }
        return;
      case 3uLL:
        sub_24291BDCC((__n128 *)a1, a1 + 24, v9, a3);
        return;
      case 4uLL:
        sub_24291E094((__n128 *)a1, a1 + 24, a1 + 48, v9, a3);
        return;
      case 5uLL:
        sub_24291BB44((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, v9, a3);
        return;
      default:
        if (v11 <= 575)
        {
          if ((a5 & 1) != 0)
          {
            if ((__n128 *)a1 == v122)
              return;
            v55 = a1 + 24;
            if ((__n128 *)(a1 + 24) == v122)
              return;
            v56 = 0;
            v57 = a1;
            while (1)
            {
              v58 = v55;
              sub_24291C410(v128, **a3, v55);
              sub_24291C410(__p, **a3, v57);
              v59 = sub_24272A620(v128, __p);
              if (v127 < 0)
                operator delete(__p[0]);
              if (SHIBYTE(v129) < 0)
              {
                operator delete(v128[0]);
                if (v59)
                {
LABEL_134:
                  v60 = *(__n128 *)v58;
                  v125 = *(_QWORD *)(v58 + 16);
                  v124 = v60;
                  *(_QWORD *)(v58 + 8) = 0;
                  *(_QWORD *)(v58 + 16) = 0;
                  *(_QWORD *)v58 = 0;
                  v61 = v56;
                  do
                  {
                    v62 = a1 + v61;
                    v63 = (void **)(a1 + v61 + 24);
                    if (*(char *)(a1 + v61 + 47) < 0)
                      operator delete(*v63);
                    *(_OWORD *)v63 = *(_OWORD *)v62;
                    *(_QWORD *)(a1 + v61 + 40) = *(_QWORD *)(v62 + 16);
                    *(_BYTE *)(v62 + 23) = 0;
                    *(_BYTE *)v62 = 0;
                    if (!v61)
                    {
                      v65 = a1;
                      goto LABEL_146;
                    }
                    sub_24291C410(v128, **a3, (uint64_t)&v124);
                    sub_24291C410(__p, **a3, a1 + v61 - 24);
                    v64 = sub_24272A620(v128, __p);
                    if (v127 < 0)
                      operator delete(__p[0]);
                    if (SHIBYTE(v129) < 0)
                      operator delete(v128[0]);
                    v61 -= 24;
                  }
                  while (v64);
                  v65 = a1 + v61 + 24;
                  if (*(char *)(a1 + v61 + 47) < 0)
                    operator delete(*(void **)v65);
LABEL_146:
                  v66 = v124;
                  *(_QWORD *)(v65 + 16) = v125;
                  *(__n128 *)v65 = v66;
                }
              }
              else if (v59)
              {
                goto LABEL_134;
              }
              v55 = v58 + 24;
              v56 += 24;
              v57 = v58;
              if ((__n128 *)(v58 + 24) == v122)
                return;
            }
          }
          if ((__n128 *)a1 == v122)
            return;
          v105 = a1 + 24;
          if ((__n128 *)(a1 + 24) == v122)
            return;
          for (i = a1 - 24; ; i += 24)
          {
            v107 = v105;
            sub_24291C410(v128, **a3, v105);
            sub_24291C410(__p, **a3, a1);
            v108 = sub_24272A620(v128, __p);
            if (v127 < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v129) < 0)
            {
              operator delete(v128[0]);
              if (v108)
              {
LABEL_231:
                v109 = *(__n128 *)v107;
                v125 = *(_QWORD *)(v107 + 16);
                v124 = v109;
                *(_QWORD *)(v107 + 8) = 0;
                *(_QWORD *)(v107 + 16) = 0;
                *(_QWORD *)v107 = 0;
                v110 = i;
                do
                {
                  v111 = (void **)(v110 + 48);
                  if (*(char *)(v110 + 71) < 0)
                    operator delete(*v111);
                  *(_OWORD *)v111 = *(_OWORD *)(v110 + 24);
                  *(_QWORD *)(v110 + 64) = *(_QWORD *)(v110 + 40);
                  *(_BYTE *)(v110 + 47) = 0;
                  *(_BYTE *)(v110 + 24) = 0;
                  sub_24291C410(v128, **a3, (uint64_t)&v124);
                  sub_24291C410(__p, **a3, v110);
                  v112 = sub_24272A620(v128, __p);
                  if (v127 < 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v129) < 0)
                    operator delete(v128[0]);
                  v110 -= 24;
                }
                while (v112);
                v113 = *(char *)(v110 + 71);
                v114 = v110 + 48;
                if (v113 < 0)
                  operator delete(*(void **)v114);
                v115 = v124;
                *(_QWORD *)(v114 + 16) = v125;
                *(__n128 *)v114 = v115;
              }
            }
            else if (v108)
            {
              goto LABEL_231;
            }
            v105 = v107 + 24;
            a1 = v107;
            if ((__n128 *)(v107 + 24) == v122)
              return;
          }
        }
        if (!a4)
        {
          v67 = v122;
          if ((__n128 *)a1 == v122)
            return;
          v68 = (v12 - 2) >> 1;
          v120 = v68;
          do
          {
            v69 = v68;
            if (v120 >= v68)
            {
              v70 = (2 * v68) | 1;
              v71 = a1 + 24 * v70;
              v72 = 2 * v68 + 2;
              v73 = v68;
              if (v72 < (uint64_t)v12)
              {
                sub_24291C410(v128, **a3, a1 + 24 * v70);
                sub_24291C410(__p, **a3, v71 + 24);
                v74 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if (SHIBYTE(v129) < 0)
                  operator delete(v128[0]);
                if (v74)
                {
                  v71 += 24;
                  v70 = v72;
                }
              }
              sub_24291C410(v128, **a3, v71);
              v117 = v73;
              v75 = a1 + 24 * v73;
              sub_24291C410(__p, **a3, v75);
              v76 = sub_24272A620(v128, __p);
              v67 = v122;
              if (v127 < 0)
                operator delete(__p[0]);
              if (SHIBYTE(v129) < 0)
                operator delete(v128[0]);
              v69 = v73;
              if (!v76)
              {
                v77 = *(__n128 *)v75;
                v125 = *(_QWORD *)(v75 + 16);
                v124 = v77;
                *(_QWORD *)(v75 + 8) = 0;
                *(_QWORD *)(v75 + 16) = 0;
                *(_QWORD *)v75 = 0;
                do
                {
                  v78 = v71;
                  if (*(char *)(v75 + 23) < 0)
                    operator delete(*(void **)v75);
                  v79 = *(_OWORD *)v71;
                  *(_QWORD *)(v75 + 16) = *(_QWORD *)(v71 + 16);
                  *(_OWORD *)v75 = v79;
                  *(_BYTE *)(v71 + 23) = 0;
                  *(_BYTE *)v71 = 0;
                  if (v120 < v70)
                    goto LABEL_184;
                  v80 = (2 * v70) | 1;
                  v71 = a1 + 24 * v80;
                  v70 = 2 * v70 + 2;
                  if (v70 >= (uint64_t)v12)
                  {
                    v70 = v80;
                  }
                  else
                  {
                    sub_24291C410(v128, **a3, a1 + 24 * v80);
                    sub_24291C410(__p, **a3, v71 + 24);
                    v81 = sub_24272A620(v128, __p);
                    if (v127 < 0)
                      operator delete(__p[0]);
                    if (SHIBYTE(v129) < 0)
                      operator delete(v128[0]);
                    if (v81)
                      v71 += 24;
                    else
                      v70 = v80;
                  }
                  sub_24291C410(v128, **a3, v71);
                  sub_24291C410(__p, **a3, (uint64_t)&v124);
                  v82 = sub_24272A620(v128, __p);
                  if (v127 < 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v129) < 0)
                    operator delete(v128[0]);
                  v75 = v78;
                }
                while (!v82);
                if (*(char *)(v78 + 23) < 0)
                  operator delete(*(void **)v78);
LABEL_184:
                v83 = v124;
                *(_QWORD *)(v78 + 16) = v125;
                *(__n128 *)v78 = v83;
                v67 = v122;
                v69 = v117;
              }
            }
            v68 = v69 - 1;
          }
          while (v69);
          v84 = v11 / 0x18uLL;
          while (1)
          {
            v85 = 0;
            v118 = v67;
            v121 = *(_QWORD *)a1;
            v130[0] = *(_QWORD *)(a1 + 8);
            *(_QWORD *)((char *)v130 + 7) = *(_QWORD *)(a1 + 15);
            v123 = *(_BYTE *)(a1 + 23);
            *(_QWORD *)(a1 + 8) = 0;
            *(_QWORD *)(a1 + 16) = 0;
            *(_QWORD *)a1 = 0;
            v86 = a1;
            do
            {
              v87 = v86 + 24 * v85 + 24;
              v88 = 2 * v85;
              v85 = (2 * v85) | 1;
              v89 = v88 + 2;
              if (v88 + 2 < v84)
              {
                sub_24291C410(v128, **a3, v87);
                sub_24291C410(__p, **a3, v87 + 24);
                v90 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if (SHIBYTE(v129) < 0)
                  operator delete(v128[0]);
                if (v90)
                {
                  v87 += 24;
                  v85 = v89;
                }
              }
              if (*(char *)(v86 + 23) < 0)
                operator delete(*(void **)v86);
              v91 = *(__n128 *)v87;
              *(_QWORD *)(v86 + 16) = *(_QWORD *)(v87 + 16);
              *(__n128 *)v86 = v91;
              *(_BYTE *)(v87 + 23) = 0;
              *(_BYTE *)v87 = 0;
              v86 = v87;
            }
            while (v85 <= (uint64_t)((unint64_t)(v84 - 2) >> 1));
            v67 = (__n128 *)((char *)v118 - 24);
            if ((__int8 *)v87 == &v118[-2].n128_i8[8])
            {
              *(_QWORD *)v87 = v121;
              v98 = *(_QWORD *)((char *)v130 + 7);
              *(_QWORD *)(v87 + 8) = v130[0];
              *(_QWORD *)(v87 + 15) = v98;
              *(_BYTE *)(v87 + 23) = v123;
            }
            else
            {
              v92 = *v67;
              *(_QWORD *)(v87 + 16) = v118[-1].n128_u64[1];
              *(__n128 *)v87 = v92;
              v118[-2].n128_u64[1] = v121;
              v93 = v130[0];
              *(unint64_t *)((char *)v118[-1].n128_u64 + 7) = *(_QWORD *)((char *)v130 + 7);
              v118[-1].n128_u64[0] = v93;
              v118[-1].n128_u8[15] = v123;
              v94 = v87 - a1 + 24;
              if (v94 >= 25)
              {
                v95 = (v94 / 0x18uLL - 2) >> 1;
                v96 = a1 + 24 * v95;
                sub_24291C410(v128, **a3, v96);
                sub_24291C410(__p, **a3, v87);
                v97 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if (SHIBYTE(v129) < 0)
                {
                  operator delete(v128[0]);
                  if (v97)
                  {
LABEL_207:
                    v99 = *(__n128 *)v87;
                    v125 = *(_QWORD *)(v87 + 16);
                    v124 = v99;
                    *(_QWORD *)(v87 + 8) = 0;
                    *(_QWORD *)(v87 + 16) = 0;
                    *(_QWORD *)v87 = 0;
                    while (1)
                    {
                      v100 = v96;
                      if (*(char *)(v87 + 23) < 0)
                        operator delete(*(void **)v87);
                      v101 = *(_OWORD *)v96;
                      *(_QWORD *)(v87 + 16) = *(_QWORD *)(v96 + 16);
                      *(_OWORD *)v87 = v101;
                      *(_BYTE *)(v96 + 23) = 0;
                      *(_BYTE *)v96 = 0;
                      if (!v95)
                        break;
                      v95 = (v95 - 1) >> 1;
                      v96 = a1 + 24 * v95;
                      sub_24291C410(v128, **a3, v96);
                      sub_24291C410(__p, **a3, (uint64_t)&v124);
                      v102 = sub_24272A620(v128, __p);
                      if (v127 < 0)
                        operator delete(__p[0]);
                      if (SHIBYTE(v129) < 0)
                        operator delete(v128[0]);
                      v87 = v100;
                      if (!v102)
                      {
                        if (*(char *)(v100 + 23) < 0)
                          operator delete(*(void **)v100);
                        break;
                      }
                    }
                    v103 = v124;
                    *(_QWORD *)(v100 + 16) = v125;
                    *(__n128 *)v100 = v103;
                    v67 = (__n128 *)((char *)v118 - 24);
                  }
                }
                else if (v97)
                {
                  goto LABEL_207;
                }
              }
            }
            if (v84-- <= 2)
              return;
          }
        }
        v13 = v12 >> 1;
        v14 = a1 + 24 * (v12 >> 1);
        if ((unint64_t)v11 < 0xC01)
        {
          sub_24291BDCC((__n128 *)(a1 + 24 * (v12 >> 1)), a1, v9, a3);
        }
        else
        {
          sub_24291BDCC((__n128 *)a1, a1 + 24 * (v12 >> 1), v9, a3);
          sub_24291BDCC((__n128 *)(a1 + 24), a1 + 24 * v13 - 24, v119, a3);
          sub_24291BDCC((__n128 *)(a1 + 48), a1 + 24 * v13 + 24, v116, a3);
          sub_24291BDCC((__n128 *)(a1 + 24 * v13 - 24), v14, a1 + 24 * v13 + 24, a3);
          v15 = *(__n128 *)a1;
          v129 = *(_QWORD *)(a1 + 16);
          *(__n128 *)v128 = v15;
          v16 = *(_OWORD *)v14;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v14 + 16);
          *(_OWORD *)a1 = v16;
          v17 = *(_OWORD *)v128;
          *(_QWORD *)(v14 + 16) = v129;
          *(_OWORD *)v14 = v17;
        }
        --a4;
        if ((a5 & 1) == 0)
        {
          sub_24291C410(v128, **a3, a1 - 24);
          sub_24291C410(__p, **a3, a1);
          v18 = sub_24272A620(v128, __p);
          if (v127 < 0)
            operator delete(__p[0]);
          if (SHIBYTE(v129) < 0)
            operator delete(v128[0]);
          if (!v18)
          {
            v36 = *(__n128 *)a1;
            v125 = *(_QWORD *)(a1 + 16);
            v124 = v36;
            *(_QWORD *)(a1 + 8) = 0;
            *(_QWORD *)(a1 + 16) = 0;
            *(_QWORD *)a1 = 0;
            sub_24291C410(v128, **a3, (uint64_t)&v124);
            sub_24291C410(__p, **a3, v9);
            v37 = sub_24272A620(v128, __p);
            if (v127 < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v129) < 0)
              operator delete(v128[0]);
            if (v37)
            {
              v10 = (__n128 *)a1;
              do
              {
                sub_24291C410(v128, **a3, (uint64_t)&v124);
                v10 = (__n128 *)((char *)v10 + 24);
                sub_24291C410(__p, **a3, (uint64_t)v10);
                v38 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if (SHIBYTE(v129) < 0)
                  operator delete(v128[0]);
              }
              while (!v38);
            }
            else
            {
              v39 = (__n128 *)(a1 + 24);
              do
              {
                v10 = v39;
                if (v39 >= v122)
                  break;
                sub_24291C410(v128, **a3, (uint64_t)&v124);
                sub_24291C410(__p, **a3, (uint64_t)v10);
                v40 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if (SHIBYTE(v129) < 0)
                  operator delete(v128[0]);
                v39 = (__n128 *)((char *)v10 + 24);
              }
              while (!v40);
            }
            v41 = (unint64_t)v122;
            if (v10 < v122)
            {
              v41 = (unint64_t)v122;
              do
              {
                while (1)
                {
                  sub_24291C410(v128, **a3, (uint64_t)&v124);
                  v41 -= 24;
                  sub_24291C410(__p, **a3, v41);
                  v42 = sub_24272A620(v128, __p);
                  if (v127 < 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v129) < 0)
                    break;
                  if (!v42)
                    goto LABEL_104;
                }
                operator delete(v128[0]);
              }
              while (v42);
            }
LABEL_104:
            while ((unint64_t)v10 < v41)
            {
              v43 = *v10;
              v129 = v10[1].n128_u64[0];
              *(__n128 *)v128 = v43;
              v44 = *(__n128 *)v41;
              v10[1].n128_u64[0] = *(_QWORD *)(v41 + 16);
              *v10 = v44;
              v45 = *(_OWORD *)v128;
              *(_QWORD *)(v41 + 16) = v129;
              *(_OWORD *)v41 = v45;
              do
              {
                while (1)
                {
                  sub_24291C410(v128, **a3, (uint64_t)&v124);
                  v10 = (__n128 *)((char *)v10 + 24);
                  sub_24291C410(__p, **a3, (uint64_t)v10);
                  v46 = sub_24272A620(v128, __p);
                  if (v127 < 0)
                    operator delete(__p[0]);
                  if (SHIBYTE(v129) < 0)
                    break;
                  if (v46)
                    goto LABEL_100;
                }
                operator delete(v128[0]);
              }
              while (!v46);
              do
              {
                while (1)
                {
LABEL_100:
                  sub_24291C410(v128, **a3, (uint64_t)&v124);
                  v41 -= 24;
                  sub_24291C410(__p, **a3, v41);
                  v47 = sub_24272A620(v128, __p);
                  if (v127 < 0)
                    operator delete(__p[0]);
                  if ((SHIBYTE(v129) & 0x80000000) == 0)
                    break;
                  operator delete(v128[0]);
                  if (!v47)
                    goto LABEL_104;
                }
              }
              while (v47);
            }
            v48 = &v10[-2].n128_i8[8];
            if (&v10[-2].n128_i8[8] == (__int8 *)a1)
            {
              if (v10[-1].n128_i8[15] < 0)
                operator delete(*(void **)a1);
            }
            else
            {
              if (*(char *)(a1 + 23) < 0)
                operator delete(*(void **)a1);
              v49 = *(_OWORD *)v48;
              *(_QWORD *)(a1 + 16) = v10[-1].n128_u64[1];
              *(_OWORD *)a1 = v49;
              v10[-1].n128_u8[15] = 0;
              v10[-2].n128_u8[8] = 0;
            }
            a5 = 0;
            v50 = v124;
            v10[-1].n128_u64[1] = v125;
            *(__n128 *)v48 = v50;
            continue;
          }
        }
        v19 = 0;
        v20 = *(__n128 *)a1;
        v125 = *(_QWORD *)(a1 + 16);
        v124 = v20;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        do
        {
          sub_24291C410(v128, **a3, a1 + v19 + 24);
          sub_24291C410(__p, **a3, (uint64_t)&v124);
          v21 = sub_24272A620(v128, __p);
          if (v127 < 0)
            operator delete(__p[0]);
          if (SHIBYTE(v129) < 0)
            operator delete(v128[0]);
          v19 += 24;
        }
        while (v21);
        v22 = a1 + v19;
        v23 = (unint64_t)v122;
        if (v19 == 24)
        {
          v23 = (unint64_t)v122;
          while (v22 < v23)
          {
            v23 -= 24;
            sub_24291C410(v128, **a3, v23);
            sub_24291C410(__p, **a3, (uint64_t)&v124);
            v25 = sub_24272A620(v128, __p);
            if (v127 < 0)
              operator delete(__p[0]);
            if (SHIBYTE(v129) < 0)
            {
              operator delete(v128[0]);
              if (v25)
                break;
            }
            else if (v25)
            {
              break;
            }
          }
        }
        else
        {
          do
          {
            while (1)
            {
              v23 -= 24;
              sub_24291C410(v128, **a3, v23);
              sub_24291C410(__p, **a3, (uint64_t)&v124);
              v24 = sub_24272A620(v128, __p);
              if (v127 < 0)
                operator delete(__p[0]);
              if (SHIBYTE(v129) < 0)
                break;
              if (v24)
                goto LABEL_37;
            }
            operator delete(v128[0]);
          }
          while (!v24);
        }
LABEL_37:
        v10 = (__n128 *)(a1 + v19);
        if (v22 < v23)
        {
          v26 = v23;
          do
          {
            v27 = *v10;
            v129 = v10[1].n128_u64[0];
            *(__n128 *)v128 = v27;
            v28 = *(__n128 *)v26;
            v10[1].n128_u64[0] = *(_QWORD *)(v26 + 16);
            *v10 = v28;
            v29 = *(_OWORD *)v128;
            *(_QWORD *)(v26 + 16) = v129;
            *(_OWORD *)v26 = v29;
            do
            {
              while (1)
              {
                v10 = (__n128 *)((char *)v10 + 24);
                sub_24291C410(v128, **a3, (uint64_t)v10);
                sub_24291C410(__p, **a3, (uint64_t)&v124);
                v30 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if (SHIBYTE(v129) < 0)
                  break;
                if (!v30)
                  goto LABEL_48;
              }
              operator delete(v128[0]);
            }
            while (v30);
            do
            {
              while (1)
              {
LABEL_48:
                v26 -= 24;
                sub_24291C410(v128, **a3, v26);
                sub_24291C410(__p, **a3, (uint64_t)&v124);
                v31 = sub_24272A620(v128, __p);
                if (v127 < 0)
                  operator delete(__p[0]);
                if ((SHIBYTE(v129) & 0x80000000) == 0)
                  break;
                operator delete(v128[0]);
                if (v31)
                  goto LABEL_52;
              }
            }
            while (!v31);
LABEL_52:
            ;
          }
          while ((unint64_t)v10 < v26);
        }
        v32 = &v10[-2].n128_i8[8];
        if (&v10[-2].n128_i8[8] == (__int8 *)a1)
        {
          if (v10[-1].n128_i8[15] < 0)
            operator delete(*(void **)a1);
        }
        else
        {
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v33 = *(_OWORD *)v32;
          *(_QWORD *)(a1 + 16) = v10[-1].n128_u64[1];
          *(_OWORD *)a1 = v33;
          v10[-1].n128_u8[15] = 0;
          v10[-2].n128_u8[8] = 0;
        }
        v34 = v124;
        v10[-1].n128_u64[1] = v125;
        *(__n128 *)v32 = v34;
        if (v22 < v23)
        {
LABEL_62:
          sub_24291A848(a1, &v10[-2].n128_i8[8], a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }
        v35 = sub_24291C0B4((__n128 *)a1, (__n128 *)((char *)v10 - 24), a3);
        if (!sub_24291C0B4(v10, v122, a3))
        {
          if (v35)
            continue;
          goto LABEL_62;
        }
        a2 = (__n128 *)((char *)v10 - 24);
        if (!v35)
          goto LABEL_2;
        return;
    }
  }
}

void sub_24291BA3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0)
    operator delete(__p);
  if (a18 < 0)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

__n128 sub_24291BB44(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t **a6)
{
  _BOOL4 v12;
  __n128 result;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  _BOOL4 v25;
  unint64_t v26;
  unint64_t v27;
  void *__p[2];
  char v29;
  void *v30[2];
  char v31;

  sub_24291E094(a1, a2, a3, a4, a6);
  sub_24291C410(v30, **a6, a5);
  sub_24291C410(__p, **a6, a4);
  v12 = sub_24272A620(v30, __p);
  if (v29 < 0)
    operator delete(__p[0]);
  if (v31 < 0)
  {
    operator delete(v30[0]);
    if (!v12)
      return result;
  }
  else if (!v12)
  {
    return result;
  }
  v14 = *(_QWORD *)(a4 + 16);
  v15 = *(_OWORD *)a4;
  v16 = *(_QWORD *)(a5 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a5;
  *(_QWORD *)(a4 + 16) = v16;
  *(_OWORD *)a5 = v15;
  *(_QWORD *)(a5 + 16) = v14;
  sub_24291C410(v30, **a6, a4);
  sub_24291C410(__p, **a6, a3);
  v17 = sub_24272A620(v30, __p);
  if (v29 < 0)
    operator delete(__p[0]);
  if (v31 < 0)
  {
    operator delete(v30[0]);
    if (!v17)
      return result;
  }
  else if (!v17)
  {
    return result;
  }
  v18 = *(_QWORD *)(a3 + 16);
  v19 = *(_OWORD *)a3;
  v20 = *(_QWORD *)(a4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(_QWORD *)(a3 + 16) = v20;
  *(_OWORD *)a4 = v19;
  *(_QWORD *)(a4 + 16) = v18;
  sub_24291C410(v30, **a6, a3);
  sub_24291C410(__p, **a6, a2);
  v21 = sub_24272A620(v30, __p);
  if (v29 < 0)
    operator delete(__p[0]);
  if (v31 < 0)
  {
    operator delete(v30[0]);
    if (!v21)
      return result;
  }
  else if (!v21)
  {
    return result;
  }
  v22 = *(_QWORD *)(a2 + 16);
  v23 = *(__n128 *)a2;
  v24 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v24;
  *(__n128 *)a3 = v23;
  *(_QWORD *)(a3 + 16) = v22;
  sub_24291C410(v30, **a6, a2);
  sub_24291C410(__p, **a6, (uint64_t)a1);
  v25 = sub_24272A620(v30, __p);
  if (v29 < 0)
    operator delete(__p[0]);
  if (v31 < 0)
    operator delete(v30[0]);
  if (v25)
  {
    v26 = a1[1].n128_u64[0];
    result = *a1;
    v27 = *(_QWORD *)(a2 + 16);
    *a1 = *(__n128 *)a2;
    a1[1].n128_u64[0] = v27;
    *(__n128 *)a2 = result;
    *(_QWORD *)(a2 + 16) = v26;
  }
  return result;
}

void sub_24291BDA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__n128 sub_24291BDCC(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t **a4)
{
  BOOL v8;
  _BOOL4 v9;
  unint64_t v10;
  __n128 result;
  unint64_t v12;
  _BOOL4 v13;
  unint64_t v14;
  __n128 v15;
  unint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  _BOOL4 v22;
  unint64_t v23;
  unint64_t v24;
  void *__p[2];
  char v26;
  void *v27[2];
  char v28;

  sub_24291C410(v27, **a4, a2);
  sub_24291C410(__p, **a4, (uint64_t)a1);
  v8 = sub_24272A620(v27, __p);
  if (v26 < 0)
    operator delete(__p[0]);
  if (v28 < 0)
  {
    operator delete(v27[0]);
    if (v8)
      goto LABEL_5;
  }
  else if (v8)
  {
LABEL_5:
    sub_24291C410(v27, **a4, a3);
    sub_24291C410(__p, **a4, a2);
    v9 = sub_24272A620(v27, __p);
    if (v26 < 0)
      operator delete(__p[0]);
    if (v28 < 0)
    {
      operator delete(v27[0]);
      if (v9)
        goto LABEL_9;
    }
    else if (v9)
    {
LABEL_9:
      v10 = a1[1].n128_u64[0];
      result = *a1;
      v12 = *(_QWORD *)(a3 + 16);
      *a1 = *(__n128 *)a3;
      a1[1].n128_u64[0] = v12;
LABEL_23:
      *(__n128 *)a3 = result;
      *(_QWORD *)(a3 + 16) = v10;
      return result;
    }
    v14 = a1[1].n128_u64[0];
    v15 = *a1;
    v16 = *(_QWORD *)(a2 + 16);
    *a1 = *(__n128 *)a2;
    a1[1].n128_u64[0] = v16;
    *(__n128 *)a2 = v15;
    *(_QWORD *)(a2 + 16) = v14;
    sub_24291C410(v27, **a4, a3);
    sub_24291C410(__p, **a4, a2);
    v17 = sub_24272A620(v27, __p);
    if (v26 < 0)
      operator delete(__p[0]);
    if (v28 < 0)
      operator delete(v27[0]);
    if (v17)
    {
      v10 = *(_QWORD *)(a2 + 16);
      result = *(__n128 *)a2;
      v18 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v18;
      goto LABEL_23;
    }
    return result;
  }
  sub_24291C410(v27, **a4, a3);
  sub_24291C410(__p, **a4, a2);
  v13 = sub_24272A620(v27, __p);
  if (v26 < 0)
    operator delete(__p[0]);
  if (v28 < 0)
  {
    operator delete(v27[0]);
    if (!v13)
      return result;
  }
  else if (!v13)
  {
    return result;
  }
  v19 = *(_QWORD *)(a2 + 16);
  v20 = *(__n128 *)a2;
  v21 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v21;
  *(__n128 *)a3 = v20;
  *(_QWORD *)(a3 + 16) = v19;
  sub_24291C410(v27, **a4, a2);
  sub_24291C410(__p, **a4, (uint64_t)a1);
  v22 = sub_24272A620(v27, __p);
  if (v26 < 0)
    operator delete(__p[0]);
  if (v28 < 0)
    operator delete(v27[0]);
  if (v22)
  {
    v23 = a1[1].n128_u64[0];
    result = *a1;
    v24 = *(_QWORD *)(a2 + 16);
    *a1 = *(__n128 *)a2;
    a1[1].n128_u64[0] = v24;
    *(__n128 *)a2 = result;
    *(_QWORD *)(a2 + 16) = v23;
  }
  return result;
}

void sub_24291C088(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 81) < 0)
    operator delete(*(void **)(v1 - 104));
  _Unwind_Resume(exception_object);
}

BOOL sub_24291C0B4(__n128 *a1, __n128 *a2, uint64_t **a3)
{
  unint64_t v6;
  _BOOL8 result;
  __n128 *v8;
  _BOOL4 v9;
  unint64_t v10;
  __n128 v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  char *v19;
  void **v20;
  BOOL v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  void *__p[2];
  char v26;
  void *v27[2];
  char v28;

  v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = (__n128 *)((char *)a2 - 24);
      sub_24291C410(v27, **a3, (uint64_t)&a2[-2].n128_i64[1]);
      sub_24291C410(__p, **a3, (uint64_t)a1);
      v9 = sub_24272A620(v27, __p);
      if (v26 < 0)
        operator delete(__p[0]);
      if (v28 < 0)
        operator delete(v27[0]);
      if (v9)
      {
        v10 = a1[1].n128_u64[0];
        v11 = *a1;
        v12 = v8[1].n128_u64[0];
        *a1 = *v8;
        a1[1].n128_u64[0] = v12;
        *v8 = v11;
        v8[1].n128_u64[0] = v10;
      }
      return 1;
    case 3uLL:
      sub_24291BDCC(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1], a3);
      return 1;
    case 4uLL:
      sub_24291E094(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a2[-2].n128_i64[1], a3);
      return 1;
    case 5uLL:
      sub_24291BB44(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a1[4].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1], a3);
      return 1;
    default:
      v13 = (uint64_t)&a1[3];
      sub_24291BDCC(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], a3);
      v14 = (uint64_t)&a1[4].n128_i64[1];
      if (&a1[4].n128_i8[8] == (__int8 *)a2)
        return 1;
      v15 = 0;
      v16 = 0;
      break;
  }
  while (1)
  {
    sub_24291C410(v27, **a3, v14);
    sub_24291C410(__p, **a3, v13);
    v17 = sub_24272A620(v27, __p);
    if (v26 < 0)
      operator delete(__p[0]);
    if (v28 < 0)
      break;
    if (v17)
      goto LABEL_17;
LABEL_30:
    v13 = v14;
    v15 += 24;
    v14 += 24;
    if ((__n128 *)v14 == a2)
      return 1;
  }
  operator delete(v27[0]);
  if (!v17)
    goto LABEL_30;
LABEL_17:
  v23 = *(_OWORD *)v14;
  v24 = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(v14 + 8) = 0;
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)v14 = 0;
  v18 = v15;
  do
  {
    v19 = (char *)a1 + v18;
    v20 = (void **)((char *)&a1[4].n128_u64[1] + v18);
    if (a1[5].n128_i8[v18 + 15] < 0)
      operator delete(*v20);
    *(_OWORD *)v20 = *((_OWORD *)v19 + 3);
    *(unint64_t *)((char *)&a1[5].n128_u64[1] + v18) = *((_QWORD *)v19 + 8);
    v19[71] = 0;
    v19[48] = 0;
    if (v18 == -48)
    {
      v22 = (uint64_t)a1;
      goto LABEL_29;
    }
    sub_24291C410(v27, **a3, (uint64_t)&v23);
    sub_24291C410(__p, **a3, (uint64_t)&a1[1].n128_i64[1] + v18);
    v21 = sub_24272A620(v27, __p);
    if (v26 < 0)
      operator delete(__p[0]);
    if (v28 < 0)
      operator delete(v27[0]);
    v18 -= 24;
  }
  while (v21);
  v22 = (uint64_t)&a1[4].n128_i64[1] + v18;
  if (a1[5].n128_i8[v18 + 15] < 0)
    operator delete(*(void **)v22);
LABEL_29:
  *(_OWORD *)v22 = v23;
  *(_QWORD *)(v22 + 16) = v24;
  if (++v16 != 8)
    goto LABEL_30;
  return v14 + 24 == (_QWORD)a2;
}

void sub_24291C3C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24291C410(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  unsigned int v13;
  _DWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  __int128 *v25;
  __int128 *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  _BYTE *v32;
  __int128 v33;
  __int128 *v34;
  char *v35;
  _BYTE *v36;
  _BYTE *v37;
  __int128 v38;
  _BYTE *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _OWORD *v47;
  uint64_t v48;
  _BYTE *v49;
  char *v50;
  __int128 v51;
  unint64_t v52;
  char *v53;
  _BYTE *v54;
  _QWORD *v55;
  _BYTE *v56;
  _OWORD *v57;
  uint64_t v58;
  __int128 v59;
  int64_t v60;
  _BYTE *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  char *v65;
  void *v66;
  _BYTE *v67;
  unsigned int v68;
  char *v69;
  char v70;
  uint64_t v71;
  _QWORD *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  _QWORD *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  void **v93;
  _BYTE *v94;
  _QWORD *v95;
  _QWORD *v96;
  unint64_t v97;
  _QWORD *v98;
  unint64_t v99;
  char *v100;
  char *v101;
  __int128 v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  char *i;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  unint64_t v131;
  uint64_t v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  uint64_t v139;
  int64_t v140;
  unint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  char *v145;
  char *v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  char *v150;
  __int128 *v151;
  uint64_t v152;
  _QWORD *v153;
  BOOL *v154;
  char *v155;
  int v156;
  _BOOL4 v157;
  int v158;
  char *v159;
  char *v160;
  char *v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _BYTE *v165;
  char v166;
  uint64_t v167;
  _BYTE *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char v176;
  _BYTE *v177;
  char *__p;
  _BYTE *v179;
  char v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  char *v185;
  uint64_t v186;
  __int128 v187;
  BOOL v188;
  uint64_t v189;
  uint64_t v190;
  char v191;
  __int128 v192;
  BOOL v193;
  char v194;
  uint64_t v195;
  void *v196[2];
  __int128 v197;
  int64x2_t v198;
  _BYTE v199[56];
  _OWORD v200[3];
  __int128 v201;
  char v202;

  v3 = a3;
  v6 = *(unsigned __int8 *)(a3 + 23);
  if ((v6 & 0x80u) == 0)
    v7 = a3;
  else
    v7 = *(_QWORD *)a3;
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a3 + 8);
  v183 = v6;
  v184 = 0;
  v8 = v7 + v6;
  v189 = 0;
  v190 = 0;
  v191 = 0;
  v192 = 0uLL;
  v193 = 0;
  v194 = 0;
  v195 = 0;
  v185 = 0;
  v186 = 0;
  v9 = (*(_DWORD *)(a2 + 28) + 1);
  *(_QWORD *)&v187 = v7 + v6;
  *((_QWORD *)&v187 + 1) = v7 + v6;
  v188 = 0;
  sub_2429152D0(&v184, v9, &v187);
  v189 = v7;
  v190 = v7;
  v191 = 0;
  v192 = v187;
  v193 = v188;
  v195 = v7;
  v194 = 1;
  if ((*(_WORD *)(a2 + 24) & 0x1F0) != 0)
  {
    v182 = v8;
    if (*(_DWORD *)(a2 + 28))
    {
      v196[0] = 0;
      v196[1] = 0;
      *(_QWORD *)&v197 = 0;
      v10 = *(_QWORD *)(a2 + 40);
      if (v10)
      {
        *(_QWORD *)&v201 = v182;
        *((_QWORD *)&v201 + 1) = v182;
        v202 = 0;
        *(_DWORD *)v199 = 0;
        memset(&v199[8], 0, 48);
        memset(v200, 0, 37);
        v196[1] = sub_242915818((int64x2_t *)v196, (uint64_t)v199);
        if (*(_QWORD *)&v200[0])
          operator delete(*(void **)&v200[0]);
        if (*(_QWORD *)&v199[32])
          operator delete(*(void **)&v199[32]);
        v11 = (void **)v196[1];
        *((_DWORD *)v196[1] - 24) = 0;
        *(v11 - 11) = (void *)v7;
        *(v11 - 10) = (void *)v7;
        *(v11 - 9) = (void *)v182;
        sub_242915504(v11 - 8, *(unsigned int *)(a2 + 28), &v201);
        sub_24291567C((char **)v196[1] - 5, *(unsigned int *)(a2 + 32));
        v179 = 0;
        v175 = 0;
        v177 = 0;
        v168 = 0;
        v173 = 0;
        __p = 0;
        v12 = 0;
        v180 = 0;
        v13 = 0;
        v14 = v196[1];
        *((_QWORD *)v196[1] - 2) = v10;
        *(v14 - 2) = 4160;
        *((_BYTE *)v14 - 4) = 1;
        do
        {
          v15 = (++v13 & 0xFFF) != 0 || (int)(v13 >> 12) < (int)v183;
          if (!v15)
            sub_242915780();
          v17 = v14 - 4;
          v16 = *((_QWORD *)v14 - 2);
          v18 = v14 - 24;
          if (v16)
            (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 24);
          switch(*(_DWORD *)v18)
          {
            case 0xFFFFFC18:
              if (*((_QWORD *)v14 - 10) != v182)
                goto LABEL_23;
              if ((v180 & (v12 >= v182 - *((_QWORD *)v14 - 11))) == 0)
              {
                v181 = v182 - *((_QWORD *)v14 - 11);
                v25 = (__int128 *)*((_QWORD *)v14 - 8);
                v26 = (__int128 *)*((_QWORD *)v14 - 7);
                v27 = 0xAAAAAAAAAAAAAAABLL * (((char *)v26 - (char *)v25) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * ((v175 - (uint64_t)__p) >> 3) >= v27)
                {
                  if (0xAAAAAAAAAAAAAAABLL * ((v179 - __p) >> 3) >= v27)
                  {
                    if (v25 == v26)
                    {
                      v39 = __p;
                      v40 = __p;
                    }
                    else
                    {
                      v39 = __p;
                      v40 = __p;
                      v41 = __p;
                      do
                      {
                        *(_OWORD *)v41 = *v25;
                        v41[16] = *((_BYTE *)v25 + 16);
                        v40 += 24;
                        v25 = (__int128 *)((char *)v25 + 24);
                        v41 += 24;
                      }
                      while (v25 != v26);
                    }
                    v167 = v40 - v39;
                    v179 = v39;
                  }
                  else
                  {
                    v34 = (__int128 *)((char *)v25 + 8 * ((v179 - __p) >> 3));
                    if (v179 != __p)
                    {
                      v35 = __p;
                      do
                      {
                        *(_OWORD *)v35 = *v25;
                        v35[16] = *((_BYTE *)v25 + 16);
                        v25 = (__int128 *)((char *)v25 + 24);
                        v35 += 24;
                      }
                      while (v25 != v34);
                    }
                    v36 = v179;
                    if (v34 != v26)
                    {
                      v37 = v179;
                      do
                      {
                        v38 = *v34;
                        *((_QWORD *)v37 + 2) = *((_QWORD *)v34 + 2);
                        *(_OWORD *)v37 = v38;
                        v37 += 24;
                        v34 = (__int128 *)((char *)v34 + 24);
                        v36 += 24;
                      }
                      while (v34 != v26);
                    }
                    v167 = v36 - v179;
                  }
                }
                else
                {
                  if (__p)
                  {
                    operator delete(__p);
                    v175 = 0;
                  }
                  if (v27 > 0xAAAAAAAAAAAAAAALL)
                    goto LABEL_252;
                  v28 = 0x5555555555555556 * (v175 >> 3);
                  if (v28 <= v27)
                    v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)v26 - (char *)v25) >> 3);
                  v29 = 0xAAAAAAAAAAAAAAABLL * (v175 >> 3) >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v28;
                  if (v29 > 0xAAAAAAAAAAAAAAALL)
LABEL_252:
                    sub_242729A44();
                  v179 = sub_242915480(v29);
                  if (v25 == v26)
                  {
                    v31 = v179;
                    v32 = v179;
                  }
                  else
                  {
                    v31 = v179;
                    v32 = v179;
                    do
                    {
                      v33 = *v25;
                      *((_QWORD *)v32 + 2) = *((_QWORD *)v25 + 2);
                      *(_OWORD *)v32 = v33;
                      v32 += 24;
                      v25 = (__int128 *)((char *)v25 + 24);
                    }
                    while (v25 != v26);
                  }
                  v175 = (uint64_t)&v31[24 * v30];
                  v167 = v32 - v31;
                  __p = v31;
                }
                v43 = (char *)*((_QWORD *)v14 - 5);
                v42 = (char *)*((_QWORD *)v14 - 4);
                v44 = (v42 - v43) >> 4;
                if (v44 <= (v173 - (uint64_t)v177) >> 4)
                {
                  v49 = v168;
                  v52 = (v168 - v177) >> 4;
                  if (v52 >= v44)
                  {
                    v54 = v179;
                    if (v43 == v42)
                    {
                      v49 = v177;
                      v61 = v177;
                      v12 = v181;
                      v58 = v167;
                    }
                    else
                    {
                      v49 = v177;
                      v61 = v177;
                      v62 = v177;
                      v12 = v181;
                      v58 = v167;
                      do
                      {
                        *v62 = *(_QWORD *)v43;
                        v62[1] = *((_QWORD *)v43 + 1);
                        v61 += 16;
                        v43 += 16;
                        v62 += 2;
                      }
                      while (v43 != v42);
                    }
                    v60 = v61 - v49;
                  }
                  else
                  {
                    v53 = &v43[16 * v52];
                    v54 = v179;
                    if (v168 != v177)
                    {
                      v55 = v177;
                      do
                      {
                        *v55 = *(_QWORD *)v43;
                        v55[1] = *((_QWORD *)v43 + 1);
                        v43 += 16;
                        v55 += 2;
                      }
                      while (v43 != v53);
                    }
                    v56 = v168;
                    if (v53 == v42)
                    {
                      v12 = v181;
                      v58 = v167;
                    }
                    else
                    {
                      v57 = v168;
                      v12 = v181;
                      v58 = v167;
                      do
                      {
                        v59 = *(_OWORD *)v53;
                        v53 += 16;
                        *v57++ = v59;
                        v56 += 16;
                      }
                      while (v53 != v42);
                    }
                    v60 = v56 - v168;
                  }
                }
                else
                {
                  if (v177)
                  {
                    operator delete(v177);
                    v173 = 0;
                  }
                  if (v42 - v43 < 0)
                    goto LABEL_251;
                  v45 = v173 >> 3;
                  if (v173 >> 3 <= v44)
                    v45 = (v42 - v43) >> 4;
                  v46 = (unint64_t)v173 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v45;
                  if (v46 >> 60)
LABEL_251:
                    sub_242729A44();
                  v47 = sub_242915A6C(v46);
                  v49 = v47;
                  v50 = (char *)v47;
                  while (v43 != v42)
                  {
                    v51 = *(_OWORD *)v43;
                    v43 += 16;
                    *(_OWORD *)v50 = v51;
                    v50 += 16;
                  }
                  v173 = (uint64_t)&v47[v48];
                  v60 = v50 - (char *)v47;
                  v177 = v47;
                  v54 = v179;
                  v12 = v181;
                  v58 = v167;
                }
                v179 = &v54[v58];
                v168 = &v49[v60];
              }
              v63 = v196[1];
              if (v12 == v183)
              {
                v64 = v196[0];
                while (v63 != v64)
                {
                  v63 -= 12;
                  sub_2429159DC(v63);
                }
                v196[1] = v64;
                v180 = 1;
                v12 = v183;
              }
              else
              {
                sub_2429159DC((_QWORD *)v196[1] - 12);
                v196[1] = v63 - 12;
                v180 = 1;
              }
              break;
            case 0xFFFFFC1D:
            case 0xFFFFFC1E:
            case 0xFFFFFC21:
              break;
            case 0xFFFFFC1F:
LABEL_23:
              v19 = (char *)v196[1] - 96;
              sub_2429159DC((_QWORD *)v196[1] - 12);
              v196[1] = v19;
              break;
            case 0xFFFFFC20:
              v20 = *((_OWORD *)v14 - 5);
              *(_OWORD *)v199 = *v18;
              *(_OWORD *)&v199[16] = v20;
              memset(&v199[32], 0, 24);
              sub_242915AA0(&v199[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
              memset(v200, 0, 24);
              sub_242915B1C((char *)v200, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
              v21 = *v17;
              *(_QWORD *)((char *)&v200[1] + 13) = *(_QWORD *)((char *)v14 - 11);
              *((_QWORD *)&v200[1] + 1) = v21;
              (*(void (**)(_QWORD, uint64_t, _DWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 24);
              (*(void (**)(_QWORD, _QWORD, _BYTE *))(**((_QWORD **)&v200[1] + 1) + 24))(*((_QWORD *)&v200[1] + 1), 0, v199);
              v22 = (char *)v196[1];
              if (v196[1] >= (void *)v197)
              {
                v196[1] = sub_242915818((int64x2_t *)v196, (uint64_t)v199);
                if (*(_QWORD *)&v200[0])
                {
                  *((_QWORD *)&v200[0] + 1) = *(_QWORD *)&v200[0];
                  operator delete(*(void **)&v200[0]);
                }
              }
              else
              {
                v23 = *(_OWORD *)&v199[16];
                *(_OWORD *)v196[1] = *(_OWORD *)v199;
                *((_OWORD *)v22 + 1) = v23;
                *((_QWORD *)v22 + 4) = 0;
                *((_QWORD *)v22 + 5) = 0;
                *((_QWORD *)v22 + 6) = 0;
                *((_QWORD *)v22 + 7) = 0;
                *((_OWORD *)v22 + 2) = *(_OWORD *)&v199[32];
                *((_QWORD *)v22 + 6) = *(_QWORD *)&v199[48];
                memset(&v199[32], 0, 24);
                *((_QWORD *)v22 + 8) = 0;
                *((_QWORD *)v22 + 9) = 0;
                *(_OWORD *)(v22 + 56) = v200[0];
                *((_QWORD *)v22 + 9) = *(_QWORD *)&v200[1];
                memset(v200, 0, 24);
                v24 = *((_QWORD *)&v200[1] + 1);
                *(_QWORD *)(v22 + 85) = *(_QWORD *)((char *)&v200[1] + 13);
                *((_QWORD *)v22 + 10) = v24;
                v196[1] = v22 + 96;
              }
              if (*(_QWORD *)&v199[32])
              {
                *(_QWORD *)&v199[40] = *(_QWORD *)&v199[32];
                operator delete(*(void **)&v199[32]);
              }
              break;
            default:
              sub_2429157CC();
          }
          v14 = v196[1];
        }
        while (v196[0] != v196[1]);
        if ((v180 & 1) != 0)
        {
          v65 = v184;
          *(_QWORD *)v184 = v7;
          *((_QWORD *)v65 + 1) = v7 + v12;
          v65[16] = 1;
          v66 = __p;
          if (v179 != __p)
          {
            v67 = __p + 16;
            v68 = 1;
            do
            {
              v69 = &v65[24 * v68];
              *(_OWORD *)v69 = *((_OWORD *)v67 - 1);
              v70 = *v67;
              v67 += 24;
              v69[16] = v70;
              v15 = 0xAAAAAAAAAAAAAAABLL * ((v179 - __p) >> 3) > v68++;
            }
            while (v15);
          }
        }
        else
        {
          v66 = __p;
        }
        if (v177)
          operator delete(v177);
        if (v66)
          operator delete(v66);
        *(_QWORD *)v199 = v196;
        sub_242915BC8((void ***)v199);
        if ((v180 & 1) != 0)
          goto LABEL_202;
      }
      else
      {
        *(_QWORD *)v199 = v196;
        sub_242915BC8((void ***)v199);
      }
    }
    else
    {
      v197 = 0u;
      v198 = 0u;
      *(_OWORD *)v196 = 0u;
      v71 = *(_QWORD *)(a2 + 40);
      if (v71)
      {
        *(_DWORD *)v199 = 0;
        memset(&v199[8], 0, 48);
        memset(v200, 0, 37);
        sub_24291D7C0(v196, (uint64_t)v199);
        if (*(_QWORD *)&v200[0])
          operator delete(*(void **)&v200[0]);
        if (*(_QWORD *)&v199[32])
          operator delete(*(void **)&v199[32]);
        v172 = v3;
        v72 = v196[1];
        v73 = v198.i64[1] + v198.i64[0] - 1;
        v74 = v73 / 0x2A;
        v75 = *((_QWORD *)v196[1] + v73 / 0x2A);
        v76 = 3 * (v73 % 0x2A);
        v77 = v75 + 32 * v76;
        *(_DWORD *)v77 = 0;
        *(_QWORD *)(v77 + 8) = v7;
        v171 = v7;
        *(_QWORD *)(v72[v74] + 32 * v76 + 16) = v7;
        *(_QWORD *)(v72[v74] + 32 * v76 + 24) = v8;
        sub_24291567C((char **)(v72[v74] + 32 * v76 + 56), *(unsigned int *)(a2 + 32));
        v176 = 0;
        v78 = 0;
        v174 = 0;
        v79 = v198.i64[1];
        v80 = v196[1];
        v81 = v198.i64[1] + v198.i64[0] - 1;
        v82 = v81 / 0x2A;
        v83 = 3 * (v81 % 0x2A);
        *(_QWORD *)(*((_QWORD *)v196[1] + v82) + 32 * v83 + 80) = v71;
        v84 = v80[v82] + 32 * v83;
        *(_DWORD *)(v84 + 88) = 4160;
        *(_BYTE *)(v84 + 92) = 1;
        while (2)
        {
          if ((++v78 & 0xFFF) == 0 && (int)(v78 >> 12) >= (int)v183)
            sub_242915780();
          v86 = v79 + v198.i64[0] - 1;
          v87 = *((_QWORD *)v196[1] + v86 / 0x2A);
          v88 = v86 % 0x2A;
          v89 = v87 + 96 * (v86 % 0x2A);
          v91 = (_QWORD *)(v89 + 80);
          v90 = *(_QWORD *)(v89 + 80);
          if (v90)
            (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v90 + 16))(v90, v87 + 96 * v88);
          switch(*(_DWORD *)v89)
          {
            case 0xFFFFFC18:
              if (*(_QWORD *)(v87 + 96 * v88 + 16) != v8)
                goto LABEL_190;
              v92 = v174;
              if ((v176 & (v174 >= v8 - *(_QWORD *)(v87 + 96 * v88 + 8))) == 0)
                v92 = v8 - *(_QWORD *)(v87 + 96 * v88 + 8);
              if (v92 != v183)
              {
                v174 = v92;
                sub_24291DC60(v196);
                v176 = 1;
                goto LABEL_191;
              }
              v93 = (void **)v196[1];
              v94 = (_BYTE *)v197;
              if ((void *)v197 == v196[1])
              {
                v94 = v196[1];
              }
              else
              {
                v95 = (char *)v196[1] + 8 * (v198.i64[0] / 0x2AuLL);
                v96 = (_QWORD *)(*v95 + 96 * (v198.i64[0] % 0x2AuLL));
                v97 = *((_QWORD *)v196[1] + (v198.i64[1] + v198.i64[0]) / 0x2AuLL)
                    + 96 * ((v198.i64[1] + v198.i64[0]) % 0x2AuLL);
                if (v96 != (_QWORD *)v97)
                {
                  do
                  {
                    sub_2429159DC(v96);
                    v96 += 12;
                    if ((_QWORD *)((char *)v96 - *v95) == (_QWORD *)4032)
                    {
                      v98 = (_QWORD *)v95[1];
                      ++v95;
                      v96 = v98;
                    }
                  }
                  while (v96 != (_QWORD *)v97);
                  v93 = (void **)v196[1];
                  v94 = (_BYTE *)v197;
                }
                v8 = v182;
              }
              v198.i64[1] = 0;
              v127 = v94 - (_BYTE *)v93;
              if (v127 >= 0x11)
              {
                do
                {
                  operator delete(*v93);
                  v93 = (void **)((char *)v196[1] + 8);
                  v196[1] = v93;
                  v127 = v197 - (_QWORD)v93;
                }
                while ((_QWORD)v197 - (_QWORD)v93 > 0x10uLL);
              }
              if (v127 >> 3 == 1)
              {
                v128 = 21;
              }
              else
              {
                if (v127 >> 3 != 2)
                  goto LABEL_178;
                v128 = 42;
              }
              v198.i64[0] = v128;
LABEL_178:
              v176 = 1;
              v174 = v183;
LABEL_191:
              v79 = v198.i64[1];
              if (v198.i64[1])
                continue;
              v7 = v171;
              v3 = v172;
              if ((v176 & 1) == 0)
                goto LABEL_194;
              v136 = v184;
              *(_QWORD *)v184 = v171;
              *((_QWORD *)v136 + 1) = v171 + v174;
              v136[16] = 1;
              sub_24291DF30((uint64_t)v196);
              break;
            case 0xFFFFFC19:
            case 0xFFFFFC1E:
            case 0xFFFFFC21:
              goto LABEL_191;
            case 0xFFFFFC1D:
              v99 = v198.i64[0];
              v100 = (char *)v196[1];
              v101 = (char *)v197;
              if (!v198.i64[0])
              {
                v104 = (uint64_t)(v197 - (unint64_t)v196[1]) >> 3;
                v105 = 42 * v104 - 1;
                if ((void *)v197 == v196[1])
                  v105 = 0;
                if ((unint64_t)(v105 - v198.i64[1]) < 0x2A)
                {
                  if (v104 >= (uint64_t)(*((_QWORD *)&v197 + 1) - (unint64_t)v196[0]) >> 3)
                  {
                    if (*((void **)&v197 + 1) == v196[0])
                      v106 = 1;
                    else
                      v106 = (uint64_t)(*((_QWORD *)&v197 + 1) - (unint64_t)v196[0]) >> 2;
                    *(_QWORD *)&v199[32] = (char *)&v197 + 8;
                    *(_QWORD *)v199 = sub_2429112FC(v106);
                    *(_QWORD *)&v199[8] = *(_QWORD *)v199;
                    *(_QWORD *)&v199[16] = *(_QWORD *)v199;
                    *(_QWORD *)&v199[24] = *(_QWORD *)v199 + 8 * v107;
                    *(_QWORD *)&v201 = operator new(0xFC0uLL);
                    sub_24291DD0C(v199, &v201);
                    v108 = (uint64_t *)v196[1];
                    for (i = *(char **)&v199[16]; v108 != (uint64_t *)v197; *(_QWORD *)&v199[16] += 8)
                    {
                      if (i == *(char **)&v199[24])
                      {
                        v110 = *(char **)&v199[8];
                        if (*(_QWORD *)&v199[8] <= *(_QWORD *)v199)
                        {
                          v170 = *(void **)v199;
                          if (i == *(char **)v199)
                            v116 = 1;
                          else
                            v116 = (uint64_t)&i[-*(_QWORD *)v199] >> 2;
                          v117 = (char *)sub_2429112FC(v116);
                          v120 = i - v110;
                          v119 = i == v110;
                          i = &v117[8 * (v116 >> 2)];
                          if (!v119)
                          {
                            i = &v117[8 * (v116 >> 2) + (v120 & 0xFFFFFFFFFFFFFFF8)];
                            v121 = 8 * (v120 >> 3);
                            v122 = &v117[8 * (v116 >> 2)];
                            do
                            {
                              v123 = *(_QWORD *)v110;
                              v110 += 8;
                              *(_QWORD *)v122 = v123;
                              v122 += 8;
                              v121 -= 8;
                            }
                            while (v121);
                          }
                          *(_QWORD *)v199 = v117;
                          *(_QWORD *)&v199[8] = &v117[8 * (v116 >> 2)];
                          *(_QWORD *)&v199[16] = i;
                          *(_QWORD *)&v199[24] = &v117[8 * v118];
                          if (v170)
                            operator delete(v170);
                        }
                        else
                        {
                          v111 = (uint64_t)(*(_QWORD *)&v199[8] - *(_QWORD *)v199) >> 3;
                          if (v111 >= -1)
                            v112 = v111 + 1;
                          else
                            v112 = v111 + 2;
                          v113 = *(_QWORD *)&v199[8] - 8 * (v112 >> 1);
                          v114 = &i[-*(_QWORD *)&v199[8]];
                          if (i != *(char **)&v199[8])
                          {
                            v169 = (void *)(*(_QWORD *)&v199[8] - 8 * (v112 >> 1));
                            memmove(v169, *(const void **)&v199[8], (size_t)&i[-*(_QWORD *)&v199[8]]);
                            v114 = (char *)(i - v110);
                            v113 = (uint64_t)v169;
                            i = v110;
                          }
                          v115 = &i[-8 * (v112 >> 1)];
                          i = &v114[v113];
                          *(_QWORD *)&v199[8] = v115;
                          *(_QWORD *)&v199[16] = &v114[v113];
                        }
                      }
                      v124 = *v108++;
                      *(_QWORD *)i = v124;
                      i = (char *)(*(_QWORD *)&v199[16] + 8);
                    }
                    v125 = v196[0];
                    *(_OWORD *)v196 = *(_OWORD *)v199;
                    *(_QWORD *)&v197 = i;
                    *((_QWORD *)&v197 + 1) = *(_QWORD *)&v199[24];
                    v126 = 21;
                    if (&i[-*(_QWORD *)&v199[8]] != (char *)8)
                      v126 = v198.i64[0] + 42;
                    v198.i64[0] = v126;
                    v8 = v182;
                    if (v125)
                      operator delete(v125);
                  }
                  else
                  {
                    if (v196[1] == v196[0])
                    {
                      *(_QWORD *)v199 = operator new(0xFC0uLL);
                      sub_24291DD0C(v196, v199);
                      *(_QWORD *)v199 = *(_QWORD *)(v197 - 8);
                      *(_QWORD *)&v197 = v197 - 8;
                    }
                    else
                    {
                      *(_QWORD *)v199 = operator new(0xFC0uLL);
                    }
                    sub_24291DE1C((uint64_t)v196, v199);
                    v129 = 21;
                    if ((_QWORD)v197 - (unint64_t)v196[1] != 8)
                      v129 = v198.i64[0] + 42;
                    v198.i64[0] = v129;
                  }
                }
                else
                {
                  v198.i64[0] = 42;
                  *(_QWORD *)v199 = *(_QWORD *)(v197 - 8);
                  *(_QWORD *)&v197 = v197 - 8;
                  sub_24291DE1C((uint64_t)v196, v199);
                }
                v99 = v198.i64[0];
                v100 = (char *)v196[1];
                v101 = (char *)v197;
              }
              v130 = &v100[8 * (v99 / 0x2A)];
              v131 = *(_QWORD *)v130 + 96 * (v99 % 0x2A);
              if (v101 == v100)
                v132 = 0;
              else
                v132 = v131;
              if (v132 == *(_QWORD *)v130)
                v132 = *((_QWORD *)v130 - 1) + 4032;
              v133 = *(_OWORD *)(v89 + 16);
              *(_OWORD *)(v132 - 96) = *(_OWORD *)v89;
              *(_OWORD *)(v132 - 80) = v133;
              v134 = v87 + 96 * v88;
              *(_QWORD *)(v132 - 56) = 0;
              *(_QWORD *)(v132 - 48) = 0;
              *(_QWORD *)(v132 - 64) = 0;
              *(_OWORD *)(v132 - 64) = *(_OWORD *)(v134 + 32);
              *(_QWORD *)(v132 - 48) = *(_QWORD *)(v134 + 48);
              *(_QWORD *)(v134 + 32) = 0;
              *(_QWORD *)(v134 + 40) = 0;
              *(_QWORD *)(v134 + 48) = 0;
              *(_QWORD *)(v132 - 40) = 0;
              *(_QWORD *)(v132 - 32) = 0;
              *(_QWORD *)(v132 - 24) = 0;
              *(_OWORD *)(v132 - 40) = *(_OWORD *)(v134 + 56);
              *(_QWORD *)(v132 - 24) = *(_QWORD *)(v134 + 72);
              *(_QWORD *)(v134 + 56) = 0;
              *(_QWORD *)(v134 + 64) = 0;
              *(_QWORD *)(v134 + 72) = 0;
              v135 = *v91;
              *(_QWORD *)(v132 - 11) = *(_QWORD *)(v89 + 85);
              *(_QWORD *)(v132 - 16) = v135;
              v198 = vaddq_s64(v198, (int64x2_t)xmmword_2429251D0);
              goto LABEL_190;
            case 0xFFFFFC1F:
LABEL_190:
              sub_24291DC60(v196);
              goto LABEL_191;
            case 0xFFFFFC20:
              v102 = *(_OWORD *)(v89 + 16);
              *(_OWORD *)v199 = *(_OWORD *)v89;
              *(_OWORD *)&v199[16] = v102;
              memset(&v199[32], 0, 24);
              sub_242915AA0(&v199[32], *(__int128 **)(v87 + 96 * v88 + 32), *(__int128 **)(v87 + 96 * v88 + 40), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(v87 + 96 * v88 + 40) - *(_QWORD *)(v87 + 96 * v88 + 32)) >> 3));
              memset(v200, 0, 24);
              sub_242915B1C((char *)v200, *(__int128 **)(v87 + 96 * v88 + 56), *(__int128 **)(v87 + 96 * v88 + 64), (uint64_t)(*(_QWORD *)(v87 + 96 * v88 + 64) - *(_QWORD *)(v87 + 96 * v88 + 56)) >> 4);
              v103 = *v91;
              *(_QWORD *)((char *)&v200[1] + 13) = *(_QWORD *)(v89 + 85);
              *((_QWORD *)&v200[1] + 1) = v103;
              (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v91 + 24))(*v91, 1, v89);
              (*(void (**)(_QWORD, _QWORD, _BYTE *))(**((_QWORD **)&v200[1] + 1) + 24))(*((_QWORD *)&v200[1] + 1), 0, v199);
              sub_24291D7C0(v196, (uint64_t)v199);
              if (*(_QWORD *)&v200[0])
              {
                *((_QWORD *)&v200[0] + 1) = *(_QWORD *)&v200[0];
                operator delete(*(void **)&v200[0]);
              }
              if (*(_QWORD *)&v199[32])
              {
                *(_QWORD *)&v199[40] = *(_QWORD *)&v199[32];
                operator delete(*(void **)&v199[32]);
              }
              goto LABEL_191;
            default:
              sub_2429157CC();
          }
          goto LABEL_202;
        }
      }
LABEL_194:
      sub_24291DF30((uint64_t)v196);
    }
LABEL_220:
    v143 = 0;
    v145 = 0;
    v156 = 1;
    v137 = v184;
    goto LABEL_221;
  }
  if ((sub_242914EF0(a2, v7, v8, (uint64_t *)&v184, 4160, 1) & 1) == 0)
    goto LABEL_220;
LABEL_202:
  v137 = v184;
  v138 = v184 + 8;
  if (v185 == v184)
    v138 = (char *)&v187 + 8;
  v139 = v189;
  v193 = *(_QWORD *)v138 != *((_QWORD *)&v192 + 1);
  v140 = v185 - v184;
  if (v185 == v184)
  {
    v156 = 0;
    v143 = 0;
    v145 = 0;
  }
  else
  {
    v141 = v140 / 24;
    if ((unint64_t)(v140 / 24) > 0xAAAAAAAAAAAAAAALL)
      sub_242729A44();
    v142 = (char *)operator new(v140);
    v143 = v142;
    v144 = 0;
    v145 = &v142[24 * v141];
    do
    {
      v146 = &v142[v144];
      *(_QWORD *)v146 = 0;
      *((_QWORD *)v146 + 1) = 0;
      v146[16] = 0;
      v144 += 24;
    }
    while (24 * v141 != v144);
    v147 = 0;
    v148 = 0;
    if (v141 <= 1)
      v149 = 1;
    else
      v149 = v141;
    do
    {
      v150 = &v137[v147];
      if (v141 <= v148)
        v151 = &v187;
      else
        v151 = (__int128 *)&v137[v147];
      v152 = *(_QWORD *)v151;
      v153 = v150 + 8;
      if (v141 <= v148)
        v153 = (_QWORD *)&v187 + 1;
      v154 = (BOOL *)(v150 + 16);
      if (v141 <= v148)
        v154 = &v188;
      v155 = &v142[v147];
      *(_QWORD *)v155 = v7 + v152 - v139;
      *((_QWORD *)v155 + 1) = v7 + *v153 - v139;
      v155[16] = *v154;
      ++v148;
      v147 += 24;
    }
    while (v149 != v148);
    v156 = 0;
  }
LABEL_221:
  v157 = v193;
  if (v137)
    operator delete(v137);
  if (v157)
    v158 = v156;
  else
    v158 = 1;
  if (v158)
    v159 = v145;
  else
    v159 = v143;
  if (v159 - v143 != 48)
  {
    if (*(char *)(v3 + 23) < 0)
    {
      sub_242910CE8(a1, *(void **)v3, *(_QWORD *)(v3 + 8));
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)v3;
      *((_QWORD *)a1 + 2) = *(_QWORD *)(v3 + 16);
    }
    goto LABEL_244;
  }
  if (v143[40])
  {
    v160 = (char *)*((_QWORD *)v143 + 3);
    v161 = (char *)*((_QWORD *)v143 + 4);
    v162 = v161 - v160;
    if ((unint64_t)(v161 - v160) >= 0x7FFFFFFFFFFFFFF8)
      sub_242729920();
    if (v162 > 0x16)
    {
      v163 = (v162 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v162 | 7) != 0x17)
        v163 = v162 | 7;
      v164 = v163 + 1;
      v165 = operator new(v163 + 1);
      *((_QWORD *)a1 + 1) = v162;
      *((_QWORD *)a1 + 2) = v164 | 0x8000000000000000;
      *(_QWORD *)a1 = v165;
      a1 = v165;
    }
    else
    {
      a1[23] = v162;
    }
    while (v160 != v161)
    {
      v166 = *v160++;
      *a1++ = v166;
    }
    *a1 = 0;
LABEL_244:
    if (!v143)
      return;
    goto LABEL_245;
  }
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
LABEL_245:
  operator delete(v143);
}

void sub_24291D654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  void *v39;
  uint64_t v40;
  void *__pa;

  operator delete(v39);
  __pa = *(void **)(v40 - 224);
  if (__pa)
    operator delete(__pa);
  sub_24291DF30((uint64_t)&a39);
  if (a25)
    operator delete(a25);
  _Unwind_Resume(a1);
}

__n128 sub_24291D7C0(_QWORD *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  _QWORD *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  __int128 v64;
  __n128 result;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  int64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  void *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  _QWORD *v87;

  v4 = (char *)a1[1];
  v5 = (char *)a1[2];
  v6 = (v5 - v4) >> 3;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = 42 * v6 - 1;
  v8 = a1[4];
  v9 = a1[5] + v8;
  if (v7 == v9)
  {
    if (v8 < 0x2A)
    {
      v23 = (char *)a1[3];
      v24 = (uint64_t)&v23[-*a1];
      if (v6 >= v24 >> 3)
      {
        if (v23 == (char *)*a1)
          v25 = 1;
        else
          v25 = v24 >> 2;
        v87 = a1 + 3;
        v83 = (char *)sub_2429112FC(v25);
        v84 = &v83[8 * v6];
        v85 = v84;
        v86 = &v83[8 * v26];
        v82 = operator new(0xFC0uLL);
        sub_24291DD0C(&v83, &v82);
        v28 = v83;
        v27 = v84;
        v29 = v85;
        v30 = v86;
        v31 = a1[2];
        if (v31 == a1[1])
        {
          v47 = v84;
        }
        else
        {
          do
          {
            if (v27 == v28)
            {
              if (v29 >= v30)
              {
                if (v30 == v27)
                  v37 = 1;
                else
                  v37 = (v30 - v27) >> 2;
                v38 = (char *)sub_2429112FC(v37);
                v28 = v38;
                v32 = &v38[(2 * v37 + 6) & 0xFFFFFFFFFFFFFFF8];
                v41 = v29 - v27;
                v40 = v29 == v27;
                v29 = v32;
                if (!v40)
                {
                  v29 = &v32[v41 & 0xFFFFFFFFFFFFFFF8];
                  v42 = 8 * (v41 >> 3);
                  v43 = v32;
                  v44 = v27;
                  do
                  {
                    v45 = *(_QWORD *)v44;
                    v44 += 8;
                    *(_QWORD *)v43 = v45;
                    v43 += 8;
                    v42 -= 8;
                  }
                  while (v42);
                }
                v30 = &v38[8 * v39];
                if (v27)
                  operator delete(v27);
              }
              else
              {
                v33 = (v30 - v29) >> 3;
                if (v33 >= -1)
                  v34 = v33 + 1;
                else
                  v34 = v33 + 2;
                v35 = v34 >> 1;
                v32 = &v27[8 * (v34 >> 1)];
                v36 = v27;
                if (v29 != v27)
                {
                  memmove(v32, v27, v29 - v27);
                  v36 = v29;
                }
                v29 = &v36[8 * v35];
                v28 = v27;
              }
            }
            else
            {
              v32 = v27;
            }
            v46 = *(_QWORD *)(v31 - 8);
            v31 -= 8;
            *((_QWORD *)v32 - 1) = v46;
            v47 = v32 - 8;
            v27 = v47;
          }
          while (v31 != a1[1]);
        }
        v62 = (char *)*a1;
        *a1 = v28;
        a1[1] = v47;
        a1[2] = v29;
        a1[3] = v30;
        if (v62)
          operator delete(v62);
        goto LABEL_54;
      }
      if (v23 != v5)
      {
        v83 = (char *)operator new(0xFC0uLL);
        sub_24291DD0C(a1, &v83);
LABEL_54:
        v4 = (char *)a1[1];
        v9 = a1[5] + a1[4];
        goto LABEL_55;
      }
      v83 = (char *)operator new(0xFC0uLL);
      sub_24291DE1C((uint64_t)a1, &v83);
      v59 = (_QWORD *)a1[1];
      v5 = (char *)a1[2];
      v61 = *v59;
      v60 = (char *)(v59 + 1);
      v11 = v61;
      a1[1] = v60;
      if (v5 == (char *)a1[3])
      {
        v67 = (uint64_t)&v60[-*a1];
        if ((unint64_t)v60 > *a1)
        {
          v68 = v67 >> 3;
          v15 = v67 >> 3 < -1;
          v69 = (v67 >> 3) + 2;
          if (v15)
            v70 = v69;
          else
            v70 = v68 + 1;
          v71 = -(v70 >> 1);
          v72 = v70 >> 1;
          v73 = &v60[-8 * v72];
          v74 = v5 - v60;
          if (v5 != v60)
          {
            memmove(&v60[-8 * v72], v60, v5 - v60);
            v60 = (char *)a1[1];
          }
          v5 = &v73[v74];
          v22 = &v60[8 * v71];
          goto LABEL_14;
        }
        if (v5 == (char *)*a1)
          v75 = 1;
        else
          v75 = (uint64_t)&v5[-*a1] >> 2;
        v49 = (char *)sub_2429112FC(v75);
        v50 = &v49[8 * (v75 >> 2)];
        v52 = &v49[8 * v76];
        v77 = (uint64_t *)a1[1];
        v5 = v50;
        v78 = a1[2] - (_QWORD)v77;
        if (v78)
        {
          v5 = &v50[v78 & 0xFFFFFFFFFFFFFFF8];
          v79 = 8 * (v78 >> 3);
          v80 = &v49[8 * (v75 >> 2)];
          do
          {
            v81 = *v77++;
            *(_QWORD *)v80 = v81;
            v80 += 8;
            v79 -= 8;
          }
          while (v79);
        }
LABEL_47:
        v58 = (char *)*a1;
        *a1 = v49;
        a1[1] = v50;
        a1[2] = v5;
        a1[3] = v52;
        if (v58)
        {
          operator delete(v58);
          v5 = (char *)a1[2];
        }
      }
    }
    else
    {
      a1[4] = v8 - 42;
      v12 = *(_QWORD *)v4;
      v10 = v4 + 8;
      v11 = v12;
      a1[1] = v10;
      if (v5 == (char *)a1[3])
      {
        v13 = (uint64_t)&v10[-*a1];
        if ((unint64_t)v10 > *a1)
        {
          v14 = v13 >> 3;
          v15 = v13 >> 3 < -1;
          v16 = (v13 >> 3) + 2;
          if (v15)
            v17 = v16;
          else
            v17 = v14 + 1;
          v18 = -(v17 >> 1);
          v19 = v17 >> 1;
          v20 = &v10[-8 * v19];
          v21 = v5 - v10;
          if (v5 != v10)
          {
            memmove(&v10[-8 * v19], v10, v5 - v10);
            v5 = (char *)a1[1];
          }
          v22 = &v5[8 * v18];
          v5 = &v20[v21];
LABEL_14:
          a1[1] = v22;
          a1[2] = v5;
          goto LABEL_50;
        }
        if (v5 == (char *)*a1)
          v48 = 1;
        else
          v48 = (uint64_t)&v5[-*a1] >> 2;
        v49 = (char *)sub_2429112FC(v48);
        v50 = &v49[8 * (v48 >> 2)];
        v52 = &v49[8 * v51];
        v53 = (uint64_t *)a1[1];
        v5 = v50;
        v54 = a1[2] - (_QWORD)v53;
        if (v54)
        {
          v5 = &v50[v54 & 0xFFFFFFFFFFFFFFF8];
          v55 = 8 * (v54 >> 3);
          v56 = &v49[8 * (v48 >> 2)];
          do
          {
            v57 = *v53++;
            *(_QWORD *)v56 = v57;
            v56 += 8;
            v55 -= 8;
          }
          while (v55);
        }
        goto LABEL_47;
      }
    }
LABEL_50:
    *(_QWORD *)v5 = v11;
    a1[2] += 8;
    goto LABEL_54;
  }
LABEL_55:
  v63 = *(_QWORD *)&v4[8 * (v9 / 0x2A)] + 96 * (v9 % 0x2A);
  v64 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v63 = *(_OWORD *)a2;
  *(_OWORD *)(v63 + 16) = v64;
  *(_QWORD *)(v63 + 40) = 0;
  *(_QWORD *)(v63 + 48) = 0;
  *(_QWORD *)(v63 + 32) = 0;
  *(_OWORD *)(v63 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v63 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v63 + 56) = 0;
  *(_QWORD *)(v63 + 64) = 0;
  *(_QWORD *)(v63 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v63 + 56) = result;
  *(_QWORD *)(v63 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v66 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v63 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v63 + 80) = v66;
  ++a1[5];
  return result;
}

void sub_24291DC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  void *v10;

  operator delete(v10);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24291DC60(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[5] + a1[4] - 1;
  sub_2429159DC((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  v3 = a1[2];
  v4 = v3 == a1[1];
  v5 = 42 * ((v3 - a1[1]) >> 3) - 1;
  v7 = a1[4];
  v6 = a1[5];
  a1[5] = v6 - 1;
  if (v4)
    v5 = 0;
  if ((unint64_t)(v5 - (v6 + v7) - 83) <= 0xFFFFFFFFFFFFFFABLL)
  {
    operator delete(*(void **)(v3 - 8));
    a1[2] -= 8;
  }
}

void sub_24291DD0C(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)sub_2429112FC(v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void sub_24291DE1C(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)sub_2429112FC(v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

uint64_t sub_24291DF30(uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  char *v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v3 = *(void ***)(a1 + 8);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = &v2[v4 / 0x2A];
    v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    v7 = (unint64_t)v2[(*(_QWORD *)(a1 + 40) + v4) / 0x2A] + 96 * ((*(_QWORD *)(a1 + 40) + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        sub_2429159DC(v6);
        v6 += 96;
        if (v6 - (_BYTE *)*v5 == 4032)
        {
          v8 = (char *)v5[1];
          ++v5;
          v6 = v8;
        }
      }
      while (v6 != (char *)v7);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
  }
  *(_QWORD *)(a1 + 40) = 0;
  v9 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v9 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v10 = v9 >> 3;
  if (v10 == 1)
  {
    v11 = 21;
    goto LABEL_14;
  }
  if (v10 == 2)
  {
    v11 = 42;
LABEL_14:
    *(_QWORD *)(a1 + 32) = v11;
  }
  if (v2 != v3)
  {
    do
    {
      v12 = *v2++;
      operator delete(v12);
    }
    while (v2 != v3);
    v14 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16);
    if (v13 != v14)
      *(_QWORD *)(a1 + 16) = v13 + ((v14 - v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

__n128 sub_24291E094(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5)
{
  _BOOL4 v10;
  __n128 result;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  _BOOL4 v19;
  unint64_t v20;
  unint64_t v21;
  void *__p[2];
  char v23;
  void *v24[2];
  char v25;

  sub_24291BDCC(a1, a2, a3, a5);
  sub_24291C410(v24, **a5, a4);
  sub_24291C410(__p, **a5, a3);
  v10 = sub_24272A620(v24, __p);
  if (v23 < 0)
    operator delete(__p[0]);
  if (v25 < 0)
  {
    operator delete(v24[0]);
    if (!v10)
      return result;
  }
  else if (!v10)
  {
    return result;
  }
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_OWORD *)a3;
  v14 = *(_QWORD *)(a4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(_QWORD *)(a3 + 16) = v14;
  *(_OWORD *)a4 = v13;
  *(_QWORD *)(a4 + 16) = v12;
  sub_24291C410(v24, **a5, a3);
  sub_24291C410(__p, **a5, a2);
  v15 = sub_24272A620(v24, __p);
  if (v23 < 0)
    operator delete(__p[0]);
  if (v25 < 0)
  {
    operator delete(v24[0]);
    if (!v15)
      return result;
  }
  else if (!v15)
  {
    return result;
  }
  v16 = *(_QWORD *)(a2 + 16);
  v17 = *(__n128 *)a2;
  v18 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v18;
  *(__n128 *)a3 = v17;
  *(_QWORD *)(a3 + 16) = v16;
  sub_24291C410(v24, **a5, a2);
  sub_24291C410(__p, **a5, (uint64_t)a1);
  v19 = sub_24272A620(v24, __p);
  if (v23 < 0)
    operator delete(__p[0]);
  if (v25 < 0)
    operator delete(v24[0]);
  if (v19)
  {
    v20 = a1[1].n128_u64[0];
    result = *a1;
    v21 = *(_QWORD *)(a2 + 16);
    *a1 = *(__n128 *)a2;
    a1[1].n128_u64[0] = v21;
    *(__n128 *)a2 = result;
    *(_QWORD *)(a2 + 16) = v20;
  }
  return result;
}

void sub_24291E264(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t CMMsl::Manager::Manager(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id **v6;
  uint64_t *v7;
  id *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  void *v22[2];
  uint64_t v23;
  void *v24[2];
  uint64_t v25;
  void *v26[2];
  uint64_t v27;
  __int128 v28;
  _BYTE buf[32];
  uint64_t v30;
  __int128 __p;
  _BYTE v32[24];
  uint64_t v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 8) = 0;
  v6 = (id **)(a1 + 8);
  *(_QWORD *)(a1 + 24) = 850045863;
  *(_QWORD *)(a1 + 16) = 0;
  v7 = (uint64_t *)(a1 + 16);
  *(_QWORD *)a1 = &off_251365710;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_QWORD *)(a1 + 80) = 0;
  v8 = (id *)operator new();
  sub_24272BBEC((uint64_t)v8, (uint64_t *)a2, a1, a3);
  sub_24291EB2C(v6, v8);
  if (qword_257206B58 != -1)
    dispatch_once(&qword_257206B58, &unk_251365730);
  v9 = qword_257206B50;
  if (os_log_type_enabled((os_log_t)qword_257206B50, OS_LOG_TYPE_DEFAULT))
  {
    if (*(char *)(a3 + 63) >= 0)
      v10 = a3 + 40;
    else
      v10 = *(_QWORD *)(a3 + 40);
    if (*(char *)(a3 + 39) >= 0)
      v11 = a3 + 16;
    else
      v11 = *(_QWORD *)(a3 + 16);
    if (*(char *)(a3 + 87) >= 0)
      v12 = a3 + 64;
    else
      v12 = *(_QWORD *)(a3 + 64);
    v13 = *(_DWORD *)(a3 + 88);
    v14 = *(_QWORD *)a3;
    v15 = *(_DWORD *)(a3 + 8);
    v16 = *(_DWORD *)(a3 + 12);
    v17 = *(_QWORD *)(a3 + 96);
    if (*(char *)(a2 + 23) >= 0)
      v18 = a2;
    else
      v18 = *(_QWORD *)a2;
    *(_DWORD *)buf = 136448258;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2082;
    *(_QWORD *)&buf[24] = v12;
    LOWORD(v30) = 1026;
    *(_DWORD *)((char *)&v30 + 2) = v13;
    HIWORD(v30) = 2050;
    *(_QWORD *)&__p = v14;
    WORD4(__p) = 1026;
    *(_DWORD *)((char *)&__p + 10) = v15;
    HIWORD(__p) = 1026;
    *(_DWORD *)v32 = v16;
    *(_WORD *)&v32[4] = 2050;
    *(_QWORD *)&v32[6] = v17;
    *(_WORD *)&v32[14] = 2082;
    *(_QWORD *)&v32[16] = v18;
    _os_log_impl(&dword_242728000, v9, OS_LOG_TYPE_DEFAULT, "[MSLManager] Initializing with, file prefix, %{public}s, file path, %{public}s, file extension, %{public}s, protection class, %{public}d, file size, %{public}lld, file time interval, %{public}u, files to keep, %{public}u, flush timeout, %{public}lld, for domain, %{public}s.", buf, 0x50u);
  }
  sub_24272B878((uint64_t)*v6, (uint64_t)&v21);
  v19 = operator new();
  *(_OWORD *)buf = v21;
  *(_OWORD *)&buf[16] = *(_OWORD *)v22;
  v22[0] = 0;
  v22[1] = 0;
  __p = *(_OWORD *)v24;
  v30 = v23;
  *(_QWORD *)v32 = v25;
  v23 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v25 = 0;
  v33 = v27;
  *(_OWORD *)&v32[8] = *(_OWORD *)v26;
  v26[0] = 0;
  v26[1] = 0;
  v27 = 0;
  v34 = v28;
  sub_242911F3C(v19, (uint64_t)buf);
  if (SHIBYTE(v33) < 0)
    operator delete(*(void **)&v32[8]);
  if ((v32[7] & 0x80000000) != 0)
    operator delete((void *)__p);
  if (SHIBYTE(v30) < 0)
    operator delete(*(void **)&buf[16]);
  sub_24272C3F0(v7, v19);
  if (SHIBYTE(v27) < 0)
    operator delete(v26[0]);
  if (SHIBYTE(v25) < 0)
    operator delete(v24[0]);
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);
  return a1;
}

void sub_24291E584(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t *v2;
  id **v3;
  std::mutex *v4;
  uint64_t v5;
  uint64_t v7;
  va_list va;
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
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  v20 = va_arg(va1, _QWORD);
  sub_24272BB9C((uint64_t)va1);
  MEMORY[0x2494E8384](v5, 0x1032C4044EE41C5);
  sub_24272BB9C((uint64_t)va);
  std::mutex::~mutex(v4);
  sub_24272C3F0(v2, 0);
  sub_24291EB2C(v3, 0);
  _Unwind_Resume(a1);
}

void CMMsl::Manager::~Manager(CMMsl::Manager *this)
{
  NSObject *v2;
  uint64_t v3;
  CMMsl::Writer *v4;
  uint8_t v5[16];

  *(_QWORD *)this = &off_251365710;
  if (qword_257206B58 != -1)
    dispatch_once(&qword_257206B58, &unk_251365730);
  v2 = qword_257206B50;
  if (os_log_type_enabled((os_log_t)qword_257206B50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_242728000, v2, OS_LOG_TYPE_DEFAULT, "[MSLManager] Ending.", v5, 2u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 24));
  v3 = *((_QWORD *)this + 2);
  if (v3)
  {
    v4 = *(CMMsl::Writer **)(v3 + 128);
    if (v4)
      CMMsl::Writer::sync(v4);
  }
  std::mutex::unlock((std::mutex *)((char *)this + 24));
  std::mutex::~mutex((std::mutex *)((char *)this + 24));
  sub_24272C3F0((uint64_t *)this + 2, 0);
  sub_24291EB2C((id **)this + 1, 0);
}

{
  CMMsl::Manager::~Manager(this);
  JUMPOUT(0x2494E8384);
}

void CMMsl::Manager::log(CMMsl::Manager *this, const CMMsl::Item *a2)
{
  NSObject *v4;
  std::mutex *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  if (qword_257206B58 != -1)
    dispatch_once(&qword_257206B58, &unk_251365730);
  v4 = qword_257206B50;
  if (os_log_type_enabled((os_log_t)qword_257206B50, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_debug_impl(&dword_242728000, v4, OS_LOG_TYPE_DEBUG, "[MSLManager] Logging Msl item.", v14, 2u);
  }
  if (*((_QWORD *)this + 2))
  {
    if ((sub_24272C42C(*((_QWORD *)this + 1)) & 1) != 0)
    {
      v5 = (std::mutex *)((char *)this + 24);
      std::mutex::lock((std::mutex *)((char *)this + 24));
      v6 = *((_QWORD *)this + 2);
      v7 = mach_continuous_time();
      v8 = sub_24272AB4C(v7);
      sub_242912278(v6, (uint64_t)a2, v8, v9);
      std::mutex::unlock(v5);
    }
    else
    {
      if (qword_257206B58 != -1)
        dispatch_once(&qword_257206B58, &unk_251365730);
      v11 = qword_257206B50;
      if (os_log_type_enabled((os_log_t)qword_257206B50, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_debug_impl(&dword_242728000, v11, OS_LOG_TYPE_DEBUG, "[MSLManager] Logging is not enabled.", v12, 2u);
      }
    }
  }
  else
  {
    if (qword_257206B58 != -1)
      dispatch_once(&qword_257206B58, &unk_251365730);
    v10 = qword_257206B50;
    if (os_log_type_enabled((os_log_t)qword_257206B50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_242728000, v10, OS_LOG_TYPE_DEFAULT, "[MSLManager] Logging Msl item failed due to an invalid logger pointer.", buf, 2u);
    }
  }
}

void sub_24291E8DC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t CMMsl::Manager::isLoggingEnabled(CMMsl::Manager *this)
{
  return sub_24272C42C(*((_QWORD *)this + 1));
}

void CMMsl::Manager::sync(CMMsl::Manager *this)
{
  std::mutex *v2;
  CMMsl::Writer *v3;

  v2 = (std::mutex *)((char *)this + 24);
  std::mutex::lock((std::mutex *)((char *)this + 24));
  v3 = *(CMMsl::Writer **)(*((_QWORD *)this + 2) + 128);
  if (v3)
    CMMsl::Writer::sync(v3);
  std::mutex::unlock(v2);
}

uint64_t CMMsl::Manager::open(uint64_t a1, uint64_t a2)
{
  return sub_242913114(*(_QWORD *)(a1 + 16), a2);
}

_QWORD *CMMsl::createConfig@<X0>(char *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, char *a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  NSObject *v18;
  _QWORD *result;
  int v20;
  char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (qword_257206B58 != -1)
    dispatch_once(&qword_257206B58, &unk_251365730);
  v18 = qword_257206B50;
  if (os_log_type_enabled((os_log_t)qword_257206B50, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136316930;
    v21 = a1;
    v22 = 2080;
    v23 = a2;
    v24 = 2080;
    v25 = a6;
    v26 = 1024;
    v27 = a7;
    v28 = 2048;
    v29 = a3;
    v30 = 1024;
    v31 = a4;
    v32 = 1024;
    v33 = a5;
    v34 = 2048;
    v35 = a8;
    _os_log_impl(&dword_242728000, v18, OS_LOG_TYPE_DEFAULT, "[CMMsl] Creating config with, file prefix, %s, file path, %s, file extension, %s, protection class, %d, file size, %lld, file time interval, %u, files to keep, %u, flush timeout, %lld", (uint8_t *)&v20, 0x46u);
  }
  *(_QWORD *)a9 = a3;
  *(_DWORD *)(a9 + 8) = a4;
  *(_DWORD *)(a9 + 12) = a5;
  sub_242729870((_QWORD *)(a9 + 16), a2);
  sub_242729870((_QWORD *)(a9 + 40), a1);
  result = sub_242729870((_QWORD *)(a9 + 64), a6);
  *(_DWORD *)(a9 + 88) = a7;
  *(_QWORD *)(a9 + 96) = a8;
  return result;
}

void sub_24291EAC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 63) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 39) < 0)
    operator delete(*v3);
  _Unwind_Resume(exception_object);
}

void sub_24291EAFC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MotionSensorLogging", "MSL");
  v1 = (void *)qword_257206B50;
  qword_257206B50 = (uint64_t)v0;

}

id *sub_24291EB2C(id **a1, id *a2)
{
  id *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_24272C1BC(result);
    JUMPOUT(0x2494E8384);
  }
  return result;
}

uint64_t PBHashBytes()
{
  return MEMORY[0x24BE7B010]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BE7B280](this, a2);
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

uint64_t PB::Data::operator==()
{
  return MEMORY[0x24BE7B2F8]();
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
  off_25135B690(__p);
}

uint64_t operator delete()
{
  return off_25135B698();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25135B6A0(__sz);
}

uint64_t operator new()
{
  return off_25135B6A8();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF278](strm, version, *(_QWORD *)&stream_size);
}

int inflateReset(z_streamp strm)
{
  return MEMORY[0x24BEDF280](strm);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
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

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}


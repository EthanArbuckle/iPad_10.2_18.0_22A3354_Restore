uint64_t sub_1B70E8708()
{
  void *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = off_1ED114578;
  v7 = off_1ED114578;
  if (!off_1ED114578)
  {
    v1 = (void *)sub_1B70E87B0();
    v0 = dlsym(v1, "AFDeviceSupportsSiriUOD");
    v5[3] = (uint64_t)v0;
    off_1ED114578 = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return ((uint64_t (*)(void))v0)();
}

uint64_t sub_1B70E87B0()
{
  uint64_t v0;
  void *v2;

  if (qword_1ED114570)
    return qword_1ED114570;
  qword_1ED114570 = _sl_dlopen();
  v0 = qword_1ED114570;
  if (!qword_1ED114570)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_1B70E8948(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  uint64_t v18;
  BOOL v19;
  const char *v20;
  uint64_t v21;
  int isEqual;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v5 = v1;
  if (v1)
  {
    objc_msgSend_domain(v1, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_code(v5, v7, v8, v9);
    if ((objc_msgSend_isEqual_(v6, v11, *MEMORY[0x1E0D01C48], v12) & 1) != 0)
    {
      v15 = 3;
    }
    else
    {
      if (objc_msgSend_isEqual_(v6, v13, *MEMORY[0x1E0D0D3D0], v14))
        v19 = v10 == 1;
      else
        v19 = 0;
      if (v19)
      {
        v15 = 2;
      }
      else
      {
        if (!objc_msgSend_isEqual_(v6, v17, *MEMORY[0x1E0D0D3B8], v18))
          goto LABEL_15;
        v15 = 1;
        if (v10 == 2 || v10 == 4)
          goto LABEL_21;
        if (v10 != 7)
        {
LABEL_15:
          isEqual = objc_msgSend_isEqual_(v6, v20, *MEMORY[0x1E0D0D3B0], v21);
          if ((unint64_t)(v10 - 1) >= 0xB)
            v23 = 0;
          else
            v23 = (unsigned __int16)(v10 + 6);
          if (isEqual)
            v15 = v23;
          else
            v15 = 0;
          goto LABEL_21;
        }
        v15 = 6;
      }
    }
LABEL_21:
    v30 = *MEMORY[0x1E0CB3388];
    v31[0] = v5;
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v24, v26, (uint64_t)v31, (uint64_t)&v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v28, (uint64_t)CFSTR("com.apple.koa.donate"), v15, v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v16 = 0;
LABEL_22:

  return v16;
}

id sub_1B70E8B9C(void *a1, _QWORD *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend_copy(v3, v4, v5, v6);
    if (objc_msgSend_length(v3, v8, v9, v10))
    {
      v7 = v7;
      v13 = v7;
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("Invalid originAppId: \"%@\""), v12, v7, *MEMORY[0x1E0CB2D50]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v28, (uint64_t)&v27, 1);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("OriginAppId must be a nonempty NSString. Received: %@"), v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v30, (uint64_t)&v29, 1);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v14, v23, (uint64_t)CFSTR("com.apple.koa.donate"), 3, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a2 && v24)
    *a2 = objc_retainAutorelease(v24);

  v13 = 0;
LABEL_10:

  return v13;
}

void sub_1B70E913C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __objc2_class **v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = off_1E6B7A710;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v6 = off_1E6B7A718;
  }
  v7 = objc_alloc(*v6);
  v10 = (void *)objc_msgSend_initWithDonation_(v7, v8, (uint64_t)v13, v9);
LABEL_7:
  v11 = *(_QWORD *)(a1 + 32);
  sub_1B70E8948(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v10, v12);

}

uint64_t KVItemTypeFromFieldType(unsigned __int16 a1)
{
  int v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;

  v1 = a1;
  if (a1 <= 0xC8u)
  {
    v3 = 3;
    if (a1 - 100 >= 5)
      v3 = 0;
    if (a1 - 150 >= 9)
      v4 = v3;
    else
      v4 = 4;
    if (a1 - 50 >= 0x16)
      v5 = v4;
    else
      v5 = 2;
    v6 = a1 - 1 < 0x14;
    v7 = a1 <= 0x31u;
    goto LABEL_58;
  }
  if (a1 > 0x1F3u)
  {
    if (a1 > 0x3B5u)
    {
      v11 = 24;
      if (a1 - 1100 >= 6)
        v11 = 0;
      if (a1 - 1150 >= 7)
        v5 = v11;
      else
        v5 = 25;
      v12 = 22;
      if (a1 - 1000 >= 2)
        v12 = 0;
      if (a1 - 950 >= 3)
        v13 = v12;
      else
        v13 = 21;
      if (a1 - 1050 >= 6)
        v6 = v13;
      else
        v6 = 23;
      v7 = a1 <= 0x44Bu;
    }
    else if (a1 <= 0x2BBu)
    {
      v14 = 15;
      if (a1 - 650 >= 2)
        v14 = 0;
      if (a1 - 600 >= 5)
        v5 = v14;
      else
        v5 = 14;
      v15 = 13;
      if (a1 != 553)
        v15 = 0;
      if (a1 - 551 >= 2)
        v16 = v15;
      else
        v16 = 12;
      if (a1 - 500 >= 2)
        v6 = v16;
      else
        v6 = 11;
      v7 = a1 <= 0x257u;
    }
    else
    {
      v8 = 20;
      if (a1 - 900 >= 2)
        v8 = 0;
      if (a1 - 850 >= 2)
        v9 = v8;
      else
        v9 = 19;
      if (a1 - 800 >= 5)
        v5 = v9;
      else
        v5 = 18;
      v10 = 17;
      if (a1 != 750)
        v10 = 0;
      if (a1 - 700 >= 3)
        v6 = v10;
      else
        v6 = 16;
      v7 = a1 <= 0x31Fu;
    }
LABEL_58:
    if (v7)
      return v6;
    else
      return v5;
  }
  result = 0;
  switch(v1)
  {
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 218:
    case 219:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 230:
    case 231:
    case 232:
      result = 5;
      break;
    case 233:
    case 234:
    case 235:
    case 236:
    case 237:
    case 238:
    case 239:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 249:
    case 256:
    case 257:
    case 258:
    case 259:
    case 260:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 299:
      return result;
    case 250:
    case 251:
    case 252:
    case 253:
    case 254:
    case 255:
      result = 6;
      break;
    case 275:
    case 276:
    case 277:
      result = 7;
      break;
    case 300:
    case 301:
    case 302:
      result = 8;
      break;
    default:
      v17 = v1 - 351;
      v18 = v1 == 400;
      v19 = 10;
      if (!v18)
        v19 = 0;
      if (v17 >= 5)
        result = v19;
      else
        result = 9;
      break;
  }
  return result;
}

void sub_1B70EA8D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B70EA988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70EACF4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  uint64_t *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;

  if (a2 == 2)
  {
    v25 = __cxa_begin_catch(a1);
    v26 = (void *)MEMORY[0x1E0CB35C8];
    a16 = *MEMORY[0x1E0CB2938];
    v27 = (void *)MEMORY[0x1E0CB3940];
    KVItemTypeDescription(v17[16], v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = (*(uint64_t (**)(void *))(*(_QWORD *)v25 + 16))(v25);
    objc_msgSend_stringWithCString_encoding_(v30, v32, v31, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v27, v34, (uint64_t)CFSTR("Caught exception while encoding item with itemType: %@ itemId: %@ \nCaught %@"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    a17 = v36;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&a17, (uint64_t)&a16, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v39, (uint64_t)CFSTR("com.apple.koa.item.builder"), 5, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v18)
    {
      if (v40)
        *v18 = objc_retainAutorelease(v40);
    }

    objc_msgSend__reset(v17, v42, v43, v44);
    __cxa_end_catch();
  }
  else
  {
    if (a2 != 1)
      _Unwind_Resume(a1);
    v45 = objc_begin_catch(a1);
    v46 = (void *)MEMORY[0x1E0CB35C8];
    a14 = *MEMORY[0x1E0CB2938];
    v47 = (void *)MEMORY[0x1E0CB3940];
    KVItemTypeDescription(v17[16], v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v47, v50, (uint64_t)CFSTR("Caught Objc exception while encoding item with itemType: %@ itemId: %@ \nCaught %@"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    a15 = v52;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v53, (uint64_t)&a15, (uint64_t)&a14, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v46, v55, (uint64_t)CFSTR("com.apple.koa.item.builder"), 5, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v18 && v56)
      *v18 = objc_retainAutorelease(v56);

    objc_msgSend__reset(v17, v58, v59, v60);
    objc_end_catch();
  }
  JUMPOUT(0x1B70EAAE4);
}

unint64_t sub_1B70EB018(unint64_t result, uint64_t a2, int a3)
{
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;

  v4 = result;
  if (a3 || *(_BYTE *)(result + 80))
  {
    v5 = sub_1B70EB210(result, a3);
    result = sub_1B70EB2AC((uint64_t *)v4, 8uLL);
    **(_QWORD **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(_QWORD *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2)
      LOWORD(v6) = a2;
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

uint64_t sub_1B70EB0A0(uint64_t a1, const void *a2, unint64_t a3)
{
  _BYTE *v6;
  void *v7;

  sub_1B70EB144(a1);
  sub_1B70EB450(a1, a3 + 1, 4uLL);
  sub_1B70EB2AC((uint64_t *)a1, 1uLL);
  v6 = (_BYTE *)(*(_QWORD *)(a1 + 48) - 1);
  *(_QWORD *)(a1 + 48) = v6;
  *v6 = 0;
  if (a3)
  {
    sub_1B70EB2AC((uint64_t *)a1, a3);
    v7 = (void *)(*(_QWORD *)(a1 + 48) - a3);
    *(_QWORD *)(a1 + 48) = v7;
    memcpy(v7, a2, a3);
  }
  sub_1B70EB210(a1, a3);
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_1B70EB144(uint64_t result)
{
  if (*(_BYTE *)(result + 70))
    __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
  if (*(_DWORD *)(result + 64))
    __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
  return result;
}

uint64_t sub_1B70EB1A4(_DWORD *a1, unsigned int a2)
{
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  sub_1B70EB41C((uint64_t)a1, 4uLL);
  if (!a2 || (v4 = a1[8] - a1[12] + a1[10], v5 = v4 >= a2, v6 = v4 - a2, !v5))
    __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
  return v6 + 4;
}

uint64_t sub_1B70EB210(uint64_t a1, int a2)
{
  uint64_t v4;

  sub_1B70EB41C(a1, 4uLL);
  sub_1B70EB2AC((uint64_t *)a1, 4uLL);
  v4 = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = a2;
  v4 -= 4;
  *(_QWORD *)(a1 + 48) = v4;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

unint64_t sub_1B70EB260(uint64_t *a1, unint64_t a2)
{
  unint64_t result;
  uint64_t v5;

  result = sub_1B70EB2AC(a1, a2);
  a1[6] -= a2;
  if (a2)
  {
    v5 = 0;
    do
      *(_BYTE *)(a1[6] + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t sub_1B70EB2AC(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char *v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (**v15)();

  v2 = a1[6];
  v3 = a1[7];
  if (v2 < v3 || (v6 = (char *)a1[5], v7 = v3 - (_DWORD)v6, v3 < (unint64_t)v6))
    __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
  v8 = a1[4];
  if (v2 - v3 < a2)
  {
    v9 = v8 - v2 + (_DWORD)v6;
    if (v8)
      v10 = v8 >> 1;
    else
      v10 = a1[2];
    if (v10 <= a2)
      v10 = a2;
    v11 = (a1[3] + v8 + v10 - 1) & -a1[3];
    a1[4] = v11;
    v12 = *a1;
    if (v6)
    {
      if (v12)
      {
        v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 32))(v12);
      }
      else
      {
        v15 = &off_1E6B7AC08;
        v13 = (uint64_t)sub_1B70EEE80((uint64_t)&v15, v6, v8, v11, v9, (v3 - (_DWORD)v6));
      }
    }
    else if (v12)
    {
      v13 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v12 + 16))(v12, v11);
    }
    else
    {
      v13 = operator new[]();
    }
    LODWORD(v6) = v13;
    v8 = a1[4];
    v2 = v13 + v8 - v9;
    a1[5] = v13;
    a1[6] = v2;
    a1[7] = v13 + v7;
  }
  if ((v8 - v2 + (_DWORD)v6) >= 0x7FFFFFFF)
    __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  return a2;
}

unint64_t sub_1B70EB41C(uint64_t a1, unint64_t a2)
{
  if (*(_QWORD *)(a1 + 72) < a2)
    *(_QWORD *)(a1 + 72) = a2;
  return sub_1B70EB260((uint64_t *)a1, (a2 - 1) & -(uint64_t)(*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));
}

unint64_t sub_1B70EB450(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(_QWORD *)(a1 + 72) < a3)
    *(_QWORD *)(a1 + 72) = a3;
  return sub_1B70EB260((uint64_t *)a1, (a3 - 1) & (-a2 - (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40))));
}

void sub_1B70EBB48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

_DWORD *sub_1B70EBC60(_DWORD *result, uint64_t a2, unsigned int a3)
{
  unint64_t v4;
  int v5;

  if (a3)
  {
    v4 = (unint64_t)result;
    v5 = sub_1B70EB1A4(result, a3);
    return (_DWORD *)sub_1B70EB018(v4, a2, v5);
  }
  return result;
}

uint64_t sub_1B70EBC9C(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int16 v8;
  unsigned __int16 *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unsigned int *v21;
  _DWORD *v22;

  if (!*(_BYTE *)(a1 + 70))
    __assert_rtn("EndTable", "flatbuffers.h", 1450, "nested");
  sub_1B70EB41C(a1, 4uLL);
  sub_1B70EB2AC((uint64_t *)a1, 4uLL);
  v4 = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v4 - 4) = 0;
  v4 -= 4;
  *(_QWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a1 + 32) - v4 + *(_QWORD *)(a1 + 40);
  if ((unsigned __int16)(*(_WORD *)(a1 + 68) + 2) <= 4u)
    v6 = 4;
  else
    v6 = (unsigned __int16)(*(_WORD *)(a1 + 68) + 2);
  *(_WORD *)(a1 + 68) = v6;
  sub_1B70EB2AC((uint64_t *)a1, v6);
  v7 = (void *)(*(_QWORD *)(a1 + 48) - v6);
  *(_QWORD *)(a1 + 48) = v7;
  bzero(v7, v6);
  v8 = v5 - a2;
  if ((v5 - a2) >= 0x10000)
    __assert_rtn("EndTable", "flatbuffers.h", 1465, "table_object_size < 0x10000");
  v9 = *(unsigned __int16 **)(a1 + 48);
  if (!v9)
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  v9[1] = v8;
  *v9 = *(_WORD *)(a1 + 68);
  v10 = *(_QWORD *)(a1 + 56);
  if (!v10)
    __assert_rtn("scratch_end", "flatbuffers.h", 1026, "scratch_");
  v11 = *(unsigned int *)(a1 + 64);
  v12 = v10 - 8 * v11;
  if ((_DWORD)v11)
  {
    v13 = (int *)(v10 - 8 * v11);
    do
    {
      v14 = *((unsigned __int16 *)v13 + 2);
      if (*(unsigned __int16 *)((char *)v9 + v14))
        __assert_rtn("EndTable", "flatbuffers.h", 1476, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      v15 = *v13;
      v13 += 2;
      *(unsigned __int16 *)((char *)v9 + v14) = v5 - v15;
    }
    while ((unint64_t)v13 < v10);
  }
  *(_QWORD *)(a1 + 56) = v12;
  *(_DWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 68) = 0;
  v17 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  LODWORD(v18) = v17 - (_DWORD)v9 + v16;
  if (*(_BYTE *)(a1 + 81))
  {
    if (!v16)
      __assert_rtn("scratch_data", "flatbuffers.h", 1021, "buf_");
    if (v16 < v12)
    {
      v19 = *v9;
      v20 = v16 + v17;
      v21 = *(unsigned int **)(a1 + 40);
      while (1)
      {
        v18 = *v21;
        if ((_DWORD)v19 == *(unsigned __int16 *)(v20 - v18) && !memcmp((const void *)(v20 - v18), v9, v19))
          break;
        if ((unint64_t)++v21 >= v12)
        {
          LODWORD(v18) = v17 - (_DWORD)v9 + v16;
          goto LABEL_21;
        }
      }
      v9 = (unsigned __int16 *)((char *)v9 + (v17 - (_DWORD)v9 + v16 - v5));
      *(_QWORD *)(a1 + 48) = v9;
    }
  }
LABEL_21:
  if ((_DWORD)v18 == (_DWORD)v17 + (_DWORD)v16 - (_DWORD)v9)
  {
    sub_1B70EB2AC((uint64_t *)a1, 4uLL);
    v22 = *(_DWORD **)(a1 + 56);
    *v22 = v18;
    *(_QWORD *)(a1 + 56) = v22 + 1;
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
  }
  *(_DWORD *)(v16 + v17 - v5) = v18 - v5;
  *(_BYTE *)(a1 + 70) = 0;
  return v5;
}

unint64_t sub_1B70EBF34(unint64_t result, uint64_t a2, int a3)
{
  __int16 v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;

  v3 = a3;
  v5 = result;
  if (a3 || *(_BYTE *)(result + 80))
  {
    sub_1B70EB41C(result, 2uLL);
    sub_1B70EB2AC((uint64_t *)v5, 2uLL);
    v6 = *(_QWORD *)(v5 + 48);
    *(_WORD *)(v6 - 2) = v3;
    v6 -= 2;
    *(_QWORD *)(v5 + 48) = v6;
    v7 = (*(_DWORD *)(v5 + 32) - v6 + *(_DWORD *)(v5 + 40));
    result = sub_1B70EB2AC((uint64_t *)v5, 8uLL);
    **(_QWORD **)(v5 + 56) = v7 | (a2 << 32);
    *(_QWORD *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    v8 = *(unsigned __int16 *)(v5 + 68);
    if (v8 <= a2)
      LOWORD(v8) = a2;
    *(_WORD *)(v5 + 68) = v8;
  }
  return result;
}

unint64_t sub_1B70EBFE0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  sub_1B70EB144(a1);
  *(_BYTE *)(a1 + 70) = 1;
  v6 = a3 * a2;
  sub_1B70EB450(a1, v6, 4uLL);
  return sub_1B70EB450(a1, v6, a3);
}

uint64_t sub_1B70EC038(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 71))
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  result = *(_QWORD *)(a1 + 48);
  if (!result)
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  return result;
}

uint64_t sub_1B70EC098(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 70))
    __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
  *(_BYTE *)(a1 + 70) = 0;
  return sub_1B70EB210(a1, a2);
}

uint64_t sub_1B70EC0D4(uint64_t a1, unsigned int a2, const char *a3, int a4)
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t result;

  v8 = a3 != 0;
  sub_1B70EB144(a1);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
  v9 = 4;
  if (a4)
    v9 = 8;
  sub_1B70EB450(a1, v9 + 4 * v8, *(_QWORD *)(a1 + 72));
  if (a3)
  {
    if (strlen(a3) != 4)
      __assert_rtn("Finish", "flatbuffers.h", 2154, "strlen(file_identifier) == kFileIdentifierLength");
    sub_1B70EB2AC((uint64_t *)a1, 4uLL);
    v10 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v10 - 4;
    *(_DWORD *)(v10 - 4) = *(_DWORD *)a3;
  }
  v11 = sub_1B70EB1A4((_DWORD *)a1, a2);
  result = sub_1B70EB210(a1, v11);
  if (a4)
    result = sub_1B70EB210(a1, *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
  *(_BYTE *)(a1 + 71) = 1;
  return result;
}

void sub_1B70ECAF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B70ECE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_1B70ECEBC(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0D0D3F0];
  v9 = a2;
  v10 = a1;
  v11 = [v8 alloc];
  v20 = 0;
  v13 = (void *)objc_msgSend_initWithContent_metaContent_error_(v11, v12, (uint64_t)v10, (uint64_t)v9, &v20);

  v14 = v20;
  v15 = v14;
  if (v13)
  {
    v16 = v13;
  }
  else
  {
    sub_1B7100D70(v14, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4 && v17)
      *a4 = objc_retainAutorelease(v17);

  }
  return v13;
}

void sub_1B70ED0FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70ED118(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v6 = objc_msgSend_fieldType(v16, v3, v4, v5);
  switch(v6)
  {
    case 702:
      v10 = *(_QWORD *)(a1[4] + 8);
      v11 = 2;
      goto LABEL_6;
    case 701:
      objc_msgSend_value(v16, v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[6];
      goto LABEL_8;
    case 700:
      v10 = *(_QWORD *)(a1[4] + 8);
      v11 = 1;
LABEL_6:
      *(_DWORD *)(v10 + 24) = v11;
      objc_msgSend_value(v16, v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[5];
LABEL_8:
      v14 = *(_QWORD *)(v13 + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v12;

      break;
  }

}

void sub_1B70ED2C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t KVAdditionalFieldTypeToNumber(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, a1, a4);
}

uint64_t sub_1B70ED318(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  unsigned __int16 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v5 = a1;
  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend_cascadeItemTypeFromItemType_(KVItemConverter, a2, a1, a4);
  if ((_DWORD)v7 == (unsigned __int16)*MEMORY[0x1E0D0D3D8])
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)MEMORY[0x1E0CB3940];
    if (v5 - 1 >= 0x19)
      v10 = 0;
    else
      v10 = v5;
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v6, (uint64_t)off_1E6B7ADF0[v10], 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v9, v12, (uint64_t)CFSTR("KVItemType: %@ not supported by Cascade"), v13, v11, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, (uint64_t)&v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v17, (uint64_t)CFSTR("com.apple.koa.donate"), 2, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2 && v18)
      *(_QWORD *)a2 = objc_retainAutorelease(v18);

  }
  return v7;
}

void sub_1B70ED484()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.vocabulary", "Koa");
  v1 = (void *)qword_1ED114588;
  qword_1ED114588 = (uint64_t)v0;

}

_QWORD *sub_1B70ED4B4(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[11];
  if (v2)
  {
    sub_1B70EEE38(*(_QWORD **)(v2 + 8));
    MEMORY[0x1BCCA29F4](v2, 0x1060C40C2B13FB5);
  }
  if (a1[5])
  {
    if (*a1)
      (*(void (**)(_QWORD))(*(_QWORD *)*a1 + 24))(*a1);
    else
      MEMORY[0x1BCCA29DC](a1[5], 0x1000C8077774924);
  }
  a1[5] = 0;
  if (*((_BYTE *)a1 + 8) && *a1)
    (*(void (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  *a1 = 0;
  *((_BYTE *)a1 + 8) = 0;
  return a1;
}

uint64_t KVFieldTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4;
  uint64_t v5;

  v4 = objc_msgSend_unsignedShortValue(a1, a2, a3, a4);
  v5 = v4;
  if (KVItemTypeFromFieldType(v4))
    return v5;
  else
    return 0;
}

void sub_1B70EDE20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70EE078(_Unwind_Exception *a1, uint64_t a2, void *a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a3);

  sub_1B70ED4B4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1B70EE4B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B70EE590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70EE888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1B70EE9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B70EEAAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70EEB00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1B70EEB2C(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v6 = objc_msgSend_formatOptions(v2, v3, v4, v5);
    objc_msgSend_setFormatOptions_(v2, v7, v6 | 0x800, v8);
    objc_msgSend_dateFromString_(v2, v9, (uint64_t)v1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1B70EEBA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1B70EEBBC(unsigned int *a1)
{
  id v2;
  const char *v3;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v2, v3, (uint64_t)(a1 + 1), *a1, 4, 0);
}

uint64_t sub_1B70EEBF8(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;

  if ((a2 & 3) != 0 && *(_BYTE *)(a1 + 40))
    return 0;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 5 || v2 - 4 < a2)
    return 0;
  v4 = *(unsigned int *)(*(_QWORD *)a1 + a2);
  if ((int)v4 < 1)
    return 0;
  if (v2 - 1 >= v4 + a2)
    return v4;
  return 0;
}

BOOL sub_1B70EEC48(uint64_t *a1, int *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;

  v2 = *a1;
  v3 = (unint64_t)a2 - *a1;
  if ((v3 & 3) != 0 && *((_BYTE *)a1 + 40))
    return 0;
  v4 = a1[1];
  v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5)
    return 0;
  v6 = *a2;
  v7 = *((_DWORD *)a1 + 5);
  v8 = *((_DWORD *)a1 + 4) + 1;
  *((_DWORD *)a1 + 4) = v8;
  v9 = *((_DWORD *)a1 + 6) + 1;
  *((_DWORD *)a1 + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)a1 + 7))
    return 0;
  v10 = v3 - v6;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (*((_BYTE *)a1 + 40) || v4 - 2 < v10)
      return v11;
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((_BYTE *)a1 + 40))
    return 0;
  v5 = v4 >= v12;
  v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL sub_1B70EED00(int *a1, _QWORD *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)a1 - *a1);
  return *v3 <= a3
      || (v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || sub_1B70EEBF8((uint64_t)a2, (unint64_t)a1 + v4 - *a2) != 0;
}

BOOL sub_1B70EED54(_QWORD *a1, unsigned int *a2)
{
  _BOOL8 result;
  unint64_t v4;
  unint64_t v6;

  if (!a2)
    return 1;
  v6 = 0;
  result = sub_1B70EEDC8((uint64_t)a1, a2, 1uLL, &v6);
  if (result)
  {
    v4 = a1[1];
    return v4 >= 2 && v4 - 1 >= v6 && *(_BYTE *)(*a1 + v6) == 0;
  }
  return result;
}

BOOL sub_1B70EEDC8(uint64_t a1, unsigned int *a2, unint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  v4 = (unint64_t)a2 - *(_QWORD *)a1;
  if ((v4 & 3) != 0 && *(_BYTE *)(a1 + 40))
    return 0;
  v5 = *(_QWORD *)(a1 + 8);
  if (v5 < 5 || v5 - 4 < v4)
    return 0;
  v7 = *a2;
  if (0x7FFFFFFF / a3 <= v7)
    return 0;
  v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    v5 = *(_QWORD *)(a1 + 8);
  }
  v9 = v5 > v8;
  v10 = v5 - v8;
  return v9 && v10 >= v4;
}

void sub_1B70EEE38(_QWORD *a1)
{
  if (a1)
  {
    sub_1B70EEE38(*a1);
    sub_1B70EEE38(a1[1]);
    operator delete(a1);
  }
}

void sub_1B70EEE70(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

char *sub_1B70EEE80(uint64_t a1, char *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  char *v12;

  if (a4 <= a3)
    __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
  v12 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)a1 + 16))(a1, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(uint64_t, char *, unint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3);
  return v12;
}

void sub_1B70EEF4C()
{
  JUMPOUT(0x1BCCA29F4);
}

uint64_t sub_1B70EEF60()
{
  return operator new[]();
}

void sub_1B70EEF78(uint64_t a1, uint64_t a2)
{
  if (a2)
    JUMPOUT(0x1BCCA29DCLL);
}

void sub_1B70EF080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B70EF0F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70EF4A8(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  sub_1B70ED4B4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1B70EF6A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B70EFB90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B70EFE38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70EFEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F0198(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_1B70F03A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1B70F0430()
{
  JUMPOUT(0x1B70F0414);
}

void sub_1B70F04A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F04FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1B70F084C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_copy(a1, a2, a3, a4);
  if (objc_msgSend_length(v5, v6, v7, v8))
  {
    v11 = v5;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("Invalid userId: \"%@\""), v10, v5, *MEMORY[0x1E0CB2D50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v21, (uint64_t)&v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, (uint64_t)CFSTR("com.apple.koa.donate"), 5, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2 && v17)
      *(_QWORD *)a2 = objc_retainAutorelease(v17);

    v11 = 0;
  }

  return v11;
}

void sub_1B70F0B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B70F0D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B70F0D30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B70F0D40(uint64_t a1)
{

}

uint64_t sub_1B70F0D48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id obj;

  v3 = a2;
  v4 = (void *)MEMORY[0x1BCCA2B38]();
  objc_msgSend_datasetInfo(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_originAppId(v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D3E448]);
    v15 = *MEMORY[0x1E0D0D3C8];
    objc_msgSend_originAppId(v8, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v20 + 40);
    v22 = (void *)objc_msgSend_initWithKey_value_error_(v14, v21, v15, (uint64_t)v19, &obj);
    objc_storeStrong((id *)(v20 + 40), obj);

    if (!v22)
    {
      v28 = 0;
      goto LABEL_6;
    }
    objc_msgSend_addObject_(v9, v23, (uint64_t)v22, v24);

  }
  v25 = *(_QWORD *)(a1 + 56);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v37 = *(id *)(v26 + 40);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[2] = sub_1B70F0F28;
  v30[3] = &unk_1E6B7ACD0;
  v30[1] = 3221225472;
  v36 = v25;
  v31 = *(id *)(a1 + 32);
  v32 = v8;
  v33 = v9;
  v34 = *(id *)(a1 + 40);
  v35 = *(id *)(a1 + 48);
  v28 = objc_msgSend_enumerateCascadeItemsWithError_usingBlock_(v3, v27, (uint64_t)&v37, (uint64_t)v30);
  objc_storeStrong((id *)(v26 + 40), v37);

LABEL_6:
  objc_autoreleasePoolPop(v4);

  return v28;
}

uint64_t sub_1B70F0F28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  id v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  uint64_t v92;
  unsigned int v94;
  id obj;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  void *v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v10 = objc_msgSend_count(v5, v7, v8, v9);
  v97 = (void *)objc_msgSend_initWithCapacity_(v6, v11, v10, v12);
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v13 = v5;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v102, (uint64_t)v108, 16);
  if (v15)
  {
    v16 = v15;
    obj = v13;
    v96 = *(_QWORD *)v103;
    v94 = a2;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v103 != v96)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v17);
        v19 = objc_alloc(MEMORY[0x1E0D3E470]);
        objc_msgSend_content(v18, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedIdentifier(v18, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v101 = *(id *)(v32 + 40);
        v34 = (void *)objc_msgSend_initWithContent_sharedIdentifier_error_(v19, v33, (uint64_t)v27, (uint64_t)v31, &v101);
        objc_storeStrong((id *)(v32 + 40), v101);

        if (!v34)
          goto LABEL_15;
        v35 = objc_alloc(MEMORY[0x1E0D3E460]);
        objc_msgSend_metaContent(v18, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_instanceIdentifier(v18, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v100 = *(id *)(v48 + 40);
        v50 = (void *)objc_msgSend_initWithMetaContent_instanceIdentifier_error_(v35, v49, (uint64_t)v43, (uint64_t)v47, &v100);
        objc_storeStrong((id *)(v48 + 40), v100);

        if (!v50)
          goto LABEL_14;
        v51 = objc_alloc(MEMORY[0x1E0D3E458]);
        v52 = *(_QWORD *)(a1 + 32);
        v107 = v50;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v53, (uint64_t)&v107, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v99 = *(id *)(v55 + 40);
        v57 = (void *)objc_msgSend_initWithSharedItem_deviceIndexes_localInstances_error_(v51, v56, (uint64_t)v34, v52, v54, &v99);
        objc_storeStrong((id *)(v55 + 40), v99);

        if (!v57)
        {

LABEL_14:
LABEL_15:
          v92 = 0;
          v79 = obj;
          v91 = obj;
          goto LABEL_16;
        }
        objc_msgSend_addObject_(v97, v58, (uint64_t)v57, v59);

        ++v17;
      }
      while (v16 != v17);
      v13 = obj;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v60, (uint64_t)&v102, (uint64_t)v108, 16);
      a2 = v94;
      if (v16)
        continue;
      break;
    }
  }

  v61 = objc_alloc(MEMORY[0x1E0D3E468]);
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v62, a2, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userId(*(void **)(a1 + 40), v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = *(_QWORD *)(a1 + 48);
  v70 = (void *)MEMORY[0x1E0CB37E8];
  v74 = objc_msgSend_count(v13, v71, v72, v73);
  objc_msgSend_numberWithUnsignedInteger_(v70, v75, v74, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)MEMORY[0x1E0CB37E8];
  v79 = v13;
  v83 = objc_msgSend_count(v13, v80, v81, v82);
  objc_msgSend_numberWithUnsignedInteger_(v78, v84, v83, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *(_QWORD *)(a1 + 56);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v87, (uint64_t)&v106, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v98 = *(id *)(v89 + 40);
  v91 = (void *)objc_msgSend_initWithItemType_accountIdentifier_descriptors_sharedItemCount_localItemInstanceCount_devices_items_error_(v61, v90, (uint64_t)v64, (uint64_t)v68, v69, v77, v86, v88, v97, &v98);
  objc_storeStrong((id *)(v89 + 40), v98);

  if (v91)
    v92 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    v92 = 0;
LABEL_16:

  return v92;
}

BOOL sub_1B70F1344(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id obj;

  v3 = (objc_class *)MEMORY[0x1E0D0D400];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend_data(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  v12 = (void *)objc_msgSend_initWithData_error_(v5, v11, (uint64_t)v9, (uint64_t)&obj);
  objc_storeStrong((id *)(v10 + 40), obj);

  if (v12)
    objc_msgSend_addObject_(*(void **)(a1 + 32), v13, (uint64_t)v12, v14);

  return v12 != 0;
}

uint64_t sub_1B70F13F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend_data(a2, (const char *)a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v6, (uint64_t)v5, v7);

  return 1;
}

void sub_1B70F1694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1B70F16C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id obj;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend_toCascadeItem_(a2, (const char *)a2, (uint64_t)&obj, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    objc_msgSend_content(v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_class();
    v15 = objc_msgSend_itemType(v11, v12, v13, v14);

    v16 = *(void **)(a1 + 32);
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v17, v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v16, v20, (uint64_t)v19, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = *(void **)(a1 + 32);
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v26, v15, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v25, v29, (uint64_t)v22, (uint64_t)v28);

    }
    objc_msgSend_addObject_(v22, v23, (uint64_t)v6, v24);

  }
  return v6 != 0;
}

id KVUserIdHash(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a1)
  {
    objc_msgSend_stringByAppendingString_(CFSTR("UserEx"), a2, a1, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    KVHash64String(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id KVUserIdHashToString(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = objc_msgSend_unsignedLongLongValue(a1, a2, a3, a4);
    objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%llx"), v7, v5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id KVUserIdHashFromString(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = a1;
  v7 = KVScanHexString((uint64_t)v1, v2, v3, v4);
  if (v7 || objc_msgSend_isEqual_(v1, v5, (uint64_t)CFSTR("0"), v6))
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

__CFString *KVUserDescription(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;

  v3 = a1;
  v4 = a2;
  v8 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("\"%@\""), v7, v3);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_4:
        v10 = (void *)MEMORY[0x1E0CB3940];
        KVUserIdHashToString(v8, v5, v6, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("<%@>"), v13, v11);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@:%@%@"), v7, CFSTR("UserEx"), v9, v14);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {
      v9 = &stru_1E6B7B918;
      if (v4)
        goto LABEL_4;
    }
    v14 = &stru_1E6B7B918;
    goto LABEL_8;
  }
  v15 = CFSTR("Default");
LABEL_9:

  return v15;
}

id KVUserIdHashFromDataSiteURL(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend_lastPathComponent(v1, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v5, v6, (uint64_t)CFSTR("Default"), v7) & 1) != 0)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  KVUserIdHashFromString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "KVUserIdHashFromDataSiteURL";
      v13 = 2112;
      v14 = v1;
      _os_log_error_impl(&dword_1B70E7000, v9, OS_LOG_TYPE_ERROR, "%s Unrecognized dataSiteURL: %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

uint64_t KVProtectionClassForDataSiteURL(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_lastPathComponent(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v4, v5, (uint64_t)CFSTR("Default"), v6))
    v7 = 3;
  else
    v7 = 6;

  return v7;
}

id KVDataSiteURL(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v4 = a2;
  if (v4)
  {
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v3, (uint64_t)CFSTR("UserEx"), 1, a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    KVUserIdHashToString(v4, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v10, (uint64_t)v9, 1, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v3, (uint64_t)CFSTR("Default"), 1, a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id KVAllDataSites(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int isDirectory;
  int v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  int v46;
  int v47;
  const char *v48;
  uint64_t v49;
  BOOL v50;
  NSObject *v51;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  unsigned __int8 v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  id v67;
  uint8_t v68[4];
  const char *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v6, (uint64_t)CFSTR("Default"), 1, v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v5, v12, (uint64_t)v11, (uint64_t)&v63);
  v14 = v63;

  if (isDirectory)
    v17 = v14 == 0;
  else
    v17 = 1;
  if (!v17)
    objc_msgSend_addObject_(v57, v15, (uint64_t)v7, v16);
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v15, (uint64_t)CFSTR("UserEx"), 1, v1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_fileExistsAtPath_isDirectory_(v5, v23, (uint64_t)v22, (uint64_t)&v63);
  v25 = v63;

  if (!v24 || !v25)
    goto LABEL_22;
  objc_msgSend_path(v18, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend_contentsOfDirectoryAtPath_error_(v5, v30, (uint64_t)v29, (uint64_t)&v62);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v62;

  if (v31)
  {
    v54 = v32;
    v55 = v7;
    v56 = v1;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v33 = v31;
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v58, (uint64_t)v68, 16);
    if (v35)
    {
      v37 = v35;
      v38 = *(_QWORD *)v59;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v59 != v38)
            objc_enumerationMutation(v33);
          objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v36, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v39), 1, v18, v54);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_path(v40, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend_fileExistsAtPath_isDirectory_(v5, v45, (uint64_t)v44, (uint64_t)&v63);
          v47 = v63;

          if (v46)
            v50 = v47 == 0;
          else
            v50 = 1;
          if (!v50)
            objc_msgSend_addObject_(v57, v48, (uint64_t)v40, v49);

          ++v39;
        }
        while (v37 != v39);
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v58, (uint64_t)v68, 16);
      }
      while (v37);
    }

    v7 = v55;
    v1 = v56;
LABEL_22:
    v51 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "_detectDataSites";
      v66 = 2112;
      v67 = v57;
      _os_log_debug_impl(&dword_1B70E7000, v51, OS_LOG_TYPE_DEBUG, "%s Managed data sites: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v53 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v68 = 136315394;
    v69 = "_detectDataSites";
    v70 = 2112;
    v71 = v32;
    _os_log_error_impl(&dword_1B70E7000, v53, OS_LOG_TYPE_ERROR, "%s Failed to resolve UserEx data site directories: %@", v68, 0x16u);
  }

LABEL_24:
  return v57;
}

id KVGetOrCreateDirectoryPath(uint64_t a1, char *a2)
{
  id v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], a2, a1, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    KVGetOrCreateDirectoryURL(v3, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, *MEMORY[0x1E0CB28A8], -1000, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    v4 = 0;
    if (a2 && v5)
    {
      v3 = objc_retainAutorelease(v5);
      v4 = 0;
      *(_QWORD *)a2 = v3;
    }
  }

  return v4;
}

id KVGetOrCreateDirectoryURL(void *a1, _QWORD *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  int DirectoryAtURL_withIntermediateDirectories_attributes_error;
  id v10;
  void *v11;
  void *v12;

  v6 = a1;
  if (v6)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v7, v8, (uint64_t)v6, 1, 0, a2);

    v10 = 0;
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
      v10 = v6;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v3, *MEMORY[0x1E0CB28A8], -1000, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2 && v11)
      *a2 = objc_retainAutorelease(v11);

    v10 = 0;
  }

  return v10;
}

uint64_t KVRemoveItemIfExistsAtPath(void *a1, _QWORD *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v7, (uint64_t)v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = KVRemoveItemIfExistsAtURL(v9, a2);
    return v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB28A8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("Invalid path: \"%@\""), v8, v3, *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v21, (uint64_t)&v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v17, v13, -1000, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      if (v18)
        *a2 = objc_retainAutorelease(v18);
    }

    return 0;
  }
}

uint64_t KVRemoveItemIfExistsAtURL(void *a1, _QWORD *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  char v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a1;
  if (v6)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v9 = objc_msgSend_removeItemAtURL_error_(v7, v8, (uint64_t)v6, (uint64_t)&v25);
    v10 = v25;
    v14 = v10;
    if ((v9 & 1) != 0)
    {

LABEL_9:
      v22 = 1;
      goto LABEL_10;
    }
    v23 = objc_msgSend_code(v10, v11, v12, v13);

    if (v23 == 4)
      goto LABEL_9;
    v22 = 0;
    if (a2 && v14)
    {
      v14 = objc_retainAutorelease(v14);
      v22 = 0;
      *a2 = v14;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("Invalid item URL: %@"), v5, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v27, (uint64_t)&v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v19, v16, -1000, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2 && v20)
      *a2 = objc_retainAutorelease(v20);

    v22 = 0;
  }
LABEL_10:

  return v22;
}

uint64_t KVWritePropertyList(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  char isDirectory;
  NSObject *v41;
  unsigned __int8 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v8, a1, 200, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v9, v10, v11, v12))
  {
    objc_msgSend_path(v7, v13, v14, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    v21 = open_dprotected_np(v20, 1538, a3, 0, 384);

    v22 = objc_alloc(MEMORY[0x1E0CB3608]);
    v24 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v22, v23, v21, 1);
    v29 = objc_msgSend_writeData_error_(v24, v25, (uint64_t)v9, a4);
    if ((v29 & 1) == 0)
    {
      objc_msgSend_URLByDeletingLastPathComponent(v7, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0;
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v38, v39, (uint64_t)v34, (uint64_t)&v43);

      if ((isDirectory & 1) == 0)
      {
        v41 = qword_1ED114588;
        if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v45 = "KVWritePropertyList";
          v46 = 2112;
          v47 = v34;
          v48 = 1024;
          v49 = v43;
          _os_log_error_impl(&dword_1B70E7000, v41, OS_LOG_TYPE_ERROR, "%s Parent directory: %@ does not exist (isDirectory: %i)", buf, 0x1Cu);
        }
      }

    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

id KVReadPropertyList(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v5;
  void *v6;
  void *v7;

  objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], a2, a1, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v5, (uint64_t)v6, (uint64_t)a2, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL KVInitializeModularFilesystemLayout()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  sub_1B70F29B4();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  KVGetOrCreateDirectoryURL(v0, &v42);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v42;

  if (v1)
  {
    sub_1B70F2A08();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v3, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v2;
    objc_msgSend_contentsOfDirectoryAtPath_error_(v7, v12, (uint64_t)v11, (uint64_t)&v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v41;

    if (v13)
    {
      if ((unint64_t)objc_msgSend_count(v13, v15, v16, v17) >= 2)
      {
        v34 = v13;
        v35 = v1;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v18 = v13;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v37, (uint64_t)v49, 16);
        if (v20)
        {
          v23 = v20;
          v24 = *(_QWORD *)v38;
          do
          {
            v25 = 0;
            v26 = v14;
            do
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v18);
              v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v25);
              if ((objc_msgSend_isEqual_(v27, v21, (uint64_t)CFSTR("Modules"), v22, v34, v35) & 1) != 0)
              {
                v14 = v26;
              }
              else
              {
                objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x1E0C99E98], v21, (uint64_t)v27, (uint64_t)v3);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v26;
                v29 = KVRemoveItemIfExistsAtURL(v28, &v36);
                v14 = v36;

                if ((v29 & 1) == 0)
                {
                  v30 = qword_1ED114588;
                  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    v44 = "KVInitializeModularFilesystemLayout";
                    v45 = 2112;
                    v46 = v28;
                    v47 = 2112;
                    v48 = v14;
                    _os_log_error_impl(&dword_1B70E7000, v30, OS_LOG_TYPE_ERROR, "%s Failed to remove file: %@ error: %@", buf, 0x20u);
                  }
                }

                v26 = v14;
              }
              ++v25;
            }
            while (v23 != v25);
            v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v37, (uint64_t)v49, 16);
          }
          while (v23);
        }

        v13 = v34;
        v1 = v35;
      }
    }
    else
    {
      v32 = qword_1ED114588;
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "KVInitializeModularFilesystemLayout";
        v45 = 2112;
        v46 = v14;
        _os_log_error_impl(&dword_1B70E7000, v32, OS_LOG_TYPE_ERROR, "%s Failed to read root directory contents: %@", buf, 0x16u);
      }
    }

    v2 = v14;
  }
  else
  {
    v31 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "KVInitializeModularFilesystemLayout";
      v45 = 2112;
      v46 = v2;
      _os_log_error_impl(&dword_1B70E7000, v31, OS_LOG_TYPE_ERROR, "%s Modular Filesystem initialization failed: %@", buf, 0x16u);
    }
  }

  return v1 != 0;
}

id sub_1B70F29B4()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  sub_1B70F2A08();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, (uint64_t)CFSTR("Modules"), 1, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id sub_1B70F2A08()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  v0 = (void *)CPSharedResourcesDirectory();
  objc_msgSend_stringByAppendingPathComponent_(v0, v1, (uint64_t)CFSTR("Library/Assistant/SiriVocabulary"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v4, (uint64_t)v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id KVSetsRootDirectoryURL()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  sub_1B70F29B4();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, (uint64_t)CFSTR("Sets"), 1, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id KVSnapshotRootDirectoryURL()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  sub_1B70F29B4();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, (uint64_t)CFSTR("Snapshot"), 1, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id KVTaskManagerRootDirectoryURL()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  sub_1B70F29B4();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v2, (uint64_t)CFSTR("Task"), 1, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1B70F2CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B70F2EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B70F2EF4()
{
  sub_1B70F2F64("vector");
}

void *sub_1B70F2F08(unint64_t a1)
{
  if (a1 >> 62)
    sub_1B70F2F3C();
  return operator new(4 * a1);
}

void sub_1B70F2F3C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1B70F2F64(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1B70F2FB4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6B7A890, MEMORY[0x1E0DE42D0]);
}

void sub_1B70F2FA0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1B70F2FB4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1B70F3464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t sub_1B70F3D64(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t sub_1B70F3D80(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t sub_1B70F3D98(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void sub_1B70F3DB0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      v15 = v5;
      objc_msgSend_clientId(WeakRetained, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "-[KVXPCClient _errorHandlerWithCompletion:]_block_invoke";
      v22 = 2112;
      v23 = v3;
      v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_1B70E7000, v15, OS_LOG_TYPE_ERROR, "%s XPC request hit error (%@) for client %@", (uint8_t *)&v20, 0x20u);

    }
    v9 = objc_msgSend_interruptionCode(WeakRetained, v6, v7, v8);
    objc_msgSend_setFailureCode_(WeakRetained, v10, v9, v11);
    objc_msgSend_setConnection_(WeakRetained, v12, 0, v13);
  }
  else
  {
    v9 = 0;
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v9);

}

void sub_1B70F3EFC(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_INFO))
    {
      v6 = *(unsigned __int16 *)(a1 + 40);
      v7 = v3;
      objc_msgSend_clientId(WeakRetained, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[KVXPCClient _failureHandlerWithResponse:]_block_invoke";
      v16 = 1024;
      v17 = v6;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1B70E7000, v7, OS_LOG_TYPE_INFO, "%s XPC connection terminated (%u) for client %@", (uint8_t *)&v14, 0x1Cu);

    }
    objc_msgSend_setFailureCode_(WeakRetained, v4, *(unsigned __int16 *)(a1 + 40), v5);
    objc_msgSend_setConnection_(WeakRetained, v12, 0, v13);
  }

}

void sub_1B70F43C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  sub_1B70ED4B4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1B70F4994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B70F4CD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F4D54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F4E28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F4FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5250(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F5328(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F53D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5454(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F54F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F5724(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F58AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5980(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5A00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5A78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F5AF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F5B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B70F5C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1B70F5FAC(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 4)
    return *((id *)&off_1E6B7ADB8 + a1);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%u"), a4, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_1B70F6000(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v11;

  v1 = a1;
  v11 = objc_msgSend_length(v1, v2, v3, v4);
  v5 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v7 = (void *)objc_msgSend_initWithBytes_length_(v5, v6, (uint64_t)&v11, 4);
  objc_msgSend_appendData_(v7, v8, (uint64_t)v1, v9);

  return v7;
}

id KVItemTypeToNumber(unsigned __int16 a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned __int16 v4;

  if ((unsigned __int16)(a1 - 1) >= 0x19u)
    v4 = 0;
  else
    v4 = a1;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], a2, v4, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL KVItemTypeIsValid(unsigned __int16 a1)
{
  return a1 - 1 < 0x19;
}

uint64_t KVItemTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  LODWORD(result) = objc_msgSend_unsignedShortValue(a1, a2, a3, a4);
  if ((result - 1) >= 0x19)
    return 0;
  else
    return result;
}

uint64_t KVItemTypeName(unsigned __int16 a1, const char *a2)
{
  uint64_t v2;

  v2 = a1;
  if (a1 - 1 >= 0x19)
    v2 = 0;
  return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E6B7ADF0[v2], 4);
}

uint64_t KVItemTypeFromName(void *a1)
{
  const char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v3 = a1;
  if (qword_1EF151F18 != -1)
    dispatch_once(&qword_1EF151F18, &unk_1E6B7AC30);
  objc_msgSend_objectForKey_((void *)qword_1EF151F10, v1, (uint64_t)v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);
  if (v8 - 1 >= 0x19)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

void sub_1B70F617C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F6198()
{
  id v0;
  void *v1;
  const char *v2;
  uint64_t i;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1EF151F10;
  qword_1EF151F10 = (uint64_t)v0;

  for (i = 0; i != 26; ++i)
  {
    if ((unsigned __int16)i - 1 <= 0x18)
    {
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)off_1E6B7ADF0[i], 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)qword_1EF151F10;
        KVItemTypeToNumber(i, v4, v5, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v9, (uint64_t)v7);

      }
    }
  }
}

void sub_1B70F6258(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id KVItemTypeDescription(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if ((unsigned __int16)a1 - 1 >= 0x19)
    v4 = 0;
  else
    v4 = (unsigned __int16)a1;
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E6B7ADF0[v4], 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v6, a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ (%@)"), v10, v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1B70F631C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t KVItemTypeFromCascadeItemType(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_itemTypeFromCascadeItemType_(KVItemConverter, a2, a1, a4);
}

id KVFieldTypeToNumber(unsigned __int16 a1)
{
  const char *v2;
  uint64_t v3;
  unsigned __int16 v4;

  if (KVItemTypeFromFieldType(a1))
    v4 = a1;
  else
    v4 = 0;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v2, v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL KVFieldTypeIsValid(unsigned __int16 a1)
{
  return KVItemTypeFromFieldType(a1) != 0;
}

BOOL KVFieldTypeIsValidForItemType(unsigned __int16 a1, uint64_t a2)
{
  return a2 && KVItemTypeFromFieldType(a1) == a2;
}

uint64_t KVFieldTypeName(unsigned __int16 a1)
{
  const char *v2;
  unsigned __int16 v3;
  uint64_t result;
  const char *v5;

  if (KVItemTypeFromFieldType(a1))
    v3 = a1;
  else
    v3 = 0;
  if (v3 <= 0xC8u)
  {
    v5 = "Undefined";
    switch(v3)
    {
      case 0u:
LABEL_201:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)v5, 4);
        break;
      case 1u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_ContactName", 4);
        break;
      case 2u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_ContactGroupName", 4);
        break;
      case 3u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_PhotoTag", 4);
        break;
      case 4u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_PhotoAlbumName", 4);
        break;
      case 5u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_WorkoutActivityName", 4);
        break;
      case 6u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_CarProfileName", 4);
        break;
      case 7u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_CarName", 4);
        break;
      case 8u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_PaymentsOrganizationName", 4);
        break;
      case 9u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_PaymentsAccountNickname", 4);
        break;
      case 0xAu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_NotebookItemTitle", 4);
        break;
      case 0xBu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_NotebookItemGroupName", 4);
        break;
      case 0xCu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_MediaPlaylistTitle", 4);
        break;
      case 0xDu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_MediaMusicArtistName", 4);
        break;
      case 0xEu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_MediaAudiobookTitle", 4);
        break;
      case 0xFu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_MediaAudiobookAuthorName", 4);
        break;
      case 0x10u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_MediaShowTitle", 4);
        break;
      case 0x11u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_VoiceCommandName", 4);
        break;
      case 0x12u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_PhotoMemoryName", 4);
        break;
      case 0x13u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_MediaUserContext", 4);
        break;
      case 0x14u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CustomTerm_VocabularyId", 4);
        break;
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
      case 0x4Eu:
      case 0x4Fu:
      case 0x50u:
      case 0x51u:
      case 0x52u:
      case 0x53u:
      case 0x54u:
      case 0x55u:
      case 0x56u:
      case 0x57u:
      case 0x58u:
      case 0x59u:
      case 0x5Au:
      case 0x5Bu:
      case 0x5Cu:
      case 0x5Du:
      case 0x5Eu:
      case 0x5Fu:
      case 0x60u:
      case 0x61u:
      case 0x62u:
      case 0x63u:
        return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
      case 0x32u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_GivenName", 4);
        break;
      case 0x33u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_MiddleName", 4);
        break;
      case 0x34u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_FamilyName", 4);
        break;
      case 0x35u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PreviousFamilyName", 4);
        break;
      case 0x36u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_Nickname", 4);
        break;
      case 0x37u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_NamePrefix", 4);
        break;
      case 0x38u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_NameSuffix", 4);
        break;
      case 0x39u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PhoneNumber", 4);
        break;
      case 0x3Au:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_EmailAddress", 4);
        break;
      case 0x3Bu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PostalAddress", 4);
        break;
      case 0x3Cu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_UrlAddress", 4);
        break;
      case 0x3Du:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_SocialProfile", 4);
        break;
      case 0x3Eu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_InstantMessageAddress", 4);
        break;
      case 0x3Fu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_Relation", 4);
        break;
      case 0x40u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_OrganizationName", 4);
        break;
      case 0x41u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_DepartmentName", 4);
        break;
      case 0x42u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_JobTitle", 4);
        break;
      case 0x43u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PhoneticGivenName", 4);
        break;
      case 0x44u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PhoneticMiddleName", 4);
        break;
      case 0x45u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PhoneticFamilyName", 4);
        break;
      case 0x46u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_PhoneticOrganizationName", 4);
        break;
      case 0x47u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Contact_SharedUserId", 4);
        break;
      case 0x64u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppInfo_BundleId", 4);
        break;
      case 0x65u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppInfo_AppName", 4);
        break;
      case 0x66u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppInfo_DisplayAppName", 4);
        break;
      case 0x67u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppInfo_BundleVersion", 4);
        break;
      case 0x68u:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppInfo_AlternativeAppName", 4);
        break;
      default:
        switch(v3)
        {
          case 0x96u:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_HomeName", 4);
            break;
          case 0x97u:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_ZoneName", 4);
            break;
          case 0x98u:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_RoomName", 4);
            break;
          case 0x99u:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_ServiceName", 4);
            break;
          case 0x9Au:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_ServiceGroupName", 4);
            break;
          case 0x9Bu:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_SceneName", 4);
            break;
          case 0x9Cu:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_TriggerName", 4);
            break;
          case 0x9Du:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_AccessoryName", 4);
            break;
          case 0x9Eu:
            result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"HomeEntity_AssistantHomeKitId", 4);
            break;
          default:
            return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
        }
        break;
    }
  }
  else
  {
    if (v3 <= 0x1F3u)
    {
      switch(v3)
      {
        case 0xC9u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AlbumArtistId", 4);
          break;
        case 0xCAu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AlbumArtistName", 4);
          break;
        case 0xCBu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AlbumId", 4);
          break;
        case 0xCCu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AlbumName", 4);
          break;
        case 0xCDu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AudioBookArtistId", 4);
          break;
        case 0xCEu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AudioBookArtistName", 4);
          break;
        case 0xCFu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AudioBookId", 4);
          break;
        case 0xD0u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_AudioBookName", 4);
          break;
        case 0xD1u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_GenreId", 4);
          break;
        case 0xD2u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_GenreName", 4);
          break;
        case 0xD3u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_MovieId", 4);
          break;
        case 0xD4u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_MovieName", 4);
          break;
        case 0xD5u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_MusicVideoId", 4);
          break;
        case 0xD6u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_MusicVideoName", 4);
          break;
        case 0xD7u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PlaylistId", 4);
          break;
        case 0xD8u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PlaylistName", 4);
          break;
        case 0xD9u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastArtistId", 4);
          break;
        case 0xDAu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastArtistName", 4);
          break;
        case 0xDBu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastEpisodeId", 4);
          break;
        case 0xDCu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastEpisodeName", 4);
          break;
        case 0xDDu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastId", 4);
          break;
        case 0xDEu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastName", 4);
          break;
        case 0xDFu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastStationId", 4);
          break;
        case 0xE0u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_PodcastStationName", 4);
          break;
        case 0xE1u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_SongArtistId", 4);
          break;
        case 0xE2u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_SongArtistName", 4);
          break;
        case 0xE3u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_SongId", 4);
          break;
        case 0xE4u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_SongName", 4);
          break;
        case 0xE5u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_TVEpisodeId", 4);
          break;
        case 0xE6u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_TVEpisodeName", 4);
          break;
        case 0xE7u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_TVShowId", 4);
          break;
        case 0xE8u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"MediaEntity_TVShowName", 4);
          break;
        case 0xE9u:
        case 0xEAu:
        case 0xEBu:
        case 0xECu:
        case 0xEDu:
        case 0xEEu:
        case 0xEFu:
        case 0xF0u:
        case 0xF1u:
        case 0xF2u:
        case 0xF3u:
        case 0xF4u:
        case 0xF5u:
        case 0xF6u:
        case 0xF7u:
        case 0xF8u:
        case 0xF9u:
        case 0x100u:
        case 0x101u:
        case 0x102u:
        case 0x103u:
        case 0x104u:
        case 0x105u:
        case 0x106u:
        case 0x107u:
        case 0x108u:
        case 0x109u:
        case 0x10Au:
        case 0x10Bu:
        case 0x10Cu:
        case 0x10Du:
        case 0x10Eu:
        case 0x10Fu:
        case 0x110u:
        case 0x111u:
        case 0x112u:
        case 0x116u:
        case 0x117u:
        case 0x118u:
        case 0x119u:
        case 0x11Au:
        case 0x11Bu:
        case 0x11Cu:
        case 0x11Du:
        case 0x11Eu:
        case 0x11Fu:
        case 0x120u:
        case 0x121u:
        case 0x122u:
        case 0x123u:
        case 0x124u:
        case 0x125u:
        case 0x126u:
        case 0x127u:
        case 0x128u:
        case 0x129u:
        case 0x12Au:
        case 0x12Bu:
          return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
        case 0xFAu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkStaticTerm_AppEntityTypeName", 4);
          break;
        case 0xFBu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkStaticTerm_AppEntityTypeClassName", 4);
          break;
        case 0xFCu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkStaticTerm_AppEntityName", 4);
          break;
        case 0xFDu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkStaticTerm_AppEntityId", 4);
          break;
        case 0xFEu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkStaticTerm_AppSettingName", 4);
          break;
        case 0xFFu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkStaticTerm_AppSettingCanonicalName", 4);
          break;
        case 0x113u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkDynamicTerm_AppEntityName", 4);
          break;
        case 0x114u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkDynamicTerm_AppEntityTypeClassName", 4);
          break;
        case 0x115u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkDynamicTerm_AppEntityId", 4);
          break;
        case 0x12Cu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AutoShortcut_Phrase", 4);
          break;
        case 0x12Du:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AutoShortcut_BaseTemplate", 4);
          break;
        case 0x12Eu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AutoShortcut_TemplateParameterValue", 4);
          break;
        default:
          switch(v3)
          {
            case 0x15Fu:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"RadioEntity_Name", 4);
              break;
            case 0x160u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"RadioEntity_CallSign", 4);
              break;
            case 0x161u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"RadioEntity_Frequency", 4);
              break;
            case 0x162u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"RadioEntity_Channel", 4);
              break;
            case 0x163u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"RadioEntity_SignalType", 4);
              break;
            default:
              if (v3 != 400)
                return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"KeyboardWord_DynamicToken", 4);
              break;
          }
          break;
      }
      return result;
    }
    if (v3 <= 0x384u)
    {
      if (v3 > 0x2BBu)
      {
        if (v3 <= 0x31Fu)
        {
          if (v3 <= 0x2BDu)
          {
            if (v3 == 700)
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Podcast_Title", 4);
            else
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Podcast_ArtistName", 4);
          }
          if (v3 == 702)
            return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Podcast_PlaylistName", 4);
          if (v3 == 750)
            return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Fitness_GuestName", 4);
        }
        else
        {
          if (v3 <= 0x351u)
          {
            switch(v3)
            {
              case 0x320u:
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppShortcut_EntityInstanceIdentifier", 4);
                break;
              case 0x321u:
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppShortcut_EntityTitle", 4);
                break;
              case 0x322u:
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppShortcut_EntityTypeIdentifier", 4);
                break;
              case 0x323u:
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppShortcut_ProviderClass", 4);
                break;
              case 0x324u:
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppShortcut_EntitySynonym", 4);
                break;
              default:
                return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
            }
            return result;
          }
          switch(v3)
          {
            case 0x352u:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Health_MedicationName", 4);
            case 0x353u:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"Health_MedicationNickname", 4);
            case 0x384u:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"UserAccount_Username", 4);
          }
        }
      }
      else
      {
        if (v3 > 0x257u)
        {
          switch(v3)
          {
            case 0x258u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"GlobalTerm_MediaPlaylistTitle", 4);
              break;
            case 0x259u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"GlobalTerm_MediaMusicArtistName", 4);
              break;
            case 0x25Au:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"GlobalTerm_MediaAudiobookTitle", 4);
              break;
            case 0x25Bu:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"GlobalTerm_MediaAudiobookAuthor", 4);
              break;
            case 0x25Cu:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"GlobalTerm_MediaShowTitle", 4);
              break;
            default:
              if (v3 == 650)
              {
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CalendarEvent_Title", 4);
              }
              else
              {
                if (v3 != 651)
                  return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
                result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"CalendarEvent_LocationName", 4);
              }
              break;
          }
          return result;
        }
        if (v3 <= 0x226u)
        {
          if (v3 == 500)
            return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkOOVTerm_Phrase", 4);
          if (v3 == 501)
            return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LinkOOVTerm_CustomPronunciation", 4);
        }
        else
        {
          switch(v3)
          {
            case 0x227u:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LocationOfInterest_LocationName", 4);
            case 0x228u:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LocationOfInterest_SpatialLocationName", 4);
            case 0x229u:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"PortraitEntity_NamedEntityName", 4);
          }
        }
      }
      return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
    }
    if (v3 > 0x44Bu)
    {
      switch(v3)
      {
        case 0x47Eu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_TypeIdentifier", 4);
          break;
        case 0x47Fu:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_TypeName", 4);
          break;
        case 0x480u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_TypeSynonym", 4);
          break;
        case 0x481u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_CaseIdentifier", 4);
          break;
        case 0x482u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_CaseTitle", 4);
          break;
        case 0x483u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_CaseSubtitle", 4);
          break;
        case 0x484u:
          result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEnum_CaseSynonym", 4);
          break;
        default:
          switch(v3)
          {
            case 0x44Cu:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEntity_TypeIdentifier", 4);
              break;
            case 0x44Du:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEntity_TypeName", 4);
              break;
            case 0x44Eu:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEntity_TypeSynonym", 4);
              break;
            case 0x44Fu:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEntity_Title", 4);
              break;
            case 0x450u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEntity_Subtitle", 4);
              break;
            case 0x451u:
              result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"AppIntentsEntity_Synonym", 4);
              break;
            default:
              return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
          }
          break;
      }
      return result;
    }
    if (v3 <= 0x3E7u)
    {
      if (v3 > 0x3B6u)
      {
        if (v3 == 951)
          return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"FindMy_OwnerFirstName", 4);
        if (v3 == 952)
          return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"FindMy_OwnerLastName", 4);
      }
      else
      {
        if (v3 == 901)
          return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"UserAccount_GivenName", 4);
        if (v3 == 950)
          return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"FindMy_DeviceName", 4);
      }
      return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
    }
    switch(v3)
    {
      case 0x41Au:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedMediaEntity_userPhrasedSongName", 4);
        break;
      case 0x41Bu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedMediaEntity_userPhrasedArtistName", 4);
        break;
      case 0x41Cu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedMediaEntity_userPhrasedAlbumName", 4);
        break;
      case 0x41Du:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedMediaEntity_userPhrasedVersion", 4);
        break;
      case 0x41Eu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedMediaEntity_userPhrasedEntityName", 4);
        break;
      case 0x41Fu:
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedMediaEntity_suggestedAdamId", 4);
        break;
      default:
        if (v3 == 1000)
        {
          v5 = "LearnedContact_suggestedContactId";
          goto LABEL_201;
        }
        if (v3 != 1001)
          return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"", 4);
        result = objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)"LearnedContact_userPhrasedName", 4);
        break;
    }
  }
  return result;
}

uint64_t KVFieldTypeFromName(void *a1)
{
  const char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v3 = a1;
  if (qword_1EF151F28 != -1)
    dispatch_once(&qword_1EF151F28, &unk_1E6B7ABB0);
  objc_msgSend_objectForKey_((void *)qword_1EF151F20, v1, (uint64_t)v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);
  v9 = v8;
  if (!KVItemTypeFromFieldType(v8))
    v9 = 0;

  return v9;
}

void sub_1B70F6E38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F6E54()
{
  id v0;
  void *v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1EF151F20;
  qword_1EF151F20 = (uint64_t)v0;

  for (i = 0; i != 1157; ++i)
  {
    if (KVItemTypeFromFieldType(i))
    {
      KVFieldTypeName(i);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)qword_1EF151F20;
        KVFieldTypeToNumber(i);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v4, v6, (uint64_t)v5, (uint64_t)v3);

      }
    }
  }
}

void sub_1B70F6EF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id KVFieldTypeDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  KVFieldTypeName(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v7, (uint64_t)CFSTR("%@ (%@)"), v8, v3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1B70F6F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id KVLocaleTypeToNumber(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 v4;

  if ((unint64_t)(a1 - 1) >= 0x2C)
    v4 = 0;
  else
    v4 = a1;
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], a2, v4, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL KVLocaleTypeIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0x2C;
}

uint64_t KVLocaleTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  LODWORD(result) = objc_msgSend_unsignedShortValue(a1, a2, a3, a4);
  if ((unint64_t)result - 1 >= 0x2C)
    return 0;
  else
    return result;
}

uint64_t KVLocaleTypeName(uint64_t a1, const char *a2)
{
  unsigned __int8 v2;

  if ((unint64_t)(a1 - 1) >= 0x2C)
    v2 = 0;
  else
    v2 = a1;
  if (v2 <= 0x2Cu)
    return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E6B7AEC8[v2], 4);
  else
    return objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)"", 4);
}

uint64_t KVLocaleTypeFromName(void *a1)
{
  const char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v3 = a1;
  if (qword_1ED114560 != -1)
    dispatch_once(&qword_1ED114560, &unk_1E6B7AB90);
  objc_msgSend_objectForKey_((void *)qword_1ED114568, v1, (uint64_t)v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);
  if ((unint64_t)v8 - 1 >= 0x2C)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

void sub_1B70F70E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F70FC()
{
  id v0;
  void *v1;
  const char *v2;
  uint64_t i;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ED114568;
  qword_1ED114568 = (uint64_t)v0;

  for (i = 0; i != 45; ++i)
  {
    if ((unint64_t)(i - 1) <= 0x2B)
    {
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v2, (uint64_t)off_1E6B7AEC8[i], 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)qword_1ED114568;
        KVLocaleTypeToNumber(i, v4, v5, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v9, (uint64_t)v7);

      }
    }
  }
}

void sub_1B70F71B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id KVLocaleTypeDescription(uint64_t a1, const char *a2)
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if ((unint64_t)(a1 - 1) >= 0x2C)
    v4 = 0;
  else
    v4 = a1;
  if (v4 <= 0x2Cu)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E6B7AEC8[v4], 4);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)"", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v6, a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ (%@)"), v10, v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1B70F7290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t KVLocaleTypeFromNSLocale(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;

  objc_msgSend_localeIdentifier(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = KVLocaleTypeFromName(v4);

  return v5;
}

void sub_1B70F72E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id KVLocaleTypeToNSLocale(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  if ((unint64_t)(a1 - 1) > 0x2B)
  {
    v6 = 0;
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E6B7AEC8[a1], 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeWithLocaleIdentifier_(v2, v4, (uint64_t)v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void sub_1B70F7368(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F7878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1B70F793C()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1EF151F08;
  v7 = qword_1EF151F08;
  if (!qword_1EF151F08)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1B70F79F4;
    v3[3] = &unk_1E6B7B448;
    v3[4] = &v4;
    sub_1B70F79F4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B70F79DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B70F79F4(uint64_t a1)
{
  sub_1B70F7A60();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SEMSpanMatcher");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF151F08 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    sub_1B70F7A60();
  }
}

void sub_1B70F7A60()
{
  void *v0;

  if (!qword_1EF151F00)
  {
    qword_1EF151F00 = _sl_dlopen();
    if (!qword_1EF151F00)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

KVTokenizer *sub_1B70F7B1C(uint64_t a1)
{
  KVTokenizer *result;
  KVTokenizer *v3;
  SEL v4;
  id v5;

  sub_1B70F7A60();
  result = (KVTokenizer *)objc_getClass("SEMTokenizer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1EF151F30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (KVTokenizer *)abort_report_np();
    return -[KVTokenizer initWithLocale:](v3, v4, v5);
  }
  return result;
}

void sub_1B70F7C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1B70F7D28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Class sub_1B70F7D58(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1EF151F40)
  {
    qword_1EF151F40 = _sl_dlopen();
    if (!qword_1EF151F40)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SEMTokenizer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1EF151F38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1B70F8288(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  KVDataset *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = [KVDataset alloc];
  v7 = (void *)objc_msgSend_initWithReader_(v4, v5, (uint64_t)v3, v6);

  v8 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v7);
  return v8;
}

void sub_1B70F86E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F89AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1B70F8A84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F8C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  if ((v12 & 1) != 0)
  {

  }
  if (!v11)

  _Unwind_Resume(a1);
}

void sub_1B70F8D64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B70F8DE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F8E3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F900C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B70F950C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B70F968C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B70F9704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F97C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{

  _Unwind_Resume(a1);
}

void sub_1B70F98E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B70F9C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  char v14;
  void *v15;
  void *v16;

  if ((v14 & 1) != 0)

  if (!a14)
  _Unwind_Resume(a1);
}

void sub_1B70F9C98(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v6 = objc_msgSend_localeType(v7, v3, v4, v5);
  if (!v6 || v6 == *(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1B70F9D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B70F9D18(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (a3)
    objc_msgSend_appendString_(*(void **)(a1 + 32), v5, (uint64_t)CFSTR(",\n"), v6);
  v7 = *(void **)(a1 + 32);
  objc_msgSend_JSONWithIndent_(v11, v5, (*(_BYTE *)(a1 + 40) + 2), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v7, v9, (uint64_t)v8, v10);

}

void sub_1B70F9D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B70F9E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t KVItemTypeToCascadeItemType(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_cascadeItemTypeFromItemType_(KVItemConverter, a2, a1, a4);
}

uint64_t KVFieldTypeToCascadeFieldType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](KVItemConverter, sel_cascadeFieldTypeFromFieldType_, a1, a4);
}

uint64_t KVFieldTypeFromCascadeFieldType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](KVItemConverter, sel_fieldTypeFromCascadeFieldType_, a1, a4);
}

void sub_1B70FAEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FB214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FB990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose(&STACK[0x330], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose(&STACK[0x420], 8);
  _Block_object_dispose(&STACK[0x450], 8);
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x4E0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose((const void *)(v69 - 224), 8);
  _Block_object_dispose((const void *)(v69 - 176), 8);
  _Block_object_dispose((const void *)(v69 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FBD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FC03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FC3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FC640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FC924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose((const void *)(v33 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FCC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FD018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 224), 8);
  _Block_object_dispose((const void *)(v45 - 176), 8);
  _Block_object_dispose((const void *)(v45 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FD2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B70FD4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B70FD6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B70FD928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B70FDBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FDE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B70FE134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FE55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FEA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a70;
  uint64_t v70;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose((const void *)(v70 - 248), 8);
  _Block_object_dispose((const void *)(v70 - 200), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B70FEFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 192), 8);
  _Block_object_dispose((const void *)(v17 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B70FF010(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B70FF020(uint64_t a1)
{

}

id sub_1B70FF028(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  __CFString *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_metaContent(v4, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)0x1E0CB3000;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_content(v4, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_jsonDict(v12, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_jsonDict(v9, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v20, v21, (uint64_t)CFSTR(", MetaContent: %@"), v22, v10);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v24, (uint64_t)CFSTR("Encountered KVItemBuilder error: %@ while converting cascade item (Content: %@%@)"), v25, v3, v19, v23);
  }
  else
  {
    v23 = &stru_1E6B7B918;
    objc_msgSend_stringWithFormat_(v11, v16, (uint64_t)CFSTR("Encountered KVItemBuilder error: %@ while converting cascade item (Content: %@%@)"), v18, v3, v19, &stru_1E6B7B918);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v27, (uint64_t)v26, *MEMORY[0x1E0CB2938]);

  if (v9)
  {

  }
  if (v3)
    objc_msgSend_setObject_forKey_(v5, v28, (uint64_t)v3, *MEMORY[0x1E0CB3388]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v28, (uint64_t)CFSTR("com.apple.koa.item.converter"), 3, v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void sub_1B70FF1C8(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id obj;

  v3 = a2;
  v7 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v8 = objc_msgSend_fieldType(v3, v4, v5, v6);
    switch(v8)
    {
      case 36446:
        objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 103;
        break;
      case 18568:
        v18 = objc_msgSend_rawEnumValue(v7, v9, v10, v11) - 1;
        if (v18 > 0xB)
          v14 = 0;
        else
          v14 = qword_1B7111998[v18];
        v19 = objc_msgSend_repeatedSubMessageIndex(v7, v15, v16, v17);
        objc_msgSend_parentMessageField(v7, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_repeatedSubMessageValue(v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndex_(v27, v28, v19, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sourceItemIdentifier(v30, v31, v32, v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 7700:
        objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 158;
        break;
      default:
        v13 = 0;
LABEL_14:

        goto LABEL_15;
    }
    v34 = (void *)a1[4];
    v35 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v35 + 40);
    objc_msgSend_addFieldWithType_value_error_(v34, v12, v14, (uint64_t)v13, &obj);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v35 + 40), obj);

    if (!v36)
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    goto LABEL_14;
  }
LABEL_15:

}

id sub_1B70FF350(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;

  v3 = a1;
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a2;
  v6 = objc_alloc_init(v4);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("Encountered error: %@ enumerating Cascade item: %@"), v8, v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, *MEMORY[0x1E0CB2938]);
  if (v3)
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v3, *MEMORY[0x1E0CB3388]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("com.apple.koa.item.converter"), 6, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1B70FF42C(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v8 = objc_msgSend_fieldType(v3, v4, v5, v6);
    switch(a1[9])
    {
      case 1:
        v12 = 0;
        if (v8 > 25886)
        {
          if (v8 <= 38254)
          {
            if (v8 <= 30601)
            {
              if (v8 > 26515)
              {
                if (v8 != 26516)
                {
                  v13 = 0;
                  if (v8 != 30601)
                    goto LABEL_199;
                  objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v12 = 0;
                  v15 = 17;
                  goto LABEL_197;
                }
              }
              else if (v8 != 25887)
              {
                v13 = 0;
                if (v8 != 26515)
                  goto LABEL_199;
                objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v12 = 0;
                v15 = 10;
                goto LABEL_197;
              }
              goto LABEL_196;
            }
            if (v8 <= 32968)
            {
              if (v8 != 30602)
              {
                v13 = 0;
                if (v8 != 32968)
                  goto LABEL_199;
                objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v12 = 0;
                v15 = 12;
                goto LABEL_197;
              }
              goto LABEL_196;
            }
            if (v8 == 32969)
              goto LABEL_196;
            v13 = 0;
            if (v8 != 38254)
            {
LABEL_199:

              break;
            }
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 15;
LABEL_197:
            v56 = (void *)a1[5];
            v57 = *(_QWORD *)(a1[8] + 8);
            v59 = *(id *)(v57 + 40);
            objc_msgSend_addFieldWithType_label_value_error_(v56, v14, v15, (uint64_t)v12, v13, &v59);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)(v57 + 40), v59);

            if (!v58)
              *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
            goto LABEL_199;
          }
          if (v8 <= 53485)
          {
            if (v8 > 44938)
            {
              if (v8 != 44939)
              {
                v13 = 0;
                if (v8 != 53485)
                  goto LABEL_199;
                objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v12 = 0;
                v15 = 4;
                goto LABEL_197;
              }
            }
            else if (v8 != 38255)
            {
              v13 = 0;
              if (v8 != 44938)
                goto LABEL_199;
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 5;
              goto LABEL_197;
            }
            goto LABEL_196;
          }
          if (v8 <= 61355)
          {
            if (v8 != 53486)
            {
              v13 = 0;
              if (v8 != 61355)
                goto LABEL_199;
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 1;
              goto LABEL_197;
            }
            goto LABEL_196;
          }
          if (v8 == 61356)
            goto LABEL_196;
          if (v8 == 63372)
          {
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 2;
            goto LABEL_197;
          }
          v24 = 63373;
        }
        else if (v8 <= 14708)
        {
          if (v8 > 7721)
          {
            if (v8 > 13886)
            {
              if (v8 == 13887)
              {
                objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v12 = 0;
                v15 = 3;
                goto LABEL_197;
              }
              v24 = 13888;
            }
            else
            {
              if (v8 == 7722)
              {
                objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v12 = 0;
                v15 = 13;
                goto LABEL_197;
              }
              v24 = 7723;
            }
          }
          else
          {
            if (v8 <= 5597)
            {
              if (v8 != 803)
              {
                v13 = 0;
                if (v8 != 804)
                  goto LABEL_199;
                goto LABEL_196;
              }
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 7;
              goto LABEL_197;
            }
            if (v8 == 5598)
            {
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 11;
              goto LABEL_197;
            }
            v24 = 5599;
          }
        }
        else if (v8 <= 15574)
        {
          if (v8 > 14818)
          {
            if (v8 == 14819)
            {
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 6;
              goto LABEL_197;
            }
            v24 = 14820;
          }
          else
          {
            if (v8 == 14709)
            {
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 14;
              goto LABEL_197;
            }
            v24 = 14710;
          }
        }
        else
        {
          if (v8 > 16253)
          {
            if (v8 != 16254)
            {
              if (v8 != 16255)
              {
                v13 = 0;
                if (v8 != 25886)
                  goto LABEL_199;
                objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v12 = 0;
                v15 = 9;
                goto LABEL_197;
              }
LABEL_196:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 20;
              goto LABEL_197;
            }
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 8;
            goto LABEL_197;
          }
          if (v8 == 15575)
          {
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 16;
            goto LABEL_197;
          }
          v24 = 15576;
        }
        v13 = 0;
        if (v8 != v24)
          goto LABEL_199;
        goto LABEL_196;
      case 2:
        v12 = 0;
        if (v8 > 19746)
        {
          v13 = 0;
          switch(v8)
          {
            case 19758:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (sub_1B7100924(v12))
              {

                v12 = 0;
              }
              v28 = objc_msgSend_repeatedSubMessageIndex(v7, v25, v26, v27);
              objc_msgSend_parentMessageField(v7, v29, v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_repeatedSubMessageValue(v32, v33, v34, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndex_(v36, v37, v28, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_name(v39, v40, v41, v42);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v15 = 63;
              goto LABEL_197;
            case 19759:
            case 19761:
            case 19762:
            case 19763:
            case 19764:
            case 19766:
              goto LABEL_199;
            case 19760:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;
              if ((sub_1B7100924(v12) & 1) != 0)
                goto LABEL_199;
              v15 = 61;
              goto LABEL_197;
            case 19765:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;
              if ((sub_1B7100924(v12) & 1) != 0)
                goto LABEL_199;
              v15 = 58;
              goto LABEL_197;
            case 19767:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;
              if ((sub_1B7100924(v12) & 1) != 0)
                goto LABEL_199;
              v15 = 60;
              goto LABEL_197;
            default:
              if (v8 != 19747)
              {
                v13 = 0;
                if (v8 == 19749)
                {
                  objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = 0;
                  if ((sub_1B7100924(v12) & 1) == 0)
                  {
                    v15 = 59;
                    goto LABEL_197;
                  }
                }
                goto LABEL_199;
              }
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;
              if ((sub_1B7100924(v12) & 1) != 0)
                goto LABEL_199;
              v15 = 57;
              break;
          }
        }
        else
        {
          v13 = 0;
          switch(v8)
          {
            case 19679:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 50;
              goto LABEL_197;
            case 19680:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 51;
              goto LABEL_197;
            case 19681:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 52;
              goto LABEL_197;
            case 19682:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 53;
              goto LABEL_197;
            case 19683:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 54;
              goto LABEL_197;
            case 19684:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 55;
              goto LABEL_197;
            case 19685:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 56;
              goto LABEL_197;
            case 19686:
            case 19687:
            case 19688:
            case 19689:
            case 19690:
            case 19691:
            case 19692:
              goto LABEL_199;
            case 19693:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 64;
              goto LABEL_197;
            case 19694:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 65;
              goto LABEL_197;
            case 19695:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 66;
              goto LABEL_197;
            case 19696:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 67;
              goto LABEL_197;
            case 19697:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 68;
              goto LABEL_197;
            case 19698:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 69;
              goto LABEL_197;
            case 19699:
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v12 = 0;
              v15 = 70;
              goto LABEL_197;
            default:
              v13 = 0;
              if (v8 != 19744)
                goto LABEL_199;
              objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;
              if ((sub_1B7100924(v12) & 1) != 0)
                goto LABEL_199;
              v15 = 62;
              break;
          }
        }
        goto LABEL_197;
      case 3:
        v12 = 0;
        v15 = 104;
        v13 = 0;
        switch(v8)
        {
          case 36437:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 100;
            goto LABEL_197;
          case 36438:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 101;
            goto LABEL_197;
          case 36439:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 102;
            goto LABEL_197;
          case 36440:
            goto LABEL_199;
          case 36441:
            goto LABEL_125;
          default:
            goto LABEL_73;
        }
        goto LABEL_199;
      case 4:
        v12 = 0;
        v13 = 0;
        switch(v8)
        {
          case 7701:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 150;
            goto LABEL_197;
          case 7702:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 157;
            goto LABEL_197;
          case 7703:
          case 7707:
            goto LABEL_199;
          case 7704:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 152;
            goto LABEL_197;
          case 7705:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 155;
            goto LABEL_197;
          case 7706:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 153;
            goto LABEL_197;
          case 7708:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 154;
            goto LABEL_197;
          case 7709:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 156;
            goto LABEL_197;
          case 7710:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 151;
            goto LABEL_197;
          default:
            goto LABEL_73;
        }
        goto LABEL_199;
      case 5:
        switch(v8)
        {
          case 18555:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 204;
            goto LABEL_197;
          case 18556:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 202;
            goto LABEL_197;
          case 18557:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 208;
            goto LABEL_197;
          case 18558:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 206;
            goto LABEL_197;
          case 18559:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 210;
            goto LABEL_197;
          case 18560:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 212;
            goto LABEL_197;
          case 18561:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 214;
            goto LABEL_197;
          case 18562:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 216;
            goto LABEL_197;
          case 18563:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 228;
            goto LABEL_197;
          case 18564:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 226;
            goto LABEL_197;
          case 18565:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 230;
            goto LABEL_197;
          case 18566:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 232;
            goto LABEL_197;
          default:
            goto LABEL_137;
        }
      case 8:
        switch(v8)
        {
          case 12015:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 302;
            break;
          case 12014:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 301;
            break;
          case 12013:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 300;
            break;
          default:
            goto LABEL_137;
        }
        goto LABEL_197;
      case 9:
        switch(v8)
        {
          case 49069:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 351;
            goto LABEL_197;
          case 49070:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 352;
            goto LABEL_197;
          case 49071:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 353;
            goto LABEL_197;
          case 49072:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 354;
            goto LABEL_197;
          case 49073:
            v43 = objc_msgSend_rawEnumValue(v7, v9, v10, v11);
            if (v43 > 5)
            {
              v13 = 0;
              v12 = 0;
            }
            else
            {
              v12 = 0;
              v13 = off_1E6B7B310[v43];
            }
            v15 = 355;
            goto LABEL_197;
          default:
            goto LABEL_137;
        }
      case 0xCLL:
        switch(v8)
        {
          case 15768:
          case 15769:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 551;
            goto LABEL_197;
          case 15770:
          case 15771:
          case 15772:
          case 15773:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 552;
            goto LABEL_197;
          default:
            goto LABEL_137;
        }
      case 0xELL:
        v12 = 0;
        if (v8 <= 14029)
        {
          if (v8 == 3620)
          {
            v15 = 601;
          }
          else
          {
            v13 = 0;
            if (v8 != 8199)
              goto LABEL_199;
            v15 = 602;
          }
        }
        else if (v8 == 14030)
        {
          v15 = 603;
        }
        else if (v8 == 34312)
        {
          v15 = 600;
        }
        else
        {
          v13 = 0;
          if (v8 != 36064)
            goto LABEL_199;
          v15 = 604;
        }
LABEL_125:
        objc_msgSend_repeatedStringValueNoCopy(v7, v9, v10, v11);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v45 = v44;
          v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v61, (uint64_t)v65, 16);
          if (v47)
          {
            v49 = v47;
            v50 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v62 != v50)
                  objc_enumerationMutation(v45);
                v52 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
                v53 = (void *)a1[5];
                v54 = *(_QWORD *)(a1[8] + 8);
                obj = *(id *)(v54 + 40);
                objc_msgSend_addFieldWithType_value_error_(v53, v48, v15, v52, &obj);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_storeStrong((id *)(v54 + 40), obj);

                if (!v55)
                {
                  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
                  goto LABEL_136;
                }
              }
              v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v61, (uint64_t)v65, 16);
            }
            while (v49);
          }
LABEL_136:

          goto LABEL_137;
        }
        v13 = 0;
        v12 = 0;
        goto LABEL_197;
      case 0xFLL:
        if (v8 == 54389)
        {
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 651;
        }
        else
        {
          if (v8 != 54388)
            goto LABEL_137;
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 650;
        }
        goto LABEL_197;
      case 0x10:
        switch(v8)
        {
          case 42188:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 702;
            break;
          case 42190:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 701;
            break;
          case 42189:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 700;
            break;
          default:
            goto LABEL_137;
        }
        goto LABEL_197;
      case 0x11:
        if (v8 != 53617)
          goto LABEL_137;
        objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        v15 = 750;
        goto LABEL_197;
      case 0x12:
        v12 = 0;
        v15 = 804;
        v13 = 0;
        switch(v8)
        {
          case 7825:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 801;
            goto LABEL_197;
          case 7826:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 800;
            goto LABEL_197;
          case 7827:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 802;
            goto LABEL_197;
          case 7828:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 803;
            goto LABEL_197;
          case 7829:
            goto LABEL_199;
          case 7830:
            goto LABEL_125;
          default:
            goto LABEL_73;
        }
        goto LABEL_199;
      case 0x13:
        if (v8 == 13000)
        {
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 851;
        }
        else
        {
          if (v8 != 12999)
            goto LABEL_137;
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 850;
        }
        goto LABEL_197;
      case 0x14:
        if (v8 == 61513)
        {
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 901;
        }
        else
        {
          if (v8 != 61512)
            goto LABEL_137;
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 900;
        }
        goto LABEL_197;
      case 0x15:
        switch(v8)
        {
          case 27132:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 952;
            break;
          case 27131:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 951;
            break;
          case 27126:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 950;
            break;
          default:
            goto LABEL_137;
        }
        goto LABEL_197;
      case 0x16:
        if (v8 == 53605)
        {
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 1000;
          goto LABEL_197;
        }
        if (v8 == 53604)
        {
          objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v15 = 1001;
          goto LABEL_197;
        }
LABEL_137:
        v12 = 0;
        v13 = 0;
        goto LABEL_199;
      case 0x17:
        switch(v8)
        {
          case 62159:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1050;
            goto LABEL_197;
          case 62160:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1051;
            goto LABEL_197;
          case 62161:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1052;
            goto LABEL_197;
          case 62162:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1054;
            goto LABEL_197;
          case 62163:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1053;
            goto LABEL_197;
          case 62164:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1055;
            goto LABEL_197;
          default:
            goto LABEL_137;
        }
      case 0x18:
        v12 = 0;
        v15 = 1102;
        v13 = 0;
        switch(v8)
        {
          case 47347:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1103;
            goto LABEL_197;
          case 47348:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1104;
            goto LABEL_197;
          case 47349:
            v15 = 1105;
            goto LABEL_125;
          case 47350:
          case 47351:
            goto LABEL_199;
          case 47352:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1101;
            goto LABEL_197;
          case 47353:
            goto LABEL_125;
          case 47354:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1100;
            goto LABEL_197;
          default:
            goto LABEL_73;
        }
        goto LABEL_199;
      case 0x19:
        v12 = 0;
        v15 = 1152;
        v13 = 0;
        switch(v8)
        {
          case 42612:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1150;
            goto LABEL_197;
          case 42613:
          case 42614:
          case 42615:
          case 42616:
            goto LABEL_199;
          case 42617:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1153;
            goto LABEL_197;
          case 42618:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1154;
            goto LABEL_197;
          case 42619:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1155;
            goto LABEL_197;
          case 42620:
            v15 = 1156;
            goto LABEL_125;
          case 42621:
            objc_msgSend_stringValueNoCopy(v7, v9, v10, v11);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v15 = 1151;
            goto LABEL_197;
          case 42622:
            goto LABEL_125;
          default:
LABEL_73:
            v13 = 0;
            break;
        }
        goto LABEL_199;
      default:
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v66 = *MEMORY[0x1E0CB2938];
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("No supported conversion for Cascade item: %@"), v11, a1[4]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v17;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v67, (uint64_t)&v66, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v16, v20, (uint64_t)CFSTR("com.apple.koa.item.converter"), 4, v19);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1[7] + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        v12 = 0;
        v13 = 0;
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
        goto LABEL_199;
    }
  }

}

uint64_t sub_1B7100924(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t hasSuffix;

  v1 = a1;
  v5 = objc_msgSend_length(v1, v2, v3, v4);
  v9 = objc_msgSend_length(CFSTR("_$!<"), v6, v7, v8);
  if (v5 >= objc_msgSend_length(CFSTR(">!$_"), v10, v11, v12) + v9
    && objc_msgSend_hasPrefix_(v1, v13, (uint64_t)CFSTR("_$!<"), v14))
  {
    hasSuffix = objc_msgSend_hasSuffix_(v1, v15, (uint64_t)CFSTR(">!$_"), v16);
  }
  else
  {
    hasSuffix = 0;
  }

  return hasSuffix;
}

uint64_t sub_1B71009B4(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  id obj;

  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    return 1;
  }
  v2 = objc_alloc(MEMORY[0x1E0D3E200]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v8 = (void *)objc_msgSend_initWithTitle_subtitle_synonyms_error_(v2, v7, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D3E1F8]);
    v10 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
    v11 = *(_QWORD *)(a1[8] + 8);
    v30 = *(id *)(v11 + 40);
    v13 = (void *)objc_msgSend_initWithCaseIdentifier_displayRepresentation_error_(v9, v12, v10, (uint64_t)v8, &v30);
    objc_storeStrong((id *)(v11 + 40), v30);
    v16 = v13 != 0;
    if (v13)
    {
      v17 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
      if (!v17)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v19 = *(_QWORD *)(a1[9] + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        v17 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
      }
      objc_msgSend_addObject_(v17, v14, (uint64_t)v13, v15);
      v21 = *(_QWORD *)(a1[4] + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

      v23 = *(_QWORD *)(a1[5] + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = 0;

      v25 = *(_QWORD *)(a1[6] + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = 0;

      v27 = *(_QWORD *)(a1[7] + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = 0;

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void sub_1B7100B74(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  switch(objc_msgSend_fieldType(v26, v6, v7, v8))
  {
    case 1150:
      objc_msgSend_value(v26, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[5];
      goto LABEL_18;
    case 1151:
      objc_msgSend_value(v26, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[6];
      goto LABEL_18;
    case 1152:
      v14 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v14)
        goto LABEL_22;
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *(_QWORD *)(a1[7] + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v18 = a1[7];
      goto LABEL_21;
    case 1153:
      if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) && ((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
        *a4 = 1;
      }
      objc_msgSend_value(v26, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[8];
      goto LABEL_18;
    case 1154:
      if (*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40) && ((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
        *a4 = 1;
      }
      objc_msgSend_value(v26, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[10];
      goto LABEL_18;
    case 1155:
      if (*(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 40) && ((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
        *a4 = 1;
      }
      objc_msgSend_value(v26, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[11];
LABEL_18:
      v19 = *(_QWORD *)(v13 + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v12;
      goto LABEL_23;
    case 1156:
      v14 = *(void **)(*(_QWORD *)(a1[12] + 8) + 40);
      if (v14)
        goto LABEL_22;
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22 = *(_QWORD *)(a1[12] + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      v18 = a1[12];
LABEL_21:
      v14 = *(void **)(*(_QWORD *)(v18 + 8) + 40);
LABEL_22:
      objc_msgSend_value(v26, v9, v10, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v14, v24, (uint64_t)v20, v25);
LABEL_23:

LABEL_24:
      return;
    default:
      goto LABEL_24;
  }
}

id sub_1B7100D70(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;

  v3 = a1;
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a2;
  v6 = objc_alloc_init(v4);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("Encountered Cascade error: %@ while converting KVItem: %@"), v8, v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, *MEMORY[0x1E0CB2938]);
  if (v3)
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v3, *MEMORY[0x1E0CB3388]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("com.apple.koa.item.converter"), 5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1B7100E4C(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;

  v23 = a2;
  switch(objc_msgSend_fieldType(v23, v3, v4, v5))
  {
    case 1100:
      objc_msgSend_value(v23, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      goto LABEL_8;
    case 1101:
      objc_msgSend_value(v23, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      goto LABEL_8;
    case 1102:
      v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (v11)
        goto LABEL_12;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v15 = a1[6];
      goto LABEL_11;
    case 1103:
      objc_msgSend_value(v23, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[7];
      goto LABEL_8;
    case 1104:
      objc_msgSend_value(v23, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[8];
LABEL_8:
      v16 = *(_QWORD *)(v10 + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v9;
      goto LABEL_13;
    case 1105:
      v11 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
      if (v11)
        goto LABEL_12;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = *(_QWORD *)(a1[9] + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      v15 = a1[9];
LABEL_11:
      v11 = *(void **)(*(_QWORD *)(v15 + 8) + 40);
LABEL_12:
      objc_msgSend_value(v23, v6, v7, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v11, v21, (uint64_t)v17, v22);
LABEL_13:

LABEL_14:
      return;
    default:
      goto LABEL_14;
  }
}

void sub_1B7100F94(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  switch(objc_msgSend_fieldType(v13, v3, v4, v5))
  {
    case 1050:
      objc_msgSend_value(v13, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      goto LABEL_8;
    case 1051:
      objc_msgSend_value(v13, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      goto LABEL_8;
    case 1052:
      objc_msgSend_value(v13, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[6];
      goto LABEL_8;
    case 1053:
      objc_msgSend_value(v13, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[7];
      goto LABEL_8;
    case 1054:
      objc_msgSend_value(v13, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[8];
      goto LABEL_8;
    case 1055:
      objc_msgSend_value(v13, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[9];
LABEL_8:
      v11 = *(_QWORD *)(v10 + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v9;

      break;
    default:
      break;
  }

}

void sub_1B7101070(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend_fieldType(v14, v3, v4, v5);
  if (v6 == 1001)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  if (v6 == 1000)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v12 = *(_QWORD *)(v11 + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

  }
}

void sub_1B71010E8(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend_fieldType(v14, v3, v4, v5);
  switch(v6)
  {
    case 952:
      objc_msgSend_value(v14, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[6];
      goto LABEL_7;
    case 951:
      objc_msgSend_value(v14, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      goto LABEL_7;
    case 950:
      objc_msgSend_value(v14, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
LABEL_7:
      v12 = *(_QWORD *)(v11 + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v10;

      break;
  }

}

void sub_1B710117C(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend_fieldType(v14, v3, v4, v5);
  if (v6 == 901)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  if (v6 == 900)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v12 = *(_QWORD *)(v11 + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

  }
}

void sub_1B71011F4(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend_fieldType(v14, v3, v4, v5);
  if (v6 == 851)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  if (v6 == 850)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v12 = *(_QWORD *)(v11 + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

  }
}

void sub_1B710126C(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend_fieldType(v12, v3, v4, v5) == 750)
  {
    objc_msgSend_value(v12, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void sub_1B71012C8(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend_fieldType(v14, v3, v4, v5);
  if (v6 == 651)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  if (v6 == 650)
  {
    objc_msgSend_value(v14, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
LABEL_5:
    v12 = *(_QWORD *)(v11 + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

  }
}

void sub_1B7101340(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v6 = objc_msgSend_fieldType(v18, v3, v4, v5);
  if (v6 == 552)
  {
    v14 = *(_QWORD *)(a1[7] + 8);
    v15 = *(_QWORD *)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v15 + 1;
    if (v15 == 2)
    {
      objc_msgSend_value(v18, v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[10];
    }
    else if (v15 == 1)
    {
      objc_msgSend_value(v18, v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[9];
    }
    else if (v15)
    {
      objc_msgSend_value(v18, v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[11];
    }
    else
    {
      objc_msgSend_value(v18, v7, v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[8];
    }
    goto LABEL_13;
  }
  if (v6 == 551)
  {
    v10 = *(_QWORD *)(a1[4] + 8);
    v11 = *(_QWORD *)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v11 + 1;
    objc_msgSend_value(v18, v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v11)
      v13 = a1[6];
    else
      v13 = a1[5];
LABEL_13:
    v16 = *(_QWORD *)(v13 + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v12;

  }
}

void sub_1B710143C(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  switch(objc_msgSend_fieldType(v22, v3, v4, v5))
  {
    case 351:
      objc_msgSend_value(v22, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      goto LABEL_8;
    case 352:
      objc_msgSend_value(v22, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      goto LABEL_8;
    case 353:
      objc_msgSend_value(v22, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[6];
      goto LABEL_8;
    case 354:
      objc_msgSend_value(v22, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[7];
LABEL_8:
      v17 = *(_QWORD *)(v10 + 8);
      v11 = *(id *)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v9;
      goto LABEL_17;
    case 355:
      objc_msgSend_value(v22, v6, v7, v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("common_RadioBand_AM"), v13) & 1) != 0)
      {
        v16 = 1;
      }
      else if ((objc_msgSend_isEqualToString_(v11, v14, (uint64_t)CFSTR("common_RadioBand_FM"), v15) & 1) != 0)
      {
        v16 = 2;
      }
      else if ((objc_msgSend_isEqualToString_(v11, v18, (uint64_t)CFSTR("common_RadioBand_XM"), v19) & 1) != 0)
      {
        v16 = 3;
      }
      else if (objc_msgSend_isEqualToString_(v11, v20, (uint64_t)CFSTR("common_RadioBand_DAB"), v21))
      {
        v16 = 4;
      }
      else
      {
        v16 = 0;
      }

      *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v16;
LABEL_17:

      break;
    default:
      break;
  }

}

void sub_1B710158C(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  switch(objc_msgSend_fieldType(v19, v3, v4, v5))
  {
    case 800:
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      goto LABEL_6;
    case 801:
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      goto LABEL_6;
    case 802:
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[6];
      goto LABEL_6;
    case 803:
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[7];
LABEL_6:
      v11 = *(_QWORD *)(v10 + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v9;
      goto LABEL_7;
    case 804:
      v13 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      if (!v13)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v15 = *(_QWORD *)(a1[8] + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        v13 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      }
      objc_msgSend_value(v19, v6, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v13, v17, (uint64_t)v12, v18);
LABEL_7:

      break;
    default:
      break;
  }

}

void sub_1B710169C(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend_fieldType(v14, v3, v4, v5);
  switch(v6)
  {
    case 302:
      objc_msgSend_value(v14, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[6];
      goto LABEL_7;
    case 301:
      objc_msgSend_value(v14, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      goto LABEL_7;
    case 300:
      objc_msgSend_value(v14, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
LABEL_7:
      v12 = *(_QWORD *)(v11 + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v10;

      break;
  }

}

BOOL sub_1B7101730(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id obj;

  v5 = (objc_class *)MEMORY[0x1E0D3E3C0];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v8 + 40);
  v10 = (void *)objc_msgSend_initWithSourceItemIdentifier_type_error_(v7, v9, (uint64_t)v6, a2, &obj);

  objc_storeStrong((id *)(v8 + 40), obj);
  if (v10)
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend_addObject_(v13, v11, (uint64_t)v10, v12);
  }

  return v10 != 0;
}

void sub_1B7101804(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  id v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  id v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  char v118;
  void *v119;
  void *v120;
  void *v121;
  id obj;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;

  v6 = a2;
  switch(objc_msgSend_fieldType(v6, v7, v8, v9))
  {
    case 201:
      v13 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 1, v14);

      if ((v13 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        *a4 = 1;
      }
      break;
    case 202:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      v68 = objc_alloc(MEMORY[0x1E0D3E398]);
      objc_msgSend_value(v6, v69, v70, v71);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = *(_QWORD *)(a1[8] + 8);
      v73 = *(void **)(v72 + 40);
      v24 = (id *)(v72 + 40);
      v130 = v73;
      v27 = objc_msgSend_initWithName_error_(v68, v74, (uint64_t)v22, (uint64_t)&v130);
      v28 = v130;
      goto LABEL_26;
    case 203:
      v15 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, 3, v16);
      goto LABEL_28;
    case 204:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 3;
      v75 = objc_alloc(MEMORY[0x1E0D3E390]);
      objc_msgSend_value(v6, v76, v77, v78);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = *(_QWORD *)(a1[8] + 8);
      v80 = *(void **)(v79 + 40);
      v24 = (id *)(v79 + 40);
      v129 = v80;
      v27 = objc_msgSend_initWithName_error_(v75, v81, (uint64_t)v22, (uint64_t)&v129);
      v28 = v129;
      goto LABEL_26;
    case 205:
      v82 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v82 + 16))(v82, 11, v16);
      goto LABEL_28;
    case 206:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 11;
      v18 = objc_alloc(MEMORY[0x1E0D3E3A8]);
      objc_msgSend_value(v6, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1[8] + 8);
      v25 = *(void **)(v23 + 40);
      v24 = (id *)(v23 + 40);
      v128 = v25;
      v27 = objc_msgSend_initWithName_error_(v18, v26, (uint64_t)v22, (uint64_t)&v128);
      v28 = v128;
      goto LABEL_26;
    case 207:
      v83 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v83 + 16))(v83, 12, v16);
      goto LABEL_28;
    case 208:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 12;
      v84 = objc_alloc(MEMORY[0x1E0D3E3A0]);
      objc_msgSend_value(v6, v85, v86, v87);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = *(_QWORD *)(a1[8] + 8);
      v89 = *(void **)(v88 + 40);
      v24 = (id *)(v88 + 40);
      v127 = v89;
      v27 = objc_msgSend_initWithName_error_(v84, v90, (uint64_t)v22, (uint64_t)&v127);
      v28 = v127;
      goto LABEL_26;
    case 209:
      v91 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v91 + 16))(v91, 4, v16);
      goto LABEL_28;
    case 210:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 4;
      v92 = objc_alloc(MEMORY[0x1E0D3E3B8]);
      objc_msgSend_value(v6, v93, v94, v95);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = *(_QWORD *)(a1[8] + 8);
      v97 = *(void **)(v96 + 40);
      v24 = (id *)(v96 + 40);
      v126 = v97;
      v27 = objc_msgSend_initWithName_error_(v92, v98, (uint64_t)v22, (uint64_t)&v126);
      v28 = v126;
      goto LABEL_26;
    case 211:
      v29 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v29 + 16))(v29, 10, v16);
      goto LABEL_28;
    case 212:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 10;
      v30 = objc_alloc(MEMORY[0x1E0D3E3D0]);
      objc_msgSend_value(v6, v31, v32, v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(a1[8] + 8);
      v35 = *(void **)(v34 + 40);
      v24 = (id *)(v34 + 40);
      v125 = v35;
      v27 = objc_msgSend_initWithName_error_(v30, v36, (uint64_t)v22, (uint64_t)&v125);
      v28 = v125;
      goto LABEL_26;
    case 213:
      v37 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v37 + 16))(v37, 7, v16);
      goto LABEL_28;
    case 214:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 7;
      v38 = objc_alloc(MEMORY[0x1E0D3E3D8]);
      objc_msgSend_value(v6, v39, v40, v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(a1[8] + 8);
      v43 = *(void **)(v42 + 40);
      v24 = (id *)(v42 + 40);
      v124 = v43;
      v27 = objc_msgSend_initWithName_error_(v38, v44, (uint64_t)v22, (uint64_t)&v124);
      v28 = v124;
      goto LABEL_26;
    case 215:
      v99 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v99 + 16))(v99, 6, v16);
      goto LABEL_28;
    case 216:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 6;
      v100 = objc_alloc(MEMORY[0x1E0D3E3E0]);
      objc_msgSend_value(v6, v101, v102, v103);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = *(_QWORD *)(a1[8] + 8);
      v105 = *(void **)(v104 + 40);
      v24 = (id *)(v104 + 40);
      v123 = v105;
      v27 = objc_msgSend_initWithName_error_(v100, v106, (uint64_t)v22, (uint64_t)&v123);
      v28 = v123;
      goto LABEL_26;
    case 225:
      v107 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v107 + 16))(v107, 2, v16);
      goto LABEL_28;
    case 226:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 2;
      v108 = objc_alloc(MEMORY[0x1E0D3E3F0]);
      objc_msgSend_value(v6, v109, v110, v111);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = *(_QWORD *)(a1[8] + 8);
      v113 = *(void **)(v112 + 40);
      v24 = (id *)(v112 + 40);
      obj = v113;
      v27 = objc_msgSend_initWithName_error_(v108, v114, (uint64_t)v22, (uint64_t)&obj);
      v28 = obj;
      goto LABEL_26;
    case 227:
      v45 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v45 + 16))(v45, 5, v16);
      goto LABEL_28;
    case 228:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 5;
      v46 = objc_alloc(MEMORY[0x1E0D3E3E8]);
      objc_msgSend_value(v6, v47, v48, v49);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(_QWORD *)(a1[8] + 8);
      v51 = *(void **)(v50 + 40);
      v24 = (id *)(v50 + 40);
      v121 = v51;
      v27 = objc_msgSend_initWithName_error_(v46, v52, (uint64_t)v22, (uint64_t)&v121);
      v28 = v121;
      goto LABEL_26;
    case 229:
      v117 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v117 + 16))(v117, 9, v16);
      goto LABEL_28;
    case 230:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 9;
      v53 = objc_alloc(MEMORY[0x1E0D3E3F8]);
      objc_msgSend_value(v6, v54, v55, v56);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *(_QWORD *)(a1[8] + 8);
      v58 = *(void **)(v57 + 40);
      v24 = (id *)(v57 + 40);
      v120 = v58;
      v27 = objc_msgSend_initWithName_error_(v53, v59, (uint64_t)v22, (uint64_t)&v120);
      v28 = v120;
      goto LABEL_26;
    case 231:
      v60 = a1[4];
      objc_msgSend_value(v6, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v60 + 16))(v60, 8, v16);
LABEL_28:
      v118 = v17;

      if ((v118 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        *a4 = 1;
      }
      break;
    case 232:
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 8;
      v61 = objc_alloc(MEMORY[0x1E0D3E400]);
      objc_msgSend_value(v6, v62, v63, v64);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *(_QWORD *)(a1[8] + 8);
      v66 = *(void **)(v65 + 40);
      v24 = (id *)(v65 + 40);
      v119 = v66;
      v27 = objc_msgSend_initWithName_error_(v61, v67, (uint64_t)v22, (uint64_t)&v119);
      v28 = v119;
LABEL_26:
      objc_storeStrong(v24, v28);
      v115 = *(_QWORD *)(a1[7] + 8);
      v116 = *(void **)(v115 + 40);
      *(_QWORD *)(v115 + 40) = v27;

      break;
    default:
      break;
  }

}

void sub_1B7101EDC(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id obj;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;

  v3 = a2;
  switch(objc_msgSend_fieldType(v3, v4, v5, v6))
  {
    case 150:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
      v10 = objc_alloc(MEMORY[0x1E0D3E330]);
      objc_msgSend_value(v3, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1[6] + 8);
      v17 = *(void **)(v15 + 40);
      v16 = (id *)(v15 + 40);
      v82 = v17;
      v19 = objc_msgSend_initWithName_error_(v10, v18, (uint64_t)v14, (uint64_t)&v82);
      v20 = v82;
      goto LABEL_10;
    case 151:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 2;
      v21 = objc_alloc(MEMORY[0x1E0D3E378]);
      objc_msgSend_value(v3, v22, v23, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1[6] + 8);
      v26 = *(void **)(v25 + 40);
      v16 = (id *)(v25 + 40);
      v81 = v26;
      v19 = objc_msgSend_initWithName_error_(v21, v27, (uint64_t)v14, (uint64_t)&v81);
      v20 = v81;
      goto LABEL_10;
    case 152:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 3;
      v28 = objc_alloc(MEMORY[0x1E0D3E350]);
      objc_msgSend_value(v3, v29, v30, v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1[6] + 8);
      v33 = *(void **)(v32 + 40);
      v16 = (id *)(v32 + 40);
      v80 = v33;
      v19 = objc_msgSend_initWithName_error_(v28, v34, (uint64_t)v14, (uint64_t)&v80);
      v20 = v80;
      goto LABEL_10;
    case 153:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 4;
      v35 = objc_alloc(MEMORY[0x1E0D3E360]);
      objc_msgSend_value(v3, v36, v37, v38);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(_QWORD *)(a1[6] + 8);
      v40 = *(void **)(v39 + 40);
      v16 = (id *)(v39 + 40);
      v79 = v40;
      v19 = objc_msgSend_initWithName_deviceType_error_(v35, v41, (uint64_t)v14, 0, &v79);
      v20 = v79;
      goto LABEL_10;
    case 154:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 5;
      v42 = objc_alloc(MEMORY[0x1E0D3E368]);
      objc_msgSend_value(v3, v43, v44, v45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = *(_QWORD *)(a1[6] + 8);
      v47 = *(void **)(v46 + 40);
      v16 = (id *)(v46 + 40);
      v78 = v47;
      v19 = objc_msgSend_initWithName_error_(v42, v48, (uint64_t)v14, (uint64_t)&v78);
      v20 = v78;
      goto LABEL_10;
    case 155:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 6;
      v49 = objc_alloc(MEMORY[0x1E0D3E358]);
      objc_msgSend_value(v3, v50, v51, v52);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *(_QWORD *)(a1[6] + 8);
      v54 = *(void **)(v53 + 40);
      v16 = (id *)(v53 + 40);
      v77 = v54;
      v19 = objc_msgSend_initWithName_error_(v49, v55, (uint64_t)v14, (uint64_t)&v77);
      v20 = v77;
      goto LABEL_10;
    case 156:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 7;
      v56 = objc_alloc(MEMORY[0x1E0D3E370]);
      objc_msgSend_value(v3, v57, v58, v59);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = *(_QWORD *)(a1[6] + 8);
      v61 = *(void **)(v60 + 40);
      v16 = (id *)(v60 + 40);
      v76 = v61;
      v19 = objc_msgSend_initWithName_error_(v56, v62, (uint64_t)v14, (uint64_t)&v76);
      v20 = v76;
      goto LABEL_10;
    case 157:
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 8;
      v63 = objc_alloc(MEMORY[0x1E0D3E338]);
      objc_msgSend_value(v3, v64, v65, v66);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = *(_QWORD *)(a1[6] + 8);
      v68 = *(void **)(v67 + 40);
      v16 = (id *)(v67 + 40);
      obj = v68;
      v19 = objc_msgSend_initWithName_deviceType_error_(v63, v69, (uint64_t)v14, 0, &obj);
      v20 = obj;
LABEL_10:
      objc_storeStrong(v16, v20);
      v70 = *(_QWORD *)(a1[5] + 8);
      v71 = *(void **)(v70 + 40);
      *(_QWORD *)(v70 + 40) = v19;

      break;
    case 158:
      objc_msgSend_value(v3, v7, v8, v9);
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = *(_QWORD *)(a1[7] + 8);
      v74 = *(void **)(v73 + 40);
      *(_QWORD *)(v73 + 40) = v72;

      break;
    default:
      break;
  }

}

void sub_1B710226C(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  switch(objc_msgSend_fieldType(v19, v3, v4, v5))
  {
    case 'd':
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      goto LABEL_6;
    case 'e':
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      goto LABEL_6;
    case 'f':
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[6];
      goto LABEL_6;
    case 'g':
      objc_msgSend_value(v19, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[7];
LABEL_6:
      v11 = *(_QWORD *)(v10 + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v9;
      goto LABEL_7;
    case 'h':
      v13 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      if (!v13)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v15 = *(_QWORD *)(a1[8] + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        v13 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      }
      objc_msgSend_value(v19, v6, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v13, v17, (uint64_t)v12, v18);
LABEL_7:

      break;
    default:
      break;
  }

}

void sub_1B710237C(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  const char *v76;
  id v77;
  uint64_t v78;
  void *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  id v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id obj;
  id v102;

  v6 = a2;
  switch(objc_msgSend_fieldType(v6, v7, v8, v9))
  {
    case '2':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[4];
      goto LABEL_41;
    case '3':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[5];
      goto LABEL_41;
    case '4':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[6];
      goto LABEL_41;
    case '5':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[7];
      goto LABEL_41;
    case '6':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[8];
      goto LABEL_41;
    case '7':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[9];
      goto LABEL_41;
    case '8':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[10];
      goto LABEL_41;
    case '9':
      v15 = objc_alloc(MEMORY[0x1E0D3E2D0]);
      objc_msgSend_label(v6, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1[11] + 8);
      v102 = *(id *)(v20 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_stringValue_error_(v15, v21, (uint64_t)v19, 0, &v102);
      objc_storeStrong((id *)(v20 + 40), v102);

      if (!v22)
        goto LABEL_32;
      v25 = *(void **)(*(_QWORD *)(a1[13] + 8) + 40);
      if (v25)
        goto LABEL_31;
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = *(_QWORD *)(a1[13] + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

      v29 = a1[13];
      goto LABEL_30;
    case ':':
      v30 = objc_alloc(MEMORY[0x1E0D3E2B8]);
      objc_msgSend_label(v6, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(a1[11] + 8);
      obj = *(id *)(v35 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_email_error_(v30, v36, (uint64_t)v34, 0, &obj);
      objc_storeStrong((id *)(v35 + 40), obj);

      if (!v22)
        goto LABEL_32;
      v25 = *(void **)(*(_QWORD *)(a1[14] + 8) + 40);
      if (v25)
        goto LABEL_31;
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v38 = *(_QWORD *)(a1[14] + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

      v29 = a1[14];
      goto LABEL_30;
    case ';':
      v40 = objc_alloc(MEMORY[0x1E0D3E2D8]);
      objc_msgSend_label(v6, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = *(_QWORD *)(a1[11] + 8);
      v100 = *(id *)(v45 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_street_subLocality_city_subAdministrativeArea_state_postalCode_country_ISOCountryCode_error_(v40, v46, (uint64_t)v44, 0, 0, 0, 0, 0, 0, 0, 0, &v100);
      objc_storeStrong((id *)(v45 + 40), v100);

      if (!v22)
        goto LABEL_32;
      v25 = *(void **)(*(_QWORD *)(a1[15] + 8) + 40);
      if (v25)
        goto LABEL_31;
      v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = *(_QWORD *)(a1[15] + 8);
      v49 = *(void **)(v48 + 40);
      *(_QWORD *)(v48 + 40) = v47;

      v29 = a1[15];
      goto LABEL_30;
    case '<':
      v50 = objc_alloc(MEMORY[0x1E0D3E2F0]);
      objc_msgSend_label(v6, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *(_QWORD *)(a1[11] + 8);
      v99 = *(id *)(v55 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_url_error_(v50, v56, (uint64_t)v54, 0, &v99);
      objc_storeStrong((id *)(v55 + 40), v99);

      if (!v22)
        goto LABEL_32;
      v25 = *(void **)(*(_QWORD *)(a1[16] + 8) + 40);
      if (v25)
        goto LABEL_31;
      v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v58 = *(_QWORD *)(a1[16] + 8);
      v59 = *(void **)(v58 + 40);
      *(_QWORD *)(v58 + 40) = v57;

      v29 = a1[16];
      goto LABEL_30;
    case '=':
      v60 = objc_alloc(MEMORY[0x1E0D3E2E8]);
      objc_msgSend_label(v6, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *(_QWORD *)(a1[11] + 8);
      v98 = *(id *)(v65 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_urlString_username_userIdentifier_serviceName_error_(v60, v66, (uint64_t)v64, 0, 0, 0, 0, &v98);
      objc_storeStrong((id *)(v65 + 40), v98);

      if (!v22)
        goto LABEL_32;
      v25 = *(void **)(*(_QWORD *)(a1[17] + 8) + 40);
      if (v25)
        goto LABEL_31;
      v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v68 = *(_QWORD *)(a1[17] + 8);
      v69 = *(void **)(v68 + 40);
      *(_QWORD *)(v68 + 40) = v67;

      v29 = a1[17];
      goto LABEL_30;
    case '>':
      v70 = objc_alloc(MEMORY[0x1E0D3E2C0]);
      objc_msgSend_label(v6, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *(_QWORD *)(a1[11] + 8);
      v97 = *(id *)(v75 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_username_serviceName_error_(v70, v76, (uint64_t)v74, 0, 0, &v97);
      objc_storeStrong((id *)(v75 + 40), v97);

      if (!v22)
        goto LABEL_32;
      v25 = *(void **)(*(_QWORD *)(a1[18] + 8) + 40);
      if (v25)
        goto LABEL_31;
      v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v78 = *(_QWORD *)(a1[18] + 8);
      v79 = *(void **)(v78 + 40);
      *(_QWORD *)(v78 + 40) = v77;

      v29 = a1[18];
      goto LABEL_30;
    case '?':
      v80 = objc_alloc(MEMORY[0x1E0D3E2E0]);
      objc_msgSend_label(v6, v81, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v6, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = *(_QWORD *)(a1[11] + 8);
      v96 = *(id *)(v89 + 40);
      v22 = (void *)objc_msgSend_initWithLabel_name_error_(v80, v90, (uint64_t)v84, (uint64_t)v88, &v96);
      objc_storeStrong((id *)(v89 + 40), v96);

      if (v22)
      {
        v25 = *(void **)(*(_QWORD *)(a1[19] + 8) + 40);
        if (!v25)
        {
          v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v92 = *(_QWORD *)(a1[19] + 8);
          v93 = *(void **)(v92 + 40);
          *(_QWORD *)(v92 + 40) = v91;

          v29 = a1[19];
LABEL_30:
          v25 = *(void **)(*(_QWORD *)(v29 + 8) + 40);
        }
LABEL_31:
        objc_msgSend_addObject_(v25, v23, (uint64_t)v22, v24);
      }
      else
      {
LABEL_32:
        *(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24) = 1;
        *a4 = 1;
      }

LABEL_42:
      return;
    case '@':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[20];
      goto LABEL_41;
    case 'A':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[21];
      goto LABEL_41;
    case 'B':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[22];
      goto LABEL_41;
    case 'C':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[23];
      goto LABEL_41;
    case 'D':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[24];
      goto LABEL_41;
    case 'E':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[25];
      goto LABEL_41;
    case 'F':
      objc_msgSend_value(v6, v10, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[26];
LABEL_41:
      v94 = *(_QWORD *)(v14 + 8);
      v95 = *(void **)(v94 + 40);
      *(_QWORD *)(v94 + 40) = v13;

      goto LABEL_42;
    default:
      goto LABEL_42;
  }
}

void sub_1B7102988(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  switch(objc_msgSend_fieldType(v13, v3, v4, v5))
  {
    case 600:
    case 601:
    case 602:
    case 603:
    case 604:
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_opt_class();
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_opt_class();
      v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      objc_msgSend_value(v13, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v6, v11, (uint64_t)v10, v12);

      break;
    default:
      break;
  }

}

void sub_1B7102ACC(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  switch(objc_msgSend_fieldType(v16, v3, v4, v5))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_opt_class();
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_opt_class();
      objc_msgSend_value(v16, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[6];
      goto LABEL_3;
    case 20:
      objc_msgSend_value(v16, v6, v7, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[7];
LABEL_3:
      v14 = *(_QWORD *)(v13 + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v12;

      break;
    default:
      break;
  }

}

BOOL KVIsEmptyOrWhitespace(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  _BOOL8 v22;

  v1 = a1;
  v5 = objc_msgSend_length(v1, v2, v3, v4);
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = objc_msgSend_characterAtIndex_(v1, v9, 0, v10);
    if (objc_msgSend_characterIsMember_(v11, v13, v12, v14))
    {
      v17 = 1;
      while (v5 != v17)
      {
        v18 = objc_msgSend_characterAtIndex_(v1, v15, v17++, v16);
        if ((objc_msgSend_characterIsMember_(v11, v19, v18, v20) & 1) == 0)
        {
          v21 = v17 - 1;
          goto LABEL_10;
        }
      }
      v21 = v5;
LABEL_10:
      v22 = v21 >= v5;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 1;
  }

  return v22;
}

_QWORD *KVSetError(_QWORD *result, id a2)
{
  _QWORD *v2;

  if (result)
  {
    if (a2)
    {
      v2 = result;
      result = objc_retainAutorelease(a2);
      *v2 = result;
    }
  }
  return result;
}

void KVSetAndReportError(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v7 = v3;
  if (a1 && v3)
    *a1 = objc_retainAutorelease(v3);
  objc_msgSend_domain(v7, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_length(v8, v9, v10, v11);

  if (v12)
  {
    v13 = v7;
    AnalyticsSendEventLazy();

  }
}

id sub_1B7102F70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v40[4];
  _QWORD v41[5];

  v41[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_underlyingErrors(*(void **)(a1 + 32), a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_description(*(void **)(a1 + 32), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("domain");
  objc_msgSend_domain(*(void **)(a1 + 32), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v17;
  v40[1] = CFSTR("code");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend_code(*(void **)(a1 + 32), v19, v20, v21);
  objc_msgSend_numberWithInteger_(v18, v23, v22, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v28;
  v40[2] = CFSTR("underlyingCode");
  if (v9)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = objc_msgSend_code(v9, v25, v26, v27);
    objc_msgSend_numberWithInteger_(v29, v31, v30, v32);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v25, v26, v27);
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v36;
  v40[3] = CFSTR("description");
  v37 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v33, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[3] = v37;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v41, (uint64_t)v40, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  return v38;
}

id KVHash64(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;

  v1 = a1;
  v5 = v1;
  if (v1)
  {
    v6 = objc_msgSend_length(v1, v2, v3, v4);
    v7 = objc_retainAutorelease(v5);
    v11 = objc_msgSend_bytes(v7, v8, v9, v10);
    if (v6 >= 0x10)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        v17 = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v11 + v14)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v11 + v14)) >> 44));
        v18 = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v11 + v14 + 8)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v11 + v14 + 8)) >> 44));
        v15 -= 0x622015F714C7D297 * ((v18 ^ (v18 >> 41)) + (v17 ^ (v17 >> 41)));
        v14 += 16;
      }
      while (v14 < (v6 & 0xFFFFFFF0));
    }
    else
    {
      LODWORD(v14) = 0;
      v15 = 0;
    }
    if (v6 > v14)
      __memcpy_chk();
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v12, v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id KVHash64String(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;

  objc_msgSend_dataUsingEncoding_(a1, a2, 4, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  KVHash64(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t KVScanHexString(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v9 = 0;
  objc_msgSend_scannerWithString_(MEMORY[0x1E0CB3900], a2, a1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scanHexLongLong_(v4, v5, (uint64_t)&v9, v6);
  v7 = v9;

  return v7;
}

id KVConcatenateHash64(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7 = objc_msgSend_longLongValue(a1, v4, v5, v6);
  v11 = objc_msgSend_longLongValue(v3, v8, v9, v10);

  v14[0] = v7;
  v14[1] = v11;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v12, (uint64_t)v14, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id KVConcatenatedHash64Prefix(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4) == 16)
  {
    v10 = 0;
    objc_msgSend_getBytes_range_(v1, v5, (uint64_t)&v10, 0, 8);
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v6, v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id KVConcatenatedHash64Suffix(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4) == 16)
  {
    v10 = 0;
    objc_msgSend_getBytes_range_(v1, v5, (uint64_t)&v10, 8, 8);
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v6, v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_1B7103470(unsigned int a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  unsigned int v5;

  if (a1 >= 5)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v5 = 0;
    do
    {
      objc_msgSend_appendString_(v2, v3, (uint64_t)CFSTR("  "), v4);
      ++v5;
    }
    while (v5 < a1);
  }
  else
  {
    v2 = *(&off_1E6B7B400 + a1);
  }
  return v2;
}

__CFString *sub_1B71034E4(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  const char *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], a2, a1, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (__CFString *)objc_msgSend_initWithData_encoding_(v3, v4, (uint64_t)v2, 4);
  }
  else
  {
    v5 = CFSTR("null");
    v6 = CFSTR("null");
  }

  return v5;
}

void sub_1B7103B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1B7103B98(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED114550)
  {
    qword_1ED114550 = _sl_dlopen();
    if (!qword_1ED114550)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("KMItemMapper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED114558 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t KVAdditionalFieldTypeFromNumber(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a1, sel_intValue, a3, a4);
}

id sub_1B7103CA0(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v2 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v6 = objc_msgSend_formatOptions(v2, v3, v4, v5);
  objc_msgSend_setFormatOptions_(v2, v7, v6 | 0x800, v8);
  objc_msgSend_stringFromDate_(v2, v9, a1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1B7103E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1B7103F18(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1EF151F50)
  {
    qword_1EF151F50 = _sl_dlopen();
    if (!qword_1EF151F50)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SEMSpanMatchQueryBuilder");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1EF151F48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B710412C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B71042CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B710435C(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1B7104440(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7104538(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B71045BC(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1B71046D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B71049DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B7104AC8(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1B7104BB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7104EEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B7104FAC(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

uint64_t sub_1B7104FF4()
{
  return 1;
}

void sub_1B71052A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B71055FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B71056E0(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1B7105A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B7105CD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B71063F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B71064C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B71066DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (v3)
    operator delete(v3);

  _Unwind_Resume(a1);
}

void sub_1B7106970(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  if (v2)
    operator delete(v2);

  _Unwind_Resume(a1);
}

void sub_1B7106B0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1B7106BCC(unint64_t a1, void *a2, unsigned int *a3, int a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  id v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;

  v7 = a2;
  objc_msgSend_buffer(v7, v8, v9, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const void *)objc_msgSend_bytes(v11, v12, v13, v14);
  v16 = objc_retainAutorelease(v11);
  v20 = objc_msgSend_bytes(v16, v17, v18, v19);
  v24 = objc_msgSend_length(v16, v21, v22, v23);
  v38 = 0;
  v39 = 0;
  v40 = 0;
  sub_1B7106F0C(&v38, v15, v20 + v24, v20 + v24 - (_QWORD)v15);
  v25 = v38;
  if (v39 == v38)
    v26 = &unk_1EF151F58;
  else
    v26 = v38;
  v27 = sub_1B7106FA8((uint64_t *)a1, v26, v39 - v38);
  if (v25)
    operator delete(v25);
  sub_1B70EB144(a1);
  *(_BYTE *)(a1 + 70) = 1;
  v28 = *(_DWORD *)(a1 + 32);
  v29 = *(_DWORD *)(a1 + 48);
  v30 = *(_DWORD *)(a1 + 40);
  sub_1B7107010((_DWORD *)a1, v27);
  if (a3 && *a3)
  {
    v31 = sub_1B70EB1A4((_DWORD *)a1, *a3);
    sub_1B70EB018(a1, 6, v31);
  }
  v32 = sub_1B70EBC9C(a1, v28 - v29 + v30);
  sub_1B70EC0D4(a1, v32, "KPV2", a4);
  v33 = objc_alloc(MEMORY[0x1E0C99D50]);
  v34 = sub_1B70EC038(a1);
  v36 = (void *)objc_msgSend_initWithBytes_length_(v33, v35, v34, (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));

  return v36;
}

void sub_1B7106D58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (v3)
    operator delete(v3);

  _Unwind_Resume(a1);
}

void sub_1B7106D8C(_QWORD *a1, void *a2, void *a3, unsigned int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v23 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)MEMORY[0x1E0CB3940];
  sub_1B70F5FAC(a4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v15, (uint64_t)CFSTR("Failed to write %@ using format: %@ to stream %@"), v16, v7, v14, v8, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v24, (uint64_t)&v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v9, v20, (uint64_t)CFSTR("com.apple.koa.profile"), 4, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a1 && v21)
    *a1 = objc_retainAutorelease(v21);

}

void sub_1B7106ECC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

_QWORD *sub_1B7106F0C(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v5;
  char *v8;
  size_t v9;

  if (__sz)
  {
    v5 = result;
    if ((__sz & 0x8000000000000000) != 0)
      sub_1B70F2EF4();
    result = operator new(__sz);
    v8 = (char *)result;
    *v5 = result;
    v5[1] = result;
    v5[2] = (char *)result + __sz;
    v9 = a3 - (_QWORD)a2;
    if (v9)
      result = memcpy(result, a2, v9);
    v5[1] = &v8[v9];
  }
  return result;
}

void sub_1B7106F8C(_Unwind_Exception *exception_object)
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

uint64_t sub_1B7106FA8(uint64_t *a1, const void *a2, unint64_t a3)
{
  void *v6;

  sub_1B70EBFE0((uint64_t)a1, a3, 1uLL);
  if (a3)
  {
    sub_1B70EB2AC(a1, a3);
    v6 = (void *)(a1[6] - a3);
    a1[6] = (uint64_t)v6;
    memcpy(v6, a2, a3);
  }
  return sub_1B70EC098((uint64_t)a1, a3);
}

_DWORD *sub_1B7107010(_DWORD *result, unsigned int a2)
{
  unint64_t v2;
  int v3;

  if (a2)
  {
    v2 = (unint64_t)result;
    v3 = sub_1B70EB1A4(result, a2);
    return (_DWORD *)sub_1B70EB018(v2, 4, v3);
  }
  return result;
}

void sub_1B71070B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B71071F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a3);

  sub_1B70ED4B4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1B7107318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B710751C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7107600(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B710778C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B7107A0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7107D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B7107F68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B71080C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7108270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B71082F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7108714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B7108854(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B71089C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7108B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7108C18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7108CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7108EE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B71091E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B71093B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B71094D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B71095FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B71098AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B7109A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E6B7A8B0();
}

void operator delete(void *__p)
{
  off_1E6B7A8B8(__p);
}

uint64_t operator delete()
{
  return off_1E6B7A8C0();
}

uint64_t operator new[]()
{
  return off_1E6B7A8C8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6B7A8D0(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}


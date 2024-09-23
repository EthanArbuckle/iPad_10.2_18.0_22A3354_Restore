@implementation KmlTlv

+ (id)TLVsWithData:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v2 = a2;
  v3 = objc_opt_self();
  if (objc_msgSend(v2, "length"))
  {
    v8 = objc_retainAutorelease(v2);
    v13 = objc_msgSend(v8, "bytes");
    +[KmlTlv _parseTLVs:end:](v3, (unint64_t *)&v13, v13 + objc_msgSend(v8, "length"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv TLVsWithData:]", 29, CFSTR("nothing to parse"), v4, v5, v6, v7, v12);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

+ (id)_parseTLVs:(unint64_t)a3 end:
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  BOOL v18;
  int v19;
  unsigned __int8 *v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  unsigned __int8 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v36;

  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  if (*a2 >= a3)
  {
LABEL_20:
    v28 = objc_msgSend(v5, "count");
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 304, CFSTR("TLV: found %lu tlvs"), v29, v30, v31, v32, v28);
    return v5;
  }
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, a3 - v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 0xFFFF, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (unsigned __int8 *)*a2;
    v14 = (char *)(*a2 + 1);
    *a2 = (unint64_t)v14;
    v15 = *v13;
    if ((~v15 & 0x1F) == 0)
    {
      while ((unint64_t)v14 < a3)
      {
        v16 = v14 + 1;
        *a2 = (unint64_t)(v14 + 1);
        v17 = *v14++;
        v18 = v17 < -1;
        v19 = v17 | (v15 << 8);
        v15 = v19;
        if (!v18)
          goto LABEL_7;
      }
      v33 = CFSTR("TLV: Underflow");
      v34 = 252;
      goto LABEL_26;
    }
    v16 = v14;
    LOWORD(v19) = v15;
LABEL_7:
    if ((unint64_t)v16 >= a3)
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 266, CFSTR("TLV: Underflow: tag=0x%x"), v9, v10, v11, v12, (unsigned __int16)v19);
      goto LABEL_27;
    }
    v20 = (unsigned __int8 *)(v16 + 1);
    *a2 = (unint64_t)(v16 + 1);
    v21 = *v16;
    v22 = v21;
    if (v21 < 0)
      break;
LABEL_9:
    if (!(_WORD)v19 && !v22)
    {
      v33 = CFSTR("TLV: tag and length is 0");
      v34 = 287;
LABEL_26:
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", v34, v33, v9, v10, v11, v12, v36);
      goto LABEL_27;
    }
    if ((uint64_t)(a3 - (_QWORD)v20) < v22)
    {
      v36 = (unsigned __int16)v19;
      v33 = CFSTR("TLV: Underflow: tag=0x%x len=%u");
      v34 = 295;
      goto LABEL_26;
    }
    v23 = v22;
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 299, CFSTR("TLV: adding tag:0x%x, len:%u"), v9, v10, v11, v12, (unsigned __int16)v19);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *a2, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, v19, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);

    *a2 += v23;
    v6 = *a2;
    if (*a2 >= a3)
      goto LABEL_20;
  }
  v26 = v21 & 0x7F;
  if ((v22 & 0x7F) == 0)
  {
    v22 = 0;
    goto LABEL_9;
  }
  v22 = 0;
  v27 = v20;
  while ((unint64_t)v27 < a3)
  {
    v20 = v27 + 1;
    *a2 = (unint64_t)(v27 + 1);
    v22 = *v27++ | (v22 << 8);
    if (!--v26)
      goto LABEL_9;
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 276, CFSTR("TLV: Underflow: tag=0x%x"), v9, v10, v11, v12, (unsigned __int16)v19);
LABEL_27:
  objc_msgSend(v5, "addObject:", v8);

  return v5;
}

+ (_WORD)TLVWithTag:(void *)a3 value:
{
  id v4;
  _WORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_self());
  v5[4] = a2;
  v6 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v4;

  return v5;
}

+ (_WORD)TLVWithTag:(char)a3 unsignedChar:
{
  _WORD *v4;
  uint64_t v5;
  void *v6;
  char v8;

  v8 = a3;
  v4 = objc_alloc_init((Class)objc_opt_self());
  v4[4] = a2;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v5;

  return v4;
}

+ (_WORD)TLVWithTag:(unsigned int)a3 unsignedShort:
{
  _WORD *v5;
  uint64_t v6;
  void *v7;
  __int16 v9;

  v5 = objc_alloc_init((Class)objc_opt_self());
  v5[4] = a2;
  v9 = __rev16(a3);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v9, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v6;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  objc_super v9;
  objc_super v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_value, 1);
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)KmlTlv;
    -[KmlTlv description](&v10, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %02x = %@ \"%@\"), v5, self->_tag, self->_value, v3);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)KmlTlv;
    -[KmlTlv description](&v9, sel_description);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %02x = %@"), v5, self->_tag, self->_value, v8);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)tag
{
  if (result)
    return *(unsigned __int16 *)(result + 8);
  return result;
}

- (id)value
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (_QWORD)valueAsUnsignedChar
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      if ((unint64_t)objc_msgSend(result, "length") < 2)
      {
        return (_QWORD *)*(unsigned __int8 *)objc_msgSend((id)v1[2], "bytes");
      }
      else
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTlv valueAsUnsignedChar]", 132, CFSTR("TLV: Value too large: %@"), v2, v3, v4, v5, v1[2]);
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)valueAsUnsignedShort
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int16 v9;

  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 16);
  if (!v2)
    return 0;
  if ((unint64_t)objc_msgSend(v2, "length") >= 3)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTlv valueAsUnsignedShort]", 147, CFSTR("TLV: Value too large: %@"), v3, v4, v5, v6, *(_QWORD *)(a1 + 16));
    return 0;
  }
  v7 = objc_msgSend(*(id *)(a1 + 16), "bytes");
  if (!objc_msgSend(*(id *)(a1 + 16), "length"))
    return 0;
  v8 = 0;
  v9 = 0;
  do
    v9 = *(unsigned __int8 *)(v7 + v8++) | (unsigned __int16)(v9 << 8);
  while (objc_msgSend(*(id *)(a1 + 16), "length") > v8);
  return v9;
}

+ (id)_intToData:(uint64_t)a1
{
  void *v3;
  void *v4;
  int v5;
  unsigned int v6;
  char v8;

  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v8 = 0;
  if (a2)
  {
    v5 = 4;
    if (HIBYTE(a2))
      goto LABEL_12;
    do
    {
      v6 = HIWORD(a2);
      a2 <<= 8;
      --v5;
    }
    while (!v6 && v5);
    if (v5)
    {
LABEL_12:
      do
      {
        v8 = HIBYTE(a2);
        objc_msgSend(v4, "appendBytes:length:", &v8, 1);
        a2 <<= 8;
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    objc_msgSend(v3, "appendBytes:length:", &v8, 1);
  }
  return v4;
}

- (id)asData
{
  void *v2;
  void *v3;
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  char v9;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[KmlTlv _intToData:]((uint64_t)KmlTlv, *(unsigned __int16 *)(a1 + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendData:", v3);

  v4 = *(id *)(a1 + 16);
  v5 = objc_msgSend(v4, "length");
  +[KmlTlv _intToData:]((uint64_t)KmlTlv, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 >= 0x80)
  {
    v9 = objc_msgSend(v6, "length") | 0x80;
    objc_msgSend(v2, "appendBytes:length:", &v9, 1);
  }
  objc_msgSend(v2, "appendData:", v7);
  if (v4)
    objc_msgSend(v2, "appendData:", v4);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end

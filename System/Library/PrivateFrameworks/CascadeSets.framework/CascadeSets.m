id CCTypeIdentifierRegistryBridge()
{
  if (CCTypeIdentifierRegistryBridge_onceToken != -1)
    dispatch_once(&CCTypeIdentifierRegistryBridge_onceToken, &__block_literal_global);
  return (id)CCTypeIdentifierRegistryBridge_registryClass;
}

uint64_t CCValidateEnumField(void *a1, uint64_t a2, unsigned int (*a3)(uint64_t), _QWORD *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  if ((_DWORD)a2 && !a3(a2))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided value %u for enum field %@ is not a valid enum value"), a2, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4 && v12)
      *a4 = objc_retainAutorelease(v12);

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t CCValidateIsInstanceOfExpectedClass(void *a1, void *a2, objc_class *a3, _QWORD *a4)
{
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0BA0];
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Provided object for field %@ is of class %@, expected class: %@"), v7, v13, v14, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 2, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4 && v17)
      *a4 = objc_retainAutorelease(v17);

  }
  return isKindOfClass & 1;
}

BOOL CCValidateNonNilField(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided object for field %@ is nil, expected non-nil"), a1, *MEMORY[0x24BDD0BA0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3 && v8)
      *a3 = objc_retainAutorelease(v8);

  }
  return a2 != 0;
}

id _NSNullIfNilObject(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id CCHash64(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "length");
    v4 = objc_msgSend(objc_retainAutorelease(v2), "bytes");
    if (v3 >= 0x10)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v8 = 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5)) >> 44));
        v9 = 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5 + 8)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v4 + v5 + 8)) >> 44));
        v6 -= 0x622015F714C7D297 * ((v9 ^ (v9 >> 41)) + (v8 ^ (v8 >> 41)));
        v5 += 16;
      }
      while (v5 < (v3 & 0xFFFFFFF0));
    }
    else
    {
      LODWORD(v5) = 0;
      v6 = 0;
    }
    if (v3 > v5)
      __memcpy_chk();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id CCPBReaderReadStringNoCopy(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;

  v1 = a1;
  v2 = v1;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = v1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5])
      break;
    v8 = *(_BYTE *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(v1, "hasError") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = v2[1];
    v9 = __CFADD__(v12, v10);
    v13 = v12 + v10;
    if (v9 || v13 > v2[5])
    {
      v11 = 0;
      v2[2] = 1;
    }
    else
    {
      v14 = objc_retainAutorelease((id)v2[4]);
      v15 = objc_msgSend(v14, "bytes") + v2[1];
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v15, v10, 4, 0);
      v2[1] += v10;

    }
  }

  return v11;
}

void CCPBDataWriterWriteStringField(uint64_t a1, void *a2, int a3)
{
  id v5;
  size_t v6;
  _QWORD *v7;
  size_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const void *v17;
  size_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  unint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  size_t v34;
  size_t v35;
  size_t v36;
  _BYTE *v37;
  _BYTE *v38;
  size_t v39;
  size_t v40;
  size_t v41;
  size_t __n;
  _BYTE __src[1000];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xA5
    && (__n = 0,
        objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 1000, &__n, 4, 4, 0, objc_msgSend(v5, "length"), 0)))
  {
    v6 = __n;
    v7 = *(_QWORD **)(a1 + 8);
    v8 = v7[3];
    if (v8 < v7[1] + __n + 16)
    {
      if (v8 - v7[2] <= __n + 16)
        v9 = __n + 16;
      else
        v9 = v8 - v7[2];
      -[CCPBMutableData _pb_growCapacityBy:](v7, v9);
      v7 = *(_QWORD **)(a1 + 8);
    }
    if (a3 != -1)
    {
      v10 = (8 * a3) | 2u;
      v11 = (_BYTE *)v7[1];
      if (v10 < 0x80)
      {
        LOBYTE(v12) = (8 * a3) | 2;
      }
      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          v12 = v10 >> 7;
          v13 = v10 >> 14;
          v10 >>= 7;
        }
        while (v13);
      }
      *v11 = v12;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v11 + 1;
      v7 = *(_QWORD **)(a1 + 8);
    }
    v38 = (_BYTE *)v7[1];
    if (v6 < 0x80)
    {
      LOBYTE(v40) = v6;
    }
    else
    {
      v39 = v6;
      do
      {
        *v38++ = v39 | 0x80;
        v40 = v39 >> 7;
        v41 = v39 >> 14;
        v39 >>= 7;
      }
      while (v41);
    }
    *v38 = v40;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v38 + 1;
    memcpy(*(void **)(*(_QWORD *)(a1 + 8) + 8), __src, v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v6;
  }
  else
  {
    v14 = (void *)MEMORY[0x23B82079C]();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      v16 = objc_retainAutorelease(v15);
      v17 = (const void *)objc_msgSend(v16, "bytes");
      v18 = objc_msgSend(v16, "length");
      v19 = *(_QWORD **)(a1 + 8);
      v20 = v19[3];
      if (v20 < v19[1] + v18 + 16)
      {
        if (v20 - v19[2] <= v18 + 16)
          v21 = v18 + 16;
        else
          v21 = v20 - v19[2];
        -[CCPBMutableData _pb_growCapacityBy:](v19, v21);
        v19 = *(_QWORD **)(a1 + 8);
      }
      if (a3 != -1)
      {
        v22 = (8 * a3) | 2u;
        v23 = (_BYTE *)v19[1];
        if (v22 < 0x80)
        {
          LOBYTE(v24) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v23++ = v22 | 0x80;
            v24 = v22 >> 7;
            v25 = v22 >> 14;
            v22 >>= 7;
          }
          while (v25);
        }
        *v23 = v24;
        *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v23 + 1;
        v19 = *(_QWORD **)(a1 + 8);
      }
      v33 = (_BYTE *)v19[1];
      if (v18 < 0x80)
      {
        LOBYTE(v35) = v18;
      }
      else
      {
        v34 = v18;
        do
        {
          *v33++ = v34 | 0x80;
          v35 = v34 >> 7;
          v36 = v34 >> 14;
          v34 >>= 7;
        }
        while (v36);
      }
      *v33 = v35;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v33 + 1;
      memcpy(*(void **)(*(_QWORD *)(a1 + 8) + 8), v17, v18);
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v18;
    }
    else
    {
      v26 = *(_QWORD **)(a1 + 8);
      v27 = v26[3];
      if (v27 < v26[1] + 16)
      {
        if (v27 - v26[2] <= 0x10)
          v28 = 16;
        else
          v28 = v27 - v26[2];
        -[CCPBMutableData _pb_growCapacityBy:](v26, v28);
        v26 = *(_QWORD **)(a1 + 8);
      }
      if (a3 != -1)
      {
        v29 = (8 * a3) | 2u;
        v30 = (_BYTE *)v26[1];
        if (v29 < 0x80)
        {
          LOBYTE(v31) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v30++ = v29 | 0x80;
            v31 = v29 >> 7;
            v32 = v29 >> 14;
            v29 >>= 7;
          }
          while (v32);
        }
        *v30 = v31;
        *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v30 + 1;
        v26 = *(_QWORD **)(a1 + 8);
      }
      v37 = (_BYTE *)v26[1];
      *v37 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v37 + 1;
    }

    objc_autoreleasePoolPop(v14);
  }

}

uint64_t CCWritePropertyList(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  unsigned __int8 v19;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a1, 200, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = open_dprotected_np((const char *)objc_msgSend(v9, "UTF8String"), 1538, a3, 0, 420);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v10, 1);
    v12 = objc_msgSend(v11, "writeData:error:", v8, a4);
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "URLByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v19);

      if ((v16 & 1) == 0)
      {
        __biome_log_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          CCWritePropertyList_cold_1((uint64_t)v14, &v19, v17);

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x23B820934](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

_QWORD *CCPBDataWriterWriteUint32Field(uint64_t a1, unsigned int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    v8 = v7 - result[2];
    if (v8 <= 0x10)
      v9 = 16;
    else
      v9 = v8;
    -[CCPBMutableData _pb_growCapacityBy:](result, v9);
    result = *(_QWORD **)(a1 + 8);
  }
  v10 = a2;
  if (a3 != -1)
  {
    v11 = (8 * a3);
    v12 = (_BYTE *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        v13 = v11 >> 7;
        v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *v12 = v13;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v12 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v15 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      v16 = v10 >> 7;
      v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  *v15 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void sub_237B2DD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _sharedXPCClientFactory()
{
  if (_sharedXPCClientFactory_onceToken != -1)
    dispatch_once(&_sharedXPCClientFactory_onceToken, &__block_literal_global_3);
  return (id)_sharedXPCClientFactory_sharedFactory;
}

id _sharedQueue()
{
  if (_sharedQueue_onceToken != -1)
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_130);
  return (id)_sharedQueue_sharedQueue;
}

void sub_237B2EA44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id CCDonateServiceRequestDescription(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDD17C8];
  CCTypeIdentifierRegistryBridge();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptionForTypeIdentifier:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\""), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%@:%llu:%@>"), v12, v8, a1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%@:%llu:%@>"), v11, v8, a1, &stru_250991730);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id CCHash64String(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CCHash64(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_237B2F568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___sharedXPCClientFactory_block_invoke()
{
  CCDonateXPCClientFactory *v0;
  void *v1;

  v0 = objc_alloc_init(CCDonateXPCClientFactory);
  v1 = (void *)_sharedXPCClientFactory_sharedFactory;
  _sharedXPCClientFactory_sharedFactory = (uint64_t)v0;

}

void ___sharedQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("CCSetDonation", v2);
  v1 = (void *)_sharedQueue_sharedQueue;
  _sharedQueue_sharedQueue = (uint64_t)v0;

}

uint64_t CCDonateServiceResponseDescription(unsigned int a1)
{
  __CFString *v1;

  if (a1 > 0xB)
    v1 = 0;
  else
    v1 = off_250990FE0[(__int16)a1];
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%u) \"%@\""), a1, v1);
}

void sub_237B30294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCCTypeIdentifierRegistryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_2509905D8;
    v5 = 0;
    IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary_0)
    __getCCTypeIdentifierRegistryClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CCTypeIdentifierRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCTypeIdentifierRegistryClass_block_invoke_cold_2();
  getCCTypeIdentifierRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CCScanHexString(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scanHexLongLong:", &v4);
  v2 = v4;

  return v2;
}

id CCConcatenateHash64(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(a1, "longLongValue");
  v5 = objc_msgSend(v3, "longLongValue");

  v7[0] = v4;
  v7[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CCConcatenatedHash64Prefix(void *a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 16)
  {
    v4 = 0;
    objc_msgSend(v1, "getBytes:range:", &v4, 0, 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id CCConcatenatedHash64Suffix(void *a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 16)
  {
    v4 = 0;
    objc_msgSend(v1, "getBytes:range:", &v4, 8, 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t CCSerializedSetFormatFromString(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqual:", CFSTR("binary")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqual:", CFSTR("json")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

BOOL CCSerializedSetFormatIsValid(int a1)
{
  return (a1 - 1) < 2;
}

id getCCSerializedSetMessageClass()
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
  v0 = (void *)getCCSerializedSetMessageClass_softClass;
  v7 = getCCSerializedSetMessageClass_softClass;
  if (!getCCSerializedSetMessageClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetMessageClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCCSerializedSetMessageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B31F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetDeviceClass()
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
  v0 = (void *)getCCSerializedSetDeviceClass_softClass;
  v7 = getCCSerializedSetDeviceClass_softClass;
  if (!getCCSerializedSetDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetDeviceClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCCSerializedSetDeviceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B32370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetDescriptorClass()
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
  v0 = (void *)getCCSerializedSetDescriptorClass_softClass;
  v7 = getCCSerializedSetDescriptorClass_softClass;
  if (!getCCSerializedSetDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetDescriptorClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCCSerializedSetDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B32428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetItemInstanceClass()
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
  v0 = (void *)getCCSerializedSetItemInstanceClass_softClass;
  v7 = getCCSerializedSetItemInstanceClass_softClass;
  if (!getCCSerializedSetItemInstanceClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetItemInstanceClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCCSerializedSetItemInstanceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B32A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetSharedItemClass()
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
  v0 = (void *)getCCSerializedSetSharedItemClass_softClass;
  v7 = getCCSerializedSetSharedItemClass_softClass;
  if (!getCCSerializedSetSharedItemClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetSharedItemClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCCSerializedSetSharedItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B32AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCCSerializedSetItemClass()
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
  v0 = (void *)getCCSerializedSetItemClass_softClass;
  v7 = getCCSerializedSetItemClass_softClass;
  if (!getCCSerializedSetItemClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCCSerializedSetItemClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCCSerializedSetItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B32B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B332E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

Class __getCCSerializedSetMessageClass_block_invoke(uint64_t a1)
{
  Class result;

  IntelligencePlatformLibraryLibrary();
  result = objc_getClass("CCSerializedSetMessage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSerializedSetMessageClass_block_invoke_cold_1();
  getCCSerializedSetMessageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void IntelligencePlatformLibraryLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_2509903E8;
    v2 = 0;
    IntelligencePlatformLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntelligencePlatformLibraryLibraryCore_frameworkLibrary)
    IntelligencePlatformLibraryLibrary_cold_1(&v0);
}

Class __getCCSerializedSetDeviceClass_block_invoke(uint64_t a1)
{
  Class result;

  IntelligencePlatformLibraryLibrary();
  result = objc_getClass("CCSerializedSetDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSerializedSetDeviceClass_block_invoke_cold_1();
  getCCSerializedSetDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  IntelligencePlatformLibraryLibrary();
  result = objc_getClass("CCSerializedSetDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSerializedSetDescriptorClass_block_invoke_cold_1();
  getCCSerializedSetDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetItemInstanceClass_block_invoke(uint64_t a1)
{
  Class result;

  IntelligencePlatformLibraryLibrary();
  result = objc_getClass("CCSerializedSetItemInstance");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSerializedSetItemInstanceClass_block_invoke_cold_1();
  getCCSerializedSetItemInstanceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetSharedItemClass_block_invoke(uint64_t a1)
{
  Class result;

  IntelligencePlatformLibraryLibrary();
  result = objc_getClass("CCSerializedSetSharedItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSerializedSetSharedItemClass_block_invoke_cold_1();
  getCCSerializedSetSharedItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCCSerializedSetItemClass_block_invoke(uint64_t a1)
{
  Class result;

  IntelligencePlatformLibraryLibrary();
  result = objc_getClass("CCSerializedSetItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSerializedSetItemClass_block_invoke_cold_1();
  getCCSerializedSetItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t CCPBDataWriterWriteBareVarint(_BYTE *a1, unint64_t a2)
{
  _BYTE *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = a1;
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
  }
  else
  {
    do
    {
      *v2++ = a2 | 0x80;
      v3 = a2 >> 7;
      v4 = a2 >> 14;
      a2 >>= 7;
    }
    while (v4);
  }
  *v2 = v3;
  return v2 - a1 + 1;
}

_QWORD *CCPBDataWriterWriteInt32Field(uint64_t a1, unsigned int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    v8 = v7 - result[2];
    if (v8 <= 0x10)
      v9 = 16;
    else
      v9 = v8;
    -[CCPBMutableData _pb_growCapacityBy:](result, v9);
    result = *(_QWORD **)(a1 + 8);
  }
  v10 = (int)a2;
  if (a3 != -1)
  {
    v11 = (8 * a3);
    v12 = (_BYTE *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        v13 = v11 >> 7;
        v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *v12 = v13;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v12 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v15 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      v16 = v10 >> 7;
      v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  *v15 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

_QWORD *CCPBDataWriterWriteInt64Field(uint64_t a1, unint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      v14 = a2 >> 7;
      v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *v13 = v14;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *CCPBDataWriterWriteUint64Field(uint64_t a1, unint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      v14 = a2 >> 7;
      v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *v13 = v14;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *CCPBDataWriterWriteBOOLField(uint64_t a1, char a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  *v13 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *CCPBDataWriterWriteSint32Field(uint64_t a1, int a2, int a3)
{
  unint64_t v5;
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  v5 = (2 * a2) ^ (a2 >> 31);
  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  if (v5 < 0x80)
  {
    LOBYTE(v14) = v5;
  }
  else
  {
    do
    {
      *v13++ = v5 | 0x80;
      v14 = v5 >> 7;
      v15 = v5 >> 14;
      v5 >>= 7;
    }
    while (v15);
  }
  *v13 = v14;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *CCPBDataWriterWriteSint64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _QWORD *result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;

  v6 = 2 * a2;
  result = *(_QWORD **)(a1 + 8);
  v8 = result[3];
  if (v8 < result[1] + 16)
  {
    v9 = v8 - result[2];
    if (v9 <= 0x10)
      v10 = 16;
    else
      v10 = v9;
    -[CCPBMutableData _pb_growCapacityBy:](result, v10);
    result = *(_QWORD **)(a1 + 8);
  }
  v11 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    v12 = (8 * a3);
    v13 = (_BYTE *)result[1];
    if (v12 < 0x80)
    {
      LOBYTE(v14) = 8 * a3;
    }
    else
    {
      do
      {
        *v13++ = v12 | 0x80;
        v14 = v12 >> 7;
        v15 = v12 >> 14;
        v12 >>= 7;
      }
      while (v15);
    }
    *v13 = v14;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v16 = (_BYTE *)result[1];
  if (v11 < 0x80)
  {
    v17 = v6 ^ (a2 >> 63);
  }
  else
  {
    do
    {
      *v16++ = v11 | 0x80;
      v17 = v11 >> 7;
      v18 = v11 >> 14;
      v11 >>= 7;
    }
    while (v18);
  }
  *v16 = v17;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v16 + 1;
  return result;
}

_QWORD *CCPBDataWriterWriteFloatField(uint64_t a1, int a2, float a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14)
      v8 = 20;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a2 != -1)
  {
    v9 = (8 * a2) | 5u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(float *)result[1] = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 4;
  return result;
}

_QWORD *CCPBDataWriterWriteDoubleField(uint64_t a1, int a2, double a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18)
      v8 = 24;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a2 != -1)
  {
    v9 = (8 * a2) | 1u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(double *)result[1] = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 8;
  return result;
}

_QWORD *CCPBDataWriterWriteFixed32Field(uint64_t a1, int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14)
      v8 = 20;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 5u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 4;
  return result;
}

_QWORD *CCPBDataWriterWriteFixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18)
      v8 = 24;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 1u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_QWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 8;
  return result;
}

_QWORD *CCPBDataWriterWriteSfixed32Field(uint64_t a1, int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14)
      v8 = 20;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 5u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 4;
  return result;
}

_QWORD *CCPBDataWriterWriteSfixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18)
      v8 = 24;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 1u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_QWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 8;
  return result;
}

void CCPBDataWriterWriteDataField(uint64_t a1, void *a2, int a3)
{
  const void *v5;
  size_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  size_t v15;
  size_t v16;
  size_t v17;
  id v18;

  v18 = objc_retainAutorelease(a2);
  v5 = (const void *)objc_msgSend(v18, "bytes");
  v6 = objc_msgSend(v18, "length");
  v7 = *(_QWORD **)(a1 + 8);
  v8 = v7[3];
  if (v8 < v7[1] + v6 + 16)
  {
    if (v8 - v7[2] <= v6 + 16)
      v9 = v6 + 16;
    else
      v9 = v8 - v7[2];
    -[CCPBMutableData _pb_growCapacityBy:](v7, v9);
    v7 = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v10 = (8 * a3) | 2u;
    v11 = (_BYTE *)v7[1];
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        v12 = v10 >> 7;
        v13 = v10 >> 14;
        v10 >>= 7;
      }
      while (v13);
    }
    *v11 = v12;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v11 + 1;
    v7 = *(_QWORD **)(a1 + 8);
  }
  v14 = (_BYTE *)v7[1];
  if (v6 < 0x80)
  {
    LOBYTE(v16) = v6;
  }
  else
  {
    v15 = v6;
    do
    {
      *v14++ = v15 | 0x80;
      v16 = v15 >> 7;
      v17 = v15 >> 14;
      v15 >>= 7;
    }
    while (v17);
  }
  *v14 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v14 + 1;
  memcpy(*(void **)(*(_QWORD *)(a1 + 8) + 8), v5, v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v6;

}

_QWORD *CCPBDataWriterPlaceMark(uint64_t a1, _QWORD *a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 10)
  {
    if (v7 - result[2] <= 0xA)
      v8 = 10;
    else
      v8 = v7 - result[2];
    -[CCPBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 2u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  ++result[1];
  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) - *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  return result;
}

_QWORD *CCPBDataWriterRecallMark(uint64_t a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  size_t v16;
  size_t v17;

  result = *(_QWORD **)(a1 + 8);
  v5 = result[1];
  v6 = result[2];
  v7 = *a2;
  v8 = v5 - (*a2 + v6);
  v9 = -1;
  v10 = v8;
  do
  {
    ++v9;
    v11 = v10 > 0x7F;
    v10 >>= 7;
  }
  while (v11);
  if (v9)
  {
    v12 = result[3];
    if (v12 < v5 + v9)
    {
      v13 = v12 - v6;
      if (v13 <= v9)
        v14 = v9;
      else
        v14 = v13;
      -[CCPBMutableData _pb_growCapacityBy:](result, v14);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
      v7 = *a2;
    }
    result = memmove((void *)(v6 + v7 + v9), (const void *)(v6 + v7), v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
    v7 = *a2;
  }
  v15 = (_BYTE *)(v6 + v7 - 1);
  if (v8 < 0x80)
  {
    LOBYTE(v16) = v8;
  }
  else
  {
    do
    {
      *v15++ = v8 | 0x80;
      v16 = v8 >> 7;
      v17 = v8 >> 14;
      v8 >>= 7;
    }
    while (v17);
  }
  *v15 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v9;
  return result;
}

void CCPBDataWriterWriteRepeatedUInt32Field(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedUInt32Field_block_invoke;
  v9[3] = &unk_250990408;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateUInt32ValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void CCPBDataWriterWriteRepeatedUInt64Field(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedUInt64Field_block_invoke;
  v9[3] = &unk_250990430;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateUInt64ValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void CCPBDataWriterWriteRepeatedInt32Field(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedInt32Field_block_invoke;
  v9[3] = &unk_250990458;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateInt32ValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void CCPBDataWriterWriteRepeatedInt64Field(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedInt64Field_block_invoke;
  v9[3] = &unk_250990480;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateInt64ValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void CCPBDataWriterWriteRepeatedFloatField(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedFloatField_block_invoke;
  v9[3] = &unk_2509904A8;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateFloatValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void CCPBDataWriterWriteRepeatedDoubleField(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedDoubleField_block_invoke;
  v9[3] = &unk_2509904D0;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateDoubleValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void CCPBDataWriterWriteRepeatedBoolField(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __CCPBDataWriterWriteRepeatedBoolField_block_invoke;
  v9[3] = &unk_2509904F8;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateBoolValuesWithBlock:", v9);

  objc_msgSend(v7, "immutableData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField(a1, v8, a3);

}

void sub_237B3698C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_237B39374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

void sub_237B39880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B39B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B3B268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B3B4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B3B84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B3BDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedSiteIdentifierClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_250990810;
    v5 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary)
    __getCKDistributedSiteIdentifierClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CKDistributedSiteIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKDistributedSiteIdentifierClass_block_invoke_cold_2();
  getCKDistributedSiteIdentifierClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

uint64_t CCItemStateDescription(unsigned int a1)
{
  const __CFString *v1;

  if (a1 > 2)
    v1 = CFSTR("Undefined");
  else
    v1 = off_250990828[(char)a1];
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%u)"), v1, a1);
}

uint64_t CCPBReaderSkipValueWithTag(void *a1, int a2, int a3)
{
  return _CCPBReaderSkipValueWithTag(a1, a2, a3, 0);
}

uint64_t CCPBReaderReadBigEndianFixed16(void *a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFDLL && (v3 = v2 + 2, v2 + 2 <= v1[5]))
  {
    v4 = *(unsigned __int16 *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    v4 = 0;
    v1[2] = 1;
  }
  v5 = __rev16(v4);

  return v5;
}

uint64_t CCPBReaderReadBigEndianFixed32(void *a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFBLL && (v3 = v2 + 4, v2 + 4 <= v1[5]))
  {
    v4 = *(_DWORD *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    v4 = 0;
    v1[2] = 1;
  }
  v5 = bswap32(v4);

  return v5;
}

unint64_t CCPBReaderReadBigEndianFixed64(void *a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = a1;
  v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFF7 && (v3 = v2 + 8, v2 + 8 <= v1[5]))
  {
    v4 = *(_QWORD *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    v4 = 0;
    v1[2] = 1;
  }
  v5 = bswap64(v4);

  return v5;
}

id CCPBReaderReadString(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = a1;
  v2 = v1;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = v1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5])
      break;
    v8 = *(_BYTE *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(v1, "hasError") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = v2[1];
    v9 = __CFADD__(v12, v10);
    v13 = v12 + v10;
    if (v9 || v13 > v2[5])
    {
      v11 = 0;
      v2[2] = 1;
    }
    else
    {
      v14 = objc_msgSend((id)v2[4], "bytes") + v2[1];
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v14, v10, 4);
      v2[1] += v10;
    }
  }

  return v11;
}

id CCPBReaderReadData(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v1 = a1;
  v2 = v1;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = v1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5])
      break;
    v8 = *(_BYTE *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    if (v4++ >= 9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(v1, "hasError") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = v2[1];
    if (__CFADD__(v12, v10) || (unint64_t)(v12 + v10) > v2[5])
    {
      v11 = 0;
      v2[2] = 1;
    }
    else
    {
      objc_msgSend((id)v2[4], "subdataWithRange:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v2[1] += v10;
    }
  }

  return v11;
}

uint64_t CCPBReaderPlaceMark(void *a1, unint64_t *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  char v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v3 = a1;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = v3[1];
  while (1)
  {
    v9 = v8 + 1;
    if (v8 == -1 || v9 > v3[5])
      break;
    v10 = *(_BYTE *)(v3[3] + v8);
    v3[1] = v9;
    v7 |= (unint64_t)(v10 & 0x7F) << v5;
    if ((v10 & 0x80) == 0)
      goto LABEL_9;
    v5 += 7;
    v8 = v9;
    if (v6++ >= 9)
    {
      v12 = 0;
      goto LABEL_12;
    }
  }
  v3[2] = 1;
LABEL_9:
  if (v3[2])
    v12 = 0;
  else
    v12 = v7;
LABEL_12:
  if ((objc_msgSend(v3, "hasError") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = v4[1] + v12;
    if (v14 <= v4[5])
    {
      *a2 = v14;
      a2[1] = v4[5];
      v4[5] = v4[1] + v12;
      v13 = 1;
    }
    else
    {
      v13 = 0;
      v4[2] = 1;
    }
  }

  return v13;
}

uint64_t CCPBReaderRecallMark(uint64_t result, _QWORD *a2)
{
  *(_QWORD *)(result + 8) = *a2;
  *(_QWORD *)(result + 40) = a2[1];
  return result;
}

id CCPBReaderReadDataNoCopy(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;

  v1 = a1;
  v2 = v1;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = v1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > v1[5])
      break;
    v8 = *(_BYTE *)(v1[3] + v6);
    v1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  v1[2] = 1;
LABEL_9:
  if (v1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(v1, "hasError") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = v2[1];
    v9 = __CFADD__(v12, v10);
    v13 = v12 + v10;
    if (v9 || v13 > v2[5])
    {
      v11 = 0;
      v2[2] = 1;
    }
    else
    {
      v14 = objc_retainAutorelease((id)v2[4]);
      v15 = objc_msgSend(v14, "bytes") + v2[1];
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v15, v10, 0);
      v2[1] += v10;

    }
  }

  return v11;
}

uint64_t _CCPBReaderSkipValueWithTag(void *a1, int a2, int a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  unint64_t v24;
  char v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v34;

  v7 = a1;
  v8 = v7;
  v9 = 0;
  switch(a3)
  {
    case 0:
      v10 = 0;
      v11 = v7[1];
      while (1)
      {
        v12 = v11 + 1;
        if (v11 == -1 || v12 > v7[5])
          break;
        v13 = *(char *)(v7[3] + v11);
        v7[1] = v12;
        v9 = 1;
        if (v13 < 0)
        {
          v11 = v12;
          v14 = v10++ > 8;
          if (!v14)
            continue;
        }
        goto LABEL_50;
      }
      v9 = 1;
      v7[2] = 1;
      goto LABEL_50;
    case 1:
      v15 = v7[1];
      if (v15 > 0xFFFFFFFFFFFFFFF7)
        goto LABEL_47;
      v16 = v15 + 8;
      goto LABEL_46;
    case 2:
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = v7[1];
      while (2)
      {
        v21 = v20 + 1;
        if (v20 == -1 || v21 > v7[5])
        {
          v7[2] = 1;
          v21 = v20;
        }
        else
        {
          v22 = *(_BYTE *)(v7[3] + v20);
          v7[1] = v21;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if (v22 < 0)
          {
            v17 += 7;
            v20 = v21;
            v23 = v18++ >= 9;
            if (v23)
            {
              v19 = 0;
              goto LABEL_45;
            }
            continue;
          }
        }
        break;
      }
      v19 = v19;
      if (v7[2])
        v19 = 0;
LABEL_45:
      v23 = __CFADD__(v21, v19);
      v16 = v21 + v19;
      if (v23)
        goto LABEL_47;
LABEL_46:
      if (v16 > v7[5])
      {
LABEL_47:
        v9 = 1;
        v7[2] = 1;
        goto LABEL_50;
      }
      v7[1] = v16;
      goto LABEL_49;
    case 3:
      if ((objc_msgSend(v7, "hasError") & 1) != 0)
        goto LABEL_49;
      v24 = a4 + 1;
      break;
    case 5:
      v34 = v7[1];
      if (v34 > 0xFFFFFFFFFFFFFFFBLL)
        goto LABEL_47;
      v16 = v34 + 4;
      goto LABEL_46;
    default:
      goto LABEL_50;
  }
  while (2)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = v8[1];
    while (1)
    {
      v29 = v28 + 1;
      if (v28 == -1 || v29 > v8[5])
        break;
      v30 = *(_BYTE *)(v8[3] + v28);
      v8[1] = v29;
      v27 |= (unint64_t)(v30 & 0x7F) << v25;
      if ((v30 & 0x80) == 0)
        goto LABEL_28;
      v25 += 7;
      v28 = v29;
      v14 = v26++ > 8;
      if (v14)
      {
        v31 = 0;
        v32 = 0;
        goto LABEL_34;
      }
    }
    v8[2] = 1;
LABEL_28:
    if (v8[2])
      v27 = 0;
    v32 = v27 & 7;
    v31 = v27 >> 3;
    if ((_DWORD)v32 == 4 && (_DWORD)v31 == a2)
      break;
LABEL_34:
    if (v24 < 0x41)
      _CCPBReaderSkipValueWithTag(v8, v31, v32, v24);
    else
      v8[2] = 2;
    if (!objc_msgSend(v8, "hasError", v32))
      continue;
    break;
  }
LABEL_49:
  v9 = 1;
LABEL_50:

  return v9;
}

uint64_t CCPBReaderReadVarIntBuf(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t result;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  while (1)
  {
    if (a2 == v5)
      return 0;
    v7 = *(_BYTE *)(a1 + v5);
    v6 |= (unint64_t)(v7 & 0x7F) << v4;
    ++v5;
    if ((v7 & 0x80) == 0)
      break;
    v4 += 7;
    if (v5 == 10)
    {
      result = 0;
      *a4 = 11;
      *a3 = 0;
      return result;
    }
  }
  *a3 = v6;
  *a4 = v5;
  return 1;
}

void CCPBReaderAppendRepeatedUInt32FieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5])
          break;
        v19 = *(_BYTE *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_27;
        v15 += 7;
        v14 = v18;
        v9 = v16++ >= 9;
        if (v9)
        {
          v20 = 0;
          goto LABEL_30;
        }
      }
      a1[2] = 1;
LABEL_27:
      if (a1[2])
        v20 = 0;
      else
        v20 = v17;
LABEL_30:
      objc_msgSend(v21, "appendUInt32Value:", v20);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedUInt64FieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5])
          break;
        v19 = *(_BYTE *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_27;
        v15 += 7;
        v14 = v18;
        v9 = v16++ >= 9;
        if (v9)
        {
          v20 = 0;
          goto LABEL_30;
        }
      }
      a1[2] = 1;
LABEL_27:
      if (a1[2])
        v20 = 0;
      else
        v20 = v17;
LABEL_30:
      objc_msgSend(v21, "appendUInt64Value:", v20);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedInt32FieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5])
          break;
        v19 = *(_BYTE *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_27;
        v15 += 7;
        v14 = v18;
        v9 = v16++ >= 9;
        if (v9)
        {
          v20 = 0;
          goto LABEL_30;
        }
      }
      a1[2] = 1;
LABEL_27:
      if (a1[2])
        v20 = 0;
      else
        v20 = v17;
LABEL_30:
      objc_msgSend(v21, "appendInt32Value:", v20);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedInt64FieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5])
          break;
        v19 = *(_BYTE *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_27;
        v15 += 7;
        v14 = v18;
        v9 = v16++ >= 9;
        if (v9)
        {
          v20 = 0;
          goto LABEL_30;
        }
      }
      a1[2] = 1;
LABEL_27:
      if (a1[2])
        v20 = 0;
      else
        v20 = v17;
LABEL_30:
      objc_msgSend(v21, "appendInt64Value:", v20);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedFloatFieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;

  v16 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v12 = a1[1];
    v9 = __CFADD__(v12, v10);
    v13 = v12 + v10;
    if (v9 || v13 > a1[5])
    {
      v14 = 1;
LABEL_16:
      a1[2] = v14;
      goto LABEL_17;
    }
    while (1)
    {
      v15 = a1[1];
      if (v15 >= v13)
        break;
      if (v15 <= 0xFFFFFFFFFFFFFFFBLL && v15 + 4 <= a1[5])
      {
        LODWORD(v11) = *(_DWORD *)(a1[3] + v15);
        a1[1] = v15 + 4;
      }
      else
      {
        a1[2] = 1;
        LODWORD(v11) = 0;
      }
      objc_msgSend(v16, "appendFloatValue:", v11);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v15 != v13)
    {
      v14 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedDoubleFieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  id v16;

  v16 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      if (v14 <= 0xFFFFFFFFFFFFFFF7 && v14 + 8 <= a1[5])
      {
        v15 = *(double *)(a1[3] + v14);
        a1[1] = v14 + 8;
      }
      else
      {
        a1[2] = 1;
        v15 = 0.0;
      }
      objc_msgSend(v16, "appendDoubleValue:", v15);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedBoolFieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  id v20;

  v20 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5])
          break;
        v19 = *(_BYTE *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_27;
        v15 += 7;
        v14 = v18;
        v9 = v16++ >= 9;
        if (v9)
        {
          v17 = 0;
          goto LABEL_29;
        }
      }
      a1[2] = 1;
LABEL_27:
      if (a1[2])
        v17 = 0;
LABEL_29:
      objc_msgSend(v20, "appendBoolValue:", v17 != 0);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

void CCPBReaderAppendRepeatedEnumFieldValues(_QWORD *a1, void *a2)
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1[1];
  while (1)
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > a1[5])
      break;
    v8 = *(_BYTE *)(a1[3] + v6);
    a1[1] = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
      goto LABEL_9;
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
    if (v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
  }
  a1[2] = 1;
LABEL_9:
  if (a1[2])
    v10 = 0;
  else
    v10 = v5;
LABEL_12:
  if ((objc_msgSend(a1, "hasError") & 1) == 0)
  {
    v11 = a1[1];
    v9 = __CFADD__(v11, v10);
    v12 = v11 + v10;
    if (v9 || v12 > a1[5])
    {
      v13 = 1;
LABEL_16:
      a1[2] = v13;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = a1[1];
      if (v14 >= v12)
        break;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = v14 + 1;
        if (v14 == -1 || v18 > a1[5])
          break;
        v19 = *(_BYTE *)(a1[3] + v14);
        a1[1] = v18;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0)
          goto LABEL_27;
        v15 += 7;
        v14 = v18;
        v9 = v16++ >= 9;
        if (v9)
        {
          v20 = 0;
          goto LABEL_30;
        }
      }
      a1[2] = 1;
LABEL_27:
      if (a1[2])
        v20 = 0;
      else
        v20 = v17;
LABEL_30:
      objc_msgSend(v21, "appendRawEnumValue:", v20);
      if ((objc_msgSend(a1, "hasError") & 1) != 0)
        goto LABEL_17;
    }
    if (v14 != v12)
    {
      v13 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

id _columnValueFromSQLiteStatement(sqlite3_stmt *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  NSObject *v8;
  const void *v9;
  void *v10;
  void *v12;
  void *v13;
  int v14;
  unsigned __int8 *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = sqlite3_column_type(a1, a2);
  switch((int)v4)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_column_int64(a1, a2));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(a1, a2));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      v7 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
      if (!v7)
        goto LABEL_14;
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
LABEL_13:
      v7 = (unsigned __int8 *)v5;
LABEL_14:
      _NSNullIfNilObject(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    case 4:
      v9 = sqlite3_column_blob(a1, a2);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, sqlite3_column_bytes(a1, a2));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    default:
      v6 = v4;
      v7 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
      if (v7)
        v7 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v7;
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        _os_log_error_impl(&dword_237B25000, v8, OS_LOG_TYPE_ERROR, "value: %@ with unknown column type (sqlite_column_index: %@, sqlite_column_type: %@)", (uint8_t *)&v14, 0x20u);

      }
      goto LABEL_14;
  }
}

id _createSQLiteAPIErrorFromResultCode(int a1, uint64_t a2)
{
  const char *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v4 = sqlite3_errstr(a1);
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = v6;
      if (v5)
      {
        objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x24BDD0FC8]);

      }
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("CCSQLiteAPIErrorExtendedCode"));

    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.SQLiteAPI"), a1, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  _NSNullIfNilObject(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id _errorDescriptionForCommand()
{
  void *v0;
  objc_class *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDD17C8];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("Failed to execute %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

CCDatabaseExecutionResult *_createExecutionResult(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  CCDatabaseExecutionResult *v10;

  v7 = a4;
  v8 = a3;
  v9 = a1;
  v10 = -[CCDatabaseExecutionResult initWithCommand:beginMachTime:endMachTime:rowValueTuples:error:]([CCDatabaseExecutionResult alloc], "initWithCommand:beginMachTime:endMachTime:rowValueTuples:error:", v9, a2, mach_absolute_time(), v8, v7);

  return v10;
}

uint64_t CCSQLiteDatabaseExtendedErrorCode(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!a1)
    return 0;
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD1398]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CCSQLiteAPIErrorExtendedCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;

  return v5;
}

void sub_237B414D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCKDistributedTimestampStateVectorClass()
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
  v0 = (void *)getCKDistributedTimestampStateVectorClass_softClass;
  v7 = getCKDistributedTimestampStateVectorClass_softClass;
  if (!getCKDistributedTimestampStateVectorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampStateVectorClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCKDistributedTimestampStateVectorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B42908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_250990958;
    v5 = 0;
    CloudKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_0)
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CKDistributedTimestampStateVector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2();
  getCKDistributedTimestampStateVectorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_237B430B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

id _donationInactiveError(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation %@ request (%@) cannot be processed on an inactive donation."), a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Donate"), 4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _donationResponseError(void *a1, void *a2, unsigned int a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a2;
  v7 = a1;
  v8 = CCDonateErrorCodeFromServiceResponse(a3);
  v15 = *MEMORY[0x24BDD0FC8];
  v9 = (void *)MEMORY[0x24BDD17C8];
  CCDonateServiceResponseDescription(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Donation %@ request (%@) failed: %@"), v7, v6, v10, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Donate"), v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_237B444AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B44614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B44700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const __CFString *CCSharedItemChangeTypeToString(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (!a1)
    v1 = CFSTR("SharedItemAdded");
  if (a1 == 2)
    return CFSTR("SharedItemRemoved");
  else
    return v1;
}

const __CFString *CCStringFromItemFieldDataType(unsigned int a1)
{
  if (a1 > 0x15)
    return CFSTR("Unknown");
  else
    return *(&off_250990B48 + (char)a1);
}

uint64_t CCReplicatedEntityEnumeratorBookmarkCurrentVersion()
{
  return 6;
}

id getCKDistributedTimestampStateVectorClass_0()
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
  v0 = (void *)getCKDistributedTimestampStateVectorClass_softClass_0;
  v7 = getCKDistributedTimestampStateVectorClass_softClass_0;
  if (!getCKDistributedTimestampStateVectorClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampStateVectorClass_block_invoke_0;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCKDistributedTimestampStateVectorClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B4A574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_250990BF8;
    v5 = 0;
    CloudKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_1)
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("CKDistributedTimestampStateVector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_0();
  getCKDistributedTimestampStateVectorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CCInvalidSetItemTypeIdentifierErrorForIdentifier(unsigned int a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The provided type identifier %hu is not a valid item type identifier"), a1, *MEMORY[0x24BDD0BA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CCInvalidBufferErrorForMessage(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Protocol buffer deserialization failed for message: %@"), a1, *MEMORY[0x24BDD0BA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD1398];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Serialization"), a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id CCSkipFieldErrorForMessage(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Protocol buffer could not skip field with tag %u type %u failed for message: %@"), a2, a3, a1, *MEMORY[0x24BDD0BA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x24BDD1398];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Serialization"), a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CCMismatchedFieldAccessorErrorForField(void *a1, void *a2, void *a3, void *a4)
{
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1540];
  v22 = *MEMORY[0x24BDD10D8];
  v8 = (objc_class *)MEMORY[0x24BDD17C8];
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = a1;
  v13 = (void *)objc_msgSend([v8 alloc], "initWithFormat:", CFSTR("Using selector %@ on a field with name: %@ of dataType: %@ - use %@ instead"), v11, v12, v10, v9);

  v14 = objc_alloc(MEMORY[0x24BDD1540]);
  v24 = *MEMORY[0x24BDD0FC8];
  v25[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 1, v15);

  v21 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id CCErrorByJoiningMismatchedFieldAccessorErrorUnderlyingErrors(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  v6 = (_QWORD *)MEMORY[0x24BDD10D8];
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "addObjectsFromArray:", v8);
    }

  }
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "addObjectsFromArray:", v10);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v15 = *v6;
    v16[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 1, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id CCUnrecognizedIdentifierErrorForDescription(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v1 = (objc_class *)MEMORY[0x24BDD1540];
  v2 = a1;
  v3 = [v1 alloc];
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 6, v4);
  return v5;
}

id CCMissingSourceItemIdentifierErrorForMessage(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v1 = (objc_class *)MEMORY[0x24BDD1540];
  v2 = a1;
  v3 = [v1 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided data for message %@ is missing a source identifer"), v2, *MEMORY[0x24BDD0BA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 7, v5);

  return v6;
}

id getCKDistributedTimestampStateVectorClass_1()
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
  v0 = (void *)getCKDistributedTimestampStateVectorClass_softClass_1;
  v7 = getCKDistributedTimestampStateVectorClass_softClass_1;
  if (!getCKDistributedTimestampStateVectorClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampStateVectorClass_block_invoke_1;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCKDistributedTimestampStateVectorClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B4C234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKDistributedTimestampClass()
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
  v0 = (void *)getCKDistributedTimestampClass_softClass;
  v7 = getCKDistributedTimestampClass_softClass;
  if (!getCKDistributedTimestampClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCKDistributedTimestampClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCKDistributedTimestampClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B4CD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B4DC04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

id getCKMergeableDeltaVectorsClass()
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
  v0 = (void *)getCKMergeableDeltaVectorsClass_softClass;
  v7 = getCKMergeableDeltaVectorsClass_softClass;
  if (!getCKMergeableDeltaVectorsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCKMergeableDeltaVectorsClass_block_invoke;
    v3[3] = &unk_2509903C8;
    v3[4] = &v4;
    __getCKMergeableDeltaVectorsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_237B4DCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B4E10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B4E1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke_1(uint64_t a1)
{
  Class result;

  CloudKitLibrary();
  result = objc_getClass("CKDistributedTimestampStateVector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_1();
  getCKDistributedTimestampStateVectorClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CloudKitLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_2)
  {
    v1 = xmmword_250990CC8;
    v2 = 0;
    CloudKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_2)
    CloudKitLibrary_cold_1(&v0);
}

Class __getCKDistributedTimestampClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudKitLibrary();
  result = objc_getClass("CKDistributedTimestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKDistributedTimestampClass_block_invoke_cold_1();
  getCKDistributedTimestampClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKMergeableDeltaVectorsClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudKitLibrary();
  result = objc_getClass("CKMergeableDeltaVectors");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKMergeableDeltaVectorsClass_block_invoke_cold_1();
  getCKMergeableDeltaVectorsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

_QWORD *CCSetError(_QWORD *result, id a2)
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

void CCSetAndReportError(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
    *a1 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = v4;
    AnalyticsSendEventLazy();

  }
}

uint64_t CCValidateUInt32Field(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "compare:", &unk_2509A1C10) == -1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for uint32_t field %@ is less than 0"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = &v18;
  }
  else
  {
    if (objc_msgSend(v6, "compare:", &unk_2509A1C28) != 1)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for uint32_t field %@ is greater than UINT32_MAX"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateUInt64Field(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "compare:", &unk_2509A1C10) == -1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for uint64_t field %@ is less than 0"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = &v18;
  }
  else
  {
    if (objc_msgSend(v6, "compare:", &unk_2509A1C40) != 1)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for uint64_t field %@ is greater than UINT64_MAX"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateInt32Field(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "compare:", &unk_2509A1C58) == -1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for int32_t field %@ is less than INT32_MIN"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = &v18;
  }
  else
  {
    if (objc_msgSend(v6, "compare:", &unk_2509A1C70) != 1)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for int32_t field %@ is greater than INT32_MAX"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateInt64Field(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "compare:", &unk_2509A1C88) == -1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for int64_t field %@ is less than INT64_MIN"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = &v18;
  }
  else
  {
    if (objc_msgSend(v6, "compare:", &unk_2509A1CA0) != 1)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for int64_t field %@ is greater than INT64_MAX"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateFloatField(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "compare:", &unk_2509A1EC8) == -1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for float field %@ is less than FLT_MIN"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = &v18;
  }
  else
  {
    if (objc_msgSend(v6, "compare:", &unk_2509A1ED8) != 1)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for float field %@ is greater than FLT_MAX"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateDoubleField(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "compare:", &unk_2509A1EE8) == -1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for double field %@ is less than DBL_MIN"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v19;
    v11 = &v18;
  }
  else
  {
    if (objc_msgSend(v6, "compare:", &unk_2509A1EF8) != 1)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for double field %@ is greater than DBL_MAX"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v17;
    v11 = &v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v14 = 0;
LABEL_10:

  return v14;
}

uint64_t CCValidateBoolField(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  const __CFNumber *v6;
  CFIndex ByteSize;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  ByteSize = CFNumberGetByteSize(v6);
  if (ByteSize == 1)
  {
    if (-[__CFNumber compare:](v6, "compare:", &unk_2509A1C10) == -1)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for BOOL field %@ is less than zero and is not likely to be a boxed BOOLean"), v6, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v20;
      v12 = &v19;
    }
    else
    {
      if (-[__CFNumber compare:](v6, "compare:", &unk_2509A1CB8) != 1)
      {
        v15 = 1;
        goto LABEL_11;
      }
      v8 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for BOOL field %@ is greater than one and is not likely to be a boxed BOOLean"), v6, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v9;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v18;
      v12 = &v17;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided NSNumber %@ for BOOL field %@ is has storage size %ld and is not likely to be a boxed BOOLean"), v6, v5, ByteSize);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = (void **)v22;
    v12 = &v21;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 3, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 && v14)
  {
    v14 = objc_retainAutorelease(v14);
    *a3 = v14;
  }

  v15 = 0;
LABEL_11:

  return v15;
}

BOOL CCValidateRepeatedEnumField(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a1;
  v8 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __CCValidateRepeatedEnumField_block_invoke;
  v12[3] = &unk_250990D10;
  v15 = &v19;
  v16 = a3;
  v14 = v17;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "enumerateUInt32ValuesWithBlock:", v12);
  v10 = (void *)v20[5];
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v10 == 0;
}

void sub_237B4F514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t CCValidateArrayValues(void *a1, void *a2, objc_class *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v24 = (void *)MEMORY[0x24BDD1540];
            v34 = *MEMORY[0x24BDD0BA0];
            v25 = (void *)MEMORY[0x24BDD17C8];
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(a3);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("Provided array element for field %@ is of class %@, expected class: %@"), v7, v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v21;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 2, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (a4 && v27)
              *a4 = objc_retainAutorelease(v27);

            goto LABEL_18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        v14 = 1;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0BA0];
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Provided object for field %@ is of class %@, expected class: %@"), v7, v9, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 2, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a4 && v22)
    {
      v23 = objc_retainAutorelease(v22);
      *a4 = v23;
    }
LABEL_18:

    v14 = 0;
  }

  return v14;
}

BOOL CCIsEmptyOrWhitespace(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  _BOOL8 v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (objc_msgSend(v3, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", 0)))
    {
      v4 = 1;
      do
      {
        v5 = v4;
        if (v2 == v4)
          break;
        v6 = objc_msgSend(v3, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", v4));
        v4 = v5 + 1;
      }
      while ((v6 & 1) != 0);
      v7 = v5 >= v2;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

id CCAttributionIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v1 = a1;
  CCTypeIdentifierRegistryBridge();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionForTypeIdentifier:", objc_msgSend(v1, "itemType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "descriptorWithKey:", CFSTR("sourceIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

id CCDateFormattedStringFromTimeMicros(uint64_t a1)
{
  void *v2;
  void *v3;

  if (a1 < 1)
  {
    v3 = 0;
  }
  else
  {
    if (CCDateFormattedStringFromTimeMicros_onceToken != -1)
      dispatch_once(&CCDateFormattedStringFromTimeMicros_onceToken, &__block_literal_global_5);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)a1 / 1000000.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)CCDateFormattedStringFromTimeMicros_formatter, "stringFromDate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void sub_237B50370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_237B50EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id CCAddAcountInfoToDescriptors(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  +[CCSetDescriptor accountIdentifierFromAccount:error:](CCSetDescriptor, "accountIdentifierFromAccount:error:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "isEqual:", v6, (_QWORD)v13) & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      objc_msgSend(v7, "arrayByAddingObject:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t CCDonateErrorCodeFromServiceResponse(__int16 a1)
{
  if ((unsigned __int16)(a1 - 4) > 7u)
    return 0;
  else
    return qword_237B6DA68[(__int16)(a1 - 4)];
}

void sub_237B54098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_237B54584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_237B547F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  uint64_t v28;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v28 - 128), 8);
  _Block_object_dispose((const void *)(v28 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_237B548D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_237B54948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_237B549FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_237B54B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<std::vector<unsigned short>>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

void sub_237B54F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_237B553C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_237B5570C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__shared_ptr_emplace<std::vector<unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2509901F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2509901F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B820604);
}

void std::__shared_ptr_emplace<std::vector<unsigned short>>::__on_zero_shared(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

uint64_t std::shared_ptr<std::vector<unsigned short>>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25098FD18, MEMORY[0x24BEDAAF0]);
}

void sub_237B558E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  void *v0;

  return objc_msgSend(v0, "pid");
}

__CFString *CCDataResourceStatusToString(unint64_t a1)
{
  __CFString *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 >= 5)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      CCDataResourceStatusToString_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unknown - %lu"), a1);
  }
  else
  {
    v2 = off_250991098[a1];
  }
  return v2;
}

uint64_t CCDataResourceStatusIsNotDiscoverable(unint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 < 5)
    return (0x18u >> a1) & 1;
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    CCDataResourceStatusIsNotDiscoverable_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

char *OUTLINED_FUNCTION_6_1(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_7()
{
  return __error();
}

uint64_t CCProtectionClassForDataSiteURL()
{
  return 3;
}

uint64_t CCDefaultDataSite(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", *MEMORY[0x24BE0C028], 1, a1);
}

uint64_t CCDefaultDataSiteExists(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", *MEMORY[0x24BE0C028], 1, a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v3, &v7);
  if (v7)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

id CCGetOrCreateDirectoryPath(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", a1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CCGetOrCreateDirectoryURL(v3, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], -1000, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a2, v3);
    v4 = 0;
  }

  return v4;
}

id CCGetOrCreateDirectoryURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v3 = a1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, a2);

    v6 = 0;
    if (v5)
      v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], -1000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a2, v7);

    v6 = 0;
  }

  return v6;
}

uint64_t CCRemoveItemIfExistsAtPath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = CCRemoveItemIfExistsAtURL(v4, a2);
    return v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0B88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid path: \"%@\""), v3, *MEMORY[0x24BDD0FC8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -1000, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a2, v11);

    return 0;
  }
}

uint64_t CCRemoveItemIfExistsAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (!v3)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD0B88];
    v16 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid item URL: %@"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -1000, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a2, v11);

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v15);
  v6 = v15;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v12 = objc_msgSend(v6, "code");

    if (v12 == 4)
      goto LABEL_6;
    CCSetError(a2, v7);
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }

LABEL_6:
  v13 = 1;
LABEL_9:

  return v13;
}

id CCReadPropertyList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a1, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, a2, 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id CCSetsRootDirectoryURL()
{
  void *v0;
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE0C098], "setsDirectoryForDomain:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    CCSetsRootDirectoryURL_cold_1((uint64_t)v1, v2);

  return v1;
}

void sub_237B59B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

uint64_t CCDatabaseSetClockValueRange(void *a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(a1, "unsignedIntValue");
  if (v3)
    objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

uint64_t CCDatabaseSetAtomState(void *a1)
{
  int v1;
  unsigned int v2;

  v1 = objc_msgSend(a1, "unsignedShortValue");
  if (v1 == 1)
    v2 = 1;
  else
    v2 = 3;
  if (v1 == 2)
    return 2;
  else
    return v2;
}

void sub_237B5A958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKDistributedTimestampStateVectorClass_block_invoke_2(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CloudKitLibraryCore_frameworkLibrary_3)
  {
    v4 = xmmword_250991158;
    v5 = 0;
    CloudKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary_3)
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_2(&v3);
  result = objc_getClass("CKDistributedTimestampStateVector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_1();
  getCKDistributedTimestampStateVectorClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_237B5AC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *CCSetChangeXPCEventStream()
{
  return "com.apple.cascade.xpc_event.setChange";
}

id CCSetChangeXPCEventEncode(void *a1)
{
  id v1;
  xpc_object_t empty;
  id v3;

  v1 = a1;
  empty = xpc_dictionary_create_empty();
  objc_msgSend(v1, "encodedDescriptors");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(empty, "descriptors", (const char *)objc_msgSend(v3, "UTF8String"));

  LODWORD(v3) = objc_msgSend(v1, "itemType");
  xpc_dictionary_set_uint64(empty, "itemType", v3);
  return empty;
}

CCSet *CCSetChangeXPCEventDecode(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int16 uint64;
  CCSet *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "descriptors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v4, "itemType");

  v7 = -[CCSet initWithItemType:encodedDescriptors:error:]([CCSet alloc], "initWithItemType:encodedDescriptors:error:", uint64, v5, a2);
  return v7;
}

void sub_237B5B3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_237B5C878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B60594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_237B60838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B60EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_237B612FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237B61664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_237B61B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_237B62068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1, uint64_t a2)
{
  return a2;
}

void __getCCSerializedSetMessageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCSerializedSetMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSerializedSet.m"), 26, CFSTR("Unable to find class %s"), "CCSerializedSetMessage");

  __break(1u);
}

void IntelligencePlatformLibraryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IntelligencePlatformLibraryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCSerializedSet.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCCSerializedSetDeviceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCSerializedSetDeviceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSerializedSet.m"), 28, CFSTR("Unable to find class %s"), "CCSerializedSetDevice");

  __break(1u);
}

void __getCCSerializedSetDescriptorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCSerializedSetDescriptorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSerializedSet.m"), 27, CFSTR("Unable to find class %s"), "CCSerializedSetDescriptor");

  __break(1u);
}

void __getCCSerializedSetItemInstanceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCSerializedSetItemInstanceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSerializedSet.m"), 30, CFSTR("Unable to find class %s"), "CCSerializedSetItemInstance");

  __break(1u);
}

void __getCCSerializedSetSharedItemClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCSerializedSetSharedItemClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSerializedSet.m"), 29, CFSTR("Unable to find class %s"), "CCSerializedSetSharedItem");

  __break(1u);
}

void __getCCSerializedSetItemClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCSerializedSetItemClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSerializedSet.m"), 31, CFSTR("Unable to find class %s"), "CCSerializedSetItem");

  __break(1u);
}

void __getCCTypeIdentifierRegistryClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IntelligencePlatformLibraryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCTypeIdentifierRegistryBase.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCCTypeIdentifierRegistryClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCCTypeIdentifierRegistryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCTypeIdentifierRegistryBase.m"), 17, CFSTR("Unable to find class %s"), "CCTypeIdentifierRegistry");

  __break(1u);
}

void __getCKDistributedSiteIdentifierClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCDatabaseSetStateReader.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKDistributedSiteIdentifierClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKDistributedSiteIdentifierClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCDatabaseSetStateReader.m"), 40, CFSTR("Unable to find class %s"), "CKDistributedSiteIdentifier");

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCSetChangeBookmark.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKDistributedTimestampStateVectorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCSetChangeBookmark.m"), 20, CFSTR("Unable to find class %s"), "CKDistributedTimestampStateVector");

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCReplicatedEntityEnumeratorBookmark.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKDistributedTimestampStateVectorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCReplicatedEntityEnumeratorBookmark.m"), 16, CFSTR("Unable to find class %s"), "CKDistributedTimestampStateVector");

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKDistributedTimestampStateVectorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCDatabaseSetChangeEnumerator.m"), 43, CFSTR("Unable to find class %s"), "CKDistributedTimestampStateVector");

  __break(1u);
}

void CloudKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCDatabaseSetChangeEnumerator.m"), 41, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKDistributedTimestampClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKDistributedTimestampClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCDatabaseSetChangeEnumerator.m"), 45, CFSTR("Unable to find class %s"), "CKDistributedTimestamp");

  __break(1u);
}

void __getCKMergeableDeltaVectorsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKMergeableDeltaVectorsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCDatabaseSetChangeEnumerator.m"), 44, CFSTR("Unable to find class %s"), "CKMergeableDeltaVectors");

  __break(1u);
}

void CCDataResourceStatusToString_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "CCDataResourceStatusToString received invalid value %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void CCDataResourceStatusIsNotDiscoverable_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "CCDataResourceStatusIsNotDiscoverable received invalid value %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void CCWritePropertyList_cold_1(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Parent directory: %@ does not exist (isDirectory: %i)", (uint8_t *)&v4, 0x12u);
}

void CCSetsRootDirectoryURL_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "[BiomeAccess] using root directory URL: %@", (uint8_t *)&v2, 0xCu);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_1_2(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCDatabaseSetStateVectorBuilder.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKDistributedTimestampStateVectorClass_block_invoke_cold_2_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKDistributedTimestampStateVectorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCDatabaseSetStateVectorBuilder.m"), 14, CFSTR("Unable to find class %s"), "CKDistributedTimestampStateVector");

  __break(1u);
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x24BE1A1A8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BMAccessModePrintableDescription()
{
  return MEMORY[0x24BE0C010]();
}

uint64_t BMShouldRetry()
{
  return MEMORY[0x24BE0C038]();
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x24BDBC108](number);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void operator delete(void *__p)
{
  off_25098FD30(__p);
}

uint64_t operator delete()
{
  return off_25098FD38();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25098FD40(__sz);
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x24BE0C0D0]();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x24BDAFB68](path, name, *(_QWORD *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF50](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDDF78](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return MEMORY[0x24BEDDFB8](a1, *(_QWORD *)&a2, *(_QWORD *)&n);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x24BEDDFF8](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x24BDB0A10]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x24BDB0A18]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x24BDB0A20]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x24BDB0A30]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x24BDB0A38]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x24BDB0B78]();
}


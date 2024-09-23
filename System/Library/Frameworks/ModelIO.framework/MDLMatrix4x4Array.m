@implementation MDLMatrix4x4Array

- (id)copyWithZone:(_NSZone *)a3
{
  MDLMatrix4x4Array *v4;
  const char *v5;

  v4 = [MDLMatrix4x4Array alloc];
  return (id)objc_msgSend_initWithElementCount_(v4, v5, self->_elementCount);
}

- (MDLDataPrecision)precision
{
  VtValue *p_data;

  p_data = &self->_data;
  if ((sub_1DCBD3FB0((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_data) & 1) != 0)
    return 1;
  if (sub_1DCBD3FE8((pxrInternal__aapl__pxrReserved__::VtValue *)p_data))
    return 2;
  return 0;
}

- (VtValue)defaultVtValue
{
  uint64_t *v2;
  uint64_t *v3;
  VtValue *p_data;
  uint64_t v5;
  _TypeInfo *v6;
  _BYTE v7[40];
  VtValue result;

  v3 = v2;
  p_data = &self->_data;
  if (sub_1DCBD3FB0((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_data))
  {
    sub_1DCBD40F8((uint64_t)v7, 0);
    v3[1] = (uint64_t)&off_1EA575548;
    sub_1DCB272BC(v3, (uint64_t)v7);
    sub_1DCAEEE78((uint64_t)v7);
  }
  else
  {
    v5 = sub_1DCBD3FE8((pxrInternal__aapl__pxrReserved__::VtValue *)p_data);
    if ((_DWORD)v5)
    {
      sub_1DCBD416C((uint64_t)v7, 0);
      v3[1] = (uint64_t)&off_1EA575490;
      sub_1DCB272BC(v3, (uint64_t)v7);
      sub_1DCAEEE78((uint64_t)v7);
    }
    else
    {
      v3[1] = 0;
    }
  }
  result._info._ptrAndBits = v6;
  result._storage = (type)v5;
  return result;
}

- (void)resetWithUsdAttribute:(const void *)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v4[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_1DCBD3FB0((pxrInternal__aapl__pxrReserved__::VtValue *)v4) & 1) != 0
    || sub_1DCBD3FE8((pxrInternal__aapl__pxrReserved__::VtValue *)v4))
  {
    sub_1DCB9AD14(&self->_data._storage, v4);
  }
  sub_1DCAEEE2C((uint64_t)v4);
}

- (void)resetWithUsdAttribute:(const void *)a3 time:(double)a4
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_1DCBD3FB0((pxrInternal__aapl__pxrReserved__::VtValue *)v5) & 1) != 0
    || sub_1DCBD3FE8((pxrInternal__aapl__pxrReserved__::VtValue *)v5))
  {
    sub_1DCB9AD14(&self->_data._storage, v5);
  }
  sub_1DCAEEE2C((uint64_t)v5);
}

- (void)clear
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[1] = 0;
  sub_1DCB273D4(&self->_data._storage, v2);
  sub_1DCAEEE2C((uint64_t)v2);
}

- (MDLMatrix4x4Array)initWithElementCount:(NSUInteger)arrayElementCount
{
  MDLMatrix4x4Array *v4;
  MDLMatrix4x4Array *v5;
  MDLMatrix4x4Array *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDLMatrix4x4Array;
  v4 = -[MDLMatrix4x4Array init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_elementCount = arrayElementCount;
    v6 = v4;
  }

  return v5;
}

- (void)setFloat4x4Array:(const matrix_float4x4 *)valuesArray count:(NSUInteger)count
{
  NSUInteger v4;
  unint64_t elementCount;
  uint64_t v8;
  simd_float4 *v9;
  simd_float4 *v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  _OWORD v15[2];
  uint64_t v16;
  uint64_t v17[3];

  v4 = count;
  v17[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    sub_1DCBD40F8((uint64_t)v15, count);
    if (v4)
    {
      v8 = 0;
      v9 = &valuesArray->columns[2];
      do
      {
        v13 = v9[v8 - 1];
        v14 = v9[v8 - 2];
        v11 = v9[v8 + 1];
        v12 = v9[v8];
        sub_1DCBD640C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v15);
        v10 = (simd_float4 *)(v16 + v8 * 16);
        *v10 = v14;
        v10[1] = v13;
        v10[2] = v12;
        v10[3] = v11;
        v8 += 4;
        --v4;
      }
      while (v4);
    }
    v17[1] = (uint64_t)&off_1EA575548;
    sub_1DCB272BC(v17, (uint64_t)v15);
    sub_1DCB273D4(&self->_data._storage, v17);
    sub_1DCAEEE2C((uint64_t)v17);
    sub_1DCAEEE78((uint64_t)v15);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLMatrix4x4Array.elementCount (%lu)"), a2, valuesArray, count, elementCount);
  }
}

- (void)setDouble4x4Array:(const matrix_double4x4 *)valuesArray count:(NSUInteger)count
{
  NSUInteger v4;
  unint64_t elementCount;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;
  uint64_t v20[3];

  v4 = count;
  v20[2] = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_1DCBD416C((uint64_t)v18, count);
    if (v4)
    {
      v8 = 0;
      do
      {
        v16 = *(_OWORD *)&valuesArray[v8].columns[1].f64[2];
        v17 = *(_OWORD *)&valuesArray[v8].columns[0].f64[2];
        v12 = *(_OWORD *)valuesArray[v8].columns[1].f64;
        v13 = *(_OWORD *)valuesArray[v8].columns[0].f64;
        v14 = *(_OWORD *)&valuesArray[v8].columns[3].f64[2];
        v15 = *(_OWORD *)&valuesArray[v8].columns[2].f64[2];
        v10 = *(_OWORD *)valuesArray[v8].columns[3].f64;
        v11 = *(_OWORD *)valuesArray[v8].columns[2].f64;
        sub_1DCBD64AC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v18);
        v9 = (_OWORD *)(v19 + v8 * 128);
        *v9 = v13;
        v9[1] = v17;
        v9[2] = v12;
        v9[3] = v16;
        v9[4] = v11;
        v9[5] = v15;
        v9[6] = v10;
        v9[7] = v14;
        ++v8;
        --v4;
      }
      while (v4);
    }
    v20[1] = (uint64_t)&off_1EA575490;
    sub_1DCB272BC(v20, (uint64_t)v18);
    sub_1DCB273D4(&self->_data._storage, v20);
    sub_1DCAEEE2C((uint64_t)v20);
    sub_1DCAEEE78((uint64_t)v18);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLMatrix4x4Array.elementCount (%lu)"), a2, valuesArray, count, elementCount);
  }
}

- (NSUInteger)getFloat4x4Array:(matrix_float4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  NSUInteger elementCount;
  std::type_info *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  matrix_float4x4 *v18;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = maxCount;
  v25 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v23 = 0;
    v24 = 0;
    sub_1DCB25EEC(&v23, &self->_data._storage);
    if (v24)
    {
      if ((sub_1DCBD3FB0((pxrInternal__aapl__pxrReserved__::VtValue *)&v23) & 1) == 0)
      {
        v7 = sub_1DCBD4878((pxrInternal__aapl__pxrReserved__::VtValue *)&v23);
        sub_1DCB9AD14(&v23, v7);
      }
      v8 = sub_1DCBD4900((pxrInternal__aapl__pxrReserved__::VtValue *)&v23);
      v9 = *(_OWORD *)(v8 + 16);
      v20 = *(_OWORD *)v8;
      v21 = v9;
      v10 = *(_QWORD *)(v8 + 32);
      v22 = v10;
      if (v10)
      {
        v11 = (unint64_t *)(v10 - 16);
        if (*((_QWORD *)&v21 + 1))
          v11 = (unint64_t *)*((_QWORD *)&v21 + 1);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
      if ((unint64_t)v20 < v4)
        v4 = v20;
      if (v4)
      {
        v13 = 0;
        v14 = v4;
        do
        {
          sub_1DCBD640C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v20);
          v15 = *(simd_float4 *)(v22 + v13 + 16);
          v16 = *(simd_float4 *)(v22 + v13 + 32);
          v17 = *(simd_float4 *)(v22 + v13 + 48);
          v18 = &valuesArray[v13 / 0x40];
          v18->columns[0] = *(simd_float4 *)(v22 + v13);
          v18->columns[1] = v15;
          v18->columns[2] = v16;
          v18->columns[3] = v17;
          v13 += 64;
          --v14;
        }
        while (v14);
      }
      sub_1DCAEEE78((uint64_t)&v20);
    }
    else
    {
      v4 = 0;
    }
    sub_1DCAEEE2C((uint64_t)&v23);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedVector3Array.elementCount (%lu)"), a2, valuesArray, maxCount, elementCount);
    return 0;
  }
  return v4;
}

- (NSUInteger)getDouble4x4Array:(matrix_double4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4;
  NSUInteger elementCount;
  std::type_info *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD *v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = maxCount;
  v29 = *MEMORY[0x1E0C80C00];
  elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    v27 = 0;
    v28 = 0;
    sub_1DCB25EEC(&v27, &self->_data._storage);
    if (v28)
    {
      if ((sub_1DCBD3FE8((pxrInternal__aapl__pxrReserved__::VtValue *)&v27) & 1) == 0)
      {
        v7 = sub_1DCBD4B48((pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
        sub_1DCB9AD14(&v27, v7);
      }
      v8 = sub_1DCBD4BD0((pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
      v9 = *(_OWORD *)(v8 + 16);
      v24 = *(_OWORD *)v8;
      v25 = v9;
      v10 = *(_QWORD *)(v8 + 32);
      v26 = v10;
      if (v10)
      {
        v11 = (unint64_t *)(v10 - 16);
        if (*((_QWORD *)&v25 + 1))
          v11 = (unint64_t *)*((_QWORD *)&v25 + 1);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
      if ((unint64_t)v24 < v4)
        v4 = v24;
      if (v4)
      {
        v13 = 112;
        v14 = v4;
        do
        {
          sub_1DCBD64AC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v24);
          v15 = *(_OWORD *)(v26 + v13 - 96);
          v16 = *(_OWORD *)(v26 + v13 - 80);
          v17 = *(_OWORD *)(v26 + v13 - 64);
          v18 = *(_OWORD *)(v26 + v13 - 48);
          v19 = *(_OWORD *)(v26 + v13 - 32);
          v20 = *(_OWORD *)(v26 + v13 - 16);
          v21 = *(_OWORD *)(v26 + v13);
          v22 = (_OWORD *)((char *)valuesArray + v13);
          *(v22 - 7) = *(_OWORD *)(v26 + v13 - 112);
          *(v22 - 6) = v15;
          *(v22 - 5) = v16;
          *(v22 - 4) = v17;
          *(v22 - 3) = v18;
          *(v22 - 2) = v19;
          *(v22 - 1) = v20;
          *v22 = v21;
          v13 += 128;
          --v14;
        }
        while (v14);
      }
      sub_1DCAEEE78((uint64_t)&v24);
    }
    else
    {
      v4 = 0;
    }
    sub_1DCAEEE2C((uint64_t)&v27);
  }
  else
  {
    NSLog(CFSTR("array count (%lu) has to match MDLAnimatedVector3Array.elementCount (%lu)"), a2, valuesArray, maxCount, elementCount);
    return 0;
  }
  return v4;
}

- (NSUInteger)elementCount
{
  return self->_elementCount;
}

- (void).cxx_destruct
{
  sub_1DCAEEE2C((uint64_t)&self->_data);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

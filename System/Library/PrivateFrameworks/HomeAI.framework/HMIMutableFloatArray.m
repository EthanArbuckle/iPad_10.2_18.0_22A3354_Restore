@implementation HMIMutableFloatArray

- (HMIMutableFloatArray)init
{
  HMIMutableFloatArray *v2;
  NSMutableData *v3;
  NSMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIMutableFloatArray;
  v2 = -[HMIMutableFloatArray init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    data = v2->_data;
    v2->_data = v3;

  }
  return v2;
}

- (HMIMutableFloatArray)initWithData:(id)a3
{
  id v4;
  HMIMutableFloatArray *v5;
  uint64_t v6;
  NSMutableData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIMutableFloatArray;
  v5 = -[HMIMutableFloatArray init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableData *)v6;

  }
  return v5;
}

- (HMIMutableFloatArray)initWithValue:(float)a3 count:(unint64_t)a4
{
  HMIMutableFloatArray *v6;
  uint64_t v7;
  NSMutableData *data;
  double v9;

  v6 = -[HMIMutableFloatArray init](self, "init");
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4 * a4);
    data = v6->_data;
    v6->_data = (NSMutableData *)v7;

    *(float *)&v9 = a3;
    -[HMIMutableFloatArray fillWithFloat:](v6, "fillWithFloat:", v9);
  }
  return v6;
}

- (HMIMutableFloatArray)initWithFloats:(const float *)a3 count:(unint64_t)a4
{
  HMIMutableFloatArray *v6;

  v6 = -[HMIMutableFloatArray init](self, "init");
  -[HMIMutableFloatArray appendFloats:count:](v6, "appendFloats:count:", a3, a4);
  return v6;
}

- (HMIMutableFloatArray)initWithDataTensor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  HMIMutableFloatArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "shape", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v9 *= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  v11 = -[HMIMutableFloatArray initWithFloats:count:](self, "initWithFloats:count:", objc_msgSend(v4, "dataPointer"), v9);
  return v11;
}

- (void)fillWithFloat:(float)a3
{
  HMIMutableFloatArray *v3;
  float __A;

  __A = a3;
  v3 = objc_retainAutorelease(self);
  vDSP_vfill(&__A, -[HMIMutableFloatArray mutableFloats](v3, "mutableFloats"), 1, -[HMIMutableFloatArray count](v3, "count"));
}

- (void)appendFloats:(const float *)a3 count:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", a3, 4 * a4);
}

- (void)appendArray:(id)a3
{
  NSMutableData *data;
  id v4;

  data = self->_data;
  objc_msgSend(a3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableData appendData:](data, "appendData:", v4);

}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (unint64_t)count
{
  return -[NSMutableData length](self->_data, "length") >> 2;
}

- (const)floats
{
  return (const float *)-[NSMutableData bytes](self->_data, "bytes");
}

- (float)mutableFloats
{
  return (float *)-[NSMutableData mutableBytes](self->_data, "mutableBytes");
}

- (void)scale:(float)a3
{
  HMIMutableFloatArray *v3;
  const float *v4;
  HMIMutableFloatArray *v5;
  float __B;

  __B = a3;
  v3 = objc_retainAutorelease(self);
  v4 = -[HMIMutableFloatArray floats](v3, "floats");
  v5 = objc_retainAutorelease(v3);
  vDSP_vsmul(v4, 1, &__B, -[HMIMutableFloatArray mutableFloats](v5, "mutableFloats"), 1, -[HMIMutableFloatArray count](v5, "count"));
}

- (void)subtract:(id)a3
{
  const float *v4;
  HMIMutableFloatArray *v5;
  const float *v6;
  HMIMutableFloatArray *v7;

  v4 = (const float *)objc_msgSend(objc_retainAutorelease(a3), "floats");
  v5 = objc_retainAutorelease(self);
  v6 = -[HMIMutableFloatArray floats](v5, "floats");
  v7 = objc_retainAutorelease(v5);
  vDSP_vsub(v4, 1, v6, 1, -[HMIMutableFloatArray mutableFloats](v7, "mutableFloats"), 1, -[HMIMutableFloatArray count](v7, "count"));
}

- (void)add:(id)a3
{
  const float *v4;
  HMIMutableFloatArray *v5;
  const float *v6;
  HMIMutableFloatArray *v7;

  v4 = (const float *)objc_msgSend(objc_retainAutorelease(a3), "floats");
  v5 = objc_retainAutorelease(self);
  v6 = -[HMIMutableFloatArray floats](v5, "floats");
  v7 = objc_retainAutorelease(v5);
  vDSP_vadd(v4, 1, v6, 1, -[HMIMutableFloatArray mutableFloats](v7, "mutableFloats"), 1, -[HMIMutableFloatArray count](v7, "count"));
}

- (float)l2Norm
{
  HMIMutableFloatArray *v2;
  float __C;

  __C = 0.0;
  v2 = objc_retainAutorelease(self);
  vDSP_svesq(-[HMIMutableFloatArray floats](v2, "floats"), 1, &__C, -[HMIMutableFloatArray count](v2, "count"));
  return sqrtf(__C);
}

- (id)floatArrayByScaling:(float)a3
{
  void *v4;
  double v5;

  v4 = (void *)-[HMIMutableFloatArray copy](self, "copy");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "scale:", v5);
  return v4;
}

- (id)floatArrayByAdding:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[HMIMutableFloatArray copy](self, "copy");
  objc_msgSend(v5, "add:", v4);

  return v5;
}

- (id)floatArrayBySubtracting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[HMIMutableFloatArray copy](self, "copy");
  objc_msgSend(v5, "subtract:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMIMutableFloatArray initWithData:]([HMIMutableFloatArray alloc], "initWithData:", self->_data);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HMIMutableFloatArray initWithData:]([HMIMutableFloatArray alloc], "initWithData:", self->_data);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

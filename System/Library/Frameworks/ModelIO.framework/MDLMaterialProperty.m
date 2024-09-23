@implementation MDLMaterialProperty

- (vector_float3)float3Value
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  vector_float3 result;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_float3Value(v4, v5, v6);

  }
  result.i64[1] = v8;
  result.i64[0] = v7;
  return result;
}

- (float)floatValue
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  float v8;
  float v9;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_floatValue(v5, v6, v7);
    v9 = v8;

  }
  else
  {
    v9 = *(float *)self->_float;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overridee);
  objc_destroyWeak((id *)&self->_overrider);
  objc_destroyWeak((id *)&self->_node);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_textureSampler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)URLValue
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  NSURL *v8;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_URLValue(v5, v6, v7);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self->_url;
  }

  return v8;
}

- (void)setURLValue:(NSURL *)URLValue
{
  objc_storeStrong((id *)&self->_url, URLValue);
  self->_type = 2;
  self->_isDefaultValue = 0;
}

- (void)setType:(MDLMaterialPropertyType)type
{
  self->_type = type;
}

- (void)setFloatValue:(float)floatValue
{
  *(float *)self->_float = floatValue;
  self->_type = 5;
  self->_isDefaultValue = 0;
}

- (void)setFloat3Value:(vector_float3)float3Value
{
  __int128 v3;

  HIDWORD(v3) = *(_DWORD *)&self->_float[12];
  *(_OWORD *)self->_float = v3;
  self->_type = 7;
  self->_isDefaultValue = 0;
}

- (void)setProperties:(MDLMaterialProperty *)property
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t name;
  NSString *v8;
  NSString *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  const char *v13;
  MDLMaterialProperty *v14;

  v14 = property;
  if (self != v14)
  {
    objc_msgSend_clear(self, v4, v5);
    name = (uint64_t)v14->_name;
    if (name)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v6, name);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_name;
      self->_name = v8;

    }
    self->_semantic = v14->_semantic;
    v10 = *(_OWORD *)v14->_anon_40;
    v11 = *(_OWORD *)&v14->_anon_40[16];
    v12 = *(_OWORD *)&v14->_anon_40[48];
    *(_OWORD *)&self->_anon_40[32] = *(_OWORD *)&v14->_anon_40[32];
    *(_OWORD *)&self->_anon_40[48] = v12;
    *(_OWORD *)self->_anon_40 = v10;
    *(_OWORD *)&self->_anon_40[16] = v11;
    *(_OWORD *)self->_float = *(_OWORD *)v14->_float;
    objc_storeStrong((id *)&self->_textureSampler, v14->_textureSampler);
    objc_storeStrong((id *)&self->_url, v14->_url);
    objc_storeStrong((id *)&self->_string, v14->_string);
    self->_type = v14->_type;
    self->_isDefaultValue = v14->_isDefaultValue;
    objc_msgSend_setColor_(self, v13, (uint64_t)v14->_color);
  }

}

- (MDLMaterialSemantic)semantic
{
  return self->_semantic;
}

- (void)dealloc
{
  CGColor *color;
  objc_super v4;

  color = self->_color;
  if (color)
  {
    CFRelease(color);
    self->_color = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MDLMaterialProperty;
  -[MDLMaterialProperty dealloc](&v4, sel_dealloc);
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float:(float)value
{
  NSString *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  MDLMaterialProperty *v12;

  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  v11 = objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    *(_OWORD *)(v11 + 48) = LODWORD(value);
    *(_QWORD *)(v11 + 192) = 5;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic
{
  NSString *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  MDLMaterialProperty *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  MDLTextureSampler *textureSampler;
  NSURL *url;
  NSString *string;
  MDLBufferView *buffer;
  objc_super v21;

  v6 = name;
  objc_msgSend_clear(self, v7, v8);
  v21.receiver = self;
  v21.super_class = (Class)MDLMaterialProperty;
  v10 = -[MDLMaterialProperty init](&v21, sel_init);
  if (v10)
  {
    if (v6)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v9, (uint64_t)v6);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v10->_name;
      v10->_name = (NSString *)v11;

    }
    v10->_semantic = semantic;
    v13 = MEMORY[0x1E0C83FF0];
    v14 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)v10->_anon_40 = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&v10->_anon_40[16] = v14;
    v15 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)&v10->_anon_40[32] = *(_OWORD *)(v13 + 32);
    *(_OWORD *)&v10->_anon_40[48] = v15;
    *(_QWORD *)v10->_float = 0;
    *(_QWORD *)&v10->_float[8] = 0;
    textureSampler = v10->_textureSampler;
    v10->_textureSampler = 0;

    url = v10->_url;
    v10->_url = 0;

    string = v10->_string;
    v10->_string = 0;

    v10->_type = 5;
    buffer = v10->_buffer;
    v10->_buffer = 0;

    objc_storeWeak((id *)&v10->_node, 0);
    objc_storeWeak((id *)&v10->_overridee, 0);
    objc_storeWeak((id *)&v10->_overrider, 0);
    v10->_isDefaultValue = 1;
  }

  return v10;
}

- (void)clear
{
  NSString *string;
  NSString *name;
  NSURL *url;
  MDLTextureSampler *textureSampler;

  string = self->_string;
  self->_string = 0;

  name = self->_name;
  self->_name = 0;

  url = self->_url;
  self->_url = 0;

  textureSampler = self->_textureSampler;
  self->_textureSampler = 0;

  self->_color = 0;
  *(_OWORD *)&self->_anon_40[32] = 0u;
  *(_OWORD *)&self->_anon_40[48] = 0u;
  *(_OWORD *)self->_anon_40 = 0u;
  *(_OWORD *)&self->_anon_40[16] = 0u;
  *(_OWORD *)self->_float = 0u;
  self->_semantic = 0x8000;
  objc_storeWeak((id *)&self->_node, 0);
  objc_storeWeak((id *)&self->_overrider, 0);
  objc_storeWeak((id *)&self->_overridee, 0);
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic color:(CGColorRef)color
{
  NSString *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  MDLMaterialProperty *v12;

  v8 = name;
  objc_msgSend_clear(self, v9, v10);
  v12 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_(self, v11, (uint64_t)v8, semantic);
  if (v12)
  {
    v12->_color = CGColorCreateCopy(color);
    v12->_type = 4;
  }

  return v12;
}

- (NSString)stringValue
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_stringValue(v5, v6, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self->_string;
  }

  return v8;
}

- (void)setTextureSamplerValue:(MDLTextureSampler *)textureSamplerValue
{
  objc_storeStrong((id *)&self->_textureSampler, textureSamplerValue);
  self->_type = 3;
  self->_isDefaultValue = 0;
}

- (MDLTextureSampler)textureSamplerValue
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  MDLTextureSampler *v8;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_textureSamplerValue(v5, v6, v7);
    v8 = (MDLTextureSampler *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self->_textureSampler;
  }

  return v8;
}

- (void)setStringValue:(NSString *)stringValue
{
  objc_storeStrong((id *)&self->_string, stringValue);
  self->_type = 1;
  self->_isDefaultValue = 0;
}

- (MDLMaterialPropertyType)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const char *v23;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_string, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_name, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_url, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  objc_storeStrong((id *)(v10 + 32), self->_textureSampler);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)self->_float;
  v20 = *(_OWORD *)self->_anon_40;
  v21 = *(_OWORD *)&self->_anon_40[16];
  v22 = *(_OWORD *)&self->_anon_40[48];
  *(_OWORD *)(v10 + 96) = *(_OWORD *)&self->_anon_40[32];
  *(_OWORD *)(v10 + 112) = v22;
  *(_OWORD *)(v10 + 64) = v20;
  *(_OWORD *)(v10 + 80) = v21;
  *(_QWORD *)(v10 + 152) = self->_semantic;
  *(_QWORD *)(v10 + 192) = self->_type;
  objc_msgSend_setColor_((void *)v10, v23, (uint64_t)self->_color);
  return (id)v10;
}

- (void)setName:(NSString *)name
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  v4 = name;
  v7 = v4;
  if (v4)
  {
    objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], (const char *)v4, (uint64_t)v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_name;
    self->_name = v5;
  }
  else
  {
    v6 = self->_name;
    self->_name = 0;
  }

}

- (void)setSemantic:(MDLMaterialSemantic)semantic
{
  self->_semantic = semantic;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float2:(vector_float2)value
{
  NSString *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  MDLMaterialProperty *v12;

  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  v11 = objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    *(_OWORD *)(v11 + 48) = (unint64_t)value;
    *(_QWORD *)(v11 + 192) = 6;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float3:(vector_float3)value
{
  __int128 v5;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  MDLMaterialProperty *v13;
  __int128 v14;
  __int128 v16;

  v16 = v5;
  v8 = name;
  objc_msgSend_clear(self, v9, v10);
  v12 = objc_msgSend_initWithName_semantic_(self, v11, (uint64_t)v8, semantic);
  v13 = (MDLMaterialProperty *)v12;
  if (v12)
  {
    v14 = v16;
    HIDWORD(v14) = 0;
    *(_OWORD *)(v12 + 48) = v14;
    *(_QWORD *)(v12 + 192) = 7;
  }

  return v13;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic float4:(vector_float4)value
{
  NSString *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  vector_float4 *v11;
  MDLMaterialProperty *v12;

  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  v11 = (vector_float4 *)objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    v11[3] = value;
    v11[12].i64[0] = 8;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic matrix4x4:(matrix_float4x4)value
{
  NSString *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  matrix_float4x4 *v11;
  MDLMaterialProperty *v12;

  v7 = name;
  objc_msgSend_clear(self, v8, v9);
  v11 = (matrix_float4x4 *)objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, semantic);
  v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    v11[1] = value;
    v11[3].columns[0].i64[0] = 9;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic URL:(NSURL *)URL
{
  NSString *v8;
  NSURL *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  MDLMaterialProperty *v14;

  v8 = name;
  v9 = URL;
  objc_msgSend_clear(self, v10, v11);
  v13 = objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, semantic);
  v14 = (MDLMaterialProperty *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 24), URL);
    v14->_type = 2;
  }

  return v14;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic string:(NSString *)string
{
  NSString *v8;
  NSString *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  MDLMaterialProperty *v15;
  uint64_t v16;
  NSString *v17;

  v8 = name;
  v9 = string;
  objc_msgSend_clear(self, v10, v11);
  v15 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, semantic);
  if (v15)
  {
    v16 = objc_msgSend_copy(v9, v13, v14);
    v17 = v15->_string;
    v15->_string = (NSString *)v16;

    v15->_type = 1;
  }

  return v15;
}

- (MDLMaterialProperty)initWithName:(NSString *)name semantic:(MDLMaterialSemantic)semantic textureSampler:(MDLTextureSampler *)textureSampler
{
  NSString *v8;
  MDLTextureSampler *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  MDLMaterialProperty *v14;

  v8 = name;
  v9 = textureSampler;
  objc_msgSend_clear(self, v10, v11);
  v13 = objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, semantic);
  v14 = (MDLMaterialProperty *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 32), textureSampler);
    v14->_type = 3;
  }

  return v14;
}

- (MDLMaterialProperty)initWithName:(id)a3 semantic:(unint64_t)a4 float4WithSRGBA:
{
  __int128 v4;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  MDLMaterialProperty *v12;
  __int128 v14;

  v14 = v4;
  v7 = a3;
  objc_msgSend_clear(self, v8, v9);
  v11 = objc_msgSend_initWithName_semantic_(self, v10, (uint64_t)v7, a4);
  v12 = (MDLMaterialProperty *)v11;
  if (v11)
  {
    *(_OWORD *)(v11 + 48) = v14;
    *(_QWORD *)(v11 + 192) = 8;
  }

  return v12;
}

- (MDLMaterialProperty)initWithName:(id)a3 buffer:(id)a4 stride:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  MDLMaterialProperty *v14;

  v8 = a3;
  v9 = a4;
  objc_msgSend_clear(self, v10, v11);
  v13 = objc_msgSend_initWithName_semantic_(self, v12, (uint64_t)v8, 32769);
  v14 = (MDLMaterialProperty *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 136), a4);
    v14->_stride = a5;
    v14->_type = 10;
  }

  return v14;
}

- (MDLMaterialProperty)initWithName:(id)a3 buffer:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  MDLMaterialProperty *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  const char *v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend_clear(self, v9, v10);
  v14 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_(self, v11, (uint64_t)v7, 32769);
  if (v14)
  {
    if (objc_msgSend_type(v8, v12, v13) != 3)
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raise_format_(v16, v19, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: value.type must be MDLMeshBufferTypeCustom"), v18, v15);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v14->_buffer, a4);
    else
      NSLog(CFSTR("MDLMeshBuffer is not of type MDLMeshBufferView, unsupported"));
    v14->_stride = 0;
    v14->_type = 10;
  }

  return v14;
}

- (CGColorRef)color
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  CGColor *color;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    color = (CGColor *)objc_msgSend_color(v5, v6, v7);

  }
  else
  {
    color = self->_color;
  }

  return color;
}

- (void)setColor:(CGColorRef)color
{
  CGColor *v5;

  v5 = self->_color;
  if (v5)
  {
    CFRelease(v5);
    self->_color = 0;
  }
  if (color)
    self->_color = CGColorCreateCopy(color);
  self->_isDefaultValue = 0;
}

- (MDLBufferView)bufferData
{
  return self->_buffer;
}

- (unint64_t)stride
{
  return self->_stride;
}

- (float)luminance
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  float v8;
  float v9;
  float result;
  float64x2_t v11;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_luminance(v5, v6, v7);
    v9 = v8;

    return v9;
  }
  else
  {
    switch(self->_type)
    {
      case 4uLL:
        result = sub_1DCAD2508(self->_color);
        break;
      case 5uLL:
        return *(float *)self->_float;
      case 6uLL:
        return vaddv_f32(*(float32x2_t *)self->_float) * 0.5;
      case 7uLL:
      case 8uLL:
        v11 = vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)self->_float), (float64x2_t)xmmword_1DCC57C30);
        return *(float *)&self->_float[8] + 0.072187 + v11.f64[0] + v11.f64[1];
      default:
        return 0.0;
    }
  }
  return result;
}

- (vector_float2)float2Value
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  vector_float2 v8;
  vector_float2 v9;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_float2Value(v5, v6, v7);
    v9 = v8;

  }
  else
  {
    v9 = *(vector_float2 *)self->_float;
  }

  return v9;
}

- (void)setFloat2Value:(vector_float2)float2Value
{
  unint64_t v3;

  v3 = vextq_s8(*(int8x16_t *)self->_float, *(int8x16_t *)self->_float, 8uLL).u64[0];
  *(_OWORD *)self->_float = *(_OWORD *)float2Value.f32;
  self->_type = 6;
  self->_isDefaultValue = 0;
}

- (vector_float4)float4Value
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  vector_float4 v8;
  vector_float4 v10;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_float4Value(v5, v6, v7);
    v10 = v8;

  }
  else
  {
    v10 = *(vector_float4 *)self->_float;
  }

  return v10;
}

- (void)setFloat4Value:(vector_float4)float4Value
{
  *(vector_float4 *)self->_float = float4Value;
  self->_type = 8;
  self->_isDefaultValue = 0;
}

- (matrix_float4x4)matrix4x4
{
  MDLMaterialProperty **p_overrider;
  id WeakRetained;
  id v5;
  const char *v6;
  uint64_t v7;
  simd_float4 v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  matrix_float4x4 result;

  p_overrider = &self->_overrider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overrider);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overrider);
    objc_msgSend_matrix4x4(v5, v6, v7);
    v18 = v9;
    v19 = v8;
    v16 = v11;
    v17 = v10;

  }
  else
  {
    v18 = *(simd_float4 *)&self->_anon_40[16];
    v19 = *(simd_float4 *)self->_anon_40;
    v16 = *(simd_float4 *)&self->_anon_40[48];
    v17 = *(simd_float4 *)&self->_anon_40[32];
  }

  v13 = v18;
  v12 = v19;
  v15 = v16;
  v14 = v17;
  result.columns[3] = v15;
  result.columns[2] = v14;
  result.columns[1] = v13;
  result.columns[0] = v12;
  return result;
}

- (__n128)setMatrix4x4Value:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  result[12].n128_u64[0] = 9;
  result[11].n128_u8[8] = 0;
  return result;
}

- (void)_encodeVector:(id)a3 withCoder:(id)a4 forKey:
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  objc_msgSend_encodeBytes_length_forKey_(a3, a2, (uint64_t)&v5, 16, a4);
}

+ (__n128)_decodeVectorWithCoder:(id)a3 forKey:(uint64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  __n128 result;
  uint64_t v9;

  v9 = 0;
  v5 = objc_retainAutorelease(a3);
  v7 = objc_msgSend_decodeBytesForKey_returnedLength_(v5, v6, a4, &v9);
  result.n128_u64[0] = 0;
  if (v9 == 16)
    return *(__n128 *)v7;
  return result;
}

- (void)_encodeMatrixPropertyWithCoder:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v19 = *(_OWORD *)self->_anon_40;
  objc_msgSend_stringByAppendingString_(v6, v7, (uint64_t)CFSTR(".column0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__encodeVector_withCoder_forKey_(self, v9, (uint64_t)v23, v8, *(double *)&v19);

  v20 = *(_OWORD *)&self->_anon_40[16];
  objc_msgSend_stringByAppendingString_(v6, v10, (uint64_t)CFSTR(".column1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__encodeVector_withCoder_forKey_(self, v12, (uint64_t)v23, v11, *(double *)&v20);

  v21 = *(_OWORD *)&self->_anon_40[32];
  objc_msgSend_stringByAppendingString_(v6, v13, (uint64_t)CFSTR(".column2"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__encodeVector_withCoder_forKey_(self, v15, (uint64_t)v23, v14, *(double *)&v21);

  v22 = *(_OWORD *)&self->_anon_40[48];
  objc_msgSend_stringByAppendingString_(v6, v16, (uint64_t)CFSTR(".column3"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__encodeVector_withCoder_forKey_(self, v18, (uint64_t)v23, v17, *(double *)&v22);

}

+ (__n128)_decodeMatrixPropertyWithCoder:(void *)a3 forKey:(void *)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  __int128 v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  __int128 v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend_stringByAppendingString_(v7, v8, (uint64_t)CFSTR(".column0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v10, (uint64_t)v6, v9);
  v22 = v11;

  objc_msgSend_stringByAppendingString_(v7, v12, (uint64_t)CFSTR(".column1;"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v14, (uint64_t)v6, v13);

  objc_msgSend_stringByAppendingString_(v7, v15, (uint64_t)CFSTR(".column2"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v17, (uint64_t)v6, v16);

  objc_msgSend_stringByAppendingString_(v7, v18, (uint64_t)CFSTR(".column3"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v20, (uint64_t)v6, v19);

  return (__n128)v22;
}

- (void)encodeMaterialPropertyWithCoder:(id)a3 forKey:(id)a4 allocator:(id)a5
{
  id v8;
  id v9;
  NSString *string;
  const char *v11;
  void *v12;
  const char *v13;
  NSString *name;
  const char *v15;
  void *v16;
  const char *v17;
  NSURL *url;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  MDLBufferView *buffer;
  const char *v29;
  void *v30;
  const char *v31;
  unint64_t stride;
  const char *v33;
  void *v34;
  const char *v35;
  unint64_t semantic;
  const char *v37;
  void *v38;
  const char *v39;
  __int128 v40;
  id v41;

  v41 = a3;
  v8 = a4;
  v9 = a5;
  string = self->_string;
  objc_msgSend_stringByAppendingString_(v8, v11, (uint64_t)CFSTR(".string"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v41, v13, (uint64_t)string, v12);

  name = self->_name;
  objc_msgSend_stringByAppendingString_(v8, v15, (uint64_t)CFSTR(".name"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v41, v17, (uint64_t)name, v16);

  url = self->_url;
  objc_msgSend_stringByAppendingString_(v8, v19, (uint64_t)CFSTR(".url"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v41, v21, (uint64_t)url, v20);

  v40 = *(_OWORD *)self->_float;
  objc_msgSend_stringByAppendingString_(v8, v22, (uint64_t)CFSTR(".vector"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__encodeVector_withCoder_forKey_(self, v24, (uint64_t)v41, v23, *(double *)&v40);

  objc_msgSend_stringByAppendingString_(v8, v25, (uint64_t)CFSTR(".matrix"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__encodeMatrixPropertyWithCoder_forKey_(self, v27, (uint64_t)v41, v26);

  buffer = self->_buffer;
  objc_msgSend_stringByAppendingString_(v8, v29, (uint64_t)CFSTR(".buffer"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBuffer_withCoder_forKey_(v9, v31, (uint64_t)buffer, v41, v30);

  stride = self->_stride;
  objc_msgSend_stringByAppendingString_(v8, v33, (uint64_t)CFSTR(".stride"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v41, v35, stride, v34);

  semantic = self->_semantic;
  objc_msgSend_stringByAppendingString_(v8, v37, (uint64_t)CFSTR(".semantic"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v41, v39, semantic, v38);

}

+ (id)decodeMaterialPropertyWithCoder:(id)a3 forKey:(id)a4 allocator:(id)a5
{
  id v8;
  id v9;
  id v10;
  MDLMaterialProperty *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSString *string;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSURL *url;
  const char *v30;
  void *v31;
  const char *v32;
  __int128 v33;
  const char *v34;
  void *v35;
  const char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  MDLBufferView *buffer;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MDLMaterialProperty);
  v12 = objc_opt_class();
  objc_msgSend_stringByAppendingString_(v9, v13, (uint64_t)CFSTR(".string"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v8, v15, v12, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  string = v11->_string;
  v11->_string = (NSString *)v16;

  v18 = objc_opt_class();
  objc_msgSend_stringByAppendingString_(v9, v19, (uint64_t)CFSTR(".name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v8, v21, v18, v20);
  v22 = objc_claimAutoreleasedReturnValue();
  name = v11->_name;
  v11->_name = (NSString *)v22;

  v24 = objc_opt_class();
  objc_msgSend_stringByAppendingString_(v9, v25, (uint64_t)CFSTR(".url"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v8, v27, v24, v26);
  v28 = objc_claimAutoreleasedReturnValue();
  url = v11->_url;
  v11->_url = (NSURL *)v28;

  objc_msgSend_stringByAppendingString_(v9, v30, (uint64_t)CFSTR(".vector"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodeVectorWithCoder_forKey_(a1, v32, (uint64_t)v8, v31);
  *(_OWORD *)v11->_float = v33;

  objc_msgSend_stringByAppendingString_(v9, v34, (uint64_t)CFSTR(".matrix"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodeMatrixPropertyWithCoder_forKey_(a1, v36, (uint64_t)v8, v35);
  *(_OWORD *)v11->_anon_40 = v37;
  *(_OWORD *)&v11->_anon_40[16] = v38;
  *(_OWORD *)&v11->_anon_40[32] = v39;
  *(_OWORD *)&v11->_anon_40[48] = v40;

  objc_msgSend_stringByAppendingString_(v9, v41, (uint64_t)CFSTR(".buffer"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeBufferWithCoder_forKey_(v10, v43, (uint64_t)v8, v42);
  v44 = objc_claimAutoreleasedReturnValue();
  buffer = v11->_buffer;
  v11->_buffer = (MDLBufferView *)v44;

  objc_msgSend_stringByAppendingString_(v9, v46, (uint64_t)CFSTR(".stride"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_stride = objc_msgSend_decodeIntegerForKey_(v8, v48, (uint64_t)v47);

  v11->_semantic = objc_msgSend_decodeIntegerForKey_(v8, v49, (uint64_t)CFSTR(".semantic"));
  return v11;
}

- (void)setMatrix4x4:(matrix_float4x4)matrix4x4
{
  *(simd_float4 *)&self[1].super.isa = matrix4x4.columns[0];
  *(simd_float4 *)&self[1]._name = matrix4x4.columns[1];
  *(simd_float4 *)&self[1]._textureSampler = matrix4x4.columns[2];
  *(simd_float4 *)self[1]._float = matrix4x4.columns[3];
}

- (BOOL)isDefaultValue
{
  return self->_isDefaultValue;
}

- (void)setIsDefaultValue:(BOOL)a3
{
  self->_isDefaultValue = a3;
}

@end

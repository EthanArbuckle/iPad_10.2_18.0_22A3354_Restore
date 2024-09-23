@implementation SCNMTLShadable

- (void)setResource:(id)a3 ofType:(unint64_t)a4 atIndices:(id)a5
{
  char var0;
  uint64_t v8;
  int var1;
  id v10;
  id *v11;
  id v12;
  id *v13;
  id v14;
  id *v15;
  id v16;
  id *v17;
  id v18;
  id *v19;
  id v20;
  id *v21;
  NSObject *v22;

  var0 = a5.var0;
  v8 = *(_QWORD *)&a5.var0 >> 8;
  var1 = a5.var1;
  if (a4 == 3)
  {
    if (a5.var0 != 255)
    {
      v14 = a3;
      v15 = (id *)(&self->super.isa + var0);

      v15[125] = a3;
    }
    if (var1 != 255)
    {
      v16 = a3;
      v17 = (id *)(&self->super.isa + (char)v8);

      v17[141] = a3;
    }
  }
  else if (a4 == 2)
  {
    if (a5.var0 != 255)
    {
      v18 = a3;
      v19 = (id *)(&self->super.isa + var0);

      v19[63] = a3;
    }
    if (var1 != 255)
    {
      v20 = a3;
      v21 = (id *)(&self->super.isa + (char)v8);

      v21[94] = a3;
    }
  }
  else if (a4)
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SCNMTLShadable setResource:ofType:atIndices:].cold.1();
  }
  else
  {
    if (a5.var0 != 255)
    {
      v10 = a3;
      v11 = (id *)(&self->super.isa + var0);

      v11[1] = a3;
    }
    if (var1 != 255)
    {
      v12 = a3;
      v13 = (id *)(&self->super.isa + (char)v8);

      v13[32] = a3;
    }
  }
}

- (void)setMaterialModificationCount:(int64_t)a3
{
  self->materialModificationCount = a3;
}

- (void)setGeometryModificationCount:(int64_t)a3
{
  self->geometryModificationCount = a3;
}

- (id)bufferAtIndices:(id)a3
{
  NSObject *v3;

  if (a3.var0 != -1)
    return self->_vertexBuffers[a3.var0];
  if ((~*(_WORD *)&a3 & 0xFF00) != 0)
    return self->_fragmentBuffers[a3.var1];
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNMTLShadable bufferAtIndices:].cold.1();
  return 0;
}

- (void)dealloc
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  objc_super v6;

  for (i = 0; i != 31; ++i)
  {

  }
  for (j = 0; j != 31; ++j)
  {

  }
  for (k = 0; k != 16; ++k)
  {

  }
  v6.receiver = self;
  v6.super_class = (Class)SCNMTLShadable;
  -[SCNMTLShadable dealloc](&v6, sel_dealloc);
}

- (id)textureAtIndices:(id)a3
{
  NSObject *v3;

  if (a3.var0 != -1)
    return self->_vertexTextures[a3.var0];
  if ((~*(_WORD *)&a3 & 0xFF00) != 0)
    return self->_fragmentTextures[a3.var1];
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNMTLShadable bufferAtIndices:].cold.1();
  return 0;
}

- (id)samplerAtIndices:(id)a3
{
  NSObject *v3;

  if (a3.var0 != -1)
    return self->_vertexSamplers[a3.var0];
  if ((~*(_WORD *)&a3 & 0xFF00) != 0)
    return self->_fragmentSamplers[a3.var1];
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNMTLShadable bufferAtIndices:].cold.1();
  return 0;
}

- (int64_t)materialModificationCount
{
  return self->materialModificationCount;
}

- (int64_t)geometryModificationCount
{
  return self->geometryModificationCount;
}

- (void)setResource:ofType:atIndices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Invalid resource type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)bufferAtIndices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Not indices are bound!?!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

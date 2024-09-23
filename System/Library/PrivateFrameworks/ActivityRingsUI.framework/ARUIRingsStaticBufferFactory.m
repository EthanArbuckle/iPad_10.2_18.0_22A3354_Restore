@implementation ARUIRingsStaticBufferFactory

+ (id)ringIndexBufferWithDevice:(id)a3
{
  void *v3;
  id v4;
  ARUIRingsGeometry *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)__ringIndexBuffer;
  if (!__ringIndexBuffer)
  {
    v4 = a3;
    v5 = objc_alloc_init(ARUIRingsGeometry);
    -[ARUIRingsGeometry setCircleSegments:](v5, "setCircleSegments:", 30);
    v6 = 2 * -[ARUIRingsGeometry indexCount](v5, "indexCount");
    v7 = -[ARUIRingsGeometry connectedIndiciesGeometry](v5, "connectedIndiciesGeometry");
    v8 = objc_msgSend(v4, "newBufferWithBytes:length:options:", v7, v6, 0);

    v9 = (void *)__ringIndexBuffer;
    __ringIndexBuffer = v8;

    objc_msgSend((id)__ringIndexBuffer, "setLabel:", CFSTR("Indicies"));
    free(v7);

    v3 = (void *)__ringIndexBuffer;
  }
  return v3;
}

+ (id)ringVertexPositionsBufferWithDevice:(id)a3
{
  void *v3;
  id v4;
  ARUIRingsGeometry *v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v3 = (void *)__ringVertexPositionsBuffer;
  if (!__ringVertexPositionsBuffer)
  {
    v4 = a3;
    v5 = objc_alloc_init(ARUIRingsGeometry);
    -[ARUIRingsGeometry setCircleSegments:](v5, "setCircleSegments:", 30);
    v6 = 32 * -[ARUIRingsGeometry vertexCount](v5, "vertexCount");
    v7 = malloc_type_malloc(v6, 0x64A3D2AuLL);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__ARUIRingsStaticBufferFactory_ringVertexPositionsBufferWithDevice___block_invoke;
    v11[3] = &__block_descriptor_40_e23_v32__0I8I12f16f20f24f28l;
    v11[4] = v7;
    -[ARUIRingsGeometry enumerateVertexGeometryWithBlock:](v5, "enumerateVertexGeometryWithBlock:", v11);
    v8 = objc_msgSend(v4, "newBufferWithBytes:length:options:", v7, v6, 0);

    v9 = (void *)__ringVertexPositionsBuffer;
    __ringVertexPositionsBuffer = v8;

    objc_msgSend((id)__ringVertexPositionsBuffer, "setLabel:", CFSTR("Verticies"));
    free(v7);

    v3 = (void *)__ringVertexPositionsBuffer;
  }
  return v3;
}

float __68__ARUIRingsStaticBufferFactory_ringVertexPositionsBufferWithDevice___block_invoke(uint64_t a1, double a2, float a3, __n128 a4, float a5, uint64_t a6, unsigned int a7)
{
  __n128 *v7;
  float result;
  __n128 *v9;

  v7 = (__n128 *)(*(_QWORD *)(a1 + 32) + 32 * a7);
  a4.n128_f32[1] = a5;
  a4.n128_u32[2] = 0;
  result = 1.0;
  a4.n128_u32[3] = 1.0;
  *v7 = a4;
  v7[1].n128_f32[0] = a3;
  v7[1].n128_u32[1] = 0;
  v9 = (__n128 *)(*(_QWORD *)(a1 + 32) + 32 * (a7 + 1));
  *v9 = a4;
  v9[1].n128_f32[0] = a3;
  v9[1].n128_u32[1] = 1;
  return result;
}

+ (unint64_t)circleSegments
{
  return 30;
}

+ (void)clearCaches
{
  void *v2;
  void *v3;

  v2 = (void *)__ringVertexPositionsBuffer;
  if (__ringVertexPositionsBuffer)
  {
    __ringVertexPositionsBuffer = 0;

  }
  v3 = (void *)__ringIndexBuffer;
  if (__ringIndexBuffer)
  {
    __ringIndexBuffer = 0;

  }
}

@end

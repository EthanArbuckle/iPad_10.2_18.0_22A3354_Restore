@implementation ARUISpritesStaticBufferFactory

+ (id)spritePositionsBufferWithDevice:(id)a3
{
  void *v3;
  id v4;
  _QWORD *v5;
  uint64_t v11;
  void *v12;

  v3 = (void *)__spriteVertexBuffer;
  if (!__spriteVertexBuffer)
  {
    v4 = a3;
    v5 = malloc_type_malloc(0x80uLL, 0x10000406D1CE384uLL);
    *(_OWORD *)v5 = xmmword_212E0AB40;
    v5[2] = 0x3F80000000000000;
    *((_OWORD *)v5 + 2) = xmmword_212E0AB50;
    __asm { FMOV            V0.2S, #1.0 }
    v5[6] = _D0;
    *((_OWORD *)v5 + 4) = xmmword_212E0AB60;
    v5[10] = 0;
    *((_OWORD *)v5 + 6) = xmmword_212E0AB70;
    v5[14] = 1065353216;
    v11 = objc_msgSend(v4, "newBufferWithBytes:length:options:", v5, 128, 0);

    v12 = (void *)__spriteVertexBuffer;
    __spriteVertexBuffer = v11;

    objc_msgSend((id)__spriteVertexBuffer, "setLabel:", CFSTR("Sprite verticies"));
    free(v5);
    v3 = (void *)__spriteVertexBuffer;
  }
  return v3;
}

+ (id)spriteIndexBufferWithDevice:(id)a3
{
  void *v3;
  id v4;
  _DWORD *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)__spriteIndexBuffer;
  if (!__spriteIndexBuffer)
  {
    v4 = a3;
    v5 = malloc_type_malloc(0xCuLL, 0x1000040BDFB0063uLL);
    *(_QWORD *)v5 = 0x1000200010000;
    v5[2] = 196610;
    v6 = objc_msgSend(v4, "newBufferWithBytes:length:options:", v5, 12, 0);

    v7 = (void *)__spriteIndexBuffer;
    __spriteIndexBuffer = v6;

    objc_msgSend((id)__spriteIndexBuffer, "setLabel:", CFSTR("Sprite indicies"));
    free(v5);
    v3 = (void *)__spriteIndexBuffer;
  }
  return v3;
}

+ (void)clearCaches
{
  void *v2;
  void *v3;

  v2 = (void *)__spriteVertexBuffer;
  if (__spriteVertexBuffer)
  {
    __spriteVertexBuffer = 0;

  }
  v3 = (void *)__spriteIndexBuffer;
  if (__spriteIndexBuffer)
  {
    __spriteIndexBuffer = 0;

  }
}

@end

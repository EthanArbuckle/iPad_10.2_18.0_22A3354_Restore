@implementation C3DRendererContextResetVolatileObjects

unint64_t __C3DRendererContextResetVolatileObjects_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  GLuint BufferID;
  unint64_t v7;

  result = *(_QWORD *)a3;
  if (*(_QWORD *)a3
    && (!*(_QWORD *)(a3 + 24)
     || (BufferID = C3DBufferObjectGetBufferID(result),
         glBindBuffer(*(_DWORD *)(a1 + 40), BufferID),
         (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 1976))(*(unsigned int *)(a1 + 40)),
         (result = *(_QWORD *)a3) != 0))
    && (v7 = *(_QWORD *)(a3 + 8), result = C3DBufferObjectGetSize(result), v7 < result))
  {
    ++*(_DWORD *)(a3 + 16);
  }
  else
  {
    *(_DWORD *)(a3 + 16) = 0;
  }
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  return result;
}

@end

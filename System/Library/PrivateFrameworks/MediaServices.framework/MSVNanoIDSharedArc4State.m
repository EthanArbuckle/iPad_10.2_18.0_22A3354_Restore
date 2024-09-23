@implementation MSVNanoIDSharedArc4State

void ___MSVNanoIDSharedArc4State_block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  _BYTE bytes[16];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
  _MSVNanoIDSharedArc4State__state = (uint64_t)v0;
  if (v0)
  {
    v1 = v0;
    *v0 = 0;
    v2 = malloc_type_malloc(0x100uLL, 0xE14FBD05uLL);
    v3 = 0;
    v1[1] = v2;
    do
    {
      *(_BYTE *)(v1[1] + v3) = v3;
      ++v3;
    }
    while (v3 != 256);
  }
  if (SecRandomCopyBytes(0, 0x10uLL, bytes))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "struct MSVArc4State *_MSVNanoIDSharedArc4State(void)_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("MSVNanoID.m"), 43, CFSTR("Unable to obtain system random bytes."));

  }
  v4 = 0;
  v5 = 0;
  v6 = _MSVNanoIDSharedArc4State__state;
  v7 = *(_QWORD *)(_MSVNanoIDSharedArc4State__state + 8);
  do
  {
    v8 = *(unsigned __int8 *)(v7 + v4);
    v5 += v8 + bytes[v4 & 0xF];
    *(_BYTE *)(v7 + v4) = *(_BYTE *)(v7 + v5);
    *(_BYTE *)(v7 + v5) = v8;
    ++v4;
  }
  while (v4 != 255);
  v9 = *(_QWORD *)(v6 + 8);
  v10 = 768;
  LODWORD(v12) = *(_DWORD *)v6;
  v11 = *(_DWORD *)(v6 + 4);
  do
  {
    v12 = (v12 + 1);
    v13 = *(_BYTE *)(v9 + v12);
    LOBYTE(v11) = v13 + v11;
    *(_BYTE *)(v9 + v12) = *(_BYTE *)(v9 + v11);
    *(_BYTE *)(v9 + v11) = v13;
    --v10;
  }
  while (v10);
  *(_DWORD *)v6 = v12;
  *(_DWORD *)(v6 + 4) = v11;
}

@end

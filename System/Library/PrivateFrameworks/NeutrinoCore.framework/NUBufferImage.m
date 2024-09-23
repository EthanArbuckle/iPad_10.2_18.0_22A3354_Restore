@implementation NUBufferImage

uint64_t __53___NUBufferImage_copyBufferStorage_fromRect_toPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  return +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v2, v3, v4, a2, v7);
}

uint64_t __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v10 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke_2;
  v14[3] = &unk_1E5063908;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  v17 = a6;
  v11 = v10;
  v12 = objc_msgSend(a5, "writeBufferInRegion:block:", a3, v14);

  return v12;
}

void __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NUMutableBufferTileAdapter *v4;
  void *v5;
  void *v6;
  NUMutableBufferTileAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v3 = a2;
  v4 = [NUMutableBufferTileAdapter alloc];
  v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v14, 0, sizeof(v14));
    goto LABEL_5;
  }
  objc_msgSend(v5, "frameRect");
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v13, 0, sizeof(v13));
    goto LABEL_6;
  }
  objc_msgSend(v6, "contentRect");
LABEL_6:
  v7 = -[NUMutableBufferTileAdapter initWithFrameRect:contentRect:buffer:](v4, "initWithFrameRect:contentRect:buffer:", v14, v13, v3);
  (*(void (**)(_QWORD, NUMutableBufferTileAdapter *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);

}

uint64_t __45___NUBufferImage_readBufferRegion_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v10 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45___NUBufferImage_readBufferRegion_withBlock___block_invoke_2;
  v14[3] = &unk_1E50638B8;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  v17 = a6;
  v11 = v10;
  v12 = objc_msgSend(a5, "readBufferInRegion:block:", a3, v14);

  return v12;
}

void __45___NUBufferImage_readBufferRegion_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NUBufferTileAdapter *v4;
  void *v5;
  void *v6;
  NUBufferTileAdapter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v3 = a2;
  v4 = [NUBufferTileAdapter alloc];
  v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v14, 0, sizeof(v14));
    goto LABEL_5;
  }
  objc_msgSend(v5, "frameRect");
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v13, 0, sizeof(v13));
    goto LABEL_6;
  }
  objc_msgSend(v6, "contentRect");
LABEL_6:
  v7 = -[NUBufferTileAdapter initWithFrameRect:contentRect:buffer:](v4, "initWithFrameRect:contentRect:buffer:", v14, v13, v3);
  (*(void (**)(_QWORD, NUBufferTileAdapter *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);

}

@end

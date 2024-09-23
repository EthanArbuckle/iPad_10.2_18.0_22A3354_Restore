@implementation MTLToolsTextureLayout

- (unint64_t)size
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
}

- (unint64_t)alignment
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "alignment");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A copyGranularity](result, "copyGranularity");
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- ($71D83D51AB0F57F7CF166351F850C832)watermark
{
  uint64_t v2;
  unint64_t v3;
  $71D83D51AB0F57F7CF166351F850C832 result;

  v2 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "watermark");
  result.var0[1] = v3;
  result.var0[0] = v2;
  return result;
}

- (void)initializeTextureMemory:(void *)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "initializeTextureMemory:", a3);
}

- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10
{
  id v16;
  __int128 v17;
  _OWORD v18[3];

  v16 = -[MTLToolsObject baseObject](self, "baseObject");
  v17 = *(_OWORD *)&a10->var0.var2;
  v18[0] = *(_OWORD *)&a10->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a10->var1.var1;
  objc_msgSend(v16, "copyFromLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:toTextureMemory:textureSlice:textureLevel:textureRegion:", a3, a4, a5, a6, a7, a8, a9, v18);
}

- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10
{
  id v16;
  __int128 v17;
  _OWORD v18[3];

  v16 = -[MTLToolsObject baseObject](self, "baseObject");
  v17 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v16, "copyFromTextureMemory:textureSlice:textureLevel:textureRegion:toLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:", a3, a4, a5, v18, a7, a8, a9, a10);
}

- (void)finalizeTextureMemory:(void *)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "finalizeTextureMemory:", a3);
}

@end

@implementation PKMetalLiveStrokePaintRenderCache

- (_QWORD)initWithRenderZoomFactor:(void *)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)PKMetalLiveStrokePaintRenderCache;
  v3 = objc_msgSendSuper2(&v9, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[1];
    v3[1] = v4;

    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *((_OWORD *)v3 + 2) = xmmword_1BE4FB810;
    *((_OWORD *)v3 + 3) = v6;
    *((_OWORD *)v3 + 4) = v7;
    v3[3] = a2;
  }
  return v3;
}

- (void)addBuffer:(uint64_t)a1
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 8), "addObject:", v3);
    v3 = v5;
    if (v5)
      v4 = 40 * v5[6];
    else
      v4 = 0;
    *(_QWORD *)(a1 + 16) += v4;
  }

}

- (unint64_t)cacheCost
{
  return self->_totalCost;
}

- (BOOL)needsCompute
{
  return 1;
}

- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  return self->_renderZoomFactor == a4;
}

- (BOOL)lockPurgeableResourcesAddToSet:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffers, 0);
}

@end

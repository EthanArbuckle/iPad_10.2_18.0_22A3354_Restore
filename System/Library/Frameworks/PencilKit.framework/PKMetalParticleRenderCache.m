@implementation PKMetalParticleRenderCache

- (id)initWithDevice:(void *)a3 ink:(void *)a4 renderZoomFactor:
{
  id v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v7 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PKMetalParticleRenderCache;
    a1 = (id *)objc_msgSendSuper2(&v11, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = a1[1];
      a1[1] = (id)v8;

      objc_storeStrong(a1 + 5, a3);
      a1[4] = a4;
    }
  }

  return a1;
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
      v4 = 32 * v5[7];
    else
      v4 = 0;
    *(_QWORD *)(a1 + 24) += v4;
  }

}

- (void)addSecondaryBuffer:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v8 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
      v3 = v8;
    }
    objc_msgSend(v4, "addObject:", v3);
    v3 = v8;
    if (v8)
      v7 = 32 * v8[7];
    else
      v7 = 0;
    *(_QWORD *)(a1 + 24) += v7;
  }

}

- (id)secondaryBuffers
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
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
  id v6;
  PKInk *ink;
  PKInk *v8;
  uint64_t v9;
  PKInk *v10;
  PKInk *v11;
  uint64_t v12;
  PKInk *v13;
  id v14;
  double Alpha;
  id v16;
  BOOL v17;

  v6 = a3;
  if (self)
    ink = self->_ink;
  else
    ink = 0;
  v8 = ink;
  v9 = -[PKInk version](v8, "version");
  if (v9 == objc_msgSend(v6, "version"))
  {
    if (self)
      v10 = self->_ink;
    else
      v10 = 0;
    v11 = v10;
    v12 = -[PKInk requiredContentVersion](v11, "requiredContentVersion");
    if (v12 == objc_msgSend(v6, "requiredContentVersion"))
    {
      if (self)
        v13 = self->_ink;
      else
        v13 = 0;
      -[PKInk color](v13, "color");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v14, "CGColor"));
      objc_msgSend(v6, "color");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = vabdd_f64(Alpha, CGColorGetAlpha((CGColorRef)objc_msgSend(v16, "CGColor"))) < 0.00999999978
         && self->_renderZoomFactor == a4;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)lockPurgeableResourcesAddToSet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_buffers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v5);
      if ((-[PKMetalParticleRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8), v4) & 1) == 0)break;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_secondaryBuffers;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (!v9)
    {
      v12 = 1;
      goto LABEL_19;
    }
    v10 = *(_QWORD *)v15;
LABEL_11:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v5);
      if ((-[PKMetalParticleRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v4) & 1) == 0)break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        v12 = 1;
        if (v9)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_secondaryBuffers, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
}

@end

@implementation PKMetalStrokeRenderCache

- (PKMetalStrokeRenderCache)initWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v7;
  PKMetalStrokeRenderCache *v8;
  uint64_t v9;
  NSMutableArray *buffers;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKMetalStrokeRenderCache;
  v8 = -[PKMetalStrokeRenderCache init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    buffers = v8->_buffers;
    v8->_buffers = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_ink, a3);
    v8->_renderZoomFactor = a4;
  }

  return v8;
}

- (void)addBuffer:(id)a3
{
  uint64_t v4;
  _QWORD *v5;

  v5 = a3;
  -[NSMutableArray addObject:](self->_buffers, "addObject:");
  if (v5)
    v4 = v5[4] * v5[3];
  else
    v4 = 0;
  self->_totalCost += v4;

}

- (void)addSecondaryBuffer:(id)a3
{
  _QWORD *v4;
  NSMutableArray *secondaryBuffers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  secondaryBuffers = self->_secondaryBuffers;
  v9 = v4;
  if (!secondaryBuffers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_secondaryBuffers;
    self->_secondaryBuffers = v6;

    secondaryBuffers = self->_secondaryBuffers;
    v4 = v9;
  }
  -[NSMutableArray addObject:](secondaryBuffers, "addObject:", v4);
  if (v9)
    v8 = v9[4] * v9[3];
  else
    v8 = 0;
  self->_totalCost += v8;

}

- (NSArray)buffers
{
  return (NSArray *)self->_buffers;
}

- (NSArray)secondaryBuffers
{
  return (NSArray *)self->_secondaryBuffers;
}

- (unint64_t)cacheCost
{
  return self->_totalCost;
}

- (BOOL)needsCompute
{
  return 0;
}

- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  double Alpha;
  id v14;
  BOOL v15;

  v6 = a3;
  -[PKMetalStrokeRenderCache ink](self, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  if (v8 == objc_msgSend(v6, "version"))
  {
    -[PKMetalStrokeRenderCache ink](self, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "requiredContentVersion");
    if (v10 == objc_msgSend(v6, "requiredContentVersion"))
    {
      -[PKMetalStrokeRenderCache ink](self, "ink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "color");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v12, "CGColor"));
      objc_msgSend(v6, "color");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = vabdd_f64(Alpha, CGColorGetAlpha((CGColorRef)objc_msgSend(v14, "CGColor"))) < 0.00999999978
         && self->_renderZoomFactor == a4;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
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
      if ((-[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8), v4) & 1) == 0)break;
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
      if ((-[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v4) & 1) == 0)break;
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

- (PKInk)ink
{
  return self->_ink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_secondaryBuffers, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
}

@end

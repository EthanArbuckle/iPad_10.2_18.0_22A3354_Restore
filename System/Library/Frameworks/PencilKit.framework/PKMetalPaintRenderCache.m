@implementation PKMetalPaintRenderCache

- (_QWORD)initWithPurgeableBuffers:(uint64_t)a3 renderZoomFactor:
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)PKMetalPaintRenderCache;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

    *((_BYTE *)v5 + 32) = a2;
    v5[3] = a3;
  }
  return v5;
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
      v4 = 24 * v5[6];
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
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_purgeableBuffers)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_buffers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v10 = v4;
          v11 = v10;
          if (!v9)
            goto LABEL_20;
          v12 = objc_msgSend(v10, "count", (_QWORD)v19);
          objc_msgSend(v11, "addObject:", *(_QWORD *)(v9 + 16));
          if (objc_msgSend(v11, "count") != v12 && (objc_msgSend(*(id *)(v9 + 16), "lock") & 1) == 0)
            goto LABEL_20;
          v13 = *(void **)(v9 + 8);
          if (v13 != *(void **)(v9 + 16))
          {
            v14 = objc_msgSend(v11, "count");
            objc_msgSend(v11, "addObject:", *(_QWORD *)(v9 + 8));
            v15 = objc_msgSend(v11, "count");
            v13 = *(void **)(v9 + 8);
            if (v15 != v14)
            {
              if (!objc_msgSend(v13, "lock"))
                goto LABEL_20;
              v13 = *(void **)(v9 + 8);
            }
          }
          if ((objc_msgSend(v13, "isPurged") & 1) != 0)
          {
LABEL_20:

LABEL_21:
            v17 = 0;
            goto LABEL_23;
          }
          v16 = objc_msgSend(*(id *)(v9 + 16), "isPurged");

          if ((v16 & 1) != 0)
            goto LABEL_21;
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v17 = 1;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v17 = 1;
    }
LABEL_23:

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffers, 0);
}

@end

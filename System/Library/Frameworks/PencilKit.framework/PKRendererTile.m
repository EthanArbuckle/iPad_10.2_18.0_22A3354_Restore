@implementation PKRendererTile

- (id)initWithLevel:(__int128 *)a3 offset:(char)a4 drawingTransform:(double)a5 contentsScale:(double)a6 sixChannelMode:(double)a7
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _OWORD v39[3];

  if (!a1)
    return 0;
  v38.receiver = a1;
  v38.super_class = (Class)PKRendererTile;
  v13 = objc_msgSendSuper2(&v38, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v13 + 15);
    *((_QWORD *)v13 + 15) = v15;

    *((double *)v13 + 21) = a5;
    *((double *)v13 + 22) = a6;
    v17 = (void *)*((_QWORD *)v13 + 17);
    v18 = MEMORY[0x1E0C9AA60];
    *((_QWORD *)v13 + 16) = a2;
    *((_QWORD *)v13 + 17) = v18;

    *((_BYTE *)v13 + 82) = a4;
    v19 = *a3;
    v20 = a3[2];
    *((_OWORD *)v13 + 3) = a3[1];
    *((_OWORD *)v13 + 4) = v20;
    *((_OWORD *)v13 + 2) = v19;
    *((double *)v13 + 19) = a7;
    atomic_store(*(unint64_t *)&a7, (unint64_t *)v13 + 1);
    objc_msgSend(*((id *)v13 + 11), "setContentsScale:", a7);
    objc_msgSend(*((id *)v13 + 12), "setContentsScale:", a7);
    v35 = *a3;
    v36 = a3[1];
    v37 = a3[2];
    v21 = +[PKRendererTile layerFrameForLevel:offset:](*((double *)v13 + 21), *((double *)v13 + 22), (uint64_t)PKRendererTile, *((_QWORD *)v13 + 16));
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v39[0] = v35;
    v39[1] = v36;
    v39[2] = v37;
    +[PKRendererTile drawingFrameForLayerFrame:drawingTransform:contentScale:](v21, v22, v24, v26, *((double *)v13 + 19), (uint64_t)PKRendererTile, v39);
    *((_QWORD *)v13 + 23) = v28;
    *((_QWORD *)v13 + 24) = v29;
    *((_QWORD *)v13 + 25) = v30;
    *((_QWORD *)v13 + 26) = v31;
    v32 = fabs(v21);
    if (v32 != INFINITY)
    {
      v32 = fabs(v23);
      if (v32 != INFINITY)
      {
        v32 = fabs(v25);
        if (v32 != INFINITY)
        {
          v32 = fabs(v27);
          if (v32 != INFINITY)
          {
            *((double *)v13 + 27) = v21;
            *((double *)v13 + 28) = v23;
            *((double *)v13 + 29) = v25;
            *((double *)v13 + 30) = v27;
            -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v13);
            objc_msgSend(*((id *)v13 + 11), "setFrame:", v21, v23, v25, v27);
            objc_msgSend(*((id *)v13 + 12), "setFrame:", v21, v23, v25, v27);
          }
        }
      }
    }
    *((_QWORD *)v13 + 20) = 0;
    LODWORD(v32) = 0;
    objc_msgSend(*((id *)v13 + 11), "setOpacity:", v32, v35, v36, v37);
    LODWORD(v33) = 0;
    objc_msgSend(*((id *)v13 + 12), "setOpacity:", v33);
    -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v13);
  }
  return v14;
}

- (void)updateLastUsedTimestamp
{
  unint64_t v2;
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    atomic_store(v2, (unint64_t *)(a1 + 24));

  }
}

- (void)dealloc
{
  CALayer *v3;
  CALayer *v4;
  CALayer *v5;
  CALayer *v6;
  void (**v7)(_QWORD);
  void *v8;
  objc_super v9;
  _QWORD aBlock[4];
  CALayer *v11;
  CALayer *v12;

  v3 = self->_tileLayer;
  v4 = self->_tileMultiplyLayer;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __25__PKRendererTile_dealloc__block_invoke;
  aBlock[3] = &unk_1E7777440;
  v5 = v3;
  v11 = v5;
  v6 = v4;
  v12 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    v7[2](v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  if (self->_framebufferIsLocked)
    -[PKMetalFramebuffer decrementNonPurgeableCount](self->_framebuffer);
  if (self->_multiplyFramebufferIsLocked)
    -[PKMetalFramebuffer decrementNonPurgeableCount](self->_multiplyFramebuffer);
  +[PKRendererTileController sharedController]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRendererTileController didTeardownTile:]((uint64_t)v8, (uint64_t)self);

  v9.receiver = self;
  v9.super_class = (Class)PKRendererTile;
  -[PKRendererTile dealloc](&v9, sel_dealloc);
}

void __25__PKRendererTile_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "superlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Removed tileLayer from superlayer", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
  }
  objc_msgSend(*(id *)(a1 + 40), "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Removed tileMultiplyLayer from superlayer", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperlayer");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKRendererTile *v4;
  int64_t level;
  double x;
  double y;
  __int128 v8;
  double *v9;
  double *v10;
  double v11;
  double v12;
  double width;
  double height;
  CGPoint origin;
  __int128 v17[3];

  v4 = [PKRendererTile alloc];
  level = self->_level;
  x = self->_offset.x;
  y = self->_offset.y;
  v8 = *(_OWORD *)&self->_drawingTransform.c;
  v17[0] = *(_OWORD *)&self->_drawingTransform.a;
  v17[1] = v8;
  v17[2] = *(_OWORD *)&self->_drawingTransform.tx;
  v9 = (double *)-[PKRendererTile initWithLevel:offset:drawingTransform:contentsScale:sixChannelMode:](v4, level, v17, self->_sixChannelMode, x, y, self->_contentsScale);
  v10 = v9;
  if (v9)
  {
    v11 = self->_frame.origin.x;
    v12 = self->_frame.origin.y;
    width = self->_frame.size.width;
    height = self->_frame.size.height;
    v9[27] = v11;
    v9[28] = v12;
    v9[29] = width;
    v9[30] = height;
    -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v9);
    objc_msgSend(*((id *)v10 + 11), "setFrame:", v11, v12, width, height);
    objc_msgSend(*((id *)v10 + 12), "setFrame:", v11, v12, width, height);
  }
  origin = self->_drawingFrame.origin;
  *(CGSize *)(v10 + 25) = self->_drawingFrame.size;
  *(CGPoint *)(v10 + 23) = origin;
  return v10;
}

- (PKRendererTileProperties)properties
{
  PKRendererTileProperties *v1;
  PKRendererTileProperties *v2;
  CGFloat a;
  double ty;
  double v5;
  __int128 v6;
  _OWORD v8[3];

  if (a1)
  {
    v1 = a1;
    v2 = [PKRendererTileProperties alloc];
    a = v1[1]._drawingTransform.a;
    ty = v1[1]._drawingTransform.ty;
    v5 = *(double *)&v1[2].super.isa;
    v6 = *(_OWORD *)&v1->_drawingTransform.b;
    v8[0] = *(_OWORD *)&v1->_offset.y;
    v8[1] = v6;
    v8[2] = *(_OWORD *)&v1->_drawingTransform.d;
    a1 = -[PKRendererTileProperties initWithLevel:offset:drawingTransform:sixChannelMode:](v2, "initWithLevel:offset:drawingTransform:sixChannelMode:", *(_QWORD *)&a, v8, BYTE2(v1->_drawingTransform.ty), ty, v5);
  }
  return a1;
}

+ (double)layerFrameForLevel:(uint64_t)a3 offset:(uint64_t)a4
{
  CGFloat v7;

  objc_opt_self();
  objc_opt_self();
  v7 = round(exp2((double)a4) * 256.0);
  return DKDRoundedRectForScale(a1 * v7, a2 * v7, v7, v7, 1.0);
}

+ (void)drawingFrameForLayerFrame:(CGFloat)a3 drawingTransform:(CGFloat)a4 contentScale:(double)a5
{
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  objc_opt_self();
  v13 = a7[1];
  *(_OWORD *)&v14.a = *a7;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tx = a7[2];
  CGAffineTransformInvert(&v15, &v14);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  DKDRoundedRectForScale(v17.origin.x, v17.origin.y, v17.size.width, v17.size.height, a5);
}

- (void)updateDisableTransactionActions:(int)a3 reloadContents:
{
  double v6;
  BOOL v7;
  double v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (*(_BYTE *)(a1 + 84))
      v7 = 0;
    else
      v7 = a2 == 0;
    if (!v7)
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 88), "reloadValueForKeyPath:", CFSTR("contents"));
      objc_msgSend(*(id *)(a1 + 96), "reloadValueForKeyPath:", CFSTR("contents"));
    }
    *(_QWORD *)(a1 + 160) = 0x3FF0000000000000;
    LODWORD(v6) = 1.0;
    objc_msgSend(*(id *)(a1 + 88), "setOpacity:", v6);
    LODWORD(v8) = 1.0;
    objc_msgSend(*(id *)(a1 + 96), "setOpacity:", v8);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[PKRendererTile updateLastUsedTimestamp](a1);
  }
}

- (double)tileLayer
{
  double *v1;
  void *v2;
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)*((_QWORD *)a1 + 11);
    if (v2)
    {
LABEL_12:
      a1 = v2;
      return a1;
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v3 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v4 = (void *)*((_QWORD *)v1 + 11);
    *((_QWORD *)v1 + 11) = v3;

    objc_msgSend(*((id *)v1 + 11), "setFrame:", v1[27], v1[28], v1[29], v1[30]);
    objc_msgSend(*((id *)v1 + 11), "setContentsScale:", v1[19]);
    objc_msgSend(*((id *)v1 + 11), "setHidden:", *((unsigned __int8 *)v1 + 84));
    v5 = v1[20];
    *(float *)&v5 = v5;
    objc_msgSend(*((id *)v1 + 11), "setOpacity:", v5);
    objc_msgSend(*((id *)v1 + 11), "setAllowsGroupOpacity:", 0);
    v6 = *((_QWORD *)v1 + 13);
    if (!v6 || !*((_BYTE *)v1 + 80))
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v2 = (void *)*((_QWORD *)v1 + 11);
      goto LABEL_12;
    }
    if (*((_BYTE *)v1 + 82))
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E00]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v1 + 11), "setCompositingFilter:", v7);

      v6 = *((_QWORD *)v1 + 13);
      v8 = (void *)*((_QWORD *)v1 + 11);
      if (!v6)
      {
        v9 = 0;
LABEL_10:
        objc_msgSend(v8, "setContents:", v9);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (void *)*((_QWORD *)v1 + 11);
    }
    v9 = *(_QWORD *)(v6 + 56);
    goto LABEL_10;
  }
  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t level;
  double x;
  double y;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  unint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  level = self->_level;
  x = self->_offset.x;
  y = self->_offset.y;
  NSStringFromCGRect(self->_frame);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_outOfDate)
    v11 = CFSTR(" outOfDate");
  else
    v11 = &stru_1E777DEE8;
  v12 = atomic_load((unint64_t *)&self->_renderCount);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%ld, (%ld, %ld)] frame=%@%@ renderCount:%ld opacity:%d hidden:%d>"), v5, self, level, (uint64_t)x, (uint64_t)y, v9, v11, v12, (int)self->_opacity, self->_hidden);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)tileMultiplyLayer
{
  double *v1;
  void *v2;
  id v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)*((_QWORD *)a1 + 12);
    if (!v2)
    {
      if (*((_BYTE *)a1 + 82))
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        v3 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        v4 = (void *)*((_QWORD *)v1 + 12);
        *((_QWORD *)v1 + 12) = v3;

        objc_msgSend(*((id *)v1 + 12), "setFrame:", v1[27], v1[28], v1[29], v1[30]);
        objc_msgSend(*((id *)v1 + 12), "setContentsScale:", v1[19]);
        objc_msgSend(*((id *)v1 + 12), "setHidden:", *((unsigned __int8 *)v1 + 84));
        v5 = v1[20];
        *(float *)&v5 = v5;
        objc_msgSend(*((id *)v1 + 12), "setOpacity:", v5);
        objc_msgSend(*((id *)v1 + 12), "setAllowsGroupOpacity:", 0);
        if (*((_QWORD *)v1 + 14) && *((_BYTE *)v1 + 81))
        {
          objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E58]);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v1 + 12), "setCompositingFilter:", v6);

          v7 = *((_QWORD *)v1 + 14);
          if (v7)
            v8 = *(_QWORD *)(v7 + 56);
          else
            v8 = 0;
          objc_msgSend(*((id *)v1 + 12), "setContents:", v8);
        }
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        v2 = (void *)*((_QWORD *)v1 + 12);
      }
      else
      {
        v2 = 0;
      }
    }
    a1 = v2;
  }
  return a1;
}

- (uint64_t)_lockAndSetFramebuffer:(uint64_t)a1
{
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  if (a1)
  {
    v5 = *(uint64_t **)(a1 + 104);
    if (v5 == v4)
    {
      v5 = v4;
      if (*(_BYTE *)(a1 + 80))
      {
        a1 = 1;
        goto LABEL_14;
      }
    }
    else if (*(_BYTE *)(a1 + 80))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](v5);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

      *(_BYTE *)(a1 + 80) = 0;
      v5 = *(uint64_t **)(a1 + 104);
    }
    *(_QWORD *)(a1 + 104) = 0;

    if (-[PKMetalFramebuffer incrementNonPurgeableCount](v4))
    {
      objc_storeStrong((id *)(a1 + 104), a2);
      *(_BYTE *)(a1 + 80) = 1;
      if (v4)
        v7 = v4[7];
      else
        v7 = 0;
      objc_msgSend(*(id *)(a1 + 88), "setContents:", v7);
      if (*(_BYTE *)(a1 + 82))
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E00]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "setCompositingFilter:", v8);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 88), "setContents:", 0);
      objc_msgSend(*(id *)(a1 + 88), "setCompositingFilter:", 0);
    }
    a1 = *(_BYTE *)(a1 + 80) != 0;
  }
LABEL_14:

  return a1;
}

- (uint64_t)_lockAndSetMultiplyFramebuffer:(uint64_t)a1
{
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  if (a1)
  {
    v5 = *(uint64_t **)(a1 + 112);
    if (v5 == v4)
    {
      v5 = v4;
      if (*(_BYTE *)(a1 + 81))
      {
        a1 = 1;
        goto LABEL_13;
      }
    }
    else if (*(_BYTE *)(a1 + 81))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](v5);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = 0;

      *(_BYTE *)(a1 + 81) = 0;
      v5 = *(uint64_t **)(a1 + 112);
    }
    *(_QWORD *)(a1 + 112) = 0;

    if (-[PKMetalFramebuffer incrementNonPurgeableCount](v4))
    {
      objc_storeStrong((id *)(a1 + 112), a2);
      *(_BYTE *)(a1 + 81) = 1;
      if (v4)
        v7 = v4[7];
      else
        v7 = 0;
      objc_msgSend(*(id *)(a1 + 96), "setContents:", v7);
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E58]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 96), "setCompositingFilter:", v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 96), "setCompositingFilter:", 0);
      objc_msgSend(*(id *)(a1 + 96), "setContents:", 0);
    }
    a1 = *(_BYTE *)(a1 + 81) != 0;
  }
LABEL_13:

  return a1;
}

- (BOOL)lockAndSetFramebufferThreadSafe:(_BOOL8)a1
{
  id v3;
  char v4;
  _QWORD block[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v4 = -[PKRendererTile _lockAndSetFramebuffer:](a1, v3);
      *((_BYTE *)v10 + 24) = v4;
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__PKRendererTile_lockAndSetFramebufferThreadSafe___block_invoke;
      block[3] = &unk_1E777CFF8;
      v8 = &v9;
      block[4] = a1;
      v7 = v3;
      dispatch_sync(MEMORY[0x1E0C80D38], block);

    }
    a1 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

uint64_t __50__PKRendererTile_lockAndSetFramebufferThreadSafe___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[PKRendererTile _lockAndSetFramebuffer:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)lockAndSetMultiplyFramebufferThreadSafe:(_BOOL8)a1
{
  id v3;
  char v4;
  _QWORD block[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v4 = -[PKRendererTile _lockAndSetMultiplyFramebuffer:](a1, v3);
      *((_BYTE *)v10 + 24) = v4;
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__PKRendererTile_lockAndSetMultiplyFramebufferThreadSafe___block_invoke;
      block[3] = &unk_1E777CFF8;
      v8 = &v9;
      block[4] = a1;
      v7 = v3;
      dispatch_sync(MEMORY[0x1E0C80D38], block);

    }
    a1 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

uint64_t __58__PKRendererTile_lockAndSetMultiplyFramebufferThreadSafe___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[PKRendererTile _lockAndSetMultiplyFramebuffer:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (uint64_t)_clearFramebuffers
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 80))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(result + 104));
      *(_BYTE *)(v1 + 80) = 0;
    }
    v2 = *(void **)(v1 + 104);
    *(_QWORD *)(v1 + 104) = 0;

    objc_msgSend(*(id *)(v1 + 88), "setContents:", 0);
    objc_msgSend(*(id *)(v1 + 88), "setCompositingFilter:", 0);
    if (*(_BYTE *)(v1 + 81))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(v1 + 112));
      *(_BYTE *)(v1 + 81) = 0;
    }
    v3 = *(void **)(v1 + 112);
    *(_QWORD *)(v1 + 112) = 0;

    objc_msgSend(*(id *)(v1 + 96), "setContents:", 0);
    return objc_msgSend(*(id *)(v1 + 96), "setCompositingFilter:", 0);
  }
  return result;
}

- (void)clearFramebuffersThreadSafe
{
  _QWORD block[5];

  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PKRendererTile _clearFramebuffers](a1);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PKRendererTile_clearFramebuffersThreadSafe__block_invoke;
      block[3] = &unk_1E7776F38;
      block[4] = a1;
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __45__PKRendererTile_clearFramebuffersThreadSafe__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PKRendererTile _clearFramebuffers](*(_QWORD *)(a1 + 32));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)framebuffer
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 80))
      return *(id *)(a1 + 104);
    a1 = 0;
  }
  return (id)a1;
}

- (id)multiplyFramebuffer
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 81))
      return *(id *)(a1 + 112);
    a1 = 0;
  }
  return (id)a1;
}

- (void)purgeTileLayers
{
  void *v2;
  void *v3;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(a1 + 104));
      *(_BYTE *)(a1 + 80) = 0;
    }
    if (*(_BYTE *)(a1 + 81))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(a1 + 112));
      *(_BYTE *)(a1 + 81) = 0;
    }
    objc_msgSend(*(id *)(a1 + 88), "removeFromSuperlayer");
    objc_msgSend(*(id *)(a1 + 88), "setContents:", 0);
    v2 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    objc_msgSend(*(id *)(a1 + 96), "removeFromSuperlayer");
    objc_msgSend(*(id *)(a1 + 96), "setContents:", 0);
    v3 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

  }
}

- (uint64_t)recreatePurgedTileLayersIfPossible
{
  uint64_t v1;
  _BYTE *v2;
  _BYTE *v3;
  id v4;
  id v5;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 88) && (*(_QWORD *)(result + 96) || !*(_BYTE *)(result + 82)))
      return 1;
    v2 = *(_BYTE **)(result + 104);
    if (v2 && !*(_BYTE *)(v1 + 80) && -[PKMetalFramebuffer incrementNonPurgeableCount](v2))
      *(_BYTE *)(v1 + 80) = 1;
    v3 = *(_BYTE **)(v1 + 112);
    if (v3 && !*(_BYTE *)(v1 + 81) && -[PKMetalFramebuffer incrementNonPurgeableCount](v3))
      *(_BYTE *)(v1 + 81) = 1;
    if (!*(_QWORD *)(v1 + 104) || *(_BYTE *)(v1 + 80))
      v4 = -[PKRendererTile tileLayer]((double *)v1);
    if (*(_BYTE *)(v1 + 82) && (!*(_QWORD *)(v1 + 112) || *(_BYTE *)(v1 + 81)))
      v5 = -[PKRendererTile tileMultiplyLayer]((double *)v1);
    if (*(_QWORD *)(v1 + 88))
    {
      if (*(_QWORD *)(v1 + 96))
        return 1;
      return *(_BYTE *)(v1 + 82) == 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedStrokes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_multiplyFramebuffer, 0);
  objc_storeStrong((id *)&self->_framebuffer, 0);
  objc_storeStrong((id *)&self->_tileMultiplyLayer, 0);
  objc_storeStrong((id *)&self->_tileLayer, 0);
}

@end

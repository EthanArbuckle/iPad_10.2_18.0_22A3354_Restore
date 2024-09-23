@implementation FigCaptionLayer

- (FigCaptionLayer)init
{
  FigCaptionLayer *v3;
  double v4;
  FigCaptionLayerPrivate *priv;
  CGSize v6;
  FigCaptionLayerPrivate *v7;
  FigGeometryDimension *v8;
  FigGeometryDimension v9;
  FigGeometryDimension v10;
  int v11;
  FigCaptionRowLayer *v12;
  uint64_t i;
  FigCaptionBackdropLayer *v14;
  objc_super v16;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v16.receiver = self;
  v16.super_class = (Class)FigCaptionLayer;
  v3 = -[FigBaseCALayer init](&v16, sel_init);
  if (v3)
  {
    if (getDisplayScale_onceToken != -1)
      dispatch_once(&getDisplayScale_onceToken, &__block_literal_global_2);
    v4 = *(double *)&sMaxDisplayScale;
    v3->_priv = objc_alloc_init(FigCaptionLayerPrivate);
    v3->_priv->renderMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (!v3->_priv->renderMutex)
      goto LABEL_16;
    v3->_priv->layoutSublayersMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    if (!v3->_priv->layoutSublayersMutex)
      goto LABEL_16;
    v3->_priv->renderer = (OpaqueFigCFCaptionRenderer *)FigCFCaptionRendererCreate();
    v3->_priv->captionElementLayers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    v3->_priv->options = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_priv->separated = 0;
    v3->_priv->separatedUpdated = 0;
    v3->_priv->enableBackdrop = +[FigCaptionBackdropLayer isSupported](FigCaptionBackdropLayer, "isSupported");
    priv = v3->_priv;
    if (priv->enableBackdrop)
    {
      v3->_priv->captionBackdropLayers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
      priv = v3->_priv;
      if (!priv)
        goto LABEL_16;
    }
    if (!priv->renderer || !priv->captionElementLayers)
      goto LABEL_16;
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    priv->videoRelativeToViewport.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    priv->videoRelativeToViewport.size = v6;
    v7 = v3->_priv;
    v8 = (FigGeometryDimension *)MEMORY[0x1E0CA4AD8];
    v9 = *(FigGeometryDimension *)(MEMORY[0x1E0CA4AD8] + 16);
    v7->captionsAvoidanceMargins.left = (FigGeometryDimension)*MEMORY[0x1E0CA4AD8];
    v7->captionsAvoidanceMargins.right = v9;
    v10 = v8[3];
    v7->captionsAvoidanceMargins.top = v8[2];
    v7->captionsAvoidanceMargins.bottom = v10;
    v3->_priv->enableGMSpew = 1;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v11 = 10;
    do
    {
      v12 = objc_alloc_init(FigCaptionRowLayer);
      -[FigCaptionRowLayer setContentsScale:](v12, "setContentsScale:", v4);
      -[FigCaptionRowLayer setDelegate:](v12, "setDelegate:", v3);
      -[FigCaptionRowLayer setNeedsDisplayOnBoundsChange:](v12, "setNeedsDisplayOnBoundsChange:", 1);
      -[FigCaptionRowLayer setClearsContext:](v12, "setClearsContext:", 1);
      -[FigCaptionRowLayer setContents:](v12, "setContents:", 0);
      -[FigBaseCALayer addSublayer:](v3, "addSublayer:", v12);
      -[NSMutableArray addObject:](v3->_priv->captionElementLayers, "addObject:", v12);
      --v11;
    }
    while (v11);
    if (v3->_priv->enableBackdrop)
    {
      for (i = 0; i != 10; ++i)
      {
        v14 = objc_alloc_init(FigCaptionBackdropLayer);
        -[FigCaptionBackdropLayer setHidden:](v14, "setHidden:", 1);
        -[FigCaptionBackdropLayer insertBackdropAsSublayerToLayer:below:](v14, "insertBackdropAsSublayerToLayer:below:", v3, -[NSMutableArray objectAtIndex:](v3->_priv->captionElementLayers, "objectAtIndex:", i));
        -[NSMutableArray addObject:](v3->_priv->captionBackdropLayers, "addObject:", v14);
      }
    }
    -[FigCaptionLayer setClearsContext:](v3, "setClearsContext:", 1);
    -[FigCaptionLayer setNeedsLayout](v3, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    CMNotificationCenterGetDefaultLocalCenter();
    if (FigNotificationCenterAddWeakListener())
    {
LABEL_16:

      return 0;
    }
  }
  return v3;
}

- (void)setFontName:(const char *)a3
{
  const __CFString *v4;

  v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a3, 4);
  if (v4)
    FigCFCaptionRendererSetFontName((uint64_t)self->_priv->renderer, v4);
}

- (void)setVideoRelativeToViewport:(CGRect)a3
{
  self->_priv->videoRelativeToViewport = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[FigCaptionLayer setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setCaptionsAvoidanceMargins:(FigGeometryMargins *)a3
{
  FigCaptionLayerPrivate *priv;
  FigGeometryDimension bottom;
  FigGeometryDimension right;
  FigGeometryDimension left;

  priv = self->_priv;
  bottom = a3->bottom;
  left = a3->left;
  right = a3->right;
  priv->captionsAvoidanceMargins.top = a3->top;
  priv->captionsAvoidanceMargins.bottom = bottom;
  priv->captionsAvoidanceMargins.left = left;
  priv->captionsAvoidanceMargins.right = right;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[FigCaptionLayer setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setOptions:(id)a3 forKeyPath:(id)a4
{
  id v7;
  NSMutableDictionary *options;
  const __CFDictionary *v9;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("separatedOptions")))
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    options = self->_priv->options;
    if (v7 == a3)
      -[NSMutableDictionary removeObjectForKey:](options, "removeObjectForKey:", a4);
    else
      -[NSMutableDictionary setValue:forKey:](options, "setValue:forKey:", a3, a4);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("styleOptions")))
  {
    if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null") == a3)
      v9 = 0;
    else
      v9 = (const __CFDictionary *)a3;
    FigCFCaptionRendererSetStyleOptions((uint64_t)self->_priv->renderer, v9);
  }
}

- (void)setSeparatedValue:(BOOL)a3
{
  self->_priv->separated = a3;
  self->_priv->separatedUpdated = 1;
}

- (void)dealloc
{
  FigCaptionLayerPrivate *priv;
  OpaqueFigCFCaptionRenderer *renderer;
  FigCaptionLayerPrivate *v5;
  objc_super v6;

  priv = self->_priv;
  if (priv)
  {
    if (priv->renderer)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      priv = self->_priv;
      renderer = priv->renderer;
      if (renderer)
      {
        CFRelease(renderer);
        self->_priv->renderer = 0;
        priv = self->_priv;
      }
    }

    v5 = self->_priv;
    if (v5->renderMutex)
    {
      FigSimpleMutexDestroy();
      v5 = self->_priv;
    }
    if (v5->layoutSublayersMutex)
    {
      FigSimpleMutexDestroy();
      v5 = self->_priv;
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)FigCaptionLayer;
  -[FigCaptionLayer dealloc](&v6, sel_dealloc);
}

- (void)resetCaptions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  FigCaptionLayerPrivate *priv;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  FigCFCaptionRendererResetCaptions();
  v3 = -[NSMutableArray count](self->_priv->captionElementLayers, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_priv->captionElementLayers, "objectAtIndex:", i), "setContents:", 0);
      priv = self->_priv;
      if (priv->enableBackdrop)
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](priv->captionBackdropLayers, "objectAtIndex:", i), "setHidden:", 1);
    }
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)processCaptionCommand:(unsigned int)a3 data:(id)a4
{
  FigCFCaptionRendererProcessCaptionCommandData((uint64_t)self->_priv->renderer, a3, (const __CFDictionary *)a4);
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  int v12;
  int v13;
  FigCaptionLayerPrivate *priv;
  uint64_t renderer;
  double x;
  double y;
  FigGeometryDimension right;
  FigGeometryDimension bottom;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect *v25;
  void *v26;
  void *v27;
  FigCaptionLayerPrivate *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  objc_super v34;
  _OWORD v35[4];
  char v36;
  int v37;
  double v38[10];
  BOOL v39[10];
  CGRect v40[10];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  MEMORY[0x19402EA0C](self->_priv->layoutSublayersMutex, a2);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[FigCaptionLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NSMutableArray count](self->_priv->captionElementLayers, "count");
  v12 = -[FigCaptionLayer contentsAreFlipped](self, "contentsAreFlipped");
  v37 = 0;
  v36 = 0;
  if (v8 != 0.0 && v10 != 0.0)
  {
    v13 = v12;
    priv = self->_priv;
    renderer = (uint64_t)priv->renderer;
    x = priv->videoRelativeToViewport.origin.x;
    y = priv->videoRelativeToViewport.origin.y;
    right = priv->captionsAvoidanceMargins.right;
    v35[0] = priv->captionsAvoidanceMargins.left;
    v35[1] = right;
    bottom = priv->captionsAvoidanceMargins.bottom;
    v35[2] = priv->captionsAvoidanceMargins.top;
    v35[3] = bottom;
    FigCFCaptionRendererGetCaptionElementWindowProperties(v4, v6, v8, v10, x, y, renderer, (double *)v35, v13, 10, &v37, v40, v39, v38, &v36);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  if (v11)
  {
    v20 = 0;
    v21 = *MEMORY[0x1E0C9D648];
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v25 = v40;
    do
    {
      v26 = (void *)-[NSMutableArray objectAtIndex:](self->_priv->captionElementLayers, "objectAtIndex:", v20);
      v27 = v26;
      if (v20 > 9 || v20 >= v37)
      {
        objc_msgSend(v26, "setBounds:", v21, v22, v23, v24);
        objc_msgSend(v27, "setContents:", 0);
      }
      else
      {
        objc_msgSend(v26, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v27, "setPosition:", v25->origin.x, v25->origin.y);
        objc_msgSend(v27, "setBounds:", v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
      }
      v28 = self->_priv;
      if (v28->enableBackdrop)
        v29 = v36 == 0;
      else
        v29 = 1;
      if (!v29)
      {
        v30 = (void *)-[NSMutableArray objectAtIndex:](v28->captionBackdropLayers, "objectAtIndex:", v20);
        if (v30)
        {
          v31 = v30;
          if (v20 > 9 || v20 >= v37)
          {
            objc_msgSend(v30, "setHidden:", 1);
          }
          else
          {
            objc_msgSend(v30, "setAnchorPoint:", 0.0, 0.0);
            objc_msgSend(v31, "setPosition:", v25->origin.x, v25->origin.y);
            objc_msgSend(v31, "setBounds:", v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
            objc_msgSend(v31, "setHidden:", !v39[v20]);
            if (v39[v20])
            {
              if (v38[v20] == 0.0)
              {
                objc_msgSend(v31, "setCornerRadius:", 0.0);
                v32 = v31;
                v33 = 0;
              }
              else
              {
                objc_msgSend(v31, "setCornerRadius:");
                v32 = v31;
                v33 = 1;
              }
              objc_msgSend(v32, "setMasksToBounds:", v33);
            }
          }
        }
      }
      ++v20;
      ++v25;
    }
    while (v11 != v20);
  }
  v34.receiver = self;
  v34.super_class = (Class)FigCaptionLayer;
  -[FigCaptionLayer layoutSublayers](&v34, sel_layoutSublayers);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  MEMORY[0x19402EA24](self->_priv->layoutSublayersMutex);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  unsigned int v7;
  FigCaptionLayerPrivate *priv;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  OpaqueFigCFCaptionRenderer *renderer;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  MEMORY[0x19402EEEC](self->_priv->renderMutex, a2);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  v7 = -[NSMutableArray indexOfObject:](self->_priv->captionElementLayers, "indexOfObject:", a3);
  priv = self->_priv;
  if (priv->enableGMSpew)
  {
    priv->enableGMSpew = 0;
    if (dword_1EE2A2948)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EE2A2948)
      {
        v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  renderer = self->_priv->renderer;
  objc_msgSend(a3, "bounds", v20, v21);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(a3, "position");
  FigCFCaptionRendererDrawCaptionElementInContextForRectOrientation(v13, v15, v17, v19, (uint64_t)renderer, v7, a4, objc_msgSend(a3, "contentsAreFlipped"), &v22);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  MEMORY[0x19402EF04](self->_priv->renderMutex);
}

- (void)updateDisplay:(OpaqueFigCFCaptionRenderer *)a3
{
  FigCaptionLayerPrivate *priv;
  unint64_t v5;

  priv = self->_priv;
  if (priv->renderer == a3)
  {
    MEMORY[0x19402EA0C](priv->layoutSublayersMutex, a2);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (!pthread_main_np())
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
    -[FigCaptionLayer setNeedsLayout](self, "setNeedsLayout");
    if (-[NSMutableArray count](self->_priv->captionElementLayers, "count"))
    {
      v5 = 0;
      do
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_priv->captionElementLayers, "objectAtIndex:", v5++), "setNeedsDisplay");
      while (v5 < -[NSMutableArray count](self->_priv->captionElementLayers, "count"));
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    JUMPOUT(0x19402EA24);
  }
}

@end

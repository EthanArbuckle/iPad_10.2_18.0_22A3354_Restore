@implementation ARSKView

- (ARSKView)initWithCoder:(id)a3
{
  ARSKView *v3;
  ARSKView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARSKView;
  v3 = -[SKView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ARSKView commonInit](v3, "commonInit");
  return v4;
}

- (ARSKView)initWithFrame:(CGRect)a3
{
  ARSKView *v3;
  ARSKView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARSKView;
  v3 = -[SKView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ARSKView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *nodesByAnchorIdentifier;
  NSSet *v5;
  NSSet *lastFrameAnchors;
  CGFloat v7;
  CGFloat v8;

  v3 = (NSMutableDictionary *)objc_opt_new();
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  self->_nodesByAnchorIdentifier = v3;

  v5 = (NSSet *)objc_opt_new();
  lastFrameAnchors = self->_lastFrameAnchors;
  self->_lastFrameAnchors = v5;

  -[ARSKView bounds](self, "bounds");
  self->_viewportSize.width = v7;
  self->_viewportSize.height = v8;
  -[SKView setAllowsTransparency:](self, "setAllowsTransparency:", 1);
  -[SKView setIgnoresSiblingOrder:](self, "setIgnoresSiblingOrder:", 1);
  objc_msgSend(MEMORY[0x1E0CF2188], "setRenderType:", 3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ARSKView;
  -[SKView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  ARSKView *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  CGRect v23;

  v22 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v13.receiver = self;
  v13.super_class = (Class)ARSKView;
  -[SKView layoutSubviews](&v13, sel_layoutSubviews);
  kdebug_trace();
  -[ARSKView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_interfaceOrientation = objc_msgSend(v4, "interfaceOrientation");

  -[ARSKView bounds](self, "bounds");
  self->_viewportSize.width = v5;
  self->_viewportSize.height = v6;
  if (_ARLogGeneral_onceToken_2 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_2, &__block_literal_global_9);
  v7 = (void *)_ARLogGeneral_logObj_2;
  if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_2, OS_LOG_TYPE_DEBUG))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSKView bounds](self, "bounds");
    NSStringFromCGRect(v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUIInterfaceOrientation(self->_interfaceOrientation);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_1DCC73000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: [ARSKView] Layout changed to %{public}@, %{public}@", buf, 0x2Au);

  }
}

- (ARSession)session
{
  ARSKView *v2;
  ARSession *session;
  uint64_t v4;
  ARSession *v5;
  ARSession *v6;

  v2 = self;
  objc_sync_enter(v2);
  session = v2->_session;
  if (!session)
  {
    v4 = objc_opt_new();
    v5 = v2->_session;
    v2->_session = (ARSession *)v4;

    -[ARSession _addObserver:](v2->_session, "_addObserver:", v2);
    session = v2->_session;
  }
  v6 = session;
  objc_sync_exit(v2);

  return v6;
}

- (void)setSession:(ARSession *)session
{
  ARSKView *v5;
  ARSession *v6;
  ARSession *v7;

  v7 = session;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_session;
  if (v6 != v7)
  {
    -[ARSession _removeObserver:](v6, "_removeObserver:", v5);
    objc_storeStrong((id *)&v5->_session, session);
    -[ARSession _addObserver:](v5->_session, "_addObserver:", v5);
  }
  objc_sync_exit(v5);

}

- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types
{
  double y;
  double x;
  void *v8;
  void *v9;
  CGSize *p_viewportSize;
  double height;
  int64_t interfaceOrientation;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;

  y = point.y;
  x = point.x;
  -[ARSession currentFrame](self->_session, "currentFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    p_viewportSize = &self->_viewportSize;
    height = self->_viewportSize.height;
    v19 = x / self->_viewportSize.width;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    interfaceOrientation = self->_interfaceOrientation;
    v18 = y / height;
    objc_msgSend(v8, "camera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageResolution");
    ARViewToCameraImageTransform(interfaceOrientation, 0, (uint64_t)&v20, p_viewportSize->width, p_viewportSize->height, v14, v15);

    objc_msgSend(v9, "hitTest:types:", types, vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, v18), v20, v19)));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v16;
}

- (ARAnchor)anchorForNode:(SKNode *)node
{
  ARSession *session;
  SKNode *v5;
  void *v6;
  void *v7;

  session = self->_session;
  v5 = node;
  -[ARSession currentFrame](session, "currentFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSKView _anchorForNode:inFrame:](self, "_anchorForNode:inFrame:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ARAnchor *)v7;
}

- (SKNode)nodeForAnchor:(ARAnchor *)anchor
{
  NSMutableDictionary *nodesByAnchorIdentifier;
  void *v4;
  void *v5;

  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  -[ARAnchor identifier](anchor, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](nodesByAnchorIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKNode *)v5;
}

- (id)_anchorForNode:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_nodesByAnchorIdentifier, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scene");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = v12;
  v14 = 0;
  v15 = v12;
  if (v12 && v11 != v12)
  {
    v16 = v12;
    while ((objc_msgSend(v10, "containsObject:", v16) & 1) == 0)
    {
      objc_msgSend(v16, "parent");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v15)
      {
        v16 = v15;
        if (v15 != v11)
          continue;
      }
      goto LABEL_12;
    }
    -[NSMutableDictionary allKeysForObject:](self->_nodesByAnchorIdentifier, "allKeysForObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "anchors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __35__ARSKView__anchorForNode_inFrame___block_invoke;
    v24[3] = &unk_1EA5868D0;
    v20 = v18;
    v25 = v20;
    v21 = objc_msgSend(v19, "indexOfObjectPassingTest:", v24);

    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v7, "anchors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = v16;
  }
LABEL_12:

  return v14;
}

uint64_t __35__ARSKView__anchorForNode_inFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_updateAnchors:(id)a3 camera:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *nodesByAnchorIdentifier;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  int64_t interfaceOrientation;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id obj;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v70 = a4;
  v60 = v6;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[NSSet mutableCopy](self->_lastFrameAnchors, "mutableCopy");
  objc_msgSend(v8, "minusSet:", v7);
  v68 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v68, "minusSet:", self->_lastFrameAnchors);
  v59 = v7;
  objc_storeStrong((id *)&self->_lastFrameAnchors, v7);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v80 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](nodesByAnchorIdentifier, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "removeFromParent");
          v17 = self->_nodesByAnchorIdentifier;
          objc_msgSend(v13, "identifier");
          v18 = objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

          -[SKView delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v18) = objc_opt_respondsToSelector();

          if ((v18 & 1) != 0)
          {
            -[SKView delegate](self, "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "view:didRemoveNode:forAnchor:", self, v16, v13);

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v10);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v62 = v68;
  v21 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v76 != v23)
          objc_enumerationMutation(v62);
        v25 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
        v26 = self->_nodesByAnchorIdentifier;
        objc_msgSend(v25, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          -[SKView delegate](self, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_opt_respondsToSelector();

          if ((v30 & 1) != 0)
          {
            -[SKView delegate](self, "delegate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "view:nodeForAnchor:", self, v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
              goto LABEL_24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CD7FD8], "node");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[SKView scene](self, "scene");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addChild:", v28);

          v33 = self->_nodesByAnchorIdentifier;
          objc_msgSend(v25, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v28, v34);

        }
        -[SKView delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_opt_respondsToSelector();

        if ((v36 & 1) != 0)
        {
          -[SKView delegate](self, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "view:didAddNode:forAnchor:", self, v28, v25);

        }
LABEL_24:

      }
      v22 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v22);
  }

  interfaceOrientation = self->_interfaceOrientation;
  objc_msgSend(v70, "projectionMatrix");
  v67 = v40;
  v69 = v39;
  v65 = v42;
  v66 = v41;
  v43 = objc_msgSend(v70, "trackingState");
  v71 = 0u;
  v72 = 0u;
  v44 = 3;
  if (v43)
    v44 = interfaceOrientation;
  v64 = v44;
  v73 = 0uLL;
  v74 = 0uLL;
  v61 = v60;
  v45 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v72 != v47)
          objc_enumerationMutation(v61);
        v49 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
        v50 = self->_nodesByAnchorIdentifier;
        objc_msgSend(v49, "identifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v50, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          -[SKView delegate](self, "delegate");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_opt_respondsToSelector();

          if ((v54 & 1) != 0)
          {
            -[SKView delegate](self, "delegate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "view:willUpdateNode:forAnchor:", self, v52, v49);

          }
          -[ARSKView _updateNode:forAnchor:projectionMatrix:camera:orientation:](self, "_updateNode:forAnchor:projectionMatrix:camera:orientation:", v52, v49, v70, v64, v69, v67, v66, v65);
          -[SKView delegate](self, "delegate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_opt_respondsToSelector();

          if ((v57 & 1) != 0)
          {
            -[SKView delegate](self, "delegate");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "view:didUpdateNode:forAnchor:", self, v52, v49);

          }
        }

      }
      v46 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v46);
  }

}

- (void)_updateNode:(float32x4_t)a3 forAnchor:(float32x4_t)a4 projectionMatrix:(float32x4_t)a5 camera:(uint64_t)a6 orientation:(void *)a7
{
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  float32x4_t v26;
  float32x4_t v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  float v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float v40;
  double v44;
  double v46;
  float64x2_t v47;
  _OWORD v48[4];
  CGAffineTransform v49;
  float32x4_t v50;
  simd_float4x4 v51;
  simd_float4x4 v52;

  v14 = a7;
  v15 = a8;
  v16 = a9;
  objc_msgSend(v16, "imageResolution");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v16, "transform");
  v52 = __invert_f4(v51);
  v38 = (float32x4_t)v52.columns[1];
  v39 = (float32x4_t)v52.columns[0];
  v36 = (float32x4_t)v52.columns[3];
  v37 = (float32x4_t)v52.columns[2];
  objc_msgSend(v15, "transform");
  v21 = 0;
  v48[0] = v22;
  v48[1] = v23;
  v48[2] = v24;
  v48[3] = v25;
  memset(&v49, 0, sizeof(v49));
  v50 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v49.a + v21 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(v48[v21])), v38, *(float32x2_t *)&v48[v21], 1), v37, (float32x4_t)v48[v21], 2), v36, (float32x4_t)v48[v21], 3);
    ++v21;
  }
  while (v21 != 4);
  v40 = v50.f32[2];
  v26 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v50.f32[0] + 1.0), a3, *(float32x2_t *)v50.f32, 1), a4, v50, 2), a5, v50, 3);
  v27 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v50.f32[0]), a3, *(float32x2_t *)v50.f32, 1), a4, v50, 2), a5, v50, 3);
  v28 = (float)(vdivq_f32(v26, (float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 3)).f32[0] - (float)(v27.f32[0] / v27.f32[3]));
  v46 = (float)((float)(v27.f32[0] / v27.f32[3]) + 1.0) * 0.5;
  v44 = (float)(1.0 - (float)(v27.f32[1] / v27.f32[3])) * 0.5;
  memset(&v49, 0, sizeof(v49));
  ARCameraImageToViewTransform(a10, 0, &v49, v18, v20, a1[85].f64[0], a1[85].f64[1]);
  v47 = vmulq_f64(vaddq_f64(*(float64x2_t *)&v49.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v49.c, v44), *(float64x2_t *)&v49.a, v46)), a1[85]);
  -[float64x2_t scene](a1, "scene");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[float64x2_t convertPoint:toScene:](a1, "convertPoint:toScene:", v29, *(_OWORD *)&v47);
  v31 = v30;
  v33 = v32;

  objc_msgSend(v14, "setHidden:", v40 > 0.0);
  objc_msgSend(v14, "setPosition:", v31, v33);
  objc_msgSend(v14, "setXScale:", v28);
  objc_msgSend(v14, "setYScale:", v28);
  objc_msgSend(v14, "setZPosition:", v40);
  v34 = ARCameraToDisplayRotation(a10);
  objc_msgSend(v16, "eulerAngles");
  objc_msgSend(v14, "setZRotation:", (double)v34 * -3.14159265 / 180.0 - v35);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setHidden:", objc_msgSend(v15, "isTracked") ^ 1);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ARSKView *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ARSKView_session_didUpdateFrame___block_invoke;
  v7[3] = &unk_1EA5868F8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __35__ARSKView_session_didUpdateFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(*(id *)(a1 + 32), "captureDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  kdebug_trace();

  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 40), "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundContentsWithBuffer:", objc_msgSend(*(id *)(a1 + 32), "capturedImage"));

  kdebug_trace();
  kdebug_trace();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "anchors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateAnchors:camera:", v5, v6);

  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  return kdebug_trace();
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ARSKView_session_didFailWithError___block_invoke;
  block[3] = &unk_1EA586920;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __37__ARSKView_session_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ARSKView_session_cameraDidChangeTrackingState___block_invoke;
  block[3] = &unk_1EA586920;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__ARSKView_session_cameraDidChangeTrackingState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:cameraDidChangeTrackingState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__ARSKView_sessionWasInterrupted___block_invoke;
  v6[3] = &unk_1EA5868F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __34__ARSKView_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionWasInterrupted:", *(_QWORD *)(a1 + 40));
  }

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__ARSKView_sessionInterruptionEnded___block_invoke;
  v6[3] = &unk_1EA5868F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __37__ARSKView_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionInterruptionEnded:", *(_QWORD *)(a1 + 40));
  }

}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ARSKView_sessionShouldAttemptRelocalization_completion___block_invoke;
  block[3] = &unk_1EA586948;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__ARSKView_sessionShouldAttemptRelocalization_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, objc_msgSend(v7, "sessionShouldAttemptRelocalization:", *(_QWORD *)(a1 + 40)));
  }

}

- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  opaqueCMSampleBuffer *v10;

  v6 = a3;
  if (a4)
    CFRetain(a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ARSKView_session_didOutputAudioSampleBuffer___block_invoke;
  block[3] = &unk_1EA586970;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __47__ARSKView_session_didOutputAudioSampleBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  const void *v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v2 == (void *)v4)
  {

  }
  else
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "session:didOutputAudioSampleBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

LABEL_6:
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ARSKView_session_didChangeGeoTrackingStatus___block_invoke;
  block[3] = &unk_1EA586920;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __47__ARSKView_session_didChangeGeoTrackingStatus___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:didChangeGeoTrackingStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFrameAnchors, 0);
  objc_storeStrong((id *)&self->_nodesByAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

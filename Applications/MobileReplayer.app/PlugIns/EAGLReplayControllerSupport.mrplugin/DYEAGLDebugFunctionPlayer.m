@implementation DYEAGLDebugFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->super._layerManager);
}

+ (void)_resolveDepthWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(float *)a6
{
  int v6;
  float *v7;
  int i;
  uint64_t v9;
  float v10;

  if (a5 >= 2 && a4 >= 1)
  {
    v6 = 0;
    v7 = a6;
    do
    {
      if (a3 >= 1)
      {
        for (i = 0; i != a3; ++i)
        {
          v9 = 0;
          v10 = 0.0;
          do
            v10 = v10 + v7[v9++];
          while (a5 != (_DWORD)v9);
          v7 += (a5 - 1) + 1;
          *a6++ = (float)(1.0 / (float)a5) * v10;
        }
      }
      ++v6;
    }
    while (v6 != a4);
  }
}

+ (void)_resolveStencilWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(char *)a6
{
  int v6;
  char *v7;
  int i;
  uint64_t v9;
  int v10;

  if (a5 >= 2 && a4 >= 1)
  {
    v6 = 0;
    v7 = a6;
    do
    {
      if (a3 >= 1)
      {
        for (i = 0; i != a3; ++i)
        {
          v9 = 0;
          v10 = 0;
          do
            v10 += v7[v9++];
          while (a5 != (_DWORD)v9);
          v7 += a5;
          *a6++ = v10 / a5;
        }
      }
      ++v6;
    }
    while (v6 != a4);
  }
}

- (DYEAGLDebugFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4;
  uint64_t v5;
  DYEAGLDebugFunctionPlayer *v6;
  uint64_t v7;
  NSMutableSet *sharegroupSet;
  DYEAGLDebugFunctionPlayer *v9;
  uint64_t v10;
  DYEAGLDebugFunctionPlayer *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  DYEAGLDebugFunctionPlayer *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DYEAGLDebugFunctionPlayer;
  v6 = -[DYEAGLDebugFunctionPlayer initWithCaptureStore:](&v16, "initWithCaptureStore:", v4);
  if (v6)
  {
    v7 = objc_opt_new(NSMutableSet, v5);
    sharegroupSet = v6->_sharegroupSet;
    v6->_sharegroupSet = (NSMutableSet *)v7;

    v6->_wireframeRenderbuffer = kDYReservedGLNameWireframeRenderbuffer;
    v6->_wireframeFramebuffer = kDYReservedGLNameWireframeFramebuffer;
    v6->_wireframeRenderbufferFormat = 0;
    v6->_presentRenderbuffer = kDYReservedGLNamePresentRenderbuffer;
    v6->_presentFramebuffer = kDYReservedGLNamePresentFramebuffer;
    v6->_presentTexture = kDYReservedGLNamePresentTexture;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = sub_727C;
    v14[4] = sub_728C;
    v9 = v6;
    v15 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_7294;
    v13[3] = &unk_24718;
    v13[4] = v14;
    DYSetResourceUpdateCallbackBlock(v13, v10);
    v11 = v9;
    _Block_object_dispose(v14, 8);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  DYSetResourceUpdateCallbackBlock(0, a2);
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLDebugFunctionPlayer;
  -[DYEAGLDebugFunctionPlayer dealloc](&v3, "dealloc");
}

- (void)setEngine:(id)a3
{
  id v4;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *disabledFunctions;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYEAGLDebugFunctionPlayer;
  -[DYEAGLDebugFunctionPlayer setEngine:](&v7, "setEngine:", v4);
  v5 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine], "disabledFunctions"));
  disabledFunctions = self->_disabledFunctions;
  self->_disabledFunctions = v5;

}

- (BOOL)isFunctionEnabled
{
  if (self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__mainExecutionMode])
    return -[NSMutableIndexSet containsIndex:](self->_disabledFunctions, "containsIndex:", *(unsigned int *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex]) ^ 1;
  else
    return 1;
}

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  DYEAGLDebugFunctionPlayer **v10;
  void *v11;
  int v12;
  int v13;
  unsigned int v14;
  BOOL v15;
  int v16;
  BOOL v18;
  unsigned int v19;
  DYEAGLDebugFunctionPlayer *v21;
  DYEAGLDebugFunctionPlayer *v22;

  v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine], "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "shouldExecuteGraphicsFunction");

  if ((v5 & 1) == 0)
    goto LABEL_28;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v7 = objc_msgSend(v6, "shouldExecuteGraphicsFunction");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v9 = objc_msgSend(v8, "shouldCallSuper");

  if (v9)
  {
    v22 = self;
    v10 = &v22;
LABEL_23:
    v10[1] = (DYEAGLDebugFunctionPlayer *)DYEAGLDebugFunctionPlayer;
    return objc_msgSendSuper2((objc_super *)v10, "shouldExecuteGraphicsFunction", v21);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v12 = objc_msgSend(v11, "shouldReturn");

  if ((v12 & 1) == 0)
  {
LABEL_28:
    if (-[DYEAGLDebugFunctionPlayer isFunctionEnabled](self, "isFunctionEnabled"))
    {
      if (!self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__mainExecutionMode])
        goto LABEL_22;
      v13 = **(_DWORD **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
      if (v13 <= 822)
      {
        v18 = (v13 - 139) > 7 || ((1 << (v13 + 117)) & 0x91) == 0;
        if (v18 && v13 != 382 && v13 != 384)
          goto LABEL_22;
      }
      else
      {
        v14 = v13 - 823;
        v15 = v14 > 0x16;
        v16 = (1 << v14) & 0x780003;
        if (v15 || v16 == 0)
          goto LABEL_22;
      }
      v19 = *(_DWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex];
      if (v19 < objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "targetFunctionIndex"))
      {
LABEL_22:
        v21 = self;
        v10 = &v21;
        goto LABEL_23;
      }
    }
    return 0;
  }
  return v7;
}

- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  BOOL v18;
  id v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unsigned int **v30;
  unsigned int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unsigned int *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  unsigned int *v43;
  void *v44;
  int *v45;
  int *v46;
  unsigned int *v47;
  void *v48;
  objc_super v49;
  id *v50;
  id v51;
  id v52[5];
  objc_super v53;

  v3 = a3;
  v5 = OBJC_IVAR___DYFunctionPlayer__engine;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine], "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "performPostGraphicsFunctionDispatchActions:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v5], "delegate"));
    objc_msgSend(v8, "performPostGraphicsFunctionDispatchActions:", v3);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v5], "delegate"));
    v10 = objc_msgSend(v9, "shouldCallSuper");

    if (v10)
    {
      v53.receiver = self;
      v53.super_class = (Class)DYEAGLDebugFunctionPlayer;
      -[DYEAGLDebugFunctionPlayer performPostGraphicsFunctionDispatchActions:](&v53, "performPostGraphicsFunctionDispatchActions:", v3);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v5], "delegate"));
    v12 = objc_msgSend(v11, "shouldReturn");

    if ((v12 & 1) != 0)
      return;
  }
  v13 = OBJC_IVAR___DYFunctionPlayer__function;
  v14 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  v15 = *(_DWORD *)v14;
  if (*(int *)v14 <= 381)
  {
    v18 = (v15 - 139) <= 7 && ((1 << (v15 + 117)) & 0x91) != 0 || v15 == 28;
    if (!v18 && v15 != 36)
      goto LABEL_39;
LABEL_22:
    v19 = *(id *)&self->super.DYGLFunctionPlayer_opaque[v5];
    v20 = -[DYEAGLDebugFunctionPlayer _isContextModifiable](self, "_isContextModifiable");
    v21 = *(_DWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex];
    if (v21 + 1 == objc_msgSend(v19, "targetFunctionIndex"))
      v22 = v20;
    else
      v22 = 0;
    if (v22 != 1)
    {
LABEL_64:

      return;
    }
    v23 = 0;
    LOBYTE(v52[0]) = 0;
    LOBYTE(v50) = 0;
    v24 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) >= 3uLL)
    {
      v25 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      v26 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      v23 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                       + 1144))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 35977);
      (*(void (**)(_QWORD, uint64_t, id *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v25] + 792))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v26], 36388, v52);
      (*(void (**)(_QWORD, uint64_t, id **))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v25] + 792))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v26], 36387, &v50);
      if (LOBYTE(v52[0]) == 1 && !(_BYTE)v50)
        (*(void (**)(_QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v25] + 7256))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v26]);
    }
    if (!-[DYEAGLDebugFunctionPlayer _switchToWireframeFramebuffer](self, "_switchToWireframeFramebuffer"))
    {
LABEL_59:
      if (objc_msgSend(v19, "enableDrawCallPresent"))
        -[DYEAGLDebugFunctionPlayer _presentFramebufferWithWireframe:wireframeLineColor:](self, "_presentFramebufferWithWireframe:wireframeLineColor:", objc_msgSend(v19, "enableWireframePresent"), objc_msgSend(v19, "wireframeLineColor"));
      if (LOBYTE(v52[0]) == 1 && !(_BYTE)v50)
        (*(void (**)(_QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                       + 7264))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx]);
      goto LABEL_64;
    }
    v27 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13];
    v28 = *(_DWORD *)v27;
    if (*(int *)v27 <= 145)
    {
      if (v28 == 139)
      {
        v32 = 0;
        v33 = 0;
        v30 = (unsigned int **)(v27 + 120);
        v29 = **(unsigned int **)(v27 + 96);
        goto LABEL_47;
      }
      if (v28 != 143)
        goto LABEL_58;
      v29 = 0;
      v30 = (unsigned int **)(v27 + 96);
      v32 = **(unsigned int **)(v27 + 120);
      v34 = *(uint64_t **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 32];
    }
    else
    {
      if (v28 != 146)
      {
        if (v28 == 823)
        {
          v32 = 0;
          v33 = 0;
          v30 = (unsigned int **)(v27 + 120);
          v31 = *(unsigned int **)(v27 + 144);
          v29 = **(unsigned int **)(v27 + 96);
          goto LABEL_45;
        }
        if (v28 == 824)
        {
          v29 = 0;
          v30 = (unsigned int **)(v27 + 96);
          v31 = *(unsigned int **)(v27 + 168);
          v32 = **(unsigned int **)(v27 + 120);
          v33 = **(_QWORD **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 32];
LABEL_45:
          v37 = *v31;
LABEL_48:
          if (!v3)
          {
            v38 = **v30;
            if ((int)v38 >= 1 && v23 == 0)
            {
              v40 = **(unsigned int **)(v27 + 72);
              if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v24] + 104) == 1)
                v41 = &OBJC_IVAR___DYEAGLDebugFunctionPlayer__fixedWireframeRenderer;
              else
                v41 = &OBJC_IVAR___DYEAGLDebugFunctionPlayer__shaderWireframeRenderer;
              v42 = *v41;
              objc_msgSend(v19, "wireframeLineWidth");
              (*(void (**)(unsigned __int8 *, DYEAGLDebugFunctionPlayer *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v42] + 16))(&self->super.DYGLFunctionPlayer_opaque[v42], self, v40, v29, v38, v32, v33, v37);
            }
          }
        }
LABEL_58:
        -[DYEAGLDebugFunctionPlayer _switchToOriginalFramebuffer](self, "_switchToOriginalFramebuffer");
        goto LABEL_59;
      }
      v29 = 0;
      v30 = (unsigned int **)(v27 + 144);
      v32 = **(unsigned int **)(v27 + 168);
      v34 = *(uint64_t **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 48];
    }
    v33 = *v34;
LABEL_47:
    v37 = 1;
    goto LABEL_48;
  }
  v16 = (v15 - 823) > 0x1F || ((1 << (v15 - 55)) & 0xF0784003) == 0;
  if (!v16 || v15 == 384 || v15 == 382)
    goto LABEL_22;
LABEL_39:
  if (v15 == 93 && !v3)
  {
    v35 = *(unsigned int **)(v14 + 72);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
    sub_485C(v52, v36);

    v50 = v52;
    v51 = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
    sub_3C1C((uint64_t)&self->_shaderWireframeRenderer, &v50, *v35);
LABEL_72:

    return;
  }
  if (v15 == 349 && !v3)
  {
    v43 = *(unsigned int **)(v14 + 72);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
    sub_485C(v52, v44);

    v50 = v52;
    v51 = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
    sub_42F4((uint64_t)&self->_shaderWireframeRenderer, &v50, *v43);
    goto LABEL_72;
  }
  if (v15 == 888 && !v3)
  {
    v45 = *(int **)(v14 + 72);
    v46 = *(int **)(v14 + 96);
    v47 = *(unsigned int **)(v14 + 24);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
    sub_485C(v52, v48);

    v50 = v52;
    v51 = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
    sub_46B8((uint64_t)&self->_shaderWireframeRenderer, &v50, *v47, *v45, *v46, *(const std::string::value_type ***)(v14 + 120));
    goto LABEL_72;
  }
  v49.receiver = self;
  v49.super_class = (Class)DYEAGLDebugFunctionPlayer;
  -[DYEAGLDebugFunctionPlayer performPostGraphicsFunctionDispatchActions:](&v49, "performPostGraphicsFunctionDispatchActions:", v3);
}

- (void)executePlatformFunction
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;

  v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine], "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "executePlatformFunction");

  if ((v5 & 1) == 0)
    goto LABEL_20;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  objc_msgSend(v6, "executePlatformFunction");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v8 = objc_msgSend(v7, "shouldCallSuper");

  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)DYEAGLDebugFunctionPlayer;
    -[DYEAGLFunctionPlayer executePlatformFunction](&v24, "executePlatformFunction");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v10 = objc_msgSend(v9, "shouldReturn");

  if ((v10 & 1) == 0)
  {
LABEL_20:
    v11 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
    v12 = *(_DWORD *)v11;
    if (-[DYEAGLDebugFunctionPlayer isFunctionEnabled](self, "isFunctionEnabled"))
    {
      if (v12 > -8180)
      {
        if ((v12 + 8179) < 2)
          return;
      }
      else
      {
        switch(v12)
        {
          case -12287:
            v22.receiver = self;
            v22.super_class = (Class)DYEAGLDebugFunctionPlayer;
            -[DYEAGLFunctionPlayer executePlatformFunction](&v22, "executePlatformFunction");
            v15 = **(_QWORD **)(v11 + 96);
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerForID:", v15));

            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "drawableProperties"));
            v19 = objc_msgSend(v18, "mutableCopy");

            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
            objc_msgSend(v19, "setObject:forKey:", v20, kEAGLDrawablePropertyRetainedBacking);

            objc_msgSend(v17, "setDrawableProperties:", v19);
            return;
          case -8190:
            return;
          case -8188:
            v23.receiver = self;
            v23.super_class = (Class)DYEAGLDebugFunctionPlayer;
            -[DYEAGLFunctionPlayer executePlatformFunction](&v23, "executePlatformFunction");
            v13 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedLongLong:", **(_QWORD **)(v11 + 120));
            if ((-[NSMutableSet containsObject:](self->_sharegroupSet, "containsObject:", v13) & 1) == 0)
            {
              -[NSMutableSet addObject:](self->_sharegroupSet, "addObject:", v13);
              v14 = OBJC_IVAR___DYGLFunctionPlayer__ctx;
              DYReserveGLObjects(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], 1609, &self->_wireframeRenderbuffer, 1);
              DYReserveGLObjects(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v14], 1608, &self->_wireframeFramebuffer, 1);
              DYReserveGLObjects(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v14], 1609, &self->_presentRenderbuffer, 1);
              DYReserveGLObjects(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v14], 1608, &self->_presentFramebuffer, 1);
              DYReserveGLObjects(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v14], 1600, &self->_presentTexture, 1);
            }
            if (**(_DWORD **)(v11 + 72) >= 2u)
              objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "setParameter:to:", 610, &unk_2AAC8);

            return;
        }
      }
      v21.receiver = self;
      v21.super_class = (Class)DYEAGLDebugFunctionPlayer;
      -[DYEAGLFunctionPlayer executePlatformFunction](&v21, "executePlatformFunction");
    }
  }
}

- (void)_onResourceUpdated:(unsigned int)a3 target:(unsigned int)a4 dispatcher:(Dispatcher *)a5
{
  if (a4 == 35648)
  {
    sub_42F4((uint64_t)&self->_shaderWireframeRenderer, a5, *(uint64_t *)&a3);
  }
  else if (a4 == 35656)
  {
    sub_3C1C((uint64_t)&self->_shaderWireframeRenderer, a5, *(uint64_t *)&a3);
  }
}

- (BOOL)_switchToWireframeFramebuffer
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  unint64_t v9;
  char *v10;
  _BYTE v12[4];
  uint64_t v13;
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  _QWORD v17[2];
  int v18;
  int v19;
  unsigned int v20;
  float v21[4];

  v3 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  v4 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36006, &self->_origFramebuffer);
  if (!self->_origFramebuffer)
    return 0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36007, &v20);
  v5 = 36064;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                   + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36064, 36049, &v19);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                   + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36064, 36048, &v18);
  if (!v18)
  {
    v5 = 36096;
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36096, 36049, &v19);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36096, 36048, &v18);
    if (!v18)
    {
      v5 = 36128;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                       + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36128, 36049, &v19);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                       + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36128, 36048, &v18);
      if (!v18)
        return 0;
    }
  }
  memset(v14, 0, sizeof(v14));
  v15 = 0;
  v16 = 0x100000001;
  v17[0] = 0;
  *(_QWORD *)((char *)v17 + 5) = 0;
  -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:](self, "_imageInfoForAttachment:outImageInfo:", v5, v14);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, self->_wireframeFramebuffer);
  v13 = 0;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, self->_wireframeRenderbuffer);
  (*(void (**)(_QWORD, uint64_t, uint64_t, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                           + 5360))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, 36162, (char *)&v13 + 4);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                              + 5360))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, 36163, &v13);
  if (self->_wireframeRenderbufferFormat)
  {
    v6 = v15;
    v7 = HIDWORD(v13);
    goto LABEL_15;
  }
  self->_wireframeRenderbufferFormat = 32856;
  v9 = *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                 + 104);
  if (v9 == 2)
  {
    v10 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 936))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 7939);
    if (!v10 || !strstr(v10, "GL_EXT_texture_rg"))
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v9 >= 3)
LABEL_13:
    self->_wireframeRenderbufferFormat = 33321;
LABEL_14:
  v6 = v15;
  v7 = ~v15;
  HIDWORD(v13) = ~v15;
LABEL_15:
  if (v6 != v7 || (_DWORD)v16 != (_DWORD)v13)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5352))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, self->_wireframeRenderbufferFormat);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                      + 5432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36064, 36161, self->_wireframeRenderbuffer);
  }
  (*(void (**)(_QWORD, uint64_t, float *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 824))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 3106, v21);
  (*(void (**)(_QWORD, uint64_t, _BYTE *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 792))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 3107, v12);
  v8 = 1;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 392))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 1, 1, 1, 1);
  (*(void (**)(_QWORD, float, float, float, float))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 96))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 80))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 0x4000);
  (*(void (**)(_QWORD, float, float, float, float))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 96))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], v21[0], v21[1], v21[2], v21[3]);
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                 + 392))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], v12[0], v12[1], v12[2], v12[3]);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, v20);
  return v8;
}

- (void)_switchToOriginalFramebuffer
{
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36009, self->_origFramebuffer);
}

- (void)_presentFramebufferWithWireframe:(BOOL)a3 wireframeLineColor:(unsigned int)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  unsigned int v49;
  __int128 *InternalFormatInfo;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD *v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSString *v60;
  _QWORD v61[5];
  _OWORD v62[16];
  _QWORD v63[33];
  __int128 v64;
  uint64_t v65;
  NSString *v66;
  NSString *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  _QWORD v73[2];
  CGRect v74;
  CGRect v75;

  v4 = a3;
  v65 = 0;
  v64 = 0uLL;
  v6 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  v7 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(_QWORD, uint64_t, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36006, (char *)&v65 + 4);
  if (HIDWORD(v65))
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36007, &v65);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                      + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36064, 36049, (char *)&v64 + 12);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                      + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36064, 36048, (char *)&v64 + 8);
    if (DWORD2(v64))
    {
      v68 = 0;
      v69 = 0;
      v71 = 0;
      v70 = 0;
      v72 = 0x100000001;
      v73[0] = 0;
      *(_QWORD *)((char *)v73 + 5) = 0;
      -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:](self, "_imageInfoForAttachment:outImageInfo:", 36064, &v68);
      v8 = kEAGLColorFormatRGBA8;
      if ((HIDWORD(v69) & 0xFFFFFFFD) == 0x8C41)
        v9 = kEAGLColorFormatSRGBA8;
      else
        v9 = kEAGLColorFormatRGBA8;
      v60 = v9;
      if (DWORD2(v64) == 36161)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v64)));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layerForID:", objc_msgSend(v12, "unsignedLongLongValue")));

          if (v14)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
    else
    {
      v60 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentTopLayer"));

    if (!v14)
    {
LABEL_39:

      return;
    }
    v8 = kEAGLColorFormatRGBA8;
LABEL_14:
    v16 = v60;
    if (v60)
      v17 = v60;
    else
      v17 = v8;
    v60 = v17;

    v58 = OBJC_IVAR___DYGLFunctionPlayer__ctx;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "sharegroup"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layerForID:", v18));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "drawableProperties"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kEAGLDrawablePropertyColorFormat));

    if (v20 != v14)
      goto LABEL_21;
    objc_msgSend(v14, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v14, "bounds");
    v75.origin.x = v30;
    v75.origin.y = v31;
    v75.size.width = v32;
    v75.size.height = v33;
    v74.origin.x = v23;
    v74.origin.y = v25;
    v74.size.width = v27;
    v74.size.height = v29;
    if (!CGRectEqualToRect(v74, v75)
      || (objc_msgSend(v14, "contentsScale"), v35 = v34, objc_msgSend(v14, "contentsScale"), v35 != v36)
      || (v37 = v14, (objc_msgSend(v57, "isEqualToString:", v60) & 1) == 0))
    {
LABEL_21:
      v66 = kEAGLDrawablePropertyColorFormat;
      v67 = v60;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
      if (v20)
      {
        sub_A508((uint64_t)&v68, 1, 1);
        objc_msgSend(v14, "transform");
        v62[4] = v62[12];
        v62[5] = v62[13];
        v62[6] = v62[14];
        v62[7] = v62[15];
        v62[0] = v62[8];
        v62[1] = v62[9];
        v62[2] = v62[10];
        v62[3] = v62[11];
        objc_msgSend(v20, "setTransform:", v62);
        objc_msgSend(v14, "anchorPoint");
        objc_msgSend(v20, "setAnchorPoint:");
        objc_msgSend(v14, "bounds");
        objc_msgSend(v20, "setBounds:");
        objc_msgSend(v14, "contentsScale");
        objc_msgSend(v20, "setContentsScale:");
        objc_msgSend(v20, "setDrawableProperties:", v38);
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        objc_msgSend(v14, "bounds");
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;
        objc_msgSend(v14, "contentsScale");
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", v18, v38, 0, v41, v43, v45, v47, v48));

        sub_A508((uint64_t)&v68, 1, 1);
        objc_msgSend(v14, "transform");
        *(_OWORD *)&v63[8] = *(_OWORD *)&v63[25];
        *(_OWORD *)&v63[10] = *(_OWORD *)&v63[27];
        *(_OWORD *)&v63[12] = *(_OWORD *)&v63[29];
        *(_OWORD *)&v63[14] = *(_OWORD *)&v63[31];
        *(_OWORD *)v63 = *(_OWORD *)&v63[17];
        *(_OWORD *)&v63[2] = *(_OWORD *)&v63[19];
        *(_OWORD *)&v63[4] = *(_OWORD *)&v63[21];
        *(_OWORD *)&v63[6] = *(_OWORD *)&v63[23];
        objc_msgSend(v20, "setTransform:", v63);
        objc_msgSend(v14, "anchorPoint");
        objc_msgSend(v20, "setAnchorPoint:");
      }
      sub_A5D0((uint64_t)&v68);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, self->_presentRenderbuffer);
      objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v58], "renderbufferStorage:fromDrawable:", 36161, v20);
      +[CATransaction flush](CATransaction, "flush");
      LODWORD(v68) = 0;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                  + 5360))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, 36164, &v68);
      InternalFormatInfo = (__int128 *)GPUTools::GL::GetInternalFormatInfo((GPUTools::GL *)v68, v49);
      v52 = InternalFormatInfo[1];
      v51 = InternalFormatInfo[2];
      v53 = *InternalFormatInfo;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.rBits = *(__int128 *)((char *)InternalFormatInfo + 44);
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.bComponentType = v52;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.sComponentType = v51;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.internalFormat = v53;
      (*(void (**)(_QWORD, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                              + 5360))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, 36162, self->_presentRenderbufferResolution);
      (*(void (**)(_QWORD, uint64_t, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                              + 5360))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, 36163, &self->_presentRenderbufferResolution[1]);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, self->_presentFramebuffer);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                        + 5432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36064, 36161, self->_presentRenderbuffer);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, HIDWORD(v65));

      v37 = v20;
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                      + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36096, 36048, (char *)&v64 + 4);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, __int128 *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                          + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36128, 36048, &v64);
    if (*(_QWORD *)((char *)&v64 + 4) || (_DWORD)v64)
    {
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_8D84;
      v61[3] = &unk_24740;
      v61[4] = self;
      v54 = objc_retainBlock(v61);
      if (DWORD2(v64))
      {
        v55 = GPUTools::GL::DYIsAttachmentWritable(36064, v54);
        if (DWORD2(v64) == 36161)
          -[DYEAGLDebugFunctionPlayer _copyRenderbufferColorAttachmentToPresent:color:isWireframe:](self, "_copyRenderbufferColorAttachmentToPresent:color:isWireframe:", 36064, 0xFFFFFFFFLL, 0);
        else
          -[DYEAGLDebugFunctionPlayer _copyTextureColorAttachmentToPresent:](self, "_copyTextureColorAttachmentToPresent:", 36064);
      }
      else if (DWORD1(v64))
      {
        v55 = GPUTools::GL::DYIsAttachmentWritable(36096, v54);
        -[DYEAGLDebugFunctionPlayer _copyDepthOrStencilAttachmentToPresent:type:](self, "_copyDepthOrStencilAttachmentToPresent:type:", 36096, DWORD1(v64));
      }
      else
      {
        v55 = GPUTools::GL::DYIsAttachmentWritable(36128, v54);
        -[DYEAGLDebugFunctionPlayer _copyDepthOrStencilAttachmentToPresent:type:](self, "_copyDepthOrStencilAttachmentToPresent:type:", 36128, v64);
      }
      if (v55)
      {
        if (v4)
        {
          (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                          + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, self->_wireframeFramebuffer);
          -[DYEAGLDebugFunctionPlayer _copyRenderbufferColorAttachmentToPresent:color:isWireframe:](self, "_copyRenderbufferColorAttachmentToPresent:color:isWireframe:", 36064, a4, 1);
        }
      }
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, self->_presentRenderbuffer);
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v56, "prepareLayerForPresent:", v37);

      objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v58], "presentRenderbuffer:", 36161);
    }
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, v65);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, HIDWORD(v65));

    goto LABEL_39;
  }
}

- (void)_copyRenderbufferColorAttachmentToPresent:(unsigned int)a3 color:(unsigned int)a4 isWireframe:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  GPUTools::GL *v21;
  GPUTools::GL *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD v26[2];
  unsigned int v27;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v27 = 0;
  v9 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  v10 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                           + 5440))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36009, *(_QWORD *)&a3, 36049, &v27);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36161, v27);
  v21 = 0;
  v22 = 0;
  v24 = 0;
  v23 = 0;
  v25 = 0x100000001;
  v26[0] = 0;
  *(_QWORD *)((char *)v26 + 5) = 0;
  -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:](self, "_imageInfoForAttachment:outImageInfo:", v7, &v21);
  if (v5)
  {
    v12 = 1;
  }
  else if (GPUTools::GL::IsIntegerFormat((GPUTools::GL *)HIDWORD(v21), v11))
  {
    if (GPUTools::GL::IsSignedType((GPUTools::GL *)v22, v13))
      v12 = 2;
    else
      v12 = 3;
  }
  else
  {
    v12 = 0;
  }
  if (SHIDWORD(v26[0]) < 1)
  {
    -[DYEAGLDebugFunctionPlayer _copyColorAttachmentToPresentTexture:imageInfo:](self, "_copyColorAttachmentToPresentTexture:imageInfo:", v7, &v21);
    -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:](self, "_renderPresentTextureWithColor:enableBlend:texBlitProgram:", v6, v5, v12);
  }
  else
  {
    v20 = 0;
    (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                            + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36006, &v20);
    v19 = 0;
    (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                            + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36010, &v19);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36008, v20);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36009, self->_presentFramebuffer);
    if (self->_presentRenderbufferResolution[0] == v24
      && self->_presentRenderbufferResolution[1] == (_DWORD)v25
      && self->_presentRenderbufferInternalFormatInfo.internalFormat == HIDWORD(v22))
    {
      v14 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9];
      v15 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10];
      if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                     + 104) < 3uLL)
        (*(void (**)(uint64_t))(v14 + 8208))(v15);
      else
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 6040))(v15, 0, 0);
    }
    else
    {
      v18 = 0;
      (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                              + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 32873, &v18);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 3553, self->_presentTexture);
      -[DYEAGLDebugFunctionPlayer _changeTextureToWidth:height:imageFormatInfo:texels:](self, "_changeTextureToWidth:height:imageFormatInfo:texels:", v24, v25, &v21, 0);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                                                + 5416))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36009, v7, 3553, self->_presentTexture, 0);
      v16 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9];
      v17 = *(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10];
      if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                     + 104) < 3uLL)
        (*(void (**)(uint64_t))(v16 + 8208))(v17);
      else
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v16 + 6040))(v17, 0, 0);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                                        + 5432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36009, v7, 36161, self->_presentRenderbuffer);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 3553, v18);
      -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:](self, "_renderPresentTextureWithColor:enableBlend:texBlitProgram:", v6, v5, v12);
    }
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v10], 36008, v19);
  }
}

- (void)_copyTextureColorAttachmentToPresent:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v5;
  int IsIntegerFormat;
  unsigned int v7;
  uint64_t v8;
  GPUTools::GL *v9;
  GPUTools::GL *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _QWORD v14[2];

  v3 = *(_QWORD *)&a3;
  v9 = 0;
  v10 = 0;
  v12 = 0;
  v11 = 0;
  v13 = 0x100000001;
  v14[0] = 0;
  *(_QWORD *)((char *)v14 + 5) = 0;
  -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:](self, "_imageInfoForAttachment:outImageInfo:", *(_QWORD *)&a3, &v9);
  -[DYEAGLDebugFunctionPlayer _copyColorAttachmentToPresentTexture:imageInfo:](self, "_copyColorAttachmentToPresentTexture:imageInfo:", v3, &v9);
  IsIntegerFormat = GPUTools::GL::IsIntegerFormat((GPUTools::GL *)HIDWORD(v9), v5);
  v8 = 0;
  if (IsIntegerFormat)
  {
    if (GPUTools::GL::IsSignedType((GPUTools::GL *)v10, v7))
      v8 = 2;
    else
      v8 = 3;
  }
  -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:](self, "_renderPresentTextureWithColor:enableBlend:texBlitProgram:", 0xFFFFFFFFLL, 0, v8);
}

- (void)_copyColorAttachmentToPresentTexture:(unsigned int)a3 imageInfo:(ImageInfo *)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v5 = *(_QWORD *)&a3;
  v12 = 0;
  v7 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  v8 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36006, &v12);
  v11 = 0;
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 36010, &v11);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 36008, v12);
  v10 = 0;
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 32873, &v10);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, self->_presentTexture);
  -[DYEAGLDebugFunctionPlayer _changeTextureToWidth:height:imageFormatInfo:texels:](self, "_changeTextureToWidth:height:imageFormatInfo:texels:", a4->var2, a4->var3, a4, 0);
  if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                 + 104) < 3uLL)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                                                                 + 448))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, 0, 0, 0, 0, 0, a4->var2, a4->var3);
  }
  else
  {
    v9 = 0;
    (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                            + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 3074, &v9);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 1888))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], v5);
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                                                                 + 448))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, 0, 0, 0, 0, 0, a4->var2, a4->var3);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 1888))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], v9);
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, v10);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v7] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8], 36008, v11);
}

- (void)_copyDepthOrStencilAttachmentToPresent:(unsigned int)a3 type:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unsigned int v16;
  char *v17;
  char *v18;
  const Dispatcher *v19;
  uint64_t v20;
  unsigned int ShouldUseGLIReadTextureData;
  void *v22;
  uint64_t v23;
  _OWORD v24[2];
  int v25;
  unsigned int v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  void *memptr;
  _QWORD v32[3];
  unsigned int v33;
  uint64_t v34;
  _DWORD v35[5];
  _BYTE v36[4];
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  _QWORD v42[2];
  id v43[5];
  _DWORD v44[5];

  v4 = *(_QWORD *)&a3;
  v44[0] = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context", *(_QWORD *)&a3, *(_QWORD *)&a4));
  sub_485C(v43, v6);

  v42[0] = v43;
  v42[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  v9 = objc_msgSend(v8, "api");

  GPUTools::GL::GetFramebufferAttachmentInfo(v42, v9, 36009, v4, v36);
  memset(v32, 0, sizeof(v32));
  v33 = 0;
  v34 = 0x100000001;
  memset(v35, 0, 13);
  GPUTools::GL::GetImageInfo(v42, v9, v37, v38, v40, v32);
  if (v35[1] <= 1)
    v10 = 1;
  else
    v10 = v35[1];
  v11 = (v10 << (2 * ((_DWORD)v4 == 36096))) * (int)v34 * (uint64_t)(int)v33;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 8uLL, v11, 0xCE3729EBuLL);
  if (memptr)
  {
    if (v38 == 36161)
    {
      v12 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      v13 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(_QWORD, uint64_t, _DWORD *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36007, v44);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 5328))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 36161, v37);
    }
    else
    {
      *(_QWORD *)((char *)&v27 + 7) = 0;
      *(_QWORD *)&v27 = 0;
      GPUTools::GL::DYGetTextureTargetInfo();
      v12 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      v13 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(_QWORD, _QWORD, _DWORD *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                       + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 0, v44);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], v38, v37);
    }
    if (v38 == 34067)
      v14 = v39;
    else
      v14 = v38;
    if ((_DWORD)v4 == 36096)
      v15 = 6402;
    else
      v15 = 6401;
    if ((_DWORD)v4 == 36096)
      v16 = 5126;
    else
      v16 = 5121;
    v27 = xmmword_23800;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v26 = 0;
    v17 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12]
                                                             + 936))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 7939);
    v18 = strstr(v17, "GL_APPLE_row_bytes");
    GPUTools::GL::SavePixelStorePackState(v42, v9, v18 != 0, &v27);
    memset(v24, 0, sizeof(v24));
    HIDWORD(v24[0]) = 1;
    v25 = 0;
    GPUTools::GL::ApplyPixelStorePackState(v42, v9, v18 != 0, v24);
    v20 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) >= 3uLL)
    {
      (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12]
                                                              + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 35053, &v26);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 5136))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 35051, 0);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 1560))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 32875, v41);
    }
    ShouldUseGLIReadTextureData = GPUTools::GL::ShouldUseGLIReadTextureData((GPUTools::GL *)v42, v19);
    GPUTools::GL::GetImageData((GPUTools::GL *)v42, (const Dispatcher *)v14, v40, v15, v16, ShouldUseGLIReadTextureData, (BOOL)memptr, v22);
    if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v20] + 104) >= 3uLL)
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 5136))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 35051, v26);
    GPUTools::GL::ApplyPixelStorePackState(v42, v9, v18 != 0, &v27);
    if ((_DWORD)v4 == 36096)
      +[DYEAGLDebugFunctionPlayer _resolveDepthWithWidth:height:numSamples:buffer:](DYEAGLDebugFunctionPlayer, "_resolveDepthWithWidth:height:numSamples:buffer:", v33, v34, v35[1], memptr);
    else
      +[DYEAGLDebugFunctionPlayer _resolveStencilWithWidth:height:numSamples:buffer:](DYEAGLDebugFunctionPlayer, "_resolveStencilWithWidth:height:numSamples:buffer:", v33, v34, v35[1], memptr);
    v23 = 40;
    if (v38 == 36161)
      v23 = 5328;
    (*(void (**)(_QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + v23))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13]);
    LODWORD(v24[0]) = 0;
    (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 32873, v24);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 3553, self->_presentTexture);
    *(int32x2_t *)&v27 = vdup_n_s32(0x1909u);
    DWORD2(v27) = v16;
    -[DYEAGLDebugFunctionPlayer _changeTextureToWidth:height:imageFormatInfo:texels:](self, "_changeTextureToWidth:height:imageFormatInfo:texels:", v33, v34, &v27, memptr);
    free(memptr);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v13], 3553, LODWORD(v24[0]));
    -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:](self, "_renderPresentTextureWithColor:enableBlend:texBlitProgram:", 0xFFFFFFFFLL, 0, 0);

  }
  else
  {
    dy_abort("Unable to allocate %lu bytes for depth buffer\n", v11);
    __break(1u);
  }
}

- (void)_renderPresentTextureWithColor:(unsigned int)a3 enableBlend:(BOOL)a4 texBlitProgram:(unsigned int)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;

  v26 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "sharegroup"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerForID:", v8));

  v37 = 0;
  v36 = 0;
  v11 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  v12 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  v35 = v10;
  (*(void (**)(_QWORD, uint64_t, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 32873, (char *)&v37 + 4);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v11] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, self->_presentTexture);
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v11]
                                                                      + 1000))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, 0, 4096, &v37);
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v11]
                                                                  + 1000))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, 0, 4097, &v36);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v11] + 40))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, HIDWORD(v37));
  v14 = v36;
  v13 = v37;
  objc_msgSend(v10, "bounds");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "contentsScale");
  v20 = v19;
  objc_msgSend(v10, "contentsScale");
  v21 = v26;
  v22 = v16 * v20;
  v24 = v18 * v23;
  +[DYEAGLDebugFunctionPlayer shrinkSourceSize:toDestSize:](DYEAGLDebugFunctionPlayer, "shrinkSourceSize:toDestSize:", (double)v13, (double)v14, v22, v18 * v23);
  LODWORD(v26) = vcvtpd_s64_f64(v25);
  v28 = vcvtpd_s64_f64(v27);
  v29 = (int)v24;
  if ((int)v22 >= (int)v26)
    v30 = (int)v22 - v26;
  else
    v30 = (int)v22 - v26 + 1;
  if (v29 >= (int)v28)
    v31 = v29 - v28;
  else
    v31 = v29 - v28 + 1;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v11] + 5376))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12], 36009, self->_presentFramebuffer);
  (*(void (**)(_QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v11] + 720))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v12]);
  if (v21)
    v32 = 0;
  else
    v32 = 0x4000;
  LODWORD(v34) = a5;
  BYTE5(v33) = 0;
  BYTE4(v33) = v21;
  LODWORD(v33) = a3;
  -[DYEAGLFunctionPlayer drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:](self, "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:", self->_presentTexture, 3553, self->_presentFramebuffer, (v30 >> 1) | ((unint64_t)(v31 >> 1) << 32), v26 | (v28 << 32), v32, v33, v34);

}

- (void)_changeTextureToWidth:(int)a3 height:(int)a4 imageFormatInfo:(ImageFormatInfo *)a5 texels:(char *)a6
{
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  _OWORD v20[2];
  int v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  unsigned int v26;
  _QWORD v27[2];
  id v28[5];
  _QWORD v29[3];
  _BYTE v30[12];
  _QWORD v31[4];

  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  memset(v29, 0, sizeof(v29));
  *(_DWORD *)v30 = 0;
  *(_QWORD *)&v30[4] = 0x100000001;
  v31[0] = 0;
  *(_QWORD *)((char *)v31 + 5) = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
  sub_485C(v28, v11);

  v27[0] = v28;
  v27[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  v14 = objc_msgSend(v13, "api");

  GPUTools::GL::GetImageInfo(v27, v14, 3553, 0, v29);
  if (*(_QWORD *)v30 != __PAIR64__(v8, v9) || a6 || LODWORD(v29[0]) != a5->var0)
  {
    v26 = 0;
    v22 = xmmword_23800;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v15 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    v16 = OBJC_IVAR___DYGLFunctionPlayer__disp;
    v17 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
    if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) > 2uLL)
    {
      (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                              + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 35055, &v26);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16] + 5136))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 35052, 0);
    }
    v18 = (char *)(*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                             + 936))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 7939);
    v19 = strstr(v18, "GL_APPLE_row_bytes");
    GPUTools::GL::SavePixelStoreUnpackState(v27, v14, v19 != 0, &v22);
    memset(v20, 0, sizeof(v20));
    HIDWORD(v20[0]) = 1;
    v21 = 0;
    GPUTools::GL::ApplyPixelStoreUnpackState(v27, v14, v19 != 0, v20);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 3553, 10241, 9728);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 3553, 10240, 9728);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 3553, 10242, 33071);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 3553, 10243, 33071);
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, unsigned int, char *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16] + 2408))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 3553, 0, *(&a5->var0 + (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v15] + 104) < 3uLL)), v9, v8, 0, a5->var1, a5->var2, a6);
    GPUTools::GL::ApplyPixelStoreUnpackState(v27, v14, v19 != 0, &v22);
    if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v15] + 104) >= 3uLL)
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v16] + 5136))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v17], 35052, v26);
  }

}

- (void)_imageInfoForAttachment:(unsigned int)a3 outImageInfo:(ImageInfo *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BYTE v11[4];
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD v15[2];
  id v16[5];

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
  sub_485C(v16, v7);

  v15[0] = v16;
  v15[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  v10 = objc_msgSend(v9, "api");

  GPUTools::GL::GetFramebufferAttachmentInfo(v15, v10, 36009, v5, v11);
  GPUTools::GL::GetImageInfo(v15, v10, v12, v13, v14, a4);

}

- (BOOL)_isBoundObjectAlive:(unsigned int)a3 isObjectFunc:(void *)a4
{
  uint64_t v6;
  int v8;

  v8 = 0;
  v6 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(_QWORD, _QWORD, int *))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                + 832))(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], *(_QWORD *)&a3, &v8);
  return !v8 || ((unsigned int (*)(_QWORD))a4)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v6]) == 1;
}

- (BOOL)_isContextModifiable
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[2];
  id v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  if (!-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 34965, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp] + 5160))|| !-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 36006, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5368))|| !-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 36010, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5368))|| !-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 36007, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5320)))
  {
    return 0;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
  sub_485C(v13, v4);

  v12[0] = v13;
  v12[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  v7 = objc_msgSend(v6, "api");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_A29C;
  v11[3] = &unk_24768;
  v11[4] = self;
  v11[5] = &v14;
  GPUTools::GL::EnumerateTextureTargets(v12, v7, v11);
  v9 = 0;
  if (*((_BYTE *)v15 + 24))
  {
    v8 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) < 2uLL
      || -[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 33370, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 6600))&& (*(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v8] + 104) < 3uLL|| -[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 35053, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5160))&& -[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:](self, "_isBoundObjectAlive:isObjectFunc:", 35055, *(_QWORD *)(*(_QWORD *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5160))))
    {
      v9 = 1;
    }
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)prepareForCaptureExecution
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v11;
  objc_super v12;

  v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine], "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "prepareForCaptureExecution");

  if ((v5 & 1) == 0)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  objc_msgSend(v6, "prepareForCaptureExecution");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v8 = objc_msgSend(v7, "shouldCallSuper");

  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYEAGLDebugFunctionPlayer;
    -[DYEAGLDebugFunctionPlayer prepareForCaptureExecution](&v12, "prepareForCaptureExecution");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super.DYGLFunctionPlayer_opaque[v3], "delegate"));
  v10 = objc_msgSend(v9, "shouldReturn");

  if ((v10 & 1) == 0)
  {
LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)DYEAGLDebugFunctionPlayer;
    -[DYEAGLDebugFunctionPlayer prepareForCaptureExecution](&v11, "prepareForCaptureExecution");
  }
}

- (void).cxx_destruct
{
  sub_2788((uint64_t)&self->_shaderWireframeRenderer);
  sub_24BC((GPUTools::GL::WireframeRenderer *)&self->_fixedWireframeRenderer);
  objc_storeStrong((id *)&self->_disabledFunctions, 0);
  objc_storeStrong((id *)&self->_sharegroupSet, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 148) = &off_24660;
  *((_QWORD *)self + 149) = 0;
  *((_QWORD *)self + 150) = 0;
  *((_QWORD *)self + 151) = 0;
  *((_QWORD *)self + 152) = off_246C8;
  *((_QWORD *)self + 159) = 0;
  *(_OWORD *)((char *)self + 1256) = 0u;
  *(_OWORD *)((char *)self + 1240) = 0u;
  *(_OWORD *)((char *)self + 1224) = 0u;
  *((_DWORD *)self + 320) = 1065353216;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1288) = 0u;
  *((_DWORD *)self + 330) = 1065353216;
  *((_OWORD *)self + 83) = 0u;
  *((_OWORD *)self + 84) = 0u;
  *((_DWORD *)self + 340) = 1065353216;
  *(_OWORD *)((char *)self + 1384) = 0u;
  *(_OWORD *)((char *)self + 1368) = 0u;
  *((_DWORD *)self + 350) = 1065353216;
  *((_OWORD *)self + 88) = 0u;
  *((_OWORD *)self + 89) = 0u;
  *((_DWORD *)self + 360) = 1065353216;
  *(_OWORD *)((char *)self + 1448) = 0u;
  *(_OWORD *)((char *)self + 1464) = 0u;
  *((_DWORD *)self + 370) = 1065353216;
  return self;
}

@end

@implementation FBSceneSnapshot

- (FBSceneSnapshot)initWithScene:(id)a3 snapshotContext:(id)a4
{
  id v7;
  id v8;
  FBSceneSnapshot *v9;
  FBSceneSnapshot *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int IsLandscape;
  double v23;
  uint64_t v24;
  _FBSSnapshot *snapshot;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneSnapshot initWithScene:snapshotContext:]");
  v27.receiver = self;
  v27.super_class = (Class)FBSceneSnapshot;
  v9 = -[FBSceneSnapshot init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scene, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    -[FBSceneSnapshot _collectLayersToSnapshotFromScene:withSnapshotContext:rootContext:](v10, "_collectLayersToSnapshotFromScene:withSnapshotContext:rootContext:", v10->_scene, v8, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D232E0]);
    objc_msgSend(v7, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithDisplayConfiguration:layers:", v14, v11);

    objc_msgSend(v15, "setOpaque:", objc_msgSend(v8, "isOpaque"));
    objc_msgSend(v8, "scale");
    objc_msgSend(v15, "setScale:");
    objc_msgSend(v8, "clientExtendedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsProtectedContent:", objc_msgSend(v16, "BOOLForSetting:", 281330800));

    objc_msgSend(v8, "frame");
    v18 = v17;
    v20 = v19;
    if (!objc_msgSend(v8, "orientation"))
    {
      objc_msgSend(v8, "settings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "interfaceOrientation");
      IsLandscape = BSInterfaceOrientationIsLandscape();

      if (IsLandscape)
        v23 = v18;
      else
        v23 = v20;
      if (IsLandscape)
        v18 = v20;
      v20 = v23;
    }
    objc_msgSend(v15, "setSnapshotSize:", v18, v20);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D232D8]), "initWithSnapshotContext:", v15);
    snapshot = v10->_snapshot;
    v10->_snapshot = (_FBSSnapshot *)v24;

  }
  return v10;
}

- (BOOL)hasProtectedContent
{
  void *v2;
  BOOL v3;

  -[FBSceneSnapshot fallbackIOSurface](self, "fallbackIOSurface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (IOSurface)IOSurface
{
  return (IOSurface *)-[_FBSSnapshot IOSurface](self->_snapshot, "IOSurface");
}

- (CGImage)CGImage
{
  return (CGImage *)-[_FBSSnapshot CGImage](self->_snapshot, "CGImage");
}

- (BOOL)capture
{
  return -[_FBSSnapshot capture](self->_snapshot, "capture");
}

- (IOSurface)fallbackIOSurface
{
  return (IOSurface *)-[_FBSSnapshot fallbackIOSurface](self->_snapshot, "fallbackIOSurface");
}

- (id)_collectLayersToSnapshotFromScene:(id)a3 withSnapshotContext:(id)a4 rootContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  FBSceneSnapshot *v19;
  void *v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  FBSceneSnapshotContext *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  FBSceneSnapshot *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  FBSceneSnapshotContext *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v50;
  void *v51;
  id v52;
  FBSceneSnapshot *v53;
  void *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  CGAffineTransform m;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CATransform3D v68;
  CGAffineTransform v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v9;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(v8, "layerManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedSetWithOrderedSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "layersToExclude");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v17);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v18 = objc_claimAutoreleasedReturnValue();
  memset(&v69, 0, sizeof(v69));
  v53 = self;
  v54 = v12;
  v19 = self;
  v20 = (void *)v18;
  v50 = v11;
  -[FBSceneSnapshot _baseTransformForSnapshotContext:rootContext:](v19, "_baseTransformForSnapshotContext:rootContext:", v11, v12);
  memset(&v68, 0, sizeof(v68));
  m = v69;
  CATransform3DMakeAffineTransform(&v68, &m);
  v21 = 0x1E4A10000uLL;
  +[FBSceneManager keyboardScene](FBSceneManager, "keyboardScene");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v22 = v16;
  v57 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v57)
  {
    v23 = *(_QWORD *)v65;
    v52 = v22;
    v56 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v65 != v23)
          objc_enumerationMutation(v22);
        v25 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v26 = objc_msgSend(v25, "contextID");
        if ((_DWORD)v26)
        {
          v27 = v26;
          v28 = objc_alloc(MEMORY[0x1E0D232E8]);
          v60 = *(_OWORD *)&v68.m31;
          v61 = *(_OWORD *)&v68.m33;
          v62 = *(_OWORD *)&v68.m41;
          v63 = *(_OWORD *)&v68.m43;
          *(_OWORD *)&m.a = *(_OWORD *)&v68.m11;
          *(_OWORD *)&m.c = *(_OWORD *)&v68.m13;
          *(_OWORD *)&m.tx = *(_OWORD *)&v68.m21;
          v59 = *(_OWORD *)&v68.m23;
          v29 = (FBSceneSnapshotContext *)objc_msgSend(v28, "initWithContextID:baseTransform:", v27, &m);
          if (v29)
            objc_msgSend(v20, "addObject:", v29);
          goto LABEL_24;
        }
        objc_msgSend(v25, "externalSceneID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(*(id *)(v21 + 4072), "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "externalSceneID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sceneWithIdentifier:", v32);
          v29 = (FBSceneSnapshotContext *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBSceneSnapshotContext clientSettings](v29, "clientSettings");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "preferredSceneHostIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "isEqualToString:", v35))
          {

LABEL_16:
            v43 = -[FBSceneSnapshotContext initWithScene:]([FBSceneSnapshotContext alloc], "initWithScene:", v29);
            -[FBSceneSnapshot _collectLayersToSnapshotFromScene:withSnapshotContext:rootContext:](v53, "_collectLayersToSnapshotFromScene:withSnapshotContext:rootContext:", v29, v43, v54);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v56;
            if (objc_msgSend(v44, "count"))
              objc_msgSend(v20, "unionOrderedSet:", v44);

            goto LABEL_24;
          }
          objc_msgSend(v10, "identityToken");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBSceneSnapshotContext clientSettings](v29, "clientSettings");
          v39 = v20;
          v40 = v10;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "preferredSceneHostIdentity");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = BSEqualObjects();

          v22 = v52;
          v10 = v40;
          v20 = v39;
          v21 = 0x1E4A10000;

          if (v55)
            goto LABEL_16;
          v23 = v56;
LABEL_24:

          continue;
        }
        if (objc_msgSend(v25, "isKeyboardLayer"))
        {
          if (v51 != v10)
            continue;
          v29 = -[FBSceneSnapshotContext initWithScene:]([FBSceneSnapshotContext alloc], "initWithScene:", v10);
          v36 = v53;
          v37 = v10;
LABEL_22:
          -[FBSceneSnapshot _collectLayersToSnapshotFromScene:withSnapshotContext:rootContext:](v36, "_collectLayersToSnapshotFromScene:withSnapshotContext:rootContext:", v37, v29, v54);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "unionOrderedSet:", v48);

          v22 = v52;
          goto LABEL_24;
        }
        if (objc_msgSend(v25, "isKeyboardProxyLayer"))
        {
          objc_msgSend(v51, "identityToken");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "proxiedKeyboardOwner");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v45, "isEqual:", v46);

          v22 = v52;
          if (v47)
          {
            v29 = -[FBSceneSnapshotContext initWithScene:]([FBSceneSnapshotContext alloc], "initWithScene:", v51);
            v36 = v53;
            v37 = v51;
            goto LABEL_22;
          }
        }
      }
      v57 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v57);
  }

  return v20;
}

- (CGAffineTransform)_baseTransformForSnapshotContext:(SEL)a3 rootContext:(id)a4
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int IsValid;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  int IsLandscape;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  double v32;
  __int128 v33;
  __int128 v34;
  CGFloat v35;
  CGFloat v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CGFloat v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform *result;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v54;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v47 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v46;
  v45 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)&retstr->tx = v45;
  objc_msgSend(v8, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "interfaceOrientation");

  if (BSInterfaceOrientationIsValid())
    v13 = v12;
  else
    v13 = 1;
  objc_msgSend(v9, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "interfaceOrientation");

  IsValid = BSInterfaceOrientationIsValid();
  -[FBScene settings](self->_scene, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");

  objc_msgSend(v9, "frame");
  v20 = v19;
  v22 = v21;
  if (objc_msgSend(v9, "orientation"))
  {
    v23 = 1;
  }
  else
  {
    if (IsValid)
      v23 = v15;
    else
      v23 = 1;
    IsLandscape = BSInterfaceOrientationIsLandscape();
    if (IsLandscape)
      v25 = v20;
    else
      v25 = v22;
    if (IsLandscape)
      v20 = v22;
    v22 = v25;
  }
  if (v13 != v23)
  {
    objc_msgSend(v8, "settings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");

    if (v13 != 1)
      BSConvertRectFromOrientationToOrientation();
    BSRectGetCenter();
    memset(&v54, 0, sizeof(v54));
    CGAffineTransformMakeTranslation(&v54, -v27, -v28);
    *(_OWORD *)&t1.a = v47;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = v45;
    t2 = v54;
    CGAffineTransformConcat(retstr, &t1, &t2);
    if (v13 != 1)
    {
      if (v13 == 3)
      {
        v29 = 1.57079633;
      }
      else if (v13 == 4)
      {
        v29 = -1.57079633;
      }
      else
      {
        v29 = 3.14159265;
        if (v13 != 2)
          v29 = 0.0;
      }
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeRotation(&v51, v29);
      BSIntegralTransform();
      v30 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v30;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      v49 = t1;
      CGAffineTransformConcat(&t2, &v50, &v49);
      v31 = *(_OWORD *)&t2.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
      *(_OWORD *)&retstr->c = v31;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
    }
    if (v23 != 1)
    {
      if (v23 == 3)
      {
        v32 = 1.57079633;
      }
      else if (v23 == 4)
      {
        v32 = -1.57079633;
      }
      else
      {
        v32 = 3.14159265;
        if (v23 != 2)
          v32 = 0.0;
      }
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeRotation(&v48, -v32);
      BSIntegralTransform();
      v33 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v33;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      v49 = t1;
      CGAffineTransformConcat(&t2, &v50, &v49);
      v34 = *(_OWORD *)&t2.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
      *(_OWORD *)&retstr->c = v34;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
      BSConvertRectFromOrientationToOrientation();
    }
    BSRectGetCenter();
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeTranslation(&t1, v35, v36);
    v37 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v50.c = v37;
    *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
    v49 = t1;
    CGAffineTransformConcat(&t2, &v50, &v49);
    v38 = *(_OWORD *)&t2.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
    *(_OWORD *)&retstr->c = v38;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
  }
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeTranslation(&v54, -v20, -v22);
  v39 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v39;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  v50 = v54;
  CGAffineTransformConcat(&t1, &t2, &v50);
  v40 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v40;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  objc_msgSend(v9, "scale");
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t1, v41, v41);
  v42 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v50.c = v42;
  *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
  v49 = t1;
  CGAffineTransformConcat(&t2, &v50, &v49);
  v43 = *(_OWORD *)&t2.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&retstr->c = v43;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;

  return result;
}

- (FBSceneSnapshotContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end

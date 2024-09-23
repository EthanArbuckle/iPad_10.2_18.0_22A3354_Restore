@implementation _FBSSnapshot

- (_FBSSnapshot)initWithSnapshotContext:(id)a3
{
  id v4;
  _FBSSnapshot *v5;
  uint64_t v6;
  _FBSSnapshotContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FBSSnapshot;
  v5 = -[_FBSSnapshot init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (_FBSSnapshotContext *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_FBSSnapshot _doInvalidate](self, "_doInvalidate");
  v3.receiver = self;
  v3.super_class = (Class)_FBSSnapshot;
  -[_FBSSnapshot dealloc](&v3, sel_dealloc);
}

- (BOOL)hasProtectedContent
{
  void *v2;
  BOOL v3;

  -[_FBSSnapshot fallbackIOSurface](self, "fallbackIOSurface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)capture
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23___FBSSnapshot_capture__block_invoke;
  v4[3] = &unk_1E38ED520;
  v4[4] = &v5;
  -[_FBSSnapshot _synchronizedCaptureWithCompletion:](self, "_synchronizedCaptureWithCompletion:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (IOSurface)IOSurface
{
  IOSurface *protectedSurfaceRef;

  -[_FBSSnapshot _synchronizedCaptureWithCompletion:](self, "_synchronizedCaptureWithCompletion:", 0);
  protectedSurfaceRef = self->_protectedSurfaceRef;
  if (!protectedSurfaceRef)
    protectedSurfaceRef = self->_nonProtectedSurfaceRef;
  return protectedSurfaceRef;
}

- (IOSurface)fallbackIOSurface
{
  IOSurface *v3;

  -[_FBSSnapshot _synchronizedCaptureWithCompletion:](self, "_synchronizedCaptureWithCompletion:", 0);
  if (self->_protectedSurfaceRef)
    v3 = self->_nonProtectedSurfaceRef;
  else
    v3 = 0;
  return v3;
}

- (CGImage)CGImage
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23___FBSSnapshot_CGImage__block_invoke;
  v4[3] = &unk_1E38ED548;
  v4[4] = self;
  -[_FBSSnapshot _synchronizedCaptureWithCompletion:](self, "_synchronizedCaptureWithCompletion:", v4);
  return self->_imageRef;
}

- (void)invalidate
{
  _FBSSnapshot *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_FBSSnapshot _doInvalidate](obj, "_doInvalidate");
  objc_sync_exit(obj);

}

- (void)_doInvalidate
{
  IOSurface *nonProtectedSurfaceRef;
  IOSurface *protectedSurfaceRef;
  CGImage *imageRef;

  nonProtectedSurfaceRef = self->_nonProtectedSurfaceRef;
  self->_nonProtectedSurfaceRef = 0;

  protectedSurfaceRef = self->_protectedSurfaceRef;
  self->_protectedSurfaceRef = 0;

  imageRef = self->_imageRef;
  if (imageRef)
  {
    CGImageRelease(imageRef);
    self->_imageRef = 0;
  }
}

- (void)_synchronizedCaptureWithCompletion:(id)a3
{
  _FBSSnapshot *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  IOSurface *nonProtectedSurfaceRef;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t Snapshots;
  int v38;
  IOSurface *protectedSurfaceRef;
  objc_class *v40;
  void *v41;
  IOSurface *v42;
  _FBSSnapshot *v43;
  IOSurface *v44;
  IOSurface *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _FBSSnapshot *obj;
  void (**v58)(id, uint64_t);
  id v59;
  id v60;
  void *v61;
  IOSurface *v62;
  _OWORD v63[8];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[24];
  _QWORD v69[10];
  _QWORD v70[10];
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v58 = (void (**)(id, uint64_t))a3;
  v4 = self;
  objc_sync_enter(v4);
  obj = v4;
  -[_FBSSnapshotContext layers](v4->_context, "layers");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FBSSnapshotContext displayConfiguration](v4->_context, "displayConfiguration");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_OWORD *)&v4->_imageRef == 0 && !v4->_protectedSurfaceRef)
  {
    if (v55 && objc_msgSend(v56, "count"))
    {
      v6 = objc_msgSend(v56, "count");
      v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v59 = v56;
      v7 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v65 != v8)
              objc_enumerationMutation(v59);
            v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            getkCASnapshotContextId();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = v11;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "contextID"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v72[0] = v12;
            getkCASnapshotTransform();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v71[1] = v13;
            v14 = (void *)MEMORY[0x1E0CB3B18];
            if (v10)
              objc_msgSend(v10, "baseTransform");
            else
              memset(v63, 0, sizeof(v63));
            objc_msgSend(v14, "valueWithCATransform3D:", v63);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v72[1] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v61, "addObject:", v16);
          }
          v7 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        }
        while (v7);
      }

      -[_FBSSnapshot _scaledSnapshotSize](obj, "_scaledSnapshotSize");
      v18 = v17;
      v20 = v19;
      if (BSFloatGreaterThanFloat() && BSFloatGreaterThanFloat())
      {
        v21 = objc_msgSend(v55, "colorGamut");
        nonProtectedSurfaceRef = obj->_nonProtectedSurfaceRef;
        obj->_nonProtectedSurfaceRef = 0;

        getkCASnapshotMode();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v23;
        getkCASnapshotModeIncludeContextList();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v24;
        getkCASnapshotDisplayName();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v25;
        objc_msgSend(v55, "name");
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v70[1] = v60;
        getkCASnapshotContextList();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v54;
        v70[2] = v61;
        getkCASnapshotOriginX();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v53;
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v55, "bounds");
        objc_msgSend(v26, "numberWithInt:", (int)v27);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v70[3] = v52;
        getkCASnapshotOriginY();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v69[4] = v51;
        v28 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v55, "bounds");
        objc_msgSend(v28, "numberWithInt:", (int)v29);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v70[4] = v50;
        getkCASnapshotSizeWidth();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v69[5] = v49;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v70[5] = v48;
        getkCASnapshotSizeHeight();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v69[6] = v47;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v70[6] = v46;
        getkCASnapshotFormatWideGamut();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v69[7] = v30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21 == 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v70[7] = v31;
        getkCASnapshotFormatOpaque();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v69[8] = v32;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_FBSSnapshotContext isOpaque](obj->_context, "isOpaque"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v70[8] = v33;
        getkCASnapshotMapCacheAttribute();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v69[9] = v34;
        v70[9] = &unk_1E390C420;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 10);
        v35 = objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        v62 = 0;
        v36 = -[_FBSSnapshotContext allowsProtectedContent](obj->_context, "allowsProtectedContent");
        if ((_DWORD)v36)
        {
          Snapshots = soft_CARenderServerCreateSnapshots(0, (uint64_t)&v62, (uint64_t)buf, v35);
          v5 = Snapshots;
          if (*(_QWORD *)buf)
            v38 = Snapshots;
          else
            v38 = 0;
          if (v38 == 1)
          {
            protectedSurfaceRef = obj->_protectedSurfaceRef;
            obj->_protectedSurfaceRef = *(IOSurface **)buf;

          }
        }
        else
        {
          v5 = soft_CARenderServerCreateSnapshots(v36, (uint64_t)&v62, 0, v35);
        }
        if ((_DWORD)v5 && v62)
        {
          v42 = obj->_nonProtectedSurfaceRef;
          obj->_nonProtectedSurfaceRef = v62;

        }
        if ((v5 & 1) == 0)
        {
          v43 = obj;
          v44 = obj->_nonProtectedSurfaceRef;
          if (v44)
          {
            obj->_nonProtectedSurfaceRef = 0;

            v43 = obj;
          }
          v45 = v43->_protectedSurfaceRef;
          if (v45)
          {
            obj->_protectedSurfaceRef = 0;

          }
        }
      }
      else
      {
        FBLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_FBSSnapshot _synchronizedCaptureWithCompletion:].cold.1(v41, buf, v35);
        }
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }
  if (v58)
    v58[2](v58, v5);

  objc_sync_exit(obj);
}

- (double)_scale
{
  double v2;
  double v3;
  int v4;
  double result;

  -[_FBSSnapshotContext scale](self->_context, "scale");
  v3 = v2;
  v4 = BSFloatGreaterThanFloat();
  result = 1.0;
  if (v4)
    return v3;
  return result;
}

- (CGSize)_scaledSnapshotSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_FBSSnapshotContext snapshotSize](self->_context, "snapshotSize");
  v4 = v3;
  v6 = v5;
  -[_FBSSnapshot _scale](self, "_scale");
  v8 = v6 * v7;
  v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (_FBSSnapshotContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedSurfaceRef, 0);
  objc_storeStrong((id *)&self->_nonProtectedSurfaceRef, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_synchronizedCaptureWithCompletion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_19A6D4000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error: Snapshot frame is empty.", buf, 0xCu);

}

@end

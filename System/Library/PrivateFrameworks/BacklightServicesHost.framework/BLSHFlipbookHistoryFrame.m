@implementation BLSHFlipbookHistoryFrame

- (BLSHFlipbookHistoryFrame)initWithFrame:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  BLSHFlipbookHistoryFrame *v26;
  objc_super v28;

  v5 = a3;
  v6 = objc_msgSend(v5, "presentationTime");
  v7 = objc_msgSend(v5, "frameId");
  objc_msgSend(v5, "apl");
  v9 = v8;
  objc_msgSend(v5, "aplDimming");
  v11 = v10;
  v12 = objc_msgSend(v5, "memoryUsage");
  objc_msgSend(v5, "rawSurfaceFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v5, "isInverted");
  objc_msgSend(v5, "bls_specifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bls_uuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)BLSHFlipbookHistoryFrame;
  LODWORD(v24) = v9;
  LODWORD(v25) = v11;
  v26 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](&v28, sel_initWithPresentationTime_frameId_apl_aplDimming_memoryUsage_rawSurfaceFrameRect_inverted_specifier_uuid_, v6, v7, v12, v21, v22, v23, v24, v25, v14, v16, v18, v20);

  if (v26)
  {
    v26->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v26->_hostFrame, v5);
    objc_storeStrong((id *)&v26->_lock_retainedHostFrame, a3);
  }

  return v26;
}

- (BOOL)isRetainingSurface
{
  BLSHFlipbookHistoryFrame *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_retainedHostFrame != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)retainedMemoryUsage
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BLSHRenderedFlipbookFrame memoryUsage](self->_lock_retainedHostFrame, "memoryUsage");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)stopRetainingSurface
{
  os_unfair_lock_s *p_lock;
  BLSHRenderedFlipbookFrame *lock_retainedHostFrame;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_retainedHostFrame = self->_lock_retainedHostFrame;
  self->_lock_retainedHostFrame = 0;

  os_unfair_lock_unlock(p_lock);
}

- (__IOSurface)surface
{
  id WeakRetained;
  __IOSurface *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostFrame);
  v3 = (__IOSurface *)objc_msgSend(WeakRetained, "surface");

  return v3;
}

- (__IOSurface)rawSurface
{
  id WeakRetained;
  __IOSurface *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostFrame);
  v3 = (__IOSurface *)objc_msgSend(WeakRetained, "rawSurface");

  return v3;
}

- (BLSHRenderedFlipbookFrame)hostFrame
{
  return (BLSHRenderedFlipbookFrame *)objc_loadWeakRetained((id *)&self->_hostFrame);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostFrame);
  objc_storeStrong((id *)&self->_lock_retainedHostFrame, 0);
}

@end

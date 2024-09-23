@implementation BCUImageRenderContext

- (BCUImageRenderContext)init
{
  return (BCUImageRenderContext *)MEMORY[0x24BEDD108](self, sel_initWithMode_);
}

- (BCUImageRenderContext)initWithMode:(unint64_t)a3
{
  BCUImageRenderContext *v4;
  BCULayerRenderer *v5;
  BCULayerRenderer *renderer;
  BCUCoverEffects *v7;
  BCUCoverEffects *coverEffects;
  uint64_t v9;
  NSHashTable *filterOperations;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCUImageRenderContext;
  v4 = -[BCUImageRenderContext init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(BCULayerRenderer);
    renderer = v4->_renderer;
    v4->_renderer = v5;

    v7 = -[BCUCoverEffects initWithRenderer:mode:]([BCUCoverEffects alloc], "initWithRenderer:mode:", v4->_renderer, a3);
    coverEffects = v4->_coverEffects;
    v4->_coverEffects = v7;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    filterOperations = v4->_filterOperations;
    v4->_filterOperations = (NSHashTable *)v9;

    v4->_accessLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)filteredImageFromImage:(CGImage *)a3 filterInfo:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 completion:(id)a7
{
  MEMORY[0x24BEDD108](self, sel_filteredImageFromImage_filterInfo_size_contentsScale_waitForCPUSynchronization_logKey_completion_);
}

- (void)filteredImageFromImage:(CGImage *)a3 filterInfo:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 waitForCPUSynchronization:(BOOL)a7 logKey:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  double height;
  double width;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  os_unfair_lock_s *p_accessLock;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  BCUImageRenderContext *v31;
  id v32;
  _QWORD v33[5];
  id v34;

  v10 = a7;
  height = a5.height;
  width = a5.width;
  v17 = a8;
  v18 = a9;
  +[BCUCoverEffects effectIdentifierForFilterInfo:](BCUCoverEffects, "effectIdentifierForFilterInfo:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[BCUImageRenderContext coverEffects](self, "coverEffects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bookCoverEffectFilterForEffectIdentifier:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = sub_22858401C;
    v33[3] = &unk_24F1140B0;
    v33[4] = self;
    v34 = v18;
    LODWORD(v23) = 1056964608;
    v24 = (void *)objc_msgSend(v21, "newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:", a3, 0, v10, v17, v33, width, height, a6, v23);
    p_accessLock = &self->_accessLock;
    v27 = v22;
    v28 = 3221225472;
    v29 = sub_228584158;
    v30 = &unk_24F114088;
    v31 = self;
    v32 = v24;
    v26 = v24;
    os_unfair_lock_lock_with_options();
    sub_228584158((uint64_t)&v27);
    os_unfair_lock_unlock(p_accessLock);
    objc_msgSend(v26, "start", v27, v28);

  }
  else
  {
    (*((void (**)(id, _QWORD, double, double, double, double))v18 + 2))(v18, 0, 0.0, 0.0, 0.0, 0.0);
  }

}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (BCUCoverEffects)coverEffects
{
  return self->_coverEffects;
}

- (NSHashTable)filterOperations
{
  return self->_filterOperations;
}

- (void)setFilterOperations:(id)a3
{
  objc_storeStrong((id *)&self->_filterOperations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOperations, 0);
  objc_storeStrong((id *)&self->_coverEffects, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end

@implementation MPConcreteMediaItemArtwork

- (MPConcreteMediaItemArtwork)initWithArtworkCatalog:(id)a3 allowsNetworking:(BOOL)a4
{
  id v7;
  id v8;
  MPConcreteMediaItemArtwork *v9;
  MPConcreteMediaItemArtwork *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v7 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke;
  v13[3] = &unk_1E3157698;
  v8 = v7;
  v14 = v8;
  v15 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPConcreteMediaItemArtwork;
  v9 = -[MPMediaItemArtwork initWithBoundsSize:requestHandler:](&v12, sel_initWithBoundsSize_requestHandler_, v13, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_catalog, a3);

  return v10;
}

- (MPConcreteMediaItemArtwork)initWithArtworkCatalog:(id)a3
{
  return -[MPConcreteMediaItemArtwork initWithArtworkCatalog:allowsNetworking:](self, "initWithArtworkCatalog:allowsNetworking:", a3, 0);
}

- (CGRect)bounds
{
  CGRect *p_bounds;
  MPArtworkCatalog *catalog;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_bounds = &self->_bounds;
  if (CGRectEqualToRect(self->_bounds, *MEMORY[0x1E0C9D648]))
  {
    -[MPArtworkCatalog setFittingSize:](self->_catalog, "setFittingSize:", MPArtworkCatalogOriginalSize);
    catalog = self->_catalog;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    -[MPArtworkCatalog setDestinationScale:](catalog, "setDestinationScale:");

    -[MPArtworkCatalog bestImageFromDisk](self->_catalog, "bestImageFromDisk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "size");
      p_bounds->origin = (CGPoint)*MEMORY[0x1E0C9D538];
      p_bounds->size.width = v8;
      p_bounds->size.height = v9;
    }

  }
  x = p_bounds->origin.x;
  y = p_bounds->origin.y;
  width = p_bounds->size.width;
  height = p_bounds->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_catalog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
}

id __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "setFittingSize:");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "setDestinationScale:");

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19541;
  v18 = __Block_byref_object_dispose__19542;
  v19 = 0;
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40) && v4)
  {
    v5 = dispatch_semaphore_create(0);
    v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke_2;
    v11[3] = &unk_1E3157670;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "requestImageWithCompletion:", v11);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    objc_msgSend(v4, "bestImageFromDisk");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v15[5];
    v15[5] = v8;
  }

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end

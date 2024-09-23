@implementation MKMapSnapshotView

- (MKMapSnapshotView)initWithFrame:(CGRect)a3
{
  MKMapSnapshotView *v3;
  MKMapSnapshotView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKMapSnapshotView;
  v3 = -[MKMapSnapshotView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKMapSnapshotView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[MKMapSnapshotView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKMapSnapshotView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[MKMapSnapshotView setContentMode:](v4, "setContentMode:", 4);
  }
  return v4;
}

- (void)takeSnapshotWithOptions:(id)a3 gridOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MKMapSnapshotter *gridSnapshotter;
  MKMapSnapshotter *snapshotter;
  uint64_t v13;
  MKMapSnapshotter *v14;
  MKMapSnapshotter *v15;
  MKMapSnapshotter *v16;
  MKMapSnapshotter *v17;
  MKMapSnapshotter *v18;
  MKMapSnapshotter *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  id v28;
  id location;
  _QWORD v30[3];
  char v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MKMapSnapshotter cancel](self->_gridSnapshotter, "cancel");
  gridSnapshotter = self->_gridSnapshotter;
  self->_gridSnapshotter = 0;

  -[MKMapSnapshotter cancel](self->_snapshotter, "cancel");
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v13 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v14 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", v9);
    v15 = self->_gridSnapshotter;
    self->_gridSnapshotter = v14;

    objc_initWeak(&location, self);
    v16 = self->_gridSnapshotter;
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke;
    v25[3] = &unk_1E20DF8F8;
    v27 = v30;
    objc_copyWeak(&v28, &location);
    v26 = v10;
    -[MKMapSnapshotter startWithCompletionHandler:](v16, "startWithCompletionHandler:", v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    v13 = MEMORY[0x1E0C809B0];
  }
  v17 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", v8);
  v18 = self->_snapshotter;
  self->_snapshotter = v17;

  objc_initWeak(&location, self);
  v19 = self->_snapshotter;
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke_2;
  v21[3] = &unk_1E20DF8F8;
  objc_copyWeak(&v24, &location);
  v23 = v30;
  v20 = v10;
  v22 = v20;
  -[MKMapSnapshotter startWithCompletionHandler:](v19, "startWithCompletionHandler:", v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(v30, 8);

}

void __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!v12 || v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "setImage:", 0);
    }
    else
    {
      objc_msgSend(v12, "image");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v7, "setImage:", WeakRetained);

    }
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)*((_QWORD *)v9 + 65);
      *((_QWORD *)v9 + 65) = 0;

    }
  }

}

void __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v12 || v5)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v9, "setImage:", 0);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(v12, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v8, "setImage:", v7);

      objc_msgSend(WeakRetained[65], "cancel");
    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
    v11 = WeakRetained[64];
    WeakRetained[64] = 0;

  }
}

- (void)cancel
{
  MKMapSnapshotter *gridSnapshotter;
  MKMapSnapshotter *snapshotter;

  gridSnapshotter = self->_gridSnapshotter;
  if (gridSnapshotter)
    -[MKMapSnapshotter cancel](gridSnapshotter, "cancel");
  snapshotter = self->_snapshotter;
  if (snapshotter)
    -[MKMapSnapshotter cancel](snapshotter, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSnapshotter, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

@end

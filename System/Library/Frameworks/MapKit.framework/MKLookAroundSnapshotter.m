@implementation MKLookAroundSnapshotter

- (MKLookAroundSnapshotter)initWithScene:(MKLookAroundScene *)scene options:(MKLookAroundSnapshotOptions *)options
{
  MKLookAroundScene *v6;
  MKLookAroundSnapshotOptions *v7;
  MKLookAroundSnapshotter *v8;
  void *v9;
  void *v10;
  MKMapSnapshotter *v11;
  MKMapSnapshotter *snapshotter;
  objc_super v14;

  v6 = scene;
  v7 = options;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundSnapshotter;
  v8 = -[MKLookAroundSnapshotter init](&v14, sel_init);
  if (v8)
  {
    -[MKLookAroundSnapshotOptions _options](v7, "_options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKMapCamera _cameraLookingAtScene:](MKMapCamera, "_cameraLookingAtScene:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCamera:", v10);

    v11 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", v9);
    snapshotter = v8->_snapshotter;
    v8->_snapshotter = v11;

  }
  return v8;
}

- (void)getSnapshotWithCompletionHandler:(void *)completionHandler
{
  id v4;
  MKMapSnapshotter *snapshotter;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = completionHandler;
  snapshotter = self->_snapshotter;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MKLookAroundSnapshotter_getSnapshotWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E20DC400;
  v8 = v4;
  v6 = v4;
  -[MKMapSnapshotter startWithCompletionHandler:](snapshotter, "startWithCompletionHandler:", v7);

}

void __60__MKLookAroundSnapshotter_getSnapshotWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  MKLookAroundSnapshot *v7;
  uint64_t v8;
  MKLookAroundSnapshot *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (v12)
  {
    v7 = -[MKLookAroundSnapshot initWithSnapshot:]([MKLookAroundSnapshot alloc], "initWithSnapshot:", v12);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = -[MKLookAroundSnapshot initWithSnapshot:]([MKLookAroundSnapshot alloc], "initWithSnapshot:", v12);
    (*(void (**)(uint64_t, MKLookAroundSnapshot *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v5);
      goto LABEL_6;
    }
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (MKLookAroundSnapshot *)objc_msgSend(v11, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    (*(void (**)(uint64_t, _QWORD, MKLookAroundSnapshot *))(v10 + 16))(v10, 0, v7);
  }

LABEL_6:
}

- (void)cancel
{
  -[MKMapSnapshotter cancel](self->_snapshotter, "cancel");
}

- (BOOL)isLoading
{
  return -[MKMapSnapshotter isLoading](self->_snapshotter, "isLoading");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

@end

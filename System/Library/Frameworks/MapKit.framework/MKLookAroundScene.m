@implementation MKLookAroundScene

- (MKLookAroundScene)initWithMapItem:(id)a3
{
  return -[MKLookAroundScene initWithMapItem:cameraFrameOverride:](self, "initWithMapItem:cameraFrameOverride:", a3, 0);
}

- (MKLookAroundScene)initWithMapItem:(id)a3 cameraFrameOverride:(id)a4
{
  id v7;
  id v8;
  MKLookAroundScene *v9;
  MKLookAroundScene *v10;
  uint64_t v11;
  GEOCameraFrame *cameraFrameOverride;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundScene;
  v9 = -[MKLookAroundScene init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_storeStrong((id *)&v9->_mapItem, a3);
    v11 = objc_msgSend(v8, "copy");
    cameraFrameOverride = v10->_cameraFrameOverride;
    v10->_cameraFrameOverride = (GEOCameraFrame *)v11;

  }
  return v10;
}

- (MKLookAroundScene)initWithMuninViewState:(id)a3
{
  id v4;
  MKLookAroundScene *v5;
  MKLookAroundScene *v6;
  uint64_t v7;
  GEOMuninViewState *muninViewState;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKLookAroundScene;
  v5 = -[MKLookAroundScene init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    v7 = objc_msgSend(v4, "copy");
    muninViewState = v6->_muninViewState;
    v6->_muninViewState = (GEOMuninViewState *)v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 16) = self->_type;
  objc_storeStrong((id *)(v4 + 40), self->_mapItem);
  v5 = -[GEOCameraFrame copy](self->_cameraFrameOverride, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[GEOMuninViewState copy](self->_muninViewState, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  *(_BYTE *)(v4 + 8) = self->_wantsCloseUpView;
  return (id)v4;
}

- (unint64_t)_type
{
  return self->_type;
}

- (GEOCameraFrame)_cameraFrameOverride
{
  return self->_cameraFrameOverride;
}

- (GEOMuninViewState)_muninViewState
{
  return self->_muninViewState;
}

- (BOOL)_wantsCloseUpView
{
  return self->_wantsCloseUpView;
}

- (void)_setWantsCloseUpView:(BOOL)a3
{
  self->_wantsCloseUpView = a3;
}

- (MKMapItem)_mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_cameraFrameOverride, 0);
}

@end

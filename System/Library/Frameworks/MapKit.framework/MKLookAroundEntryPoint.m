@implementation MKLookAroundEntryPoint

- (MKLookAroundEntryPoint)init
{
  MKLookAroundEntryPoint *v2;
  MKLookAroundEntryPoint *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundEntryPoint;
  v2 = -[MKLookAroundEntryPoint init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKLookAroundEntryPoint setTriggerAction:](v2, "setTriggerAction:", 0);
  return v3;
}

+ (id)entryPointWithMapItem:(id)a3
{
  return (id)objc_msgSend(a1, "entryPointWithMapItem:wantsCloseUpView:", a3, 0);
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4
{
  return (id)objc_msgSend(a1, "entryPointWithMapItem:wantsCloseUpView:cameraFrameOverride:", a3, a4, 0);
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init((Class)objc_opt_class());
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setType:", 0);
    objc_msgSend(v10, "setMapItem:", v7);
    objc_msgSend(v10, "setWantsCloseUpView:", v6);
    objc_msgSend(v10, "setCameraFrameOverride:", v8);
  }

  return v10;
}

+ (id)entryPointWithMuninMarker:(id)a3 heading:(double)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setType:", 1);
    objc_msgSend(v7, "setMuninMarker:", v5);
    objc_msgSend(v7, "setHeading:", a4);
  }

  return v7;
}

+ (id)entryPointWithMuninViewState:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setType:", 2);
    objc_msgSend(v5, "setMuninViewState:", v3);
  }

  return v5;
}

+ (id)entryPointWithScene:(id)a3 wantsCloseUpView:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "_mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryPointWithMapItem:wantsCloseUpView:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryPointWithMapItem:(id)a3 triggerAction:(int)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a1, "entryPointWithMapItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerAction:", v4);
  return v5;
}

+ (id)entryPointWithMuninViewState:(id)a3 triggerAction:(int)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a1, "entryPointWithMuninViewState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerAction:", v4);
  return v5;
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 triggerAction:(int)a5
{
  return (id)objc_msgSend(a1, "entryPointWithMapItem:wantsCloseUpView:cameraFrameOverride:triggerAction:", a3, 0, 0, *(_QWORD *)&a5);
}

+ (id)entryPointWithMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5 triggerAction:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  id v10;
  void *v11;

  v6 = *(_QWORD *)&a6;
  v7 = a4;
  v10 = a5;
  objc_msgSend(a1, "entryPointWithMapItem:wantsCloseUpView:", a3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCameraFrameOverride:", v10);

  objc_msgSend(v11, "setTriggerAction:", v6);
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (BOOL)wantsCloseUpView
{
  return self->_wantsCloseUpView;
}

- (void)setWantsCloseUpView:(BOOL)a3
{
  self->_wantsCloseUpView = a3;
}

- (VKMuninMarker)muninMarker
{
  return self->_muninMarker;
}

- (void)setMuninMarker:(id)a3
{
  objc_storeStrong((id *)&self->_muninMarker, a3);
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (void)setMuninViewState:(id)a3
{
  objc_storeStrong((id *)&self->_muninViewState, a3);
}

- (int)triggerAction
{
  return self->_triggerAction;
}

- (void)setTriggerAction:(int)a3
{
  self->_triggerAction = a3;
}

- (GEOCameraFrame)cameraFrameOverride
{
  return self->_cameraFrameOverride;
}

- (void)setCameraFrameOverride:(id)a3
{
  objc_storeStrong((id *)&self->_cameraFrameOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFrameOverride, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_muninMarker, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end

@implementation NTKAstronomyRichComplicationContentView

- (id)initForDevice:(id)a3 family:(int64_t)a4 diameter:(double)a5
{
  id v9;
  NTKAstronomyRichComplicationContentView *v10;
  NTKAstronomyRichComplicationContentView *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NUNIAstronomyVistaView *astronomyVistaView;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKAstronomyRichComplicationContentView;
  v10 = -[NTKAstronomyRichComplicationContentView init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_family = a4;
    v12 = objc_alloc(MEMORY[0x1E0D518D0]);
    objc_msgSend(MEMORY[0x1E0D518C8], "defaultConfigurationWithDevice:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithFrame:configuration:", v13, 0.0, 0.0, a5, a5);
    astronomyVistaView = v11->_astronomyVistaView;
    v11->_astronomyVistaView = (NUNIAstronomyVistaView *)v14;

    -[NUNIAstronomyVistaView setObserver:](v11->_astronomyVistaView, "setObserver:", v11);
    -[NTKAstronomyRichComplicationContentView addSubview:](v11, "addSubview:", v11->_astronomyVistaView);
    -[NUNIAstronomyVistaView setOpaque:](v11->_astronomyVistaView, "setOpaque:", 0);
    *((_BYTE *)v11 + 472) |= 1u;
  }

  return v11;
}

- (void)applyPausedUpdate:(BOOL)a3
{
  *((_BYTE *)self + 472) = *((_BYTE *)self + 472) & 0xFE | a3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  NUNIAstronomyLocationDot *locationDot;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyRichComplicationContentView;
  -[NTKAstronomyRichComplicationContentView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = -[NTKAstronomyRichComplicationContentView bounds](self, "bounds");
  locationDot = self->_locationDot;
  MEMORY[0x1BCCA72B8](v3);
  -[NUNIAstronomyLocationDot setCenter:](locationDot, "setCenter:");
}

- (void)_hideLocationDot
{
  -[NUNIAstronomyLocationDot stopAnimation](self->_locationDot, "stopAnimation");
  -[NUNIAstronomyLocationDot setAlpha:](self->_locationDot, "setAlpha:", 0.0);
  -[NUNIAstronomyLocationDot removeFromSuperview](self->_locationDot, "removeFromSuperview");
}

- (void)handleTemplateMetadata:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  NSDate *v9;
  NSDate *timelineDate;
  CLLocation *v11;
  CLLocation *currentLocation;
  CLLocation *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  CLLocation *v19;
  char v21;
  _QWORD aBlock[4];
  id v23[2];
  id location;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vista"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entry date"));
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timelineDate = self->_timelineDate;
  self->_timelineDate = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("current location"));
  v11 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  currentLocation = self->_currentLocation;
  self->_currentLocation = v11;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("any location"));
  v13 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  -[NUNIAstronomyVistaView scene](self->_astronomyVistaView, "scene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (v8 == 2)
    {
      if (self->_family == 12)
        v15 = 16499712;
      else
        v15 = 771072;
    }
    else if (v8 == 1)
    {
      v15 = 24;
    }
    else
    {
      v15 = 8;
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__NTKAstronomyRichComplicationContentView_handleTemplateMetadata_reason___block_invoke;
    aBlock[3] = &unk_1E6BD57B8;
    objc_copyWeak(v23, &location);
    v23[1] = (id)v8;
    v16 = _Block_copy(aBlock);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D518E0]), "initWithSphereoids:currentDateBlock:", v15, v16);
    objc_msgSend(v14, "setBackgroundType:", 1);
    objc_msgSend(v14, "setCollectionType:", self->_family != 12);
    -[NUNIAstronomyVistaView setScene:](self->_astronomyVistaView, "setScene:", v14);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
  -[NUNIAstronomyVistaView applyVista:transitionStyle:](self->_astronomyVistaView, "applyVista:transitionStyle:", v8, 0);
  self->_vista = v8;
  -[NTKAstronomyRichComplicationContentView _startAnimating](self, "_startAnimating");
  v17 = -[NTKAstronomyRichComplicationContentView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", a4);
  if ((unint64_t)a4 > 1 || !self->_currentLocation || (_DWORD)v8)
  {
    -[NTKAstronomyRichComplicationContentView _hideLocationDot](self, "_hideLocationDot");
    if ((_DWORD)v8)
      goto LABEL_21;
  }
  else if (self->_editing)
  {
    -[NTKAstronomyRichComplicationContentView _hideLocationDot](self, "_hideLocationDot");
  }
  else
  {
    -[NTKAstronomyRichComplicationContentView _showLocationDot](self, "_showLocationDot");
  }
  -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_currentLocation;
  if (!v19)
    v19 = v13;
  -[CLLocation coordinate](v19, "coordinate");
  objc_msgSend(v18, "setHomeCoordinate:");
  objc_msgSend(v18, "homeCoordinate");
  objc_msgSend(v18, "setCenterCoordinate:animated:", v17);

LABEL_21:
  -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_astronomyVistaView, "updateSunLocationAnimated:", v17);
  -[NTKAstronomyRichComplicationContentView setNeedsLayout](self, "setNeedsLayout");
  if ((*((_BYTE *)self + 472) & 1) == 0 || v17)
    v21 = 0;
  else
    v21 = 4;
  *((_BYTE *)self + 472) = v21 | *((_BYTE *)self + 472) & 0xFB;

}

id __73__NTKAstronomyRichComplicationContentView_handleTemplateMetadata_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 58);
    if (!v4 || *(_QWORD *)(a1 + 40))
      v4 = (void *)*((_QWORD *)WeakRetained + 57);
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)astronomyVistaViewWillDisplay:(id)a3 forTime:(double)a4
{
  if ((*((_BYTE *)self + 472) & 4) != 0)
    -[NTKAstronomyRichComplicationContentView _stopAnimating](self, "_stopAnimating", a3, a4);
}

- (void)_startAnimating
{
  NTKDelayedBlock *v3;
  NTKDelayedBlock *v4;
  NTKDelayedBlock *stopAnimationDelayedBlock;
  _QWORD v6[4];
  id v7;
  id location;

  if ((*((_BYTE *)self + 472) & 2) == 0)
  {
    *((_BYTE *)self + 472) |= 2u;
    *((_BYTE *)self + 472) &= ~4u;
    -[NUNIAstronomyVistaView startAnimation](self->_astronomyVistaView, "startAnimation");
  }
  -[NTKDelayedBlock cancel](self->_stopAnimationDelayedBlock, "cancel");
  objc_initWeak(&location, self);
  v3 = [NTKDelayedBlock alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NTKAstronomyRichComplicationContentView__startAnimating__block_invoke;
  v6[3] = &unk_1E6BCE148;
  objc_copyWeak(&v7, &location);
  v4 = -[NTKDelayedBlock initWithDelay:action:](v3, "initWithDelay:action:", v6, 1.0);
  stopAnimationDelayedBlock = self->_stopAnimationDelayedBlock;
  self->_stopAnimationDelayedBlock = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__NTKAstronomyRichComplicationContentView__startAnimating__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopAnimating");

}

- (void)_stopAnimating
{
  if ((*((_BYTE *)self + 472) & 2) != 0)
  {
    *((_BYTE *)self + 472) &= ~2u;
    -[NUNIAstronomyVistaView stopAnimation](self->_astronomyVistaView, "stopAnimation");
  }
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)prepareWristRaiseAnimation
{
  CLLocationCoordinate2D v2;
  id v3;

  if (!self->_vista)
  {
    -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = CLLocationCoordinate2DMake(0.0, 0.0);
    objc_msgSend(v3, "setCenterCoordinate:animated:", 0, v2.latitude, v2.longitude);

  }
}

- (void)handleOrdinaryScreenWake
{
  id v3;

  if (!self->_vista)
  {
    -[NTKAstronomyRichComplicationContentView _startAnimating](self, "_startAnimating");
    -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeCoordinate");
    objc_msgSend(v3, "setCenterCoordinate:animated:", 1);

  }
}

- (void)handleWristRaiseScreenWake
{
  id v3;

  if (!self->_vista)
  {
    -[NTKAstronomyRichComplicationContentView _startAnimating](self, "_startAnimating");
    -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "homeCoordinate");
    objc_msgSend(v3, "setCenterCoordinate:animated:", 1);

  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[NUNIAstronomyVistaView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_astronomyVistaView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v7 = a3;
  -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_astronomyVistaView, "updateSunLocationAnimated:", v4);

}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_stopAnimationDelayedBlock, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_timelineDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_locationDot, 0);
  objc_storeStrong((id *)&self->_astronomyVistaView, 0);
}

@end

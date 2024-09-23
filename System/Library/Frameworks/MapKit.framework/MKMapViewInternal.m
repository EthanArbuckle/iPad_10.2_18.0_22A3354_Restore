@implementation MKMapViewInternal

- (void)startEffects
{
  MKMapView **p_view;
  _QWORD *WeakRetained;
  uint64_t v4;
  id v5;

  p_view = &self->view;
  WeakRetained = objc_loadWeakRetained((id *)&self->view);
  v4 = WeakRetained[68];

  if (!v4)
  {
    v5 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v5, "_updateShouldDisplayEffects");

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->view);
}

@end

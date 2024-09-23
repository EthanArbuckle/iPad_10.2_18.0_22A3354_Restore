@implementation MKMapViewLabelMarkerState

+ (id)stateForLabelMarker:(id)a3
{
  id v3;
  MKMapViewLabelMarkerState *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(MKMapViewLabelMarkerState);
    -[MKMapViewLabelMarkerState setVisible:](v4, "setVisible:", objc_msgSend(v3, "isVisible"));
    v5 = objc_msgSend(v3, "pickedLabelBalloonBehavior");

    -[MKMapViewLabelMarkerState setBalloonBehavior:](v4, "setBalloonBehavior:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (unsigned)balloonBehavior
{
  return self->_balloonBehavior;
}

- (void)setBalloonBehavior:(unsigned __int8)a3
{
  self->_balloonBehavior = a3;
}

@end

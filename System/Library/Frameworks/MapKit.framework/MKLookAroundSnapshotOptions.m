@implementation MKLookAroundSnapshotOptions

- (MKLookAroundSnapshotOptions)init
{
  MKLookAroundSnapshotOptions *v2;
  MKMapSnapshotOptions *v3;
  MKMapSnapshotOptions *options;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundSnapshotOptions;
  v2 = -[MKLookAroundSnapshotOptions init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKMapSnapshotOptions);
    options = v2->_options;
    v2->_options = v3;

    -[MKMapSnapshotOptions setMapType:](v2->_options, "setMapType:", 107);
  }
  return v2;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return -[MKMapSnapshotOptions pointOfInterestFilter](self->_options, "pointOfInterestFilter");
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  -[MKMapSnapshotOptions setPointOfInterestFilter:](self->_options, "setPointOfInterestFilter:", pointOfInterestFilter);
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[MKMapSnapshotOptions size](self->_options, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)size
{
  -[MKMapSnapshotOptions setSize:](self->_options, "setSize:", size.width, size.height);
}

- (UITraitCollection)traitCollection
{
  return -[MKMapSnapshotOptions traitCollection](self->_options, "traitCollection");
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  -[MKMapSnapshotOptions setTraitCollection:](self->_options, "setTraitCollection:", traitCollection);
}

- (MKMapSnapshotOptions)_options
{
  return self->_options;
}

- (void)_setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end

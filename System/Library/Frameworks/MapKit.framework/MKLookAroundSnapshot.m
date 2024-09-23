@implementation MKLookAroundSnapshot

- (MKLookAroundSnapshot)initWithSnapshot:(id)a3
{
  id v5;
  MKLookAroundSnapshot *v6;
  MKLookAroundSnapshot *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundSnapshot;
  v6 = -[MKLookAroundSnapshot init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_snapshot, a3);

  return v7;
}

- (UIImage)image
{
  return -[MKMapSnapshot image](self->_snapshot, "image");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end

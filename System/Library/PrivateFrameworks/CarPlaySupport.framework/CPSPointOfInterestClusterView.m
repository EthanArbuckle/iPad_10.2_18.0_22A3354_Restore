@implementation CPSPointOfInterestClusterView

- (CPSPointOfInterestClusterView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  CPSPointOfInterestClusterView *v4;
  CPSPointOfInterestClusterView *v6;
  CPSPointOfInterestClusterView *v8;
  objc_super v9;
  id v10;
  id location[2];
  CPSPointOfInterestClusterView *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSPointOfInterestClusterView;
  v8 = -[MKMarkerAnnotationView initWithAnnotation:reuseIdentifier:](&v9, sel_initWithAnnotation_reuseIdentifier_, location[0], v10);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
    -[CPSPointOfInterestClusterView _configure](v12, "_configure");
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPointOfInterestClusterView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointOfInterestClusterView;
  -[CPSPointOfInterestClusterView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSPointOfInterestClusterView update](v5, "update");
  objc_storeStrong(location, 0);
}

- (void)setAnnotation:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPointOfInterestClusterView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointOfInterestClusterView;
  -[MKMarkerAnnotationView setAnnotation:](&v3, sel_setAnnotation_, location[0]);
  -[CPSPointOfInterestClusterView update](v5, "update");
  objc_storeStrong(location, 0);
}

- (void)prepareForDisplay
{
  objc_super v2;
  SEL v3;
  CPSPointOfInterestClusterView *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointOfInterestClusterView;
  -[MKMarkerAnnotationView prepareForDisplay](&v2, sel_prepareForDisplay);
  -[CPSPointOfInterestClusterView _configure](v4, "_configure");
}

- (void)prepareForReuse
{
  objc_super v2;
  SEL v3;
  CPSPointOfInterestClusterView *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointOfInterestClusterView;
  -[MKMarkerAnnotationView prepareForReuse](&v2, sel_prepareForReuse);
  -[CPSPointOfInterestClusterView _configure](v4, "_configure");
}

- (void)update
{
  void *v2;
  id v3;
  MKAnnotation *v4;
  id v5;
  id v6;
  id v7;
  id v8[2];
  CPSPointOfInterestClusterView *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[MKAnnotationView annotation](self, "annotation");
  v3 = (id)-[MKAnnotation memberAnnotations](v4, "memberAnnotations");
  v8[0] = (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v3, "count"));

  v5 = v8[0];
  v7 = (id)-[CPSPointOfInterestClusterView traitCollection](v9, "traitCollection");
  v6 = +[CPSPointOfInterestAnnotationView balloonWithText:traitCollection:](CPSPointOfInterestAnnotationView, "balloonWithText:traitCollection:", v5);
  -[MKAnnotationView setImage:](v9, "setImage:");

  objc_storeStrong(v8, 0);
}

- (void)_configure
{
  double v2;
  id v3;
  id v4;

  -[MKAnnotationView setCollisionMode:](self, "setCollisionMode:");
  -[MKAnnotationView setCanShowCallout:](self, "setCanShowCallout:", 0);
  LODWORD(v2) = 1148846080;
  -[MKAnnotationView setDisplayPriority:](self, "setDisplayPriority:", v2);
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  -[MKMarkerAnnotationView setMarkerTintColor:](self, "setMarkerTintColor:");

  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  -[MKMarkerAnnotationView setGlyphTintColor:](self, "setGlyphTintColor:");

  -[MKMarkerAnnotationView setTitleVisibility:](self, "setTitleVisibility:", 1);
  -[MKMarkerAnnotationView setSubtitleVisibility:](self, "setSubtitleVisibility:", 1);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CPSPointOfInterestClusterView *v10;
  BOOL v11;
  objc_super v12;
  BOOL v13;
  BOOL v14;
  SEL v15;
  CPSPointOfInterestClusterView *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPSPointOfInterestClusterView;
  -[MKAnnotationView setSelected:animated:](&v12, sel_setSelected_animated_, a3, a4);
  v4 = (void *)MEMORY[0x24BDF6F90];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __54__CPSPointOfInterestClusterView_setSelected_animated___block_invoke;
  v9 = &unk_24E26FF88;
  v11 = v14;
  v10 = v16;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", 0.300000012);
  objc_storeStrong((id *)&v10, 0);
}

uint64_t __54__CPSPointOfInterestClusterView_setSelected_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BYTE v5[48];
  _BYTE v6[48];
  _BYTE __dst[48];
  CGAffineTransform v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    CGAffineTransformMakeScale(&v8, 1.5, 1.5);
    v3 = *(void **)(a1 + 32);
    memcpy(__dst, &v8, sizeof(__dst));
    return objc_msgSend(v3, "setTransform:", __dst);
  }
  else
  {
    memcpy(v6, MEMORY[0x24BDBD8B8], sizeof(v6));
    v2 = *(void **)(a1 + 32);
    memcpy(v5, v6, sizeof(v5));
    return objc_msgSend(v2, "setTransform:", v5);
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end

@implementation CPSPointOfInterestAnnotationView

- (CPSPointOfInterestAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  CPSPointOfInterestAnnotationView *v4;
  CPSPointOfInterestAnnotationView *v6;
  id v7;
  CPSPointOfInterestAnnotationView *v9;
  objc_super v10;
  id v11;
  id location[2];
  CPSPointOfInterestAnnotationView *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)CPSPointOfInterestAnnotationView;
  v9 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v10, sel_initWithAnnotation_reuseIdentifier_, location[0], v11);
  v13 = v9;
  objc_storeStrong((id *)&v13, v9);
  if (v9)
  {
    v7 = -[CPSPointOfInterestAnnotationView _defaultPOI](v13, "_defaultPOI");
    -[MKAnnotationView setImage:](v13, "setImage:");

    -[CPSPointOfInterestAnnotationView _configure](v13, "_configure");
  }
  v6 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPointOfInterestAnnotationView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointOfInterestAnnotationView;
  -[CPSPointOfInterestAnnotationView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSPointOfInterestAnnotationView _updateImage](v5, "_updateImage");
  objc_storeStrong(location, 0);
}

- (void)setImageSet:(id)a3
{
  id location[2];
  CPSPointOfInterestAnnotationView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[CPImageSet isEqual:](v4->_imageSet, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_imageSet, location[0]);
    -[CPSPointOfInterestAnnotationView _updateImage](v4, "_updateImage");
  }
  objc_storeStrong(location, 0);
}

- (void)setSelectedImageSet:(id)a3
{
  id location[2];
  CPSPointOfInterestAnnotationView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[CPImageSet isEqual:](v4->_selectedImageSet, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_selectedImageSet, location[0]);
    -[CPSPointOfInterestAnnotationView _updateImage](v4, "_updateImage");
  }
  objc_storeStrong(location, 0);
}

- (void)_updateImage
{
  id v2;
  id v3;
  CPImageSet *v4;
  CPImageSet *v5;
  id v6;
  id v7;
  CPImageSet *v8;
  CPImageSet *v9;

  if (-[MKAnnotationView isSelected](self, "isSelected"))
  {
    v9 = -[CPSPointOfInterestAnnotationView selectedImageSet](self, "selectedImageSet");

    if (v9)
    {
      v8 = -[CPSPointOfInterestAnnotationView selectedImageSet](self, "selectedImageSet");
      v7 = (id)-[CPImageSet image](v8, "image");
      -[MKAnnotationView setImage:](self, "setImage:");

    }
    else
    {
      v6 = -[CPSPointOfInterestAnnotationView _defaultPOI](self, "_defaultPOI");
      -[MKAnnotationView setImage:](self, "setImage:");

    }
  }
  else
  {
    v5 = -[CPSPointOfInterestAnnotationView imageSet](self, "imageSet");

    if (v5)
    {
      v4 = -[CPSPointOfInterestAnnotationView imageSet](self, "imageSet");
      v3 = (id)-[CPImageSet image](v4, "image");
      -[MKAnnotationView setImage:](self, "setImage:");

    }
    else
    {
      v2 = -[CPSPointOfInterestAnnotationView _defaultPOI](self, "_defaultPOI");
      -[MKAnnotationView setImage:](self, "setImage:");

    }
  }
}

- (void)setSelected:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSPointOfInterestAnnotationView *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSPointOfInterestAnnotationView;
  -[MKAnnotationView setSelected:](&v3, sel_setSelected_, a3);
  -[CPSPointOfInterestAnnotationView setSelected:animated:](v6, "setSelected:animated:", v4, 1);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;
  BOOL v5;
  BOOL v6;
  SEL v7;
  CPSPointOfInterestAnnotationView *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointOfInterestAnnotationView;
  -[MKAnnotationView setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
  -[CPSPointOfInterestAnnotationView _updateImage](v8, "_updateImage");
}

- (void)prepareForDisplay
{
  objc_super v2;
  SEL v3;
  CPSPointOfInterestAnnotationView *v4;

  v4 = self;
  v3 = a2;
  -[CPSPointOfInterestAnnotationView _configure](self, "_configure");
  v2.receiver = v4;
  v2.super_class = (Class)CPSPointOfInterestAnnotationView;
  -[MKAnnotationView prepareForDisplay](&v2, sel_prepareForDisplay);
}

- (void)prepareForReuse
{
  objc_super v2;
  SEL v3;
  CPSPointOfInterestAnnotationView *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointOfInterestAnnotationView;
  -[MKAnnotationView prepareForReuse](&v2, sel_prepareForReuse);
  -[CPSPointOfInterestAnnotationView _configure](v4, "_configure");
}

- (void)_configure
{
  double v2;

  LODWORD(v2) = 1148846080;
  -[MKAnnotationView setDisplayPriority:](self, "setDisplayPriority:", v2);
  -[MKAnnotationView setCollisionMode:](self, "setCollisionMode:", 1);
  -[MKAnnotationView setCanShowCallout:](self, "setCanShowCallout:", 0);
}

- (id)_defaultPOI
{
  id v3;
  id v4;

  v3 = (id)-[CPSPointOfInterestAnnotationView traitCollection](self, "traitCollection");
  v4 = +[CPSPointOfInterestAnnotationView balloonWithText:traitCollection:](CPSPointOfInterestAnnotationView, "balloonWithText:traitCollection:", 0);

  return v4;
}

+ (id)balloonWithText:(id)a3 traitCollection:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  __int128 v27;
  __int128 v28;
  _BYTE v29[48];
  __int128 v30;
  __int128 v31;
  id v32;
  id v33[5];
  __int128 v34;
  __int128 v35;
  _BYTE __b[48];
  __int128 v37;
  __int128 v38;
  _BYTE v39[32];
  id v40;
  id v41;
  id v42;
  id location[2];
  id v44;

  v44 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  v41 = +[CPSEntityStyles mapAnnotationDropShadow](CPSEntityStyles, "mapAnnotationDropShadow");
  v40 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BDF7870]);
  memset(v39, 0, sizeof(v39));
  v37 = 0u;
  v38 = 0u;
  memset(__b, 0, sizeof(__b));
  v34 = 0u;
  v35 = 0u;
  v15 = v41;
  CGRectMake_10();
  v33[1] = v4;
  v33[2] = v5;
  v33[3] = v6;
  v33[4] = v7;
  objc_msgSend(v15, "rectsForSource:shadowRect:unionRect:positionTransform:", v39, &v37, __b, *(double *)&v4, *(double *)&v5, *(double *)&v6, *(double *)&v7);
  *(_QWORD *)&v34 = v8;
  *((_QWORD *)&v34 + 1) = v9;
  *(_QWORD *)&v35 = v10;
  *((_QWORD *)&v35 + 1) = v11;
  v12 = objc_alloc(MEMORY[0x24BDF6A98]);
  v33[0] = (id)objc_msgSend(v12, "initWithSize:", *(double *)&v38, *((double *)&v38 + 1));
  v16 = v33[0];
  v18 = MEMORY[0x24BDAC760];
  v19 = -1073741824;
  v20 = 0;
  v21 = __68__CPSPointOfInterestAnnotationView_balloonWithText_traitCollection___block_invoke;
  v22 = &unk_24E271770;
  v23 = v42;
  v24 = v41;
  v26[1] = v44;
  v27 = v34;
  v28 = v35;
  memcpy(v29, __b, sizeof(v29));
  v25 = location[0];
  v26[0] = v40;
  v30 = v37;
  v31 = v38;
  v32 = (id)objc_msgSend(v16, "imageWithActions:");
  v17 = v32;
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  return v17;
}

void __68__CPSPointOfInterestAnnotationView_balloonWithText_traitCollection___block_invoke(uint64_t a1, void *a2)
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  CGContext *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  CGContext *c;
  id v13;
  id v14;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  _BYTE __dst[48];
  id v22;
  CGFloat v23;
  CGSize v24;
  id v25[2];
  id location[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v25[1] = (id)a1;
  v25[0] = (id)objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection");
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", *(_QWORD *)(a1 + 32));
  v24.width = 0.0;
  v24.height = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "offset");
  v24.width = v2;
  v24.height = v3;
  v23 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "radius");
  v23 = v4;
  c = (CGContext *)objc_msgSend(location[0], "CGContext");
  v13 = (id)objc_msgSend(*(id *)(a1 + 40), "color");
  CGContextSetShadowWithColor(c, v24, v23, (CGColorRef)objc_msgSend(objc_retainAutorelease(v13), "CGColor"));

  v22 = (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", objc_msgSend(*(id *)(a1 + 64), "_createPathForBalloonRadius:tailLength:", *(double *)(a1 + 88) / 2.0, *(double *)(a1 + 96) - *(double *)(a1 + 88)));
  memcpy(__dst, (const void *)(a1 + 104), sizeof(__dst));
  objc_msgSend(v22, "applyTransform:", __dst);
  v14 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  objc_msgSend(v14, "setFill");

  objc_msgSend(v22, "fill");
  v5 = (CGContext *)objc_msgSend(location[0], "CGContext");
  CGContextSetShadowWithColor(v5, v24, v23, 0);
  if (*(_QWORD *)(a1 + 48))
  {
    v27[0] = *MEMORY[0x24BDF65F8];
    v28[0] = *(_QWORD *)(a1 + 56);
    v27[1] = *MEMORY[0x24BDF6600];
    v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v28[1] = v10;
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);

    objc_msgSend(*(id *)(a1 + 48), "sizeWithAttributes:", v20);
    CGRectMake_10();
    v16 = v6;
    v17 = v7;
    v18 = v8;
    v19 = v9;
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    objc_msgSend(v11, "setStroke");

    objc_msgSend(*(id *)(a1 + 48), "drawInRect:withAttributes:", v20, v16, v17, v18, v19);
    objc_storeStrong(&v20, 0);
  }
  CGContextTranslateCTM((CGContextRef)objc_msgSend(location[0], "CGContext"), -*(double *)(a1 + 152), -*(double *)(a1 + 160));
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v25[0]);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong(location, 0);
}

+ (CGPath)_createPathForBalloonRadius:(double)a3 tailLength:(double)a4
{
  double v5;
  CGPath *path;
  double cp1x;
  double cp2x;
  CGFloat v9;
  double v10;
  double v11;

  v11 = a4 / 4.0;
  v10 = a4 / 5.0;
  v9 = a3 * 2.0;
  cp2x = 0.448000014 * a3;
  cp1x = 0.38499999 * a3;
  path = CGPathCreateMutable();
  CGPathMoveToPoint(path, 0, v9, a3);
  v5 = 3.0;
  CGPathAddCurveToPoint(path, 0, v9, a3 * 1.5, v9 - cp1x, v9 - a4 / 3.0, a3 + a4 / 2.0 + v10, v9);
  CGPathAddCurveToPoint(path, 0, a3 + a4 / v5, v9 + a4 / v5, a3 + v11, v9 + a4, a3, v9 + a4);
  CGPathAddCurveToPoint(path, 0, a3 - v11, v9 + a4, a3 - a4 / v5, v9 + a4 / v5, a3 - (a4 / 2.0 + v10), v9);
  CGPathAddCurveToPoint(path, 0, cp1x, v9 - a4 / 3.0, 0.0, a3 * 1.5, 0.0, a3);
  CGPathAddCurveToPoint(path, 0, 0.0, cp2x, cp2x, 0.0, a3, 0.0);
  CGPathAddCurveToPoint(path, 0, v9 - cp2x, 0.0, v9, cp2x, v9, a3);
  CGPathCloseSubpath(path);
  return path;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (CPImageSet)selectedImageSet
{
  return self->_selectedImageSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImageSet, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);
}

@end

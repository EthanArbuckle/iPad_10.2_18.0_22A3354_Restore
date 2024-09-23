@implementation CKMapBalloonView

- (CKMapBalloonView)initWithFrame:(CGRect)a3
{
  CKMapBalloonView *v3;
  objc_class *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMapBalloonView;
  v3 = -[CKTitledImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMarkerAnnotationView"), CFSTR("MapKit"));
    if (v4)
    {
      v5 = (void *)objc_msgSend([v4 alloc], "initWithAnnotation:reuseIdentifier:", 0, CFSTR("TranscriptReuse"));
      -[CKMapBalloonView addSubview:](v3, "addSubview:", v5);
      -[CKMapBalloonView setAnnotationView:](v3, "setAnnotationView:", v5);

    }
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double x;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MaxY;
  CGFloat v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29.receiver = self;
  v29.super_class = (Class)CKMapBalloonView;
  -[CKTitledImageBalloonView layoutSubviews](&v29, sel_layoutSubviews);
  -[CKMapBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMapBalloonView annotationView](self, "annotationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMapBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v11);
  objc_msgSend(v11, "sizeToFit");
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  if (CKMainScreenScale_once_74 != -1)
    dispatch_once(&CKMainScreenScale_once_74, &__block_literal_global_184);
  v16 = *(double *)&CKMainScreenScale_sMainScreenScale_74;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_74 == 0.0)
    v16 = 1.0;
  v17 = v13 * v16;
  v18 = v15 * v16;
  v19 = v4 * v16 + floor((v8 * v16 - v13 * v16) * 0.5);
  v20 = v6 * v16 + floor((v10 * v16 - v15 * v16) * 0.5);
  v21 = 1.0 / v16;
  v23 = v21 * v20;
  v24 = v17 * v21;
  v25 = v18 * v21;
  v30.origin.x = v21 * v19;
  x = v30.origin.x;
  v30.origin.y = v23;
  v30.size.width = v24;
  v30.size.height = v25;
  MaxY = CGRectGetMaxY(v30);
  v31.origin.x = x;
  v31.origin.y = v23;
  v31.size.width = v24;
  v31.size.height = v25;
  CGRectGetMidX(v31);
  v32.origin.x = x;
  v32.origin.y = v23;
  v32.size.width = v24;
  v32.size.height = v25;
  v27 = v23 - (MaxY - CGRectGetMidY(v32));
  -[CKMapBalloonView annotationView](self, "annotationView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", x, v27, v24, v25);

}

- (MKMarkerAnnotationView)annotationView
{
  return self->_annotationView;
}

- (void)setAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_annotationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationView, 0);
}

@end

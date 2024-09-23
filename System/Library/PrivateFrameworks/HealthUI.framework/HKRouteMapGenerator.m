@implementation HKRouteMapGenerator

- (HKRouteMapGenerator)init
{
  HKRouteMapGenerator *v2;
  HKRouteMapGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKRouteMapGenerator;
  v2 = -[HKRouteMapGenerator init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HKRouteMapGenerator setUseRelativeColorForSpeed:](v2, "setUseRelativeColorForSpeed:", 1);
    -[HKRouteMapGenerator setUseMarkerAnnotations:](v3, "setUseMarkerAnnotations:", 1);
  }
  return v3;
}

- (void)drawLinesWithPolyline:(id)a3 lineWidth:(double)a4 mapRect:(id)a5 context:(CGContext *)a6 pointFromMapPoint:(id)a7
{
  double var1;
  double var0;
  double v11;
  double v12;
  double (**v14)(_QWORD, double, double);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  unint64_t v30;
  void *v31;
  MKMapPoint v32;
  MKMapPoint v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v45;
  id v46;
  void *v47;
  double v48;
  id v49;
  id obj;
  uint64_t v51;
  double v53;
  double height;
  double width;
  double y;
  double x;
  double v58;
  double v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;
  CLLocationCoordinate2D v66;
  CLLocationCoordinate2D v67;
  MKMapRect v68;
  MKMapRect v69;
  MKMapRect v70;
  MKMapRect v71;

  var1 = a5.var1.var1;
  var0 = a5.var1.var0;
  v11 = a5.var0.var1;
  v12 = a5.var0.var0;
  v65 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v14 = (double (**)(_QWORD, double, double))a7;
  v68.origin.x = v12;
  v68.origin.y = v11;
  v68.size.width = var0;
  v68.size.height = var1;
  v69 = MKMapRectInset(v68, var0 * -0.05, var1 * -0.05);
  y = v69.origin.y;
  x = v69.origin.x;
  height = v69.size.height;
  width = v69.size.width;
  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "workoutActivityType", v49);
    v19 = 5.0;
    if (v18 == 46)
      v19 = 15.0;
  }
  else
  {
    v19 = 5.0;
  }
  v53 = v19;

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inOrderLocationArrays");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v21;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v22)
  {
    v23 = v22;
    v51 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v61 != v51)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v25, "firstObject", v49);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timestamp");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        v29 = v28;

        if ((unint64_t)objc_msgSend(v25, "count") >= 2)
        {
          v30 = 1;
          do
          {
            v59 = v29;
            objc_msgSend(v25, "objectAtIndexedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "coordinate");
            v32 = MKMapPointForCoordinate(v66);
            objc_msgSend(v31, "coordinate");
            v33 = MKMapPointForCoordinate(v67);
            v34 = v14[2](v14, v32.x, v32.y);
            v36 = v35;
            v37 = v14[2](v14, v33.x, v33.y);
            v39 = v38;
            v58 = v34;
            v40 = (v37 - v34) * (v37 - v34) + (v38 - v36) * (v38 - v36);
            if (v40 >= 4.0)
            {
              v71.origin.x = fmin(v32.x, v33.x);
              v71.origin.y = fmin(v32.y, v33.y);
              v71.size.width = vabdd_f64(v32.x, v33.x);
              v71.size.height = vabdd_f64(v32.y, v33.y);
              v70.origin.y = y;
              v70.origin.x = x;
              v70.size.height = height;
              v70.size.width = width;
              if (MKMapRectIntersectsRect(v70, v71))
              {
                objc_msgSend(v31, "timestamp");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "timeIntervalSinceReferenceDate");
                v43 = v42 - v59;

                if (v40 >= a4 * a4 || v43 <= v53)
                {
                  objc_msgSend(v31, "speed");
                  -[HKRouteMapGenerator _drawLineFromPointA:toPointB:atSpeed:context:drawDashes:lineWidth:](self, "_drawLineFromPointA:toPointB:atSpeed:context:drawDashes:lineWidth:", a6, v43 > v53, v58, v36, v37, v39, v45, a4);
                }
              }
              v46 = v31;

              v26 = v46;
            }
            objc_msgSend(v31, "timestamp");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "timeIntervalSinceReferenceDate");
            v29 = v48;

            ++v30;
          }
          while (v30 < objc_msgSend(v25, "count"));
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v23);
  }

}

- (void)_drawLineFromPointA:(CGPoint)a3 toPointB:(CGPoint)a4 atSpeed:(double)a5 context:(CGContext *)a6 drawDashes:(BOOL)a7 lineWidth:(double)a8
{
  _BOOL4 v9;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  CGPath *Mutable;
  const CGPath *CopyByDashingPath;
  id v19;
  CGContext *v20;
  CGPathDrawingMode v21;
  id v22;
  CGFloat lengths[3];

  v9 = a7;
  y = a4.y;
  x = a4.x;
  v14 = a3.y;
  v15 = a3.x;
  lengths[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v15, v14);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  if (v9)
  {
    lengths[0] = 0.0;
    lengths[1] = a8 + a8;
    CopyByDashingPath = CGPathCreateCopyByDashingPath(Mutable, 0, 0.0, lengths, 2uLL);
    CGContextAddPath(a6, CopyByDashingPath);
    CGContextSetLineWidth(a6, a8);
    CGContextSetLineCap(a6, kCGLineCapRound);
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(a6, (CGColorRef)objc_msgSend(v19, "CGColor"));

    v20 = a6;
    v21 = kCGPathStroke;
  }
  else
  {
    CopyByDashingPath = CGPathCreateCopyByStrokingPath(Mutable, 0, a8, kCGLineCapRound, kCGLineJoinRound, 10.0);
    CGContextAddPath(a6, CopyByDashingPath);
    if (-[HKRouteMapGenerator useRelativeColorForSpeed](self, "useRelativeColorForSpeed"))
      -[HKRouteMapGenerator relativeColorForSpeed:](self, "relativeColorForSpeed:", a5);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.298039216, 0.850980392, 0.392156863, 1.0);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v22, "CGColor"));

    v20 = a6;
    v21 = kCGPathFill;
  }
  CGContextDrawPath(v20, v21);
  CGPathRelease(CopyByDashingPath);
  CGPathRelease(Mutable);
}

- (id)relativeColorForSpeed:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  float64x2_t v18;
  double v19;
  id v20;
  double v21;
  int64x2_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 0.85);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "averageSpeed");
  v8 = v7;

  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topSpeed");
  v11 = v10;

  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomSpeed");
  v14 = v13;

  if (a3 >= 0.0 && v8 != 0.0 && (v8 * 0.9 < a3 ? (v15 = v8 * 1.1 <= a3) : (v15 = 1), v15))
  {
    v16 = (a3 - v14) / (v11 - v14);
    if (v16 >= 0.5)
    {
      v21 = v16 + -0.5 + v16 + -0.5;
      v18 = vrndaq_f64(vmlaq_n_f64((float64x2_t)xmmword_1D7B829D0, (float64x2_t)xmmword_1D7B829C0, v21));
      v19 = v21 * 100.0 + 0.0;
    }
    else
    {
      v17 = v16 + v16;
      v18 = vrndaq_f64(vmlaq_n_f64((float64x2_t)xmmword_1D7B829F0, (float64x2_t)xmmword_1D7B829E0, v16 + v16));
      v19 = v17 * -48.0 + 48.0;
    }
    v22 = vcvtq_s64_f64(v18);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)v22.i64[0] / 255.0, (double)v22.i64[1] / 255.0, (double)(uint64_t)round(v19) / 255.0, 0.85);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v5;
  }
  v23 = v20;

  return v23;
}

- ($8FF87B24CC3CECC00DB59503406A975B)_adjustedMapRectForPolyline:(id)a3 size:(CGSize)a4
{
  MKMapRect v4;

  -[HKRouteMapGenerator _adjustRectForPolyline:withSize:](self, "_adjustRectForPolyline:withSize:", a3, a4.width, a4.height);
  return ($8FF87B24CC3CECC00DB59503406A975B)MKMapRectInset(v4, v4.size.width * -0.05, v4.size.height * -0.05);
}

- ($8FF87B24CC3CECC00DB59503406A975B)_adjustedMapRectForPolyline:(id)a3 size:(CGSize)a4 offsets:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $8FF87B24CC3CECC00DB59503406A975B result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[HKRouteMapGenerator _adjustRectForPolyline:withSize:](self, "_adjustRectForPolyline:withSize:", a3, a4.width, a4.height);
  v11 = v9 + v10 * x;
  v14 = v12 + v13 * y;
  v15 = v10 - v10 * width;
  v16 = v13 - v13 * height;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v14;
  result.var0.var0 = v11;
  return result;
}

- ($8FF87B24CC3CECC00DB59503406A975B)_adjustRectForPolyline:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double *v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  double v34;
  double v35;
  double v36;
  double v37;
  $8FF87B24CC3CECC00DB59503406A975B result;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "boundingMapRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_retainAutorelease(v6);
  v16 = (double *)objc_msgSend(v15, "points");
  v17 = *v16;
  v18 = v16[1];
  v19 = objc_retainAutorelease(v15);
  v20 = objc_msgSend(v19, "points");
  v21 = objc_msgSend(v19, "pointCount");

  v22 = v20 + 16 * v21;
  v23 = *(double *)(v22 - 16);
  v24 = fmin(v18, *(double *)(v22 - 8));
  v25 = 16.0 / width * v12;
  v26 = fmin(v17, v23);
  v27 = v25 - (v26 - v8);
  v28 = fmax(v17, v23);
  *(float *)&v23 = v25 + v28 - (v8 + v12);
  v29 = fmaxf(v27, 0.0) * 1.5;
  v30 = fmaxf(*(float *)&v23, 0.0) * 1.5;
  if (v26 + -32.0 < v8)
    v29 = v29 * 1.5;
  v31 = v8 - v29;
  if (v28 + 32.0 <= v12 + v8 - v29)
    v32 = v30;
  else
    v32 = v30 * 1.5;
  v33 = 32.0 / height * v14 - (v24 - v10);
  v34 = fmaxf(v33, 0.0) * 1.5;
  v35 = v14 + v34;
  v36 = v10 - v34;
  v37 = v12 + v29 + v32;
  result.var1.var1 = v35;
  result.var1.var0 = v37;
  result.var0.var1 = v36;
  result.var0.var0 = v31;
  return result;
}

- (id)_annotationViewWithIsStartPoint:(BOOL)a3
{
  _BOOL4 v3;
  HKDotAnnotationView *v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (self->_useMarkerAnnotations)
  {
    v4 = (HKDotAnnotationView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1878]), "initWithAnnotation:reuseIdentifier:", 0, 0);
    -[MKAnnotationView setBounds:](v4, "setBounds:", 0.0, 0.0, 32.0, 32.0);
    if (v3)
    {
      v5 = 0.298039216;
      v6 = 0.850980392;
      v7 = 0.392156863;
    }
    else
    {
      v6 = 0.231372549;
      v7 = 0.188235294;
      v5 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v5, v6, v7, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDotAnnotationView setMarkerTintColor:](v4, "setMarkerTintColor:", v12);
  }
  else
  {
    v4 = -[HKDotAnnotationView initWithAnnotation:reuseIdentifier:]([HKDotAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", 0, 0);
    -[MKAnnotationView setBounds:](v4, "setBounds:", 0.0, 0.0, 20.0, 20.0);
    if (v3)
    {
      -[HKRouteMapGenerator startPointColor](self, "startPointColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        -[HKRouteMapGenerator startPointColor](self, "startPointColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.298039216, 0.850980392, 0.392156863, 1.0);
    }
    else
    {
      -[HKRouteMapGenerator endPointColor](self, "endPointColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[HKRouteMapGenerator endPointColor](self, "endPointColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
    }
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v10;
    -[HKDotAnnotationView setDotColor:](v4, "setDotColor:", v10);
  }

  return v4;
}

- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 completion:(id)a6
{
  -[HKRouteMapGenerator snapshotWithSize:lineWidth:traitCollection:offsets:completion:](self, "snapshotWithSize:lineWidth:traitCollection:offsets:completion:", a5, a6, a3.width, a3.height, a4, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 offsets:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MKMapPoint v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  MKMapSnapshotter *runningSnapshotter;
  MKMapSnapshotter *v44;
  MKMapSnapshotter *v45;
  void *v46;
  MKMapSnapshotter *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54[6];
  id location[2];
  CLLocationCoordinate2D v56;
  CLLocationCoordinate2D v57;
  CGRect v58;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3.height;
  v14 = a3.width;
  v16 = a5;
  v17 = a7;
  v18 = objc_alloc_init(MEMORY[0x1E0CC1860]);
  objc_msgSend(v18, "setTraitCollection:", v16);
  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allValidLocations");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v20 == 1)
  {
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "coordinate");
    v25 = MKMapPointForCoordinate(v56);
    v26 = v25.x + -750.0 + -32.0;
    v27 = v25.y + -750.0 + -32.0;
    v28 = 1500.0;

    v29 = 0;
    v30 = 1500.0;
  }
  else
  {
    v50 = v17;
    v31 = objc_msgSend(v22, "count");

    v32 = (char *)malloc_type_malloc(16 * v31, 0x1000040451B5BE8uLL);
    v33 = v32;
    if (v31)
    {
      v34 = 0;
      v35 = v32 + 8;
      do
      {
        -[HKRouteMapGenerator locationReadings](self, "locationReadings");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "allValidLocations");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "coordinate");
        *(MKMapPoint *)(v35 - 8) = MKMapPointForCoordinate(v57);

        ++v34;
        v35 += 16;
      }
      while (v31 != v34);
    }
    objc_msgSend(MEMORY[0x1E0CC1928], "polylineWithPoints:count:", v33, v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    free(v33);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    if (CGRectEqualToRect(v58, *MEMORY[0x1E0C9D628]))
      -[HKRouteMapGenerator _adjustedMapRectForPolyline:size:](self, "_adjustedMapRectForPolyline:size:", v29, v14, v13);
    else
      -[HKRouteMapGenerator _adjustedMapRectForPolyline:size:offsets:](self, "_adjustedMapRectForPolyline:size:offsets:", v29, v14, v13, x, y, width, height);
    v26 = v39;
    v27 = v40;
    v28 = v41;
    v30 = v42;
    v17 = v50;
  }
  objc_msgSend(v18, "setMapRect:", v26, v27, v28, v30);
  objc_msgSend(v18, "setMapType:", 5);
  objc_msgSend(v18, "setSize:", v14, v13);
  -[MKMapSnapshotter cancel](self->_runningSnapshotter, "cancel");
  runningSnapshotter = self->_runningSnapshotter;
  self->_runningSnapshotter = 0;

  v44 = (MKMapSnapshotter *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", v18);
  v45 = self->_runningSnapshotter;
  self->_runningSnapshotter = v44;

  dispatch_get_global_queue(25, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v47 = self->_runningSnapshotter;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke;
  v51[3] = &unk_1E9C45330;
  v48 = v17;
  v53 = v48;
  objc_copyWeak(v54, location);
  v49 = v29;
  v52 = v49;
  v54[1] = *(id *)&a4;
  v54[2] = *(id *)&v26;
  v54[3] = *(id *)&v27;
  v54[4] = *(id *)&v28;
  v54[5] = *(id *)&v30;
  -[MKMapSnapshotter startWithQueue:completionHandler:](v47, "startWithQueue:completionHandler:", v46, v51);

  objc_destroyWeak(v54);
  objc_destroyWeak(location);

}

void __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15[2];
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D829F904]();
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5260];
  v9 = *MEMORY[0x1E0CB5260];
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_cold_1((uint64_t)v6, v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_DEFAULT, "[routes] Received snapshot back from MKMapSnapshotter: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_207;
    block[3] = &unk_1E9C45308;
    objc_copyWeak(v15, (id *)(a1 + 48));
    v12 = *(id *)(a1 + 32);
    v15[1] = *(id *)(a1 + 56);
    v10 = *(_OWORD *)(a1 + 80);
    v16 = *(_OWORD *)(a1 + 64);
    v17 = v10;
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v15);
  }
  objc_autoreleasePoolPop(v7);

}

void __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_207(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x1D829F904]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_imageWithPolyline:lineWidth:mapRect:onSnapshot:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (id)_imageWithPolyline:(id)a3 lineWidth:(double)a4 mapRect:(id)a5 onSnapshot:(id)a6
{
  double var1;
  double var0;
  double v9;
  double v10;
  id v13;
  id v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  CGContext *CurrentContext;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  MKMapPoint v37;
  id v38;
  void *v39;
  id v40;
  double *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD v47[4];
  id v48;
  CGSize v49;
  CLLocationCoordinate2D v50;

  var1 = a5.var1.var1;
  var0 = a5.var1.var0;
  v9 = a5.var0.var1;
  v10 = a5.var0.var0;
  v13 = a3;
  v14 = a6;
  objc_msgSend(v14, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;
  v49.width = v17;
  v49.height = v19;
  UIGraphicsBeginImageContextWithOptions(v49, 0, v22);

  objc_msgSend(v14, "image");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "size");
  v25 = v24;
  objc_msgSend(v14, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  v28 = v27;

  objc_msgSend(v14, "image");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "drawInRect:", 0.0, 0.0, v25, v28);

  CurrentContext = UIGraphicsGetCurrentContext();
  -[HKRouteMapGenerator _annotationViewWithIsStartPoint:](self, "_annotationViewWithIsStartPoint:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRouteMapGenerator locationReadings](self, "locationReadings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33 == 1)
  {
    -[HKRouteMapGenerator locationReadings](self, "locationReadings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allValidLocations");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "coordinate");
    v37 = MKMapPointForCoordinate(v50);

    -[HKRouteMapGenerator _overlayAnnotationView:point:onSnapshot:context:](self, "_overlayAnnotationView:point:onSnapshot:context:", v31, v14, CurrentContext, v37.x, v37.y);
  }
  else
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __71__HKRouteMapGenerator__imageWithPolyline_lineWidth_mapRect_onSnapshot___block_invoke;
    v47[3] = &unk_1E9C45358;
    v38 = v14;
    v48 = v38;
    -[HKRouteMapGenerator drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:](self, "drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:", v13, CurrentContext, v47, a4, v10, v9, var0, var1);
    CGContextStrokePath(CurrentContext);
    -[HKRouteMapGenerator _annotationViewWithIsStartPoint:](self, "_annotationViewWithIsStartPoint:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "pointCount"))
    {
      v40 = objc_retainAutorelease(v13);
      v41 = (double *)objc_msgSend(v40, "points");
      -[HKRouteMapGenerator _overlayAnnotationView:point:onSnapshot:context:](self, "_overlayAnnotationView:point:onSnapshot:context:", v31, v38, CurrentContext, *v41, v41[1]);
      v42 = objc_retainAutorelease(v40);
      v43 = objc_msgSend(v42, "points");
      v44 = objc_msgSend(v42, "pointCount");
      -[HKRouteMapGenerator _overlayAnnotationView:point:onSnapshot:context:](self, "_overlayAnnotationView:point:onSnapshot:context:", v39, v38, CurrentContext, *(double *)(v43 + 16 * v44 - 16), *(double *)(v43 + 16 * v44 - 8));
    }

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v45;
}

uint64_t __71__HKRouteMapGenerator__imageWithPolyline_lineWidth_mapRect_onSnapshot___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v3;
  CLLocationCoordinate2D v4;

  v3 = *(void **)(a1 + 32);
  v4 = MKCoordinateForMapPoint(*(MKMapPoint *)&a2);
  return objc_msgSend(v3, "pointForCoordinate:", v4.latitude, v4.longitude);
}

- (void)_overlayAnnotationView:(id)a3 point:(id)a4 onSnapshot:(id)a5 context:(CGContext *)a6
{
  double var1;
  double var0;
  id v10;
  id v11;
  CLLocationCoordinate2D v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  MKMapPoint v24;
  CGRect v25;
  CGRect v26;

  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a5;
  v11 = a3;
  v24.x = var0;
  v24.y = var1;
  v12 = MKCoordinateForMapPoint(v24);
  objc_msgSend(v10, "pointForCoordinate:", v12.latitude, v12.longitude);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v11, "bounds");
  v17 = v14 - CGRectGetMidX(v25);
  objc_msgSend(v11, "centerOffset");
  v19 = v17 + v18;
  objc_msgSend(v11, "bounds");
  v20 = v16 - CGRectGetMidY(v26);
  objc_msgSend(v11, "centerOffset");
  v22 = v20 + v21;
  CGContextSaveGState(a6);
  CGContextTranslateCTM(a6, v19, v22);
  objc_msgSend(v11, "prepareForSnapshotting");
  objc_msgSend(v11, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "renderInContext:", a6);
  CGContextRestoreGState(a6);
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
}

- (BOOL)useRelativeColorForSpeed
{
  return self->_useRelativeColorForSpeed;
}

- (void)setUseRelativeColorForSpeed:(BOOL)a3
{
  self->_useRelativeColorForSpeed = a3;
}

- (BOOL)useMarkerAnnotations
{
  return self->_useMarkerAnnotations;
}

- (void)setUseMarkerAnnotations:(BOOL)a3
{
  self->_useMarkerAnnotations = a3;
}

- (UIColor)startPointColor
{
  return self->_startPointColor;
}

- (void)setStartPointColor:(id)a3
{
  objc_storeStrong((id *)&self->_startPointColor, a3);
}

- (UIColor)endPointColor
{
  return self->_endPointColor;
}

- (void)setEndPointColor:(id)a3
{
  objc_storeStrong((id *)&self->_endPointColor, a3);
}

- (MKMapSnapshotter)runningSnapshotter
{
  return self->_runningSnapshotter;
}

- (void)setRunningSnapshotter:(id)a3
{
  objc_storeStrong((id *)&self->_runningSnapshotter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningSnapshotter, 0);
  objc_storeStrong((id *)&self->_endPointColor, 0);
  objc_storeStrong((id *)&self->_startPointColor, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

void __85__HKRouteMapGenerator_snapshotWithSize_lineWidth_traitCollection_offsets_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "[routes] Error generating snapshot: %@", (uint8_t *)&v2, 0xCu);
}

@end

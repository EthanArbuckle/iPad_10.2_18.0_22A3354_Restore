@implementation AKArrowAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;

  -[AKAnnotationEventHandler annotation](self, "annotation", a3, a4, a5, a6, a7);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 9)
  {
    objc_msgSend(v37, "startPoint");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v37, "endPoint");
    v16 = v15;
    v18 = v17;
LABEL_9:
    v25 = v37;
    goto LABEL_10;
  }
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 10)
  {
    objc_msgSend(v37, "endPoint");
    v12 = v19;
    v14 = v20;
    objc_msgSend(v37, "startPoint");
  }
  else
  {
    if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") != 11)
    {
      v16 = *MEMORY[0x24BDBEFB0];
      v18 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v14 = v18;
      v12 = *MEMORY[0x24BDBEFB0];
      goto LABEL_9;
    }
    objc_msgSend(v37, "midPoint");
    v12 = v23;
    v14 = v24;
    objc_msgSend(v37, "midPoint");
  }
  v25 = v37;
  v16 = v21;
  v18 = v22;
LABEL_10:
  objc_msgSend(v25, "startPoint");
  v27 = v26;
  objc_msgSend(v37, "endPoint");
  v29 = v28;
  objc_msgSend(v37, "startPoint");
  v31 = v27 + (v29 - v30) * 0.5;
  objc_msgSend(v37, "startPoint");
  v33 = v32;
  objc_msgSend(v37, "endPoint");
  v35 = v34;
  objc_msgSend(v37, "startPoint");
  a3->x = v12;
  a3->y = v14;
  a4->x = v16;
  a4->y = v18;
  a5->x = v31;
  a5->y = v33 + (v35 - v36) * 0.5;

}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  char v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 9
    || -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 10)
  {
    if ((v4 & 1) != 0)
    {
      -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
      v15 = v14;
      v17 = v16;
      v18 = x - v14;
      v19 = y - v16;
      if ((v4 & 2) != 0)
      {
        +[AKGeometryHelper snapVectorTo45Degrees:](AKGeometryHelper, "snapVectorTo45Degrees:", v18, v19);
        x = v15 + v18;
        y = v17 + v19;
      }
      v10 = v15 - v18;
      v11 = v17 - v19;
    }
    else
    {
      -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
      v10 = v8;
      v11 = v9;
      if ((v4 & 2) != 0)
      {
        +[AKGeometryHelper snapVectorTo45Degrees:](AKGeometryHelper, "snapVectorTo45Degrees:", x - v8, y - v9);
        x = v10 + v12;
        y = v11 + v13;
      }
    }
    -[AKAnnotationEventHandler pageController](self, "pageController");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "geometryHelper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentAlignedPointForPoint:", x, y);
    v22 = v21;
    v24 = v23;

    objc_msgSend(v39, "geometryHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentAlignedPointForPoint:", v10, v11);
    v27 = v26;
    v29 = v28;

    if (v22 == v27 && v24 == v29)
      goto LABEL_31;
    -[AKAnnotationEventHandler annotation](self, "annotation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 9)
    {
      -[AKArrowAnnotationEventHandler _updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:](self, "_updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:", v30, v22, v24, v27, v29);
      objc_msgSend(v30, "setMidPoint:");
      objc_msgSend(v30, "startPoint");
      if (v32 != v22 || v31 != v24)
        objc_msgSend(v30, "setStartPoint:", v22, v24);
      objc_msgSend(v30, "endPoint");
      if (v34 == v27 && v33 == v29)
        goto LABEL_30;
    }
    else
    {
      -[AKArrowAnnotationEventHandler _updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:](self, "_updatedMidPointForAnnotation:withNewStartPt:andNewEndPt:", v30, v27, v29, v22, v24);
      objc_msgSend(v30, "setMidPoint:");
      objc_msgSend(v30, "startPoint");
      if (v36 != v27 || v35 != v29)
        objc_msgSend(v30, "setStartPoint:", v27, v29);
      objc_msgSend(v30, "endPoint");
      if (v38 == v22)
      {
        v27 = v22;
        v29 = v24;
        if (v37 == v24)
        {
LABEL_30:

LABEL_31:
          return;
        }
      }
      else
      {
        v27 = v22;
        v29 = v24;
      }
    }
    objc_msgSend(v30, "setEndPoint:", v27, v29);
    goto LABEL_30;
  }
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 11)
  {
    -[AKAnnotationEventHandler annotation](self, "annotation");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 11)
      objc_msgSend(v39, "setMidPoint:", x, y);
    goto LABEL_31;
  }
}

- (CGPoint)_updatedMidPointForAnnotation:(id)a3 withNewStartPt:(CGPoint)a4 andNewEndPt:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  long double v15;
  double v16;
  long double v17;
  double v18;
  long double v19;
  long double v20;
  CGFloat v21;
  double v22;
  double v23;
  long double v24;
  float64x2_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3;
  objc_msgSend(v9, "startPoint");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "endPoint");
  v15 = v14 - v13;
  v17 = v16 - v11;
  v27 = atan2(v14 - v13, v16 - v11);
  v18 = hypot(v17, v15);
  v19 = x - v8;
  v20 = y - v7;
  v21 = hypot(v19, v20) / v18;
  objc_msgSend(v9, "midPoint");
  v28 = v23;
  v29 = v22;

  memset(&v36, 0, sizeof(v36));
  CGAffineTransformMakeTranslation(&v36, -v11, -v13);
  CGAffineTransformMakeRotation(&t2, -v27);
  t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &t2);
  v36 = v35;
  CGAffineTransformMakeScale(&v32, v21, v21);
  t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &v32);
  v36 = v35;
  v24 = atan2(v20, v19);
  CGAffineTransformMakeRotation(&v31, v24);
  t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &v31);
  v36 = v35;
  CGAffineTransformMakeTranslation(&v30, v8, v7);
  t1 = v36;
  CGAffineTransformConcat(&v35, &t1, &v30);
  v25 = vaddq_f64(*(float64x2_t *)&v35.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v35.c, v28), *(float64x2_t *)&v35.a, v29));
  v26 = v25.f64[1];
  result.x = v25.f64[0];
  result.y = v26;
  return result;
}

@end

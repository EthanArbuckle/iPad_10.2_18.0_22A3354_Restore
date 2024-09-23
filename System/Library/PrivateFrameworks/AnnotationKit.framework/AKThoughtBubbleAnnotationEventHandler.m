@implementation AKThoughtBubbleAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MidX;
  objc_super v19;
  CGPoint v20;
  CGPoint v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;

  v12 = a6;
  v13 = a7;
  v21 = (CGPoint)*MEMORY[0x24BDBEFB0];
  v22 = v21;
  v20 = v21;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea");
  if (v15 - 1 >= 8)
  {
    if (v15 == 14)
    {
      objc_msgSend(v14, "pointyBitPoint");
      v22.x = v16;
      v22.y = v17;
      objc_msgSend(v14, "rectangle");
      MidX = CGRectGetMidX(v23);
      objc_msgSend(v14, "rectangle");
      v20.x = MidX;
      v20.y = CGRectGetMidY(v24);
      v21 = v20;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AKThoughtBubbleAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](&v19, sel_getInitialDraggedPoint_otherPoint_center_forEvent_orRecognizer_, &v22, &v21, &v20, v12, v13);
  }
  *a3 = v22;
  *a4 = v21;
  *a5 = v20;

}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v39;
  float64x2_t v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat MidY;
  double v67;
  CGFloat Height;
  CGFloat MidX;
  CGFloat v70;
  double v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double sx;
  CGFloat sxa;
  CGFloat sxb;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGAffineTransform v82;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v85;
  CGAffineTransform v86;
  objc_super v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v88 = 0u;
  objc_msgSend(v8, "rectangle");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "rotationAngle");
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v10, v12, v14, v16, -v17);
  v18 = y * 0.0 + 0.0 * x + 0.0;
  v19 = v18;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") != 14)
  {
    objc_msgSend(v8, "rectangle");
    v43 = v42;
    v80 = v45;
    v81 = v44;
    v79 = v46;
    v87.receiver = self;
    v87.super_class = (Class)AKThoughtBubbleAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler updateModelWithCurrentPoint:options:](&v87, sel_updateModelWithCurrentPoint_options_, a4, x, y);
    if ((a4 & 1) != 0)
      -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
    else
      -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
    v49 = v47;
    v50 = v48;
    -[AKAnnotationEventHandler lastPositionInModel](self, "lastPositionInModel");
    v52 = v51 - v49;
    -[AKAnnotationEventHandler lastPositionInModel](self, "lastPositionInModel");
    +[AKGeometryHelper compareVectorDirectionsFirstVector:secondVector:](AKGeometryHelper, "compareVectorDirectionsFirstVector:secondVector:", v52, v53 - v50, v18 - v49, v18 - v50);
    v55 = v54;
    v57 = v56;
    if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 8
      || -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 4)
    {
      v75 = 1.0;
      sx = v55;
    }
    else
    {
      v75 = v57;
      if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 6
        || -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 2)
      {
        sx = 1.0;
      }
      else
      {
        sx = v55;
      }
    }
    objc_msgSend(v8, "rectangle");
    v59 = v58;
    v61 = v60;
    v73 = v62;
    v64 = v63;
    memset(&v86, 0, sizeof(v86));
    v91.origin.x = v43;
    v91.origin.y = v81;
    v91.size.width = v80;
    v91.size.height = v79;
    v65 = -CGRectGetMidX(v91);
    v92.origin.x = v43;
    v92.origin.y = v81;
    v92.size.width = v80;
    v92.size.height = v79;
    MidY = CGRectGetMidY(v92);
    CGAffineTransformMakeTranslation(&v86, v65, -MidY);
    v93.origin.x = v59;
    v93.origin.y = v61;
    v93.size.width = v73;
    v74 = v64;
    v93.size.height = v64;
    sxa = sx * CGRectGetWidth(v93);
    v94.origin.x = v43;
    v94.origin.y = v81;
    v94.size.width = v80;
    v94.size.height = v79;
    sxb = sxa / CGRectGetWidth(v94);
    v95.origin.x = v59;
    v95.origin.y = v61;
    v95.size.width = v73;
    v95.size.height = v64;
    v67 = v75 * CGRectGetHeight(v95);
    v96.origin.x = v43;
    v96.origin.y = v81;
    v96.size.width = v80;
    v96.size.height = v79;
    Height = CGRectGetHeight(v96);
    CGAffineTransformMakeScale(&t2, sxb, v67 / Height);
    t1 = v86;
    CGAffineTransformConcat(&v85, &t1, &t2);
    v86 = v85;
    v97.origin.x = v59;
    v97.origin.y = v61;
    v97.size.width = v73;
    v97.size.height = v74;
    MidX = CGRectGetMidX(v97);
    v98.origin.x = v59;
    v98.origin.y = v61;
    v98.size.width = v73;
    v98.size.height = v74;
    v70 = CGRectGetMidY(v98);
    CGAffineTransformMakeTranslation(&v82, MidX, v70);
    t1 = v86;
    CGAffineTransformConcat(&v85, &t1, &v82);
    v86 = v85;
    objc_msgSend(v8, "pointyBitPoint");
    v40 = vaddq_f64(*(float64x2_t *)&v86.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v86.c, v71), *(float64x2_t *)&v86.a, v72));
    v41 = v40.f64[1];
    v39 = v8;
    goto LABEL_20;
  }
  -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
  if ((a4 & 2) != 0)
  {
    v23 = v21;
    v24 = v22;
    +[AKGeometryHelper snapVectorTo45Degrees:](AKGeometryHelper, "snapVectorTo45Degrees:", v18 - v21, v18 - v22);
    v18 = v23 + v25;
    v19 = v24 + v26;
  }
  +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", 14, v8, v20, v18, v19);
  v28 = v27;
  v30 = v29;
  objc_msgSend(v20, "geometryHelper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contentAlignedPointForPoint:", v28, v30);
  v33 = v32;
  v35 = v34;

  objc_msgSend(v8, "pointyBitPoint");
  if (v37 != v33 || v36 != v35)
  {
    v39 = v8;
    v40.f64[0] = v33;
    v41 = v35;
LABEL_20:
    objc_msgSend(v39, "setPointyBitPoint:", v40.f64[0], v41);
  }

}

@end

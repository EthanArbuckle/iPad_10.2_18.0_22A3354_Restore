@implementation AKThoughtBubblePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  double v36;
  double v37;
  objc_super v38;
  id v39;
  id v40;

  v39 = 0;
  v40 = 0;
  v38.receiver = a1;
  v38.super_class = (Class)&OBJC_METACLASS___AKThoughtBubblePointOfInterestHelper;
  v9 = a6;
  v10 = a5;
  objc_msgSendSuper2(&v38, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v40, &v39, v10, v9);
  v11 = v40;
  v12 = v39;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count") + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointyBitPoint");
  v36 = v16;
  v37 = v15;
  objc_msgSend(v10, "rectangle");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v10, "rotationAngle");
  v26 = v25;

  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v18, v20, v22, v24, v26);
  objc_msgSend(v9, "geometryHelper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "screenPixelAlignedPointForPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v36), (float64x2_t)0, v37)));
  v29 = v28;
  v31 = v30;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v29, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v32);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v33);

  objc_msgSend(v13, "addObjectsFromArray:", v11);
  objc_msgSend(v14, "addObjectsFromArray:", v12);
  v34 = objc_retainAutorelease(v13);
  *a3 = v34;
  v35 = objc_retainAutorelease(v14);
  *a4 = v35;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  objc_super v6;

  if (!a3)
    return 14;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKThoughtBubblePointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

+ (double)minOutset
{
  return 30.0;
}

+ (double)maxOutset
{
  return 125.0;
}

+ (CGPoint)_constrainPointyPointToOutset:(CGPoint)a3 forAnnotation:(id)a4 outsetIsMin:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat rect;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGPoint result;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v9 = a4;
  if (v5)
    objc_msgSend(a1, "minOutset");
  else
    objc_msgSend(a1, "maxOutset");
  v11 = v10;
  if (v10 < 1.79769313e308)
  {
    objc_msgSend(v9, "originalModelBaseScaleFactor");
    v13 = v12;
    objc_msgSend(v9, "rectangle");
    v47 = CGRectInset(v46, -(v11 * v13), -(v11 * v13));
    v14 = v47.origin.x;
    v15 = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    MidX = CGRectGetMidX(v47);
    v48.origin.x = v14;
    v48.origin.y = v15;
    v48.size.width = width;
    v48.size.height = height;
    MidY = CGRectGetMidY(v48);
    v49.origin.x = v14;
    v49.origin.y = v15;
    v49.size.width = width;
    v49.size.height = height;
    v38 = x;
    v20 = CGRectGetHeight(v49) * 0.5;
    memset(&v44, 0, sizeof(v44));
    v36 = MidY;
    v37 = MidX;
    v21 = -MidX;
    v22 = height;
    CGAffineTransformMakeTranslation(&v44, v21, -MidY);
    v23 = v20;
    v50.origin.x = v14;
    v50.origin.y = v15;
    v50.size.width = width;
    rect = v22;
    v50.size.height = v22;
    v24 = CGRectGetWidth(v50);
    v35 = v20 + v20;
    CGAffineTransformMakeScale(&t2, (v20 + v20) / v24, 1.0);
    t1 = v44;
    CGAffineTransformConcat(&v43, &t1, &t2);
    v44 = v43;
    v25 = v43.tx + y * v43.c + v43.a * v38;
    x = v38;
    v26 = v43.ty + y * v43.d + v43.b * v38;
    v27 = hypot(v25, v26);
    v28 = v27 <= v23;
    if (!v5)
      v28 = v27 >= v23;
    if (v28)
    {
      v29 = v23 * (v25 / v27);
      v30 = v23 * (v26 / v27);
      memset(&v43, 0, sizeof(v43));
      v51.origin.x = v14;
      v51.origin.y = v15;
      v51.size.width = width;
      v51.size.height = rect;
      v31 = CGRectGetWidth(v51);
      CGAffineTransformMakeScale(&v43, v31 / v35, 1.0);
      CGAffineTransformMakeTranslation(&v40, v37, v36);
      v39 = v43;
      CGAffineTransformConcat(&t1, &v39, &v40);
      v43 = t1;
      x = t1.tx + v30 * t1.c + t1.a * v29;
      y = t1.ty + v30 * t1.d + t1.b * v29;
    }
  }

  v32 = x;
  v33 = y;
  result.y = v33;
  result.x = v32;
  return result;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4 == 14)
  {
    v10 = a5;
    objc_msgSend(a1, "_constrainPointyPointToOutset:forAnnotation:outsetIsMin:", v10, 0, x, y);
    objc_msgSend(a1, "_constrainPointyPointToOutset:forAnnotation:outsetIsMin:", v10, 1);
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___AKThoughtBubblePointOfInterestHelper;
    objc_msgSendSuper2(&v17, sel__concreteValidatePoint_ofDraggableArea_forAnnotation_onPageController_, a4, a5, a6, a3.x, a3.y);
  }
  v13 = v11;
  v14 = v12;

  v15 = v13;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

@end

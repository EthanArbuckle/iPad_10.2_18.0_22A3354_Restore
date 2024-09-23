@implementation AKAnnotationPointOfInterestHelper

+ (void)pointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = a5;
  objc_msgSend((id)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v11), "_concretePointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:", a3, a4, v11, v10);

}

+ (CGPoint)pointForDraggableArea:(unint64_t)a3 onAnnotation:(id)a4 pageControllerForPixelAlignment:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;
  CGPoint result;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v29 = 0;
  v30 = 0;
  objc_msgSend(a1, "pointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:", &v30, &v29, v8, v9);
  v10 = v30;
  v11 = v29;
  v13 = *MEMORY[0x24BDBEFB0];
  v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "akPointValue", (_QWORD)v25);
        v20 = v19;
        v22 = v21;
        if (objc_msgSend(a1, "draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v8, v9) == a3)
        {
          v12 = v22;
          v13 = v20;
          goto LABEL_11;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_11:

  v23 = v13;
  v24 = v12;
  result.y = v24;
  result.x = v23;
  return result;
}

+ (unint64_t)draggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  unint64_t v13;

  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = a4;
  v13 = objc_msgSend((id)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v12), "_concreteDraggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v12, v11, x, y, a5);

  return v13;
}

+ (double)draggableAreaScaleFactorForScaleFactor:(double)a3
{
  return a3 * 0.5;
}

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, _BYTE *);
  void *v24;
  id v25;
  uint64_t *v26;
  id v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;

  y = a3.y;
  x = a3.x;
  v11 = a4;
  v12 = a6;
  objc_msgSend(a1, "draggableAreaScaleFactorForScaleFactor:", a5);
  v14 = v13;
  v36 = 0;
  v35 = 0;
  objc_msgSend(a1, "pointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:", &v36, &v35, v11, v12);
  v15 = v36;
  v16 = v35;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = sub_229070EF8;
  v24 = &unk_24F1A8338;
  v17 = v16;
  v26 = &v31;
  v27 = a1;
  v28 = x;
  v29 = y;
  v30 = v14;
  v25 = v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v21);
  if (v32[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = 0;
  }
  else
  {
    v19 = (void *)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v11, v21, v22, v23, v24);
    v18 = objc_msgSend(v19, "_concreteDraggableAreaForPointOfInterestWithIndex:ofAnnotation:onPageController:", v32[3], v11, v12);
  }

  _Block_object_dispose(&v31, 8);
  return v18;
}

+ (CGPoint)validatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = a5;
  objc_msgSend((id)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v12), "_concreteValidatePoint:ofDraggableArea:forAnnotation:onPageController:", a4, v12, v11, x, y);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a5, a6, "+[AKAnnotationPointOfInterestHelper _concretePointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:]");
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a5, "+[AKAnnotationPointOfInterestHelper _concreteDraggableAreaForPointOfInterestWithIndex:ofAnnotation:onPageController:]");
  return 0;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double v6;
  double v7;
  CGPoint result;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a6, a3.x, a3.y, "+[AKAnnotationPointOfInterestHelper _concreteValidatePoint:ofDraggableArea:forAnnotation:onPageController:]");
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v7;
  result.x = v6;
  return result;
}

+ (BOOL)_point:(CGPoint)a3 isInRectWithSize:(double)a4 atPoint:(CGPoint)a5
{
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGPoint v10;

  v10.y = a3.y;
  x = a3.x;
  v6 = a5.x - a4 * 0.5;
  v7 = a5.y - a4 * 0.5;
  v10.x = x;
  return CGRectContainsPoint(*(CGRect *)(&a4 - 2), v10);
}

+ (BOOL)_point:(CGPoint)a3 isInCircleWithRadius:(double)a4 atPoint:(CGPoint)a5
{
  return hypot(a5.x - a3.x, a5.y - a3.y) < a4;
}

+ (Class)_poiHelperClassForAnnotation:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_11:
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end

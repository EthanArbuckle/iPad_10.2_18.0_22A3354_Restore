@implementation AKArrowShapePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD *v45;
  objc_super v47;
  id v48;
  id v49;

  v8 = a5;
  v48 = 0;
  v49 = 0;
  v47.receiver = a1;
  v47.super_class = (Class)&OBJC_METACLASS___AKArrowShapePointOfInterestHelper;
  v9 = a6;
  objc_msgSendSuper2(&v47, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v49, &v48, v8, v9);
  v10 = v49;
  v11 = v48;
  if (objc_msgSend(v8, "conformsToAKTextAnnotationProtocol"))
  {
    v12 = objc_msgSend(v8, "textIsClipped");
    if (v12)
      v13 = 3;
    else
      v13 = 2;
  }
  else
  {
    v12 = 0;
    v13 = 2;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count", a3) + v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count") + v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v16 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(v10, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "akPointValue");
    objc_msgSend(v16, "akValueWithPoint:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

  }
  objc_msgSend(v14, "addObjectsFromArray:", v10);
  objc_msgSend(v15, "addObjectsFromArray:", v11);
  objc_msgSend(a1, "_arrowHeadOuterControlPoint:", v8);
  v21 = v20;
  v23 = v22;
  objc_msgSend(a1, "_arrowHeadInnerControlPoint:", v8);
  v25 = v24;
  v27 = v26;
  objc_msgSend(v9, "geometryHelper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "screenPixelAlignedPointForPoint:", v21, v23);
  v30 = v29;
  v32 = v31;

  objc_msgSend(v9, "geometryHelper");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "screenPixelAlignedPointForPoint:", v25, v27);
  v35 = v34;
  v37 = v36;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v30, v32);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v38);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v39);

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v35, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v40);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v41);

  v42 = objc_retainAutorelease(v14);
  *v45 = v42;
  v43 = objc_retainAutorelease(v15);
  *a4 = v43;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  objc_super v12;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "conformsToAKTextAnnotationProtocol")
    && objc_msgSend(v8, "textIsClipped"))
  {
    if (!a3)
      goto LABEL_12;
    --a3;
  }
  if (a3 < 2)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___AKArrowShapePointOfInterestHelper;
    a3 = (unint64_t)objc_msgSendSuper2(&v12, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3, v8, v9);
  }
  else
  {
    v10 = 12;
    if (a3 != 3)
      v10 = 0;
    if (a3 == 2)
      a3 = 13;
    else
      a3 = v10;
  }
LABEL_12:

  return a3;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  long double v42;
  double v43;
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
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  long double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v10 = a5;
  v11 = a6;
  v12 = v10;
  v13 = v12;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    objc_msgSend(v12, "startPoint");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v13, "endPoint");
    +[AKGeometryHelper projectPoint:ontoRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "projectPoint:ontoRayWithFirstPoint:andSecondPoint:", x, y, v15, v17, v18, v19);
    v21 = v20;
    v23 = v22;
    v24 = x - v20;
    v25 = y - v22;
    v26 = hypot(x - v20, y - v22);
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v24, v25);
    v28 = v27;
    v107 = v29;
    objc_msgSend(v13, "startPoint");
    v31 = v30;
    v33 = v32;
    objc_msgSend(v13, "endPoint");
    v36 = +[AKGeometryHelper isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:", x, y, v31, v33, v34, v35);
    v37 = v36 ^ +[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", objc_msgSend(v13, "originalExifOrientation"));
    v108 = v28;
    if (a4 == 13)
    {
      if (!v37 || (objc_msgSend(v13, "arrowLineWidth"), v38 = v26, v26 + v26 < v59))
      {
        objc_msgSend(v13, "arrowLineWidth");
        goto LABEL_14;
      }
    }
    else
    {
      if (a4 != 12)
      {
        v38 = v26;
        goto LABEL_16;
      }
      v38 = 0.0;
      if (v37)
      {
        objc_msgSend(v13, "arrowHeadWidth");
        v38 = v26;
        if (v26 + v26 > v39)
        {
          objc_msgSend(v13, "arrowHeadWidth");
LABEL_14:
          v38 = v40 * 0.5;
        }
      }
    }
LABEL_16:
    objc_msgSend(v13, "endPoint");
    v106 = v60;
    objc_msgSend(v13, "startPoint");
    v105 = v61;
    objc_msgSend(v13, "endPoint");
    v104 = v62;
    objc_msgSend(v13, "startPoint");
    v103 = v63;
    objc_msgSend(v13, "startPoint");
    v102 = v64;
    objc_msgSend(v13, "startPoint");
    v66 = v65;
    objc_msgSend(v13, "startPoint");
    v68 = v21 - v67;
    objc_msgSend(v13, "startPoint");
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v68, v23 - v69);
    objc_msgSend(v13, "endPoint");
    v71 = v70;
    objc_msgSend(v13, "startPoint");
    v73 = v71 - v72;
    objc_msgSend(v13, "endPoint");
    v75 = v74;
    objc_msgSend(v13, "startPoint");
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v73, v75 - v76);
    +[AKGeometryHelper compareVectorDirectionsFirstVector:secondVector:](AKGeometryHelper, "compareVectorDirectionsFirstVector:secondVector:");
    if (v78 < 0.0 || v77 < 0.0)
    {
      objc_msgSend(v13, "startPoint");
    }
    else
    {
      v79 = hypot(v21 - v102, v23 - v66);
      if (v79 <= hypot(v106 - v105, v104 - v103))
      {
LABEL_22:
        x = v21 + v38 * v108;
        y = v23 + v38 * v107;
        goto LABEL_23;
      }
      objc_msgSend(v13, "endPoint");
    }
    v21 = v80;
    v23 = v81;
    goto LABEL_22;
  }
  if (a4 == 10)
  {
    objc_msgSend(v12, "startPoint");
    v85 = x - v84;
    objc_msgSend(v13, "startPoint");
    v87 = hypot(v85, y - v86);
    objc_msgSend(v13, "startPoint");
    v89 = x - v88;
    objc_msgSend(v13, "startPoint");
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v89, y - v90);
    v92 = v91;
    v94 = v93;
    objc_msgSend(v13, "arrowHeadLength");
    if (v87 < v95)
    {
      objc_msgSend(v13, "startPoint");
      v97 = v96;
      objc_msgSend(v13, "arrowHeadLength");
      x = v97 + v98 * v92;
      objc_msgSend(v13, "startPoint");
      v100 = v99;
      objc_msgSend(v13, "arrowHeadLength");
      y = v100 + v101 * v94;
    }
  }
  else if (a4 == 9)
  {
    objc_msgSend(v12, "endPoint");
    v42 = v41 - x;
    objc_msgSend(v13, "endPoint");
    v44 = hypot(v42, v43 - y);
    objc_msgSend(v13, "endPoint");
    v46 = v45 - x;
    objc_msgSend(v13, "endPoint");
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v46, v47 - y);
    v49 = v48;
    v51 = v50;
    objc_msgSend(v13, "arrowHeadLength");
    if (v44 < v52)
    {
      objc_msgSend(v13, "endPoint");
      v54 = v53;
      objc_msgSend(v13, "arrowHeadLength");
      x = v54 - v55 * v49;
      objc_msgSend(v13, "endPoint");
      v57 = v56;
      objc_msgSend(v13, "arrowHeadLength");
      y = v57 - v58 * v51;
    }
  }
LABEL_23:

  v82 = x;
  v83 = y;
  result.y = v83;
  result.x = v82;
  return result;
}

+ (CGPoint)_normalizedDirectionVector:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "endPoint");
  v5 = v4;
  objc_msgSend(v3, "startPoint");
  v7 = v5 - v6;
  objc_msgSend(v3, "endPoint");
  v9 = v8;
  objc_msgSend(v3, "startPoint");
  v11 = v10;

  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v7, v9 - v11);
  result.y = v13;
  result.x = v12;
  return result;
}

+ (CGPoint)_centeredBaseControlPoint:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "arrowHeadLength");
  v5 = v4;
  objc_msgSend(v3, "endPoint");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "startPoint");
  v11 = v10 - v7;
  objc_msgSend(v3, "startPoint");
  v13 = v12;

  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v11, v13 - v9);
  v15 = v7 + v5 * v14;
  v17 = v9 + v5 * v16;
  result.y = v17;
  result.x = v15;
  return result;
}

+ (CGPoint)_arrowHeadInnerControlPoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
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
  CGPoint result;

  v4 = a3;
  objc_msgSend(a1, "_centeredBaseControlPoint:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "_normalizedDirectionVector:", v4);
  v10 = v9;
  v12 = v11;
  if (+[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", objc_msgSend(v4, "originalExifOrientation")))
  {
    v13 = 1.0;
  }
  else
  {
    v13 = -1.0;
  }
  objc_msgSend(v4, "arrowLineWidth");
  v15 = v6 + v12 * v13 * (v14 * 0.5);
  objc_msgSend(v4, "arrowLineWidth");
  v17 = v16;

  v18 = v8 + -(v13 * v10) * (v17 * 0.5);
  v19 = v15;
  result.y = v18;
  result.x = v19;
  return result;
}

+ (CGPoint)_arrowHeadOuterControlPoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
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
  CGPoint result;

  v4 = a3;
  objc_msgSend(a1, "_centeredBaseControlPoint:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "_normalizedDirectionVector:", v4);
  v10 = v9;
  v12 = v11;
  if (+[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", objc_msgSend(v4, "originalExifOrientation")))
  {
    v13 = 1.0;
  }
  else
  {
    v13 = -1.0;
  }
  objc_msgSend(v4, "arrowHeadWidth");
  v15 = v6 + v12 * v13 * (v14 * 0.5);
  objc_msgSend(v4, "arrowHeadWidth");
  v17 = v16;

  v18 = v8 + -(v13 * v10) * (v17 * 0.5);
  v19 = v15;
  result.y = v18;
  result.x = v19;
  return result;
}

@end

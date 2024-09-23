@implementation UIBezierPath(CalloutSelectionAccessoryPointer)

+ (id)bezierPathWithCalloutRect:()CalloutSelectionAccessoryPointer unitLocation:edge:
{
  void *v13;
  double MinX;
  CGFloat v15;
  double MinY;
  double v17;
  CGFloat v18;
  double MaxX;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double MaxY;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  objc_msgSend(v13, "moveToPoint:", MinX, CGRectGetMinY(v33) + 14.0);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  v15 = CGRectGetMinX(v34) + 14.0;
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  MinY = CGRectGetMinY(v35);
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.width = a3;
  v36.size.height = a4;
  v17 = CGRectGetMinX(v36);
  v37.origin.x = a1;
  v37.origin.y = a2;
  v37.size.width = a3;
  v37.size.height = a4;
  objc_msgSend(v13, "addQuadCurveToPoint:controlPoint:", v15, MinY, v17, CGRectGetMinY(v37));
  if (a8 == 1)
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 1, a5, a1, a2, a3, a4);
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  v18 = CGRectGetMaxX(v38) + -14.0;
  v39.origin.x = a1;
  v39.origin.y = a2;
  v39.size.width = a3;
  v39.size.height = a4;
  objc_msgSend(v13, "addLineToPoint:", v18, CGRectGetMinY(v39));
  v40.origin.x = a1;
  v40.origin.y = a2;
  v40.size.width = a3;
  v40.size.height = a4;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.x = a1;
  v41.origin.y = a2;
  v41.size.width = a3;
  v41.size.height = a4;
  v20 = CGRectGetMinY(v41) + 14.0;
  v42.origin.x = a1;
  v42.origin.y = a2;
  v42.size.width = a3;
  v42.size.height = a4;
  v21 = CGRectGetMaxX(v42);
  v43.origin.x = a1;
  v43.origin.y = a2;
  v43.size.width = a3;
  v43.size.height = a4;
  objc_msgSend(v13, "addQuadCurveToPoint:controlPoint:", MaxX, v20, v21, CGRectGetMinY(v43));
  if (a8 == 4)
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 4, a5, a1, a2, a3, a4);
  v44.origin.x = a1;
  v44.origin.y = a2;
  v44.size.width = a3;
  v44.size.height = a4;
  v22 = CGRectGetMaxX(v44);
  v45.origin.x = a1;
  v45.origin.y = a2;
  v45.size.width = a3;
  v45.size.height = a4;
  objc_msgSend(v13, "addLineToPoint:", v22, CGRectGetMaxY(v45) + -14.0);
  v46.origin.x = a1;
  v46.origin.y = a2;
  v46.size.width = a3;
  v46.size.height = a4;
  v23 = CGRectGetMaxX(v46) + -14.0;
  v47.origin.x = a1;
  v47.origin.y = a2;
  v47.size.width = a3;
  v47.size.height = a4;
  MaxY = CGRectGetMaxY(v47);
  v48.origin.x = a1;
  v48.origin.y = a2;
  v48.size.width = a3;
  v48.size.height = a4;
  v25 = CGRectGetMaxX(v48);
  v49.origin.x = a1;
  v49.origin.y = a2;
  v49.size.width = a3;
  v49.size.height = a4;
  objc_msgSend(v13, "addQuadCurveToPoint:controlPoint:", v23, MaxY, v25, CGRectGetMaxY(v49));
  if (a8 == 2)
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 2, a5, a1, a2, a3, a4);
  v50.origin.x = a1;
  v50.origin.y = a2;
  v50.size.width = a3;
  v50.size.height = a4;
  v26 = CGRectGetMinX(v50) + 14.0;
  v51.origin.x = a1;
  v51.origin.y = a2;
  v51.size.width = a3;
  v51.size.height = a4;
  objc_msgSend(v13, "addLineToPoint:", v26, CGRectGetMaxY(v51));
  v52.origin.x = a1;
  v52.origin.y = a2;
  v52.size.width = a3;
  v52.size.height = a4;
  v27 = CGRectGetMinX(v52);
  v53.origin.x = a1;
  v53.origin.y = a2;
  v53.size.width = a3;
  v53.size.height = a4;
  v28 = CGRectGetMaxY(v53) + -14.0;
  v54.origin.x = a1;
  v54.origin.y = a2;
  v54.size.width = a3;
  v54.size.height = a4;
  v29 = CGRectGetMinX(v54);
  v55.origin.x = a1;
  v55.origin.y = a2;
  v55.size.width = a3;
  v55.size.height = a4;
  objc_msgSend(v13, "addQuadCurveToPoint:controlPoint:", v27, v28, v29, CGRectGetMaxY(v55));
  if (a8 == 3)
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 3, a5, a1, a2, a3, a4);
  objc_msgSend(v13, "closePath");
  return v13;
}

+ (double)pointerMargin
{
  return 38.0;
}

- (uint64_t)addPointerAtUnitLocation:()CalloutSelectionAccessoryPointer rect:edge:
{
  unint64_t v15;
  CGFloat v16;
  double Height;
  double v21;
  uint64_t result;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  double MinY;
  double MaxX;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
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
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v15 = a8 - 1;
  v16 = a3;
  if ((unint64_t)(a8 - 1) > 1)
    Height = CGRectGetHeight(*(CGRect *)&v16);
  else
    Height = CGRectGetWidth(*(CGRect *)&v16);
  v21 = Height;
  result = objc_msgSend(MEMORY[0x1E0CEA390], "pointerMargin");
  v24 = v21 + v23 * -2.0;
  v25 = a8 & 0xFFFFFFFFFFFFFFFELL;
  v26 = 1.0 - a2;
  if ((a8 & 0xFFFFFFFFFFFFFFFELL) != 2)
    v26 = a2;
  v27 = v26 * v24 + 14.0 + 10.0;
  switch(a8)
  {
    case 4:
      v59.origin.x = a3;
      v59.origin.y = a4;
      v59.size.width = a5;
      v59.size.height = a6;
      MinY = CGRectGetMinY(v59);
      v60.origin.x = a3;
      v60.origin.y = a4;
      v60.size.width = a5;
      v60.size.height = a6;
      MaxX = CGRectGetMaxX(v60);
      break;
    case 1:
      v57.origin.x = a3;
      v57.origin.y = a4;
      v57.size.width = a5;
      v57.size.height = a6;
      MinY = CGRectGetMinX(v57);
      v58.origin.x = a3;
      v58.origin.y = a4;
      v58.size.width = a5;
      v58.size.height = a6;
      MaxX = CGRectGetMinY(v58);
      break;
    case 2:
      v27 = -v27;
      v61.origin.x = a3;
      v61.origin.y = a4;
      v61.size.width = a5;
      v61.size.height = a6;
      MinY = CGRectGetMaxX(v61);
      v62.origin.x = a3;
      v62.origin.y = a4;
      v62.size.width = a5;
      v62.size.height = a6;
      MaxX = CGRectGetMaxY(v62);
      break;
    case 3:
      v27 = -v27;
      v63.origin.x = a3;
      v63.origin.y = a4;
      v63.size.width = a5;
      v63.size.height = a6;
      MinY = CGRectGetMaxY(v63);
      v64.origin.x = a3;
      v64.origin.y = a4;
      v64.size.width = a5;
      v64.size.height = a6;
      MaxX = CGRectGetMinX(v64);
      break;
    default:
      return result;
  }
  v30 = MinY + v27;
  if (v25 == 2)
    v31 = -14.0;
  else
    v31 = 14.0;
  v32 = 5.0;
  if (v25 == 2)
    v32 = -5.0;
  v33 = 3.0;
  if (v25 == 2)
    v33 = -3.0;
  v34 = v30 + v31 * 2.0;
  v35 = v34 - v32;
  if (v15 >= 2)
    v36 = MaxX;
  else
    v36 = v34 - v32;
  if (v15 < 2)
    v35 = MaxX;
  v55 = v35;
  v56 = v36;
  if (a8 == 4 || a8 == 2)
    v38 = -14.0;
  else
    v38 = 14.0;
  if (v15 >= 2)
    v39 = MaxX;
  else
    v39 = MinY + v27;
  if (v15 >= 2)
    v40 = MinY + v27;
  else
    v40 = MaxX;
  v41 = v31 + v30;
  v42 = MaxX - v38;
  if (v15 >= 2)
    v43 = v42;
  else
    v43 = v41;
  if (v15 >= 2)
    v44 = v41;
  else
    v44 = v42;
  v45 = v32 + v30;
  if (v15 >= 2)
    v46 = MaxX;
  else
    v46 = v45;
  if (v15 >= 2)
    v47 = v45;
  else
    v47 = MaxX;
  if (v15 >= 2)
    v48 = v42;
  else
    v48 = v41 - v33;
  if (v15 >= 2)
    v49 = v41 - v33;
  else
    v49 = v42;
  if (v15 >= 2)
    v50 = MaxX;
  else
    v50 = v34;
  if (v15 < 2)
  {
    v51 = v33 + v41;
  }
  else
  {
    MaxX = v34;
    v51 = v42;
  }
  if (v15 >= 2)
    v52 = v33 + v41;
  else
    v52 = v42;
  objc_msgSend(a1, "addLineToPoint:", v39, v40, *(_QWORD *)&MaxX, *(_QWORD *)&v50);
  objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:", v43, v44, v46, v47, v48, v49);
  return objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:", v54, v53, v51, v52, v56, v55);
}

@end

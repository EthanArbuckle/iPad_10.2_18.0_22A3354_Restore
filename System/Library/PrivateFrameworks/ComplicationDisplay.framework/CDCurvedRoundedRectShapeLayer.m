@implementation CDCurvedRoundedRectShapeLayer

- (CDCurvedRoundedRectShapeLayer)initWithAngularWidth:(double)a3 innerRadius:(double)a4 outerRadius:(double)a5 cornerRadius:(double)a6
{
  CDCurvedRoundedRectShapeLayer *v10;
  double v11;
  CGPath *Mutable;
  __double2 v13;
  long double v14;
  double v15;
  double v16;
  CGPath *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  long double v23;
  float64x2_t v24;
  __double2 v25;
  float32x2_t v26;
  __double2 v27;
  float32x2_t v28;
  float sinval;
  __double2 v30;
  float32x2_t v31;
  float v32;
  float v33;
  float v34;
  float32x2_t v35;
  float v36;
  float v37;
  CGFloat v38;
  float32x2_t v39;
  float v40;
  float v41;
  double v43;
  float v44;
  float v45;
  float32x2_t v46;
  float32x2_t v47;
  double v48;
  float v49;
  float v50;
  float32x2_t v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float32x2_t v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)CDCurvedRoundedRectShapeLayer;
  v10 = -[CDCurvedRoundedRectShapeLayer init](&v56, sel_init);
  if (v10)
  {
    v11 = a3 * 0.5;
    Mutable = CGPathCreateMutable();
    if (a6 == 0.0)
    {
      v13 = __sincos_stret(a3 * 0.5);
      CGPathMoveToPoint(Mutable, 0, v13.__cosval * a5, v13.__sinval * a5);
      CGPathAddLineToPoint(Mutable, 0, v13.__cosval * a4, v13.__sinval * a4);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a4, v11, -v11, 1);
      v14 = sin(-v11);
      CGPathAddLineToPoint(Mutable, 0, v13.__cosval * a5, v14 * a5);
      v15 = 0.0;
      v16 = 0.0;
      v17 = Mutable;
      v18 = a5;
      v19 = -v11;
    }
    else
    {
      v43 = a6 * a6 / (a4 + a4) + a6;
      v20 = a6 - a6 * a6 / (a5 + a5);
      v21 = a4 + a6;
      v22 = atan2(v43, a4 + a6);
      v23 = a5 - a6;
      v48 = atan2(v20, v23);
      v25 = __sincos_stret(v11);
      v24.f64[0] = v25.__cosval;
      v24.f64[1] = v25.__sinval;
      v26 = vcvt_f32_f64(v24);
      v27 = __sincos_stret(v11 - v22);
      v28.f32[0] = v27.__cosval;
      sinval = v27.__sinval;
      v44 = sinval;
      v45 = v28.f32[0];
      v28.f32[1] = sinval;
      v51 = v28;
      v30 = __sincos_stret(v11 - v48);
      v31.f32[0] = v30.__cosval;
      v32 = v30.__sinval;
      v49 = v32;
      v50 = v31.f32[0];
      v31.f32[1] = v32;
      v47 = v31;
      v33 = v23;
      v46 = vmul_n_f32(v26, v33);
      CGPathMoveToPoint(Mutable, 0, v46.f32[0], v46.f32[1]);
      v11 = v11 + 1.57079633;
      v34 = v21;
      v35 = vmul_n_f32(v26, v34);
      v36 = v43 + a4;
      v52 = vmul_n_f32(v51, v36);
      CGPathAddLineToPoint(Mutable, 0, v35.f32[0], v35.f32[1]);
      CGPathAddArc(Mutable, 0, v52.f32[0], v52.f32[1], v43, v11, v11 + 1.57079633 - v22, 0);
      v53 = vmul_f32(v52, (float32x2_t)0xBF8000003F800000);
      v37 = atan2f(v44, v45);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a4, v37, -v37, 1);
      CGPathAddArc(Mutable, 0, v53.f32[0], v53.f32[1], v43, -(v11 + 1.57079633 - v22), -v11, 0);
      v38 = 1.57079633 - v11 + v48;
      v39 = vmul_f32(v46, (float32x2_t)0xBF8000003F800000);
      v40 = a5 - v20;
      v54 = vmul_f32(vmul_n_f32(v47, v40), (float32x2_t)0xBF8000003F800000);
      CGPathAddLineToPoint(Mutable, 0, v39.f32[0], v39.f32[1]);
      CGPathAddArc(Mutable, 0, v54.f32[0], v54.f32[1], v20, -v11, v38, 0);
      v55 = vmul_f32(v54, (float32x2_t)0xBF8000003F800000);
      v41 = atan2f(-v49, v50);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a5, v41, -v41, 0);
      v15 = v55.f32[0];
      v16 = v55.f32[1];
      v17 = Mutable;
      v18 = v20;
      v19 = -v38;
    }
    CGPathAddArc(v17, 0, v15, v16, v18, v19, v11, 0);
    CGPathCloseSubpath(Mutable);
    -[CDCurvedRoundedRectShapeLayer setPath:](v10, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
  return v10;
}

- (CDCurvedRoundedRectShapeLayer)initWithAngularWidth:(double)a3 innerRadius:(double)a4 outerRadius:(double)a5 cornerRadius:(double)a6 style:(int64_t)a7
{
  CDCurvedRoundedRectShapeLayer *v12;
  CGPath *Mutable;
  double v14;
  double v15;
  float64x2_t v16;
  __double2 v17;
  float32x2_t v18;
  __double2 v19;
  float32x2_t v20;
  float sinval;
  __double2 v22;
  float32x2_t v23;
  float v24;
  float v25;
  double v26;
  double v27;
  double v28;
  __double2 v29;
  float cosval;
  __double2 v31;
  float v32;
  float v33;
  double v34;
  float v35;
  double v36;
  float v37;
  CGFloat v38;
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
  float v57;
  float v58;
  float v59;
  double v60;
  double v61;
  CGPath *v62;
  double v63;
  double v64;
  CGFloat v65;
  float v66;
  float v67;
  CGFloat v68;
  CDCurvedRoundedRectShapeLayer *v69;
  double v71;
  float32x2_t v72;
  double v73;
  float32x2_t v74;
  float v75;
  double v76;
  float32x2_t v77;
  float endAnglea;
  double endAngle;
  float endAngleb;
  float32x2_t v81;
  double v82;
  float v83;
  float v84;
  double v85;
  float32x2_t v86;
  float startAnglea;
  CGFloat startAngle;
  float startAngleb;
  double v90;
  float v91;
  double v92;
  float32x2_t v93;
  float32x2_t v94;
  float32x2_t v95;
  double v96;
  double v97;
  float v98;
  float32x2_t v99;
  float32x2_t v100;
  double v101;
  double v102;
  double v103;
  double v104;
  objc_super v105;

  if (a7 != 3 && a7)
  {
    v105.receiver = self;
    v105.super_class = (Class)CDCurvedRoundedRectShapeLayer;
    v12 = -[CDCurvedRoundedRectShapeLayer init](&v105, sel_init);
    if (!v12)
      goto LABEL_11;
    Mutable = CGPathCreateMutable();
    v14 = a3 * 0.5;
    v103 = a6 - a6 * a6 / (a5 + a5);
    v104 = a6 * a6 / (a4 + a4) + a6;
    v73 = a4 + a6;
    v101 = atan2(v104, a4 + a6);
    v15 = a5 - a6;
    v96 = atan2(v103, a5 - a6);
    v17 = __sincos_stret(v14);
    v16.f64[0] = v17.__cosval;
    v16.f64[1] = v17.__sinval;
    v18 = vcvt_f32_f64(v16);
    v19 = __sincos_stret(v14 - v101);
    v20.f32[0] = v19.__cosval;
    sinval = v19.__sinval;
    v83 = sinval;
    v84 = v20.f32[0];
    v20.f32[1] = sinval;
    v81 = v20;
    v22 = __sincos_stret(v14 - v96);
    v23.f32[0] = v22.__cosval;
    v91 = v23.f32[0];
    v24 = v22.__sinval;
    startAnglea = v24;
    v23.f32[1] = v24;
    v93 = v23;
    v25 = v15;
    v72 = v18;
    v99 = vmul_n_f32(v18, v25);
    v26 = (a5 - a4) * 0.5;
    v27 = atan2(v26 + v26 * v26 / (a4 + a4), v26 + a4);
    v28 = atan2(v26 - v26 * v26 / (a5 + a5), a5 - v26);
    v29 = __sincos_stret(v14 - v27);
    cosval = v29.__cosval;
    *(float *)&v26 = v29.__sinval;
    v31 = __sincos_stret(v14 - v28);
    v32 = v31.__cosval;
    endAnglea = v32;
    v33 = v31.__sinval;
    v75 = v33;
    v34 = v14 + 1.57079633;
    v90 = v34 + 1.57079633 - v101;
    v35 = v104 + a4;
    v74 = vmul_n_f32(v81, v35);
    v102 = v34 + 1.57079633 - v27;
    v85 = atan2f(v83, v84);
    v36 = atan2f(*(float *)&v26, cosval);
    v97 = 1.57079633 - v34 + v96;
    v37 = a5 - v103;
    v94 = vmul_f32(vmul_n_f32(v93, v37), (float32x2_t)0xBF8000003F800000);
    v82 = 1.57079633 - v34 + v28;
    v38 = atan2f(-v75, endAnglea);
    endAngle = -v36;
    -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v12, "_pointAtAngle:radius:", -v36, a4);
    v40 = v39;
    v42 = v41;
    -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v12, "_pointAtAngle:radius:", v38, a5);
    -[CDCurvedRoundedRectShapeLayer _midPointOfPoint1:point2:](v12, "_midPointOfPoint1:point2:", v40, v42, v43, v44);
    v76 = v45;
    v71 = v46;
    v92 = atan2f(-startAnglea, v91);
    startAngle = v38;
    v47 = -v38;
    -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v12, "_pointAtAngle:radius:", v36, a4);
    v49 = v48;
    v51 = v50;
    -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v12, "_pointAtAngle:radius:", v47, a5);
    -[CDCurvedRoundedRectShapeLayer _midPointOfPoint1:point2:](v12, "_midPointOfPoint1:point2:", v49, v51, v52, v53);
    if (a7 == 2)
    {
      v66 = v55;
      startAngleb = v66;
      v67 = v54;
      endAngleb = v67;
      v100 = vmul_f32(v99, (float32x2_t)0xBF8000003F800000);
      v68 = -v85;
      v86 = vmul_f32(v74, (float32x2_t)0xBF8000003F800000);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a4, v36, v68, 1);
      CGPathAddArc(Mutable, 0, v86.f32[0], v86.f32[1], v104, -v90, -v34, 0);
      CGPathAddLineToPoint(Mutable, 0, v100.f32[0], v100.f32[1]);
      CGPathAddArc(Mutable, 0, v94.f32[0], v94.f32[1], v103, -v34, v97, 0);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a5, v92, v47, 0);
      v60 = endAngleb;
      v61 = startAngleb;
      v62 = Mutable;
      v63 = (a5 - a4) * 0.5;
      v64 = -v82;
      v65 = v102;
    }
    else
    {
      if (a7 != 1)
      {
LABEL_10:
        CGPathCloseSubpath(Mutable);
        -[CDCurvedRoundedRectShapeLayer setPath:](v12, "setPath:", Mutable);
        CGPathRelease(Mutable);
        goto LABEL_11;
      }
      v95 = vmul_f32(v94, (float32x2_t)0xBF8000003F800000);
      v56 = -v97;
      v57 = v76;
      v98 = v57;
      v58 = v71;
      v59 = v73;
      v77 = vmul_n_f32(v72, v59);
      CGPathMoveToPoint(Mutable, 0, v99.f32[0], v99.f32[1]);
      CGPathAddLineToPoint(Mutable, 0, v77.f32[0], v77.f32[1]);
      CGPathAddArc(Mutable, 0, v74.f32[0], v74.f32[1], v104, v34, v90, 0);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a4, v85, endAngle, 1);
      CGPathAddArc(Mutable, 0, v98, v58, (a5 - a4) * 0.5, -v102, v82, 0);
      CGPathAddArc(Mutable, 0, 0.0, 0.0, a5, startAngle, -v92, 0);
      v60 = v95.f32[0];
      v61 = v95.f32[1];
      v62 = Mutable;
      v63 = v103;
      v64 = v56;
      v65 = v34;
    }
    CGPathAddArc(v62, 0, v60, v61, v63, v64, v65, 0);
    goto LABEL_10;
  }
  v12 = -[CDCurvedRoundedRectShapeLayer initWithAngularWidth:innerRadius:outerRadius:cornerRadius:](self, "initWithAngularWidth:innerRadius:outerRadius:cornerRadius:");
LABEL_11:
  v69 = v12;

  return v69;
}

- (CDCurvedRoundedRectShapeLayer)initWithAngularWidth:(double)a3 innerRadius:(double)a4 outerRadius:(double)a5 cornerRadius:(double)a6 style:(int64_t)a7 gapAngle:(double)a8
{
  CDCurvedRoundedRectShapeLayer *v14;
  CDCurvedRoundedRectShapeLayer *v15;
  CDCurvedRoundedRectShapeLayer *v16;
  id v17;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  long double v43;
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
  id v60;
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
  double v85;
  double v86;
  double v87;
  objc_super v88;

  v88.receiver = self;
  v88.super_class = (Class)CDCurvedRoundedRectShapeLayer;
  v14 = -[CDCurvedRoundedRectShapeLayer init](&v88, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_7;
  if ((a5 - a4) * 0.5 >= a6)
  {
    if ((unint64_t)(a7 - 1) > 1)
    {
      v17 = objc_alloc_init(MEMORY[0x24BEBD420]);
      v18 = a3 * 0.5;
      v86 = atan2(a6, a5);
      v82 = atan2(a6, a4);
      -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v15, "_pointAtAngle:radius:", v18, a5);
      v20 = v19;
      v22 = v21;
      -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v15, "_pointAtAngle:radius:", v18 + a8 * 0.5, a5);
      v25 = v24 / v23;
      v73 = v22 - v24 / v23 * v20;
      -[CDCurvedRoundedRectShapeLayer _findPointOfIntersectionBetweenCircleOfRadius:slope:offset:](v15, "_findPointOfIntersectionBetweenCircleOfRadius:slope:offset:", a4, v24 / v23, v73);
      v77 = v26;
      -[CDCurvedRoundedRectShapeLayer _findNewOffsetOfParalelLineWithSlope:offset:distanceFrom:](v15, "_findNewOffsetOfParalelLineWithSlope:offset:distanceFrom:", v25, v73, a6);
      v28 = v27;
      -[CDCurvedRoundedRectShapeLayer _findCircleLineIntersectionWithOffset:cornerRadiusOffset:radius:slope:](v15, "_findCircleLineIntersectionWithOffset:cornerRadiusOffset:radius:slope:");
      v30 = v29;
      v32 = v31;
      v81 = v86 - v18;
      v83 = v18 - v86;
      -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v15, "_pointAtAngle:radius:", v18, a5);
      v84 = v34;
      v85 = v33;
      -[CDCurvedRoundedRectShapeLayer _findIntersectionOfCircle:cornerRadius:offset:](v15, "_findIntersectionOfCircle:cornerRadius:offset:", v30, v32, a6, v28);
      v36 = v35;
      v65 = v37;
      v62 = v35;
      -[CDCurvedRoundedRectShapeLayer _findPointThatIsDistance:fromPoint:onSlope:offset:](v15, "_findPointThatIsDistance:fromPoint:onSlope:offset:", a5 - a6 - (a4 + a6), v35, v37, v25, v73);
      v39 = v38;
      v75 = v40;
      -[CDCurvedRoundedRectShapeLayer _findCircleLineIntersectionWithOffset:cornerRadiusOffset:radius:slope:](v15, "_findCircleLineIntersectionWithOffset:cornerRadiusOffset:radius:slope:", v28, a6, a4, v25);
      -[CDCurvedRoundedRectShapeLayer _findIntersectionOfCircle:cornerRadius:offset:](v15, "_findIntersectionOfCircle:cornerRadius:offset:");
      v79 = v42;
      v80 = v41;
      v43 = acos(v77 / a4) - v82;
      -[CDCurvedRoundedRectShapeLayer _findPointOfIntersectionBetweenCircleOfRadius:slope:offset:](v15, "_findPointOfIntersectionBetweenCircleOfRadius:slope:offset:", a4, v25, v73);
      v45 = v44;
      v63 = v73 + v44 * v25;
      -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v15, "_pointAtAngle:radius:", (double)v43, a4);
      v66 = v47;
      v67 = v46;
      -[CDCurvedRoundedRectShapeLayer _getMirroredPoint:](v15, "_getMirroredPoint:", v39, v75);
      v76 = v49;
      v78 = v48;
      -[CDCurvedRoundedRectShapeLayer _getMirroredPoint:](v15, "_getMirroredPoint:", v45, v63);
      v72 = v51;
      v74 = v50;
      -[CDCurvedRoundedRectShapeLayer _getMirroredPoint:](v15, "_getMirroredPoint:", v36, v65);
      v70 = v53;
      v71 = v52;
      -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v15, "_pointAtAngle:radius:", v81, a5);
      v68 = v55;
      v69 = v54;
      -[CDCurvedRoundedRectShapeLayer _pointAtAngle:radius:](v15, "_pointAtAngle:radius:", v81 - v86, a5);
      v87 = v56;
      v64 = v57;
      v59 = *MEMORY[0x24BDBEFB0];
      v58 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, *MEMORY[0x24BDBEFB0], v58, a5, v81, v83);
      objc_msgSend(v17, "addQuadCurveToPoint:controlPoint:", v62, v65, v85, v84);
      objc_msgSend(v17, "addLineToPoint:", v80, v79);
      objc_msgSend(v17, "addQuadCurveToPoint:controlPoint:", v67, v66, v45, v63);
      objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v59, v58, a4, (double)v43, (double)-v43);
      objc_msgSend(v17, "addQuadCurveToPoint:controlPoint:", v78, v76, v74, v72);
      objc_msgSend(v17, "addLineToPoint:", v71, v70);
      objc_msgSend(v17, "addQuadCurveToPoint:controlPoint:", v69, v68, v87, v64);
      v60 = objc_retainAutorelease(v17);
      -[CDCurvedRoundedRectShapeLayer setPath:](v15, "setPath:", objc_msgSend(v60, "CGPath"));

    }
    else
    {
      v15 = -[CDCurvedRoundedRectShapeLayer initWithAngularWidth:innerRadius:outerRadius:cornerRadius:style:](v14, "initWithAngularWidth:innerRadius:outerRadius:cornerRadius:style:", a7, a3, a4, a5, a6);
    }
LABEL_7:
    v15 = v15;
    v16 = v15;
    goto LABEL_8;
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (CGPoint)_findCircleLineIntersectionWithOffset:(double)a3 cornerRadiusOffset:(double)a4 radius:(double)a5 slope:(double)a6
{
  double v8;
  double v9;
  CGPoint result;

  -[CDCurvedRoundedRectShapeLayer _findPointOfIntersectionBetweenCircleOfRadius:slope:offset:](self, "_findPointOfIntersectionBetweenCircleOfRadius:slope:offset:", a4 + a5, a6, a3);
  v9 = a3 + a6 * v8;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_findPointThatIsDistance:(double)a3 fromPoint:(CGPoint)a4 onSlope:(double)a5 offset:(double)a6
{
  float x;
  float v7;
  double v8;
  double v9;
  CGPoint result;

  x = a4.x;
  v7 = a4.y - a6;
  v8 = a4.x - a4.x * a3 / sqrtf((float)(x * x) + (float)(v7 * v7));
  v9 = a6 + v8 * a5;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)_findPointOfIntersectionBetweenCircleOfRadius:(double)a3 slope:(double)a4 offset:(double)a5
{
  double v5;
  float v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  float v12;

  v5 = (a4 + a4) * a5;
  v6 = a4;
  v7 = v6 * v6;
  v8 = v7 * 4.0;
  v9 = a5;
  v10 = (float)(v7 + 1.0);
  v11 = a3;
  v12 = v10 * -4.0 * (float)((float)(v9 * v9) - (float)(v11 * v11)) + v8 * (float)(v9 * v9);
  return (sqrtf(v12) - v5) / (v10 + v10);
}

- (CGPoint)_getMirroredPoint:(CGPoint)a3
{
  CGFloat y;
  float64x2_t v4;
  double v5;
  CGPoint result;

  y = a3.y;
  v4 = vcvtq_f64_f32(vmul_f32(vcvt_f32_f64((float64x2_t)a3), (float32x2_t)0xBF8000003F800000));
  v5 = v4.f64[1];
  result.x = v4.f64[0];
  result.y = v5;
  return result;
}

- (CGPoint)_pointAtAngle:(double)a3 radius:(double)a4
{
  float v5;
  __float2 v6;
  double v7;
  double v8;
  CGPoint result;

  v5 = a3;
  v6 = __sincosf_stret(v5);
  v7 = v6.__sinval * a4;
  v8 = v6.__cosval * a4;
  result.y = v7;
  result.x = v8;
  return result;
}

- (CGPoint)_midPointOfPoint1:(CGPoint)a3 point2:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = (a3.x + a4.x) * 0.5;
  v5 = (a3.y + a4.y) * 0.5;
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_findNewOffsetOfParalelLineWithSlope:(double)a3 offset:(double)a4 distanceFrom:(double)a5
{
  float32_t v5;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float v15;
  float32x2_t v16;

  v5 = a3 + a4 - a4;
  __asm { FMOV            V4.2S, #1.0 }
  _D4.f32[1] = v5;
  v11 = vmul_f32(_D4, _D4);
  v11.i32[0] = vadd_f32(v11, (float32x2_t)vdup_lane_s32((int32x2_t)v11, 1)).u32[0];
  v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  v14 = vmul_n_f32(_D4, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]);
  _D4.f32[0] = -v14.f32[0];
  v14.i32[0] = vdup_lane_s32((int32x2_t)v14, 1).u32[0];
  v14.i32[1] = _D4.i32[0];
  v15 = a5;
  v16 = vmul_n_f32(v14, v15);
  v14.f32[0] = v16.f32[0] + 0.0;
  v16.f32[0] = v16.f32[1] + a4;
  return v16.f32[0] - (a4 + a3 * v14.f32[0]) + a4;
}

- (CGPoint)_findIntersectionOfCircle:(CGPoint)a3 cornerRadius:(double)a4 offset:(double)a5
{
  float64x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  int32x2_t v9;
  float v10;
  float32x2_t v11;
  double v12;
  double v13;
  CGPoint result;

  v5.f64[0] = a3.x;
  v5.f64[1] = a3.y - a5;
  v6 = vcvt_f32_f64(v5);
  *(float32x2_t *)&v5.f64[0] = vmul_f32(v6, v6);
  LODWORD(v5.f64[0]) = vadd_f32(*(float32x2_t *)&v5.f64[0], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v5.f64[0], 1)).u32[0];
  v7 = vrsqrte_f32((float32x2_t)LODWORD(v5.f64[0]));
  v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)LODWORD(v5.f64[0]), vmul_f32(v7, v7)));
  v9 = (int32x2_t)vmul_n_f32(v6, vmul_f32(v8, vrsqrts_f32((float32x2_t)LODWORD(v5.f64[0]), vmul_f32(v8, v8))).f32[0]);
  LODWORD(v5.f64[0]) = vdup_lane_s32(v9, 1).u32[0];
  *((float *)v5.f64 + 1) = -*(float *)v9.i32;
  v10 = a4;
  v11 = vmul_n_f32(*(float32x2_t *)&v5.f64[0], v10);
  v12 = a3.x - v11.f32[0];
  v13 = a3.y - v11.f32[1];
  result.y = v13;
  result.x = v12;
  return result;
}

@end

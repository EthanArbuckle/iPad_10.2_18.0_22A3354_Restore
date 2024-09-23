@implementation CAKeyframeAnimation

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  char *v7;
  unsigned int *v8;
  unsigned int v9;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xB0uLL, 0x743898A5uLL);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    v8 = (unsigned int *)(v6 + 8);
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((_QWORD *)v6 + 9) = 0;
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((_QWORD *)v6 + 12) = 0;
    *((_QWORD *)v6 + 13) = 0;
    *((_DWORD *)v6 + 3) = 27;
    ++dword_1ECDC7C94;
    *(_QWORD *)v6 = off_1E1597CE8;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    v6[144] = 1;
    *((_QWORD *)v6 + 20) = 0;
    *((_QWORD *)v6 + 21) = 0;
    *((_QWORD *)v6 + 19) = 0;
    if (!-[CAKeyframeAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", v6, a3))
    {
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (v9 == 1)
        (*(void (**)(char *))(*(_QWORD *)v7 + 16))(v7);
      return 0;
    }
  }
  else
  {
    -[CAKeyframeAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", 0, a3);
  }
  return v7;
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  int v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_10;
  v7 = CAInternAtom((const __CFString *)a4, 0);
  if (v7 <= 330)
  {
    if (v7 != 57 && v7 != 139)
      goto LABEL_10;
LABEL_9:
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  if (v7 == 331 || v7 == 549 || v7 == 545)
    goto LABEL_9;
LABEL_10:
  v9.receiver = self;
  v9.super_class = (Class)CAKeyframeAnimation;
  return -[NSObject CA_validateValue:forKey:](&v9, sel_CA_validateValue_forKey_, a3, a4);
}

- (void)setCalculationMode:(CAAnimationCalculationMode)calculationMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = calculationMode;
  CAAnimation_setter((uint64_t)self, (const void *)0x4E, 3, (unsigned __int8 *)v3);
}

- (void)setValues:(NSArray *)values
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = values;
  CAAnimation_setter((uint64_t)self, (const void *)0x240, 3, (unsigned __int8 *)v3);
}

- (void)CA_prepareRenderValue
{
  NSArray *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  v2 = -[CAKeyframeAnimation values](self, "values");
  if (v2)
  {
    v3 = v2;
    v4 = -[NSArray count](v2, "count");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "CA_prepareRenderValue");
    }
  }
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  objc_object *v5;
  NSString *v7;
  NSString *v8;
  const CGPath *v9;
  const CGPath *v10;
  int8x16_t *v11;
  int v12;
  NSArray *v13;
  NSArray *v14;
  int v15;
  uint64_t v16;
  int8x16_t *v17;
  uint64_t v18;
  double v19;
  int v20;
  double v21;
  uint64_t v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSArray *v29;
  NSArray *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  size_t v37;
  char *v38;
  int v44;
  NSArray *v45;
  int v46;
  double v47;
  double v48;
  int v49;
  id v50;
  double v51;
  float v52;
  NSString *v53;
  NSString *v54;
  NSArray *v55;
  NSArray *v56;
  int v57;
  int v58;
  uint64_t v59;
  int v60;
  objc_object *v61;
  int v62;
  uint64_t v63;
  float v64;
  long double *v65;
  int32x2_t v66;
  int64x2_t v67;
  CAValueFunction *v68;
  CAValueFunction *v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  const char *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  const double *v78;
  int8x16_t v79;
  int8x16_t v80;
  __double2 v81;
  float64x2_t v82;
  float64x2_t v83;
  unsigned int *v84;
  unsigned int v85;
  unsigned int v86;
  id v87;
  uint64_t i;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  CAValueFunction *v97;
  uint64_t v98;
  objc_object *v99;
  _OWORD v100[8];
  float64x2_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  double v109;
  int8x16_t v110;
  int8x16_t v111;
  float64x2_t v112;
  unsigned int v113;
  double v114;
  __int128 v115;
  __int128 v116;
  float64x2_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;

  v5 = (objc_object *)a4;
  v125 = *MEMORY[0x1E0C80C00];
  v114 = a3;
  if (!-[CAAnimation isEnabled](self, "isEnabled", a4, a5))
    return;
  v7 = -[CAPropertyAnimation keyPath](self, "keyPath");
  if (!v7)
    return;
  v8 = v7;
  v113 = 0;
  if (!mapAnimationTime(&self->super.super, &v114, (int *)&v113))
    return;
  v9 = -[CAKeyframeAnimation path](self, "path");
  if (v9)
    v11 = CA::Render::Path::new_path(v9, v10);
  else
    v11 = 0;
  v115 = 0u;
  v116 = 0u;
  v12 = calcModeFromString((const __CFString *)-[CAKeyframeAnimation calculationMode](self, "calculationMode"));
  v13 = -[CAKeyframeAnimation keyTimes](self, "keyTimes");
  if (v13)
  {
    v14 = v13;
    v15 = -[NSArray count](v13, "count");
    v16 = (v15 - 2);
    if (v15 >= 2)
    {
      v17 = v11;
      v18 = 0;
      v19 = v114;
      while (v16 != v18)
      {
        v20 = v18++;
        objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", v18), "doubleValue");
        if (v21 > v19)
        {
          v16 = v20;
          goto LABEL_19;
        }
      }
      v20 = v15 - 2;
LABEL_19:
      objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", v16), "doubleValue");
      v25 = v24;
      *((double *)&v115 + 1) = v24;
      objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", (v20 + 1)), "doubleValue");
      v27 = v26;
      *(double *)&v116 = v26;
      v11 = v17;
      if (v20)
        objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", (v20 - 1)), "doubleValue");
      else
        v28 = -(v26 + v25 * -2.0);
      *(double *)&v115 = v28;
      if (v20 + 2 >= v15)
        v36 = -(v25 + v27 * -2.0);
      else
        objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:"), "doubleValue");
      *((double *)&v116 + 1) = v36;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (v11)
  {
    LODWORD(v22) = v11[1].i32[0];
    if (v12 == 4 || v12 == 2)
    {
      v23 = CA::Render::Path::keyframe_lengths((CA::Render::Path *)v11);
      if (v23)
      {
        v20 = paced_keyframe(v23, v22, v114, (double *)&v115);
        goto LABEL_41;
      }
    }
LABEL_26:
    if ((int)v22 > 0)
    {
LABEL_27:
      v32 = 1.0;
      v33 = 1.0 / (double)(int)v22;
      if (v114 <= 1.0)
        v32 = v114;
      if (v32 < 0.0)
        v32 = 0.0;
      v114 = v32;
      v34 = v32 * (double)(int)v22;
      v35 = floor(v34);
      v20 = vcvtmd_s64_f64(v34);
      *(double *)&v115 = v33 * v35 - v33;
      *((double *)&v115 + 1) = v33 * v35;
      *(double *)&v116 = v33 * v35 + v33;
      *((double *)&v116 + 1) = *(double *)&v116 + v33;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  v29 = -[CAKeyframeAnimation values](self, "values");
  if (!v29)
    goto LABEL_40;
  v30 = v29;
  v31 = -[NSArray count](v29, "count");
  v22 = (v31 - 1);
  if (v12 != 4 && v12 != 2)
  {
    if (!v12)
      LODWORD(v22) = v31;
    goto LABEL_26;
  }
  if ((int)v22 >= 1)
  {
    if (v22 > 0x200)
    {
      v38 = (char *)malloc_type_malloc(8 * (v31 - 1), 0x100004000313F17uLL);
      if (!v38)
        goto LABEL_27;
    }
    else
    {
      MEMORY[0x1E0C80A78](v31);
      v38 = (char *)&v98 - ((v37 + 15) & 0xFFFFFFFF0);
      bzero(v38, v37);
    }
    v99 = v5;
    v87 = -[NSArray objectAtIndex:](v30, "objectAtIndex:", 0, 0);
    for (i = 0; i != v22; ++i)
    {
      v89 = -[NSArray objectAtIndex:](v30, "objectAtIndex:", i + 1);
      objc_msgSend(v87, "CA_distanceToValue:", v89);
      *(_QWORD *)&v38[8 * i] = v90;
      v87 = (id)v89;
    }
    v20 = paced_keyframe((double *)v38, v22, v114, (double *)&v115);
    v11 = (int8x16_t *)v98;
    if (v22 >= 0x201)
      free(v38);
    v5 = v99;
    goto LABEL_41;
  }
LABEL_40:
  v20 = 0;
  v115 = 0uLL;
  __asm { FMOV            V0.2D, #1.0 }
  v116 = _Q0;
LABEL_41:
  v44 = 0;
  v45 = 0;
  v46 = 1;
  switch(calcModeFromString((const __CFString *)-[CAKeyframeAnimation calculationMode](self, "calculationMode")))
  {
    case 0u:
      v44 = 0;
      v46 = 0;
      v114 = 0.0;
      v47 = 0.0;
      goto LABEL_55;
    case 2u:
      goto LABEL_46;
    case 3u:
      v44 = 1;
      goto LABEL_44;
    case 4u:
      v45 = 0;
      v44 = 1;
      goto LABEL_46;
    default:
LABEL_44:
      v45 = -[CAKeyframeAnimation timingFunctions](self, "timingFunctions");
      v46 = 0;
LABEL_46:
      v48 = (v114 - *((double *)&v115 + 1)) / (*(double *)&v116 - *((double *)&v115 + 1));
      if (v48 > 1.0)
        v48 = 1.0;
      if (v48 >= 0.0)
        v47 = v48;
      else
        v47 = 0.0;
      v114 = v47;
      if (v45)
      {
        v49 = -[NSArray count](v45, "count");
        if ((v20 & 0x80000000) == 0 && v20 < v49)
        {
          v50 = -[NSArray objectAtIndex:](v45, "objectAtIndex:", v20);
          *(float *)&v51 = v47;
          objc_msgSend(v50, "_solveForInput:", v51);
          v47 = v52;
          v114 = v52;
        }
      }
LABEL_55:
      if (v11)
      {
        v112 = 0uLL;
        v111 = 0uLL;
        v110 = 0uLL;
        v109 = 0.0;
        v53 = -[CAKeyframeAnimation rotationMode](self, "rotationMode");
        v54 = v53;
        if (v53)
        {
          if (-[NSString isEqualToString:](v53, "isEqualToString:", CFSTR("auto")))
          {
            LODWORD(v54) = 0x10000;
          }
          else if (-[NSString isEqualToString:](v54, "isEqualToString:", CFSTR("autoReverse")))
          {
            LODWORD(v54) = 0x20000;
          }
          else
          {
            LODWORD(v54) = 0;
          }
        }
        if ((_DWORD)v54)
          v65 = &v109;
        else
          v65 = 0;
        v64 = v47;
        if (CA::Render::Path::interpolate((CA::Render::Path *)v11, v20, v46, &v112, (float64x2_t *)&v111, (float64x2_t *)&v110, v65, 0, v64, 0.0))
        {
          if (-[CAPropertyAnimation isCumulative](self, "isCumulative") && v113)
          {
            v66 = vdup_n_s32(-[CAAnimation autoreverses](self, "autoreverses"));
            v67.i64[0] = v66.u32[0];
            v67.i64[1] = v66.u32[1];
            v112 = vmlaq_n_f64(v112, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v67, 0x3FuLL)), v111, v110), (double)(int)v113);
          }
          v68 = -[CAPropertyAnimation valueFunction](self, "valueFunction");
          if (v68)
          {
            v69 = v68;
            v70 = -[CAValueFunction inputCount](v68, "inputCount");
            v71 = -[CAValueFunction outputCount](v69, "outputCount");
            if (v70 <= 2 && v71 <= 2)
            {
              *(_QWORD *)&v117.f64[0] = self;
              *(_QWORD *)&v117.f64[1] = v5;
              -[CAValueFunction apply:result:parameterFunction:context:](v69, "apply:result:parameterFunction:context:", &v112, &v112, functionParam, &v117);
            }
          }
          if (-[CAPropertyAnimation isAdditive](self, "isAdditive"))
          {
            v72 = (void *)-[objc_object valueForKeyPath:](v5, "valueForKeyPath:", v8);
            v73 = (const char *)objc_msgSend(v72, "objCType");
            if (v73 && !strcmp(v73, "{CGPoint=dd}"))
            {
              objc_msgSend(v72, "pointValue");
            }
            else
            {
              v74 = *MEMORY[0x1E0CB3430];
              v75 = *(double *)(MEMORY[0x1E0CB3430] + 8);
            }
            v76 = v112.f64[0] + v74;
            v77 = v112.f64[1] + v75;
            v112.f64[0] = v76;
            v112.f64[1] = v77;
          }
          else
          {
            v77 = v112.f64[1];
            v76 = v112.f64[0];
          }
          -[objc_object setValue:forKeyPath:](v5, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v76, v77), v8);
          if ((_DWORD)v54)
          {
            if (v54 >= 0x20000)
              v109 = v109 + 3.14159265;
            if (v5)
            {
              -[objc_object transform](v5, "transform");
            }
            else
            {
              v123 = 0u;
              v124 = 0u;
              v121 = 0u;
              v122 = 0u;
              v119 = 0u;
              v120 = 0u;
              v117 = 0u;
              v118 = 0u;
            }
            v105 = v121;
            v106 = v122;
            v107 = v123;
            v108 = v124;
            v101 = v117;
            v102 = v118;
            v103 = v119;
            v104 = v120;
            v118 = 0u;
            v120 = 0u;
            v121 = 0u;
            v122 = xmmword_18474DF40;
            v123 = 0u;
            v124 = xmmword_18474DF50;
            v81 = __sincos_stret(v109);
            *(double *)v80.i64 = v81.__cosval;
            *(double *)v79.i64 = v81.__sinval;
            if (fabs(v81.__sinval) >= 0.0000001)
            {
              if (fabs(v81.__cosval) < 0.0000001)
              {
                v80.i64[0] = 1.0;
                v83.f64[0] = NAN;
                v83.f64[1] = NAN;
                v79.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v83), v80, v79).u64[0];
                v80.i64[0] = 0;
              }
            }
            else
            {
              v79.i64[0] = 1.0;
              v82.f64[0] = NAN;
              v82.f64[1] = NAN;
              v80.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v82), v79, v80).u64[0];
              v79.i64[0] = 0;
            }
            *(_QWORD *)&v117.f64[0] = v80.i64[0];
            *(_QWORD *)&v117.f64[1] = v79.i64[0];
            *(double *)&v119 = -*(double *)v79.i64;
            *((_QWORD *)&v119 + 1) = v80.i64[0];
            CA::Mat4Impl::mat4_concat(&v101, v117.f64, v101.f64, v78);
            v100[4] = v105;
            v100[5] = v106;
            v100[6] = v107;
            v100[7] = v108;
            v100[0] = v101;
            v100[1] = v102;
            v100[2] = v103;
            v100[3] = v104;
            -[objc_object setTransform:](v5, "setTransform:", v100);
          }
        }
        v84 = &v11->u32[2];
        do
        {
          v85 = __ldaxr(v84);
          v86 = v85 - 1;
        }
        while (__stlxr(v86, v84));
        if (!v86)
          (*(void (**)(int8x16_t *))(v11->i64[0] + 16))(v11);
        return;
      }
      v55 = -[CAKeyframeAnimation values](self, "values");
      if (!v55)
        return;
      v56 = v55;
      *(_QWORD *)&v124 = 0;
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v117 = (float64x2_t)*(unint64_t *)&v47;
      if (v44)
        setupHermiteInterpolator(self, (CA::Render::ValueInterpolator *)&v117, v20, (const double *)&v115);
      v57 = -[NSArray count](v56, "count");
      v58 = v57;
      if (v57 < 2)
        return;
      v59 = (v57 - 1);
      v60 = v20 >= (int)v59 ? v57 - 1 : v20;
      v61 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", v60);
      v62 = v20 + 1 < (int)v59 ? v20 + 1 : v59;
      v63 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", v62);
      if (!v61 || !v63)
        return;
      v99 = (objc_object *)v63;
      if (v44)
      {
        if (v20 < 1)
          v98 = 0;
        else
          v98 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", (v20 - 1));
        if (v20 + 2 < v58)
        {
          v91 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", v20 + 2);
          goto LABEL_122;
        }
      }
      else
      {
        v98 = 0;
      }
      v91 = 0;
LABEL_122:
      v92 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", 0, v98);
      v93 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", v59);
      HIDWORD(v94) = 1062232653;
      if (fabs(v47) >= 0.001)
      {
        if (fabs(v47 + -1.0) >= 0.001)
        {
          if (v98 | v91 && (v44 & 1) != 0)
          {
            v95 = -[objc_object CA_interpolateValues:::interpolator:](v61, "CA_interpolateValues:::interpolator:");
          }
          else
          {
            *(float *)&v94 = v47;
            v95 = -[objc_object CA_interpolateValue:byFraction:](v61, "CA_interpolateValue:byFraction:", v99, v94);
          }
          v61 = (objc_object *)v95;
        }
        else
        {
          v61 = v99;
        }
      }
      if (-[CAPropertyAnimation isCumulative](self, "isCumulative") && v113)
      {
        if (-[CAAnimation autoreverses](self, "autoreverses"))
          v96 = v92;
        else
          v96 = v93;
        v61 = (objc_object *)-[objc_object CA_addValue:multipliedBy:](v61, "CA_addValue:multipliedBy:", v96, v113);
      }
      v97 = -[CAPropertyAnimation valueFunction](self, "valueFunction");
      if (v97)
        v61 = (objc_object *)applyValueFunction(v97, v61, &self->super, v5);
      if (-[CAPropertyAnimation isAdditive](self, "isAdditive"))
        v61 = (objc_object *)objc_msgSend((id)-[objc_object valueForKeyPath:](v5, "valueForKeyPath:", v8), "CA_addValue:multipliedBy:", v61, 1);
      -[objc_object setValue:forKeyPath:](v5, "setValue:forKeyPath:", v61, v8);
      break;
  }
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  _BOOL4 v6;
  const CGPath *v7;
  const CGPath *v8;
  int8x16_t *v9;
  int8x16_t *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  int8x16_t *v16;
  unsigned int v17;
  NSArray *v18;
  NSArray *v19;
  uint64_t v20;
  CA::Render::Array *v21;
  uint64_t AtomInKeyPath;
  int v23;
  int v24;
  unint64_t v25;
  char *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  CA::Render::Array *i;
  __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int *v35;
  unsigned int *v36;
  uint64_t v37;
  _DWORD *v38;
  uint64_t v39;
  unsigned int *v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int *v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  NSArray *v52;
  unsigned int *v53;
  unsigned int *v54;
  unsigned int *v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int *v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  NSArray *v62;
  unsigned int *v63;
  unsigned int *v64;
  unsigned int *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int *v68;
  unsigned int v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int *v72;
  unsigned int v73;
  unsigned int v74;
  NSArray *v75;
  unsigned int *v76;
  unsigned int *v77;
  unsigned int *v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int *v81;
  unsigned int v82;
  unsigned int *v83;
  unsigned int v84;
  unsigned int *v85;
  unsigned int v86;
  unsigned int v87;
  NSArray *v88;
  unsigned int *v89;
  unsigned int *v90;
  unsigned int *v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int *v94;
  unsigned int v95;
  unsigned int *v96;
  unsigned int v97;
  unsigned int *v98;
  unsigned int v99;
  unsigned int v100;
  NSString *v101;
  NSString *v102;
  int v103;
  unsigned int *v105;
  unsigned int v106;
  unsigned int v107;
  NSArray *v108;
  NSArray *v109;
  uint64_t v110;
  uint64_t v111;
  size_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  const double *v116;
  unsigned int *v117;
  unsigned int *v118;
  unsigned int *v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int *v122;
  unsigned int v123;
  unsigned int *v124;
  unsigned int v125;
  unsigned int *v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  uint64_t v130;
  id v131;
  BOOL v132;
  objc_super v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v133.receiver = self;
  v133.super_class = (Class)CAKeyframeAnimation;
  v6 = -[CAPropertyAnimation _setCARenderAnimation:layer:](&v133, sel__setCARenderAnimation_layer_, a3, a4);
  if (v6)
  {
    *((_BYTE *)a3 + 144) = calcModeFromString((const __CFString *)-[CAKeyframeAnimation calculationMode](self, "calculationMode"));
    v7 = -[CAKeyframeAnimation path](self, "path");
    if (v7)
    {
      v9 = CA::Render::Path::new_path(v7, v8);
      v10 = (int8x16_t *)*((_QWORD *)a3 + 17);
      if (v10 != v9)
      {
        if (v10)
        {
          v11 = &v10->u32[2];
          do
          {
            v12 = __ldaxr(v11);
            v13 = v12 - 1;
          }
          while (__stlxr(v13, v11));
          if (!v13)
            (*(void (**)(int8x16_t *))(v10->i64[0] + 16))(v10);
        }
        if (v9)
        {
          v14 = &v9->u32[2];
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 + 1, v14));
          v16 = v9;
          if (!v15)
          {
            v16 = 0;
            do
              v17 = __ldaxr(v14);
            while (__stlxr(v17 - 1, v14));
          }
        }
        else
        {
          v16 = 0;
        }
        *((_QWORD *)a3 + 17) = v16;
      }
      if (v9)
      {
        v27 = &v9->u32[2];
        do
        {
          v28 = __ldaxr(v27);
          v29 = v28 - 1;
        }
        while (__stlxr(v29, v27));
        if (!v29)
          (*(void (**)(int8x16_t *))(v9->i64[0] + 16))(v9);
      }
    }
    else
    {
      v18 = -[CAKeyframeAnimation values](self, "values");
      if (v18)
      {
        v19 = v18;
        v20 = -[NSArray count](v18, "count");
        if (v20)
        {
          v21 = (CA::Render::Array *)v20;
          AtomInKeyPath = CAInternFirstAtomInKeyPath((const __CFString *)-[CAPropertyAnimation keyPath](self, "keyPath"));
          v23 = AtomInKeyPath;
          v24 = *((unsigned __int8 *)a3 + 144);
          v25 = 8 * (_QWORD)v21;
          if ((unint64_t)(8 * (_QWORD)v21) > 0x1000)
          {
            v26 = (char *)malloc_type_malloc(8 * (_QWORD)v21, 0x2004093837F09uLL);
          }
          else
          {
            MEMORY[0x1E0C80A78](AtomInKeyPath);
            v26 = (char *)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v26, 8 * (_QWORD)v21);
          }
          for (i = 0; i != v21; i = (CA::Render::Array *)((char *)i + 1))
          {
            v31 = -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", i);
            if (!v24)
            {
              if (v23 == 136)
              {
                v131 = (id)MEMORY[0x1E0CB37E8];
                v34 = -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("AAAA"));
                v31 = (__CFString *)objc_msgSend(v131, "numberWithUnsignedChar:", v34);
              }
              else if (v23 == 129)
              {
                v131 = (id)MEMORY[0x1E0CB37E8];
                v33 = CA::Render::Layer::gravity_from_string(v31, v32);
                v31 = (__CFString *)objc_msgSend(v131, "numberWithUnsignedInt:", v33);
              }
            }
            *(_QWORD *)&v26[8 * (_QWORD)i] = -[__CFString CA_copyRenderValue](v31, "CA_copyRenderValue");
          }
          v35 = CA::Render::Array::new_array(v21, v26, 0, 0);
          if (v35)
          {
            v36 = v35;
            v37 = v35[4];
            if ((_DWORD)v37)
            {
              v38 = v35 + 6;
              v39 = 8 * v37;
              while (*(_QWORD *)v38 && *(_BYTE *)(*(_QWORD *)v38 + 12))
              {
                v38 += 2;
                v39 -= 8;
                if (!v39)
                  goto LABEL_42;
              }
            }
            else
            {
LABEL_42:
              v40 = (unsigned int *)*((_QWORD *)a3 + 14);
              if (v40 != v36)
              {
                if (v40)
                {
                  v41 = v40 + 2;
                  do
                  {
                    v42 = __ldaxr(v41);
                    v43 = v42 - 1;
                  }
                  while (__stlxr(v43, v41));
                  if (!v43)
                    (*(void (**)(unsigned int *))(*(_QWORD *)v40 + 16))(v40);
                }
                v44 = v36 + 2;
                do
                  v45 = __ldaxr(v44);
                while (__stlxr(v45 + 1, v44));
                v46 = v36;
                if (!v45)
                {
                  v46 = 0;
                  do
                    v129 = __ldaxr(v44);
                  while (__stlxr(v129 - 1, v44));
                }
                *((_QWORD *)a3 + 14) = v46;
              }
            }
            v47 = v36 + 2;
            do
            {
              v48 = __ldaxr(v47);
              v49 = v48 - 1;
            }
            while (__stlxr(v49, v47));
            if (!v49)
              (*(void (**)(unsigned int *))(*(_QWORD *)v36 + 16))(v36);
          }
          if (v25 > 0x1000)
            free(v26);
        }
      }
    }
    v50 = *((unsigned __int8 *)a3 + 144);
    if (v50 == 4 || v50 == 2)
    {
      CA::Render::KeyframeAnimation::update_paced_key_times((CA::Render::KeyframeAnimation *)a3);
    }
    else
    {
      v62 = -[CAKeyframeAnimation keyTimes](self, "keyTimes");
      if (v62)
      {
        v132 = 0;
        v63 = copyFloatVector(v62, &v132);
        v64 = (unsigned int *)*((_QWORD *)a3 + 15);
        if (v64 != v63)
        {
          if (v64)
          {
            v65 = v64 + 2;
            do
            {
              v66 = __ldaxr(v65);
              v67 = v66 - 1;
            }
            while (__stlxr(v67, v65));
            if (!v67)
              (*(void (**)(unsigned int *))(*(_QWORD *)v64 + 16))(v64);
          }
          if (v63)
          {
            v68 = v63 + 2;
            do
              v69 = __ldaxr(v68);
            while (__stlxr(v69 + 1, v68));
            v70 = v63;
            if (!v69)
            {
              v70 = 0;
              do
                v71 = __ldaxr(v68);
              while (__stlxr(v71 - 1, v68));
            }
          }
          else
          {
            v70 = 0;
          }
          *((_QWORD *)a3 + 15) = v70;
        }
        if (v63)
        {
          v105 = v63 + 2;
          do
          {
            v106 = __ldaxr(v105);
            v107 = v106 - 1;
          }
          while (__stlxr(v107, v105));
          if (!v107)
            (*(void (**)(unsigned int *))(*(_QWORD *)v63 + 16))(v63);
        }
        if (v132)
          *((_DWORD *)a3 + 3) |= 0x4000000u;
      }
      v108 = -[CAKeyframeAnimation timingFunctions](self, "timingFunctions");
      if (v108)
      {
        v109 = v108;
        v110 = -[NSArray count](v108, "count");
        if (v110)
        {
          v111 = v110;
          v112 = 32 * v110;
          if ((unint64_t)(32 * v110) > 0x1000)
          {
            v113 = (char *)malloc_type_malloc(32 * v110, 0x100004000313F17uLL);
          }
          else
          {
            MEMORY[0x1E0C80A78](v110);
            v113 = (char *)&v130 - ((v112 + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v113, v112);
          }
          v114 = 0;
          v115 = v113;
          do
          {
            objc_msgSend(-[NSArray objectAtIndex:](v109, "objectAtIndex:", v114++), "_getPoints:", v115);
            v115 += 32;
          }
          while (v111 != v114);
          v117 = CA::Render::Vector::new_vector((CA::Render::Vector *)(4 * v111), v113, v116);
          v118 = (unsigned int *)*((_QWORD *)a3 + 16);
          if (v118 != v117)
          {
            if (v118)
            {
              v119 = v118 + 2;
              do
              {
                v120 = __ldaxr(v119);
                v121 = v120 - 1;
              }
              while (__stlxr(v121, v119));
              if (!v121)
                (*(void (**)(unsigned int *))(*(_QWORD *)v118 + 16))(v118);
            }
            if (v117)
            {
              v122 = v117 + 2;
              do
                v123 = __ldaxr(v122);
              while (__stlxr(v123 + 1, v122));
              v124 = v117;
              if (!v123)
              {
                v124 = 0;
                do
                  v125 = __ldaxr(v122);
                while (__stlxr(v125 - 1, v122));
              }
            }
            else
            {
              v124 = 0;
            }
            *((_QWORD *)a3 + 16) = v124;
          }
          if (v117)
          {
            v126 = v117 + 2;
            do
            {
              v127 = __ldaxr(v126);
              v128 = v127 - 1;
            }
            while (__stlxr(v128, v126));
            if (!v128)
              (*(void (**)(unsigned int *))(*(_QWORD *)v117 + 16))(v117);
          }
          if (v112 > 0x1000)
            free(v113);
        }
      }
    }
    if (*((unsigned __int8 *)a3 + 144) - 3 <= 1)
    {
      v52 = -[CAKeyframeAnimation tensionValues](self, "tensionValues");
      if (v52)
      {
        v53 = copyFloatVector(v52, 0);
        v54 = (unsigned int *)*((_QWORD *)a3 + 19);
        if (v54 != v53)
        {
          if (v54)
          {
            v55 = v54 + 2;
            do
            {
              v56 = __ldaxr(v55);
              v57 = v56 - 1;
            }
            while (__stlxr(v57, v55));
            if (!v57)
              (*(void (**)(unsigned int *))(*(_QWORD *)v54 + 16))(v54);
          }
          if (v53)
          {
            v58 = v53 + 2;
            do
              v59 = __ldaxr(v58);
            while (__stlxr(v59 + 1, v58));
            v60 = v53;
            if (!v59)
            {
              v60 = 0;
              do
                v61 = __ldaxr(v58);
              while (__stlxr(v61 - 1, v58));
            }
          }
          else
          {
            v60 = 0;
          }
          *((_QWORD *)a3 + 19) = v60;
        }
        if (v53)
        {
          v72 = v53 + 2;
          do
          {
            v73 = __ldaxr(v72);
            v74 = v73 - 1;
          }
          while (__stlxr(v74, v72));
          if (!v74)
            (*(void (**)(unsigned int *))(*(_QWORD *)v53 + 16))(v53);
        }
      }
      v75 = -[CAKeyframeAnimation continuityValues](self, "continuityValues");
      if (v75)
      {
        v76 = copyFloatVector(v75, 0);
        v77 = (unsigned int *)*((_QWORD *)a3 + 20);
        if (v77 != v76)
        {
          if (v77)
          {
            v78 = v77 + 2;
            do
            {
              v79 = __ldaxr(v78);
              v80 = v79 - 1;
            }
            while (__stlxr(v80, v78));
            if (!v80)
              (*(void (**)(unsigned int *))(*(_QWORD *)v77 + 16))(v77);
          }
          if (v76)
          {
            v81 = v76 + 2;
            do
              v82 = __ldaxr(v81);
            while (__stlxr(v82 + 1, v81));
            v83 = v76;
            if (!v82)
            {
              v83 = 0;
              do
                v84 = __ldaxr(v81);
              while (__stlxr(v84 - 1, v81));
            }
          }
          else
          {
            v83 = 0;
          }
          *((_QWORD *)a3 + 20) = v83;
        }
        if (v76)
        {
          v85 = v76 + 2;
          do
          {
            v86 = __ldaxr(v85);
            v87 = v86 - 1;
          }
          while (__stlxr(v87, v85));
          if (!v87)
            (*(void (**)(unsigned int *))(*(_QWORD *)v76 + 16))(v76);
        }
      }
      v88 = -[CAKeyframeAnimation biasValues](self, "biasValues");
      if (v88)
      {
        v89 = copyFloatVector(v88, 0);
        v90 = (unsigned int *)*((_QWORD *)a3 + 21);
        if (v90 != v89)
        {
          if (v90)
          {
            v91 = v90 + 2;
            do
            {
              v92 = __ldaxr(v91);
              v93 = v92 - 1;
            }
            while (__stlxr(v93, v91));
            if (!v93)
              (*(void (**)(unsigned int *))(*(_QWORD *)v90 + 16))(v90);
          }
          if (v89)
          {
            v94 = v89 + 2;
            do
              v95 = __ldaxr(v94);
            while (__stlxr(v95 + 1, v94));
            v96 = v89;
            if (!v95)
            {
              v96 = 0;
              do
                v97 = __ldaxr(v94);
              while (__stlxr(v97 - 1, v94));
            }
          }
          else
          {
            v96 = 0;
          }
          *((_QWORD *)a3 + 21) = v96;
        }
        if (v89)
        {
          v98 = v89 + 2;
          do
          {
            v99 = __ldaxr(v98);
            v100 = v99 - 1;
          }
          while (__stlxr(v100, v98));
          if (!v100)
            (*(void (**)(unsigned int *))(*(_QWORD *)v89 + 16))(v89);
        }
      }
    }
    v101 = -[CAKeyframeAnimation rotationMode](self, "rotationMode");
    if (v101)
    {
      v102 = v101;
      if (-[NSString isEqualToString:](v101, "isEqualToString:", CFSTR("auto")))
      {
        v103 = 0x1000000;
LABEL_147:
        *((_DWORD *)a3 + 3) |= v103;
        return v6;
      }
      if (-[NSString isEqualToString:](v102, "isEqualToString:", CFSTR("autoReverse")))
      {
        v103 = 0x2000000;
        goto LABEL_147;
      }
    }
  }
  return v6;
}

- (NSArray)values
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 576, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CAAnimationCalculationMode)calculationMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 78, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CAAnimationCalculationMode)v3[0];
}

- (NSArray)keyTimes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 331, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CGPathRef)path
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 414, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CGPathRef)v3[0];
}

- (CAAnimationRotationMode)rotationMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 471, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CAAnimationRotationMode)v3[0];
}

- (NSArray)timingFunctions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 549, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setKeyTimes:(NSArray *)keyTimes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = keyTimes;
  CAAnimation_setter((uint64_t)self, (const void *)0x14B, 3, (unsigned __int8 *)v3);
}

- (void)setTimingFunctions:(NSArray *)timingFunctions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = timingFunctions;
  CAAnimation_setter((uint64_t)self, (const void *)0x225, 3, (unsigned __int8 *)v3);
}

- (void)setPath:(CGPathRef)path
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = path;
  CAAnimation_setter((uint64_t)self, (const void *)0x19E, 3, (unsigned __int8 *)v3);
}

- (NSArray)tensionValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 545, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setTensionValues:(NSArray *)tensionValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = tensionValues;
  CAAnimation_setter((uint64_t)self, (const void *)0x221, 3, (unsigned __int8 *)v3);
}

- (NSArray)continuityValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 139, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setContinuityValues:(NSArray *)continuityValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = continuityValues;
  CAAnimation_setter((uint64_t)self, (const void *)0x8B, 3, (unsigned __int8 *)v3);
}

- (NSArray)biasValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 58, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setBiasValues:(NSArray *)biasValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = biasValues;
  CAAnimation_setter((uint64_t)self, (const void *)0x3A, 3, (unsigned __int8 *)v3);
}

- (void)setRotationMode:(CAAnimationRotationMode)rotationMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = rotationMode;
  CAAnimation_setter((uint64_t)self, (const void *)0x1D7, 3, (unsigned __int8 *)v3);
}

@end

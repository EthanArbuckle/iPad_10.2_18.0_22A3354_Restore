@implementation SKReach

- (SKReach)init
{
  SKReach *v2;
  SKReach *v3;
  NSMutableArray *ikChain;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKReach;
  v2 = -[SKAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_ikRoot, 0);
    v3->_goalPosition = (CGPoint)*MEMORY[0x1E0C9D538];
    ikChain = v3->_ikChain;
    v3->_ikChain = 0;

    v3->_velocity = 0.0;
    v3->_timeConstrained = 1;
  }
  return v3;
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 zRotationSpeed:(double)a5 maxDuration:(double)a6
{
  return 0;
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 duration:(double)a5 maxZRotationSpeed:(double)a6
{
  CGFloat y;
  CGFloat x;
  id v10;
  SKReach *v11;

  y = a3.y;
  x = a3.x;
  v10 = a4;
  v11 = objc_alloc_init(SKReach);
  v11->_goalPosition.x = x;
  v11->_goalPosition.y = y;
  objc_storeWeak((id *)&v11->_ikRoot, v10);
  v11->_zRotationSpeed = a6;
  -[SKAction setDuration:](v11, "setDuration:", a5);

  return v11;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  id v6;
  id WeakRetained;
  objc_super v8;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ikRoot);

  if (WeakRetained == v6)
    NSLog(CFSTR("<Warning> reachTo:rootNode: action run on rootNode itself, no animation will occur."));
  v8.receiver = self;
  v8.super_class = (Class)SKReach;
  -[SKAction willStartWithTarget:atTime:](&v8, sel_willStartWithTarget_atTime_, v6, a4);
  -[SKReach solveIKWithTarget:](self, "solveIKWithTarget:", v6);

}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 duration:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  SKReach *v9;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = objc_alloc_init(SKReach);
  v9->_goalPosition.x = x;
  v9->_goalPosition.y = y;
  objc_storeWeak((id *)&v9->_ikRoot, v8);
  -[SKAction setDuration:](v9, "setDuration:", a5);

  return v9;
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 velocity:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  SKReach *v9;
  id v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = objc_alloc_init(SKReach);
  v9->_goalPosition.x = x;
  v9->_goalPosition.y = y;
  objc_storeWeak((id *)&v9->_ikRoot, v8);
  v9->_velocity = a5;
  v9->_timeConstrained = 0;
  v10 = v8;
  for (i = v10; ; i = (void *)v15)
  {
    objc_msgSend(i, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      break;
    objc_msgSend(i, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = objc_claimAutoreleasedReturnValue();

  }
  -[SKReach solveIKWithTarget:](v9, "solveIKWithTarget:", i);

  return v9;
}

- (void)solveIKWithTarget:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *ikChain;
  id v6;
  IKLink *v7;
  double *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  IKLink *v24;
  double v25;
  double v26;
  id WeakRetained;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unsigned int v35;
  unsigned int v36;
  __int32 v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  double v52;
  id v53;
  void *v54;
  double x;
  double y;
  id v57;
  void *v58;
  double v59;
  double v60;
  uint64_t v61;
  float64x2_t v62;
  float32x2_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  double v67;
  id v68;
  float64x2_t v69;
  float64_t v70;
  unint64_t v71;
  double v72;
  unint64_t v73;
  NSMutableArray *v74;
  void *v75;
  double v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float32x2_t v89;
  float v90;
  float64x2_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  float32x2_t v96;
  float32x2_t v97;
  unsigned int v98;
  unsigned int v99;
  float32x2_t v100;
  float32x2_t v101;
  float32x2_t v102;
  float32x2_t v103;
  float32x2_t v104;
  float v105;
  float v106;
  double v107;
  float32x2_t v108;
  float32x2_t v109;
  id v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  unint64_t v121;
  float64x2_t v122;
  float32x2_t v123;
  double v124;
  id v125;
  double v126;
  id v127;
  float64x2_t v128;
  float64_t v129;
  unint64_t v130;
  double v131;
  void *v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  __float2 v145;
  float32x2_t v146;
  float32x2_t v147;
  float32x2_t v148;
  id v149;
  id v150;
  void *v151;
  float32x2_t v152;
  unsigned int v153;
  float64_t v154;
  unsigned int v155;
  float64_t v156;
  double v157;
  unsigned int v158;
  float64_t v159;
  float64_t v160;
  float64x2_t v161;
  float64_t v162;
  float64_t v163;

  v149 = a3;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  ikChain = self->_ikChain;
  self->_ikChain = v4;

  v6 = v149;
  v150 = v6;
  if (v6)
  {
    v7 = 0;
    v8 = (double *)MEMORY[0x1E0C9D538];
    v9 = v6;
    while (1)
    {
      objc_msgSend(v9, "reachConstraints", v149, v150);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v9, "reachConstraints");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lowerAngleLimit");
        v13 = v12;

        objc_msgSend(v9, "reachConstraints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "upperAngleLimit");
        v16 = v15;

        objc_msgSend(v9, "zRotation");
        v18 = v13;
        if (v18 < 0.0 || v18 > 6.2832)
          v18 = v18 - (float)((float)(int)floorf(v18 / 6.2832) * 6.2832);
        v19 = v16;
        v20 = v19 - v18;
        if (v20 < 0.0 || v20 > 6.2832)
          v20 = v20 - (float)((float)(int)floorf(v20 / 6.2832) * 6.2832);
        v21 = v17;
        v22 = v21 - v18;
        if (v22 < 0.0 || v22 > 6.2832)
          v22 = v22 - (float)((float)(int)floorf(v22 / 6.2832) * 6.2832);
        if (v22 > v20)
        {
          if (6.28318531 - v22 <= (float)(v22 - v20))
          {
            objc_msgSend(v9, "reachConstraints");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "lowerAngleLimit");
          }
          else
          {
            objc_msgSend(v9, "reachConstraints");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "upperAngleLimit");
          }
          objc_msgSend(v9, "setZRotation:");

        }
      }
      v24 = -[IKLink initWithNode:]([IKLink alloc], "initWithNode:", v9);
      v25 = *v8;
      v26 = v8[1];
      WeakRetained = objc_loadWeakRetained((id *)&self->_ikRoot);
      objc_msgSend(WeakRetained, "parent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertPoint:toNode:", v28, v25, v26);
      v30 = v29;
      v32 = v31;

      *(float *)&v33 = v30;
      *(float *)&v34 = v32;
      -[IKLink setPosition:](v24, "setPosition:", v33, v34);
      if (v7)
      {
        -[IKLink position](v7, "position");
        v158 = v35;
        v153 = v36;
        -[IKLink position](v24, "position");
        v38.i32[1] = v37;
        v39 = vsub_f32(v38, (float32x2_t)__PAIR64__(v153, v158));
        v40 = vmul_f32(v39, v39);
        v41 = COERCE_DOUBLE(vpadd_f32(v40, v40));
        *(float *)&v41 = sqrtf(*(float *)&v41);
        -[IKLink setLength:](v24, "setLength:", v41);
        -[IKLink node](v7, "node");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "position");
        v44 = v43;
        -[IKLink node](v7, "node");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "position");
        *(float *)&v46 = v44;
        *(float *)&v47 = v47;
        -[IKLink setSize:](v24, "setSize:", v46, v47);

      }
      -[NSMutableArray insertObject:atIndex:](self->_ikChain, "insertObject:atIndex:", v24, 0);
      v48 = objc_loadWeakRetained((id *)&self->_ikRoot);

      if (v9 == v48)
        break;
      objc_msgSend(v9, "parent");
      v49 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v49;
      v7 = v24;
      if (!v49)
        goto LABEL_25;
    }

    v24 = v7;
  }
  else
  {
    v24 = 0;
  }
LABEL_25:
  if ((unint64_t)-[NSMutableArray count](self->_ikChain, "count", v149) < 2)
    goto LABEL_54;
  v50 = -[NSMutableArray count](self->_ikChain, "count");
  -[NSMutableArray objectAtIndexedSubscript:](self->_ikChain, "objectAtIndexedSubscript:", v50 - 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = 0;
  objc_msgSend(v51, "setLength:", v52);
  v151 = v51;
  v53 = objc_loadWeakRetained((id *)&self->_ikRoot);
  objc_msgSend(v53, "parent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  x = self->_goalPosition.x;
  y = self->_goalPosition.y;
  v57 = objc_loadWeakRetained((id *)&self->_ikRoot);
  objc_msgSend(v57, "scene");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "convertPoint:fromNode:", v58, x, y);
  v154 = v60;
  v159 = v59;

  v61 = 0;
  v62.f64[0] = v159;
  v62.f64[1] = v154;
  v63 = vcvt_f32_f64(v62);
  v64 = v50 - 2;
  v65 = v50 - 2;
  do
  {
    v66 = objc_loadWeakRetained((id *)&self->_ikRoot);
    objc_msgSend(v66, "position");
    v160 = v67;
    v68 = objc_loadWeakRetained((id *)&self->_ikRoot);
    objc_msgSend(v68, "position");
    v69.f64[0] = v160;
    v69.f64[1] = v70;
    *(float32x2_t *)&v69.f64[0] = vcvt_f32_f64(v69);
    v161 = v69;

    v71 = 0;
    v72 = 0.0;
    while (1)
    {
      v73 = -[NSMutableArray count](self->_ikChain, "count");
      v74 = self->_ikChain;
      if (v71 >= v73)
        break;
      -[NSMutableArray objectAtIndexedSubscript:](v74, "objectAtIndexedSubscript:", v71);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v76) = HIDWORD(v161.f64[0]);
      objc_msgSend(v75, "setPosition:", v161.f64[0], v76);
      objc_msgSend(v75, "angle");
      v78 = v77;
      objc_msgSend(v75, "size");
      v80 = v79;
      v72 = v72 + v78;
      v81 = v72;
      v82 = cosf(v81);
      objc_msgSend(v75, "size");
      v84 = v83;
      v85 = v72;
      v86 = sinf(v85);
      objc_msgSend(v75, "size");
      v88 = v87;
      objc_msgSend(v75, "size");
      v89.f32[0] = (float)(v80 * v82) - (float)(v84 * v86);
      v89.f32[1] = (float)(v86 * v90) + (float)(v88 * v82);
      v91.f64[1] = v161.f64[1];
      *(float32x2_t *)&v91.f64[0] = vadd_f32(*(float32x2_t *)&v161.f64[0], v89);
      v161 = v91;

      ++v71;
    }
    -[NSMutableArray objectAtIndexedSubscript:](v74, "objectAtIndexedSubscript:", v65);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_ikChain, "objectAtIndexedSubscript:", v65 - 1);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "node");
    }
    else
    {
      v93 = objc_loadWeakRetained((id *)&self->_ikRoot);
      objc_msgSend(v93, "parent");
    }
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v151;
    if (!v94)
      goto LABEL_41;
    v96 = vsub_f32(v63, *(float32x2_t *)&v161.f64[0]);
    v97 = vmul_f32(v96, v96);
    if (sqrtf(vpadd_f32(v97, v97).f32[0]) <= 1.0)
      goto LABEL_41;
    objc_msgSend(v92, "position");
    v155 = v98;
    objc_msgSend(v92, "position");
    v100 = vsub_f32(*(float32x2_t *)&v161.f64[0], (float32x2_t)__PAIR64__(v99, v155));
    v101 = vsub_f32(v63, (float32x2_t)__PAIR64__(v99, v155));
    v102 = vmul_f32(v101, v101);
    v103 = vmul_f32(v100, v100);
    v104 = vmul_f32(vmul_n_f32(v101, 1.0 / sqrtf(vpadd_f32(v102, v102).f32[0])), vmul_n_f32(v100, 1.0 / sqrtf(vpadd_f32(v103, v103).f32[0])));
    v105 = vpadd_f32(v104, v104).f32[0];
    if (v105 >= 0.99999)
      goto LABEL_41;
    v106 = vmlas_n_f32((float)-v101.f32[1] * v100.f32[0], v100.f32[1], v101.f32[0]);
    if (v106 > 0.0)
    {
      *(float *)&v107 = -acosf(v105);
LABEL_40:
      objc_msgSend(v92, "rotateByAngle:", v107);
      goto LABEL_41;
    }
    if (v106 < 0.0)
    {
      *(float *)&v107 = acosf(v105);
      goto LABEL_40;
    }
LABEL_41:

    if (v61 == 250)
      break;
    ++v61;
    if (v65)
      --v65;
    else
      v65 = v64;
    v108 = vsub_f32(v63, *(float32x2_t *)&v161.f64[0]);
    v109 = vmul_f32(v108, v108);
  }
  while (sqrtf(vpadd_f32(v109, v109).f32[0]) > 1.0);
  if (!self->_timeConstrained)
  {
    v110 = objc_loadWeakRetained((id *)&self->_ikRoot);
    objc_msgSend(v110, "parent");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "node");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "position");
    v114 = v113;
    v116 = v115;
    objc_msgSend(v151, "node");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "parent");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "convertPoint:fromNode:", v118, v114, v116);
    v156 = v120;
    v162 = v119;

    v121 = 0;
    v122.f64[0] = v162;
    v122.f64[1] = v156;
    v123 = vcvt_f32_f64(v122);
    v124 = 0.0;
    v95 = v151;
    do
    {
      v125 = objc_loadWeakRetained((id *)&self->_ikRoot);
      objc_msgSend(v125, "position");
      v163 = v126;
      v152 = v123;
      v157 = v124;
      v127 = objc_loadWeakRetained((id *)&self->_ikRoot);
      objc_msgSend(v127, "position");
      v128.f64[0] = v163;
      v128.f64[1] = v129;
      v123 = vcvt_f32_f64(v128);

      v130 = 0;
      v131 = 0.0;
      while (v130 < -[NSMutableArray count](self->_ikChain, "count"))
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_ikChain, "objectAtIndexedSubscript:", v130);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "angleInitial");
        v134 = v133;
        objc_msgSend(v132, "angle");
        v136 = v135;
        objc_msgSend(v132, "angleInitial");
        v138 = v137;
        objc_msgSend(v132, "length");
        v140 = v139;
        objc_msgSend(v132, "length");
        v142 = v141;
        v143 = v134 + (double)v121 * 0.125 * (float)(v136 - v138);
        v131 = v131 + v143;
        v144 = v131;
        v145 = __sincosf_stret(v144);
        v146.f32[0] = v145.__cosval * v140;
        v146.f32[1] = v145.__sinval * v142;
        v123 = vadd_f32(v123, v146);

        ++v130;
      }
      v147 = vsub_f32(v123, v152);
      v148 = vmul_f32(v147, v147);
      v124 = v157 + sqrtf(vpadd_f32(v148, v148).f32[0]);
      ++v121;
    }
    while (v121 != 8);
    -[SKAction setDuration:](self, "setDuration:", v124 / self->_velocity);
  }

LABEL_54:
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SKReach;
  -[SKAction updateWithTarget:forTime:](&v20, sel_updateWithTarget_forTime_, a3);
  -[SKAction ratioForTime:](self, "ratioForTime:", a4);
  v7 = v6;
  v8 = -[NSMutableArray count](self->_ikChain, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = v7;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_ikChain, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "angleInitial");
      v14 = v13;
      objc_msgSend(v12, "angle");
      v16 = v15;
      objc_msgSend(v12, "angleInitial");
      v18 = v17;
      objc_msgSend(v12, "node");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setZRotation:", (float)(v14 + (float)(v11 * (float)(v16 - v18))));

      ++v10;
    }
    while (v9 != v10);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKReach;
  v4 = -[SKAction copyWithZone:](&v9, sel_copyWithZone_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_ikRoot);
  objc_storeWeak((id *)v4 + 2, WeakRetained);

  *(CGPoint *)(v4 + 24) = self->_goalPosition;
  v6 = -[NSMutableArray copy](self->_ikChain, "copy");
  v7 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v6;

  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_velocity;
  v4[56] = self->_timeConstrained;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ikChain, 0);
  objc_destroyWeak((id *)&self->_ikRoot);
}

@end

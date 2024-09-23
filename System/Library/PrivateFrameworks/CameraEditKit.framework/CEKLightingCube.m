@implementation CEKLightingCube

- (CEKLightingCube)initWithRotationAngle:(double)a3
{
  CEKLightingCube *v4;
  float v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  unint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  unint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  unint64_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  uint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  unsigned __int8 *normals;
  float32x4_t v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x2_t v35;
  int8x16_t v36;
  uint64_t v37;
  unsigned __int8 *world;
  int32x4_t v39;
  float32x2_t v40;
  int8x16_t v41;
  uint64_t i;
  int32x4_t v43;
  int64_t v44;
  int64_t *points;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  int64_t v51;
  int64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  unsigned __int8 *v63;
  uint64_t j;
  __int128 v65;
  float v66;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  objc_super v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;

  v80.receiver = self;
  v80.super_class = (Class)CEKLightingCube;
  v4 = -[CEKLightingCube init](&v80, sel_init);
  if (v4)
  {
    v5 = a3;
    *(double *)v6.i64 = Rotation(v5, 0.0, 1.0);
    v78 = v7;
    v79 = v6;
    v76 = v9;
    v77 = v8;
    v75 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v10 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v72 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    v73 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
    v10.i32[1] = -1088581612;
    v74 = v10;
    *(double *)v11.i64 = Rotation(0.61548, 1.0, 0.0);
    v70 = v12;
    v71 = v11;
    v68 = v14;
    v69 = v13;
    *(double *)v15.i64 = Rotation(0.7854, 0.0, 1.0);
    v16 = 0;
    v81 = v15;
    v82 = v17;
    v83 = v18;
    v84 = v19;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v85 + v16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v16))), v70, *(float32x2_t *)&v81.f32[v16 / 4], 1), v69, *(float32x4_t *)((char *)&v81 + v16), 2), v68, *(float32x4_t *)((char *)&v81 + v16), 3);
      v16 += 16;
    }
    while (v16 != 64);
    v20 = 0;
    v21 = v75;
    v21.i32[0] = 1058902036;
    v22 = v73;
    v22.i32[2] = 1058902036;
    v81 = v85;
    v82 = v86;
    v83 = v87;
    v84 = v88;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v85 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v20))), v74, *(float32x2_t *)&v81.f32[v20 / 4], 1), v22, *(float32x4_t *)((char *)&v81 + v20), 2), v72, *(float32x4_t *)((char *)&v81 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    v23 = 0;
    v24 = v85;
    v25 = v86;
    v26 = v87;
    v27 = v88;
    v81 = v79;
    v82 = v78;
    v83 = v77;
    v84 = v76;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v85 + v23) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v23))), v25, *(float32x2_t *)&v81.f32[v23 / 4], 1), v26, *(float32x4_t *)((char *)&v81 + v23), 2), v27, *(float32x4_t *)((char *)&v81 + v23), 3);
      v23 += 16;
    }
    while (v23 != 64);
    v28 = 0;
    v29 = v85;
    v30 = v86;
    normals = v4->_normals;
    v32 = v87;
    v33 = v88;
    do
    {
      v34 = (int32x4_t)vaddq_f32(v33, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(initWithRotationAngle__CEKLightingCubePlaneNormals[v28])), v30, *(float32x2_t *)&initWithRotationAngle__CEKLightingCubePlaneNormals[v28], 1), v32, (float32x4_t)initWithRotationAngle__CEKLightingCubePlaneNormals[v28], 2));
      v35 = (float32x2_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL).u64[0];
      v36 = (int8x16_t)vdupq_laneq_s32(v34, 3);
      *(float32x2_t *)v34.i8 = vdiv_f32(*(float32x2_t *)v34.i8, *(float32x2_t *)v36.i8);
      v34.u64[1] = (unint64_t)vdiv_f32(v35, (float32x2_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL));
      *(int32x4_t *)&normals[v28 * 16] = v34;
      ++v28;
    }
    while (v28 != 6);
    v37 = 0;
    world = v4->_world;
    do
    {
      v39 = (int32x4_t)vaddq_f32(v33, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(initWithRotationAngle__CubePoints[v37])), v30, *(float32x2_t *)&initWithRotationAngle__CubePoints[v37], 1), v32, (float32x4_t)initWithRotationAngle__CubePoints[v37], 2));
      v40 = (float32x2_t)vextq_s8((int8x16_t)v39, (int8x16_t)v39, 8uLL).u64[0];
      v41 = (int8x16_t)vdupq_laneq_s32(v39, 3);
      *(float32x2_t *)v39.i8 = vdiv_f32(*(float32x2_t *)v39.i8, *(float32x2_t *)v41.i8);
      v39.u64[1] = (unint64_t)vdiv_f32(v40, (float32x2_t)*(_OWORD *)&vextq_s8(v41, v41, 8uLL));
      *(int32x4_t *)&world[v37 * 16] = v39;
      ++v37;
    }
    while (v37 != 8);
    for (i = 0; i != 8; ++i)
    {
      v43 = (int32x4_t)vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B98776D0, COERCE_FLOAT(*(_OWORD *)&v4->_world[i * 16])), (float32x4_t)xmmword_1B98776E0, *(float32x2_t *)&v4->_world[i * 16], 1), (float32x4_t)xmmword_1B98776F0, *(float32x4_t *)&v4->_world[i * 16], 2), (float32x4_t)xmmword_1B9877700);
      v4->_screen[i] = (CGPoint)vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_laneq_s32(v43, 3)));
    }
    v44 = 0;
    points = v4->_points;
    do
    {
      points[v44] = v44;
      ++v44;
    }
    while (v44 != 9);
    v46 = 0;
    v47 = v4->_points[0];
    v48 = v4->_points[1];
    v49 = &v4->_world[8];
    v50 = v4->_world;
    v51 = v4->_points[2];
    v52 = v4->_points[3];
    do
    {
      v53 = *(_OWORD *)v50;
      if (COERCE_FLOAT(*(_OWORD *)v50) <= *(float *)&world[16 * v47])
      {
        *points = v46;
        v47 = v46;
      }
      if (*((float *)&v53 + 2) >= *(float *)&v49[16 * v48])
      {
        v4->_points[1] = v46;
        v48 = v46;
      }
      v54 = *(_OWORD *)v50;
      if (COERCE_FLOAT(*(_OWORD *)v50) >= *(float *)&world[16 * v51])
      {
        v4->_points[2] = v46;
        v51 = v46;
      }
      if (*((float *)&v54 + 2) <= *(float *)&v49[16 * v52])
      {
        v4->_points[3] = v46;
        v52 = v46;
      }
      ++v46;
      v50 += 16;
    }
    while (v46 != 4);
    v55 = v4->_points[4];
    v56 = v4->_points[5];
    v57 = &v4->_world[64];
    v58 = 4;
    v59 = v4->_points[6];
    v60 = v4->_points[7];
    do
    {
      v61 = *(_OWORD *)v57;
      if (COERCE_FLOAT(*(_OWORD *)v57) <= *(float *)&world[16 * v55])
      {
        v4->_points[4] = v58;
        v55 = v58;
      }
      if (*((float *)&v61 + 2) >= *(float *)&v49[16 * v56])
      {
        v4->_points[5] = v58;
        v56 = v58;
      }
      v62 = *(_OWORD *)v57;
      if (COERCE_FLOAT(*(_OWORD *)v57) >= *(float *)&world[16 * v59])
      {
        v4->_points[6] = v58;
        v59 = v58;
      }
      if (*((float *)&v62 + 2) <= *(float *)&v49[16 * v60])
      {
        v4->_points[7] = v58;
        v60 = v58;
      }
      ++v58;
      v57 += 16;
    }
    while (v58 != 8);
    v4->_planes[0] = 0;
    v4->_planes[5] = 5;
    v63 = &v4->_normals[16];
    for (j = 1; j != 5; ++j)
    {
      v65 = *(_OWORD *)v63;
      v66 = COERCE_FLOAT(*((_QWORD *)v63 + 1));
      if (v66 <= 0.0 && *(float *)&v65 <= *(float *)&normals[16 * v4->_planes[1]])
      {
        v4->_planes[1] = j;
        v65 = *(_OWORD *)v63;
        LODWORD(v66) = *((_QWORD *)v63 + 1);
      }
      if (v66 <= 0.0 && *(float *)&v65 >= *(float *)&normals[16 * v4->_planes[2]])
      {
        v4->_planes[2] = j;
        v65 = *(_OWORD *)v63;
        LODWORD(v66) = *((_QWORD *)v63 + 1);
      }
      if (v66 >= 0.0 && *(float *)&v65 <= *(float *)&normals[16 * v4->_planes[3]])
      {
        v4->_planes[3] = j;
        v65 = *(_OWORD *)v63;
        LODWORD(v66) = *((_QWORD *)v63 + 1);
      }
      if (v66 >= 0.0 && *(float *)&v65 >= *(float *)&normals[16 * v4->_planes[4]])
        v4->_planes[4] = j;
      v63 += 16;
    }
  }
  return v4;
}

- (void)points:(CGPoint *)(a3 forOutlineWithSize:
{
  CubePoints((uint64_t)self->_screen, (uint64_t)self->_points, (float64x2_t *)a3, points_forOutlineWithSize__CubeOutlinePoints, 6, a4.width, a4.height);
}

- (CGPath)pathForOutlineWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  CGPath *RoundedPathForConvexPolygon;
  double v7[13];

  v7[12] = *(double *)MEMORY[0x1E0C80C00];
  -[CEKLightingCube points:forOutlineWithSize:](self, "points:forOutlineWithSize:", v7, a3.width, a3.height);
  RoundedPathForConvexPolygon = CreateRoundedPathForConvexPolygon(v7, 6, a4);
  return (CGPath *)CFAutorelease(RoundedPathForConvexPolygon);
}

- (CGPath)centerShadowPathWithSize:(CGSize)a3 width:(double)a4
{
  CGFloat height;
  CGFloat width;
  double v7;
  CGPath *Mutable;
  CGPoint *screen;
  CGPoint *v10;
  CGPoint *v11;
  CGPoint *v12;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double *p_x;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double *v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  double v39;
  double *v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  double *v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  BOOL v57;
  double v58;
  const void *v59;
  CGAffineTransform v61;

  height = a3.height;
  width = a3.width;
  v7 = a4 / a3.width;
  Mutable = CGPathCreateMutable();
  screen = self->_screen;
  v10 = &self->_screen[self->_points[3]];
  CGPathMoveToPoint(Mutable, 0, v10->x, v10->y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[0]].x, screen[self->_points[0]].y);
  v11 = &self->_screen[self->_points[4]];
  v12 = &self->_screen[self->_points[0]];
  y = v11->y;
  v14 = v12->x - v11->x;
  v15 = v12->y - y;
  v16 = sqrt(v15 * v15 + v14 * v14);
  v17 = v14 / v16;
  v18 = v16 == 0.0;
  if (v16 == 0.0)
    v17 = 0.0;
  v19 = v15 / v16;
  if (v18)
    v19 = 0.0;
  CGPathAddLineToPoint(Mutable, 0, v11->x + v14 - v7 * v17, y + v15 - v7 * v19);
  p_x = &screen[self->_points[7]].x;
  v21 = &screen[self->_points[3]].x;
  v22 = p_x[1];
  v23 = *v21 - *p_x;
  v24 = v21[1] - v22;
  v25 = sqrt(v24 * v24 + v23 * v23);
  v26 = v23 / v25;
  v27 = v25 == 0.0;
  if (v25 == 0.0)
    v26 = 0.0;
  v28 = v24 / v25;
  if (v27)
    v28 = 0.0;
  v29 = *p_x + v23 - v7 * v26;
  v30 = v22 + v24 - v7 * v28;
  CGPathAddLineToPoint(Mutable, 0, v29, v30);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[7]].x, screen[self->_points[7]].y);
  v31 = &screen[self->_points[6]].x;
  v32 = &screen[self->_points[7]].x;
  v33 = v31[1];
  v34 = *v32 - *v31;
  v35 = v32[1] - v33;
  v36 = sqrt(v35 * v35 + v34 * v34);
  v37 = v34 / v36;
  v38 = v36 == 0.0;
  if (v36 == 0.0)
    v37 = 0.0;
  v39 = v35 / v36;
  if (v38)
    v39 = 0.0;
  CGPathAddLineToPoint(Mutable, 0, *v31 + v34 - v7 * v37, v33 + v35 - v7 * v39);
  v40 = &screen[self->_points[2]].x;
  v41 = &screen[self->_points[3]].x;
  v42 = v40[1];
  v43 = v41[1];
  v44 = *v41 - *v40;
  v45 = v43 - v42;
  v46 = sqrt(v45 * v45 + v44 * v44);
  v47 = v44 / v46;
  v48 = v46 == 0.0;
  if (v46 == 0.0)
    v47 = 0.0;
  v49 = v45 / v46;
  if (v48)
    v49 = 0.0;
  CGPathAddLineToPoint(Mutable, 0, v29 - *v41 + *v41 + *v40 + v44 - v7 * v47 - *v41, v30 - v43 + v43 + v42 + v45 - v7 * v49 - v43);
  v50 = &screen[self->_points[6]].x;
  v51 = &screen[self->_points[2]].x;
  v52 = v50[1];
  v53 = *v51 - *v50;
  v54 = v51[1] - v52;
  v55 = sqrt(v54 * v54 + v53 * v53);
  v56 = v53 / v55;
  v57 = v55 == 0.0;
  if (v55 == 0.0)
    v56 = 0.0;
  v58 = v54 / v55;
  if (v57)
    v58 = 0.0;
  CGPathAddLineToPoint(Mutable, 0, *v50 + v53 - v7 * v56, v52 + v54 - v7 * v58);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[2]].x, screen[self->_points[2]].y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[3]].x, screen[self->_points[3]].y);
  CGPathCloseSubpath(Mutable);
  memset(&v61, 0, sizeof(v61));
  CGAffineTransformMakeScale(&v61, width, height);
  v59 = (const void *)MEMORY[0x1BCCC5828](Mutable, &v61);
  CGPathRelease(Mutable);
  return (CGPath *)CFAutorelease(v59);
}

- (CGPath)centerPathWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGPath *Mutable;
  CGPoint *screen;
  CGPoint *v8;
  const void *v9;
  CGAffineTransform v11;

  height = a3.height;
  width = a3.width;
  Mutable = CGPathCreateMutable();
  screen = self->_screen;
  v8 = &self->_screen[self->_points[3]];
  CGPathMoveToPoint(Mutable, 0, v8->x, v8->y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[7]].x, screen[self->_points[7]].y);
  CGPathMoveToPoint(Mutable, 0, screen[self->_points[3]].x, screen[self->_points[3]].y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[2]].x, screen[self->_points[2]].y);
  CGPathMoveToPoint(Mutable, 0, screen[self->_points[3]].x, screen[self->_points[3]].y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[0]].x, screen[self->_points[0]].y);
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, width, height);
  v9 = (const void *)MEMORY[0x1BCCC5828](Mutable, &v11);
  CGPathRelease(Mutable);
  return (CGPath *)CFAutorelease(v9);
}

- (void)points:(CEKLightingCube *)self forPlane:(SEL)a2 size:(CGPoint *)(a3
{
  CubePoints((uint64_t)self->_screen, (uint64_t)self->_points, (float64x2_t *)a3, &points_forPlane_size__CEKLightingCubePlanePoints[4 * a4], 4, a5.width, a5.height);
}

- (CGPath)pathForPlane:(int64_t)a3 size:(CGSize)a4
{
  CGPath *RoundedPathForConvexPolygon;
  double v6[9];

  v6[8] = *(double *)MEMORY[0x1E0C80C00];
  -[CEKLightingCube points:forPlane:size:](self, "points:forPlane:size:", v6, a3, a4.width, a4.height);
  RoundedPathForConvexPolygon = CreateRoundedPathForConvexPolygon(v6, 4, 0.0);
  return (CGPath *)CFAutorelease(RoundedPathForConvexPolygon);
}

- (double)intensityForPlane:(int64_t)a3
{
  float32x2_t v3;
  float32x2_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x4_t v10;

  v3 = vrsqrte_f32((float32x2_t)1068373115);
  v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)1068373115, vmul_f32(v3, v3)));
  v5 = vmulq_n_f32((float32x4_t)xmmword_1B9877720, vmul_f32(v4, vrsqrts_f32((float32x2_t)1068373115, vmul_f32(v4, v4))).f32[0]);
  v6 = *(float32x4_t *)&self->_normals[16 * self->_planes[a3]];
  v7 = (int32x4_t)vmulq_f32(v6, v6);
  v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
  v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
  v10 = vmulq_f32(v5, vmulq_n_f32(v6, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]));
  return fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0]);
}

@end

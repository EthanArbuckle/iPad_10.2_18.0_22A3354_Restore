@implementation ADWarperMeshLensDistortionModel

- (ADWarperMeshLensDistortionModel)initWithWarperMesh:(id)a3 type:(unint64_t)a4 width:(int64_t)a5 height:(int64_t)a6
{
  id v11;
  void *v12;
  char *v13;
  id v14;
  __int128 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  int32x2_t v30;
  int32x2_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  float32x4_t v40;
  float32x4_t v41;
  int v42;
  int v43;
  int v44;
  int32x2_t v45;
  int32x2_t *v46;
  int i;
  int v48;
  int v49;
  int v50;
  int v51;
  float32x2_t *v52;
  float32x2_t *v53;
  float32x2_t v54;
  float32x2_t v55;
  uint64_t v56;
  uint64_t v57;
  float32x2_t v58;
  float32x2_t v59;
  float v60;
  float32x2_t v61;
  int v62;
  float v63;
  signed int v64;
  signed int v65;
  signed int v66;
  float32x2_t v67;
  int32x2_t v68;
  int32x2_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float v74;
  int v75;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  float32x2_t v80;
  float32x2_t v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  int32x4_t v91;
  int32x4_t v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float32x2_t v97;
  float v98;
  float v99;
  int32x4_t v100;
  const __CFString *v102;
  id v103;
  id v104;
  __int128 v105;
  int32x2_t v106;
  objc_super v107;
  _QWORD v108[9];

  v108[8] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = v11;
  if (!v11)
  {
    v102 = CFSTR("warperMesh cannot be nil");
    goto LABEL_63;
  }
  if (objc_msgSend(v11, "length") != 8 * a5 * a6)
  {
    v102 = CFSTR("warperMesh length should be width * height * 2 floats");
LABEL_63:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v102, 0);
    v103 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v103);
  }
  v107.receiver = self;
  v107.super_class = (Class)ADWarperMeshLensDistortionModel;
  v13 = -[ADWarperMeshLensDistortionModel init](&v107, sel_init);
  if (v13)
  {
    v14 = v12;
    *((_QWORD *)v13 + 1) = a4;
    objc_storeStrong((id *)v13 + 4, a3);
    *((_DWORD *)v13 + 16) = a5;
    *((_DWORD *)v13 + 17) = a6;
    *((_DWORD *)v13 + 11) = 0;
    *((_DWORD *)v13 + 12) = 0;
    if (a4 == 1)
    {
      *((_DWORD *)v13 + 10) = 0;
      LODWORD(a5) = a5 - 1;
      LODWORD(a6) = a6 - 1;
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("unknown warper mesh type"), 0);
        v104 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v104);
      }
      *((_DWORD *)v13 + 10) = 1056964608;
    }
    *((double *)v13 + 2) = (double)(int)a5;
    *((double *)v13 + 3) = (double)(int)a6;

    v108[0] = 0;
    *(_QWORD *)&v15 = *((_QWORD *)v13 + 8);
    if ((int)v15 >= 0)
      v16 = *((_QWORD *)v13 + 8);
    else
      v16 = v15 + 1;
    LODWORD(v17) = v16 >> 1;
    LODWORD(v18) = v15 - 1;
    v105 = v15;
    v19 = HIDWORD(*((_QWORD *)v13 + 8));
    v108[1] = (v16 >> 1);
    v108[2] = (v15 - 1);
    if ((SDWORD1(v15) & 0x80000000) == 0)
      v20 = DWORD1(v15);
    else
      v20 = DWORD1(v15) + 1;
    LODWORD(v21) = 0;
    LODWORD(v22) = 0;
    *(_QWORD *)((char *)&v22 + 4) = (v20 >> 1);
    LODWORD(v23) = v15 - 1;
    HIDWORD(v23) = v20 >> 1;
    v108[3] = v22;
    v108[4] = v23;
    HIDWORD(v21) = v19 - 1;
    HIDWORD(v17) = v19 - 1;
    v108[5] = v21;
    v108[6] = v17;
    HIDWORD(v18) = v19 - 1;
    v108[7] = v18;
    v24 = objc_msgSend(*((id *)v13 + 4), "bytes", v105);
    v25 = v24;
    v26 = 0;
    v27 = vcvt_f32_s32(v106);
    v28 = 0;
    do
    {
      v29 = *(float32x2_t *)(v24 + 8 * (int)(v108[v26] + HIDWORD(v108[v26]) * *((_DWORD *)v13 + 16)));
      v27 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v29), (int8x8_t)v29, (int8x8_t)v27);
      v28 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v29, v28), (int8x8_t)v29, (int8x8_t)v28);
      ++v26;
    }
    while (v26 != 8);
    *((_QWORD *)v13 + 9) = *((_QWORD *)v13 + 1);
    *((_OWORD *)v13 + 5) = *((_OWORD *)v13 + 1);
    *((_DWORD *)v13 + 26) = *((_DWORD *)v13 + 10);
    v30 = vcvt_s32_f32(vneg_f32(vrndp_f32(v27)));
    *(int32x2_t *)(v13 + 108) = v30;
    __asm { FMOV            V8.2S, #1.0 }
    v36 = vcvt_s32_f32(vadd_f32(vadd_f32(vrndm_f32(v28), vcvt_f32_s32(v30)), _D8));
    *((int32x2_t *)v13 + 16) = v36;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * vmul_lane_s32(v36, v36, 1).i32[0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v13 + 12, v37);
    v38 = objc_retainAutorelease(v37);
    v39 = objc_msgSend(v38, "mutableBytes");
    v42 = *((_DWORD *)v13 + 33);
    if (v42 >= 1)
    {
      v43 = 0;
      v44 = *((_DWORD *)v13 + 32);
      v45 = vdup_n_s32(0x7FC00000u);
      v46 = (int32x2_t *)v39;
      do
      {
        if (v44 >= 1)
        {
          for (i = 0; i < v44; ++i)
          {
            *v46++ = v45;
            v44 = *((_DWORD *)v13 + 32);
          }
          v42 = *((_DWORD *)v13 + 33);
        }
        ++v43;
      }
      while (v43 < v42);
    }
    v48 = *((_DWORD *)v13 + 17);
    if (v48 > 1)
    {
      v49 = 0;
      v50 = *((_DWORD *)v13 + 16);
      do
      {
        if (v50 >= 2)
        {
          v51 = 0;
          v52 = (float32x2_t *)(v25 + 8 * v50 * v49);
          v53 = v52;
          do
          {
            v54 = v53[1];
            ++v53;
            v55 = v54;
            v56 = v50;
            v57 = v50 + 1;
            v58 = *v52;
            v59 = v52[v50];
            if ((vcgt_f32(*v52, v59).u8[0] & 1) != 0)
              LODWORD(v60) = v52[v50];
            else
              LODWORD(v60) = *(float32x2_t *)v52->f32;
            v61 = v52[v57];
            v58.i32[0] = HIDWORD(*(unint64_t *)v52);
            if (v55.f32[1] < v58.f32[1])
              v58.f32[0] = v55.f32[1];
            v62 = vcvtps_s32_f32(v58.f32[0]);
            LODWORD(v63) = HIDWORD(*(_QWORD *)&v52[v57]);
            if (v59.f32[1] >= v61.f32[1])
              LODWORD(v63) = HIDWORD(*(_QWORD *)&v52[v50]);
            v64 = vcvtms_s32_f32(v63);
            if (v62 <= v64)
            {
              v65 = vcvtps_s32_f32(v60);
              if ((vcgt_f32(v61, v55).u8[0] & 1) != 0)
                v55.i32[0] = (__int32)v52[v57];
              v66 = vcvtms_s32_f32(v55.f32[0]);
              v55.f32[0] = (float)v51;
              v67.f32[0] = (float)v51;
              v67.f32[1] = (float)v49;
              v68 = (int32x2_t)vadd_f32(v67, (float32x2_t)0x3F80000000000000);
              v69 = (int32x2_t)vadd_f32(v67, (float32x2_t)1065353216);
              *(int32x2_t *)v71.f32 = vzip1_s32((int32x2_t)v55, v69);
              v70.i32[1] = v69.i32[1];
              v70.f32[0] = (float)v49;
              *(int32x2_t *)&v70.u32[2] = vdup_lane_s32(v68, 1);
              *(int32x2_t *)v72.f32 = vzip1_s32(v69, v68);
              *(int32x2_t *)&v71.u32[2] = v68;
              *(float32x2_t *)&v72.u32[2] = vadd_f32(v67, _D8);
              *(int32x2_t *)v73.f32 = vzip2_s32(v69, v68);
              *(int32x2_t *)&v73.u32[2] = vdup_lane_s32(*(int32x2_t *)&v72.u32[2], 1);
              do
              {
                if (v65 <= v66)
                {
                  v74 = (float)v62;
                  v75 = v65;
                  do
                  {
                    v76 = *((_DWORD *)v13 + 27);
                    if (v75 + v76 >= 0)
                    {
                      v77 = *((_DWORD *)v13 + 28);
                      if (((v77 + v62) & 0x80000000) == 0)
                      {
                        v78 = *((_DWORD *)v13 + 32);
                        if (v75 + v76 < v78 && v77 + v62 < *((_DWORD *)v13 + 33))
                        {
                          v79 = v75 + v76 + v78 * (v62 + v77);
                          v80 = v52[v56];
                          v81 = v52[1];
                          v82 = v81.f32[1];
                          v83 = v80.f32[1];
                          LODWORD(v84) = vsub_f32(*v52, v80).u32[0];
                          v85 = vsub_f32(v80, v81).f32[0];
                          LODWORD(v86) = HIDWORD(*(unint64_t *)v52);
                          v87 = 1.0 / vmlas_n_f32((float)(v86 - v83) * v85, v81.f32[1] - v83, v84);
                          v88 = (float)v75 - v80.f32[0];
                          v41.f32[0] = (float)((float)((float)(v74 - v83) * v85)
                                             + (float)((float)(v81.f32[1] - v83) * v88))
                                     * v87;
                          if (v41.f32[0] >= -0.00001)
                          {
                            v89 = (float)((float)((float)(v74 - v80.f32[1]) * v84)
                                        + (float)((float)(v80.f32[1] - v86) * v88))
                                * v87;
                            if (v89 >= -0.00001)
                            {
                              v90 = 1.0 - v41.f32[0] - v89;
                              if (v90 >= -0.00001)
                              {
                                v41.f32[1] = v89;
                                v41.f32[2] = 1.0 - v41.f32[0] - v89;
                                v91 = (int32x4_t)vmulq_f32(v71, v41);
                                v92 = (int32x4_t)vmulq_f32(v70, v41);
                                *(int32x2_t *)(v39 + 8 * v79) = vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v91, 2), vadd_f32(*(float32x2_t *)v91.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v91.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2), vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v92.i8, 1))));
                                v81 = v52[1];
                                v80 = v52[v56];
                                v83 = v80.f32[1];
                                v82 = v81.f32[1];
                              }
                            }
                          }
                          v97 = v52[v57];
                          v93 = v83 - v97.f32[1];
                          v94 = v81.f32[0] - v97.f32[0];
                          v95 = v97.f32[0] - v80.f32[0];
                          v96 = 1.0
                              / (float)((float)((float)(v97.f32[0] - v80.f32[0]) * (float)(v82 - v97.f32[1]))
                                      + (float)(v93 * v94));
                          v97.f32[0] = (float)v75 - v97.f32[0];
                          v40.f32[0] = (float)((float)(v95 * (float)(v74 - v97.f32[1])) + (float)(v93 * v97.f32[0]))
                                     * v96;
                          if (v40.f32[0] >= -0.00001)
                          {
                            v98 = (float)((float)(v94 * (float)(v74 - v97.f32[1]))
                                        + (float)((float)(v97.f32[1] - v82) * v97.f32[0]))
                                * v96;
                            if (v98 >= -0.00001)
                            {
                              v99 = 1.0 - v40.f32[0] - v98;
                              if (v99 >= -0.00001)
                              {
                                v40.f32[1] = v98;
                                v40.f32[2] = 1.0 - v40.f32[0] - v98;
                                v100 = (int32x4_t)vmulq_f32(v72, v40);
                                v40 = vmulq_f32(v73, v40);
                                *(int32x2_t *)(v39 + 8 * v79) = vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v100, 2), vadd_f32(*(float32x2_t *)v100.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v100.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v40, 2), vadd_f32(*(float32x2_t *)v40.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.f32, 1))));
                              }
                            }
                          }
                        }
                      }
                    }
                    ++v75;
                  }
                  while (v66 + 1 != v75);
                }
              }
              while (v62++ != v64);
              v50 = *((_DWORD *)v13 + 16);
            }
            ++v51;
            v52 = v53;
          }
          while (v51 < v50 - 1);
          v48 = *((_DWORD *)v13 + 17);
        }
        ++v49;
      }
      while (v49 < v48 - 1);
    }

  }
  return (ADWarperMeshLensDistortionModel *)v13;
}

- (BOOL)isEqual:(id)a3
{
  ADWarperMeshLensDistortionModel *v4;
  ADWarperMeshLensDistortionModel *v5;
  ADWarperMeshLensDistortionModel *v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (ADWarperMeshLensDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_12;
  }
  if ((-[ADWarperMeshLensDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    v7 = -[ADWarperMeshLensDistortionModel type](self, "type");
    if (v7 == -[ADWarperMeshLensDistortionModel type](v6, "type")
      && (v8 = -[ADWarperMeshLensDistortionModel width](self, "width"),
          v8 == -[ADWarperMeshLensDistortionModel width](v6, "width"))
      && (v9 = -[ADWarperMeshLensDistortionModel height](self, "height"),
          v9 == -[ADWarperMeshLensDistortionModel height](v6, "height")))
    {
      -[ADWarperMeshLensDistortionModel warperMesh](self, "warperMesh");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADWarperMeshLensDistortionModel warperMesh](v6, "warperMesh");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToData:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_8:
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ADWarperMeshLensDistortionModel type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ADWarperMeshLensDistortionModel width](self, "width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ADWarperMeshLensDistortionModel height](self, "height"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[ADWarperMeshLensDistortionModel warperMesh](self, "warperMesh");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4 ^ (2 * v6) ^ (3 * v8) ^ (4 * objc_msgSend(v9, "hash"));

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ADWarperMeshLensDistortionModel *v4;
  void *v5;
  ADWarperMeshLensDistortionModel *v6;

  v4 = [ADWarperMeshLensDistortionModel alloc];
  v5 = (void *)-[NSData copy](self->_undistortMesh._warperMesh, "copy");
  v6 = -[ADWarperMeshLensDistortionModel initWithWarperMesh:type:width:height:](v4, "initWithWarperMesh:type:width:height:", v5, self->_undistortMesh._type, *(int *)&self->_anon_38[8], *(int *)&self->_anon_38[12]);

  return v6;
}

- (unint64_t)type
{
  return self->_undistortMesh._type;
}

- (int64_t)width
{
  return *(int *)&self->_anon_38[8];
}

- (int64_t)height
{
  return *(int *)&self->_anon_38[12];
}

- (NSData)warperMesh
{
  return self->_undistortMesh._warperMesh;
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)x3_0 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v10;
  CGSize v11;

  v10 = a5;
  objc_msgSend(v10, "referenceDimensions");
  ADWarperMesh::apply(&self->_distortMesh, a3, (float64x2_t *)x3_0, v11, (float64x2_t *)a6);

}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)x3_0 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v10;
  CGSize v11;

  v10 = a5;
  objc_msgSend(v10, "referenceDimensions");
  ADWarperMesh::apply(&self->_undistortMesh, a3, (float64x2_t *)x3_0, v11, (float64x2_t *)a6);

}

- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4
{
  CGSize refDimensions;
  CGFloat y;
  CGFloat v6;
  CGFloat height;
  double v8;
  CGSize v9;

  refDimensions = self->_undistortMesh._refDimensions;
  y = a3.origin.y;
  v6 = a3.size.width / a4.width;
  height = a4.height;
  *(float32x2_t *)self->_anon_38 = vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_f64((float64x2_t)a3.origin, (float64x2_t)refDimensions), (float64x2_t)a4), vcvtq_f64_f32(*(float32x2_t *)self->_anon_38)));
  v8 = a3.size.height / a4.height;
  self->_undistortMesh._refDimensions.width = v6 * refDimensions.width;
  self->_undistortMesh._refDimensions.height = vmuld_lane_f64(v8, (float64x2_t)refDimensions, 1);
  v9 = self->_distortMesh._refDimensions;
  self[1].super.isa = (Class)vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_f64((float64x2_t)a3.origin, (float64x2_t)v9), (float64x2_t)a4), vcvtq_f64_f32((float32x2_t)self[1].super.isa)));
  self->_distortMesh._refDimensions.width = v6 * v9.width;
  self->_distortMesh._refDimensions.height = vmuld_lane_f64(v8, (float64x2_t)v9, 1);
}

- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("warper mesh distortion model does not support rotation"), 0, a4.width, a4.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (ADWarperMeshLensDistortionModel)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ADWarperMeshLensDistortionModel *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meshType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meshWidth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meshHeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mesh"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = 0;
  if (v5 && v6 && v7 && v8)
  {
    self = -[ADWarperMeshLensDistortionModel initWithWarperMesh:type:width:height:](self, "initWithWarperMesh:type:width:height:", v8, objc_msgSend(v5, "unsignedIntValue"), objc_msgSend(v6, "integerValue"), objc_msgSend(v7, "integerValue"));
    v10 = self;
  }

  return v10;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("meshType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ADWarperMeshLensDistortionModel type](self, "type", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("meshWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ADWarperMeshLensDistortionModel width](self, "width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("meshHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ADWarperMeshLensDistortionModel height](self, "height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("mesh");
  -[ADWarperMeshLensDistortionModel warperMesh](self, "warperMesh");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  NSData *warperMesh;
  NSData *v4;

  warperMesh = self->_distortMesh._warperMesh;
  self->_distortMesh._warperMesh = 0;

  v4 = self->_undistortMesh._warperMesh;
  self->_undistortMesh._warperMesh = 0;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end

@implementation ABPKVisualizer

- (ABPKVisualizer)init
{
  ABPKVisualizer *v2;
  __int128 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABPKVisualizer;
  v2 = -[ABPKVisualizer init](&v5, sel_init);
  if (v2)
  {
    VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &v2->_pixelTransferSession);
    v2->_pixelBufferPoolBGRA = 0;
    *(_QWORD *)&v3 = 0xFF00000000;
    *((_QWORD *)&v3 + 1) = 0xFF00000000;
    *(_OWORD *)v2->_highConfidenceColor = v3;
    *(_OWORD *)v2->_mediumConfidenceColor = xmmword_210881590;
    *(_OWORD *)v2->_lowConfidenceColor = xmmword_210881570;
  }
  return v2;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *pixelTransferSession;
  __CVPixelBufferPool *pixelBufferPoolBGRA;
  __CVPixelBufferPool *pixelBufferPoolYUV;
  objc_super v6;

  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
    CFRelease(pixelTransferSession);
  pixelBufferPoolBGRA = self->_pixelBufferPoolBGRA;
  if (pixelBufferPoolBGRA)
  {
    CVPixelBufferPoolRelease(pixelBufferPoolBGRA);
    self->_pixelBufferPoolBGRA = 0;
  }
  pixelBufferPoolYUV = self->_pixelBufferPoolYUV;
  if (pixelBufferPoolYUV)
  {
    CVPixelBufferPoolRelease(pixelBufferPoolYUV);
    self->_pixelBufferPoolYUV = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ABPKVisualizer;
  -[ABPKVisualizer dealloc](&v6, sel_dealloc);
}

- (BOOL)jointInImageDimensions:(CGSize)a3 imageDimensions:
{
  double v3;

  if (*(float *)&a3.width < 0.0 || a3.height <= *(float *)&a3.width)
    return 0;
  if (v3 > *((float *)&a3.width + 1))
    return *((float *)&a3.width + 1) >= 0.0;
  return 0;
}

- (int)generateStickFigureImageFrom:(__CVBuffer *)a3 detectedBodies2d:(id)a4 confidences:(id)a5 skeletonDefinition:(id)a6 overlayImage:(__CVBuffer *)a7 color:(BOOL)a8 faceOnly:
{
  double v8;
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  double v21;
  uint8_t buf[8];
  size_t Height;
  size_t Width;
  size_t BytesPerRow;

  v9 = a8;
  v21 = v8;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a3, a7))
  {
    __ABPKLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_ERROR, " Could not transfer image. ", buf, 2u);
    }

    v19 = -6660;
  }
  else
  {
    CVPixelBufferLockBaseAddress(a7, 0);
    *(_QWORD *)buf = CVPixelBufferGetBaseAddress(a7);
    Height = CVPixelBufferGetHeight(a7);
    Width = CVPixelBufferGetWidth(a7);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a7);
    -[ABPKVisualizer overlayJoints:withSkeletonDefinition:confidences:OnImage:color:faceOnly:](self, "overlayJoints:withSkeletonDefinition:confidences:OnImage:color:faceOnly:", v15, v17, v16, buf, v9, v21);
    CVPixelBufferUnlockBaseAddress(a7, 0);
    v19 = 0;
  }

  return v19;
}

- (int)drawBoundingBox:(CGRect)a3 withColor:(__CVBuffer *)a4 OnImage:(__CVBuffer *)a5 andGenerateOverlayImage:
{
  double v5;
  double height;
  double width;
  double y;
  double x;
  NSObject *v12;
  size_t BytesPerRow;
  unsigned int v15;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint8_t buf[8];
  size_t v27;
  size_t v28;
  size_t v29;

  v25 = v5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a4, a5))
  {
    __ABPKLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_ERROR, " Could not transfer image. ", buf, 2u);
    }

    return -6660;
  }
  else
  {
    CVPixelBufferLockBaseAddress(a5, 0);
    *(_QWORD *)buf = CVPixelBufferGetBaseAddress(a5);
    v27 = CVPixelBufferGetHeight(a5);
    v28 = CVPixelBufferGetWidth(a5);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a5);
    *(float *)&v15 = x;
    *(float *)&v16 = y;
    v17 = COERCE_DOUBLE(__PAIR64__(v16, v15));
    LODWORD(v18) = v15;
    v29 = BytesPerRow;
    *(float *)&v19 = x + width;
    v21 = COERCE_DOUBLE(__PAIR64__(v16, LODWORD(v19)));
    v22 = v17;
    v20 = y + height;
    *((float *)&v18 + 1) = v20;
    *((float *)&v19 + 1) = v20;
    v23 = v19;
    v24 = v18;
    -[ABPKVisualizer drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:](self, "drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:", 5, buf, v17, v21, v25);
    -[ABPKVisualizer drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:](self, "drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:", 5, buf, v21, v23, v25);
    -[ABPKVisualizer drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:](self, "drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:", 5, buf, v23, v24, v25);
    -[ABPKVisualizer drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:](self, "drawLineFromPoint:ToPoint:withThickness:withColor:OnImage:", 5, buf, v24, v22, v25);
    CVPixelBufferUnlockBaseAddress(a5, 0);
    return 0;
  }
}

- (int)drawLineFromPoint:(unint64_t)a3 ToPoint:(vImage_Buffer *)a4 withThickness:withColor:OnImage:
{
  float32x2_t v4;
  float32x2_t v5;
  __int128 v6;
  __int128 v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  float32x2_t v18;
  uint64_t v20;
  float v21;
  __int128 v22;

  v8 = v5;
  *(float32x2_t *)&v7 = v4;
  v9 = vsub_f32(v4, v5);
  v21 = (float)(a3 >> 1);
  if (sqrtf(vaddv_f32(vmul_f32(v9, v9))) > v21)
  {
    v12 = vsub_f32(v5, *(float32x2_t *)&v7);
    v13 = vmul_f32(v12, v12);
    v13.f32[0] = sqrtf(vaddv_f32(v13));
    v14 = vmul_n_f32(vdiv_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 0)), v21);
    v15 = BYTE8(v6);
    v16 = v6;
    v17 = BYTE4(v6);
    do
    {
      *(float32x2_t *)&v7 = vadd_f32(v14, *(float32x2_t *)&v7);
      v22 = v7;
      LOBYTE(v20) = v15;
      objc_msgSend((id)objc_opt_class(), "_drawRectOfSize:posx:posy:pImage:red:green:blue:", a3, (int)*(float *)&v7, (int)*((float *)&v7 + 1), a4, v16, v17, v20);
      v7 = v22;
      v18 = vsub_f32(*(float32x2_t *)&v22, v8);
    }
    while (sqrtf(vaddv_f32(vmul_f32(v18, v18))) > v21);
  }
  return 0;
}

- (int)drawFaceBbox:(__CVBuffer *)a3 detectedBodies2d:(id)a4 confidences:(id)a5 skeletonDefinition:(id)a6 overlayImage:(__CVBuffer *)a7 color:
{
  double v7;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  double v30;
  int v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  double v36;
  double v37;
  int v38;
  __int128 v39;
  double v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  int v46;
  int v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  __int128 v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint8_t buf[8];
  size_t Height;
  size_t Width;
  size_t BytesPerRow;

  v58 = v7;
  v12 = a4;
  v13 = a6;
  if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a3, a7))
  {
    __ABPKLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_ERROR, " Could not transfer image. ", buf, 2u);
    }

    v15 = -6660;
  }
  else
  {
    CVPixelBufferLockBaseAddress(a7, 0);
    *(_QWORD *)buf = CVPixelBufferGetBaseAddress(a7);
    Height = CVPixelBufferGetHeight(a7);
    Width = CVPixelBufferGetWidth(a7);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a7);
    v16 = (double)Width;
    v17 = (double)Height;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = (double)Height * v20;
    v22 = v21;
    if (v21 >= 0.0)
      v23 = 0.5;
    else
      v23 = -0.5;
    v24 = (int)(v23 + v22);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v28 = v16 * v27;
    v29 = v28;
    if (v28 >= 0.0)
      v30 = 0.5;
    else
      v30 = -0.5;
    v31 = (int)(v30 + v29);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    v35 = v16 * v34;
    v36 = v35;
    if (v35 >= 0.0)
      v37 = 0.5;
    else
      v37 = -0.5;
    v38 = (int)(v37 + v36);

    v40 = (double)(v38 - v31);
    v41 = (double)v24 + v40 * -0.7;
    v42 = 1.0;
    v43 = 1.0;
    if (v41 > 0.0)
    {
      v43 = (double)v24 + v40 * -0.7;
      if (v17 <= v41)
        v43 = v17 + -1.0;
    }
    v44 = (double)v24 + v40 * 0.9;
    v45 = v17 + -1.0;
    if (v17 > v44)
      v45 = (double)v24 + v40 * 0.9;
    if (v44 > 0.0)
      v42 = v45;
    v46 = (int)(v16 + 7.0 + -1.0);
    if (v16 + 7.0 > (double)v31)
      v46 = v31;
    if (v31 < 8)
      v46 = 8;
    *(double *)&v39 = (double)v38;
    if (v38 >= -6)
      v47 = v38;
    else
      v47 = 8;
    if (v16 + -7.0 <= *(double *)&v39)
      v47 = (int)(v16 + -7.0 + -1.0);
    *(float *)&v39 = (float)(v46 - 7);
    v48 = v39;
    *(float *)&v49 = *(float *)&v39;
    *((float *)&v48 + 1) = v43;
    v50 = *(double *)&v48;
    v53 = v48;
    *(float *)&v51 = (float)(v47 + 7);
    *(float *)&v48 = *(float *)&v51;
    *((float *)&v48 + 1) = v43;
    *((float *)&v49 + 1) = v42;
    v55 = *(double *)&v48;
    v56 = v49;
    *((float *)&v51 + 1) = v42;
    v57 = v51;
    -[ABPKVisualizer drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:](self, "drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:", v12, v13, buf, v50, *(double *)&v48, v58, v53);
    -[ABPKVisualizer drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:](self, "drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:", v12, v13, buf, v54, v56, v58);
    -[ABPKVisualizer drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:](self, "drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:", v12, v13, buf, v56, v57, v58);
    -[ABPKVisualizer drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:](self, "drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:", v12, v13, buf, v55, v57, v58);
    CVPixelBufferUnlockBaseAddress(a7, 0);
    v15 = 0;
  }

  return v15;
}

- (void)drawFaceBboxEdgewithJoints:(id)a3 withSkeletonDefinition:(id)a4 fromPostion:(vImage_Buffer *)a5 toPosition:OnImage:color:
{
  float32x2_t v5;
  float32x2_t v6;
  __int128 v7;
  __int128 v8;
  float32x2_t v9;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  float32x2_t v19;
  uint64_t v20;
  __int128 v21;

  *(float32x2_t *)&v8 = v5;
  v9 = vsub_f32(v5, v6);
  if (sqrtf(vaddv_f32(vmul_f32(v9, v9))) > 2.0)
  {
    v11 = v6;
    v12 = vsub_f32(v6, *(float32x2_t *)&v8);
    v13 = vmul_f32(v12, v12);
    v13.f32[0] = sqrtf(vaddv_f32(v13));
    v14 = vdiv_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 0));
    v15 = vadd_f32(v14, v14);
    v16 = BYTE8(v7);
    v17 = v7;
    v18 = BYTE4(v7);
    do
    {
      *(float32x2_t *)&v8 = vadd_f32(v15, *(float32x2_t *)&v8);
      v21 = v8;
      LOBYTE(v20) = v16;
      objc_msgSend((id)objc_opt_class(), "_drawRectOfSize:posx:posy:pImage:red:green:blue:", 5, (int)*(float *)&v8, (int)*((float *)&v8 + 1), a5, v17, v18, v20);
      v8 = v21;
      v19 = vsub_f32(*(float32x2_t *)&v21, v11);
    }
    while (sqrtf(vaddv_f32(vmul_f32(v19, v19))) > 2.0);
  }
}

- (void)overlayJoints:(id)a3 withSkeletonDefinition:(id)a4 confidences:(id)a5 OnImage:(vImage_Buffer *)a6 color:(BOOL)a7 faceOnly:
{
  __int128 v7;
  _BOOL8 v8;
  id v13;
  vImage_Buffer *v14;
  double width;
  double height;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  double v25;
  double v26;
  _BOOL8 v27;
  int v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  double v33;
  double v34;
  vImage_Buffer *v35;
  int v36;
  __int128 v37;
  float v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  double v43;
  double v44;
  int v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  double v50;
  double v51;
  int v52;
  float32x2_t v53;
  float v54;
  _BOOL4 v55;
  __int128 v56;
  float32x2_t v57;
  float32x2_t v58;
  float32x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  float v66;
  float v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  void *v72;
  float v73;
  float v74;
  double v75;
  double v76;
  uint64_t v77;
  double v78;
  void *v79;
  float v80;
  float v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  unsigned __int8 v85;
  uint64_t v86;
  uint64_t v87;
  vImage_Buffer *v88;
  uint64_t v89;
  id v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  char v93;
  id v94;
  float32x2_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;

  v8 = a7;
  v96 = v7;
  v99 = a3;
  v13 = a4;
  v14 = a6;
  v94 = v13;
  v90 = a5;
  width = (double)a6->width;
  height = (double)a6->height;
  v91 = BYTE4(v96);
  v92 = v96;
  v93 = BYTE8(v96);
  if (objc_msgSend(v99, "count"))
  {
    v17 = 0;
    v18 = BYTE4(v96);
    do
    {
      if (!v8 || v17 <= 0x12 && ((1 << v17) & 0x6C000) != 0)
      {
        v19 = objc_msgSend(v94, "parentJoint:", v17);
        if (v19 != -1)
        {
          v20 = v19;
          objc_msgSend(v99, "objectAtIndexedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "floatValue");
          v24 = width * v23;
          v25 = v24;
          v26 = v24 >= 0.0 ? 0.5 : -0.5;
          v27 = v8;
          v28 = (int)(v26 + v25);

          objc_msgSend(v99, "objectAtIndexedSubscript:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          v32 = height * v31;
          v33 = v32;
          v34 = v32 >= 0.0 ? 0.5 : -0.5;
          v35 = v14;
          v36 = (int)(v34 + v33);

          *(float *)&v37 = (float)v28;
          v8 = v27;
          v38 = (float)v36;
          v14 = v35;
          *((float *)&v37 + 1) = v38;
          v97 = v37;
          if (-[ABPKVisualizer jointInImageDimensions:imageDimensions:](self, "jointInImageDimensions:imageDimensions:"))
          {
            objc_msgSend(v99, "objectAtIndexedSubscript:", v20);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "floatValue");
            v42 = width * v41;
            v43 = v42;
            v44 = v42 >= 0.0 ? 0.5 : -0.5;
            v45 = (int)(v44 + v43);

            objc_msgSend(v99, "objectAtIndexedSubscript:", v20);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "floatValue");
            v49 = height * v48;
            v50 = v49;
            v51 = v49 >= 0.0 ? 0.5 : -0.5;
            v52 = (int)(v51 + v50);

            v53.f32[0] = (float)v45;
            v8 = v27;
            v54 = (float)v52;
            v14 = v35;
            v53.f32[1] = v54;
            v95 = v53;
            v55 = -[ABPKVisualizer jointInImageDimensions:imageDimensions:](self, "jointInImageDimensions:imageDimensions:");
            v56 = v97;
            if (v55)
            {
              v57 = vsub_f32(*(float32x2_t *)&v97, v95);
              if (sqrtf(vaddv_f32(vmul_f32(v57, v57))) > 2.0)
              {
                v58 = vsub_f32(v95, *(float32x2_t *)&v97);
                v59 = vmul_f32(v58, v58);
                v59.f32[0] = sqrtf(vaddv_f32(v59));
                v60 = vdiv_f32(v58, (float32x2_t)vdup_lane_s32((int32x2_t)v59, 0));
                v61 = vadd_f32(v60, v60);
                do
                {
                  *(float32x2_t *)&v56 = vadd_f32(v61, *(float32x2_t *)&v56);
                  v98 = v56;
                  LOBYTE(v89) = v93;
                  objc_msgSend((id)objc_opt_class(), "_drawRectOfSize:posx:posy:pImage:red:green:blue:", 4, (int)*(float *)&v56, (int)*((float *)&v56 + 1), v35, v92, v18, v89);
                  v56 = v98;
                  v62 = vsub_f32(*(float32x2_t *)&v98, v95);
                }
                while (sqrtf(vaddv_f32(vmul_f32(v62, v62))) > 2.0);
              }
            }
          }
        }
      }
      ++v17;
    }
    while (v17 < objc_msgSend(v99, "count"));
  }
  if (objc_msgSend(v99, "count"))
  {
    v63 = 0;
    do
    {
      if (!v8 || v63 <= 0x12 && ((1 << v63) & 0x6C001) != 0)
      {
        objc_msgSend(v99, "objectAtIndexedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "floatValue");
        v67 = width * v66;
        v68 = v67;
        v69 = v67 >= 0.0 ? 0.5 : -0.5;
        v70 = (int)(v69 + v68);

        objc_msgSend(v99, "objectAtIndexedSubscript:", v63);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 1);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "floatValue");
        v74 = height * v73;
        v75 = v74;
        v76 = v74 >= 0.0 ? 0.5 : -0.5;
        v77 = (int)(v76 + v75);

        *(float *)&v78 = (float)(int)v70;
        *((float *)&v78 + 1) = (float)(int)v77;
        if (-[ABPKVisualizer jointInImageDimensions:imageDimensions:](self, "jointInImageDimensions:imageDimensions:", v78, width, height))
        {
          if (v90)
          {
            objc_msgSend(v90, "objectAtIndexedSubscript:", v63);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "floatValue");
            v81 = v80;

            if (v81 >= 0.2)
            {
              v82 = (void *)objc_opt_class();
              if (v81 >= 0.5)
              {
                v83 = self->_highConfidenceColor[0];
                v84 = self->_highConfidenceColor[4];
                v85 = self->_highConfidenceColor[8];
              }
              else
              {
                v83 = self->_mediumConfidenceColor[0];
                v84 = self->_mediumConfidenceColor[4];
                v85 = self->_mediumConfidenceColor[8];
              }
            }
            else
            {
              v82 = (void *)objc_opt_class();
              v83 = self->_lowConfidenceColor[0];
              v84 = self->_lowConfidenceColor[4];
              v85 = self->_lowConfidenceColor[8];
            }
            LOBYTE(v89) = v85;
            v86 = v70;
            v87 = v77;
            v88 = v14;
          }
          else
          {
            v82 = (void *)objc_opt_class();
            LOBYTE(v89) = v93;
            v86 = v70;
            v87 = v77;
            v88 = v14;
            v83 = v92;
            v84 = v91;
          }
          objc_msgSend(v82, "_drawRectOfSize:posx:posy:pImage:red:green:blue:", 8, v86, v87, v88, v83, v84, v89);
        }
      }
      ++v63;
    }
    while (objc_msgSend(v99, "count") > v63);
  }

}

+ (void)_drawRectOfSize:(int)a3 posx:(int)a4 posy:(int)a5 pImage:(vImage_Buffer *)a6 red:(unsigned __int8)a7 green:(unsigned __int8)a8 blue:(unsigned __int8)a9
{
  int v11;
  size_t rowBytes;
  int32x2_t v13;
  int32x2_t v14;
  int32x2_t v15;
  uint64x2_t v16;
  int64x2_t v17;
  int8x8_t v18;
  vImage_Buffer v19;

  if (a3 >= 0)
    v11 = a3;
  else
    v11 = a3 + 1;
  rowBytes = a6->rowBytes;
  v13 = vmax_s32(vadd_s32(vdup_n_s32(-(v11 >> 1)), (int32x2_t)__PAIR64__(a4, a5)), 0);
  v14 = vdup_n_s32(a3);
  v15 = vadd_s32(v13, v14);
  v16.i64[0] = v15.i32[0];
  v16.i64[1] = v15.i32[1];
  v17.i64[0] = -1;
  v17.i64[1] = -1;
  v18 = vbsl_s8((int8x8_t)vmovn_s64((int64x2_t)vcgtq_u64(v16, (uint64x2_t)vaddq_s64(*(int64x2_t *)&a6->height, v17))), (int8x8_t)vadd_s32(vmovn_s64(*(int64x2_t *)&a6->height), (int32x2_t)vmvn_s8((int8x8_t)v13)), (int8x8_t)v14);
  v19.data = (char *)a6->data + rowBytes * v13.u32[0] + (4 * v13.i32[1]);
  v16.i64[0] = v18.i32[0];
  v16.i64[1] = v18.i32[1];
  *(uint64x2_t *)&v19.height = v16;
  v19.rowBytes = rowBytes;
  vImageOverwriteChannelsWithScalar_ARGB8888(0xFFu, &v19, &v19, 1u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(a7, &v19, &v19, 2u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(a8, &v19, &v19, 4u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(a9, &v19, &v19, 8u, 0x10u);
}

@end

@implementation PersonDetectionManager

- (PersonDetectionManager)initWithCenterDetectionSize:(CGSize)a3 labellingTolerance:(float)a4 significantAreaThresholdMM:(float)a5 closeDetectionFactor:(float)a6
{
  CGFloat height;
  CGFloat width;
  PersonDetectionManager *v11;
  PersonDetectionManager *v12;
  NSArray *detectedPersonArray;
  ARCamera *arCamera;
  PersonDetectionManager *v15;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)PersonDetectionManager;
  v11 = -[PersonDetectionManager init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    detectedPersonArray = v11->_detectedPersonArray;
    v11->_detectedPersonArray = (NSArray *)MEMORY[0x24BDBD1A8];

    arCamera = v12->_arCamera;
    v12->_arCamera = 0;

    v12->_isCenterDetectionEnabled = 0;
    v12->_maxLabel = 0;
    v12->_centerDetectionSize.width = width;
    v12->_centerDetectionSize.height = height;
    v12->_labellingTolerance = a4;
    v12->_significantAreaThresholdMM = a5;
    v12->_closeDetectionFactor = a6;
    v15 = v12;
  }

  return v12;
}

- (void)dealloc
{
  __CVBuffer *labelBuffer;
  objc_super v4;

  labelBuffer = self->_labelBuffer;
  if (labelBuffer)
    CVPixelBufferRelease(labelBuffer);
  v4.receiver = self;
  v4.super_class = (Class)PersonDetectionManager;
  -[PersonDetectionManager dealloc](&v4, sel_dealloc);
}

- (void)computePersonDetectionFromFrame:(id)a3 interfaceOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  ARCamera *v15;
  ARCamera *arCamera;
  NSArray *v17;
  NSArray *detectedPersonArray;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  if (v22)
  {
    if (self->_arCamera)
    {
      objc_msgSend(v22, "camera");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intrinsics");
      -[ARCamera setIntrinsics:](self->_arCamera, "setIntrinsics:");

      objc_msgSend(v22, "camera");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageResolution");
      -[ARCamera setImageResolution:](self->_arCamera, "setImageResolution:");
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x24BDB1480]);
      objc_msgSend(v22, "camera");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "intrinsics");
      v20 = v10;
      v21 = v9;
      v19 = v11;
      objc_msgSend(v22, "camera");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageResolution");
      v15 = (ARCamera *)objc_msgSend(v8, "initWithIntrinsics:imageResolution:", v21, v20, v19, v13, v14);
      arCamera = self->_arCamera;
      self->_arCamera = v15;

    }
    -[PersonDetectionManager getDetectedPersonsFromBuffer:camera:interfaceOrientation:](self, "getDetectedPersonsFromBuffer:camera:interfaceOrientation:", objc_msgSend(v22, "estimatedDepthData"), self->_arCamera, a4);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    detectedPersonArray = self->_detectedPersonArray;
    self->_detectedPersonArray = v17;

  }
}

- (double)unprojectPoint:(double)a3 atDepth:(double)a4 viewSize:(double)a5 interfaceOrientation:(double)a6
{
  void *v6;
  double result;

  v6 = *(void **)(a1 + 40);
  if (!v6)
    return 0.0;
  objc_msgSend(v6, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", a2, a3, *(double *)&_PromotedConst, 0.0, -0.0078125, 0.0, a5, a6);
  return result;
}

- (CGPoint)project3dPoint:(CGSize)a3 viewSize:(int64_t)a4 interfaceOrientation:
{
  ARCamera *arCamera;
  double v5;
  double v6;
  CGPoint result;

  arCamera = self->_arCamera;
  if (arCamera)
  {
    -[ARCamera projectPoint:orientation:viewportSize:](arCamera, "projectPoint:orientation:viewportSize:", a4, a3.width, a3.height);
  }
  else
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)getDetectedPersonsFromBuffer:(__CVBuffer *)a3 camera:(id)a4 interfaceOrientation:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  uint64_t v9;
  id v10;
  size_t BytesPerRow;
  __CVBuffer *v12;
  CVPixelBufferRef *v13;
  size_t v14;
  uint64_t i;
  BoundingBoxWithLabel *v16;
  double v17;
  double v18;
  size_t v19;
  size_t v20;
  uint64_t v21;
  _WORD *v22;
  float *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _WORD *v28;
  float *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  double v42;
  _WORD *v43;
  uint64_t j;
  _WORD *v45;
  unint64_t k;
  int v47;
  __int16 v48;
  uint64_t m;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  DetectedPersonData *v59;
  int v60;
  double v61;
  DetectedPersonData *v62;
  unint64_t v63;
  float v64;
  __CVBuffer *pixelBuffer;
  CFDictionaryRef pixelBufferAttributes;
  float *BaseAddress;
  size_t v69;
  _WORD *v70;
  void *v71;
  unint64_t height;
  size_t v73;
  void *v74;
  id v75;
  unsigned __int16 *obj;
  id obja;
  void *v78;
  uint64_t v79;
  unint64_t width;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[130];
  _WORD v86[65535];
  uint64_t v87;
  _QWORD v88[4];

  v5 = MEMORY[0x24BDAC7A8](self, a2, a3, a4, a5);
  v79 = v6;
  v8 = v7;
  v9 = v5;
  v88[1] = *MEMORY[0x24BDAC8D0];
  v75 = v10;
  if (v8)
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(v8);
    width = CVPixelBufferGetWidth(v8);
    height = CVPixelBufferGetHeight(v8);
    CVPixelBufferLockBaseAddress(v8, 0);
    v87 = *MEMORY[0x24BDC5668];
    v88[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    pixelBufferAttributes = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
    v13 = (CVPixelBufferRef *)(v9 + 32);
    v12 = *(__CVBuffer **)(v9 + 32);
    if (!v12)
    {
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], width, height, 0x4C303136u, pixelBufferAttributes, (CVPixelBufferRef *)(v9 + 32)))
      {
        v8 = 0;
        *v13 = 0;
LABEL_79:

        goto LABEL_80;
      }
      v12 = *v13;
    }
    v14 = CVPixelBufferGetBytesPerRow(v12);
    CVPixelBufferLockBaseAddress(*v13, 0);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(v8);
    v70 = CVPixelBufferGetBaseAddress(*v13);
    v73 = v14;
    v69 = BytesPerRow;
    pixelBuffer = v8;
    v78 = (void *)objc_opt_new();
    for (i = 0; i != 0xFFFF; ++i)
    {
      v16 = -[BoundingBoxWithLabel initWithLabel:]([BoundingBoxWithLabel alloc], "initWithLabel:", (unsigned __int16)i);
      objc_msgSend(v78, "addObject:", v16);

    }
    v19 = v14;
    v20 = BytesPerRow;
    if (height)
    {
      v21 = 0;
      v22 = v70;
      v23 = BaseAddress;
      while (1)
      {
        v24 = (char *)BaseAddress + (v21 - 1) * v20;
        if (v21)
          v25 = v24;
        else
          v25 = 0;
        v26 = (char *)v70 + (v21 - 1) * v19;
        if (!v21)
          v26 = 0;
        obj = (unsigned __int16 *)v26;
        if (width)
          break;
LABEL_48:
        ++v21;
        v20 = v69;
        v23 = (float *)((char *)v23 + v69);
        v19 = v73;
        v22 = (_WORD *)((char *)v22 + v73);
        if (v21 == height)
          goto LABEL_49;
      }
      v27 = 0;
      v28 = v22;
      v29 = v23;
      while (1)
      {
        *(float *)&v17 = *v29;
        if (*v29 != 0.0)
          break;
        *v28 = 0;
LABEL_47:
        ++v27;
        ++v29;
        ++v28;
        if (width == v27)
          goto LABEL_48;
      }
      v30 = 0.0;
      v31 = 0.0;
      if (v27)
        v31 = *(v29 - 1);
      if (v25)
        v30 = *(float *)&v25[4 * v27];
      v32 = vabds_f32(*(float *)&v17, v31);
      v33 = *(float *)(v9 + 12);
      *(float *)&v18 = vabds_f32(*(float *)&v17, v30);
      if (v32 >= v33 && *(float *)&v18 >= v33)
      {
        objc_msgSend((id)v9, "computeLabelIn:x:y:depth:", v78, v27, v21, v17, v18);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "alias");

LABEL_46:
        *v28 = v39;
        objc_msgSend(v78, "objectAtIndexedSubscript:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v42 = *v29;
        objc_msgSend((id)v9, "updateLabel:x:y:depth:", v41, v27, v21, v42);

        goto LABEL_47;
      }
      if (v32 >= v33 || *(float *)&v18 < v33)
      {
        if (v32 < v33 || *(float *)&v18 >= v33)
        {
          if (v27)
            v37 = (unsigned __int16)*(v28 - 1);
          else
            v37 = 0;
          if (obj)
            v40 = obj[v27];
          else
            v40 = 0;
          v39 = objc_msgSend((id)v9, "unionLabel:with:inLabels:", v37, v40, v78, v17, v18);
          goto LABEL_46;
        }
        if (obj)
        {
          v39 = obj[v27];
          goto LABEL_46;
        }
      }
      else if (v27)
      {
        v39 = (unsigned __int16)*(v28 - 1);
        goto LABEL_46;
      }
      v39 = 0;
      goto LABEL_46;
    }
LABEL_49:
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    bzero(v86, 0x1FFFEuLL);
    v43 = v70;
    if (height)
    {
      for (j = 0; j != height; ++j)
      {
        v45 = v43;
        for (k = width; k; --k)
        {
          if (*v43)
          {
            v47 = objc_msgSend((id)v9, "findLabel:inLabels:");
            v48 = v86[v47];
            if (!v48)
            {
              v48 = v86[0] + 1;
              v86[0] = v48;
              v86[v47] = v48;
            }
            *v43 = v48;
          }
          ++v43;
        }
        v43 = (_WORD *)((char *)v45 + v73);
      }
    }
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v9 + 32), 0);
    *(_WORD *)(v9 + 10) = v86[0];
    v71 = (void *)objc_opt_new();
    for (m = 1; m != 0xFFFF; ++m)
    {
      if (v86[m])
      {
        objc_msgSend(v78, "objectAtIndexedSubscript:", m);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v50);

      }
    }
    v74 = (void *)objc_opt_new();
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    obja = v71;
    v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v82;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v82 != v52)
            objc_enumerationMutation(obja);
          v54 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * n);
          if ((unint64_t)objc_msgSend(v54, "computeArea") >= 0x19)
          {
            v55 = objc_msgSend(v54, "minX");
            v56 = objc_msgSend(v54, "maxX");
            v57 = objc_msgSend(v54, "minY");
            v58 = objc_msgSend(v54, "maxY");
            v59 = [DetectedPersonData alloc];
            objc_msgSend(v54, "depth");
            LODWORD(v61) = v60;
            v62 = -[DetectedPersonData initWithNormalizedMinX:maxX:minY:maxY:depth:camera:orientation:](v59, "initWithNormalizedMinX:maxX:minY:maxY:depth:camera:orientation:", v75, v79, (double)v55 / (double)width, (double)v56 / (double)width, (double)v57 / (double)height, (double)v58 / (double)height, v61);
            v63 = -[DetectedPersonData computeArea](v62, "computeArea");
            objc_msgSend(v54, "depth");
            objc_msgSend((id)v9, "areaFactorForDepth:camera:orientation:", *(_QWORD *)(v9 + 40), v79);
            if ((float)(v64 * *(float *)(v9 + 16)) > (float)v63)
              -[DetectedPersonData setIsEnabled:](v62, "setIsEnabled:", 0);
            if (*(_BYTE *)(v9 + 8)
              && (objc_msgSend((id)v9, "isIntersectingWithCenter:width:height:", v62, width, height) & 1) == 0)
            {
              -[DetectedPersonData setIsEnabled:](v62, "setIsEnabled:", 0);
            }
            objc_msgSend(v74, "addObject:", v62);

          }
        }
        v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      }
      while (v51);
    }

    objc_msgSend(v74, "sortUsingComparator:", &__block_literal_global_110);
    v8 = (__CVBuffer *)objc_msgSend(v74, "copy");

    goto LABEL_79;
  }
LABEL_80:

  return v8;
}

uint64_t __83__PersonDetectionManager_getDetectedPersonsFromBuffer_camera_interfaceOrientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int32x4_t v6;
  int32x4_t v7;
  uint64_t v8;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isValid") && (objc_msgSend(v4, "isEnabled") & 1) != 0)
  {
    if (!objc_msgSend(v5, "isValid") || !objc_msgSend(v5, "isEnabled"))
    {
      v8 = -1;
      goto LABEL_7;
    }
    objc_msgSend(v4, "position");
    v12 = v6;
    objc_msgSend(v5, "position");
    if ((vmovn_s32(vcgtq_s32(v12, v7)).i32[1] & 1) == 0)
    {
      objc_msgSend(v4, "position");
      v13 = v10;
      objc_msgSend(v5, "position");
      v8 = (uint64_t)((unint64_t)vmovn_s32(vcgtq_s32(v11, v13)).u16[2] << 63) >> 63;
      goto LABEL_7;
    }
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (unsigned)findLabel:(unsigned __int16)a3 inLabels:(id)a4
{
  id v5;
  unsigned __int16 v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;

  v5 = a4;
  v6 = a3;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "alias");

    if (v8 == v6)
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "alias");

  }
  while (1)
  {
    v12 = a3;
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "alias");

    if (v14 == (_DWORD)v12)
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v10, "alias");

    objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlias:", v6);

  }
  return v6;
}

- (unsigned)unionLabel:(unsigned __int16)a3 with:(unsigned __int16)a4 inLabels:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = -[PersonDetectionManager findLabel:inLabels:](self, "findLabel:inLabels:", v6, v8);
  v10 = -[PersonDetectionManager findLabel:inLabels:](self, "findLabel:inLabels:", v5, v8);
  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlias:", v10);
  v13 = objc_msgSend(v11, "minX");
  v14 = objc_msgSend(v12, "minX");
  if (v13 >= v14)
    v15 = v14;
  else
    v15 = v13;
  objc_msgSend(v12, "setMinX:", v15);
  v16 = objc_msgSend(v11, "maxX");
  v17 = objc_msgSend(v12, "maxX");
  if (v16 <= v17)
    v18 = v17;
  else
    v18 = v16;
  objc_msgSend(v12, "setMaxX:", v18);
  v19 = objc_msgSend(v11, "minY");
  v20 = objc_msgSend(v12, "minY");
  if (v19 >= v20)
    v21 = v20;
  else
    v21 = v19;
  objc_msgSend(v12, "setMinY:", v21);
  v22 = objc_msgSend(v11, "maxY");
  v23 = objc_msgSend(v12, "maxY");
  if (v22 <= v23)
    v24 = v23;
  else
    v24 = v22;
  objc_msgSend(v12, "setMaxY:", v24);

  return v10;
}

- (id)computeLabelIn:(id)a3 x:(unint64_t)a4 y:(unint64_t)a5 depth:(float)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlias:", (unsigned __int16)(objc_msgSend(v9, "alias") + 1));

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v10, "alias"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlias:", objc_msgSend(v12, "alias"));

  objc_msgSend(v11, "setMinX:", a4);
  objc_msgSend(v11, "setMaxX:", a4);
  objc_msgSend(v11, "setMinY:", a5);
  objc_msgSend(v11, "setMaxY:", a5);

  return v11;
}

- (void)updateLabel:(id)a3 x:(unint64_t)a4 y:(unint64_t)a5 depth:(float)a6
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  id v18;

  v18 = a3;
  v9 = objc_msgSend(v18, "minX");
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  objc_msgSend(v18, "setMinX:", v10);
  v11 = objc_msgSend(v18, "maxX");
  if (v11 <= a4)
    v12 = a4;
  else
    v12 = v11;
  objc_msgSend(v18, "setMaxX:", v12);
  v13 = objc_msgSend(v18, "minY");
  if (v13 >= a5)
    v14 = a5;
  else
    v14 = v13;
  objc_msgSend(v18, "setMinY:", v14);
  v15 = objc_msgSend(v18, "maxY");
  if (v15 <= a5)
    v16 = a5;
  else
    v16 = v15;
  objc_msgSend(v18, "setMaxY:", v16);
  *(float *)&v17 = a6;
  objc_msgSend(v18, "setDepth:", v17);

}

- (BOOL)isIntersectingWithCenter:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  id v8;
  double height;
  double width;
  CGRect v12;
  CGRect v13;

  v8 = a3;
  width = self->_centerDetectionSize.width;
  height = self->_centerDetectionSize.height;
  objc_msgSend(v8, "screenRect");
  v13.size.width = width / (double)a4;
  v13.origin.x = v13.size.width * -0.5 + 0.5;
  v13.size.height = height / (double)a5;
  v13.origin.y = v13.size.height * -0.5 + 0.5;
  LOBYTE(a5) = CGRectIntersectsRect(v12, v13);

  return a5;
}

- (BOOL)isInCenterRectFromRow:(unint64_t)a3 column:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  int64_t v6;
  int64_t v7;
  int64_t v9;
  int64_t v10;

  if ((a5 & 0x8000000000000000) == 0)
    v6 = a5;
  else
    v6 = a5 + 1;
  v7 = a4 - (v6 >> 1);
  if (v7 < 0)
    v7 = -v7;
  if (v7 > (uint64_t)(self->_centerDetectionSize.width * 0.5))
    return 0;
  if ((a6 & 0x8000000000000000) == 0)
    v9 = a6;
  else
    v9 = a6 + 1;
  v10 = a3 - (v9 >> 1);
  if (v10 < 0)
    v10 = -v10;
  return v10 <= (uint64_t)(self->_centerDetectionSize.height * 0.5);
}

- (float)areaFactorForDepth:(float)a3 camera:(id)a4 orientation:(int64_t)a5
{
  id v8;
  DetectedPersonData *v9;
  double v10;
  DetectedPersonData *v11;
  unint64_t v12;
  float closeDetectionFactor;
  float v14;

  v8 = a4;
  v9 = [DetectedPersonData alloc];
  *(float *)&v10 = a3;
  v11 = -[DetectedPersonData initWithNormalizedMinX:maxX:minY:maxY:depth:camera:orientation:](v9, "initWithNormalizedMinX:maxX:minY:maxY:depth:camera:orientation:", v8, a5, 0.0, 1.0, 0.0, 1.0, v10);
  v12 = -[DetectedPersonData computeArea](v11, "computeArea");
  closeDetectionFactor = self->_closeDetectionFactor;
  if ((float)((float)v12 / (float)(self->_significantAreaThresholdMM * closeDetectionFactor)) <= 1.0)
    v14 = (float)v12 / (float)(self->_significantAreaThresholdMM * closeDetectionFactor);
  else
    v14 = 1.0;

  return v14;
}

- (BOOL)isCenterDetectionEnabled
{
  return self->_isCenterDetectionEnabled;
}

- (void)setIsCenterDetectionEnabled:(BOOL)a3
{
  self->_isCenterDetectionEnabled = a3;
}

- (CGSize)centerDetectionSize
{
  double width;
  double height;
  CGSize result;

  width = self->_centerDetectionSize.width;
  height = self->_centerDetectionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (float)labellingTolerance
{
  return self->_labellingTolerance;
}

- (float)significantAreaThresholdMM
{
  return self->_significantAreaThresholdMM;
}

- (float)closeDetectionFactor
{
  return self->_closeDetectionFactor;
}

- (NSArray)detectedPersonArray
{
  return self->_detectedPersonArray;
}

- (__CVBuffer)labelBuffer
{
  return self->_labelBuffer;
}

- (unsigned)maxLabel
{
  return self->_maxLabel;
}

- (ARCamera)arCamera
{
  return (ARCamera *)objc_getProperty(self, a2, 40, 1);
}

- (void)setArCamera:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arCamera, 0);
  objc_storeStrong((id *)&self->_detectedPersonArray, 0);
}

@end

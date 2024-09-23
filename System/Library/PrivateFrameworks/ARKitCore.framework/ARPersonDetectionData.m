@implementation ARPersonDetectionData

- (id)transformToCVPixelBuffer:(__CVBuffer *)a3 depthBuffer:(__CVBuffer *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  ARDepthBasedPersonDetectionResult *v16;
  ARDepthBasedPersonDetectionResult *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  float32x2_t v28;
  int v29;
  float v30;
  void *v31;
  double x;
  double y;
  double width;
  double height;
  unsigned int v36;
  float v37;
  float v38;
  float v39;
  BOOL v40;
  float32x2_t v41;
  float32x2_t v42;
  float32_t v43;
  float v44;
  float32x2_t v45;
  float v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  void *v67;
  double v68;
  void *v69;
  CVPixelBufferRef pixelBuffer;
  unint64_t v72;
  float32x2_t v73;
  float v74;
  float v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _OWORD v80[2];
  _OWORD v81[2];
  _BYTE v82[128];
  uint64_t v83;
  CGPoint v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v83 = *MEMORY[0x1E0C80C00];
  -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    goto LABEL_48;
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  memset(v81, 0, sizeof(v81));
  ARWrapCVPixelBufferVImage(a4, (void **)v81);
  memset(v80, 0, sizeof(v80));
  ARWrapCVPixelBufferVImage(a3, (void **)v80);
  if (*(_OWORD *)((char *)v81 + 8) != *(_OWORD *)((char *)v80 + 8)
    || CVPixelBufferGetPixelFormatType(a3) != 1278226488
    || CVPixelBufferGetPixelFormatType(a4) != 1717855600)
  {
    CVPixelBufferUnlockBaseAddress(a4, 0);
    CVPixelBufferUnlockBaseAddress(a3, 0);
LABEL_48:
    v69 = (void *)MEMORY[0x1E0C9AA60];
    return v69;
  }
  pixelBuffer = a4;
  v9 = (void *)objc_opt_new();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v77 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v16 = [ARDepthBasedPersonDetectionResult alloc];
        objc_msgSend(v15, "boundingBox", pixelBuffer);
        v17 = -[ARDepthBasedPersonDetectionResult initWithBoundingBox:](v16, "initWithBoundingBox:");
        objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v12);
  }

  v18 = *((_QWORD *)&v80[0] + 1);
  if (*((_QWORD *)&v80[0] + 1))
  {
    v19 = 0;
    v20 = *(_QWORD *)&v80[1];
    v21 = *(_QWORD *)&v80[1];
    do
    {
      if (v21)
      {
        v22 = 0;
        v23 = *(_QWORD *)&v80[0] + *((_QWORD *)&v80[1] + 1) * v19;
        v24 = *(_QWORD *)&v81[0] + *((_QWORD *)&v81[1] + 1) * v19;
        v25 = (double)(int)v19;
        v72 = v19;
        v75 = (float)(int)v19;
        do
        {
          if (*(_BYTE *)(v23 + v22))
          {
            if (objc_msgSend(v9, "count"))
            {
              v26 = 0;
              v27 = 0;
              v74 = (float)(int)v22;
              v28.f32[0] = (float)(int)v22;
              v28.f32[1] = v75;
              v73 = v28;
              v29 = -1;
              v30 = 3.4028e38;
              while (1)
              {
                objc_msgSend(v9, "objectAtIndexedSubscript:", v27, pixelBuffer);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "rectScaledToSizeOfPixelBuffer:", a3);
                x = v85.origin.x;
                y = v85.origin.y;
                width = v85.size.width;
                height = v85.size.height;
                v84.x = (double)(int)v22;
                v84.y = v25;
                if (CGRectContainsPoint(v85, v84))
                  break;
                *(float *)&v36 = x;
                v37 = y;
                v40 = v74 < *(float *)&v36;
                v41 = (float32x2_t)v36;
                v42.f32[0] = (float)(int)v22;
                if (v40)
                  v42 = v41;
                v38 = x + width;
                if (v38 < v74)
                {
                  v43 = x + width;
                  v42.f32[0] = v43;
                }
                v39 = y + height;
                if (v75 <= v39)
                  v44 = v75;
                else
                  v44 = y + height;
                if (v37 <= v75)
                  v37 = v44;
                v42.f32[1] = v37;
                v45 = vsub_f32(v73, v42);
                v46 = sqrtf(vaddv_f32(vmul_f32(v45, v45)));
                if (v46 < v30)
                {
                  v30 = v46;
                  v29 = v27;
                }

                ++v27;
                v26 += 0x100000000;
                if (objc_msgSend(v9, "count") <= v27)
                  goto LABEL_35;
              }

              v47 = v26 >> 32;
            }
            else
            {
              v29 = -1;
              v30 = 3.4028e38;
LABEL_35:
              v47 = v29;
              objc_msgSend(v9, "objectAtIndexedSubscript:", v29, pixelBuffer);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "rectScaledToSizeOfPixelBuffer:", a3);
              if (v49 >= v50)
                v51 = v50;
              else
                v51 = v49;
              if (v51 * 0.5 > v30)
              {
                v52 = (float)((float)(int)v22 / (float)*(unint64_t *)&v80[1]);
                v53 = (float)(v75 / (float)*((unint64_t *)&v80[0] + 1));
                objc_msgSend(v48, "boundingBox");
                v55 = v54;
                objc_msgSend(v48, "boundingBox");
                v57 = v55 + v56;
                objc_msgSend(v48, "boundingBox");
                v86.size.width = v57 - v52;
                v86.size.height = v58 - v53;
                v86.origin.x = v52;
                v86.origin.y = v53;
                v87 = CGRectStandardize(v86);
                v59 = v87.origin.x;
                v60 = v87.origin.y;
                v61 = v87.size.width;
                v62 = v87.size.height;
                objc_msgSend(v48, "boundingBox");
                v90.origin.x = v63;
                v90.origin.y = v64;
                v90.size.width = v65;
                v90.size.height = v66;
                v88.origin.x = v59;
                v88.origin.y = v60;
                v88.size.width = v61;
                v88.size.height = v62;
                v89 = CGRectUnion(v88, v90);
                objc_msgSend(v48, "setBoundingBox:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
              }

            }
            objc_msgSend(v9, "objectAtIndexedSubscript:", v47);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v68) = *(_DWORD *)(v24 + 4 * v22);
            objc_msgSend(v67, "addSampleValue:", v68);

            v20 = *(_QWORD *)&v80[1];
          }
          ++v22;
        }
        while (v20 > v22);
        v18 = *((_QWORD *)&v80[0] + 1);
        v21 = v20;
        v19 = v72;
      }
      ++v19;
    }
    while (v18 > v19);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_122);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

BOOL __62__ARPersonDetectionData_transformToCVPixelBuffer_depthBuffer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "boundingBox");
  v6 = v5;
  objc_msgSend(v4, "boundingBox");
  v8 = v7;

  return v6 < v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPersonDetectionData timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%p): %f"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)mergeOverlappingDetectionsWithThreshold:(float)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  double v64;
  double x;
  double v66;
  double y;
  double v68;
  double width;
  double v70;
  double height;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  ARPersonDetectionResult *v88;
  void *v89;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  double (**v94)(double, double, double, double, double, double, double, double);
  id v95;
  double obj;
  id obja;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v115 = *MEMORY[0x1E0C80C00];
  v110[0] = MEMORY[0x1E0C809B0];
  v110[1] = 3221225472;
  v110[2] = __65__ARPersonDetectionData_mergeOverlappingDetectionsWithThreshold___block_invoke_2;
  v110[3] = &unk_1E6675E70;
  v111 = &__block_literal_global_63;
  v94 = (double (**)(double, double, double, double, double, double, double, double))MEMORY[0x1B5E2DF90](v110, a2);
  v5 = (void *)objc_opt_new();
  -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    obj = a3;
    v9 = 1;
    do
    {
      v10 = (void *)objc_opt_new();
      -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "boundingBox");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v21 = v8 + 1;
      -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 > v8 + 1)
      {
        v24 = v9;
        do
        {
          -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "boundingBox");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;

          if (v94[2](v14, v16, v18, v20, v28, v30, v32, v34) > obj)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v35);

          }
          ++v24;
          -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

        }
        while (v37 > v24);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, v38);

      -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      ++v9;
      v8 = v21;
    }
    while (v40 > v21);
  }
  objc_msgSend(v5, "allKeys");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obja = v42;
  v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v107 != v45)
          objc_enumerationMutation(obja);
        v47 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v5, "allKeys");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "containsObject:", v47);

        if (v49)
        {
          v50 = (void *)objc_opt_new();
          objc_msgSend(v5, "recursiveObjectForKey:deleteKeys:", v47, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removeObjectsForKeys:", v50);
          objc_msgSend(v5, "setObject:forKey:", v51, v47);

        }
      }
      v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
    }
    while (v44);
  }

  v92 = (void *)objc_opt_new();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  objc_msgSend(v5, "allKeys");
  v95 = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v103;
    v91 = *(_QWORD *)v103;
    do
    {
      v55 = 0;
      v93 = v53;
      do
      {
        if (*(_QWORD *)v103 != v54)
          objc_enumerationMutation(v95);
        v56 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v55);
        objc_msgSend(v5, "objectForKeyedSubscript:", v56, v91);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "intValue");
        if ((v58 & 0x80000000) == 0)
        {
          v59 = v58;
          -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "count") - 1;

          if (v61 >= v59)
          {
            -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectAtIndexedSubscript:", v59);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "boundingBox");
            x = v64;
            y = v66;
            width = v68;
            height = v70;

            v100 = 0u;
            v101 = 0u;
            v98 = 0u;
            v99 = 0u;
            v72 = v57;
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
            if (v73)
            {
              v74 = v73;
              v75 = *(_QWORD *)v99;
              do
              {
                for (j = 0; j != v74; ++j)
                {
                  if (*(_QWORD *)v99 != v75)
                    objc_enumerationMutation(v72);
                  v77 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
                  -[ARPersonDetectionData detectedObjects](self, "detectedObjects");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "objectAtIndexedSubscript:", (int)objc_msgSend(v77, "intValue"));
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "boundingBox");
                  v81 = v80;
                  v83 = v82;
                  v85 = v84;
                  v87 = v86;

                  v116.origin.x = x;
                  v116.origin.y = y;
                  v116.size.width = width;
                  v116.size.height = height;
                  v118.origin.x = v81;
                  v118.origin.y = v83;
                  v118.size.width = v85;
                  v118.size.height = v87;
                  v117 = CGRectUnion(v116, v118);
                  x = v117.origin.x;
                  y = v117.origin.y;
                  width = v117.size.width;
                  height = v117.size.height;
                }
                v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
              }
              while (v74);
            }

            v88 = -[ARPersonDetectionResult initWithBoundingBox:]([ARPersonDetectionResult alloc], "initWithBoundingBox:", x, y, width, height);
            objc_msgSend(v92, "addObject:", v88);

            v54 = v91;
            v53 = v93;
          }
        }

        ++v55;
      }
      while (v55 != v53);
      v53 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
    }
    while (v53);
  }

  v89 = (void *)objc_opt_new();
  -[ARPersonDetectionData timestamp](self, "timestamp");
  objc_msgSend(v89, "setTimestamp:");
  objc_msgSend(v89, "setDetectedObjects:", v92);

  return v89;
}

double __65__ARPersonDetectionData_mergeOverlappingDetectionsWithThreshold___block_invoke(double a1, double a2, double a3, double a4)
{
  return a3 * a4;
}

double __65__ARPersonDetectionData_mergeOverlappingDetectionsWithThreshold___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v18;
  uint64_t v19;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v18 = *(_QWORD *)(a1 + 32);
  v22 = CGRectIntersection(*(CGRect *)&a2, *(CGRect *)&a6);
  v21 = (*(double (**)(uint64_t, CGPoint, __n128, CGSize, __n128))(v18 + 16))(v18, v22.origin, *(__n128 *)&v22.origin.y, v22.size, *(__n128 *)&v22.size.height);
  v19 = *(_QWORD *)(a1 + 32);
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  v25.origin.x = a6;
  v25.origin.y = a7;
  v25.size.width = a8;
  v25.size.height = a9;
  v24 = CGRectUnion(v23, v25);
  return v21
       / (*(double (**)(uint64_t, CGPoint, __n128, CGSize, __n128))(v19 + 16))(v19, v24.origin, *(__n128 *)&v24.origin.y, v24.size, *(__n128 *)&v24.size.height);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSArray)detectedObjects
{
  return self->_detectedObjects;
}

- (void)setDetectedObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedObjects, 0);
}

@end

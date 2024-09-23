@implementation PKMetal3DObject

- (char)initWithCommandQueue:(void *)a3 modelFile:(void *)a4 library:(double)a5 pixelSize:(double)a6 maxTextureBlur:(double)a7
{
  char *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  int v20;
  double v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  float32x4_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  unint64_t v81;
  id v82;
  uint64_t v83;
  float32x4_t v84;
  float32x4_t v85;
  unint64_t v86;
  unsigned int *v87;
  float32x4_t v88;
  float32x4_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  char *v103;
  id v104;
  id obj;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t i;
  float32x4_t v110;
  float32x4_t v111;
  id v112;
  char *v113;
  objc_super v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128[16];
  id v129[16];
  uint8_t buf[4];
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v102 = a2;
  v104 = a3;
  v100 = a4;
  if (a1
    && (v114.receiver = a1,
        v114.super_class = (Class)PKMetal3DObject,
        v103 = (char *)objc_msgSendSuper2(&v114, sel_init),
        (v14 = v103) != 0))
  {
    objc_msgSend(v102, "device");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v103 + 1);
    v113 = v103;
    *((_QWORD *)v103 + 1) = v15;

    objc_storeStrong((id *)v103 + 2, a2);
    v17 = (id *)(v103 + 56);
    objc_storeStrong((id *)v103 + 7, a4);
    v18 = objc_msgSend(v104, "copy");
    v19 = (void *)*((_QWORD *)v103 + 17);
    *((_QWORD *)v103 + 17) = v18;

    *((double *)v103 + 12) = a5;
    *((double *)v103 + 13) = a6;
    *((double *)v103 + 14) = a7;
    v103[120] = 0;
    v103[122] = 0;
    v20 = objc_msgSend(v104, "isEqualToString:", CFSTR("Highlighter"));
    v21 = 1.57079633;
    if (!v20)
      v21 = 0.0;
    *((double *)v103 + 21) = v21;
    if ((objc_msgSend(v104, "isEqualToString:", CFSTR("Highlighter")) & 1) != 0)
      v22 = 1;
    else
      v22 = objc_msgSend(v104, "isEqualToString:", CFSTR("FountainV3Pen"));
    v103[121] = v22;
    *((_QWORD *)v103 + 16) = 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "URLForResource:withExtension:", *((_QWORD *)v103 + 17), CFSTR("usdz"));
    v101 = (id)objc_claimAutoreleasedReturnValue();
    if (!*((_QWORD *)v103 + 4))
    {
      v23 = objc_alloc_init(MEMORY[0x1E0CC6BD8]);
      v24 = (void *)*((_QWORD *)v103 + 3);
      *((_QWORD *)v103 + 3) = v23;

      objc_msgSend(*((id *)v103 + 3), "attributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFormat:", 30);

      objc_msgSend(*((id *)v103 + 3), "attributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setOffset:", 0);

      objc_msgSend(*((id *)v103 + 3), "attributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBufferIndex:", 0);

      objc_msgSend(*((id *)v103 + 3), "layouts");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setStride:", 12);

      objc_msgSend(*((id *)v103 + 3), "layouts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setStepRate:", 1);

      objc_msgSend(*((id *)v103 + 3), "layouts");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setStepFunction:", 1);

      v37 = (void *)objc_msgSend(*v17, "newFunctionWithName:", CFSTR("shadowProjectVertex"));
      v38 = (void *)objc_msgSend(*v17, "newFunctionWithName:", CFSTR("shadowProjectFragment"));
      v39 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
      objc_msgSend(v39, "setLabel:", CFSTR("PencilShadowProject"));
      objc_msgSend(v39, "setRasterSampleCount:", 1);
      objc_msgSend(v39, "setVertexFunction:", v37);
      objc_msgSend(v39, "setFragmentFunction:", v38);
      objc_msgSend(v39, "setVertexDescriptor:", *((_QWORD *)v103 + 3));
      objc_msgSend(v39, "colorAttachments");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "setPixelFormat:", 10);
      v42 = (void *)*((_QWORD *)v103 + 1);
      v129[0] = 0;
      v43 = objc_msgSend(v42, "newRenderPipelineStateWithDescriptor:error:", v39, v129);
      v44 = v129[0];
      v45 = (void *)*((_QWORD *)v103 + 4);
      *((_QWORD *)v103 + 4) = v43;

      if (!*((_QWORD *)v103 + 4))
      {
        v46 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v44, "localizedDescription");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v131 = v96;
          _os_log_fault_impl(&dword_1BE213000, v46, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", buf, 0xCu);

        }
      }
      objc_msgSend(v41, "setBlendingEnabled:", 1);
      objc_msgSend(v41, "setRgbBlendOperation:", 0);
      objc_msgSend(v41, "setAlphaBlendOperation:", 0);
      objc_msgSend(v41, "setSourceRGBBlendFactor:", 1);
      objc_msgSend(v41, "setSourceAlphaBlendFactor:", 1);
      objc_msgSend(v41, "setDestinationRGBBlendFactor:", 1);
      objc_msgSend(v41, "setDestinationAlphaBlendFactor:", 1);
      v47 = (void *)*((_QWORD *)v103 + 1);
      v128[0] = v44;
      v48 = objc_msgSend(v47, "newRenderPipelineStateWithDescriptor:error:", v39, v128);
      v49 = v128[0];

      v50 = (void *)*((_QWORD *)v103 + 5);
      *((_QWORD *)v103 + 5) = v48;

      if (!*((_QWORD *)v103 + 5))
      {
        v51 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v49, "localizedDescription");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v131 = v97;
          _os_log_fault_impl(&dword_1BE213000, v51, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", buf, 0xCu);

        }
      }

      v14 = v103;
    }
    v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C38]), "initWithDevice:", *((_QWORD *)v14 + 1));
    if (!v99)
    {
      v52 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(0, "localizedDescription");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v131 = v95;
        _os_log_fault_impl(&dword_1BE213000, v52, OS_LOG_TYPE_FAULT, "Failed to create buffer allocator: %@", buf, 0xCu);

      }
      v14 = v103;
    }
    MTKModelIOVertexDescriptorFromMetal(*((MTLVertexDescriptor **)v14 + 3));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "attributes");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setName:", *MEMORY[0x1E0CC7760]);

    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7780]), "initWithURL:vertexDescriptor:bufferAllocator:", v101, v53, v99);
    v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v56);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0u;
    v121 = 0u;
    v122 = 0u;
    v120 = 0u;
    obj = v56;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    if (v57)
    {
      v108 = v57;
      v58 = 0;
      v106 = *(_QWORD *)v121;
      do
      {
        for (i = 0; i != v108; ++i)
        {
          if (*(_QWORD *)v121 != v106)
            objc_enumerationMutation(obj);
          v59 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
          objc_msgSend(v107, "removeAllObjects");
          -[PKMetal3DObject _findMeshes:meshes:](v59, v107);
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          v60 = v107;
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
          if (v61)
          {
            v62 = *(_QWORD *)v117;
            do
            {
              v63 = 0;
              v64 = v58;
              do
              {
                if (*(_QWORD *)v117 != v62)
                  objc_enumerationMutation(v60);
                v65 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v63);
                objc_msgSend(v65, "setVertexDescriptor:", v53);
                v66 = objc_alloc(MEMORY[0x1E0CC6C30]);
                v67 = *((_QWORD *)v103 + 1);
                v115 = v64;
                v68 = (void *)objc_msgSend(v66, "initWithMesh:device:error:", v65, v67, &v115);
                v58 = v115;

                if (v68)
                {
                  objc_msgSend(v112, "addObject:", v68);
                }
                else
                {
                  v69 = os_log_create("com.apple.pencilkit", ");
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                  {
                    objc_msgSend(v58, "localizedDescription");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v131 = v70;
                    _os_log_fault_impl(&dword_1BE213000, v69, OS_LOG_TYPE_FAULT, "Failed to create MTK mesh: %@", buf, 0xCu);

                  }
                }

                ++v63;
                v64 = v58;
              }
              while (v61 != v63);
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
            }
            while (v61);
          }

        }
        v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
      }
      while (v108);
    }
    else
    {
      v58 = 0;
    }

    v71 = objc_msgSend(v112, "copy");
    v72 = (void *)*((_QWORD *)v103 + 6);
    *((_QWORD *)v103 + 6) = v71;

    v73 = *((id *)v103 + 6);
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v74 = v73;
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
    if (v75)
    {
      v76 = *(_QWORD *)v125;
      v77.i64[0] = 0x80000000800000;
      v77.i64[1] = 0x80000000800000;
      v110 = v77;
      v111 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
      do
      {
        for (j = 0; j != v75; ++j)
        {
          if (*(_QWORD *)v125 != v76)
            objc_enumerationMutation(v74);
          objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * j), "vertexBuffers");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectAtIndexedSubscript:", 0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v80
            && (v81 = objc_msgSend(v80, "length"),
                objc_msgSend(v80, "buffer"),
                v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
                v83 = objc_msgSend(v82, "contents"),
                v82,
                v81 >= 0xC))
          {
            v86 = v81 / 0xC;
            if (v81 / 0xC <= 1)
              v86 = 1;
            v87 = (unsigned int *)(v83 + 8);
            v85 = v110;
            v84 = v111;
            do
            {
              v88.i64[0] = *((_QWORD *)v87 - 1);
              v84.i32[3] = 0;
              v88.i64[1] = *v87;
              v84 = vminnmq_f32(v84, v88);
              v85.i32[3] = 0;
              v85 = vmaxnmq_f32(v85, v88);
              v87 += 3;
              --v86;
            }
            while (v86);
          }
          else
          {
            v85 = v110;
            v84 = v111;
          }
          v110 = v85;
          v111 = v84;

        }
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v124, buf, 16);
      }
      while (v75);
    }
    else
    {
      v89.i64[0] = 0x80000000800000;
      v89.i64[1] = 0x80000000800000;
      v110 = v89;
      v111 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
    }

    *((_DWORD *)v103 + 18) = v111.i32[2];
    *((_QWORD *)v103 + 8) = v111.i64[0];
    *((_DWORD *)v103 + 22) = v110.i32[2];
    *((_QWORD *)v103 + 10) = v110.i64[0];
    v90 = *((double *)v103 + 12);
    v91 = vsubq_f32(v110, v111).f32[0];
    v92 = (v90 + *((double *)v103 + 14) * 2.0) * v91 / v90;
    v93 = *((double *)v103 + 13) * v92 / v90;
    *((double *)v103 + 18) = v92;
    *((double *)v103 + 19) = v93;
    *((double *)v103 + 20) = (v92 - v91) * 0.75;

  }
  else
  {
    v113 = 0;
  }

  return v113;
}

- (void)_findMeshes:(void *)a1 meshes:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "addObject:", v3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        -[PKMetal3DObject _findMeshes:meshes:](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)renderIntoTexture:(void *)a3 commandBuffer:(int)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 blendFactor:(double)a7 clear:
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  float v23;
  double v24;
  double v25;
  float32_t v26;
  float32x4_t v27;
  double v28;
  float v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4 v32;
  __int128 v33;
  float v34;
  float32x4_t v35;
  float32x4_t v36;
  float v37;
  simd_float4 v38;
  uint64_t v39;
  double v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float32_t v49;
  float v50;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  float v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  uint64_t v68;
  float32x4_t v69;
  uint64_t v70;
  float32x4_t v71;
  unint64_t v72;
  void *v73;
  void *v74;
  BOOL v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float v98;
  simd_float4 v99;
  simd_float4 v100;
  float v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id obj[2];
  id obja;
  simd_float4 v108;
  uint64_t v109;
  float32x4_t v110;
  uint64_t v111;
  float32x4_t v112;
  float32x4_t v113;
  uint64_t i;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  float v124;
  simd_float4x4 v125;
  simd_float4x4 v126[2];
  simd_float4x4 v127[2];
  uint64_t v128;
  simd_float4x4 v129;
  simd_float4x4 v130;

  v128 = *MEMORY[0x1E0C80C00];
  v104 = a2;
  v103 = a3;
  if (a1)
  {
    v105 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
    objc_msgSend(v105, "colorAttachments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTexture:", v104);

    objc_msgSend(v105, "colorAttachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    if (a4)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLoadAction:", 2);

      objc_msgSend(v105, "colorAttachments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLoadAction:", 1);
    }

    objc_msgSend(v105, "colorAttachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStoreAction:", 1);

    v102 = *(id *)(a1 + 48);
    v20 = v105;
    v91 = v103;
    v92 = v20;
    objc_msgSend(v91, "renderCommandEncoderWithDescriptor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v21;
    objc_msgSend(v21, "setLabel:", CFSTR("PencilShadowRenderEncoder"));
    objc_msgSend(v21, "pushDebugGroup:", CFSTR("PencilShadowDrawMeshes"));
    objc_msgSend(v21, "setFrontFacingWinding:", 1);
    objc_msgSend(v21, "setCullMode:", 2 * *(unsigned __int8 *)(a1 + 120));
    v22 = 40;
    if (a4)
      v22 = 32;
    objc_msgSend(v21, "setRenderPipelineState:", *(_QWORD *)(a1 + v22));
    v23 = a7;
    v124 = v23;
    v24 = *(float *)(a1 + 84);
    v25 = *(double *)(a1 + 160);
    v26 = *(double *)(a1 + 128) - v24 - v25;
    v27.i32[0] = 0;
    v27.f32[1] = v26;
    v27.i32[2] = 0;
    v112 = v27;
    v28 = 0.0;
    if (*(_BYTE *)(a1 + 121))
      v28 = a5;
    v29 = *(double *)(a1 + 168) - v28;
    *(double *)v30.i64 = matrix4x4_rotation(v29, (float32x4_t)xmmword_1BE4FE500);
    v99 = v30;
    v100 = v31;
    *(_OWORD *)obj = v33;
    v108 = v32;
    v34 = 0.0;
    if (*(_BYTE *)(a1 + 122))
      v34 = *(float *)(a1 + 72);
    v35 = v112;
    v35.i32[3] = 1.0;
    v113 = v35;
    v35.f32[0] = v24 - v25;
    v36.i32[0] = 0;
    v36.i32[1] = v35.i32[0];
    v36.f32[2] = -v34;
    v36.i32[3] = 1.0;
    v97 = v36;
    v37 = a6 * -0.8;
    *(double *)v38.i64 = matrix4x4_rotation(v37, (float32x4_t)xmmword_1BE4FD980);
    v39 = 0;
    v41 = *(double *)(a1 + 144);
    v40 = *(double *)(a1 + 152);
    v42 = v41 * -0.5;
    *(float *)&v41 = v41 * 0.5;
    v43 = -v40 - v25;
    v44 = v25;
    v45 = -v40;
    v46 = *(float *)&v41 - v42;
    v47 = v44 - v43;
    *(float *)&v41 = v42 + *(float *)&v41;
    v48 = v44 + v43;
    v101 = 2.0 / v46;
    v49 = (float)-*(float *)&v41 / v46;
    v50 = (float)-v48 / v47;
    __asm { FMOV            V7.4S, #1.0 }
    _Q7.f32[0] = v49;
    v126[0].columns[0] = v38;
    v126[0].columns[1] = v56;
    v126[0].columns[2] = v57;
    v126[0].columns[3] = v58;
    do
    {
      v127[0].columns[v39] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1BE4FD980, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v39])), (float32x4_t)xmmword_1BE4FE500, *(float32x2_t *)v126[0].columns[v39].f32, 1), (float32x4_t)xmmword_1BE4FE510, (float32x4_t)v126[0].columns[v39], 2), v97, (float32x4_t)v126[0].columns[v39], 3);
      ++v39;
    }
    while (v39 != 4);
    v59 = v40;
    v60 = v59 - v45;
    _Q7.f32[1] = v50;
    v110 = _Q7;
    v98 = (float)-v45 / (float)(v59 - v45);
    v129.columns[0] = (simd_float4)_PromotedConst;
    v129.columns[1] = (simd_float4)unk_1BE4FE540;
    v129.columns[2] = (simd_float4)xmmword_1BE4FE550;
    v95 = (float32x4_t)v127[0].columns[0];
    v96 = (float32x4_t)v127[0].columns[1];
    v93 = (float32x4_t)v127[0].columns[3];
    v94 = (float32x4_t)v127[0].columns[2];
    v129.columns[3] = (simd_float4)v97;
    v130 = __invert_f4(v129);
    v61 = 0;
    v126[0] = v130;
    do
    {
      v127[0].columns[v61] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v95, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v61])), v96, *(float32x2_t *)v126[0].columns[v61].f32, 1), v94, (float32x4_t)v126[0].columns[v61], 2), v93, (float32x4_t)v126[0].columns[v61], 3);
      ++v61;
    }
    while (v61 != 4);
    v62 = 0;
    v63 = v110;
    v63.f32[2] = v98;
    v64 = (float32x4_t)v127[0].columns[0];
    v65 = (float32x4_t)v127[0].columns[1];
    v66 = (float32x4_t)v127[0].columns[2];
    v67 = (float32x4_t)v127[0].columns[3];
    v126[0].columns[0] = v99;
    v126[0].columns[1] = v100;
    v126[0].columns[2] = v108;
    v126[0].columns[3] = *(simd_float4 *)obj;
    do
    {
      v127[0].columns[v62] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v62])), v65, *(float32x2_t *)v126[0].columns[v62].f32, 1), v66, (float32x4_t)v126[0].columns[v62], 2), v67, (float32x4_t)v126[0].columns[v62], 3);
      ++v62;
    }
    while (v62 != 4);
    v68 = 0;
    v69.i32[0] = 0;
    v69.i64[1] = 0;
    v126[0] = v127[0];
    do
    {
      v127[0].columns[v68] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1BE4FD980, COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v68])), (float32x4_t)xmmword_1BE4FE500, *(float32x2_t *)v126[0].columns[v68].f32, 1), (float32x4_t)xmmword_1BE4FE510, (float32x4_t)v126[0].columns[v68], 2), v113, (float32x4_t)v126[0].columns[v68], 3);
      ++v68;
    }
    while (v68 != 4);
    v70 = 0;
    v71.i64[0] = 0;
    v71.i32[3] = 0;
    v126[0] = v127[0];
    do
    {
      v69.f32[1] = 2.0 / v47;
      v71.f32[2] = -1.0 / v60;
      v127[0].columns[v70] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v101), COERCE_FLOAT(*(_OWORD *)&v126[0].columns[v70])), v69, *(float32x2_t *)v126[0].columns[v70].f32, 1), v71, (float32x4_t)v126[0].columns[v70], 2), v63, (float32x4_t)v126[0].columns[v70], 3);
      ++v70;
    }
    while (v70 != 4);
    v125 = v127[0];
    objc_msgSend(v21, "setVertexBytes:length:atIndex:", &v125, 64, 1);
    objc_msgSend(v21, "setFragmentBytes:length:atIndex:", &v124, 4, 0);
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    obja = v102;
    v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
    if (v111)
    {
      v109 = *(_QWORD *)v121;
      do
      {
        for (i = 0; i != v111; ++i)
        {
          if (*(_QWORD *)v121 != v109)
            objc_enumerationMutation(obja);
          v72 = 0;
          v73 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
          while (1)
          {
            objc_msgSend(v73, "vertexBuffers");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v72 < objc_msgSend(v74, "count");

            if (!v75)
              break;
            objc_msgSend(v73, "vertexBuffers");
            v76 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v76, "objectAtIndexedSubscript:", v72);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v76) = v77 == v78;

            if ((v76 & 1) == 0)
            {
              objc_msgSend(v77, "buffer");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "setVertexBuffer:offset:atIndex:", v79, objc_msgSend(v77, "offset"), v72);

            }
            ++v72;
          }
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          objc_msgSend(v73, "submeshes");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
          if (v81)
          {
            v82 = *(_QWORD *)v117;
            do
            {
              for (j = 0; j != v81; ++j)
              {
                if (*(_QWORD *)v117 != v82)
                  objc_enumerationMutation(v80);
                v84 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
                v85 = objc_msgSend(v84, "primitiveType");
                v86 = objc_msgSend(v84, "indexCount");
                v87 = objc_msgSend(v84, "indexType");
                objc_msgSend(v84, "indexBuffer");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "buffer");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "indexBuffer");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", v85, v86, v87, v89, objc_msgSend(v90, "offset"));

              }
              v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
            }
            while (v81);
          }

        }
        v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
      }
      while (v111);
    }

    objc_msgSend(v115, "popDebugGroup");
    objc_msgSend(v115, "endEncoding");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFile, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_metalKitMeshes, 0);
  objc_storeStrong((id *)&self->_scenePipelineStateWithBlending, 0);
  objc_storeStrong((id *)&self->_scenePipelineState, 0);
  objc_storeStrong((id *)&self->_sceneVertexDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

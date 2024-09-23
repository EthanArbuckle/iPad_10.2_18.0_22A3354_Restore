@implementation ARSCNPlaneGeometry

+ (ARSCNPlaneGeometry)planeGeometryWithDevice:(id)device
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  objc_class *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = device;
  v5 = (void *)objc_msgSend(v4, "newBufferWithLength:options:", 96000, 0);
  v6 = objc_msgSend(v4, "newBufferWithLength:options:", 48000, 0);
  v7 = (void *)v6;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v5, 30, *MEMORY[0x1E0CD5A88], 6000, 0, 16);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v7, 29, *MEMORY[0x1E0CD5A80], 6000, 0, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD5980], "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", 0, 0, 2000, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrimitiveRange:", 0, 0);
    v18[0] = v8;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCNGeometry geometryWithSources:elements:](ARSCNPlaneGeometry, "geometryWithSources:elements:", v11, v12);
    v13 = (id *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_storeStrong(v13 + 21, v5);
      objc_storeStrong(v13 + 22, v7);
    }

  }
  else
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_0);
    v8 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2048;
      v22 = a1;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1DCC73000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating new Metal buffer with device %{public}@", buf, 0x20u);

    }
    v13 = 0;
  }

  return (ARSCNPlaneGeometry *)v13;
}

- (void)updateFromPlaneGeometry:(ARPlaneGeometry *)planeGeometry
{
  ARPlaneGeometry *v3;
  unint64_t i;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  uint64_t v45;
  __int32 v46;
  uint64_t v47;
  __int32 v48;
  void *__p;
  char *v50;
  char *v51;
  void *v52;
  char *v53;
  char *v54;

  v3 = planeGeometry;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm(&v52, 3 * -[ARPlaneGeometry triangleCount](v3, "triangleCount"));
  __p = 0;
  v50 = 0;
  v51 = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__p, 3 * -[ARPlaneGeometry triangleCount](v3, "triangleCount"));
  for (i = 0; i < 3 * -[ARPlaneGeometry triangleCount](v3, "triangleCount"); ++i)
  {
    v5 = -[ARPlaneGeometry vertices](v3, "vertices");
    v6 = -[ARPlaneGeometry triangleIndices](v3, "triangleIndices")[2 * i];
    v7 = v53;
    if (v53 >= v54)
    {
      v9 = (v53 - (_BYTE *)v52) >> 4;
      if ((unint64_t)(v9 + 1) >> 60)
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      v10 = (v54 - (_BYTE *)v52) >> 3;
      if (v10 <= v9 + 1)
        v10 = v9 + 1;
      if ((unint64_t)(v54 - (_BYTE *)v52) >= 0x7FFFFFFFFFFFFFF0)
        v11 = 0xFFFFFFFFFFFFFFFLL;
      else
        v11 = v10;
      if (v11)
        v12 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v54, v11);
      else
        v12 = 0;
      v13 = &v12[16 * v9];
      *(_OWORD *)v13 = *(_OWORD *)(v5 + 16 * v6);
      v8 = v13 + 16;
      v15 = (char *)v52;
      v14 = v53;
      if (v53 != v52)
      {
        do
        {
          v16 = *((_OWORD *)v14 - 1);
          v14 -= 16;
          *((_OWORD *)v13 - 1) = v16;
          v13 -= 16;
        }
        while (v14 != v15);
        v14 = (char *)v52;
      }
      v52 = v13;
      v53 = v8;
      v54 = &v12[16 * v11];
      if (v14)
        operator delete(v14);
    }
    else
    {
      *(_OWORD *)v53 = *(_OWORD *)(v5 + 16 * v6);
      v8 = v7 + 16;
    }
    v53 = v8;
    v17 = -[ARPlaneGeometry textureCoordinates](v3, "textureCoordinates");
    v18 = -[ARPlaneGeometry triangleIndices](v3, "triangleIndices")[2 * i];
    v19 = v50;
    if (v50 >= v51)
    {
      v21 = (v50 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v21 + 1) >> 61)
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      v22 = (v51 - (_BYTE *)__p) >> 2;
      if (v22 <= v21 + 1)
        v22 = v21 + 1;
      if ((unint64_t)(v51 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v23 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v23 = v22;
      if (v23)
        v24 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v51, v23);
      else
        v24 = 0;
      v25 = &v24[8 * v21];
      *(_QWORD *)v25 = *(_QWORD *)(v17 + 8 * v18);
      v20 = v25 + 8;
      v27 = (char *)__p;
      v26 = v50;
      if (v50 != __p)
      {
        do
        {
          v28 = *((_QWORD *)v26 - 1);
          v26 -= 8;
          *((_QWORD *)v25 - 1) = v28;
          v25 -= 8;
        }
        while (v26 != v27);
        v26 = (char *)__p;
      }
      __p = v25;
      v50 = v20;
      v51 = &v24[8 * v23];
      if (v26)
        operator delete(v26);
    }
    else
    {
      *(_QWORD *)v50 = *(_QWORD *)(v17 + 8 * v18);
      v20 = v19 + 8;
    }
    v50 = v20;
  }
  v29 = (void *)-[MTLBuffer contents](self->_vertexBuffer, "contents");
  memcpy(v29, v52, v53 - (_BYTE *)v52);
  v30 = (void *)-[MTLBuffer contents](self->_textureCoordinateBuffer, "contents");
  memcpy(v30, __p, v50 - (_BYTE *)__p);
  v31 = -[ARPlaneGeometry triangleCount](v3, "triangleCount");
  -[SCNGeometry geometryElements](self, "geometryElements");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPrimitiveRange:", 0, v31);

  -[ARPlaneGeometry center](v3, "center");
  v42 = v34;
  -[ARPlaneGeometry extent](v3, "extent");
  v35.i64[0] = 0xBF000000BF000000;
  v35.i64[1] = 0xBF000000BF000000;
  v37 = vaddq_f32(v42, vmulq_f32(v36, v35));
  v47 = v37.i64[0];
  v48 = v37.i32[2];
  -[ARPlaneGeometry center](v3, "center");
  v43 = v38;
  -[ARPlaneGeometry extent](v3, "extent");
  v39.i64[0] = 0x3F0000003F000000;
  v39.i64[1] = 0x3F0000003F000000;
  v41 = vaddq_f32(v43, vmulq_f32(v40, v39));
  v45 = v41.i64[0];
  v46 = v41.i32[2];
  -[SCNGeometry setBoundingBoxMin:max:](self, "setBoundingBoxMin:max:", &v47, &v45);
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }
  if (v52)
  {
    v53 = (char *)v52;
    operator delete(v52);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureCoordinateBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
}

@end

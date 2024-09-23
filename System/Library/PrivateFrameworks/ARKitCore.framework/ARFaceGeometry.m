@implementation ARFaceGeometry

- (id)initPrivate
{
  ARFaceGeometry *v3;
  dispatch_semaphore_t v4;
  OS_dispatch_semaphore *normalsSemaphore;
  ARFaceGeometry *v6;
  objc_super v8;

  if (+[ARFaceTrackingTechnique isSupported](ARFaceTrackingTechnique, "isSupported"))
  {
    v8.receiver = self;
    v8.super_class = (Class)ARFaceGeometry;
    v3 = -[ARFaceGeometry init](&v8, sel_init);
    if (v3)
    {
      v4 = dispatch_semaphore_create(1);
      normalsSemaphore = v3->_normalsSemaphore;
      v3->_normalsSemaphore = (OS_dispatch_semaphore *)v4;

    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ARFaceGeometry)initWithBlendShapes:(NSDictionary *)blendShapes
{
  NSDictionary *v4;
  ARFaceGeometry *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  float32x4_t v25;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v27;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v28;
  unint64_t v29;
  _DWORD *v30;
  float32x4_t v31;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v32;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v34;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *__p;
  _BYTE *v43;
  uint64_t v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = blendShapes;
  v5 = -[ARFaceGeometry initPrivate](self, "initPrivate");
  if (v5)
  {
    +[ARFaceAnchor blendShapeMapping](ARFaceAnchor, "blendShapeMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<float>::vector(&__p, objc_msgSend(v7, "count"));

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = v4;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            v16 = v15;
            v17 = objc_msgSend(v13, "intValue");
            *((_DWORD *)__p + v17) = v16;

          }
        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", __p, v43 - (_BYTE *)__p, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x1E0CFCC80];
    v45 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CVAFaceTrackingCopySemantics();
    v37 = 0;
    objc_msgSend(0, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD38]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD50]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "length");
    v23 = objc_retainAutorelease(v21);
    v24 = objc_msgSend(v23, "bytes");
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v34, (int)(v22 / 0xC));
    var0 = v5->_customVertices.var0;
    if (var0)
    {
      *(_QWORD *)v5->_anon_10 = var0;
      operator delete(var0);
      v5->_customVertices.var0 = 0;
      *(_QWORD *)v5->_anon_10 = 0;
      *(_QWORD *)&v5->_anon_10[8] = 0;
    }
    v27 = v34;
    v5->_customVertices.var0 = v34;
    v28 = v35;
    *(_QWORD *)v5->_anon_10 = v35;
    *(_QWORD *)&v5->_anon_10[8] = v36;
    if (v28 != v27)
    {
      v29 = 0;
      v30 = (_DWORD *)(v24 + 8);
      v31 = (float32x4_t)vdupq_n_s32(0x447A0000u);
      do
      {
        v25.i64[0] = *((_QWORD *)v30 - 1);
        v25.i32[2] = *v30;
        *(float32x4_t *)&v27[2 * v29] = v25;
        v32 = v5->_customVertices.var0;
        v25 = vdivq_f32(*(float32x4_t *)&v32[2 * v29], v31);
        *(float32x4_t *)&v32[2 * v29++] = v25;
        v27 = v5->_customVertices.var0;
        v30 += 3;
      }
      while (v29 < (uint64_t)(*(_QWORD *)v5->_anon_10 - (_QWORD)v27) >> 4);
    }

    if (__p)
    {
      v43 = __p;
      operator delete(__p);
    }

  }
  return v5;
}

- (ARFaceGeometry)initWithFaceTrackingDataProtocol:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ARFaceGeometry *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[ARFaceGeometry initPrivate](self, "initPrivate");
  v7 = objc_msgSend(v5, "vertexCount");
  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "vertexCount");

  if (v7 == v9)
  {
    if (v6)
    {
      objc_storeStrong((id *)v6 + 7, a3);
      v10 = (const void *)objc_msgSend(v5, "vertices");
      v11 = objc_msgSend(v5, "vertices");
      v12 = objc_msgSend(v5, "vertexCount");
      memset(v19, 0, sizeof(v19));
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(v19, v10, v11 + 16 * v12, (v11 + 16 * v12 - (uint64_t)v10) >> 4);
      v13 = (void *)*((_QWORD *)v6 + 1);
      if (v13)
      {
        *((_QWORD *)v6 + 2) = v13;
        operator delete(v13);
        *((_QWORD *)v6 + 1) = 0;
        *((_QWORD *)v6 + 2) = 0;
        *((_QWORD *)v6 + 3) = 0;
      }
      *(_OWORD *)(v6 + 8) = *(_OWORD *)v19;
      *((_QWORD *)v6 + 3) = *(_QWORD *)&v19[16];
    }
    v14 = v6;
  }
  else
  {
    _ARLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543618;
      *(_QWORD *)&v19[4] = v17;
      *(_WORD *)&v19[12] = 2048;
      *(_QWORD *)&v19[14] = v6;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error: Number of vertices must be consistent with neutral geometry", v19, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (ARFaceGeometry)initWithCustomVertices:(ARFaceGeometry *)self verticesCount:(SEL)a2
{
  const void *v2;
  unint64_t v3;
  unint64_t v4;
  const void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ARFaceGeometry *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  _BYTE v16[24];
  uint64_t v17;

  v4 = v3;
  v5 = v2;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = -[ARFaceGeometry initPrivate](self, "initPrivate");
  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "vertexCount");

  if (v8 == v4)
  {
    if (v6)
    {
      v9 = (void *)v6[7];
      v6[7] = 0;

      memset(v16, 0, sizeof(v16));
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(v16, v5, (uint64_t)v5 + 16 * v4, v4);
      v10 = (void *)v6[1];
      if (v10)
      {
        v6[2] = v10;
        operator delete(v10);
        v6[1] = 0;
        v6[2] = 0;
        v6[3] = 0;
      }
      *(_OWORD *)(v6 + 1) = *(_OWORD *)v16;
      v6[3] = *(_QWORD *)&v16[16];
    }
    v11 = v6;
  }
  else
  {
    _ARLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543618;
      *(_QWORD *)&v16[4] = v14;
      *(_WORD *)&v16[12] = 2048;
      *(_QWORD *)&v16[14] = v6;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error: Number of vertices must be consistent with neutral geometry", v16, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initPrivate");
  v5 = v4;
  if (v4)
  {
    if ((ARFaceGeometry *)v4 != self)
    {
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v4 + 8), (char *)self->_customVertices.var0, *(_QWORD *)self->_anon_10, (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_customVertices.var0) >> 4);
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v5 + 32), (char *)self->_normals.var0, *(_QWORD *)self->_anon_28, (uint64_t)(*(_QWORD *)self->_anon_28 - (unint64_t)self->_normals.var0) >> 4);
    }
    objc_storeStrong((id *)(v5 + 56), self->_trackingData);
  }
  return (id)v5;
}

- (const)vertices
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  void *v3;

  var0 = self->_customVertices.var0;
  if (*(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10 == var0)
  {
    +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    var0 = (__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **)objc_msgSend(v3, "vertices");

  }
  return (const simd_float3 *)var0;
}

- (NSUInteger)vertexCount
{
  void *v2;
  NSUInteger v3;

  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "vertexCount");

  return v3;
}

- (unint64_t)normalCount
{
  ARFaceTrackingDataProtocol *trackingData;

  trackingData = self->_trackingData;
  if (trackingData)
    return -[ARFaceTrackingDataProtocol normalCount](trackingData, "normalCount");
  else
    return -[ARFaceGeometry vertexCount](self, "vertexCount");
}

- (uint64_t)normals
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(a1 + 56))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    return objc_msgSend(*(id *)(a1 + 56), "normals");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 32);
    if (objc_msgSend((id)a1, "vertexCount") != v3 >> 4)
    {
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(a1 + 32, objc_msgSend((id)a1, "vertexCount"));
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40) - (_QWORD)v4;
      if (v5 >= 1)
        bzero(v4, 16 * (((unint64_t)v5 >> 4) - ((unint64_t)v5 > 0xF)) + 16);
      if (objc_msgSend((id)a1, "triangleCount"))
      {
        v6 = 0;
        v7 = 0;
        do
        {
          v8 = *(__int16 *)(objc_msgSend((id)a1, "triangleIndices") + 2 * v6);
          v9 = *(__int16 *)(objc_msgSend((id)a1, "triangleIndices") + 2 * (v6 + 1));
          v10 = *(__int16 *)(objc_msgSend((id)a1, "triangleIndices") + 2 * (v6 + 2));
          v20 = *(float32x4_t *)(objc_msgSend((id)a1, "vertices") + 16 * v8);
          v19 = *(float32x4_t *)(objc_msgSend((id)a1, "vertices") + 16 * v9);
          v11 = objc_msgSend((id)a1, "vertices");
          v12 = vsubq_f32(v19, v20);
          v13 = vsubq_f32(*(float32x4_t *)(v11 + 16 * v10), v20);
          v14 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL), vnegq_f32(v12)), v13, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL));
          v15 = (int32x4_t)vmulq_f32(v14, v14);
          v15.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), *(float32x2_t *)v15.i8)).u32[0];
          v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
          v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
          v18 = vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), (int8x16_t)v14, 0xCuLL), vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
          *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 16 * v8) = vaddq_f32(*(float32x4_t *)(*(_QWORD *)(a1 + 32) + 16 * v8), v18);
          *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 16 * v9) = vaddq_f32(v18, *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 16 * v9));
          ++v7;
          *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 16 * v10) = vaddq_f32(v18, *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 16 * v10));
          v6 += 3;
        }
        while (objc_msgSend((id)a1, "triangleCount") > v7);
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    return *(_QWORD *)(a1 + 32);
  }
}

- (const)textureCoordinates
{
  void *v2;
  const simd_float2 *v3;

  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const simd_float2 *)objc_msgSend(v2, "textureCoordinates");

  return v3;
}

- (NSUInteger)textureCoordinateCount
{
  void *v2;
  NSUInteger v3;

  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textureCoordinateCount");

  return v3;
}

- (const)triangleIndices
{
  void *v2;
  const int16_t *v3;

  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const int16_t *)objc_msgSend(v2, "triangleIndices");

  return v3;
}

- (NSUInteger)triangleCount
{
  void *v2;
  NSUInteger v3;

  +[ARNeutralFaceGeometry sharedNeutralGeometry](ARNeutralFaceGeometry, "sharedNeutralGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "triangleCount");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_customVertices.var0, *(_QWORD *)self->_anon_10 - (unint64_t)self->_customVertices.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("customVertices"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_normals.var0, *(_QWORD *)self->_anon_28 - (unint64_t)self->_normals.var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("normalsData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_trackingData, CFSTR("trackingData"));

}

- (ARFaceGeometry)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  uint64_t v20;

  v4 = a3;
  v5 = -[ARFaceGeometry initPrivate](self, "initPrivate");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customVertices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "length");
      v9 = (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v19 = 0uLL;
      v20 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v19, v9, (uint64_t)v9 + 16 * (int)((unint64_t)v8 >> 4), (int)(v8 >> 4));
      v10 = (void *)*((_QWORD *)v5 + 1);
      if (v10)
      {
        *((_QWORD *)v5 + 2) = v10;
        operator delete(v10);
        *((_QWORD *)v5 + 1) = 0;
        *((_QWORD *)v5 + 2) = 0;
        *((_QWORD *)v5 + 3) = 0;
      }
      *(_OWORD *)(v5 + 8) = v19;
      *((_QWORD *)v5 + 3) = v20;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normalsData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "length");
      v14 = (const void *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
      v19 = 0uLL;
      v20 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v19, v14, (uint64_t)v14 + 16 * (int)((unint64_t)v13 >> 4), (int)(v13 >> 4));
      v15 = (void *)*((_QWORD *)v5 + 4);
      if (v15)
      {
        *((_QWORD *)v5 + 5) = v15;
        operator delete(v15);
        *((_QWORD *)v5 + 4) = 0;
        *((_QWORD *)v5 + 5) = 0;
        *((_QWORD *)v5 + 6) = 0;
      }
      *((_OWORD *)v5 + 2) = v19;
      *((_QWORD *)v5 + 6) = v20;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingData"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v16;

  }
  return (ARFaceGeometry *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  float32x4_t *v7;
  unint64_t v8;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v10;
  BOOL v11;
  uint64_t v12;
  uint32x4_t v13;
  char v14;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = (id *)v4;
    v6 = v5;
    v7 = (float32x4_t *)v5[1];
    v8 = ((_BYTE *)v5[2] - (_BYTE *)v7) >> 4;
    var0 = self->_customVertices.var0;
    v10 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
    if (v8 != ((char *)v10 - (char *)var0) >> 4)
      goto LABEL_10;
    if (v10 == var0)
      goto LABEL_8;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = (uint32x4_t)vceqq_f32(v7[v12], *(float32x4_t *)&var0[2 * v12]);
      v13.i32[3] = v13.i32[2];
      if ((vminvq_u32(v13) & 0x80000000) == 0)
        break;
      v11 = ++v12 >= v8;
    }
    while (v8 != v12);
    if (v11)
LABEL_8:
      v14 = objc_msgSend(v5[7], "isEqual:", self->_trackingData);
    else
LABEL_10:
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (__n128)positionForLabeledFacePosition:(void *)a3
{
  id v4;
  uint64_t v5;
  float32x4_t v6;
  uint64_t v7;
  float32x4_t v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float v16;
  uint64_t v17;
  __int16 v18;
  int v19;

  v4 = a3;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  v16 = 0.0;
  if (ARFaceLandmarkDataFromLabeledFacePosition(v4, (__int16 *)&v19 + 1, (__int16 *)&v19, &v18, (float *)&v17 + 1, (float *)&v17, &v16))
  {
    v5 = objc_msgSend(a1, "vertices");
    *(float32x2_t *)v6.f32 = ARVector3ScalarMultiplication(*(float32x2_t *)(v5 + 16 * SHIWORD(v19)), *((float *)&v17 + 1));
    v14 = v6;
    v7 = objc_msgSend(a1, "vertices");
    *(float32x2_t *)v8.f32 = ARVector3ScalarMultiplication(*(float32x2_t *)(v7 + 16 * (__int16)v19), *(float *)&v17);
    v13 = v8;
    v9 = objc_msgSend(a1, "vertices");
    *(float32x2_t *)v10.f32 = ARVector3ScalarMultiplication(*(float32x2_t *)(v9 + 16 * v18), v16);
    v11 = vaddq_f32(vaddq_f32(v14, v13), v10);
  }
  else
  {
    v11 = (float32x4_t)xmmword_1B3C08450;
  }
  v15 = v11;

  return (__n128)v15;
}

- (double)normalForLabeledFacePosition:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x2_t v12;
  float32x2_t v13;
  double result;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float v18;
  float v19;
  __int16 v20;
  int v21;

  v21 = 0;
  v20 = 0;
  if (ARFaceLandmarkDataFromLabeledFacePosition(a3, (__int16 *)&v21 + 1, (__int16 *)&v21, &v20, &v19, &v18, &v17))
  {
    v4 = objc_msgSend(a1, "vertices");
    v16 = *(float32x4_t *)(v4 + 16 * SHIWORD(v21));
    v5 = objc_msgSend(a1, "vertices");
    v15 = *(float32x4_t *)(v5 + 16 * (__int16)v21);
    v6 = objc_msgSend(a1, "vertices");
    v7 = vsubq_f32(v15, v16);
    v8 = vsubq_f32(*(float32x4_t *)(v6 + 16 * v20), v16);
    v9 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), vnegq_f32(v7)), v8, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), (int8x16_t)v7, 0xCuLL));
    v10 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL);
    v11 = (int32x4_t)vmulq_f32(v9, v9);
    v11.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), *(float32x2_t *)v11.i8)).u32[0];
    v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
    v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
    *(_QWORD *)&result = vmulq_n_f32(v10, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]).u64[0];
  }
  else
  {
    *(_QWORD *)&result = 2143289344;
  }
  return result;
}

- (signed)closestVertexIndexToLabeledFacePosition:(id)a3
{
  float v6;
  float v7;
  float v8;
  __int16 v9;
  int v10;

  v10 = 0;
  v9 = 0;
  v8 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (!ARFaceLandmarkDataFromLabeledFacePosition(a3, (__int16 *)&v10 + 1, (__int16 *)&v10, &v9, &v8, &v7, &v6))return -1;
  if (v8 > v7 && v8 > v6)
    return HIWORD(v10);
  if (v7 <= v6)
    return v9;
  return v10;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v4;

  objc_storeStrong((id *)&self->_normalsSemaphore, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  var0 = self->_normals.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v4 = self->_customVertices.var0;
  if (v4)
  {
    *(_QWORD *)self->_anon_10 = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

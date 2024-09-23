@implementation ARNeutralFaceGeometry

+ (id)sharedNeutralGeometry
{
  if (+[ARNeutralFaceGeometry sharedNeutralGeometry]::onceToken != -1)
    dispatch_once(&+[ARNeutralFaceGeometry sharedNeutralGeometry]::onceToken, &__block_literal_global_85);
  return (id)+[ARNeutralFaceGeometry sharedNeutralGeometry]::neutralGeometry;
}

void __46__ARNeutralFaceGeometry_sharedNeutralGeometry__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ARNeutralFaceGeometry initFromCVAFaceTrackingSemantics]([ARNeutralFaceGeometry alloc], "initFromCVAFaceTrackingSemantics");
  v1 = (void *)+[ARNeutralFaceGeometry sharedNeutralGeometry]::neutralGeometry;
  +[ARNeutralFaceGeometry sharedNeutralGeometry]::neutralGeometry = (uint64_t)v0;

}

- (id)initFromCVAFaceTrackingSemantics
{
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  float32x4_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _DWORD *v14;
  float32x4_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  float v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v29;
  int32x4_t *v30;
  unint64_t v31;
  void *v32;
  int8x8_t *v33;
  uint64_t v34;
  int8x8_t *v35;
  int32x4_t v36;
  int8x8_t v37;
  ARNeutralFaceGeometry *v38;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v43;

  if (+[ARFaceTrackingTechnique isSupported](ARFaceTrackingTechnique, "isSupported"))
  {
    v43.receiver = self;
    v43.super_class = (Class)ARNeutralFaceGeometry;
    v3 = -[ARNeutralFaceGeometry init](&v43, sel_init);
    if (v3)
    {
      CVAFaceTrackingCopySemantics();
      v42 = 0;
      v4 = *MEMORY[0x1E0CFCD38];
      objc_msgSend(0, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD38]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD50]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "length");
      v8 = objc_retainAutorelease(v6);
      v9 = objc_msgSend(v8, "bytes");
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v40, (int)(v7 / 0xC));
      v11 = (void *)*((_QWORD *)v3 + 1);
      if (v11)
      {
        *((_QWORD *)v3 + 2) = v11;
        operator delete(v11);
        *((_QWORD *)v3 + 1) = 0;
        *((_QWORD *)v3 + 2) = 0;
        *((_QWORD *)v3 + 3) = 0;
      }
      *(_OWORD *)(v3 + 8) = v40;
      *((_QWORD *)v3 + 3) = v41;
      v12 = *((_QWORD *)v3 + 1);
      if (*((_QWORD *)v3 + 2) != v12)
      {
        v13 = 0;
        v14 = (_DWORD *)(v9 + 8);
        v15 = (float32x4_t)vdupq_n_s32(0x447A0000u);
        do
        {
          v10.i64[0] = *((_QWORD *)v14 - 1);
          v10.i32[2] = *v14;
          *(float32x4_t *)(v12 + 16 * v13) = v10;
          v16 = *((_QWORD *)v3 + 1);
          v10 = vdivq_f32(*(float32x4_t *)(v16 + 16 * v13), v15);
          *(float32x4_t *)(v16 + 16 * v13++) = v10;
          v12 = *((_QWORD *)v3 + 1);
          v14 += 3;
        }
        while (v13 < (*((_QWORD *)v3 + 2) - v12) >> 4);
      }
      objc_msgSend(0, "objectForKeyedSubscript:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD48]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v40, (int)(objc_msgSend(v18, "length") >> 3));
      v19 = (void *)*((_QWORD *)v3 + 4);
      if (v19)
      {
        *((_QWORD *)v3 + 5) = v19;
        operator delete(v19);
        *((_QWORD *)v3 + 4) = 0;
        *((_QWORD *)v3 + 5) = 0;
        *((_QWORD *)v3 + 6) = 0;
      }
      *((_OWORD *)v3 + 2) = v40;
      *((_QWORD *)v3 + 6) = v41;
      v20 = objc_retainAutorelease(v18);
      v21 = objc_msgSend(v20, "bytes");
      v22 = *((_QWORD *)v3 + 4);
      if (*((_QWORD *)v3 + 5) != v22)
      {
        v23 = 0;
        do
        {
          LODWORD(v24) = *(_DWORD *)v21;
          v25 = *(float *)(v21 + 4);
          v21 += 8;
          *((float *)&v24 + 1) = 1.0 - v25;
          *(_QWORD *)(v22 + 8 * v23++) = v24;
          v22 = *((_QWORD *)v3 + 4);
        }
        while (v23 < (*((_QWORD *)v3 + 5) - v22) >> 3);
      }
      objc_msgSend(0, "objectForKeyedSubscript:", v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD40]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v27, "length");
      v29 = objc_retainAutorelease(v27);
      v30 = (int32x4_t *)objc_msgSend(v29, "bytes");
      v31 = v28 >> 4;
      std::vector<short>::vector(&v40, 6 * (int)v31);
      v32 = (void *)*((_QWORD *)v3 + 7);
      if (v32)
      {
        *((_QWORD *)v3 + 8) = v32;
        operator delete(v32);
        *((_QWORD *)v3 + 7) = 0;
        *((_QWORD *)v3 + 8) = 0;
        *((_QWORD *)v3 + 9) = 0;
      }
      v33 = (int8x8_t *)v40;
      *(_OWORD *)(v3 + 56) = v40;
      *((_QWORD *)v3 + 9) = v41;
      if ((int)v31 >= 1)
      {
        v34 = 0;
        v35 = v33 + 1;
        do
        {
          v36 = *v30++;
          v37 = (int8x8_t)vmovn_s32(v36);
          v35->i16[1] = v37.i16[1];
          v35[-1] = vext_s8(v37, v37, 6uLL);
          v35->i16[0] = v37.i16[3];
          v34 += 4;
          v35 = (int8x8_t *)((char *)v35 + 12);
        }
        while (v34 < 4 * (int)v31);
      }

    }
    self = v3;
    v38 = self;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (uint64_t)vertices
{
  return *(_QWORD *)(a1 + 8);
}

- (unint64_t)vertexCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_verticesVector.var0) >> 4;
}

- (uint64_t)textureCoordinates
{
  return *(_QWORD *)(a1 + 32);
}

- (unint64_t)textureCoordinateCount
{
  return (uint64_t)(*(_QWORD *)&self->_anon_20[8] - *(_QWORD *)self->_anon_20) >> 3;
}

- (const)triangleIndices
{
  return self->_trianglesIndicesVector.__begin_;
}

- (unint64_t)triangleCount
{
  return (self->_trianglesIndicesVector.__end_ - self->_trianglesIndicesVector.__begin_) / 3uLL;
}

- (void).cxx_destruct
{
  signed __int16 *begin;
  void *v4;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;

  begin = self->_trianglesIndicesVector.__begin_;
  if (begin)
  {
    self->_trianglesIndicesVector.__end_ = begin;
    operator delete(begin);
  }
  v4 = *(void **)self->_anon_20;
  if (v4)
  {
    *(_QWORD *)&self->_anon_20[8] = v4;
    operator delete(v4);
  }
  var0 = self->_verticesVector.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_10 = var0;
    operator delete(var0);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

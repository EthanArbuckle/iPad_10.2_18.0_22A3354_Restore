@implementation GEOMapEdgeRoadFinder

- (GEOMapEdgeRoadFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapEdgeRoadFinder *v10;
  uint64_t v11;
  GEOMapTileFinder *tileFinder;
  objc_super v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapEdgeRoadFinder;
  v10 = -[GEOMapEdgeFinder initWithMap:center:radius:](&v14, sel_initWithMap_center_radius_, v9, var0, var1, a5);
  if (v10)
  {
    +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", v9, var0, var1, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    tileFinder = v10->super._tileFinder;
    v10->super._tileFinder = (GEOMapTileFinder *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOMapEdgeRoadFinder;
  -[GEOMapRequest dealloc](&v2, sel_dealloc);
}

- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  const void *v16;
  const void *v17;
  float v18;

  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke;
  v14[3] = &unk_1E1C0E730;
  v16 = a6;
  v17 = a4;
  v18 = a5;
  v14[4] = self;
  v15 = v12;
  v13 = v12;
  objc_msgSend(a3, "forEachRoad:", v14);

}

void __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  GEOMapEdgeRoadBuilder *v7;
  void *v8;
  GEOMapEdgeRoadBuilder *v9;
  GEOMapEdgeRoadBuilder *v10;
  void *v11;
  GEOMapEdgeRoadBuilder *v12;
  _QWORD v13[6];
  __int128 v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingTile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke_2;
  v13[3] = &unk_1E1C0E708;
  v6 = *(_QWORD *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 48);
  v15 = *(_DWORD *)(a1 + 64);
  v13[4] = v6;
  v13[5] = &v16;
  objc_msgSend(v5, "forEachEdgeInRoad:visitTwice:visitor:", v3, 1, v13);

  if (*((_BYTE *)v17 + 24))
  {
    v7 = [GEOMapEdgeRoadBuilder alloc];
    objc_msgSend(*(id *)(a1 + 32), "map");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GEOMapEdgeRoadBuilder initWithMap:roadFeature:shouldFlip:](v7, "initWithMap:roadFeature:shouldFlip:", v8, v3, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = [GEOMapEdgeRoadBuilder alloc];
    objc_msgSend(*(id *)(a1 + 32), "map");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOMapEdgeRoadBuilder initWithMap:roadFeature:shouldFlip:](v10, "initWithMap:roadFeature:shouldFlip:", v11, v3, 1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  _Block_object_dispose(&v16, 8);

}

void __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int8x8_t *v4;
  unint64_t v5;
  int8x8_t *v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t ***v12;
  uint64_t **i;
  unint64_t v14;
  id v15;
  void *v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float32x4_t v23;
  float32x4_t v24;
  int16x4_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  float *v30;
  float v31;
  id v32;
  void *v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  float *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float32x4_t v48;
  float32x4_t v49;
  uint64_t v50;

  v3 = a2;
  v4 = *(int8x8_t **)(a1 + 32);
  v5 = std::hash<GEORoadEdge * {__strong}>::operator()(v3);
  v6 = v4 + 11;
  v7 = v4[12];
  if (v7)
  {
    v8 = v5;
    v9 = (uint8x8_t)vcnt_s8(v7);
    v9.i16[0] = vaddlv_u8(v9);
    v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      v11 = v5;
      if (v5 >= *(_QWORD *)&v7)
        v11 = v5 % *(_QWORD *)&v7;
    }
    else
    {
      v11 = (*(_QWORD *)&v7 - 1) & v5;
    }
    v12 = *(uint64_t ****)(*(_QWORD *)v6 + 8 * v11);
    if (v12)
    {
      for (i = *v12; i; i = (uint64_t **)*i)
      {
        v14 = (unint64_t)i[1];
        if (v14 == v8)
        {
          if (std::equal_to<GEORoadEdge * {__strong}>::operator()(i[2], v3))
            goto LABEL_45;
        }
        else
        {
          if (v10 > 1)
          {
            if (v14 >= *(_QWORD *)&v7)
              v14 %= *(_QWORD *)&v7;
          }
          else
          {
            v14 &= *(_QWORD *)&v7 - 1;
          }
          if (v14 != v11)
            break;
        }
      }
    }
  }
  v15 = v3;
  v50 = 0;
  objc_msgSend(v15, "road");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = GEOMultiSectionFeaturePoints(v16, 0, &v50);

  v18 = objc_msgSend(v15, "vertexIndexA");
  if (v18 >= objc_msgSend(v15, "vertexIndexB"))
    v19 = objc_msgSend(v15, "vertexIndexB");
  else
    v19 = objc_msgSend(v15, "vertexIndexA");
  v20 = v19;
  v21 = objc_msgSend(v15, "vertexIndexA");
  if (v21 >= objc_msgSend(v15, "vertexIndexB"))
    v22 = objc_msgSend(v15, "vertexIndexA");
  else
    v22 = objc_msgSend(v15, "vertexIndexB");
  v23 = (float32x4_t)xmmword_189CC14F0;
  while (v20 <= v22)
  {
    v24.i64[0] = v17[v20];
    v24.i64[1] = v24.i64[0];
    v25.i32[0] = vmovn_s32(vcgtq_f32(v24, v23)).u32[0];
    v25.i32[1] = vmovn_s32(vcgtq_f32(v23, v24)).i32[1];
    v23 = (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(v25), (int8x16_t)v23, (int8x16_t)v24);
    ++v20;
  }
  v48 = v23;

  v26 = 0;
  v49 = v48;
  v27 = *(_QWORD *)(a1 + 48);
  v28 = 1;
  while (v49.f32[v26 + 2] > *(float *)(v27 + 4 * v26) && v49.f32[v26] < *(float *)(v27 + 8 + 4 * v26))
  {
    v29 = v28;
    v28 = 0;
    v26 = 1;
    if ((v29 & 1) == 0)
    {
      v30 = *(float **)(a1 + 56);
      v31 = *(float *)(a1 + 64);
      v32 = v15;
      v50 = 0;
      objc_msgSend(v32, "road");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = GEOMultiSectionFeaturePoints(v33, 0, &v50);

      v35 = objc_msgSend(v32, "vertexIndexA");
      if (v35 >= objc_msgSend(v32, "vertexIndexB"))
        v36 = objc_msgSend(v32, "vertexIndexB");
      else
        v36 = objc_msgSend(v32, "vertexIndexA");
      v37 = v36;
      v38 = objc_msgSend(v32, "vertexIndexA", *(_OWORD *)&v48, *(_OWORD *)&v49);
      if (v38 >= objc_msgSend(v32, "vertexIndexB"))
        v39 = objc_msgSend(v32, "vertexIndexA");
      else
        v39 = objc_msgSend(v32, "vertexIndexB");
      v40 = v39;
      if (v37 <= v39)
        v41 = v39;
      else
        v41 = v37;
      v42 = (float *)&v34[v37 + 1];
      do
      {
        if (v41 == v37)
        {

          goto LABEL_45;
        }
        v43 = gm::Matrix<float,2,1>::nearestPointOffsetAlongLineSegment<int,void>(v30, v42 - 2, v42);
        v44 = *(v42 - 2);
        v45 = *(v42 - 1);
        v46 = *v42;
        v47 = v42[1];
        v42 += 2;
        ++v37;
      }
      while ((float)((float)((float)((float)(*v30 - (float)(v44 + (float)((float)(v46 - v44) * v43)))
                                    * (float)(*v30 - (float)(v44 + (float)((float)(v46 - v44) * v43))))
                            + 0.0)
                    + (float)((float)(v30[1] - (float)(v45 + (float)((float)(v47 - v45) * v43)))
                            * (float)(v30[1] - (float)(v45 + (float)((float)(v47 - v45) * v43))))) > v31);

      if (v37 - 1 < v40)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      break;
    }
  }
LABEL_45:

}

- (BOOL)_checkEdgeForDuplicates:(const void *)a3
{
  unint64_t v3;
  id *v7;
  id *v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unordered_set<GEORoadEdge *, std::hash<GEORoadEdge *>, std::equal_to<GEORoadEdge *>, std::allocator<GEORoadEdge *>> *p_roadsConsidered;
  unint64_t value;
  uint8x8_t v15;
  unint64_t v16;
  uint64_t ***v17;
  uint64_t **j;
  unint64_t v19;
  _QWORD *v20;
  __compressed_pair<std::__hash_node_base<std::__hash_node<GEORoadEdge *, void *> *>, std::allocator<std::__hash_node<GEORoadEdge *, void *>>> *p_p1;
  id v22;
  float v23;
  float v24;
  _BOOL8 v25;
  unint64_t v26;
  unint64_t v27;
  int8x8_t prime;
  void **v29;
  void **v30;
  uint64_t v31;
  _QWORD *next;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  void **v40;
  void **v41;
  unint64_t v42;
  void **v43;
  id *i;

  if ((*(unsigned int (**)(_QWORD, SEL))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, a2))
    return 0;
  v8 = *(id **)(*(_QWORD *)a3 + 40);
  v7 = *(id **)(*(_QWORD *)a3 + 48);
  for (i = v7; ; v7 = i)
  {
    if (v8 == v7)
      return 0;
    v9 = *v8;
    objc_msgSend(v9, "road");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      break;
    v11 = std::hash<GEORoadEdge * {__strong}>::operator()(v9);
    v12 = v11;
    p_roadsConsidered = &self->_roadsConsidered;
    value = self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      v15 = (uint8x8_t)vcnt_s8((int8x8_t)value);
      v15.i16[0] = vaddlv_u8(v15);
      v16 = v15.u32[0];
      if (v15.u32[0] > 1uLL)
      {
        v3 = v11;
        if (v11 >= value)
          v3 = v11 % value;
      }
      else
      {
        v3 = (value - 1) & v11;
      }
      v17 = (uint64_t ***)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
      if (v17)
      {
        for (j = *v17; j; j = (uint64_t **)*j)
        {
          v19 = (unint64_t)j[1];
          if (v19 == v12)
          {
            if (std::equal_to<GEORoadEdge * {__strong}>::operator()(j[2], v9))
              goto LABEL_87;
          }
          else
          {
            if (v16 > 1)
            {
              if (v19 >= value)
                v19 %= value;
            }
            else
            {
              v19 &= value - 1;
            }
            if (v19 != v3)
              break;
          }
        }
      }
    }
    v20 = operator new(0x18uLL);
    p_p1 = &self->_roadsConsidered.__table_.__p1_;
    *v20 = 0;
    v20[1] = v12;
    v22 = v9;
    v20[2] = v22;
    v23 = (float)(self->_roadsConsidered.__table_.__p2_.__value_ + 1);
    v24 = self->_roadsConsidered.__table_.__p3_.__value_;
    if (!value || (float)(v24 * (float)value) < v23)
    {
      v25 = (value & (value - 1)) != 0;
      if (value < 3)
        v25 = 1;
      v26 = v25 | (2 * value);
      v27 = vcvtps_u32_f32(v23 / v24);
      if (v26 <= v27)
        prime = (int8x8_t)v27;
      else
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      value = self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (*(_QWORD *)&prime <= value)
      {
        if (*(_QWORD *)&prime < value)
        {
          v35 = vcvtps_u32_f32((float)self->_roadsConsidered.__table_.__p2_.__value_ / self->_roadsConsidered.__table_.__p3_.__value_);
          if (value < 3 || (v36 = (uint8x8_t)vcnt_s8((int8x8_t)value), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
          {
            v35 = std::__next_prime(v35);
          }
          else
          {
            v37 = 1 << -(char)__clz(v35 - 1);
            if (v35 >= 2)
              v35 = v37;
          }
          if (*(_QWORD *)&prime <= v35)
            prime = (int8x8_t)v35;
          if (*(_QWORD *)&prime >= value)
          {
            value = self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime)
              goto LABEL_34;
            v43 = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
            p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v43)
              operator delete(v43);
            value = 0;
            self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
      }
      else
      {
LABEL_34:
        if (*(_QWORD *)&prime >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v29 = (void **)operator new(8 * *(_QWORD *)&prime);
        v30 = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
        p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_ = v29;
        if (v30)
          operator delete(v30);
        v31 = 0;
        self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
        do
          p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v31++] = 0;
        while (*(_QWORD *)&prime != v31);
        next = p_p1->__value_.__next_;
        if (p_p1->__value_.__next_)
        {
          v33 = next[1];
          v34 = (uint8x8_t)vcnt_s8(prime);
          v34.i16[0] = vaddlv_u8(v34);
          if (v34.u32[0] > 1uLL)
          {
            if (v33 >= *(_QWORD *)&prime)
              v33 %= *(_QWORD *)&prime;
          }
          else
          {
            v33 &= *(_QWORD *)&prime - 1;
          }
          p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v33] = p_p1;
          v38 = (_QWORD *)*next;
          if (*next)
          {
            do
            {
              v39 = v38[1];
              if (v34.u32[0] > 1uLL)
              {
                if (v39 >= *(_QWORD *)&prime)
                  v39 %= *(_QWORD *)&prime;
              }
              else
              {
                v39 &= *(_QWORD *)&prime - 1;
              }
              if (v39 != v33)
              {
                if (!p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39])
                {
                  p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39] = next;
                  goto LABEL_59;
                }
                *next = *v38;
                *v38 = *(_QWORD *)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39];
                *(_QWORD *)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39] = v38;
                v38 = next;
              }
              v39 = v33;
LABEL_59:
              next = v38;
              v38 = (_QWORD *)*v38;
              v33 = v39;
            }
            while (v38);
          }
        }
        value = (unint64_t)prime;
      }
      if ((value & (value - 1)) != 0)
      {
        if (v12 >= value)
          v3 = v12 % value;
        else
          v3 = v12;
      }
      else
      {
        v3 = (value - 1) & v12;
      }
    }
    v40 = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
    v41 = (void **)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v41)
    {
      *v20 = *v41;
    }
    else
    {
      *v20 = p_p1->__value_.__next_;
      p_p1->__value_.__next_ = v20;
      v40[v3] = p_p1;
      if (!*v20)
        goto LABEL_77;
      v42 = *(_QWORD *)(*v20 + 8);
      if ((value & (value - 1)) != 0)
      {
        if (v42 >= value)
          v42 %= value;
      }
      else
      {
        v42 &= value - 1;
      }
      v41 = &p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v42];
    }
    *v41 = v20;
LABEL_77:
    ++self->_roadsConsidered.__table_.__p2_.__value_;

    ++v8;
  }
LABEL_87:

  return 1;
}

- (void).cxx_destruct
{
  unordered_set<GEORoadEdge *, std::hash<GEORoadEdge *>, std::equal_to<GEORoadEdge *>, std::allocator<GEORoadEdge *>> *p_roadsConsidered;
  id *next;
  id *v4;
  void **value;

  p_roadsConsidered = &self->_roadsConsidered;
  next = (id *)self->_roadsConsidered.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (id *)*next;

      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
  p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end

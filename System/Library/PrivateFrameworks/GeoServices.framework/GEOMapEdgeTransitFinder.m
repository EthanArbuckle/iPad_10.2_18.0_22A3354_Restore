@implementation GEOMapEdgeTransitFinder

- (GEOMapEdgeTransitFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapEdgeTransitFinder *v10;
  double v11;
  uint64_t v12;
  GEOMapTileFinder *tileFinder;
  objc_super v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapEdgeTransitFinder;
  v10 = -[GEOMapEdgeFinder initWithMap:center:radius:](&v15, sel_initWithMap_center_radius_, v9, var0, var1, a5);
  if (v10)
  {
    v10->super._centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
    v10->super._centerPoint.y = v11;
    v10->super._mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * a5;
    +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", v9, var0, var1, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    tileFinder = v10->super._tileFinder;
    v10->super._tileFinder = (GEOMapTileFinder *)v12;

  }
  return v10;
}

- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  float v23;
  float v24;
  uint64_t v25;
  char v26;
  char v27;
  id v28;
  unint64_t v29;
  float *v30;
  uint64_t v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  GEOMapEdgeTransitFinder *v37;
  id v38;
  id v39;
  void *v40;
  unint64_t v41;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  uint64_t v45;
  _OWORD v46[2];

  v37 = self;
  v11 = a3;
  v38 = a7;
  v41 = 0;
  v39 = v11;
  while (v41 < objc_msgSend(v11, "transitLinkCount", v37))
  {
    objc_msgSend(v11, "transitLinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    v15 = 0;
    v46[0] = xmmword_189CC14F0;
    v45 = 0;
    while (v15 < objc_msgSend(v14, "sectionCount"))
    {
      v16 = GEOTransitLinkPoints(v14, v15, &v45);
      v17 = v45;
      if (v45)
      {
        v18 = 0;
        do
        {
          v19 = 0;
          v21 = 1;
          do
          {
            v22 = v21;
            v20 = v16 + 8 * v18;
            v23 = *(float *)(v20 + 4 * v19);
            v24 = *((float *)v46 + v19);
            if (v23 < v24)
              v24 = *(float *)(v20 + 4 * v19);
            *((float *)v46 + v19) = v24;
            if (*((float *)v46 + v19 + 2) >= v23)
              v23 = *((float *)v46 + v19 + 2);
            *((float *)v46 + v19 + 2) = v23;
            v19 = 1;
            v21 = 0;
          }
          while ((v22 & 1) != 0);
          ++v18;
        }
        while (v18 != v17);
      }
      ++v15;
    }

    v25 = 0;
    v44 = v46[0];
    v26 = 1;
    while (*((float *)&v44 + v25 + 2) > *((float *)a6 + v25))
    {
      v27 = v26;
      if (*((float *)&v44 + v25) >= *((float *)a6 + v25 + 2))
        break;
      v26 = 0;
      v25 = 1;
      if ((v27 & 1) == 0)
      {
        v28 = v14;
        v29 = 0;
        *(_QWORD *)&v46[0] = 0;
        v40 = v28;
        while (v29 < objc_msgSend(v28, "sectionCount"))
        {
          v30 = (float *)(GEOTransitLinkPoints(v28, v29, v46) + 8);
          v31 = -1;
          while ((unint64_t)++v31 < *(_QWORD *)&v46[0])
          {
            v32 = gm::Matrix<float,2,1>::nearestPointOffsetAlongLineSegment<int,void>((float *)a4, v30 - 2, v30);
            v33 = *(v30 - 2);
            v34 = *(v30 - 1);
            v35 = *v30;
            v36 = v30[1];
            v30 += 2;
            if ((float)((float)((float)((float)(*(float *)a4 - (float)(v33 + (float)((float)(v35 - v33) * v32)))
                                       * (float)(*(float *)a4 - (float)(v33 + (float)((float)(v35 - v33) * v32))))
                               + 0.0)
                       + (float)((float)(*((float *)a4 + 1) - (float)(v34 + (float)((float)(v36 - v34) * v32)))
                               * (float)(*((float *)a4 + 1) - (float)(v34 + (float)((float)(v36 - v34) * v32))))) <= a5)
            {

              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __89__GEOMapEdgeTransitFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke;
              v42[3] = &unk_1E1BFFE08;
              v42[4] = v37;
              v43 = v38;
              geo::TransitEdgePiece::findPiecesForLink(v40, v42);

              v11 = v39;
              goto LABEL_26;
            }
          }
          ++v29;
          v11 = v39;
          v28 = v40;
        }

        break;
      }
    }
LABEL_26:

    ++v41;
  }

}

void __89__GEOMapEdgeTransitFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  int8x8_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  GEOMapEdgeTransitBuilder *v15;
  GEOMapEdgeTransitBuilder *v16;
  id v17;

  v4 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  v5 = std::hash<geo::TransitEdgePiece>::operator()(a2);
  v6 = (int8x8_t)v4[1];
  if (v6)
  {
    v7 = v5;
    v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      v10 = v5;
      if (v5 >= *(_QWORD *)&v6)
        v10 = v5 % *(_QWORD *)&v6;
    }
    else
    {
      v10 = (*(_QWORD *)&v6 - 1) & v5;
    }
    v11 = *(_QWORD **)(*v4 + 8 * v10);
    if (v11)
    {
      v12 = (_QWORD *)*v11;
      if (*v11)
      {
        do
        {
          v13 = v12[1];
          if (v13 == v7)
          {
            if (std::equal_to<geo::TransitEdgePiece>::operator()((uint64_t)(v12 + 2), a2))
              return;
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(_QWORD *)&v6)
                v13 %= *(_QWORD *)&v6;
            }
            else
            {
              v13 &= *(_QWORD *)&v6 - 1;
            }
            if (v13 != v10)
              break;
          }
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
    }
  }
  v14 = *(_QWORD *)(a1 + 40);
  v15 = [GEOMapEdgeTransitBuilder alloc];
  objc_msgSend(*(id *)(a1 + 32), "map");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v16 = -[GEOMapEdgeTransitBuilder initWithMap:firstPiece:](v15, "initWithMap:firstPiece:");
  (*(void (**)(uint64_t, GEOMapEdgeTransitBuilder *))(v14 + 16))(v14, v16);

}

- (BOOL)_checkEdgeForDuplicates:(const void *)a3
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unordered_set<geo::TransitEdgePiece, std::hash<geo::TransitEdgePiece>, std::equal_to<geo::TransitEdgePiece>, std::allocator<geo::TransitEdgePiece>> *p_piecesConsidered;
  __compressed_pair<std::__hash_node_base<std::__hash_node<geo::TransitEdgePiece, void *> *>, std::allocator<std::__hash_node<geo::TransitEdgePiece, void *>>> *p_p1;
  unint64_t v14;
  unint64_t v15;
  unint64_t value;
  uint8x8_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  void *v25;
  char v26;
  float v27;
  float v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  int8x8_t prime;
  void **v33;
  void **v34;
  uint64_t v35;
  _QWORD *next;
  unint64_t v37;
  uint8x8_t v38;
  unint64_t v39;
  uint8x8_t v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  void **v44;
  void **v45;
  unint64_t v46;
  uint64_t v47;
  void **v48;

  if ((*(unsigned int (**)(_QWORD, SEL))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, a2) == 1)
  {
    v6 = *(_QWORD *)a3;
    v7 = *(_QWORD *)(*(_QWORD *)a3 + 48);
    if (*(_QWORD *)(*(_QWORD *)a3 + 56) != v7)
    {
      v8 = *(_QWORD *)(v6 + 72);
      v9 = (_QWORD *)(v7 + 8 * (v8 >> 7));
      v10 = *v9 + 32 * (v8 & 0x7F);
      v11 = *(_QWORD *)(v7 + (((*(_QWORD *)(v6 + 80) + v8) >> 4) & 0xFFFFFFFFFFFFFF8))
          + 32 * ((*(_QWORD *)(v6 + 80) + v8) & 0x7F);
      if (v10 != v11)
      {
        p_piecesConsidered = &self->_piecesConsidered;
        p_p1 = &self->_piecesConsidered.__table_.__p1_;
        while (1)
        {
          v14 = std::hash<geo::TransitEdgePiece>::operator()(v10);
          v15 = v14;
          value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v17.i16[0] = vaddlv_u8(v17);
            v18 = v17.u32[0];
            if (v17.u32[0] > 1uLL)
            {
              v3 = v14;
              if (v14 >= value)
                v3 = v14 % value;
            }
            else
            {
              v3 = (value - 1) & v14;
            }
            v19 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
            if (v19)
            {
              v20 = (_QWORD *)*v19;
              if (*v19)
              {
                do
                {
                  v21 = v20[1];
                  if (v21 == v15)
                  {
                    if (std::equal_to<geo::TransitEdgePiece>::operator()((uint64_t)(v20 + 2), v10))
                      return 1;
                  }
                  else
                  {
                    if (v18 > 1)
                    {
                      if (v21 >= value)
                        v21 %= value;
                    }
                    else
                    {
                      v21 &= value - 1;
                    }
                    if (v21 != v3)
                      break;
                  }
                  v20 = (_QWORD *)*v20;
                }
                while (v20);
              }
            }
          }
          v22 = operator new(0x30uLL);
          *v22 = 0;
          v22[1] = v15;
          v23 = *(id *)v10;
          v24 = *(_QWORD *)(v10 + 8);
          v25 = *(void **)(v10 + 16);
          v22[2] = v23;
          v22[3] = v24;
          v22[4] = v25;
          v26 = *(_BYTE *)(v10 + 28);
          *((_DWORD *)v22 + 10) = *(_DWORD *)(v10 + 24);
          *((_BYTE *)v22 + 44) = v26;
          v27 = (float)(p_piecesConsidered->__table_.__p2_.__value_ + 1);
          v28 = p_piecesConsidered->__table_.__p3_.__value_;
          if (!value || (float)(v28 * (float)value) < v27)
            break;
LABEL_67:
          v44 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
          v45 = (void **)p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
          if (v45)
          {
            *v22 = *v45;
LABEL_75:
            *v45 = v22;
            goto LABEL_76;
          }
          *v22 = p_p1->__value_.__next_;
          p_p1->__value_.__next_ = v22;
          v44[v3] = p_p1;
          if (*v22)
          {
            v46 = *(_QWORD *)(*v22 + 8);
            if ((value & (value - 1)) != 0)
            {
              if (v46 >= value)
                v46 %= value;
            }
            else
            {
              v46 &= value - 1;
            }
            v45 = &p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v46];
            goto LABEL_75;
          }
LABEL_76:
          ++p_piecesConsidered->__table_.__p2_.__value_;
          v10 += 32;
          if (v10 - *v9 == 4096)
          {
            v47 = v9[1];
            ++v9;
            v10 = v47;
          }
          if (v10 == v11)
            return 0;
        }
        v29 = (value & (value - 1)) != 0;
        if (value < 3)
          v29 = 1;
        v30 = v29 | (2 * value);
        v31 = vcvtps_u32_f32(v27 / v28);
        if (v30 <= v31)
          prime = (int8x8_t)v31;
        else
          prime = (int8x8_t)v30;
        if (*(_QWORD *)&prime == 1)
        {
          prime = (int8x8_t)2;
        }
        else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
        {
          prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        }
        value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (*(_QWORD *)&prime > value)
          goto LABEL_33;
        if (*(_QWORD *)&prime < value)
        {
          v39 = vcvtps_u32_f32((float)p_piecesConsidered->__table_.__p2_.__value_ / p_piecesConsidered->__table_.__p3_.__value_);
          if (value < 3 || (v40 = (uint8x8_t)vcnt_s8((int8x8_t)value), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
          {
            v39 = std::__next_prime(v39);
          }
          else
          {
            v41 = 1 << -(char)__clz(v39 - 1);
            if (v39 >= 2)
              v39 = v41;
          }
          if (*(_QWORD *)&prime <= v39)
            prime = (int8x8_t)v39;
          if (*(_QWORD *)&prime >= value)
          {
            value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime)
            {
LABEL_33:
              if (*(_QWORD *)&prime >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v33 = (void **)operator new(8 * *(_QWORD *)&prime);
              v34 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
              p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_ = v33;
              if (v34)
                operator delete(v34);
              v35 = 0;
              p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v35++] = 0;
              while (*(_QWORD *)&prime != v35);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                v37 = next[1];
                v38 = (uint8x8_t)vcnt_s8(prime);
                v38.i16[0] = vaddlv_u8(v38);
                if (v38.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v37] = p_p1;
                v42 = (_QWORD *)*next;
                if (*next)
                {
                  do
                  {
                    v43 = v42[1];
                    if (v38.u32[0] > 1uLL)
                    {
                      if (v43 >= *(_QWORD *)&prime)
                        v43 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v43 &= *(_QWORD *)&prime - 1;
                    }
                    if (v43 != v37)
                    {
                      if (!p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43])
                      {
                        p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43] = next;
                        goto LABEL_58;
                      }
                      *next = *v42;
                      *v42 = *(_QWORD *)p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43];
                      *(_QWORD *)p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43] = v42;
                      v42 = next;
                    }
                    v43 = v37;
LABEL_58:
                    next = v42;
                    v42 = (_QWORD *)*v42;
                    v37 = v43;
                  }
                  while (v42);
                }
              }
              value = (unint64_t)prime;
              goto LABEL_62;
            }
            v48 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
            p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v48)
              operator delete(v48);
            value = 0;
            p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
LABEL_62:
        if ((value & (value - 1)) != 0)
        {
          if (v15 >= value)
            v3 = v15 % value;
          else
            v3 = v15;
        }
        else
        {
          v3 = (value - 1) & v15;
        }
        goto LABEL_67;
      }
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  unordered_set<geo::TransitEdgePiece, std::hash<geo::TransitEdgePiece>, std::equal_to<geo::TransitEdgePiece>, std::allocator<geo::TransitEdgePiece>> *p_piecesConsidered;
  id *next;
  id *v4;
  void **value;

  p_piecesConsidered = &self->_piecesConsidered;
  next = (id *)self->_piecesConsidered.__table_.__p1_.__value_.__next_;
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
  value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
  p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
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

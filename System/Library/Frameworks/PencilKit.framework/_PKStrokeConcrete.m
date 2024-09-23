@implementation _PKStrokeConcrete

- (_PKStrokeConcrete)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  _PKStrokeConcrete *v7;
  void (**v9)(drawing::StrokeDelta *__hidden);
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v6 = a3;
  v9 = &off_1E77748D8;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (PKProtobufUtilitiesParseArchiveFromNSDataWithHeader<drawing::StrokeDelta>((uint64_t)&v9, v6, a4))
  {
    self = -[_PKStrokeConcrete initWithArchive:error:](self, "initWithArchive:error:", &v9, a4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v9);

  return v7;
}

- (_PKStrokeConcrete)initWithArchive:(const void *)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  PKInk *v12;
  PKInk *v13;
  uint64_t v14;
  void *v15;
  _PKStrokeConcrete *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 4, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2);
  if (v7)
  {
    v8 = 0;
    v9 = v7 >> 4;
    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    do
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *(_QWORD *)(*((_QWORD *)a3 + 2) + v8));
      objc_msgSend(v6, "addObject:", v11);

      v8 += 16;
      --v10;
    }
    while (v10);
  }
  v12 = -[PKInk initWithArchive:]([PKInk alloc], "initWithArchive:", *((_QWORD *)a3 + 1));
  v13 = v12;
  v14 = *((_QWORD *)a3 + 5);
  if (v14)
  {
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_PKStrokeConcrete initWithArchive:sortedUUIDs:inks:transientArchiveDictionary:](self, "initWithArchive:sortedUUIDs:inks:transientArchiveDictionary:", v14, v6, v15, 0);

  }
  else
  {

    v16 = 0;
  }

  return v16;
}

- (id)dataRepresentation
{
  void *v2;
  void (**v4)(drawing::StrokeDelta *__hidden);
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = &off_1E77748D8;
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  -[_PKStrokeConcrete saveToArchive:](self, "saveToArchive:", &v4);
  PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::StrokeDelta>((uint64_t)&v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v4);
  return v2;
}

- (void)saveToArchive:(void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  void *v27;
  unsigned __int8 v28[8];
  char *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E40];
  -[_PKStrokeConcrete ink](self, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithObject:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[_PKStrokeConcrete _sortID](self, "_sortID");
  v9 = (void *)objc_msgSend(v8, "initWithUUIDBytes:", &v28[4]);
  objc_msgSend(v5, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[_PKStrokeConcrete _version](self, "_version");
  v11 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", &v28[4]);
  objc_msgSend(v5, "addObject:", v11);

  drawing::StrokeDelta::makeInk(a3);
  -[_PKStrokeConcrete ink](self, "ink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "saveToArchive:", *((_QWORD *)a3 + 1));

  drawing::StrokeDelta::makeStroke(a3);
  -[_PKStrokeConcrete saveToArchive:sortedUUIDs:inks:withPathData:transient:](self, "saveToArchive:sortedUUIDs:inks:withPathData:transient:", *((_QWORD *)a3 + 5), v5, v27, 1, 0);
  v13 = objc_msgSend(v5, "count");
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = (char *)a3 + 16;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (_QWORD *)*((_QWORD *)a3 + 3);
      v18 = *((_QWORD *)a3 + 4);
      if ((unint64_t)v19 >= v18)
      {
        v21 = ((uint64_t)v19 - *v16) >> 4;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v23 = v18 - *v16;
        if (v23 >> 3 > v22)
          v22 = v23 >> 3;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
          v24 = 0xFFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        v30[2] = (char *)a3 + 32;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 32, v24);
        else
          v25 = 0;
        v26 = &v25[16 * v21];
        *(_QWORD *)v28 = v25;
        v29 = v26;
        v30[1] = &v25[16 * v24];
        *(_QWORD *)v26 = 0;
        *((_QWORD *)v26 + 1) = 0;
        v30[0] = v26 + 16;
        std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 2, v28);
        v20 = (_QWORD *)*((_QWORD *)a3 + 3);
        std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v28);
      }
      else
      {
        *v19 = 0;
        v19[1] = 0;
        v20 = v19 + 2;
        *((_QWORD *)a3 + 3) = v19 + 2;
      }
      *((_QWORD *)a3 + 3) = v20;
      *(_QWORD *)v28 = 0;
      v29 = 0;
      objc_msgSend(v17, "getUUIDBytes:", v28);
      PB::Data::assign((PB::Data *)(*v16 + v14), v28, (const unsigned __int8 *)v30);

      ++v15;
      v14 += 16;
    }
    while (v13 != v15);
  }

}

- (id)deltaTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  PKStrokeDelta *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _PKStrokeID v15;
  _PKStrokeID v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PKStrokeConcrete _strokeUUID](self, "_strokeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_strokeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
    goto LABEL_8;
  -[_PKStrokeConcrete _version](self, "_version");
  if (v4)
    objc_msgSend(v4, "_version");
  else
    memset(&v15, 0, sizeof(v15));
  v8 = _PKStrokeIDCompare(&v16, &v15);
  if (v8)
  {
    if (v8 == -1)
    {
      v9 = objc_alloc_init(PKStrokeDelta);
      -[PKStrokeDelta setDeltaStroke:](v9, "setDeltaStroke:", v4);
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[PKStroke _strokeData](self, "_strokeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_strokeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deltaTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v9 = objc_alloc_init(PKStrokeDelta);
    -[PKStrokeDelta setDeltaStrokeData:](v9, "setDeltaStrokeData:", v13);
    -[_PKStrokeConcrete _strokeUUID](self, "_strokeUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeDelta set_strokeUUID:](v9, "set_strokeUUID:", v14);

  }
  else
  {
    v9 = 0;
  }

LABEL_9:
  return v9;
}

- (id)strokeApplying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _PKStrokeConcrete *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _PKStrokeConcrete *v14;

  v4 = a3;
  -[_PKStrokeConcrete _strokeUUID](self, "_strokeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_strokeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v4, "deltaStroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "deltaStroke");
    v9 = (_PKStrokeConcrete *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = v9;
    goto LABEL_9;
  }
  objc_msgSend(v4, "deltaStrokeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  -[PKStroke _strokeData](self, "_strokeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deltaStrokeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataApplying:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_7:
    v9 = self;
    goto LABEL_8;
  }
  v14 = -[_PKStrokeConcrete copyForMutation](self, "copyForMutation");
  -[PKStroke set_strokeData:](v14, "set_strokeData:", v13);

LABEL_9:
  return v14;
}

- (_PKStrokeConcrete)init
{
  char *v2;
  PKStrokePath *v3;
  void *v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_PKStrokeConcrete;
  v2 = -[PKStroke init](&v15, sel_init);
  v3 = objc_alloc_init(PKStrokePath);
  v4 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = v3;

  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v2 + 24) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v2 + 40) = v5;
  v6 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *((_OWORD *)v2 + 10) = *MEMORY[0x1E0C9BAA8];
  *((_OWORD *)v2 + 11) = v8;
  *((_OWORD *)v2 + 12) = v7;
  v10 = v6[1];
  v9 = v6[2];
  *((_OWORD *)v2 + 13) = *v6;
  *((_OWORD *)v2 + 14) = v10;
  *((_OWORD *)v2 + 15) = v9;
  v11 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = MEMORY[0x1E0C9AA60];

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v2 + 9);
  *((_QWORD *)v2 + 9) = v12;

  return (_PKStrokeConcrete *)v2;
}

- (_PKStrokeConcrete)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  void *v10;
  unint64_t var1;
  id v14;
  id v15;
  id v16;
  CGAffineTransform *v17;
  void *v18;
  __int128 v19;
  _PKStrokeConcrete *v20;
  _OWORD v22[3];
  int v23;
  __int128 v24;
  int v25;
  int v26;
  __int128 v27;
  int v28;
  int v29;
  __int128 v30;
  int v31;
  __int128 v32;
  uint64_t v33;

  v10 = (void *)*(&a5.var0.var1 + 1);
  var1 = a5.var0.var1;
  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = v10;
  v17 = a7;
  v32 = 0uLL;
  objc_msgSend(MEMORY[0x1E0CB3A28], "PK_zero");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getUUIDBytes:", &v32);

  v28 = 0;
  v29 = 0;
  v30 = v32;
  v31 = 0;
  v25 = 0;
  v26 = 0;
  v27 = v32;
  v19 = *((_OWORD *)a6 + 1);
  v22[0] = *(_OWORD *)a6;
  v22[1] = v19;
  v22[2] = *((_OWORD *)a6 + 2);
  v23 = 0;
  v24 = v32;
  v20 = -[_PKStrokeConcrete initWithData:id:sortID:flags:version:ink:transform:substrokes:substrokesVersion:](self, "initWithData:id:sortID:flags:version:ink:transform:substrokes:substrokesVersion:", v14, v15, &v29, var1, &v26, v16, v22, v17, &v23);

  return v20;
}

- (_PKStrokeConcrete)initWithData:(id)a3 id:(id)a4 sortID:(_PKStrokeID *)a5 flags:(id)a6 version:(_PKStrokeID *)a7 ink:(id)a8 transform:(CGAffineTransform *)a9 substrokes:(id)a10 substrokesVersion:(_PKStrokeID *)a11
{
  __int128 *v12;
  char *v17;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  float64x2_t v23;
  __int128 v24;
  void *v25;
  void *v26;
  unint64_t var1;
  CGAffineTransform *v29;
  id v30;
  id v31;
  _PKStrokeID *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;

  v12 = (__int128 *)*(&a6.var0.var1 + 1);
  var1 = a6.var0.var1;
  v31 = a3;
  v30 = a4;
  v32 = a7;
  v29 = a9;
  v36.receiver = self;
  v36.super_class = (Class)_PKStrokeConcrete;
  v17 = -[PKStroke init](&v36, sel_init);
  v19 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v17 + 24) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v17 + 40) = v19;
  objc_storeStrong((id *)v17 + 7, a7);
  *((_QWORD *)v17 + 8) = var1;
  objc_storeStrong((id *)v17 + 9, a4);
  objc_storeStrong((id *)v17 + 10, a3);
  v20 = *((_QWORD *)a10 + 2);
  *(_OWORD *)(v17 + 88) = *(_OWORD *)a10;
  *((_QWORD *)v17 + 13) = v20;
  objc_storeStrong((id *)v17 + 14, a9);
  v21 = *v12;
  *((_QWORD *)v17 + 39) = *((_QWORD *)v12 + 2);
  *(_OWORD *)(v17 + 296) = v21;
  v22 = *(_OWORD *)&a5->clock;
  *((_QWORD *)v17 + 36) = *(_QWORD *)&a5->replicaUUID[12];
  *((_OWORD *)v17 + 17) = v22;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)a8), (int8x16_t)vcgezq_f64(*(float64x2_t *)a8)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*((float64x2_t *)a8 + 1)), (int8x16_t)vcgezq_f64(*((float64x2_t *)a8 + 1))))))) & 1) != 0)a8 = (id)MEMORY[0x1E0C9BAA8];
  v23 = *(float64x2_t *)a8;
  v24 = *((_OWORD *)a8 + 2);
  *((_OWORD *)v17 + 11) = *((_OWORD *)a8 + 1);
  *((_OWORD *)v17 + 12) = v24;
  *((float64x2_t *)v17 + 10) = v23;
  -[_PKStrokeID behavior](v32, "behavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "inkTransform");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
  }
  *((_OWORD *)v17 + 13) = v33;
  *((_OWORD *)v17 + 14) = v34;
  *((_OWORD *)v17 + 15) = v35;

  return (_PKStrokeConcrete *)v17;
}

- (_PKStrokeConcrete)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_PKStrokeID *)a5 ink:(id)a6 transform:(CGAffineTransform *)a7
{
  _BOOL4 v10;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  _PKStrokeConcrete *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _QWORD v30[3];
  __int128 v31;
  uint64_t v32;
  _QWORD v33[4];

  v10 = a4;
  v33[3] = *MEMORY[0x1E0C80C00];
  v12 = (uint64_t *)a3;
  v13 = a6;
  v14 = objc_msgSend(v12, "_flags");
  objc_msgSend(v12, "_strokeData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_strokeUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v12, "_sortID");
  else
    memset(v33, 0, 24);
  v31 = *(_OWORD *)&a5->clock;
  v32 = *(_QWORD *)&a5->replicaUUID[12];
  v17 = *(_OWORD *)&a7->c;
  v29[0] = *(_OWORD *)&a7->a;
  v29[1] = v17;
  v29[2] = *(_OWORD *)&a7->tx;
  objc_msgSend(v12, "_substrokes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v12, "_substrokesVersion");
  else
    memset(v30, 0, sizeof(v30));
  v19 = -[_PKStrokeConcrete initWithData:id:sortID:flags:version:ink:transform:substrokes:substrokesVersion:](self, "initWithData:id:sortID:flags:version:ink:transform:substrokes:substrokesVersion:", v15, v16, v33, v14 | v10, &v31, v13, v29, v18, v30);

  objc_msgSend(v12, "_clipPlane");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _setClipPlane:](v19, "_setClipPlane:", v20);

  objc_msgSend(v12, "_strokeMask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _setStrokeMask:](v19, "_setStrokeMask:", v21);

  objc_msgSend(v12, "_renderMask");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStroke _setRenderMask:](v19, "_setRenderMask:", v22);

  objc_msgSend(v12, "_groupID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _setGroupID:](v19, "_setGroupID:", v23);

  objc_msgSend(v12, "_renderGroupID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _setRenderGroupID:](v19, "_setRenderGroupID:", v24);

  -[_PKStrokeConcrete _setShapeType:](v19, "_setShapeType:", objc_msgSend(v12, "_shapeType"));
  if (v12)
  {
    objc_msgSend(v12, "_inkTransform");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }
  *(_OWORD *)&v19->_transform.ty = v26;
  *(_OWORD *)&v19->_inkTransform.b = v27;
  *(_OWORD *)&v19->_inkTransform.d = v28;
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v19->_unknownFields.__ptr_, v12 + 1);

  return v19;
}

- (_PKStrokeConcrete)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6 randomSeed:(unsigned int)a7
{
  id v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  PKStrokeMask *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  CGRect v32;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v31.receiver = self;
  v31.super_class = (Class)_PKStrokeConcrete;
  v16 = -[PKStroke init](&v31, sel_init);
  objc_storeStrong((id *)v16 + 7, a3);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v16 + 9);
  *((_QWORD *)v16 + 9) = v17;

  objc_storeStrong((id *)v16 + 10, a4);
  v19 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v16 + 24) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v16 + 40) = v19;
  v20 = (void *)*((_QWORD *)v16 + 14);
  *((_QWORD *)v16 + 14) = MEMORY[0x1E0C9AA60];

  v22 = *(_OWORD *)&a5->c;
  v21 = *(_OWORD *)&a5->tx;
  *((_OWORD *)v16 + 10) = *(_OWORD *)&a5->a;
  *((_OWORD *)v16 + 11) = v22;
  *((_OWORD *)v16 + 12) = v21;
  objc_msgSend(v13, "behavior");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "inkTransform");
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
  }
  *((_OWORD *)v16 + 13) = v28;
  *((_OWORD *)v16 + 14) = v29;
  *((_OWORD *)v16 + 15) = v30;

  if (v15)
  {
    if ((objc_msgSend(v15, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v15, "bounds");
      if (!CGRectIsEmpty(v32))
      {
        v25 = -[PKStrokeMask initWithBezierPath:stroke:]([PKStrokeMask alloc], "initWithBezierPath:stroke:", v15, v16);
        v26 = (void *)*((_QWORD *)v16 + 16);
        *((_QWORD *)v16 + 16) = v25;

      }
    }
  }
  *((_QWORD *)v16 + 8) = *((_QWORD *)v16 + 8) & 0xFFFFFFC00000001FLL | (32 * a7) | 0x2000000000;

  return (_PKStrokeConcrete *)v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PKMutableStroke *v4;
  _BOOL8 v5;
  void *v6;
  PKMutableStroke *v7;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = [PKMutableStroke alloc];
  v5 = -[PKStroke _isHidden](self, "_isHidden");
  -[_PKStrokeConcrete _version](self, "_version");
  -[_PKStrokeConcrete ink](self, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStroke transform](self, "transform");
  v7 = -[_PKStrokeConcrete initWithStroke:hidden:version:ink:transform:](v4, "initWithStroke:hidden:version:ink:transform:", self, v5, v10, v6, &v9);

  return v7;
}

- (id)copyForMutation
{
  _PKStrokeConcrete *v3;
  _BOOL8 v4;
  void *v5;
  _PKStrokeConcrete *v6;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = [_PKStrokeConcrete alloc];
  v4 = -[PKStroke _isHidden](self, "_isHidden");
  -[_PKStrokeConcrete _version](self, "_version");
  -[_PKStrokeConcrete ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStroke transform](self, "transform");
  v6 = -[_PKStrokeConcrete initWithStroke:hidden:version:ink:transform:](v3, "initWithStroke:hidden:version:ink:transform:", self, v4, v9, v5, &v8);

  return v6;
}

- (id)copyForSubstroke
{
  id v3;
  void *v4;

  v3 = -[_PKStrokeConcrete copyForMutation](self, "copyForMutation");
  objc_msgSend(v3, "_setFlags:", -[_PKStrokeConcrete _flags](self, "_flags") & 0x1FFFFFFFE0 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x2000000000 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x10000000000 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x80000000000 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x100000000000 | 0xE);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setStrokeUUID:", v4);

  return v3;
}

- (id)parentStrokeForInsertionInDrawing:(id)a3
{
  id v4;
  void *v5;
  _PKStrokeConcrete *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  _PKStrokeConcrete *v11;
  _OWORD v13[3];
  int v14;
  __int128 v15;
  int v16;
  int v17;
  __int128 v18;
  int v19;
  _BYTE v20[24];
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0uLL;
  objc_msgSend(v4, "replicaUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", &v21);

  v6 = [_PKStrokeConcrete alloc];
  -[PKStroke _strokeData](self, "_strokeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _sortID](self, "_sortID");
  v17 = 0;
  v18 = v21;
  v19 = 0;
  -[_PKStrokeConcrete ink](self, "ink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v10;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v14 = 0;
  v15 = v21;
  v16 = 0;
  v11 = -[_PKStrokeConcrete initWithData:id:sortID:flags:version:ink:transform:substrokes:substrokesVersion:](v6, "initWithData:id:sortID:flags:version:ink:transform:substrokes:substrokesVersion:", v7, v8, v20, 0, &v17, v9, v13, MEMORY[0x1E0C9AA60], &v14);

  return v11;
}

- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4
{
  PKStrokeProviderSliceIdentifierConcrete *v7;
  void *v8;
  PKStrokeProviderSliceIdentifierConcrete *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v7 = [PKStrokeProviderSliceIdentifierConcrete alloc];
  -[_PKStrokeConcrete _strokeUUID](self, "_strokeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _version](self, "_version");
  v9 = -[PKStrokeProviderSliceIdentifierConcrete initWithUUID:version:tStart:tEnd:](v7, "initWithUUID:version:tStart:tEnd:", v8, v11, a3, a4);

  return v9;
}

- (id)ink
{
  return self->_ink;
}

- (void)setInk:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_ink, a3);
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "inkTransform");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  *(_OWORD *)&self->_transform.ty = v8;
  *(_OWORD *)&self->_inkTransform.b = v9;
  *(_OWORD *)&self->_inkTransform.d = v10;

}

- (id)path
{
  return self->_strokeUUID;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_strokeUUID, a3);
}

- (id)_strokeMask
{
  return self->_clipPlane;
}

- (void)_setStrokeMask:(id)a3
{
  objc_storeStrong((id *)&self->_clipPlane, a3);
}

- ($4CB05A214F79A85768ACD038E8951CD9)_flags
{
  unint64_t allFlags;
  $4CB05A214F79A85768ACD038E8951CD9 result;

  allFlags = self->_flags.var0.allFlags;
  *(&result.var0.var1 + 1) = (unint64_t)a2;
  result.var0.var1 = allFlags;
  return result;
}

- (void)_setFlags:(id)a3
{
  self->_flags.var0.allFlags = a3.var0.var1;
}

- (id)_groupID
{
  return self->_strokeMask;
}

- (void)_setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_strokeMask, a3);
}

- (int64_t)_shapeType
{
  return (int64_t)self->_renderGroupID;
}

- (id)_renderGroupID
{
  return self->_groupID;
}

- (void)_setRenderGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (void)_setShapeType:(int64_t)a3
{
  self->_renderGroupID = (NSUUID *)a3;
}

- (void)_setClipPlane:(id)a3
{
  objc_storeStrong((id *)&self->_substrokes, a3);
}

- (id)_clipPlane
{
  return self->_substrokes;
}

- (CGAffineTransform)_transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].a;
  return self;
}

- (CGAffineTransform)_inkTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].a;
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_shapeType = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.b = v4;
  *(_OWORD *)&self->_transform.d = v3;
  -[_PKStrokeConcrete _invalidateBounds](self, "_invalidateBounds");
}

- (void)_setInkTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.ty = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_inkTransform.b = v4;
  *(_OWORD *)&self->_inkTransform.d = v3;
  -[_PKStrokeConcrete _invalidateBounds](self, "_invalidateBounds");
}

- (id)copyWithNewAnchorPointForTexture:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id result;

  y = a3.y;
  x = a3.x;
  result = -[_PKStrokeConcrete copyForMutation](self, "copyForMutation");
  *((CGFloat *)result + 32) = x;
  *((CGFloat *)result + 33) = y;
  return result;
}

- (CGPoint)_anchorPointForTexture
{
  double ty;
  double x;
  CGPoint result;

  ty = self->_inkTransform.ty;
  x = self->_anchorPointForTexture.x;
  result.y = x;
  result.x = ty;
  return result;
}

- (BOOL)hasSubstrokes
{
  void *v2;
  BOOL v3;

  -[_PKStrokeConcrete _substrokes](self, "_substrokes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_strokeUUID
{
  return *((id *)&self->_flags.var0.allFlags + 1);
}

- (void)_setStrokeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_flags.var0.allFlags + 1, a3);
}

- (BOOL)_isFullyHidden
{
  return -[PKStroke _visibleSubstrokeCountInDrawing:](self, "_visibleSubstrokeCountInDrawing:", 0) == 0;
}

- (BOOL)isEqual:(id)a3
{
  _PKStrokeConcrete *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform t1;
  _QWORD v19[2];
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (_PKStrokeConcrete *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)*(&self->_flags.var0.allFlags + 1);
      -[_PKStrokeConcrete _strokeUUID](v4, "_strokeUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
      {
        v21 = *(_OWORD *)&self->_sortID.replicaUUID[12];
        v22 = *(_QWORD *)&self->_version.replicaUUID[4];
        if (v4)
        {
          -[_PKStrokeConcrete _version](v4, "_version");
          v7 = v19[0];
        }
        else
        {
          v7 = 0;
          v19[0] = 0;
          v19[1] = 0;
          v20 = 0;
        }
        if ((_DWORD)v21 == v7 && !uuid_compare((const unsigned __int8 *)&v21 + 4, (const unsigned __int8 *)v19 + 4))
        {
          v10 = HIDWORD(v22) == HIDWORD(v20);

          if (v10)
          {
            if ((*(_BYTE *)&self->_flags.var0.var0 & 0xE) != 0)
            {
              v11 = -[PKStroke _isHidden](self, "_isHidden");
              if (v11 != -[PKStroke _isHidden](v4, "_isHidden"))
                goto LABEL_12;
              -[_PKStrokeConcrete ink](self, "ink");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PKStrokeConcrete ink](v4, "ink");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v12, "isEqualUnweightedInk:", v13) & 1) == 0)
              {

                goto LABEL_12;
              }
              -[_PKStrokeConcrete _transform](self, "_transform");
              if (v4)
                -[_PKStrokeConcrete _transform](v4, "_transform");
              else
                memset(&v17, 0, sizeof(v17));
              v14 = CGAffineTransformEqualToTransform(&t1, &v17);

              if (!v14)
                goto LABEL_12;
            }
            -[PKStroke _strokeDataUUID](self, "_strokeDataUUID", *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKStroke _strokeDataUUID](v4, "_strokeDataUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v15, "isEqual:", v16);

            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      else
      {

      }
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (void)didUpdateInDrawing:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  _BYTE v8[24];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PKStrokeConcrete _version](self, "_version");
  objc_msgSend(v4, "replicaUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDrawingConcrete newStrokeIDGreaterThan:forUUID:](PKDrawingConcrete, "newStrokeIDGreaterThan:forUUID:", v8, v5);
  v6 = v9;
  v7 = v10;
  -[_PKStrokeConcrete set_version:](self, "set_version:", &v6);

}

- (void)didUpdateSubstrokesInDrawing:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  _BYTE v8[24];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PKStrokeConcrete _substrokesVersion](self, "_substrokesVersion");
  objc_msgSend(v4, "replicaUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDrawingConcrete newStrokeIDGreaterThan:forUUID:](PKDrawingConcrete, "newStrokeIDGreaterThan:forUUID:", v8, v5);
  v6 = v9;
  v7 = v10;
  -[_PKStrokeConcrete set_substrokesVersion:](self, "set_substrokesVersion:", &v6);

}

- (id)_substrokesInDrawing:(id)a3
{
  return *(id *)&self->_substrokesVersion.replicaUUID[12];
}

- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = -[_PKStrokeConcrete copyForMutation](self, "copyForMutation");
  objc_msgSend(v8, "_setSubstrokes:", v6);
  objc_msgSend(v8, "didUpdateSubstrokesInDrawing:", v7);

  return v8;
}

- (void)_setSubstrokes:(id)a3
{
  objc_storeStrong((id *)&self->_substrokesVersion.replicaUUID[12], a3);
}

- (CGRect)renderBounds
{
  _PKStrokeConcrete *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  _PKStrokeConcrete *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  v2 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
  x = v2->_cachedBounds.origin.x;
  y = v2->_cachedBounds.origin.y;
  width = v2->_cachedBounds.size.width;
  height = v2->_cachedBounds.size.height;

  os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (CGRectIsNull(v16))
  {
    -[PKStroke _calculateBounds](v2, "_calculateBounds");
    x = v7;
    y = v8;
    width = v9;
    height = v10;
    v11 = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
    v11->_cachedBounds.origin.x = x;
    v11->_cachedBounds.origin.y = y;
    v11->_cachedBounds.size.width = width;
    v11->_cachedBounds.size.height = height;

    os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _PKStrokeConcrete *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
  v7->_cachedBounds.origin.x = x;
  v7->_cachedBounds.origin.y = y;
  v7->_cachedBounds.size.width = width;
  v7->_cachedBounds.size.height = height;

  os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
}

- (void)_invalidateBounds
{
  CGFloat v2;
  CGFloat v3;
  _PKStrokeConcrete *v4;
  CGPoint v5;

  v5 = (CGPoint)*MEMORY[0x1E0C9D628];
  v2 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
  v4->_cachedBounds.origin = v5;
  v4->_cachedBounds.size.width = v2;
  v4->_cachedBounds.size.height = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
}

- (int64_t)compareToStroke:(id)a3
{
  id v4;
  int64_t v5;
  _PKStrokeID v7;
  _PKStrokeID v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PKStrokeConcrete _sortID](self, "_sortID");
  if (v4)
    objc_msgSend(v4, "_sortID");
  else
    memset(&v7, 0, sizeof(v7));
  v5 = _PKStrokeIDCompare(&v8, &v7);

  return v5;
}

- (id)_updateStroke:(id)a3 inDrawing:(id)a4
{
  void (**v6)(id, _PKStrokeConcrete *, _BYTE *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  unsigned __int8 v22;

  v6 = (void (**)(id, _PKStrokeConcrete *, _BYTE *))a3;
  v7 = a4;
  v22 = 0;
  v6[2](v6, self, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v22 && objc_msgSend(v8, "hasSubstrokes"))
  {
    objc_msgSend(v9, "_substrokesInDrawing:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    if (v11 < 1)
    {
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v22)
        {
          v17 = v15;
          v18 = 1;
        }
        else
        {
          objc_msgSend(v15, "_updateStroke:inDrawing:", v6, v7);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v22;
        }
        v13 |= v17 != v16;
        if (v18 && (v13 & 1) == 0)
        {

          goto LABEL_18;
        }
        if (v12 == 0 && (v13 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v19;
          if (i)
            objc_msgSend(v19, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v10, 0, i);
        }
        objc_msgSend(v12, "addObject:", v17);

      }
      if ((v13 & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v9, "copyForMutation");

        objc_msgSend(v20, "set_substrokes:", v12);
        v9 = v20;
      }
    }
LABEL_18:

  }
  return v9;
}

- (id)mergeArrayOfStrokes:(id)a3 with:(id)a4 inDrawing:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  if (v10 == objc_msgSend(v7, "count"))
  {
    v11 = objc_msgSend(v7, "count");
    if (v11 >= 1)
    {
      v12 = 0;
      v13 = 0;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_mergeWithStroke:inDrawing:", v15, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 && v16 != v17)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v12 = v18;
            if (!v18)
              goto LABEL_10;
LABEL_9:
            objc_msgSend(v12, "addObject:", v16);
            goto LABEL_10;
          }
          v12 = v18;
          objc_msgSend(v18, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v7, 0, v13);
        }
        if (v12)
          goto LABEL_9;
LABEL_10:

        if (v11 == ++v13)
          goto LABEL_19;
      }
    }
    v12 = 0;
LABEL_19:
    if (v12)
      v22 = v12;
    else
      v22 = v7;
    v21 = v22;

  }
  else
  {
    v19 = objc_msgSend(v8, "count");
    if (v19 >= objc_msgSend(v7, "count"))
      v20 = v7;
    else
      v20 = v8;
    v21 = v20;
  }

  return v21;
}

- (id)_mergeWithStroke:(id)a3 inDrawing:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[_PKStrokeConcrete _mergeUnparentedWithStroke:inDrawing:](self, "_mergeUnparentedWithStroke:inDrawing:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateWithParent:inDrawing:", 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_updateWithParent:(id)a3 inDrawing:(id)a4
{
  id v6;
  id v7;
  _PKStrokeConcrete *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v29;
  _OWORD v30[6];
  CGAffineTransform t2;
  CGAffineTransform t1;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v8;
  v29 = v6;
  if (v6)
  {
    if ((-[_PKStrokeConcrete _flags](v8, "_flags") & 8) != 0)
    {
      if (v9)
        objc_msgSend(v9, "_transform");
      else
        memset(&t1, 0, sizeof(t1));
      objc_msgSend(v6, "_transform");
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        if ((objc_msgSend(v9, "_isNewCopy") & 1) == 0)
        {
          v10 = (void *)objc_msgSend(v9, "copyForMutation");

          v9 = v10;
          objc_msgSend(v10, "_setIsNewCopy:", 1);
        }
        objc_msgSend(v6, "_transform");
        v30[0] = v30[3];
        v30[1] = v30[4];
        v30[2] = v30[5];
        objc_msgSend(v9, "_setTransform:", v30);
      }
    }
    if ((objc_msgSend(v9, "_flags") & 4) != 0)
    {
      objc_msgSend(v6, "ink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ink");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) == 0)
      {
        if ((objc_msgSend(v9, "_isNewCopy") & 1) == 0)
        {
          v14 = (void *)objc_msgSend(v9, "copyForMutation");

          v9 = v14;
          objc_msgSend(v14, "_setIsNewCopy:", 1);
        }
        objc_msgSend(v6, "ink");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setInk:", v15);

      }
    }
  }
  objc_msgSend(v9, "_substrokesInDrawing:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17 < 1)
  {
    v20 = 0;
    goto LABEL_30;
  }
  v18 = 0;
  LOBYTE(v19) = 0;
  v20 = 0;
  do
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_updateWithParent:inDrawing:", v9, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v19 = 1;
      if (v20)
        goto LABEL_24;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v22 != v23;

      if (v20)
        goto LABEL_24;
    }
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v24;
      if (v18)
        objc_msgSend(v24, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v16, 0, v18);
    }
LABEL_24:
    objc_msgSend(v20, "addObject:", v22);

    ++v18;
  }
  while (v17 != v18);
  if (!v19)
  {
LABEL_30:
    v25 = v29;
    goto LABEL_31;
  }
  v25 = v29;
  if ((objc_msgSend(v9, "_isNewCopy") & 1) == 0)
  {
    v26 = objc_msgSend(v9, "copyForMutation");

    v9 = (void *)v26;
  }
  objc_msgSend(v9, "set_substrokes:", v20);
LABEL_31:
  objc_msgSend(v9, "_setIsNewCopy:", 0);
  v27 = v9;

  return v27;
}

- (id)_mergeUnparentedWithStroke:(id)a3 inDrawing:(id)a4
{
  _PKStrokeConcrete *v6;
  id v7;
  _PKStrokeConcrete *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  _PKStrokeConcrete *v23;
  _PKStrokeConcrete *v24;
  uint64_t v25;
  void *v26;
  _PKStrokeConcrete *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  _PKStrokeID v42;
  _PKStrokeID v43;
  _PKStrokeID v44;
  _PKStrokeID v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (_PKStrokeConcrete *)a3;
  v7 = a4;
  v8 = self;
  -[_PKStrokeConcrete _strokeUUID](v8, "_strokeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKStrokeConcrete _strokeUUID](v6, "_strokeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "PK_compare:", v10);

  v12 = v8;
  if (v11 == -1)
  {
    v12 = -[_PKStrokeConcrete copyForMutation](v8, "copyForMutation");

    -[_PKStrokeConcrete _strokeUUID](v6, "_strokeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setStrokeUUID:", v13);

  }
  -[_PKStrokeConcrete _version](v8, "_version");
  if (v6)
    -[_PKStrokeConcrete _version](v6, "_version");
  else
    memset(&v44, 0, sizeof(v44));
  v14 = _PKStrokeIDCompare(&v45, &v44);
  -[_PKStrokeConcrete _substrokesVersion](v8, "_substrokesVersion");
  if (v6)
    -[_PKStrokeConcrete _substrokesVersion](v6, "_substrokesVersion");
  else
    memset(&v42, 0, sizeof(v42));
  v15 = _PKStrokeIDCompare(&v43, &v42);
  if (!v15)
  {
    -[_PKStrokeConcrete _substrokes](v8, "_substrokes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKStrokeConcrete _substrokes](v6, "_substrokes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKStrokeConcrete mergeArrayOfStrokes:with:inDrawing:](v8, "mergeArrayOfStrokes:with:inDrawing:", v18, v19, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PKStrokeConcrete _substrokes](v8, "_substrokes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20 == v21;

    if (v14 == -1)
      v23 = v6;
    else
      v23 = v8;
    if (v22)
    {
      v24 = v23;

    }
    else
    {
      v24 = -[_PKStrokeConcrete copyForMutation](v23, "copyForMutation");

      -[_PKStrokeConcrete set_substrokes:](v24, "set_substrokes:", v20);
      -[PKStroke _setIsNewCopy:](v24, "_setIsNewCopy:", 1);
    }
    v12 = v24;
    goto LABEL_29;
  }
  if (v14 != 1)
  {
    if (v14 == -1)
    {
      if (v15 != -1)
      {
        v16 = -[_PKStrokeConcrete copyForMutation](v6, "copyForMutation");

        -[_PKStrokeConcrete _substrokes](v8, "_substrokes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "set_substrokes:", v17);

        -[_PKStrokeConcrete _substrokesVersion](v8, "_substrokesVersion");
        v38 = v40;
        v39 = v41;
        objc_msgSend(v16, "set_substrokesVersion:", &v38);
        v12 = v16;
        objc_msgSend(v16, "_setIsNewCopy:", 1);
        goto LABEL_30;
      }
      goto LABEL_25;
    }
    if (v15 == -1)
    {
LABEL_25:
      v27 = v6;
      goto LABEL_26;
    }
    if (v15 != 1)
      goto LABEL_30;
LABEL_24:
    v27 = v8;
LABEL_26:
    v20 = v12;
    v12 = v27;
LABEL_29:

    goto LABEL_30;
  }
  if (v15 == 1)
    goto LABEL_24;
  v25 = -[_PKStrokeConcrete copyForMutation](v8, "copyForMutation");

  v12 = (id)v25;
  -[_PKStrokeConcrete _substrokes](v6, "_substrokes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set_substrokes:", v26);

  if (v6)
  {
    -[_PKStrokeConcrete _substrokesVersion](v6, "_substrokesVersion");
  }
  else
  {
    v36 = 0uLL;
    v37 = 0;
  }
  v34 = v36;
  v35 = v37;
  objc_msgSend(v12, "set_substrokesVersion:", &v34);
  objc_msgSend(v12, "_setIsNewCopy:", 1);
LABEL_30:
  objc_msgSend(v12, "_strokeData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "_immutablePointsCount");
  -[PKStroke _strokeData](v6, "_strokeData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = v29 < objc_msgSend(v30, "_immutablePointsCount");

  if ((_DWORD)v29)
  {
    if ((objc_msgSend(v12, "_isNewCopy") & 1) == 0)
    {
      v31 = (void *)objc_msgSend(v12, "copyForMutation");

      v12 = v31;
      objc_msgSend(v31, "_setIsNewCopy:", 1);
    }
    -[PKStroke _strokeData](v6, "_strokeData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "set_strokeData:", v32);

  }
  return v12;
}

- (void)_addTestDataToUnknownFields
{
  PKProtobufUnknownFields *v3;
  shared_ptr<PKProtobufUnknownFields> *p_unknownFields;
  PB::Writer **v5;
  PB::Writer **ptr;
  PB::Writer **v7;

  v3 = (PKProtobufUnknownFields *)operator new();
  PKProtobufUnknownFields::PKProtobufUnknownFields(v3);
  v7 = (PB::Writer **)v3;
  p_unknownFields = &self->_unknownFields;
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]<PKProtobufUnknownFields,std::default_delete<PKProtobufUnknownFields>,void>(p_unknownFields, (uint64_t *)&v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    std::unique_ptr<PB::Writer>::reset[abi:ne180100](v5, 0);
    MEMORY[0x1C3B7F770](v5, 0x1020C40EDED9539);
  }
  ptr = (PB::Writer **)p_unknownFields->__ptr_;
  arc4random_uniform(0x186A0u);
  PB::Writer::writeVarInt(*ptr);
}

- (id)_dataInUnknownFields
{
  PKProtobufUnknownFields *ptr;
  _QWORD *v3;
  void *v4;

  ptr = self->_unknownFields.__ptr_;
  if (ptr && (v3 = *(_QWORD **)ptr) != 0 && *v3 != v3[1])
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (_PKStrokeID)_sortID
{
  *retstr = *(_PKStrokeID *)((char *)self + 272);
  return self;
}

- (void)set_sortID:(_PKStrokeID *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_anchorPointForTexture.y = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_sortID.replicaUUID[4] = v3;
}

- (_PKStrokeID)_version
{
  *retstr = *(_PKStrokeID *)((char *)self + 296);
  return self;
}

- (void)set_version:(_PKStrokeID *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_sortID.replicaUUID[12] = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_version.replicaUUID[4] = v3;
}

- (NSArray)_substrokes
{
  return *(NSArray **)&self->_substrokesVersion.replicaUUID[12];
}

- (void)set_substrokes:(id)a3
{
  objc_storeStrong((id *)&self->_substrokesVersion.replicaUUID[12], a3);
}

- (_PKStrokeID)_substrokesVersion
{
  *retstr = *(_PKStrokeID *)((char *)self + 88);
  return self;
}

- (void)set_substrokesVersion:(_PKStrokeID *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_strokeData = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_substrokesVersion.replicaUUID[4] = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_strokeMask, 0);
  objc_storeStrong((id *)&self->_clipPlane, 0);
  objc_storeStrong((id *)&self->_substrokes, 0);
  objc_storeStrong((id *)&self->_substrokesVersion.replicaUUID[12], 0);
  objc_storeStrong((id *)&self->_strokeUUID, 0);
  objc_storeStrong((id *)&self->_flags.var0.allFlags + 1, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_unknownFields);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_PKStrokeConcrete)initWithArchive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 transientArchiveDictionary:(id)a6
{
  return -[_PKStrokeConcrete initWithArchive:sortedUUIDs:inks:parent:isHidden:transientArchiveDictionary:](self, "initWithArchive:sortedUUIDs:inks:parent:isHidden:transientArchiveDictionary:", a3, a4, a5, 0, 0, a6);
}

- (_PKStrokeConcrete)initWithArchive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 parent:(id)a6 isHidden:(BOOL)a7 transientArchiveDictionary:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  _PKStrokeConcrete *v19;
  _PKStrokeConcrete *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  char v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  const drawing::Rectangle *v32;
  int8x16_t *v33;
  __int128 v34;
  float32x2_t *v35;
  float32x2_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  float32x4_t v40;
  int8x16_t v41;
  unint64_t v42;
  int8x16_t v43;
  int8x16_t v44;
  float32x2_t *v45;
  float32x2_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  float32x4_t v50;
  int8x16_t v51;
  unint64_t v52;
  int8x16_t v53;
  int8x16_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  _PKStrokeConcrete *v63;
  uint64_t v64;
  uint64_t v65;
  _PKStrokeConcrete *v66;
  void *v67;
  PKStrokeMask *v68;
  uint64_t *v69;
  uint64_t v70;
  NSObject *v71;
  id v73;
  _OWORD v74[3];
  _OWORD v75[6];
  _OWORD v76[3];
  _OWORD v77[3];
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  uint8_t buf[4];
  unint64_t v83;
  float v84;
  float v85;
  float v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v73 = a6;
  v16 = a8;
  v17 = *((_QWORD *)a3 + 22);
  if (!v17 || (v18 = *(_QWORD *)(v17 + 16), v18 > objc_msgSend(v14, "count")))
  {
    v19 = 0;
    goto LABEL_73;
  }
  v20 = -[_PKStrokeConcrete init](self, "init");
  if (!v20)
    goto LABEL_67;
  if (*((_QWORD *)a3 + 15))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", **((_QWORD **)a3 + 15));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_PKStrokeConcrete _setStrokeUUID:](v20, "_setStrokeUUID:", v21);

  v22 = *((_QWORD *)a3 + 13);
  if (v22)
  {
    -[_PKStrokeConcrete readStrokeIDFromArchive:withSortedUUIDs:](v20, "readStrokeIDFromArchive:withSortedUUIDs:", v22, v14);
    v91 = v93;
    v92 = v94;
    -[_PKStrokeConcrete set_sortID:](v20, "set_sortID:", &v91);
  }
  v23 = *((_QWORD *)a3 + 22);
  if (v23)
  {
    -[_PKStrokeConcrete readStrokeIDFromArchive:withSortedUUIDs:](v20, "readStrokeIDFromArchive:withSortedUUIDs:", v23, v14);
    v87 = v89;
    v88 = v90;
    -[_PKStrokeConcrete set_version:](v20, "set_version:", &v87);
  }
  if ((*((_BYTE *)a3 + 184) & 2) != 0)
    -[_PKStrokeConcrete _setShapeType:](v20, "_setShapeType:", *((_QWORD *)a3 + 12));
  v24 = (_QWORD *)*((_QWORD *)a3 + 5);
  if (v24)
  {
    +[_PKStrokeConcrete decodeRenameableUUIDFromData:transientArchiveDictionary:](_PKStrokeConcrete, "decodeRenameableUUIDFromData:transientArchiveDictionary:", *v24, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKStrokeConcrete _setGroupID:](v20, "_setGroupID:", v25);

  }
  v26 = (_QWORD *)*((_QWORD *)a3 + 11);
  if (v26)
  {
    +[_PKStrokeConcrete decodeRenameableUUIDFromData:transientArchiveDictionary:](_PKStrokeConcrete, "decodeRenameableUUIDFromData:transientArchiveDictionary:", *v26, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKStrokeConcrete _setRenderGroupID:](v20, "_setRenderGroupID:", v27);

  }
  if ((*((_BYTE *)a3 + 184) & 1) != 0)
  {
    v29 = *((_QWORD *)a3 + 6);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL || v29 >= objc_msgSend(v15, "count"))
    {
      v30 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v83 = v29;
        _os_log_fault_impl(&dword_1BE213000, v30, OS_LOG_TYPE_FAULT, "Archive had invalid ink index: %lu", buf, 0xCu);
      }

      v28 = 1;
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v29 < objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke _setInk:](v20, "_setInk:", v31);
    goto LABEL_30;
  }
  if (v73)
  {
    objc_msgSend(v73, "ink");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStroke _setInk:](v20, "_setInk:", v31);
LABEL_30:

    v32 = (const drawing::Rectangle *)*((_QWORD *)a3 + 4);
    if (v32)
    {
      drawing::Rectangle::Rectangle((drawing::Rectangle *)buf, v32);
      -[_PKStrokeConcrete _setBounds:](v20, "_setBounds:", v84, v85, v86, *((float *)&v83 + 1));
      PB::Base::~Base((PB::Base *)buf);
    }
    v33 = (int8x16_t *)MEMORY[0x1E0C9BAA8];
    v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v77[0] = *MEMORY[0x1E0C9BAA8];
    v77[1] = v34;
    v77[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[_PKStrokeConcrete _setTransform:](v20, "_setTransform:", v77);
    v35 = (float32x2_t *)*((_QWORD *)a3 + 21);
    if (v35)
    {
      v36 = v35[1];
      v37 = (int8x16_t)vcvtq_f64_f32(v36);
      v38 = (int8x16_t)vcvtq_f64_f32(v35[2]);
      v39 = (int8x16_t)vcvtq_f64_f32(v35[3]);
      *(int32x2_t *)v40.f32 = vrev64_s32((int32x2_t)v36);
      *(float32x2_t *)&v40.u32[2] = v35[2];
      v41 = v33[2];
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v40), (int8x16_t)vcgezq_f32(v40))))) & 1) != 0)v42 = -1;
      else
        v42 = 0;
      v43 = (int8x16_t)vdupq_n_s64(v42);
      v44 = vbslq_s8(v43, v33[1], v38);
      v76[0] = vbslq_s8(v43, *v33, v37);
      v76[1] = v44;
      v76[2] = vbslq_s8(v43, v41, v39);
      -[_PKStrokeConcrete _setTransform:](v20, "_setTransform:", v76);
    }
    else if (v73)
    {
      objc_msgSend(v73, "_transform");
      v75[0] = v75[3];
      v75[1] = v75[4];
      v75[2] = v75[5];
      -[_PKStrokeConcrete _setTransform:](v20, "_setTransform:", v75);
    }
    v45 = (float32x2_t *)*((_QWORD *)a3 + 7);
    if (v45)
    {
      v46 = v45[1];
      v47 = (int8x16_t)vcvtq_f64_f32(v46);
      v48 = (int8x16_t)vcvtq_f64_f32(v45[2]);
      v49 = (int8x16_t)vcvtq_f64_f32(v45[3]);
      *(int32x2_t *)v50.f32 = vrev64_s32((int32x2_t)v46);
      *(float32x2_t *)&v50.u32[2] = v45[2];
      v51 = v33[2];
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v50), (int8x16_t)vcgezq_f32(v50))))) & 1) != 0)v52 = -1;
      else
        v52 = 0;
      v53 = (int8x16_t)vdupq_n_s64(v52);
      v54 = vbslq_s8(v53, v33[1], v48);
      v74[0] = vbslq_s8(v53, *v33, v47);
      v74[1] = v54;
      v74[2] = vbslq_s8(v53, v51, v49);
      -[_PKStrokeConcrete _setInkTransform:](v20, "_setInkTransform:", v74);
    }
    -[_PKStrokeConcrete _setFlags:](v20, "_setFlags:", *((_QWORD *)a3 + 16));
    if (*((_QWORD *)a3 + 14))
    {
      +[PKStrokePath strokeDataFromDataArchive:](PKStrokePath, "strokeDataFromDataArchive:");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStroke set_strokeData:](v20, "set_strokeData:", v55);
    }
    else
    {
      if (!v73)
      {
LABEL_49:
        v57 = *((_QWORD *)a3 + 17);
        v56 = *((_QWORD *)a3 + 18);
        v58 = v56 - v57;
        if (v56 != v57)
        {
          v59 = *((_QWORD *)a3 + 20);
          if (v59)
          {
            -[_PKStrokeConcrete readStrokeIDFromArchive:withSortedUUIDs:](v20, "readStrokeIDFromArchive:withSortedUUIDs:", v59, v14);
            v78 = v80;
            v79 = v81;
            -[_PKStrokeConcrete set_substrokesVersion:](v20, "set_substrokesVersion:", &v78);
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v58 >> 3);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PKStrokeConcrete set_substrokes:](v20, "set_substrokes:", v60);

          v61 = 0;
          if ((unint64_t)(v58 >> 3) <= 1)
            v62 = 1;
          else
            v62 = v58 >> 3;
          do
          {
            if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 17) + 8 * v61) + 72) == *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 17) + 8 * v61)
                                                                                              + 64))
            {
              v63 = [_PKStrokeConcrete alloc];
              v64 = *(_QWORD *)(*((_QWORD *)a3 + 17) + 8 * v61);
              if (!a7)
              {
LABEL_60:
                v65 = -[_PKStrokeConcrete _flags](v20, "_flags") & 1;
                goto LABEL_61;
              }
              v65 = 1;
            }
            else
            {
              v63 = [_PKStrokeConcrete alloc];
              v64 = *(_QWORD *)(*((_QWORD *)a3 + 17) + 8 * v61);
              if (!a7)
                goto LABEL_60;
              v65 = 1;
            }
LABEL_61:
            v66 = -[_PKStrokeConcrete initWithArchive:sortedUUIDs:inks:parent:isHidden:transientArchiveDictionary:](v63, "initWithArchive:sortedUUIDs:inks:parent:isHidden:transientArchiveDictionary:", v64, v14, v15, v20, v65, v16);
            if (!v66)
              goto LABEL_72;
            -[_PKStrokeConcrete _substrokes](v20, "_substrokes");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "addObject:", v66);

            ++v61;
          }
          while (v62 != v61);
        }
        if (*((_QWORD *)a3 + 9) != *((_QWORD *)a3 + 8))
        {
          v68 = -[PKStrokeMask initWithArchive:]([PKStrokeMask alloc], "initWithArchive:", a3);
          -[_PKStrokeConcrete _setStrokeMask:](v20, "_setStrokeMask:", v68);

        }
        v70 = *((_QWORD *)a3 + 24);
        v69 = (uint64_t *)((char *)a3 + 192);
        if (v70)
          std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](&v20->_unknownFields.__ptr_, v69);
LABEL_67:
        self = v20;
        v19 = self;
        goto LABEL_73;
      }
      objc_msgSend(v73, "_strokeData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStroke set_strokeData:](v20, "set_strokeData:", v55);
    }

    goto LABEL_49;
  }
  if ((v28 & 1) == 0)
  {
    v71 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BE213000, v71, OS_LOG_TYPE_FAULT, "Unable to find ink from saved inkIndex or parent", buf, 2u);
    }

  }
LABEL_72:
  v19 = 0;
  self = v20;
LABEL_73:

  return v19;
}

+ (id)decodeRenameableUUIDFromData:(const char *)a3 transientArchiveDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);
    }
    v8 = v7;

    v6 = v8;
  }

  return v6;
}

+ (void)encodeUUID:(id)a3 toData:(void *)a4
{
  unsigned __int8 v5[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v5 = 0;
  v6 = 0;
  objc_msgSend(a3, "getUUIDBytes:", v5);
  PB::Data::assign(*(PB::Data **)a4, v5, (const unsigned __int8 *)&v7);
}

- (void)saveUUIDsTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[28];

  *(_QWORD *)&v20[20] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[_PKStrokeConcrete _sortID](self, "_sortID");
  v6 = (void *)objc_msgSend(v5, "initWithUUIDBytes:", v20);
  objc_msgSend(v4, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[_PKStrokeConcrete _version](self, "_version");
  v8 = (void *)objc_msgSend(v7, "initWithUUIDBytes:", v20);
  objc_msgSend(v4, "addObject:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[_PKStrokeConcrete _substrokesVersion](self, "_substrokesVersion");
  v10 = (void *)objc_msgSend(v9, "initWithUUIDBytes:", v20);
  objc_msgSend(v4, "addObject:", v10);

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_PKStrokeConcrete _substrokes](self, "_substrokes", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "saveUUIDsTo:", v4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)saveInksTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PKStrokeConcrete ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_PKStrokeConcrete ink](self, "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  else
  {
    v7 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BE213000, v7, OS_LOG_TYPE_FAULT, "Attempting to save a stroke with a nil ink.", buf, 2u);
    }

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_PKStrokeConcrete _substrokes](self, "_substrokes", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "saveInksTo:", v4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 transient:(BOOL)a7
{
  return -[_PKStrokeConcrete saveToArchive:sortedUUIDs:inks:withPathData:parent:transient:](self, "saveToArchive:sortedUUIDs:inks:withPathData:parent:transient:", a3, a4, a5, a6, 0, a7);
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 parent:(id)a7 transient:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  double x;
  double y;
  double width;
  double height;
  uint64_t v36;
  float v37;
  char v38;
  float v39;
  float v40;
  float v41;
  char v42;
  _OWORD *v43;
  __int128 v44;
  uint64_t v45;
  float a;
  uint64_t v47;
  float b;
  uint64_t v49;
  float c;
  uint64_t v51;
  float d;
  uint64_t v53;
  float tx;
  uint64_t v55;
  float ty;
  __int128 v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  float v61;
  uint64_t v62;
  float v63;
  uint64_t v64;
  float v65;
  uint64_t v66;
  float v67;
  uint64_t v68;
  float v69;
  uint64_t v70;
  void *v71;
  BOOL v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  void *v80;
  BOOL v81;
  void *v82;
  _BOOL4 v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _BYTE v95[128];
  CGAffineTransform buf;
  uint64_t v97;
  CGRect v98;

  v8 = a8;
  v84 = a6;
  v97 = *MEMORY[0x1E0C80C00];
  v85 = a4;
  v13 = a5;
  -[_PKStrokeConcrete _groupID](self, "_groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (!*((_QWORD *)a3 + 5))
    {
      v15 = operator new();
      *(_QWORD *)v15 = 0;
      *(_QWORD *)(v15 + 8) = 0;
      buf.a = 0.0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 5, (void **)v15);
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&buf, 0);
    }
    -[_PKStrokeConcrete _groupID](self, "_groupID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PKStrokeConcrete encodeUUID:toData:](_PKStrokeConcrete, "encodeUUID:toData:", v16, (char *)a3 + 40);

  }
  -[_PKStrokeConcrete _renderGroupID](self, "_renderGroupID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (!*((_QWORD *)a3 + 11))
    {
      v18 = operator new();
      *(_QWORD *)v18 = 0;
      *(_QWORD *)(v18 + 8) = 0;
      buf.a = 0.0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 11, (void **)v18);
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&buf, 0);
    }
    -[_PKStrokeConcrete _renderGroupID](self, "_renderGroupID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PKStrokeConcrete encodeUUID:toData:](_PKStrokeConcrete, "encodeUUID:toData:", v19, (char *)a3 + 88);

  }
  if (-[_PKStrokeConcrete _shapeType](self, "_shapeType"))
  {
    v20 = -[_PKStrokeConcrete _shapeType](self, "_shapeType");
    *((_BYTE *)a3 + 184) |= 2u;
    *((_QWORD *)a3 + 12) = v20;
  }
  if (!v8)
  {
    if (!*((_QWORD *)a3 + 15))
    {
      v21 = operator new();
      *(_QWORD *)v21 = 0;
      *(_QWORD *)(v21 + 8) = 0;
      buf.a = 0.0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 15, (void **)v21);
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&buf, 0);
    }
    -[_PKStrokeConcrete _strokeUUID](self, "_strokeUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PKStrokeConcrete encodeUUID:toData:](_PKStrokeConcrete, "encodeUUID:toData:", v22, (char *)a3 + 120);

  }
  drawing::Stroke::makeSortID(a3);
  v23 = *((_QWORD *)a3 + 13);
  -[_PKStrokeConcrete _sortID](self, "_sortID");
  -[_PKStrokeConcrete saveStrokeID:toArchive:withSortedUUIDs:](self, "saveStrokeID:toArchive:withSortedUUIDs:", &buf, v23, v85);
  drawing::Stroke::makeVersion(a3);
  v24 = *((_QWORD *)a3 + 22);
  -[_PKStrokeConcrete _version](self, "_version");
  -[_PKStrokeConcrete saveStrokeID:toArchive:withSortedUUIDs:](self, "saveStrokeID:toArchive:withSortedUUIDs:", &buf, v24, v85);
  -[_PKStrokeConcrete ink](self, "ink");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (-[_PKStrokeConcrete _flags](self, "_flags") & 4) == 0 || a7 == 0;
    v27 = v26;

    if (v27)
    {
      -[_PKStrokeConcrete ink](self, "ink");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v13, "indexOfObject:", v28);

      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf.a) = 0;
          _os_log_fault_impl(&dword_1BE213000, v30, OS_LOG_TYPE_FAULT, "Ink was not in the set of inks we had when saving.", (uint8_t *)&buf, 2u);
        }

      }
      else
      {
        *((_BYTE *)a3 + 184) |= 1u;
        *((_QWORD *)a3 + 6) = v29;
      }
    }
  }
  if (!-[_PKStrokeConcrete _isFullyHidden](self, "_isFullyHidden"))
  {
    if (v84)
    {
      drawing::Stroke::makeStrokeData(a3);
      -[PKStroke _strokeData](self, "_strokeData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "saveToDataArchive:", *((_QWORD *)a3 + 14));

    }
    -[PKStroke _bounds](self, "_bounds");
    x = v98.origin.x;
    y = v98.origin.y;
    width = v98.size.width;
    height = v98.size.height;
    if (!CGRectIsNull(v98))
    {
      drawing::Stroke::makeBounds(a3);
      v36 = *((_QWORD *)a3 + 4);
      v37 = x;
      v38 = *(_BYTE *)(v36 + 24);
      v39 = y;
      v40 = width;
      *(float *)(v36 + 16) = v39;
      *(float *)(v36 + 20) = v40;
      v41 = height;
      *(_BYTE *)(v36 + 24) = v38 | 0xF;
      *(float *)(v36 + 8) = v41;
      *(float *)(v36 + 12) = v37;
    }
    memset(&buf, 0, sizeof(buf));
    -[_PKStrokeConcrete _transform](self, "_transform");
    v42 = -[_PKStrokeConcrete _flags](self, "_flags");
    v43 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    if (!a7 || (v42 & 8) == 0)
    {
      t1 = buf;
      v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&t2.c = v44;
      *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        drawing::Stroke::makeTransform(a3);
        v45 = *((_QWORD *)a3 + 21);
        a = buf.a;
        *(_BYTE *)(v45 + 32) |= 1u;
        *(float *)(v45 + 8) = a;
        v47 = *((_QWORD *)a3 + 21);
        b = buf.b;
        *(_BYTE *)(v47 + 32) |= 2u;
        *(float *)(v47 + 12) = b;
        v49 = *((_QWORD *)a3 + 21);
        c = buf.c;
        *(_BYTE *)(v49 + 32) |= 4u;
        *(float *)(v49 + 16) = c;
        v51 = *((_QWORD *)a3 + 21);
        d = buf.d;
        *(_BYTE *)(v51 + 32) |= 8u;
        *(float *)(v51 + 20) = d;
        v53 = *((_QWORD *)a3 + 21);
        tx = buf.tx;
        *(_BYTE *)(v53 + 32) |= 0x10u;
        *(float *)(v53 + 24) = tx;
        v55 = *((_QWORD *)a3 + 21);
        ty = buf.ty;
        *(_BYTE *)(v55 + 32) |= 0x20u;
        *(float *)(v55 + 28) = ty;
      }
    }
    memset(&v92, 0, sizeof(v92));
    -[_PKStrokeConcrete _inkTransform](self, "_inkTransform");
    v91 = v92;
    v57 = v43[1];
    *(_OWORD *)&v90.a = *v43;
    *(_OWORD *)&v90.c = v57;
    *(_OWORD *)&v90.tx = v43[2];
    if (!CGAffineTransformEqualToTransform(&v91, &v90))
    {
      drawing::Stroke::makeInkTransform(a3);
      v58 = *((_QWORD *)a3 + 7);
      v59 = v92.a;
      *(_BYTE *)(v58 + 32) |= 1u;
      *(float *)(v58 + 8) = v59;
      v60 = *((_QWORD *)a3 + 7);
      v61 = v92.b;
      *(_BYTE *)(v60 + 32) |= 2u;
      *(float *)(v60 + 12) = v61;
      v62 = *((_QWORD *)a3 + 7);
      v63 = v92.c;
      *(_BYTE *)(v62 + 32) |= 4u;
      *(float *)(v62 + 16) = v63;
      v64 = *((_QWORD *)a3 + 7);
      v65 = v92.d;
      *(_BYTE *)(v64 + 32) |= 8u;
      *(float *)(v64 + 20) = v65;
      v66 = *((_QWORD *)a3 + 7);
      v67 = v92.tx;
      *(_BYTE *)(v66 + 32) |= 0x10u;
      *(float *)(v66 + 24) = v67;
      v68 = *((_QWORD *)a3 + 7);
      v69 = v92.ty;
      *(_BYTE *)(v68 + 32) |= 0x20u;
      *(float *)(v68 + 28) = v69;
    }
  }
  v70 = -[_PKStrokeConcrete _flags](self, "_flags");
  *((_BYTE *)a3 + 184) |= 4u;
  *((_QWORD *)a3 + 16) = v70;
  -[_PKStrokeConcrete _substrokes](self, "_substrokes");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "count") == 0;

  if (!v72)
  {
    drawing::Stroke::makeSubstrokesVersion(a3);
    v73 = *((_QWORD *)a3 + 20);
    -[_PKStrokeConcrete _substrokesVersion](self, "_substrokesVersion");
    -[_PKStrokeConcrete saveStrokeID:toArchive:withSortedUUIDs:](self, "saveStrokeID:toArchive:withSortedUUIDs:", &buf, v73, v85);
    -[_PKStrokeConcrete _substrokes](self, "_substrokes");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<std::unique_ptr<drawing::Stroke>>::reserve((char **)a3 + 17, objc_msgSend(v74, "count"));

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    -[_PKStrokeConcrete _substrokes](self, "_substrokes");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    if (v76)
    {
      v77 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v76; ++i)
        {
          if (*(_QWORD *)v87 != v77)
            objc_enumerationMutation(v75);
          v79 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          PB::PtrVector<drawing::Stroke>::emplace_back<>((uint64_t **)a3 + 17);
          objc_msgSend(v79, "saveToArchive:sortedUUIDs:inks:withPathData:parent:transient:", *(_QWORD *)(*((_QWORD *)a3 + 18) - 8), v85, v13, 0, self, v8);
        }
        v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      }
      while (v76);
    }

  }
  -[_PKStrokeConcrete _strokeMask](self, "_strokeMask");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80 == 0;

  if (!v81)
  {
    -[_PKStrokeConcrete _strokeMask](self, "_strokeMask");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "saveToArchive:", a3);

  }
  std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((_QWORD *)a3 + 24, (uint64_t *)&self->_unknownFields);

  return 2;
}

- (_PKStrokeConcrete)initWithV1Archive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  _PKStrokeConcrete *v12;
  _PKStrokeConcrete *v13;
  _PKStrokeConcrete *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  int8x16_t *v20;
  __int128 v21;
  float32x2_t *v22;
  float32x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  float32x4_t v27;
  int8x16_t v28;
  unint64_t v29;
  int8x16_t v30;
  int8x16_t v31;
  uint64_t *v32;
  _BOOL8 v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _OWORD *v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  PKStrokePath *v44;
  PKStrokePath *v45;
  _OWORD v47[2];
  void *__p[3];
  _OWORD v49[3];
  _OWORD v50[3];
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = *((_QWORD *)a3 + 10);
  if (v10 && (v11 = *(_QWORD *)(v10 + 16), v11 <= objc_msgSend(v8, "count")))
  {
    v13 = -[_PKStrokeConcrete init](self, "init");
    v14 = v13;
    if (v13)
    {
      v15 = *((_QWORD *)a3 + 6);
      if (v15)
      {
        -[_PKStrokeConcrete readV1StrokeIDFromArchive:withSortedUUIDs:](v13, "readV1StrokeIDFromArchive:withSortedUUIDs:", v15, v8);
        v55 = v57;
        v56 = v58;
        -[_PKStrokeConcrete set_sortID:](v14, "set_sortID:", &v55);
      }
      if (*((_QWORD *)a3 + 7))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", **((_QWORD **)a3 + 7));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[_PKStrokeConcrete _setStrokeUUID:](v14, "_setStrokeUUID:", v16);

      v17 = *((_QWORD *)a3 + 10);
      if (v17)
      {
        -[_PKStrokeConcrete readV1StrokeIDFromArchive:withSortedUUIDs:](v14, "readV1StrokeIDFromArchive:withSortedUUIDs:", v17, v8);
        v51 = v53;
        v52 = v54;
        -[_PKStrokeConcrete set_version:](v14, "set_version:", &v51);
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", *((_QWORD *)a3 + 2));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStroke _setInk:](v14, "_setInk:", v18);

      -[_PKStrokeConcrete _setBounds:](v14, "_setBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      if (*((double *)a3 + 8) == 0.0)
        v19 = 0.0;
      else
        v19 = *((double *)a3 + 8);
      -[PKStroke _setHidden:](v14, "_setHidden:", *((unsigned __int8 *)a3 + 89));
      v20 = (int8x16_t *)MEMORY[0x1E0C9BAA8];
      v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v50[0] = *MEMORY[0x1E0C9BAA8];
      v50[1] = v21;
      v50[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[_PKStrokeConcrete _setTransform:](v14, "_setTransform:", v50);
      v22 = (float32x2_t *)*((_QWORD *)a3 + 9);
      if (v22)
      {
        v23 = v22[1];
        v24 = (int8x16_t)vcvtq_f64_f32(v23);
        v25 = (int8x16_t)vcvtq_f64_f32(v22[2]);
        v26 = (int8x16_t)vcvtq_f64_f32(v22[3]);
        *(int32x2_t *)v27.f32 = vrev64_s32((int32x2_t)v23);
        *(float32x2_t *)&v27.u32[2] = v22[2];
        v28 = v20[2];
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v27), (int8x16_t)vcgezq_f32(v27))))) & 1) != 0)v29 = -1;
        else
          v29 = 0;
        v30 = (int8x16_t)vdupq_n_s64(v29);
        v31 = vbslq_s8(v30, v20[1], v25);
        v49[0] = vbslq_s8(v30, *v20, v24);
        v49[1] = v31;
        v49[2] = vbslq_s8(v30, v28, v26);
        -[_PKStrokeConcrete _setTransform:](v14, "_setTransform:", v49);
      }
      v32 = (uint64_t *)*((_QWORD *)a3 + 3);
      if (v32)
      {
        v34 = (*((_BYTE *)a3 + 92) & 8) == 0 || *((_BYTE *)a3 + 88) == 0;
        v35 = *((_QWORD *)a3 + 4);
        v36 = *v32;
        std::vector<PKCompressedStrokePoint>::vector(__p, v35);
        if (v35)
        {
          v38 = 0;
          v39 = v35;
          do
          {
            PKConvertToCompressedStrokePoint(v36, (uint64_t)v47, v37);
            v40 = (char *)__p[0] + v38;
            v37 = *(_QWORD *)&v47[0];
            v41 = v47[1];
            *v40 = v47[0];
            v40[1] = v41;
            v38 += 32;
            v36 += 24;
            --v39;
          }
          while (v39);
        }
        if (*((_QWORD *)a3 + 5))
        {
          v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", **((_QWORD **)a3 + 5));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v42 = objc_claimAutoreleasedReturnValue();
        }
        v43 = (void *)v42;
        v44 = [PKStrokePath alloc];
        v45 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v44, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", __p[0], v35, v35, v34, v43, v19);
        -[PKStroke set_strokeData:](v14, "set_strokeData:", v45);

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
    self = v14;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_PKStrokeConcrete)initWithLegacyArchive:(const void *)a3 sortedUUIDs:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  _PKStrokeConcrete *v10;
  _PKStrokeConcrete *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  float v18;
  void *v19;
  float *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  CGColorSpace *DeviceRGB;
  CGColorRef v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  PKInk *v31;
  void *v32;
  PKInk *v33;
  uint64_t v34;
  _PKStrokeClipPlane *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  _OWORD *v43;
  PKStrokePath *v44;
  void *v45;
  void *v46;
  PKStrokePath *v47;
  PKCompressedStrokePoint v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  void *__p[3];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  PKCompressedStrokePoint v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  PKCompressedStrokePoint components;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  v8 = *((_QWORD *)a3 + 11);
  if (v8 && (v9 = *(unsigned int *)(v8 + 12), objc_msgSend(v6, "count") >= v9))
  {
    v11 = -[_PKStrokeConcrete init](self, "init");
    if (v11)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(*((_QWORD *)a3 + 11) + 12));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getUUIDBytes:", (char *)&v75 + 4);

      v13 = *((_QWORD *)a3 + 11);
      v14 = *(_DWORD *)(v13 + 8);
      LODWORD(v13) = *(_DWORD *)(v13 + 16);
      LODWORD(v75) = v14;
      HIDWORD(v76) = v13;
      v74 = v76;
      v73 = v75;
      -[_PKStrokeConcrete set_version:](v11, "set_version:", &v73);
      v15 = *((_QWORD *)a3 + 6);
      if (v15)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(v15 + 12));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "getUUIDBytes:", &components.var0.var1);

        v17 = *((_QWORD *)a3 + 6);
        v18 = *(float *)(v17 + 8);
        LODWORD(v17) = *(_DWORD *)(v17 + 16);
        components.var0.var0 = v18;
        *(_DWORD *)&components.var5 = v17;
        v72 = *(_QWORD *)&components.var3;
        v71 = *(_OWORD *)&components.var0.var0;
        -[_PKStrokeConcrete set_sortID:](v11, "set_sortID:", &v71);
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PKStrokeConcrete _setStrokeUUID:](v11, "_setStrokeUUID:", v19);

      v20 = (float *)*((_QWORD *)a3 + 5);
      if (v20)
      {
        v21 = v20[5];
        v22 = v20[4];
        v23 = v20[3];
        v24 = v20[2];
      }
      else
      {
        v24 = 1.0;
        v21 = 0.0;
        v22 = 0.0;
        v23 = 0.0;
      }
      v25 = *((unsigned int *)a3 + 24);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      *(double *)&components.var0 = v21;
      *(double *)&components.var1 = v22;
      *(double *)&components.var3 = v23;
      *(double *)&components.var7 = v24;
      v27 = CGColorCreate(DeviceRGB, (const CGFloat *)&components.var0);
      CGColorSpaceRelease(DeviceRGB);
      CFAutorelease(v27);
      +[PKInk identifierForCommandType:wantsObjectErase:](PKInk, "identifierForCommandType:wantsObjectErase:", v25, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.ink.marker")))
      {
        v29 = *((_QWORD *)a3 + 7);
        if (v29)
          v30 = ((unint64_t)*(unsigned __int8 *)(v29 + 20) >> 2) & 1;
        else
          v30 = 2;
      }
      else
      {
        v30 = 0;
      }
      v31 = [PKInk alloc];
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PKInk initWithIdentifier:color:version:variant:](v31, "initWithIdentifier:color:version:variant:", v28, v32, v30, 0);
      -[PKStroke _setInk:](v11, "_setInk:", v33);

      v70 = 0;
      v68 = 0u;
      v69 = 0u;
      v67 = 0u;
      memset(&components, 0, sizeof(components));
      v34 = *((_QWORD *)a3 + 1);
      if (v34)
      {
        -[_PKStrokeConcrete readPointFromLegacyArchive:deltaFrom:](v11, "readPointFromLegacyArchive:deltaFrom:", v34, &PKStrokePointDefault);
        v67 = v62;
        v68 = v63;
        v69 = v64;
        v70 = v65;
        components = v61;
      }
      if (*((_QWORD *)a3 + 4) && *((_QWORD *)a3 + 3))
      {
        v65 = 0;
        v63 = 0u;
        v64 = 0u;
        v62 = 0u;
        memset(&v61, 0, sizeof(v61));
        -[_PKStrokeConcrete readPointFromLegacyArchive:deltaFrom:](v11, "readPointFromLegacyArchive:deltaFrom:");
        v60 = 0;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v55 = 0u;
        -[_PKStrokeConcrete readPointFromLegacyArchive:deltaFrom:](v11, "readPointFromLegacyArchive:deltaFrom:", *((_QWORD *)a3 + 3), &components);
        v35 = -[_PKStrokeClipPlane initWithOrigin:normal:]([_PKStrokeClipPlane alloc], "initWithOrigin:normal:", 0.0, 0.0, -0.0, -0.0);
        -[_PKStrokeConcrete _setClipPlane:](v11, "_setClipPlane:", v35);

      }
      v36 = *((_QWORD *)a3 + 9) - *((_QWORD *)a3 + 8);
      if (v36)
      {
        v37 = v36 >> 3;
        std::vector<PKCompressedStrokePoint>::vector(__p, v36 >> 3);
        v38 = 0;
        v39 = 0;
        if (v37 <= 1)
          v40 = 1;
        else
          v40 = v37;
        v41 = 0.0;
        do
        {
          v42 = *(_QWORD *)(*((_QWORD *)a3 + 8) + 8 * v39);
          v65 = 0;
          v63 = 0u;
          v64 = 0u;
          v62 = 0u;
          memset(&v61, 0, sizeof(v61));
          -[_PKStrokeConcrete readPointFromLegacyArchive:deltaFrom:](v11, "readPointFromLegacyArchive:deltaFrom:", v42, &components);
          if (!v39)
            v41 = *(double *)&v61.var0;
          v50 = v62;
          v51 = v63;
          v52 = v64;
          v53 = v65;
          v49 = v61;
          PKCompressStrokePoint(&v49, v41, (float32x2_t *)&v55);
          v43 = (char *)__p[0] + v38;
          *v43 = v55;
          v43[1] = v56;
          ++v39;
          v38 += 32;
        }
        while (v40 != v39);
        v44 = [PKStrokePath alloc];
        v45 = __p[0];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v44, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v45, v37, v37, 1, v46, 0.0);
        -[PKStroke set_strokeData:](v11, "set_strokeData:", v47);

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      if (*((_QWORD *)a3 + 2))
        -[_PKStrokeConcrete _setBounds:](v11, "_setBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      else
        -[PKStroke _setHidden:](v11, "_setHidden:", 1);

    }
    self = v11;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_PKStrokeID)readStrokeIDFromArchive:(SEL)a3 withSortedUUIDs:(const StrokeID *)a4
{
  unint64_t var2;
  unint64_t var1;
  void *v10;
  _PKStrokeID *result;

  var1 = a4->var1;
  var2 = a4->var2;
  retstr->clock = var1;
  objc_msgSend(a5, "objectAtIndexedSubscript:", var2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getUUIDBytes:", retstr->replicaUUID);

  retstr->subclock = a4->var3;
  return result;
}

- (void)saveStrokeID:(const _PKStrokeID *)a3 toArchive:(StrokeID *)a4 withSortedUUIDs:(id)a5
{
  unint64_t clock;
  void *v8;
  unint64_t v9;
  char var4;
  unint64_t subclock;
  id v12;

  v12 = a5;
  clock = a3->clock;
  *(_BYTE *)&a4->var4 |= 1u;
  a4->var1 = clock;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3->replicaUUID);
  v9 = objc_msgSend(v12, "indexOfObject:", v8);
  var4 = (char)a4->var4;
  *(_BYTE *)&a4->var4 = var4 | 2;
  subclock = a3->subclock;
  *(_BYTE *)&a4->var4 = var4 | 6;
  a4->var2 = v9;
  a4->var3 = subclock;

}

- (_PKStrokeID)readV1StrokeIDFromArchive:(SEL)a3 withSortedUUIDs:(const StrokeID *)a4
{
  unint64_t var2;
  unint64_t var1;
  void *v10;
  _PKStrokeID *result;

  var1 = a4->var1;
  var2 = a4->var2;
  retstr->clock = var1;
  objc_msgSend(a5, "objectAtIndexedSubscript:", var2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getUUIDBytes:", retstr->replicaUUID);

  retstr->subclock = a4->var3;
  return result;
}

- (void)saveV1StrokeID:(const _PKStrokeID *)a3 toArchive:(StrokeID *)a4 withSortedUUIDs:(id)a5
{
  unint64_t clock;
  void *v8;
  unint64_t v9;
  char var4;
  unint64_t subclock;
  id v12;

  v12 = a5;
  clock = a3->clock;
  *(_BYTE *)&a4->var4 |= 1u;
  a4->var1 = clock;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3->replicaUUID);
  v9 = objc_msgSend(v12, "indexOfObject:", v8);
  var4 = (char)a4->var4;
  *(_BYTE *)&a4->var4 = var4 | 2;
  subclock = a3->subclock;
  *(_BYTE *)&a4->var4 = var4 | 6;
  a4->var2 = v9;
  a4->var3 = subclock;

}

- (CGPoint)readPointFromArchive:(const Point *)a3
{
  int32x2_t v3;
  int8x16_t v4;
  int8x16_t v5;
  double v6;
  CGPoint result;

  v3 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(LOBYTE(a3[4].v)), (int8x8_t)0x200000001));
  v4.i64[0] = v3.i32[0];
  v4.i64[1] = v3.i32[1];
  v5 = vbicq_s8((int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3[2].v), v4);
  v6 = *(double *)&v5.i64[1];
  result.x = *(double *)v5.i64;
  result.y = v6;
  return result;
}

- (_PKStrokePoint)readPointFromLegacyArchive:(SEL)a3 deltaFrom:(const Point *)a4
{
  unsigned int v_low;
  int8x8_t v6;
  int32x2_t v7;
  int8x16_t v8;
  float32x2_t v9;
  int32x2_t v10;
  float v11;
  double edgeWidth;
  double azimuth;
  double opacity;

  retstr->timestamp = 0.0;
  v_low = LOBYTE(a4[9].v);
  v6 = (int8x8_t)vdup_n_s32(v_low);
  v7 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x4000000020));
  v8.i64[0] = v7.i32[0];
  v8.i64[1] = v7.i32[1];
  retstr->location = (CGPoint)vbicq_s8((int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a4[7].v), v8);
  v9 = *(float32x2_t *)&a4[6].v;
  v10 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x100000010));
  v8.i64[0] = v10.i32[0];
  v8.i64[1] = v10.i32[1];
  v9.i32[1] = (__int32)a4[2];
  *(int8x16_t *)&retstr->radius = vbslq_s8(v8, *(int8x16_t *)&a5->radius, (int8x16_t)vcvtq_f64_f32(v9));
  v11 = *(float *)&a4[3];
  edgeWidth = *(float *)&a4[4];
  if ((v_low & 4) == 0)
    edgeWidth = a5->edgeWidth;
  retstr->edgeWidth = edgeWidth;
  retstr->force = 0.0;
  azimuth = v11;
  if ((v_low & 2) == 0)
    azimuth = a5->azimuth;
  retstr->azimuth = azimuth;
  retstr->altitude = 0.0;
  opacity = *(float *)&a4[5];
  if ((v_low & 8) == 0)
    opacity = a5->opacity;
  retstr->opacity = opacity;
  retstr->radius2 = 0.0;
  return self;
}

- (unsigned)saveToV1Archive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 transient:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  PB::Data *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  void *v28;
  void *v29;
  PB::Data *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  PB::Data *v34;
  uint64_t v35;
  double x;
  double y;
  double width;
  double height;
  uint64_t v40;
  float v41;
  char v42;
  float v43;
  float v44;
  float v45;
  __int128 v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  float v50;
  uint64_t v51;
  float v52;
  uint64_t v53;
  float v54;
  uint64_t v55;
  float v56;
  uint64_t v57;
  float v58;
  CGAffineTransform v60;
  CGAffineTransform t1;
  __int128 v62;
  uint64_t v63;
  PKCompressedStrokePoint v64;
  __int128 v65;
  uint64_t v66;
  CGRect v67;

  v8 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  drawingV1::Stroke::makeStrokeID(a3);
  v14 = *((_QWORD *)a3 + 6);
  -[_PKStrokeConcrete _sortID](self, "_sortID");
  -[_PKStrokeConcrete saveV1StrokeID:toArchive:withSortedUUIDs:](self, "saveV1StrokeID:toArchive:withSortedUUIDs:", &v64, v14, v12);
  if (!a7)
  {
    v64.var0 = 0;
    *(_QWORD *)&v64.var1 = 0;
    -[_PKStrokeConcrete _strokeUUID](self, "_strokeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getUUIDBytes:", &v64);

    v16 = (PB::Data *)*((_QWORD *)a3 + 7);
    if (!v16)
    {
      v17 = operator new();
      *(_QWORD *)v17 = 0;
      *(_QWORD *)(v17 + 8) = 0;
      *(_QWORD *)&v62 = 0;
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 7, (void **)v17);
      std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v62, 0);
      v16 = (PB::Data *)*((_QWORD *)a3 + 7);
    }
    PB::Data::assign(v16, (const unsigned __int8 *)&v64, (const unsigned __int8 *)&v64.var3);
  }
  drawingV1::Stroke::makeVersion(a3);
  v18 = *((_QWORD *)a3 + 10);
  -[_PKStrokeConcrete _version](self, "_version");
  -[_PKStrokeConcrete saveV1StrokeID:toArchive:withSortedUUIDs:](self, "saveV1StrokeID:toArchive:withSortedUUIDs:", &v64, v18, v12);
  -[_PKStrokeConcrete ink](self, "ink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v13, "indexOfObject:", v19);

  *((_BYTE *)a3 + 92) |= 1u;
  *((_QWORD *)a3 + 2) = v20;
  -[PKStroke timestamp](self, "timestamp");
  *((_BYTE *)a3 + 92) |= 4u;
  *((_QWORD *)a3 + 8) = v21;
  v22 = -[PKStroke _isHidden](self, "_isHidden");
  *((_BYTE *)a3 + 92) |= 0x10u;
  *((_BYTE *)a3 + 89) = v22;
  if (!-[PKStroke _isHidden](self, "_isHidden"))
  {
    if (v8)
    {
      v23 = -[PKStroke _pointsCount](self, "_pointsCount");
      *((_BYTE *)a3 + 92) |= 2u;
      *((_QWORD *)a3 + 4) = v23;
      v24 = (unsigned __int8 *)malloc_type_malloc(24 * v23, 0x1000040504FFAC1uLL);
      v25 = v24;
      if (v23)
      {
        v26 = 0;
        v27 = v24;
        do
        {
          -[PKStroke _strokeData](self, "_strokeData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
            objc_msgSend(v28, "_compressedPointAt:", v26);
          else
            memset(&v64, 0, sizeof(v64));
          PKConvertToCompressedStrokePointV1((uint64_t)&v64, (uint64_t)&v62);
          *(_OWORD *)v27 = v62;
          *((_QWORD *)v27 + 2) = v63;

          ++v26;
          v27 += 24;
        }
        while (v23 != v26);
      }
      v30 = (PB::Data *)*((_QWORD *)a3 + 3);
      if (!v30)
      {
        v31 = operator new();
        *(_QWORD *)v31 = 0;
        *(_QWORD *)(v31 + 8) = 0;
        v64.var0 = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 3, (void **)v31);
        std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v64, 0);
        v30 = (PB::Data *)*((_QWORD *)a3 + 3);
      }
      PB::Data::assign(v30, v25, &v25[24 * v23]);
      free(v25);
      -[PKStroke _strokeDataUUID](self, "_strokeDataUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v64.var0 = 0;
        *(_QWORD *)&v64.var1 = 0;
        objc_msgSend(v32, "getUUIDBytes:", &v64);
        v34 = (PB::Data *)*((_QWORD *)a3 + 5);
        if (!v34)
        {
          v35 = operator new();
          *(_QWORD *)v35 = 0;
          *(_QWORD *)(v35 + 8) = 0;
          *(_QWORD *)&v62 = 0;
          std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)a3 + 5, (void **)v35);
          std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v62, 0);
          v34 = (PB::Data *)*((_QWORD *)a3 + 5);
        }
        PB::Data::assign(v34, (const unsigned __int8 *)&v64, (const unsigned __int8 *)&v64.var3);
      }

    }
    -[PKStroke _bounds](self, "_bounds");
    x = v67.origin.x;
    y = v67.origin.y;
    width = v67.size.width;
    height = v67.size.height;
    if (!CGRectIsNull(v67))
    {
      drawingV1::Stroke::makeBounds(a3);
      v40 = *((_QWORD *)a3 + 1);
      v41 = x;
      v42 = *(_BYTE *)(v40 + 24);
      v43 = y;
      v44 = width;
      *(float *)(v40 + 16) = v43;
      *(float *)(v40 + 20) = v44;
      v45 = height;
      *(_BYTE *)(v40 + 24) = v42 | 0xF;
      *(float *)(v40 + 8) = v45;
      *(float *)(v40 + 12) = v41;
    }
    v65 = 0u;
    memset(&v64, 0, sizeof(v64));
    -[_PKStrokeConcrete _transform](self, "_transform");
    *(_OWORD *)&t1.a = *(_OWORD *)&v64.var0.var0;
    *(_OWORD *)&t1.c = *(_OWORD *)&v64.var3;
    *(_OWORD *)&t1.tx = v65;
    v46 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v60.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v60.c = v46;
    *(_OWORD *)&v60.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (!CGAffineTransformEqualToTransform(&t1, &v60))
    {
      drawingV1::Stroke::makeTransform(a3);
      v47 = *((_QWORD *)a3 + 9);
      v48 = *(double *)&v64.var0;
      *(_BYTE *)(v47 + 32) |= 1u;
      *(float *)(v47 + 8) = v48;
      v49 = *((_QWORD *)a3 + 9);
      v50 = *(double *)&v64.var1;
      *(_BYTE *)(v49 + 32) |= 2u;
      *(float *)(v49 + 12) = v50;
      v51 = *((_QWORD *)a3 + 9);
      v52 = *(double *)&v64.var3;
      *(_BYTE *)(v51 + 32) |= 4u;
      *(float *)(v51 + 16) = v52;
      v53 = *((_QWORD *)a3 + 9);
      v54 = *(double *)&v64.var7;
      *(_BYTE *)(v53 + 32) |= 8u;
      *(float *)(v53 + 20) = v54;
      v55 = *((_QWORD *)a3 + 9);
      v56 = *(double *)&v65;
      *(_BYTE *)(v55 + 32) |= 0x10u;
      *(float *)(v55 + 24) = v56;
      v57 = *((_QWORD *)a3 + 9);
      v58 = *((double *)&v65 + 1);
      *(_BYTE *)(v57 + 32) |= 0x20u;
      *(float *)(v57 + 28) = v58;
    }
    if (!-[PKStroke _inputType](self, "_inputType"))
    {
      *((_BYTE *)a3 + 92) |= 8u;
      *((_BYTE *)a3 + 88) = 1;
    }
  }

  return 1;
}

@end

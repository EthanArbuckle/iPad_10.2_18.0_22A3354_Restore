@implementation PKStrokeDelta

- (PKStrokeDelta)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  PKStrokeDelta *v7;
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
    self = -[PKStrokeDelta initWithArchive:error:](self, "initWithArchive:error:", &v9, a4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v9);

  return v7;
}

- (PKStrokeDelta)initWithArchive:(const void *)a3 error:(id *)a4
{
  PKStrokeDelta *v6;
  uint64_t v7;
  PKStrokePath *deltaStrokeData;
  uint64_t v9;
  void *strokeUUID;
  _PKStrokeConcrete *v11;

  v6 = -[PKStrokeDelta init](self, "init");
  if (v6)
  {
    if (*((_QWORD *)a3 + 6))
    {
      +[PKStrokePath strokeDataFromDataArchive:](PKStrokePath, "strokeDataFromDataArchive:");
      v7 = objc_claimAutoreleasedReturnValue();
      deltaStrokeData = v6->_deltaStrokeData;
      v6->_deltaStrokeData = (PKStrokePath *)v7;

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", **((_QWORD **)a3 + 2));
      strokeUUID = v6->_strokeUUID;
      v6->_strokeUUID = (NSUUID *)v9;
    }
    else
    {
      v11 = -[_PKStrokeConcrete initWithArchive:error:]([_PKStrokeConcrete alloc], "initWithArchive:error:", a3, a4);
      strokeUUID = v6->_deltaStroke;
      v6->_deltaStroke = v11;
    }

  }
  return v6;
}

- (id)dataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void (**v8)(drawing::StrokeDelta *__hidden);
  __int128 v9;
  __int128 v10;
  __int128 v11;

  -[PKStrokeDelta deltaStroke](self, "deltaStroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKStrokeDelta deltaStroke](self, "deltaStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v8 = &off_1E77748D8;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PKStrokeDelta saveToArchive:](self, "saveToArchive:", &v8);
    PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::StrokeDelta>((uint64_t)&v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v8);
    return v7;
  }
}

- (void)saveToArchive:(void *)a3
{
  void *v5;
  unint64_t v6;
  PB::Data **v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  drawing::StrokeDelta::makeStrokeData(a3);
  -[PKStrokePath saveToDataArchive:](self->_deltaStrokeData, "saveToDataArchive:", *((_QWORD *)a3 + 6));
  objc_msgSend(v5, "addObject:", self->_strokeUUID);
  v6 = *((_QWORD *)a3 + 4);
  v7 = (PB::Data **)((char *)a3 + 16);
  v8 = (char *)*((_QWORD *)a3 + 3);
  if ((unint64_t)v8 >= v6)
  {
    v10 = (v8 - (char *)*v7) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v12 = v6 - (_QWORD)*v7;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v18[2] = (char *)a3 + 32;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 32, v13);
    else
      v14 = 0;
    v15 = &v14[16 * v10];
    v16 = v14;
    v17 = v15;
    v18[1] = &v14[16 * v13];
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    v18[0] = v15 + 16;
    std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 2, &v16);
    v9 = (_QWORD *)*((_QWORD *)a3 + 3);
    std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)&v16);
  }
  else
  {
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    v9 = v8 + 16;
    *((_QWORD *)a3 + 3) = v8 + 16;
  }
  *((_QWORD *)a3 + 3) = v9;
  v16 = 0;
  v17 = 0;
  -[NSUUID getUUIDBytes:](self->_strokeUUID, "getUUIDBytes:", &v16);
  PB::Data::assign(*v7, (const unsigned __int8 *)&v16, (const unsigned __int8 *)v18);

}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[PKStrokeDelta deltaStroke](self, "deltaStroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKStrokeDelta deltaStroke](self, "deltaStroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p stroke=%@>"), v6, self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKStrokeDelta _strokeUUID](self, "_strokeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PK_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeDelta deltaStrokeData](self, "deltaStrokeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_startIndex");
    -[PKStrokeDelta deltaStrokeData](self, "deltaStrokeData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p strokeID=%@ %ld->%ld>"), v6, self, v9, v11, objc_msgSend(v12, "_immutablePointsCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (_PKStrokeConcrete)deltaStroke
{
  return self->_deltaStroke;
}

- (void)setDeltaStroke:(id)a3
{
  objc_storeStrong((id *)&self->_deltaStroke, a3);
}

- (PKStrokePath)deltaStrokeData
{
  return self->_deltaStrokeData;
}

- (void)setDeltaStrokeData:(id)a3
{
  objc_storeStrong((id *)&self->_deltaStrokeData, a3);
}

- (NSUUID)_strokeUUID
{
  return self->_strokeUUID;
}

- (void)set_strokeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_strokeUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeUUID, 0);
  objc_storeStrong((id *)&self->_deltaStrokeData, 0);
  objc_storeStrong((id *)&self->_deltaStroke, 0);
}

@end

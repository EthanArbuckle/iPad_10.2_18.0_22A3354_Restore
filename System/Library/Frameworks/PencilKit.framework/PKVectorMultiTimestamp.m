@implementation PKVectorMultiTimestamp

- (PKVectorMultiTimestamp)initWithData:(id)a3 andCapacity:(unint64_t)a4
{
  id v6;
  const unsigned __int8 *v7;
  PKVectorMultiTimestamp *v8;
  NSObject *v9;
  void (**v11)(legacy_drawing::VectorTimestamp *__hidden);
  _QWORD v12[3];
  uint8_t buf[8];

  v11 = off_1E7774638;
  memset(v12, 0, sizeof(v12));
  v6 = objc_retainAutorelease(a3);
  v7 = (const unsigned __int8 *)objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  PB::Reader::Reader((PB::Reader *)buf, v7);
  LODWORD(v7) = legacy_drawing::VectorTimestamp::readFrom((legacy_drawing::VectorTimestamp *)&v11, (PB::Reader *)buf);

  if ((_DWORD)v7)
  {
    self = -[PKVectorMultiTimestamp initWithArchive:andCapacity:](self, "initWithArchive:andCapacity:", &v11, a4);
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v9, OS_LOG_TYPE_ERROR, "PKVectorMultiTimestamp protobuf corrupt.", buf, 2u);
    }

    v8 = 0;
  }
  v11 = off_1E7774638;
  *(_QWORD *)buf = v12;
  std::vector<std::unique_ptr<drawing::Stroke>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  PB::Base::~Base((PB::Base *)&v11);

  return v8;
}

- (PKVectorMultiTimestamp)initWithArchive:(const void *)a3 andCapacity:(unint64_t)a4
{
  PKVectorMultiTimestamp *v6;
  PKVectorMultiTimestamp *v7;
  PKVectorMultiTimestamp *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  os_log_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  PKVectorMultiTimestamp *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = -[PKVectorMultiTimestamp initWithCapacity:](self, "initWithCapacity:", a4);
  v7 = v6;
  if (!v6)
  {
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  v8 = v6;
  v9 = *((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1);
  if (v9)
  {
    v10 = 0;
    if ((unint64_t)(v9 >> 3) <= 1)
      v11 = 1;
    else
      v11 = v9 >> 3;
    while (1)
    {
      v12 = *(_QWORD **)(*((_QWORD *)a3 + 1) + 8 * v10);
      v13 = v12[4];
      if (!v13 || *(_QWORD *)(v13 + 8) != 16)
        break;
      v14 = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *(_QWORD *)v12[4]);
      v16 = v12[1];
      v15 = v12[2];
      v17 = (v15 - v16) >> 3;
      if (v17 != a4)
      {
        v21 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v24 = 134218240;
          v25 = v17;
          v26 = 2048;
          v27 = a4;
          _os_log_error_impl(&dword_1BE213000, v21, OS_LOG_TYPE_ERROR, "PKVectorMultiTimestamp requires the same number of clocks as capacity %zu != %ld.", (uint8_t *)&v24, 0x16u);
        }

        goto LABEL_19;
      }
      if (v15 != v16)
      {
        v18 = 0;
        v19 = 1;
        do
        {
          v20 = *(_QWORD *)(v12[1] + 8 * v18);
          -[PKVectorMultiTimestamp setClock:subclock:forUUID:atIndex:](v7, "setClock:subclock:forUUID:atIndex:", *(unsigned int *)(v20 + 8), *(unsigned int *)(v20 + 12), v14);
          v18 = v19++;
        }
        while (v18 < a4);
      }

      if (++v10 == v11)
      {
        v8 = v7;
        goto LABEL_21;
      }
    }
    v14 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "PKVectorMultiTimestamp clock requires uuids.", (uint8_t *)&v24, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_21:
  v22 = v8;

  return v22;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  PB::Data *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  id obj;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void **v24;
  unsigned __int8 v25[8];
  uint64_t v26;
  unsigned __int8 v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PKVectorMultiTimestamp sortedUUIDs](self, "sortedUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v4)
  {
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        PB::PtrVector<legacy_drawing::VectorTimestampClock>::emplace_back<>((uint64_t **)a3 + 1);
        v7 = *(_QWORD *)(*((_QWORD *)a3 + 2) - 8);
        *(_QWORD *)v25 = 0;
        v26 = 0;
        objc_msgSend(v6, "getUUIDBytes:", v25);
        v8 = *(PB::Data **)(v7 + 32);
        if (!v8)
        {
          v9 = operator new();
          *(_QWORD *)v9 = 0;
          *(_QWORD *)(v9 + 8) = 0;
          v24 = 0;
          std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)(v7 + 32), (void **)v9);
          std::unique_ptr<PB::Data>::reset[abi:ne180100](&v24, 0);
          v8 = *(PB::Data **)(v7 + 32);
        }
        PB::Data::assign(v8, v25, v27);
        -[PKVectorMultiTimestamp timestamps](self, "timestamps");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          for (j = 0; j != v11; ++j)
          {
            -[PKVectorMultiTimestamp clockElementForUUID:atIndex:](self, "clockElementForUUID:atIndex:", v6, j);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            PB::PtrVector<legacy_drawing::VectorTimestampClockReplicaClock>::emplace_back<>((uint64_t **)(v7 + 8));
            v14 = *(_QWORD *)(*(_QWORD *)(v7 + 16) - 8);
            if (objc_msgSend(v13, "clock"))
            {
              v15 = objc_msgSend(v13, "clock");
              *(_BYTE *)(v14 + 16) |= 1u;
              *(_DWORD *)(v14 + 8) = v15;
            }
            if (objc_msgSend(v13, "subclock"))
            {
              v16 = objc_msgSend(v13, "subclock");
              *(_BYTE *)(v14 + 16) |= 2u;
              *(_DWORD *)(v14 + 12) = v16;
            }

          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v4);
  }

}

- (id)serialize
{
  id v2;
  void *v3;
  void (**v5)(legacy_drawing::VectorTimestamp *__hidden);
  _QWORD v6[3];
  void **v7;
  uint64_t v8;

  v5 = off_1E7774638;
  memset(v6, 0, sizeof(v6));
  -[PKVectorMultiTimestamp saveToArchive:](self, "saveToArchive:", &v5);
  PB::Writer::Writer((PB::Writer *)&v7);
  ((void (*)(void (***)(legacy_drawing::VectorTimestamp *__hidden), void ***))v5[3])(&v5, &v7);
  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  v3 = (void *)objc_msgSend(v2, "initWithBytes:length:", v8, (char *)v7 - v8);
  PB::Writer::~Writer((PB::Writer *)&v7);
  v5 = off_1E7774638;
  v7 = (void **)v6;
  std::vector<std::unique_ptr<drawing::Stroke>>::__destroy_vector::operator()[abi:ne180100](&v7);
  PB::Base::~Base((PB::Base *)&v5);
  return v3;
}

- (PKVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  PKVectorMultiTimestamp *v4;
  uint64_t v5;
  NSArray *timestamps;
  uint64_t v7;
  PKVectorTimestamp *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKVectorMultiTimestamp;
  v4 = -[PKVectorMultiTimestamp init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    timestamps = v4->_timestamps;
    v4->_timestamps = (NSArray *)v5;

    if (a3)
    {
      v7 = 0;
      do
      {
        v8 = objc_alloc_init(PKVectorTimestamp);
        -[NSArray setObject:atIndexedSubscript:](v4->_timestamps, "setObject:atIndexedSubscript:", v8, v7);

        ++v7;
      }
      while (a3 != v7);
    }
  }
  return v4;
}

- (PKVectorMultiTimestamp)initWithTimestamps:(id)a3
{
  id v4;
  PKVectorMultiTimestamp *v5;
  uint64_t v6;
  NSArray *timestamps;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKVectorMultiTimestamp;
  v5 = -[PKVectorMultiTimestamp init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKVectorMultiTimestamp *v4;

  v4 = -[PKVectorMultiTimestamp initWithCapacity:]([PKVectorMultiTimestamp alloc], "initWithCapacity:", -[NSArray count](self->_timestamps, "count"));
  -[PKVectorMultiTimestamp mergeWithTimestamp:](v4, "mergeWithTimestamp:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PKVectorMultiTimestamp compareTo:](self, "compareTo:", v4) == 0;

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKVectorMultiTimestamp timestamps](self, "timestamps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)clockElementForUUID:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *timestamps;
  id v6;
  void *v7;
  void *v8;

  timestamps = self->_timestamps;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clockElementForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)clockForUUID:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *timestamps;
  id v6;
  void *v7;
  unint64_t v8;

  timestamps = self->_timestamps;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clockForUUID:", v6);

  return v8;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4 atIndex:(unint64_t)a5
{
  NSArray *timestamps;
  id v8;
  id v9;

  timestamps = self->_timestamps;
  v8 = a4;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClock:forUUID:", a3, v8);

}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5 atIndex:(unint64_t)a6
{
  NSArray *timestamps;
  id v10;
  id v11;

  timestamps = self->_timestamps;
  v10 = a5;
  -[NSArray objectAtIndexedSubscript:](timestamps, "objectAtIndexedSubscript:", a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClock:subclock:forUUID:", a3, a4, v10);

}

- (id)sortedUUIDs
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = -[NSArray count](self->_timestamps, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_timestamps, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

    }
  }
  objc_msgSend(v3, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_PK_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)compareTo:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[NSArray count](self->_timestamps, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_timestamps, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 |= objc_msgSend(v9, "compareTo:", v11);

      if (v8 == 5)
        break;
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mergeWithTimestamp:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSArray count](self->_timestamps, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_timestamps, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timestamps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mergeWithTimestamp:", v9);

    }
  }

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p ["), v5, self);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_timestamps;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = &stru_1E777DEE8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "shortDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@(%@)"), v10, v12, (_QWORD)v14);

        ++v11;
        v10 = CFSTR(", ");
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v10 = CFSTR(", ");
    }
    while (v8);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]>"));
  return v3;
}

- (NSArray)timestamps
{
  return self->_timestamps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
}

@end

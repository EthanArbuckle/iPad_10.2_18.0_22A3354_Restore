@implementation ProgramAddressTableCollector

- (ProgramAddressTableCollector)init
{
  ProgramAddressTableCollector *v2;
  uint64_t v3;
  NSMutableDictionary *binaryTypes;
  uint64_t v5;
  NSMutableArray *mappings;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *binaries;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *functionIndices;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ProgramAddressTableCollector;
  v2 = -[ProgramAddressTableCollector init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    binaryTypes = v2->_binaryTypes;
    v2->_binaryTypes = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    mappings = v2->_mappings;
    v2->_mappings = (NSMutableArray *)v5;

    v8 = objc_opt_new(NSMutableDictionary, v7);
    binaries = v2->_binaries;
    v2->_binaries = (NSMutableDictionary *)v8;

    v11 = objc_opt_new(NSMutableArray, v10);
    functionIndices = v2->_functionIndices;
    v2->_functionIndices = (NSMutableArray *)v11;

    v2->_drawCallIndex = 0;
  }
  return v2;
}

- (id)initForHarvestingBinaries
{
  ProgramAddressTableCollector *v2;
  uint64_t v3;
  NSMutableDictionary *binaryTypes;
  uint64_t v5;
  NSMutableArray *mappings;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *binaries;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *functionIndices;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ProgramAddressTableCollector;
  v2 = -[ProgramAddressTableCollector init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    binaryTypes = v2->_binaryTypes;
    v2->_binaryTypes = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    mappings = v2->_mappings;
    v2->_mappings = (NSMutableArray *)v5;

    v2->_drawCallIndex = 0;
    v8 = objc_opt_new(NSMutableDictionary, v7);
    binaries = v2->_binaries;
    v2->_binaries = (NSMutableDictionary *)v8;

    v11 = objc_opt_new(NSMutableArray, v10);
    functionIndices = v2->_functionIndices;
    v2->_functionIndices = (NSMutableArray *)v11;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ProgramAddressTableCollector;
  -[ProgramAddressTableCollector dealloc](&v2, "dealloc");
}

- (void)addBinaries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  NSMutableDictionary *binaries;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  id v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      v18 = v4;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v5);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v6));
        v20 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v7);
              v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%016llx"), objc_msgSend(v11, "uniqueIdentifier")));
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_binaryTypes, "setObject:forKeyedSubscript:", v6, v12);
              binaries = self->_binaries;
              if (binaries)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](binaries, "objectForKeyedSubscript:", v12));
                v15 = v14 == 0;

                if (v15)
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "binary"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_binaries, "setObject:forKeyedSubscript:", v16, v12);

                }
              }

            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v8);
        }

        v5 = v20 + 1;
      }
      while ((id)(v20 + 1) != v18);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }

}

- (void)addBinaryMapping:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forIndex:(unsigned int)a6
{
  unsigned int v7;
  const CATransform3D **v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  NSMutableArray *mappings;
  void *v15;
  const CATransform3D **v16;
  void *v17;
  unint64_t drawCallIndex;
  id v19;
  _UNKNOWN **v20;
  ProgramAddressTableCollector *v21;
  void *v22;
  _BOOL4 v23;
  _UNKNOWN **v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  _QWORD v35[9];
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  _UNKNOWN **v44;

  v34 = a3;
  v7 = 0;
  v8 = &CATransform3DIdentity_ptr;
  while (1)
  {
    v9 = v7;
    if ((unint64_t)objc_msgSend(v34, "count") <= v7)
      break;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%016llx"), objc_msgSend(v10, "binaryUniqueId")));
    if (v11)
    {
      v32 = v10;
      v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_binaryTypes, "objectForKeyedSubscript:", v11));
      v13 = CFSTR("unknown");
      if (v12)
        v13 = (const __CFString *)v12;
      v33 = (__CFString *)v13;
      mappings = self->_mappings;
      v35[0] = CFSTR("mappedAddress");
      v36 = objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedLongLong:]((id)v8[288], "numberWithUnsignedLongLong:", objc_msgSend(v10, "mappedAddress")));
      v35[1] = CFSTR("mappedSize");
      v31 = (void *)v36;
      v37 = objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedLongLong:]((id)v8[288], "numberWithUnsignedLongLong:", objc_msgSend(v10, "mappedSize")));
      v38 = v11;
      v35[2] = CFSTR("binaryUniqueId");
      v35[3] = CFSTR("type");
      v39 = v33;
      v35[4] = CFSTR("encID");
      v30 = (void *)v37;
      v40 = objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[288], "numberWithUnsignedInt:", a4));
      v35[5] = CFSTR("encIndex");
      v29 = (void *)v40;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[288], "numberWithUnsignedInt:", a5));
      v41 = v28;
      v35[6] = CFSTR("index");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[288], "numberWithUnsignedInt:", a6));
      v42 = v15;
      v35[7] = CFSTR("drawCallIndex");
      v16 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[288], "numberWithUnsignedInt:", self->_drawCallIndex));
      v43 = v17;
      v35[8] = CFSTR("drawFunctionIndex");
      drawCallIndex = self->_drawCallIndex;
      v19 = -[NSMutableArray count](self->_functionIndices, "count");
      v20 = &off_739B68;
      if ((unint64_t)v19 > drawCallIndex)
      {
        v27 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_functionIndices, "objectAtIndexedSubscript:", self->_drawCallIndex));
        v20 = v27;
      }
      v21 = self;
      v44 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, v35, 9));
      -[NSMutableArray addObject:](mappings, "addObject:", v22);
      v23 = (unint64_t)v19 > drawCallIndex;

      self = v21;
      v8 = v16;
      v10 = v32;
      if (v23)

    }
    v7 = v9 + 1;
  }

}

- (void)addProgramAddressTable:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v16 = a3;
  if (v16 && (dword_75313C & 0x200) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encoderInternalBinaries"));
    -[ProgramAddressTableCollector addBinaries:](self, "addBinaries:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "binaryMappingsEncoderInternal"));
    -[ProgramAddressTableCollector addBinaryMapping:forEncoder:atEncoderIndex:forIndex:](self, "addBinaryMapping:forEncoder:atEncoderIndex:forIndex:", v9, v6, v5, 0xFFFFFFFFLL);

    v10 = 0;
    v11 = v6 << 32;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "binaryMappingsPerInvocation"));
      v13 = objc_msgSend(v12, "count");

      if ((unint64_t)v13 <= v10)
        break;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "binaryMappingsPerInvocation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v10));

      if (objc_msgSend(v15, "count"))
      {
        if (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(&self->_addresses.__table_.__bucket_list_.__ptr_.__value_, v11 | v10))
        {
          -[ProgramAddressTableCollector addBinaryMapping:forEncoder:atEncoderIndex:forIndex:](self, "addBinaryMapping:forEncoder:atEncoderIndex:forIndex:", v15, v6, v5, v10);
          ++self->_drawCallIndex;
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&self->_addresses, v11 | v10, v11 | v10);
        }
      }

      ++v10;
    }
  }

}

- (void)addSampledCallFunctionIndex:(unint64_t)a3
{
  NSMutableArray *functionIndices;
  id v4;

  functionIndices = self->_functionIndices;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableArray addObject:](functionIndices, "addObject:");

}

- (void)addSampledCallFunctionIndex:(unint64_t)a3 forIndex:(unsigned int)a4 forEncoder:(unsigned int)a5 atEncoderIndex:(unsigned int)a6 forType:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  NSMutableArray *functionIndices;
  void *v14;
  NSMutableArray *mappings;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[9];

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v12 = a7;
  functionIndices = self->_functionIndices;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableArray addObject:](functionIndices, "addObject:", v14);

  mappings = self->_mappings;
  v22[0] = CFSTR("mappedAddress");
  v22[1] = CFSTR("mappedSize");
  v23[0] = &off_739B80;
  v23[1] = &off_739B80;
  v22[2] = CFSTR("binaryUniqueId");
  v22[3] = CFSTR("type");
  v23[2] = CFSTR("0");
  v23[3] = v12;
  v22[4] = CFSTR("encID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
  v23[4] = v16;
  v22[5] = CFSTR("encIndex");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  v23[5] = v17;
  v22[6] = CFSTR("index");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
  v23[6] = v18;
  v22[7] = CFSTR("drawCallIndex");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drawCallIndex));
  v23[7] = v19;
  v22[8] = CFSTR("drawFunctionIndex");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_functionIndices, "objectAtIndexedSubscript:", self->_drawCallIndex));
  v23[8] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 9));
  -[NSMutableArray addObject:](mappings, "addObject:", v21);

  ++self->_drawCallIndex;
}

- (void)addOtherEncoderFunctionIndex:(unint64_t)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forType:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  NSMutableArray *mappings;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[7];

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v14[0] = CFSTR("mappedAddress");
  v14[1] = CFSTR("mappedSize");
  mappings = self->_mappings;
  v14[2] = CFSTR("binaryUniqueId");
  v14[3] = CFSTR("index");
  v15[0] = &off_739B80;
  v15[1] = &off_739B80;
  v15[2] = CFSTR("0");
  v15[3] = &off_739B80;
  v15[4] = v9;
  v14[4] = CFSTR("type");
  v14[5] = CFSTR("encID");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  v15[5] = v11;
  v14[6] = CFSTR("encIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v15[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 7));
  -[NSMutableArray addObject:](mappings, "addObject:", v13);

}

- (id)mappings
{
  if ((dword_75313C & 0x200) != 0)
    return -[NSMutableArray copy](self->_mappings, "copy");
  else
    return &__NSArray0__struct;
}

- (id)binaries
{
  if ((dword_75313C & 0x200) != 0)
    return -[NSMutableDictionary copy](self->_binaries, "copy");
  else
    return &__NSDictionary0__struct;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_addresses);
  objc_storeStrong((id *)&self->_functionIndices, 0);
  objc_storeStrong((id *)&self->_binaries, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
  objc_storeStrong((id *)&self->_binaryTypes, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end

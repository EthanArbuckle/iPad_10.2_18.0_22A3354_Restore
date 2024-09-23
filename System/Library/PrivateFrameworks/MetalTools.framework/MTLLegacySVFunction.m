@implementation MTLLegacySVFunction

- (MTLLegacySVFunction)initWithFunction:(id)a3 library:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVFunction;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (void)_initImageData
{
  unint64_t *v2;
  MTLLegacySVImageData *v3;

  v2 = (unint64_t *)((char *)self + 48);
  if (!*((_QWORD *)self + 6))
  {
    v3 = -[MTLLegacySVImageData initWithFunction:]([MTLLegacySVImageData alloc], "initWithFunction:", self);
    while (!__ldaxr(v2))
    {
      if (!__stlxr((unint64_t)v3, v2))
        return;
    }
    __clrex();

  }
}

- (void)prepareForBinaryFunctionUsage
{
  -[MTLLegacySVFunction _initImageData](self, "_initImageData");
  objc_msgSend(*((id *)self + 6), "setConstantData:", objc_msgSend((id)objc_msgSend(*((id *)self + 2), "debugInstrumentationData"), "globalConstantsData"));
}

+ (id)convertUserType:(id)a3
{
  uint64_t v4;
  id result;

  v4 = objc_msgSend(a3, "dataType");
  result = 0;
  if (v4 > 116)
  {
    if ((unint64_t)(v4 - 117) >= 2)
      return a3;
  }
  else
  {
    switch(v4)
    {
      case 1:
        return +[MTLLegacySVFunction internalStructTypeFromUserStructType:](MTLLegacySVFunction, "internalStructTypeFromUserStructType:", a3);
      case 2:
        return +[MTLLegacySVFunction internalArrayTypeFromUserArrayType:](MTLLegacySVFunction, "internalArrayTypeFromUserArrayType:", a3);
      case 60:
        break;
      default:
        return a3;
    }
  }
  return result;
}

+ (id)internalArrayTypeFromUserArrayType:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  MTLDataType v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = objc_msgSend(a3, "elementType");
  if (v4 <= 116)
  {
    switch(v4)
    {
      case 1:
        v9 = objc_msgSend(v3, "elementStructType");
        break;
      case 2:
        v9 = objc_msgSend(v3, "elementArrayType");
        break;
      case 60:
        goto LABEL_7;
      default:
        return v3;
    }
    v8 = (id)v9;
    goto LABEL_12;
  }
  if ((unint64_t)(v4 - 117) < 2)
  {
LABEL_7:
    v5 = objc_msgSend(v3, "stride");
    v6 = objc_msgSend(v3, "arrayLength");
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD4D0]), "initWithArrayLength:elementType:stride:pixelFormat:aluType:details:", v6, 57, v5, 0, 0, getIndirectConstant(v6));
    if (v7)
    {
LABEL_14:
      objc_msgSend(v7, "setIndirectArgumentIndexStride:", objc_msgSend(v3, "indirectArgumentIndexStride"));
      return v7;
    }
    v8 = 0;
LABEL_12:
    v10 = +[MTLLegacySVFunction convertUserType:](MTLLegacySVFunction, "convertUserType:", v8);
    v7 = v3;
    if (v10 != v8)
    {
      v11 = v10;
      v12 = objc_msgSend(v3, "elementType");
      v13 = objc_msgSend(v3, "stride");
      v14 = objc_msgSend(v3, "arrayLength");
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD4D0]), "initWithArrayLength:elementType:stride:pixelFormat:aluType:details:", v14, v12, v13, 0, 0, v11);
    }
    goto LABEL_14;
  }
  return v3;
}

+ (id)internalStructTypeFromUserStructType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id StructMember;
  NSString *v13;
  uint64_t v14;
  MTLDataType v15;
  objc_object *IndirectConstant;
  MTLDataType v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p;
  void *v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDDD730]);
  v5 = (void *)MEMORY[0x22E309364]();
  __p = 0;
  v28 = 0;
  v29 = 0;
  std::vector<objc_object  {objcproto9MTLBuffer}*>::resize((uint64_t)&__p, objc_msgSend((id)objc_msgSend(a3, "members"), "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_msgSend(a3, "members");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v7)
  {
    v21 = v5;
    v22 = v4;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    while (1)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        StructMember = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if (objc_msgSend(StructMember, "dataType", v21, v22) == 60
          || objc_msgSend(StructMember, "dataType") == 118
          || objc_msgSend(StructMember, "dataType") == 117)
        {
          v13 = (NSString *)objc_msgSend(StructMember, "name");
          v14 = objc_msgSend(StructMember, "offset");
          v15 = objc_msgSend(StructMember, "argumentIndex");
          IndirectConstant = (objc_object *)getIndirectConstant(v15);
          v17 = MTLDataTypeBool4|MTLDataTypeStruct;
LABEL_10:
          StructMember = getStructMember(v13, v14, v17, v15, IndirectConstant);
          goto LABEL_11;
        }
        if (objc_msgSend(StructMember, "dataType") == 1)
        {
          v13 = (NSString *)objc_msgSend(StructMember, "name");
          v14 = objc_msgSend(StructMember, "offset");
          v15 = objc_msgSend(StructMember, "argumentIndex");
          IndirectConstant = +[MTLLegacySVFunction convertUserType:](MTLLegacySVFunction, "convertUserType:", objc_msgSend(StructMember, "structType"));
          v17 = MTLDataTypeStruct;
          goto LABEL_10;
        }
        if (objc_msgSend(StructMember, "dataType") == 2)
        {
          v13 = (NSString *)objc_msgSend(StructMember, "name");
          v14 = objc_msgSend(StructMember, "offset");
          v15 = objc_msgSend(StructMember, "argumentIndex");
          IndirectConstant = +[MTLLegacySVFunction convertUserType:](MTLLegacySVFunction, "convertUserType:", objc_msgSend(StructMember, "arrayType"));
          v17 = MTLDataTypeArray;
          goto LABEL_10;
        }
LABEL_11:
        *((_QWORD *)__p + (v11 + v10++)) = StructMember;
      }
      while (v7 != v10);
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      v7 = v18;
      v8 = v11 + v10;
      if (!v18)
      {
        v19 = (v11 + v10);
        v5 = v21;
        v4 = v22;
        goto LABEL_20;
      }
    }
  }
  v19 = 0;
LABEL_20:
  objc_msgSend(v4, "setMembers:count:", __p, v19);
  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  objc_autoreleasePoolPop(v5);
  return v4;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5 binaryArchives:(id)a6
{
  _BYTE *v11;
  uint64_t *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  MTLLegacySVArgumentEncoder *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  MTLStructType *v25;
  MTLLegacySVDevice *v26;
  LegacySVArgumentEncoderLayout *v27;
  _QWORD *v28;
  id *v29;
  void *v30;
  void *context;
  void *v33;
  LegacySVArgumentEncoderLayout *v34;
  unsigned int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  objc_super v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v11 = (_BYTE *)*((_QWORD *)self + 3);
  if ((v11[286] & 0x80) != 0)
  {
    v33 = (void *)objc_msgSend(v11, "baseObject");
    std::mutex::lock((std::mutex *)((char *)self + 56));
    LODWORD(v34) = a3;
    v13 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>>>::find<unsigned int>((_QWORD *)self + 15, (unsigned int *)&v34);
    if (v13 && (v14 = (_QWORD *)v13[3]) != 0)
    {
      if (a5)
      {
        if (!a4)
          goto LABEL_46;
        v15 = (void *)objc_msgSend(*((id *)self + 2), "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:", a3, a4, a5);
      }
      else if (a6)
      {
        if (!a4)
          goto LABEL_46;
        v15 = (void *)objc_msgSend(*((id *)self + 2), "newArgumentEncoderWithBufferIndex:reflection:binaryArchives:", a3, a4, a6);
      }
      else
      {
        if (!a4)
          goto LABEL_46;
        v15 = (void *)objc_msgSend(*((id *)self + 2), "newArgumentEncoderWithBufferIndex:reflection:", a3, a4);
      }

    }
    else
    {
      if (a5)
      {
        if (a4)

        v16 = objc_msgSend(*((id *)self + 2), "reflectionWithOptions:pipelineLibrary:", 3, a5);
      }
      else if (a6)
      {
        if (a4)

        v16 = objc_msgSend(*((id *)self + 2), "reflectionWithOptions:binaryArchives:", 3, a6);
      }
      else
      {
        if (a4)

        v16 = objc_msgSend(*((id *)self + 2), "reflectionWithOptions:", 3);
      }
      v18 = (void *)v16;
      if (!v16)
      {
        std::mutex::unlock((std::mutex *)((char *)self + 56));
        return 0;
      }
      context = (void *)MEMORY[0x22E309364]();
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = (void *)objc_msgSend(v18, "arguments");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v37 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (!objc_msgSend(v23, "type") && objc_msgSend(v23, "index") == a3)
            {
              v25 = (MTLStructType *)objc_msgSend(v23, "bufferStructType");
              v35 = a3;
              v26 = (MTLLegacySVDevice *)*((_QWORD *)self + 3);
              v27 = (LegacySVArgumentEncoderLayout *)operator new();
              LegacySVArgumentEncoderLayout::LegacySVArgumentEncoderLayout(v27, v25, v26);
              v34 = v27;
              v28 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>>>::__emplace_unique_key_args<unsigned int,unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>((uint64_t)self + 120, &v35, &v35, (uint64_t *)&v34);
              v29 = (id *)v34;
              v34 = 0;
              v24 = context;
              if (v29)
              {
                LegacySVArgumentEncoderLayout::~LegacySVArgumentEncoderLayout(v29);
                MEMORY[0x22E309118]();
              }
              v14 = (_QWORD *)v28[3];
              goto LABEL_42;
            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
          if (v20)
            continue;
          break;
        }
      }
      v14 = 0;
      v24 = context;
LABEL_42:
      objc_autoreleasePoolPop(v24);
    }
LABEL_46:
    std::mutex::unlock((std::mutex *)((char *)self + 56));
    if (v14)
    {
      v30 = (void *)objc_msgSend(v33, "newArgumentEncoderWithLayout:", *v14);
      v17 = -[MTLLegacySVArgumentEncoder initWithArgumentEncoder:layout:device:]([MTLLegacySVArgumentEncoder alloc], "initWithArgumentEncoder:layout:device:", v30, v14, -[MTLToolsObject device](self, "device"));

      return v17;
    }
    return 0;
  }
  if (a5)
  {
    v42.receiver = self;
    v42.super_class = (Class)MTLLegacySVFunction;
    return -[MTLToolsFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:](&v42, sel_newArgumentEncoderWithBufferIndex_reflection_pipelineLibrary_, a3, a4, a5);
  }
  else if (a6)
  {
    v41.receiver = self;
    v41.super_class = (Class)MTLLegacySVFunction;
    return -[MTLToolsFunction newArgumentEncoderWithBufferIndex:reflection:binaryArchives:](&v41, sel_newArgumentEncoderWithBufferIndex_reflection_binaryArchives_, a3, a4, a6);
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)MTLLegacySVFunction;
    return -[MTLToolsFunction newArgumentEncoderWithBufferIndex:reflection:](&v40, sel_newArgumentEncoderWithBufferIndex_reflection_, a3, a4);
  }
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  return -[MTLLegacySVFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:", a3, 0, 0, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  return -[MTLLegacySVFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:", a3, a4, 0, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return -[MTLLegacySVFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:", a3, 0, a4, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  return -[MTLLegacySVFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:", a3, a4, a5, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  return -[MTLLegacySVFunction newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:](self, "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:binaryArchives:", a3, a4, 0, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVFunction;
  -[MTLToolsFunction dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>>>::~__hash_table((uint64_t)self + 120);
  std::mutex::~mutex((std::mutex *)((char *)self + 56));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 850045863;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_QWORD *)self + 14) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_DWORD *)self + 38) = 1065353216;
  return self;
}

@end

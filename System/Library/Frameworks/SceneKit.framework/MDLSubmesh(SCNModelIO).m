@implementation MDLSubmesh(SCNModelIO)

+ (id)submeshWithSCNGeometryElement:()SCNModelIO
{
  return (id)objc_msgSend(a1, "newSubmeshWithSCNGeometryElement:bufferAllocator:", a3, 0);
}

+ (id)submeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:
{
  return (id)objc_msgSend(a1, "newSubmeshWithSCNGeometryElement:bufferAllocator:");
}

+ (id)submeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:positionSourceChannel:
{
  return (id)objc_msgSend(a1, "newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:");
}

+ (id)submeshWithUniquedIndexData:()SCNModelIO andSCNGeometryElement:bufferAllocator:
{
  return (id)objc_msgSend(a1, "newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:");
}

+ (uint64_t)newSubmeshWithGeometryData:()SCNModelIO indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:
{
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;

  v20 = a12;
  v21 = objc_msgSend(a3, "bytes");
  if (a6 >= 2 && a5)
  {
    v22 = v21;
    v23 = a8 * a6;
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4 / a6);
    v25 = objc_msgSend(v24, "mutableBytes");
    if (a8 * a6 <= a4)
    {
      v26 = 0;
      v27 = a4 / v23;
      if (a4 / v23 <= 1)
        v27 = 1;
      do
      {
        switch(a8)
        {
          case 1uLL:
            *(_BYTE *)(v25 + v26) = *(_BYTE *)(v22 + a7);
            break;
          case 2uLL:
            *(_WORD *)(v25 + 2 * v26) = *(_WORD *)(v22 + 2 * a7);
            break;
          case 4uLL:
            *(_DWORD *)(v25 + 4 * v26) = *(_DWORD *)(v22 + 4 * a7);
            break;
          case 8uLL:
            *(_QWORD *)(v25 + 8 * v26) = *(_QWORD *)(v22 + 8 * a7);
            break;
          default:
            break;
        }
        ++v26;
        a7 += a6;
      }
      while (v27 != v26);
    }
    v28 = a11;
    v29 = (uint64_t)v24;
  }
  else
  {
    v29 = objc_msgSend(a3, "subdataWithRange:", objc_msgSend(a3, "length") / a6 * a7);
    v28 = a11;
  }
  v30 = (void *)objc_msgSend(v28, "newBufferWithData:type:", v29, 2);
  v31 = [a1 alloc];
  if (!a12)
    v20 = objc_msgSend(v30, "length") / a8;
  v32 = objc_msgSend(v31, "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_1EA5A6480, v30, v20, a9, a10, 0, a13);

  return v32;
}

+ (uint64_t)newSubmeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:
{
  return objc_msgSend(a1, "newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:", a3, a4, 0);
}

+ (uint64_t)newSubmeshWithUniquedIndexData:()SCNModelIO andSCNGeometryElement:bufferAllocator:
{
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = objc_msgSend(a4, "bytesPerIndex");
  v10 = objc_msgSend(a4, "primitiveCount");
  if (+[MDLSubmesh(SCNModelIO) newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:]::onceToken != -1)
    dispatch_once(&+[MDLSubmesh(SCNModelIO) newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:]::onceToken, &__block_literal_global_75);
  if (a5)
    v11 = a5;
  else
    v11 = (void *)+[MDLSubmesh(SCNModelIO) newSubmeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:]::defaultAllocator;
  v12 = (void *)objc_msgSend(v11, "newBufferWithData:type:", a3, 2);
  v13 = objc_msgSend(a4, "bytesPerIndex");
  v14 = 32;
  if (v13 == 2)
    v14 = 16;
  if (v13 == 1)
    v15 = 8;
  else
    v15 = v14;
  if (objc_msgSend(a4, "primitiveType") == 1)
  {
    v16 = objc_msgSend([a1 alloc], "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_1EA5A6480, v12, objc_msgSend(a4, "primitiveCount") + 2, v15, 3, 0, 0);
LABEL_28:
    v24 = v16;
    goto LABEL_29;
  }
  if (objc_msgSend(a4, "primitiveType") != 4)
  {
    v25 = objc_msgSend(a4, "primitiveType");
    if (v25 > 3)
    {
      v27 = 0;
      v26 = 1;
    }
    else
    {
      v26 = qword_1DD007828[v25];
      v27 = qword_1DD007848[v25];
    }
    v16 = objc_msgSend([a1 alloc], "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_1EA5A6480, v12, objc_msgSend(a4, "primitiveCount") * v26, v15, v27, 0, 0);
    goto LABEL_28;
  }
  v17 = objc_msgSend((id)objc_msgSend(a4, "data"), "bytes");
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v10);
  v19 = objc_msgSend(v18, "mutableBytes");
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      switch(v9)
      {
        case 1uLL:
          LOBYTE(v21) = *(_BYTE *)(v17 + i);
          goto LABEL_21;
        case 2uLL:
          LOWORD(v21) = *(_WORD *)(v17 + 2 * i);
          goto LABEL_21;
        case 4uLL:
          LODWORD(v21) = *(_DWORD *)(v17 + 4 * i);
          goto LABEL_21;
        case 8uLL:
          v21 = *(_QWORD *)(v17 + 8 * i);
LABEL_21:
          *(_BYTE *)(v19 + i) = v21;
          break;
        default:
          continue;
      }
    }
  }
  v22 = objc_alloc_init(MEMORY[0x1E0CC7800]);
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC77C0]), "initWithType:data:", 2, v18);
  objc_msgSend(v22, "setFaceCount:", v10);
  objc_msgSend(v22, "setFaceTopology:", v23);
  v24 = objc_msgSend([a1 alloc], "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", &stru_1EA5A6480, v12, objc_msgSend(v12, "length") / v9, v15, 5, 0, v22);

  v12 = (void *)v23;
LABEL_29:

  return v24;
}

+ (uint64_t)newSubmeshWithSCNGeometryElement:()SCNModelIO bufferAllocator:positionSourceChannel:
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;

  v32 = objc_msgSend(a3, "hasInterleavedIndicesChannels");
  v31 = objc_msgSend(a3, "indicesChannelCount");
  v9 = objc_msgSend(a3, "bytesPerIndex");
  v10 = objc_msgSend(a3, "primitiveCount");
  v11 = objc_msgSend((id)objc_msgSend(a3, "data"), "length");
  if ((v12 & 1) == 0
  {
    +[MDLSubmesh(SCNModelIO) newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:]::defaultAllocator = objc_opt_new();
  }
  if (a4)
    v13 = a4;
  else
    v13 = +[MDLSubmesh(SCNModelIO) newSubmeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:]::defaultAllocator;
  v14 = objc_msgSend(a3, "bytesPerIndex");
  v15 = 32;
  if (v14 == 2)
    v15 = 16;
  if (v14 == 1)
    v16 = 8;
  else
    v16 = v15;
  if (objc_msgSend(a3, "primitiveType") == 1)
    return objc_msgSend(a1, "newSubmeshWithGeometryData:indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:", objc_msgSend(a3, "data"), v11, v32, v31, a5, v9, v16, 3, v13, objc_msgSend(a3, "primitiveCount") + 2, 0);
  if (objc_msgSend(a3, "primitiveType") == 4)
  {
    v30 = a5;
    v18 = objc_msgSend((id)objc_msgSend(a3, "data"), "bytes");
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v10);
    v20 = objc_msgSend(v19, "mutableBytes");
    if (v10 >= 1)
    {
      for (i = 0; i != v10; ++i)
      {
        switch(v9)
        {
          case 1:
            LOBYTE(v22) = *(_BYTE *)(v18 + i);
            goto LABEL_20;
          case 2:
            LOWORD(v22) = *(_WORD *)(v18 + 2 * i);
            goto LABEL_20;
          case 4:
            LODWORD(v22) = *(_DWORD *)(v18 + 4 * i);
            goto LABEL_20;
          case 8:
            v22 = *(_QWORD *)(v18 + 8 * i);
LABEL_20:
            *(_BYTE *)(v20 + i) = v22;
            break;
          default:
            continue;
        }
      }
    }
    v23 = objc_msgSend((id)objc_msgSend(a3, "data"), "subdataWithRange:", v10 * v9, objc_msgSend((id)objc_msgSend(a3, "data"), "length") - v10 * v9);
    v24 = objc_alloc_init(MEMORY[0x1E0CC7800]);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC77C0]), "initWithType:data:", 2, v19);
    objc_msgSend(v24, "setFaceCount:", v10);
    objc_msgSend(v24, "setFaceTopology:", v25);
    v26 = objc_msgSend(a1, "newSubmeshWithGeometryData:indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:", v23, v11, v32, v31, v30, v9, v16, 5, v13, 0, v24);

    return v26;
  }
  else
  {
    v27 = objc_msgSend(a3, "primitiveType");
    if (v27 > 3)
    {
      v29 = 0;
      v28 = 1;
    }
    else
    {
      v28 = qword_1DD007828[v27];
      v29 = qword_1DD007848[v27];
    }
    return objc_msgSend(a1, "newSubmeshWithGeometryData:indexBufferLength:interleaved:channelCount:channelIdx:bytesPerIndex:indexType:geometryType:allocator:indexCount:topology:", objc_msgSend(a3, "data"), v11, v32, v31, a5, v9, v16, v29, v13, objc_msgSend(a3, "primitiveCount") * v28, 0);
  }
}

@end
